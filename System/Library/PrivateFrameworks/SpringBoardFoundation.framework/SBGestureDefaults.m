@interface SBGestureDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBGestureDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"multitaskingGesturesRequireEducation"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBGestureRequiresEducation-Multitasking" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"systemGesturesAllowed"];
  uint64_t v6 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBUseSystemGestures" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v7 = [NSString stringWithUTF8String:"productivityGesturesRequireEducation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBGestureRequiresEducation-Productivity" toDefaultValue:v4 options:1];

  v8 = [NSString stringWithUTF8String:"productivityGesturesAllowed"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBProductivityGesturesAllowed" toDefaultValue:v6 options:1];

  id v9 = [NSString stringWithUTF8String:"systemGestureLoggingOptions"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBSystemGestureLogging" toDefaultValue:0 options:1];
}

@end