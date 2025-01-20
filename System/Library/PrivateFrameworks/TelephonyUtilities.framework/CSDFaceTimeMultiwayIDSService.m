@interface CSDFaceTimeMultiwayIDSService
+ (CSDFaceTimeMultiwayIDSService)sharedInstance;
- (CSDFaceTimeMultiwayIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDFaceTimeMultiwayIDSService

+ (CSDFaceTimeMultiwayIDSService)sharedInstance
{
  id v2 = sub_10023C6A4();

  return (CSDFaceTimeMultiwayIDSService *)v2;
}

- (CSDFaceTimeMultiwayIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDFaceTimeMultiwayIDSService *)sub_10023C700(v7, v8, a4, a5);
}

@end