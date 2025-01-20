@interface SCDAAssertionCoordinator
- (NSString)description;
- (NSString)identifier;
- (SCDAAssertionCoordinator)initWithIdentifier:(id)a3 queue:(id)a4 delegate:(id)a5;
- (id)acquireRelinquishableAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4;
- (unint64_t)numberOfActiveAssertions;
- (unint64_t)numberOfPendingAndActiveAssertions;
- (void)_activateAssertionWithUUID:(id)a3;
- (void)_addAssertion:(id)a3;
- (void)_deactivateAndRemoveAssertionWithUUID:(id)a3 context:(id)a4 error:(id)a5 options:(unint64_t)a6;
- (void)_invalidate;
- (void)barrier:(id)a3;
- (void)dealloc;
- (void)getActiveAssertionsWithCompletion:(id)a3;
- (void)getPendingAndActiveAssertionsWithCompletion:(id)a3;
- (void)invalidate;
- (void)relinquishAsertionsPassingTest:(id)a3 context:(id)a4;
- (void)relinquishAsertionsPassingTest:(id)a3 error:(id)a4;
- (void)relinquishAssertionWithUUID:(id)a3 context:(id)a4 options:(unint64_t)a5;
- (void)relinquishAssertionWithUUID:(id)a3 error:(id)a4 options:(unint64_t)a5;
@end

@implementation SCDAAssertionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activeAssertionUUIDs, 0);
  objc_storeStrong((id *)&self->_assertionsByUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_invalidate
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[SCDAAssertionCoordinator _invalidate]";
    _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  v4 = [(NSMutableDictionary *)self->_assertionsByUUID allKeys];
  v5 = (void *)[v4 copy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v17;
    *(void *)&long long v8 = 136315394;
    long long v15 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v13 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v15;
          v21 = "-[SCDAAssertionCoordinator _invalidate]";
          __int16 v22 = 2112;
          v23 = self;
          _os_log_error_impl(&dword_25C707000, v13, OS_LOG_TYPE_ERROR, "%s %@ Invalidated", buf, 0x16u);
        }
        v14 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"kSCDAErrorDomain", 42, 0, v15, (void)v16);
        [(SCDAAssertionCoordinator *)self _deactivateAndRemoveAssertionWithUUID:v12 context:0 error:v14 options:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v9);
  }
}

- (void)_deactivateAndRemoveAssertionWithUUID:(id)a3 context:(id)a4 error:(id)a5 options:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v25 = v13;
    v26 = SCDAAssertionRelinquishmentOptionsGetNames(a6);
    int v27 = 136316162;
    v28 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v10;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v11;
    __int16 v33 = 2112;
    id v34 = v12;
    __int16 v35 = 2112;
    v36 = v26;
    _os_log_debug_impl(&dword_25C707000, v25, OS_LOG_TYPE_DEBUG, "%s assertionUUID = %@, context = %@, error = %@, options = %@", (uint8_t *)&v27, 0x34u);

    if (!v10) {
      goto LABEL_16;
    }
  }
  else if (!v10)
  {
    goto LABEL_16;
  }
  v14 = [(NSMutableDictionary *)self->_assertionsByUUID objectForKey:v10];
  if (v14)
  {
    int v15 = [(NSMutableSet *)self->_activeAssertionUUIDs containsObject:v10];
    if ((a6 & 1) != 0 && v15)
    {
      long long v16 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        int v27 = 136315394;
        v28 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v14;
        _os_log_debug_impl(&dword_25C707000, v16, OS_LOG_TYPE_DEBUG, "%s Skipped deactivating %@ because it is active and requested inactive only.", (uint8_t *)&v27, 0x16u);
      }
    }
    else
    {
      if (v15)
      {
        atomic_fetch_add(&self->_numberOfActiveAssertions, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v17 = [(NSMutableSet *)self->_activeAssertionUUIDs count];
        [(NSMutableSet *)self->_activeAssertionUUIDs removeObject:v10];
        uint64_t v18 = [(NSMutableSet *)self->_activeAssertionUUIDs count];
        long long v19 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          int v27 = 136315650;
          v28 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
          __int16 v29 = 2048;
          uint64_t v30 = v17;
          __int16 v31 = 2048;
          uint64_t v32 = v18;
          _os_log_debug_impl(&dword_25C707000, v19, OS_LOG_TYPE_DEBUG, "%s numberOfActiveAssertions: %llu -> %llu", (uint8_t *)&v27, 0x20u);
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained assertionCoordinator:self didDeactivateAssertion:v14 isLastAssertion:v18 == 0];
      }
      [v14 invokeRelinquishmentHandlerWithContext:v11 error:v12];
      uint64_t v21 = [(NSMutableDictionary *)self->_assertionsByUUID count];
      [(NSMutableDictionary *)self->_assertionsByUUID removeObjectForKey:v10];
      uint64_t v22 = [(NSMutableDictionary *)self->_assertionsByUUID count];
      v23 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        int v27 = 136315650;
        v28 = "-[SCDAAssertionCoordinator _deactivateAndRemoveAssertionWithUUID:context:error:options:]";
        __int16 v29 = 2048;
        uint64_t v30 = v21;
        __int16 v31 = 2048;
        uint64_t v32 = v22;
        _os_log_debug_impl(&dword_25C707000, v23, OS_LOG_TYPE_DEBUG, "%s numberOfAssertions: %llu -> %llu", (uint8_t *)&v27, 0x20u);
      }
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 assertionCoordinator:self didRemoveAssertion:v14 isLastAssertion:v22 == 0];
    }
  }

LABEL_16:
}

- (void)_activateAssertionWithUUID:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s assertionUUID = %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_12;
    }
  }
  else if (!v4)
  {
    goto LABEL_12;
  }
  if (([(NSMutableSet *)self->_activeAssertionUUIDs containsObject:v4] & 1) == 0)
  {
    id v6 = [(NSMutableDictionary *)self->_assertionsByUUID objectForKey:v4];
    if (v6)
    {
      atomic_fetch_add(&self->_numberOfActiveAssertions, 1uLL);
      uint64_t v7 = [(NSMutableSet *)self->_activeAssertionUUIDs count];
      [(NSMutableSet *)self->_activeAssertionUUIDs addObject:v4];
      *(double *)&uint64_t v8 = COERCE_DOUBLE([(NSMutableSet *)self->_activeAssertionUUIDs count]);
      uint64_t v9 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]";
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2048;
        double v35 = *(double *)&v8;
        _os_log_debug_impl(&dword_25C707000, v9, OS_LOG_TYPE_DEBUG, "%s numberOfActiveAssertions: %llu -> %llu", buf, 0x20u);
      }
      BOOL v10 = v7 == 0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained assertionCoordinator:self didActivateAssertion:v6 isFirstAssertion:v10];

      id v12 = [v6 context];
      [v12 expirationDuration];
      double v14 = v13;

      if (v14 > 0.0)
      {
        objc_initWeak(&location, self);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke;
        v29[3] = &unk_2654B7738;
        objc_copyWeak(&v32, &location);
        id v15 = v6;
        id v30 = v15;
        id v31 = v4;
        long long v16 = (void *)MEMORY[0x261192180](v29);
        uint64_t v17 = [v15 context];
        uint64_t v18 = [v17 effectiveDate];

        [v18 timeIntervalSinceNow];
        double v20 = v19;
        uint64_t v21 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v15;
          *(_WORD *)&buf[22] = 2048;
          double v35 = v14 + v20;
          _os_log_debug_impl(&dword_25C707000, v21, OS_LOG_TYPE_DEBUG, "%s Deactivating %@ in %f seconds...", buf, 0x20u);
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        double v35 = COERCE_DOUBLE(__Block_byref_object_copy_);
        v36 = __Block_byref_object_dispose_;
        dispatch_source_t v37 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
        uint64_t v22 = *(NSObject **)(*(void *)&buf[8] + 40);
        dispatch_time_t v23 = SCDADispatchTimeGetFromDateAndOffset(v18, v14);
        dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
        id v24 = *(NSObject **)(*(void *)&buf[8] + 40);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke_107;
        v26[3] = &unk_2654B7710;
        id v27 = v16;
        v28 = buf;
        id v25 = v16;
        dispatch_source_set_event_handler(v24, v26);
        dispatch_resume(*(dispatch_object_t *)(*(void *)&buf[8] + 40));

        _Block_object_dispose(buf, 8);
        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_12:
}

void __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315394;
      uint64_t v8 = "-[SCDAAssertionCoordinator _activateAssertionWithUUID:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s Deactivating %@ now...", (uint8_t *)&v7, 0x16u);
    }
    [WeakRetained _deactivateAndRemoveAssertionWithUUID:*(void *)(a1 + 40) context:v3 error:0 options:0];
  }
}

void __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke_107(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[SCDAAssertionContext newWithBuilder:&__block_literal_global_453];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  id v4 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    dispatch_source_cancel(v4);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

void __55__SCDAAssertionCoordinator__activateAssertionWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setTimestamp:mach_absolute_time()];
  [v2 setReason:@"Expired on Schedule"];
}

- (void)_addAssertion:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_debug_impl(&dword_25C707000, v5, OS_LOG_TYPE_DEBUG, "%s assertion = %@", buf, 0x16u);
    if (!v4) {
      goto LABEL_22;
    }
LABEL_3:
    uint64_t v6 = [v4 context];
    int v7 = [v6 effectiveDate];

    uint64_t v8 = [v4 context];
    [v8 expirationDuration];
    double v10 = v9;

    if (v10 >= 0.0)
    {
      [v7 timeIntervalSinceNow];
      double v13 = v12;
      if (v12 >= 0.0 || v10 <= 0.0 || (double v14 = v10 + v12, v14 >= 0.0))
      {
        id v15 = [v4 uuid];
        uint64_t v16 = [(NSMutableDictionary *)self->_assertionsByUUID count];
        [(NSMutableDictionary *)self->_assertionsByUUID setObject:v4 forKey:v15];
        uint64_t v17 = [(NSMutableDictionary *)self->_assertionsByUUID count];
        uint64_t v18 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2048;
          v39 = (uint64_t (*)(uint64_t, uint64_t))v17;
          _os_log_debug_impl(&dword_25C707000, v18, OS_LOG_TYPE_DEBUG, "%s numberOfAssertions: %llu -> %llu", buf, 0x20u);
        }
        BOOL v19 = v16 == 0;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained assertionCoordinator:self didAddAssertion:v4 isFirstAssertion:v19];

        objc_initWeak(&location, self);
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __42__SCDAAssertionCoordinator__addAssertion___block_invoke;
        v33[3] = &unk_2654B76E8;
        objc_copyWeak(&v36, &location);
        id v21 = v4;
        id v34 = v21;
        id v22 = v15;
        id v35 = v22;
        uint64_t v23 = MEMORY[0x261192180](v33);
        id v24 = (void *)v23;
        if (v13 <= 0.0)
        {
          (*(void (**)(uint64_t))(v23 + 16))(v23);
        }
        else
        {
          id v25 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v21;
            *(_WORD *)&buf[22] = 2048;
            v39 = *(uint64_t (**)(uint64_t, uint64_t))&v13;
            _os_log_debug_impl(&dword_25C707000, v25, OS_LOG_TYPE_DEBUG, "%s Activating %@ in %f seconds...", buf, 0x20u);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v39 = __Block_byref_object_copy_;
          v40 = __Block_byref_object_dispose_;
          dispatch_source_t v41 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
          v26 = *(NSObject **)(*(void *)&buf[8] + 40);
          dispatch_time_t v27 = SCDADispatchTimeGetFromDateAndOffset(v7, 0.0);
          dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
          v28 = *(NSObject **)(*(void *)&buf[8] + 40);
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __42__SCDAAssertionCoordinator__addAssertion___block_invoke_105;
          v30[3] = &unk_2654B7710;
          id v31 = v24;
          id v32 = buf;
          dispatch_source_set_event_handler(v28, v30);
          dispatch_resume(*(dispatch_object_t *)(*(void *)&buf[8] + 40));

          _Block_object_dispose(buf, 8);
        }

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        goto LABEL_21;
      }
      __int16 v29 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        v39 = *(uint64_t (**)(uint64_t, uint64_t))&v14;
        _os_log_error_impl(&dword_25C707000, v29, OS_LOG_TYPE_ERROR, "%s %@ expired %f seconds ago.", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[SCDAAssertionCoordinator _addAssertion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        *(_WORD *)&buf[22] = 2048;
        v39 = *(uint64_t (**)(uint64_t, uint64_t))&v10;
        _os_log_error_impl(&dword_25C707000, v11, OS_LOG_TYPE_ERROR, "%s %@ contains invalid expiration duration %f.", buf, 0x20u);
      }
    }
    id v22 = [MEMORY[0x263F087E8] errorWithDomain:@"kSCDAErrorDomain" code:31 userInfo:0];
    [v4 invokeRelinquishmentHandlerWithContext:0 error:v22];
LABEL_21:

    goto LABEL_22;
  }
  if (v4) {
    goto LABEL_3;
  }
LABEL_22:
}

void __42__SCDAAssertionCoordinator__addAssertion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315394;
      uint64_t v6 = "-[SCDAAssertionCoordinator _addAssertion:]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_debug_impl(&dword_25C707000, v3, OS_LOG_TYPE_DEBUG, "%s Activating %@ now...", (uint8_t *)&v5, 0x16u);
    }
    [WeakRetained _activateAssertionWithUUID:*(void *)(a1 + 40)];
  }
}

void __42__SCDAAssertionCoordinator__addAssertion___block_invoke_105(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[SCDAAssertionCoordinator invalidate]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SCDAAssertionCoordinator_invalidate__block_invoke;
  block[3] = &unk_2654B81C8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__SCDAAssertionCoordinator_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)barrier:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__SCDAAssertionCoordinator_barrier___block_invoke;
    block[3] = &unk_2654B7F30;
    id v8 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __36__SCDAAssertionCoordinator_barrier___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getActiveAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke;
    v7[3] = &unk_2654B8100;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  if (v2)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v2];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke_2;
    v10[3] = &unk_2654B76C0;
    v10[4] = v7;
    id v9 = v6;
    id v11 = v9;
    [v8 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    id v9 = (id)MEMORY[0x263EFFA68];
  }
  (*(void (**)(void, id, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v3, v4, v5);
}

uint64_t __62__SCDAAssertionCoordinator_getActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:a2];
  if (v3) {
    [*(id *)(a1 + 40) addObject:v3];
  }
  return MEMORY[0x270F9A758]();
}

- (unint64_t)numberOfActiveAssertions
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v2 = atomic_load((unint64_t *)&self->_numberOfActiveAssertions);
  if ((v2 & 0x8000000000000000) != 0)
  {
    uint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[SCDAAssertionCoordinator numberOfActiveAssertions]";
      __int16 v7 = 2048;
      unint64_t v8 = v2;
      _os_log_error_impl(&dword_25C707000, v3, OS_LOG_TYPE_ERROR, "%s numberOfActiveAssertions is %lld", (uint8_t *)&v5, 0x16u);
    }
    return 0;
  }
  return v2;
}

- (void)getPendingAndActiveAssertionsWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke;
    v7[3] = &unk_2654B8100;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  if (v2)
  {
    unint64_t v3 = v2;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) count];
    if (v4)
    {
      unint64_t v5 = v4;
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4];
      id v7 = objc_alloc(MEMORY[0x263EFF980]);
      if (v3 >= v5) {
        unint64_t v8 = v3 - v5;
      }
      else {
        unint64_t v8 = 0;
      }
      uint64_t v9 = (void *)[v7 initWithCapacity:v8];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 32);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke_2;
      v14[3] = &unk_2654B7698;
      v14[4] = v10;
      id v12 = v6;
      id v15 = v12;
      id v13 = v9;
      id v16 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v14];
    }
    else
    {
      id v13 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
      id v12 = (id)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x263EFFA68];
    id v13 = (id)MEMORY[0x263EFFA68];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__SCDAAssertionCoordinator_getPendingAndActiveAssertionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v8 = a3;
  int v6 = [v5 containsObject:a2];
  uint64_t v7 = 48;
  if (v6) {
    uint64_t v7 = 40;
  }
  [*(id *)(a1 + v7) addObject:v8];
}

- (unint64_t)numberOfPendingAndActiveAssertions
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v2 = atomic_load((unint64_t *)&self->_numberOfAssertions);
  if ((v2 & 0x8000000000000000) != 0)
  {
    unint64_t v3 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      int v6 = "-[SCDAAssertionCoordinator numberOfPendingAndActiveAssertions]";
      __int16 v7 = 2048;
      unint64_t v8 = v2;
      _os_log_error_impl(&dword_25C707000, v3, OS_LOG_TYPE_ERROR, "%s numberOfPendingAndActiveAssertions is %lld", (uint8_t *)&v5, 0x16u);
    }
    return 0;
  }
  return v2;
}

- (void)relinquishAsertionsPassingTest:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v14 = "-[SCDAAssertionCoordinator relinquishAsertionsPassingTest:error:]";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke;
    block[3] = &unk_2654B8150;
    void block[4] = self;
    id v12 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke_2;
  v16[3] = &unk_2654B7670;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v18 = v4;
  v16[4] = v5;
  id v6 = v2;
  id v17 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), 0, *(void *)(a1 + 40), 0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v9);
  }
}

void __65__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v7 = a3;
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, [v6 containsObject:v8]);

  if (v5) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)relinquishAsertionsPassingTest:(id)a3 context:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v14 = "-[SCDAAssertionCoordinator relinquishAsertionsPassingTest:context:]";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  if (v6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke;
    block[3] = &unk_2654B8150;
    void block[4] = self;
    id v12 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke_2;
  v16[3] = &unk_2654B7670;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v18 = v4;
  v16[4] = v5;
  id v6 = v2;
  id v17 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:v16];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(a1 + 32), "_deactivateAndRemoveAssertionWithUUID:context:error:options:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), *(void *)(a1 + 40), 0, 0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v9);
  }
}

void __67__SCDAAssertionCoordinator_relinquishAsertionsPassingTest_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(*(void *)(a1 + 32) + 48);
  id v7 = a3;
  LODWORD(v5) = (*(uint64_t (**)(uint64_t, id, uint64_t))(v5 + 16))(v5, v7, [v6 containsObject:v8]);

  if (v5) {
    [*(id *)(a1 + 40) addObject:v8];
  }
}

- (void)relinquishAssertionWithUUID:(id)a3 error:(id)a4 options:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    long long v12 = SCDAAssertionRelinquishmentOptionsGetNames(a5);
    *(_DWORD *)buf = 136315906;
    id v21 = "-[SCDAAssertionCoordinator relinquishAssertionWithUUID:error:options:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    dispatch_time_t v27 = v12;
    _os_log_impl(&dword_25C707000, v11, OS_LOG_TYPE_INFO, "%s assertionUUID = %@, error = %@, options = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __70__SCDAAssertionCoordinator_relinquishAssertionWithUUID_error_options___block_invoke;
  v16[3] = &unk_2654B7648;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a5;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

uint64_t __70__SCDAAssertionCoordinator_relinquishAssertionWithUUID_error_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateAndRemoveAssertionWithUUID:*(void *)(a1 + 40) context:0 error:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
}

- (void)relinquishAssertionWithUUID:(id)a3 context:(id)a4 options:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v10;
    long long v12 = SCDAAssertionRelinquishmentOptionsGetNames(a5);
    *(_DWORD *)buf = 136315906;
    id v21 = "-[SCDAAssertionCoordinator relinquishAssertionWithUUID:context:options:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    __int16 v26 = 2112;
    dispatch_time_t v27 = v12;
    _os_log_impl(&dword_25C707000, v11, OS_LOG_TYPE_INFO, "%s assertionUUID = %@, context = %@, options = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __72__SCDAAssertionCoordinator_relinquishAssertionWithUUID_context_options___block_invoke;
  v16[3] = &unk_2654B7648;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  unint64_t v19 = a5;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(queue, v16);
}

uint64_t __72__SCDAAssertionCoordinator_relinquishAssertionWithUUID_context_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateAndRemoveAssertionWithUUID:*(void *)(a1 + 40) context:*(void *)(a1 + 48) error:0 options:*(void *)(a1 + 56)];
}

- (id)acquireRelinquishableAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_time_t v27 = "-[SCDAAssertionCoordinator acquireRelinquishableAssertionWithContext:relinquishmentHandler:]";
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_25C707000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  atomic_fetch_add(&self->_numberOfAssertions, 1uLL);
  id v9 = [_SCDAAssertionImpl alloc];
  id v10 = objc_alloc_init(MEMORY[0x263F08C38]);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke;
  v24[3] = &unk_2654B7620;
  v24[4] = self;
  id v25 = v7;
  id v11 = v7;
  long long v12 = [(_SCDAAssertionImpl *)v9 initWithUUID:v10 context:v6 relinquishmentHandler:v24];

  queue = self->_queue;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke_2;
  id v21 = &unk_2654B7BB8;
  __int16 v22 = self;
  id v23 = v12;
  id v14 = v12;
  dispatch_async(queue, &v18);
  id v15 = [_SCDAAssertionProxy alloc];
  id v16 = -[_SCDAAssertionProxy initWithImpl:coordinator:](v15, "initWithImpl:coordinator:", v14, self, v18, v19, v20, v21, v22);

  return v16;
}

uint64_t __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke(uint64_t a1)
{
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 24), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __92__SCDAAssertionCoordinator_acquireRelinquishableAssertionWithContext_relinquishmentHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addAssertion:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[SCDAAssertionCoordinator dealloc]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_25C707000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  [(SCDAAssertionCoordinator *)self _invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SCDAAssertionCoordinator;
  [(SCDAAssertionCoordinator *)&v4 dealloc];
}

- (SCDAAssertionCoordinator)initWithIdentifier:(id)a3 queue:(id)a4 delegate:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SCDAAssertionCoordinator;
  id v11 = [(SCDAAssertionCoordinator *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    objc_storeWeak((id *)&v11->_delegate, v10);
    id v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assertionsByUUID = v11->_assertionsByUUID;
    v11->_assertionsByUUID = v14;

    id v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    activeAssertionUUIDs = v11->_activeAssertionUUIDs;
    v11->_activeAssertionUUIDs = v16;

    uint64_t v18 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "-[SCDAAssertionCoordinator initWithIdentifier:queue:delegate:]";
      __int16 v23 = 2112;
      __int16 v24 = v11;
      _os_log_impl(&dword_25C707000, v18, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
  }

  return v11;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SCDAAssertionCoordinator;
  objc_super v4 = [(SCDAAssertionCoordinator *)&v7 description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"%@ {identifier = %@, numberOfAssertions = %llu/%llu}", v4, self->_identifier, -[SCDAAssertionCoordinator numberOfActiveAssertions](self, "numberOfActiveAssertions"), -[SCDAAssertionCoordinator numberOfPendingAndActiveAssertions](self, "numberOfPendingAndActiveAssertions")];

  return (NSString *)v5;
}

@end