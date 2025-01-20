@interface PXFeedTestCommentsSectionInfo
- (id)commentForItemAtIndex:(int64_t)a3;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
@end

@implementation PXFeedTestCommentsSectionInfo

- (id)commentForItemAtIndex:(int64_t)a3
{
  v3 = objc_alloc_init(TestPLCloudSharedComment);
  return v3;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 1;
}

- (int64_t)sectionType
{
  return 1;
}

@end