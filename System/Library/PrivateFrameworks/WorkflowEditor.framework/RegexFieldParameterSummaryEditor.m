@interface RegexFieldParameterSummaryEditor
- (_TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)parameterAttributesDidChange:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryTextDidChange:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation RegexFieldParameterSummaryEditor

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_23491C5E8((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (void)textEntryTextDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23491C6EC((uint64_t)a3);
}

- (void)textEntryDidFinish
{
  v2 = self;
  sub_23491C7A4();
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_23491CA6C();
}

- (_TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor *)sub_23491CAD8(a3, a4, a5);
}

@end