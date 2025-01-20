@interface FBSScene(PosterUIFoundation)
- (id)pui_forwardKeyboardFocusToClientScene:()PosterUIFoundation;
@end

@implementation FBSScene(PosterUIFoundation)

- (id)pui_forwardKeyboardFocusToClientScene:()PosterUIFoundation
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v5 = [v4 clientHandle];
    v6 = [v4 identityToken];
    v7 = [v6 stringRepresentation];

    v8 = [a1 identityToken];
    v9 = [v8 stringRepresentation];

    if (v5 && v7 && v9)
    {
      uint64_t v10 = [MEMORY[0x263F29828] tokenForString:v9];
      v11 = (void *)[MEMORY[0x263F29880] new];
      v12 = [MEMORY[0x263F29820] keyboardFocusEnvironment];
      [v11 setEnvironment:v12];

      v13 = v11;
      v29 = v10;
      [v11 setToken:v10];
      v14 = (void *)[MEMORY[0x263F29888] new];
      v15 = [v5 processHandle];
      uint64_t v16 = [v15 pid];

      [v14 setPid:v16];
      v17 = [MEMORY[0x263F29828] tokenForString:v7];
      [v14 setToken:v17];

      v18 = PUILogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138544386;
        v31 = v20;
        __int16 v32 = 2050;
        v33 = a1;
        __int16 v34 = 2114;
        v35 = v9;
        __int16 v36 = 2114;
        v37 = v7;
        __int16 v38 = 1026;
        int v39 = v16;
        _os_log_impl(&dword_25A0AF000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@-%{public}p: host scene %{public}@ deferring keyboard events to client %{public}@ with PID: %{public}d", buf, 0x30u);
      }
      v21 = [MEMORY[0x263F29830] sharedInstance];
      v22 = NSString;
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      v25 = [v22 stringWithFormat:@"%@-%p deferring to hosted scene", v24, a1];
      v26 = [v21 deferEventsMatchingPredicate:v13 toTarget:v14 withReason:v25];

      v27 = v29;
    }
    else
    {
      v27 = PUILogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        [(FBSScene(PosterUIFoundation) *)(uint64_t)a1 pui_forwardKeyboardFocusToClientScene:v27];
      }
      v26 = 0;
    }
  }
  else
  {
    v5 = PUILogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[FBSScene(PosterUIFoundation) pui_forwardKeyboardFocusToClientScene:]((uint64_t)a1, v5);
    }
    v26 = 0;
  }

  return v26;
}

- (void)pui_forwardKeyboardFocusToClientScene:()PosterUIFoundation .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138544130;
  v9 = v7;
  __int16 v10 = 2050;
  uint64_t v11 = a1;
  __int16 v12 = 2114;
  uint64_t v13 = a1;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_25A0AF000, a3, OS_LOG_TYPE_ERROR, "%{public}@-%{public}p: could not acquire keyboard focus deferring assertion. HostScene: %{public}@. TargetScene: %{public}@", (uint8_t *)&v8, 0x2Au);
}

- (void)pui_forwardKeyboardFocusToClientScene:()PosterUIFoundation .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_ERROR, "%{public}@: Cannot acquire keyboard focus assertion off the main thread.", (uint8_t *)&v5, 0xCu);
}

@end