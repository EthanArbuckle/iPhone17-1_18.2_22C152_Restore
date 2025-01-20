@interface CRLQAImportFileDocumentPickerDelegate
- (_TtC8Freeform37CRLQAImportFileDocumentPickerDelegate)init;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
@end

@implementation CRLQAImportFileDocumentPickerDelegate

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_100606428(v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_1016765D8);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  swift_storeEnumTagMultiPayload();
  id v10 = a3;
  v11 = self;
  sub_100605B28((uint64_t)v8);
  sub_100522F00((uint64_t)v8, &qword_1016765D8);
}

- (_TtC8Freeform37CRLQAImportFileDocumentPickerDelegate)init
{
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLQAImportFileDocumentPickerDelegate_result;
  uint64_t v4 = sub_1005057FC(&qword_1016765D8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLQAImportFileDocumentPickerDelegate_continuation;
  uint64_t v6 = sub_1005057FC((uint64_t *)&unk_1016765E8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLQAImportFileDocumentPickerDelegate();
  return [(CRLQAImportFileDocumentPickerDelegate *)&v8 init];
}

- (void).cxx_destruct
{
}

@end