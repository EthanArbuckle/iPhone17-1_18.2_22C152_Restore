@interface NearbyPeerPaymentVFXViewController
- (BOOL)_canShowWhileLocked;
- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)init;
- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)initWithCoder:(id)a3;
- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NearbyPeerPaymentVFXViewController

- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)init
{
  return (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController *)NearbyPeerPaymentVFXViewController.init()();
}

- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19FA16CF0();
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXViewController();
  v2 = (char *)v5.receiver;
  [(NearbyPeerPaymentVFXViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(void *)&v2[OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_vfxView]);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_19FA157F0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_19FA15D08(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXViewController();
  v4 = v5.receiver;
  [(NearbyPeerPaymentVFXViewController *)&v5 viewDidDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_motionManager], sel_stopDeviceMotionUpdates, v5.receiver, v5.super_class);
  v4[OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_isMonitoringMotion] = 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9PassKitUI34NearbyPeerPaymentVFXViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_amount));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_vfxView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_camera));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_world));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_ambientEmitter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_nodeBindings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_unknownAmountEmitter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_digitRoot));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_digitTemplate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_transferStatusParticles));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_blueRing));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_blueRingParticles));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_transferParticlesBurstA));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_transferParticlesBurstB));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_pulsingGradient));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_motionManager));

  swift_release();
}

@end