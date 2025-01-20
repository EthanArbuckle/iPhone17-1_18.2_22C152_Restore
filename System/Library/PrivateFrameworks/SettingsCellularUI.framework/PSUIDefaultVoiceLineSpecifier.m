@interface PSUIDefaultVoiceLineSpecifier
- (BOOL)isSubcontrollerNeeded;
- (CTCellularPlanManager)planManager;
- (NSArray)cachedPlanItems;
- (NSArray)cachedSubscriptionContexts;
- (PSSimStatusCache)simStatusCache;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUIDefaultVoiceLineSpecifier)initWithPlanManagerCache:(id)a3 planManager:(id)a4 simStatusCache:(id)a5;
- (id)defaultVoiceLine:(id)a3;
- (id)getLogger;
- (id)initSpecifier;
- (id)planItemForListItem:(id)a3;
- (id)subscriptionContextForListItem:(id)a3;
- (void)setCachedPlanItems:(id)a3;
- (void)setCachedSubscriptionContexts:(id)a3;
- (void)setDefaultVoiceLine:(id)a3 specifier:(id)a4;
- (void)setPlanManager:(id)a3;
- (void)setPlanManagerCache:(id)a3;
- (void)setSimStatusCache:(id)a3;
- (void)updateCachedState;
@end

@implementation PSUIDefaultVoiceLineSpecifier

- (id)initSpecifier
{
  v3 = +[PSUICellularPlanManagerCache sharedInstance];
  v4 = [MEMORY[0x263F31978] sharedManager];
  v5 = [MEMORY[0x263F67EF0] sharedInstance];
  v6 = [(PSUIDefaultVoiceLineSpecifier *)self initWithPlanManagerCache:v3 planManager:v4 simStatusCache:v5];

  return v6;
}

- (PSUIDefaultVoiceLineSpecifier)initWithPlanManagerCache:(id)a3 planManager:(id)a4 simStatusCache:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"DEFAULT_VOICE_LINE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  uint64_t v13 = objc_opt_class();
  v17.receiver = self;
  v17.super_class = (Class)PSUIDefaultVoiceLineSpecifier;
  v14 = [(PSUIDefaultVoiceLineSpecifier *)&v17 initWithName:v12 target:self set:sel_setDefaultVoiceLine_specifier_ get:sel_defaultVoiceLine_ detail:v13 cell:2 edit:0];

  if (v14)
  {
    [(PSUIDefaultVoiceLineSpecifier *)v14 setIdentifier:@"VOICE_LINE_SETTINGS"];
    objc_storeStrong((id *)&v14->_planManagerCache, a3);
    objc_storeStrong((id *)&v14->_planManager, a4);
    objc_storeStrong((id *)&v14->_simStatusCache, a5);
    [(PSUIDefaultVoiceLineSpecifier *)v14 updateCachedState];
  }

  return v14;
}

- (void)updateCachedState
{
  v3 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planItems];
  cachedPlanItems = self->_cachedPlanItems;
  self->_cachedPlanItems = v3;

  v5 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  cachedSubscriptionContexts = self->_cachedSubscriptionContexts;
  self->_cachedSubscriptionContexts = v5;

  id v22 = (id)objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v21 = self;
  id v9 = self->_cachedPlanItems;
  if ([(NSArray *)v9 count])
  {
    unint64_t v10 = 0;
    do
    {
      v11 = [(NSArray *)v9 objectAtIndexedSubscript:v10];
      if ([v11 isSelected])
      {
        v12 = NSString;
        uint64_t v13 = [v11 userLabel];
        v14 = [v13 label];
        v15 = [v12 stringWithFormat:@"%@", v14];
        [v22 addObject:v15];

        id v16 = NSString;
        objc_super v17 = [v11 userLabel];
        v18 = [v17 label];
        v19 = [v16 stringWithFormat:@"%@", v18];
        [v7 addObject:v19];

        v20 = [NSNumber numberWithInteger:v10];
        [v8 addObject:v20];
      }
      ++v10;
    }
    while ([(NSArray *)v9 count] > v10);
  }
  [(PSUIDefaultVoiceLineSpecifier *)v21 setValues:v8 titles:v22 shortTitles:v7];
}

- (BOOL)isSubcontrollerNeeded
{
  return [(NSArray *)self->_cachedPlanItems count] != 0;
}

- (id)defaultVoiceLine:(id)a3
{
  if ([(NSArray *)self->_cachedPlanItems count])
  {
    uint64_t v4 = 0;
    while (1)
    {
      v5 = [(NSArray *)self->_cachedPlanItems objectAtIndexedSubscript:v4];
      v6 = [(PSUICellularPlanManagerCache *)self->_planManagerCache subscriptionContextForPlanItem:v5 cachedSubscriptionContexts:self->_cachedSubscriptionContexts];
      uint64_t v7 = [v6 userDefaultVoice];
      if (v7)
      {
        v8 = (void *)v7;
        id v9 = [v6 userDefaultVoice];
        int v10 = [v9 BOOLValue];

        if (v10) {
          break;
        }
      }

      if ([(NSArray *)self->_cachedPlanItems count] <= ++v4) {
        goto LABEL_6;
      }
    }
    v11 = [NSNumber numberWithInteger:v4];
  }
  else
  {
LABEL_6:
    v11 = 0;
  }
  return v11;
}

- (void)setDefaultVoiceLine:(id)a3 specifier:(id)a4
{
  v5 = -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", [a3 integerValue]);
  v6 = [(PSUICellularPlanManagerCache *)self->_planManagerCache subscriptionContextForPlanItem:v5 cachedSubscriptionContexts:self->_cachedSubscriptionContexts];
  uint64_t v7 = [v6 userDefaultVoice];
  if (!v7
    || (v8 = (void *)v7,
        [v6 userDefaultVoice],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 BOOLValue],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    planManager = self->_planManager;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__PSUIDefaultVoiceLineSpecifier_setDefaultVoiceLine_specifier___block_invoke;
    v14[3] = &unk_2645E0C48;
    v14[4] = self;
    id v15 = v5;
    dispatch_semaphore_t v16 = v11;
    uint64_t v13 = v11;
    [(CTCellularPlanManager *)planManager didSelectPlanForDefaultVoice:v15 completion:v14];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __63__PSUIDefaultVoiceLineSpecifier_setDefaultVoiceLine_specifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) getLogger];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138412290;
      uint64_t v14 = v8;
      id v9 = "set default to: %@";
      char v10 = v6;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
    }
  }
  else if (v7)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 138412546;
    uint64_t v14 = v12;
    __int16 v15 = 2112;
    id v16 = v5;
    id v9 = "failed to set default to: %@, error: %@";
    char v10 = v6;
    uint32_t v11 = 22;
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (id)planItemForListItem:(id)a3
{
  id v4 = a3;
  if ([v4 cellType] != 3) {
    goto LABEL_3;
  }
  id v5 = [v4 values];
  v6 = [v5 firstObject];
  BOOL v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    cachedPlanItems = self->_cachedPlanItems;
    uint32_t v11 = [v4 values];
    uint64_t v12 = [v11 firstObject];
    id v9 = -[NSArray objectAtIndexedSubscript:](cachedPlanItems, "objectAtIndexedSubscript:", [v12 integerValue]);
  }
  else
  {
LABEL_3:
    id v9 = 0;
  }

  return v9;
}

- (id)subscriptionContextForListItem:(id)a3
{
  id v4 = [(PSUIDefaultVoiceLineSpecifier *)self planItemForListItem:a3];
  id v5 = [(PSUICellularPlanManagerCache *)self->_planManagerCache subscriptionContextForPlanItem:v4 cachedSubscriptionContexts:self->_cachedSubscriptionContexts];

  return v5;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"DefaultVoiceLine"];
}

- (NSArray)cachedPlanItems
{
  return self->_cachedPlanItems;
}

- (void)setCachedPlanItems:(id)a3
{
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
}

- (CTCellularPlanManager)planManager
{
  return self->_planManager;
}

- (void)setPlanManager:(id)a3
{
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
}

- (NSArray)cachedSubscriptionContexts
{
  return self->_cachedSubscriptionContexts;
}

- (void)setCachedSubscriptionContexts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSubscriptionContexts, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_planManager, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cachedPlanItems, 0);
}

@end