@interface UpsellBannerView
- (BOOL)showsAppleMusicLogo;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)compactText;
- (NSString)regularText;
- (_TtC16MusicApplication16UpsellBannerView)initWithCoder:(id)a3;
- (_TtC16MusicApplication16UpsellBannerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setCompactText:(id)a3;
- (void)setRegularText:(id)a3;
- (void)setShowsAppleMusicLogo:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UpsellBannerView

- (_TtC16MusicApplication16UpsellBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16UpsellBannerView *)sub_1FD9A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16UpsellBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2004BC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1FCE2C(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1FE794();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UpsellBannerView *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(UpsellBannerView *)&v6 traitCollectionDidChange:v4];
  sub_1FE318();
  sub_1FE180();
  [v5 setNeedsLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  double v9 = self;
  v10 = sub_1FCD04((uint64_t)a4, x, y);

  return v10;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UpsellBannerView *)&v3 tintColorDidChange];
  sub_1FE180();
}

- (NSString)compactText
{
  return (NSString *)sub_42EA8();
}

- (void)setCompactText:(id)a3
{
}

- (NSString)regularText
{
  return (NSString *)sub_42EA8();
}

- (void)setRegularText:(id)a3
{
}

- (BOOL)showsAppleMusicLogo
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_showsAppleMusicLogo);
}

- (void)setShowsAppleMusicLogo:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_showsAppleMusicLogo);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_showsAppleMusicLogo) = a3;
  if (v3 != a3)
  {
    id v4 = self;
    sub_1FE318();
    [(UpsellBannerView *)v4 setNeedsLayout];
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_onSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_jsUpsellBanner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_measurementStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_logoImageView));
  swift_release();

  swift_release();
}

@end