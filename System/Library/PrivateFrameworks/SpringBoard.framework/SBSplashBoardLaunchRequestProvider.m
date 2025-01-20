@interface SBSplashBoardLaunchRequestProvider
- (SBSplashBoardLaunchRequestProvider)initWithApplicationController:(id)a3 displayConfiguration:(id)a4;
- (id)launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4 defaultLaunchRequests:(id)a5;
@end

@implementation SBSplashBoardLaunchRequestProvider

- (SBSplashBoardLaunchRequestProvider)initWithApplicationController:(id)a3 displayConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSplashBoardLaunchRequestProvider;
  v9 = [(SBSplashBoardLaunchRequestProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationController, a3);
    objc_storeStrong((id *)&v10->_displayConfiguration, a4);
  }

  return v10;
}

- (id)launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4 defaultLaunchRequests:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v9 = [MEMORY[0x1E4F1CA48] array];
  int v10 = [v7 supportsDeviceFamily:2];
  if (v10) {
    int v47 = SBLayoutSupportsSideLayoutRole();
  }
  else {
    int v47 = 0;
  }
  if (__sb__runningInSpringBoard())
  {
    int v11 = SBFEffectiveDeviceClass();
    int v12 = v10 ^ 1;
    if (v11 != 2) {
      int v12 = 0;
    }
    int v46 = v12;
  }
  else
  {
    v13 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];
    int v15 = v10 ^ 1;
    if (v14 != 1) {
      int v15 = 0;
    }
    int v46 = v15;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v8;
  uint64_t v16 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    v44 = v9;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        applicationController = self->_applicationController;
        v22 = [v7 bundleIdentifier];
        v23 = [(SBApplicationController *)applicationController applicationWithBundleIdentifier:v22];

        if (v46)
        {
          SBPhoneOnPadFallbackLaunchSize();
          objc_msgSend(v20, "setReferenceSize:");
        }
        else if ([v23 isClassic])
        {
          v24 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_displayEdgeInfoForApplication:", v23);
          v25 = [v24 safeAreaInsetsPortrait];

          if (v25)
          {
            v26 = self;
            id v27 = v7;
            id v28 = objc_alloc(MEMORY[0x1E4FA58D8]);
            [v25 topInset];
            double v30 = v29;
            [v25 leftInset];
            double v32 = v31;
            [v25 bottomInset];
            double v34 = v33;
            [v25 rightInset];
            v36 = (void *)[v28 initWithTop:v30 left:v32 bottom:v34 right:v35];
            v37 = +[SBApplication _deviceSafeAreaInsets];
            if (([v37 isEqual:v36] & 1) == 0) {
              [v20 setCustomSafeAreaInsets:v36];
            }

            id v7 = v27;
            self = v26;
            v9 = v44;
          }
          [v23 defaultLaunchingSizeForDisplayConfiguration:self->_displayConfiguration];
          objc_msgSend(v20, "setReferenceSize:");
        }
        [v9 addObject:v20];
        if (v47)
        {
          v38 = [v23 info];
          char v39 = [v38 wantsFullScreen];

          if ((v39 & 1) == 0)
          {
            [v20 interfaceOrientation];
            SBLayoutDefaultSideLayoutElementWidth();
            double v41 = v40;
            v42 = (void *)[v20 copy];
            [v20 naturalSize];
            [v42 setNaturalSize:v41];
            [v9 addObject:v42];
          }
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v17);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end