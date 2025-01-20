@interface PSRootController
+ (BOOL)processedBundle:(id)a3 parentController:(id)a4 parentSpecifier:(id)a5 bundleControllers:(id *)a6 settings:(id)a7;
+ (id)readPreferenceValue:(id)a3;
+ (void)setPreferenceValue:(id)a3 specifier:(id)a4;
+ (void)writePreference:(id)a3;
- (BOOL)busy;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)deallocating;
- (BOOL)taskIsRunning:(id)a3;
- (PSRootController)initWithCoder:(id)a3;
- (PSRootController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (PSRootController)initWithRootViewController:(id)a3;
- (PSRootController)initWithTitle:(id)a3 identifier:(id)a4;
- (id)aggregateDictionaryPath;
- (id)contentViewForTopController;
- (id)parentController;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (id)readPreferenceValue:(id)a3;
- (id)specifier;
- (id)specifiers;
- (id)tasksDescription;
- (unint64_t)supportedInterfaceOrientations;
- (void)_delayedControllerReleaseAfterPop:(id)a3;
- (void)addTask:(id)a3;
- (void)commonInit;
- (void)dealloc;
- (void)didDismissFormSheetView;
- (void)didDismissPopupView;
- (void)didLock;
- (void)didUnlock;
- (void)didWake;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)logSettingsPath;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)sendWillBecomeActive;
- (void)sendWillResignActive;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)showLeftButton:(id)a3 withStyle:(int64_t)a4 rightButton:(id)a5 withStyle:(int64_t)a6;
- (void)statusBarWillChangeHeight:(id)a3;
- (void)suspend;
- (void)taskFinished:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissFormSheetView;
- (void)willDismissPopupView;
- (void)willUnlock;
@end

@implementation PSRootController

- (PSRootController)initWithTitle:(id)a3 identifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = _PSLoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[PSRootController initWithTitle:identifier:]";
    _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v10.receiver = self;
  v10.super_class = (Class)PSRootController;
  v7 = [(PSRootController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(PSRootController *)v7 setTitle:v5];
    [(PSRootController *)v8 commonInit];
  }

  return v8;
}

- (void)commonInit
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_sendWillBecomeActive name:*MEMORY[0x1E4F43648] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_sendWillResignActive name:*MEMORY[0x1E4F43710] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_statusBarWillChangeHeight_ name:*MEMORY[0x1E4F43700] object:0];

  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  tasks = self->_tasks;
  self->_tasks = v6;

  [(PSRootController *)self setDelegate:self];
}

- (void)sendWillBecomeActive
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _PSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[PSRootController sendWillBecomeActive]";
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(PSRootController *)self willBecomeActive];
  v4 = [(PSRootController *)self viewControllers];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_149];
}

- (id)aggregateDictionaryPath
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (PSIsRunningInAssistant())
  {
    v3 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v5 = (void *)MEMORY[0x1E4F1CA48];
    v6 = [(PSRootController *)self viewControllers];
    uint64_t v7 = [v5 arrayWithArray:v6];

    v8 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    v31 = [v8 invertedSet];

    v9 = [v7 firstObject];
    objc_super v10 = &selRef__keyboardWillShow_;
    int v11 = [v9 conformsToProtocol:&unk_1EFB7BC28];

    if (v11)
    {
      v12 = [v7 firstObject];
      uint64_t v13 = [v12 specifier];
      v14 = [v13 objectForKeyedSubscript:@"id"];

      if (!v14) {
        [v7 removeObject:v12];
      }
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      v30 = @"id";
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v20, "conformsToProtocol:", v10[78], v30))
          {
            v21 = v4;
            id v22 = v20;
            v23 = [v22 specifier];
            v24 = [v23 objectForKeyedSubscript:v30];

            v25 = [v24 lastPathComponent];

            if (!v25
              || [v25 rangeOfString:@"[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}" options:1025] != 0x7FFFFFFFFFFFFFFFLL)
            {

              v3 = 0;
              id v4 = v21;
              goto LABEL_20;
            }
            v26 = [v25 stringByReplacingCharactersInSet:v31 withCharacter:95];
            [v26 lowercaseString];
            v28 = v27 = v10;

            id v4 = v21;
            [v21 addObject:v28];

            objc_super v10 = v27;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    v3 = [v4 componentsJoinedByString:@"."];
LABEL_20:
  }
  return v3;
}

- (void)logSettingsPath
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1A6597000, a2, OS_LOG_TYPE_FAULT, "logSettingsPath \"%{public}@\": PSViewController's PSIDKey == nil AND identifier == nil. This breaks Settings' Search.", (uint8_t *)&v2, 0xCu);
}

+ (void)writePreference:(id)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 propertyForKey:@"key"];
  int v5 = [v3 propertyForKey:@"defaults"];
  v6 = [v3 propertyForKey:@"containerBundleID"];
  if (v5) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = _PSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6597000, v8, OS_LOG_TYPE_DEFAULT, "writePreference: bad dictionary", buf, 2u);
    }
  }
  else
  {
    uint64_t v9 = [v3 propertyForKey:@"value"];
    v8 = v9;
    if (v9
      || ([v3 propertyForKey:@"default"],
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v10 = [v3 propertyForKey:@"negate"];
      int v11 = [v10 BOOLValue];

      if (v11)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[NSObject BOOLValue](v8, "BOOLValue") ^ 1);

        v8 = v12;
      }
      if ([(__CFString *)v5 isEqualToString:@"STANDARD"])
      {
        uint64_t v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v13 setObject:v8 forKey:v4];
        [v13 synchronize];
      }
      else
      {
        v14 = [v3 propertyForKey:@"isPerGizmo"];
        int v15 = [v14 BOOLValue];

        int v41 = v15;
        if (v15)
        {
          uint64_t v16 = (void *)[objc_alloc((Class)getNPSDomainAccessorClass()) initWithDomain:v5];
          uint64_t v17 = v16;
          if (v16)
          {
            [v16 setObject:v8 forKey:v4];
            id v18 = (id)[v17 synchronize];
          }
          else
          {
            NSLog(&cfstr_FailedToInstan.isa, v5);
          }
        }
        else
        {
          v19 = [v3 propertyForKey:@"appGroupBundleID"];

          if (v19 && v6)
          {
            v40 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v5];
            v20 = [v40 groupContainerURLs];
            v21 = [v3 propertyForKey:@"appGroupBundleID"];
            id v22 = [v20 objectForKey:v21];
            v23 = [v22 path];

            _CFPreferencesSetAppValueWithContainer();
            _CFPreferencesAppSynchronizeWithContainer();
          }
          else
          {
            if (v6)
            {
              v24 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v6];
              v25 = [v24 dataContainerURL];
              v26 = [v25 path];

              _CFPreferencesSetAppValueWithContainer();
              _CFPreferencesAppSynchronizeWithContainer();
            }
            else
            {
              CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
              CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
              CFPreferencesSetValue(v4, v8, v5, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
              CFPreferencesSynchronize(v5, v27, v28);
            }
            GSSendAppPreferencesChanged();
          }
        }
        v29 = [v3 propertyForKey:@"notifyNano"];
        int v30 = [v29 BOOLValue];

        if (v30)
        {
          uint64_t v47 = 0;
          v48 = &v47;
          uint64_t v49 = 0x2050000000;
          v31 = (void *)getNPSManagerClass_softClass;
          uint64_t v50 = getNPSManagerClass_softClass;
          if (!getNPSManagerClass_softClass)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            uint64_t v43 = 3221225472;
            v44 = __getNPSManagerClass_block_invoke;
            v45 = &unk_1E5C5D4D8;
            v46 = &v47;
            __getNPSManagerClass_block_invoke((uint64_t)buf);
            v31 = (void *)v48[3];
          }
          id v32 = v31;
          _Block_object_dispose(&v47, 8);
          long long v33 = objc_opt_new();
          if (v41)
          {
            long long v34 = (void *)MEMORY[0x1E4F1CAD0];
            v51[0] = v4;
            long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
            v36 = [v34 setWithArray:v35];
            [v33 synchronizeNanoDomain:v5 keys:v36];
          }
          else
          {
            long long v35 = [v3 propertyForKey:@"containerBundleID"];
            v36 = [v3 propertyForKey:@"appGroupBundleID"];
            uint64_t v37 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
            [v33 synchronizeUserDefaultsDomain:v5 keys:v37 container:v35 appGroupContainer:v36];
          }
        }
      }
      v38 = [v3 propertyForKey:@"PostNotification"];

      if (v38)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)[v3 propertyForKey:@"PostNotification"], 0, 0, 1u);
      }
    }
  }
}

+ (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (v8)
  {
    v6 = [v5 propertyForKey:@"value"];
    char v7 = [v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [v5 setProperty:v8 forKey:@"value"];
      +[PSRootController writePreference:v5];
    }
  }
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
}

+ (id)readPreferenceValue:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 propertyForKey:@"defaults"];
  id v5 = [v3 propertyForKey:@"containerBundleID"];
  uint64_t v6 = [v3 propertyForKey:@"key"];
  char v7 = (__CFString *)v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    goto LABEL_6;
  }
  if ([(__CFString *)v4 isEqualToString:@"STANDARD"])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v10 = [v9 objectForKey:v7];
    if (v10
      || ([v3 propertyForKey:@"default"], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v11 = (void *)v10;
      uint64_t v12 = [v3 propertyForKey:@"negate"];
      int v13 = [v12 BOOLValue];

      if (v13)
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v11, "BOOLValue") ^ 1);

        int v11 = (void *)v14;
      }
      [v3 setProperty:v11 forKey:@"value"];

LABEL_32:
      uint64_t v9 = [v3 propertyForKey:@"value"];
      goto LABEL_33;
    }

LABEL_6:
    uint64_t v9 = 0;
    goto LABEL_33;
  }
  int v15 = [v3 propertyForKey:@"isPerGizmo"];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    uint64_t v17 = (void *)[objc_alloc((Class)getNPSDomainAccessorClass()) initWithDomain:v4];
    id v18 = v17;
    if (v17)
    {
      uint64_t v9 = [v17 objectForKey:v7];
    }
    else
    {
      NSLog(&cfstr_FailedToInstan.isa, v4);
      uint64_t v9 = 0;
    }
  }
  else
  {
    v19 = [v3 propertyForKey:@"appGroupBundleID"];

    if (v19) {
      BOOL v20 = v5 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20)
    {
      if (!v5)
      {
        uint64_t v9 = (void *)CFPreferencesCopyValue(v7, v4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
        if (v9) {
          goto LABEL_29;
        }
        goto LABEL_25;
      }
      id v18 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v5 placeholder:0];
      v21 = [v18 dataContainerURL];
      id v22 = [v21 path];

      uint64_t v9 = (void *)_CFPreferencesCopyAppValueWithContainer();
    }
    else
    {
      id v18 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v4];
      v23 = [v18 groupContainerURLs];
      v24 = [v3 propertyForKey:@"appGroupBundleID"];
      v25 = [v23 objectForKey:v24];
      v26 = [v25 path];

      uint64_t v9 = (void *)_CFPreferencesCopyAppValueWithContainer();
    }
  }

  if (v9)
  {
LABEL_29:
    CFStringRef v27 = [v3 propertyForKey:@"negate"];
    int v28 = [v27 BOOLValue];

    if (v28)
    {
      uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v9, "BOOLValue") ^ 1);

      uint64_t v9 = (void *)v29;
    }
    [v3 setProperty:v9 forKey:@"value"];
    goto LABEL_32;
  }
LABEL_25:
  uint64_t v9 = [v3 propertyForKey:@"default"];
  if (v9) {
    goto LABEL_29;
  }
LABEL_33:

  return v9;
}

- (id)readPreferenceValue:(id)a3
{
  return +[PSRootController readPreferenceValue:a3];
}

- (PSRootController)initWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _PSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[PSRootController initWithCoder:]";
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSRootController;
  uint64_t v6 = [(PSRootController *)&v8 initWithCoder:v4];

  if (v6) {
    [(PSRootController *)v6 commonInit];
  }
  return v6;
}

- (PSRootController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v13 = "-[PSRootController initWithNavigationBarClass:toolbarClass:]";
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)PSRootController;
  objc_super v8 = [(PSRootController *)&v11 initWithNavigationBarClass:a3 toolbarClass:a4];
  uint64_t v9 = v8;
  if (v8) {
    [(PSRootController *)v8 commonInit];
  }
  return v9;
}

- (PSRootController)initWithRootViewController:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _PSLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[PSRootController initWithRootViewController:]";
    _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSRootController;
  uint64_t v6 = [(PSRootController *)&v8 initWithRootViewController:v4];

  if (v6) {
    [(PSRootController *)v6 commonInit];
  }
  return v6;
}

- (id)tasksDescription
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_tasks;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
        [v3 appendFormat:@"%@\n", v9];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)taskIsRunning:(id)a3
{
  return [(NSMutableSet *)self->_tasks containsObject:a3];
}

- (void)addTask:(id)a3
{
  id v4 = a3;
  [(PSRootController *)self busy];
  [(NSMutableSet *)self->_tasks addObject:v4];
}

- (void)taskFinished:(id)a3
{
  [(NSMutableSet *)self->_tasks removeObject:a3];
  if (![(PSRootController *)self busy])
  {
    id v4 = [MEMORY[0x1E4F42738] sharedApplication];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [MEMORY[0x1E4F42738] sharedApplication];
      [v6 performSelector:sel_controllerFinished_ withObject:self afterDelay:0.001];
    }
  }
}

- (BOOL)busy
{
  return [(NSMutableSet *)self->_tasks count] != 0;
}

- (id)contentViewForTopController
{
  id v3 = [(PSRootController *)self topViewController];
  id v4 = v3;
  if (!v3) {
    id v3 = self;
  }
  char v5 = [v3 view];

  return v5;
}

- (id)specifiers
{
  return 0;
}

- (void)setSpecifier:(id)a3
{
  char v5 = (PSSpecifier *)a3;
  p_specifier = &self->_specifier;
  if (self->_specifier != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_specifier, a3);
    char v5 = v7;
  }
  MEMORY[0x1F41817F8](p_specifier, v5);
}

- (id)specifier
{
  return self->_specifier;
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(PSRootController *)self childViewControllers];
  if ([v7 containsObject:v6])
  {
    objc_super v8 = _PSLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PSRootController showController:animate:](v8);
    }

    uint64_t v9 = _PSLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PSRootController showController:animate:]();
    }

    uint64_t v10 = _PSLoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PSRootController showController:animate:]();
    }
  }
  if ([v6 conformsToProtocol:&unk_1EFB7BC28])
  {
    [v6 setParentController:self];
    [v6 setRootController:self];
  }
  if (v4) {
    [(PSRootController *)self showViewController:v6 sender:self];
  }
  else {
    [(PSRootController *)self pushViewController:v6 animated:0];
  }
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  [(PSRootController *)self handleURL:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)showLeftButton:(id)a3 withStyle:(int64_t)a4 rightButton:(id)a5 withStyle:(int64_t)a6
{
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F427C0];
  id v11 = a5;
  id v12 = a3;
  id v18 = objc_alloc_init(v10);
  [v18 setTitle:v12];

  [v18 setStyle:a4];
  id v13 = objc_alloc_init(MEMORY[0x1E4F427C0]);
  [v13 setTitle:v11];

  [v13 setStyle:a6];
  long long v14 = [(PSRootController *)self navigationBar];
  int v15 = [v14 topItem];
  [v15 setRightBarButtonItem:v13];

  uint64_t v16 = [(PSRootController *)self navigationBar];
  uint64_t v17 = [v16 topItem];
  [v17 setLeftBarButtonItem:v18];
}

- (void)statusBarWillChangeHeight:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 userInfo];
  char v5 = [MEMORY[0x1E4F42738] sharedApplication];
  id v6 = [v5 statusBar];

  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F436C8]];
  objc_super v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    v24 = v4;
    [v6 frame];
    double v11 = v10;
    [v6 frame];
    if (v11 >= v12) {
      double v13 = v12;
    }
    else {
      double v13 = v11;
    }
    [v8 CGRectValue];
    double v15 = v14;
    [v8 CGRectValue];
    long long v25 = 0u;
    long long v26 = 0u;
    if (v15 >= v16) {
      double v15 = v16;
    }
    long long v27 = 0uLL;
    long long v28 = 0uLL;
    uint64_t v17 = [(PSRootController *)self viewControllers];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      double v20 = v13 - v15;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v17);
          }
          v23 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v23 conformsToProtocol:&unk_1EFB7BC28]
            && (objc_opt_respondsToSelector() & 1) != 0)
          {
            [v23 statusBarWillAnimateByHeight:v20];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    BOOL v4 = v24;
  }
}

- (void)sendWillResignActive
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _PSLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[PSRootController sendWillResignActive]";
    _os_log_impl(&dword_1A6597000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(PSRootController *)self willResignActive];
  BOOL v4 = [(PSRootController *)self viewControllers];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_12];
}

void __40__PSRootController_sendWillResignActive__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 willResignActive];
  }
}

void __40__PSRootController_sendWillBecomeActive__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 willBecomeActive];
  }
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedOrientationsOverride = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result = self->_supportedOrientationsOverride;
  if (!result) {
    return PSSupportedOrientations();
  }
  return result;
}

- (void)suspend
{
  id v2 = [(PSRootController *)self viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_152];
}

void __27__PSRootController_suspend__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 suspend];
  }
}

- (void)didLock
{
  id v2 = [(PSRootController *)self viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_155];
}

void __27__PSRootController_didLock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 didLock];
  }
}

- (void)willUnlock
{
  id v2 = [(PSRootController *)self viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_158];
}

void __30__PSRootController_willUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 willUnlock];
  }
}

- (void)didUnlock
{
  id v2 = [(PSRootController *)self viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_161];
}

void __29__PSRootController_didUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 didUnlock];
  }
}

- (void)didWake
{
  id v2 = [(PSRootController *)self viewControllers];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_164];
}

void __27__PSRootController_didWake__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if [v2 conformsToProtocol:&unk_1EFB7BC28] && (objc_opt_respondsToSelector()) {
    [v2 didWake];
  }
}

- (BOOL)deallocating
{
  return self->_deallocating;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  self->_deallocating = 1;
  if ([(PSRootController *)self isViewLoaded])
  {
    BOOL v4 = [(PSRootController *)self view];
    int v5 = [v4 firstResponder];
    [v5 resignFirstResponder];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(PSRootController *)self viewControllers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&unk_1EFB7BC28]) {
          [v11 setRootController:0];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 removeObserver:self];

  v13.receiver = self;
  v13.super_class = (Class)PSRootController;
  [(PSRootController *)&v13 dealloc];
}

- (id)parentController
{
  return 0;
}

+ (BOOL)processedBundle:(id)a3 parentController:(id)a4 parentSpecifier:(id)a5 bundleControllers:(id *)a6 settings:(id)a7
{
  return ProcessedSpecifierBundle(a3, a4, a4, a6, a7);
}

- (void)willDismissPopupView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PSRootController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 popupViewWillDisappear];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(v2, "childViewControllers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 popupViewWillDisappear];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)didDismissPopupView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PSRootController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 popupViewDidDisappear];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(v2, "childViewControllers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 popupViewDidDisappear];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)willDismissFormSheetView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PSRootController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 formSheetViewWillDisappear];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(v2, "childViewControllers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 formSheetViewWillDisappear];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)didDismissFormSheetView
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(PSRootController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 formSheetViewDidDisappear];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(v2, "childViewControllers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 formSheetViewDidDisappear];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)_delayedControllerReleaseAfterPop:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  dispatch_time_t v5 = dispatch_time(0, 360000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke;
  block[3] = &unk_1E5C5D680;
  id v6 = v4;
  id v24 = v6;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
  uint64_t v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 addPointer:*(void *)(*((void *)&v19 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v10);
  }

  objc_super v13 = [MEMORY[0x1E4F42948] currentDevice];
  int v14 = objc_msgSend(v13, "sf_isInternalInstall");

  if (v14)
  {
    dispatch_time_t v15 = dispatch_time(0, 15000000000);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_188;
    v17[3] = &unk_1E5C5D680;
    id v18 = v7;
    long long v16 = (void *)MEMORY[0x1E4F14428];
    dispatch_after(v15, MEMORY[0x1E4F14428], v17);
  }
}

uint64_t __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    *(void *)&long long v3 = 138543362;
    long long v8 = v3;
    do
    {
      uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "lastObject", v8);
      dispatch_time_t v5 = _PSLoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = objc_opt_class();
        *(_DWORD *)buf = v8;
        uint64_t v10 = v6;
        id v7 = v6;
        _os_log_impl(&dword_1A6597000, v5, OS_LOG_TYPE_DEFAULT, "Delayed release after nav pop: %{public}@", buf, 0xCu);
      }
      [*(id *)(a1 + 32) removeLastObject];

      uint64_t result = [*(id *)(a1 + 32) count];
    }
    while (result);
  }
  return result;
}

void __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_188(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F42FF8];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_2;
  v2[3] = &unk_1E5C5E188;
  id v3 = *(id *)(a1 + 32);
  [v1 _traverseViewControllerHierarchy:v2];
}

void __54__PSRootController__delayedControllerReleaseAfterPop___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [*(id *)(a1 + 32) allObjects];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (*(id *)(*((void *)&v13 + 1) + 8 * v10) == v5)
          {
            uint64_t v11 = _PSLoggingFacility();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              id v18 = "-[PSRootController _delayedControllerReleaseAfterPop:]_block_invoke_2";
              __int16 v19 = 2112;
              id v20 = v5;
              _os_log_error_impl(&dword_1A6597000, v11, OS_LOG_TYPE_ERROR, "%s: View controller %@ still exists 15s after being popped from nav stack.", buf, 0x16u);
            }

            uint64_t v12 = _PSLoggingFacility();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              id v18 = "-[PSRootController _delayedControllerReleaseAfterPop:]_block_invoke";
              __int16 v19 = 2112;
              id v20 = v5;
              _os_log_fault_impl(&dword_1A6597000, v12, OS_LOG_TYPE_FAULT, "%s: View controller %@ still exists 15s after being popped from nav stack.", buf, 0x16u);
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PSRootController;
  uint64_t v4 = [(PSRootController *)&v13 popViewControllerAnimated:a3];
  if ([v4 conformsToProtocol:&unk_1EFB7BC28])
  {
    id v5 = [v4 parentController];
    id v6 = [v4 rootController];
    [v4 setParentController:0];
    [v4 setRootController:0];
    uint64_t v7 = [(PSRootController *)self transitionCoordinator];
    if (v7)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __46__PSRootController_popViewControllerAnimated___block_invoke;
      v9[3] = &unk_1E5C5E1B0;
      id v10 = v4;
      id v11 = v5;
      id v12 = v6;
      [v7 notifyWhenInteractionChangesUsingBlock:v9];
    }
  }
  return v4;
}

uint64_t __46__PSRootController_popViewControllerAnimated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    [*(id *)(a1 + 32) setParentController:*(void *)(a1 + 40)];
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    return [v4 setRootController:v5];
  }
  return result;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PSRootController;
  uint64_t v5 = [(PSRootController *)&v16 popToViewController:a3 animated:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 conformsToProtocol:&unk_1EFB7BC28])
        {
          [v10 setRootController:0];
          [v10 setParentController:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
  [(PSRootController *)self _delayedControllerReleaseAfterPop:v5];
  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PSRootController;
  uint64_t v4 = [(PSRootController *)&v15 popToRootViewControllerAnimated:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1EFB7BC28])
        {
          [v9 setRootController:0];
          [v9 setParentController:0];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
  [(PSRootController *)self _delayedControllerReleaseAfterPop:v4];
  return v4;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [(PSRootController *)self viewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v12 conformsToProtocol:&unk_1EFB7BC28])
        {
          [v12 setRootController:0];
          [v12 setParentController:0];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  long long v13 = self;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  objc_super v16 = v13;
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v25;
    objc_super v16 = v13;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        if ([v20 conformsToProtocol:&unk_1EFB7BC28])
        {
          [v20 setRootController:v13];
          [v20 setParentController:v16];
          long long v21 = v20;

          objc_super v16 = v21;
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  uint64_t v22 = [(PSRootController *)v13 viewControllers];
  [(PSRootController *)v13 _delayedControllerReleaseAfterPop:v22];

  v23.receiver = v13;
  v23.super_class = (Class)PSRootController;
  [(PSRootController *)&v23 setViewControllers:v14 animated:v4];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v20 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F28EA0];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a3;
  uint64_t v10 = [v9 disappearingViewController];
  long long v11 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v12 = [v9 lastOperation];

  long long v13 = [v11 numberWithInt:v12];
  id v14 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v20, @"appearing", v10, @"disappearing", v13, @"operation", 0);
  uint64_t v15 = [v7 notificationWithName:@"PSNavigationControllerWillShow" object:self userInfo:v14];

  objc_super v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 postNotification:v15];

  uint64_t v17 = [(PSRootController *)self viewControllers];
  LODWORD(v7) = [v17 containsObject:v20];

  if (v7)
  {
    uint64_t v18 = (objc_class *)objc_opt_class();
    __int16 v19 = NSStringFromClass(v18);
    [MEMORY[0x1E4F9AA08] trackingViewControllersVisitedInRootController:v19];
    [(PSRootController *)self logSettingsPath];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PSRootController *)self isMovingFromParentViewController]
    && !v3)
  {
    uint64_t v5 = [(PSRootController *)self topViewController];
    id v6 = [v5 navigationItem];
    [v6 setSearchController:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)PSRootController;
  [(PSRootController *)&v7 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(PSRootController *)self isMovingFromParentViewController])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(PSRootController *)self viewControllers];
    id v6 = [v5 reverseObjectEnumerator];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v10++) viewDidDisappear:v3];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(PSRootController *)self setViewControllers:MEMORY[0x1E4F1CBF0]];
  }
  v11.receiver = self;
  v11.super_class = (Class)PSRootController;
  [(PSRootController *)&v11 viewDidDisappear:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (void)showController:animate:.cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_5(&dword_1A6597000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);
}

- (void)showController:animate:.cold.2()
{
  v0 = [MEMORY[0x1E4F42FF8] _printHierarchy];
  OUTLINED_FUNCTION_5(&dword_1A6597000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);
}

- (void)showController:(os_log_t)log animate:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[PSRootController showController:animate:]";
  _os_log_error_impl(&dword_1A6597000, log, OS_LOG_TYPE_ERROR, "%s: pushing a view controller that's already in the stack.", (uint8_t *)&v1, 0xCu);
}

@end