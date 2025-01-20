@interface PXContentSyndicationEmptyDataSource
- (id)mostRecentlyAddedDate;
- (int64_t)numberOfSections;
@end

@implementation PXContentSyndicationEmptyDataSource

- (id)mostRecentlyAddedDate
{
  return 0;
}

- (int64_t)numberOfSections
{
  return 0;
}

@end