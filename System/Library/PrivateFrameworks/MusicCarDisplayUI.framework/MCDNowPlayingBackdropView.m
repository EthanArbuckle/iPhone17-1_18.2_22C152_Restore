@interface MCDNowPlayingBackdropView
- (MCDNowPlayingBackdropView)initWithCoder:(id)a3;
- (MCDNowPlayingBackdropView)initWithFrame:(CGRect)a3;
- (void)updateWithImage:(id)a3 animated:(BOOL)a4;
@end

@implementation MCDNowPlayingBackdropView

- (MCDNowPlayingBackdropView)initWithFrame:(CGRect)a3
{
  return (MCDNowPlayingBackdropView *)NowPlayingBackdropView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MCDNowPlayingBackdropView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_metalView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_renderer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_overlayView) = 0;
  id v4 = a3;

  result = (MCDNowPlayingBackdropView *)sub_23F15D2F8();
  __break(1u);
  return result;
}

- (void)updateWithImage:(id)a3 animated:(BOOL)a4
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_renderer);
  if (v4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    sub_23F15D2C8();
  }
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MCDNowPlayingBackdropView_overlayView);
}

@end