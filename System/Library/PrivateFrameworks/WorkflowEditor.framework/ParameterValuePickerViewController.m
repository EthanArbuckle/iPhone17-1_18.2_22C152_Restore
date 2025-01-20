@interface ParameterValuePickerViewController
- (WFVariableProvider)variableProvider;
- (WFVariableUIDelegate)variableUIDelegate;
- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithCoder:(id)a3;
- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithParameter:(id)a3 allowsVariables:(BOOL)a4 allowsMultipleSelection:(BOOL)a5 initialCollection:(id)a6 currentState:(id)a7;
- (_TtP14WorkflowEditor42ParameterValuePickerViewControllerDelegate_)delegate;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setVariableProvider:(id)a3;
- (void)setVariableUIDelegate:(id)a3;
@end

@implementation ParameterValuePickerViewController

- (_TtP14WorkflowEditor42ParameterValuePickerViewControllerDelegate_)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_234955148();
}

- (WFVariableProvider)variableProvider
{
}

- (void)setVariableProvider:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_2349551F4();
}

- (WFVariableUIDelegate)variableUIDelegate
{
}

- (void)setVariableUIDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_2349552A0();
}

- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithParameter:(id)a3 allowsVariables:(BOOL)a4 allowsMultipleSelection:(BOOL)a5 initialCollection:(id)a6 currentState:(id)a7
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a7;
  return (_TtC14WorkflowEditor34ParameterValuePickerViewController *)ParameterValuePickerViewController.init(parameter:allowsVariables:allowsMultipleSelection:initialCollection:currentState:)();
}

- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_234955568();
}

- (void)loadView
{
  v2 = self;
  sub_234955614();
}

- (_TtC14WorkflowEditor34ParameterValuePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_234B3B588();
  }
  id v5 = a4;
  ParameterValuePickerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_parameter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_currentState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_initialValue));
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_delegate);
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_variableProvider);
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_variableUIDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditor34ParameterValuePickerViewController_hostingViewController);
}

@end