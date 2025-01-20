@interface PhoneSessionInstructionsView
- (_TtC9SeymourUI28PhoneSessionInstructionsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI28PhoneSessionInstructionsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PhoneSessionInstructionsView

- (_TtC9SeymourUI28PhoneSessionInstructionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A071E74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A070D88();
}

- (_TtC9SeymourUI28PhoneSessionInstructionsView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI28PhoneSessionInstructionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PhoneSessionInstructionsView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PhoneSessionInstructionsView_workoutDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PhoneSessionInstructionsView_workoutInstructionStackView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28PhoneSessionInstructionsView_workoutInstructionsStackViewBottomConstraint);
}

@end