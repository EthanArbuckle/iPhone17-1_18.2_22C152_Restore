@interface FCCurrentIssuesPromiseChainingData
@end

@implementation FCCurrentIssuesPromiseChainingData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialResult, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTagIDs, 0);
  objc_storeStrong((id *)&self->_followedChannelIDs, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDs, 0);
  objc_storeStrong((id *)&self->_resultingIssues, 0);
}

@end