@interface NPKContinuityCoordinator
+ (id)sharedContinuityCoordinator;
- (NPKContinuityCoordinator)init;
- (NSUserActivity)currentUserActivity;
- (NSUserActivity)getPaymentPassesUserActivity;
- (NSUserActivity)individualPassUserActivity;
- (NSUserActivity)passListUserActivity;
- (NSUserActivity)provisionPassUserActivity;
- (NSUserActivity)setUpPeerPaymentUserActivity;
- (NSUserActivity)viewPeerPaymentUserActivity;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)_skeletonBridgeUserActivity;
- (id)userActivityForPassWithUniqueID:(id)a3;
- (void)_saveUserActivity:(id)a3;
- (void)dealloc;
- (void)invalidateAllActivities;
- (void)setCurrentUserActivity:(id)a3;
- (void)setGetPaymentPassesUserActivity:(id)a3;
- (void)setIndividualPassUserActivity:(id)a3;
- (void)setPassListUserActivity:(id)a3;
- (void)setProvisionPassUserActivity:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSetUpPeerPaymentUserActivity:(id)a3;
- (void)setViewPeerPaymentUserActivity:(id)a3;
- (void)userNeedsPaymentPasses;
- (void)userNeedsToProvisionPassWithUniqueID:(id)a3;
- (void)userNeedsToSetUpPeerPayment;
- (void)userNeedsToViewPeerPaymentForHandle:(id)a3;
- (void)userViewingPassList;
- (void)userViewingPassWithUniqueID:(id)a3 isPaymentPass:(BOOL)a4;
@end

@implementation NPKContinuityCoordinator

+ (id)sharedContinuityCoordinator
{
  if (sharedContinuityCoordinator_onceToken != -1) {
    dispatch_once(&sharedContinuityCoordinator_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedContinuityCoordinator_controller;
  return v2;
}

void __55__NPKContinuityCoordinator_sharedContinuityCoordinator__block_invoke()
{
  id v0 = [[NPKContinuityCoordinator alloc] _init];
  v1 = (void *)sharedContinuityCoordinator_controller;
  sharedContinuityCoordinator_controller = (uint64_t)v0;
}

- (NPKContinuityCoordinator)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "-[NPKContinuityCoordinator init]";
      __int16 v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKContinuityCoordinator.m";
      __int16 v9 = 2048;
      uint64_t v10 = 49;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Don't call -[NPKContinuityController init] but instead use singleton!)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)NPKContinuityCoordinator;
  v2 = [(NPKContinuityCoordinator *)&v6 init];
  if (v2)
  {
    BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.NanoPassKit.NPKContinuityCoordinator", v3);
    [(NPKContinuityCoordinator *)v2 setQueue:v4];
  }
  return v2;
}

- (void)dealloc
{
  BOOL v3 = [(NPKContinuityCoordinator *)self currentUserActivity];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)NPKContinuityCoordinator;
  [(NPKContinuityCoordinator *)&v4 dealloc];
}

- (void)userViewingPassList
{
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    int v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user is viewing pass list", buf, 2u);
    }
  }
  objc_super v6 = [(NPKContinuityCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__NPKContinuityCoordinator_userViewingPassList__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(v6, block);
}

void __47__NPKContinuityCoordinator_userViewingPassList__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) passListUserActivity];

  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D38]);
    BOOL v4 = (void *)[v3 initWithActivityType:*MEMORY[0x263F5C6A0]];
    [*(id *)(a1 + 32) setPassListUserActivity:v4];
  }
  id v5 = [*(id *)(a1 + 32) passListUserActivity];
  [*(id *)(a1 + 32) _saveUserActivity:v5];
}

- (void)userViewingPassWithUniqueID:(id)a3 isPaymentPass:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_super v6 = (char *)a3;
  if (!v6)
  {
    __int16 v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      __int16 v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v20 = "-[NPKContinuityCoordinator userViewingPassWithUniqueID:isPaymentPass:]";
        __int16 v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKContinuityCoordinator.m";
        __int16 v23 = 2048;
        uint64_t v24 = 78;
        __int16 v25 = 2080;
        v26 = "-[NPKContinuityCoordinator userViewingPassWithUniqueID:isPaymentPass:]";
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil uniqueID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  uint64_t v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v6;
      __int16 v21 = 1024;
      LODWORD(v22) = v4;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: User viewing pass with unique ID %@ (payment pass: %d)", buf, 0x12u);
    }
  }
  kdebug_trace();
  v13 = [(NPKContinuityCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__NPKContinuityCoordinator_userViewingPassWithUniqueID_isPaymentPass___block_invoke;
  block[3] = &unk_2644D3E10;
  BOOL v18 = v4;
  v16 = v6;
  v17 = self;
  v14 = v6;
  dispatch_async(v13, block);
}

void __70__NPKContinuityCoordinator_userViewingPassWithUniqueID_isPaymentPass___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    int v2 = *(unsigned __int8 *)(a1 + 48);
    id v3 = *(void **)(a1 + 40);
    if (v2)
    {
      BOOL v4 = [v3 provisionPassUserActivity];

      if (!v4)
      {
        id v5 = [*(id *)(a1 + 40) _skeletonBridgeUserActivity];
        [*(id *)(a1 + 40) setProvisionPassUserActivity:v5];
      }
      objc_super v6 = [*(id *)(a1 + 40) provisionPassUserActivity];
    }
    else
    {
      __int16 v7 = [v3 individualPassUserActivity];

      if (!v7)
      {
        id v8 = objc_alloc(MEMORY[0x263F08D38]);
        __int16 v9 = (void *)[v8 initWithActivityType:*MEMORY[0x263F5C930]];
        [*(id *)(a1 + 40) setIndividualPassUserActivity:v9];
      }
      objc_super v6 = [*(id *)(a1 + 40) individualPassUserActivity];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v12 = *MEMORY[0x263F5C928];
      v13[0] = v10;
      BOOL v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      [v6 addUserInfoEntriesFromDictionary:v11];
    }
    [*(id *)(a1 + 40) _saveUserActivity:v6];
  }
}

- (void)userNeedsToProvisionPassWithUniqueID:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v4 = (char *)a3;
  if (!v4)
  {
    id v5 = pk_General_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      __int16 v7 = pk_General_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v17 = "-[NPKContinuityCoordinator userNeedsToProvisionPassWithUniqueID:]";
        __int16 v18 = 2082;
        v19 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKContinuityCoordinator.m";
        __int16 v20 = 2048;
        uint64_t v21 = 104;
        __int16 v22 = 2080;
        __int16 v23 = "-[NPKContinuityCoordinator userNeedsToProvisionPassWithUniqueID:]";
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: %s cannot take nil uniqueID)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v4;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: User needs to provision pass with unique ID %@", buf, 0xCu);
    }
  }
  BOOL v11 = [(NPKContinuityCoordinator *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __65__NPKContinuityCoordinator_userNeedsToProvisionPassWithUniqueID___block_invoke;
  v13[3] = &unk_2644D2E08;
  v14 = v4;
  v15 = self;
  uint64_t v12 = v4;
  dispatch_async(v11, v13);
}

void __65__NPKContinuityCoordinator_userNeedsToProvisionPassWithUniqueID___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    int v2 = [*(id *)(a1 + 40) provisionPassUserActivity];

    if (!v2)
    {
      id v3 = [*(id *)(a1 + 40) _skeletonBridgeUserActivity];
      [*(id *)(a1 + 40) setProvisionPassUserActivity:v3];
    }
    BOOL v4 = [*(id *)(a1 + 40) provisionPassUserActivity];
    uint64_t v5 = *(void *)(a1 + 32);
    __int16 v7 = @"passUniqueID";
    v8[0] = v5;
    BOOL v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v4 addUserInfoEntriesFromDictionary:v6];

    [*(id *)(a1 + 40) _saveUserActivity:v4];
  }
}

- (void)userNeedsPaymentPasses
{
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user needs payment passes", buf, 2u);
    }
  }
  BOOL v6 = [(NPKContinuityCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NPKContinuityCoordinator_userNeedsPaymentPasses__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v6, block);
}

void __50__NPKContinuityCoordinator_userNeedsPaymentPasses__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) getPaymentPassesUserActivity];

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) _skeletonBridgeUserActivity];
    [*(id *)(a1 + 32) setGetPaymentPassesUserActivity:v3];
  }
  id v4 = [*(id *)(a1 + 32) getPaymentPassesUserActivity];
  [*(id *)(a1 + 32) _saveUserActivity:v4];
}

- (void)userNeedsToSetUpPeerPayment
{
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user needs to set up peer payment", buf, 2u);
    }
  }
  BOOL v6 = [(NPKContinuityCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NPKContinuityCoordinator_userNeedsToSetUpPeerPayment__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v6, block);
}

void __55__NPKContinuityCoordinator_userNeedsToSetUpPeerPayment__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) setUpPeerPaymentUserActivity];

  if (!v2)
  {
    id v3 = [*(id *)(a1 + 32) _skeletonBridgeUserActivity];
    [*(id *)(a1 + 32) setSetUpPeerPaymentUserActivity:v3];
  }
  id v4 = [*(id *)(a1 + 32) setUpPeerPaymentUserActivity];
  [*(id *)(a1 + 32) _saveUserActivity:v4];
}

- (void)userNeedsToViewPeerPaymentForHandle:(id)a3
{
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: user needs to view peer payment", buf, 2u);
    }
  }
  __int16 v7 = [(NPKContinuityCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v7, block);
}

void __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) viewPeerPaymentUserActivity];

  if (!v2)
  {
    uint64_t v10 = 0;
    BOOL v11 = &v10;
    uint64_t v12 = 0x2020000000;
    id v3 = (void **)getIMChatRegistryContinuityActivityTypeSymbolLoc_ptr;
    uint64_t v13 = getIMChatRegistryContinuityActivityTypeSymbolLoc_ptr;
    if (!getIMChatRegistryContinuityActivityTypeSymbolLoc_ptr)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getIMChatRegistryContinuityActivityTypeSymbolLoc_block_invoke;
      v9[3] = &unk_2644D30F8;
      v9[4] = &v10;
      __getIMChatRegistryContinuityActivityTypeSymbolLoc_block_invoke((uint64_t)v9);
      id v3 = (void **)v11[3];
    }
    _Block_object_dispose(&v10, 8);
    if (!v3) {
      __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke_cold_1();
    }
    id v4 = *v3;
    if (*v3)
    {
      BOOL v5 = (objc_class *)MEMORY[0x263F08D38];
      id v6 = v4;
      __int16 v7 = (void *)[[v5 alloc] initWithActivityType:v6];
      [*(id *)(a1 + 32) setViewPeerPaymentUserActivity:v7];
    }
  }
  id v8 = [*(id *)(a1 + 32) viewPeerPaymentUserActivity];
  [*(id *)(a1 + 32) _saveUserActivity:v8];
}

- (id)userActivityForPassWithUniqueID:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F08D38];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithActivityType:*MEMORY[0x263F5C930]];
  uint64_t v9 = *MEMORY[0x263F5C928];
  v10[0] = v4;
  __int16 v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [v6 addUserInfoEntriesFromDictionary:v7];
  return v6;
}

- (void)invalidateAllActivities
{
  id v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Continuity: invalidateAllActivities", buf, 2u);
    }
  }
  id v6 = [(NPKContinuityCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NPKContinuityCoordinator_invalidateAllActivities__block_invoke;
  block[3] = &unk_2644D2910;
  void block[4] = self;
  dispatch_async(v6, block);
}

uint64_t __51__NPKContinuityCoordinator_invalidateAllActivities__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) provisionPassUserActivity];
  [v2 invalidate];

  id v3 = [*(id *)(a1 + 32) getPaymentPassesUserActivity];
  [v3 invalidate];

  BOOL v4 = [*(id *)(a1 + 32) passListUserActivity];
  [v4 invalidate];

  id v5 = [*(id *)(a1 + 32) individualPassUserActivity];
  [v5 invalidate];

  [*(id *)(a1 + 32) setProvisionPassUserActivity:0];
  [*(id *)(a1 + 32) setGetPaymentPassesUserActivity:0];
  [*(id *)(a1 + 32) setPassListUserActivity:0];
  id v6 = *(void **)(a1 + 32);
  return [v6 setIndividualPassUserActivity:0];
}

- (id)_skeletonBridgeUserActivity
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263F08D38]) initWithActivityType:@"com.apple.nano.passbook.provisioning"];
  return v2;
}

- (void)_saveUserActivity:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    __int16 v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Saving user activity %@", (uint8_t *)&v27, 0xCu);
    }
  }
  id v8 = [(NPKContinuityCoordinator *)self currentUserActivity];

  if (v8 == v4)
  {
    __int16 v23 = pk_General_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

    if (v24)
    {
      __int16 v25 = pk_General_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [(NPKContinuityCoordinator *)self currentUserActivity];
        int v27 = 138412290;
        id v28 = v26;
        _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: New activity was already current, calling -becomeCurrent again: %@", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = [(NPKContinuityCoordinator *)self currentUserActivity];

    if (v9)
    {
      uint64_t v10 = pk_General_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (v11)
      {
        uint64_t v12 = pk_General_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [(NPKContinuityCoordinator *)self currentUserActivity];
          int v27 = 138412290;
          id v28 = v13;
          _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Invalidating old activity %@", (uint8_t *)&v27, 0xCu);
        }
      }
      v14 = [(NPKContinuityCoordinator *)self currentUserActivity];
      [v14 invalidate];

      v15 = [(NPKContinuityCoordinator *)self currentUserActivity];
      v16 = [(NPKContinuityCoordinator *)self provisionPassUserActivity];

      if (v15 == v16)
      {
        [(NPKContinuityCoordinator *)self setProvisionPassUserActivity:0];
      }
      else
      {
        v17 = [(NPKContinuityCoordinator *)self currentUserActivity];
        __int16 v18 = [(NPKContinuityCoordinator *)self getPaymentPassesUserActivity];

        if (v17 == v18)
        {
          [(NPKContinuityCoordinator *)self setGetPaymentPassesUserActivity:0];
        }
        else
        {
          v19 = [(NPKContinuityCoordinator *)self currentUserActivity];
          __int16 v20 = [(NPKContinuityCoordinator *)self passListUserActivity];

          if (v19 == v20)
          {
            [(NPKContinuityCoordinator *)self setPassListUserActivity:0];
          }
          else
          {
            uint64_t v21 = [(NPKContinuityCoordinator *)self currentUserActivity];
            __int16 v22 = [(NPKContinuityCoordinator *)self individualPassUserActivity];

            if (v21 == v22) {
              [(NPKContinuityCoordinator *)self setIndividualPassUserActivity:0];
            }
          }
        }
      }
    }
    [(NPKContinuityCoordinator *)self setCurrentUserActivity:v4];
  }
  [v4 becomeCurrent];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSUserActivity)provisionPassUserActivity
{
  return self->_provisionPassUserActivity;
}

- (void)setProvisionPassUserActivity:(id)a3
{
}

- (NSUserActivity)getPaymentPassesUserActivity
{
  return self->_getPaymentPassesUserActivity;
}

- (void)setGetPaymentPassesUserActivity:(id)a3
{
}

- (NSUserActivity)passListUserActivity
{
  return self->_passListUserActivity;
}

- (void)setPassListUserActivity:(id)a3
{
}

- (NSUserActivity)individualPassUserActivity
{
  return self->_individualPassUserActivity;
}

- (void)setIndividualPassUserActivity:(id)a3
{
}

- (NSUserActivity)setUpPeerPaymentUserActivity
{
  return self->_setUpPeerPaymentUserActivity;
}

- (void)setSetUpPeerPaymentUserActivity:(id)a3
{
}

- (NSUserActivity)viewPeerPaymentUserActivity
{
  return self->_viewPeerPaymentUserActivity;
}

- (void)setViewPeerPaymentUserActivity:(id)a3
{
}

- (NSUserActivity)currentUserActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentUserActivity);
  return (NSUserActivity *)WeakRetained;
}

- (void)setCurrentUserActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentUserActivity);
  objc_storeStrong((id *)&self->_viewPeerPaymentUserActivity, 0);
  objc_storeStrong((id *)&self->_setUpPeerPaymentUserActivity, 0);
  objc_storeStrong((id *)&self->_individualPassUserActivity, 0);
  objc_storeStrong((id *)&self->_passListUserActivity, 0);
  objc_storeStrong((id *)&self->_getPaymentPassesUserActivity, 0);
  objc_storeStrong((id *)&self->_provisionPassUserActivity, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __64__NPKContinuityCoordinator_userNeedsToViewPeerPaymentForHandle___block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  -[NPKProtoCheckInvitationStatusForMailboxAddressRequest writeTo:](v0);
}

@end