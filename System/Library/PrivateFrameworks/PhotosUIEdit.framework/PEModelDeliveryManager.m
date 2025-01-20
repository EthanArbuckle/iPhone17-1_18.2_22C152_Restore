@interface PEModelDeliveryManager
- (BOOL)isModelAvailable;
- (BOOL)ready;
- (PEModelDeliveryManager)init;
- (PEModelDeliveryManager)initWithPackageType:(unint64_t)a3;
- (id)packageURLs;
- (void)preparePackageWithProgress:(id)a3 updateHandler:(id)a4;
- (void)stopNetworkMonitoring;
@end

@implementation PEModelDeliveryManager

- (PEModelDeliveryManager)initWithPackageType:(unint64_t)a3
{
  return (PEModelDeliveryManager *)sub_217B96E50(a3);
}

- (void)stopNetworkMonitoring
{
  v2 = self;
  sub_217B97D7C();
}

- (BOOL)ready
{
  return sub_217B97E38();
}

- (BOOL)isModelAvailable
{
  v2 = self;
  char v3 = sub_217B97E78();

  return v3 & 1;
}

- (void)preparePackageWithProgress:(id)a3 updateHandler:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  sub_217B97EF4((uint64_t)sub_217B9DD8C, v8, (uint64_t)sub_217B9DDA0, v9);

  swift_release();
  swift_release();
}

- (id)packageURLs
{
  v2 = self;
  uint64_t v3 = sub_217B98CC8();

  if (v3)
  {
    sub_217BD7890();
    v4 = (void *)sub_217BD8AC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (PEModelDeliveryManager)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PEModelDeliveryManager_packageHelper);
  swift_release();
  sub_217B9DDA8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PEModelDeliveryManager_updateHandler));
  swift_release();
}

@end