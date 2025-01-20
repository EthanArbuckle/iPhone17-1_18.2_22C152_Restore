@interface CSDFaceTimeLivePhotosIDSService
+ (CSDFaceTimeLivePhotosIDSService)sharedInstance;
- (CSDFaceTimeLivePhotosIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDFaceTimeLivePhotosIDSService

+ (CSDFaceTimeLivePhotosIDSService)sharedInstance
{
  id v2 = sub_1002394E4();

  return (CSDFaceTimeLivePhotosIDSService *)v2;
}

- (CSDFaceTimeLivePhotosIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDFaceTimeLivePhotosIDSService *)sub_100239540(v7, v8, a4, a5);
}

@end