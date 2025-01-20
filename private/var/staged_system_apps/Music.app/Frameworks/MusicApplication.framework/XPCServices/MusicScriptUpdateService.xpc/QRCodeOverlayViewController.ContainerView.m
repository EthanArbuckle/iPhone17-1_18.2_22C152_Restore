@interface QRCodeOverlayViewController.ContainerView
- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithCoder:(id)a3;
- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateColor;
@end

@implementation QRCodeOverlayViewController.ContainerView

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView *)sub_10041B6D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10041C924();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for QRCodeOverlayViewController.ContainerView();
  id v2 = v4.receiver;
  [(QRCodeOverlayViewController.ContainerView *)&v4 layoutSubviews];
  sub_100009854(0, &qword_100584E78);
  *(void *)(swift_allocObject() + 16) = v2;
  id v3 = v2;
  static CATransaction.performWithoutAnimation(_:)((void (*)(id))sub_10041CA74);

  swift_release();
}

- (void)updateColor
{
  id v2 = self;
  sub_10041BCAC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_overlayColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView_overlayLayer);
}

@end