@interface PKNearbyPeerPaymentSenderViewController
- (PKNearbyPeerPaymentSenderViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5;
- (PKNearbyPeerPaymentSenderViewController)initWithUserInfo:(id)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5;
- (int64_t)modalPresentationStyle;
- (int64_t)modalTransitionStyle;
- (int64_t)overrideUserInterfaceStyle;
- (void)applicationDidBecomeActive;
- (void)debugViewTapped;
- (void)invalidate;
- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setModalTransitionStyle:(int64_t)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PKNearbyPeerPaymentSenderViewController

- (PKNearbyPeerPaymentSenderViewController)initWithUserInfo:(id)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  v6 = _Block_copy(a4);
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1A03B47F8();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v7;
  v11 = sub_19FCF920C(v8, (uint64_t)sub_19F5789D8, v9, (uint64_t)sub_19F674F38, v10);
  swift_release();
  swift_release();
  return (PKNearbyPeerPaymentSenderViewController *)v11;
}

- (void)applicationDidBecomeActive
{
  v2 = self;
  sub_19FCF5614();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_19FCF5EA4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_19FCF6484(a3, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_19FCF6484(a3, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_19FCF661C();
}

- (void)debugViewTapped
{
  v3 = (char *)self + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor;
  swift_beginAccess();
  sub_19F4A1BB4((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 88);
  v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)peerPaymentIdentityManager:(id)a3 didUpdateProfileAppearanceData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_19F797D74(v7);
  uint64_t v9 = (uint64_t)v8 + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor;
  swift_beginAccess();
  sub_19F4A1BB4(v9, (uint64_t)v12);
  uint64_t v10 = v13;
  uint64_t v11 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  (*(void (**)(id, uint64_t, uint64_t))(v11 + 96))(v7, v10, v11);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

- (int64_t)modalTransitionStyle
{
  return 2;
}

- (void)setModalTransitionStyle:(int64_t)a3
{
}

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
}

- (void)invalidate
{
  v3 = (char *)self + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor;
  swift_beginAccess();
  sub_19F4A1BB4((uint64_t)v3, (uint64_t)v8);
  uint64_t v4 = v9;
  uint64_t v5 = v10;
  __swift_project_boxed_opaque_existential_1(v8, v9);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  id v7 = self;
  v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (PKNearbyPeerPaymentSenderViewController)initWithContext:(int64_t)a3 screenEdgeSwipeAction:(id)a4 dismissAction:(id)a5
{
  id v6 = _Block_copy(a4);
  id v7 = _Block_copy(a5);
  _Block_release(v6);
  _Block_release(v7);
  result = (PKNearbyPeerPaymentSenderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_monitor);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PKNearbyPeerPaymentSenderViewController_spinnerStateLabels);
}

@end