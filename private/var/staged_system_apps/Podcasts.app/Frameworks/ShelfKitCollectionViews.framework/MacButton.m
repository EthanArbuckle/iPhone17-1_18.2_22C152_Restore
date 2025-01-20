@interface MacButton
- (BOOL)accessibilityButtonIsTextStyle;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (_TtC23ShelfKitCollectionViews9MacButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews9MacButton)initWithFrame:(CGRect)a3;
- (unsigned)viewForLastBaselineLayout;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation MacButton

- (_TtC23ShelfKitCollectionViews9MacButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_usesBoundsForBaselineGuide) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_touchInsets;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton____lazy_storage___layoutView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_progressView) = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews9MacButton *)sub_385890();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(MacButton *)&v3 tintColorDidChange];
  sub_132948();
}

- (BOOL)isHighlighted
{
  return sub_C30C0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(MacButton *)&v5 setHighlighted:v3];
  sub_1330DC();
}

- (BOOL)isEnabled
{
  return sub_C30C0(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  [(MacButton *)&v10 setEnabled:v3];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  unsigned int v7 = [(MacButton *)&v9 isEnabled];
  double v8 = 0.5;
  if (v7) {
    double v8 = 1.0;
  }
  [(MacButton *)v6 setAlpha:v8];
}

- (unsigned)viewForLastBaselineLayout
{
  int v1 = a1[OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_usesBoundsForBaselineGuide];
  id v2 = a1;
  if (v1 == 1)
  {
    BOOL v3 = (unsigned __int8 *)sub_133684();

    id v2 = v3;
  }

  return v2;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = -1.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  MacButton.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  _s23ShelfKitCollectionViews9MacButtonC12sizeThatFitsySo6CGSizeVAFF_0();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)accessibilityButtonIsTextStyle
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_style) == 4;
}

- (_TtC23ShelfKitCollectionViews9MacButton)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews9MacButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_133010(*(id *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_glyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton____lazy_storage___layoutView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews9MacButton_progressView);
}

@end