test_that("All quartets are generated", {
  expect_equal(combn(8, 4), all_quartets(8))
})

test_that("which_index() catches errors", {
  expect_error(which_index(1:10, 1), "4 indices needed")
  expect_error(which_index(1:4, 1000), "Too many tips for which_index()")
  expect_error(which_index(1:4, 1e7), "Too many tips for which_index()")
  expect_error(which_index(c(-4, 3, 2, 1), 4), "indices\\[0\\] must be positive")
  expect_error(which_index(c(4, 3, 2, 5), 4), "indices\\[3\\] must be less than m")
  expect_error(which_index(c(4, 4, 4, 4), 10), "a < b < c < d not satisfied")
})

test_that("Quartets are correctly indexed", {
  expect_equal(seq_len(15) - 1L, apply(all_quartets(6) - 1L, 2, which_index, 6))
  expect_equal(AllQuartets(6), AllQuartets(BalancedTree(6)))
})
