@interface ExportManager
- (_TtC7Journal13ExportManager)init;
- (id)printInteractionControllerParentViewController:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)printInteractionControllerDidFinishJob:(id)a3;
@end

@implementation ExportManager

- (id)printInteractionControllerParentViewController:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return Strong;
}

- (void)printInteractionControllerDidFinishJob:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100505804();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_100505804();
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100505804();
}

- (_TtC7Journal13ExportManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal13ExportManager_progressAlertController) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC7Journal13ExportManager_currentExportOptions;
  uint64_t v4 = type metadata accessor for ExportOptions();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal13ExportManager_currentExportTask) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExportManager();
  return [(ExportManager *)&v6 init];
}

- (void).cxx_destruct
{
  sub_100505CCC((uint64_t)self + OBJC_IVAR____TtC7Journal13ExportManager_currentExportOptions);
  swift_release();

  swift_unknownObjectWeakDestroy();
}

@end