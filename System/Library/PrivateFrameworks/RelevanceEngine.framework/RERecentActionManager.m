@interface RERecentActionManager
- (BOOL)actionWasPerformedLocally:(id)a3;
- (id)_dataForAction:(id)a3;
- (id)_init;
- (id)lastPerformedDateForAction:(id)a3;
- (unint64_t)actionNumberOfTimesPeformedToday:(id)a3;
- (void)_handleRecentActionNotification:(id)a3;
- (void)_storePerformAction:(id)a3 date:(id)a4 remote:(BOOL)a5;
- (void)dealloc;
- (void)didPerformAction:(id)a3;
@end

@implementation RERecentActionManager

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)RERecentActionManager;
  v2 = [(RESingleton *)&v11 _init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)v2[1];
    v2[1] = v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)v2[2];
    v2[2] = v5;

    uint64_t v7 = +[REPredictedActionServer sharedInstance];
    v8 = (void *)v2[3];
    v2[3] = v7;

    v9 = [MEMORY[0x263F087C8] defaultCenter];
    [v9 addObserver:v2 selector:sel__handleRecentActionNotification_ name:@"RERecentDonatedActionWasPerformedNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F087C8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RERecentActionManager;
  [(RERecentActionManager *)&v4 dealloc];
}

- (void)didPerformAction:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  [(RERecentActionManager *)self _storePerformAction:v5 date:v6 remote:0];
}

- (void)_storePerformAction:(id)a3 date:(id)a4 remote:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_initWeak(&location, self);
    server = self->_server;
    objc_super v11 = [v8 bundleIdentifier];
    uint64_t v12 = [v8 actionIdentifier];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__RERecentActionManager__storePerformAction_date_remote___block_invoke;
    v13[3] = &unk_2644C0738;
    objc_copyWeak(&v16, &location);
    id v14 = v9;
    BOOL v17 = a5;
    id v15 = v8;
    [(REPredictedActionServer *)server fetchPerformedTodayCountForActionWithBundleIdentifer:v11 actionIdentifier:v12 completion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __57__RERecentActionManager__storePerformAction_date_remote___block_invoke(uint64_t a1, uint64_t a2)
{
  v19[1] = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = objc_opt_new();
    id v6 = v5;
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(v5, "setDate:");
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263EFF910] date];
      [v6 setDate:v7];
    }
    [v6 setRemote:*(unsigned __int8 *)(a1 + 56)];
    [v6 setCount:a2];
    [WeakRetained[1] lock];
    id v8 = [WeakRetained[2] objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v9 = v8;
    if (!v8) {
      goto LABEL_10;
    }
    if (([v8 remote] & 1) == 0 && *(unsigned char *)(a1 + 56)) {
      goto LABEL_9;
    }
    v10 = [v9 date];
    objc_super v11 = [v6 date];
    uint64_t v12 = [v10 laterDate:v11];
    v13 = [v9 date];
    char v17 = [v12 isEqualToDate:v13];

    if (v17)
    {
LABEL_9:
      [WeakRetained[1] unlock];
    }
    else
    {
LABEL_10:
      [WeakRetained[2] setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
      [WeakRetained[1] unlock];
      id v14 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v15 = *(void *)(a1 + 40);
      v18 = @"RERecentActionManagerUpdatedActionKey";
      v19[0] = v15;
      id v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v14 postNotificationName:@"RERecentActionManagerDidUpdateAction" object:0 userInfo:v16];
    }
  }
}

- (id)_dataForAction:(id)a3
{
  lock = self->_lock;
  id v5 = a3;
  [(NSLock *)lock lock];
  id v6 = [(NSMutableDictionary *)self->_dateValues objectForKeyedSubscript:v5];

  [(NSLock *)self->_lock unlock];
  return v6;
}

- (id)lastPerformedDateForAction:(id)a3
{
  uint64_t v3 = [(RERecentActionManager *)self _dataForAction:a3];
  objc_super v4 = [v3 date];

  return v4;
}

- (BOOL)actionWasPerformedLocally:(id)a3
{
  uint64_t v3 = [(RERecentActionManager *)self _dataForAction:a3];
  char v4 = [v3 remote] ^ 1;

  return v4;
}

- (unint64_t)actionNumberOfTimesPeformedToday:(id)a3
{
  uint64_t v3 = [(RERecentActionManager *)self _dataForAction:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)_handleRecentActionNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v11 = [v5 objectForKeyedSubscript:@"RERecentDonatedActionBundleIdentifierKey"];

  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"RERecentDonatedActionIdentifierKey"];

  id v8 = [v4 userInfo];

  id v9 = [v8 objectForKeyedSubscript:@"RERecentDonatedActionDateKey"];

  v10 = +[RERecentAction actionWithBundleIdentifier:actionIdentifier:](RERecentAction, "actionWithBundleIdentifier:actionIdentifier:", v11, [v7 unsignedLongLongValue]);
  [(RERecentActionManager *)self _storePerformAction:v10 date:v9 remote:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_dateValues, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end