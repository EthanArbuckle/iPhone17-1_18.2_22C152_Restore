@interface UIRecursivelyAnalyzeMenu
@end

@implementation UIRecursivelyAnalyzeMenu

uint64_t ___UIRecursivelyAnalyzeMenu_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _UIRecursivelyAnalyzeMenu();
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(*(void *)(a1 + 40) + 32);
    v7 = [v3 identifier];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  return v4;
}

uint64_t ___UIRecursivelyAnalyzeMenu_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 action];
  uint64_t v5 = [v3 propertyList];
  v6 = [*(id *)(*(void *)(a1 + 40) + 24) objectForAction:v4 propertyList:v5];
  if (!v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v3;
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    if (!v11)
    {
      [*(id *)(*(void *)(a1 + 40) + 40) setObject:*(void *)(a1 + 32) forAction:v4 propertyList:v5];
      [*(id *)(*(void *)(a1 + 40) + 24) setObject:v3 forAction:v4 propertyList:v5];
      v7 = 0;
      uint64_t v9 = 1;
      goto LABEL_27;
    }
    v12 = v11;
    v13 = [v11 input];
    if (v13)
    {
    }
    else
    {
      v14 = [v12 _keyCodes];

      if (!v14)
      {
        id v19 = v12;
        v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &qword_1EB262518) + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v23 = 136315394;
          v21 = "input";
          goto LABEL_23;
        }
LABEL_24:

        goto LABEL_25;
      }
    }
    if ([v12 action])
    {
      uint64_t v15 = [**(id **)(a1 + 40) member:v12];
      if (!v15)
      {
        [*(id *)(*(void *)(a1 + 40) + 40) setObject:*(void *)(a1 + 32) forAction:v4 propertyList:v5];
        [*(id *)(*(void *)(a1 + 40) + 24) setObject:v3 forAction:v4 propertyList:v5];
        [**(id **)(a1 + 40) addObject:v12];
        uint64_t v9 = 1;
LABEL_26:
        v7 = (char *)v3;
        goto LABEL_27;
      }
      v16 = (void *)v15;
      v17 = v12;
      v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &_MergedGlobals_1201) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v23 = 138412546;
        v24 = v17;
        __int16 v25 = 2112;
        id v26 = v16;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Menu has duplicates --\n%@\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v23, 0x16u);
      }

LABEL_25:
      uint64_t v9 = 0;
      goto LABEL_26;
    }
    id v19 = v12;
    v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &qword_1EB262518) + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      v21 = "action";
LABEL_23:
      v24 = v21;
      __int16 v25 = 2112;
      id v26 = v19;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Command %s is nil --\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v23, 0x16u);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v7 = (char *)v3;
  v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &_MergedGlobals_1201) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v23 = 138412546;
    v24 = v7;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Menu has duplicates --\n%@\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v9 = 0;
LABEL_27:

  return v9;
}

BOOL ___UIRecursivelyAnalyzeMenu_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v4];
  if (v5)
  {
    id v6 = v3;
    v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("MenuBuilder", &_MergedGlobals_1201) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Menu has duplicates --\n%@\n%@\nMake a symbolic breakpoint at _UIMenuBuilderError to catch this in the debugger.", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKey:v4];
  }

  return v5 == 0;
}

@end