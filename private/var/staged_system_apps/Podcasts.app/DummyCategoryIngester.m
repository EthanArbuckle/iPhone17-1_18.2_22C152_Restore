@interface DummyCategoryIngester
- (id)unsafeIngestCategoryWithCategory:(id)a3 feedCategory:(id)a4 ctx:(id)a5;
- (id)unsafeIngestFeedCategory:(id)a3 ctx:(id)a4;
- (id)unsafeIngestNewCategoryWithCtx:(id)a3 feedCategory:(id)a4;
@end

@implementation DummyCategoryIngester

- (id)unsafeIngestCategoryWithCategory:(id)a3 feedCategory:(id)a4 ctx:(id)a5
{
  return 0;
}

- (id)unsafeIngestNewCategoryWithCtx:(id)a3 feedCategory:(id)a4
{
  return 0;
}

- (id)unsafeIngestFeedCategory:(id)a3 ctx:(id)a4
{
  return 0;
}

@end