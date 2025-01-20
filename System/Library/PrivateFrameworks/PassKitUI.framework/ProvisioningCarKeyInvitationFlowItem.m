@interface ProvisioningCarKeyInvitationFlowItem
- (_TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem)init;
- (void)carKeyInvitationViewController:(id)a3 didEnterActivationCode:(id)a4;
- (void)carKeyInvitationViewControllerDidCancel:(id)a3;
- (void)carKeyInvitationViewControllerDidRequestStart:(id)a3;
@end

@implementation ProvisioningCarKeyInvitationFlowItem

- (_TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem)init
{
  result = (_TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_credential));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)carKeyInvitationViewControllerDidRequestStart:(id)a3
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator);
  if (v3)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F84C88]);
    id v7 = a3;
    v8 = self;
    id v9 = v3;
    id v10 = objc_msgSend(v6, sel_init);
    sub_19F704D44(v10);
  }
}

- (void)carKeyInvitationViewControllerDidCancel:(id)a3
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator);
  if (v3)
  {
    id v5 = a3;
    id v6 = self;
    id v7 = v3;
    sub_19F705C34();
  }
}

- (void)carKeyInvitationViewController:(id)a3 didEnterActivationCode:(id)a4
{
  uint64_t v6 = sub_1A03B4988();
  uint64_t v8 = v7;
  id v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator);
  if (v9)
  {
    uint64_t v10 = v6;
    id v11 = a3;
    v12 = self;
    id v13 = v9;
    sub_19F705F8C(v10, v8);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end