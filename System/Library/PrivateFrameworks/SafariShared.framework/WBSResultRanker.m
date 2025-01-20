@interface WBSResultRanker
+ (WBSTrialSearchParameters)searchParameters;
+ (void)setSearchParameters:(id)a3;
@end

@implementation WBSResultRanker

+ (WBSTrialSearchParameters)searchParameters
{
  return (WBSTrialSearchParameters *)(id)_searchParameters;
}

+ (void)setSearchParameters:(id)a3
{
}

@end