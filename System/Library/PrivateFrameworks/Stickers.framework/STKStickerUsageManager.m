@interface STKStickerUsageManager
+ (STKStickerUsageManager)sharedManager;
- (STKStickerUsageManager)init;
- (unint64_t)stickerCountsForBundleIdentifier:(id)a3;
- (void)logStickerWithStickerIdentifier:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation STKStickerUsageManager

- (STKStickerUsageManager)init
{
  return (STKStickerUsageManager *)sub_25E41FE74();
}

+ (STKStickerUsageManager)sharedManager
{
  if (qword_26B388CF0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B388CE8;
  return (STKStickerUsageManager *)v2;
}

- (void)logStickerWithStickerIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5 = sub_25E4258F0();
  unint64_t v7 = v6;
  uint64_t v8 = sub_25E4258F0();
  unint64_t v10 = v9;
  v11 = self;
  sub_25E4206DC(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (unint64_t)stickerCountsForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_25E4258F0();
  uint64_t v6 = v5;
  unint64_t v7 = self;
  unint64_t v8 = sub_25E420CD4(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___STKStickerUsageManager_dictionary;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B388D20);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___STKStickerUsageManager_serializationLocation;
  uint64_t v6 = sub_25E425390();
  unint64_t v8 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v8)((void *)(v6 - 8), v5, v6);
  unint64_t v7 = (char *)self + OBJC_IVAR___STKStickerUsageManager_serializationContextLocation;
  v8(v7, v6);
}

@end