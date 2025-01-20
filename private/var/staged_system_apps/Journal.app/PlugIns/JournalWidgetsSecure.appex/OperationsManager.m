@interface OperationsManager
- (_TtC20JournalWidgetsSecure17OperationsManager)init;
@end

@implementation OperationsManager

- (_TtC20JournalWidgetsSecure17OperationsManager)init
{
  return (_TtC20JournalWidgetsSecure17OperationsManager *)sub_100004C58();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_cacheQueueLowPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_cacheQueueRegularPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_cacheQueueHighPriority));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_mapTableFileAttachmentsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_mapTableAssetMetadataQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_fileAttachmentsQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_assetMetadataQueue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20JournalWidgetsSecure17OperationsManager_batchRecordDownloadQueue);
}

@end