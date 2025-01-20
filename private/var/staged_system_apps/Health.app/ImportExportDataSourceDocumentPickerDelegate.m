@interface ImportExportDataSourceDocumentPickerDelegate
- (_TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
@end

@implementation ImportExportDataSourceDocumentPickerDelegate

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_10002833C(v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (_TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate)init
{
  result = (_TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6HealthP33_9FDE690F091037398242CA42A360B38544ImportExportDataSourceDocumentPickerDelegate_healthStore));
}

@end