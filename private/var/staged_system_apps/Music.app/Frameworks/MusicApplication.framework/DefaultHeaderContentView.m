@interface DefaultHeaderContentView
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView)initWithCoder:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
@end

@implementation DefaultHeaderContentView

- (_TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_FDC28();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_F9570(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_F9A34();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v2 = self;
  sub_F9DF4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_F9FAC();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_FB184();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  UIAccessibilityTraits v3 = sub_FB4C8();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView____lazy_storage___chevronImageView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_systemStyleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_bottomHairlineView));
  swift_release();
  UIAccessibilityTraits v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_7229CA0286013830CE534DD32FD39CB724DefaultHeaderContentView_tapGestureRecognizer);
}

@end