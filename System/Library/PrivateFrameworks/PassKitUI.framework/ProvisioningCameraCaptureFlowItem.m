@interface ProvisioningCameraCaptureFlowItem
- (_TtC9PassKitUI33ProvisioningCameraCaptureFlowItem)init;
- (void)cameraCaptureViewController:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraCaptureViewControllerDidSelectManualEntry:(id)a3;
- (void)cameraCaptureViewControllerDidSelectSetupLater:(id)a3;
- (void)cameraCaptureViewControllerDidSelectTapToProvision:(id)a3;
@end

@implementation ProvisioningCameraCaptureFlowItem

- (_TtC9PassKitUI33ProvisioningCameraCaptureFlowItem)init
{
  result = (_TtC9PassKitUI33ProvisioningCameraCaptureFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection);
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)cameraCaptureViewController:(id)a3 didRecognizeObjects:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_1A03B4C58();
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection);
  id v9 = a3;
  if (v7)
  {
    v8 = self;
    sub_19F8B8B20((uint64_t)v8, v6, v7);

    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (void)cameraCaptureViewControllerDidSelectManualEntry:(id)a3
{
  uint64_t v5 = MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = a3;
    v8 = self;
    sub_19F8B8B20((uint64_t)v8, 0, v6);

    swift_unknownObjectRelease();
  }
}

- (void)cameraCaptureViewControllerDidSelectSetupLater:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_19F8B8C70();
}

- (void)cameraCaptureViewControllerDidSelectTapToProvision:(id)a3
{
  uint64_t v5 = MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI33ProvisioningCameraCaptureFlowItem_managingSection, a2);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = a3;
    v8 = self;
    sub_19FA38BD0((uint64_t)v8, 2u, v6);

    swift_unknownObjectRelease();
  }
}

@end