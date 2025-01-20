@interface GKProcessExiter
+ (void)cleanExitWith:(id)a3;
- (GKProcessExiter)init;
@end

@implementation GKProcessExiter

+ (void)cleanExitWith:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1001CD820(v3, v4);
}

- (GKProcessExiter)init
{
  return (GKProcessExiter *)ScopedIDsUtils.init()();
}

@end