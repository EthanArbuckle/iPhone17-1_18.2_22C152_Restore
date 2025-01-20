@interface LNSnippetEnvironment(WorkflowUICore)
- (uint64_t)initWithSize:()WorkflowUICore locale:traitCollection:;
@end

@implementation LNSnippetEnvironment(WorkflowUICore)

- (uint64_t)initWithSize:()WorkflowUICore locale:traitCollection:
{
  id v9 = a6;
  id v32 = a5;
  id v10 = [v9 preferredContentSizeCategory];
  uint64_t v11 = *MEMORY[0x263F83468];
  if ([v10 isEqualToString:*MEMORY[0x263F83468]])
  {
LABEL_2:
    uint64_t v12 = 3;
    goto LABEL_29;
  }
  if ([v10 isEqualToString:*MEMORY[0x263F83490]])
  {
    uint64_t v12 = -1;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F83458]])
  {
    uint64_t v12 = 0;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F83488]])
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (([v10 isEqualToString:*MEMORY[0x263F83470]] & 1) == 0)
    {
      if (([v10 isEqualToString:v11] & 1) == 0)
      {
        if ([v10 isEqualToString:*MEMORY[0x263F83450]])
        {
          uint64_t v12 = 4;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83440]])
        {
          uint64_t v12 = 5;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83430]])
        {
          uint64_t v12 = 6;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83420]])
        {
          uint64_t v12 = 7;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83418]])
        {
          uint64_t v12 = 8;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83410]])
        {
          uint64_t v12 = 9;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83408]])
        {
          uint64_t v12 = 10;
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F83400]])
        {
          uint64_t v12 = 11;
        }
        else
        {
          uint64_t v12 = 3;
        }
        goto LABEL_29;
      }
      goto LABEL_2;
    }
    uint64_t v12 = 2;
  }
LABEL_29:

  uint64_t v13 = [v9 legibilityWeight];
  uint64_t v14 = [v9 layoutDirection];
  unint64_t v15 = [v9 userInterfaceStyle];
  if (v15 >= 3) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = v15 - 1;
  }
  uint64_t v17 = [v9 accessibilityContrast];
  if ((unint64_t)(v17 + 1) >= 3) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = v17;
  }
  if (v14) {
    uint64_t v19 = -1;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v14 == 1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  if (v13) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = 0;
  }
  if (v13 == 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v21;
  }
  BOOL v23 = [v9 displayGamut] == 1;
  [v9 displayScale];
  double v25 = v24;
  BOOL ShouldDifferentiateWithoutColor = UIAccessibilityShouldDifferentiateWithoutColor();
  BOOL IsInvertColorsEnabled = UIAccessibilityIsInvertColorsEnabled();
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  BYTE3(v31) = UIAccessibilityIsReduceTransparencyEnabled();
  BYTE2(v31) = IsReduceMotionEnabled;
  BYTE1(v31) = IsInvertColorsEnabled;
  LOBYTE(v31) = ShouldDifferentiateWithoutColor;
  uint64_t v29 = objc_msgSend(a1, "initWithSize:locale:dynamicTypeSize:legibilityWeight:layoutDirection:colorScheme:colorSchemeContrast:displayScale:displayGamut:accessibilityDifferentiateWithoutColor:accessibilityInvertColors:accessibilityReduceMotion:accessibilityReduceTransparency:", v32, v12, v22, v20, v16, v18, a2, a3, v25, v23, v31);

  return v29;
}

@end