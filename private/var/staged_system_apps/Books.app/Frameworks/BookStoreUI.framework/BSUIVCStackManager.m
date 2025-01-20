@interface BSUIVCStackManager
+ (void)present:(id)a3 :(BOOL)a4 :(id)a5;
- (BSUIVCStackManager)init;
@end

@implementation BSUIVCStackManager

+ (void)present:(id)a3 :(BOOL)a4 :(id)a5
{
  uint64_t v7 = sub_2E4350();
  id v8 = a3;
  _s11BookStoreUI14VCStackManagerC7presentyySo16UIViewControllerC_SbSDys11AnyHashableVypGtFZ_0(v8, a4, v7);

  swift_bridgeObjectRelease();
}

- (BSUIVCStackManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VCStackManager();
  return [(BSUIVCStackManager *)&v3 init];
}

@end