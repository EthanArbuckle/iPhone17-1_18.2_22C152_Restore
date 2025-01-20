@interface NSNotificationCenter(SafariCoreExtras)
- (id)safari_addObserverForUserDefaultKey:()SafariCoreExtras queue:usingBlock:;
- (void)safari_addObserver:()SafariCoreExtras selector:forUserDefaultKey:;
- (void)safari_removeObserver:()SafariCoreExtras forUserDefaultKey:;
@end

@implementation NSNotificationCenter(SafariCoreExtras)

- (void)safari_addObserver:()SafariCoreExtras selector:forUserDefaultKey:
{
  v8 = (void *)MEMORY[0x1E4F1CB18];
  id v9 = a3;
  objc_msgSend(v8, "safari_notificationNameForUserDefaultsKey:", a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [a1 addObserver:v9 selector:a4 name:v10 object:0];
}

- (void)safari_removeObserver:()SafariCoreExtras forUserDefaultKey:
{
  v6 = (void *)MEMORY[0x1E4F1CB18];
  id v7 = a3;
  objc_msgSend(v6, "safari_notificationNameForUserDefaultsKey:", a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [a1 removeObserver:v7 name:v8 object:0];
}

- (id)safari_addObserverForUserDefaultKey:()SafariCoreExtras queue:usingBlock:
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F1CB18];
  id v11 = a4;
  v12 = objc_msgSend(v10, "safari_notificationNameForUserDefaultsKey:", v8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__NSNotificationCenter_SafariCoreExtras__safari_addObserverForUserDefaultKey_queue_usingBlock___block_invoke;
  v17[3] = &unk_1E615B8A0;
  id v18 = v8;
  id v19 = v9;
  id v13 = v8;
  id v14 = v9;
  v15 = [a1 addObserverForName:v12 object:0 queue:v11 usingBlock:v17];

  return v15;
}

@end