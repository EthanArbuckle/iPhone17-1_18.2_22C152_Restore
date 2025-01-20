@interface PRSPosterUpdate
+ (BOOL)supportsSecureCoding;
+ (id)posterUpdateAmbientConfigurationForCreation:(id)a3 deletion:(id)a4 editingBehavior:(id)a5 supportedDataLayout:(id)a6;
+ (id)posterUpdateAmbientWidgets:(id)a3;
+ (id)posterUpdateAssociateWithChargerIdentifier:(id)a3;
+ (id)posterUpdateComplications:(id)a3;
+ (id)posterUpdateDisassociateFromChargerIdentifier:(id)a3;
+ (id)posterUpdateHomeScreenAppearance:(unint64_t)a3;
+ (id)posterUpdateHomeScreenAppearanceDimWithValue:(BOOL)a3;
+ (id)posterUpdateHomeScreenColor:(id)a3;
+ (id)posterUpdateHomeScreenGradient:(id)a3;
+ (id)posterUpdateHomeScreenIconUserInterfaceStyle:(id)a3;
+ (id)posterUpdateHomeScreenPosterLegibilityBlurWithValue:(BOOL)a3;
+ (id)posterUpdateHomeScreenPosterProvider:(id)a3 sessionInfo:(id)a4;
+ (id)posterUpdateHomeScreenPosterWithImageAtURL:(id)a3;
+ (id)posterUpdateHomeScreenSuggestedTintColor:(id)a3;
+ (id)posterUpdateHomeScreenTintForColor:(id)a3;
+ (id)posterUpdateHomeScreenTintWithVariation:(id)a3 saturation:(id)a4 luminance:(id)a5;
+ (id)posterUpdateInlineComplication:(id)a3;
+ (id)posterUpdateLegibilityBlurWithValue:(BOOL)a3;
+ (id)posterUpdateLockScreenPosterWithImageAtURL:(id)a3;
+ (id)posterUpdateMirroredHomeScreenLegibilityBlurWithValue:(BOOL)a3;
+ (id)posterUpdatePosterWithSessionInfo:(id)a3;
+ (id)posterUpdateShouldUseLargeHomeScreenIcons:(id)a3;
+ (id)posterUpdateSidebarComplications:(id)a3;
+ (id)posterUpdateUserInfo:(id)a3;
+ (id)posterUpdatesForDecoratedSessionInfo:(id)a3;
+ (id)posterUpdatesForWFWallpaperConfiguration:(id)a3;
+ (id)posterUpdatesForWFWallpaperConfiguration:(id)a3 sessionInfo:(id)a4;
- (BOOL)updateNecessitatesPosterUpdate;
- (PRSPosterUpdate)initWithCoder:(id)a3;
- (PRSPosterUpdatePayload)payload;
- (id)_initWithUpdateType:(unint64_t)a3 payload:(id)a4;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterUpdate

- (id)_initWithUpdateType:(unint64_t)a3 payload:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRSPosterUpdate;
  v7 = [(PRSPosterUpdate *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    payload = v8->_payload;
    v8->_payload = (PRSPosterUpdatePayload *)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)updateNecessitatesPosterUpdate
{
  return (self->_type & 0xFFFFFFFFFFFFFFFELL) == 10;
}

- (void)encodeWithCoder:(id)a3
{
  payload = self->_payload;
  id v5 = a3;
  [v5 encodeObject:payload forKey:@"_payload"];
  [v5 encodeInteger:self->_type forKey:@"_type"];
}

- (PRSPosterUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PRSPosterUpdate;
  id v5 = [(PRSPosterUpdate *)&v17 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v7 = self;
    v8 = self;
    uint64_t v9 = self;
    v10 = self;
    v11 = self;
    objc_super v12 = self;
    v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, 0);

    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_payload"];
    payload = v5->_payload;
    v5->_payload = (PRSPosterUpdatePayload *)v14;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = NSStringFromPRSPosterUpdateType(self->_type);
  [v3 appendString:v4 withName:@"type"];

  id v5 = (id)[v3 appendObject:self->_payload withName:@"payload"];
  if (self->_type == 9)
  {
    payload = self->_payload;
    uint64_t v7 = objc_opt_class();
    v8 = payload;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    v10 = v9;

    if (v10)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __30__PRSPosterUpdate_description__block_invoke;
      v16 = &unk_1E5D00978;
      id v17 = v3;
      v18 = v10;
      [v17 appendBodySectionWithName:@"ambientWidgets" multilinePrefix:@"\n" block:&v13];
    }
    else
    {
      [v3 appendString:@"unable to read property list payload for ambient widget update" withName:@"ambientWidget update payload error"];
    }
  }
  v11 = objc_msgSend(v3, "build", v13, v14, v15, v16);

  return v11;
}

void __30__PRSPosterUpdate_description__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) propertyListRoot];
  v2 = PRSPosterUpdateAmbientWidgetsIdentifiers(v4);
  id v3 = (id)[v1 appendObject:v2 withName:@"ambientWidgetDebugInfo"];
}

+ (id)posterUpdateUserInfo:(id)a3
{
  id v3 = a3;
  if (v3 && (NSClassFromString(&cfstr_Nsdictionary.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateUserInfo:]();
    }
    [v7 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v4 = [[PRSPosterUpdatePropertyListPayload alloc] initWithPropertyList:v3];
    id v5 = [[PRSPosterUpdate alloc] _initWithUpdateType:18 payload:v4];

    return v5;
  }
  return result;
}

+ (id)posterUpdateMirroredHomeScreenLegibilityBlurWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [PRSPosterUpdateTristatePayload alloc];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  uint64_t v7 = [(PRSPosterUpdateTristatePayload *)v5 initWithState:v6];
  id v8 = [(PRSPosterUpdate *)v4 _initWithUpdateType:5 payload:v7];

  return v8;
}

+ (id)posterUpdateHomeScreenPosterLegibilityBlurWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [PRSPosterUpdateTristatePayload alloc];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  uint64_t v7 = [(PRSPosterUpdateTristatePayload *)v5 initWithState:v6];
  id v8 = [(PRSPosterUpdate *)v4 _initWithUpdateType:4 payload:v7];

  return v8;
}

+ (id)posterUpdateLegibilityBlurWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [PRSPosterUpdateTristatePayload alloc];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  uint64_t v7 = [(PRSPosterUpdateTristatePayload *)v5 initWithState:v6];
  id v8 = [(PRSPosterUpdate *)v4 _initWithUpdateType:3 payload:v7];

  return v8;
}

+ (id)posterUpdateInlineComplication:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    NSClassFromString(&cfstr_Prswidget.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSWidgetClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PRSPosterUpdate posterUpdateInlineComplication:]();
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78D3308);
    }
  }

  id v4 = [PRSPosterUpdateComplicationPayload alloc];
  id v5 = v4;
  if (v3)
  {
    v11[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v7 = [(PRSPosterUpdateComplicationPayload *)v5 initWithComplications:v6];
  }
  else
  {
    uint64_t v7 = [(PRSPosterUpdateComplicationPayload *)v4 initWithComplications:MEMORY[0x1E4F1CBF0]];
  }
  id v8 = [[PRSPosterUpdate alloc] _initWithUpdateType:2 payload:v7];

  return v8;
}

+ (id)posterUpdateComplications:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    id v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PRSPosterUpdate posterUpdateComplications:]();
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78D33C0);
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  id v6 = [[PRSPosterUpdateComplicationPayload alloc] initWithComplications:v4];
  id v7 = [[PRSPosterUpdate alloc] _initWithUpdateType:1 payload:v6];

  return v7;
}

+ (id)posterUpdateSidebarComplications:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    id v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PRSPosterUpdate posterUpdateSidebarComplications:]();
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A78D34E4);
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }

  id v6 = [[PRSPosterUpdateComplicationPayload alloc] initWithComplications:v4];
  id v7 = [[PRSPosterUpdate alloc] _initWithUpdateType:8 payload:v6];

  return v7;
}

+ (id)posterUpdateAmbientWidgets:(id)a3
{
  id v3 = a3;
  if (v3 && (NSClassFromString(&cfstr_Nsdictionary.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateAmbientWidgets:]();
    }
    [v8 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v4 = [[PRSPosterUpdatePropertyListPayload alloc] initWithPropertyList:v3];
    id v5 = PRSLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateAmbientWidgets:](v3, v5);
    }

    id v6 = [[PRSPosterUpdate alloc] _initWithUpdateType:9 payload:v4];
    return v6;
  }
  return result;
}

+ (id)posterUpdateHomeScreenPosterProvider:(id)a3 sessionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    objc_super v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:]();
    }
LABEL_19:
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D3800);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D3864);
  }

  id v8 = v6;
  NSClassFromString(&cfstr_Prsposterupdat_18.isa);
  if (!v8)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:]();
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D38C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:sessionInfo:]();
    }
    goto LABEL_19;
  }

  uint64_t v9 = [[PRSPosterUpdateHomeScreenAppearancePayload alloc] initWithUpdatedAppearanceType:0 updateHomePoster:v8 homeProviderIdentifier:v7];
  id v10 = [[PRSPosterUpdate alloc] _initWithUpdateType:6 payload:v9];

  return v10;
}

+ (id)posterUpdatePosterWithSessionInfo:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Prsposterupdat_18.isa);
  if (!v3)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:]();
    }
LABEL_11:
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D3A48);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:]();
    }
    goto LABEL_11;
  }

  id v4 = [[PRSPosterUpdateHomeScreenAppearancePayload alloc] initWithUpdatedAppearanceType:0 updateSwitcherPoster:v3];
  id v5 = [[PRSPosterUpdate alloc] _initWithUpdateType:7 payload:v4];

  return v5;
}

+ (id)posterUpdatesForDecoratedSessionInfo:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSClassFromString(&cfstr_Prsposterupdat_18.isa);
  if (!v4)
  {
    objc_super v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForDecoratedSessionInfo:]();
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D3C64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForDecoratedSessionInfo:]();
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D3CC8);
  }

  id v5 = objc_opt_new();
  id v6 = [v4 shortcutsWallpaperConfiguration];

  if (v6)
  {
    id v7 = [v4 shortcutsWallpaperConfiguration];
    id v8 = [a1 posterUpdatesForWFWallpaperConfiguration:v7 sessionInfo:v4];
    [v5 addObjectsFromArray:v8];

    id v9 = v5;
  }
  else
  {
    id v10 = +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:v4];
    v14[0] = v10;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  return v9;
}

+ (id)posterUpdatesForWFWallpaperConfiguration:(id)a3 sessionInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  NSClassFromString(&cfstr_Wfwallpapercon.isa);
  if (!v7)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:]();
    }
LABEL_35:
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D3FA4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:WFWallpaperConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D4008);
  }

  id v8 = v6;
  NSClassFromString(&cfstr_Prsposterupdat_18.isa);
  if (!v8)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D406CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRSPosterUpdateSessionInfoClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D40D0);
  }

  id v9 = [v8 shortcutsWallpaperConfiguration];
  char v10 = [v9 isEqual:v7];

  if ((v10 & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"sessionInfo && [[sessionInfo shortcutsWallpaperConfiguration] isEqual:wallpaperConfiguration]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:sessionInfo:]();
    }
    goto LABEL_35;
  }
  uint64_t v11 = [v7 location];
  objc_super v12 = objc_opt_new();
  uint64_t v13 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  [(PRSPosterUpdateSessionInfo *)v13 setShortcutsWallpaperConfiguration:v7];
  if (!v11 || v11 == 2)
  {
    v16 = +[PRSPosterUpdate posterUpdatePosterWithSessionInfo:v13];
    [v12 addObject:v16];

    if (v11 != 2) {
      goto LABEL_13;
    }
    uint64_t v15 = 1;
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_13;
    }
    uint64_t v14 = +[PRSPosterUpdate posterUpdateHomeScreenPosterProvider:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" sessionInfo:v13];
    [v12 addObject:v14];

    uint64_t v15 = 4;
  }
  id v17 = +[PRSPosterUpdate posterUpdateHomeScreenAppearance:v15];
  [v12 addObject:v17];

LABEL_13:
  v18 = [v7 legibilityBlur];

  if (v18)
  {
    if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      v19 = [v7 legibilityBlur];
      v20 = +[PRSPosterUpdate posterUpdateMirroredHomeScreenLegibilityBlurWithValue:](PRSPosterUpdate, "posterUpdateMirroredHomeScreenLegibilityBlurWithValue:", [v19 BOOLValue]);
      [v12 addObject:v20];
    }
    if (v11 == 1)
    {
      v21 = [v7 legibilityBlur];
      v22 = +[PRSPosterUpdate posterUpdateHomeScreenPosterLegibilityBlurWithValue:](PRSPosterUpdate, "posterUpdateHomeScreenPosterLegibilityBlurWithValue:", [v21 BOOLValue]);
      [v12 addObject:v22];
    }
  }

  return v12;
}

+ (id)posterUpdatesForWFWallpaperConfiguration:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Wfwallpapercon.isa);
  if (!v4)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:]();
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D4248);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:WFWallpaperConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdatesForWFWallpaperConfiguration:]();
    }
    goto LABEL_11;
  }

  id v5 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  [(PRSPosterUpdateSessionInfo *)v5 setShortcutsWallpaperConfiguration:v4];
  id v6 = [a1 posterUpdatesForWFWallpaperConfiguration:v4 sessionInfo:v5];

  return v6;
}

+ (id)posterUpdateHomeScreenGradient:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Bscolor.isa);
  if (!v3)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenGradient:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D43ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSColorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenGradient:]();
    }
    goto LABEL_11;
  }

  id v4 = [PRSPosterUpdateHomeScreenAppearancePayload alloc];
  id v5 = [[PRSPosterUpdateColorPayload alloc] initWithColor:v3];
  id v6 = [(PRSPosterUpdateHomeScreenAppearancePayload *)v4 initWithUpdatedAppearanceType:0 gradientColorAppearance:v5];

  id v7 = [[PRSPosterUpdate alloc] _initWithUpdateType:6 payload:v6];
  return v7;
}

+ (id)posterUpdateHomeScreenColor:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Bscolor.isa);
  if (!v3)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenColor:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A78D4590);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSColorClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PRSPosterUpdate posterUpdateHomeScreenColor:]();
    }
    goto LABEL_11;
  }

  id v4 = [PRSPosterUpdateHomeScreenAppearancePayload alloc];
  id v5 = [[PRSPosterUpdateColorPayload alloc] initWithColor:v3];
  id v6 = [(PRSPosterUpdateHomeScreenAppearancePayload *)v4 initWithUpdatedAppearanceType:0 solidColorAppearance:v5];

  id v7 = [[PRSPosterUpdate alloc] _initWithUpdateType:6 payload:v6];
  return v7;
}

+ (id)posterUpdateHomeScreenAppearance:(unint64_t)a3
{
  id v3 = [[PRSPosterUpdateHomeScreenAppearancePayload alloc] initWithUpdatedAppearanceType:a3];
  id v4 = [[PRSPosterUpdate alloc] _initWithUpdateType:6 payload:v3];

  return v4;
}

+ (id)posterUpdateHomeScreenPosterWithImageAtURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  id v5 = objc_alloc(MEMORY[0x1E4FB4A20]);
  id v6 = (void *)[v5 initWithURL:v3 location:1 legibilityBlur:MEMORY[0x1E4F1CC28] smartCrop:MEMORY[0x1E4F1CC28] usePreview:MEMORY[0x1E4F1CC28]];

  [(PRSPosterUpdateSessionInfo *)v4 setShortcutsWallpaperConfiguration:v6];
  id v7 = [[PRSPosterUpdateHomeScreenAppearancePayload alloc] initWithUpdatedAppearanceType:4 updateHomePoster:v4 homeProviderIdentifier:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
  id v8 = [[PRSPosterUpdate alloc] _initWithUpdateType:6 payload:v7];

  return v8;
}

+ (id)posterUpdateLockScreenPosterWithImageAtURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PRSPosterUpdateSessionInfo);
  id v5 = objc_alloc(MEMORY[0x1E4FB4A20]);
  id v6 = (void *)[v5 initWithURL:v3 location:0 legibilityBlur:MEMORY[0x1E4F1CC28] smartCrop:MEMORY[0x1E4F1CC28] usePreview:MEMORY[0x1E4F1CC28]];

  [(PRSPosterUpdateSessionInfo *)v4 setShortcutsWallpaperConfiguration:v6];
  id v7 = [[PRSPosterUpdateHomeScreenAppearancePayload alloc] initWithUpdatedAppearanceType:0 updateSwitcherPoster:v4];
  id v8 = [[PRSPosterUpdate alloc] _initWithUpdateType:7 payload:v7];

  return v8;
}

+ (id)posterUpdateHomeScreenTintWithVariation:(id)a3 saturation:(id)a4 luminance:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = [PRSPosterUpdate alloc];
  uint64_t v11 = [[PRSPosterUpdateDiscreteStylePayload alloc] initWithVariation:v9 saturation:v8 luminance:v7];

  id v12 = [(PRSPosterUpdate *)v10 _initWithUpdateType:14 payload:v11];
  return v12;
}

+ (id)posterUpdateHomeScreenTintForColor:(id)a3
{
  id v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [[PRSPosterUpdateColorPayload alloc] initWithColor:v3];

  id v6 = [(PRSPosterUpdate *)v4 _initWithUpdateType:14 payload:v5];
  return v6;
}

+ (id)posterUpdateHomeScreenSuggestedTintColor:(id)a3
{
  id v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [[PRSPosterUpdateColorPayload alloc] initWithColor:v3];

  id v6 = [(PRSPosterUpdate *)v4 _initWithUpdateType:15 payload:v5];
  return v6;
}

+ (id)posterUpdateHomeScreenAppearanceDimWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [PRSPosterUpdateTristatePayload alloc];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  id v7 = [(PRSPosterUpdateTristatePayload *)v5 initWithState:v6];
  id v8 = [(PRSPosterUpdate *)v4 _initWithUpdateType:13 payload:v7];

  return v8;
}

+ (id)posterUpdateShouldUseLargeHomeScreenIcons:(id)a3
{
  id v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [[PRSPosterUpdateTristatePayload alloc] initWithState:v3];

  id v6 = [(PRSPosterUpdate *)v4 _initWithUpdateType:16 payload:v5];
  return v6;
}

+ (id)posterUpdateHomeScreenIconUserInterfaceStyle:(id)a3
{
  id v3 = a3;
  id v4 = [PRSPosterUpdate alloc];
  id v5 = [PRSPosterUpdatePropertyListPayload alloc];
  id v6 = [v3 dataUsingEncoding:4];

  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1C9B8] data];
  }
  id v8 = [(PRSPosterUpdatePropertyListPayload *)v5 initWithPropertyListData:v7];
  id v9 = [(PRSPosterUpdate *)v4 _initWithUpdateType:17 payload:v8];

  if (!v6) {
  return v9;
  }
}

+ (id)posterUpdateAssociateWithChargerIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [PRSPosterUpdatePropertyListPayload alloc];
  id v5 = v4;
  if (v3)
  {
    uint64_t v11 = @"chargerIdentifier";
    v12[0] = v3;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v7 = [(PRSPosterUpdatePropertyListPayload *)v5 initWithPropertyList:v6];
  }
  else
  {
    id v7 = [(PRSPosterUpdatePropertyListPayload *)v4 initWithPropertyList:MEMORY[0x1E4F1CC08]];
  }
  id v8 = [PRSPosterUpdate alloc];

  id v9 = [(PRSPosterUpdate *)v8 _initWithUpdateType:10 payload:v7];
  return v9;
}

+ (id)posterUpdateDisassociateFromChargerIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [PRSPosterUpdatePropertyListPayload alloc];
  id v5 = v4;
  if (v3)
  {
    uint64_t v11 = @"chargerIdentifier";
    v12[0] = v3;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v7 = [(PRSPosterUpdatePropertyListPayload *)v5 initWithPropertyList:v6];
  }
  else
  {
    id v7 = [(PRSPosterUpdatePropertyListPayload *)v4 initWithPropertyList:MEMORY[0x1E4F1CC08]];
  }
  id v8 = [PRSPosterUpdate alloc];

  id v9 = [(PRSPosterUpdate *)v8 _initWithUpdateType:11 payload:v7];
  return v9;
}

+ (id)posterUpdateAmbientConfigurationForCreation:(id)a3 deletion:(id)a4 editingBehavior:(id)a5 supportedDataLayout:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = v13;
  if (v9) {
    [v13 setObject:v9 forKeyedSubscript:@"creationBehavior"];
  }
  if (v10) {
    [v14 setObject:v10 forKeyedSubscript:@"deletionBehavior"];
  }
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:@"editingBehavior"];
  }
  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:@"supportedDataLayout"];
  }
  uint64_t v15 = [PRSPosterUpdatePropertyListPayload alloc];
  v16 = (void *)[v14 copy];
  id v17 = [(PRSPosterUpdatePropertyListPayload *)v15 initWithPropertyList:v16];

  id v18 = [[PRSPosterUpdate alloc] _initWithUpdateType:12 payload:v17];
  return v18;
}

- (unint64_t)type
{
  return self->_type;
}

- (PRSPosterUpdatePayload)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
}

+ (void)posterUpdateUserInfo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateInlineComplication:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateComplications:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateSidebarComplications:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateAmbientWidgets:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = PRSPosterUpdateAmbientWidgetsIdentifiers(a1);
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1A78AC000, a2, OS_LOG_TYPE_ERROR, "Building PRSPosterUpdate for ambient widgets: %{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)posterUpdateAmbientWidgets:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateHomeScreenPosterProvider:sessionInfo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateHomeScreenPosterProvider:sessionInfo:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatePosterWithSessionInfo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatesForDecoratedSessionInfo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatesForWFWallpaperConfiguration:sessionInfo:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatesForWFWallpaperConfiguration:sessionInfo:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatesForWFWallpaperConfiguration:sessionInfo:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdatesForWFWallpaperConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateHomeScreenGradient:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)posterUpdateHomeScreenColor:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1A78AC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end