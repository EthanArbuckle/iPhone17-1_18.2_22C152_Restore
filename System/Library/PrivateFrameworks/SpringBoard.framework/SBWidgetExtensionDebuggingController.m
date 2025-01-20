@interface SBWidgetExtensionDebuggingController
- (CHSWidgetExtensionProvider)_extensionProvider;
- (SBWidgetExtensionDebuggingController)initWithWorkspace:(id)a3 toolService:(id)a4 homeScreenDataSource:(id)a5 controlCenterDataSource:(id)a6;
- (void)_descriptorForWidgetFromExtension:(id)a3 forRequestedKind:(id)a4 requestedWidgetFamily:(int64_t)a5 completion:(id)a6;
- (void)_reallyFindDescriptorForWidgetFromExtension:(id)a3 forRequestedKind:(id)a4 requestedWidgetFamily:(int64_t)a5 completion:(id)a6;
- (void)_setExtensionProvider:(id)a3;
- (void)launchExtensionWithBundleID:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation SBWidgetExtensionDebuggingController

- (SBWidgetExtensionDebuggingController)initWithWorkspace:(id)a3 toolService:(id)a4 homeScreenDataSource:(id)a5 controlCenterDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBWidgetExtensionDebuggingController;
  v15 = [(SBWidgetExtensionDebuggingController *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workspace, a3);
    objc_storeStrong((id *)&v16->_homeScreenDataSource, a5);
    objc_storeStrong((id *)&v16->_controlCenterDataSource, a6);
    objc_storeStrong((id *)&v16->_toolService, a4);
    id v17 = objc_alloc(MEMORY[0x1E4F58E50]);
    v18 = [MEMORY[0x1E4F58E10] visible];
    v19 = [MEMORY[0x1E4F58C68] visible];
    v20 = (void *)[v17 initWithWidgetsPredicate:v18 controlsPredicate:v19];

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F58E40]) initWithOptions:v20];
    extensionProvider = v16->_extensionProvider;
    v16->_extensionProvider = (CHSWidgetExtensionProvider *)v21;

    [(SBMainWorkspace *)v16->_workspace registerHandler:v16 forExtensionPoint:@"com.apple.widgetkit-extension"];
  }

  return v16;
}

- (void)launchExtensionWithBundleID:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = SBLogWidgets();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "SBAvocadoDebuggingController launching avocado extension: %@ options: %@", buf, 0x16u);
  }

  id v12 = objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F58BF8], objc_opt_class());
  id v13 = objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E4F58BF0], objc_opt_class());
  uint64_t v14 = CHSWidgetFamilyFromString();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke;
  v18[3] = &unk_1E6B09D70;
  id v19 = v12;
  id v20 = v8;
  uint64_t v21 = self;
  id v22 = v10;
  id v15 = v10;
  id v16 = v8;
  id v17 = v12;
  [(SBWidgetExtensionDebuggingController *)self _descriptorForWidgetFromExtension:v16 forRequestedKind:v17 requestedWidgetFamily:v14 completion:v18];
}

void __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BSDispatchQueueAssertMain();
  uint64_t v7 = [v5 widgetDescriptorToUse];
  uint64_t v8 = [v5 controlDescriptorToUse];
  id v9 = (void *)v8;
  if (v7 | v8)
  {
    if (v7)
    {
      id v11 = SBLogWidgets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v7;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "DEBUG: descriptor chosen: %@", buf, 0xCu);
      }

      id v12 = *(void **)(*(void *)(a1 + 48) + 32);
      uint64_t v13 = [v5 widgetFamily];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_61;
      v19[3] = &unk_1E6AF5DA8;
      id v20 = *(id *)(a1 + 56);
      [v12 launchWidget:v7 widgetFamily:v13 completion:v19];
      uint64_t v14 = v20;
    }
    else
    {
      if (!v8) {
        goto LABEL_14;
      }
      id v15 = SBLogWidgets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = (uint64_t)v9;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEFAULT, "DEBUG: descriptor chosen: %@", buf, 0xCu);
      }

      id v16 = *(void **)(*(void *)(a1 + 48) + 40);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_63;
      v17[3] = &unk_1E6AF5DA8;
      id v18 = *(id *)(a1 + 56);
      [v16 launchControl:v9 completion:v17];
      uint64_t v14 = v18;
    }

    goto LABEL_14;
  }
  id v10 = SBLogWidgets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_cold_1(a1, (uint64_t)v6, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:
}

uint64_t __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_61(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

uint64_t __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_63(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0, a2);
}

- (void)_descriptorForWidgetFromExtension:(id)a3 forRequestedKind:(id)a4 requestedWidgetFamily:(int64_t)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (!v11)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBWidgetExtensionDebuggingController.m", 141, @"Invalid parameter not satisfying: %@", @"extensionBundleID" object file lineNumber description];
  }
  uint64_t v14 = SBLogWidgets();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v11;
    _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Requesting chronod fetch descriptors for: %{public}@", buf, 0xCu);
  }

  toolService = self->_toolService;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke;
  v20[3] = &unk_1E6B09DC0;
  v20[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  int64_t v24 = a5;
  id v16 = v12;
  id v17 = v13;
  id v18 = v11;
  [(CHSToolSupportService *)toolService reloadDescriptorsForExtensionBundleIdentifier:v18 completion:v20];
}

void __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v5 = a1[5];
  id v7 = a1[7];
  id v6 = a1[6];
  id v4 = v3;
  BSDispatchMain();
}

void __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    id v3 = SBLogWidgets();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Couldn't find descriptors -- looking locally in process as a last resort", buf, 2u);
    }

    id v4 = [*(id *)(*(void *)(a1 + 40) + 24) widgetExtensionContainerForExtensionBundleIdentifier:*(void *)(a1 + 48)];
    id v5 = [v4 localExtensions];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_75;
    id v17 = &unk_1E6B01200;
    id v18 = *(id *)(a1 + 48);
    objc_msgSend(v5, "bs_firstObjectPassingTest:", &v14);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = [v2 orderedDescriptors];
  id v7 = [v2 orderedControlDescriptors];
  uint64_t v8 = SBLogWidgets();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 count];
    uint64_t v10 = [v7 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu widget descriptors, %lu control descriptors", buf, 0x16u);
  }

  if (v2 && ([v6 count] || objc_msgSend(v7, "count")))
  {
    [*(id *)(a1 + 40) _reallyFindDescriptorForWidgetFromExtension:v2 forRequestedKind:*(void *)(a1 + 56) requestedWidgetFamily:*(void *)(a1 + 72) completion:*(void *)(a1 + 64)];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"Failed to get descriptors for extensionBundleID (%@)", *(void *)(a1 + 48), v14, v15, v16, v17];
    id v12 = SBLogWidgets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();
    }

    id v13 = SBWidgetExtensionDebugError(1, v11);
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __124__SBWidgetExtensionDebuggingController__descriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_75(uint64_t a1, void *a2)
{
  id v3 = [a2 identity];
  id v4 = [v3 extensionBundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (void)_reallyFindDescriptorForWidgetFromExtension:(id)a3 forRequestedKind:(id)a4 requestedWidgetFamily:(int64_t)a5 completion:(id)a6
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v75 = a4;
  v71 = (void (**)(id, void, void *))a6;
  v74 = v10;
  id v11 = [v10 identity];
  v73 = [v11 extensionBundleIdentifier];

  id v12 = [v10 orderedDescriptors];
  id v13 = [v10 orderedControlDescriptors];
  if (!v73)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2, self, @"SBWidgetExtensionDebuggingController.m", 179, @"Invalid parameter not satisfying: %@", @"extensionBundleIdentifier" object file lineNumber description];
  }
  if (![v12 count] && !objc_msgSend(v13, "count"))
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"SBWidgetExtensionDebuggingController.m", 180, @"Invalid parameter not satisfying: %@", @"[widgetDescriptors count] > 0 || [controlDescriptors count] > 0" object file lineNumber description];
  }
  BSDispatchQueueAssertMain();
  v76 = [v12 sortedArrayUsingComparator:&__block_literal_global_317];

  v72 = [v13 sortedArrayUsingComparator:&__block_literal_global_91_1];

  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x2020000000;
  uint64_t v100 = 0;
  if (v75 && [v75 length])
  {
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_3;
    v95[3] = &unk_1E6B09E28;
    id v14 = v75;
    id v96 = v14;
    uint64_t v15 = objc_msgSend(v76, "bs_firstObjectPassingTest:", v95);
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_4;
    v93[3] = &unk_1E6B01228;
    id v16 = v14;
    id v94 = v16;
    uint64_t v17 = objc_msgSend(v72, "bs_firstObjectPassingTest:", v93);
    if (!(v15 | v17))
    {
      int64_t v24 = [MEMORY[0x1E4F1CA48] array];
      id v70 = v16;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v25 = v76;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v89 objects:v103 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v90 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = NSString;
            v30 = [*(id *)(*((void *)&v89 + 1) + 8 * i) kind];
            v31 = [v29 stringWithFormat:@"'%@'", v30];
            [v24 addObject:v31];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v89 objects:v103 count:16];
        }
        while (v26);
      }

      long long v87 = 0u;
      long long v88 = 0u;
      long long v86 = 0u;
      long long v85 = 0u;
      id v32 = v72;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v85 objects:v102 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v86 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = NSString;
            v37 = [*(id *)(*((void *)&v85 + 1) + 8 * j) kind];
            v38 = [v36 stringWithFormat:@"'%@'", v37];
            [v24 addObject:v38];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v85 objects:v102 count:16];
        }
        while (v33);
      }

      v39 = [v24 componentsJoinedByString:@", "];
      v40 = [NSString stringWithFormat:@"Invalid requested widget kind: '%@'. Please specify one of: %@ in your scheme's Environment Variables using the key '__WidgetKind'.", v70, v39];
      v41 = SBLogWidgets();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();
      }

      v42 = SBWidgetExtensionDebugError(2, v40);
      v71[2](v71, 0, v42);

      uint64_t v15 = (uint64_t)v96;
      goto LABEL_53;
    }

    id v18 = v96;
LABEL_45:

    goto LABEL_46;
  }
  if ([v76 count] == 1 && !objc_msgSend(v72, "count"))
  {
    uint64_t v15 = [v76 firstObject];
    uint64_t v17 = 0;
  }
  else
  {
    if ([v76 count] || objc_msgSend(v72, "count") != 1)
    {
      id v19 = [(SBWidgetExtensionDebugHomeScreenDataSource *)self->_homeScreenDataSource hasExistingWidgetFromExtension:v73];
      uint64_t v15 = (uint64_t)v19;
      if (v19)
      {
        uint64_t v20 = [v19 kind];
        BOOL v21 = v20 == 0;

        if (v21)
        {
          v67 = [MEMORY[0x1E4F28B00] currentHandler];
          [v67 handleFailureInMethod:a2 object:self file:@"SBWidgetExtensionDebuggingController.m" lineNumber:253 description:@"Must provide a kind"];
        }
        a5 = [(id)v15 family];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_107;
        v83[3] = &unk_1E6B09E28;
        id v84 = (id)v15;
        uint64_t v22 = objc_msgSend(v76, "bs_firstObjectPassingTest:", v83);
        uint64_t v17 = 0;
        id v23 = v84;
      }
      else
      {
        v43 = [(SBWidgetExtensionDebugControlCenterDataSource *)self->_controlCenterDataSource hasExistingControlFromExtension:v73];
        id v23 = v43;
        if (v43)
        {
          v44 = [v43 kind];
          BOOL v45 = v44 == 0;

          if (v45)
          {
            v68 = [MEMORY[0x1E4F28B00] currentHandler];
            [v68 handleFailureInMethod:a2 object:self file:@"SBWidgetExtensionDebuggingController.m" lineNumber:263 description:@"Must provide a kind"];
          }
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2_108;
          v81[3] = &unk_1E6B01228;
          id v23 = v23;
          id v82 = v23;
          uint64_t v17 = objc_msgSend(v72, "bs_firstObjectPassingTest:", v81);
        }
        else
        {
          uint64_t v17 = 0;
        }
        uint64_t v22 = 0;
      }

      if (!(v22 | v17))
      {
        v48 = objc_msgSend(v76, "bs_map:", &__block_literal_global_112_2);
        v49 = [v48 componentsJoinedByString:@", "];

        v50 = [NSString stringWithFormat:@"Please specify the widget kind in the scheme's Environment Variables using the key '_XCWidgetKind' to be one of: %@", v49];
        v51 = SBLogWidgets();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();
        }

        v52 = SBWidgetExtensionDebugError(2, v50);
        v71[2](v71, 0, v52);

        goto LABEL_53;
      }
      id v18 = (void *)v15;
      uint64_t v15 = v22;
      goto LABEL_45;
    }
    uint64_t v17 = [v72 firstObject];
    uint64_t v15 = 0;
  }
LABEL_46:
  if (!(v15 | v17))
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2 object:self file:@"SBWidgetExtensionDebuggingController.m" lineNumber:283 description:@"Should have a widget or control descriptor to use by now"];

    goto LABEL_49;
  }
  if (!v15 || v98[3]) {
    goto LABEL_49;
  }
  if (!a5)
  {
    int8x8_t v53 = (int8x8_t)[(id)v15 supportedFamilies];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v78 = (void (*)(void *))__134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_122;
    v79 = &unk_1E6AFCE00;
    v80 = &v97;
    v54 = v77;
    if (v53)
    {
      char v101 = 0;
      uint8x8_t v55 = (uint8x8_t)vcnt_s8(v53);
      v55.i16[0] = vaddlv_u8(v55);
      int v56 = v55.i32[0];
      if (v55.i32[0])
      {
        unint64_t v57 = 0;
        do
        {
          if (((1 << v57) & *(void *)&v53) != 0)
          {
            v78(v54);
            if (v101) {
              break;
            }
            --v56;
          }
          if (v57 > 0x3E) {
            break;
          }
          ++v57;
        }
        while (v56 > 0);
      }
    }

    goto LABEL_49;
  }
  [(id)v15 supportedFamilies];
  if (CHSWidgetFamilyMaskContainsFamily())
  {
    v98[3] = a5;
LABEL_49:
    v46 = [_SBWidgetExtensionLaunchRequestResult alloc];
    v47 = [(_SBWidgetExtensionLaunchRequestResult *)v46 initWithWidgetDescriptor:v15 widgetFamily:v98[3] controlDescriptor:v17];
    ((void (**)(id, _SBWidgetExtensionLaunchRequestResult *, void *))v71)[2](v71, v47, 0);

    goto LABEL_53;
  }
  v58 = NSString;
  v59 = MEMORY[0x1D9489280](a5);
  v60 = [(id)v15 kind];
  v61 = [v58 stringWithFormat:@"Request widget family (%@) is not supported by this widget kind (%@)", v59, v60];

  v62 = SBLogWidgets();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
    SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();
  }

  v63 = SBWidgetExtensionDebugError(3, v61);
  v71[2](v71, 0, v63);

LABEL_53:
  _Block_object_dispose(&v97, 8);
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 kind];
  id v6 = [v4 kind];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 kind];
  id v6 = [v4 kind];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_107(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [*(id *)(a1 + 32) kind];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_2_108(uint64_t a1, void *a2)
{
  id v3 = [a2 kind];
  uint64_t v4 = [*(id *)(a1 + 32) kind];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_3_109(uint64_t a1, void *a2)
{
  id v2 = NSString;
  id v3 = [a2 kind];
  uint64_t v4 = [v2 stringWithFormat:@"'%@'", v3];

  return v4;
}

uint64_t __134__SBWidgetExtensionDebuggingController__reallyFindDescriptorForWidgetFromExtension_forRequestedKind_requestedWidgetFamily_completion___block_invoke_122(uint64_t result, uint64_t a2, int a3, unsigned char *a4)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  *a4 = 1;
  return result;
}

- (CHSWidgetExtensionProvider)_extensionProvider
{
  return self->_extensionProvider;
}

- (void)_setExtensionProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCenterDataSource, 0);
  objc_storeStrong((id *)&self->_homeScreenDataSource, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_toolService, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
}

void __87__SBWidgetExtensionDebuggingController_launchExtensionWithBundleID_options_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Failed to validate widget kind (%@) for extension (%@): %@", (uint8_t *)&v5, 0x20u);
}

@end