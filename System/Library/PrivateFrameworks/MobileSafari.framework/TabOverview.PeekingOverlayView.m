@interface TabOverview.PeekingOverlayView
- (_TtCC12MobileSafari11TabOverview18PeekingOverlayView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari11TabOverview18PeekingOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TabOverview.PeekingOverlayView

- (void)layoutSubviews
{
  v2 = self;
  sub_18C3E8738();
}

- (_TtCC12MobileSafari11TabOverview18PeekingOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabOverview18PeekingOverlayView *)sub_18C463364(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari11TabOverview18PeekingOverlayView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari11TabOverview18PeekingOverlayView *)sub_18C5E636C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview18PeekingOverlayView_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabOverview18PeekingOverlayView_backgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari11TabOverview18PeekingOverlayView_imageView);
}

@end