@interface UIApplicationSceneDisconnectionHandler
@end

@implementation UIApplicationSceneDisconnectionHandler

void _UIApplicationSceneDisconnectionHandler_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = v2;
    if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0)
    {
      v6 = [(id)UIApp _defaultSceneIfExists];
      v7 = [v5 _FBSScene];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        if (([(id)UIApp isFrontBoard] & 1) == 0)
        {
          v9 = -[UIWindowScene _keyWindow]((id *)v5);
          v10 = [v5 screen];
          v11 = [v5 screen];
          v12 = +[UIWindowScene _placeholderWindowSceneForScreen:v11 create:1];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v31 = [MEMORY[0x1E4F28B00] currentHandler];
            v32 = [NSString stringWithUTF8String:"_UIApplicationSceneDisconnectionHandler_block_invoke_3"];
            [v31 handleFailureInFunction:v32, @"_UISceneConnectionActions.m", 141, @"Unexpected class for placeholder scene: %@", v12 file lineNumber description];
          }
          v13 = v12;
          v14 = -[_UIScreenBasedWindowScene _preventAutoInvalidationForReason:]((uint64_t)v13, @"default scene disconnected");
          objc_storeStrong((id *)&_MergedGlobals_977, v14);
          v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("ApplicationLifecycle", &qword_1EB25F3F8) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = (objc_class *)objc_opt_class();
            Name = class_getName(v17);
            v19 = (objc_class *)objc_opt_class();
            *(_DWORD *)buf = 136447746;
            v39 = Name;
            __int16 v40 = 2050;
            v41 = v5;
            __int16 v42 = 2082;
            v43 = class_getName(v19);
            __int16 v44 = 2050;
            v45 = v13;
            __int16 v46 = 2050;
            v47 = v10;
            __int16 v48 = 1024;
            int v49 = [v10 _isMainScreen];
            __int16 v50 = 1024;
            int v51 = [v10 _isMainLikeScreen];
            _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "Migrating windows from disconnecting default scene: %{public}s: %{public}p; to placeholder scene: %{public"
              "}s: %{public}p; screen: %{public}p, isMain: %d, isMainLike: %d",
              buf,
              0x40u);
          }
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          v20 = [v5 _allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v34;
            do
            {
              uint64_t v24 = 0;
              do
              {
                if (*(void *)v34 != v23) {
                  objc_enumerationMutation(v20);
                }
                [*(id *)(*((void *)&v33 + 1) + 8 * v24++) setWindowScene:v13];
              }
              while (v22 != v24);
              uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
            }
            while (v22);
          }

          if (v9)
          {
            v25 = -[UIWindowScene _keyWindow](v13);
            v26 = [v9 windowScene];

            if (!v25 && v26 == v13)
            {
              v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("KeyWindow", &qword_1EB25F400) + 8);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = v27;
                v29 = (objc_class *)objc_opt_class();
                v30 = class_getName(v29);
                *(_DWORD *)buf = 136446466;
                v39 = v30;
                __int16 v40 = 2050;
                v41 = v9;
                _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEFAULT, "Migrating key window from disconnecting default scene to placeholder scene: %{public}s: %{public}p", buf, 0x16u);
              }
              -[UIWindow _makeKeyWindowIgnoringOldKeyWindow:transferringScenes:](v9, 1, 1);
            }
          }
        }
      }
    }
  }
}

@end