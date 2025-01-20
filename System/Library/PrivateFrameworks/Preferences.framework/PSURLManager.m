@interface PSURLManager
+ (id)sharedManager;
- (PSRootController)rootController;
- (PSSplitViewController)splitViewController;
- (PSTopLevelController)topLevelController;
- (id)currentSpecifierIDPath;
- (id)keyValueDictionaryForURL:(id)a3;
- (id)urlForCurrentNavStack;
- (void)_performURLHandlingForController:(id)a3 dictionary:(id)a4 items:(id)a5 controllerNeedsPush:(BOOL)a6;
- (void)handleDeferredURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 objectOffsetPair:(id)a5 withCompletion:(id)a6;
- (void)handleDeferredURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 withCompletion:(id)a5;
- (void)performURLHandlingForController:(id)a3 dictionary:(id)a4 items:(id)a5 controllerNeedsPush:(BOOL)a6 withCompletion:(id)a7;
- (void)popToRootAndSelectDefaultCategory:(BOOL)a3;
- (void)popToRootAndSelectDefaultCategory:(BOOL)a3 performWithoutDeferringTransitions:(BOOL)a4;
- (void)processURL:(id)a3 animated:(BOOL)a4 fromSearch:(BOOL)a5 withCompletion:(id)a6;
- (void)setOffsetForController:(id)a3 fromObjectPair:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSplitViewController:(id)a3;
- (void)setTopLevelController:(id)a3;
@end

@implementation PSURLManager

+ (id)sharedManager
{
  if (sharedManager_once_0 != -1) {
    dispatch_once(&sharedManager_once_0, &__block_literal_global_33);
  }
  v2 = (void *)sharedManager_manager_0;
  return v2;
}

uint64_t __29__PSURLManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PSURLManager);
  uint64_t v1 = sharedManager_manager_0;
  sharedManager_manager_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)processURL:(id)a3 animated:(BOOL)a4 fromSearch:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  v9 = (void (**)(void))a6;
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v11 = [a3 absoluteString];
  v12 = [v11 stringByReplacingOccurrencesOfString:@"%00" withString:&stru_1EFB51FD0];
  v13 = [v10 URLWithString:v12];

  v14 = [(PSURLManager *)self keyValueDictionaryForURL:v13];
  v15 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  [v14 setObject:v15 forKeyedSubscript:@"fromSearch"];

  v16 = [v14 objectForKey:@"root"];
  v17 = [v16 stringByRemovingPercentEncoding];

  v18 = SFObjectAndOffsetForURLPair();
  v19 = [v18 objectForKey:@"object"];
  uint64_t v20 = [v18 objectForKey:@"offsetItem"];
  v21 = (void *)v20;
  if (v19)
  {
    v34 = (void *)v20;
    v32 = v13;
    v22 = [(PSURLManager *)self rootController];
    v23 = [(PSURLManager *)self topLevelController];
    *(void *)buf = 0;
    v54 = buf;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__10;
    v57 = __Block_byref_object_dispose__10;
    id v58 = [v23 specifierForID:v19];
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = __Block_byref_object_copy__10;
    v51[4] = __Block_byref_object_dispose__10;
    objc_msgSend(v23, "indexPathForIndex:", objc_msgSend(v23, "indexOfSpecifier:", *((void *)v54 + 5)));
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke;
    v38[3] = &unk_1E5C60480;
    v48 = buf;
    id v24 = v23;
    id v39 = v24;
    id v40 = v19;
    id v41 = v17;
    id v25 = v22;
    id v42 = v25;
    id v43 = v34;
    id v44 = v14;
    v45 = self;
    BOOL v50 = a4;
    v47 = v9;
    v49 = v51;
    id v46 = v18;
    v26 = (void *)MEMORY[0x1AD0BE2A0](v38);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_138;
    v35[3] = &unk_1E5C5ECF0;
    id v27 = v25;
    id v36 = v27;
    id v28 = v26;
    id v37 = v28;
    uint64_t v29 = MEMORY[0x1AD0BE2A0](v35);
    v30 = (void *)v29;
    if (v6 || (uint64_t v29 = (uint64_t)v28, !v24)) {
      (*(void (**)(void))(v29 + 16))();
    }
    else {
      [v24 dismissViewControllerAnimated:0 completion:v30];
    }

    _Block_object_dispose(v51, 8);
    _Block_object_dispose(buf, 8);

    v13 = v32;
    v21 = v34;
  }
  else
  {
    v31 = _PSLoggingFacility();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v31, OS_LOG_TYPE_DEFAULT, "PSURLManager: No root object in url", buf, 2u);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

void __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) specifierForBundle:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 104) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  v5 = _PSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Special ROOT processing: %@ and %@", buf, 0x16u);
  }

  if ([*(id *)(a1 + 40) hasPrefix:@"ROOT"])
  {
    [*(id *)(a1 + 56) popRecursivelyToRootController];
    v8 = [*(id *)(a1 + 32) navigationController];
    v9 = [v8 topViewController];
    BOOL v10 = v9 == *(void **)(a1 + 32);

    v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 64);
    if (v10) {
      [v11 _scrollToSpecifierWithID:v12 animated:0];
    }
    else {
      [v11 setDesiredVerticalContentOffsetItemNamed:v12];
    }
  }
  v13 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  if (v13
    && (([v13 propertyForKey:@"enabled"],
         (v14 = objc_claimAutoreleasedReturnValue()) == 0)
     || ([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) propertyForKey:@"enabled"],
         v15 = objc_claimAutoreleasedReturnValue(),
         int v16 = [v15 BOOLValue],
         v15,
         v14,
         v16)))
  {
    v17 = _PSLoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
      v19 = [v18 properties];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_1A6597000, v17, OS_LOG_TYPE_DEFAULT, "Trying to navigate to: %@ and %@", buf, 0x16u);
    }
    uint64_t v20 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"path"];
    v21 = [v20 pathComponents];

    v22 = [*(id *)(a1 + 80) currentSpecifierIDPath];
    if ((unint64_t)[v22 count] >= 2)
    {
      uint64_t v23 = objc_msgSend(v22, "subarrayWithRange:", 1, objc_msgSend(v22, "count") - 1);

      v22 = (void *)v23;
    }
    id v24 = [MEMORY[0x1E4F1CA48] array];
    id v25 = [MEMORY[0x1E4F1CA48] arrayWithArray:v21];
    v26 = [*(id *)(a1 + 80) splitViewController];
    id v27 = [v26 categoryController];
    id v28 = [v27 specifier];
    BOOL v29 = v28 == *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);

    if (v29)
    {
      v33 = [*(id *)(a1 + 80) splitViewController];
      v30 = [v33 categoryController];

      v34 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) identifier];
      [v24 addObject:v34];

      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      v91 = 0;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_26;
      v85[3] = &unk_1E5C60430;
      id v86 = v22;
      id v87 = v24;
      id v88 = v25;
      v89 = buf;
      [v21 enumerateObjectsUsingBlock:v85];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v30 = [*(id *)(a1 + 32) selectSpecifier:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
    }
    int v35 = [*(id *)(a1 + 40) hasPrefix:@"FollowUpList_"];
    if (v30) {
      int v36 = 0;
    }
    else {
      int v36 = v35;
    }
    if (v36 == 1)
    {
      [*(id *)(a1 + 56) popRecursivelyToRootController];
      id v37 = [*(id *)(a1 + 32) navigationController];
      v38 = [v37 topViewController];
      BOOL v39 = v38 == *(void **)(a1 + 32);

      id v40 = *(void **)(a1 + 32);
      uint64_t v41 = *(void *)(a1 + 40);
      if (v39) {
        [v40 _scrollToSpecifierWithID:v41 animated:0];
      }
      else {
        [v40 setDesiredVerticalContentOffsetItemNamed:v41];
      }
      v57 = _PSLoggingFacility();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6597000, v57, OS_LOG_TYPE_DEFAULT, "PSURLManager: skipping push for specifier that returns nil controller", buf, 2u);
      }

      uint64_t v58 = *(void *)(a1 + 96);
      if (v58) {
        (*(void (**)(void))(v58 + 16))();
      }
    }
    else
    {
      char v42 = [*(id *)(a1 + 32) shouldDeferPushForSpecifierID:*(void *)(a1 + 40) urlDictionary:*(void *)(a1 + 72)];
      int v43 = [v24 containsObject:*(void *)(a1 + 40)];
      unint64_t v44 = [v24 count];
      if (v43) {
        BOOL v45 = v44 != 0;
      }
      else {
        BOOL v45 = v44 > 1;
      }
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v91 = __Block_byref_object_copy__10;
      v92 = __Block_byref_object_dispose__10;
      id v93 = 0;
      if ((v42 & 1) == 0)
      {
        if (v45)
        {
          id v46 = [v24 lastObject];
          v47 = [*(id *)(a1 + 56) viewControllers];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_31;
          v82[3] = &unk_1E5C60458;
          id v48 = v46;
          id v83 = v48;
          v84 = buf;
          [v47 enumerateObjectsWithOptions:2 usingBlock:v82];

          v49 = *(void **)(*(void *)&buf[8] + 40);
          BOOL v50 = [*(id *)(a1 + 56) topViewController];
          LOBYTE(v49) = v49 == v50;

          if ((v49 & 1) == 0)
          {
            BOOL v51 = [v25 count] == 0;
            id v52 = (id)[*(id *)(a1 + 56) popToViewController:*(void *)(*(void *)&buf[8] + 40) animated:v51];
          }
          id v53 = *(id *)(*(void *)&buf[8] + 40);

          uint64_t v54 = [*(id *)(*(void *)&buf[8] + 40) specifier];
          uint64_t v55 = *(void *)(*(void *)(a1 + 104) + 8);
          v56 = *(void **)(v55 + 40);
          *(void *)(v55 + 40) = v54;

          v30 = v53;
        }
        else
        {
          [*(id *)(a1 + 56) setViewControllers:MEMORY[0x1E4F1CBF0]];
          [*(id *)(a1 + 32) setSkipSelectingDefaultCategoryOnLaunch:1];
        }
      }
      id v59 = (id)[*(id *)(a1 + 32) view];
      v60 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 120)];
      [*(id *)(a1 + 72) setObject:v60 forKeyedSubscript:@"animate"];

      if (v42)
      {
        v61 = *(void **)(a1 + 32);
        v62 = [v61 table];
        uint64_t v63 = [v61 tableView:v62 willSelectRowAtIndexPath:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
        uint64_t v64 = *(void *)(*(void *)(a1 + 112) + 8);
        v65 = *(void **)(v64 + 40);
        *(void *)(v64 + 40) = v63;

        if (v63)
        {
          v66 = [*(id *)(a1 + 32) table];
          [v66 selectRowAtIndexPath:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) animated:0 scrollPosition:0];

          objc_msgSend(*(id *)(a1 + 80), "popToRootAndSelectDefaultCategory:performWithoutDeferringTransitions:", 0, objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", @"PASSBOOK"));
          v67 = *(void **)(a1 + 32);
          v68 = [v67 table];
          [v67 tableView:v68 didSelectRowAtIndexPath:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];

          v69 = _PSLoggingFacility();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1A6597000, v69, OS_LOG_TYPE_DEFAULT, "PSURLManager: selecting top level tableview row", v81, 2u);
          }

          uint64_t v70 = *(void *)(a1 + 96);
          if (v70) {
            (*(void (**)(void))(v70 + 16))();
          }
        }
      }
      else if (v45)
      {
        v71 = [*(id *)(a1 + 32) table];
        [v71 selectRowAtIndexPath:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) animated:0 scrollPosition:0];

        if ([v25 count])
        {
          v72 = (void *)[*(id *)(a1 + 72) mutableCopy];
          v73 = [NSString pathWithComponents:v25];
          [v72 setObject:v73 forKeyedSubscript:@"path"];

          v74 = [v25 firstObject];
          v75 = SFObjectAndOffsetForURLPair();

          [*(id *)(a1 + 80) setOffsetForController:v30 fromObjectPair:v75];
          v76 = _PSLoggingFacility();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1A6597000, v76, OS_LOG_TYPE_DEFAULT, "PSURLManager: handling url reusing existing controllers", v81, 2u);
          }

          [*(id *)(a1 + 80) performURLHandlingForController:*(void *)(*(void *)&buf[8] + 40) dictionary:v72 items:v25 controllerNeedsPush:0 withCompletion:*(void *)(a1 + 96)];
        }
        else
        {
          v72 = [v21 lastObject];
          if (![v72 length])
          {
            uint64_t v78 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"root"];

            v72 = (void *)v78;
          }
          v75 = SFObjectAndOffsetForURLPair();
          if (v75) {
            [*(id *)(a1 + 80) setOffsetForController:*(void *)(*(void *)&buf[8] + 40) fromObjectPair:v75];
          }
          if ([v30 conformsToProtocol:&unk_1EFBD3B70]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            [v30 handleResourceDictionaryWhenAlreadyPresented:*(void *)(a1 + 72)];
          }
          v79 = _PSLoggingFacility();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v81 = 0;
            _os_log_impl(&dword_1A6597000, v79, OS_LOG_TYPE_DEFAULT, "PSURLManager: handling url while already at destination", v81, 2u);
          }

          uint64_t v80 = *(void *)(a1 + 96);
          if (v80) {
            (*(void (**)(void))(v80 + 16))();
          }
        }
      }
      else
      {
        v77 = _PSLoggingFacility();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v81 = 0;
          _os_log_impl(&dword_1A6597000, v77, OS_LOG_TYPE_DEFAULT, "PSURLManager: handling url", v81, 2u);
        }

        [*(id *)(a1 + 80) handleDeferredURLForSpecifierID:*(void *)(a1 + 40) resourceDictionary:*(void *)(a1 + 72) objectOffsetPair:*(void *)(a1 + 88) withCompletion:*(void *)(a1 + 96)];
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else if ([*(id *)(a1 + 32) shouldDeferPushForSpecifierID:*(void *)(a1 + 40) urlDictionary:*(void *)(a1 + 72)])
  {
    [*(id *)(a1 + 32) prepareHandlingURLForSpecifierID:*(void *)(a1 + 40) resourceDictionary:*(void *)(a1 + 72) animatePush:0 withCompletion:*(void *)(a1 + 96)];
  }
  else
  {
    v31 = _PSLoggingFacility();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v31, OS_LOG_TYPE_DEFAULT, "PSURLManager: Couldn't find top level specifier and loading was not deferred", buf, 2u);
    }

    uint64_t v32 = *(void *)(a1 + 96);
    if (v32) {
      (*(void (**)(void))(v32 + 16))();
    }
  }
}

void __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_26(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v7 = SFObjectAndOffsetForURLPair();
  id v15 = [v7 objectForKeyedSubscript:@"object"];

  v8 = v15;
  if (v15 && (BOOL v9 = [*(id *)(a1 + 32) count] > a3, v8 = v15, v9))
  {
    BOOL v10 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
    int v11 = [v15 isEqualToString:v10];

    if (v11)
    {
      [*(id *)(a1 + 40) addObject:v15];
      uint64_t v12 = *(void **)(a1 + 48);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void *)(v13 + 24);
      *(void *)(v13 + 24) = v14 + 1;
      [v12 removeObjectAtIndex:a3 - v14];
    }
    else
    {
      *a4 = 1;
    }
    v8 = v15;
  }
  else
  {
    *a4 = 1;
  }
}

uint64_t __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v7 = [v12 conformsToProtocol:&unk_1EFB7BC28];
  id v8 = v12;
  if (v7)
  {
    BOOL v9 = [v12 specifier];
    BOOL v10 = [v9 identifier];

    if (v10 && [v10 isEqualToString:*(void *)(a1 + 32)])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

    id v8 = v12;
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

uint64_t __62__PSURLManager_processURL_animated_fromSearch_withCompletion___block_invoke_138(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    return [v2 dismissViewControllerAnimated:0 completion:v3];
  }
  else {
    return (*(uint64_t (**)(void))(v3 + 16))(*(void *)(a1 + 40));
  }
}

- (id)keyValueDictionaryForURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [v3 resourceSpecifier];
  uint64_t v6 = [v5 componentsSeparatedByString:@"&"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v17);
        if ([v12 count] == 2)
        {
          uint64_t v13 = [v12 objectAtIndex:1];
          uint64_t v14 = [v13 stringByRemovingPercentEncoding];

          id v15 = [v12 objectAtIndex:0];
          [v4 setObject:v14 forKey:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)currentSpecifierIDPath
{
  uint64_t v2 = [(PSURLManager *)self rootController];
  id v3 = [v2 viewControllers];
  v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__PSURLManager_currentSpecifierIDPath__block_invoke;
  v8[3] = &unk_1E5C604A8;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __38__PSURLManager_currentSpecifierIDPath__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v8 specifier];
    id v7 = [v6 identifier];

    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else {
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
  }
}

- (void)setOffsetForController:(id)a3 fromObjectPair:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:@"offsetValue"];
  [v6 floatValue];
  float v8 = v7;

  id v9 = [v5 objectForKeyedSubscript:@"offsetItem"];

  if ([v11 conformsToProtocol:&unk_1EFB7E2E0])
  {
    if (v8 == 0.0)
    {
      if ([v9 length]) {
        [v11 setDesiredVerticalContentOffsetItemNamed:v9];
      }
    }
    else
    {
      *(float *)&double v10 = v8;
      [v11 setDesiredVerticalContentOffset:v10];
    }
  }
  if ([v9 length] && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 highlightSpecifierWithID:v9];
  }
}

- (void)_performURLHandlingForController:(id)a3 dictionary:(id)a4 items:(id)a5 controllerNeedsPush:(BOOL)a6
{
}

- (void)performURLHandlingForController:(id)a3 dictionary:(id)a4 items:(id)a5 controllerNeedsPush:(BOOL)a6 withCompletion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  int v16 = [v13 objectForKeyedSubscript:@"animate"];
  uint64_t v17 = [v16 BOOLValue];

  long long v18 = [v13 objectForKeyedSubscript:@"fromSearch"];
  [v18 BOOLValue];

  char v24 = 0;
  if ([v14 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v19 = [v14 objectAtIndexedSubscript:0];
    long long v20 = SFObjectAndOffsetForURLPair();

    v21 = [v20 objectForKeyedSubscript:@"object"];
    if (v21) {
      int v22 = [v12 prepareHandlingURLForSpecifierID:v21 resourceDictionary:v13 animatePush:&v24 withCompletion:v15] ^ 1;
    }
    else {
      LOBYTE(v22) = 0;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  if (!v8)
  {
    [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v17];
    if (v22) {
      goto LABEL_19;
    }
LABEL_18:
    [v12 handleURL:v13 withCompletion:v15];
    goto LABEL_19;
  }
  if (v24) {
    char v23 = v22;
  }
  else {
    char v23 = 0;
  }
  if ((v23 & 1) == 0 && ((v17 ^ 1) & 1) == 0) {
    [v14 count];
  }
  [MEMORY[0x1E4F42FF0] setAnimationsEnabled:v17];
  [(PSSplitViewController *)self->_splitViewController showInitialViewController:v12];
  if ((v22 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_19:
  [MEMORY[0x1E4F42FF0] enableAnimation];
}

- (void)handleDeferredURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 objectOffsetPair:(id)a5 withCompletion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  id v14 = [(PSURLManager *)self topLevelController];
  id v15 = [v14 specifierForID:v10];
  if (v15)
  {
    int v16 = [v14 selectSpecifier:v15];
    if (v16)
    {
      uint64_t v17 = objc_msgSend(v14, "indexPathForIndex:", objc_msgSend(v14, "indexOfSpecifier:", v15));
      long long v18 = [v14 table];
      [v18 selectRowAtIndexPath:v17 animated:0 scrollPosition:0];

      [v16 setParentController:v14];
      long long v19 = [(PSURLManager *)self rootController];
      [v16 setRootController:v19];

      [v16 setSpecifier:v15];
      id v25 = v12;
      [(PSURLManager *)self setOffsetForController:v16 fromObjectPair:v12];
      long long v20 = [v11 objectForKeyedSubscript:@"path"];
      v21 = [v20 pathComponents];

      int v22 = _PSLoggingFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_1A6597000, v22, OS_LOG_TYPE_DEFAULT, "PSURLManager: Handling deferred url for %@", buf, 0xCu);
      }

      [(PSURLManager *)self performURLHandlingForController:v16 dictionary:v11 items:v21 controllerNeedsPush:1 withCompletion:v13];
      id v12 = v25;
    }
    else
    {
      char v24 = _PSLoggingFacility();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_1A6597000, v24, OS_LOG_TYPE_DEFAULT, "PSURLManager: No controller for deferred URL-handling ID %@", buf, 0xCu);
      }

      if (v13) {
        v13[2](v13);
      }
    }
  }
  else
  {
    char v23 = _PSLoggingFacility();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v10;
      _os_log_impl(&dword_1A6597000, v23, OS_LOG_TYPE_DEFAULT, "PSURLManager: No specifier for deferred URL-handling ID %@", buf, 0xCu);
    }

    if (v13) {
      v13[2](v13);
    }
  }
}

- (void)handleDeferredURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 objectForKey:@"root"];
  id v14 = [v11 stringByRemovingPercentEncoding];

  id v12 = SFObjectAndOffsetForURLPair();
  id v13 = (void *)[v9 mutableCopy];

  [(PSURLManager *)self handleDeferredURLForSpecifierID:v10 resourceDictionary:v13 objectOffsetPair:v12 withCompletion:v8];
}

- (void)popToRootAndSelectDefaultCategory:(BOOL)a3
{
}

- (void)popToRootAndSelectDefaultCategory:(BOOL)a3 performWithoutDeferringTransitions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  float v7 = [(PSURLManager *)self topLevelController];
  id v8 = v7;
  if (v4)
  {
    id v9 = (void *)MEMORY[0x1E4F42FF8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__PSURLManager_popToRootAndSelectDefaultCategory_performWithoutDeferringTransitions___block_invoke;
    v12[3] = &unk_1E5C5D680;
    id v13 = v7;
    [v9 _performWithoutDeferringTransitions:v12];

    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = [v7 navigationController];
    id v11 = (id)[v10 popToRootViewControllerAnimated:0];

    if (!v5) {
      goto LABEL_7;
    }
  }
  if (([(PSSplitViewController *)self->_splitViewController isCollapsed] & 1) == 0) {
    [v8 selectDefaultCategoryForced:1];
  }
LABEL_7:
}

void __85__PSURLManager_popToRootAndSelectDefaultCategory_performWithoutDeferringTransitions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popToRootViewControllerAnimated:0];
}

- (id)urlForCurrentNavStack
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = [(PSURLManager *)self splitViewController];
  BOOL v4 = [v3 containerNavigationController];
  BOOL v5 = [v4 topViewController];

  id v6 = v5;
  float v7 = 0.0;
  if ([v5 conformsToProtocol:&unk_1EFB7E2E0])
  {
    [v5 verticalContentOffset];
    float v7 = v8;
  }
  id v61 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v9 = [(PSURLManager *)self splitViewController];
  id v10 = [v9 categoryController];

  id v59 = v10;
  if ([v10 conformsToProtocol:&unk_1EFB7BC28])
  {
    id v11 = [v10 specifier];
    uint64_t v12 = [v11 identifier];
    id v13 = (void *)v12;
    id v14 = @"ROOT";
    if (v12) {
      id v14 = (__CFString *)v12;
    }
    id v15 = v14;
  }
  else
  {
    int v16 = _PSLoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      long long v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 136315394;
      v68 = "-[PSURLManager urlForCurrentNavStack]";
      __int16 v69 = 2114;
      uint64_t v70 = v18;
      _os_log_impl(&dword_1A6597000, v16, OS_LOG_TYPE_DEFAULT, "%s: Category controller doesn't have a specifier: %{public}@", buf, 0x16u);
    }
    id v15 = @"ROOT";
  }
  unint64_t v19 = 0x1E4F28000uLL;
  long long v20 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  uint64_t v58 = v15;
  v21 = [(__CFString *)v15 stringByAddingPercentEncodingWithAllowedCharacters:v20];
  [v61 appendFormat:@"prefs:root=%@", v21];

  if (v7 != 0.0)
  {
    int v22 = objc_msgSend(NSString, "stringWithFormat:", @"#%0.0f", v7);
    char v23 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    char v24 = [v22 stringByAddingPercentEncodingWithAllowedCharacters:v23];
    [v61 appendString:v24];
  }
  id v25 = (void *)MEMORY[0x1E4F1C978];
  v26 = [(PSURLManager *)self splitViewController];
  id v27 = [v26 containerNavigationController];
  uint64_t v28 = [v27 viewControllers];
  id v29 = [v25 arrayWithArray:v28];

  if ((unint64_t)[v29 count] >= 2)
  {
    v57 = v6;
    v30 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, objc_msgSend(v29, "count") - 1);
    v31 = [v29 objectsAtIndexes:v30];

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v29 = v31;
    uint64_t v32 = [v29 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v63;
      char v35 = 1;
      id v60 = v29;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v63 != v34) {
            objc_enumerationMutation(v29);
          }
          id v37 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v38 = v19;
            BOOL v39 = [v37 specifier];
            id v40 = [v39 identifier];

            uint64_t v41 = [v37 specifier];
            char v42 = [v41 propertyForKey:@"id"];

            if (!v42)
            {
              int v43 = [v37 specifier];
              unint64_t v44 = [v37 specifier];
              BOOL v45 = [v44 identifier];
              [v43 setProperty:v45 forKey:@"id"];
            }
            if (![v37 canBeShownFromSuspendedState])
            {

              id v29 = v60;
              goto LABEL_34;
            }
            float v46 = 0.0;
            if ([v37 conformsToProtocol:&unk_1EFB7E2E0])
            {
              [v37 verticalContentOffset];
              float v46 = v47;
            }
            unint64_t v19 = v38;
            id v48 = [*(id *)(v38 + 2952) URLPathAllowedCharacterSet];
            uint64_t v49 = [v40 stringByAddingPercentEncodingWithAllowedCharacters:v48];
            BOOL v50 = (void *)v49;
            if (v35) {
              BOOL v51 = @"&path=%@";
            }
            else {
              BOOL v51 = @"/%@";
            }
            objc_msgSend(v61, "appendFormat:", v51, v49);

            if (v46 != 0.0)
            {
              id v52 = objc_msgSend(NSString, "stringWithFormat:", @"#%0.0f", v46);
              id v53 = [*(id *)(v38 + 2952) URLPathAllowedCharacterSet];
              uint64_t v54 = [v52 stringByAddingPercentEncodingWithAllowedCharacters:v53];
              [v61 appendString:v54];

              unint64_t v19 = v38;
            }

            char v35 = 0;
            id v29 = v60;
          }
        }
        uint64_t v33 = [v29 countByEnumeratingWithState:&v62 objects:v66 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }
LABEL_34:

    id v6 = v57;
  }
  uint64_t v55 = [MEMORY[0x1E4F1CB10] URLWithString:v61];

  return v55;
}

- (PSTopLevelController)topLevelController
{
  return self->_topLevelController;
}

- (void)setTopLevelController:(id)a3
{
}

- (PSSplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
}

- (PSRootController)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_topLevelController, 0);
}

@end