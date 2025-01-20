@interface NDOServerVersionUtilities
+ (BOOL)isHighServerVersionFeaturesetEnabled;
+ (id)clientConfig;
+ (id)getValidServerVersionCache;
+ (id)readAPSSupportedOverride;
+ (id)readULWebURLOverride;
+ (id)readWebURLOverride;
+ (void)_dictionaryFromURL:(id)a3 shouldRetry:(BOOL)a4 withCompletion:(id)a5;
+ (void)_supportedVersionsForClientAndServer:(unint64_t)a3 withCompletion:(id)a4;
+ (void)getDecodedParamsForPath:(id)a3 withCompletion:(id)a4;
+ (void)getValidServerVersionCache;
+ (void)isHighServerVersionFeaturesetEnabled:(id)a3;
+ (void)isHighServerVersionFeaturesetEnabled:(unint64_t)a3 withCompletion:(id)a4;
+ (void)readAPSSupportedOverride;
+ (void)serverVersionSupported:(id)a3;
@end

@implementation NDOServerVersionUtilities

+ (void)_dictionaryFromURL:(id)a3 shouldRetry:(BOOL)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__2;
  v21[4] = __Block_byref_object_dispose__2;
  id v22 = 0;
  if (a4)
  {
    v10 = [MEMORY[0x263F08BF8] sharedSession];
  }
  else
  {
    v11 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v11 setRequestCachePolicy:1];
    v10 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v11];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke;
  v15[3] = &unk_264E26630;
  v18 = v21;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  BOOL v20 = a4;
  id v17 = v13;
  id v19 = a1;
  v14 = [v10 dataTaskWithURL:v12 completionHandler:v15];
  [v14 resume];

  _Block_object_dispose(v21, 8);
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2)
  {
    id v16 = 0;
    uint64_t v7 = [MEMORY[0x263F08AC0] propertyListWithData:a2 options:0 format:0 error:&v16];
    id v8 = v16;
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;

    if (v8)
    {
      v11 = _NDOLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_4();
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && *(unsigned char *)(a1 + 64))
      {
        v14 = _NDOLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_3();
        }

        [*(id *)(a1 + 56) _dictionaryFromURL:*(void *)(a1 + 32) shouldRetry:0 withCompletion:*(void *)(a1 + 40)];
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || *(unsigned char *)(a1 + 64))
      {
        id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        goto LABEL_18;
      }
      v15 = _NDOLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_2();
      }
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_18:
    v12();
LABEL_19:

    goto LABEL_20;
  }
  id v13 = _NDOLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_20:
}

+ (void)_supportedVersionsForClientAndServer:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__2;
  v54[4] = __Block_byref_object_dispose__2;
  id v55 = 0;
  uint64_t v48 = 0;
  v49 = (id *)&v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2;
  v52 = __Block_byref_object_dispose__2;
  uint64_t v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v53 = [v7 objectForKey:@"ServerVersionOverride"];

  id v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v59 = a3;
    _os_log_impl(&dword_23C013000, v8, OS_LOG_TYPE_DEFAULT, " Server lookup policy:%ld", buf, 0xCu);
  }

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke;
  v44[3] = &unk_264E26658;
  v46 = &v48;
  id v9 = v6;
  id v45 = v9;
  v47 = v54;
  v10 = (void (**)(void, void))MEMORY[0x23ECD9670](v44);
  if (!v49[5])
  {
    v14 = +[NDOServerVersionUtilities getValidServerVersionCache];
    if (a3 == 1)
    {
      objc_storeStrong(v49 + 5, v14);
      if (v49[5])
      {
        BOOL v20 = _NDOLogSystem();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v21 = (unint64_t)v49[5];
          *(_DWORD *)buf = 138412290;
          unint64_t v59 = v21;
          _os_log_impl(&dword_23C013000, v20, OS_LOG_TYPE_DEFAULT, "Using Cached Server version: %@", buf, 0xCu);
        }
      }
      else
      {
        id v22 = NSNumber;
        v23 = [MEMORY[0x263EFFA40] standardUserDefaults];
        uint64_t v24 = objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "integerForKey:", @"LowServerVersion"));
        v25 = (void *)v24;
        v26 = &unk_26EFA4F78;
        if (v24) {
          v26 = (void *)v24;
        }
        BOOL v20 = v26;

        v27 = NSNumber;
        v28 = [MEMORY[0x263EFFA40] standardUserDefaults];
        uint64_t v29 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "integerForKey:", @"HighServerVersion"));
        v30 = (void *)v29;
        v31 = &unk_26EFA4F90;
        if (v29) {
          v31 = (void *)v29;
        }
        id v32 = v31;

        v56[0] = @"LowServerVersion";
        v56[1] = @"HighServerVersion";
        v57[0] = v20;
        v57[1] = v32;
        uint64_t v33 = [NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:2];
        id v34 = v49[5];
        v49[5] = (id)v33;

        v35 = _NDOLogSystem();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v36 = (unint64_t)v49[5];
          *(_DWORD *)buf = 138412290;
          unint64_t v59 = v36;
          _os_log_impl(&dword_23C013000, v35, OS_LOG_TYPE_DEFAULT, "Using Client version: %@", buf, 0xCu);
        }
      }
      ((void (**)(void, id))v10)[2](v10, v49[5]);
      goto LABEL_25;
    }
    if (a3 == 2)
    {
      v15 = NSURL;
      id v16 = [MEMORY[0x263EFFA40] standardUserDefaults];
      id v17 = [v16 objectForKey:@"ServerVersionURL"];
      v18 = [v15 URLWithString:v17];

      id v19 = v41;
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_23;
      v41[3] = &unk_264E26680;
      v43 = &v48;
      v41[4] = v14;
      v42 = v10;
      [a1 _dictionaryFromURL:v18 shouldRetry:1 withCompletion:v41];
    }
    else
    {
      if (v49[5] || (objc_storeStrong(v49 + 5, v14), v49[5]))
      {
        ((void (*)(void (**)(void, void)))v10[2])(v10);
        goto LABEL_25;
      }
      v37 = NSURL;
      v38 = [MEMORY[0x263EFFA40] standardUserDefaults];
      v39 = [v38 objectForKey:@"ServerVersionURL"];
      v18 = [v37 URLWithString:v39];

      id v19 = v40;
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_27;
      v40[3] = &unk_264E264E8;
      v40[5] = &v48;
      v40[4] = v10;
      [a1 _dictionaryFromURL:v18 shouldRetry:1 withCompletion:v40];
    }

LABEL_25:
    goto LABEL_26;
  }
  v11 = _NDOLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = (unint64_t)v49[5];
    *(_DWORD *)buf = 138412290;
    unint64_t v59 = v12;
    _os_log_impl(&dword_23C013000, v11, OS_LOG_TYPE_DEFAULT, "Using Overridden Server version  %@", buf, 0xCu);
  }

  id v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 setObject:v49[5] forKey:@"ServerVersionCache"];

  ((void (**)(void, id))v10)[2](v10, v49[5]);
LABEL_26:

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(v54, 8);
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = *(void **)(*(void *)(a1[5] + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v37 = v6;
    _os_log_impl(&dword_23C013000, v5, OS_LOG_TYPE_DEFAULT, "Server version  %@", buf, 0xCu);
  }

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_4();
    }
LABEL_11:

    (*(void (**)(void))(a1[4] + 16))();
    goto LABEL_36;
  }
  uint64_t v7 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:@"LowServerVersion"];
  if (_NSIsNSString())
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v7;
  }
  v10 = v8;
  if (!v8)
  {
    id v13 = _NDOLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_2(v13);
    }

    (*(void (**)(void))(a1[4] + 16))();
    goto LABEL_32;
  }
  v11 = [*(id *)(*(void *)(a1[5] + 8) + 40) objectForKey:@"HighServerVersion"];

  if (_NSIsNSString())
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "integerValue"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v11;
  }
  v14 = v12;
  if (v12)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v10, v12, 0);
    uint64_t v16 = *(void *)(a1[6] + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    v18 = _NDOLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = *(void **)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v37 = v19;
      _os_log_impl(&dword_23C013000, v18, OS_LOG_TYPE_DEFAULT, "Server versions '%@'", buf, 0xCu);
    }

    BOOL v20 = NSNumber;
    unint64_t v21 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "integerForKey:", @"LowServerVersion"));
    v23 = (void *)v22;
    uint64_t v24 = &unk_26EFA4F78;
    if (v22) {
      uint64_t v24 = (void *)v22;
    }
    id v25 = v24;

    v26 = NSNumber;
    v27 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v28 = objc_msgSend(v26, "numberWithInteger:", objc_msgSend(v27, "integerForKey:", @"HighServerVersion"));
    uint64_t v29 = (void *)v28;
    v30 = &unk_26EFA4F90;
    if (v28) {
      v30 = (void *)v28;
    }
    id v31 = v30;

    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v25, v31, 0);
    id v32 = _NDOLogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v7;
      _os_log_impl(&dword_23C013000, v32, OS_LOG_TYPE_DEFAULT, "Client versions '%@'", buf, 0xCu);
    }

    uint64_t v33 = (void *)[v7 mutableCopy];
    [v33 intersectSet:*(void *)(*(void *)(a1[6] + 8) + 40)];
    id v34 = _NDOLogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v33;
      _os_log_impl(&dword_23C013000, v34, OS_LOG_TYPE_DEFAULT, "clientAndServerSet '%@'", buf, 0xCu);
    }

    (*(void (**)(void))(a1[4] + 16))();
LABEL_32:

    goto LABEL_36;
  }
  v35 = _NDOLogSystem();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_3(v35);
  }

  (*(void (**)(void))(a1[4] + 16))();
LABEL_36:
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  if (!v7)
  {
    objc_storeStrong(v6, *(id *)(a1 + 32));
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v8 = NSNumber;
      id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
      uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerForKey:", @"LowServerVersion"));
      v11 = (void *)v10;
      id v12 = &unk_26EFA4F78;
      if (v10) {
        id v12 = (void *)v10;
      }
      id v13 = v12;

      v14 = NSNumber;
      uint64_t v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
      uint64_t v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerForKey:", @"HighServerVersion"));
      id v17 = (void *)v16;
      v18 = &unk_26EFA4F90;
      if (v16) {
        v18 = (void *)v16;
      }
      id v19 = v18;

      v30[0] = @"LowServerVersion";
      v30[1] = @"HighServerVersion";
      v31[0] = v13;
      v31[1] = v19;
      uint64_t v20 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;

      v23 = _NDOLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v28 = 138412290;
        uint64_t v29 = v24;
        _os_log_impl(&dword_23C013000, v23, OS_LOG_TYPE_DEFAULT, "Using Client version: %@", (uint8_t *)&v28, 0xCu);
      }
    }
  }
  id v25 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v25 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:@"ServerVersionCache"];

  v26 = _NDOLogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v28 = 138412290;
    uint64_t v29 = v27;
    _os_log_impl(&dword_23C013000, v26, OS_LOG_TYPE_DEFAULT, "Caching Server version  %@", (uint8_t *)&v28, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_27(uint64_t a1, void *a2)
{
  v27[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v5 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:@"ServerVersionCache"];

    id v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v24 = 138412290;
      uint64_t v25 = v7;
      _os_log_impl(&dword_23C013000, v6, OS_LOG_TYPE_DEFAULT, "Caching Server version  %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    id v8 = NSNumber;
    id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerForKey:", @"LowServerVersion"));
    v11 = (void *)v10;
    id v12 = &unk_26EFA4F78;
    if (v10) {
      id v12 = (void *)v10;
    }
    id v6 = v12;

    id v13 = NSNumber;
    v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v15 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "integerForKey:", @"HighServerVersion"));
    uint64_t v16 = (void *)v15;
    id v17 = &unk_26EFA4F90;
    if (v15) {
      id v17 = (void *)v15;
    }
    id v18 = v17;

    v26[0] = @"LowServerVersion";
    v26[1] = @"HighServerVersion";
    v27[0] = v6;
    v27[1] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    uint64_t v22 = _NDOLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v24 = 138412290;
      uint64_t v25 = v23;
      _os_log_impl(&dword_23C013000, v22, OS_LOG_TYPE_DEFAULT, "Using Client version: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)getValidServerVersionCache
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 objectForKey:@"ServerVersionCache"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NDOServerVersionUtilities getValidServerVersionCache]();
    }

    id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v6 removeObjectForKey:@"ServerVersionCache"];

    id v4 = 0;
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

+ (void)serverVersionSupported:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__NDOServerVersionUtilities_serverVersionSupported___block_invoke;
  v6[3] = &unk_264E266A8;
  id v7 = v4;
  id v5 = v4;
  [a1 _supportedVersionsForClientAndServer:2 withCompletion:v6];
}

void __52__NDOServerVersionUtilities_serverVersionSupported___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = _NDOLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_23C013000, v4, OS_LOG_TYPE_DEFAULT, "Server version supported by client version - '%@'", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)isHighServerVersionFeaturesetEnabled:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled_withCompletion___block_invoke;
  v8[3] = &unk_264E266A8;
  id v9 = v6;
  id v7 = v6;
  [a1 _supportedVersionsForClientAndServer:a3 withCompletion:v8];
}

void __81__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = NSNumber;
    int v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "integerForKey:", @"HighServerVersion"));

    int v7 = [v3 containsObject:v6];
  }
  else
  {
    int v7 = 0;
  }
  id v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v7) {
      id v9 = @"YES";
    }
    int v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_23C013000, v8, OS_LOG_TYPE_DEFAULT, "High Server version supported - %@", (uint8_t *)&v10, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)isHighServerVersionFeaturesetEnabled:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled___block_invoke;
  v6[3] = &unk_264E263C0;
  id v7 = v4;
  id v5 = v4;
  [a1 isHighServerVersionFeaturesetEnabled:0 withCompletion:v6];
}

uint64_t __66__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)isHighServerVersionFeaturesetEnabled
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled__block_invoke;
  v9[3] = &unk_264E266D0;
  v9[4] = &v10;
  [a1 _supportedVersionsForClientAndServer:1 withCompletion:v9];
  if ([(id)v11[5] count])
  {
    v2 = NSNumber;
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v4 = objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v3, "integerForKey:", @"HighServerVersion"));

    int v5 = [(id)v11[5] containsObject:v4];
  }
  else
  {
    int v5 = 0;
  }
  id v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (v5) {
      id v7 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    _os_log_impl(&dword_23C013000, v6, OS_LOG_TYPE_DEFAULT, "High Server version supported - %@", buf, 0xCu);
  }

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __65__NDOServerVersionUtilities_isHighServerVersionFeaturesetEnabled__block_invoke(uint64_t a1, void *a2)
{
}

+ (id)readWebURLOverride
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "+[NDOServerVersionUtilities readWebURLOverride]";
    _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:@"WebFlowURL"];

  return v4;
}

+ (id)readULWebURLOverride
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "+[NDOServerVersionUtilities readULWebURLOverride]";
    _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:@"ULWebFlowURL"];

  return v4;
}

+ (id)readAPSSupportedOverride
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "+[NDOServerVersionUtilities readAPSSupportedOverride]";
    _os_log_impl(&dword_23C013000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:@"isAPSSupported"];

  if (!v4)
  {
    int v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[NDOServerVersionUtilities readAPSSupportedOverride](v5);
    }
  }
  return v4;
}

+ (void)getDecodedParamsForPath:(id)a3 withCompletion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:](v8);
  }

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2;
  v29[4] = __Block_byref_object_dispose__2;
  id v30 = 0;
  uint64_t v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v10 = [v9 stringForKey:@"UniversalLinkEncodedParams"];

  v11 = dispatch_group_create();
  if (v6 && [v6 length] || v10)
  {
    dispatch_group_enter(v11);
    id v13 = NSURL;
    v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v15 = [v14 objectForKey:@"ServerVersionURL"];
    uint64_t v16 = [v13 URLWithString:v15];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke;
    v24[3] = &unk_264E266F8;
    id v25 = v10;
    id v17 = v6;
    id v26 = v17;
    int v28 = v29;
    uint64_t v18 = v11;
    uint64_t v27 = v18;
    [a1 _dictionaryFromURL:v16 shouldRetry:1 withCompletion:v24];
    uint64_t v19 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2;
    block[3] = &unk_264E26720;
    uint64_t v23 = v29;
    id v22 = v7;
    id v21 = v17;
    dispatch_group_notify(v18, v19, block);
  }
  else
  {
    uint64_t v12 = _NDOLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v32 = "+[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:]";
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_23C013000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: No valid params found for: %{public}@", buf, 0x16u);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }

  _Block_object_dispose(v29, 8);
}

void __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = [a2 objectForKey:@"ulmapping"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v3 = *(void **)(a1 + 32);
    if (!v3) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
LABEL_7:
    id v4 = v3;
LABEL_8:
    if ([v4 length])
    {
      int v5 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v4 options:0];
      uint64_t v6 = [[NSString alloc] initWithData:v5 encoding:4];
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    goto LABEL_10;
  }
  id v4 = [v9 objectForKey:*(void *)(a1 + 40)];
  if (v4) {
    goto LABEL_8;
  }
LABEL_10:

LABEL_11:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2 && [v2 length])
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    int v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2_cold_1();
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (id)clientConfig
{
  v2 = [a1 getValidServerVersionCache];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 objectForKey:@"clientConfig"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  id v3 = 0;
LABEL_5:

  return v3;
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_23C013000, v0, v1, "Failed to fetch plist data from URL '%@' with error: %@");
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0(&dword_23C013000, v0, v1, "Incorrect format in response detected from URL '%@'. Response: %@. Aborting without retry.");
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Incorrect format in response detected. retrying...", v2, v3, v4, v5, v6);
}

void __75__NDOServerVersionUtilities__dictionaryFromURL_shouldRetry_withCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  int v3 = 136446722;
  uint64_t v4 = "+[NDOServerVersionUtilities _dictionaryFromURL:shouldRetry:withCompletion:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_error_impl(&dword_23C013000, v2, OS_LOG_TYPE_ERROR, "%{public}s: Error serializing plist file from URL '%@': %@", (uint8_t *)&v3, 0x20u);
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "No server version dictionary found", v2, v3, v4, v5, v6);
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = @"LowServerVersion";
  _os_log_error_impl(&dword_23C013000, log, OS_LOG_TYPE_ERROR, "Server version dictionary missing key '%@'", (uint8_t *)&v1, 0xCu);
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_23C013000, log, OS_LOG_TYPE_ERROR, "Server version dictionary missing key '%@'", (uint8_t *)&v1, 0xCu);
}

void __81__NDOServerVersionUtilities__supportedVersionsForClientAndServer_withCompletion___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Incorrect serverDictionary format", v2, v3, v4, v5, v6);
}

+ (void)getValidServerVersionCache
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23C013000, v0, v1, "Incorrect format stored in server version cache. Removing it.", v2, v3, v4, v5, v6);
}

+ (void)readAPSSupportedOverride
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  uint64_t v2 = "+[NDOServerVersionUtilities readAPSSupportedOverride]";
  _os_log_debug_impl(&dword_23C013000, log, OS_LOG_TYPE_DEBUG, "%{public}s: Override isAPSSupported nil", (uint8_t *)&v1, 0xCu);
}

+ (void)getDecodedParamsForPath:(os_log_t)log withCompletion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:]";
  _os_log_debug_impl(&dword_23C013000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

void __68__NDOServerVersionUtilities_getDecodedParamsForPath_withCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  int v2 = 136446466;
  uint64_t v3 = "+[NDOServerVersionUtilities getDecodedParamsForPath:withCompletion:]_block_invoke_2";
  __int16 v4 = 2114;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_23C013000, v1, OS_LOG_TYPE_ERROR, "%{public}s: Failed to convert: %{public}@", (uint8_t *)&v2, 0x16u);
}

@end