@interface NSUserDefaults(HKSPSleep)
+ (id)hksp_analyticsUserDefaults;
+ (id)hksp_internalUserDefaults;
+ (id)hksp_sleepdUserDefaults;
+ (id)hksp_springBoardUserDefaults;
- (float)hksp_debugSleepModeAlpha:()HKSPSleep;
- (id)hksp_dictionaryRepresentationForKeys:()HKSPSleep;
- (uint64_t)hksp_debugSleepModeEnabled;
- (uint64_t)hksp_lockScreenDebugMode;
- (uint64_t)hksp_lockScreenDemoMode;
- (uint64_t)hksp_removeObjectsForKeys:()HKSPSleep;
- (uint64_t)hksp_saveDictionary:()HKSPSleep;
- (uint64_t)hksp_setDebugSleepModeAlpha:()HKSPSleep;
- (uint64_t)hksp_setDebugSleepModeEnabled:()HKSPSleep;
- (uint64_t)hksp_setLockScreenDebugMode:()HKSPSleep;
- (uint64_t)hksp_setLockScreenDemoMode:()HKSPSleep;
- (uint64_t)hksp_setUseDemoSleepData:()HKSPSleep;
- (uint64_t)hksp_useDemoSleepData;
- (void)hksp_reset;
@end

@implementation NSUserDefaults(HKSPSleep)

+ (id)hksp_analyticsUserDefaults
{
  if (qword_1EB538610 != -1) {
    dispatch_once(&qword_1EB538610, &__block_literal_global_314);
  }
  v0 = (void *)qword_1EB538608;
  return v0;
}

+ (id)hksp_sleepdUserDefaults
{
  if (qword_1EB5385F0 != -1) {
    dispatch_once(&qword_1EB5385F0, &__block_literal_global_20);
  }
  v0 = (void *)_MergedGlobals_15;
  return v0;
}

- (id)hksp_dictionaryRepresentationForKeys:()HKSPSleep
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "hksp_dictionaryRepresentation");
  v6 = objc_msgSend(v5, "hksp_dictionaryByFilteringKeys:", v4);

  return v6;
}

- (uint64_t)hksp_saveDictionary:()HKSPSleep
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__NSUserDefaults_HKSPSleep__hksp_saveDictionary___block_invoke;
  v4[3] = &unk_1E5D33F28;
  v4[4] = a1;
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (uint64_t)hksp_removeObjectsForKeys:()HKSPSleep
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__NSUserDefaults_HKSPSleep__hksp_removeObjectsForKeys___block_invoke;
  v4[3] = &unk_1E5D336C0;
  v4[4] = a1;
  return objc_msgSend(a3, "na_each:", v4);
}

- (void)hksp_reset
{
  v2 = objc_msgSend((id)objc_opt_class(), "hksp_sleepdUserDefaults");

  if (v2 == a1)
  {
    v5 = @"com.apple.sleepd";
  }
  else
  {
    v3 = objc_msgSend((id)objc_opt_class(), "hksp_internalUserDefaults");

    if (v3 == a1)
    {
      v5 = @"com.apple.internal.sleep";
    }
    else
    {
      id v4 = objc_msgSend((id)objc_opt_class(), "hksp_analyticsUserDefaults");

      if (v4 != a1)
      {
        HKSPResetUserDefaults(a1);
        return;
      }
      v5 = @"com.apple.sleep.analytics";
    }
  }
  [a1 removePersistentDomainForName:v5];
}

+ (id)hksp_internalUserDefaults
{
  if (qword_1EB538600 != -1) {
    dispatch_once(&qword_1EB538600, &__block_literal_global_312);
  }
  v0 = (void *)qword_1EB5385F8;
  return v0;
}

+ (id)hksp_springBoardUserDefaults
{
  if (qword_1EB538620 != -1) {
    dispatch_once(&qword_1EB538620, &__block_literal_global_316);
  }
  v0 = (void *)qword_1EB538618;
  return v0;
}

- (uint64_t)hksp_lockScreenDebugMode
{
  return [a1 BOOLForKey:@"LockScreenDebugMode"];
}

- (uint64_t)hksp_setLockScreenDebugMode:()HKSPSleep
{
  return [a1 setBool:a3 forKey:@"LockScreenDebugMode"];
}

- (uint64_t)hksp_lockScreenDemoMode
{
  return [a1 BOOLForKey:@"HKSPSleepScreenDemoMode"];
}

- (uint64_t)hksp_setLockScreenDemoMode:()HKSPSleep
{
  return [a1 setBool:a3 forKey:@"HKSPSleepScreenDemoMode"];
}

- (uint64_t)hksp_debugSleepModeEnabled
{
  return [a1 BOOLForKey:@"DebugSleepMode"];
}

- (uint64_t)hksp_setDebugSleepModeEnabled:()HKSPSleep
{
  return [a1 setBool:a3 forKey:@"DebugSleepMode"];
}

- (float)hksp_debugSleepModeAlpha:()HKSPSleep
{
  id v4 = [a1 objectForKey:@"DebugSleepModeAlpha"];
  v5 = v4;
  if (a3) {
    *a3 = v4 != 0;
  }
  [v4 floatValue];
  float v7 = v6;

  return v7;
}

- (uint64_t)hksp_setDebugSleepModeAlpha:()HKSPSleep
{
  return objc_msgSend(a1, "setFloat:forKey:", @"DebugSleepMode");
}

- (uint64_t)hksp_useDemoSleepData
{
  return [a1 BOOLForKey:@"UseDemoSleepData"];
}

- (uint64_t)hksp_setUseDemoSleepData:()HKSPSleep
{
  return [a1 setBool:a3 forKey:@"UseDemoSleepData"];
}

@end