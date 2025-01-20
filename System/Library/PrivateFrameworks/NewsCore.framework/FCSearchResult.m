@interface FCSearchResult
- (FCArticleSearchOperationResult)articleSearchResult;
- (FCTagSearchOperationResult)tagSearchResult;
- (void)setArticleSearchResult:(id)a3;
- (void)setTagSearchResult:(id)a3;
@end

@implementation FCSearchResult

- (FCTagSearchOperationResult)tagSearchResult
{
  return self->_tagSearchResult;
}

- (void)setTagSearchResult:(id)a3
{
}

- (FCArticleSearchOperationResult)articleSearchResult
{
  return self->_articleSearchResult;
}

- (void)setArticleSearchResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleSearchResult, 0);
  objc_storeStrong((id *)&self->_tagSearchResult, 0);
}

@end