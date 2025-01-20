@interface UIApplicationSceneConnectionHandler
@end

@implementation UIApplicationSceneConnectionHandler

void _UIApplicationSceneConnectionHandler_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = v4;
    if ([(id)UIApp isFrontBoard]) {
      int v9 = [(id)UIApp disablesFrontBoardImplicitWindowScenes];
    }
    else {
      int v9 = 0;
    }
    if ([(id)UIApp _appAdoptsUISceneLifecycle])
    {
      int v10 = 0;
    }
    else
    {
      v11 = [(id)UIApp _defaultSceneIfExists];
      v12 = [v8 _FBSScene];
      int v10 = [v11 isEqual:v12];
    }
    v13 = +[UIScene _scenesIncludingInternal:1];
    v14 = v13;
    if (v10 && [v13 count] && (objc_msgSend((id)UIApp, "isFrontBoard") ^ 1 | v9) == 1)
    {
      id v48 = v5;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v47 = v14;
      id obj = v14;
      uint64_t v51 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
      v15 = 0;
      if (v51)
      {
        uint64_t v50 = *(void *)v63;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v63 != v50) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v62 + 1) + 8 * v16);
            v55 = [v17 screen];
            v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationLifecycle", &qword_1EB25F3E0) + 8);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              Name = class_getName(v20);
              int v22 = [v55 _isMainScreen];
              int v23 = [v55 _isMainLikeScreen];
              v24 = (objc_class *)objc_opt_class();
              v25 = class_getName(v24);
              *(_DWORD *)buf = 136447746;
              v68 = Name;
              __int16 v69 = 2050;
              v70 = v17;
              __int16 v71 = 2050;
              v72 = v55;
              __int16 v73 = 1024;
              int v74 = v22;
              __int16 v75 = 1024;
              int v76 = v23;
              __int16 v77 = 2082;
              v78 = v25;
              __int16 v79 = 2050;
              id v80 = v8;
              _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Migrating windows from placeholder scene: %{public}s: %{public}p; screen: %{public}p, isMain: %d, isMain"
                "Like: %d; to connecting default scene: %{public}s: %{public}p;",
                buf,
                0x40u);
            }
            v26 = -[UIWindowScene _keyWindow]((id *)v17);
            v27 = v26;
            uint64_t v53 = v16;
            if (!v15 && v26) {
              v15 = v26;
            }
            v52 = v27;
            v54 = v15;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v28 = [v17 _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v58 objects:v66 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v59;
              do
              {
                uint64_t v32 = 0;
                do
                {
                  if (*(void *)v59 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(id **)(*((void *)&v58 + 1) + 8 * v32);
                  v34 = -[UIWindow _fbsScene](v33);
                  v35 = [v33 _uiWindowSceneFromFBSScene:v34];

                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = _UIApplicationSceneConnectionHandler_block_invoke_2;
                  block[3] = &unk_1E52D9F98;
                  block[4] = v33;
                  id v57 = v35;
                  uint64_t v36 = qword_1EB25F3E8;
                  id v37 = v35;
                  if (v36 != -1) {
                    dispatch_once(&qword_1EB25F3E8, block);
                  }

                  if (v37) {
                    id v38 = v37;
                  }
                  else {
                    id v38 = v8;
                  }
                  [v33 setWindowScene:v38];

                  ++v32;
                }
                while (v30 != v32);
                uint64_t v30 = [v28 countByEnumeratingWithState:&v58 objects:v66 count:16];
              }
              while (v30);
            }

            v15 = v54;
            uint64_t v16 = v53 + 1;
          }
          while (v53 + 1 != v51);
          uint64_t v51 = [obj countByEnumeratingWithState:&v62 objects:v81 count:16];
        }
        while (v51);
      }

      v39 = [v8 statusBarManager];
      [v39 updateStatusBarAppearance];

      id v5 = v48;
      v14 = v47;
      if (v15)
      {
        v40 = [v15 windowScene];
        v41 = -[UIWindowScene _keyWindow](v40);

        if (!v41)
        {
          v42 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", (unint64_t *)&unk_1EB25F3F0) + 8);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = v42;
            v44 = (objc_class *)objc_opt_class();
            v45 = class_getName(v44);
            *(_DWORD *)buf = 136446466;
            v68 = v45;
            __int16 v69 = 2050;
            v70 = v15;
            _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_DEFAULT, "Migrating key window from placeholder scene to connecting default scene: %{public}s: %{public}p", buf, 0x16u);
          }
          -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v15, 1, 1);
        }
      }
    }
    if (_MergedGlobals_977)
    {
      [(id)_MergedGlobals_977 invalidate];
      v46 = (void *)_MergedGlobals_977;
      _MergedGlobals_977 = 0;
    }
  }
}

void _UIApplicationSceneConnectionHandler_block_invoke_2(uint64_t a1)
{
  if (dyld_program_sdk_at_least())
  {
    v2 = [*(id *)(a1 + 32) windowScene];
    if (v2 == *(void **)(a1 + 40))
    {
    }
    else
    {
      id v5 = v2;
      int v3 = [(id)UIApp _hasCalledRunWithMainScene];

      if (v3)
      {
        id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationLifecycle", &_UIApplicationSceneConnectionHandler_block_invoke_2___s_category)+ 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "UIWindows were created prior to initial application activation. This may result in incorrect visual appearance.", buf, 2u);
        }
      }
    }
  }
}

@end