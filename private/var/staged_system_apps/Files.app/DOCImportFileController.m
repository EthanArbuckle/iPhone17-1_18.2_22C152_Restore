@interface DOCImportFileController
- (_TtC5Files23DOCImportFileController)init;
- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4;
- (void)documentPickerDidCancel:(id)a3;
@end

@implementation DOCImportFileController

- (_TtC5Files23DOCImportFileController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCImportFileController_fileURLsToImport) = (Class)&_swiftEmptySetSingleton;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files23DOCImportFileController_deferredFileURLImportTimer) = 0;
  swift_unknownObjectWeakInit();
  *(void *)&self->fileURLsToImport[OBJC_IVAR____TtC5Files23DOCImportFileController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCImportFileController();
  return [(DOCImportFileController *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files23DOCImportFileController_deferredFileURLImportTimer));
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC5Files23DOCImportFileController_delegate;

  sub_10003A094((uint64_t)v3);
}

- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_10054A690(v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10054A7F4();
}

@end