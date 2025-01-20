@interface ProvisioningCarKeyStepTransact
- (_TtC11PassKitCore30ProvisioningCarKeyStepTransact)init;
- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContext:(id)a4;
- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4;
- (void)contactlessInterfaceSessionDidTerminate:(id)a3;
- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4;
@end

@implementation ProvisioningCarKeyStepTransact

- (_TtC11PassKitCore30ProvisioningCarKeyStepTransact)init
{
  result = (_TtC11PassKitCore30ProvisioningCarKeyStepTransact *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_190E7E498(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential), *(void *)&self->context[OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential], *(void *)&self->credential[OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential], self->credential[OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_credential + 8]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_sharedState));
  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_commonCompletion));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore30ProvisioningCarKeyStepTransact_sessionHandle));

  swift_unknownObjectRelease();
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_errorWithSeverity_, 4);
  sub_190FDCA68(v8);
}

- (void)contactlessInterfaceSessionDidTerminate:(id)a3 withErrorCode:(unint64_t)a4
{
  id v6 = self;
  id v7 = a3;
  id v8 = self;
  id v9 = objc_msgSend(v6, sel_errorWithSeverity_, 4);
  sub_190FDCA68(v9);
}

- (void)contactlessInterfaceSession:(id)a3 didFinishTransactionWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_190FDEAE8(a4);
}

- (void)contactlessInterfaceSession:(id)a3 didEndPersistentCardEmulationWithContext:(id)a4
{
  id v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = objc_msgSend(v7, sel_errorWithSeverity_, 4);
  sub_190FDCA68(v11);
}

@end