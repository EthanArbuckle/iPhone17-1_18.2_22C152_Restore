@interface SBBootDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBBootDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"lastSystemBuildVersion"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBLastSystemVersion" toDefaultValue:0 options:1];

  v4 = [NSString stringWithUTF8String:"lastRestoreIdentifier"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBLastRestoreIdentifier" toDefaultValue:0 options:1];

  v5 = [NSString stringWithUTF8String:"hasCompletedSynchronizingCloudCriticalData"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBHasCompletedSynchronizingCloudCriticalData" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v7 = [NSString stringWithUTF8String:"bootTransitionContext"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBBootTransitionContext" toDefaultValue:0 options:4];

  v8 = [NSString stringWithUTF8String:"lastActiveLockPoster"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBLockPoster" toDefaultValue:0 options:4];

  v9 = [NSString stringWithUTF8String:"lastActiveHomePoster"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBHomePoster" toDefaultValue:0 options:4];

  v10 = [NSString stringWithUTF8String:"dontLockAfterCrash"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBDontLockAfterCrash" toDefaultValue:v6 options:1];

  id v11 = [NSString stringWithUTF8String:"recordBootTimeTillDidFinishLaunching"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBRecordBootToSpringBoardDidFinishLaunchingTime" toDefaultValue:v6 options:1];
}

@end