@interface StepperParameterSummaryEditor
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (_TtC14WorkflowEditorP33_073C17B42FC52C4719BEB2DDCC24406D29StepperParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
@end

@implementation StepperParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2349DBB64((uint64_t)v6, v7);
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D3118, v5);
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return sub_234964DD8();
}

- (_TtC14WorkflowEditorP33_073C17B42FC52C4719BEB2DDCC24406D29StepperParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_073C17B42FC52C4719BEB2DDCC24406D29StepperParameterSummaryEditor *)sub_2349DC3C4(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_073C17B42FC52C4719BEB2DDCC24406D29StepperParameterSummaryEditor_modal));
}

@end