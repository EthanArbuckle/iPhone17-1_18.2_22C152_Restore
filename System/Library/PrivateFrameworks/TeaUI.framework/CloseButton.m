@interface CloseButton
- (BOOL)accessibilityActivate;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC5TeaUI11CloseButton)init;
- (_TtC5TeaUI11CloseButton)initWithCoder:(id)a3;
- (_TtC5TeaUI11CloseButton)initWithFrame:(CGRect)a3;
@end

@implementation CloseButton

- (_TtC5TeaUI11CloseButton)init
{
  return (_TtC5TeaUI11CloseButton *)CloseButton.init()();
}

- (_TtC5TeaUI11CloseButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5F57ECC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = CloseButton.intrinsicContentSize.getter();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  CGSize v6 = CloseButton.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  double width = v6.width;
  double height = v6.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_TtC5TeaUI11CloseButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI11CloseButton____lazy_storage___backing));
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  CloseButton.accessibilityActivate()();

  return 1;
}

@end