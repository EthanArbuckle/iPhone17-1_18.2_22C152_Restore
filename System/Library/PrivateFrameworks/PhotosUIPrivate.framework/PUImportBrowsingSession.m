@interface PUImportBrowsingSession
+ (PUImportBrowsingSession)withDeviceMedia;
- (NSString)emptyPlaceholderSubtitle;
- (NSString)emptyPlaceholderTitle;
- (PUBrowsingSessionImageWellThumbnailProvider)imageWellThumbnailProvider;
- (PUImportBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8 privacyController:(id)a9;
- (PXImportController)importController;
- (void)importController:(id)a3 addedImportSource:(id)a4;
- (void)importController:(id)a3 failedToAddImportSource:(id)a4 exceptions:(id)a5;
- (void)setImportController:(id)a3;
@end

@implementation PUImportBrowsingSession

+ (PUImportBrowsingSession)withDeviceMedia
{
  v2 = sub_1AEAD17C4();
  return (PUImportBrowsingSession *)v2;
}

- (NSString)emptyPlaceholderTitle
{
  v2 = self;
  sub_1AEAD1B80();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AEF96DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)emptyPlaceholderSubtitle
{
  v2 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (PXImportController)importController
{
  v2 = sub_1AEAD1C70();
  return (PXImportController *)v2;
}

- (void)setImportController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEAD1D1C(a3);
}

- (PUBrowsingSessionImageWellThumbnailProvider)imageWellThumbnailProvider
{
  v2 = sub_1AEAD1E34();
  return (PUBrowsingSessionImageWellThumbnailProvider *)v2;
}

- (void)importController:(id)a3 addedImportSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AEAD1E68((uint64_t)v8, v7);
}

- (void)importController:(id)a3 failedToAddImportSource:(id)a4 exceptions:(id)a5
{
  sub_1AEA0826C(0, &qword_1E9A9BCA8);
  sub_1AEF96F70();
  swift_bridgeObjectRelease();
}

- (PUImportBrowsingSession)initWithDataSourceManager:(id)a3 actionManager:(id)a4 mediaProvider:(id)a5 photosDetailsContext:(id)a6 lowMemoryMode:(BOOL)a7 importStatusManager:(id)a8 privacyController:(id)a9
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  swift_unknownObjectRetain();
  id v16 = a9;
  return (PUImportBrowsingSession *)ImportBrowsingSession.init(dataSourceManager:actionManager:mediaProvider:photosDetailsContext:lowMemoryMode:importStatusManager:privacyController:)();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PUImportBrowsingSession_thumbnailProvider);
}

@end