@interface ICCalculateGraphingController
- (ICAttachmentInsertionController)attachmentInsertionController;
- (ICCalculateGraphingController)init;
- (ICCalculateGraphingController)initWithNote:(id)a3;
- (ICCalculateScrubberController)scrubberController;
- (ICNote)note;
- (UITextView)textView;
- (id)insertionDecisionForExpressionsInRange:(_NSRange)a3;
- (void)performDecision:(id)a3;
- (void)setAttachmentInsertionController:(id)a3;
- (void)setNote:(id)a3;
- (void)setScrubberController:(id)a3;
- (void)setTextView:(id)a3;
@end

@implementation ICCalculateGraphingController

- (ICNote)note
{
  return (ICNote *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_note);
}

- (void)setNote:(id)a3
{
}

- (UITextView)textView
{
  return (UITextView *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_textView);
}

- (void)setTextView:(id)a3
{
}

- (ICAttachmentInsertionController)attachmentInsertionController
{
  return (ICAttachmentInsertionController *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_attachmentInsertionController);
}

- (void)setAttachmentInsertionController:(id)a3
{
}

- (ICCalculateScrubberController)scrubberController
{
  return (ICCalculateScrubberController *)sub_1B0A916D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICCalculateGraphingController_scrubberController);
}

- (void)setScrubberController:(id)a3
{
}

- (ICCalculateGraphingController)initWithNote:(id)a3
{
  id v3 = a3;
  v4 = (ICCalculateGraphingController *)sub_1B0AB7388(v3);

  return v4;
}

- (id)insertionDecisionForExpressionsInRange:(_NSRange)a3
{
  Swift::Int length = a3.length;
  Swift::Int location = a3.location;
  v5 = self;
  v6.Swift::Int location = location;
  v6.Swift::Int length = length;
  ICCalculateGraphingController.insertionDecision(forExpressionsIn:)(v7, v6);
  v9 = v8;

  return v9;
}

- (void)performDecision:(id)a3
{
  v4 = (ICCalculateGraphingControllerInsertionDecision *)a3;
  v5 = self;
  ICCalculateGraphingController.perform(_:)(v4);
}

- (ICCalculateGraphingController)init
{
  result = (ICCalculateGraphingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculateGraphingController_insertionPromptController);
}

@end