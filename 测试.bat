func FuzzSum(f *testing.F) {
  rand.Seed(time.Now().UnixNano())

  f.Add(10)
  f.Fuzz(func(t *testing.T, n int) {
    n %= 20
    var vals []int64
    var expect int64
    var buf strings.Builder
    buf.WriteString("\n")
    for i := 0; i < n; i++ {
      val := rand.Int63() % 1e6
      vals = append(vals, val)
      expect += val
      buf.WriteString(fmt.Sprintf("%d,\n", val))
    }

    assert.Equal(t, expect, Sum(vals), buf.String())
  })
}