@interface PUSlideshowSettings
+ (PUSlideshowSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowUserInteractivity;
- (BOOL)slideshowSettingsEnableFullscreenSupport;
- (BOOL)transitionSettingsAreDefaults;
- (NSString)currentPresetUniqueIdentifier;
- (OKProducerPreset)currentPreset;
- (double)interactiveTransitionFingerTrackingBoxRadiusDefaultValue;
- (double)interactiveTransitionFingerTrackingBoxRadiusIncrementValue;
- (double)interactiveTransitionFingerTrackingBoxRadiusMaxValue;
- (double)interactiveTransitionFingerTrackingBoxRadiusMinValue;
- (double)interactiveTransitionProgressThresholdDefaultValue;
- (double)interactiveTransitionProgressThresholdIncrementValue;
- (double)interactiveTransitionProgressThresholdMaxValue;
- (double)interactiveTransitionProgressThresholdMinValue;
- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue;
- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue;
- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue;
- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue;
- (id)archiveValueForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parentSettings;
- (void)applyArchiveValue:(id)a3 forKey:(id)a4;
- (void)performPostSaveActions;
- (void)removeTransitionTimingCustomizationsFromUserDefaults;
- (void)restoreCurrentInteractiveTransitionValuesFromUserDefaults;
- (void)saveInteractiveSlideshowSettingsInUserDefaults;
- (void)setAllowUserInteractivity:(BOOL)a3;
- (void)setCurrentPreset:(id)a3;
- (void)setCurrentPresetUniqueIdentifier:(id)a3;
- (void)setDefaultPresetTransitionValues;
- (void)setDefaultValues;
- (void)setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:(double)a3;
- (void)setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:(double)a3;
- (void)setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:(double)a3;
- (void)setInteractiveTransitionFingerTrackingBoxRadiusMinValue:(double)a3;
- (void)setInteractiveTransitionProgressThresholdDefaultValue:(double)a3;
- (void)setInteractiveTransitionProgressThresholdIncrementValue:(double)a3;
- (void)setInteractiveTransitionProgressThresholdMaxValue:(double)a3;
- (void)setInteractiveTransitionProgressThresholdMinValue:(double)a3;
- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:(double)a3;
- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:(double)a3;
- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:(double)a3;
- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:(double)a3;
- (void)setSlideshowSettingsEnableFullscreenSupport:(BOOL)a3;
@end

@implementation PUSlideshowSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUSlideshowSettings *)self setDefaultPresetTransitionValues];
  [(PUSlideshowSettings *)self setAllowUserInteractivity:1];
  [(PUSlideshowSettings *)self setSlideshowSettingsEnableFullscreenSupport:0];
}

- (void)setSlideshowSettingsEnableFullscreenSupport:(BOOL)a3
{
  self->_slideshowSettingsEnableFullscreenSupport = a3;
}

- (void)setDefaultPresetTransitionValues
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  currentPreset = self->_currentPreset;
  if (currentPreset)
  {
    [(OKProducerPreset *)currentPreset guidelines];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v56;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v10 = [v9 valueForKey:@"key"];
          int v11 = [v10 isEqualToString:@"interactiveTransitionSettings"];

          if (v11)
          {
            v12 = [v9 valueForKey:@"value"];
            v13 = [v12 valueForKey:@"trackingBoxRadiusMinValue"];
            v14 = v13;
            if (v13)
            {
              [v13 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusMinValue:v15];
            }
            v16 = [v12 valueForKey:@"trackingBoxRadiusMaxValue"];
            v17 = v16;
            if (v16)
            {
              [v16 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:v18];
            }
            v19 = [v12 valueForKey:@"trackingBoxRadiusDefaultValue"];
            v20 = v19;
            if (v19)
            {
              [v19 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:v21];
            }
            v22 = [v12 valueForKey:@"trackingBoxRadiusIncrementValue"];
            v23 = v22;
            if (v22)
            {
              [v22 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:v24];
            }
            v25 = [v12 valueForKey:@"progressThresholdMinValue"];
            v26 = v25;
            if (v25)
            {
              [v25 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdMinValue:v27];
            }
            v28 = [v12 valueForKey:@"progressThresholdMaxValue"];
            v29 = v28;
            if (v28)
            {
              [v28 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdMaxValue:v30];
            }
            v54 = v14;
            v31 = [v12 valueForKey:@"progressThresholdDefaultValue"];
            v32 = v31;
            if (v31)
            {
              [v31 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdDefaultValue:v33];
            }
            v53 = v17;
            v34 = [v12 valueForKey:@"progressThresholdIncrementValue"];
            v35 = v34;
            if (v34)
            {
              [v34 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdIncrementValue:v36];
            }
            v52 = v20;
            v37 = [v12 valueForKey:@"velocityThresholdMinValue"];
            v38 = v37;
            if (v37)
            {
              [v37 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:v39];
            }
            v50 = v29;
            v51 = v23;
            v40 = [v12 valueForKey:@"velocityThresholdMaxValue"];
            v41 = v40;
            if (v40)
            {
              [v40 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:v42];
            }
            v43 = v26;
            v44 = [v12 valueForKey:@"velocityThresholdDefaultValue"];
            v45 = v44;
            if (v44)
            {
              [v44 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:v46];
            }
            v47 = [v12 valueForKey:@"velocityThresholdIncrementValue"];
            v48 = v47;
            if (v47)
            {
              [v47 floatValue];
              [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:v49];
            }

            [(PUSlideshowSettings *)self restoreCurrentInteractiveTransitionValuesFromUserDefaults];
            return;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [(PUSlideshowSettings *)self restoreCurrentInteractiveTransitionValuesFromUserDefaults];
  }
  [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusMinValue:0.100000001];
  [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:5.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:3.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:0.100000001];
  [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdMinValue:0.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdMaxValue:1.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdDefaultValue:0.300000012];
  [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdIncrementValue:0.0500000007];
  [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:0.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:1000.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:300.0];
  [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:10.0];
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingMinValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue = a3;
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingMaxValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue = a3;
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue = a3;
}

- (void)setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:(double)a3
{
  self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdMinValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdMinValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdMaxValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdMaxValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdIncrementValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdIncrementValue = a3;
}

- (void)setInteractiveTransitionProgressThresholdDefaultValue:(double)a3
{
  self->_interactiveTransitionProgressThresholdDefaultValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusMinValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusMinValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusMaxValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusMaxValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusIncrementValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusIncrementValue = a3;
}

- (void)setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:(double)a3
{
  self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue = a3;
}

- (void)setAllowUserInteractivity:(BOOL)a3
{
  self->_allowUserInteractivity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPresetUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPreset, 0);
}

- (void)setCurrentPresetUniqueIdentifier:(id)a3
{
}

- (NSString)currentPresetUniqueIdentifier
{
  return self->_currentPresetUniqueIdentifier;
}

- (BOOL)slideshowSettingsEnableFullscreenSupport
{
  return self->_slideshowSettingsEnableFullscreenSupport;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue;
}

- (double)interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue
{
  return self->_interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue;
}

- (double)interactiveTransitionProgressThresholdIncrementValue
{
  return self->_interactiveTransitionProgressThresholdIncrementValue;
}

- (double)interactiveTransitionProgressThresholdDefaultValue
{
  return self->_interactiveTransitionProgressThresholdDefaultValue;
}

- (double)interactiveTransitionProgressThresholdMaxValue
{
  return self->_interactiveTransitionProgressThresholdMaxValue;
}

- (double)interactiveTransitionProgressThresholdMinValue
{
  return self->_interactiveTransitionProgressThresholdMinValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusIncrementValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusIncrementValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusDefaultValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusMaxValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusMaxValue;
}

- (double)interactiveTransitionFingerTrackingBoxRadiusMinValue
{
  return self->_interactiveTransitionFingerTrackingBoxRadiusMinValue;
}

- (BOOL)allowUserInteractivity
{
  return self->_allowUserInteractivity;
}

- (void)saveInteractiveSlideshowSettingsInUserDefaults
{
  v14[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 valueForKey:@"InteractiveSlideshowTransitionSettings"];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  uint64_t v6 = [v5 valueForKey:@"interactiveTransitionFineTuneSettings"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v5 setValue:v7 forKey:@"interactiveTransitionFineTuneSettings"];
  }
  if (self->_currentPreset
    && ![(PUSlideshowSettings *)self transitionSettingsAreDefaults])
  {
    v8 = [(OKProducerPreset *)self->_currentPreset uniqueIdentifier];
    v13[0] = @"interactiveTransitionFingerTrackingBoxRadiusCurrentValueAsNumber";
    v9 = [NSNumber numberWithDouble:self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue];
    v14[0] = v9;
    v13[1] = @"interactiveTransitionProgressThresholdCurrentValueAsNumber";
    v10 = [NSNumber numberWithDouble:self->_interactiveTransitionProgressThresholdDefaultValue];
    v14[1] = v10;
    v13[2] = @"interactiveTransitionVelocityThresholdForAlwaysFinishingCurrentValueAsNumber";
    int v11 = [NSNumber numberWithDouble:self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue];
    v14[2] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

    [v7 setValue:v12 forKey:v8];
    [v5 setValue:v7 forKey:@"interactiveTransitionFineTuneSettings"];
    [v3 setObject:v5 forKey:@"InteractiveSlideshowTransitionSettings"];

    [v3 synchronize];
  }
}

- (BOOL)transitionSettingsAreDefaults
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  currentPreset = self->_currentPreset;
  if (!currentPreset) {
    return 1;
  }
  [(OKProducerPreset *)currentPreset guidelines];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = @"key";
    uint64_t v6 = *(void *)v31;
    char v27 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v9 = [v8 valueForKey:v5];
        int v10 = [v9 isEqualToString:@"interactiveTransitionSettings"];

        if (v10)
        {
          int v11 = v5;
          v12 = [v8 valueForKey:@"value"];
          v13 = [v12 valueForKey:@"trackingBoxRadiusDefaultValue"];
          v14 = v13;
          if (v13)
          {
            double interactiveTransitionFingerTrackingBoxRadiusDefaultValue = self->_interactiveTransitionFingerTrackingBoxRadiusDefaultValue;
            [v13 floatValue];
            if (interactiveTransitionFingerTrackingBoxRadiusDefaultValue != v16)
            {

              char v27 = 0;
              goto LABEL_25;
            }
          }
          v17 = [v12 valueForKey:@"progressThresholdDefaultValue"];
          float v18 = v17;
          if (!v17
            || (double interactiveTransitionProgressThresholdDefaultValue = self->_interactiveTransitionProgressThresholdDefaultValue,
                [v17 floatValue],
                interactiveTransitionProgressThresholdDefaultValue == v20))
          {
            v22 = [v12 valueForKey:@"velocityThresholdDefaultValue"];
            v23 = v22;
            if (!v22
              || (double interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue = self->_interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue,
                  [v22 floatValue],
                  interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue == v25))
            {
              int v21 = 0;
            }
            else
            {
              char v27 = 0;
              int v21 = 2;
            }
          }
          else
          {
            char v27 = 0;
            int v21 = 2;
          }

          uint64_t v5 = v11;
          if (v21) {
            goto LABEL_25;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v27 = 1;
  }
LABEL_25:

  return v27 & 1;
}

- (void)restoreCurrentInteractiveTransitionValuesFromUserDefaults
{
  if (self->_currentPreset)
  {
    id v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = [v17 valueForKey:@"InteractiveSlideshowTransitionSettings"];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 valueForKey:@"interactiveTransitionFineTuneSettings"];
      uint64_t v6 = [(OKProducerPreset *)self->_currentPreset uniqueIdentifier];
      uint64_t v7 = [v5 objectForKey:v6];

      if (v7)
      {
        v8 = [v7 valueForKey:@"interactiveTransitionFingerTrackingBoxRadiusCurrentValueAsNumber"];
        v9 = v8;
        if (v8)
        {
          [v8 floatValue];
          [(PUSlideshowSettings *)self setInteractiveTransitionFingerTrackingBoxRadiusDefaultValue:v10];
        }
        int v11 = [v7 valueForKey:@"interactiveTransitionProgressThresholdCurrentValueAsNumber"];
        v12 = v11;
        if (v11)
        {
          [v11 floatValue];
          [(PUSlideshowSettings *)self setInteractiveTransitionProgressThresholdDefaultValue:v13];
        }
        v14 = [v7 valueForKey:@"interactiveTransitionVelocityThresholdForAlwaysFinishingCurrentValueAsNumber"];
        float v15 = v14;
        if (v14)
        {
          [v14 floatValue];
          [(PUSlideshowSettings *)self setInteractiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue:v16];
        }
      }
    }
  }
}

- (void)removeTransitionTimingCustomizationsFromUserDefaults
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = [v4 valueForKey:@"InteractiveSlideshowTransitionSettings"];
  uint64_t v3 = (void *)[v2 mutableCopy];

  if (v3)
  {
    [v3 removeObjectForKey:@"interactiveTransitionFineTuneSettings"];
    [v4 setValue:v3 forKey:@"InteractiveSlideshowTransitionSettings"];
    [v4 synchronize];
  }
}

- (OKProducerPreset)currentPreset
{
  if (!self->_currentPreset)
  {
    if (self->_currentPresetUniqueIdentifier) {
      goto LABEL_6;
    }
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 valueForKey:@"InteractiveSlideshowTransitionSettings"];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 objectForKey:@"LastUsedPresetIdentifier"];
      currentPresetUniqueIdentifier = self->_currentPresetUniqueIdentifier;
      self->_currentPresetUniqueIdentifier = v6;
    }
    if (self->_currentPresetUniqueIdentifier)
    {
LABEL_6:
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x2050000000;
      v8 = (void *)getOKProducerPresetsManagerClass_softClass_86274;
      uint64_t v19 = getOKProducerPresetsManagerClass_softClass_86274;
      if (!getOKProducerPresetsManagerClass_softClass_86274)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __getOKProducerPresetsManagerClass_block_invoke_86275;
        v15[3] = &unk_1E5F2E228;
        v15[4] = &v16;
        __getOKProducerPresetsManagerClass_block_invoke_86275((uint64_t)v15);
        v8 = (void *)v17[3];
      }
      id v9 = v8;
      _Block_object_dispose(&v16, 8);
      float v10 = [v9 defaultManager];
      int v11 = [v10 presetForUniqueIdentifier:self->_currentPresetUniqueIdentifier];
      currentPreset = self->_currentPreset;
      self->_currentPreset = v11;

      [(PUSlideshowSettings *)self setDefaultPresetTransitionValues];
    }
  }
  float v13 = self->_currentPreset;
  return v13;
}

- (void)setCurrentPreset:(id)a3
{
  p_currentPreset = &self->_currentPreset;
  int v11 = (OKProducerPreset *)a3;
  if (*p_currentPreset != v11)
  {
    objc_storeStrong((id *)&self->_currentPreset, a3);
    uint64_t v6 = [(OKProducerPreset *)*p_currentPreset uniqueIdentifier];
    currentPresetUniqueIdentifier = self->_currentPresetUniqueIdentifier;
    self->_currentPresetUniqueIdentifier = v6;

    if (self->_currentPresetUniqueIdentifier)
    {
      v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      id v9 = [v8 valueForKey:@"InteractiveSlideshowTransitionSettings"];
      float v10 = (void *)[v9 mutableCopy];

      if (!v10)
      {
        float v10 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [(PUSlideshowSettings *)self setDefaultPresetTransitionValues];
      [v10 setObject:self->_currentPresetUniqueIdentifier forKey:@"LastUsedPresetIdentifier"];
      [v8 setObject:v10 forKey:@"InteractiveSlideshowTransitionSettings"];
      [v8 synchronize];
    }
  }
}

- (id)archiveValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"currentPreset"])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUSlideshowSettings;
    uint64_t v5 = [(PXSettings *)&v7 archiveValueForKey:v4];
  }

  return v5;
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 hasPrefix:@"currentPreset"] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUSlideshowSettings;
    [(PXSettings *)&v8 applyArchiveValue:v6 forKey:v7];
  }
}

- (void)performPostSaveActions
{
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettings;
  [(PXSettings *)&v3 performPostSaveActions];
  [(PUSlideshowSettings *)self saveInteractiveSlideshowSettingsInUserDefaults];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowSettings;
  id v4 = [(PTSettings *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 12, self->_currentPreset);
  objc_storeStrong(v4 + 25, self->_currentPresetUniqueIdentifier);
  return v4;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v72[4] = *MEMORY[0x1E4F143B8];
  v2 = +[PUSlideshowSettings sharedInstance];
  [v2 restoreCurrentInteractiveTransitionValuesFromUserDefaults];

  objc_super v3 = +[PUSlideshowSettings sharedInstance];
  id v4 = [v3 currentPreset];

  unint64_t v5 = 0x1E4F94000uLL;
  if (v4)
  {
    objc_super v6 = NSString;
    id v7 = +[PUSlideshowSettings sharedInstance];
    objc_super v8 = [v7 currentPreset];
    id v9 = [v8 localizedName];
    float v10 = [v6 stringWithFormat:@"Features (%@)", v9];

    v65 = (void *)MEMORY[0x1E4F94160];
    uint64_t v62 = [MEMORY[0x1E4F941F0] rowWithTitle:@"User Interactivity" valueKeyPath:@"allowUserInteractivity"];
    v72[0] = v62;
    long long v57 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Transition, tracking box radius", @"interactiveTransitionFingerTrackingBoxRadiusDefaultValue" valueKeyPath];
    v64 = +[PUSlideshowSettings sharedInstance];
    [v64 interactiveTransitionFingerTrackingBoxRadiusMinValue];
    double v12 = v11;
    v63 = +[PUSlideshowSettings sharedInstance];
    [v63 interactiveTransitionFingerTrackingBoxRadiusMaxValue];
    uint64_t v60 = [v57 minValue:v12 maxValue:v13];
    v61 = +[PUSlideshowSettings sharedInstance];
    [v61 interactiveTransitionFingerTrackingBoxRadiusIncrementValue];
    v59 = objc_msgSend(v60, "pu_increment:");
    long long v58 = [v59 conditionFormat:@"allowUserInteractivity != 0"];
    v72[1] = v58;
    long long v55 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Transition, progress thr", @"interactiveTransitionProgressThresholdDefaultValue" valueKeyPath];
    long long v56 = +[PUSlideshowSettings sharedInstance];
    [v56 interactiveTransitionProgressThresholdMinValue];
    double v15 = v14;
    v54 = +[PUSlideshowSettings sharedInstance];
    [v54 interactiveTransitionProgressThresholdMaxValue];
    v52 = [v55 minValue:v15 maxValue:v16];
    v53 = +[PUSlideshowSettings sharedInstance];
    [v53 interactiveTransitionProgressThresholdIncrementValue];
    v51 = objc_msgSend(v52, "pu_increment:");
    v50 = [v51 conditionFormat:@"allowUserInteractivity != 0"];
    v72[2] = v50;
    float v49 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Transition, velocity thr 4 always finishing", @"interactiveTransitionVelocityThresholdForAlwaysFinishingDefaultValue" valueKeyPath];
    id v17 = +[PUSlideshowSettings sharedInstance];
    [v17 interactiveTransitionVelocityThresholdForAlwaysFinishingMinValue];
    double v19 = v18;
    float v20 = +[PUSlideshowSettings sharedInstance];
    [v20 interactiveTransitionVelocityThresholdForAlwaysFinishingMaxValue];
    v22 = [v49 minValue:v19 maxValue:v21];
    v23 = +[PUSlideshowSettings sharedInstance];
    [v23 interactiveTransitionVelocityThresholdForAlwaysFinishingIncrementValue];
    float v24 = objc_msgSend(v22, "pu_increment:");
    float v25 = [v24 conditionFormat:@"allowUserInteractivity != 0"];
    v72[3] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
    v66 = [v65 sectionWithRows:v26 title:v10];

    unint64_t v5 = 0x1E4F94000;
    char v27 = v57;

    v28 = (void *)v62;
  }
  else
  {
    v29 = (void *)MEMORY[0x1E4F94160];
    v28 = [MEMORY[0x1E4F941F0] rowWithTitle:@"User Interactivity" valueKeyPath:@"allowUserInteractivity"];
    v71 = v28;
    char v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    float v10 = @"Features";
    v66 = [v29 sectionWithRows:v27 title:@"Features"];
  }

  long long v30 = (void *)MEMORY[0x1E4F94160];
  long long v31 = [*(id *)(v5 + 496) rowWithTitle:@"Fullscreen support" valueKeyPath:@"slideshowSettingsEnableFullscreenSupport"];
  v70 = v31;
  long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
  long long v33 = [v30 sectionWithRows:v32 title:@"Presentation Settings"];

  v34 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_128];
  uint64_t v35 = (void *)MEMORY[0x1E4F94160];
  float v36 = [MEMORY[0x1E4F940F8] rowWithTitle:@"Reset Transition Timing Customizations" action:v34];
  v69 = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
  v38 = [v35 sectionWithRows:v37];

  float v39 = (void *)MEMORY[0x1E4F94160];
  v40 = (void *)MEMORY[0x1E4F940F8];
  v41 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  float v42 = [v40 rowWithTitle:@"Restore Defaults" action:v41];
  v68 = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
  v44 = [v39 sectionWithRows:v43];

  v45 = (void *)MEMORY[0x1E4F94160];
  v67[0] = v66;
  v67[1] = v33;
  v67[2] = v38;
  v67[3] = v44;
  float v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:4];
  v47 = [v45 moduleWithTitle:@"One Up" contents:v46];

  return v47;
}

uint64_t __47__PUSlideshowSettings_settingsControllerModule__block_invoke()
{
  v0 = +[PUSlideshowSettings sharedInstance];
  [v0 removeTransitionTimingCustomizationsFromUserDefaults];

  v1 = +[PUSlideshowSettings sharedInstance];
  [v1 setDefaultPresetTransitionValues];

  return 1;
}

+ (PUSlideshowSettings)sharedInstance
{
  if (sharedInstance_onceToken_86366 != -1) {
    dispatch_once(&sharedInstance_onceToken_86366, &__block_literal_global_86367);
  }
  v2 = (void *)sharedInstance_sharedInstance_86368;
  return (PUSlideshowSettings *)v2;
}

void __37__PUSlideshowSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 slideshowSettings];
  v1 = (void *)sharedInstance_sharedInstance_86368;
  sharedInstance_sharedInstance_86368 = v0;
}

@end