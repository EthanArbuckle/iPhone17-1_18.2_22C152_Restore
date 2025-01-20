@interface FCArticleSearchOperationResult
- (FCArticleSearchOperationFeedbackResult)feedBack;
- (FCArticleStreamingResults)articles;
- (void)setArticles:(id)a3;
- (void)setFeedBack:(id)a3;
@end

@implementation FCArticleSearchOperationResult

- (FCArticleStreamingResults)articles
{
  return self->_articles;
}

- (void)setArticles:(id)a3
{
}

- (FCArticleSearchOperationFeedbackResult)feedBack
{
  return self->_feedBack;
}

- (void)setFeedBack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedBack, 0);
  objc_storeStrong((id *)&self->_articles, 0);
}

@end