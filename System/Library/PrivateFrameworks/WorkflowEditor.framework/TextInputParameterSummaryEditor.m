@interface TextInputParameterSummaryEditor
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (WFVariableProvider)variableProvider;
- (_TtC14WorkflowEditor31TextInputParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)setVariableProvider:(id)a3;
- (void)textEntryDidCopyWithOriginalBlock:(id)a3;
- (void)textEntryDidCutWithOriginalBlock:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryDidPasteWithOriginalBlock:(id)a3;
- (void)textEntryTextDidChange:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation TextInputParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23498E418();
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D77D8, v5);
}

- (WFVariableProvider)variableProvider
{
  v2 = self;
  id v3 = sub_234ACB838();

  return (WFVariableProvider *)v3;
}

- (void)setVariableProvider:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_234ACB8E0((uint64_t)a3);
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_234ACB9B0((uint64_t)a3, (unsigned __int8 *)a4);

  swift_unknownObjectRelease();
}

- (void)textEntryTextDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_234ACC06C(a3);
}

- (void)textEntryDidFinish
{
  v2 = self;
  sub_234ACC1DC();
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  id v3 = a3;
  unint64_t v4 = sub_234ACC2C4();

  return v4;
}

- (void)textEntryDidCutWithOriginalBlock:(id)a3
{
}

- (void)textEntryDidCopyWithOriginalBlock:(id)a3
{
}

- (void)textEntryDidPasteWithOriginalBlock:(id)a3
{
}

- (_TtC14WorkflowEditor31TextInputParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor31TextInputParameterSummaryEditor *)sub_234ACCD9C(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor31TextInputParameterSummaryEditor_autocompleteDataSource));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor31TextInputParameterSummaryEditor_textAttachmentToEdit));
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditor31TextInputParameterSummaryEditor_autocompleteCoordinator);
}

@end