@interface PreviewConfiguration.ContentView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtCC10WorkflowUI20PreviewConfiguration11ContentView)initWithCoder:(id)a3;
- (_TtCC10WorkflowUI20PreviewConfiguration11ContentView)initWithFrame:(CGRect)a3;
- (void)backgroundTapped;
- (void)textDidChange;
@end

@implementation PreviewConfiguration.ContentView

- (_TtCC10WorkflowUI20PreviewConfiguration11ContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22DB2D914();
}

- (void)textDidChange
{
  v2 = self;
  sub_22DB2EA94();
}

- (BOOL)becomeFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_22DB2BD44();

  return v3 & 1;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_22DB2EC0C();

  return v3 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22DB2EC6C(v4);

  return 0;
}

- (void)backgroundTapped
{
  v2 = self;
  sub_22DB2ECD4();
}

- (_TtCC10WorkflowUI20PreviewConfiguration11ContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC10WorkflowUI20PreviewConfiguration11ContentView_configuration);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC10WorkflowUI20PreviewConfiguration11ContentView_backgroundImageView));
  unsigned __int8 v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC10WorkflowUI20PreviewConfiguration11ContentView_titleField);
}

@end