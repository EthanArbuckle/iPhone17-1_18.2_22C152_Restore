@interface TSWReviewOrderedResponseEvaluator
- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5;
@end

@implementation TSWReviewOrderedResponseEvaluator

- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5
{
  v8 = [(TSWReviewResponseEvaluator *)self dataSource];
  v9 = [(TSWReviewResponseEvaluatorDataSource *)v8 response];
  objc_opt_class();
  [(TSWReviewResponse *)v9 answerState];
  v10 = (void *)TSUDynamicCast();
  unint64_t v11 = [(TSWReviewResponseEvaluatorDataSource *)v8 choiceCount];
  if (v11)
  {
    unint64_t v12 = v11;
    v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    do
    {
      v17 = (char *)[v10 targetForPlacard:v13];
      if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL || v13 != v17)
      {
        if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          if (a5) {
            (*((void (**)(id, uint64_t))a5 + 2))(a5, 0x7FFFFFFFFFFFFFFFLL);
          }
          ++v14;
        }
        else
        {
          if (a4) {
            (*((void (**)(id, char *))a4 + 2))(a4, v17);
          }
          ++v15;
        }
      }
      else
      {
        if (a3) {
          (*((void (**)(id, char *))a3 + 2))(a3, v13);
        }
        ++v16;
      }
      ++v13;
    }
    while ((char *)v12 != v13);
    if (v16 >= 1 && !v15 && !v14)
    {
      v18 = +[NSDecimalNumber one];
      uint64_t v15 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  v18 = +[NSDecimalNumber zero];
LABEL_22:
  v19 = [[TSWReviewResponseEvaluationSummary alloc] initWithScore:v18 correctCount:v16 incorrectCount:v15 missingCount:v14];

  return v19;
}

@end