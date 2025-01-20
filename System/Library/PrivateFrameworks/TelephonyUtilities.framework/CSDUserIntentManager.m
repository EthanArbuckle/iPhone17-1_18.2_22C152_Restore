@interface CSDUserIntentManager
- (BOOL)validateUserIntentForCallSource:(id)a3;
- (CSDUserIntentManager)init;
- (CSDUserIntentManager)initWithQueue:(id)a3;
- (void)donateUserIntentForCallProviderIdentifier:(id)a3;
@end

@implementation CSDUserIntentManager

- (CSDUserIntentManager)initWithQueue:(id)a3
{
  return (CSDUserIntentManager *)sub_10020348C(a3);
}

- (void)donateUserIntentForCallProviderIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_10020378C(v4, v6);

  swift_bridgeObjectRelease();
}

- (BOOL)validateUserIntentForCallSource:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_100203908(v4);

  return self & 1;
}

- (CSDUserIntentManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___CSDUserIntentManager_mediaRemoteStateValidator;

  sub_1002045A0((uint64_t)v3);
}

@end