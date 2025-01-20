@interface ProvisioningCarKeyStepFindReader
- (_TtC11PassKitCore32ProvisioningCarKeyStepFindReader)init;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4;
- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5;
- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4;
- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
@end

@implementation ProvisioningCarKeyStepFindReader

- (_TtC11PassKitCore32ProvisioningCarKeyStepFindReader)init
{
  result = (_TtC11PassKitCore32ProvisioningCarKeyStepFindReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_190E7E498(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential), *(void *)&self->context[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential], *(void *)&self->credential[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential], self->credential[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_credential + 8]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_sharedState));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_carConfiguration));
  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_commonCompletion));

  sub_190E14B50(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_bindingAttestation), *(void *)&self->context[OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_bindingAttestation]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC11PassKitCore32ProvisioningCarKeyStepFindReader_onDidStartPairing);
  sub_190EF6480(v3);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_190E14B80(a4);
  swift_unknownObjectRelease();
}

- (void)appletSubcredentialPairingSessionDidBeginPairing:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s11PassKitCore32ProvisioningCarKeyStepFindReaderC041appletSubcredentialPairingSessionDidBeginL0yySo08PKAppletklM0CSgF_0();
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithSubcredential:(id)a4 registrationData:(id)a5
{
  if (a4)
  {
    id v8 = a3;
    id v9 = a5;
    v11 = self;
    id v10 = a4;
    objc_msgSend(v10, sel_setTrackingRequest_, v9);
    sub_190F65344(a4, 0);
  }
  else
  {
    __break(1u);
  }
}

- (void)appletSubcredentialPairingSession:(id)a3 didEndPairingWithError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_190F66BC8(a4);
}

- (void)appletSubcredentialPairingSession:(id)a3 didFinishPreWarmWithResult:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_190F66DC0(a4);
}

@end