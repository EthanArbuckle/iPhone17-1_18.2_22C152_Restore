@interface PKPaymentCloudStoreZoneCreationManager
- (PKPaymentCloudStoreZoneCreationManager)initWithWebService:(id)a3;
- (void)triggerCloudStoreZoneCreationIfNeededForEligibilityResponse:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentCloudStoreZoneCreationManager

- (PKPaymentCloudStoreZoneCreationManager)initWithWebService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentCloudStoreZoneCreationManager;
  v6 = [(PKPaymentCloudStoreZoneCreationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webService, a3);
  }

  return v7;
}

- (void)triggerCloudStoreZoneCreationIfNeededForEligibilityResponse:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 supplementaryData];
    objc_super v9 = [v8 lightweightAccount];

    if (v9)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__83;
      v27 = __Block_byref_object_dispose__83;
      dispatch_source_t v28 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      v10 = *(NSObject **)(*((void *)&buf + 1) + 40);
      dispatch_time_t v11 = dispatch_time(0, 120000000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      v12 = *(NSObject **)(*((void *)&buf + 1) + 40);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke;
      handler[3] = &unk_1E56F2380;
      id v13 = v9;
      id v21 = v13;
      p_long long buf = &buf;
      id v14 = v7;
      id v22 = v14;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume(*(dispatch_object_t *)(*((void *)&buf + 1) + 40));
      v15 = [(PKPaymentWebService *)self->_webService targetDevice];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke_11;
      v17[3] = &unk_1E56F5768;
      v19 = &buf;
      id v18 = v14;
      [v15 triggerCloudStoreZoneCreationForAccount:v13 withCompletion:v17];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v16 = PKLogFacilityTypeGetObject(0xEuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "No account found, skipping cloud store zone creation for eligibility response %@", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
    }
  }
}

NSObject *__113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Timed out waiting for cloud store zone creation for account %@", (uint8_t *)&v7, 0xCu);
  }

  result = *(NSObject **)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    uint64_t v5 = *(void *)(a1[6] + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

NSObject *__113__PKPaymentCloudStoreZoneCreationManager_triggerCloudStoreZoneCreationIfNeededForEligibilityResponse_completion___block_invoke_11(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"NO";
    if (a2) {
      uint64_t v5 = @"YES";
    }
    int v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Cloud store zone creation triggered with success: %@", (uint8_t *)&v9, 0xCu);
  }

  result = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    dispatch_source_cancel(result);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end