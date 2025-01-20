@interface BKFinishedAssetManager
- (BKFinishedAssetManager)init;
- (BKFinishedAssetManager)initWithLibraryManager:(id)a3;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
- (void)removeFinishedDownloadsWithThreshhold:(double)a3;
@end

@implementation BKFinishedAssetManager

- (BKFinishedAssetManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_libraryManager) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_objectMonitor) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_assetCache) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKFinishedAssetManager_enablementObservation) = 0;
  sub_1007F6BB0();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FinishedAssetManager(0);
  return [(BKFinishedAssetManager *)&v4 init];
}

- (BKFinishedAssetManager)initWithLibraryManager:(id)a3
{
  return (BKFinishedAssetManager *)sub_10074DDE8(a3);
}

- (void)removeFinishedDownloadsWithThreshhold:(double)a3
{
  objc_super v4 = self;
  FinishedAssetManager.removeFinishedDownloads(threshhold:)(a3);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_1007528BC(v6);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___BKFinishedAssetManager_logger;
  uint64_t v4 = sub_1007F6BC0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end