@interface FCReadingHistorySyncResults
@end

@implementation FCReadingHistorySyncResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newlyCreatedArticleIDs, 0);
  objc_storeStrong((id *)&self->_deletedArticleIDs, 0);
  objc_storeStrong((id *)&self->_modifiedArticleIDs, 0);
}

@end