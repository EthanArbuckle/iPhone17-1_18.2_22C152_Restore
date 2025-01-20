@interface WBSExtensionsExporter
+ (id)dataType;
+ (id)extensionDataWithDisplayName:(id)a3 developerName:(id)a4 composedIdentifier:(id)a5 adamIdentifier:(id)a6 alternatePlatformExtensionBundleIdentifier:(id)a7 alternatePlatformAppBundleIdentifier:(id)a8;
+ (unint64_t)schemaVersion;
- (WBSExtensionsExporter)initWithURL:(id)a3 error:(id *)a4;
- (void)exportExtensionDictionaries:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSExtensionsExporter

+ (id)dataType
{
  return (id)*MEMORY[0x1E4F98580];
}

+ (unint64_t)schemaVersion
{
  return *MEMORY[0x1E4F985B0];
}

+ (id)extensionDataWithDisplayName:(id)a3 developerName:(id)a4 composedIdentifier:(id)a5 adamIdentifier:(id)a6 alternatePlatformExtensionBundleIdentifier:(id)a7 alternatePlatformAppBundleIdentifier:(id)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v28 = a6;
  id v14 = a7;
  id v15 = a8;
  v16 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v17 = *MEMORY[0x1E4F98578];
  uint64_t v29 = *MEMORY[0x1E4F98590];
  uint64_t v30 = v17;
  id v31 = a3;
  id v32 = a5;
  v18 = (void *)MEMORY[0x1E4F1C9E8];
  id v19 = a5;
  id v20 = a3;
  v21 = [v18 dictionaryWithObjects:&v31 forKeys:&v29 count:2];
  v22 = [v16 dictionaryWithDictionary:v21];

  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v13) {
    [v22 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F98588]];
  }
  v24 = v28;
  if (v28) {
    [v23 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F985B8]];
  }
  if (v14) {
    [v23 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F985A0]];
  }
  if (v15) {
    [v23 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F98598]];
  }
  if (objc_msgSend(v23, "count", v28, v29, v30, v31, v32, v33))
  {
    v25 = (void *)[v23 copy];
    [v22 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F985A8]];
  }
  v26 = (void *)[v22 copy];

  return v26;
}

- (WBSExtensionsExporter)initWithURL:(id)a3 error:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WBSExtensionsExporter;
  v4 = [(WBSJSONExporter *)&v10 initWithURL:a3 error:a4];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SafariShared.WBSExtensionsExporter", v5);
    extensionsDataExportQueue = v4->_extensionsDataExportQueue;
    v4->_extensionsDataExportQueue = (OS_dispatch_queue *)v6;

    v8 = v4;
  }

  return v4;
}

- (void)exportExtensionDictionaries:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  extensionsDataExportQueue = self->_extensionsDataExportQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke;
  block[3] = &unk_1E5E40940;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(extensionsDataExportQueue, block);
}

void __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] jsonWriter];
  uint64_t v3 = *MEMORY[0x1E4F984C0];
  id v22 = 0;
  [v2 beginArrayForKey:v3 error:&v22];
  id v4 = v22;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a1[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        id v10 = v4;
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        id v12 = [a1[4] jsonWriter];
        id v17 = v10;
        [v12 appendEntry:v11 error:&v17];
        id v4 = v17;

        if (v4)
        {
          id v13 = WBS_LOG_CHANNEL_PREFIXExport();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke_cold_1(v23, v13, v4, &v24);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v7);
  }

  id v14 = a1[4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5E43538;
  id v16 = a1[6];
  [v14 finishWithCompletionHandler:v15];
}

void __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke_2_cold_1(v4, v3);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void).cxx_destruct
{
}

void __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_ERROR, "Failed to serialize extensions entry: %{public}@", a1, 0xCu);
}

void __71__WBSExtensionsExporter_exportExtensionDictionaries_completionHandler___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to finalize extensions export: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end