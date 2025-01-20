@interface PKSafariCredentialsUtilities
+ (void)_retrieveSafariCredentials:(id)a3;
+ (void)hasSafariCredentials:(id)a3;
+ (void)retrieveSafariCredentials:(id)a3;
@end

@implementation PKSafariCredentialsUtilities

+ (void)hasSafariCredentials:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKSafariCredentialsUtilities_hasSafariCredentials___block_invoke;
  v5[3] = &unk_1E56EC270;
  id v6 = v3;
  id v4 = v3;
  +[PKSafariCredentialsUtilities _retrieveSafariCredentials:v5];
}

void __53__PKSafariCredentialsUtilities_hasSafariCredentials___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  if (a4) {
    [a4 count];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)retrieveSafariCredentials:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PKSafariCredentialsUtilities_retrieveSafariCredentials___block_invoke;
  v5[3] = &unk_1E56EC270;
  id v6 = v3;
  id v4 = v3;
  +[PKSafariCredentialsUtilities _retrieveSafariCredentials:v5];
}

void __58__PKSafariCredentialsUtilities_retrieveSafariCredentials___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a2)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[PKPaymentSafariCredential alloc] initWithSafariDictionary:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          v14 = v13;
          if (v13 && [(PKPaymentSafariCredential *)v13 canCheckEligibility])
          {
            [v7 addObject:v14];
          }
          else
          {
            v15 = PKLogFacilityTypeGetObject(6uLL);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Not adding Safari credential: Either missing required fields, or card has expired, so can't check eligibility", buf, 2u);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v10);
    }

    v16 = [v7 array];
    v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v7 count];
      uint64_t v19 = [v8 count];
      uint64_t v20 = [v7 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = v18;
      __int16 v28 = 2048;
      uint64_t v29 = v19 - v20;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Got %lu Safari Cards, after filtering out %lu duplicates/invalid.", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = v21;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (void)_retrieveSafariCredentials:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      id v4 = dispatch_get_global_queue(0, 0);
      uint64_t v21 = 0;
      long long v22 = &v21;
      uint64_t v23 = 0x3032000000;
      long long v24 = __Block_byref_object_copy__43;
      long long v25 = __Block_byref_object_dispose__43;
      dispatch_source_t v26 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
      v5 = v22[5];
      dispatch_time_t v6 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      char v20 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke;
      aBlock[3] = &unk_1E56EC298;
      v17 = &v21;
      uint64_t v18 = v19;
      id v16 = v3;
      v7 = _Block_copy(aBlock);
      id v8 = v22[5];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_2;
      handler[3] = &unk_1E56D8360;
      id v9 = v7;
      id v14 = v9;
      dispatch_source_set_event_handler(v8, handler);
      dispatch_resume((dispatch_object_t)v22[5]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_14;
      block[3] = &unk_1E56D8360;
      id v12 = v9;
      id v10 = v9;
      dispatch_async(v4, block);

      _Block_object_dispose(v19, 8);
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      (*((void (**)(id, void, void, void))v3 + 2))(v3, 0, 0, MEMORY[0x1E4F1CBF0]);
    }
  }
}

void __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v13 = a3;
  id v7 = a4;
  id v8 = *(NSObject **)(*(void *)(a1[5] + 8) + 40);
  if (v8)
  {
    dispatch_source_cancel(v8);
    uint64_t v9 = *(void *)(a1[5] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  uint64_t v11 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v11 + 24))
  {
    *(unsigned char *)(v11 + 24) = 1;
    uint64_t v12 = a1[4];
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, id, id))(v12 + 16))(v12, a2, v13, v7);
    }
  }
}

uint64_t __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_2(uint64_t a1)
{
  v2 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Timeout occured for -[PKPaymentProvisioningController retrieveSafariCredentials:]", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__PKSafariCredentialsUtilities__retrieveSafariCredentials___block_invoke_14(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v2 = [(Class)getSFSafariCreditCardStoreClass[0]() savedCreditCardsWithError:&v6];
  id v3 = v6;
  if (v2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Couldn't get credentials from Safari: %@", buf, 0xCu);
    }

    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
}

@end