@interface PillButton
+ (Class)layerClass;
- (UIColor)backgroundColor;
- (_TtC5TeaUI10PillButton)initWithCoder:(id)a3;
- (_TtC5TeaUI10PillButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation PillButton

+ (Class)layerClass
{
  sub_1B5F31C94();
  return (Class)swift_getObjCClassFromMetadata();
}

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = sub_1B5F31CE0();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B5F31DE0(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B5F31E98();
}

- (_TtC5TeaUI10PillButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI10PillButton *)PillButton.init(frame:)();
}

- (_TtC5TeaUI10PillButton)initWithCoder:(id)a3
{
  return (_TtC5TeaUI10PillButton *)PillButton.init(coder:)(a3);
}

@end