@interface CSDFaceTimeSyncIDSService
+ (CSDFaceTimeSyncIDSService)sharedInstance;
- (CSDFaceTimeSyncIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDFaceTimeSyncIDSService

+ (CSDFaceTimeSyncIDSService)sharedInstance
{
  id v2 = sub_1002EA384();

  return (CSDFaceTimeSyncIDSService *)v2;
}

- (CSDFaceTimeSyncIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDFaceTimeSyncIDSService *)sub_1002EA3E0(v7, v8, a4, a5);
}

@end