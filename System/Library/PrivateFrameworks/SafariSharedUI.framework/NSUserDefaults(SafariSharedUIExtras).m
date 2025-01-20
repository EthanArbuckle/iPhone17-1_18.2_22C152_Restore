@interface NSUserDefaults(SafariSharedUIExtras)
+ (BOOL)safari_shouldObserveWebKitFeature:()SafariSharedUIExtras;
+ (id)safari_keyForWebKitExperimentalFeature:()SafariSharedUIExtras;
+ (id)safari_keyForWebKitFeature:()SafariSharedUIExtras;
- (uint64_t)safari_resetWebKitExperimentalFeaturesIfNeeded:()SafariSharedUIExtras;
@end

@implementation NSUserDefaults(SafariSharedUIExtras)

+ (id)safari_keyForWebKitFeature:()SafariSharedUIExtras
{
  id v3 = a3;
  v4 = @"WebKitInternal";
  if ([v3 status] != 1 && objc_msgSend(v3, "status") != 2) {
    v4 = @"WebKitExperimental";
  }
  v5 = [v3 key];
  v6 = [(__CFString *)v4 stringByAppendingString:v5];

  return v6;
}

+ (BOOL)safari_shouldObserveWebKitFeature:()SafariSharedUIExtras
{
  id v3 = a3;
  if ([v3 status]) {
    BOOL v4 = [v3 status] != 7;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)safari_resetWebKitExperimentalFeaturesIfNeeded:()SafariSharedUIExtras
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__NSUserDefaults_SafariSharedUIExtras__safari_resetWebKitExperimentalFeaturesIfNeeded___block_invoke;
  block[3] = &unk_1E5E449D8;
  block[4] = a1;
  id v10 = v4;
  v11 = &v12;
  uint64_t v5 = safari_resetWebKitExperimentalFeaturesIfNeeded__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&safari_resetWebKitExperimentalFeaturesIfNeeded__onceToken, block);
  }
  uint64_t v7 = *((unsigned __int8 *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

+ (id)safari_keyForWebKitExperimentalFeature:()SafariSharedUIExtras
{
  id v3 = [a3 key];
  id v4 = [@"WebKitExperimental" stringByAppendingString:v3];

  return v4;
}

@end