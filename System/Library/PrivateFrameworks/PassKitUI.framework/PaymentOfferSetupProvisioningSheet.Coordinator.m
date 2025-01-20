@interface PaymentOfferSetupProvisioningSheet.Coordinator
- (PKUIFlowManagerRendererDelegate)flowDelegate;
- (_TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator)init;
- (id)createChildRenderer;
- (id)navViewControllers;
- (id)rootViewController;
- (void)dismissWithViewController:(id)a3 animated:(BOOL)a4;
- (void)presentWithViewController:(id)a3 animated:(BOOL)a4;
- (void)pushWithViewController:(id)a3 animated:(BOOL)a4;
- (void)setFlowDelegate:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation PaymentOfferSetupProvisioningSheet.Coordinator

- (PKUIFlowManagerRendererDelegate)flowDelegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (PKUIFlowManagerRendererDelegate *)v2;
}

- (void)setFlowDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_flowDelegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)pushWithViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)presentWithViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)dismissWithViewController:(id)a3 animated:(BOOL)a4
{
}

- (id)navViewControllers
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_viewControllers);
  sub_19F7A2F04();
  sub_1A03B4C58();

  v5 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  sub_19F7A2F04();
  sub_1A03B4C58();
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController);
  v7 = self;
  id v8 = (id)sub_1A03B4C38();
  objc_msgSend(v6, sel_setViewControllers_animated_, v8, v4);

  swift_bridgeObjectRelease();
}

- (id)rootViewController
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController), sel_rootViewController);

  return v2;
}

- (id)createChildRenderer
{
  id v2 = self;
  v3 = (void *)sub_19FABA24C();

  return v3;
}

- (_TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator)init
{
  result = (_TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19FABB500((uint64_t)self + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_provisioningData, (uint64_t (*)(void))type metadata accessor for PaymentOfferSetupProvisioningMetadata);
  swift_bridgeObjectRelease();
  sub_19F5CC838((uint64_t)self + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_cardArtURL);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_paymentOffersController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI34PaymentOfferSetupProvisioningSheet11Coordinator_navigationController));
  swift_release();

  swift_unknownObjectRelease();
}

@end