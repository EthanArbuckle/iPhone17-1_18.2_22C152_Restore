@interface PKNearbyPeerPaymentReceiverViewController
- (BOOL)_canShowWhileLocked;
- (PKNearbyPeerPaymentReceiverViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5;
- (PKNearbyPeerPaymentReceiverViewController)initWithUserInfo:(id)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5;
- (void)invalidate;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4;
- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKNearbyPeerPaymentReceiverViewController

- (PKNearbyPeerPaymentReceiverViewController)initWithUserInfo:(id)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  v8 = (void *)sub_1A03B47F8();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  sub_19F673878(v8, (uint64_t)sub_19F5789D8, v9, (uint64_t)sub_19F674F38, v10);
  v12 = v11;
  swift_release();
  swift_release();
  return v12;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentReceiverViewController();
  id v2 = v5.receiver;
  [(PKNearbyPeerPaymentViewController *)&v5 viewDidLoad];
  type metadata accessor for NearbyPeerPaymentReceiverVFXViewController();
  uint64_t v3 = swift_dynamicCastClass();
  if (v3)
  {
    uint64_t v4 = v3 + OBJC_IVAR____TtC9PassKitUI42NearbyPeerPaymentReceiverVFXViewController_animationDelegate;
    swift_beginAccess();
    *(void *)(v4 + 8) = &protocol witness table for NearbyPeerPaymentReceiverViewController;
    swift_unknownObjectWeakAssign();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_19F66E6D8(a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_19F66E6D8(a3, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_19F66E89C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  uint64_t v3 = (char *)self + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_transferMonitor;
  swift_beginAccess();
  sub_19F4A1BB4((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_19F797D74(v7);
  uint64_t v9 = (uint64_t)v8 + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_transferMonitor;
  swift_beginAccess();
  uint64_t v10 = *(void *)(v9 + 24);
  uint64_t v11 = *(void *)(v9 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v9, v10);
  v12 = *(void (**)(id, uint64_t, uint64_t))(v11 + 72);
  id v13 = v7;
  v12(v7, v10, v11);
  swift_endAccess();
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
  if (a4) {
    [(PKNearbyPeerPaymentReceiverViewController *)self presentViewController:a4 animated:1 completion:0];
  }
  else {
    __break(1u);
  }
}

- (void)peerPaymentAccountResolutionController:(id)a3 requestsDismissCurrentViewControllerAnimated:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_19F6745F0(a3);
}

- (PKNearbyPeerPaymentReceiverViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  id v6 = _Block_copy(a4);
  id v7 = _Block_copy(a5);
  _Block_release(v6);
  _Block_release(v7);
  result = (PKNearbyPeerPaymentReceiverViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_peerPaymentAccount));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_transferMonitor);
  sub_19F674C50((uint64_t)self + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_state, type metadata accessor for NearbyPeerPaymentReceiverState);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentReceiverViewController_accountResolutionController));

  swift_unknownObjectRelease();
}

@end