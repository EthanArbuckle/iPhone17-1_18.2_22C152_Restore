@interface SBVoiceControlDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBVoiceControlDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"disableVoiceControlForBluetoothRequests"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBJibblerBluetoothDisabled" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"disableHandlerActions"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBVoiceControlDisableHandlerActions" toDefaultValue:v4 options:1];

  id v6 = [NSString stringWithUTF8String:"voiceControlLoggingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBJibblerLogging" toDefaultValue:v4 options:1];
}

@end