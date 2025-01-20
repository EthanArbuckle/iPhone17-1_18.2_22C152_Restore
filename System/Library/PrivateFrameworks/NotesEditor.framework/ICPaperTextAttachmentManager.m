@interface ICPaperTextAttachmentManager
- (ICPaperTextAttachmentManager)init;
- (ICPaperTextAttachmentManager)initWithNote:(id)a3 textView:(id)a4 delegate:(id)a5;
- (void)insertMagicGenerativePlaygroundWithAutomaticContent;
- (void)insertMagicGenerativePlaygroundWithImage:(CGImage *)a3;
- (void)insertMagicGenerativePlaygroundWithText:(id)a3;
- (void)noteDidChangeCalculatePreviewBehavior:(id)a3;
- (void)paperKitViewDidAppear:(id)a3;
@end

@implementation ICPaperTextAttachmentManager

- (ICPaperTextAttachmentManager)initWithNote:(id)a3 textView:(id)a4 delegate:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  swift_unknownObjectRetain();
  return (ICPaperTextAttachmentManager *)PaperTextAttachmentManager.init(note:textView:delegate:)(v6, v7);
}

- (void)paperKitViewDidAppear:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C075010(v4);
}

- (void)noteDidChangeCalculatePreviewBehavior:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C074B98();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)insertMagicGenerativePlaygroundWithAutomaticContent
{
  v2 = self;
  PaperTextAttachmentManager.insertMagicGenerativePlaygroundWithAutomaticContent()();
}

- (void)insertMagicGenerativePlaygroundWithText:(id)a3
{
  uint64_t v4 = sub_20C162AC0();
  uint64_t v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  PaperTextAttachmentManager.insertMagicGenerativePlaygroundWithText(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)insertMagicGenerativePlaygroundWithImage:(CGImage *)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  PaperTextAttachmentManager.insertMagicGenerativePlaygroundWithImage(_:)(v4);
}

- (ICPaperTextAttachmentManager)init
{
  result = (ICPaperTextAttachmentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_20BFCEB78((uint64_t)self + OBJC_IVAR___ICPaperTextAttachmentManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICPaperTextAttachmentManager_isMathPaperSolvingAllowedObservation);
}

@end