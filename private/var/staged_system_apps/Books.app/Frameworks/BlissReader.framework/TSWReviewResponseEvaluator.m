@interface TSWReviewResponseEvaluator
+ (id)evaluate:(id)a3 blockIfCorrect:(id)a4 blockIfIncorrect:(id)a5 blockIfMissing:(id)a6;
- (TSWReviewResponseEvaluatorDataSource)dataSource;
- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5;
- (void)dealloc;
- (void)setDataSource:(id)a3;
@end

@implementation TSWReviewResponseEvaluator

+ (id)evaluate:(id)a3 blockIfCorrect:(id)a4 blockIfIncorrect:(id)a5 blockIfMissing:(id)a6
{
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setDataSource:a3];
  id v11 = [v10 evaluateBlockIfCorrect:a4 blockIfIncorrect:a5 blockIfMissing:a6];

  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWReviewResponseEvaluator;
  [(TSWReviewResponseEvaluator *)&v3 dealloc];
}

- (id)evaluateBlockIfCorrect:(id)a3 blockIfIncorrect:(id)a4 blockIfMissing:(id)a5
{
  [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:+[NSString stringWithUTF8String:@"-[TSWReviewResponseEvaluator evaluateBlockIfCorrect:blockIfIncorrect:blockIfMissing:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/TSWReviewResponseEvaluator.m"] lineNumber:127 description:@"Please return an evaluator class from -evaluatorClass"];
  return 0;
}

- (TSWReviewResponseEvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

@end