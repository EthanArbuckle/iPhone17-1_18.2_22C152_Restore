@interface SBApplicationClassicModeLaunchArgumentParser
- (SBApplicationClassicModeLaunchArgumentParser)initWithApplication:(id)a3;
- (int64_t)classicModeForLaunchArgument:(id)a3 error:(id *)a4;
@end

@implementation SBApplicationClassicModeLaunchArgumentParser

- (SBApplicationClassicModeLaunchArgumentParser)initWithApplication:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBApplicationClassicModeLaunchArgumentParser;
  v6 = [(SBApplicationClassicModeLaunchArgumentParser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_application, a3);
  }

  return v7;
}

- (int64_t)classicModeForLaunchArgument:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = SBHScreenTypeForCurrentDevice();
    uint64_t v8 = SBHScreenTypeForShortString();
    if (v7 == v8)
    {
      int64_t v9 = 0;
    }
    else
    {
      uint64_t v10 = v8;
      int64_t v9 = +[SBApplication _bestClassicModeForScreenType:v8];
      if (v10 == 1 && ![&unk_1F3347898 containsObject:v6]) {
        int64_t v9 = -1;
      }
    }
  }
  else
  {
    int64_t v9 = -1;
  }
  if (_SBApplicationClassicModeIsClassic(v9))
  {
    BOOL v11 = [(SBApplication *)self->_application _canLaunchInClassicMode:v9];
    if (v11) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = -1;
    }
    if (!a4)
    {
      int64_t v9 = v12;
      goto LABEL_22;
    }
    if (!v11)
    {
      v13 = SBApplicationClassicModeDescription(v9);
      v15 = [(SBApplication *)self->_application bundleIdentifier];
      FBSOpenApplicationErrorCreate();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_20:
      int64_t v9 = -1;
      goto LABEL_22;
    }
  }
  else if (!a4)
  {
    goto LABEL_22;
  }
  if (v9 == -1)
  {
    if (classicModeForLaunchArgument_error__onceToken != -1) {
      dispatch_once(&classicModeForLaunchArgument_error__onceToken, &__block_literal_global_26);
    }
    FBSOpenApplicationErrorCreate();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_22:

  return v9;
}

void __83__SBApplicationClassicModeLaunchArgumentParser_classicModeForLaunchArgument_error___block_invoke()
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v0 = v3;
  SBHEnumerateScreenTypes();
  uint64_t v1 = [v0 componentsJoinedByString:@", "];
  v2 = (void *)classicModeForLaunchArgument_error__modeString;
  classicModeForLaunchArgument_error__modeString = v1;
}

void __83__SBApplicationClassicModeLaunchArgumentParser_classicModeForLaunchArgument_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (_SBApplicationClassicModeIsClassic(+[SBApplication _bestClassicModeForScreenType:a2]))
  {
    v3 = *(void **)(a1 + 32);
    SBHShortStringForScreenType();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v3 addObject:v4];
  }
}

- (void).cxx_destruct
{
}

@end