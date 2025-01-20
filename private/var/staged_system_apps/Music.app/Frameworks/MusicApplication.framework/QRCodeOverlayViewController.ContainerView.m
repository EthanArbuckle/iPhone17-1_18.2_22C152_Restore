@interface QRCodeOverlayViewController.ContainerView
- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithCoder:(id)a3;
- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateColor;
@end

@implementation QRCodeOverlayViewController.ContainerView

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithFrame:(CGRect)a3
{
  return (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView *)sub_951738(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11MusicCoreUI27QRCodeOverlayViewController13ContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_952990();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for QRCodeOverlayViewController.ContainerView();
  id v2 = v4.receiver;
  [(QRCodeOverlayViewController.ContainerView *)&v4 layoutSubviews];
  sub_173E4(0, &qword_DFA8E8);
  *(void *)(swift_allocObject() + 16) = v2;
  id v3 = v2;
  static CATransaction.performWithoutAnimation(_:)((void (*)(id))sub_952AE0);

  swift_release();
}

- (void)updateColor
{
  id v2 = self;
  sub_951D14();
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