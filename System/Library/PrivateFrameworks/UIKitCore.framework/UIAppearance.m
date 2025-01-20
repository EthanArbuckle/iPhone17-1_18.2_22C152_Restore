@interface UIAppearance
@end

@implementation UIAppearance

uint64_t __83___UIAppearance__applyInvocationsTo_window_matchingSelector_onlySystemInvocations___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t result = [a2 countByEnumeratingWithState:&v45 objects:v55 count:16];
  uint64_t v29 = result;
  if (result)
  {
    uint64_t v28 = *(void *)v46;
    uint64_t v31 = a1;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v28) {
          objc_enumerationMutation(a2);
        }
        uint64_t v30 = v6;
        v7 = (void *)[*(id *)(a1 + 32) appearancesAtNode:*(void *)(*((void *)&v45 + 1) + 8 * v6) withObject:*(void *)(a1 + 40)];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v32 = v7;
        uint64_t v34 = [v7 countByEnumeratingWithState:&v41 objects:v54 count:16];
        if (v34)
        {
          uint64_t v33 = *(void *)v42;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v42 != v33) {
                objc_enumerationMutation(v32);
              }
              uint64_t v9 = *(void *)(*((void *)&v41 + 1) + 8 * v8);
              uint64_t v36 = *(void *)(a1 + 48);
              uint64_t v10 = *(void *)(a1 + 72);
              if (v9)
              {
                id v11 = *(id *)(v9 + 16);
                unint64_t v12 = *(void *)(v9 + 24);
              }
              else
              {
                id v11 = 0;
                unint64_t v12 = 0;
              }
              uint64_t v35 = v8;
              if (v10 | v12)
              {
                id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                long long v49 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                uint64_t v14 = [v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
                if (v14)
                {
                  uint64_t v15 = v14;
                  uint64_t v16 = *(void *)v50;
                  do
                  {
                    for (uint64_t i = 0; i != v15; ++i)
                    {
                      if (*(void *)v50 != v16) {
                        objc_enumerationMutation(v11);
                      }
                      v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                      id v19 = +[_UIAppearance _windowsForSource:](_UIAppearance, "_windowsForSource:", [(id)v12 objectForKey:v18]);
                      if ((!v10 || [v18 selector] == v10)
                        && (!v19 || [v19 containsObject:v36]))
                      {
                        [v13 addObject:v18];
                      }
                    }
                    uint64_t v15 = [v11 countByEnumeratingWithState:&v49 objects:v56 count:16];
                  }
                  while (v15);
                }
                id v11 = v13;
                a1 = v31;
              }
              long long v37 = 0u;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              uint64_t v20 = [v11 countByEnumeratingWithState:&v37 objects:v53 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v38;
                do
                {
                  for (uint64_t j = 0; j != v21; ++j)
                  {
                    if (*(void *)v38 != v22) {
                      objc_enumerationMutation(v11);
                    }
                    v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                    int v25 = objc_msgSend(objc_getAssociatedObject(v24, &_MergedGlobals_1088), "BOOLValue");
                    if ((v25 & 1) != 0 || a3)
                    {
                      if (v25) {
                        uint64_t v26 = 56;
                      }
                      else {
                        uint64_t v26 = 64;
                      }
                      [*(id *)(a1 + v26) addObject:v24];
                    }
                  }
                  uint64_t v21 = [v11 countByEnumeratingWithState:&v37 objects:v53 count:16];
                }
                while (v21);
              }
              uint64_t v8 = v35 + 1;
            }
            while (v35 + 1 != v34);
            uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v54 count:16];
          }
          while (v34);
        }
        uint64_t v6 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t result = [a2 countByEnumeratingWithState:&v45 objects:v55 count:16];
      uint64_t v29 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __46___UIAppearance_appearancesAtNode_withObject___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)[*(id *)(a1 + 32) objectForKey:a2];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t result = [v3 _isValidAppearanceForCustomizableObject:*(void *)(a1 + 40)];
    if (result)
    {
      v5 = *(void **)(a1 + 48);
      return [v5 addObject:v3];
    }
  }
  return result;
}

id __36___UIAppearance__recorderForSource___block_invoke()
{
  qword_1EB260D70 = (uint64_t)dispatch_queue_create("com.apple.UIKit.UIAppearance.sharedRecorderAccessQueue", 0);
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  qword_1EB260D68 = (uint64_t)result;
  return result;
}

id __36___UIAppearance__recorderForSource___block_invoke_107(uint64_t a1)
{
  id result = (id)[(id)qword_1EB260D68 objectForKey:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_alloc_init(_UIAppearanceRecorder);
    v3 = (void *)qword_1EB260D68;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    return (id)[v3 setObject:v5 forKey:v4];
  }
  return result;
}

uint64_t __54___UIAppearance__recordersExcludingSource_withWindow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) || (uint64_t result = objc_msgSend(a2, "isEqual:"), (result & 1) == 0))
  {
    uint64_t v6 = (void *)[*(id *)(a1 + 40) _windowsForSource:a2];
    if (!v6 || (uint64_t result = [v6 containsObject:*(void *)(a1 + 48)], result))
    {
      uint64_t result = [*(id *)(a1 + 40) _recorderForSource:a2];
      v17 = (void *)result;
      if (result)
      {
        uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v20 = [a3 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v20)
        {
          uint64_t v19 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(a3);
              }
              uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              aClass = (objc_class *)[v9 objectForKey:@"_UIAppearanceWrapperKeyClass"];
              if (objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:") != v7)
              {
                uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
                long long v22 = 0u;
                long long v23 = 0u;
                long long v24 = 0u;
                long long v25 = 0u;
                id v11 = (void *)[v9 objectForKey:@"_UIAppearanceWrapperKeyContainerClasses"];
                uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v12)
                {
                  uint64_t v13 = v12;
                  uint64_t v14 = *(void *)v23;
LABEL_14:
                  uint64_t v15 = 0;
                  while (1)
                  {
                    if (*(void *)v23 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    uint64_t v16 = *(objc_class **)(*((void *)&v22 + 1) + 8 * v15);
                    if ([MEMORY[0x1E4F28B50] bundleForClass:v16] == v7) {
                      break;
                    }
                    [v10 addObject:NSStringFromClass(v16)];
                    if (v13 == ++v15)
                    {
                      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
                      if (v13) {
                        goto LABEL_14;
                      }
                      goto LABEL_20;
                    }
                  }
                }
                else
                {
LABEL_20:
                  objc_msgSend(v17, "_recordInvocation:withClassName:containerClassNames:traitCollection:selectorString:forRemoteProcess:", objc_msgSend(v9, "objectForKey:", @"_UIAppearanceWrapperKeyInvocation"), NSStringFromClass(aClass), v10, objc_msgSend(v9, "objectForKey:", @"_UIAppearanceWrapperKeyTraitCollection"), objc_msgSend(v9, "objectForKey:", @"_UIAppearanceWrapperKeySelector"), 1);
                }
              }
            }
            uint64_t v20 = [a3 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v20);
        }
        [a3 removeAllObjects];
        return [*(id *)(a1 + 56) addObject:v17];
      }
    }
  }
  return result;
}

uint64_t __45___UIAppearance__removeInvocationsForSource___block_invoke(uint64_t a1, id *a2, void *a3, uint64_t a4)
{
  [a2 _removeInvocationsForSource:*(void *)(a1 + 32)];
  uint64_t result = [a2[2] count];
  if (!result)
  {
    return [a3 removeObjectForKey:a4];
  }
  return result;
}

uint64_t __41___UIAppearance__handleGetterInvocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = NSStringFromSelector((SEL)[a2 selector]);
  if ([(NSString *)v7 characterAtIndex:0] == 95) {
    uint64_t v7 = [(NSString *)v7 substringFromIndex:1];
  }
  uint64_t result = [(NSString *)v7 isEqualToString:*(void *)(a1 + 32)];
  if (!result) {
    return result;
  }
  if (*(void *)(a1 + 64) < 3uLL) {
    goto LABEL_18;
  }
  for (uint64_t i = 2; ; ++i)
  {
    id v13 = 0;
    id v14 = 0;
    unint64_t v10 = i + 1;
    [a2 getArgument:&v13 atIndex:i + 1];
    [*(id *)(a1 + 40) getArgument:&v14 atIndex:i];
    uint64_t result = [*(id *)(a1 + 48) getArgumentTypeAtIndex:i];
    if (*(unsigned char *)result != 64) {
      break;
    }
    id v11 = (unsigned char *)result;
    uint64_t result = [v14 isEqual:v13];
    if (!result) {
      return result;
    }
    if (*v11 != 64) {
      break;
    }
    if (v10 >= *(void *)(a1 + 64)) {
      goto LABEL_18;
    }
LABEL_16:
    ;
  }
  if (v10 < *(void *)(a1 + 64) && v14 == v13) {
    goto LABEL_16;
  }
  if (v14 == v13)
  {
LABEL_18:
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

@end