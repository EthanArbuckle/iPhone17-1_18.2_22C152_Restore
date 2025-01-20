@interface PBFDataFreshnessState
+ (id)new;
- (BOOL)isDataComponentFresh:(id)a3;
- (BOOL)isFresh;
- (NSSet)dataComponents;
- (NSSet)freshComponents;
- (NSSet)freshnessProviders;
- (NSSet)outOfDateComponents;
- (NSString)freshnessDebugDescription;
- (PBFDataFreshnessState)init;
- (PBFDataFreshnessState)initWithFreshnessProvider:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)dumpFreshnessStateToLogCategory:(id)a3 type:(unsigned __int8)a4;
- (void)enumerateComponentEntities:(id)a3;
- (void)setFreshnessProviders:(id)a3;
@end

@implementation PBFDataFreshnessState

- (PBFDataFreshnessState)init
{
  v4 = [NSString stringWithFormat:@"Not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"PBFDataFreshnessState.m";
    __int16 v17 = 1024;
    int v18 = 54;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PBFDataFreshnessState *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)new
{
  v4 = [NSString stringWithFormat:@"Not supported"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"PBFDataFreshnessState.m";
    __int16 v17 = 1024;
    int v18 = 59;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PBFDataFreshnessState)initWithFreshnessProvider:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsset.isa);
  if (!v4)
  {
    int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataFreshnessState initWithFreshnessProvider:]();
    }
LABEL_11:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32B33B0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSSetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataFreshnessState initWithFreshnessProvider:]();
    }
    goto LABEL_11;
  }

  v10.receiver = self;
  v10.super_class = (Class)PBFDataFreshnessState;
  v5 = [(PBFDataFreshnessState *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    freshnessProviders = v5->_freshnessProviders;
    v5->_freshnessProviders = (NSSet *)v6;
  }
  return v5;
}

- (BOOL)isFresh
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(PBFDataFreshnessState *)self freshnessProviders];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) determineRefreshState];
        char v8 = [v7 needsRefresh];

        if (v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)isDataComponentFresh:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PBFDataFreshnessState_isDataComponentFresh___block_invoke;
  v7[3] = &unk_1E6984670;
  id v5 = v4;
  id v8 = v5;
  BOOL v9 = &v10;
  [(PBFDataFreshnessState *)self enumerateComponentEntities:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __46__PBFDataFreshnessState_isDataComponentFresh___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v5 = [v9 component];
  int v6 = [v5 isEqual:*(void *)(a1 + 32)];

  v7 = v9;
  if (v6)
  {
    id v8 = [v9 determineRefreshState];
    if ([v8 needsRefresh])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a3 = 1;
    }

    v7 = v9;
  }
}

- (void)enumerateComponentEntities:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFDataFreshnessState *)self freshnessProviders];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (NSSet)freshComponents
{
  uint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PBFDataFreshnessState_freshComponents__block_invoke;
  v6[3] = &unk_1E6984698;
  id v4 = v3;
  id v7 = v4;
  [(PBFDataFreshnessState *)self enumerateComponentEntities:v6];

  return (NSSet *)v4;
}

void __40__PBFDataFreshnessState_freshComponents__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 determineRefreshState];
  if (([v3 needsRefresh] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 component];
    [v4 addObject:v5];
  }
}

- (NSSet)outOfDateComponents
{
  uint64_t v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PBFDataFreshnessState_outOfDateComponents__block_invoke;
  v6[3] = &unk_1E6984698;
  id v4 = v3;
  id v7 = v4;
  [(PBFDataFreshnessState *)self enumerateComponentEntities:v6];

  return (NSSet *)v4;
}

void __44__PBFDataFreshnessState_outOfDateComponents__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 determineRefreshState];
  if ([v3 needsRefresh])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 component];
    [v4 addObject:v5];
  }
}

- (NSString)freshnessDebugDescription
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 1;
  uint64_t v3 = objc_opt_new();
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __50__PBFDataFreshnessState_freshnessDebugDescription__block_invoke;
  v42[3] = &unk_1E69846C0;
  v44 = v45;
  id v29 = v3;
  id v43 = v29;
  [(PBFDataFreshnessState *)self enumerateComponentEntities:v42];
  id v4 = (void *)MEMORY[0x1E4F28E78];
  BOOL v5 = [(PBFDataFreshnessState *)self isFresh];
  id v6 = @"NO.";
  if (v5) {
    id v6 = @"YES!";
  }
  id v7 = [v4 stringWithFormat:@"Is our data up to date? %@\n", v6];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v48[0] = @"PBFDataComponentGallery";
  v48[1] = @"PBFDataComponentDynamicDescriptors";
  v48[2] = @"PBFDataComponentStaticDescriptors";
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v9 = [v29 objectForKeyedSubscript:v8];
        v33 = [v9 sortedArrayUsingComparator:&__block_literal_global_41];

        if (v33)
        {
          uint64_t v10 = [v8 stringByReplacingOccurrencesOfString:@"PBFDataComponent" withString:&stru_1F2A71F00];
          [v7 appendFormat:@"\n%@:", v10];
          v31 = (void *)v10;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v11 = v33;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v47 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v35 != v13) {
                  objc_enumerationMutation(v11);
                }
                __int16 v15 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                uint64_t v16 = [v15 determineRefreshState];
                __int16 v17 = [v15 object];
                int v18 = [v16 needsRefresh];
                uint64_t v19 = [v16 refreshReason];
                v20 = (void *)v19;
                v21 = @"NO";
                if (v18) {
                  v21 = @"YES";
                }
                [v7 appendFormat:@"\n\t'%@':\n\t\tNeeds Update? %@\n\t\tReason: %@", v17, v21, v19];

                v22 = [v15 context];
                v23 = [v22 lastRefreshDate];

                if (v23)
                {
                  v24 = [v15 context];
                  v25 = [v24 lastRefreshDate];
                  [v7 appendFormat:@"\n\t\tLast Update Date: %@", v25];
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v47 count:16];
            }
            while (v12);
          }
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v30);
  }

  _Block_object_dispose(v45, 8);
  return (NSString *)v7;
}

void __50__PBFDataFreshnessState_freshnessDebugDescription__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 determineRefreshState];
  if ([v3 needsRefresh]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v9 component];
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    id v6 = objc_opt_new();
    id v7 = *(void **)(a1 + 32);
    id v8 = [v9 component];
    [v7 setObject:v6 forKey:v8];
  }
  [v6 addObject:v9];
}

uint64_t __50__PBFDataFreshnessState_freshnessDebugDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 determineRefreshState];
  id v6 = [v4 determineRefreshState];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "needsRefresh"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "needsRefresh"));
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

- (void)dumpFreshnessStateToLogCategory:(id)a3 type:(unsigned __int8)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  char v49 = 1;
  id v7 = objc_opt_new();
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __62__PBFDataFreshnessState_dumpFreshnessStateToLogCategory_type___block_invoke;
  void v45[3] = &unk_1E69846C0;
  v47 = v48;
  id v29 = v7;
  id v46 = v29;
  [(PBFDataFreshnessState *)self enumerateComponentEntities:v45];
  id v8 = v6;
  if (os_log_type_enabled(v8, (os_log_type_t)a4))
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    *(_DWORD *)buf = 138543362;
    id v51 = v9;
    _os_log_impl(&dword_1D31CE000, v8, (os_log_type_t)a4, "FRESHNESS REPORT FOR %{public}@", buf, 0xCu);
  }
  uint64_t v10 = v8;
  log = v10;
  if (os_log_type_enabled(v10, (os_log_type_t)a4))
  {
    BOOL v11 = [(PBFDataFreshnessState *)self isFresh];
    *(_DWORD *)buf = 67109120;
    LODWORD(v51) = v11;
    _os_log_impl(&dword_1D31CE000, v10, (os_log_type_t)a4, "Is our data up to date? %{BOOL}u", buf, 8u);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v59[0] = @"PBFDataComponentGallery";
  v59[1] = @"PBFDataComponentDynamicDescriptors";
  v59[2] = @"PBFDataComponentStaticDescriptors";
  obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
  uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v60 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v42;
    *(void *)&long long v12 = 138543362;
    long long v26 = v12;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v14 = objc_msgSend(v29, "objectForKeyedSubscript:", v13, v26);
        v33 = [v14 sortedArrayUsingComparator:&__block_literal_global_69];

        if (v33)
        {
          v31 = [v13 stringByReplacingOccurrencesOfString:@"PBFDataComponent" withString:&stru_1F2A71F00];
          if (os_log_type_enabled(log, (os_log_type_t)a4))
          {
            *(_DWORD *)buf = v26;
            id v51 = v31;
            _os_log_impl(&dword_1D31CE000, log, (os_log_type_t)a4, "\n%{public}@:", buf, 0xCu);
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v34 = v33;
          uint64_t v15 = [v34 countByEnumeratingWithState:&v37 objects:v58 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v38;
            do
            {
              uint64_t v36 = v15;
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v38 != v16) {
                  objc_enumerationMutation(v34);
                }
                int v18 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                uint64_t v19 = [v18 determineRefreshState];
                v20 = log;
                if (os_log_type_enabled(v20, (os_log_type_t)a4))
                {
                  id v21 = [v18 object];
                  int v22 = [v19 needsRefresh];
                  id v23 = [v19 refreshReason];
                  v24 = [v18 context];
                  v25 = [v24 lastRefreshDate];
                  *(_DWORD *)buf = 138413058;
                  id v51 = v21;
                  __int16 v52 = 1024;
                  int v53 = v22;
                  __int16 v54 = 2114;
                  id v55 = v23;
                  __int16 v56 = 2114;
                  v57 = v25;
                  _os_log_impl(&dword_1D31CE000, v20, (os_log_type_t)a4, "\t'%@':\n\t\tNeeds Update? %{BOOL}u\n\t\tReason: %{public}@\n\t\tLast Update Date: %{public}@", buf, 0x26u);
                }
              }
              uint64_t v15 = [v34 countByEnumeratingWithState:&v37 objects:v58 count:16];
            }
            while (v15);
          }
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v60 count:16];
    }
    while (v30);
  }

  _Block_object_dispose(v48, 8);
}

void __62__PBFDataFreshnessState_dumpFreshnessStateToLogCategory_type___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 determineRefreshState];
  if ([v3 needsRefresh]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v9 component];
  id v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    id v6 = objc_opt_new();
    id v7 = *(void **)(a1 + 32);
    id v8 = [v9 component];
    [v7 setObject:v6 forKey:v8];
  }
  [v6 addObject:v9];
}

uint64_t __62__PBFDataFreshnessState_dumpFreshnessStateToLogCategory_type___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 determineRefreshState];
  id v6 = [v4 determineRefreshState];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "needsRefresh"));
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "needsRefresh"));
  uint64_t v9 = [v7 compare:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PBFDataFreshnessState allocWithZone:a3];
  freshnessProviders = self->_freshnessProviders;
  return [(PBFDataFreshnessState *)v4 initWithFreshnessProvider:freshnessProviders];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PBFMutableDataFreshnessState allocWithZone:a3];
  freshnessProviders = self->_freshnessProviders;
  return [(PBFDataFreshnessState *)v4 initWithFreshnessProvider:freshnessProviders];
}

- (NSSet)dataComponents
{
  return self->_dataComponents;
}

- (NSSet)freshnessProviders
{
  return self->_freshnessProviders;
}

- (void)setFreshnessProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataComponents, 0);
  objc_storeStrong((id *)&self->_freshnessProviders, 0);
}

- (void)initWithFreshnessProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end