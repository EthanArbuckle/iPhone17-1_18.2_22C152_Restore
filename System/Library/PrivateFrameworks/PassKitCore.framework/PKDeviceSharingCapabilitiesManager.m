@interface PKDeviceSharingCapabilitiesManager
- (PKDeviceSharingCapabilitiesManager)init;
- (id)currentFetchStatusForAppleID:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_sendDeviceSharingCapabilitiesUpdated:(id)a3 maximumPossibleDevices:(int64_t)a4 forAppleID:(id)a5;
- (void)_sendDeviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5;
- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4;
- (void)fetchDeviceCapabilitesForAppleIDs:(id)a3 associatedFamilyMembers:(id)a4;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PKDeviceSharingCapabilitiesManager

- (PKDeviceSharingCapabilitiesManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKDeviceSharingCapabilitiesManager;
  v2 = [(PKDeviceSharingCapabilitiesManager *)&v14 init];
  if (v2)
  {
    v3 = [[PKPaymentService alloc] initWithDelegate:v2];
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fetchStatusByAppleID = v2->_fetchStatusByAppleID;
    v2->_fetchStatusByAppleID = v5;

    *(void *)&v2->_lockObservers._os_unfair_lock_opaque = 0;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    familyMembers = v2->_familyMembers;
    v2->_familyMembers = v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passkit.PKDeviceSharingCapabilitiesManager.reply", 0);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)fetchDeviceCapabilitesForAppleIDs:(id)a3 associatedFamilyMembers:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        os_unfair_lock_lock(&self->_lock);
        [(NSMutableArray *)self->_familyMembers addObjectsFromArray:v7];
        v13 = [(NSMutableDictionary *)self->_fetchStatusByAppleID objectForKey:v12];
        objc_super v14 = PKLogFacilityTypeGetObject(6uLL);
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v12;
            _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Not fetching family member device capabilities since one is already in progress %@", buf, 0xCu);
          }

          os_unfair_lock_unlock(&self->_lock);
        }
        else
        {
          if (v15)
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v12;
            _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Fetching family member device capabilities %@", buf, 0xCu);
          }

          v16 = [PKDeviceSharingCapabilitiesFetchStatus alloc];
          v17 = [MEMORY[0x1E4F1C9C8] date];
          v18 = [(PKDeviceSharingCapabilitiesFetchStatus *)v16 initWithAppleID:v12 fetchStartDate:v17];

          [(PKDeviceSharingCapabilitiesFetchStatus *)v18 setDeviceCountFetchInProgress:1];
          [(NSMutableDictionary *)self->_fetchStatusByAppleID setObject:v18 forKey:v12];

          os_unfair_lock_unlock(&self->_lock);
          paymentService = self->_paymentService;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __96__PKDeviceSharingCapabilitiesManager_fetchDeviceCapabilitesForAppleIDs_associatedFamilyMembers___block_invoke;
          v21[3] = &unk_1E56EC490;
          v21[4] = self;
          v21[5] = v12;
          [(PKPaymentService *)paymentService sendDeviceSharingCapabilitiesRequestForHandle:v12 completion:v21];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }
}

void __96__PKDeviceSharingCapabilitiesManager_fetchDeviceCapabilitesForAppleIDs_associatedFamilyMembers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 20);
  id v6 = a3;
  os_unfair_lock_lock(v5);
  id v7 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKey:*(void *)(a1 + 40)];
  [v7 setMaximumPossibleDevices:a2];
  [v7 setFetchError:v6];

  [v7 setDeviceCountFetchInProgress:0];
  [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  [*(id *)(a1 + 32) _sendDeviceSharingCapabilitiesUpdated:v7 maximumPossibleDevices:a2 forAppleID:*(void *)(a1 + 40)];
}

- (id)currentFetchStatusForAppleID:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    id v6 = [(NSMutableDictionary *)self->_fetchStatusByAppleID objectForKey:v5];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)didReceiveDeviceSharingCapabilities:(id)a3 forHandle:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMutableDictionary *)self->_fetchStatusByAppleID objectForKey:v7];
  if (v9)
  {
LABEL_33:
    [v9 addDeviceSharingCapabilities:v6];
    long long v25 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v7;
      __int16 v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Updating device capabilities for appleID %@, %@", buf, 0x16u);
    }
    goto LABEL_39;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = self->_familyMembers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v11)
  {

    goto LABEL_36;
  }
  uint64_t v12 = v11;
  id v26 = v6;
  uint64_t v9 = 0;
  uint64_t v13 = *(void *)v33;
  id obj = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(obj);
      }
      BOOL v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      id v16 = [v15 appleID];
      id v17 = v7;
      v18 = v17;
      if (v16 == v17)
      {

LABEL_14:
        [(NSMutableDictionary *)self->_fetchStatusByAppleID objectForKey:v18];
        uint64_t v9 = v16 = v9;
        goto LABEL_16;
      }
      if (v7 && v16)
      {
        int v19 = [v16 isEqualToString:v17];

        if (!v19)
        {
          if (v9) {
            goto LABEL_32;
          }
          goto LABEL_17;
        }
        goto LABEL_14;
      }

LABEL_16:
      if (v9)
      {
LABEL_32:

        p_lock = &self->_lock;
        id v6 = v26;
        goto LABEL_33;
      }
LABEL_17:
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v20 = [v15 appleIDAliases];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v9 = 0;
        uint64_t v23 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            if (!v9)
            {
              uint64_t v9 = [(NSMutableDictionary *)self->_fetchStatusByAppleID objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * j)];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v22);
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
    uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v12) {
      continue;
    }
    break;
  }

  p_lock = &self->_lock;
  id v6 = v26;
  if (v9) {
    goto LABEL_33;
  }
LABEL_36:
  long long v25 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v7;
    _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Not responding to device capabilities for appleID %@", buf, 0xCu);
  }
  uint64_t v9 = 0;
LABEL_39:

  os_unfair_lock_unlock(p_lock);
  [(PKDeviceSharingCapabilitiesManager *)self _sendDeviceSharingCapabilitiesUpdated:v9 newSharingCapabilties:v6 forAppleID:v7];
}

- (void)_sendDeviceSharingCapabilitiesUpdated:(id)a3 newSharingCapabilties:(id)a4 forAppleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke;
  v14[3] = &unk_1E56EC4B8;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PKDeviceSharingCapabilitiesManager *)self _accessObserversWithHandler:v14];
}

void __109__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_newSharingCapabilties_forAppleID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 deviceSharingCapabilitiesUpdated:a1[4] newSharingCapabilties:a1[5] forAppleID:a1[6]];
  }
}

- (void)_sendDeviceSharingCapabilitiesUpdated:(id)a3 maximumPossibleDevices:(int64_t)a4 forAppleID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke;
  v12[3] = &unk_1E56EC4E0;
  id v14 = v9;
  int64_t v15 = a4;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(PKDeviceSharingCapabilitiesManager *)self _accessObserversWithHandler:v12];
}

void __110__PKDeviceSharingCapabilitiesManager__sendDeviceSharingCapabilitiesUpdated_maximumPossibleDevices_forAppleID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 deviceSharingCapabilitiesUpdated:a1[4] maximumPossibleDevices:a1[6] forAppleID:a1[5]];
  }
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__PKDeviceSharingCapabilitiesManager__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __66__PKDeviceSharingCapabilitiesManager__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchStatusByAppleID, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end