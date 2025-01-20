@interface QRCodeOverlayViewController
- (_TtC11MusicCoreUI27QRCodeOverlayViewController)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI27QRCodeOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissAnimated;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation QRCodeOverlayViewController

- (_TtC11MusicCoreUI27QRCodeOverlayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_95272C();
}

- (void)viewDidLoad
{
  v2 = self;
  QRCodeOverlayViewController.viewDidLoad()();
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  QRCodeOverlayViewController.viewIsAppearing(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  QRCodeOverlayViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  QRCodeOverlayViewController.viewDidLayoutSubviews()();
}

- (void)dismissAnimated
{
  v2 = self;
  QRCodeOverlayViewController.dismissAnimated()();
}

- (_TtC11MusicCoreUI27QRCodeOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MusicCoreUI27QRCodeOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCodeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_destOutLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_logoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_subtitleLabelEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCodeBackgroundView));
  id v3 = *(void **)&self->destOutLayer[OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCode];
  sub_4B668(*(void *)&self->backgroundView[OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCode], *(void *)&self->qrCodeView[OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_qrCode]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI27QRCodeOverlayViewController_scrollContentView));

  swift_release();
}

@end