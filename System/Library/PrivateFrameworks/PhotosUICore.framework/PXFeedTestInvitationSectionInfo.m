@interface PXFeedTestInvitationSectionInfo
- (id)sharedAlbum;
- (int64_t)sectionType;
@end

@implementation PXFeedTestInvitationSectionInfo

- (id)sharedAlbum
{
  v2 = objc_alloc_init(TestPLCloudSharedAlbum);
  return v2;
}

- (int64_t)sectionType
{
  return 2;
}

@end