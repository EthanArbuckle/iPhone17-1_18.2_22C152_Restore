@interface UIApplication
- (NSString)_extendLaunchTest;
- (void)observeExtendedLaunchTestCompletion;
- (void)onExtendedLaunchCompleted;
@end

@implementation UIApplication

- (NSString)_extendLaunchTest
{
  uint64_t v3 = sub_1007FA2A0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007FA630();
  v7 = self;
  sub_1007FA610();
  sub_1007FA290();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v8 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (void)observeExtendedLaunchTestCompletion
{
  v2 = self;
  UIApplication.observeExtendedLaunchTestCompletion()();
}

- (void)onExtendedLaunchCompleted
{
  v2 = self;
  sub_10002B4F0();
}

@end