@interface SSShortcutResultBuilder
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)isAlarmResult;
- (BOOL)isBackgroundRunnable;
- (BOOL)isCustomAppAttributedShortcut;
- (BOOL)resultShadowsSettingResult;
- (NSArray)alternateNames;
- (NSString)actionIdentifier;
- (NSString)biomeStreamIdentifier;
- (NSString)domainIdentifier;
- (NSString)lnPropertyIdentifier;
- (NSString)name;
- (NSString)numberOfActionsString;
- (NSString)primaryPhrase;
- (NSString)punchoutLabel;
- (NSString)settingsPreference;
- (NSString)userActivityRequiredString;
- (SSShortcutResultBuilder)initWithResult:(id)a3;
- (id)buildAppTopHitEntityCardSection;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildCompactThumbnail;
- (id)buildDescriptions;
- (id)buildDetailedRowCardSection;
- (id)buildFootnote;
- (id)buildResult;
- (id)buildStandardThumbnail;
- (id)buildThumbnail;
- (id)buildTitle;
- (id)buildTrailingThumbnail;
- (unint64_t)entityBadgeType;
- (unint64_t)entityThumbnailDisplayStyle;
- (void)setActionIdentifier:(id)a3;
- (void)setAlternateNames:(id)a3;
- (void)setBiomeStreamIdentifier:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setEntityBadgeType:(unint64_t)a3;
- (void)setEntityThumbnailDisplayStyle:(unint64_t)a3;
- (void)setIsAlarmResult:(BOOL)a3;
- (void)setIsBackgroundRunnable:(BOOL)a3;
- (void)setIsCustomAppAttributedShortcut:(BOOL)a3;
- (void)setLnPropertyIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setNumberOfActionsString:(id)a3;
- (void)setPrimaryPhrase:(id)a3;
- (void)setPunchoutLabel:(id)a3;
- (void)setSettingsPreference:(id)a3;
- (void)setUserActivityRequiredString:(id)a3;
@end

@implementation SSShortcutResultBuilder

+ (id)bundleId
{
  return @"com.apple.shortcuts";
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSShortcutResultBuilder;
  if (objc_msgSendSuper2(&v9, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 resultBundleId];
    v7 = [(id)objc_opt_class() bundleId];
    char v5 = [v6 isEqualToString:v7];
  }
  return v5;
}

- (SSShortcutResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SSShortcutResultBuilder;
  char v5 = [(SSResultBuilder *)&v32 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22A78] withType:objc_opt_class()];
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22B40] withType:objc_opt_class()];
    -[SSShortcutResultBuilder setIsBackgroundRunnable:](v5, "setIsBackgroundRunnable:", [v7 BOOLValue]);

    v8 = [v6 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v9 = v6;
    }
    else {
      objc_super v9 = 0;
    }
    [(SSShortcutResultBuilder *)v5 setAlternateNames:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setName:v10];

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setNumberOfActionsString:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F23408] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setPunchoutLabel:v12];

    v13 = [v4 valueForAttribute:*MEMORY[0x1E4F23518] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setSettingsPreference:v13];

    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F23510] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setActionIdentifier:v14];

    v15 = [v4 valueForAttribute:*MEMORY[0x1E4F22D28] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setDomainIdentifier:v15];

    v16 = [v4 valueForAttribute:*MEMORY[0x1E4F23558] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setLnPropertyIdentifier:v16];

    v17 = [v4 valueForAttribute:*MEMORY[0x1E4F23560] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setPrimaryPhrase:v17];

    v18 = [v4 valueForAttribute:*MEMORY[0x1E4F23520] withType:objc_opt_class()];
    [(SSShortcutResultBuilder *)v5 setBiomeStreamIdentifier:v18];

    v19 = [v4 valueForAttribute:*MEMORY[0x1E4F23538] withType:objc_opt_class()];
    v20 = v19;
    if (v19) {
      uint64_t v21 = [v19 unsignedIntegerValue];
    }
    else {
      uint64_t v21 = 0;
    }
    [(SSShortcutResultBuilder *)v5 setEntityThumbnailDisplayStyle:v21];
    v22 = [v4 valueForAttribute:*MEMORY[0x1E4F23568] withType:objc_opt_class()];
    v23 = v22;
    if (v22) {
      uint64_t v24 = [v22 unsignedIntegerValue];
    }
    else {
      uint64_t v24 = 0;
    }
    [(SSShortcutResultBuilder *)v5 setEntityBadgeType:v24];
    v25 = [(SSResultBuilder *)v5 relatedAppBundleIdentifier];
    if ([v25 isEqualToString:@"com.apple.mobiletimer"])
    {
      v26 = [(SSShortcutResultBuilder *)v5 domainIdentifier];
      v27 = (void *)MEMORY[0x1E4FB49E8];
      v28 = [(SSResultBuilder *)v5 relatedAppBundleIdentifier];
      v29 = [v27 spotlightDomainIdentifierForBundleIdentifier:v28];
      -[SSShortcutResultBuilder setIsAlarmResult:](v5, "setIsAlarmResult:", [v26 isEqual:v29]);
    }
    else
    {
      [(SSShortcutResultBuilder *)v5 setIsAlarmResult:0];
    }

    v30 = [(SSShortcutResultBuilder *)v5 domainIdentifier];
    -[SSShortcutResultBuilder setIsCustomAppAttributedShortcut:](v5, "setIsCustomAppAttributedShortcut:", [v30 isEqualToString:*MEMORY[0x1E4FB4C00]]);
  }
  return v5;
}

- (id)buildResult
{
  v6.receiver = self;
  v6.super_class = (Class)SSShortcutResultBuilder;
  v3 = [(SSResultBuilder *)&v6 buildResult];
  id v4 = [(SSShortcutResultBuilder *)self userActivityRequiredString];
  [v3 setUserActivityRequiredString:v4];

  [v3 setType:20];
  return v3;
}

- (id)buildTitle
{
  v3 = [(SSResultBuilder *)self result];
  if (![v3 shouldUseCompactDisplay]
    || [(SSShortcutResultBuilder *)self isCustomAppAttributedShortcut])
  {

LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)SSShortcutResultBuilder;
    id v4 = [(SSResultBuilder *)&v10 buildTitle];
    [v4 setMaxLines:2];
    goto LABEL_5;
  }
  objc_super v6 = [(SSShortcutResultBuilder *)self primaryPhrase];
  uint64_t v7 = [v6 length];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = (void *)MEMORY[0x1E4F9A378];
  objc_super v9 = [(SSShortcutResultBuilder *)self primaryPhrase];
  id v4 = [v8 textWithString:v9];

LABEL_5:
  return v4;
}

- (id)buildStandardThumbnail
{
  v3 = [(SSShortcutResultBuilder *)self lnPropertyIdentifier];

  if (v3)
  {
    id v4 = objc_opt_new();
    char v5 = [(SSShortcutResultBuilder *)self lnPropertyIdentifier];
    [v4 setLnPropertyIdentifier:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSShortcutResultBuilder;
    id v4 = [(SSResultBuilder *)&v7 buildThumbnail];
  }
  objc_msgSend(v4, "setCornerRoundingStyle:", 4 * (-[SSShortcutResultBuilder entityThumbnailDisplayStyle](self, "entityThumbnailDisplayStyle") == 1));
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  id v4 = a3;
  char v5 = [(SSShortcutResultBuilder *)self biomeStreamIdentifier];
  if ([v5 length])
  {

LABEL_4:
    objc_super v7 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  v9.receiver = self;
  v9.super_class = (Class)SSShortcutResultBuilder;
  objc_super v7 = [(SSResultBuilder *)&v9 buildBadgingImageWithThumbnail:v4];
LABEL_6:

  return v7;
}

- (id)buildCompactThumbnail
{
  v3 = objc_opt_new();
  id v4 = [(SSResultBuilder *)self relatedAppBundleIdentifier];
  [v3 setBundleIdentifier:v4];

  return v3;
}

- (id)buildThumbnail
{
  v3 = [(SSResultBuilder *)self result];
  id v4 = [v3 valueForAttribute:*MEMORY[0x1E4F23640] withType:objc_opt_class()];

  char v5 = [(SSResultBuilder *)self result];
  if (![v5 shouldUseCompactDisplay]
    || [(SSShortcutResultBuilder *)self isCustomAppAttributedShortcut])
  {

LABEL_4:
    uint64_t v6 = [(SSShortcutResultBuilder *)self buildStandardThumbnail];
    goto LABEL_5;
  }

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v6 = [(SSShortcutResultBuilder *)self buildCompactThumbnail];
LABEL_5:
  objc_super v7 = (void *)v6;

  return v7;
}

- (id)buildDescriptions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F9A378];
  v3 = [(SSShortcutResultBuilder *)self numberOfActionsString];
  id v4 = [v2 textWithString:v3];
  v7[0] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (id)buildFootnote
{
  v3 = [(SSResultBuilder *)self result];
  id v4 = [v3 relatedAppIdentifier];

  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F9A378];
    objc_super v7 = [(SSShortcutResultBuilder *)self alternateNames];
    v8 = [v7 objectAtIndexedSubscript:0];
    char v5 = [v6 textWithString:v8];
  }
  return v5;
}

- (id)buildCommand
{
  if ([(SSShortcutResultBuilder *)self resultShadowsSettingResult])
  {
    v3 = objc_opt_new();
    id v4 = [(SSShortcutResultBuilder *)self settingsPreference];
    [v3 setCoreSpotlightIdentifier:v4];

    [v3 setApplicationBundleIdentifier:@"com.apple.Preferences"];
  }
  else if ([(SSShortcutResultBuilder *)self isAlarmResult])
  {
    if (buildCommand_onceToken != -1) {
      dispatch_once(&buildCommand_onceToken, &__block_literal_global_9);
    }
    v3 = objc_opt_new();
    char v5 = [(SSResultBuilder *)self result];
    uint64_t v6 = [v5 relatedAppIdentifier];
    [v3 setApplicationBundleIdentifier:v6];

    [v3 setUserActivityRequiredString:buildCommand_alarmToggleUserActivityString];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSShortcutResultBuilder;
    v3 = [(SSResultBuilder *)&v8 buildCommand];
  }
  return v3;
}

void __39__SSShortcutResultBuilder_buildCommand__block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.clock.alarm"];
  [v0 _createUserActivityStringsWithOptions:0 completionHandler:&__block_literal_global_83];
}

void __39__SSShortcutResultBuilder_buildCommand__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)buildButtonItems
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(SSShortcutResultBuilder *)self resultShadowsSettingResult])
  {
    v3 = objc_opt_new();
    v12.receiver = self;
    v12.super_class = (Class)SSShortcutResultBuilder;
    id v4 = [(SSResultBuilder *)&v12 buildCommand];
    [v3 setCommand:v4];

    v14[0] = v3;
    char v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = (void **)v14;
LABEL_5:
    objc_super v8 = [v5 arrayWithObjects:v6 count:1];

    goto LABEL_7;
  }
  if ([(SSShortcutResultBuilder *)self isAlarmResult])
  {
    v3 = objc_opt_new();
    v11.receiver = self;
    v11.super_class = (Class)SSShortcutResultBuilder;
    objc_super v7 = [(SSResultBuilder *)&v11 buildCommand];
    [v3 setCommand:v7];

    v13 = v3;
    char v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v13;
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)SSShortcutResultBuilder;
  objc_super v8 = [(SSResultBuilder *)&v10 buildButtonItems];
LABEL_7:
  return v8;
}

- (BOOL)buildButtonItemsAreTrailing
{
  if ([(SSShortcutResultBuilder *)self resultShadowsSettingResult]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSShortcutResultBuilder;
  return [(SSResultBuilder *)&v4 buildButtonItemsAreTrailing];
}

- (id)buildTrailingThumbnail
{
  v3 = [(SSResultBuilder *)self result];
  objc_super v4 = [(SSShortcutResultBuilder *)self buildStandardThumbnail];
  char v5 = [(SSResultBuilder *)self result];
  if ([v5 shouldUseCompactDisplay]
    && ![(SSShortcutResultBuilder *)self isCustomAppAttributedShortcut])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v14 = v4;
      objc_super v12 = v14;
      if (v14) {
        goto LABEL_15;
      }
    }
  }
  else
  {
  }
  uint64_t v6 = [v3 applicationBundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.shortcuts"])
  {

LABEL_7:
    objc_super v9 = [(SSResultBuilder *)self result];
    objc_super v10 = [v9 valueForAttribute:*MEMORY[0x1E4F23508] withType:objc_opt_class()];

    objc_super v11 = objc_opt_new();
    objc_super v12 = v11;
    if (v10) {
      v13 = v10;
    }
    else {
      v13 = @"app.2.stack.3d.fill";
    }
    [v11 setSymbolName:v13];
    [v12 setIsTemplate:1];

    id v14 = 0;
    goto LABEL_15;
  }
  objc_super v7 = [v3 resultBundleId];
  int v8 = [v7 isEqualToString:@"com.apple.shortcuts"];

  if (v8) {
    goto LABEL_7;
  }
  id v14 = 0;
  objc_super v12 = v4;
LABEL_15:

  return v12;
}

- (id)buildDetailedRowCardSection
{
  v6.receiver = self;
  v6.super_class = (Class)SSShortcutResultBuilder;
  v3 = [(SSResultBuilder *)&v6 buildDetailedRowCardSection];
  objc_super v4 = [(SSShortcutResultBuilder *)self actionIdentifier];
  [v3 setCommandDetail:v4];

  [v3 setButtonItemsAreTrailing:1];
  return v3;
}

- (id)buildAppTopHitEntityCardSection
{
  v16.receiver = self;
  v16.super_class = (Class)SSShortcutResultBuilder;
  v3 = [(SSResultBuilder *)&v16 buildAppTopHitEntityCardSection];
  objc_super v4 = [v3 thumbnail];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [(SSShortcutResultBuilder *)self isCustomAppAttributedShortcut]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v5 = [(SSResultBuilder *)self result];
    objc_super v6 = [v5 valueForAttribute:*MEMORY[0x1E4F23508] withType:objc_opt_class()];

    objc_super v7 = objc_opt_new();
    int v8 = v7;
    if (v6) {
      objc_super v9 = v6;
    }
    else {
      objc_super v9 = @"app.2.stack.3d.fill";
    }
    [v7 setSymbolName:v9];

    objc_super v4 = v8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v4;
    [v10 setIsTemplate:1];
    [v10 setPunchThroughBackground:1];
    [v10 setPrimaryColor:7];
    [v10 setCornerRoundingStyle:4];
  }
  unint64_t v11 = [(SSShortcutResultBuilder *)self entityBadgeType];
  if (v11 == 1)
  {
    objc_super v12 = SSPhoneBundleIdentifier;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_15;
    }
    objc_super v12 = SSFaceTimeBundleIdentifier;
  }
  v13 = objc_opt_new();
  [v13 setBundleIdentifier:*v12];
  [v4 setBadgingImage:v13];

LABEL_15:
  [v3 setThumbnail:v4];
  id v14 = [(SSShortcutResultBuilder *)self actionIdentifier];
  [v3 setCommandDetail:v14];

  return v3;
}

- (BOOL)resultShadowsSettingResult
{
  v3 = [(SSShortcutResultBuilder *)self settingsPreference];
  if ([v3 length])
  {
    objc_super v4 = [(SSResultBuilder *)self result];
    char v5 = [v4 relatedAppIdentifier];
    char v6 = [v5 isEqualToString:@"com.apple.Preferences"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isBackgroundRunnable
{
  return self->_isBackgroundRunnable;
}

- (void)setIsBackgroundRunnable:(BOOL)a3
{
  self->_isBackgroundRunnable = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)alternateNames
{
  return self->_alternateNames;
}

- (void)setAlternateNames:(id)a3
{
}

- (NSString)numberOfActionsString
{
  return self->_numberOfActionsString;
}

- (void)setNumberOfActionsString:(id)a3
{
}

- (NSString)punchoutLabel
{
  return self->_punchoutLabel;
}

- (void)setPunchoutLabel:(id)a3
{
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (void)setUserActivityRequiredString:(id)a3
{
}

- (NSString)settingsPreference
{
  return self->_settingsPreference;
}

- (void)setSettingsPreference:(id)a3
{
}

- (unint64_t)entityThumbnailDisplayStyle
{
  return self->_entityThumbnailDisplayStyle;
}

- (void)setEntityThumbnailDisplayStyle:(unint64_t)a3
{
  self->_entityThumbnailDisplayStyle = a3;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
}

- (NSString)lnPropertyIdentifier
{
  return self->_lnPropertyIdentifier;
}

- (void)setLnPropertyIdentifier:(id)a3
{
}

- (NSString)primaryPhrase
{
  return self->_primaryPhrase;
}

- (void)setPrimaryPhrase:(id)a3
{
}

- (NSString)biomeStreamIdentifier
{
  return self->_biomeStreamIdentifier;
}

- (void)setBiomeStreamIdentifier:(id)a3
{
}

- (unint64_t)entityBadgeType
{
  return self->_entityBadgeType;
}

- (void)setEntityBadgeType:(unint64_t)a3
{
  self->_entityBadgeType = a3;
}

- (BOOL)isAlarmResult
{
  return self->_isAlarmResult;
}

- (void)setIsAlarmResult:(BOOL)a3
{
  self->_isAlarmResult = a3;
}

- (BOOL)isCustomAppAttributedShortcut
{
  return self->_isCustomAppAttributedShortcut;
}

- (void)setIsCustomAppAttributedShortcut:(BOOL)a3
{
  self->_isCustomAppAttributedShortcut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryPhrase, 0);
  objc_storeStrong((id *)&self->_lnPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_settingsPreference, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_punchoutLabel, 0);
  objc_storeStrong((id *)&self->_numberOfActionsString, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end