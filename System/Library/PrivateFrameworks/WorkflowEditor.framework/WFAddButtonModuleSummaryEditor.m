@interface WFAddButtonModuleSummaryEditor
- (_TtC14WorkflowEditorP33_9A296241BD4049F50C4BE9A917289EEA30WFAddButtonModuleSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (id)menuForSlotWithIdentifier:(id)a3 style:(unint64_t)a4;
- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3;
@end

@implementation WFAddButtonModuleSummaryEditor

- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_234A073D8();
}

- (id)menuForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v4 = (void *)OUTLINED_FUNCTION_1_4();
  return v4;
}

- (_TtC14WorkflowEditorP33_9A296241BD4049F50C4BE9A917289EEA30WFAddButtonModuleSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_9A296241BD4049F50C4BE9A917289EEA30WFAddButtonModuleSummaryEditor *)sub_234A075D0(a3, a4, a5);
}

@end