@interface FCArticleSearchOperationFeedbackResult
- (FCArticleSearchOperationFeedbackResult)initWithSearchOperationRankingFeedBack:(id)a3;
- (SFRankingFeedback)resultRankingFeedback;
@end

@implementation FCArticleSearchOperationFeedbackResult

- (FCArticleSearchOperationFeedbackResult)initWithSearchOperationRankingFeedBack:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCArticleSearchOperationFeedbackResult;
  v5 = [(FCArticleSearchOperationFeedbackResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    resultRankingFeedback = v5->_resultRankingFeedback;
    v5->_resultRankingFeedback = (SFRankingFeedback *)v6;
  }
  return v5;
}

- (SFRankingFeedback)resultRankingFeedback
{
  return self->_resultRankingFeedback;
}

- (void).cxx_destruct
{
}

@end