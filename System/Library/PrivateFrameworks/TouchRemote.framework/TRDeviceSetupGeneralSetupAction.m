@interface TRDeviceSetupGeneralSetupAction
- (BOOL)isDiagnosticsEnabled;
- (BOOL)rememberPassword;
- (NSString)countryCode;
- (NSString)homeSharingGroupID;
- (NSString)homeSharingID;
- (NSString)language;
- (TRDeviceSetupGeneralSetupAction)init;
- (TRDeviceSetupGeneralSetupAction)initWithCountryCode:(id)a3 language:(id)a4 homeSharingID:(id)a5 homeSharingGroupID:(id)a6 isDiagnosticsEnabled:(BOOL)a7 rememberPassword:(BOOL)a8;
@end

@implementation TRDeviceSetupGeneralSetupAction

- (TRDeviceSetupGeneralSetupAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupGeneralSetupAction;
  return (TRDeviceSetupGeneralSetupAction *)[(TRDeviceSetupAction *)&v3 _initWithActionType:@"setup" parameters:0];
}

- (TRDeviceSetupGeneralSetupAction)initWithCountryCode:(id)a3 language:(id)a4 homeSharingID:(id)a5 homeSharingGroupID:(id)a6 isDiagnosticsEnabled:(BOOL)a7 rememberPassword:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v19 = v18;
  if (v14) {
    [v18 setObject:v14 forKeyedSubscript:@"c"];
  }
  if (v15) {
    [v19 setObject:v15 forKeyedSubscript:@"l"];
  }
  if (v16) {
    [v19 setObject:v16 forKeyedSubscript:@"ha"];
  }
  if (v17) {
    [v19 setObject:v17 forKeyedSubscript:@"hg"];
  }
  v20 = [NSNumber numberWithBool:v9];
  [v19 setObject:v20 forKeyedSubscript:@"di"];

  v21 = [NSNumber numberWithBool:v8];
  [v19 setObject:v21 forKeyedSubscript:@"rp"];

  v24.receiver = self;
  v24.super_class = (Class)TRDeviceSetupGeneralSetupAction;
  v22 = [(TRDeviceSetupAction *)&v24 _initWithActionType:@"setup" parameters:v19];

  return v22;
}

- (NSString)countryCode
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"c"];

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

- (NSString)language
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"l"];

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

- (NSString)homeSharingID
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"ha"];

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

- (NSString)homeSharingGroupID
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"hg"];

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

- (BOOL)isDiagnosticsEnabled
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"a"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)rememberPassword
{
  v2 = [(TRDeviceSetupAction *)self parameters];
  objc_super v3 = [v2 objectForKeyedSubscript:@"a"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

@end