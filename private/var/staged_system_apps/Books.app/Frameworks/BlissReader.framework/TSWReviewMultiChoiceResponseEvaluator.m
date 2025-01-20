@interface TSWReviewMultiChoiceResponseEvaluator
- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5;
@end

@implementation TSWReviewMultiChoiceResponseEvaluator

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
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    v22 = (char *)a5 + 16;
    uint64_t v23 = 0;
    do
    {
      unsigned int v16 = objc_msgSend(objc_msgSend(v10, "selectedChoices", v22), "containsIndex:", v13);
      [(TSWReviewResponseEvaluatorDataSource *)v8 fractionForChoiceIndex:v13];
      if (v16 && v17 > 0.0)
      {
        if (a3) {
          (*((void (**)(id, uint64_t))a3 + 2))(a3, v13);
        }
        ++v15;
      }
      else if (v16)
      {
        if (a4) {
          (*((void (**)(id, uint64_t))a4 + 2))(a4, v13);
        }
        ++v14;
      }
      else if (v17 > 0.0)
      {
        if (a5) {
          (*((void (**)(void))a5 + 2))();
        }
        ++v23;
      }
      ++v13;
    }
    while (v12 != v13);
    if (v15 < 1)
    {
      uint64_t v18 = v23;
    }
    else
    {
      uint64_t v18 = v23;
      if (!v14 && !v23)
      {
        v19 = +[NSDecimalNumber one];
        uint64_t v14 = 0;
        goto LABEL_23;
      }
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  v19 = +[NSDecimalNumber zero];
LABEL_23:
  v20 = [[TSWReviewResponseEvaluationSummary alloc] initWithScore:v19 correctCount:v15 incorrectCount:v14 missingCount:v18];

  return v20;
}

@end