@interface DateFieldParameterSummaryEditor
- (_TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)parameterAttributesDidChange:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryTextDidChange:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation DateFieldParameterSummaryEditor

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_234AAFF50((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (void)textEntryTextDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_234AB0054((uint64_t)a3);
}

- (void)textEntryDidFinish
{
  v2 = self;
  sub_234AB010C();
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_234AB0418();
}

- (_TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor *)sub_234AB0484(a3, a4, a5);
}

@end