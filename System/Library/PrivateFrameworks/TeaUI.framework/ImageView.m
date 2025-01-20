@interface ImageView
+ (Class)layerClass;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)clipsToBounds;
- (UIColor)backgroundColor;
- (_TtC5TeaUI9ImageView)initWithCoder:(id)a3;
- (_TtC5TeaUI9ImageView)initWithFrame:(CGRect)a3;
- (int64_t)contentMode;
- (void)layoutSubviews;
- (void)setAccessibilityElementsHidden:(BOOL)a3;
- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
@end

@implementation ImageView

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = sub_1B5F907FC();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1B5F908C4(a3);
}

- (_TtC5TeaUI9ImageView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI9ImageView *)ImageView.init(frame:)();
}

- (_TtC5TeaUI9ImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  ImageView.init(coder:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5TeaUI9ImageView__backgroundColor);
}

- (void)layoutSubviews
{
  v2 = self;
  ImageView.layoutSubviews()();
}

+ (Class)layerClass
{
  static ImageView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)clipsToBounds
{
  v2 = self;
  unsigned __int8 v3 = ImageView.clipsToBounds.getter();

  return v3 & 1;
}

- (void)setClipsToBounds:(BOOL)a3
{
  v4 = self;
  ImageView.clipsToBounds.setter(a3);
}

- (int64_t)contentMode
{
  v2 = self;
  id v3 = ImageView.contentMode.getter();

  return (int64_t)v3;
}

- (void)setContentMode:(int64_t)a3
{
  v4 = self;
  ImageView.contentMode.setter(a3);
}

- (BOOL)accessibilityIgnoresInvertColors
{
  v2 = self;
  unsigned __int8 v3 = ImageView.accessibilityIgnoresInvertColors.getter();

  return v3 & 1;
}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
  v4 = self;
  ImageView.accessibilityIgnoresInvertColors.setter(a3);
}

- (BOOL)accessibilityElementsHidden
{
  v2 = self;
  unsigned __int8 v3 = ImageView.accessibilityElementsHidden.getter();

  return v3 & 1;
}

- (void)setAccessibilityElementsHidden:(BOOL)a3
{
  v4 = self;
  ImageView.accessibilityElementsHidden.setter(a3);
}

@end