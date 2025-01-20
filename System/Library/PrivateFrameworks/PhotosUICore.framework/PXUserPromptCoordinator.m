@interface PXUserPromptCoordinator
+ (void)schedulePromptWithIdentifier:(id)a3 action:(id)a4;
- (PXUserPromptCoordinator)init;
@end

@implementation PXUserPromptCoordinator

+ (void)schedulePromptWithIdentifier:(id)a3 action:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  sub_1AB23AD0C();
  v9[2] = v5;
  v9[3] = v7;
  v9[4] = sub_1A9F5BFDC;
  v9[5] = v8;
  sub_1A9B19E98((uint64_t)sub_1A9F5C620, (uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_release();
}

- (PXUserPromptCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXUserPromptCoordinator;
  return [(PXUserPromptCoordinator *)&v3 init];
}

@end