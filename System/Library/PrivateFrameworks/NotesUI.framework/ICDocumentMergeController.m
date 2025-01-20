@interface ICDocumentMergeController
- (BOOL)isBlockingMerge;
- (ICDocumentMergeController)init;
- (ICDocumentMergeControlling)parentController;
- (NSSet)textViews;
- (void)addTextView:(id)a3;
- (void)beginBlockingMergeForReason:(unint64_t)a3 textView:(id)a4;
- (void)blockingMergeForReason:(unint64_t)a3 textView:(id)a4 block:(id)a5;
- (void)endBlockingMergeForReason:(unint64_t)a3 textView:(id)a4;
- (void)removeTextView:(id)a3;
- (void)requestMergeWithBlock:(id)a3;
- (void)setParentController:(id)a3;
@end

@implementation ICDocumentMergeController

- (ICDocumentMergeControlling)parentController
{
  v2 = (void *)MEMORY[0x1B3E9F7C0]((char *)self + OBJC_IVAR___ICDocumentMergeController_parent, a2);
  return (ICDocumentMergeControlling *)v2;
}

- (void)setParentController:(id)a3
{
}

- (NSSet)textViews
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_1B0AD4E6C(v2);
  sub_1B0A2E124(0, &qword_1EBBB3910);
  sub_1B0A69D1C();
  v3 = (void *)sub_1B0B8272C();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)addTextView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B0A67634(v4);
}

- (void)removeTextView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B0A67790((uint64_t)v4);
}

- (BOOL)isBlockingMerge
{
  uint64_t v2 = self;
  v3 = [(ICDocumentMergeController *)v2 parentController];
  if (v3
    && (unsigned __int8 v4 = [(ICDocumentMergeControlling *)v3 isBlockingMerge],
        swift_unknownObjectRelease(),
        (v4 & 1) != 0))
  {

    char v5 = 1;
  }
  else
  {
    swift_beginAccess();
    uint64_t v6 = swift_bridgeObjectRetain();
    sub_1B0A67B6C(v6);
    char v5 = v7;

    swift_bridgeObjectRelease();
  }
  return v5 & 1;
}

- (void)beginBlockingMergeForReason:(unint64_t)a3 textView:(id)a4
{
  id v6 = a4;
  char v7 = self;
  sub_1B0A67D10(a3, v6);
}

- (void)endBlockingMergeForReason:(unint64_t)a3 textView:(id)a4
{
  id v6 = a4;
  char v7 = self;
  sub_1B0A680F0(a3, v6);
}

- (void)blockingMergeForReason:(unint64_t)a3 textView:(id)a4 block:(id)a5
{
  char v7 = (void (**)(void))_Block_copy(a5);
  id v8 = a4;
  v9 = self;
  [(ICDocumentMergeController *)v9 beginBlockingMergeForReason:3 textView:v8];
  v7[2](v7);
  [(ICDocumentMergeController *)v9 endBlockingMergeForReason:3 textView:v8];
  _Block_release(v7);
}

- (void)requestMergeWithBlock:(id)a3
{
  unsigned __int8 v4 = _Block_copy(a3);
  _Block_copy(v4);
  char v5 = self;
  sub_1B0A69A90((char *)v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (ICDocumentMergeController)init
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR___ICDocumentMergeController_textViewsToReasonCounts;
  unsigned __int8 v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1B0A3D7AC(MEMORY[0x1E4FBC860]);
  char v5 = (Class *)((char *)&v4->super.isa + OBJC_IVAR___ICDocumentMergeController_requestedMergeBlock);
  void *v5 = 0;
  v5[1] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)ICDocumentMergeController;
  return [(ICDocumentMergeController *)&v7 init];
}

- (void).cxx_destruct
{
  sub_1B0A69D84((uint64_t)self + OBJC_IVAR___ICDocumentMergeController_parent);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICDocumentMergeController_requestedMergeBlock);
  sub_1B0A2508C(v3);
}

@end