@interface PXFeedAlbumCreatedSectionInfo
- (BOOL)isMine;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedAlbumCreatedSectionInfo

- (BOOL)isMine
{
  return 1;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 3;
}

- (void)updateFromCloudFeedEntry
{
  v7.receiver = self;
  v7.super_class = (Class)PXFeedAlbumCreatedSectionInfo;
  [(PXFeedSectionInfo *)&v7 updateFromCloudFeedEntry];
  v3 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  v4 = [v3 entryAlbumGUID];
  v5 = [(PXFeedSectionInfo *)self sharedAlbumWithGUID:v4];
  v6 = [v5 localizedTitle];
  [(PXFeedSectionInfo *)self setNumberOfItems:0];
  [(PXFeedSectionInfo *)self setShouldBeVisibleWhenEmpty:1];
  [(PXFeedSectionInfo *)self setSharedAlbum:v5];
  [(PXFeedSectionInfo *)self setAlbumTitle:v6];
}

- (int64_t)sectionType
{
  return 5;
}

@end