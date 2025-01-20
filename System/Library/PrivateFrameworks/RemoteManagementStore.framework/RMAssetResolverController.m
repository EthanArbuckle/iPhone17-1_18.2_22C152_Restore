@interface RMAssetResolverController
+ (void)_resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6;
+ (void)_resolveKeychainAssets:(id)a3 assetIdentifiers:(id)a4 accessGroup:(id)a5 persistentRefs:(id)a6 completionHandler:(id)a7;
+ (void)extractUserIdentityAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)resolveDataAsset:(id)a3 assetIdentifier:(id)a4 downloadURL:(id)a5 completionHandler:(id)a6;
+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6;
+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5;
+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 subscriberIdentifier:(id)a5 completionHandler:(id)a6;
+ (void)resolveKeychainAssets:(id)a3 assetIdentifiers:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6;
+ (void)resolveKeychainPasswordAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6;
+ (void)resolveUserNameAndPasswordAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation RMAssetResolverController

+ (void)resolveUserNameAndPasswordAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = [v7 store];
    v11 = [v7 assetWithIdentifier:v8];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [[RMStoreUnresolvedAsset alloc] initWithAsset:v11 queryParameters:0];
        v13 = [v7 store];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2;
        v21[3] = &unk_26548F0F8;
        id v22 = v11;
        id v23 = v10;
        id v24 = v9;
        [v13 resolveAsset:v12 completionHandler:v21];

        v14 = v22;
      }
      else
      {
        v17 = [MEMORY[0x263F635B0] assetResolverController];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
        }

        v18 = (void *)MEMORY[0x263F63598];
        v19 = [v11 declarationType];
        v20 = [v18 createAssetTypeInvalidError:v19];

        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke;
        v25[3] = &unk_26548F0D0;
        id v26 = v20;
        id v27 = v9;
        v12 = v20;
        [v10 assetEncounteredInternalError:v11 error:v12 completionHandler:v25];

        v14 = v27;
      }
    }
    else
    {
      v16 = [MEMORY[0x263F635B0] assetResolverController];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
      }

      v12 = [MEMORY[0x263F63598] createInternalError];
      (*((void (**)(id, void, RMStoreUnresolvedAsset *))v9 + 2))(v9, 0, v12);
    }
  }
  else
  {
    v15 = [MEMORY[0x263F635B0] assetResolverController];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = [MEMORY[0x263F635B0] assetResolverController];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_8;
    v28[3] = &unk_26548F0D0;
    id v30 = *(id *)(a1 + 48);
    id v29 = v5;
    [v7 assetCannotBeDownloaded:v8 error:v29 completionHandler:v28];

    id v9 = v30;
  }
  else
  {
    v10 = (void *)MEMORY[0x263F63698];
    v11 = [a2 assetData];
    id v27 = 0;
    v12 = [v10 loadData:v11 serializationType:1 error:&v27];
    id v9 = v27;

    v13 = [MEMORY[0x263F635B0] assetResolverController];
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_2();
      }

      uint64_t v16 = *(void *)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_10;
      v24[3] = &unk_26548F0D0;
      v17 = &v26;
      id v26 = *(id *)(a1 + 48);
      v18 = &v25;
      id v25 = v9;
      [v15 assetCannotBeDeserialized:v16 error:v25 completionHandler:v24];
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_1();
      }

      uint64_t v20 = *(void *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_11;
      v21[3] = &unk_26548F0D0;
      v17 = &v23;
      id v23 = *(id *)(a1 + 48);
      v18 = &v22;
      id v22 = v12;
      [v19 assetSuccessfullyResolved:v20 completionHandler:v21];
    }
  }
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (void)extractUserIdentityAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = [v7 store];
    v11 = [v7 assetWithIdentifier:v8];
    if (v11)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v13 = [MEMORY[0x263F635B0] assetResolverController];
      v14 = v13;
      if (isKindOfClass)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          +[RMAssetResolverController extractUserIdentityAsset:assetIdentifier:completionHandler:]();
        }

        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke_14;
        v21[3] = &unk_26548F0D0;
        id v23 = v9;
        id v22 = v11;
        [v10 assetSuccessfullyResolved:v22 completionHandler:v21];

        id v15 = v23;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
        }

        v18 = (void *)MEMORY[0x263F63598];
        v19 = [v11 declarationType];
        uint64_t v20 = [v18 createAssetTypeInvalidError:v19];

        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke;
        v24[3] = &unk_26548F0D0;
        id v25 = v20;
        id v26 = v9;
        id v15 = v20;
        [v10 assetEncounteredInternalError:v11 error:v15 completionHandler:v24];
      }
    }
    else
    {
      v17 = [MEMORY[0x263F635B0] assetResolverController];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
      }

      id v15 = [MEMORY[0x263F63598] createInternalError];
      (*((void (**)(id, void, id))v9 + 2))(v9, 0, v15);
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263F635B0] assetResolverController];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

uint64_t __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __88__RMAssetResolverController_extractUserIdentityAsset_assetIdentifier_completionHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 subscriberIdentifier:(id)a5 completionHandler:(id)a6
{
}

+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 completionHandler:(id)a5
{
}

+ (void)resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__RMAssetResolverController_resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke;
  v12[3] = &unk_26548F120;
  id v13 = v10;
  id v11 = v10;
  [a1 _resolveKeychainAsset:a3 assetIdentifier:a4 accessGroup:a5 completionHandler:v12];
}

void __96__RMAssetResolverController_resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 assetKeychainReference];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

+ (void)resolveKeychainAssets:(id)a3 assetIdentifiers:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    id v13 = (void *)MEMORY[0x263EFF980];
    id v14 = a6;
    id v15 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v11, "count"));
    uint64_t v16 = [v11 objectEnumerator];
    [a1 _resolveKeychainAssets:v10 assetIdentifiers:v16 accessGroup:v12 persistentRefs:v15 completionHandler:v14];
  }
  else
  {
    v17 = (void *)MEMORY[0x263F635B0];
    id v18 = a6;
    v19 = [v17 assetResolverController];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[RMAssetResolverController resolveKeychainAssets:assetIdentifiers:accessGroup:completionHandler:]();
    }

    (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
  }
}

+ (void)resolveKeychainPasswordAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __104__RMAssetResolverController_resolveKeychainPasswordAsset_assetIdentifier_accessGroup_completionHandler___block_invoke;
  v12[3] = &unk_26548F120;
  id v13 = v10;
  id v11 = v10;
  [a1 _resolveKeychainAsset:a3 assetIdentifier:a4 accessGroup:a5 completionHandler:v12];
}

void __104__RMAssetResolverController_resolveKeychainPasswordAsset_assetIdentifier_accessGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v8 = [v6 assetKeychainReference];
  id v7 = [v6 assetKeychainUserName];

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

+ (void)resolveDataAsset:(id)a3 assetIdentifier:(id)a4 downloadURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10)
  {
    id v13 = [v9 store];
    id v14 = [v9 assetWithIdentifier:v10];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [[RMStoreUnresolvedAsset alloc] initWithAsset:v14 queryParameters:0 downloadURL:v11];
        uint64_t v16 = [v9 store];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2;
        v24[3] = &unk_26548F0F8;
        id v25 = v14;
        id v26 = v13;
        id v27 = v12;
        [v16 resolveAsset:v15 completionHandler:v24];

        v17 = v25;
      }
      else
      {
        uint64_t v20 = [MEMORY[0x263F635B0] assetResolverController];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
        }

        v21 = (void *)MEMORY[0x263F63598];
        id v22 = [v14 declarationType];
        id v23 = [v21 createAssetTypeInvalidError:v22];

        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke;
        v28[3] = &unk_26548F0D0;
        id v29 = v23;
        id v30 = v12;
        id v15 = v23;
        [v13 assetEncounteredInternalError:v14 error:v15 completionHandler:v28];

        v17 = v30;
      }
    }
    else
    {
      v19 = [MEMORY[0x263F635B0] assetResolverController];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
      }

      id v15 = [MEMORY[0x263F63598] createInternalError];
      (*((void (**)(id, void, RMStoreUnresolvedAsset *))v12 + 2))(v12, 0, v15);
    }
  }
  else
  {
    id v18 = [MEMORY[0x263F635B0] assetResolverController];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[RMAssetResolverController resolveDataAsset:assetIdentifier:downloadURL:completionHandler:]();
    }

    (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 1, 0);
  }
}

uint64_t __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F635B0] assetResolverController];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_19;
    v14[3] = &unk_26548F0D0;
    id v9 = &v16;
    id v16 = *(id *)(a1 + 48);
    id v15 = v4;
    [v7 assetCannotBeDownloaded:v8 error:v15 completionHandler:v14];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_20;
    v12[3] = &unk_26548F148;
    id v9 = &v13;
    id v13 = *(id *)(a1 + 48);
    [v10 assetSuccessfullyResolved:v11 completionHandler:v12];
  }
}

uint64_t __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_resolveKeychainAssets:(id)a3 assetIdentifiers:(id)a4 accessGroup:(id)a5 persistentRefs:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [v13 nextObject];
  if (v17)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __114__RMAssetResolverController__resolveKeychainAssets_assetIdentifiers_accessGroup_persistentRefs_completionHandler___block_invoke;
    v18[3] = &unk_26548F170;
    id v23 = v16;
    id v19 = v15;
    id v24 = a1;
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    [a1 _resolveKeychainAsset:v20 assetIdentifier:v17 accessGroup:v22 completionHandler:v18];
  }
  else
  {
    (*((void (**)(id, id, void))v16 + 2))(v16, v15, 0);
  }
}

uint64_t __114__RMAssetResolverController__resolveKeychainAssets_assetIdentifiers_accessGroup_persistentRefs_completionHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(uint64_t (**)(void))(a1[8] + 16);
    return v4();
  }
  else
  {
    id v6 = (void *)a1[4];
    id v7 = [a2 assetKeychainReference];
    [v6 addObject:v7];

    uint64_t v8 = a1[6];
    uint64_t v9 = a1[7];
    uint64_t v11 = a1[4];
    uint64_t v10 = a1[5];
    uint64_t v13 = a1[8];
    id v12 = (void *)a1[9];
    return [v12 _resolveKeychainAssets:v10 assetIdentifiers:v8 accessGroup:v9 persistentRefs:v11 completionHandler:v13];
  }
}

+ (void)_resolveKeychainAsset:(id)a3 assetIdentifier:(id)a4 accessGroup:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void, id))a6;
  if (v10)
  {
    uint64_t v13 = [v9 store];
    id v14 = [v9 assetWithIdentifier:v10];
    if (!v14)
    {
      id v24 = [MEMORY[0x263F635B0] assetResolverController];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
      }

      id v15 = [MEMORY[0x263F63598] createInternalError];
      v12[2](v12, 0, v15);
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v25 = [MEMORY[0x263F635B0] assetResolverController];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                +[RMAssetResolverController resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:]();
              }

              id v26 = (void *)MEMORY[0x263F63598];
              id v27 = [v14 declarationType];
              v28 = [v26 createAssetTypeInvalidError:v27];

              v34[0] = MEMORY[0x263EF8330];
              v34[1] = 3221225472;
              v34[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke;
              v34[3] = &unk_26548F0D0;
              id v35 = v28;
              v36 = v12;
              id v15 = v28;
              [v13 assetEncounteredInternalError:v14 error:v15 completionHandler:v34];

              goto LABEL_22;
            }
          }
        }
      }
    }
    id v15 = v11;
    if ([v15 length])
    {
LABEL_15:
      id v18 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"RMAssetResolverController", v9, v11 reference];
      id v19 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"RMAssetResolverController" store:v13 declaration:v14];
      id v20 = v13;
      id v21 = [[RMStoreUnresolvedKeychainAsset alloc] initWithAsset:v14 assetKey:v19 configurationKey:v18 group:v15 defaultAccessibility:0];
      id v22 = [v9 store];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2;
      v30[3] = &unk_26548F0F8;
      id v31 = v14;
      id v32 = v20;
      v33 = v12;
      [v22 resolveAsset:v21 completionHandler:v30];

      uint64_t v13 = v20;
      id v11 = v29;
LABEL_22:

      goto LABEL_23;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v16 = (id *)MEMORY[0x263F635F0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_15;
        }
        id v17 = 0;
        goto LABEL_14;
      }
      id v16 = (id *)MEMORY[0x263F635E8];
    }
    id v17 = *v16;
LABEL_14:

    id v15 = v17;
    goto LABEL_15;
  }
  id v23 = [MEMORY[0x263F635B0] assetResolverController];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    +[RMAssetResolverController _resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:]();
  }

  v12[2](v12, 0, 0);
LABEL_23:
}

uint64_t __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F635B0] assetResolverController];
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3();
    }

    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_30;
    v18[3] = &unk_26548F0D0;
    id v11 = &v20;
    id v20 = *(id *)(a1 + 48);
    id v12 = &v19;
    id v19 = v6;
    [v9 assetCannotBeDownloaded:v10 error:v19 completionHandler:v18];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2_cold_1();
    }

    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_31;
    v15[3] = &unk_26548F0D0;
    id v11 = &v17;
    id v17 = *(id *)(a1 + 48);
    id v12 = &v16;
    id v16 = v5;
    [v13 assetSuccessfullyResolved:v14 completionHandler:v15];
  }
}

uint64_t __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (void)resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Asset not specified for user name and password", v2, v3, v4, v5, v6);
}

+ (void)resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Missing asset: %@", v2, v3, v4, v5, v6);
}

+ (void)resolveUserNameAndPasswordAsset:assetIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Wrong asset type: %@", v2, v3, v4, v5, v6);
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "RMModelUserNameAndPasswordCredentialDeclaration resolved", v2, v3, v4, v5, v6);
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Could not deserialize credentials asset %{public}@: %{public}@");
}

void __95__RMAssetResolverController_resolveUserNameAndPasswordAsset_assetIdentifier_completionHandler___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Error resolving asset %{public}@: %{public}@");
}

+ (void)extractUserIdentityAsset:assetIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "RMModelUserIdentityDeclaration extracted", v2, v3, v4, v5, v6);
}

+ (void)resolveKeychainAssets:assetIdentifiers:accessGroup:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Assets not specified for keychain items", v2, v3, v4, v5, v6);
}

+ (void)resolveDataAsset:assetIdentifier:downloadURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Asset not specified for data", v2, v3, v4, v5, v6);
}

void __92__RMAssetResolverController_resolveDataAsset_assetIdentifier_downloadURL_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "RMModelAssetDataDeclaration resolved", v2, v3, v4, v5, v6);
}

+ (void)_resolveKeychainAsset:assetIdentifier:accessGroup:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Asset not specified for keychain item", v2, v3, v4, v5, v6);
}

void __97__RMAssetResolverController__resolveKeychainAsset_assetIdentifier_accessGroup_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_25B003000, v0, v1, "Keychain asset resolved", v2, v3, v4, v5, v6);
}

@end