@interface SecondaryLabelStack
- (UIStackView)stackView;
- (UIView)bottomView;
- (UIView)contentView;
- (UIView)topView;
- (_TtC7Measure16InteractiveLabel)bottomLabel;
- (_TtC7Measure16InteractiveLabel)topLabel;
- (_TtC7Measure19SecondaryLabelStack)initWithCoder:(id)a3;
- (_TtC7Measure19SecondaryLabelStack)initWithFrame:(CGRect)a3;
- (void)setBottomLabel:(id)a3;
- (void)setBottomView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTopLabel:(id)a3;
- (void)setTopView:(id)a3;
@end

@implementation SecondaryLabelStack

- (_TtC7Measure16InteractiveLabel)topLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure16InteractiveLabel *)Strong;
}

- (void)setTopLabel:(id)a3
{
}

- (_TtC7Measure16InteractiveLabel)bottomLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC7Measure16InteractiveLabel *)Strong;
}

- (void)setBottomLabel:(id)a3
{
}

- (UIView)topView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setTopView:(id)a3
{
}

- (UIView)bottomView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setBottomView:(id)a3
{
}

- (UIStackView)stackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setStackView:(id)a3
{
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView));
}

- (void)setContentView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure19SecondaryLabelStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure19SecondaryLabelStack *)sub_10015F16C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure19SecondaryLabelStack)initWithCoder:(id)a3
{
  return (_TtC7Measure19SecondaryLabelStack *)sub_10015F460(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure19SecondaryLabelStack_contentView);
}

@end