@interface WFHomeWorkflow
+ (void)setCachedHomes:(id)a3;
- (BOOL)requiresDeviceUnlock;
- (BOOL)requiresDeviceUnlockEnsuringHomesAreLoaded;
- (HFTriggerActionsSetsUISummary)actionSetsSummary;
- (NSArray)shortcutsDictionaryRepresentations;
- (NSArray)summaryIconDescriptors;
- (NSArray)summaryIconNames;
- (NSData)data;
- (NSString)summaryString;
- (NSUUID)homeIdentifier;
- (WFHomeWorkflow)initWithData:(id)a3;
- (WFHomeWorkflow)workflowWithEnvironment:(int64_t)a3 error:(id *)a4;
- (id)actionSetsFromTriggerActionSetsBuilders:(id)a3;
- (id)debugDescription;
- (id)triggerActionSetsBuilders;
- (id)workflowRecordWithEnvironment:(int64_t)a3 error:(id *)a4;
- (void)setActionSetsSummary:(id)a3;
@end

@implementation WFHomeWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetsSummary, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_shortcutsDictionaryRepresentations, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedWorkflow, 0);
  objc_storeStrong((id *)&self->_cachedWorkflowRecord, 0);
}

- (void)setActionSetsSummary:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(WFHomeWorkflow *)self data];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"data length = %lu", objc_msgSend(v4, "length"));

  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [v6 stringWithFormat:@"<%@: %p %@>", v8, self, v5];

  return v9;
}

- (WFHomeWorkflow)workflowWithEnvironment:(int64_t)a3 error:(id *)a4
{
  cachedWorkflow = self->_cachedWorkflow;
  if (!cachedWorkflow)
  {
    -[WFHomeWorkflow workflowRecordWithEnvironment:error:](self, "workflowRecordWithEnvironment:error:");
    v8 = (WFWorkflow *)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      goto LABEL_5;
    }
    v9 = v8;
    v10 = [[WFWorkflow alloc] initWithRecord:v8 reference:0 storageProvider:0 migrateIfNecessary:1 environment:a3 error:a4];
    v11 = self->_cachedWorkflow;
    self->_cachedWorkflow = v10;

    cachedWorkflow = self->_cachedWorkflow;
  }
  v8 = cachedWorkflow;
LABEL_5:
  return (WFHomeWorkflow *)v8;
}

- (id)workflowRecordWithEnvironment:(int64_t)a3 error:(id *)a4
{
  cachedWorkflowRecord = self->_cachedWorkflowRecord;
  if (cachedWorkflowRecord) {
    goto LABEL_4;
  }
  v7 = [WFWorkflowFile alloc];
  v8 = [(WFHomeWorkflow *)self data];
  v9 = [(WFWorkflowFile *)v7 initWithFileData:v8 name:0 error:a4];

  if (v9)
  {
    v10 = [(WFWorkflowFile *)v9 recordRepresentationWithError:a4];
    v11 = self->_cachedWorkflowRecord;
    self->_cachedWorkflowRecord = v10;

    cachedWorkflowRecord = self->_cachedWorkflowRecord;
LABEL_4:
    v12 = cachedWorkflowRecord;
    goto LABEL_5;
  }
  v12 = 0;
LABEL_5:
  return v12;
}

- (id)actionSetsFromTriggerActionSetsBuilders:(id)a3
{
  v3 = objc_msgSend(a3, "if_map:", &__block_literal_global_186_4490);
  v4 = [v3 valueForKeyPath:@"@unionOfArrays.self"];

  return v4;
}

uint64_t __58__WFHomeWorkflow_actionSetsFromTriggerActionSetsBuilders___block_invoke(uint64_t a1, void *a2)
{
  return [a2 createActionSetsForShortcuts];
}

- (id)triggerActionSetsBuilders
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v2 = [(WFHomeWorkflow *)self workflowWithEnvironment:1 error:&v8];
  id v3 = v8;
  if (v2)
  {
    v4 = [v2 actions];
    v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_180);

    if ([v5 count])
    {
      v6 = [v5 if_compactMap:&__block_literal_global_183];
      goto LABEL_7;
    }
  }
  else
  {
    v5 = getWFGeneralLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[WFHomeWorkflow triggerActionSetsBuilders]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from home workflow. %@", buf, 0x16u);
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

id __43__WFHomeWorkflow_triggerActionSetsBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 home];
  if (v3)
  {
    id v4 = objc_alloc(getHFTriggerActionSetsBuilderClass());
    v5 = [v2 actionSets];
    v6 = (void *)[v4 initWithActionSets:v5 inHome:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __43__WFHomeWorkflow_triggerActionSetsBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (HFTriggerActionsSetsUISummary)actionSetsSummary
{
  actionSetsSummary = self->_actionSetsSummary;
  if (!actionSetsSummary)
  {
    id v4 = [(WFHomeWorkflow *)self triggerActionSetsBuilders];
    v5 = [v4 firstObject];
    v6 = [v5 home];

    v7 = [(WFHomeWorkflow *)self actionSetsFromTriggerActionSetsBuilders:v4];
    id v8 = (void *)[objc_alloc(getHFTriggerActionSetsBuilderClass()) initWithActionSets:v7 inHome:v6];
    v9 = [v8 actionSetsSummary];
    v10 = self->_actionSetsSummary;
    self->_actionSetsSummary = v9;

    actionSetsSummary = self->_actionSetsSummary;
  }
  return actionSetsSummary;
}

- (BOOL)requiresDeviceUnlockEnsuringHomesAreLoaded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v4 = getWFHomeLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFHomeWorkflow requiresDeviceUnlockEnsuringHomesAreLoaded]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEBUG, "%s Attempting to load homes", buf, 0xCu);
  }

  v5 = +[WFHomeManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__WFHomeWorkflow_requiresDeviceUnlockEnsuringHomesAreLoaded__block_invoke;
  v9[3] = &unk_1E6558270;
  __int16 v11 = &v12;
  v9[4] = self;
  v6 = v3;
  v10 = v6;
  [v5 ensureHomesAreLoadedWithCompletionHandler:v9];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v7 = *((unsigned char *)v13 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

intptr_t __60__WFHomeWorkflow_requiresDeviceUnlockEnsuringHomesAreLoaded__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = getWFHomeLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    v5 = "-[WFHomeWorkflow requiresDeviceUnlockEnsuringHomesAreLoaded]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEBUG, "%s Homes loaded", (uint8_t *)&v4, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) requiresDeviceUnlock];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)requiresDeviceUnlock
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = [(WFHomeWorkflow *)self triggerActionSetsBuilders];
  int v4 = [(WFHomeWorkflow *)self actionSetsFromTriggerActionSetsBuilders:v3];
  v5 = getWFHomeLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v18 = "-[WFHomeWorkflow requiresDeviceUnlock]";
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Retrieved action sets: %@", buf, 0x16u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  BOOL v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = ((char *)i + 1))
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "requiresDeviceUnlock", (void)v12))
        {
          BOOL v7 = getWFHomeLogObject();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v18 = "-[WFHomeWorkflow requiresDeviceUnlock]";
            __int16 v19 = 2112;
            v20 = v10;
            _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s Action set: %@ requires device unlock", buf, 0x16u);
          }

          LOBYTE(v7) = 1;
          goto LABEL_15;
        }
      }
      BOOL v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v7;
}

- (NSArray)shortcutsDictionaryRepresentations
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  shortcutsDictionaryRepresentations = self->_shortcutsDictionaryRepresentations;
  if (shortcutsDictionaryRepresentations)
  {
    dispatch_semaphore_t v3 = shortcutsDictionaryRepresentations;
    goto LABEL_15;
  }
  id v15 = 0;
  v5 = [(WFHomeWorkflow *)self workflowWithEnvironment:1 error:&v15];
  id v6 = (NSArray *)v15;
  if (v5)
  {
    BOOL v7 = [v5 actions];
    uint64_t v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_173);

    if ([v8 count])
    {
      v9 = [v8 if_flatMap:&__block_literal_global_177_4509];
      v10 = self->_shortcutsDictionaryRepresentations;
      self->_shortcutsDictionaryRepresentations = v9;

      __int16 v11 = getWFHomeLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        long long v12 = self->_shortcutsDictionaryRepresentations;
        *(_DWORD *)buf = 136315650;
        v17 = "-[WFHomeWorkflow shortcutsDictionaryRepresentations]";
        __int16 v18 = 2112;
        __int16 v19 = v12;
        __int16 v20 = 2112;
        uint64_t v21 = self;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s Got dictionary representations: %@ for workflow: %@", buf, 0x20u);
      }

      dispatch_semaphore_t v3 = self->_shortcutsDictionaryRepresentations;
      goto LABEL_14;
    }
    long long v13 = getWFHomeLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[WFHomeWorkflow shortcutsDictionaryRepresentations]";
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Found no home actions", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = getWFHomeLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFHomeWorkflow shortcutsDictionaryRepresentations]";
      __int16 v18 = 2112;
      __int16 v19 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from home workflow. %@", buf, 0x16u);
    }
  }
  dispatch_semaphore_t v3 = 0;
LABEL_14:

LABEL_15:
  return v3;
}

uint64_t __52__WFHomeWorkflow_shortcutsDictionaryRepresentations__block_invoke_174(uint64_t a1, void *a2)
{
  return [a2 shortcutsDictionaryRepresentations];
}

id __52__WFHomeWorkflow_shortcutsDictionaryRepresentations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSUUID)homeIdentifier
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  homeIdentifier = self->_homeIdentifier;
  if (homeIdentifier)
  {
    id v3 = homeIdentifier;
    goto LABEL_12;
  }
  id v14 = 0;
  v5 = [(WFHomeWorkflow *)self workflowWithEnvironment:1 error:&v14];
  id v6 = v14;
  if (v5)
  {
    BOOL v7 = [v5 actions];
    uint64_t v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_4514);

    if ([v8 count])
    {
      v9 = [v8 if_compactMap:&__block_literal_global_170];
      v10 = [v9 firstObject];
      __int16 v11 = (void *)[v10 copy];

      long long v12 = getWFHomeLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = "-[WFHomeWorkflow homeIdentifier]";
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        __int16 v20 = self;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Got home identifier: %@ for workflow: %@", buf, 0x20u);
      }

      id v3 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFHomeWorkflow homeIdentifier]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from home workflow. %@", buf, 0x16u);
    }
  }
  id v3 = 0;
LABEL_11:

LABEL_12:
  return v3;
}

uint64_t __32__WFHomeWorkflow_homeIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 homeIdentifier];
}

id __32__WFHomeWorkflow_homeIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSArray)summaryIconDescriptors
{
  id v2 = [(WFHomeWorkflow *)self actionSetsSummary];
  id v3 = [v2 summaryIconDescriptors];

  return (NSArray *)v3;
}

- (NSArray)summaryIconNames
{
  id v2 = [(WFHomeWorkflow *)self actionSetsSummary];
  id v3 = [v2 summaryIcons];

  return (NSArray *)v3;
}

- (NSString)summaryString
{
  id v2 = [(WFHomeWorkflow *)self actionSetsSummary];
  id v3 = [v2 summaryText];

  return (NSString *)v3;
}

- (WFHomeWorkflow)initWithData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFHomeWorkflow;
  v5 = [(WFHomeWorkflow *)&v11 init];
  if (v5)
  {
    if (!v4)
    {
      id v6 = getWFHomeLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        long long v13 = "-[WFHomeWorkflow initWithData:]";
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s WFHomeWorkflow was initialized with nil data", buf, 0xCu);
      }
    }
    uint64_t v7 = [v4 copy];
    data = v5->_data;
    v5->_data = (NSData *)v7;

    v9 = v5;
  }

  return v5;
}

+ (void)setCachedHomes:(id)a3
{
  id v3 = a3;
  id v4 = +[WFHomeManager sharedManager];
  [v4 _setHomes:v3];
}

@end