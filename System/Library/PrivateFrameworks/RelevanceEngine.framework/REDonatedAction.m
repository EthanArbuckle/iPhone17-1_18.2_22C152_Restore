@interface REDonatedAction
+ (BOOL)supportedActivityType:(id)a3 forBundleID:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)bundleIdForExtensionId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalDonation;
- (NSArray)relevanceProviders;
- (NSDate)creationDate;
- (NSDate)localSaveDate;
- (NSString)activityType;
- (NSString)appLevelIdentifier;
- (NSString)bundleIdentifier;
- (NSString)eventLevelIdentifier;
- (NSString)identifier;
- (NSString)intentTypeName;
- (NSString)localBundleIdentifier;
- (NSString)remoteBundleIdentifier;
- (REDonatedAction)initWithCoder:(id)a3;
- (REDonatedAction)initWithEvent:(id)a3 filtered:(BOOL)a4;
- (REDonatedActionIdentifierProviding)actionTypeIdentifier;
- (REDonatedActionIdentifierProviding)simplifiedActionTypeIdentifier;
- (REIdentifier)donationIdentifier;
- (_DKEvent)event;
- (id)_initInteractionWithEvent:(id)a3 filtered:(BOOL)a4;
- (id)_initRelevantShortcutWithEvent:(id)a3 filtered:(BOOL)a4;
- (id)_initUserActivityWithEvent:(id)a3 filtered:(BOOL)a4;
- (id)_shortcutFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)generateMetrics;
- (unint64_t)_hashRelevanceProviders:(id)a3;
- (unint64_t)filteredShortcutType;
- (unint64_t)relevanceProvidersHash;
- (unint64_t)trainingActionIdentifier;
- (unint64_t)type;
- (void)_loadDuetEvent:(id)a3;
- (void)_loadShortcutIdentifiersFromIntent:(id)a3;
- (void)_loadShortcutIdentifiersFromUserActivity:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)loadIntent:(id)a3;
- (void)loadRelevantShortcut:(id)a3;
- (void)loadUserActivity:(id)a3;
- (void)setEvent:(id)a3;
@end

@implementation REDonatedAction

+ (id)bundleIdForExtensionId:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (bundleIdForExtensionId__onceToken == -1)
  {
    if (v3)
    {
LABEL_3:
      v5 = [(id)bundleIdForExtensionId__pluginIdToBundleId objectForKeyedSubscript:v4];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&bundleIdForExtensionId__onceToken, &__block_literal_global_74);
    if (v4) {
      goto LABEL_3;
    }
  }
  v5 = 0;
LABEL_6:

  return v5;
}

void __42__REDonatedAction_bundleIdForExtensionId___block_invoke()
{
  v0 = (void *)bundleIdForExtensionId__pluginIdToBundleId;
  bundleIdForExtensionId__pluginIdToBundleId = (uint64_t)&unk_26CFCD8E0;
}

+ (BOOL)supportedActivityType:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v15 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v15];
  id v8 = v15;
  if (!v7)
  {
    v11 = RELogForDomain(14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[REDonatedAction supportedActivityType:forBundleID:]();
    }
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  v9 = [v7 applicationState];
  int v10 = [v9 isInstalled];

  if (v10)
  {
    v11 = [v7 teamIdentifier];
    v12 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
    v13 = [v7 userActivityTypes];
    if ([v13 containsObject:v12]) {
      LOBYTE(v10) = 1;
    }
    else {
      LOBYTE(v10) = [v13 containsObject:v5];
    }

LABEL_10:
  }

  return v10;
}

- (REDonatedAction)initWithEvent:(id)a3 filtered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (CoreDuetLibraryCore_1())
  {
    v7 = [v6 stream];
    id v8 = [get_DKSystemEventStreamsClass_1() appIntentsStream];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      id v10 = [(REDonatedAction *)self _initInteractionWithEvent:v6 filtered:v4];
    }
    else
    {
      v12 = [get_DKSystemEventStreamsClass_1() appActivityStream];
      int v13 = [v7 isEqual:v12];

      if (v13)
      {
        id v10 = [(REDonatedAction *)self _initUserActivityWithEvent:v6 filtered:v4];
      }
      else
      {
        v14 = [get_DKSystemEventStreamsClass_1() appRelevantShortcutsStream];
        int v15 = [v7 isEqual:v14];

        if (!v15)
        {
          v17 = RELogForDomain(14);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[REDonatedAction initWithEvent:filtered:]();
          }

          v11 = 0;
          goto LABEL_10;
        }
        id v10 = [(REDonatedAction *)self _initRelevantShortcutWithEvent:v6 filtered:v4];
      }
    }
    self = (REDonatedAction *)v10;
    v11 = self;
LABEL_10:

    goto LABEL_11;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [v4 identifier];
    id v6 = [(REDonatedAction *)self identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_initInteractionWithEvent:(id)a3 filtered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2050000000;
  char v7 = (void *)get_DKIntentMetadataKeyClass_softClass_0;
  uint64_t v64 = get_DKIntentMetadataKeyClass_softClass_0;
  if (!get_DKIntentMetadataKeyClass_softClass_0)
  {
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __get_DKIntentMetadataKeyClass_block_invoke_0;
    v60[3] = &unk_2644BC768;
    v60[4] = &v61;
    __get_DKIntentMetadataKeyClass_block_invoke_0((uint64_t)v60);
    char v7 = (void *)v62[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v61, 8);
  int v9 = [v8 serializedInteraction];
  id v10 = [v6 metadata];
  v11 = [v10 objectForKeyedSubscript:v9];

  id v59 = 0;
  v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v59];
  id v13 = v59;
  v14 = [v12 intent];
  int v15 = v14;
  if (v14)
  {
    v54 = self;
    BOOL v52 = v4;
    v16 = REParametersForIntent(v14);
    v17 = v16;
    if (v16)
    {
      v56 = v12;
      id v18 = v6;
      v19 = v11;
      v20 = v9;
      id v21 = v13;
      objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "re_actionIdentifierHashValue"));
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      v23 = RESimplifiedParametersForIntent(v15);
      v24 = v23;
      BOOL v25 = v23 != 0;
      if (v23)
      {
        objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v23, "re_actionIdentifierHashValue"));
        id v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v26 = 0;
      }

      id v13 = v21;
      int v9 = v20;
      v11 = v19;
      id v6 = v18;
      v12 = v56;
    }
    else
    {
      id v22 = 0;
      id v26 = 0;
      BOOL v25 = 0;
    }

    id v57 = v22;
    id v28 = v26;
    id v29 = v22;
    if (v25 || !v52)
    {
      id v53 = v28;
      v58.receiver = v54;
      v58.super_class = (Class)REDonatedAction;
      v30 = [(REDonatedAction *)&v58 init];
      if (v30)
      {
        id obj = v29;
        id v51 = v13;
        v31 = [v15 extensionBundleId];
        v32 = +[REDonatedAction bundleIdForExtensionId:v31];
        v33 = v32;
        if (v32)
        {
          id v55 = v32;
        }
        else
        {
          v34 = [v6 source];
          id v55 = [v34 bundleID];
        }
        v35 = [REIdentifier alloc];
        v36 = [v6 UUID];
        v37 = [v36 UUIDString];
        uint64_t v38 = [(REIdentifier *)v35 initWithDataSource:v55 section:&stru_26CFA57D0 identifier:v37];
        donationIdentifier = v30->_donationIdentifier;
        v30->_donationIdentifier = (REIdentifier *)v38;

        v30->_type = 1;
        uint64_t v40 = [v6 startDate];
        creationDate = v30->_creationDate;
        v30->_creationDate = (NSDate *)v40;

        uint64_t v42 = [v6 localCreationDate];
        localSaveDate = v30->_localSaveDate;
        v30->_localSaveDate = (NSDate *)v42;

        objc_storeStrong((id *)&v30->_actionTypeIdentifier, obj);
        objc_storeStrong((id *)&v30->_simplifiedActionTypeIdentifier, v26);
        v44 = [v6 source];
        v45 = [v44 deviceID];
        v30->_localDonation = v45 == 0;

        uint64_t v46 = [v15 _className];
        intentTypeName = v30->_intentTypeName;
        v30->_intentTypeName = (NSString *)v46;

        v30->_isIntentBacked = 1;
        relevanceProviders = v30->_relevanceProviders;
        v30->_relevanceProviders = (NSArray *)MEMORY[0x263EFFA68];

        v30->_filteredShortcutType = 0;
        [(REDonatedAction *)v30 _loadShortcutIdentifiersFromIntent:v15];

        id v13 = v51;
      }
      self = v30;
      v27 = self;
      id v28 = v53;
    }
    else
    {
      v27 = 0;
      self = v54;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)_initUserActivityWithEvent:(id)a3 filtered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [get_DKApplicationActivityMetadataKeyClass() isEligibleForPrediction];
  id v8 = [v6 metadata];
  int v9 = [v8 objectForKeyedSubscript:v7];

  if ([v9 BOOLValue])
  {
    id v10 = [get_DKApplicationActivityMetadataKeyClass() activityType];
    v11 = [v6 metadata];
    v12 = [v11 objectForKeyedSubscript:v10];

    id v13 = [v6 value];
    v14 = [v13 stringValue];

    if (+[REDonatedAction supportedActivityType:v12 forBundleID:v14]|| !v4)
    {
      uint64_t v16 = [get_DKApplicationActivityMetadataKeyClass() userActivityRequiredString];
      v17 = [v6 metadata];
      v36 = (void *)v16;
      id v18 = [v17 objectForKeyedSubscript:v16];

      v35 = v18;
      if (v18) {
        id v18 = (void *)[objc_alloc(MEMORY[0x263F018D0]) _initWithUserActivityStrings:v18 secondaryString:0 optionalData:0];
      }
      v19 = REExtractUserActivity(v18);
      if (v19 || !v4)
      {
        v37.receiver = self;
        v37.super_class = (Class)REDonatedAction;
        v20 = [(REDonatedAction *)&v37 init];
        if (v20)
        {
          v33 = [REIdentifier alloc];
          [v6 UUID];
          id v21 = v34 = v18;
          id v22 = [v21 UUIDString];
          uint64_t v23 = [(REIdentifier *)v33 initWithDataSource:v14 section:&stru_26CFA57D0 identifier:v22];
          donationIdentifier = v20->_donationIdentifier;
          v20->_donationIdentifier = (REIdentifier *)v23;

          id v18 = v34;
          v20->_type = 0;
          uint64_t v25 = [v6 startDate];
          creationDate = v20->_creationDate;
          v20->_creationDate = (NSDate *)v25;

          uint64_t v27 = [v6 localCreationDate];
          localSaveDate = v20->_localSaveDate;
          v20->_localSaveDate = (NSDate *)v27;

          objc_storeStrong((id *)&v20->_actionTypeIdentifier, v19);
          objc_storeStrong((id *)&v20->_simplifiedActionTypeIdentifier, v19);
          objc_storeStrong((id *)&v20->_activityType, v12);
          id v29 = [v6 source];
          v30 = [v29 deviceID];
          v20->_localDonation = v30 == 0;

          v20->_isIntentBacked = 0;
          relevanceProviders = v20->_relevanceProviders;
          v20->_relevanceProviders = (NSArray *)MEMORY[0x263EFFA68];

          v20->_filteredShortcutType = 0;
          [(REDonatedAction *)v20 _loadShortcutIdentifiersFromUserActivity:v34];
        }
        self = v20;
        int v15 = self;
      }
      else
      {
        int v15 = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

- (id)_initRelevantShortcutWithEvent:(id)a3 filtered:(BOOL)a4
{
  BOOL v62 = a4;
  id v5 = a3;
  id v6 = [v5 relevantShortcut];
  char v7 = [v6 watchTemplate];
  if (v7)
  {

    goto LABEL_3;
  }
  v19 = [v6 widgetKind];

  if (!v19)
  {
LABEL_3:
    id v8 = [v5 stringValue];
    int v9 = [v6 shortcut];
    id v10 = [v9 intent];

    uint64_t v61 = self;
    if (v10)
    {
      id v11 = v10;
      v12 = REParametersForIntent(v11);
      id v13 = v12;
      if (v12)
      {
        objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "re_actionIdentifierHashValue"));
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        int v15 = RESimplifiedParametersForIntent(v11);
        uint64_t v16 = v15;
        BOOL v17 = v15 != 0;
        if (v15)
        {
          objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "re_actionIdentifierHashValue"));
          id v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v18 = 0;
        }
      }
      else
      {
        id v14 = 0;
        id v18 = 0;
        BOOL v17 = 0;
      }

      id v21 = v14;
      id v22 = v18;
      if (!v17 && v62)
      {
        v20 = 0;
        self = v61;
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v23 = [v11 extensionBundleId];
      uint64_t v24 = +[REDonatedAction bundleIdForExtensionId:v23];
      uint64_t v25 = (void *)v24;
      if (v24) {
        id v26 = (void *)v24;
      }
      else {
        id v26 = v8;
      }
      id v27 = v26;

      id v8 = v27;
      self = v61;
    }
    else
    {
      id v21 = 0;
      id v22 = 0;
    }
    id v28 = [v6 shortcut];
    id v29 = [v28 userActivity];

    if (v29)
    {
      objc_super v58 = v22;
      id v59 = v21;
      v30 = [v29 activityType];
      v60 = v8;
      id v31 = v8;
      v32 = [v5 source];
      v33 = [v32 deviceID];

      if (v33)
      {
        v34 = (void *)[objc_alloc(MEMORY[0x263F100B8]) initWithUserActivityType:v30 launchableAppBundleId:v31];
        v35 = [MEMORY[0x263F0FAE8] defaultResolver];
        v36 = [v35 resolveUserActivityExecutionInfo:v34];
        uint64_t v37 = [v36 launchableAppBundleId];

        id v31 = (id)v37;
      }
      id v21 = v59;
      if (!+[REDonatedAction supportedActivityType:v30 forBundleID:v31]&& v62)
      {
        goto LABEL_28;
      }
      uint64_t v38 = REExtractUserActivity(v29);

      if (!v38 && v62)
      {
        id v21 = 0;
LABEL_28:
        id v8 = v60;

        v20 = 0;
        self = v61;
        id v22 = v58;
LABEL_38:

        goto LABEL_39;
      }
      id v21 = v38;

      id v22 = v21;
      self = v61;
    }
    else
    {
      if (!v10)
      {
        v20 = 0;
        goto LABEL_38;
      }
      v60 = v8;
    }
    v64.receiver = self;
    v64.super_class = (Class)REDonatedAction;
    v39 = [(REDonatedAction *)&v64 init];
    if (v39)
    {
      BOOL v40 = v29 == 0;
      uint64_t v63 = v29;
      v41 = [REIdentifier alloc];
      [v5 UUID];
      v43 = uint64_t v42 = v21;
      v44 = [v43 UUIDString];
      uint64_t v45 = [(REIdentifier *)v41 initWithDataSource:v60 section:&stru_26CFA57D0 identifier:v44];
      donationIdentifier = v39->_donationIdentifier;
      v39->_donationIdentifier = (REIdentifier *)v45;

      id v21 = v42;
      v39->_type = 2;
      uint64_t v47 = [v5 startDate];
      creationDate = v39->_creationDate;
      v39->_creationDate = (NSDate *)v47;

      uint64_t v49 = [v5 localCreationDate];
      localSaveDate = v39->_localSaveDate;
      v39->_localSaveDate = (NSDate *)v49;

      objc_storeStrong((id *)&v39->_actionTypeIdentifier, v42);
      objc_storeStrong((id *)&v39->_simplifiedActionTypeIdentifier, v22);
      id v51 = [v6 relevanceProviders];
      v39->_relevanceProvidersHash = [(REDonatedAction *)v39 _hashRelevanceProviders:v51];

      BOOL v52 = [v5 source];
      id v53 = [v52 deviceID];
      v39->_localDonation = v53 == 0;

      v39->_isIntentBacked = v40;
      v54 = [v6 relevanceProviders];
      uint64_t v55 = RERelevanceProviderForRelevanceProviders(v54, v60);
      relevanceProviders = v39->_relevanceProviders;
      v39->_relevanceProviders = (NSArray *)v55;

      v39->_filteredShortcutType = 0;
      if (v10)
      {
        [(REDonatedAction *)v39 _loadShortcutIdentifiersFromIntent:v10];
        id v29 = v63;
      }
      else
      {
        id v29 = v63;
        [(REDonatedAction *)v39 _loadShortcutIdentifiersFromUserActivity:v63];
      }
    }
    self = v39;
    v20 = self;
    id v8 = v60;
    goto LABEL_38;
  }
  v20 = 0;
LABEL_40:

  return v20;
}

- (id)_shortcutFilter
{
  if (_shortcutFilter_onceToken != -1) {
    dispatch_once(&_shortcutFilter_onceToken, &__block_literal_global_32_1);
  }
  v2 = (void *)_shortcutFilter_Filter;
  return v2;
}

uint64_t __34__REDonatedAction__shortcutFilter__block_invoke()
{
  v0 = objc_alloc_init(REShortcutFilter);
  uint64_t v1 = _shortcutFilter_Filter;
  _shortcutFilter_Filter = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)_loadShortcutIdentifiersFromIntent:(id)a3
{
  self->_filteredShortcutType = 1;
  id v4 = a3;
  id v5 = [(REDonatedAction *)self _shortcutFilter];
  id v16 = [v5 intentByFilteringIntent:v4 withLevel:1];

  id v6 = [(REDonatedAction *)self _shortcutFilter];
  char v7 = [v6 intentByFilteringIntent:v4 withLevel:0];

  id v8 = [(REDonatedAction *)self _shortcutFilter];
  int v9 = [(REDonatedAction *)self bundleIdentifier];
  id v10 = [v8 identifierForIntent:v16 bundleIdentifier:v9];
  appLevelIdentifier = self->_appLevelIdentifier;
  self->_appLevelIdentifier = v10;

  v12 = [(REDonatedAction *)self _shortcutFilter];
  id v13 = [(REDonatedAction *)self bundleIdentifier];
  id v14 = [v12 identifierForIntent:v7 bundleIdentifier:v13];
  eventLevelIdentifier = self->_eventLevelIdentifier;
  self->_eventLevelIdentifier = v14;
}

- (void)_loadShortcutIdentifiersFromUserActivity:(id)a3
{
  self->_filteredShortcutType = 1;
  id v4 = a3;
  id v5 = [(REDonatedAction *)self _shortcutFilter];
  id v16 = [v5 userActivityByFilteringUserActivity:v4 withLevel:1];

  id v6 = [(REDonatedAction *)self _shortcutFilter];
  char v7 = [v6 userActivityByFilteringUserActivity:v4 withLevel:0];

  id v8 = [(REDonatedAction *)self _shortcutFilter];
  int v9 = [(REDonatedAction *)self bundleIdentifier];
  id v10 = [v8 identifierForUserActivity:v16 bundleIdentifier:v9];
  appLevelIdentifier = self->_appLevelIdentifier;
  self->_appLevelIdentifier = v10;

  v12 = [(REDonatedAction *)self _shortcutFilter];
  id v13 = [(REDonatedAction *)self bundleIdentifier];
  id v14 = [v12 identifierForUserActivity:v7 bundleIdentifier:v13];
  eventLevelIdentifier = self->_eventLevelIdentifier;
  self->_eventLevelIdentifier = v14;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(REDonatedAction *)self type];
  if (v5 > 2) {
    id v6 = &stru_26CFA57D0;
  }
  else {
    id v6 = *(&off_2644C01C0 + v5);
  }
  char v7 = [(REDonatedAction *)self bundleIdentifier];
  id v8 = [(REDonatedAction *)self identifier];
  int v9 = [v3 stringWithFormat:@"<%@: %p> %@ %@ %@", v4, self, v6, v7, v8];

  return v9;
}

- (unint64_t)_hashRelevanceProviders:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 ^= [*(id *)(*((void *)&v10 + 1) + 8 * i) hash];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return [(REIdentifier *)self->_donationIdentifier identifier];
}

- (NSString)bundleIdentifier
{
  return [(REIdentifier *)self->_donationIdentifier dataSource];
}

- (NSString)remoteBundleIdentifier
{
  BOOL v3 = [(REDonatedAction *)self isLocalDonation];
  uint64_t v4 = [(REDonatedAction *)self bundleIdentifier];
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = RERemoteApplicationIdentifierForLocalApplication(v4);

    uint64_t v5 = (void *)v6;
  }
  return (NSString *)v5;
}

- (NSString)localBundleIdentifier
{
  BOOL v3 = [(REDonatedAction *)self isLocalDonation];
  uint64_t v4 = [(REDonatedAction *)self bundleIdentifier];
  uint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v6 = RELocalApplicationIdentifierForRemoteApplication(v4);

    uint64_t v5 = (void *)v6;
  }
  return (NSString *)v5;
}

- (unint64_t)trainingActionIdentifier
{
  if (self->_isIntentBacked) {
    [(REDonatedAction *)self simplifiedActionTypeIdentifier];
  }
  else {
  v2 = [(REDonatedAction *)self actionTypeIdentifier];
  }
  unint64_t v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");

  return v3;
}

- (id)generateMetrics
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  if ([(REDonatedAction *)self type] != 2)
  {
    BOOL v17 = 0;
    goto LABEL_52;
  }
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  uint64_t v4 = [(REDonatedAction *)self event];
  uint64_t v5 = [v4 relevantShortcut];

  uint64_t v6 = [v5 shortcut];
  uint64_t v7 = [v6 intent];

  id v8 = [v5 shortcut];
  uint64_t v9 = [v8 userActivity];

  long long v10 = @"none";
  long long v11 = v10;
  id v57 = (void *)v9;
  if (v7)
  {
    long long v12 = [v5 watchTemplate];

    long long v13 = REShortcutTypeIntent;
    if (v12) {
      long long v13 = REShortcutTypeIntentWithTemplate;
    }
    id v14 = *v13;

    v56 = v14;
    [v3 setObject:v14 forKey:@"shortcutType"];
    uint64_t v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    [v3 setObject:v16 forKey:@"intentType"];
  }
  else
  {
    id v18 = v10;
    if (v9)
    {
      v19 = [v5 watchTemplate];

      v20 = REShortcutTypeActivity;
      if (v19) {
        v20 = REShortcutTypeActivityWithTemplate;
      }
      id v18 = *v20;
    }
    v56 = v18;
    [v3 setObject:v18 forKey:@"shortcutType"];
  }
  id v21 = v11;
  id v22 = [v5 watchTemplate];

  if (v22)
  {
    uint64_t v23 = [v5 watchTemplate];
    uint64_t v24 = [v23 image];

    uint64_t v25 = v21;
    if (!v24) {
      goto LABEL_20;
    }
    id v26 = RESourceTemplate;
  }
  else
  {
    id v27 = [v7 keyImage];

    if (v27)
    {
      id v26 = RESourceIntent;
    }
    else
    {
      id v28 = [v5 shortcut];
      id v29 = [v28 activityImage];

      uint64_t v25 = v21;
      if (!v29) {
        goto LABEL_20;
      }
      id v26 = RESourceActivity;
    }
  }
  uint64_t v25 = *v26;

LABEL_20:
  [v3 setObject:v25 forKey:@"imageSource"];
  v30 = v21;
  id v31 = [v5 watchTemplate];

  objc_super v58 = v7;
  if (v31)
  {
    v32 = [v5 watchTemplate];
    v33 = [v32 subtitle];

    if (v33)
    {
      v34 = RESourceTemplate;
LABEL_27:
      uint64_t v38 = *v34;

      v30 = v38;
    }
  }
  else
  {
    v35 = [v7 _subtitle];

    if (v35)
    {
      v34 = RESourceIntent;
      goto LABEL_27;
    }
    v36 = [v5 shortcut];
    uint64_t v37 = [v36 activitySubtitle];

    if (v37)
    {
      v34 = RESourceActivity;
      goto LABEL_27;
    }
  }
  id v59 = v3;
  uint64_t v55 = v30;
  [v3 setObject:v30 forKey:@"subtitleSource"];
  v39 = [v5 relevanceProviders];
  BOOL v40 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v39, "count"));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v41 = v39;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v61;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v61 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void **)(*((void *)&v60 + 1) + 8 * v45);
        objc_opt_class();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v48 = @"date";
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(), char v49 = objc_opt_isKindOfClass(), v48 = @"location", (v49 & 1) != 0))
        {
LABEL_35:
          v50 = v48;
          if (v50)
          {
            id v51 = v50;
            [v40 addObject:v50];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v52 = [v46 situation];
            v48 = @"routineMorning";
            switch(v52)
            {
              case 0:
                goto LABEL_35;
              case 1:
                v48 = @"routineEvening";
                goto LABEL_35;
              case 2:
                v48 = @"routineHome";
                goto LABEL_35;
              case 3:
                v48 = @"routineWork";
                goto LABEL_35;
              case 4:
                v48 = @"routineSchool";
                goto LABEL_35;
              case 5:
                v48 = @"routineGym";
                goto LABEL_35;
              case 6:
                v48 = @"routineCommute";
                goto LABEL_35;
              case 7:
                v48 = @"routineHeadphones";
                goto LABEL_35;
              case 8:
                v48 = @"routineWorkout";
                goto LABEL_35;
              case 9:
                v48 = @"routineActivity";
                goto LABEL_35;
              default:
                break;
            }
          }
        }
        ++v45;
      }
      while (v43 != v45);
      uint64_t v53 = [v41 countByEnumeratingWithState:&v60 objects:v64 count:16];
      uint64_t v43 = v53;
    }
    while (v53);
  }

  [v59 setObject:v40 forKey:@"relevanceProvider"];
  BOOL v17 = (void *)[v59 copy];

LABEL_52:
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REDonatedAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)REDonatedAction;
  uint64_t v5 = [(REDonatedAction *)&v29 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    id v8 = [[REIdentifier alloc] initWithDataSource:v6 section:&stru_26CFA57D0 identifier:v7];
    donationIdentifier = v5->_donationIdentifier;
    v5->_donationIdentifier = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSaveDate"];
    localSaveDate = v5->_localSaveDate;
    v5->_localSaveDate = (NSDate *)v12;

    v5->_localDonation = [v4 decodeBoolForKey:@"localDonation"];
    id v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"actionTypeIdentifier"];
    actionTypeIdentifier = v5->_actionTypeIdentifier;
    v5->_actionTypeIdentifier = (REDonatedActionIdentifierProviding *)v17;

    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    id v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"simplifiedActionTypeIdentifier"];
    simplifiedActionTypeIdentifier = v5->_simplifiedActionTypeIdentifier;
    v5->_simplifiedActionTypeIdentifier = (REDonatedActionIdentifierProviding *)v22;

    v5->_isIntentBacked = [v4 decodeBoolForKey:@"isIntentBacked"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventLevelIdentifier"];
    eventLevelIdentifier = v5->_eventLevelIdentifier;
    v5->_eventLevelIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appLevelIdentifier"];
    appLevelIdentifier = v5->_appLevelIdentifier;
    v5->_appLevelIdentifier = (NSString *)v26;

    v5->_filteredShortcutType = [v4 decodeIntegerForKey:@"filteredShortcutType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v7 = a3;
  [v7 encodeInteger:type forKey:@"type"];
  uint64_t v5 = [(REDonatedAction *)self bundleIdentifier];
  [v7 encodeObject:v5 forKey:@"bundleIdentifier"];

  uint64_t v6 = [(REDonatedAction *)self identifier];
  [v7 encodeObject:v6 forKey:@"identifier"];

  [v7 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v7 encodeObject:self->_localSaveDate forKey:@"localSaveDate"];
  [v7 encodeBool:self->_localDonation forKey:@"localDonation"];
  [v7 encodeObject:self->_actionTypeIdentifier forKey:@"actionTypeIdentifier"];
  [v7 encodeObject:self->_simplifiedActionTypeIdentifier forKey:@"simplifiedActionTypeIdentifier"];
  [v7 encodeBool:self->_isIntentBacked forKey:@"isIntentBacked"];
  [v7 encodeObject:self->_eventLevelIdentifier forKey:@"eventLevelIdentifier"];
  [v7 encodeObject:self->_appLevelIdentifier forKey:@"appLevelIdentifier"];
  [v7 encodeInteger:self->_filteredShortcutType forKey:@"filteredShortcutType"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 16) = self->_type;
  objc_storeStrong((id *)(v4 + 40), self->_donationIdentifier);
  objc_storeStrong((id *)(v4 + 24), self->_creationDate);
  objc_storeStrong((id *)(v4 + 32), self->_localSaveDate);
  *(unsigned char *)(v4 + 9) = self->_localDonation;
  objc_storeStrong((id *)(v4 + 48), self->_actionTypeIdentifier);
  objc_storeStrong((id *)(v4 + 56), self->_simplifiedActionTypeIdentifier);
  *(unsigned char *)(v4 + 8) = self->_isIntentBacked;
  objc_storeStrong((id *)(v4 + 64), self->_eventLevelIdentifier);
  objc_storeStrong((id *)(v4 + 72), self->_appLevelIdentifier);
  *(void *)(v4 + 80) = self->_filteredShortcutType;
  return (id)v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)localSaveDate
{
  return self->_localSaveDate;
}

- (REIdentifier)donationIdentifier
{
  return self->_donationIdentifier;
}

- (REDonatedActionIdentifierProviding)actionTypeIdentifier
{
  return self->_actionTypeIdentifier;
}

- (REDonatedActionIdentifierProviding)simplifiedActionTypeIdentifier
{
  return self->_simplifiedActionTypeIdentifier;
}

- (BOOL)isLocalDonation
{
  return self->_localDonation;
}

- (NSString)eventLevelIdentifier
{
  return self->_eventLevelIdentifier;
}

- (NSString)appLevelIdentifier
{
  return self->_appLevelIdentifier;
}

- (unint64_t)filteredShortcutType
{
  return self->_filteredShortcutType;
}

- (_DKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (unint64_t)relevanceProvidersHash
{
  return self->_relevanceProvidersHash;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (NSString)intentTypeName
{
  return self->_intentTypeName;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_intentTypeName, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_appLevelIdentifier, 0);
  objc_storeStrong((id *)&self->_eventLevelIdentifier, 0);
  objc_storeStrong((id *)&self->_simplifiedActionTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_actionTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_donationIdentifier, 0);
  objc_storeStrong((id *)&self->_localSaveDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)_loadDuetEvent:(id)a3
{
  id v4 = a3;
  if (_loadDuetEvent__onceToken != -1) {
    dispatch_once(&_loadDuetEvent__onceToken, &__block_literal_global_87);
  }
  uint64_t v5 = [(id)_loadDuetEvent__QueuePool nextAvailableQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_2;
  block[3] = &unk_2644BC570;
  block[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(v7, block);
}

uint64_t __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke()
{
  v0 = [[REDispatchQueuePool alloc] initWithQueueCount:2 prefix:@"com.apple.RelevanceEngine.REDonatedActionEventLoader"];
  uint64_t v1 = _loadDuetEvent__QueuePool;
  _loadDuetEvent__QueuePool = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_2(uint64_t a1)
{
  v2 = +[RESingleton sharedInstance];
  unint64_t v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [v2 queryForDuetEventWithIdentifier:v3];

  uint64_t v5 = +[RESingleton sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_3;
  v7[3] = &unk_2644BE5A8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v5 executeQuery:v4 responseQueue:v6 completion:v7];
}

void __50__REDonatedAction_LoadSiriAction___loadDuetEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!CoreDuetLibraryCore_2()) {
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  id v4 = (void *)get_DKEventClass_softClass_0;
  uint64_t v11 = get_DKEventClass_softClass_0;
  if (!get_DKEventClass_softClass_0)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __get_DKEventClass_block_invoke_0;
    v7[3] = &unk_2644BC768;
    void v7[4] = &v8;
    __get_DKEventClass_block_invoke_0((uint64_t)v7);
    id v4 = (void *)v9[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else {
LABEL_6:
  }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  v6();
}

- (void)loadUserActivity:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (REProcessIsRelevanced())
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF488], @"%s is not allowed from relevanced!", v5, v6, v7, v8, v9, v10, (uint64_t)"-[REDonatedAction(LoadSiriAction) loadUserActivity:]");
      goto LABEL_10;
    }
    if (!CoreDuetLibraryCore_2())
    {
      uint64_t v11 = RELogForDomain(15);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[REDonatedAction(LoadSiriAction) loadUserActivity:]();
      }

      goto LABEL_10;
    }
    if ([(REDonatedAction *)self type])
    {
LABEL_10:
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_11;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke;
    v12[3] = &unk_2644C0AD8;
    v12[4] = self;
    id v13 = v4;
    [(REDonatedAction *)self _loadDuetEvent:v12];
  }
LABEL_11:
}

void __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [get_DKApplicationActivityMetadataKeyClass_0() userActivityRequiredString];
    uint64_t v5 = [get_DKApplicationActivityMetadataKeyClass_0() title];
    uint64_t v6 = [v3 metadata];
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];

    uint64_t v8 = [v3 metadata];
    uint64_t v9 = [v8 objectForKeyedSubscript:v5];

    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F018D0]) _initWithUserActivityStrings:v7 secondaryString:v9 optionalData:0];
    if (!v10)
    {
      uint64_t v11 = RELogForDomain(15);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_2();
      }
    }
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [v3 interaction];
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v10);
  }
  else
  {
    id v14 = RELogForDomain(15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)loadIntent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (REProcessIsRelevanced())
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF488], @"%s is not allowed from relevanced!", v5, v6, v7, v8, v9, v10, (uint64_t)"-[REDonatedAction(LoadSiriAction) loadIntent:]");
      goto LABEL_10;
    }
    if (!CoreDuetLibraryCore_2())
    {
      uint64_t v11 = RELogForDomain(15);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[REDonatedAction(LoadSiriAction) loadUserActivity:]();
      }

      goto LABEL_10;
    }
    if ([(REDonatedAction *)self type] != 1)
    {
LABEL_10:
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_11;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke;
    v12[3] = &unk_2644C0AD8;
    v12[4] = self;
    id v13 = v4;
    [(REDonatedAction *)self _loadDuetEvent:v12];
  }
LABEL_11:
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v11 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2050000000;
    uint64_t v12 = (void *)get_DKIntentMetadataKeyClass_softClass_1;
    uint64_t v32 = get_DKIntentMetadataKeyClass_softClass_1;
    if (!get_DKIntentMetadataKeyClass_softClass_1)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __get_DKIntentMetadataKeyClass_block_invoke_1;
      v28[3] = &unk_2644BC768;
      v28[4] = &v29;
      __get_DKIntentMetadataKeyClass_block_invoke_1((uint64_t)v28, v4, v5, v6, v7, v8, v9, v10, v25);
      uint64_t v12 = (void *)v30[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v29, 8);
    id v14 = [v13 intentClass];
    uint64_t v15 = [v3 metadata];
    id v16 = [v15 objectForKeyedSubscript:v14];

    uint64_t v17 = +[RESiriActionsDonationsWhitelist sharedInstance];
    int v18 = [v17 intentIsWhitelistedForBundleID:v11 andTypeName:v16];

    if (v18)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2;
      v26[3] = &unk_2644C0B00;
      v19 = *(void **)(a1 + 40);
      v26[4] = *(void *)(a1 + 32);
      id v27 = v19;
      [v3 fetchInteractionWithPopulatedKeyImage:v26];
    }
    else
    {
      id v21 = [v3 interaction];
      if (!v21)
      {
        uint64_t v22 = RELogForDomain(15);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_2((id *)(a1 + 32));
        }
      }
      uint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = [v21 intent];
      (*(void (**)(uint64_t, void *, void *))(v23 + 16))(v23, v21, v24);
    }
  }
  else
  {
    uint64_t v20 = RELogForDomain(15);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_1(a1);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = RELogForDomain(15);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2_cold_1();
    }
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [v3 intent];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v3, v6);
}

- (void)loadRelevantShortcut:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (REProcessIsRelevanced())
    {
      RERaiseInternalException((void *)*MEMORY[0x263EFF488], @"%s is not allowed from relevanced!", v5, v6, v7, v8, v9, v10, (uint64_t)"-[REDonatedAction(LoadSiriAction) loadRelevantShortcut:]");
LABEL_6:
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
      goto LABEL_7;
    }
    if ([(REDonatedAction *)self type] != 2) {
      goto LABEL_6;
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke;
    v11[3] = &unk_2644C0AD8;
    v11[4] = self;
    id v12 = v4;
    [(REDonatedAction *)self _loadDuetEvent:v11];
  }
LABEL_7:
}

void __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 relevantShortcut];
    if (!v5)
    {
      uint64_t v6 = RELogForDomain(15);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_2();
      }
    }
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [v4 interaction];
    (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v5);
  }
  else
  {
    uint64_t v9 = RELogForDomain(15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (void)supportedActivityType:forBundleID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_ERROR, "Could not make bundle for %@ - %@", v1, 0x16u);
}

- (void)initWithEvent:filtered:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEBUG, "Unsupported stream type: %@ (event: %@)", v1, 0x16u);
}

void __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  [(id)OUTLINED_FUNCTION_3_1(v1) bundleIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5_0() identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_7(&dword_21E6E6000, v3, v4, "Unable to load user activity (event) with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);
}

void __52__REDonatedAction_LoadSiriAction__loadUserActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_6();
  [(id)OUTLINED_FUNCTION_3_1(v1) bundleIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5_0() identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_7(&dword_21E6E6000, v3, v4, "Unable to load user activity with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [*v1 identifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0(&dword_21E6E6000, v4, v5, "Unable to load interaction event with bundle ID: %@ (%@)", v6, v7, v8, v9, v10);
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_cold_2(id *a1)
{
  uint64_t v2 = [*a1 bundleIdentifier];
  uint64_t v3 = [*a1 identifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0(&dword_21E6E6000, v4, v5, "Unable to load interaction with bundle ID: %@ (%@)", v6, v7, v8, v9, v10);
}

void __46__REDonatedAction_LoadSiriAction__loadIntent___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  [(id)OUTLINED_FUNCTION_3_1(v1) bundleIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5_0() identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_7(&dword_21E6E6000, v3, v4, "Unable to load interaction with image with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);
}

void __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  [(id)OUTLINED_FUNCTION_3_1(v1) bundleIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5_0() identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_7(&dword_21E6E6000, v3, v4, "Unable to load relevant shortcut event with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);
}

void __56__REDonatedAction_LoadSiriAction__loadRelevantShortcut___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_6();
  [(id)OUTLINED_FUNCTION_3_1(v1) bundleIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_5_0() identifier];
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_7(&dword_21E6E6000, v3, v4, "Unable to load relevant shortcut with bundle ID: %@ (%@)", v5, v6, v7, v8, v9);
}

@end