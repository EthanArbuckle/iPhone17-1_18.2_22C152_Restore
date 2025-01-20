@interface ICCalculateRecognitionController
- (BOOL)insertsResults;
- (BOOL)isPreviewingResult;
- (ICAttachmentInsertionController)attachmentInsertionController;
- (ICCalculateRecognitionController)init;
- (ICCalculateRecognitionController)initWithNote:(id)a3;
- (ICCalculateRecognitionControllerSuggestionsDelegate)suggestionsDelegate;
- (ICNote)note;
- (UITextView)textView;
- (int64_t)previewBehavior;
- (void)addErrorInteraction;
- (void)commitPreviewedResultAtRange:(_NSRange)a3 asLiteral:(BOOL)a4;
- (void)didInsertString:(id)a3 atRange:(_NSRange)a4;
- (void)didUnmarkString:(id)a3 atRange:(_NSRange)a4;
- (void)discardPreviewedResult;
- (void)insertLiteralResultAtRange:(_NSRange)a3;
- (void)insertResultAtRange:(_NSRange)a3;
- (void)previewResultAtRange:(_NSRange)a3;
- (void)setAttachmentInsertionController:(id)a3;
- (void)setInsertsResults:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setPreviewBehavior:(int64_t)a3;
- (void)setSuggestionsDelegate:(id)a3;
- (void)setTextView:(id)a3;
- (void)willUpdateMarkedText:(id)a3;
@end

@implementation ICCalculateRecognitionController

- (ICNote)note
{
  return (ICNote *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_note);
}

- (void)setNote:(id)a3
{
}

- (UITextView)textView
{
  return (UITextView *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_textView);
}

- (void)setTextView:(id)a3
{
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return (ICAttachmentInsertionController *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_attachmentInsertionController);
}

- (void)setAttachmentInsertionController:(id)a3
{
}

- (ICCalculateRecognitionControllerSuggestionsDelegate)suggestionsDelegate
{
  return (ICCalculateRecognitionControllerSuggestionsDelegate *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateRecognitionController_suggestionsDelegate);
}

- (void)setSuggestionsDelegate:(id)a3
{
}

- (ICCalculateRecognitionController)initWithNote:(id)a3
{
  return (ICCalculateRecognitionController *)ICCalculateRecognitionController.init(note:)(a3);
}

- (void)didInsertString:(id)a3 atRange:(_NSRange)a4
{
  Swift::Int location = a4.location;
  uint64_t v6 = sub_1B0B8240C();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  v11.Swift::Int location = location;
  ICCalculateRecognitionController.didInsert(_:at:)(v10, v11);

  swift_bridgeObjectRelease();
}

- (void)didUnmarkString:(id)a3 atRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  unint64_t v7 = sub_1B0B8240C();
  unint64_t v9 = v8;
  Swift::String v10 = self;
  if (location != sub_1B0B7F71C() && (location & 0x8000000000000000) == 0) {
    sub_1B0A91D14(v7, v9, location, length, 1);
  }

  swift_bridgeObjectRelease();
}

- (void)willUpdateMarkedText:(id)a3
{
  uint64_t v4 = sub_1B0B7F86C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  unint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  unint64_t v8 = self;
  sub_1B0A926DC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)insertsResults
{
  v2 = (BOOL *)self + OBJC_IVAR___ICCalculateRecognitionController_insertsResults;
  swift_beginAccess();
  return *v2;
}

- (void)setInsertsResults:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___ICCalculateRecognitionController_insertsResults;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (void)insertResultAtRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  uint64_t v6 = self;
  v5.Swift::Int location = location;
  v5.Swift::Int length = length;
  ICCalculateRecognitionController.insertResult(at:)(v5);
}

- (void)insertLiteralResultAtRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  uint64_t v6 = self;
  v5.Swift::Int location = location;
  v5.Swift::Int length = length;
  ICCalculateRecognitionController.insertLiteralResult(at:)(v5);
}

- (int64_t)previewBehavior
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___ICCalculateRecognitionController_previewBehavior);
  swift_beginAccess();
  return *v2;
}

- (void)setPreviewBehavior:(int64_t)a3
{
  __C::_NSRange v5 = (int64_t *)((char *)self + OBJC_IVAR___ICCalculateRecognitionController_previewBehavior);
  swift_beginAccess();
  *__C::_NSRange v5 = a3;
  [(ICCalculateRecognitionController *)self discardPreviewedResult];
}

- (BOOL)isPreviewingResult
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateRecognitionController_previewedExpression) != 0;
}

- (void)previewResultAtRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  uint64_t v6 = self;
  v5.Swift::Int location = location;
  v5.Swift::Int length = length;
  ICCalculateRecognitionController.previewResult(at:)(v5);
}

- (void)commitPreviewedResultAtRange:(_NSRange)a3 asLiteral:(BOOL)a4
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  unint64_t v8 = self;
  v7.Swift::Int location = location;
  v7.Swift::Int length = length;
  ICCalculateRecognitionController.commitPreviewedResult(at:asLiteral:)(v7, a4);
}

- (void)discardPreviewedResult
{
  v2 = self;
  ICCalculateRecognitionController.discardPreviewedResult()();
}

- (void)addErrorInteraction
{
  v2 = self;
  id v3 = sub_1B0A953A0();
  sub_1B0B6D6C8();
}

- (ICCalculateRecognitionController)init
{
  result = (ICCalculateRecognitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1B0A69D84((uint64_t)self + OBJC_IVAR___ICCalculateRecognitionController_suggestionsDelegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateRecognitionController____lazy_storage___errorInteractionController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICCalculateRecognitionController_isMathPaperSolvingAllowedObservation));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ICCalculateRecognitionController_isKeyboardMathSolvingAllowedObservation);
}

@end