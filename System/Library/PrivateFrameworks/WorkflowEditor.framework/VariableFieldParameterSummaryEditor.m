@interface VariableFieldParameterSummaryEditor
- (_TtC14WorkflowEditorP33_4FF4F351C433FF94A8616279ECCFBACD35VariableFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryTextDidChange:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation VariableFieldParameterSummaryEditor

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
  sub_234AE9618((uint64_t)&unk_2687D6E58, v5);
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_234AAC83C((uint64_t)a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)textEntryTextDidChange:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_234AAC924(a3);
}

- (void)textEntryDidFinish
{
  v2 = self;
  sub_234AACA70();
}

- (_TtC14WorkflowEditorP33_4FF4F351C433FF94A8616279ECCFBACD35VariableFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_4FF4F351C433FF94A8616279ECCFBACD35VariableFieldParameterSummaryEditor *)sub_234AACB50(a3, a4, a5);
}

@end