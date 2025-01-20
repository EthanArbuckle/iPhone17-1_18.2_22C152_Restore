@interface PKHMHomeManager
- (PKHMHomeManager)init;
- (void)fetchHomeIdentifierForPassSerialNumber:(id)a3 withCompletion:(id)a4;
- (void)fetchHomesWithCompletion:(id)a3;
- (void)fetchLockAccessoryWithTerminalReaderIdentifier:(id)a3 withCompletion:(id)a4;
- (void)hasHomeAccessScheduleForPassSerialNumber:(id)a3 withCompletion:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)isHomeAccessRestrictedForPassSerialNumber:(id)a3 withCompletion:(id)a4;
- (void)setLockStateToSecuredForLockAccessory:(id)a3 withCompletion:(id)a4;
@end

@implementation PKHMHomeManager

- (PKHMHomeManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKHMHomeManager;
  v2 = [(PKHMHomeManager *)&v14 init];
  if (!v2)
  {
LABEL_6:
    v10 = v2;
    goto LABEL_10;
  }
  dispatch_queue_t v3 = dispatch_queue_create("PKHMHomeManagerTimerQueue", 0);
  timerQueue = v2->_timerQueue;
  v2->_timerQueue = (OS_dispatch_queue *)v3;

  v5 = (void *)[objc_alloc(_MergedGlobals_180()) initWithOptions:524 cachePolicy:0];
  [v5 setAdaptive:1];
  uint64_t v6 = [objc_alloc((Class)off_1EB4024A8()) initWithConfiguration:v5];
  manager = v2->_manager;
  v2->_manager = (HMHomeManager *)v6;

  v8 = v2->_manager;
  if (v8)
  {
    [(HMHomeManager *)v8 setDelegate:v2];
    v9 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager initalizing HMHomeManager", v13, 2u);
    }

    goto LABEL_6;
  }
  v11 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager unable to create HMHomeManager", v13, 2u);
  }

  v10 = 0;
LABEL_10:

  return v10;
}

- (void)fetchHomesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didLoadData)
  {
    uint64_t v6 = [(HMHomeManager *)self->_manager homes];
    os_unfair_lock_unlock(p_lock);
    if (v4) {
      v4[2](v4, v6);
    }
  }
  else
  {
    if (!self->_fetchCompletions)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      fetchCompletions = self->_fetchCompletions;
      self->_fetchCompletions = v7;

      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_timerQueue);
      fetchTimeout = self->_fetchTimeout;
      self->_fetchTimeout = v9;

      v11 = self->_fetchTimeout;
      dispatch_time_t v12 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
      v13 = self->_fetchTimeout;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __44__PKHMHomeManager_fetchHomesWithCompletion___block_invoke;
      handler[3] = &unk_1E56D8AE0;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      dispatch_resume((dispatch_object_t)self->_fetchTimeout);
    }
    if (v4)
    {
      objc_super v14 = self->_fetchCompletions;
      v15 = _Block_copy(v4);
      [(NSMutableArray *)v14 addObject:v15];
    }
    os_unfair_lock_unlock(p_lock);
  }
}

uint64_t __44__PKHMHomeManager_fetchHomesWithCompletion___block_invoke(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager timed out waiting on HMHomeManager to load", v4, 2u);
  }

  return [*(id *)(a1 + 32) homeManagerDidUpdateHomes:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)fetchHomeIdentifierForPassSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void (**)(void, void))v7;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_didLoadData)
    {
      v10 = [(HMHomeManager *)self->_manager homes];
      os_unfair_lock_unlock(p_lock);
      if (v8)
      {
        dispatch_time_t v12 = __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke(v11, v10, v6);
        ((void (**)(void, void *))v8)[2](v8, v12);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke_19;
      v13[3] = &unk_1E56F0520;
      v15 = v8;
      id v16 = &__block_literal_global_171;
      id v14 = v6;
      [(PKHMHomeManager *)self fetchHomesWithCompletion:v13];
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

id __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (PKHomeKitSimulatedLockCompatibilityMode()) {
          goto LABEL_17;
        }
        uint64_t v11 = objc_msgSend(v10, "walletKeyPassSerialNumber", (void)v22);
        id v12 = v5;
        id v13 = v11;
        if (v13 == v12)
        {

LABEL_17:
          id v7 = v10;
          goto LABEL_18;
        }
        id v14 = v13;
        if (v5 && v13)
        {
          char v15 = [v12 isEqualToString:v13];

          if (v15) {
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  id v16 = [v7 uniqueIdentifier];
  v17 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = @"Found";
    *(_DWORD *)buf = 138412802;
    if (!v7) {
      v18 = @"Did not find";
    }
    v27 = v18;
    __int16 v28 = 2112;
    v29 = v16;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ home %@ with pass serial number: %@", buf, 0x20u);
  }

  if (v7) {
    v19 = v16;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  return v20;
}

void __73__PKHMHomeManager_fetchHomeIdentifierForPassSerialNumber_withCompletion___block_invoke_19(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    (*(void (**)(void, uint64_t, void))(a1[6] + 16))(a1[6], a2, a1[4]);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)fetchLockAccessoryWithTerminalReaderIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke;
  aBlock[3] = &unk_1E56F0548;
  id v8 = v6;
  id v17 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didLoadData)
  {
    uint64_t v11 = [(HMHomeManager *)self->_manager homes];
    id v12 = v9[2](v9, v11);

    os_unfair_lock_unlock(p_lock);
    if (v7) {
      v7[2](v7, v12);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke_23;
    v13[3] = &unk_1E56E0A50;
    id v14 = v9;
    char v15 = v7;
    [(PKHMHomeManager *)self fetchHomesWithCompletion:v13];

    id v12 = v14;
  }
}

PKHMAccessory *__81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(obj);
        }
        id v6 = [*(id *)(*((void *)&v35 + 1) + 8 * i) accessories];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v45 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v32;
          while (2)
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v32 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
              if (PKHomeKitSimulatedLockCompatibilityMode())
              {
                uint64_t v15 = FindLockCharacteristicInAccessory(v12);
                if (v15)
                {
                  v18 = (void *)v15;
                  id v19 = v12;

                  goto LABEL_20;
                }
              }
              else
              {
                id v13 = [v12 readerIDACWG];
                int v14 = [v13 isEqualToData:*(void *)(a1 + 32)];

                if (v14)
                {
                  id v17 = v12;
LABEL_20:

                  if (v12) {
                    goto LABEL_24;
                  }
                  goto LABEL_21;
                }
              }
              ++v11;
            }
            while (v9 != v11);
            uint64_t v16 = [v7 countByEnumeratingWithState:&v31 objects:v45 count:16];
            uint64_t v9 = v16;
            if (v16) {
              continue;
            }
            break;
          }
        }

LABEL_21:
        ;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v4);
  }
  id v12 = 0;
LABEL_24:

  id v20 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      v21 = @"Found";
    }
    else {
      v21 = @"Did not find";
    }
    long long v22 = [v12 uniqueIdentifier];
    long long v23 = [v12 name];
    *(_DWORD *)buf = 138412802;
    v40 = v21;
    __int16 v41 = 2112;
    v42 = v22;
    __int16 v43 = 2112;
    v44 = v23;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ lock accessory with identifier: %@ (name: %@)", buf, 0x20u);
  }
  if (v12)
  {
    long long v24 = [PKHMAccessory alloc];
    long long v25 = [v12 uniqueIdentifier];
    v26 = [v12 name];
    v27 = [(PKHMAccessory *)v24 initWithUniqueIdentifier:v25 name:v26];
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

void __81__PKHMHomeManager_fetchLockAccessoryWithTerminalReaderIdentifier_withCompletion___block_invoke_23(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    uint64_t v2 = v4;
  }
}

- (void)setLockStateToSecuredForLockAccessory:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_27;
  aBlock[3] = &unk_1E56F05B8;
  id v8 = v7;
  void aBlock[4] = self;
  id v18 = v8;
  uint64_t v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_didLoadData)
  {
    uint64_t v11 = [(HMHomeManager *)self->_manager homes];
    id v12 = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke((uint64_t)v11, v11, v6);

    os_unfair_lock_unlock(p_lock);
    v9[2](v9, v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_44;
    v13[3] = &unk_1E56E0D60;
    uint64_t v15 = &__block_literal_global_26_0;
    id v14 = v6;
    uint64_t v16 = v9;
    [(PKHMHomeManager *)self fetchHomesWithCompletion:v13];

    id v12 = v15;
  }
}

id __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v30 + 1) + 8 * i) accessories];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v40 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
LABEL_8:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v27 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
            id v14 = [v13 uniqueIdentifier];
            uint64_t v15 = [v5 uniqueIdentifier];
            char v16 = objc_msgSend(v14, "hmf_isEqualToUUID:", v15);

            if (v16) {
              break;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v40 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v17 = v13;

          if (v17) {
            goto LABEL_19;
          }
        }
        else
        {
LABEL_14:
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v41 count:16];
    }
    while (v25);
  }
  id v17 = 0;
LABEL_19:

  id v18 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v17) {
      id v19 = @"Found";
    }
    else {
      id v19 = @"Did not find";
    }
    id v20 = [v17 uniqueIdentifier];
    v21 = [v17 name];
    *(_DWORD *)buf = 138412802;
    long long v35 = v19;
    __int16 v36 = 2112;
    long long v37 = v20;
    __int16 v38 = 2112;
    v39 = v21;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ lock accessory with identifier: %@ (name: %@)", buf, 0x20u);
  }
  return v17;
}

void __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = FindLockCharacteristicInAccessory(v3);
  id v5 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v6 = @"Found";
    }
    else {
      id v6 = @"Did not find";
    }
    id v7 = [v3 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    long long v23 = v6;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ lock characteristic for accessory: %@", buf, 0x16u);
  }
  if (v4)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_29;
    v16[3] = &unk_1E56F0590;
    v16[4] = v4;
    id v17 = v3;
    id v8 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 32);
    id v19 = v8;
    [v4 writeValue:&unk_1EE22C338 completionHandler:v16];
  }
  else if (*(void *)(a1 + 40))
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [v3 uniqueIdentifier];
    uint64_t v11 = [v9 stringWithFormat:@"Failed to find HMCharacteristicTypeTargetLockMechanismState for accessory %@", v10];

    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = v11;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v15 = [v13 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v14];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v15);
  }
}

void __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      id v5 = @"Unsuccessfully";
    }
    else {
      id v5 = @"Successfully";
    }
    id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
    id v7 = [*(id *)(a1 + 40) uniqueIdentifier];
    int v9 = 138412802;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ wrote characteristic %@ for accessory: %@", (uint8_t *)&v9, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void __72__PKHMHomeManager_setLockStateToSecuredForLockAccessory_withCompletion___block_invoke_44(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)hasHomeAccessScheduleForPassSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_didLoadData)
    {
      uint64_t v10 = [(HMHomeManager *)self->_manager homes];
      os_unfair_lock_unlock(p_lock);
      if (v8)
      {
        uint64_t v18 = 0;
        BOOL v12 = __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke(v11, v10, v6, &v18);
        __int16 v13 = v18;
        ((void (**)(void, BOOL, __CFString *))v8)[2](v8, v12, v13);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke_54;
      v14[3] = &unk_1E56F0520;
      char v16 = v8;
      id v17 = &__block_literal_global_47;
      id v15 = v6;
      [(PKHMHomeManager *)self fetchHomesWithCompletion:v14];

      uint64_t v10 = v16;
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

BOOL __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a4)
  {
    __break(1u);
    goto LABEL_33;
  }
  id v4 = v8;
  *a4 = 0;
  if (PKHomeKitSimulatedLockCompatibilityMode())
  {
LABEL_33:
    long long v30 = [v7 firstObject];
    *a4 = [v30 uniqueIdentifier];
    BOOL v27 = v30 != 0;

    goto LABEL_31;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v31 = v7;
  id v9 = v7;
  id v10 = (id)[v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v14 = [v13 walletKeyPassSerialNumber];
        id v15 = v4;
        id v16 = v14;
        if (v16 == v15)
        {

LABEL_18:
          id v10 = v13;
          goto LABEL_19;
        }
        id v17 = v16;
        if (v4 && v16)
        {
          int v18 = [v15 isEqualToString:v16];

          if (v18) {
            goto LABEL_18;
          }
        }
        else
        {
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  id v19 = [v10 uniqueIdentifier];
  uint64_t v20 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = @"Found";
    *(_DWORD *)buf = 138412802;
    if (!v10) {
      v21 = @"Did not find";
    }
    long long v37 = v21;
    __int16 v38 = 2112;
    v39 = v19;
    __int16 v40 = 2112;
    __int16 v41 = v4;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ home %@ with pass serial number: %@", buf, 0x20u);
  }

  if (v10)
  {
    long long v22 = v19;
    *a4 = v22;
    long long v23 = [v10 currentUser];
    __int16 v24 = [v10 homeAccessControlForUser:v23];
    uint64_t v25 = [v24 restrictedGuestAccessSettings];
    uint64_t v26 = [v25 guestAccessSchedule];
    BOOL v27 = v26 != 0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = @"does not have";
      if (v26) {
        long long v28 = @"has";
      }
      *(_DWORD *)buf = 138412546;
      long long v37 = v22;
      __int16 v38 = 2112;
      v39 = v28;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: Home %@ %@ access schedule", buf, 0x16u);
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  id v7 = v31;
LABEL_31:

  return v27;
}

void __75__PKHMHomeManager_hasHomeAccessScheduleForPassSerialNumber_withCompletion___block_invoke_54(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v2 = 0;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)isHomeAccessRestrictedForPassSerialNumber:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_didLoadData)
    {
      id v10 = [(HMHomeManager *)self->_manager homes];
      uint64_t v11 = __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke((uint64_t)v10, v10, v6);

      os_unfair_lock_unlock(p_lock);
      if (v8) {
        v8[2](v8, v11);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke_58;
      v12[3] = &unk_1E56E0D60;
      id v14 = &__block_literal_global_57;
      id v13 = v6;
      id v15 = v8;
      [(PKHMHomeManager *)self fetchHomesWithCompletion:v12];
    }
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (PKHomeKitSimulatedLockCompatibilityMode())
  {
    uint64_t v24 = 1;
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    id v7 = (id)[v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "walletKeyPassSerialNumber", (void)v26);
          id v12 = v5;
          id v13 = v11;
          if (v13 == v12)
          {

LABEL_17:
            id v7 = v10;
            goto LABEL_18;
          }
          id v14 = v13;
          if (v5 && v13)
          {
            int v15 = [v12 isEqualToString:v13];

            if (v15) {
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    id v16 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        id v17 = @"Found";
      }
      else {
        id v17 = @"Did not find";
      }
      int v18 = objc_msgSend(v7, "uniqueIdentifier", (void)v26);
      *(_DWORD *)buf = 138412802;
      id v31 = v17;
      __int16 v32 = 2112;
      long long v33 = v18;
      __int16 v34 = 2112;
      id v35 = v5;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager: %@ home %@ with pass serial number: %@", buf, 0x20u);
    }
    if (v7)
    {
      id v19 = [v7 currentUser];
      uint64_t v20 = [v7 homeAccessControlForUser:v19];
      v21 = [v20 restrictedGuestAccessSettings];
      long long v22 = [v21 guestAccessSchedule];
      unsigned int v23 = [v20 isRestrictedGuestInAllowedPeriod] ^ 1;
      if (v22) {
        uint64_t v24 = v23;
      }
      else {
        uint64_t v24 = 0;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  return v24;
}

uint64_t __76__PKHMHomeManager_isHomeAccessRestrictedForPassSerialNumber_withCompletion___block_invoke_58(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [v4 homes];
  id v6 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = [v5 count];
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKHMHomeManager found %lu homes", buf, 0xCu);
  }

  id v7 = self->_fetchCompletions;
  self->_didLoadData = 1;
  fetchCompletions = self->_fetchCompletions;
  self->_fetchCompletions = 0;

  fetchTimeout = self->_fetchTimeout;
  if (fetchTimeout) {
    dispatch_source_cancel(fetchTimeout);
  }
  os_unfair_lock_unlock(&self->_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        timerQueue = self->_timerQueue;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __45__PKHMHomeManager_homeManagerDidUpdateHomes___block_invoke;
        v17[3] = &unk_1E56D83D8;
        v17[4] = v5;
        v17[5] = v15;
        dispatch_async(timerQueue, v17);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
}

uint64_t __45__PKHMHomeManager_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchTimeout, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_fetchCompletions, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end