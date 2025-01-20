@interface TPSPhonebookTelephonyController
- (CTPhoneNumberInfo)phoneNumberInfo;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSString)updatePhoneNumber;
- (TPSPhonebookTelephonyController)init;
- (TPSPhonebookTelephonyController)initWithSubscriptionContext:(id)a3;
- (id)getPhoneNumberInfo;
- (id)getPhoneNumberInfoWithError:(id *)a3;
- (id)updatePhoneNumberInfoCompletion;
- (int64_t)phoneBookEntryCount;
- (void)fetchPhoneNumberInfo;
- (void)fetchPhoneNumberInfoWithCompletion:(id)a3;
- (void)phoneBookSelected:(id)a3;
- (void)phoneNumberChanged:(id)a3;
- (void)savePhoneBookEntryAtIndex:(int)a3 withContactName:(id)a4 contactNumber:(id)a5;
- (void)savePhoneBookEntryAtIndex:(int)a3 withContactName:(id)a4 contactNumber:(id)a5 completion:(id)a6;
- (void)selectPhoneBookWithName:(int)a3 password:(id)a4 completion:(id)a5;
- (void)setPhoneBookEntryCount:(int64_t)a3;
- (void)setPhoneNumberInfo:(id)a3;
- (void)setUpdatePhoneNumber:(id)a3;
- (void)setUpdatePhoneNumberInfoCompletion:(id)a3;
- (void)updatePhoneNumberInfo:(id)a3 label:(id)a4 number:(id)a5 completion:(id)a6;
@end

@implementation TPSPhonebookTelephonyController

- (TPSPhonebookTelephonyController)init
{
  return 0;
}

- (TPSPhonebookTelephonyController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSPhonebookTelephonyController;
  v6 = [(TPSTelephonyController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    [(TPSPhonebookTelephonyController *)v7 fetchPhoneNumberInfo];
  }

  return v7;
}

- (CTPhoneNumberInfo)phoneNumberInfo
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  objc_super v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__TPSPhonebookTelephonyController_phoneNumberInfo__block_invoke;
  v4[3] = &unk_1E6EB2398;
  v4[4] = self;
  v4[5] = &v5;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CTPhoneNumberInfo *)v2;
}

void __50__TPSPhonebookTelephonyController_phoneNumberInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[9];
  if (!v3)
  {
    uint64_t v4 = [v2 getPhoneNumberInfo];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 72);
    *(void *)(v5 + 72) = v4;

    v3 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v7, v3);
}

- (void)setPhoneNumberInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke;
  v6[3] = &unk_1E6EB22C8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TPSTelephonyController *)self performAtomicAccessorBlock:v6];
}

void __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 40);
  v3 = (id *)(*(void *)(a1 + 32) + 72);
  if (*v3 != v2)
  {
    objc_storeStrong(v3, v2);
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_2;
    v5[3] = &unk_1E6EB22C8;
    v5[4] = v4;
    id v6 = *(id *)(a1 + 40);
    [v4 performAtomicDelegateBlock:v5];
  }
}

void __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [*(id *)(a1 + 32) delegateToQueue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector())
        {
          v8 = [*(id *)(a1 + 32) delegateToQueue];
          objc_super v9 = [v8 objectForKey:v7];

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_3;
          block[3] = &unk_1E6EB2180;
          uint64_t v10 = *(void *)(a1 + 32);
          v11 = *(void **)(a1 + 40);
          block[4] = v7;
          block[5] = v10;
          id v13 = v11;
          dispatch_async(v9, block);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t __54__TPSPhonebookTelephonyController_setPhoneNumberInfo___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) phonebookController:*(void *)(a1 + 40) didChangePhoneNumberInfo:*(void *)(a1 + 48)];
}

- (id)getPhoneNumberInfo
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  uint64_t v3 = [(TPSPhonebookTelephonyController *)self getPhoneNumberInfoWithError:&v10];
  id v4 = v10;
  if (v4)
  {
    uint64_t v5 = TPSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = v7;
      objc_super v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v12 = v7;
      __int16 v13 = 2112;
      long long v14 = v9;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_error_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", buf, 0x20u);
    }
  }

  return v3;
}

- (id)getPhoneNumberInfoWithError:(id *)a3
{
  uint64_t v5 = [(TPSTelephonyController *)self telephonyClient];
  uint64_t v6 = [(TPSPhonebookTelephonyController *)self subscriptionContext];
  uint64_t v7 = [v5 getPhoneNumber:v6 error:a3];

  return v7;
}

- (void)fetchPhoneNumberInfo
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__TPSPhonebookTelephonyController_fetchPhoneNumberInfo__block_invoke;
  v2[3] = &unk_1E6EB2A58;
  v2[4] = self;
  v2[5] = a2;
  [(TPSPhonebookTelephonyController *)self fetchPhoneNumberInfoWithCompletion:v2];
}

void __55__TPSPhonebookTelephonyController_fetchPhoneNumberInfo__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) setPhoneNumberInfo:a2];
  if (v5)
  {
    uint64_t v6 = TPSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = *(const char **)(a1 + 40);
      id v9 = v7;
      id v10 = NSStringFromSelector(v8);
      int v11 = 138412802;
      v12 = v7;
      __int16 v13 = 2112;
      long long v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_1E4DD4000, v6, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)fetchPhoneNumberInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(TPSTelephonyController *)self telephonyClient];
  id v5 = [(TPSPhonebookTelephonyController *)self subscriptionContext];
  [v6 getPhoneNumberWithCompletion:v5 completion:v4];
}

- (void)selectPhoneBookWithName:(int)a3 password:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v11 = [(TPSTelephonyController *)self telephonyClient];
  id v10 = [(TPSPhonebookTelephonyController *)self subscriptionContext];
  [v11 selectPhonebook:v10 forPhonebookName:v6 withPassword:v9 completion:v8];
}

- (void)savePhoneBookEntryAtIndex:(int)a3 withContactName:(id)a4 contactNumber:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke;
  v5[3] = &unk_1E6EB26A0;
  v5[4] = self;
  void v5[5] = a2;
  [(TPSPhonebookTelephonyController *)self savePhoneBookEntryAtIndex:*(void *)&a3 withContactName:a4 contactNumber:a4 completion:v5];
}

void __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = TPSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
}

- (void)savePhoneBookEntryAtIndex:(int)a3 withContactName:(id)a4 contactNumber:(id)a5 completion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v14 = [(TPSTelephonyController *)self telephonyClient];
  __int16 v13 = [(TPSPhonebookTelephonyController *)self subscriptionContext];
  [v14 savePhonebookEntry:v13 atIndex:v8 withContactName:v12 contactNumber:v11 completion:v10];
}

- (void)updatePhoneNumberInfo:(id)a3 label:(id)a4 number:(id)a5 completion:(id)a6
{
  id v8 = a6;
  [(TPSPhonebookTelephonyController *)self setUpdatePhoneNumber:a5];
  [(TPSPhonebookTelephonyController *)self setUpdatePhoneNumberInfoCompletion:v8];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__TPSPhonebookTelephonyController_updatePhoneNumberInfo_label_number_completion___block_invoke;
  v9[3] = &unk_1E6EB2340;
  v9[4] = self;
  [(TPSPhonebookTelephonyController *)self selectPhoneBookWithName:2 password:0 completion:v9];
}

uint64_t __81__TPSPhonebookTelephonyController_updatePhoneNumberInfo_label_number_completion___block_invoke(uint64_t result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    id v3 = *(void **)(result + 32);
    id v4 = a2;
    [v3 setUpdatePhoneNumber:0];
    id v5 = [*(id *)(v2 + 32) updatePhoneNumberInfoCompletion];
    ((void (**)(void, id))v5)[2](v5, v4);

    uint64_t v6 = *(void **)(v2 + 32);
    return [v6 setUpdatePhoneNumberInfoCompletion:0];
  }
  return result;
}

- (void)phoneNumberChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(TPSPhonebookTelephonyController *)self subscriptionContext];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      id v11 = NSStringFromSelector(a2);
      int v13 = 138412802;
      id v14 = v9;
      __int16 v15 = 2112;
      id v16 = v11;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "-[%@ %@] for subscription context %@.", (uint8_t *)&v13, 0x20u);
    }
    id v12 = [(TPSPhonebookTelephonyController *)self getPhoneNumberInfo];
    [(TPSPhonebookTelephonyController *)self setPhoneNumberInfo:v12];
  }
}

- (void)phoneBookSelected:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(TPSPhonebookTelephonyController *)self subscriptionContext];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    id v8 = [(TPSPhonebookTelephonyController *)self updatePhoneNumber];

    if (v8)
    {
      id v9 = TPSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_opt_class();
        id v11 = v10;
        NSStringFromSelector(a2);
        id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v27 = v10;
        __int16 v28 = 2112;
        v29 = v12;
        __int16 v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_1E4DD4000, v9, OS_LOG_TYPE_DEFAULT, "-[%@ %@] for subscription context %@.", buf, 0x20u);
      }
      int v13 = [(TPSPhonebookTelephonyController *)self updatePhoneNumber];
      id v14 = objc_msgSend(NSString, "tps_stringWithCTPhoneBookName:", 2);
      __int16 v15 = TPSLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413314;
        v27 = v6;
        __int16 v28 = 2112;
        v29 = @"My Number";
        __int16 v30 = 2112;
        v31 = v13;
        __int16 v32 = 2112;
        v33 = v14;
        __int16 v34 = 1024;
        int v35 = 1;
        _os_log_impl(&dword_1E4DD4000, v15, OS_LOG_TYPE_DEFAULT, "Updating phone number (subscriptionContext: %@, label: %@, number: %@, selectedPhoneBookName: %@, index: %u).", buf, 0x30u);
      }

      id v16 = [(TPSTelephonyController *)self telephonyClient];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__TPSPhonebookTelephonyController_phoneBookSelected___block_invoke;
      v19[3] = &unk_1E6EB2A80;
      id v20 = v6;
      v21 = @"My Number";
      id v22 = v13;
      id v23 = v14;
      int v25 = 1;
      v24 = self;
      id v17 = v14;
      id v18 = v13;
      [v16 savePhonebookEntry:v20 atIndex:1 withContactName:@"My Number" contactNumber:v18 completion:v19];
    }
  }
}

void __53__TPSPhonebookTelephonyController_phoneBookSelected___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    int v9 = *(_DWORD *)(a1 + 72);
    int v11 = 138413570;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    uint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = v9;
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Received response for update phone number (subscriptionContext: %@, label: %@, number: %@, selectedPhoneBookName: %@, index: %u, error: %@).", (uint8_t *)&v11, 0x3Au);
  }

  [*(id *)(a1 + 64) setUpdatePhoneNumber:0];
  id v10 = [*(id *)(a1 + 64) updatePhoneNumberInfoCompletion];
  ((void (**)(void, id))v10)[2](v10, v3);

  [*(id *)(a1 + 64) setUpdatePhoneNumberInfoCompletion:0];
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (int64_t)phoneBookEntryCount
{
  return self->_phoneBookEntryCount;
}

- (void)setPhoneBookEntryCount:(int64_t)a3
{
  self->_phoneBookEntryCount = a3;
}

- (NSString)updatePhoneNumber
{
  return self->_updatePhoneNumber;
}

- (void)setUpdatePhoneNumber:(id)a3
{
}

- (id)updatePhoneNumberInfoCompletion
{
  return self->_updatePhoneNumberInfoCompletion;
}

- (void)setUpdatePhoneNumberInfoCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updatePhoneNumberInfoCompletion, 0);
  objc_storeStrong((id *)&self->_updatePhoneNumber, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_phoneNumberInfo, 0);
}

void __91__TPSPhonebookTelephonyController_savePhoneBookEntryAtIndex_withContactName_contactNumber___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(const char **)(a1 + 40);
  id v8 = v6;
  int v9 = NSStringFromSelector(v7);
  int v10 = 138412802;
  int v11 = v6;
  __int16 v12 = 2112;
  __int16 v13 = v9;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_1E4DD4000, a3, OS_LOG_TYPE_ERROR, "-[%@ %@] failed with error %@.", (uint8_t *)&v10, 0x20u);
}

@end