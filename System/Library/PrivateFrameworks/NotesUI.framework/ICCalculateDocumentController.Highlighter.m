@interface ICCalculateDocumentController.Highlighter
- (void)calculateDocumentControllerDidUpdateDocument:(id)a3;
- (void)noteDidChangeCalculatePreviewBehavior:(id)a3;
- (void)performHighlightsUpdate;
- (void)textStorageDidProcessEndEditing:(id)a3;
@end

@implementation ICCalculateDocumentController.Highlighter

- (void)performHighlightsUpdate
{
  swift_retain();
  sub_1B0B713BC();
  swift_release();
}

- (void)textStorageDidProcessEndEditing:(id)a3
{
  uint64_t v3 = sub_1B0B7F86C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  swift_retain();
  sub_1B0B72268();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)calculateDocumentControllerDidUpdateDocument:(id)a3
{
  uint64_t v3 = sub_1B0B7F86C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  swift_retain();
  id v7 = sub_1B0B7132C();
  objc_msgSend(v7, sel_requestFire);
  swift_release();

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)noteDidChangeCalculatePreviewBehavior:(id)a3
{
  uint64_t v3 = sub_1B0B7F86C();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  swift_retain();
  sub_1B0B702DC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end