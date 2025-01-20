@interface WFAutoShortcutContextualAction
+ (BOOL)supportsSecureCoding;
+ (id)allActionsForAutoShortcut:(id)a3 bundleIdentifier:(id)a4 startIndex:(unint64_t)a5;
+ (id)autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:(id)a3;
+ (id)legacySpotlightDomainIdentifier;
+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3;
- (BOOL)availableFromLockedContext;
- (BOOL)definesDisplayOrder;
- (BOOL)isEligibleForProminentDisplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTopHitEligible;
- (LNAutoShortcut)autoShortcut;
- (LNAutoShortcutLocalizedPhrase)phrase;
- (NSArray)alternativePhrases;
- (NSArray)searchKeywords;
- (NSNumber)cachedProminentDisplayEligibility;
- (NSString)actionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)parameterlessIdentifier;
- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 bundleIdentifier:(id)a4;
- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 identifier:(id)a4 parameterlessIdentifier:(id)a5 phrase:(id)a6 alternativePhrases:(id)a7 bundleIdentifier:(id)a8 actionIdentifier:(id)a9 orderOfShortcut:(unint64_t)a10 parentAction:(id)a11 prominentDisplayEligibility:(id)a12 executableAppShortcut:(id)a13;
- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 phrase:(id)a4 alternativePhrases:(id)a5 bundleIdentifier:(id)a6;
- (WFAutoShortcutContextualAction)initWithCoder:(id)a3;
- (WFAutoShortcutContextualAction)initWithExecutableAppShortcut:(id)a3 index:(unint64_t)a4;
- (WFAutoShortcutContextualAction)parentAction;
- (WFExecutableAppShortcut)executableAppShortcut;
- (id)actionBySettingEligibilityForProminentDisplay:(BOOL)a3;
- (id)actionForRunningFromSpotlight;
- (id)creationDate;
- (id)relatedApp;
- (id)spotlightItem;
- (id)workflowRunKind;
- (unint64_t)hash;
- (unint64_t)orderOfShortcut;
- (void)encodeWithCoder:(id)a3;
- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3;
@end

@implementation WFAutoShortcutContextualAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterlessIdentifier, 0);
  objc_storeStrong((id *)&self->_executableAppShortcut, 0);
  objc_storeStrong((id *)&self->_cachedProminentDisplayEligibility, 0);
  objc_storeStrong((id *)&self->_parentAction, 0);
  objc_storeStrong((id *)&self->_searchKeywords, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_alternativePhrases, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_autoShortcut, 0);
}

- (NSString)parameterlessIdentifier
{
  return self->_parameterlessIdentifier;
}

- (WFExecutableAppShortcut)executableAppShortcut
{
  return self->_executableAppShortcut;
}

- (NSNumber)cachedProminentDisplayEligibility
{
  return self->_cachedProminentDisplayEligibility;
}

- (unint64_t)orderOfShortcut
{
  return self->_orderOfShortcut;
}

- (WFAutoShortcutContextualAction)parentAction
{
  return self->_parentAction;
}

- (NSArray)searchKeywords
{
  return self->_searchKeywords;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)alternativePhrases
{
  return self->_alternativePhrases;
}

- (LNAutoShortcutLocalizedPhrase)phrase
{
  return self->_phrase;
}

- (LNAutoShortcut)autoShortcut
{
  return self->_autoShortcut;
}

- (id)workflowRunKind
{
  v2 = @"AppShortcut";
  return @"AppShortcut";
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAutoShortcutContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_autoShortcut, @"autoShortcut", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_phrase forKey:@"phrase"];
  [v4 encodeObject:self->_alternativePhrases forKey:@"alternativePhrases"];
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v4 encodeObject:self->_actionIdentifier forKey:@"actionIdentifier"];
  [v4 encodeInteger:self->_orderOfShortcut forKey:@"orderOfShortcut"];
  [v4 encodeObject:self->_parentAction forKey:@"parentAction"];
  [v4 encodeObject:self->_cachedProminentDisplayEligibility forKey:@"cachedProminentDisplayEligibility"];
  [v4 encodeObject:self->_executableAppShortcut forKey:@"executableAppShortcut"];
  [v4 encodeObject:self->_parameterlessIdentifier forKey:@"parameterlessIdentifier"];
}

- (WFAutoShortcutContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFAutoShortcutContextualAction;
  objc_super v5 = [(WFContextualAction *)&v32 initWithCoder:v4];
  if (v5)
  {
    v6 = v5;
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v7 = (void *)getLNAutoShortcutClass_softClass;
    uint64_t v41 = getLNAutoShortcutClass_softClass;
    if (!getLNAutoShortcutClass_softClass)
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __getLNAutoShortcutClass_block_invoke;
      v36 = &unk_1E6079C28;
      v37 = &v38;
      __getLNAutoShortcutClass_block_invoke((uint64_t)&v33);
      v7 = (void *)v39[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v38, 8);
    v31 = [v4 decodeObjectOfClass:v8 forKey:@"autoShortcut"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterlessIdentifier"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executableAppShortcut"];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    v12 = (void *)getLNAutoShortcutLocalizedPhraseClass_softClass;
    uint64_t v41 = getLNAutoShortcutLocalizedPhraseClass_softClass;
    if (!getLNAutoShortcutLocalizedPhraseClass_softClass)
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __getLNAutoShortcutLocalizedPhraseClass_block_invoke;
      v36 = &unk_1E6079C28;
      v37 = &v38;
      __getLNAutoShortcutLocalizedPhraseClass_block_invoke((uint64_t)&v33);
      v12 = (void *)v39[3];
    }
    v28 = (void *)v11;
    v13 = (void *)v10;
    id v14 = v12;
    _Block_object_dispose(&v38, 8);
    v15 = [v4 decodeObjectOfClass:v14 forKey:@"phrase"];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"alternativePhrases"];

    uint64_t v20 = [v4 decodeIntegerForKey:@"orderOfShortcut"];
    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentAction"];
    if (v9)
    {
      if (v15)
      {
        uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cachedProminentDisplayEligibility"];
        v23 = v6;
        v24 = (void *)v22;
        v25 = v28;
        v26 = [(WFAutoShortcutContextualAction *)v23 initWithAutoShortcut:v31 identifier:v29 parameterlessIdentifier:v13 phrase:v15 alternativePhrases:v19 bundleIdentifier:v9 actionIdentifier:v30 orderOfShortcut:v20 parentAction:v21 prominentDisplayEligibility:v22 executableAppShortcut:v28];

        v6 = v26;
LABEL_13:

        goto LABEL_14;
      }
      v6 = [(WFAutoShortcutContextualAction *)v6 initWithAutoShortcut:v31 bundleIdentifier:v9];
      v26 = v6;
    }
    else
    {
      v26 = 0;
    }
    v25 = v28;
    goto LABEL_13;
  }
  v26 = 0;
LABEL_14:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WFAutoShortcutContextualAction;
  if ([(WFContextualAction *)&v40 isEqual:v4])
  {
    id v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_44:

      goto LABEL_45;
    }
    v6 = [v5 autoShortcut];
    v7 = [(WFAutoShortcutContextualAction *)self autoShortcut];
    id v8 = v6;
    id v9 = v7;
    uint64_t v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_42;
      }
      int v14 = [v8 isEqual:v9];

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    v15 = [v5 phrase];
    v16 = [(WFAutoShortcutContextualAction *)self phrase];
    id v13 = v15;
    id v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v18 = v17;
      id v19 = v13;
      if (!v13 || !v17) {
        goto LABEL_41;
      }
      int v20 = [v13 isEqual:v17];

      if (!v20)
      {
        LOBYTE(v11) = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    v21 = [v5 alternativePhrases];
    uint64_t v22 = [(WFAutoShortcutContextualAction *)self alternativePhrases];
    id v19 = v21;
    id v23 = v22;
    v18 = v23;
    id v39 = v19;
    if (v19 == v23)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v24 = v23;
      if (!v19 || !v23) {
        goto LABEL_40;
      }
      int v11 = [v19 isEqualToArray:v23];

      if (!v11) {
        goto LABEL_41;
      }
    }
    v25 = objc_msgSend(v5, "bundleIdentifier", v18);
    v26 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
    id v27 = v25;
    id v28 = v26;
    v37 = v28;
    id v38 = v27;
    if (v27 == v28)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v27)
      {
        v29 = v28;
        v18 = v36;
        goto LABEL_38;
      }
      v29 = v28;
      v18 = v36;
      if (!v28)
      {
LABEL_38:

        goto LABEL_39;
      }
      int v30 = [v27 isEqualToString:v28];

      if (!v30)
      {
        LOBYTE(v11) = 0;
        v18 = v36;
LABEL_39:
        v24 = v37;
        id v19 = v38;
LABEL_40:

        id v19 = v39;
LABEL_41:

        goto LABEL_42;
      }
    }
    v31 = [v5 parentAction];
    objc_super v32 = [(WFAutoShortcutContextualAction *)self parentAction];
    id v27 = v31;
    id v33 = v32;
    uint64_t v34 = v33;
    if (v27 == v33)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v27)
      {
        v18 = v36;
        if (v33) {
          LOBYTE(v11) = [v27 isEqual:v33];
        }
        goto LABEL_36;
      }
    }
    v18 = v36;
LABEL_36:

    v29 = v34;
    goto LABEL_38;
  }
  LOBYTE(v11) = 0;
LABEL_45:

  return v11;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v20.receiver = self;
  v20.super_class = (Class)WFAutoShortcutContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v20, sel_hash));
  id v5 = [(WFAutoShortcutContextualAction *)self autoShortcut];
  id v6 = (id)[v3 combine:v5];

  v7 = [(WFAutoShortcutContextualAction *)self phrase];

  if (v7)
  {
    id v8 = [(WFAutoShortcutContextualAction *)self phrase];
    id v9 = (id)[v3 combine:v8];
  }
  uint64_t v10 = [(WFAutoShortcutContextualAction *)self alternativePhrases];

  if (v10)
  {
    int v11 = [(WFAutoShortcutContextualAction *)self alternativePhrases];
    id v12 = (id)[v3 combineContentsOfPropertyListObject:v11];
  }
  id v13 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  id v14 = (id)[v3 combineContentsOfPropertyListObject:v13];

  v15 = [(WFAutoShortcutContextualAction *)self parentAction];

  if (v15)
  {
    v16 = [(WFAutoShortcutContextualAction *)self parentAction];
    id v17 = (id)[v3 combine:v16];
  }
  unint64_t v18 = [v3 finalize];

  return v18;
}

- (id)actionForRunningFromSpotlight
{
  v3 = [WFAutoShortcutContextualAction alloc];
  id v4 = [(WFContextualAction *)self identifier];
  id v5 = [(WFAutoShortcutContextualAction *)self parameterlessIdentifier];
  id v6 = [(WFAutoShortcutContextualAction *)self phrase];
  v7 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  id v8 = [(WFAutoShortcutContextualAction *)self actionIdentifier];
  unint64_t v9 = [(WFAutoShortcutContextualAction *)self orderOfShortcut];
  uint64_t v10 = [(WFAutoShortcutContextualAction *)v3 initWithAutoShortcut:0 identifier:v4 parameterlessIdentifier:v5 phrase:v6 alternativePhrases:0 bundleIdentifier:v7 actionIdentifier:v8 orderOfShortcut:v9 parentAction:0 prominentDisplayEligibility:MEMORY[0x1E4F1CC28] executableAppShortcut:0];

  return v10;
}

- (id)actionBySettingEligibilityForProminentDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v17 = [WFAutoShortcutContextualAction alloc];
  id v5 = [(WFAutoShortcutContextualAction *)self autoShortcut];
  id v6 = [(WFAutoShortcutContextualAction *)self parameterlessIdentifier];
  v7 = [(WFAutoShortcutContextualAction *)self phrase];
  id v8 = [(WFAutoShortcutContextualAction *)self alternativePhrases];
  unint64_t v9 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  uint64_t v10 = [(WFAutoShortcutContextualAction *)self actionIdentifier];
  unint64_t v11 = [(WFAutoShortcutContextualAction *)self orderOfShortcut];
  id v12 = [(WFAutoShortcutContextualAction *)self parentAction];
  id v13 = [NSNumber numberWithBool:v3];
  id v14 = [(WFAutoShortcutContextualAction *)self executableAppShortcut];
  v15 = [(WFAutoShortcutContextualAction *)v17 initWithAutoShortcut:v5 identifier:0 parameterlessIdentifier:v6 phrase:v7 alternativePhrases:v8 bundleIdentifier:v9 actionIdentifier:v10 orderOfShortcut:v11 parentAction:v12 prominentDisplayEligibility:v13 executableAppShortcut:v14];

  return v15;
}

- (BOOL)isEligibleForProminentDisplay
{
  v13[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFAutoShortcutContextualAction *)self cachedProminentDisplayEligibility];

  if (v3)
  {
    id v4 = [(WFAutoShortcutContextualAction *)self cachedProminentDisplayEligibility];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  else
  {
    v13[0] = self;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v8 = +[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:v7];
    unint64_t v9 = [v8 firstObject];

    uint64_t v10 = [v9 isEligibleForProminentDisplay];
    unint64_t v11 = [NSNumber numberWithBool:v10];
    cachedProminentDisplayEligibility = self->_cachedProminentDisplayEligibility;
    self->_cachedProminentDisplayEligibility = v11;

    return v10;
  }
}

- (id)creationDate
{
  BOOL v3 = [(WFAutoShortcutContextualAction *)self relatedApp];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 registrationDate];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFAutoShortcutContextualAction;
    uint64_t v5 = [(WFContextualAction *)&v8 creationDate];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)relatedApp
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  return v5;
}

- (BOOL)definesDisplayOrder
{
  return 1;
}

- (BOOL)isTopHitEligible
{
  id v3 = [(WFAutoShortcutContextualAction *)self phrase];
  id v4 = [v3 parameterIdentifier];
  if (v4)
  {
    uint64_t v5 = [(WFAutoShortcutContextualAction *)self executableAppShortcut];
    id v6 = [v5 entityInfo];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  objc_super v8 = [(WFAutoShortcutContextualAction *)self autoShortcut];
  unint64_t v9 = [v8 systemImageName];
  if ([v9 length])
  {
    uint64_t v10 = [(WFAutoShortcutContextualAction *)self autoShortcut];
    unint64_t v11 = [v10 localizedShortTitle];
    if ([v11 length]) {
      BOOL v12 = v7;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)availableFromLockedContext
{
  if (![(WFAutoShortcutContextualAction *)self isTopHitEligible]) {
    return 0;
  }
  id v3 = [(WFAutoShortcutContextualAction *)self executableAppShortcut];
  id v4 = [v3 entityInfo];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)spotlightItem
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v84.receiver = self;
  v84.super_class = (Class)WFAutoShortcutContextualAction;
  id v3 = [(WFContextualAction *)&v84 spotlightItem];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v85 = @"com.apple.musicrecognition";
  *(void *)buf = @"com.shazam.Shazam";
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v85 count:1];
  id v6 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  BOOL v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    objc_super v8 = [v3 attributeSet];
    objc_msgSend(v8, "wf_associateWithBundleIdentifier:", v7);
  }
  unint64_t v9 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  uint64_t v10 = +[WFAutoShortcutContextualAction spotlightDomainIdentifierForBundleIdentifier:v9];
  [v3 setDomainIdentifier:v10];

  unint64_t v11 = [(WFAutoShortcutContextualAction *)self alternativePhrases];
  BOOL v12 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_138);

  if ([v12 count])
  {
    [v4 addObjectsFromArray:v12];
    id v13 = [v3 attributeSet];
    [v13 setAlternateNames:v12];
  }
  id v14 = [(WFAutoShortcutContextualAction *)self parentAction];
  if (v14) {
    uint64_t v15 = 98;
  }
  else {
    uint64_t v15 = 99;
  }

  v16 = [NSNumber numberWithUnsignedInteger:v15];
  id v17 = [v3 attributeSet];
  [v17 setRankingHint:v16];

  unint64_t v18 = [v3 attributeSet];
  id v19 = objc_msgSend(NSNumber, "numberWithInt:", -[WFAutoShortcutContextualAction isEligibleForProminentDisplay](self, "isEligibleForProminentDisplay") ^ 1);
  objc_super v20 = WFSpotlightResultRunnableIneligibleForTopHit();
  [v18 setValue:v19 forCustomKey:v20];

  v21 = [(WFAutoShortcutContextualAction *)self phrase];
  uint64_t v22 = [v21 localizedPhrase];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    v24 = [v3 attributeSet];
    v25 = [(WFAutoShortcutContextualAction *)self phrase];
    v26 = [v25 localizedPhrase];
    id v27 = WFSpotlightResultRunnablePrimaryPhrase();
    [v24 setValue:v26 forCustomKey:v27];
  }
  id v28 = [(WFContextualAction *)self associatedAppBundleIdentifier];
  v29 = v28;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    id v30 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  }
  v31 = v30;

  *(void *)buf = @"com.apple.mobilenotes";
  *(void *)&buf[8] = @"com.apple.freeform";
  *(void *)&buf[16] = @"com.apple.mobilephone";
  v87 = @"com.apple.facetime";
  v88 = @"com.apple.Music";
  v89 = @"com.apple.podcasts";
  objc_super v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:6];
  if ([v32 containsObject:v31])
  {
    id v33 = [(WFAutoShortcutContextualAction *)self phrase];
    uint64_t v34 = [v33 parameterIdentifier];

    if (!v34) {
      goto LABEL_19;
    }
    v35 = getWFSpotlightSyncLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFAutoShortcutContextualAction spotlightItem]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1B3C5C000, v35, OS_LOG_TYPE_INFO, "%s Bundle %@ is top hit exclusive, marking as such", buf, 0x16u);
    }

    objc_super v32 = [v3 attributeSet];
    v36 = WFSpotlightResultRunnableIsAppTopHitExclusive();
    [v32 setValue:MEMORY[0x1E4F1CC38] forCustomKey:v36];
  }
LABEL_19:
  v37 = [(WFAutoShortcutContextualAction *)self searchKeywords];
  [v4 addObjectsFromArray:v37];

  id v38 = [v3 attributeSet];
  [v38 setKeywords:v4];

  id v39 = [(WFAutoShortcutContextualAction *)self executableAppShortcut];
  objc_super v40 = [v39 entityInfo];

  uint64_t v41 = [v3 attributeSet];
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[WFAutoShortcutContextualAction isTopHitEligible](self, "isTopHitEligible"));
  v43 = WFSpotlightResultRunnableIsAppShortcutTopHit();
  [v41 setValue:v42 forCustomKey:v43];

  if (![(WFAutoShortcutContextualAction *)self isTopHitEligible]) {
    goto LABEL_36;
  }
  if (v40)
  {
    v44 = [v40 name];
    v45 = [v3 attributeSet];
    [v45 setDisplayName:v44];

    v46 = [v40 subtitle];
    v47 = [v3 attributeSet];
    [v47 setSubtitle:v46];

    v48 = [v40 icon];
    v49 = [v48 imageURL];

    v50 = [v40 icon];
    v51 = v50;
    if (v49)
    {
      v52 = [v50 imageURL];
      v53 = [v3 attributeSet];
      [v53 setThumbnailURL:v52];

      unint64_t v54 = 0x1E4F28000;
      goto LABEL_29;
    }
    v61 = [v50 systemName];

    v62 = [v40 icon];
    v51 = v62;
    unint64_t v54 = 0x1E4F28000;
    if (v61)
    {
      v52 = [v62 systemName];
      v63 = [v3 attributeSet];
      [(__CFString *)v63 setThumbnailSymbolName:v52];
    }
    else
    {
      v64 = [v62 lnPropertyIdentifier];

      if (v64)
      {
        v51 = [v3 attributeSet];
        v52 = [v40 icon];
        v63 = [v52 lnPropertyIdentifier];
        v65 = WFSpotlightResultRunnableLNPropertyIdentifier();
        [v51 setValue:v63 forCustomKey:v65];

        unint64_t v54 = 0x1E4F28000uLL;
      }
      else
      {
        v79 = getWFSpotlightSyncLogObject();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
        {
          v80 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[WFAutoShortcutContextualAction spotlightItem]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v80;
          _os_log_impl(&dword_1B3C5C000, v79, OS_LOG_TYPE_DEBUG, "%s Indexing App Shortcut with data backed image for %@, this should be investigated", buf, 0x16u);
        }
        v81 = [v40 icon];
        v51 = [v81 imageData];

        v82 = [v3 attributeSet];
        [v82 setThumbnailData:v51];

        if ((unint64_t)[v51 length] < 0x7A121) {
          goto LABEL_30;
        }
        v52 = getWFSpotlightSyncLogObject();
        if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
LABEL_29:

LABEL_30:
          v66 = [v40 subtitle];
          uint64_t v67 = [v66 length];

          if (v67)
          {
            v68 = [v3 attributeSet];
            v69 = [v40 subtitle];
            v70 = WFSpotlightResultRunnableSubtitle();
            [v68 setValue:v69 forCustomKey:v70];
          }
          v71 = [v40 icon];
          uint64_t v72 = [v71 displayStyle];

          if (v72)
          {
            v73 = [v3 attributeSet];
            v74 = *(void **)(v54 + 3792);
            v75 = [v40 icon];
            v76 = objc_msgSend(v74, "numberWithUnsignedInteger:", objc_msgSend(v75, "displayStyle"));
            v77 = WFSpotlightResultRunnableImageDisplayStyle();
            [v73 setValue:v76 forCustomKey:v77];

            unint64_t v54 = 0x1E4F28000uLL;
          }
          v58 = [v3 attributeSet];
          v59 = objc_msgSend(*(id *)(v54 + 3792), "numberWithUnsignedInteger:", objc_msgSend(v40, "badge"));
          v60 = WFSpotlightResultRunnableTopHitBadge();
          [v58 setValue:v59 forCustomKey:v60];
          goto LABEL_35;
        }
        uint64_t v83 = [v51 length];
        v63 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[WFAutoShortcutContextualAction spotlightItem]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v83;
        unint64_t v54 = 0x1E4F28000;
        *(_WORD *)&buf[22] = 2112;
        v87 = v63;
        _os_log_impl(&dword_1B3C5C000, v52, OS_LOG_TYPE_DEBUG, "%s Indexing large App Shortcut image of size %lu for app %@", buf, 0x20u);
      }
    }

    goto LABEL_29;
  }
  v55 = [(WFAutoShortcutContextualAction *)self autoShortcut];
  v56 = [v55 localizedShortTitle];
  v57 = [v3 attributeSet];
  [v57 setDisplayName:v56];

  v58 = [(WFAutoShortcutContextualAction *)self autoShortcut];
  v59 = [v58 localizedAutoShortcutDescription];
  v60 = [v3 attributeSet];
  [v60 setSubtitle:v59];
LABEL_35:

LABEL_36:
  return v3;
}

id __47__WFAutoShortcutContextualAction_spotlightItem__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 localizedPhrase];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = [v2 localizedPhrase];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (WFAutoShortcutContextualAction)initWithExecutableAppShortcut:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [v6 underlyingAutoShortcut];
  objc_super v8 = [v7 basePhraseTemplates];
  unint64_t v9 = [v8 firstObject];
  uint64_t v10 = [v9 key];

  unint64_t v11 = [v6 underlyingAutoShortcut];
  BOOL v12 = [v6 phrase];
  id v13 = [v6 alternatePhrases];
  id v14 = [v6 bundleIdentifier];
  uint64_t v15 = [v6 underlyingAutoShortcut];
  v16 = [v15 actionIdentifier];
  id v17 = [(WFAutoShortcutContextualAction *)self initWithAutoShortcut:v11 identifier:0 parameterlessIdentifier:v10 phrase:v12 alternativePhrases:v13 bundleIdentifier:v14 actionIdentifier:v16 orderOfShortcut:a4 parentAction:0 prominentDisplayEligibility:0 executableAppShortcut:v6];

  return v17;
}

- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 identifier:(id)a4 parameterlessIdentifier:(id)a5 phrase:(id)a6 alternativePhrases:(id)a7 bundleIdentifier:(id)a8 actionIdentifier:(id)a9 orderOfShortcut:(unint64_t)a10 parentAction:(id)a11 prominentDisplayEligibility:(id)a12 executableAppShortcut:(id)a13
{
  id v66 = a3;
  id v65 = a4;
  id v53 = a5;
  id v61 = a5;
  id v52 = a6;
  id v19 = a6;
  id v63 = a7;
  id v20 = a8;
  id v21 = a9;
  id v59 = a11;
  id v58 = a12;
  id v57 = a13;
  if (!v20)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"WFAutoShortcutContextualAction.m", 260, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  uint64_t v22 = [v66 attributionBundleIdentifier];
  uint64_t v23 = (void *)v22;
  if (v22) {
    v24 = (void *)v22;
  }
  else {
    v24 = v20;
  }
  id v25 = v24;

  v26 = [v19 signature];
  if (v65)
  {
    id v27 = v65;

    v26 = v27;
  }
  id v28 = v63;
  v29 = [v19 localizedPhrase];
  uint64_t v30 = [v66 systemImageName];
  v60 = v19;
  v56 = (void *)v30;
  if (v30)
  {
    v64 = +[WFContextualActionIcon iconWithSystemName:v30];
  }
  else
  {
    v64 = 0;
  }
  v69[0] = 0;
  v55 = objc_opt_new();
  v31 = v21;
  objc_super v32 = [v55 actionForBundleIdentifier:v20 andActionIdentifier:v21 error:v69];
  id v54 = v69[0];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  if (v32)
  {
    uint64_t v34 = [v32 descriptionMetadata];

    if (v34)
    {
      v35 = [v32 descriptionMetadata];
      v36 = [v35 searchKeywords];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __229__WFAutoShortcutContextualAction_initWithAutoShortcut_identifier_parameterlessIdentifier_phrase_alternativePhrases_bundleIdentifier_actionIdentifier_orderOfShortcut_parentAction_prominentDisplayEligibility_executableAppShortcut___block_invoke;
      v67[3] = &unk_1E6077890;
      id v68 = v66;
      objc_msgSend(v36, "if_map:", v67);
      uint64_t v38 = v37 = v26;

      id v33 = (id)v38;
      v26 = v37;
      id v28 = v63;
    }
  }
  BYTE2(v50) = 0;
  LOWORD(v50) = 1;
  id v39 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:", v26, &stru_1F0C7EBE0, v25, MEMORY[0x1E4F1CBF0], v29, v29, 0, 0, v64, v50);
  objc_super v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_autoShortcut, a3);
    objc_storeStrong((id *)&v40->_phrase, v52);
    uint64_t v41 = [v28 copy];
    alternativePhrases = v40->_alternativePhrases;
    v40->_alternativePhrases = (NSArray *)v41;

    uint64_t v43 = [v20 copy];
    bundleIdentifier = v40->_bundleIdentifier;
    v40->_bundleIdentifier = (NSString *)v43;

    uint64_t v45 = [v31 copy];
    actionIdentifier = v40->_actionIdentifier;
    v40->_actionIdentifier = (NSString *)v45;

    v40->_orderOfShortcut = a10;
    objc_storeStrong((id *)&v40->_cachedProminentDisplayEligibility, a12);
    objc_storeStrong((id *)&v40->_parentAction, a11);
    objc_storeStrong((id *)&v40->_executableAppShortcut, a13);
    objc_storeStrong((id *)&v40->_parameterlessIdentifier, v53);
    objc_storeStrong((id *)&v40->_searchKeywords, v33);
    v47 = v40;
  }

  return v40;
}

id __229__WFAutoShortcutContextualAction_initWithAutoShortcut_identifier_parameterlessIdentifier_phrase_alternativePhrases_bundleIdentifier_actionIdentifier_orderOfShortcut_parentAction_prominentDisplayEligibility_executableAppShortcut___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 localeIdentifier];
  BOOL v5 = [v3 localizedStringForLocaleIdentifier:v4];

  return v5;
}

- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 phrase:(id)a4 alternativePhrases:(id)a5 bundleIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v13 basePhraseTemplates];
  uint64_t v15 = [v14 firstObject];
  v16 = [v15 key];

  id v17 = [v13 actionIdentifier];
  unint64_t v18 = [(WFAutoShortcutContextualAction *)self initWithAutoShortcut:v13 identifier:0 parameterlessIdentifier:v16 phrase:v12 alternativePhrases:v11 bundleIdentifier:v10 actionIdentifier:v17 orderOfShortcut:0 parentAction:0 prominentDisplayEligibility:0 executableAppShortcut:0];

  return v18;
}

- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFAutoShortcutContextualAction.m", 221, @"Invalid parameter not satisfying: %@", @"autoShortcut" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"WFAutoShortcutContextualAction.m", 222, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v7 parameterlessPhrases];
  uint64_t v11 = [v7 parameterGroups];
  if (v11 | v10)
  {
    if ([(id)v10 count])
    {
      id v12 = (id)v10;
      if ((unint64_t)[v12 count] >= 2)
      {
        objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v13 = 0;
      }
      id v19 = [v12 firstObject];

      id v20 = v13;
    }
    else
    {
      uint64_t v15 = [(id)v11 firstObject];
      v16 = [v15 phrases];

      id v17 = v16;
      if ((unint64_t)[v17 count] >= 2)
      {
        objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = 0;
      }
      id v19 = [v17 firstObject];

      id v20 = v18;
    }
    self = [(WFAutoShortcutContextualAction *)self initWithAutoShortcut:v7 phrase:v19 alternativePhrases:v20 bundleIdentifier:v9];

    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@-%@", @"app-shortcut", a3];
}

+ (id)legacySpotlightDomainIdentifier
{
  return @"app-shortcut";
}

+ (id)autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFAutoShortcutContextualAction.m", 188, @"Invalid parameter not satisfying: %@", @"autoShortcutContextualActions" object file lineNumber description];
  }
  id v6 = objc_msgSend(v5, "if_map:", &__block_literal_global_4703);
  id v7 = +[WFSharedLinkMetadataProvider sharedProvider];
  id v8 = [v7 metadataProvider];

  id v17 = 0;
  unint64_t v9 = [v8 actionsWithFullyQualifiedIdentifiers:v6 error:&v17];
  id v10 = v17;
  if (v9)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __104__WFAutoShortcutContextualAction_autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay___block_invoke_119;
    v15[3] = &unk_1E6077868;
    v16 = v9;
    uint64_t v11 = objc_msgSend(v5, "if_compactMap:", v15);
    id v12 = v16;
  }
  else
  {
    id v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "+[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:]";
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_FAULT, "%s Error fetching auto shortcut metadata, are you properly entitled to talk to linkd?: %@", buf, 0x16u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

id __104__WFAutoShortcutContextualAction_autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleIdentifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [v3 autoShortcut];
    id v8 = [v7 actionIdentifier];
    unint64_t v9 = [v6 objectForKeyedSubscript:v8];

    if (v9)
    {
      id v10 = objc_msgSend(v3, "actionBySettingEligibilityForProminentDisplay:", -[NSObject openAppWhenRun](v9, "openAppWhenRun") ^ 1);
      goto LABEL_10;
    }
    id v12 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      id v13 = [v3 autoShortcut];
      id v14 = [v13 actionIdentifier];
      uint64_t v15 = [v3 bundleIdentifier];
      int v17 = 136315650;
      id v18 = "+[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:]_block_invoke";
      __int16 v19 = 2112;
      __int16 v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_FAULT, "%s We got auto shortcut metadata with no error, but can't find %@ in the returned set (for bundle %@)", (uint8_t *)&v17, 0x20u);
    }
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = [v3 bundleIdentifier];
      int v17 = 136315394;
      id v18 = "+[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:]_block_invoke";
      __int16 v19 = 2112;
      __int16 v20 = v11;
      _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_FAULT, "%s We got auto shortcut metadata with no error, but can't find %@ in the returned set", (uint8_t *)&v17, 0x16u);
    }
  }
  id v10 = 0;
LABEL_10:

  return v10;
}

id __104__WFAutoShortcutContextualAction_autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F72CA0];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 autoShortcut];
  id v6 = [v5 actionIdentifier];
  id v7 = [v3 bundleIdentifier];

  id v8 = (void *)[v4 initWithActionIdentifier:v6 bundleIdentifier:v7];
  return v8;
}

+ (id)allActionsForAutoShortcut:(id)a3 bundleIdentifier:(id)a4 startIndex:(unint64_t)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"WFAutoShortcutContextualAction.m", 131, @"Invalid parameter not satisfying: %@", @"autoShortcut" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"WFAutoShortcutContextualAction.m", 132, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [v9 parameterlessPhrases];
  uint64_t v13 = [v9 parameterGroups];
  if (v13 | v12)
  {
    id v14 = (id)v12;
    if ((unint64_t)[v14 count] >= 2)
    {
      objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 1);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = 0;
    }
    int v17 = [v14 firstObject];

    id v18 = v15;
    if (v17)
    {
      __int16 v19 = [WFAutoShortcutContextualAction alloc];
      __int16 v20 = [v9 actionIdentifier];
      __int16 v21 = [(WFAutoShortcutContextualAction *)v19 initWithAutoShortcut:v9 identifier:0 parameterlessIdentifier:0 phrase:v17 alternativePhrases:v18 bundleIdentifier:v11 actionIdentifier:v20 orderOfShortcut:a5 parentAction:0 prominentDisplayEligibility:0 executableAppShortcut:0];

      ++a5;
    }
    else
    {
      __int16 v21 = 0;
    }
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __88__WFAutoShortcutContextualAction_allActionsForAutoShortcut_bundleIdentifier_startIndex___block_invoke;
    v29[3] = &unk_1E6077820;
    unint64_t v33 = a5;
    id v30 = v9;
    id v31 = v11;
    uint64_t v22 = v21;
    objc_super v32 = v22;
    uint64_t v23 = objc_msgSend((id)v13, "if_compactMap:", v29);
    v24 = v23;
    if (v22)
    {
      v34[0] = v22;
      id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      id v16 = [v25 arrayByAddingObjectsFromArray:v24];
    }
    else
    {
      id v16 = v23;
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

WFAutoShortcutContextualAction *__88__WFAutoShortcutContextualAction_allActionsForAutoShortcut_bundleIdentifier_startIndex___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1[7];
  id v6 = [a2 phrases];
  if ((unint64_t)[v6 count] >= 2)
  {
    objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [v6 firstObject];
  uint64_t v9 = v5 + a3;
  id v10 = v7;

  uint64_t v11 = [WFAutoShortcutContextualAction alloc];
  uint64_t v12 = (void *)a1[4];
  uint64_t v13 = a1[5];
  id v14 = [v12 actionIdentifier];
  id v15 = [(WFAutoShortcutContextualAction *)v11 initWithAutoShortcut:v12 identifier:0 parameterlessIdentifier:0 phrase:v8 alternativePhrases:v10 bundleIdentifier:v13 actionIdentifier:v14 orderOfShortcut:v9 parentAction:a1[6] prominentDisplayEligibility:0 executableAppShortcut:0];

  return v15;
}

- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3
{
  id v6 = [(WFAutoShortcutContextualAction *)self bundleIdentifier];
  uint64_t v5 = [(WFAutoShortcutContextualAction *)self actionIdentifier];
  [(WFContextualAction *)self wf_launchAppIfNeededUsingSurface:a3 linkAction:0 appBundleIdentifier:v6 actionIdentifier:v5];
}

@end