@interface CSDTinCanIDSService
+ (CSDTinCanIDSService)sharedInstance;
- (CSDTinCanIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
@end

@implementation CSDTinCanIDSService

+ (CSDTinCanIDSService)sharedInstance
{
  id v2 = sub_1002B8538();

  return (CSDTinCanIDSService *)v2;
}

- (CSDTinCanIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDTinCanIDSService *)sub_1002B8604(v7, v8, a4, a5);
}

@end