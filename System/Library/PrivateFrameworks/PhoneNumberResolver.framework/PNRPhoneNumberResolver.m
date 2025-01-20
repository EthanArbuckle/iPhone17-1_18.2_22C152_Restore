@interface PNRPhoneNumberResolver
- (PNRPhoneNumberResolver)init;
- (id)_notAPhoneNumberError;
- (id)_notFullyQualifiedError;
- (id)resolvePhoneNumber:(id)a3 countryCode:(id)a4 error:(id *)a5;
- (void)_recordUsageAnalyticForCountryCode:(id)a3 success:(BOOL)a4;
- (void)resolveFullyQualifiedPhoneNumber:(id)a3 inCountry:(id)a4 logId:(id)a5 resultBlock:(id)a6;
- (void)resolvePhoneNumbers:(id)a3 handler:(id)a4 queue:(id)a5;
- (void)resolvePhoneNumbers:(id)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation PNRPhoneNumberResolver

id __69__PNRPhoneNumberResolver__recordUsageAnalyticForCountryCode_success___block_invoke(uint64_t a1)
{
  v7[3] = *MEMORY[0x263EF8340];
  v7[0] = &unk_26ECC8D58;
  v6[0] = @"Count";
  v6[1] = @"cc";
  v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
  v7[1] = v2;
  v6[2] = @"success";
  v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
  v7[2] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)resolvePhoneNumber:(id)a3 countryCode:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263F08C38]);
  v11 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_23974B000, v11, OS_LOG_TYPE_INFO, "[%{public}@] resolving %{private}@ synchronously", buf, 0x16u);
  }
  v12 = +[PNRUtils _stringByStrippingFormattingAndNotVisiblyAllowable:v8];
  if (!+[PNRUtils _isValidPhoneNumber:v12])
  {
    v15 = [(PNRPhoneNumberResolver *)self _notAPhoneNumberError];
    id v13 = v15;
    if (a5) {
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (([v12 hasPrefix:@"+"] & 1) == 0)
  {
    v15 = [(PNRPhoneNumberResolver *)self _notFullyQualifiedError];
    id v13 = v15;
    if (a5)
    {
LABEL_11:
      id v13 = v15;
      id v14 = 0;
      *a5 = v13;
      goto LABEL_13;
    }
LABEL_12:
    id v14 = 0;
    goto LABEL_13;
  }
  id v13 = [v12 substringFromIndex:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__PNRPhoneNumberResolver_resolvePhoneNumber_countryCode_error___block_invoke;
  v17[3] = &unk_264D9F6D0;
  v17[4] = buf;
  v17[5] = &v18;
  [(PNRPhoneNumberResolver *)self resolveFullyQualifiedPhoneNumber:v13 inCountry:v9 logId:v10 resultBlock:v17];
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v14 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(buf, 8);
LABEL_13:

  return v14;
}

- (void)resolveFullyQualifiedPhoneNumber:(id)a3 inCountry:(id)a4 logId:(id)a5 resultBlock:(id)a6
{
  v63[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, uint64_t, void *))a6;
  id v14 = +[PNRResourceManager sharedManager];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy_;
  v60 = __Block_byref_object_dispose_;
  id v61 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy_;
  v50 = __Block_byref_object_dispose_;
  id v51 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  id v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke;
  v26 = &unk_264D9F770;
  id v15 = v12;
  id v27 = v15;
  v31 = &v46;
  v32 = &v40;
  id v16 = v10;
  id v28 = v16;
  id v17 = v14;
  id v29 = v17;
  id v18 = v11;
  id v30 = v18;
  v33 = &v52;
  v34 = &v36;
  v35 = &v56;
  [v17 lookupCCForPhoneNumber:v16 logId:v15 withResult:&v23];
  if (v57[5])
  {
    v19 = 0;
  }
  else
  {
    uint64_t v20 = v41[5];
    if (v20)
    {
      v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v62 = *MEMORY[0x263F08608];
      v63[0] = v20;
      v22 = [NSDictionary dictionaryWithObjects:v63 forKeys:&v62 count:1];
      v19 = [v21 errorWithDomain:@"PNRError" code:1 userInfo:v22];
    }
    else
    {
      v19 = 0;
    }
  }
  -[PNRPhoneNumberResolver _recordUsageAnalyticForCountryCode:success:](self, "_recordUsageAnalyticForCountryCode:success:", v47[5], *((unsigned __int8 *)v37 + 24), v13, v23, v24, v25, v26);
  v13[2](v13, v57[5], v53[3], v19);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
}

void __63__PNRPhoneNumberResolver_resolvePhoneNumber_countryCode_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_76(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    uint64_t v10 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543619;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_23974B000, v10, OS_LOG_TYPE_INFO, "[%{public}@] found result in db for phNo %{private}@", buf, 0x16u);
    }
LABEL_16:
    v26 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543875;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2113;
      id v51 = v7;
      _os_log_impl(&dword_23974B000, v26, OS_LOG_TYPE_INFO, "[%{public}@] resolved %{private}@ to %{private}@", buf, 0x20u);
    }
    goto LABEL_21;
  }
  if (v8)
  {
    id v13 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 48);
      *(_DWORD *)buf = 138544131;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2113;
      id v51 = v16;
      LOWORD(v52) = 2114;
      *(void *)((char *)&v52 + 2) = v9;
      _os_log_impl(&dword_23974B000, v13, OS_LOG_TYPE_INFO, "[%{public}@] lookup of %{private}@ in %{private}@ ended in error (%{public}@)", buf, 0x2Au);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), a4);
  }
  id v17 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = *(void *)(a1 + 32);
    uint64_t v19 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v19;
    _os_log_impl(&dword_23974B000, v17, OS_LOG_TYPE_INFO, "[%{public}@] using only cc of %{public}@ for resolution", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v51 = __Block_byref_object_copy_;
  *(void *)&long long v52 = __Block_byref_object_dispose_;
  *((void *)&v52 + 1) = 0;
  if ([*(id *)(a1 + 48) isEqualToString:@"1"])
  {
    uint64_t v20 = *(void **)(a1 + 56);
    v21 = *(void **)(a1 + 32);
    uint64_t v22 = *(void *)(a1 + 40);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_80;
    v47[3] = &unk_264D9F6F8;
    v49[1] = *(void *)(a1 + 80);
    id v48 = v21;
    v49[0] = *(id *)(a1 + 40);
    v49[2] = buf;
    v49[3] = *(void *)(a1 + 72);
    [v20 lookupISOCountryCodeFromNANPNumber:v22 logId:v48 withResult:v47];
    uint64_t v23 = &v48;
    uint64_t v24 = (id *)v49;
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 48);
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_82;
    v44[3] = &unk_264D9F6F8;
    v46[1] = *(void *)(a1 + 80);
    id v45 = *(id *)(a1 + 32);
    v46[0] = *(id *)(a1 + 40);
    v46[2] = buf;
    v46[3] = *(void *)(a1 + 72);
    +[PNRUtils _countryCodeFromInternationalCode:v25 result:v44];
    uint64_t v23 = &v45;
    uint64_t v24 = (id *)v46;
  }

  id v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)&buf[8] + 40);
  if (v7)
  {
    uint64_t v38 = 0;
    char v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    uint64_t v42 = __Block_byref_object_dispose_;
    id v43 = 0;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_83;
    v33[3] = &unk_264D9F720;
    uint64_t v35 = *(void *)(a1 + 80);
    id v34 = *(id *)(a1 + 32);
    uint64_t v36 = buf;
    v37 = &v38;
    +[PNRUtils _localizedCountryNameForISOCountryCode:v7 result:v33];
    id v7 = (uint64_t (*)(uint64_t, uint64_t))(id)v39[5];

    _Block_object_dispose(&v38, 8);
  }
  _Block_object_dispose(buf, 8);

  if (v7) {
    goto LABEL_16;
  }
  id v29 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_76_cold_1((void *)a1, v29);
  }
  id v7 = 0;
LABEL_21:
  uint64_t v30 = *(void *)(*(void *)(a1 + 96) + 8);
  v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v7;
  v32 = v7;
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v9;
      __int16 v42 = 2114;
      id v43 = v7;
      _os_log_impl(&dword_23974B000, v8, OS_LOG_TYPE_INFO, "[%{public}@] couldn't determine cc (%{public}@)", buf, 0x16u);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = @"1000";

    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    id v13 = v7;
    id v14 = *(id *)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    uint64_t v15 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543875;
      uint64_t v41 = v16;
      __int16 v42 = 2114;
      id v43 = v6;
      __int16 v44 = 2113;
      uint64_t v45 = v17;
      _os_log_impl(&dword_23974B000, v15, OS_LOG_TYPE_INFO, "[%{public}@] determined cc %{public}@ for %{private}@", buf, 0x20u);
    }
    uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "substringFromIndex:", objc_msgSend(v6, "length"));
    uint64_t v19 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543619;
      uint64_t v41 = v20;
      __int16 v42 = 2113;
      id v43 = v18;
      _os_log_impl(&dword_23974B000, v19, OS_LOG_TYPE_INFO, "[%{public}@] now resolving %{private}@", buf, 0x16u);
    }
    uint64_t v22 = *(void **)(a1 + 48);
    uint64_t v21 = *(void *)(a1 + 56);
    uint64_t v23 = *(void **)(a1 + 32);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_76;
    v30[3] = &unk_264D9F748;
    uint64_t v36 = *(void *)(a1 + 80);
    id v31 = v23;
    id v32 = v18;
    id v24 = v6;
    uint64_t v25 = *(void *)(a1 + 72);
    id v33 = v24;
    uint64_t v37 = v25;
    id v26 = *(id *)(a1 + 48);
    uint64_t v27 = *(void *)(a1 + 88);
    id v34 = v26;
    uint64_t v38 = v27;
    id v28 = *(id *)(a1 + 40);
    uint64_t v29 = *(void *)(a1 + 96);
    id v35 = v28;
    uint64_t v39 = v29;
    id v14 = v18;
    [v22 lookupStringForPhoneNumber:v14 inCC:v24 countryCodeOfDevice:v21 logId:v31 withResult:v30];
  }
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_80(void *a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    if (*(void *)(v9 + 40))
    {
      id v10 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v11 = [v8 domain];
      uint64_t v12 = [v8 code];
      uint64_t v13 = *(void *)(*(void *)(a1[6] + 8) + 40);
      uint64_t v19 = *MEMORY[0x263F08608];
      v20[0] = v13;
      id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v15 = [v10 initWithDomain:v11 code:v12 userInfo:v14];
      uint64_t v16 = *(void *)(a1[6] + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    else
    {
      id v18 = v7;
      uint64_t v11 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v18;
    }

    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_80_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *(void *)(*(void *)(a1[8] + 8) + 24) = 2;
  }
}

- (void)_recordUsageAnalyticForCountryCode:(id)a3 success:(BOOL)a4
{
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_83(uint64_t a1, void *a2, void *a3)
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(void *)(v9 + 40))
    {
      id v10 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v11 = [v8 domain];
      uint64_t v12 = [v8 code];
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v20 = *MEMORY[0x263F08608];
      v21[0] = v13;
      id v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      uint64_t v15 = [v10 initWithDomain:v11 code:v12 userInfo:v14];
      uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    else
    {
      id v18 = v7;
      uint64_t v11 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v18;
    }

    uint64_t v19 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_83_cold_1(a1, (uint64_t)v8, v19);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
}

- (PNRPhoneNumberResolver)init
{
  v7.receiver = self;
  v7.super_class = (Class)PNRPhoneNumberResolver;
  v2 = [(PNRPhoneNumberResolver *)&v7 init];
  if (v2)
  {
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, &__block_literal_global_0);
    }
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PhoneNumberResolver.resolve", v3);
    resolveQueue = v2->_resolveQueue;
    v2->_resolveQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

uint64_t __30__PNRPhoneNumberResolver_init__block_invoke()
{
  _log = (uint64_t)os_log_create("com.apple.PhoneNumberResolver", "Resolver");

  return MEMORY[0x270F9A758]();
}

- (id)_notAPhoneNumberError
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"not a phone number";
  dispatch_queue_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v3 errorWithDomain:@"PNRError" code:2 userInfo:v4];

  [(PNRPhoneNumberResolver *)self _recordUsageAnalyticForCountryCode:@"10" success:0];

  return v5;
}

- (id)_notFullyQualifiedError
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F07F80];
  v8[0] = @"not fully qualified";
  dispatch_queue_t v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v3 errorWithDomain:@"PNRError" code:3 userInfo:v4];

  [(PNRPhoneNumberResolver *)self _recordUsageAnalyticForCountryCode:@"100" success:0];

  return v5;
}

- (void)resolvePhoneNumbers:(id)a3 handler:(id)a4 queue:(id)a5
{
}

- (void)resolvePhoneNumbers:(id)a3 queue:(id)a4 handler:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  queue = a4;
  id v30 = a5;
  id v35 = objc_alloc_init(PNRPhoneNumberResolutionResultSet);
  uint64_t v36 = +[PNRUtils _currentCountry];
  group = dispatch_group_create();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v34 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v13 = objc_alloc_init(MEMORY[0x263F08C38]);
        id v14 = [v12 objectForKeyedSubscript:@"kGEOPhoneNumberKey"];
        uint64_t v15 = [v12 objectForKeyedSubscript:@"kGEOPhoneNumberCountryKey"];
        uint64_t v16 = (void *)v15;
        uint64_t v17 = v36;
        if (v15) {
          uint64_t v17 = (void *)v15;
        }
        id v18 = v17;

        uint64_t v19 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543619;
          id v52 = v13;
          __int16 v53 = 2113;
          uint64_t v54 = v14;
          _os_log_impl(&dword_23974B000, v19, OS_LOG_TYPE_INFO, "[%{public}@] resolving %{private}@ asynchronously", buf, 0x16u);
        }
        uint64_t v20 = +[PNRUtils _stringByStrippingFormattingAndNotVisiblyAllowable:v14];
        if (!+[PNRUtils _isValidPhoneNumber:v20])
        {
          id v23 = [(PNRPhoneNumberResolver *)self _notAPhoneNumberError];
          [(PNRPhoneNumberResolutionResultSet *)v35 setError:v23 forPhoneNumber:v14];
          uint64_t v24 = _log;
          if (!os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO)) {
            goto LABEL_18;
          }
          *(_DWORD *)buf = 138543619;
          id v52 = v13;
          __int16 v53 = 2113;
          uint64_t v54 = v14;
          uint64_t v25 = v24;
          id v26 = "[%{public}@] '%{private}@' is not a valid phone number";
          goto LABEL_17;
        }
        if ([v20 hasPrefix:@"+"])
        {
          uint64_t v21 = [v20 substringFromIndex:1];
          dispatch_group_enter(group);
          resolveQueue = self->_resolveQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke;
          block[3] = &unk_264D9F680;
          block[4] = self;
          id v41 = v21;
          id v42 = v18;
          id v43 = v13;
          __int16 v44 = v35;
          id v45 = v14;
          uint64_t v46 = group;
          id v23 = v21;
          dispatch_async(resolveQueue, block);

          goto LABEL_18;
        }
        id v23 = [(PNRPhoneNumberResolver *)self _notFullyQualifiedError];
        [(PNRPhoneNumberResolutionResultSet *)v35 setError:v23 forPhoneNumber:v14];
        uint64_t v27 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543619;
          id v52 = v13;
          __int16 v53 = 2113;
          uint64_t v54 = v14;
          uint64_t v25 = v27;
          id v26 = "[%{public}@] '%{private}@' is not a fully qualified phone number";
LABEL_17:
          _os_log_impl(&dword_23974B000, v25, OS_LOG_TYPE_INFO, v26, buf, 0x16u);
        }
LABEL_18:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v10);
  }

  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_71;
  v37[3] = &unk_264D9F6A8;
  uint64_t v38 = v35;
  id v39 = v30;
  id v28 = v35;
  id v29 = v30;
  dispatch_group_notify(group, queue, v37);
}

void __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_2;
  void v6[3] = &unk_264D9F658;
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 80);
  [v2 resolveFullyQualifiedPhoneNumber:v3 inCountry:v4 logId:v5 resultBlock:v6];
}

void __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    [*(id *)(a1 + 32) setResult:v7 resultDataSource:a3 forPhoneNumber:*(void *)(a1 + 40)];
    id v10 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 56);
      int v20 = 138544131;
      uint64_t v21 = v11;
      __int16 v22 = 2113;
      uint64_t v23 = v12;
      __int16 v24 = 2113;
      uint64_t v25 = v13;
      __int16 v26 = 2113;
      id v27 = v7;
      id v14 = "[%{public}@] result for '%{private}@/%{private}@' is '%{private}@'";
LABEL_8:
      _os_log_impl(&dword_23974B000, v10, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F07F80];
      v29[0] = @"no result";
      uint64_t v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v9 = [v15 errorWithDomain:@"PNRError" code:1 userInfo:v16];
    }
    [*(id *)(a1 + 32) setError:v9 forPhoneNumber:*(void *)(a1 + 40)];
    id v10 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v19 = *(void *)(a1 + 56);
      int v20 = 138544131;
      uint64_t v21 = v17;
      __int16 v22 = 2113;
      uint64_t v23 = v18;
      __int16 v24 = 2113;
      uint64_t v25 = v19;
      __int16 v26 = 2114;
      id v27 = v9;
      id v14 = "[%{public}@] no result found for '%{private}@'/'%{private}@' (%{public}@)";
      goto LABEL_8;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __60__PNRPhoneNumberResolver_resolvePhoneNumbers_queue_handler___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_82(void *a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)(a1[6] + 8);
    if (*(void *)(v9 + 40))
    {
      id v10 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v11 = [v8 domain];
      uint64_t v12 = [v8 code];
      uint64_t v13 = *(void *)(*(void *)(a1[6] + 8) + 40);
      uint64_t v19 = *MEMORY[0x263F08608];
      v20[0] = v13;
      id v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v15 = [v10 initWithDomain:v11 code:v12 userInfo:v14];
      uint64_t v16 = *(void *)(a1[6] + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    else
    {
      id v18 = v7;
      uint64_t v11 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v18;
    }

    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_82_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    *(void *)(*(void *)(a1[8] + 8) + 24) = 3;
  }
}

- (void).cxx_destruct
{
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_76_cold_1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[8];
  uint64_t v4 = *(void *)(*(void *)(a1[10] + 8) + 40);
  int v5 = 138543875;
  uint64_t v6 = v2;
  __int16 v7 = 2113;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_23974B000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] didn't resolved %{private}@ : %{public}@", (uint8_t *)&v5, 0x20u);
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_23974B000, v0, v1, "[%{public}@] country lookup failure for NANP number %{private}@ (%{public}@)");
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_82_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_23974B000, v0, v1, "[%{public}@] country lookup failure for non-NANP number %{private}@ (%{public}@)");
}

void __87__PNRPhoneNumberResolver_resolveFullyQualifiedPhoneNumber_inCountry_logId_resultBlock___block_invoke_83_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543874;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_1_0(&dword_23974B000, a2, a3, "[%{public}@] localized country name lookup failure for country code %{public}@ (%{public}@)", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

@end