@interface SBCameraHardwareButtonDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBCameraHardwareButtonDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"shutterButtonLongPressTimeout"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBCameraShutterButtonLongPressTimeout" toDefaultValue:&unk_1ED89F0D8 options:1];

  v4 = [NSString stringWithUTF8String:"shutterButtonLongPressCancellationTimeout"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBCameraShutterButtonLongPressCancellationTimeout" toDefaultValue:&unk_1ED89F0E8 options:1];

  id v5 = [NSString stringWithUTF8String:"shutterButtonShouldUsePocketDetection"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBCameraShutterButtonShouldUsePocketDetection" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end