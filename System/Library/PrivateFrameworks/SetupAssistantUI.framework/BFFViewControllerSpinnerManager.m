@interface BFFViewControllerSpinnerManager
+ (void)configureWithNavigationController:(id)a3;
+ (void)startAnimatingSpinnerFor:(id)a3 identifier:(id)a4;
+ (void)stopAnimatingSpinnerFor:(id)a3;
@end

@implementation BFFViewControllerSpinnerManager

+ (void)configureWithNavigationController:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08B88] currentThread];
  v5 = [MEMORY[0x263F08B88] mainThread];

  if (v4 == v5)
  {
    +[BFFViewControllerSpinnerManagerObjc configureWithNavigationController:v3];
  }
  else
  {
    v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[BFFViewControllerSpinnerManager configureWithNavigationController:](v6);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__BFFViewControllerSpinnerManager_configureWithNavigationController___block_invoke;
    block[3] = &unk_26454AAC8;
    id v8 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __69__BFFViewControllerSpinnerManager_configureWithNavigationController___block_invoke(uint64_t a1)
{
  return +[BFFViewControllerSpinnerManagerObjc configureWithNavigationController:*(void *)(a1 + 32)];
}

+ (void)startAnimatingSpinnerFor:(id)a3 identifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F08B88] currentThread];
  id v8 = [MEMORY[0x263F08B88] mainThread];

  if (v7 == v8)
  {
    if (v5)
    {
      +[BFFViewControllerSpinnerManagerObjc startAnimatingSpinnerFor:v5 identifier:v6];
    }
    else
    {
      v16 = _BYLoggingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:]((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    v9 = _BYLoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:]((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __71__BFFViewControllerSpinnerManager_startAnimatingSpinnerFor_identifier___block_invoke;
    v23[3] = &unk_26454AAF0;
    id v24 = v5;
    id v25 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v23);
  }
}

uint64_t __71__BFFViewControllerSpinnerManager_startAnimatingSpinnerFor_identifier___block_invoke(uint64_t a1)
{
  return +[BFFViewControllerSpinnerManagerObjc startAnimatingSpinnerFor:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40)];
}

+ (void)stopAnimatingSpinnerFor:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F08B88] currentThread];
  id v5 = [MEMORY[0x263F08B88] mainThread];

  if (v4 == v5)
  {
    +[BFFViewControllerSpinnerManagerObjc stopAnimatingSpinnerFor:v3];
  }
  else
  {
    id v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:]((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__BFFViewControllerSpinnerManager_stopAnimatingSpinnerFor___block_invoke;
    block[3] = &unk_26454AAC8;
    id v14 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __59__BFFViewControllerSpinnerManager_stopAnimatingSpinnerFor___block_invoke(uint64_t a1)
{
  return +[BFFViewControllerSpinnerManagerObjc stopAnimatingSpinnerFor:*(void *)(a1 + 32)];
}

+ (void)configureWithNavigationController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21FF9E000, log, OS_LOG_TYPE_FAULT, "BFFViewControllerSpinnerManager.configureWithNavigationController needs to be called on the main thread.", v1, 2u);
}

+ (void)startAnimatingSpinnerFor:(uint64_t)a3 identifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)startAnimatingSpinnerFor:(uint64_t)a3 identifier:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)stopAnimatingSpinnerFor:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end