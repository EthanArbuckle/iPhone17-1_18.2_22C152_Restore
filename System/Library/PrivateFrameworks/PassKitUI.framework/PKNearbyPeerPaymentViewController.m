@interface PKNearbyPeerPaymentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hideStatusBar;
- (BOOL)prefersStatusBarHidden;
- (PKNearbyPeerPaymentViewController)initWithCoder:(id)a3;
- (PKNearbyPeerPaymentViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5;
- (PKNearbyPeerPaymentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)handlePan:(id)a3;
- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setHideStatusBar:(BOOL)a3;
- (void)showAppearanceDetail;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKNearbyPeerPaymentViewController

- (BOOL)hideStatusBar
{
  v2 = (BOOL *)self + OBJC_IVAR___PKNearbyPeerPaymentViewController_hideStatusBar;
  swift_beginAccess();
  return *v2;
}

- (void)setHideStatusBar:(BOOL)a3
{
  v4 = self;
  sub_19F795D24(a3);
}

- (PKNearbyPeerPaymentViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  return (PKNearbyPeerPaymentViewController *)NearbyPeerPaymentViewController.init(context:screenEdgeSwipeAction:dismissAction:)(a3, (uint64_t)sub_19F5789D8, v9, (uint64_t)sub_19F674F38, v10);
}

- (PKNearbyPeerPaymentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19F798784();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19F7968A4();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_19F796D18();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)showAppearanceDetail
{
  v2 = self;
  sub_19F795FB0();
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)3) {
    (*(void (**)(void))((char *)&v5->super.super.super.isa
  }
                      + OBJC_IVAR___PKNearbyPeerPaymentViewController_screenEdgeSwipeAction))();
}

- (BOOL)prefersStatusBarHidden
{
  v2 = (BOOL *)self + OBJC_IVAR___PKNearbyPeerPaymentViewController_hideStatusBar;
  swift_beginAccess();
  return *v2;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19F797D74(v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKNearbyPeerPaymentViewController_divider);
  id v5 = a3;
  v8 = self;
  objc_msgSend(v5, sel_contentOffset);
  double v6 = 0.0;
  if (v7 > 0.0) {
    double v6 = 1.0;
  }
  objc_msgSend(v4, sel_setAlpha_, v6);
}

- (PKNearbyPeerPaymentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PKNearbyPeerPaymentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentViewController_vfxViewController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentViewController_identityManager));

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end