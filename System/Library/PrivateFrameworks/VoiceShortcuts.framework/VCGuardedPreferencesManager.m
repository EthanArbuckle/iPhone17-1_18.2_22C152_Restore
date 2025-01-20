@interface VCGuardedPreferencesManager
+ (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 withAccessSpecifier:(id)a6 error:(id *)a7;
+ (id)keyWithPreferenceKey:(id)a3 bundleId:(id)a4;
@end

@implementation VCGuardedPreferencesManager

+ (id)keyWithPreferenceKey:(id)a3 bundleId:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = a4;
  v11[1] = a3;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 arrayWithObjects:v11 count:2];

  v9 = [v8 componentsJoinedByString:@"-"];

  return v9;
}

+ (BOOL)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 withAccessSpecifier:(id)a6 error:(id *)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_17:
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"VCGuardedPreferencesManager.m", 24, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"VCGuardedPreferencesManager.m", 23, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

  if (!v14) {
    goto LABEL_17;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_18:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"VCGuardedPreferencesManager.m", 25, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

LABEL_4:
  v16 = [v15 associatedAppBundleIdentifier];
  if ([v16 length])
  {
  }
  else
  {
    v17 = [v15 bundleIdentifier];
    uint64_t v18 = [v17 length];

    if (!v18)
    {
      v25 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB4C38] code:1011 userInfo:0];
      id v19 = v25;
      if (a7)
      {
        id v19 = v25;
        BOOL v23 = 0;
        *a7 = v19;
      }
      else
      {
        BOOL v23 = 0;
      }
      goto LABEL_12;
    }
  }
  id v19 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v14];
  v20 = [v15 associatedAppBundleIdentifier];
  v21 = v20;
  if (!v20)
  {
    v21 = [v15 bundleIdentifier];
  }
  v22 = [a1 keyWithPreferenceKey:v13 bundleId:v21];
  [v19 setInteger:a3 forKey:v22];

  if (!v20) {
  BOOL v23 = CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]) != 0;
  }
LABEL_12:

  return v23;
}

@end