@interface WFContextualAction
+ (BOOL)supportsSecureCoding;
+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3;
+ (id)systemActionWithType:(unint64_t)a3 identifier:(id)a4 displayString:(id)a5 inputTypes:(id)a6;
- (BOOL)actionShowsUserInterface;
- (BOOL)availableFromLockedContext;
- (BOOL)definesDisplayOrder;
- (BOOL)isAlternate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReversible;
- (BOOL)outputsFiles;
- (BOOL)showsUserInterfaceWhenRunning;
- (BOOL)wf_shouldLaunchAppWithSurface:(unint64_t)a3 linkAction:(id)a4 actionMetadata:(id)a5 appBundleIdentifier:(id)a6 actionIdentifier:(id)a7;
- (CSSearchableItem)spotlightItem;
- (NSArray)parameters;
- (NSData)iconImageData;
- (NSDate)creationDate;
- (NSString)associatedAppBundleIdentifier;
- (NSString)description;
- (NSString)displayFormatString;
- (NSString)displayString;
- (NSString)iconSymbolName;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)subtitleFormatString;
- (NSString)title;
- (NSString)uniquePrivateIdentifier;
- (NSString)wfActionIdentifier;
- (NSString)workflowRunKind;
- (WFContextualAction)initWithCoder:(id)a3;
- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10;
- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10 accessoryIcon:(id)a11 actionShowsUserInterface:(BOOL)a12 actionHasResult:(BOOL)a13 isReversible:(BOOL)a14;
- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15;
- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15 accessoryIcon:(id)a16 actionShowsUserInterface:(BOOL)a17 isReversible:(BOOL)a18;
- (WFContextualActionFilteringBehavior)filteringBehavior;
- (WFContextualActionIcon)accessoryIcon;
- (WFContextualActionIcon)icon;
- (double)iconImageScale;
- (id)associatedSettingsPreference;
- (id)contextForSurface:(unint64_t)a3;
- (id)copyWithParameters:(id)a3;
- (id)parameterDisplayStrings;
- (id)runDescriptorForSurface:(unint64_t)a3;
- (id)runRequestForSurface:(unint64_t)a3;
- (id)settingBiomeStreamIdentifier;
- (int64_t)resultFileOperation;
- (unint64_t)correspondingSystemActionType;
- (unint64_t)displayOrder;
- (unint64_t)hash;
- (unint64_t)type;
- (void)configureIfNeededForContext:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3 linkAction:(id)a4 appBundleIdentifier:(id)a5 actionIdentifier:(id)a6;
@end

@implementation WFContextualAction

- (BOOL)availableFromLockedContext
{
  return 0;
}

- (CSSearchableItem)spotlightItem
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F23850]);
  v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.shortcuts.contextual-action"];
  v5 = (void *)[v3 initWithContentType:v4];

  v6 = [(WFContextualAction *)self displayString];
  [v5 setDisplayName:v6];

  v7 = [(WFContextualAction *)self icon];
  v8 = [v7 imageURL];

  v9 = [(WFContextualAction *)self icon];
  v10 = [v9 systemName];

  v11 = [(WFContextualAction *)self icon];
  v12 = [v11 applicationBundleIdentifier];

  if (v8)
  {
    v13 = [(WFContextualAction *)self icon];
    v14 = [v13 imageURL];
    [v5 setThumbnailURL:v14];

LABEL_3:
    goto LABEL_8;
  }
  if (v10)
  {
    [v5 setThumbnailSymbolName:v10];
  }
  else
  {
    if (!v12)
    {
      v13 = [(WFContextualAction *)self iconImageData];
      [v5 setThumbnailData:v13];
      goto LABEL_3;
    }
    [v5 setThumbnailBundleID:v12];
  }
LABEL_8:
  v15 = [(WFContextualAction *)self creationDate];
  [v5 setContentCreationDate:v15];

  v16 = [(WFContextualAction *)self modificationDate];
  [v5 setContentModificationDate:v16];

  v17 = [(WFContextualAction *)self spotlightActionIdentifier];
  v18 = WFSpotlightResultRunnableActionIdentifier();
  [v5 setValue:v17 forCustomKey:v18];

  v19 = [(WFContextualAction *)self associatedAppBundleIdentifier];
  if (v19) {
    objc_msgSend(v5, "wf_associateWithBundleIdentifier:", v19);
  }
  v20 = [(WFContextualAction *)self actionForRunningFromSpotlight];
  id v46 = 0;
  v21 = WFDataFromSpotlightResultRunnable(v20, (uint64_t)&v46);
  id v22 = v46;

  if (v21)
  {
    if ((unint64_t)[v21 length] >> 6 >= 0x7D)
    {
      v23 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "-[WFContextualAction(Spotlight) spotlightItem]";
        _os_log_impl(&dword_1B3C5C000, v23, OS_LOG_TYPE_FAULT, "%s Packing large objects into CoreSpotlight index", buf, 0xCu);
      }
    }
    v24 = WFSpotlightResultRunnableAttributeKey();
    [v5 setValue:v21 forCustomKey:v24];

    if ([(WFContextualAction *)self definesDisplayOrder])
    {
      unint64_t v25 = [(WFContextualAction *)self displayOrder];
      v26 = [NSNumber numberWithUnsignedInteger:v25];
      v27 = WFSpotlightResultRunnableDisplayOrderKey();
      [v5 setValue:v26 forCustomKey:v27];
    }
    v42 = v21;
    v28 = [(WFContextualAction *)self accessoryIcon];
    v29 = [v28 systemName];

    if ([v29 length])
    {
      v30 = WFSpotlightResultRunnableAccessorySystemImageNameKey();
      [v5 setValue:v29 forCustomKey:v30];
    }
    v45 = v10;
    v31 = [(WFContextualAction *)self associatedSettingsPreference];
    if ([v31 length])
    {
      v32 = WFSpotlightResultRunnableAssociatedSettingsPreferenceKey();
      [v5 setValue:v31 forCustomKey:v32];
    }
    id v43 = v22;
    v44 = v19;
    v33 = [(WFContextualAction *)self settingBiomeStreamIdentifier];
    if ([v33 length])
    {
      v34 = WFSpotlightResultRunnableSettingBiomeStreamIdentifier();
      [v5 setValue:v33 forCustomKey:v34];
    }
    v35 = v12;
    v36 = v8;
    if ([(WFContextualAction *)self availableFromLockedContext]) {
      [v5 setProtectionClass:*MEMORY[0x1E4F28378]];
    }
    id v37 = objc_alloc(MEMORY[0x1E4F23840]);
    v38 = [(WFContextualAction *)self uniquePrivateIdentifier];
    v39 = [(id)objc_opt_class() spotlightDomainIdentifierForBundleIdentifier:0];
    v40 = (void *)[v37 initWithUniqueIdentifier:v38 domainIdentifier:v39 attributeSet:v5];

    v8 = v36;
    v19 = v44;
    v10 = v45;
    v12 = v35;
    v21 = v42;
    id v22 = v43;
  }
  else
  {
    v29 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[WFContextualAction(Spotlight) spotlightItem]";
      __int16 v49 = 2112;
      id v50 = v22;
      _os_log_impl(&dword_1B3C5C000, v29, OS_LOG_TYPE_FAULT, "%s Cannot pack WFContextualAction into a data blob: %@", buf, 0x16u);
    }
    v40 = 0;
  }

  return (CSSearchableItem *)v40;
}

- (NSDate)creationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] date];
}

- (unint64_t)displayOrder
{
  return 0;
}

- (BOOL)definesDisplayOrder
{
  return 0;
}

- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3 linkAction:(id)a4 appBundleIdentifier:(id)a5 actionIdentifier:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F72CE0]);
  v14 = [v13 actionForBundleIdentifier:v11 andActionIdentifier:v12 error:0];
  if (v14
    && [(WFContextualAction *)self wf_shouldLaunchAppWithSurface:a3 linkAction:v10 actionMetadata:v14 appBundleIdentifier:v11 actionIdentifier:v12])
  {
    v15 = [MEMORY[0x1E4F72BC0] policyWithActionMetadata:v14];
    v16 = [v15 effectiveBundleIdentifier];
    uint64_t v17 = [v16 type];

    if (v17)
    {
      v18 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFContextualAction(Prewarm_Internal) wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionIdentifier:]";
        _os_log_impl(&dword_1B3C5C000, v18, OS_LOG_TYPE_DEFAULT, "%s The effective bundle identifier is not an app, ignoring app launch", buf, 0xCu);
      }
      goto LABEL_12;
    }
    id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v20 = *MEMORY[0x1E4F62688];
    v30[0] = *MEMORY[0x1E4F626A0];
    v30[1] = v20;
    v31[0] = MEMORY[0x1E4F1CC38];
    v31[1] = MEMORY[0x1E4F1CC38];
    v30[2] = *MEMORY[0x1E4F62650];
    v31[2] = &unk_1F0CB1A30;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
    v18 = [v19 initWithDictionary:v21];

    id v22 = (void *)MEMORY[0x1E4FA7090];
    if (a3 != 5 && a3 != 16)
    {
      if (a3 != 12)
      {
LABEL_11:
        v23 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
        v24 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v18];
        [v15 effectiveBundleIdentifier];
        unint64_t v25 = v27 = v15;
        v26 = [v25 bundleIdentifier];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __121__WFContextualAction_Prewarm_Internal__wf_launchAppIfNeededUsingSurface_linkAction_appBundleIdentifier_actionIdentifier___block_invoke;
        v28[3] = &unk_1E6078628;
        id v29 = v13;
        [v23 openApplication:v26 withOptions:v24 completion:v28];

        v15 = v27;
LABEL_12:

        goto LABEL_13;
      }
      id v22 = (void *)MEMORY[0x1E4FA7078];
    }
    [v18 setObject:*v22 forKeyedSubscript:*MEMORY[0x1E4F62658]];
    goto LABEL_11;
  }
LABEL_13:
}

void __121__WFContextualAction_Prewarm_Internal__wf_launchAppIfNeededUsingSurface_linkAction_appBundleIdentifier_actionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = getWFVoiceShortcutClientLogObject();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[WFContextualAction(Prewarm_Internal) wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actio"
            "nIdentifier:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1B3C5C000, v7, OS_LOG_TYPE_ERROR, "%s Pre-warmed app launch completed with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "pid"));
    int v9 = 136315394;
    id v10 = "-[WFContextualAction(Prewarm_Internal) wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionI"
          "dentifier:]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v8;
    _os_log_impl(&dword_1B3C5C000, v7, OS_LOG_TYPE_DEFAULT, "%s Pre-warmed app launch completed with pid %{public}@", (uint8_t *)&v9, 0x16u);
  }
}

- (BOOL)wf_shouldLaunchAppWithSurface:(unint64_t)a3 linkAction:(id)a4 actionMetadata:(id)a5 appBundleIdentifier:(id)a6 actionIdentifier:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([v13 isEqualToString:@"com.apple.mobilenotes"]
    && [v14 isEqualToString:@"CreateNoteLinkAction"])
  {
    BOOL v15 = (a3 & 0xFFFFFFFFFFFFFFFELL) != 12;
  }
  else
  {
    char v16 = objc_msgSend(v12, "wf_shouldPrewarmAppLaunchWithAction:", v11);
    uint64_t v17 = getWFVoiceShortcutClientLogObject();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        int v20 = 136315650;
        v21 = "-[WFContextualAction(Prewarm_Internal) wf_shouldLaunchAppWithSurface:linkAction:actionMetadata:appBundleId"
              "entifier:actionIdentifier:]";
        __int16 v22 = 2114;
        id v23 = v13;
        __int16 v24 = 2114;
        id v25 = v14;
        _os_log_impl(&dword_1B3C5C000, v17, OS_LOG_TYPE_DEFAULT, "%s The action %{public}@:%{public}@ requires pre-warmed app launch", (uint8_t *)&v20, 0x20u);
      }

      BOOL v15 = 1;
    }
    else
    {
      if (v18)
      {
        int v20 = 136315650;
        v21 = "-[WFContextualAction(Prewarm_Internal) wf_shouldLaunchAppWithSurface:linkAction:actionMetadata:appBundleId"
              "entifier:actionIdentifier:]";
        __int16 v22 = 2114;
        id v23 = v13;
        __int16 v24 = 2114;
        id v25 = v14;
        _os_log_impl(&dword_1B3C5C000, v17, OS_LOG_TYPE_DEFAULT, "%s The action %{public}@:%{public}@ doesn't require pre-warmed app launch", (uint8_t *)&v20, 0x20u);
      }

      BOOL v15 = 0;
    }
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteringBehavior, 0);
  objc_storeStrong((id *)&self->_wfActionIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitleFormatString, 0);
  objc_storeStrong((id *)&self->_displayFormatString, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessoryIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isReversible
{
  return self->_reversible;
}

- (unint64_t)correspondingSystemActionType
{
  return self->_correspondingSystemActionType;
}

- (WFContextualActionFilteringBehavior)filteringBehavior
{
  return self->_filteringBehavior;
}

- (NSString)wfActionIdentifier
{
  return self->_wfActionIdentifier;
}

- (NSString)subtitleFormatString
{
  return self->_subtitleFormatString;
}

- (NSString)displayFormatString
{
  return self->_displayFormatString;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (WFContextualActionIcon)accessoryIcon
{
  return self->_accessoryIcon;
}

- (WFContextualActionIcon)icon
{
  return self->_icon;
}

- (BOOL)isAlternate
{
  return self->_alternate;
}

- (int64_t)resultFileOperation
{
  return self->_resultFileOperation;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)actionShowsUserInterface
{
  return self->_actionShowsUserInterface;
}

- (NSString)workflowRunKind
{
  v2 = @"ContextualAction";
  return (NSString *)@"ContextualAction";
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_wfActionIdentifier forKey:@"wfActionIdentifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_correspondingSystemActionType forKey:@"correspondingSystemActionType"];
  [v5 encodeObject:self->_associatedAppBundleIdentifier forKey:@"associatedAppBundleIdentifier"];
  [v5 encodeInteger:self->_resultFileOperation forKey:@"resultFileOperation"];
  [v5 encodeBool:self->_alternate forKey:@"alternate"];
  [v5 encodeObject:self->_filteringBehavior forKey:@"filteringBehavior"];
  [v5 encodeObject:self->_parameters forKey:@"parameters"];
  [v5 encodeObject:self->_displayFormatString forKey:@"displayFormatString"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_subtitleFormatString forKey:@"subtitleFormatString"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeObject:self->_accessoryIcon forKey:@"accessoryIcon"];
  [v5 encodeBool:self->_actionShowsUserInterface forKey:@"actionShowsUserInterface"];
  [v5 encodeBool:self->_reversible forKey:@"reversible"];
}

- (WFContextualAction)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v39 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"wfActionIdentifier"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"type"];
  uint64_t v34 = [v3 decodeIntegerForKey:@"correspondingSystemActionType"];
  uint64_t v38 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAppBundleIdentifier"];
  uint64_t v33 = [v3 decodeIntegerForKey:@"resultFileOperation"];
  char v6 = [v3 decodeBoolForKey:@"alternate"];
  v42 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"filteringBehavior"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  int v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v37 = [v3 decodeObjectOfClasses:v9 forKey:@"parameters"];

  uint64_t v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayFormatString"];
  uint64_t v36 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleFormatString"];
  uint64_t v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryIcon"];
  char v13 = [v3 decodeBoolForKey:@"actionShowsUserInterface"];
  char v14 = [v3 decodeBoolForKey:@"isReversible"];

  BOOL v15 = 0;
  v41 = (void *)v4;
  if (v4 && v10)
  {
    BYTE1(v32) = v14;
    LOBYTE(v32) = v13;
    uint64_t v31 = v12;
    char v16 = (void *)v12;
    uint64_t v17 = (void *)v35;
    uint64_t v30 = v11;
    uint64_t v18 = v5;
    id v19 = (void *)v11;
    int v20 = (void *)v10;
    v21 = (void *)v36;
    char v22 = v6;
    id v23 = (void *)v37;
    LOBYTE(v29) = v22;
    uint64_t v24 = v4;
    id v25 = (void *)v38;
    uint64_t v26 = (void *)v39;
    v27 = objc_retain(-[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", v24, v39, v18, v34, v38, v33, v29, v42, v37, v20, v36, v30, v35, v31,
              v32));
    BOOL v15 = v27;
  }
  else
  {
    v27 = self;
    id v25 = (void *)v38;
    uint64_t v26 = (void *)v39;
    id v19 = (void *)v11;
    int v20 = (void *)v10;
    v21 = (void *)v36;
    id v23 = (void *)v37;
    char v16 = (void *)v12;
    uint64_t v17 = (void *)v35;
  }

  return v15;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  if (self->_actionShowsUserInterface) {
    return 1;
  }
  id v3 = [(WFContextualAction *)self parameters];
  uint64_t v4 = objc_msgSend(v3, "if_firstObjectPassingTest:", &__block_literal_global_68_14120);

  BOOL v2 = v4 != 0;
  return v2;
}

uint64_t __51__WFContextualAction_showsUserInterfaceWhenRunning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAskEachTime];
}

- (double)iconImageScale
{
  BOOL v2 = [(WFContextualAction *)self icon];
  [v2 imageScale];
  double v4 = v3;

  return v4;
}

- (NSData)iconImageData
{
  BOOL v2 = [(WFContextualAction *)self icon];
  double v3 = [v2 imageData];

  return (NSData *)v3;
}

- (NSString)iconSymbolName
{
  BOOL v2 = [(WFContextualAction *)self icon];
  double v3 = [v2 systemName];

  return (NSString *)v3;
}

- (NSString)uniquePrivateIdentifier
{
  BOOL v2 = NSNumber;
  double v3 = [(WFContextualAction *)self uniqueIdentifier];
  double v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "hash"));
  uint64_t v5 = [v4 stringValue];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (WFContextualAction *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    char v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_96:

      goto LABEL_97;
    }
    v7 = [(WFContextualAction *)v6 identifier];
    uint64_t v8 = [(WFContextualAction *)self identifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      char v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_94;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_95:

        goto LABEL_96;
      }
    }
    char v16 = [(WFContextualAction *)v6 wfActionIdentifier];
    uint64_t v17 = [(WFContextualAction *)self wfActionIdentifier];
    id v14 = v16;
    id v18 = v17;
    char v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_93;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    char v22 = [(WFContextualAction *)v6 uniqueIdentifier];
    id v23 = [(WFContextualAction *)self uniqueIdentifier];
    id v20 = v22;
    id v24 = v23;
    id v19 = v24;
    id v91 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_92;
      }
      int v12 = [v20 isEqualToString:v24];

      if (!v12) {
        goto LABEL_93;
      }
    }
    v90 = v19;
    uint64_t v26 = [(WFContextualAction *)v6 parameters];
    v27 = [(WFContextualAction *)self parameters];
    id v20 = v26;
    id v28 = v27;
    id v29 = v28;
    id v89 = v20;
    if (v20 != v28)
    {
      LOBYTE(v12) = 0;
      uint64_t v30 = v28;
      if (v20)
      {
        id v19 = v90;
        if (v28)
        {
          uint64_t v31 = v28;
          int v32 = [v20 isEqualToArray:v28];
          id v88 = v31;

          if (!v32)
          {
LABEL_37:
            LOBYTE(v12) = 0;
            id v19 = v90;
            id v25 = v88;
LABEL_92:

            id v20 = v91;
LABEL_93:

            goto LABEL_94;
          }
LABEL_30:
          uint64_t v33 = [(WFContextualAction *)v6 type];
          if (v33 != [(WFContextualAction *)self type]) {
            goto LABEL_37;
          }
          uint64_t v34 = [(WFContextualAction *)v6 resultFileOperation];
          if (v34 != [(WFContextualAction *)self resultFileOperation]) {
            goto LABEL_37;
          }
          uint64_t v35 = [(WFContextualAction *)v6 filteringBehavior];
          uint64_t v36 = [(WFContextualAction *)self filteringBehavior];
          id v20 = v35;
          id v37 = v36;
          v87 = v37;
          if (v20 != v37)
          {
            LOBYTE(v12) = 0;
            id v86 = v20;
            if (v20)
            {
              uint64_t v38 = v37;
              id v19 = v90;
              if (v37)
              {
                int v39 = [v20 isEqual:v37];

                if (!v39) {
                  goto LABEL_41;
                }
LABEL_40:
                BOOL v40 = [(WFContextualAction *)v6 isAlternate];
                if (v40 != [(WFContextualAction *)self isAlternate])
                {
LABEL_41:
                  LOBYTE(v12) = 0;
                  id v19 = v90;
                  uint64_t v30 = v87;
                  id v29 = v88;
                  goto LABEL_91;
                }
                v41 = [(WFContextualAction *)v6 icon];
                v42 = [(WFContextualAction *)self icon];
                id v43 = v41;
                id v44 = v42;
                v84 = v44;
                v85 = v43;
                id v86 = v20;
                if (v43 != v44)
                {
                  LOBYTE(v12) = 0;
                  if (v43)
                  {
                    v45 = v44;
                    id v46 = v43;
                    id v19 = v90;
                    if (v44)
                    {
                      int v47 = [v85 isEqual:v44];

                      if (!v47)
                      {
                        LOBYTE(v12) = 0;
                        id v19 = v90;
LABEL_89:
                        uint64_t v38 = v84;
                        id v20 = v85;
                        goto LABEL_90;
                      }
LABEL_49:
                      v48 = [(WFContextualAction *)v6 accessoryIcon];
                      __int16 v49 = [(WFContextualAction *)self accessoryIcon];
                      id v50 = v48;
                      id v51 = v49;
                      v82 = v51;
                      v83 = v50;
                      if (v50 != v51)
                      {
                        LOBYTE(v12) = 0;
                        if (v50)
                        {
                          v52 = v51;
                          id v53 = v50;
                          id v19 = v90;
                          if (v51)
                          {
                            int v80 = [v83 isEqual:v51];

                            if (!v80)
                            {
                              LOBYTE(v12) = 0;
                              id v19 = v90;
LABEL_87:
                              v45 = v82;
                              id v46 = v83;
                              goto LABEL_88;
                            }
LABEL_55:
                            v54 = [(WFContextualAction *)v6 displayString];
                            v55 = [(WFContextualAction *)self displayString];
                            id v56 = v54;
                            id v57 = v55;
                            v79 = v57;
                            v81 = v56;
                            if (v56 != v57)
                            {
                              LOBYTE(v12) = 0;
                              if (v56)
                              {
                                v58 = v57;
                                v77 = v56;
                                id v19 = v90;
                                if (v57)
                                {
                                  int v78 = [v81 isEqualToString:v57];

                                  if (!v78)
                                  {
                                    LOBYTE(v12) = 0;
                                    id v19 = v90;
LABEL_85:
                                    v52 = v79;
                                    id v53 = v81;
                                    goto LABEL_86;
                                  }
LABEL_62:
                                  v59 = [(WFContextualAction *)v6 subtitle];
                                  v60 = [(WFContextualAction *)self subtitle];
                                  id v61 = v59;
                                  id v62 = v60;
                                  v76 = v62;
                                  v77 = v61;
                                  if (v61 == v62)
                                  {
                                  }
                                  else
                                  {
                                    LOBYTE(v12) = 0;
                                    if (!v61)
                                    {
                                      v63 = v62;
                                      goto LABEL_82;
                                    }
                                    v63 = v62;
                                    if (!v62)
                                    {
LABEL_82:

                                      goto LABEL_83;
                                    }
                                    int v74 = [v61 isEqualToString:v62];

                                    if (!v74)
                                    {
                                      LOBYTE(v12) = 0;
LABEL_83:
                                      id v19 = v90;
                                      v58 = v76;
                                      goto LABEL_84;
                                    }
                                  }
                                  v64 = [(WFContextualAction *)v6 associatedAppBundleIdentifier];
                                  v65 = [(WFContextualAction *)self associatedAppBundleIdentifier];
                                  id v61 = v64;
                                  v73 = v61;
                                  id v75 = v65;
                                  if (v61 == v75)
                                  {
                                  }
                                  else
                                  {
                                    if (!v61 || !v75)
                                    {

                                      v63 = v75;
                                      LOBYTE(v12) = 0;
                                      goto LABEL_82;
                                    }
                                    int v66 = [v61 isEqualToString:v75];

                                    if (!v66) {
                                      goto LABEL_78;
                                    }
                                  }
                                  uint64_t v67 = [(WFContextualAction *)v6 correspondingSystemActionType];
                                  if (v67 == [(WFContextualAction *)self correspondingSystemActionType])
                                  {
                                    BOOL v68 = [(WFContextualAction *)v6 isReversible];
                                    int v12 = v68 ^ [(WFContextualAction *)self isReversible] ^ 1;
LABEL_79:
                                    id v61 = v73;
                                    v63 = v75;
                                    goto LABEL_82;
                                  }
LABEL_78:
                                  LOBYTE(v12) = 0;
                                  goto LABEL_79;
                                }
                              }
                              else
                              {
                                v58 = v57;
                                v77 = 0;
                                id v19 = v90;
                              }
LABEL_84:

                              goto LABEL_85;
                            }

                            goto LABEL_62;
                          }
                        }
                        else
                        {
                          v52 = v51;
                          id v53 = 0;
                          id v19 = v90;
                        }
LABEL_86:
                        v69 = v53;

                        goto LABEL_87;
                      }

                      goto LABEL_55;
                    }
                  }
                  else
                  {
                    v45 = v44;
                    id v46 = 0;
                    id v19 = v90;
                  }
LABEL_88:

                  goto LABEL_89;
                }

                goto LABEL_49;
              }
            }
            else
            {
              uint64_t v38 = v37;
              id v19 = v90;
            }
LABEL_90:

            uint64_t v30 = v87;
            id v29 = v88;
            id v20 = v86;
            goto LABEL_91;
          }

          goto LABEL_40;
        }
      }
      else
      {
        id v19 = v90;
      }
LABEL_91:
      v70 = v20;
      v71 = v29;

      id v25 = v71;
      id v20 = v89;
      goto LABEL_92;
    }
    id v88 = v28;

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_97:

  return v12;
}

- (unint64_t)hash
{
  double v3 = objc_opt_new();
  double v4 = [(WFContextualAction *)self identifier];
  id v5 = (id)[v3 combineContentsOfPropertyListObject:v4];

  char v6 = [(WFContextualAction *)self wfActionIdentifier];

  if (v6)
  {
    v7 = [(WFContextualAction *)self wfActionIdentifier];
    id v8 = (id)[v3 combineContentsOfPropertyListObject:v7];
  }
  id v9 = [(WFContextualAction *)self uniqueIdentifier];
  id v10 = (id)[v3 combineContentsOfPropertyListObject:v9];

  uint64_t v11 = [(WFContextualAction *)self parameters];

  if (v11)
  {
    int v12 = [(WFContextualAction *)self parameters];
    id v13 = (id)[v3 combine:v12];
  }
  id v14 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction type](self, "type"));
  int v15 = [(WFContextualAction *)self icon];

  if (v15)
  {
    char v16 = [(WFContextualAction *)self icon];
    id v17 = (id)[v3 combine:v16];
  }
  id v18 = [(WFContextualAction *)self accessoryIcon];

  if (v18)
  {
    id v19 = [(WFContextualAction *)self accessoryIcon];
    id v20 = (id)[v3 combine:v19];
  }
  int v21 = [(WFContextualAction *)self displayString];

  if (v21)
  {
    char v22 = [(WFContextualAction *)self displayString];
    id v23 = (id)[v3 combineContentsOfPropertyListObject:v22];
  }
  id v24 = [(WFContextualAction *)self subtitle];

  if (v24)
  {
    id v25 = [(WFContextualAction *)self subtitle];
    id v26 = (id)[v3 combineContentsOfPropertyListObject:v25];
  }
  v27 = [(WFContextualAction *)self associatedAppBundleIdentifier];

  if (v27)
  {
    id v28 = [(WFContextualAction *)self associatedAppBundleIdentifier];
    id v29 = (id)[v3 combineContentsOfPropertyListObject:v28];
  }
  id v30 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction correspondingSystemActionType](self, "correspondingSystemActionType"));
  id v31 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction showsUserInterfaceWhenRunning](self, "showsUserInterfaceWhenRunning"));
  id v32 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction isReversible](self, "isReversible"));
  unint64_t v33 = [v3 finalize];

  return v33;
}

- (NSString)description
{
  double v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  char v6 = [(WFContextualAction *)self identifier];
  v7 = [(WFContextualAction *)self wfActionIdentifier];
  id v8 = [(WFContextualAction *)self displayString];
  id v9 = [(WFContextualAction *)self filteringBehavior];
  id v10 = [v3 stringWithFormat:@"<%@ %p identifier=%@, wfActionIdentifier =%@, display string=%@, filtering behavior=%@>", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BOOL)outputsFiles
{
  return [(WFContextualAction *)self type] == 0;
}

- (NSString)subtitle
{
  double v3 = [(WFContextualAction *)self subtitleFormatString];
  double v4 = [(WFContextualAction *)self parameterDisplayStrings];
  id v5 = WFSafeApplyFormatString(v3, v4);

  return (NSString *)v5;
}

- (NSString)displayString
{
  double v3 = [(WFContextualAction *)self displayFormatString];
  double v4 = [(WFContextualAction *)self parameterDisplayStrings];
  id v5 = WFSafeApplyFormatString(v3, v4);

  return (NSString *)v5;
}

- (id)parameterDisplayStrings
{
  BOOL v2 = [(WFContextualAction *)self parameters];
  double v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_14129);

  return v3;
}

__CFString *__45__WFContextualAction_parameterDisplayStrings__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = [a2 displayString];
  double v3 = v2;
  if (!v2) {
    BOOL v2 = &stru_1F0C7EBE0;
  }
  double v4 = v2;

  return v4;
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15 accessoryIcon:(id)a16 actionShowsUserInterface:(BOOL)a17 isReversible:(BOOL)a18
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v21 = a4;
  id v57 = a7;
  id v56 = a10;
  id v55 = a11;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = a15;
  id v26 = a16;
  v27 = v20;
  if (v20)
  {
    if (v22)
    {
LABEL_3:
      BOOL v60 = 0;
      id v28 = WFSanitizeFormatString(v22, &v60);
      id v29 = self;
      goto LABEL_4;
    }
  }
  else
  {
    __int16 v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"WFContextualAction.m", 90, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v22) {
      goto LABEL_3;
    }
  }
  id v50 = [MEMORY[0x1E4F28B00] currentHandler];
  id v29 = self;
  [v50 handleFailureInMethod:a2, self, @"WFContextualAction.m", 91, @"Invalid parameter not satisfying: %@", @"displayFormatString" object file lineNumber description];

  BOOL v60 = 0;
  id v28 = WFSanitizeFormatString(0, &v60);
LABEL_4:

  if (v60)
  {
    id v30 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v62 = "-[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppB"
            "undleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitl"
            "eFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:]";
      __int16 v63 = 2112;
      v64 = v27;
      __int16 v65 = 2112;
      int v66 = v28;
      _os_log_impl(&dword_1B3C5C000, v30, OS_LOG_TYPE_FAULT, "%s Display format string contains prohibited specifiers. Only '%%@' can be used. Dropping the specifier. %@ (%@)", buf, 0x20u);
    }
  }
  id v31 = WFSanitizeFormatString(v24, &v60);

  if (v60)
  {
    id v32 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v62 = "-[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppB"
            "undleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitl"
            "eFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:]";
      __int16 v63 = 2112;
      v64 = v27;
      __int16 v65 = 2112;
      int v66 = v31;
      _os_log_impl(&dword_1B3C5C000, v32, OS_LOG_TYPE_FAULT, "%s Subtitle format string contains prohibited specifiers. Only '%%@' can be used. Dropping the specifier. %@ (%@)", buf, 0x20u);
    }
  }
  v59.receiver = v29;
  v59.super_class = (Class)WFContextualAction;
  unint64_t v33 = [(WFContextualAction *)&v59 init];
  if (v33)
  {
    uint64_t v34 = [v27 copy];
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v34;

    if (v21) {
      uint64_t v36 = v21;
    }
    else {
      uint64_t v36 = v27;
    }
    uint64_t v37 = [v36 copy];
    wfActionIdentifier = v33->_wfActionIdentifier;
    v33->_wfActionIdentifier = (NSString *)v37;

    v33->_type = a5;
    v33->_correspondingSystemActionType = a6;
    uint64_t v39 = [v57 copy];
    associatedAppBundleIdentifier = v33->_associatedAppBundleIdentifier;
    v33->_associatedAppBundleIdentifier = (NSString *)v39;

    v33->_resultFileOperation = a8;
    v33->_alternate = a9;
    objc_storeStrong((id *)&v33->_filteringBehavior, a10);
    objc_storeStrong((id *)&v33->_parameters, a11);
    uint64_t v41 = [v28 copy];
    displayFormatString = v33->_displayFormatString;
    v33->_displayFormatString = (NSString *)v41;

    uint64_t v43 = [v23 copy];
    title = v33->_title;
    v33->_title = (NSString *)v43;

    uint64_t v45 = [v31 copy];
    subtitleFormatString = v33->_subtitleFormatString;
    v33->_subtitleFormatString = (NSString *)v45;

    objc_storeStrong((id *)&v33->_icon, a15);
    objc_storeStrong((id *)&v33->_accessoryIcon, a16);
    v33->_actionShowsUserInterface = a17;
    v33->_reversible = a18;
    int v47 = v33;
  }

  return v33;
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15
{
  LOWORD(v17) = 0;
  LOBYTE(v16) = a9;
  return -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", a3, a4, a5, a6, a7, a8, v16, a10, a11, a12, a13, a14, a15, 0, v17);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10 accessoryIcon:(id)a11 actionShowsUserInterface:(BOOL)a12 actionHasResult:(BOOL)a13 isReversible:(BOOL)a14
{
  BYTE1(v16) = a14;
  LOBYTE(v16) = a12;
  LOBYTE(v15) = 0;
  return -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", a3, a4, !a13, 0, a5, 1, v15, 0, a6, a7, a8, a9, a10, a11, v16);
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10
{
  BYTE2(v11) = 0;
  LOWORD(v11) = 0;
  return -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v11);
}

- (id)associatedSettingsPreference
{
  return 0;
}

- (void)configureIfNeededForContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WFContextualAction.m", 385, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];

    id v6 = 0;
  }
  (*((void (**)(id, WFContextualAction *, void))v6 + 2))(v6, self, 0);
}

- (id)copyWithParameters:(id)a3
{
  id v25 = a3;
  if (!v25)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFContextualAction.m", 380, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];
  }
  id v23 = objc_alloc((Class)objc_opt_class());
  id v5 = [(WFContextualAction *)self identifier];
  id v22 = [(WFContextualAction *)self wfActionIdentifier];
  unint64_t v21 = [(WFContextualAction *)self type];
  unint64_t v20 = [(WFContextualAction *)self correspondingSystemActionType];
  id v19 = [(WFContextualAction *)self associatedAppBundleIdentifier];
  int64_t v18 = [(WFContextualAction *)self resultFileOperation];
  BOOL v6 = [(WFContextualAction *)self isAlternate];
  v7 = [(WFContextualAction *)self filteringBehavior];
  id v8 = [(WFContextualAction *)self displayFormatString];
  id v9 = [(WFContextualAction *)self title];
  id v10 = [(WFContextualAction *)self subtitleFormatString];
  uint64_t v11 = [(WFContextualAction *)self icon];
  int v12 = [(WFContextualAction *)self accessoryIcon];
  BOOL v13 = [(WFContextualAction *)self actionShowsUserInterface];
  BYTE1(v17) = [(WFContextualAction *)self isReversible];
  LOBYTE(v17) = v13;
  LOBYTE(v16) = v6;
  id v24 = objc_msgSend(v23, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", v5, v22, v21, v20, v19, v18, v16, v7, v25, v8, v9, v10, v11, v12, v17);

  return v24;
}

- (id)settingBiomeStreamIdentifier
{
  return 0;
}

- (id)runRequestForSurface:(unint64_t)a3
{
  id v5 = [WFContextualActionRunRequest alloc];
  BOOL v6 = [(WFContextualAction *)self contextForSurface:a3];
  v7 = [(WFContextualActionRunRequest *)v5 initWithAction:self actionContext:v6];

  return v7;
}

- (id)runDescriptorForSurface:(unint64_t)a3
{
  id v5 = [WFContextualActionRunDescriptor alloc];
  BOOL v6 = [(WFContextualAction *)self contextForSurface:a3];
  v7 = [(WFContextualActionRunDescriptor *)v5 initWithAction:self context:v6];

  return v7;
}

- (id)contextForSurface:(unint64_t)a3
{
  if (a3 > 4) {
    uint64_t v3 = 5;
  }
  else {
    uint64_t v3 = qword_1B3D88C38[a3];
  }
  double v4 = [[WFContextualActionContext alloc] initWithSurface:v3];
  return v4;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return @"contextual-action";
}

+ (id)systemActionWithType:(unint64_t)a3 identifier:(id)a4 displayString:(id)a5 inputTypes:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  int v12 = [[WFSystemContextualAction alloc] initWithType:a3 identifier:v11 displayString:v10 inputTypes:v9];

  return v12;
}

@end