context("test quanteda functions")

test_that("quanteda functions work", {
    skip_on_cran()
    skip_on_appveyor()
    skip_if_not_installed("quanteda")
    
    spacy_initialize()
    
    txt <- c(doc1 = "And now, now, now for something completely different.",
             doc2 = "Jack and Jill are children.")
    parsed <- spacy_parse(txt)
    
    expect_equal(
        ntype(parsed),
        c(doc1 = 8, doc2 = 6)
    )
    
    expect_equal(
        ntoken(parsed),
        c(doc1 = 11, doc2 = 6)
    )
    
    expect_equal(
        ntype(parsed),
        c(doc1 = 8, doc2 = 6)
    )
    
    expect_equal(
        ndoc(parsed),
        2
    )
    
    expect_equal(
        docnames(parsed),
        c("doc1", "doc2")
    )

    spacy_finalize()
})