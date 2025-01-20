@interface ProvisioningDeviceFullFlowItem
- (_TtC9PassKitUI30ProvisioningDeviceFullFlowItem)init;
- (void)selectPassesViewController:(id)a3 didSelectPasses:(id)a4 completion:(id)a5;
- (void)selectPassesViewControllerDidTapBackButton:(id)a3;
@end

@implementation ProvisioningDeviceFullFlowItem

- (_TtC9PassKitUI30ProvisioningDeviceFullFlowItem)init
{
  result = (_TtC9PassKitUI30ProvisioningDeviceFullFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI30ProvisioningDeviceFullFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)selectPassesViewController:(id)a3 didSelectPasses:(id)a4 completion:(id)a5
{
  v8 = (void (*)(void))_Block_copy(a5);
  if (a4)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94B6590);
    a4 = (id)sub_1A03B4C58();
  }
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = (void (*)(void))sub_19F5789D8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_19FC11BDC((unint64_t)a4, v8, v9);
  sub_19F48BB68((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)selectPassesViewControllerDidTapBackButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FC120A8();
}

@end