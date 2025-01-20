@interface BSSettings(SBUISystemAperture)
- (double)SBUISA_CGRectforSetting:()SBUISystemAperture;
- (double)SBUISA_CGSizeforSetting:()SBUISystemAperture;
- (double)SBUISA_directionalEdgeInsetsforSetting:()SBUISystemAperture;
- (id)SBUISA_BSActionforSetting:()SBUISystemAperture;
- (id)SBUISA_UIColorForSetting:()SBUISystemAperture;
- (id)SBUISA_URLforSetting:()SBUISystemAperture;
- (id)SBUISA_backgroundActivityIdentifiersForSetting:()SBUISystemAperture;
- (id)SBUISA_stringforSetting:()SBUISystemAperture;
- (id)SBUI_systemApertureDescription;
- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture;
- (uint64_t)SBUISA_contentRoleforSetting:()SBUISystemAperture;
- (uint64_t)SBUISA_contextIdforSetting:()SBUISystemAperture;
- (uint64_t)SBUISA_customLayoutModeforSetting:()SBUISystemAperture;
- (uint64_t)SBUISA_layoutModeforSetting:()SBUISystemAperture;
- (uint64_t)SBUISA_presentationBehaviorsForSetting:()SBUISystemAperture;
- (uint64_t)SBUISA_renderingIdforSetting:()SBUISystemAperture;
@end

@implementation BSSettings(SBUISystemAperture)

- (uint64_t)SBUISA_contentRoleforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (id)SBUISA_stringforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)SBUISA_URLforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)SBUISA_BSActionforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (double)SBUISA_CGRectforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  [v5 CGRectValue];
  double v7 = v6;

  return v7;
}

- (double)SBUISA_CGSizeforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  [v5 CGSizeValue];
  double v7 = v6;

  return v7;
}

- (uint64_t)SBUISA_layoutModeforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 integerValue];
  return v6;
}

- (uint64_t)SBUISA_contextIdforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 unsignedIntValue];
  return v6;
}

- (uint64_t)SBUISA_renderingIdforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 unsignedLongLongValue];
  return v6;
}

- (double)SBUISA_directionalEdgeInsetsforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  [v5 directionalEdgeInsetsValue];
  double v7 = v6;

  return v7;
}

- (id)SBUISA_backgroundActivityIdentifiersForSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (uint64_t)SBUISA_customLayoutModeforSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 integerValue];
  return v6;
}

- (uint64_t)SBUISA_presentationBehaviorsForSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

- (id)SBUISA_UIColorForSetting:()SBUISystemAperture
{
  v1 = objc_msgSend(a1, "objectForSetting:");
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F428B8];
    [v5 red];
    double v8 = v7;
    [v5 green];
    double v10 = v9;
    [v5 blue];
    double v12 = v11;
    [v5 alpha];
    v14 = [v6 colorWithRed:v8 green:v10 blue:v12 alpha:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)SBUI_systemApertureDescription
{
  uint64_t v2 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  double v8 = __64__BSSettings_SBUISystemAperture__SBUI_systemApertureDescription__block_invoke;
  double v9 = &unk_1E5CCC878;
  id v10 = v2;
  uint64_t v11 = a1;
  id v3 = v2;
  [v3 appendBodySectionWithName:0 multilinePrefix:0 block:&v6];
  v4 = objc_msgSend(v3, "build", v6, v7, v8, v9);

  return v4;
}

- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:a1];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  double v12 = __83__BSSettings_SBUISystemAperture__SBUI_systemApertureDescriptionOfDiffFromSettings___block_invoke;
  double v13 = &unk_1E5CCD8E0;
  uint64_t v14 = a1;
  id v6 = v4;
  id v15 = v6;
  id v7 = v5;
  id v16 = v7;
  v17 = &v18;
  [v7 appendBodySectionWithName:0 multilinePrefix:0 block:&v10];
  if (*((unsigned char *)v19 + 24))
  {
    double v8 = objc_msgSend(v7, "build", v10, v11, v12, v13, v14, v15);
  }
  else
  {
    double v8 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v8;
}

@end