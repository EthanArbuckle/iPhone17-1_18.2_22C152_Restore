@interface SBKeyboardFocusVisibilityGraphNavigator
- (id)_ancestorPathForTargetEnvironment:(uint64_t)a3 orTargetPid:(void *)a4 withinEndowmentTree:(void *)a5 root:(void *)a6 visitedLinks:;
- (void)_reverseEnumerateChainContainingSceneIdentityToken:(uint64_t)a3 orSceneFromProcessID:(void *)a4 block:;
- (void)reverseEnumerateChainContainingSceneFromProcessID:(int)a3 block:(id)a4;
- (void)reverseEnumerateChainContainingSceneIdentityToken:(id)a3 block:(id)a4;
@end

@implementation SBKeyboardFocusVisibilityGraphNavigator

- (void)reverseEnumerateChainContainingSceneIdentityToken:(id)a3 block:(id)a4
{
}

- (void)_reverseEnumerateChainContainingSceneIdentityToken:(uint64_t)a3 orSceneFromProcessID:(void *)a4 block:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = a4;
  if (a1)
  {
    id v32 = v7;
    if (v7)
    {
      v9 = NSString;
      v10 = [v7 stringRepresentation];
      v11 = [v9 stringWithFormat:@"%@%@", @"UIScene:", v10];
    }
    else
    {
      v11 = 0;
    }
    v12 = [MEMORY[0x1E4F96378] endowmentTreeForNamespace:*MEMORY[0x1E4F62718]];
    [v12 rootLinks];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [v13 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v33)
    {
      uint64_t v35 = *(void *)v43;
      unsigned int v28 = a3;
      v27 = a1;
      v30 = v12;
      v31 = v11;
      id v29 = v13;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(v13);
          }
          uint64_t v36 = v14;
          v15 = *(void **)(*((void *)&v42 + 1) + 8 * v14);
          v16 = [MEMORY[0x1E4F1CAD0] set];
          v17 = -[SBKeyboardFocusVisibilityGraphNavigator _ancestorPathForTargetEnvironment:orTargetPid:withinEndowmentTree:root:visitedLinks:](a1, v11, a3, v12, v15, v16);

          if (v17)
          {
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            v34 = v17;
            v18 = [v17 reverseObjectEnumerator];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v39;
              while (2)
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v39 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                  v24 = [v23 targetEnvironment];
                  if ([v24 hasPrefix:@"UIScene:"])
                  {
                    v25 = [v24 substringFromIndex:objc_msgSend(@"UIScene:", "length")];
                    unsigned __int8 v37 = 0;
                    v8[2](v8, v25, [v23 targetPid], &v37);
                    int v26 = v37;

                    if (v26)
                    {

                      v12 = v30;
                      v11 = v31;
                      id v13 = v29;
                      goto LABEL_25;
                    }
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v46 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }

            a3 = v28;
            a1 = v27;
            v12 = v30;
            v11 = v31;
            id v13 = v29;
            v17 = v34;
          }

          uint64_t v14 = v36 + 1;
        }
        while (v36 + 1 != v33);
        uint64_t v33 = [v13 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v33);
    }
LABEL_25:

    id v7 = v32;
  }
}

- (void)reverseEnumerateChainContainingSceneFromProcessID:(int)a3 block:(id)a4
{
}

- (id)_ancestorPathForTargetEnvironment:(uint64_t)a3 orTargetPid:(void *)a4 withinEndowmentTree:(void *)a5 root:(void *)a6 visitedLinks:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v14)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"visitedLinks != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBKeyboardFocusVisibilityGraphNavigator _ancestorPathForTargetEnvironment:orTargetPid:withinEndowmentTree:root:visitedLinks:](sel__ancestorPathForTargetEnvironment_orTargetPid_withinEndowmentTree_root_visitedLinks_, (uint64_t)a1, (uint64_t)v31);
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D89FA308);
  }
  if (v11)
  {
    v16 = [v13 targetEnvironment];
    char v17 = [v16 isEqualToString:v11];

    if (v17)
    {
LABEL_5:
      a1 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:
      v18 = v15;
      goto LABEL_25;
    }
  }
  else if (a3)
  {
    uint64_t v19 = [v13 targetEnvironment];
    if ([v19 hasPrefix:@"UIScene:"])
    {
      int v20 = [v13 targetPid];

      if (v20 == a3) {
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  v18 = [v15 setByAddingObject:v13];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v21 = [v12 childrenLinks:v13];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id v32 = v13;
    uint64_t v24 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (([v18 containsObject:v26] & 1) == 0)
        {
          uint64_t v27 = -[SBKeyboardFocusVisibilityGraphNavigator _ancestorPathForTargetEnvironment:orTargetPid:withinEndowmentTree:root:visitedLinks:](a1, v11, a3, v12, v26, v18);
          if (v27)
          {
            unsigned int v28 = (void *)v27;
            id v13 = v32;
            id v37 = v32;
            id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
            a1 = [v29 arrayByAddingObjectsFromArray:v28];

            goto LABEL_24;
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    a1 = 0;
    id v13 = v32;
  }
  else
  {
    a1 = 0;
  }
LABEL_24:

LABEL_25:
  return a1;
}

- (void)_ancestorPathForTargetEnvironment:(uint64_t)a3 orTargetPid:withinEndowmentTree:root:visitedLinks:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"SBKeyboardFocusVisibilityGraphNavigator.m";
  __int16 v16 = 1024;
  int v17 = 55;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end