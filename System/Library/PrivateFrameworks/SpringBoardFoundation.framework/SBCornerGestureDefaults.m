@interface SBCornerGestureDefaults
- (void)_bindAndRegisterDefaults;
- (void)_migrateSkyDefaultsIfNecessary;
@end

@implementation SBCornerGestureDefaults

- (void)_migrateSkyDefaultsIfNecessary
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(BSAbstractDefaultDomain *)self _store];
  int v4 = objc_msgSend(v3, "bs_defaultExists:", @"SBBottomLeftCornerGestureFeature");
  if (v4 != objc_msgSend(v3, "bs_defaultExists:", @"SBBottomLeftCornerGestureTouchTypes"))
  {
    v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = _SBFLoggingMethodProem(self, 0);
      v7 = (void *)v6;
      *(_DWORD *)v34 = 138543874;
      if (v4) {
        v8 = @"SBBottomLeftCornerGestureFeature";
      }
      else {
        v8 = @"SBBottomLeftCornerGestureTouchTypes";
      }
      if (v4) {
        v9 = @"SBBottomLeftCornerGestureTouchTypes";
      }
      else {
        v9 = @"SBBottomLeftCornerGestureFeature";
      }
      *(void *)&v34[4] = v6;
      *(_WORD *)&v34[12] = 2114;
      *(void *)&v34[14] = v8;
      __int16 v35 = 2114;
      v36 = v9;
      _os_log_error_impl(&dword_18B52E000, v5, OS_LOG_TYPE_ERROR, "%{public}@ expecting both new left corner defaults to exist but only %{public}@ does (%{public}@ doesn't exist)", v34, 0x20u);
    }
    goto LABEL_25;
  }
  if (v4)
  {
    [v3 removeObjectForKey:@"SBApplePencilScreenshotFromCorner"];
    v5 = SBLogCommon();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v10 = _SBFLoggingMethodProem(self, 0);
    *(_DWORD *)v34 = 138543362;
    *(void *)&v34[4] = v10;
    v11 = "%{public}@ keys exist for bottom left corner; skipping migration.";
LABEL_24:
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, v11, v34, 0xCu);

    goto LABEL_25;
  }
  if (!objc_msgSend(v3, "bs_defaultExists:", @"SBApplePencilScreenshotFromCorner"))
  {
    v5 = SBLogCommon();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v10 = _SBFLoggingMethodProem(self, 0);
    *(_DWORD *)v34 = 138543362;
    *(void *)&v34[4] = v10;
    v11 = "%{public}@ new and legacy keys do not exist for bottom left corner; skipping migration.";
    goto LABEL_24;
  }
  [v3 setInteger:0 forKey:@"SBBottomLeftCornerGestureFeature"];
  int v12 = [v3 BOOLForKey:@"SBApplePencilScreenshotFromCorner"];
  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  [v3 setInteger:v13 forKey:@"SBBottomLeftCornerGestureTouchTypes"];
  [v3 removeObjectForKey:@"SBApplePencilScreenshotFromCorner"];
  v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = _SBFLoggingMethodProem(self, 0);
    if (v12) {
      v15 = @"ENABLED";
    }
    else {
      v15 = @"DISABLED";
    }
    v16 = [NSNumber numberWithUnsignedInteger:v13];
    *(_DWORD *)v34 = 138543874;
    *(void *)&v34[4] = v14;
    *(_WORD *)&v34[12] = 2114;
    *(void *)&v34[14] = v15;
    __int16 v35 = 2114;
    v36 = v16;
    _os_log_impl(&dword_18B52E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated screenshot %{public}@ default to bottom left corner mapped to screenshot for touch types %{public}@", v34, 0x20u);
  }
LABEL_25:

  int v17 = objc_msgSend(v3, "bs_defaultExists:", @"SBBottomRightCornerGestureFeature");
  if (v17 == objc_msgSend(v3, "bs_defaultExists:", @"SBBottomRightCornerGestureTouchTypes"))
  {
    if (v17)
    {
      [v3 removeObjectForKey:@"SBApplePencilPaperFromCorner"];
      [v3 removeObjectForKey:@"SBFingerSwipePaperFromCorner"];
      v18 = SBLogCommon();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_58;
      }
      v20 = _SBFLoggingMethodProem(self, 0);
      *(_DWORD *)v34 = 138543362;
      *(void *)&v34[4] = v20;
      v23 = "%{public}@ keys exist for bottom right corner; skipping migration.";
    }
    else
    {
      int v24 = objc_msgSend(v3, "bs_defaultExists:", @"SBApplePencilPaperFromCorner");
      int v25 = objc_msgSend(v3, "bs_defaultExists:", @"SBFingerSwipePaperFromCorner");
      int v26 = v25;
      if ((v24 & 1) != 0 || v25)
      {
        int v27 = 1;
        objc_msgSend(v3, "setInteger:forKey:", 1, @"SBBottomRightCornerGestureFeature", *(_OWORD *)v34);
        if (v24) {
          int v27 = [v3 BOOLForKey:@"SBApplePencilPaperFromCorner"];
        }
        if (v26) {
          unsigned int v28 = [v3 BOOLForKey:@"SBFingerSwipePaperFromCorner"];
        }
        else {
          unsigned int v28 = 1;
        }
        uint64_t v29 = 2;
        if (!v27) {
          uint64_t v29 = 0;
        }
        uint64_t v30 = v29 | v28;
        [v3 setInteger:v30 forKey:@"SBBottomRightCornerGestureTouchTypes"];
        [v3 removeObjectForKey:@"SBApplePencilPaperFromCorner"];
        [v3 removeObjectForKey:@"SBFingerSwipePaperFromCorner"];
        v18 = SBLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = _SBFLoggingMethodProem(self, 0);
          if (v28) {
            v31 = @"ENABLED";
          }
          else {
            v31 = @"DISABLED";
          }
          if (v27) {
            v32 = @"ENABLED";
          }
          else {
            v32 = @"DISABLED";
          }
          v33 = [NSNumber numberWithUnsignedInteger:v30];
          *(_DWORD *)v34 = 138544130;
          *(void *)&v34[4] = v20;
          *(_WORD *)&v34[12] = 2114;
          *(void *)&v34[14] = v31;
          __int16 v35 = 2114;
          v36 = v32;
          __int16 v37 = 2114;
          v38 = v33;
          _os_log_impl(&dword_18B52E000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ migrated quick notes finger:%{public}@ pencil:%{public}@ default to bottom right corner mapped to quick notes for touch types %{public}@", v34, 0x2Au);

          goto LABEL_57;
        }
        goto LABEL_58;
      }
      v18 = SBLogCommon();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_58;
      }
      v20 = _SBFLoggingMethodProem(self, 0);
      *(_DWORD *)v34 = 138543362;
      *(void *)&v34[4] = v20;
      v23 = "%{public}@ new and legacy keys do not exist for bottom right corner; skipping migration.";
    }
    _os_log_impl(&dword_18B52E000, v18, OS_LOG_TYPE_DEFAULT, v23, v34, 0xCu);
LABEL_57:

    goto LABEL_58;
  }
  v18 = SBLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = _SBFLoggingMethodProem(self, 0);
    v20 = (void *)v19;
    *(_DWORD *)v34 = 138543874;
    if (v17) {
      v21 = @"SBBottomRightCornerGestureFeature";
    }
    else {
      v21 = @"SBBottomRightCornerGestureTouchTypes";
    }
    if (v17) {
      v22 = @"SBBottomRightCornerGestureTouchTypes";
    }
    else {
      v22 = @"SBBottomRightCornerGestureFeature";
    }
    *(void *)&v34[4] = v19;
    *(_WORD *)&v34[12] = 2114;
    *(void *)&v34[14] = v21;
    __int16 v35 = 2114;
    v36 = v22;
    _os_log_error_impl(&dword_18B52E000, v18, OS_LOG_TYPE_ERROR, "%{public}@ expecting both new right corner defaults to exist but only %{public}@ does (%{public}@ doesn't exist)", v34, 0x20u);
    goto LABEL_57;
  }
LABEL_58:

  [(BSAbstractDefaultDomain *)self synchronizeDefaults];
}

- (void)_bindAndRegisterDefaults
{
  [(SBCornerGestureDefaults *)self _migrateSkyDefaultsIfNecessary];
  id v8 = [(BSAbstractDefaultDomain *)self _store];
  if ((objc_msgSend(v8, "bs_defaultExists:", @"SBGestureRequiresEducation-Corner") & 1) == 0)
  {
    [v8 setInteger:1 forKey:@"SBGestureRequiresEducation-Corner"];
    [v8 setValue:&unk_1ED89E8F0 forKey:@"SBBottomLeftCornerGestureTouchTypes"];
    [v8 setValue:&unk_1ED89E8F0 forKey:@"SBBottomRightCornerGestureTouchTypes"];
  }
  v3 = [NSString stringWithUTF8String:"bottomLeftCornerGestureFeature"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBBottomLeftCornerGestureFeature" toDefaultValue:&unk_1ED89E908 options:1];

  int v4 = [NSString stringWithUTF8String:"bottomLeftCornerGestureTouchTypes"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBBottomLeftCornerGestureTouchTypes" toDefaultValue:&unk_1ED89E8F0 options:1];

  v5 = [NSString stringWithUTF8String:"bottomRightCornerGestureFeature"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBBottomRightCornerGestureFeature" toDefaultValue:&unk_1ED89E920 options:1];

  uint64_t v6 = [NSString stringWithUTF8String:"bottomRightCornerGestureTouchTypes"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBBottomRightCornerGestureTouchTypes" toDefaultValue:&unk_1ED89E8F0 options:1];

  v7 = [NSString stringWithUTF8String:"cornerGestureRequiresEducation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBGestureRequiresEducation-Corner" toDefaultValue:0 options:1];
}

@end