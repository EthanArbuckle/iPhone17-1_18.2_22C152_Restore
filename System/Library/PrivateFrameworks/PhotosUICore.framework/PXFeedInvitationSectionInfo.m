@interface PXFeedInvitationSectionInfo
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedInvitationSectionInfo

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 4;
}

- (void)updateFromCloudFeedEntry
{
  v8.receiver = self;
  v8.super_class = (Class)PXFeedInvitationSectionInfo;
  [(PXFeedSectionInfo *)&v8 updateFromCloudFeedEntry];
  v3 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  v4 = [v3 entryAlbumGUID];
  v5 = [(PXFeedSectionInfo *)self sharedAlbumWithGUID:v4];
  v6 = [v5 localizedTitle];
  if (v5)
  {
    uint64_t v7 = 1;
  }
  else
  {
    NSLog(&cfstr_NoSharedAlbumF.isa, self, v3);
    uint64_t v7 = 0;
  }
  [(PXFeedSectionInfo *)self setNumberOfItems:v7];
  [(PXFeedSectionInfo *)self setSharedAlbum:v5];
  [(PXFeedSectionInfo *)self setAlbumTitle:v6];
}

- (int64_t)sectionType
{
  return 2;
}

@end