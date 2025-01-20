@interface ProvisioningHeroFlowItem
- (_TtC9PassKitUI24ProvisioningHeroFlowItem)init;
- (void)heroViewControllerDidRequestTransferBalance:(id)a3;
- (void)heroViewControllerDidSelectContinue:(id)a3;
- (void)heroViewControllerDidSelectSetupLater:(id)a3;
@end

@implementation ProvisioningHeroFlowItem

- (_TtC9PassKitUI24ProvisioningHeroFlowItem)init
{
  result = (_TtC9PassKitUI24ProvisioningHeroFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI24ProvisioningHeroFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)heroViewControllerDidRequestTransferBalance:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F86082C();
}

- (void)heroViewControllerDidSelectContinue:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v9[4] = sub_19F860B84;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1107296256;
  v9[2] = sub_19F4F10AC;
  v9[3] = &block_descriptor_17_0;
  v6 = _Block_copy(v9);
  v7 = self;
  id v8 = a3;
  swift_release();
  PKRequestContactAccessWithCompletion();
  _Block_release(v6);
}

- (void)heroViewControllerDidSelectSetupLater:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19F860A9C();
}

@end