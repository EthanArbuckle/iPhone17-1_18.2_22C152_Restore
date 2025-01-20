@interface DOCButton
- (_TtC5Files9DOCButton)initWithCoder:(id)a3;
- (_TtC5Files9DOCButton)initWithFrame:(CGRect)a3;
@end

@implementation DOCButton

- (_TtC5Files9DOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files9DOCButton_hoverEffectsAllowedIfInteractionDisabled) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files9DOCButton__userInteractionStateDeterminesLayerHitTestState_override) = 2;
  id v4 = a3;

  result = (_TtC5Files9DOCButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Files9DOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Files9DOCButton *)sub_10056870C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end