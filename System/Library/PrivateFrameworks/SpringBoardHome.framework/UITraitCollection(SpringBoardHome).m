@interface UITraitCollection(SpringBoardHome)
+ (id)sbh_highestLevelTraitCollectionForView:()SpringBoardHome;
+ (id)sbh_highestLevelTraitCollectionForViewController:()SpringBoardHome;
+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome;
+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome iconImageStyleConfiguration:;
+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:;
+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:overrideIconImageStyleConfiguration:;
+ (id)sbh_iconImageStyleConfigurationFromTraitCollection:()SpringBoardHome;
+ (id)sbh_iconImageStyleConfigurationFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:overrideIconImageStyleConfiguration:;
+ (id)sbh_traitCollectionWithHomeScreenStyleConfiguration:()SpringBoardHome;
+ (id)sbh_traitCollectionWithHomeScreenStyleConfiguration:()SpringBoardHome userInterfaceStyle:;
+ (id)sbh_traitCollectionWithIconImageAppearance:()SpringBoardHome;
+ (id)sbh_traitCollectionWithIconImageStyleConfiguration:()SpringBoardHome;
+ (id)sbh_traitCollectionWithIconImageStyleConfiguration:()SpringBoardHome userInterfaceStyle:;
+ (id)sbh_traitCollectionWithIconTintColor:()SpringBoardHome;
+ (uint64_t)sbh_materialUserInterfaceStyleFromTraitCollection:()SpringBoardHome;
+ (uint64_t)sbh_userInterfaceStyleForIconImageAppearance:()SpringBoardHome;
- (BOOL)sbh_automaticallyChangesWithUserInterfaceStyle;
- (id)sbh_homeScreenIconStyleConfiguration:()SpringBoardHome;
- (id)sbh_homeScreenStyleConfiguration;
- (id)sbh_iconImageAppearanceInferringIfNecessary:()SpringBoardHome;
- (id)sbh_iconImageAppearanceWithHomeScreenStyleConfiguration:()SpringBoardHome;
- (id)sbh_iconImageStyleConfigurationInferringIfNecessary:()SpringBoardHome;
- (id)sbh_iconTintColorInferringIfNecessary:()SpringBoardHome;
- (uint64_t)sbh_hasIconTintColorOrDarkStyle;
- (uint64_t)sbh_homeScreenIconStyleConfiguration;
- (uint64_t)sbh_iconImageAppearance;
- (uint64_t)sbh_iconImageStyleConfiguration;
- (uint64_t)sbh_iconImageUserInterfaceStyle;
- (uint64_t)sbh_iconTintColor;
- (uint64_t)sbh_widgetUserInterfaceStyle;
@end

@implementation UITraitCollection(SpringBoardHome)

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:overrideIconImageStyleConfiguration:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  v12 = v11;
  if (!v11)
  {
    v12 = 0;
    if (v10)
    {
      v12 = objc_msgSend(a1, "sbh_iconImageAppearanceFromTraitCollection:iconImageStyleConfiguration:", v8, v10);
    }
  }
  if (!v12)
  {
    v12 = objc_msgSend(v8, "sbh_iconImageAppearance");
    if (!v12)
    {
      v12 = +[SBHIconImageAppearance defaultAppearance];
    }
  }

  return v12;
}

- (id)sbh_iconImageAppearanceInferringIfNecessary:()SpringBoardHome
{
  v5 = self;
  v6 = [a1 objectForTrait:v5];

  v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = v6;
  }
  else if (a3)
  {
    id v10 = objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
    if (v10) {
      objc_msgSend(v10, "iconImageAppearanceWithUserInterfaceStyle:", objc_msgSend(a1, "userInterfaceStyle"));
    }
    else {
    id v9 = +[SBHIconImageAppearance lightAppearance];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)sbh_iconImageStyleConfigurationInferringIfNecessary:()SpringBoardHome
{
  v5 = self;
  v6 = [a1 objectForTrait:v5];

  v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = v6;
  }
  else if (a3)
  {
    id v10 = objc_msgSend(a1, "sbh_homeScreenStyleConfiguration");
    if (v10)
    {
      id v9 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:v10];
    }
    else
    {
      id v11 = objc_msgSend(a1, "sbh_homeScreenIconStyleConfiguration:", 0);
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "sbh_iconImageStyleConfiguration");
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 0);
        v14 = v13;
        if (v13)
        {
          switch([v13 appearanceType])
          {
            case 0:
              uint64_t v15 = +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration];
              break;
            case 1:
            case 3:
              uint64_t v15 = +[SBHIconImageStyleConfiguration darkStyleConfiguration];
              break;
            case 2:
              v16 = [v14 tintColor];
              goto LABEL_20;
            default:
              goto LABEL_12;
          }
          id v9 = (id)v15;
        }
        else
        {
LABEL_12:
          v16 = objc_msgSend(a1, "sbh_iconTintColorInferringIfNecessary:", 0);
          if (v16)
          {
LABEL_20:
            uint64_t v18 = +[SBHIconImageStyleConfiguration tintedStyleConfigurationWithTintColor:v16];
          }
          else
          {
            uint64_t v17 = [a1 userInterfaceStyle];
            if (v17 == 2)
            {
              uint64_t v18 = +[SBHIconImageStyleConfiguration darkStyleConfiguration];
            }
            else
            {
              if (v17 == 1) {
                +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration];
              }
              else {
              uint64_t v18 = +[SBHIconImageStyleConfiguration defaultStyleConfiguration];
              }
            }
          }
          id v9 = (id)v18;
        }
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)sbh_homeScreenStyleConfiguration
{
  v2 = self;
  v3 = [a1 objectForTrait:v2];

  getPUIStylePickerHomeScreenConfigurationClass();
  v4 = self;
  if (objc_opt_isKindOfClass()) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome iconImageStyleConfiguration:
{
  id v5 = a4;
  if (a3) {
    uint64_t v6 = [a3 userInterfaceStyle];
  }
  else {
    uint64_t v6 = 1;
  }
  v7 = [v5 iconImageAppearanceWithUserInterfaceStyle:v6];

  return v7;
}

- (uint64_t)sbh_iconImageAppearance
{
  return objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 1);
}

- (id)sbh_homeScreenIconStyleConfiguration:()SpringBoardHome
{
  id v5 = self;
  uint64_t v6 = [a1 objectForTrait:v5];

  v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = v6;
  }
  else
  {
    uint64_t v10 = self;
    id v11 = [a1 objectForTrait:v10];

    v12 = self;
    LOBYTE(v10) = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0)
    {
      if (a3)
      {
        uint64_t v15 = objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
        v16 = v15;
        if (v15) {
          [v15 homeScreenIconStyleConfiguration];
        }
        else {
        v13 = [MEMORY[0x1E4FA6AB8] defaultStyleConfiguration];
        }
      }
      else
      {
        v13 = 0;
      }
      goto LABEL_6;
    }
    id v9 = v11;
  }
  id v11 = v9;
  v13 = v9;
LABEL_6:

  return v13;
}

- (uint64_t)sbh_iconImageStyleConfiguration
{
  return objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
}

- (id)sbh_iconTintColorInferringIfNecessary:()SpringBoardHome
{
  id v5 = self;
  uint64_t v6 = [a1 objectForTrait:v5];

  v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = 0;
    if (!a3) {
      goto LABEL_17;
    }
LABEL_5:
    uint64_t v10 = self;
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v12 = v6;
      if ([v12 appearanceType] != 2) {
        goto LABEL_15;
      }
    }
    else
    {
      v13 = self;
      char v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
      {
        getPUIStylePickerHomeScreenConfigurationClass();
        uint64_t v17 = self;
        char v18 = objc_opt_isKindOfClass();

        if ((v18 & 1) == 0) {
          goto LABEL_17;
        }
        id v19 = v6;
        if ([v19 styleType] != 3) {
          goto LABEL_15;
        }
        uint64_t v15 = [v19 accentColor];
LABEL_11:
        v16 = (void *)v15;
LABEL_16:

        id v9 = v16;
        goto LABEL_17;
      }
      id v12 = v6;
      if ([v12 configurationType] != 4)
      {
LABEL_15:
        v16 = 0;
        goto LABEL_16;
      }
    }
    uint64_t v15 = [v12 tintColor];
    goto LABEL_11;
  }
  id v9 = v6;
  if (a3) {
    goto LABEL_5;
  }
LABEL_17:
  id v20 = v9;

  return v20;
}

+ (uint64_t)sbh_userInterfaceStyleForIconImageAppearance:()SpringBoardHome
{
  return 2 * ((unint64_t)([a3 appearanceType] - 1) < 2);
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome
{
  if (a3) {
    objc_msgSend(a3, "sbh_iconImageAppearance");
  }
  else {
  v3 = +[SBHIconImageAppearance defaultAppearance];
  }
  return v3;
}

+ (id)sbh_traitCollectionWithIconImageAppearance:()SpringBoardHome
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageAppearance___block_invoke;
  v8[3] = &unk_1E6AAFA90;
  id v9 = v4;
  uint64_t v10 = a1;
  id v5 = v4;
  uint64_t v6 = [a1 traitCollectionWithTraits:v8];

  return v6;
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = objc_msgSend(a3, "sbh_iconImageAppearance");
    if (!v6)
    {
      uint64_t v6 = +[SBHIconImageAppearance defaultAppearance];
    }
  }

  return v6;
}

- (uint64_t)sbh_iconTintColor
{
  return objc_msgSend(a1, "sbh_iconTintColorInferringIfNecessary:", 1);
}

+ (id)sbh_traitCollectionWithIconTintColor:()SpringBoardHome
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconTintColor___block_invoke;
  v8[3] = &unk_1E6AAFA68;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 traitCollectionWithTraits:v8];

  return v6;
}

- (uint64_t)sbh_homeScreenIconStyleConfiguration
{
  return objc_msgSend(a1, "sbh_homeScreenIconStyleConfiguration:", 1);
}

+ (id)sbh_iconImageStyleConfigurationFromTraitCollection:()SpringBoardHome
{
  if (a3) {
    objc_msgSend(a3, "sbh_iconImageStyleConfiguration");
  }
  else {
  v3 = +[SBHIconImageStyleConfiguration defaultStyleConfiguration];
  }
  return v3;
}

+ (id)sbh_iconImageStyleConfigurationFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:overrideIconImageStyleConfiguration:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8)
  {
    id v11 = +[SBHIconImageStyleConfiguration styleConfigurationWithIconImageAppearance:v8];
  }
  else if (v9)
  {
    id v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;

  return v12;
}

+ (id)sbh_traitCollectionWithIconImageStyleConfiguration:()SpringBoardHome
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration___block_invoke;
  v8[3] = &unk_1E6AAFA68;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 traitCollectionWithTraits:v8];

  return v6;
}

+ (id)sbh_traitCollectionWithIconImageStyleConfiguration:()SpringBoardHome userInterfaceStyle:
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration_userInterfaceStyle___block_invoke;
  v10[3] = &unk_1E6AAFA90;
  id v11 = v6;
  uint64_t v12 = a4;
  id v7 = v6;
  id v8 = [a1 traitCollectionWithTraits:v10];

  return v8;
}

- (uint64_t)sbh_iconImageUserInterfaceStyle
{
  uint64_t v2 = [a1 userInterfaceStyle];
  v3 = objc_msgSend(a1, "sbh_homeScreenStyleConfiguration");
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 styleType];
    if ((unint64_t)(v5 - 1) < 3) {
      uint64_t v2 = 3 - v5;
    }
  }
  id v6 = objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 0);
  if (v6) {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_userInterfaceStyleForIconImageAppearance:", v6);
  }
  id v7 = objc_msgSend(a1, "sbh_iconTintColor");
  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v2;
  }

  return v8;
}

- (uint64_t)sbh_widgetUserInterfaceStyle
{
  uint64_t v2 = [a1 userInterfaceStyle];
  v3 = objc_msgSend(a1, "sbh_homeScreenStyleConfiguration");
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 styleType];
    uint64_t v6 = 2;
    if (v5 != 1) {
      uint64_t v6 = v2;
    }
    if (v5 == 3) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = v6;
    }
  }
  else
  {
    id v7 = objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 0);
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = [v7 widgetAppearanceWithUserInterfaceStyle:v2];
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_userInterfaceStyleForIconImageAppearance:", v9);
    }
    else
    {
      id v9 = objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 0);
      if (v9) {
        uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_userInterfaceStyleForIconImageAppearance:", v9);
      }
      uint64_t v10 = objc_msgSend(a1, "sbh_iconTintColor");
      if (v10) {
        uint64_t v2 = 0;
      }
    }
  }

  return v2;
}

+ (id)sbh_traitCollectionWithHomeScreenStyleConfiguration:()SpringBoardHome
{
  uint64_t v2 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithHomeScreenStyleConfiguration___block_invoke;
  v6[3] = &unk_1E6AAFA68;
  id v7 = v2;
  id v3 = v2;
  id v4 = [a1 traitCollectionWithTraits:v6];

  return v4;
}

+ (id)sbh_traitCollectionWithHomeScreenStyleConfiguration:()SpringBoardHome userInterfaceStyle:
{
  uint64_t v6 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:");
  id v7 = objc_msgSend(a1, "sbh_traitCollectionWithIconImageStyleConfiguration:userInterfaceStyle:", v6, a4);

  return v7;
}

- (id)sbh_iconImageAppearanceWithHomeScreenStyleConfiguration:()SpringBoardHome
{
  uint64_t v2 = +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:");
  id v3 = objc_msgSend(v2, "iconImageAppearanceWithUserInterfaceStyle:", objc_msgSend(a1, "userInterfaceStyle"));

  return v3;
}

- (uint64_t)sbh_hasIconTintColorOrDarkStyle
{
  if (objc_msgSend(a1, "sbh_iconImageUserInterfaceStyle") != 1) {
    return 1;
  }
  uint64_t v2 = objc_msgSend(a1, "sbh_iconTintColor");
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)sbh_automaticallyChangesWithUserInterfaceStyle
{
  v1 = objc_msgSend(a1, "sbh_iconImageStyleConfiguration");
  uint64_t v2 = v1;
  if (v1) {
    BOOL v3 = [v1 configurationType] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (uint64_t)sbh_materialUserInterfaceStyleFromTraitCollection:()SpringBoardHome
{
  uint64_t v2 = objc_msgSend(a1, "sbh_iconImageAppearanceFromTraitCollection:");
  uint64_t v3 = objc_msgSend(a1, "sbh_userInterfaceStyleForIconImageAppearance:", v2);

  return v3;
}

+ (id)sbh_highestLevelTraitCollectionForView:()SpringBoardHome
{
  id v3 = a3;
  id v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  uint64_t v6 = [v5 traitCollection];

  if (!v6)
  {
    id v7 = v3;
    uint64_t v8 = [v7 superview];

    if (v8)
    {
      do
      {
        id v9 = [v7 superview];

        uint64_t v10 = [v9 superview];

        id v7 = v9;
      }
      while (v10);
    }
    else
    {
      id v9 = v7;
    }
    uint64_t v6 = [v9 traitCollection];
  }
  return v6;
}

+ (id)sbh_highestLevelTraitCollectionForViewController:()SpringBoardHome
{
  id v3 = a3;
  id v4 = [v3 viewIfLoaded];
  uint64_t v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];
  id v7 = [v6 traitCollection];

  if (!v7)
  {
    id v8 = v3;
    id v9 = [v8 parentViewController];

    if (v9)
    {
      do
      {
        uint64_t v10 = [v8 parentViewController];

        id v11 = [v10 parentViewController];

        id v8 = v10;
      }
      while (v11);
    }
    else
    {
      uint64_t v10 = v8;
    }
    id v7 = [v10 traitCollection];
  }
  return v7;
}

@end