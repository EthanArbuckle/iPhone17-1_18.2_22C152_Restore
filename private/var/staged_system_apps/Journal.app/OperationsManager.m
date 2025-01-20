@interface OperationsManager
- (_TtC7Journal17OperationsManager)init;
@end

@implementation OperationsManager

- (_TtC7Journal17OperationsManager)init
{
  return (_TtC7Journal17OperationsManager *)sub_1005B5888();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Journal17OperationsManager_mapTableFileAttachmentsQueue));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal17OperationsManager_batchRecordDownloadQueue);
}

@end