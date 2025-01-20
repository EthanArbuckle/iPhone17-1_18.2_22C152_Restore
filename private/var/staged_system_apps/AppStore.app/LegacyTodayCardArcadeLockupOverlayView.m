@interface LegacyTodayCardArcadeLockupOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView)initWithCoder:(id)a3;
- (_TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
@end

@implementation LegacyTodayCardArcadeLockupOverlayView

- (_TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView *)sub_1006B32A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006B4704();
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(LegacyTodayCardArcadeLockupOverlayView *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(LegacyTodayCardArcadeLockupOverlayView *)&v6 _setContinuousCornerRadius:a3];
  [*(id *)&v4[OBJC_IVAR____TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView_backgroundEffectView] _setCornerRadius:1 continuous:12 maskedCorners:a3];
  id v5 = [*(id *)&v4[OBJC_IVAR____TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView_arcadeLockupView] layer];
  [v5 setMaskedCorners:12];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView_arcadeLockupView) sizeThatFits:a3.width, a3.height];
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006B3B68();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView_arcadeLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView_backgroundEffectView));
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore38LegacyTodayCardArcadeLockupOverlayView_impressionsUpdateBlock);

  sub_10006012C(v3);
}

@end