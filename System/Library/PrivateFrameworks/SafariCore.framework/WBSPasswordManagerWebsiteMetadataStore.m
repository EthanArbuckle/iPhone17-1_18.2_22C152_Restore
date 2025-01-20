@interface WBSPasswordManagerWebsiteMetadataStore
- (WBSPasswordManagerWebsiteMetadataStore)init;
- (WBSPasswordManagerWebsiteMetadataStore)initWithMetadataEntryClass:(Class)a3;
- (id)_initWithMetadataEntryClass:(Class)a3 keychainAccessGroup:(id)a4;
- (id)test_initWithMetadataEntryClass:(Class)a3 keychainAccessGroup:(id)a4;
- (void)allMetadataWithCompletionHandler:(id)a3;
- (void)debug_deleteAllPersistedDataWithCompletionHandler:(id)a3;
- (void)metadataForDomain:(id)a3 completionHandler:(id)a4;
- (void)saveMetadataEntry:(id)a3 forDomain:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSPasswordManagerWebsiteMetadataStore

- (WBSPasswordManagerWebsiteMetadataStore)initWithMetadataEntryClass:(Class)a3
{
  return (WBSPasswordManagerWebsiteMetadataStore *)[(WBSPasswordManagerWebsiteMetadataStore *)self _initWithMetadataEntryClass:a3 keychainAccessGroup:@"com.apple.password-manager.website-metadata"];
}

- (void)allMetadataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_initWithMetadataEntryClass:(Class)a3 keychainAccessGroup:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WBSPasswordManagerWebsiteMetadataStore;
  v7 = [(WBSPasswordManagerWebsiteMetadataStore *)&v19 init];
  id v8 = v7;
  if (v7)
  {
    v7->_metadataEntryClass = a3;
    uint64_t v9 = [v6 copy];
    accessGroup = v8->_accessGroup;
    v8->_accessGroup = (NSString *)v9;

    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"com.apple.SafariCore.%@.%p", v13, v8];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    v17 = v8;
  }

  return v8;
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke(uint64_t a1)
{
  v52[9] = *MEMORY[0x1E4F143B8];
  v51[0] = *MEMORY[0x1E4F3B5C0];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) keychainAccountName];
  uint64_t v3 = *MEMORY[0x1E4F3B550];
  uint64_t v41 = a1;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  v52[0] = v2;
  v52[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F3B978];
  v51[1] = v3;
  v51[2] = v5;
  uint64_t v6 = *MEMORY[0x1E4F3B7C8];
  uint64_t v7 = *MEMORY[0x1E4F3B7F8];
  v52[2] = *MEMORY[0x1E4F3B998];
  v52[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B878];
  v51[3] = v6;
  v51[4] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3BD08];
  v52[4] = MEMORY[0x1E4F1CC38];
  v52[5] = MEMORY[0x1E4F1CC38];
  uint64_t v10 = *MEMORY[0x1E4F3BC70];
  v51[5] = v9;
  v51[6] = v10;
  uint64_t v11 = *MEMORY[0x1E4F3BC68];
  v52[6] = MEMORY[0x1E4F1CC38];
  v52[7] = MEMORY[0x1E4F1CC38];
  uint64_t v12 = *MEMORY[0x1E4F3BB80];
  v51[7] = v11;
  v51[8] = v12;
  v52[8] = *MEMORY[0x1E4F3BB88];
  unint64_t v13 = 0x1E4F1C000uLL;
  CFDictionaryRef v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:9];

  CFTypeRef result = 0;
  OSStatus v15 = SecItemCopyMatching(v14, &result);
  if (!v15)
  {
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v18 = (id)result;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      CFDictionaryRef v38 = v14;
      uint64_t v40 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v21 = *(void *)v46;
      uint64_t v22 = *MEMORY[0x1E4F3B848];
      uint64_t v23 = *MEMORY[0x1E4F3BD38];
      do
      {
        uint64_t v24 = 0;
        uint64_t v42 = v20;
        do
        {
          if (*(void *)v46 != v21) {
            objc_enumerationMutation(v18);
          }
          v25 = *(void **)(*((void *)&v45 + 1) + 8 * v24);
          v26 = [v25 objectForKeyedSubscript:v22];
          v27 = [v25 objectForKeyedSubscript:v23];
          if ([v26 length])
          {
            v28 = objc_msgSend(*(id *)(v13 + 2536), "safari_dictionaryWithPropertyListData:", v27);
            if (v28)
            {
              uint64_t v29 = v23;
              uint64_t v30 = v22;
              uint64_t v31 = v21;
              unint64_t v32 = v13;
              v33 = v18;
              v34 = (void *)[objc_alloc(*(Class *)(*(void *)(v41 + 32) + 8)) initWithKeychainDictionary:v28 forDomain:v26];
              if (v34) {
                [v39 setObject:v34 forKeyedSubscript:v26];
              }
              else {
                ++v40;
              }

              v18 = v33;
              unint64_t v13 = v32;
              uint64_t v21 = v31;
              uint64_t v22 = v30;
              uint64_t v23 = v29;
              uint64_t v20 = v42;
            }
            else
            {
              ++v43;
            }
          }
          else
          {
            ++v44;
          }

          ++v24;
        }
        while (v20 != v24);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v20);

      if (v44)
      {
        v35 = WBS_LOG_CHANNEL_PREFIXKeychain();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_4();
        }
      }
      CFDictionaryRef v14 = v38;
      if (v43 && (v36 = WBS_LOG_CHANNEL_PREFIXKeychain(), os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)))
      {
        __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_3();
        if (v40)
        {
LABEL_28:
          v37 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_2();
          }
        }
      }
      else if (v40)
      {
        goto LABEL_28;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(v41 + 40) + 16))();

    goto LABEL_32;
  }
  int v16 = v15;
  if (v15 != -25300)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_1(v16, v17);
    }
  }
  (*(void (**)(void))(*(void *)(v41 + 40) + 16))();
LABEL_32:
}

- (WBSPasswordManagerWebsiteMetadataStore)init
{
  return 0;
}

- (id)test_initWithMetadataEntryClass:(Class)a3 keychainAccessGroup:(id)a4
{
  id v4 = [(WBSPasswordManagerWebsiteMetadataStore *)self _initWithMetadataEntryClass:a3 keychainAccessGroup:a4];
  return v4;
}

- (void)metadataForDomain:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke;
  block[3] = &unk_1E615A8F0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke(void *a1)
{
  v21[8] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(*(Class *)(a1[4] + 8));
  v20[0] = *MEMORY[0x1E4F3B5C0];
  uint64_t v3 = [*(id *)(a1[4] + 8) keychainAccountName];
  uint64_t v4 = *MEMORY[0x1E4F3B550];
  uint64_t v5 = *(void *)(a1[4] + 16);
  v21[0] = v3;
  v21[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F3B978];
  v20[1] = v4;
  v20[2] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B7C8];
  uint64_t v8 = *MEMORY[0x1E4F3B7F8];
  v21[2] = *MEMORY[0x1E4F3B998];
  v21[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3B848];
  v20[3] = v7;
  v20[4] = v9;
  uint64_t v10 = *MEMORY[0x1E4F3B878];
  v21[4] = a1[5];
  v21[5] = MEMORY[0x1E4F1CC38];
  uint64_t v11 = *MEMORY[0x1E4F3BD08];
  v20[5] = v10;
  v20[6] = v11;
  v20[7] = *MEMORY[0x1E4F3BC70];
  v21[6] = MEMORY[0x1E4F1CC38];
  v21[7] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:8];

  CFTypeRef v19 = 0;
  OSStatus v13 = SecItemCopyMatching(v12, &v19);
  if (v13)
  {
    if (v13 != -25300)
    {
      CFDictionaryRef v14 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_1(v14);
      }
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    OSStatus v15 = (void *)v19;
    int v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:", v19);

    if (v16)
    {
      uint64_t v17 = [objc_alloc(*(Class *)(a1[4] + 8)) initWithKeychainDictionary:v16 forDomain:a1[5]];

      (*(void (**)(void))(a1[6] + 16))();
      id v2 = (id)v17;
    }
    else
    {
      v18 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_2(a1 + 5, v18);
      }
      (*(void (**)(void))(a1[6] + 16))();
    }
  }
}

- (void)saveMetadataEntry:(id)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke;
  v15[3] = &unk_1E615A918;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke(uint64_t a1)
{
  v48[7] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) originalBackingDictionary];
  uint64_t v3 = [*(id *)(a1 + 32) dictionaryRepresentation];
  if ([v3 isEqualToDictionary:v2])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v41 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:&v41];
    id v5 = v41;
    uint64_t v6 = v5;
    if (v4)
    {
      uint64_t v40 = v5;
      v47[0] = *MEMORY[0x1E4F3B5C0];
      uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 8) keychainAccountName];
      uint64_t v8 = *MEMORY[0x1E4F3B550];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 16);
      v48[0] = v7;
      v48[1] = v10;
      uint64_t v11 = *MEMORY[0x1E4F3B978];
      v47[1] = v8;
      v47[2] = v11;
      uint64_t v12 = *MEMORY[0x1E4F3B7C8];
      uint64_t v13 = *MEMORY[0x1E4F3B7F8];
      v48[2] = *MEMORY[0x1E4F3B998];
      v48[3] = v13;
      uint64_t v14 = *MEMORY[0x1E4F3B848];
      v47[3] = v12;
      v47[4] = v14;
      uint64_t v15 = *MEMORY[0x1E4F3B878];
      uint64_t v16 = MEMORY[0x1E4F1CC38];
      v48[4] = v9;
      v48[5] = MEMORY[0x1E4F1CC38];
      uint64_t v17 = *MEMORY[0x1E4F3BD08];
      v47[5] = v15;
      v47[6] = v17;
      v48[6] = MEMORY[0x1E4F1CC38];
      id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:7];

      uint64_t v18 = *MEMORY[0x1E4F3BD38];
      v46[0] = v4;
      uint64_t v19 = *MEMORY[0x1E4F3B788];
      v45[0] = v18;
      v45[1] = v19;
      uint64_t v37 = v19;
      CFDictionaryRef v38 = v4;
      uint64_t v20 = [*(id *)(a1 + 32) keychainItemLabelForDomain:*(void *)(a1 + 48)];
      v46[1] = v20;
      v45[2] = *MEMORY[0x1E4F3B678];
      uint64_t v21 = [*(id *)(a1 + 32) keychainItemDescription];
      v46[2] = v21;
      v45[3] = v8;
      uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 16);
      v45[4] = v15;
      v46[3] = v22;
      v46[4] = v16;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:5];

      uint64_t v24 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v34 = v24;
        v35 = [v23 objectForKeyedSubscript:v8];
        v36 = [v23 objectForKeyedSubscript:v37];
        *(_DWORD *)buf = 138543619;
        *(void *)&buf[4] = v35;
        __int16 v43 = 2113;
        uint64_t v44 = v36;
        _os_log_debug_impl(&dword_1B728F000, v34, OS_LOG_TYPE_DEBUG, "Within WebsiteMetadataStore, attributes for credential SecItemUpdate: { accessGroup: %{public}@, label: %{private}@ }", buf, 0x16u);
      }
      *(void *)buf = 0;
      SecItemUpdateWithError();
      uint64_t v6 = *(void **)buf;

      uint64_t v25 = [v6 code];
      if (v25 == -25300)
      {
        v28 = (void *)[v23 mutableCopy];
        [v28 addEntriesFromDictionary:v39];
        CFDictionaryRef v29 = v28;

        OSStatus v30 = SecItemAdd(v29, 0);
        uint64_t v4 = v38;
        if (v30)
        {
          uint64_t v31 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_3(v30, v31);
          }
          unint64_t v32 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        }
        else
        {
          unint64_t v32 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        }
        v32();
        uint64_t v23 = v29;
      }
      else
      {
        uint64_t v4 = v38;
        if (v25)
        {
          v33 = WBS_LOG_CHANNEL_PREFIXKeychain();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_2(v33, v6);
          }
          v26 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        }
        else
        {
          v26 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        }
        v26();
      }
    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXKeychain();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_1(v27, v6);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

- (void)debug_deleteAllPersistedDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  v20[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) keychainAccountName];
  uint64_t v4 = *MEMORY[0x1E4F3B550];
  v19[0] = *MEMORY[0x1E4F3B5C0];
  v19[1] = v4;
  uint64_t v5 = *(void *)(*(void *)v2 + 16);
  v20[0] = v3;
  v20[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F3B998];
  uint64_t v7 = *MEMORY[0x1E4F3B7C8];
  v19[2] = *MEMORY[0x1E4F3B978];
  v19[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B7F8];
  v20[2] = v6;
  v20[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F3BD08];
  v19[4] = *MEMORY[0x1E4F3B878];
  v19[5] = v9;
  v20[4] = MEMORY[0x1E4F1CC38];
  v20[5] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  OSStatus v11 = SecItemDelete(v10);
  uint64_t v12 = WBS_LOG_CHANNEL_PREFIXKeychain();
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke_cold_1(v2, (uint64_t)v3, v13);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(*(void *)v2 + 16);
    int v15 = 138412546;
    uint64_t v16 = v14;
    __int16 v17 = 2112;
    uint64_t v18 = v3;
    _os_log_impl(&dword_1B728F000, v13, OS_LOG_TYPE_DEFAULT, "Within WebsiteMetadataStore, deleted all items in %@ with kSecAttrAccount %@", (uint8_t *)&v15, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed while fetching all website metadata with status %d", (uint8_t *)v2, 8u);
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v0, v1, "Within WebsiteMetadataStore, found %lu keychain items returned nil items from -initWithKeychainDictionary:forDomain:", v2);
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v0, v1, "Within WebsiteMetadataStore, found %lu keychain items whose data were not dictionaries", v2);
}

void __75__WBSPasswordManagerWebsiteMetadataStore_allMetadataWithCompletionHandler___block_invoke_cold_4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v0, v1, "Within WebsiteMetadataStore, found %lu keychain items with empty domains", v2);
}

void __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Within WebsiteMetadataStore, SecItemCopyMatching failed while fetching website metadata", v1, 2u);
}

void __78__WBSPasswordManagerWebsiteMetadataStore_metadataForDomain_completionHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1B728F000, a2, OS_LOG_TYPE_DEBUG, "Within WebsiteMetadataStore, fetched keychain entry for %@ wasn't a dictionary", (uint8_t *)&v3, 0xCu);
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingError");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v3, v5, "Within WebsiteMetadataStore, could not create data from dictionary to persist; error: %@",
    v6);
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingError");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1B728F000, v3, v5, "Within WebsiteMetadataStore, SecItemUpdateWithError failed with error %@", v6);
}

void __88__WBSPasswordManagerWebsiteMetadataStore_saveMetadataEntry_forDomain_completionHandler___block_invoke_cold_3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Within WebsiteMetadataStore, SecItemAdd failed with error %d", (uint8_t *)v2, 8u);
}

void __92__WBSPasswordManagerWebsiteMetadataStore_debug_deleteAllPersistedDataWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Within WebsiteMetadataStore, failed to delete all items in %@ with kSecAttrAccount %@", (uint8_t *)&v4, 0x16u);
}

@end