@interface CSDProtectedAppsUtilities
- (BOOL)shouldBlockCallWithBundleIdentifier:(id)a3;
- (CSDProtectedAppsUtilities)init;
@end

@implementation CSDProtectedAppsUtilities

- (CSDProtectedAppsUtilities)init
{
  return (CSDProtectedAppsUtilities *)sub_1002F6AD4();
}

- (BOOL)shouldBlockCallWithBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1002F6DBC(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void).cxx_destruct
{
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDProtectedAppsUtilities_protectedAppsObserver);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end