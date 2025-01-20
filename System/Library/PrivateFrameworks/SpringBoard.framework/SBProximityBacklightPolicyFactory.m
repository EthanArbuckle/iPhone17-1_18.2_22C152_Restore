@interface SBProximityBacklightPolicyFactory
+ (id)createNewProximityBacklightPolicyWithBacklightController:(id)a3 sensorModeController:(id)a4;
@end

@implementation SBProximityBacklightPolicyFactory

+ (id)createNewProximityBacklightPolicyWithBacklightController:(id)a3 sensorModeController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SBProximityBacklightPolicyConfiguration);
  [(SBProximityBacklightPolicyConfiguration *)v7 setBacklightController:v6];

  [(SBProximityBacklightPolicyConfiguration *)v7 setSensorModeController:v5];
  v8 = +[SBProximityDomain rootSettings];
  [(SBProximityBacklightPolicyConfiguration *)v7 setProximitySettings:v8];

  v9 = +[SBSystemGestureManager mainDisplayManager];
  [(SBProximityBacklightPolicyConfiguration *)v7 setSystemGestureManager:v9];

  if (SBUIIsSystemApertureEnabled())
  {
    v10 = SBLogProximitySensor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Using SBSystemApertureProximityBacklightPolicy.", buf, 2u);
    }
    v11 = off_1E6AF0C58;
    goto LABEL_19;
  }
  if (!__sb__runningInSpringBoard())
  {
    v12 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v12 userInterfaceIdiom])
    {
    }
    else
    {
      uint64_t v13 = SBFEffectiveHomeButtonType();

      if (v13 == 2) {
        goto LABEL_13;
      }
    }
LABEL_16:
    v10 = SBLogProximitySensor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Using SBDefaultProximityBacklightPolicy.", v16, 2u);
    }
    v11 = off_1E6AEDBE8;
    goto LABEL_19;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
    || SBFEffectiveHomeButtonType() != 2)
  {
    goto LABEL_16;
  }
LABEL_13:
  v10 = SBLogProximitySensor();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Using SBNotchedStatusBarProximityBacklightPolicy.", v17, 2u);
  }
  v11 = off_1E6AEF568;
LABEL_19:

  v14 = (void *)[objc_alloc(*v11) initWithConfiguration:v7];
  return v14;
}

@end