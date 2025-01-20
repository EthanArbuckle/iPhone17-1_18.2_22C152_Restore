@interface ProvisioningPushProvAddPassFlowItem
- (_TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem)init;
- (void)cancel;
- (void)continueProvisioning;
- (void)pushableViewController:(id)a3 didFailWithError:(id)a4;
- (void)startProvisioningWithConfiguration:(id)a3;
- (void)startProvisioningWithCredentials:(id)a3;
@end

@implementation ProvisioningPushProvAddPassFlowItem

- (_TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem)init
{
  result = (_TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_coordinator));
  swift_weakDestroy();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)startProvisioningWithConfiguration:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_19FC14E64(a3);
  swift_unknownObjectRelease();
}

- (void)startProvisioningWithCredentials:(id)a3
{
  sub_19F48BAC4(0, (unint64_t *)&unk_1E94B4B70);
  unint64_t v4 = sub_1A03B4C58();
  v5 = self;
  sub_19FC15318(v4);

  swift_bridgeObjectRelease();
}

- (void)continueProvisioning
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_coordinator);
  if (v2)
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4F84C88]);
    v5 = self;
    id v6 = v2;
    id v7 = objc_msgSend(v4, sel_init);
    sub_19FBA451C(v7);
  }
}

- (void)cancel
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_coordinator);
  if (v2)
  {
    v3 = self;
    id v4 = v2;
    sub_19FBA51C8();
  }
}

- (void)pushableViewController:(id)a3 didFailWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  id v7 = a4;
  sub_19FC16504(a4);
  swift_unknownObjectRelease();
}

@end