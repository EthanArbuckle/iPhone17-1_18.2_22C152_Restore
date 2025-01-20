@interface OperationsManager
- (_TtC21JournalShareExtension17OperationsManager)init;
@end

@implementation OperationsManager

- (_TtC21JournalShareExtension17OperationsManager)init
{
  return (_TtC21JournalShareExtension17OperationsManager *)sub_100086680();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_cacheQueueLowPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_cacheQueueRegularPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_cacheQueueHighPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_mapTableFileAttachmentsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_mapTableAssetMetadataQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_fileAttachmentsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_assetMetadataQueue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC21JournalShareExtension17OperationsManager_batchRecordDownloadQueue);
}

@end