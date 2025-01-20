@interface PXFeedSubscriptionSectionInfo
- (BOOL)isMine;
- (int64_t)sectionType;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedSubscriptionSectionInfo

- (BOOL)isMine
{
  return 1;
}

- (void)updateFromCloudFeedEntry
{
  v5.receiver = self;
  v5.super_class = (Class)PXFeedSubscriptionSectionInfo;
  [(PXFeedAssetsSectionInfo *)&v5 updateFromCloudFeedEntry];
  v3 = [(PXFeedSectionInfo *)self sharedAlbum];

  if (!v3)
  {
    v4 = [(PXFeedSectionInfo *)self cloudFeedEntry];
    NSLog(&cfstr_NoSharedAlbumF_0.isa, self, v4);
  }
  [(PXFeedSectionInfo *)self setShouldBeVisibleWhenEmpty:v3 != 0];
}

- (int64_t)sectionType
{
  return 3;
}

@end