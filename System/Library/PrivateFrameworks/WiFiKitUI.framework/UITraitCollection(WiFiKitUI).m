@interface UITraitCollection(WiFiKitUI)
- (uint64_t)isLargeTextTraitCollection;
@end

@implementation UITraitCollection(WiFiKitUI)

- (uint64_t)isLargeTextTraitCollection
{
  v2 = [a1 preferredContentSizeCategory];
  v3 = (void *)*MEMORY[0x263F83418];

  if (v2 == v3) {
    return 1;
  }
  v4 = [a1 preferredContentSizeCategory];
  v5 = (void *)*MEMORY[0x263F83410];

  if (v4 == v5) {
    return 1;
  }
  v6 = [a1 preferredContentSizeCategory];
  v7 = (void *)*MEMORY[0x263F83408];

  if (v6 == v7) {
    return 1;
  }
  v8 = [a1 preferredContentSizeCategory];
  v9 = (void *)*MEMORY[0x263F83400];

  if (v8 == v9) {
    return 1;
  }
  v10 = [a1 preferredContentSizeCategory];
  BOOL v11 = v10 == (void *)*MEMORY[0x263F83430];

  return v11;
}

@end