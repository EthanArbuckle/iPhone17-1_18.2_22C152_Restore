@interface SmartShortcutPickerViewControllerManager
- (_TtC10WorkflowUI40SmartShortcutPickerViewControllerManager)init;
- (_TtP10WorkflowUI48SmartShortcutPickerViewControllerManagerDelegate_)delegate;
- (id)makeViewControllerWith:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SmartShortcutPickerViewControllerManager

- (_TtP10WorkflowUI48SmartShortcutPickerViewControllerManagerDelegate_)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_22DA671A8();
}

- (id)makeViewControllerWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_22DA671F0(v4);

  return v6;
}

- (_TtC10WorkflowUI40SmartShortcutPickerViewControllerManager)init
{
  return (_TtC10WorkflowUI40SmartShortcutPickerViewControllerManager *)sub_22DA68A04();
}

- (void).cxx_destruct
{
}

@end