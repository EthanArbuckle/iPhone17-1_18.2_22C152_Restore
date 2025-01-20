@interface DebugStatusBarWindow
- (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow)initWithCoder:(id)a3;
- (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow)initWithFrame:(CGRect)a3;
- (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow)initWithWindowScene:(id)a3;
@end

@implementation DebugStatusBarWindow

- (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow)initWithWindowScene:(id)a3
{
  return (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow *)sub_23530E0E0(a3);
}

- (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23530E7A0();
}

- (_TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow_faultLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow_errorLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowUICoreP33_83991F5B05FCDA21D50E0A83C47AE63D20DebugStatusBarWindow_stackView));
  swift_release();
}

@end