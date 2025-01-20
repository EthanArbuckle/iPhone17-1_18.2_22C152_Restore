@interface ActionLoadingButton
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI19ActionLoadingButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI19ActionLoadingButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateConfiguration;
@end

@implementation ActionLoadingButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActionLoadingButton();
  return [(ActionLoadingButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActionLoadingButton();
  id v4 = v5.receiver;
  [(ActionLoadingButton *)&v5 setHighlighted:v3];
  sub_23A148818();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_23A146428();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI19ActionLoadingButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19ActionLoadingButton *)sub_23A146740(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19ActionLoadingButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A149754();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_23A1469E8();
}

- (void)updateConfiguration
{
  v2 = self;
  sub_23A146D64();
}

- (void).cxx_destruct
{
  sub_23A1492D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_currentState), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_currentState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_indefiniteSpinner));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_defaults);
  objc_release(*(id *)((char *)&self->super.super.super.super._responderFlags
                     + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_defaults));

  double v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_baseForegroundColor);
}

@end