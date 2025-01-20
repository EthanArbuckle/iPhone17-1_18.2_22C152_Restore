@interface TRDeviceSetupConnectAction
- (NSString)deviceName;
- (NSString)networkPassword;
- (NSString)networkSSID;
- (TRDeviceSetupConnectAction)init;
- (TRDeviceSetupConnectAction)initWithDeviceName:(id)a3 networkSSID:(id)a4 networkPassword:(id)a5;
@end

@implementation TRDeviceSetupConnectAction

- (TRDeviceSetupConnectAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupConnectAction;
  return (TRDeviceSetupConnectAction *)[(TRDeviceSetupAction *)&v3 _initWithActionType:@"connect" parameters:0];
}

- (TRDeviceSetupConnectAction)initWithDeviceName:(id)a3 networkSSID:(id)a4 networkPassword:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v12 = v11;
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:@"d"];
  }
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:@"ns"];
  }
  if (v10) {
    [v12 setObject:v10 forKeyedSubscript:@"np"];
  }
  v15.receiver = self;
  v15.super_class = (Class)TRDeviceSetupConnectAction;
  v13 = [(TRDeviceSetupAction *)&v15 _initWithActionType:@"connect" parameters:v12];

  return v13;
}

- (NSString)deviceName
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"d"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSString)networkSSID
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"ns"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

- (NSString)networkPassword
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"np"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return (NSString *)v5;
}

@end