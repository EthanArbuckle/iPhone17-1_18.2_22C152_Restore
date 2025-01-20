@interface NearbyPeerPaymentSenderVFXViewController
- (_TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController)init;
@end

@implementation NearbyPeerPaymentSenderVFXViewController

- (_TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_state;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_animationDelegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v5 = [(NearbyPeerPaymentVFXViewController *)&v9 init];
  v6 = *(Class *)((char *)&v5->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI34NearbyPeerPaymentVFXViewController_unknownAmountEmitter);
  v7 = v5;
  objc_msgSend(v6, sel_removeFromParentNode);
  sub_19FBF4F38();

  return v7;
}

- (void).cxx_destruct
{
  sub_19F4F1288((uint64_t)self + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_state);
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI40NearbyPeerPaymentSenderVFXViewController_animationDelegate;

  sub_19F482DB0((uint64_t)v3);
}

@end