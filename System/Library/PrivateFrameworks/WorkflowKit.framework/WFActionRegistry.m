@interface WFActionRegistry
+ (id)sharedRegistry;
+ (id)supportedContentItemClassesForContentSelection;
+ (id)toolKitRegistry;
- (NSArray)actionProvidersForFilling;
- (NSArray)actionProvidersForLoading;
- (NSDictionary)actionsByIdentifier;
- (NSMapTable)actionsByActionProvider;
- (NSSet)actions;
- (NSSet)identifiersOfActionsDisabledOnWatch;
- (NSString)description;
- (OS_dispatch_queue)cacheUpdateAndFillQueue;
- (OS_dispatch_queue)stateAccessQueue;
- (WFActionRegistry)initWithClient:(unint64_t)a3;
- (id)actionsForAppWithIdentifier:(id)a3;
- (id)createActionForSelectingContentOfType:(Class)a3 serializedParameters:(id)a4;
- (id)createActionWithDonation:(id)a3;
- (id)createActionWithIdentifier:(id)a3 serializedParameters:(id)a4;
- (id)createActionWithIdentifier:(id)a3 serializedParameters:(id)a4 forceLocalActionsOnly:(BOOL)a5;
- (id)createActionWithShortcut:(id)a3 error:(id *)a4;
- (id)createActionsForSelectingContentOfTypes:(id)a3 serializedParameterArray:(id)a4;
- (id)createActionsWithIdentifiers:(id)a3 serializedParameterArray:(id)a4;
- (id)createActionsWithIdentifiers:(id)a3 serializedParameterArray:(id)a4 forceLocalActionsOnly:(BOOL)a5;
- (id)defaultSerializedParametersForActionSelectingContentOfType:(Class)a3;
- (id)placeholderForActionIdentifier:(id)a3 serializedParameters:(id)a4;
- (id)replacementActionForActionIdentifier:(id)a3 serializedParameters:(id)a4;
- (id)replacementActionForDonatedIntent:(id)a3;
- (id)residentCompatibleActionsForHome:(id)a3;
- (id)residentCompatibleActionsFromActions:(id)a3 inHome:(id)a4;
- (id)suggestionsForHome:(id)a3 includingRelatedActions:(BOOL)a4;
- (id)updatedActionForResidentCompatibility:(id)a3 inHome:(id)a4;
- (unint64_t)client;
- (unint64_t)state;
- (void)actionProviderDidChange:(id)a3 updatedActions:(id)a4 removedActions:(id)a5 addedActions:(id)a6;
- (void)addActions:(id)a3 fromActionProvider:(id)a4;
- (void)fill;
- (void)fillActionProviders:(id)a3;
- (void)removeActionsWithIdentifiers:(id)a3 fromActionProvider:(id)a4;
- (void)setActions:(id)a3 forProvider:(id)a4;
- (void)setClient:(unint64_t)a3;
@end

@implementation WFActionRegistry

- (id)createActionWithIdentifier:(id)a3 serializedParameters:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 153, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];
  }
  v16[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  if (v8)
  {
    id v15 = v8;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(WFActionRegistry *)self createActionsWithIdentifiers:v9 serializedParameterArray:v10 forceLocalActionsOnly:0];
  v12 = [v11 firstObject];

  if (v8) {
  return v12;
  }
}

- (id)createActionsWithIdentifiers:(id)a3 serializedParameterArray:(id)a4 forceLocalActionsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  if ([v8 count])
  {
    v9 = getWFActionRegistryLogObject();
    os_signpost_id_t v10 = os_signpost_id_generate(v9);

    v11 = getWFActionRegistryLogObject();
    v12 = v11;
    os_signpost_id_t spid = v10;
    unint64_t v29 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CreateActions", "count=%{signpost.description:attribute}@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__24763;
    v54 = __Block_byref_object_dispose__24764;
    id v55 = 0;
    stateAccessQueue = self->_stateAccessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke;
    block[3] = &unk_1E6555A50;
    block[4] = self;
    block[5] = &v46;
    block[6] = &buf;
    dispatch_sync(stateAccessQueue, block);
    if (*((unsigned char *)v47 + 24))
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_2;
      v41[3] = &unk_1E6550B00;
      id v42 = v30;
      v43 = self;
      p_long long buf = &buf;
      id v15 = objc_msgSend(v8, "if_map:", v41);
    }
    else
    {
      context = (void *)MEMORY[0x1C87CA430]();
      v16 = objc_opt_new();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_186;
      v37[3] = &unk_1E65593D8;
      id v38 = v30;
      v39 = self;
      id v27 = v16;
      id v40 = v27;
      [v8 enumerateObjectsUsingBlock:v37];
      v17 = objc_msgSend(v27, "if_objectsOfClass:", objc_opt_class());
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v18 = [(WFActionRegistry *)self actionProvidersForLoading];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v50 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v34;
LABEL_10:
        uint64_t v21 = 0;
        v22 = v17;
        while (1)
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(v18);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * v21) createActionsForRequests:v22 forceLocalActionsOnly:v5];
          v17 = objc_msgSend(v22, "if_objectsPassingTest:", &__block_literal_global_191_24771);

          if (![v17 count]) {
            break;
          }
          ++v21;
          v22 = v17;
          if (v19 == v21)
          {
            uint64_t v19 = [v18 countByEnumeratingWithState:&v33 objects:v50 count:16];
            if (v19) {
              goto LABEL_10;
            }
            break;
          }
        }
      }

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_3;
      v32[3] = &unk_1E6550B48;
      v32[4] = self;
      id v15 = objc_msgSend(v27, "if_map:", v32);
    }
    v23 = getWFActionRegistryLogObject();
    v24 = v23;
    if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)v31 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v24, OS_SIGNPOST_INTERVAL_END, spid, "CreateActions", "", v31, 2u);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v46, 8);
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (NSArray)actionProvidersForLoading
{
  return self->_actionProvidersForLoading;
}

BOOL __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_2_188(uint64_t a1, void *a2)
{
  v2 = [a2 result];
  BOOL v3 = v2 == 0;

  return v3;
}

id __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3 || (objc_opt_class(), v4 = v3, (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v5 = v3;
    v6 = [v5 result];

    if (v6)
    {
      v4 = [v5 result];
    }
    else
    {
      id v7 = getWFActionRegistryLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [v5 actionIdentifier];
        int v13 = 136315394;
        v14 = "-[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:]_block_invoke_3";
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Action %{public}@ is missing", (uint8_t *)&v13, 0x16u);
      }
      v9 = *(void **)(a1 + 32);
      os_signpost_id_t v10 = [v5 actionIdentifier];
      v11 = [v5 serializedParameters];
      v4 = [v9 placeholderForActionIdentifier:v10 serializedParameters:v11];
    }
  }

  return v4;
}

- (WFActionRegistry)initWithClient:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)WFActionRegistry;
  v4 = [(WFActionRegistry *)&v41 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = +[WFLinkActionProvider sharedProvider];
    v9 = [[WFIntentActionProvider alloc] initWithOptions:a3 == 1];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, v7, v5, v8, v9, 0);
    actionProvidersForLoading = v4->_actionProvidersForLoading;
    v4->_actionProvidersForLoading = (NSArray *)v10;

    long long v34 = (void *)v7;
    long long v35 = (void *)v6;
    long long v36 = (void *)v5;
    v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v5, v6, v7, v9, 0);
    long long v33 = (void *)v8;
    [v12 addObject:v8];
    objc_storeStrong((id *)&v4->_actionProvidersForFilling, v12);
    int v13 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v14 = v4->_actionProvidersForFilling;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          [v19 setDelegate:v4];
          [v19 setStringLocalizer:v13];
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v16);
    }

    v4->_state = 0;
    v4->_client = a3;
    uint64_t v20 = objc_opt_new();
    actionsByIdentifier = v4->_actionsByIdentifier;
    v4->_actionsByIdentifier = (NSDictionary *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28E10] mapTableWithStrongToStrongObjects];
    actionsByActionProvider = v4->_actionsByActionProvider;
    v4->_actionsByActionProvider = (NSMapTable *)v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.shortcuts.WFActionRegistry.stateAccessQueue", v24);
    stateAccessQueue = v4->_stateAccessQueue;
    v4->_stateAccessQueue = (OS_dispatch_queue *)v25;

    id v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v29 = dispatch_queue_create("com.apple.shortcuts.WFActionRegistry.cacheUpdateAndFillQueue", v28);
    cacheUpdateAndFillQueue = v4->_cacheUpdateAndFillQueue;
    v4->_cacheUpdateAndFillQueue = (OS_dispatch_queue *)v29;

    v31 = v4;
  }

  return v4;
}

void __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 8) == 2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 56));
}

void __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_186(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v6 = [*(id *)(a1 + 40) replacementActionForActionIdentifier:v9 serializedParameters:v5];
  uint64_t v7 = *(void **)(a1 + 48);
  if (v6)
  {
    [v7 addObject:v6];
  }
  else
  {
    uint64_t v8 = [[WFActionRequest alloc] initWithActionIdentifier:v9 serializedParameters:v5];
    [v7 addObject:v8];
  }
}

- (id)replacementActionForActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v6 = a4;
  int v7 = [a3 isEqualToString:@"is.workflow.actions.sirikit.donation.handle"];
  uint64_t v8 = 0;
  if (v6 && v7)
  {
    uint64_t v9 = WFExtractDonatedIntentFromSerializedParameters(v6);
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      v11 = [(WFActionRegistry *)self replacementActionForDonatedIntent:v9];
      uint64_t v12 = [v11 serializedParametersForDonatedIntent:v10 allowDroppingUnconfigurableValues:0];
      int v13 = (void *)v12;
      uint64_t v8 = 0;
      if (v11 && v12) {
        uint64_t v8 = (void *)[v11 copyWithSerializedParameters:v12];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

void __34__WFActionRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithClient:0];
  v2 = (void *)sharedRegistry_sharedRegistry_24802;
  sharedRegistry_sharedRegistry_24802 = v1;
}

+ (id)sharedRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__WFActionRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken_24801 != -1) {
    dispatch_once(&sharedRegistry_onceToken_24801, block);
  }
  v2 = (void *)sharedRegistry_sharedRegistry_24802;
  return v2;
}

- (id)createActionWithShortcut:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = [v6 intent];
  if (v7)
  {
    uint64_t v8 = [(WFActionRegistry *)self replacementActionForDonatedIntent:v7];
    uint64_t v9 = v8;
    if (v8
      && ([v8 serializedParametersForDonatedIntent:v7 allowDroppingUnconfigurableValues:1],
          (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v11 = (void *)v10;
      uint64_t v12 = (void *)[v9 copyWithSerializedParameters:v10];
      int v13 = [v6 intent];
      v14 = [v13 _title];
      id v15 = v12;
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v16 = v15;
        }
        else {
          uint64_t v16 = 0;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      id v18 = v16;

      [v18 setOverrideLocalizedName:v14];
    }
    else
    {
      id v15 = +[WFHandleDonatedIntentAction intentActionWithShortcut:v6 forceExecutionOnPhone:0 groupIdentifier:0 error:a4];
    }
  }
  else
  {
    uint64_t v17 = [v6 userActivity];

    if (v17)
    {
      id v15 = +[WFOpenUserActivityAction userActivityActionWithShortcut:v6 launchOrigin:0 error:a4];
    }
    else
    {
      id v15 = 0;
    }
  }

  return v15;
}

- (id)replacementActionForDonatedIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F304E0]) initWithIntent:v4];
  id v6 = [MEMORY[0x1E4F302D0] sharedResolver];
  int v7 = [v6 resolvedIntentMatchingDescriptor:v5];

  uint64_t v8 = [v7 displayableBundleIdentifier];
  if (!v8)
  {
    uint64_t v16 = 0;
    goto LABEL_35;
  }
  id v9 = v4;
  id v10 = v8;
  id v11 = v9;
  if (!v11) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v17 = v12;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v15 = @"com.apple.facetime.facetime";
        goto LABEL_15;
      }
      id v19 = v17;
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();

      if (v20)
      {
        if ([v10 isEqualToString:@"com.apple.Music"])
        {
          id v15 = @"is.workflow.actions.playmusic";
        }
        else if ([v10 isEqualToString:@"com.apple.podcasts"])
        {
          id v15 = @"is.workflow.actions.playpodcast";
        }
        else
        {
          id v15 = 0;
        }
        goto LABEL_15;
      }
LABEL_14:
      id v15 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v13 = [v11 preferredCallProvider];
  v14 = @"com.apple.mobilephone.call";
  if (v13 == 2) {
    v14 = @"com.apple.facetime.facetime";
  }
  id v15 = v14;

LABEL_15:
  if (!v15)
  {
    uint64_t v21 = [v11 typeName];
    uint64_t v22 = [&unk_1F2317D00 objectForKey:v21];

    [v11 typeName];
    v23 = v5;
    id v24 = v10;
    v26 = dispatch_queue_t v25 = self;
    if (v22) {
      id v27 = &unk_1F2317D00;
    }
    else {
      id v27 = &unk_1F2317D28;
    }
    id v15 = [v27 objectForKey:v26];

    self = v25;
    id v10 = v24;
    uint64_t v5 = v23;
  }
  v28 = [v7 extensionBundleIdentifier];
  dispatch_queue_t v29 = v28;
  if (v28)
  {
    id v30 = v28;
  }
  else
  {
    id v30 = [v7 bundleIdentifier];
  }
  v31 = v30;

  if (!v15 && v31)
  {
    if ([v11 _type] != 2) {
      goto LABEL_31;
    }
    [v11 _className];
    long long v33 = v32 = self;
    id v15 = [NSString stringWithFormat:@"%@.%@", v31, v33];

    self = v32;
  }
  if (v15)
  {
    long long v34 = [(WFActionRegistry *)self createActionWithIdentifier:v15 serializedParameters:0];
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v16 = [v34 actionForAppIdentifier:v10];
    }
    else
    {
      uint64_t v16 = 0;
    }

    goto LABEL_34;
  }
LABEL_31:
  uint64_t v16 = 0;
LABEL_34:

LABEL_35:
  return v16;
}

- (id)createActionWithDonation:(id)a3
{
  id v4 = [a3 shortcut];
  uint64_t v5 = [(WFActionRegistry *)self createActionWithShortcut:v4 error:0];

  return v5;
}

- (NSSet)identifiersOfActionsDisabledOnWatch
{
  if ([(WFActionRegistry *)self state] == 2)
  {
    id v3 = [(WFActionRegistry *)self actions];
    objc_msgSend(v3, "if_compactMap:", &__block_literal_global_23493);
  }
  else
  {
    id v3 = objc_opt_new();
    [v3 identifiersOfActionsDisabledOnWatch];
  id v4 = };

  return (NSSet *)v4;
}

id __72__WFActionRegistry_DisabledOnWatch__identifiersOfActionsDisabledOnWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 disabledOnPlatforms];
  int v4 = [v3 containsObject:@"Watch"];

  if (v4)
  {
    uint64_t v5 = [v2 identifier];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByActionProvider, 0);
  objc_storeStrong((id *)&self->_actionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_actionProvidersForLoading, 0);
  objc_storeStrong((id *)&self->_actionProvidersForFilling, 0);
  objc_storeStrong((id *)&self->_cacheUpdateAndFillQueue, 0);
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
}

- (NSMapTable)actionsByActionProvider
{
  return self->_actionsByActionProvider;
}

- (NSDictionary)actionsByIdentifier
{
  return self->_actionsByIdentifier;
}

- (NSArray)actionProvidersForFilling
{
  return self->_actionProvidersForFilling;
}

- (OS_dispatch_queue)cacheUpdateAndFillQueue
{
  return self->_cacheUpdateAndFillQueue;
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (void)setClient:(unint64_t)a3
{
  self->_client = a3;
}

- (unint64_t)client
{
  return self->_client;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFActionRegistry;
  int v4 = [(WFActionRegistry *)&v8 description];
  uint64_t v5 = [(WFActionRegistry *)self actionsByIdentifier];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (void)actionProviderDidChange:(id)a3 updatedActions:(id)a4 removedActions:(id)a5 addedActions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke;
  block[3] = &unk_1E65535A0;
  block[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v11;
  id v18 = v12;
  dispatch_async(stateAccessQueue, block);
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 8) == 2)
  {
    if ([*(id *)(a1 + 40) count] || objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      id v2 = *(void **)(a1 + 32);
      id v3 = [*(id *)(a1 + 40) setByAddingObjectsFromSet:*(void *)(a1 + 48)];
      [v2 removeActionsWithIdentifiers:v3 fromActionProvider:*(void *)(a1 + 56)];
    }
    int v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_220;
    v8[3] = &unk_1E6558910;
    id v9 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 32);
    id v10 = v5;
    uint64_t v11 = v6;
    id v12 = *(id *)(a1 + 56);
    dispatch_async(v4, v8);

    int v7 = v9;
  }
  else
  {
    int v7 = getWFActionRegistryLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v14 = "-[WFActionRegistry actionProviderDidChange:updatedActions:removedActions:addedActions:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Ignoring action provider change notification because the registry is not yet filled.", buf, 0xCu);
    }
  }
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_220(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [*(id *)(a1 + 32) setByAddingObjectsFromSet:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = [[WFActionRequest alloc] initWithActionIdentifier:*(void *)(*((void *)&v17 + 1) + 8 * v7) serializedParameters:0];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    id v9 = *(void **)(a1 + 56);
    id v10 = [v2 allObjects];
    [v9 createActionsForRequests:v10];

    uint64_t v11 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_223);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = *(NSObject **)(v12 + 24);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_4;
    v14[3] = &unk_1E65556E0;
    v14[4] = v12;
    v14[5] = v11;
    id v15 = *(id *)(a1 + 56);
    dispatch_async(v13, v14);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_2;
    block[3] = &unk_1E6558B28;
    block[4] = *(void *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WFActionRegistryFilledNotification" object:*(void *)(a1 + 32)];
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) addActions:*(void *)(a1 + 40) fromActionProvider:*(void *)(a1 + 48)];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_5;
  block[3] = &unk_1E6558B28;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WFActionRegistryFilledNotification" object:*(void *)(a1 + 32)];
}

uint64_t __87__WFActionRegistry_actionProviderDidChange_updatedActions_removedActions_addedActions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 result];
}

- (void)addActions:(id)a3 fromActionProvider:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateAccessQueue);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 413, @"Invalid parameter not satisfying: %@", @"actions" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  dispatch_queue_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 414, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];

LABEL_3:
  id v9 = [(WFActionRegistry *)self actionsByActionProvider];
  id v10 = [v9 objectForKey:v8];
  uint64_t v11 = (void *)[v10 mutableCopy];
  uint64_t v12 = v11;
  id v30 = v8;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  v14 = v13;

  [v14 unionSet:v7];
  id v15 = [(WFActionRegistry *)self actionsByIdentifier];
  id v16 = (void *)[v15 mutableCopy];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v23 = (void *)MEMORY[0x1C87CA430]();
        id v24 = [v22 identifier];
        [v16 setObject:v22 forKey:v24];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v19);
  }

  dispatch_queue_t v25 = (NSDictionary *)[v16 copy];
  actionsByIdentifier = self->_actionsByIdentifier;
  self->_actionsByIdentifier = v25;

  id v27 = [(WFActionRegistry *)self actionsByActionProvider];
  [v27 setObject:v14 forKey:v30];
}

- (void)removeActionsWithIdentifiers:(id)a3 fromActionProvider:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateAccessQueue);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 387, @"Invalid parameter not satisfying: %@", @"actionIdentifiers" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 388, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];

LABEL_3:
  id v9 = [(WFActionRegistry *)self actionsByActionProvider];
  dispatch_queue_t v29 = v8;
  id v10 = [v9 objectForKey:v8];
  uint64_t v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [(WFActionRegistry *)self actionsByIdentifier];
  id v13 = (void *)[v12 mutableCopy];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v20 = (void *)MEMORY[0x1C87CA430]();
        id v21 = [v13 objectForKeyedSubscript:v19];
        if (v21)
        {
          [v13 removeObjectForKey:v19];
          [v11 removeObject:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v16);
  }

  uint64_t v22 = [v11 count];
  id v23 = [(WFActionRegistry *)self actionsByActionProvider];
  id v24 = v23;
  if (v22) {
    [v23 setObject:v11 forKey:v29];
  }
  else {
    [v23 removeObjectForKey:v29];
  }

  dispatch_queue_t v25 = (NSDictionary *)[v13 copy];
  actionsByIdentifier = self->_actionsByIdentifier;
  self->_actionsByIdentifier = v25;
}

- (void)setActions:(id)a3 forProvider:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateAccessQueue);
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 365, @"Invalid parameter not satisfying: %@", @"provider" object file lineNumber description];
  }
  id v8 = [(WFActionRegistry *)self actionsByActionProvider];
  id v9 = [v8 objectForKey:v7];

  if (v9 != v14)
  {
    char v10 = [v9 isEqualToSet:v14];
    id v11 = v14;
    if ((v10 & 1) == 0)
    {
      if (v9)
      {
        uint64_t v12 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_212);
        [(WFActionRegistry *)self removeActionsWithIdentifiers:v12 fromActionProvider:v7];

        id v11 = v14;
      }
      if (v11) {
        [(WFActionRegistry *)self addActions:v14 fromActionProvider:v7];
      }
    }
  }
}

uint64_t __43__WFActionRegistry_setActions_forProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)fillActionProviders:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_cacheUpdateAndFillQueue);
  uint64_t v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_203_24747);
  uint64_t v6 = (void *)[v5 mutableCopy];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__WFActionRegistry_fillActionProviders___block_invoke_2;
  v15[3] = &unk_1E6550BE0;
  id v7 = v6;
  id v16 = v7;
  [v4 enumerateObjectsUsingBlock:v15];
  stateAccessQueue = self->_stateAccessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__WFActionRegistry_fillActionProviders___block_invoke_205;
  v11[3] = &unk_1E65556E0;
  id v12 = v4;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v4;
  dispatch_async(stateAccessQueue, v11);
}

void __40__WFActionRegistry_fillActionProviders___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = getWFActionRegistryLogObject();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = getWFActionRegistryLogObject();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v18 = 138543362;
    uint64_t v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FillProvider", " enableTelemetry=YES provider=%{public, signpost.telemetry:string1, Name=Provider}@", (uint8_t *)&v18, 0xCu);
  }
  id v12 = [v5 createAllAvailableActions];
  id v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = (id)objc_opt_new();
  }
  uint64_t v15 = v14;

  [*(id *)(a1 + 32) setObject:v15 atIndexedSubscript:a3];
  id v16 = getWFActionRegistryLogObject();
  uint64_t v17 = v16;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v17, OS_SIGNPOST_INTERVAL_END, v7, "FillProvider", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }
}

void __40__WFActionRegistry_fillActionProviders___block_invoke_205(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__WFActionRegistry_fillActionProviders___block_invoke_2_206;
  v5[3] = &unk_1E6550C08;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateObjectsUsingBlock:v5];
}

void __40__WFActionRegistry_fillActionProviders___block_invoke_2_206(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  uint64_t v7 = getWFActionRegistryLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315906;
    id v9 = "-[WFActionRegistry fillActionProviders:]_block_invoke_2";
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Found %lu actions for provider %@ at %lu", (uint8_t *)&v8, 0x2Au);
  }

  [*(id *)(a1 + 40) setActions:v6 forProvider:v5];
}

id __40__WFActionRegistry_fillActionProviders___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v0;
}

- (void)fill
{
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__WFActionRegistry_fill__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(stateAccessQueue, block);
}

void __24__WFActionRegistry_fill__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 8))
  {
    *(void *)(v1 + 8) = 1;
    [MEMORY[0x1E4F5A928] log:*MEMORY[0x1E4F5AB48]];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__WFActionRegistry_fill__block_invoke_2;
    block[3] = &unk_1E6558B28;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __24__WFActionRegistry_fill__block_invoke_2(uint64_t a1)
{
  id v2 = getWFActionRegistryLogObject();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = getWFActionRegistryLogObject();
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Fill", " enableTelemetry=YES ", buf, 2u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 actionProvidersForFilling];
  [v6 fillActionProviders:v7];

  int v8 = getWFActionRegistryLogObject();
  id v9 = v8;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v9, OS_SIGNPOST_INTERVAL_END, v3, "Fill", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(NSObject **)(v10 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__WFActionRegistry_fill__block_invoke_199;
  block[3] = &unk_1E6558B28;
  block[4] = v10;
  dispatch_async(v11, block);
}

void __24__WFActionRegistry_fill__block_invoke_199(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = 2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__WFActionRegistry_fill__block_invoke_2_200;
  block[3] = &unk_1E6558B28;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __24__WFActionRegistry_fill__block_invoke_2_200(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WFActionRegistryFilledNotification" object:*(void *)(a1 + 32)];
}

- (id)actionsForAppWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFActionRegistry *)self actions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__WFActionRegistry_actionsForAppWithIdentifier___block_invoke;
  v9[3] = &unk_1E6550B98;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "if_compactMap:", v9);

  return v7;
}

uint64_t __48__WFActionRegistry_actionsForAppWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 actionForAppIdentifier:*(void *)(a1 + 32)];
}

- (NSSet)actions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__24763;
  id v10 = __Block_byref_object_dispose__24764;
  id v11 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__WFActionRegistry_actions__block_invoke;
  v5[3] = &unk_1E6558960;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateAccessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __27__WFActionRegistry_actions__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) allValues];
  uint64_t v3 = [v2 initWithArray:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)placeholderForActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(WFActionRegistry *)self actionProvidersForLoading];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __72__WFActionRegistry_placeholderForActionIdentifier_serializedParameters___block_invoke;
  v16[3] = &unk_1E6550B70;
  id v17 = v6;
  id v9 = v6;
  id v10 = objc_msgSend(v8, "if_compactMap:", v16);

  if ((unint64_t)[v10 count] >= 2)
  {
    id v11 = getWFActionRegistryLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v19 = "-[WFActionRegistry placeholderForActionIdentifier:serializedParameters:]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Conflicting definitions for missing action", buf, 0xCu);
    }
  }
  __int16 v12 = [WFMissingAction alloc];
  id v13 = [v10 firstObject];
  __int16 v14 = [(WFAction *)v12 initWithIdentifier:v7 definition:v13 serializedParameters:v9];

  return v14;
}

uint64_t __72__WFActionRegistry_placeholderForActionIdentifier_serializedParameters___block_invoke(uint64_t a1, void *a2)
{
  return [a2 definitionForMissingActionWithSerializedParameters:*(void *)(a1 + 32)];
}

id __96__WFActionRegistry_createActionsWithIdentifiers_serializedParameterArray_forceLocalActionsOnly___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a3];
  id v7 = [*(id *)(a1 + 40) replacementActionForActionIdentifier:v5 serializedParameters:v6];
  if (!v7)
  {
    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKey:v5];
    id v7 = (void *)[v8 copyWithSerializedParameters:v6];

    if (!v7)
    {
      id v20 = v5;
      id v9 = [[WFActionRequest alloc] initWithActionIdentifier:v5 serializedParameters:v6];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = [*(id *)(a1 + 40) actionProvidersForLoading];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
LABEL_5:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
          dispatch_queue_t v29 = v9;
          uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          [v15 createActionsForRequests:v16];

          id v17 = [(WFActionRequest *)v9 result];

          if (v17) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v30 count:16];
            if (v12) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v7 = [(WFActionRequest *)v9 result];

        id v5 = v20;
        if (v7) {
          goto LABEL_16;
        }
      }
      else
      {
LABEL_11:

        id v5 = v20;
      }
      int v18 = getWFActionRegistryLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        v26 = "-[WFActionRegistry createActionsWithIdentifiers:serializedParameterArray:forceLocalActionsOnly:]_block_invoke_2";
        __int16 v27 = 2114;
        id v28 = v5;
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_DEFAULT, "%s Action (%{public}@) is missing", buf, 0x16u);
      }

      id v7 = [*(id *)(a1 + 40) placeholderForActionIdentifier:v5 serializedParameters:v6];
    }
  }
LABEL_16:

  return v7;
}

- (id)createActionsWithIdentifiers:(id)a3 serializedParameterArray:(id)a4
{
  return [(WFActionRegistry *)self createActionsWithIdentifiers:a3 serializedParameterArray:a4 forceLocalActionsOnly:0];
}

- (id)createActionWithIdentifier:(id)a3 serializedParameters:(id)a4 forceLocalActionsOnly:(BOOL)a5
{
  BOOL v5 = a5;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFActionRegistry.m", 159, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];
  }
  v18[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  if (v10)
  {
    id v17 = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(WFActionRegistry *)self createActionsWithIdentifiers:v11 serializedParameterArray:v12 forceLocalActionsOnly:v5];
  uint64_t v14 = [v13 firstObject];

  if (v10) {
  return v14;
  }
}

- (unint64_t)state
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__WFActionRegistry_state__block_invoke;
  v5[3] = &unk_1E6558960;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateAccessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__WFActionRegistry_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8);
  return result;
}

+ (id)toolKitRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WFActionRegistry_toolKitRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (toolKitRegistry_onceToken != -1) {
    dispatch_once(&toolKitRegistry_onceToken, block);
  }
  id v2 = (void *)toolKitRegistry_sharedRegistry;
  return v2;
}

void __35__WFActionRegistry_toolKitRegistry__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithClient:1];
  id v2 = (void *)toolKitRegistry_sharedRegistry;
  toolKitRegistry_sharedRegistry = v1;
}

- (id)defaultSerializedParametersForActionSelectingContentOfType:(Class)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = WFActionIdentifierForSelectingContentOfType(a3);
  uint64_t v4 = v3;
  if (v3 && [v3 isEqualToString:@"is.workflow.actions.date"])
  {
    v12[0] = @"WFDateActionMode";
    v12[1] = @"WFDateActionDate";
    v13[0] = @"Specified Date";
    BOOL v5 = [WFVariableString alloc];
    uint64_t v6 = objc_opt_new();
    id v7 = [(WFVariableString *)v5 initWithVariable:v6];

    uint64_t v8 = [[WFVariableStringParameterState alloc] initWithVariableString:v7];
    uint64_t v9 = [(WFVariableStringParameterState *)v8 serializedRepresentation];

    v13[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)createActionsForSelectingContentOfTypes:(id)a3 serializedParameterArray:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (!v8) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFActionRegistry+ContentSelection.m", 63, @"Invalid parameter not satisfying: %@", @"contentItemClasses" object file lineNumber description];

    if (!v9) {
      goto LABEL_5;
    }
  }
  uint64_t v10 = [v7 count];
  if (v10 != [v9 count])
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"WFActionRegistry+ContentSelection.m" lineNumber:64 description:@"Number of content item classes don't match number of serialized parameters passed in."];
  }
LABEL_5:
  uint64_t v11 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_33371);
  uint64_t v12 = [v11 count];
  if (v12 == [v7 count])
  {
    uint64_t v13 = [(WFActionRegistry *)self createActionsWithIdentifiers:v11 serializedParameterArray:v9];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

__CFString *__103__WFActionRegistry_ContentSelection__createActionsForSelectingContentOfTypes_serializedParameterArray___block_invoke(uint64_t a1, void *a2)
{
  return WFActionIdentifierForSelectingContentOfType(a2);
}

- (id)createActionForSelectingContentOfType:(Class)a3 serializedParameters:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v14[0] = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  id v7 = [v5 arrayWithObjects:v14 count:1];
  id v8 = (id)MEMORY[0x1E4F1CC08];
  if (v6) {
    id v8 = v6;
  }
  id v13 = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

  uint64_t v10 = [(WFActionRegistry *)self createActionsForSelectingContentOfTypes:v7 serializedParameterArray:v9];
  uint64_t v11 = [v10 firstObject];

  return v11;
}

+ (id)supportedContentItemClassesForContentSelection
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

- (id)updatedActionForResidentCompatibility:(id)a3 inHome:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 definition];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v5 objectForKey:@"Parameters"];
    uint64_t v8 = objc_msgSend(v7, "if_map:", &__block_literal_global_42752);

    uint64_t v14 = @"Parameters";
    v15[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    uint64_t v10 = [v6 definitionByAddingEntriesInDictionary:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [v4 serializedParameters];
  uint64_t v12 = (void *)[v4 copyWithDefinition:v10 serializedParameters:v11];

  return v12;
}

id __71__WFActionRegistry_Home__updatedActionForResidentCompatibility_inHome___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 objectForKey:@"DisallowedVariableTypes"];
  id v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  uint64_t v7 = v6;

  [v7 addObject:@"Ask"];
  [v7 addObject:@"Clipboard"];
  uint64_t v11 = @"DisallowedVariableTypes";
  v12[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v2 definitionByAddingEntriesInDictionary:v8];

  return v9;
}

- (id)residentCompatibleActionsFromActions:(id)a3 inHome:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__WFActionRegistry_Home__residentCompatibleActionsFromActions_inHome___block_invoke;
  v10[3] = &unk_1E6553958;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a3, "if_compactMap:", v10);

  return v8;
}

id __70__WFActionRegistry_Home__residentCompatibleActionsFromActions_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isResidentCompatible])
  {
    id v4 = [*(id *)(a1 + 32) updatedActionForResidentCompatibility:v3 inHome:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)suggestionsForHome:(id)a3 includingRelatedActions:(BOOL)a4
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFActionRegistry *)self createActionWithIdentifier:@"is.workflow.actions.weather.currentconditions" serializedParameters:0];
  uint64_t v8 = [(WFActionRegistry *)self createActionWithIdentifier:@"is.workflow.actions.conditional" serializedParameters:0];
  uint64_t v9 = [(WFActionRegistry *)self createActionWithIdentifier:@"is.workflow.actions.delay" serializedParameters:0];
  uint64_t v10 = (void *)v9;
  if (a4)
  {
    v21[0] = v7;
    v21[1] = v8;
    v21[2] = v9;
    id v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = v21;
    uint64_t v13 = 3;
  }
  else
  {
    v20[0] = v8;
    v20[1] = v9;
    id v11 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v12 = v20;
    uint64_t v13 = 2;
  }
  uint64_t v14 = [v11 arrayWithObjects:v12 count:v13];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __69__WFActionRegistry_Home__suggestionsForHome_includingRelatedActions___block_invoke;
  v18[3] = &unk_1E6553930;
  v18[4] = self;
  id v19 = v6;
  id v15 = v6;
  uint64_t v16 = objc_msgSend(v14, "if_map:", v18);

  return v16;
}

uint64_t __69__WFActionRegistry_Home__suggestionsForHome_includingRelatedActions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updatedActionForResidentCompatibility:a2 inHome:*(void *)(a1 + 40)];
}

- (id)residentCompatibleActionsForHome:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFActionRegistry *)self actions];
  id v6 = [(WFActionRegistry *)self residentCompatibleActionsFromActions:v5 inHome:v4];

  return v6;
}

@end