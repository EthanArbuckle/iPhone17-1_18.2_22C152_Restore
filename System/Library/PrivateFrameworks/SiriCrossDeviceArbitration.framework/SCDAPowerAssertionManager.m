@interface SCDAPowerAssertionManager
- (SCDAPowerAssertionManager)initWithIdentifier:(id)a3;
- (void)_createPowerAssertion;
- (void)_releasePowerAssertion;
- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5;
- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5;
- (void)dealloc;
- (void)releaseAllPowerAssertions;
- (void)releasePowerAssertionWithName:(id)a3;
- (void)takePowerAssertionWithName:(id)a3;
@end

@implementation SCDAPowerAssertionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionsByName, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_releasePowerAssertion
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    int v8 = 136315650;
    v9 = "-[SCDAPowerAssertionManager _releasePowerAssertion]";
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2112;
    v13 = identifier;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", (uint8_t *)&v8, 0x20u);
  }
  IOPMAssertionID powerAssertion = self->_powerAssertion;
  if (powerAssertion)
  {
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = self->_identifier;
      int v8 = 136315906;
      v9 = "-[SCDAPowerAssertionManager _releasePowerAssertion]";
      __int16 v10 = 2048;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v7;
      __int16 v14 = 1024;
      IOPMAssertionID v15 = powerAssertion;
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s %p (%@) Released power assertion ID %u.", (uint8_t *)&v8, 0x26u);
      IOPMAssertionID powerAssertion = self->_powerAssertion;
    }
    IOPMAssertionRelease(powerAssertion);
    self->_IOPMAssertionID powerAssertion = 0;
  }
}

- (void)_createPowerAssertion
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_powerAssertion)
  {
    uint64_t v3 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO)) {
      return;
    }
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    IOPMAssertionID v15 = "-[SCDAPowerAssertionManager _createPowerAssertion]";
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2112;
    v19 = identifier;
    v5 = "%s %p (%@) powerAssertion != kIOPMNullAssertionID";
    v6 = v3;
    uint32_t v7 = 32;
    goto LABEL_4;
  }
  IOPMAssertionID AssertionID = 0;
  if (IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, (CFStringRef)self->_identifier, &AssertionID))
  {
    int v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v9 = self->_identifier;
      *(_DWORD *)buf = 136315650;
      IOPMAssertionID v15 = "-[SCDAPowerAssertionManager _createPowerAssertion]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_error_impl(&dword_25C707000, v8, OS_LOG_TYPE_ERROR, "%s %p (%@) Failed to create power assertion.", buf, 0x20u);
    }
  }
  else
  {
    IOPMAssertionID v10 = AssertionID;
    self->_IOPMAssertionID powerAssertion = AssertionID;
    uint64_t v11 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      __int16 v12 = self->_identifier;
      *(_DWORD *)buf = 136315906;
      IOPMAssertionID v15 = "-[SCDAPowerAssertionManager _createPowerAssertion]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2112;
      v19 = v12;
      __int16 v20 = 1024;
      IOPMAssertionID v21 = v10;
      v5 = "%s %p (%@) Created power assertion with ID %u.";
      v6 = v11;
      uint32_t v7 = 38;
LABEL_4:
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
    }
  }
}

- (void)assertionCoordinator:(id)a3 didDeactivateAssertion:(id)a4 isLastAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v8 = (SCDAAssertionCoordinator *)a3;
  v9 = (SCDAAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  uint64_t v11 = SCDALogContextCore;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      int v14 = 136316162;
      IOPMAssertionID v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2112;
      v19 = identifier;
      __int16 v20 = 2112;
      IOPMAssertionID v21 = v9;
      __int16 v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isLastAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5) {
        goto LABEL_7;
      }
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    [(SCDAPowerAssertionManager *)self _releasePowerAssertion];
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = self->_identifier;
    int v14 = 136316162;
    IOPMAssertionID v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didDeactivateAssertion:isLastAssertion:]";
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    IOPMAssertionID v21 = assertionCoordinator;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_25C707000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:
}

- (void)assertionCoordinator:(id)a3 didActivateAssertion:(id)a4 isFirstAssertion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v8 = (SCDAAssertionCoordinator *)a3;
  v9 = (SCDAAssertionCoordinator *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  assertionCoordinator = self->_assertionCoordinator;
  uint64_t v11 = SCDALogContextCore;
  if (assertionCoordinator == v8)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      identifier = self->_identifier;
      int v14 = 136316162;
      IOPMAssertionID v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2112;
      v19 = identifier;
      __int16 v20 = 2112;
      IOPMAssertionID v21 = v9;
      __int16 v22 = 1024;
      LODWORD(v23) = v5;
      _os_log_debug_impl(&dword_25C707000, v11, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@, isFirstAssertion = %d", (uint8_t *)&v14, 0x30u);
      if (!v5) {
        goto LABEL_7;
      }
    }
    else if (!v5)
    {
      goto LABEL_7;
    }
    [(SCDAPowerAssertionManager *)self _createPowerAssertion];
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = self->_identifier;
    int v14 = 136316162;
    IOPMAssertionID v15 = "-[SCDAPowerAssertionManager assertionCoordinator:didActivateAssertion:isFirstAssertion:]";
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v12;
    __int16 v20 = 2112;
    IOPMAssertionID v21 = assertionCoordinator;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_error_impl(&dword_25C707000, v11, OS_LOG_TYPE_ERROR, "%s %p (%@) Expected assertion coordinator is %@, actual assertion coordinator is %@.", (uint8_t *)&v14, 0x34u);
  }
LABEL_7:
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    uint32_t v7 = "-[SCDAPowerAssertionManager dealloc]";
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = identifier;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  [(SCDAPowerAssertionManager *)self _releasePowerAssertion];
  v5.receiver = self;
  v5.super_class = (Class)SCDAPowerAssertionManager;
  [(SCDAPowerAssertionManager *)&v5 dealloc];
}

- (void)releaseAllPowerAssertions
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315650;
    __int16 v8 = "-[SCDAPowerAssertionManager releaseAllPowerAssertions]";
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = identifier;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2;
  v7[3] = &unk_2654B7A08;
  v7[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  return [*(id *)(a1 + 32) _releasePowerAssertion];
}

void __54__SCDAPowerAssertionManager_releaseAllPowerAssertions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(v8 + 8);
    int v10 = 136316162;
    __int16 v11 = "-[SCDAPowerAssertionManager releaseAllPowerAssertions]_block_invoke_2";
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_debug_impl(&dword_25C707000, v7, OS_LOG_TYPE_DEBUG, "%s %p (%@), name = %@, assertion = %@", (uint8_t *)&v10, 0x34u);
  }
  [v6 relinquishWithContext:0 options:0];
}

- (void)releasePowerAssertionWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v4 = (__CFString *)a3;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    __int16 v14 = "-[SCDAPowerAssertionManager releasePowerAssertionWithName:]";
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = identifier;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  uint32_t v7 = @"default";
  if (v4) {
    uint32_t v7 = v4;
  }
  uint64_t v8 = v7;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__SCDAPowerAssertionManager_releasePowerAssertionWithName___block_invoke;
  v11[3] = &unk_2654B7BB8;
  v11[4] = self;
  __int16 v12 = v8;
  int v10 = v8;
  dispatch_async(queue, v11);
}

void __59__SCDAPowerAssertionManager_releasePowerAssertionWithName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 8);
      int v8 = 136315906;
      uint64_t v9 = "-[SCDAPowerAssertionManager releasePowerAssertionWithName:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v2;
      _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v8, 0x2Au);
    }
    [v2 relinquishWithContext:0 options:0];
    [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 40) count])
    {
      uint64_t v4 = *(void *)(a1 + 32);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = 0;
    }
  }
}

- (void)takePowerAssertionWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v4 = (__CFString *)a3;
  id v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 136315906;
    __int16 v22 = "-[SCDAPowerAssertionManager takePowerAssertionWithName:]";
    __int16 v23 = 2048;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    v26 = identifier;
    __int16 v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_25C707000, v5, OS_LOG_TYPE_INFO, "%s %p (%@) name = %@", buf, 0x2Au);
  }
  uint64_t v7 = @"default";
  if (v4) {
    uint64_t v7 = v4;
  }
  int v8 = v7;
  assertionCoordinator = self->_assertionCoordinator;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke;
  v19[3] = &unk_2654B79E0;
  __int16 v10 = v8;
  uint64_t v20 = v10;
  id v11 = +[SCDAAssertionContext newWithBuilder:v19];
  __int16 v12 = [(SCDAAssertionCoordinator *)assertionCoordinator acquireRelinquishableAssertionWithContext:v11 relinquishmentHandler:0];

  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke_2;
  v16[3] = &unk_2654B7BE0;
  v16[4] = self;
  id v17 = v12;
  __int16 v18 = v10;
  __int16 v14 = v10;
  id v15 = v12;
  dispatch_async(queue, v16);
}

void __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = @"effectiveName";
  v7[0] = v2;
  uint64_t v3 = NSDictionary;
  id v4 = a2;
  id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 setUserInfo:v5];
}

uint64_t __56__SCDAPowerAssertionManager_takePowerAssertionWithName___block_invoke_2(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = *(void *)(v8 + 8);
    int v11 = 136315906;
    __int16 v12 = "-[SCDAPowerAssertionManager takePowerAssertionWithName:]_block_invoke_2";
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    uint64_t v18 = v9;
    _os_log_debug_impl(&dword_25C707000, v2, OS_LOG_TYPE_DEBUG, "%s %p (%@) assertion = %@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v3 = *(void **)(a1[4] + 40);
  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v3 = *(void **)(a1[4] + 40);
  }
  return [v3 setObject:a1[5] forKey:a1[6]];
}

- (SCDAPowerAssertionManager)initWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCDAPowerAssertionManager;
  uint64_t v5 = [(SCDAPowerAssertionManager *)&v15 init];
  if (v5)
  {
    if ([v4 length])
    {
      uint64_t v6 = [v4 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;
    }
    else
    {
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)@"com.apple.assistant.scda.power-assertion-manager";
    }

    uint64_t v8 = SCDADispatchSerialQueueWithRelativePriority((const char *)[@"com.apple.assistant.scda.power-assertion-manager" UTF8String], QOS_CLASS_DEFAULT, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [[SCDAAssertionCoordinator alloc] initWithIdentifier:@"com.apple.assistant.scda.power-assertion-manager" queue:v5->_queue delegate:v5];
    assertionCoordinator = v5->_assertionCoordinator;
    v5->_assertionCoordinator = v10;

    v5->_IOPMAssertionID powerAssertion = 0;
    __int16 v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = v5->_identifier;
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "-[SCDAPowerAssertionManager initWithIdentifier:]";
      __int16 v18 = 2048;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s %p (%@)", buf, 0x20u);
    }
  }

  return v5;
}

@end