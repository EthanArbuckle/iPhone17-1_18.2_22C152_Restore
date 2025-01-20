@interface TabOverview.BackgroundView
- (_TtCC12MobileSafari11TabOverview14BackgroundView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari11TabOverview14BackgroundView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
@end

@implementation TabOverview.BackgroundView

- (_TtCC12MobileSafari11TabOverview14BackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabOverview14BackgroundView *)sub_18C3D9398(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_s14BackgroundViewCMa();
  v2 = (char *)v5.receiver;
  [(TabOverview.BackgroundView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_blurView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_fillView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_s14BackgroundViewCMa();
  v4 = (char *)v7.receiver;
  [(TabOverview.BackgroundView *)&v7 _setContinuousCornerRadius:a3];
  objc_super v5 = *(void **)&v4[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_blurView];
  objc_msgSend(v4, sel__continuousCornerRadius, v7.receiver, v7.super_class);
  objc_msgSend(v5, sel__setContinuousCornerRadius_);
  v6 = *(void **)&v4[OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_fillView];
  objc_msgSend(v4, sel__continuousCornerRadius);
  objc_msgSend(v6, sel__setContinuousCornerRadius_);
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)_s14BackgroundViewCMa();
  [(TabOverview.BackgroundView *)&v3 _continuousCornerRadius];
  return result;
}

- (_TtCC12MobileSafari11TabOverview14BackgroundView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari11TabOverview14BackgroundView *)sub_18C6C7618(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_blurView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari11TabOverview14BackgroundView_fillView);
}

@end