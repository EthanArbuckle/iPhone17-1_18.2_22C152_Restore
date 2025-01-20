@interface WFActionSessionKitSessionConfiguration
- (BOOL)deviceHasDynamicIsland;
- (NSString)bundleIdentifier;
- (WFActionSessionKitSessionConfiguration)initWithBundleIdentifier:(id)a3 toastDurationPerRunSource:(id)a4;
- (double)toastDurationForRunSource:(id)a3;
@end

@implementation WFActionSessionKitSessionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toastDurationPerRunSource, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (BOOL)deviceHasDynamicIsland
{
  return self->_deviceHasDynamicIsland;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)toastDurationForRunSource:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (self)
    {
LABEL_3:
      toastDurationPerRunSource = self->_toastDurationPerRunSource;
      goto LABEL_4;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFActionSessionKitSessionConfiguration.m", 36, @"Invalid parameter not satisfying: %@", @"runSource" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
  }
  toastDurationPerRunSource = 0;
LABEL_4:
  v7 = [(NSDictionary *)toastDurationPerRunSource objectForKeyedSubscript:v5];
  uint64_t v8 = objc_opt_class();
  v9 = WFEnforceClass(v7, v8);

  v10 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
  v11 = [v10 valueForKey:@"WFShortcutsToastedBannerAutoCollapseDuration"];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  if (v9) {
    v14 = v9;
  }
  else {
    v14 = v13;
  }
  [v14 doubleValue];
  double v16 = v15;
  BOOL v17 = [(WFActionSessionKitSessionConfiguration *)self deviceHasDynamicIsland];
  double v18 = 0.0;
  if (!v17)
  {
    int v19 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E4FB4EF8], 0.0);
    double v18 = 0.0;
    if (v19) {
      double v18 = 5.0;
    }
  }
  if (v16 <= 0.0) {
    double v18 = -0.0;
  }
  double v20 = v16 + v18;

  return v20;
}

- (WFActionSessionKitSessionConfiguration)initWithBundleIdentifier:(id)a3 toastDurationPerRunSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFActionSessionKitSessionConfiguration.m", 23, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFActionSessionKitSessionConfiguration;
  v9 = [(WFActionSessionKitSessionConfiguration *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v8 copy];
    toastDurationPerRunSource = v9->_toastDurationPerRunSource;
    v9->_toastDurationPerRunSource = (NSDictionary *)v12;

    v14 = [MEMORY[0x1E4FB46B8] currentDevice];
    v9->_deviceHasDynamicIsland = [v14 hasSystemAperture];

    double v15 = v9;
  }

  return v9;
}

@end