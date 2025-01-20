@interface SUIAShockwaveEdgeLightOverlayConfiguration
@end

@implementation SUIAShockwaveEdgeLightOverlayConfiguration

void __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  v12 = [v10 valueForKeyPath:v8];
  [v11 setValue:v12 forKeyPath:v9];

  [v10 delayForApplicationOfKeypath:v8];
  objc_msgSend(v11, "_setDelay:forApplicationOfKeypath:", v9);
  id v13 = [v10 behaviorSettingsForKeypath:v8];

  [v11 _setBehaviorSettings:v13 forKeypath:v9];
}

@end