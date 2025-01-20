@interface WebBookmarksSettingsGateway
- (WBSCreditCardImporterDelegate)creditCardImporterDelegate;
- (WBSExtensionsImporterDelegate)extensionsImporterDelegate;
- (WebBookmarksSettingsGateway)init;
- (void)_enableExtensionWithMessage:(id)a3 connection:(id)a4;
- (void)_finishedImportingCreditCardsWithMessage:(id)a3 connection:(id)a4;
- (void)_finishedImportingExtensionsWithMessage:(id)a3 connection:(id)a4;
- (void)_saveCreditCardWithMessage:(id)a3 connection:(id)a4;
- (void)_setupConnection;
- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 profileIdentifiers:(id)a5 options:(int64_t)a6 clearAllSpotlightHistoryForProfile:(BOOL)a7 completionHandler:(id)a8;
- (void)computeNumberOfItemsToBeImportedFromURL:(id)a3 exportMetadataDataType:(id)a4 completionHandler:(id)a5;
- (void)connection:(id)a3 didCloseWithError:(id)a4;
- (void)deleteAllSafariSecurityOriginsForProfileWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deleteSafariPersistentURLCacheStorageWithCompletionHandler:(id)a3;
- (void)deleteSafariWebsiteDataRecord:(id)a3 completionHandler:(id)a4;
- (void)exportBookmarksToURL:(id)a3 sandboxExtension:(id)a4 completionHandler:(id)a5;
- (void)exportSafariHistoryToURL:(id)a3 sandboxExtension:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)getSafariDataUsageByteCountWithCompletionHandler:(id)a3;
- (void)getSafariWebDataUsageWithCompletion:(id)a3;
- (void)importBookmarksFromURL:(id)a3 inFolderWithSuggestedName:(id)a4 completionHandler:(id)a5;
- (void)importChromeExtensionsFromURL:(id)a3 completionHandler:(id)a4;
- (void)importChromeHistoryFromURL:(id)a3 ageLimit:(double)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)importCreditCardsFromURL:(id)a3 completionHandler:(id)a4;
- (void)importExtensionsFromURL:(id)a3 completionHandler:(id)a4;
- (void)importSafariHistoryFromURL:(id)a3 ageLimit:(double)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)numberOfHistorySitesToBeExportedWithProfileIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5;
- (void)scheduleBookmarksDatabaseMaintenance;
- (void)scheduleBookmarksDatabaseMigrationTask;
- (void)scheduleHSTSSuperCookieCleanup;
- (void)schedulePasswordIconsCleanup;
- (void)setCreditCardImporterDelegate:(id)a3;
- (void)setExtensionsImporterDelegate:(id)a3;
@end

@implementation WebBookmarksSettingsGateway

- (WebBookmarksSettingsGateway)init
{
  v6.receiver = self;
  v6.super_class = (Class)WebBookmarksSettingsGateway;
  v2 = [(WebBookmarksSettingsGateway *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WebBookmarksSettingsGateway *)v2 _setupConnection];
    v4 = v3;
  }

  return v3;
}

- (void)_setupConnection
{
  v3 = [WebBookmarksXPCConnection alloc];
  v4 = [(WebBookmarksXPCConnection *)v3 initClientForMachService:kWebBookmarksdServiceName];
  connection = self->_connection;
  self->_connection = v4;

  objc_initWeak(&location, self);
  objc_super v6 = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__WebBookmarksSettingsGateway__setupConnection__block_invoke;
  v16[3] = &unk_2643DBE48;
  objc_copyWeak(&v17, &location);
  [(WebBookmarksXPCConnection *)v6 setHandler:v16 forMessageNamed:kWebBookmarksEnableImportedExtensionMessageName];
  v7 = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__WebBookmarksSettingsGateway__setupConnection__block_invoke_2;
  v14[3] = &unk_2643DBE48;
  objc_copyWeak(&v15, &location);
  [(WebBookmarksXPCConnection *)v7 setHandler:v14 forMessageNamed:kWebBookmarksFinishedImportingExtensionsMessageName];
  v8 = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__WebBookmarksSettingsGateway__setupConnection__block_invoke_3;
  v12[3] = &unk_2643DBE48;
  objc_copyWeak(&v13, &location);
  [(WebBookmarksXPCConnection *)v8 setHandler:v12 forMessageNamed:kWebBookmarksSaveImportedCreditCardMessageName];
  v9 = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__WebBookmarksSettingsGateway__setupConnection__block_invoke_4;
  v10[3] = &unk_2643DBE48;
  objc_copyWeak(&v11, &location);
  [(WebBookmarksXPCConnection *)v9 setHandler:v10 forMessageNamed:kWebBookmarksFinishedImportingCreditCardsMessageName];
  [(WebBookmarksXPCConnection *)self->_connection setDelegate:self];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __47__WebBookmarksSettingsGateway__setupConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _enableExtensionWithMessage:v5 connection:v6];
}

void __47__WebBookmarksSettingsGateway__setupConnection__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _finishedImportingExtensionsWithMessage:v5 connection:v6];
}

void __47__WebBookmarksSettingsGateway__setupConnection__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _saveCreditCardWithMessage:v5 connection:v6];
}

void __47__WebBookmarksSettingsGateway__setupConnection__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _finishedImportingCreditCardsWithMessage:v5 connection:v6];
}

- (void)getSafariWebDataUsageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksGetSafariWebDataUsageMessageName];
  id v6 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for website data from webbookmarksd.", buf, 2u);
  }
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke;
  v9[3] = &unk_2643DC568;
  id v10 = v4;
  id v8 = v4;
  [(WebBookmarksXPCConnection *)connection sendMessage:v5 withReplyHandler:v9];
}

void __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_cold_1(v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
    if (v5)
    {
      v9 = xpc_dictionary_get_value(v5, kWebsiteDataAllRecordsKey);
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_2;
      applier[3] = &unk_2643DC540;
      id v14 = v8;
      xpc_array_apply(v9, applier);
    }
    id v10 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t v12 = [v8 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v12;
      _os_log_impl(&dword_21C043000, v11, OS_LOG_TYPE_DEFAULT, "Parsed %zu data records from webbookmarksd.", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = +[WBWebsiteDataRecord websiteDataRecordFromXPCDictionary:](WBWebsiteDataRecord, "websiteDataRecordFromXPCDictionary:");
  [v1 addObject:v2];

  return 1;
}

- (void)deleteAllSafariSecurityOriginsForProfileWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Sending XPC message to delete all Website data", buf, 2u);
  }
  v9 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksDeleteAllSafariWebSecurityOriginsMessageName];
  xpc_object_t v10 = xpc_array_create(0, 0);
  id v11 = v7;
  uint64_t v12 = (const char *)[v11 UTF8String];

  xpc_object_t v13 = xpc_string_create(v12);
  xpc_array_append_value(v10, v13);

  xpc_dictionary_set_value(v9, kWebsiteProfileIdentifiersKey, v10);
  connection = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_2643DC568;
  id v17 = v6;
  id v15 = v6;
  [(WebBookmarksXPCConnection *)connection sendMessage:v9 withReplyHandler:v16];
}

void __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)xpc_object_t v10 = 0;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete all website data", v10, 2u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

- (void)deleteSafariWebsiteDataRecord:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  uint64_t v8 = kWebBookmarksDeleteSafariWebSecurityOriginMessageName;
  id v9 = a3;
  xpc_object_t v10 = [(WebBookmarksXPCConnection *)connection messageWithName:v8];
  id v11 = kWebsiteDataRecordKey;
  uint64_t v12 = [v9 XPCDictionaryRepresentation];

  xpc_dictionary_set_value(v10, v11, v12);
  xpc_object_t v13 = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke;
  v15[3] = &unk_2643DC568;
  id v16 = v6;
  id v14 = v6;
  [(WebBookmarksXPCConnection *)v13 sendMessage:v10 withReplyHandler:v15];
}

void __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)xpc_object_t v10 = 0;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete individual website data", v10, 2u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

- (void)deleteSafariPersistentURLCacheStorageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksDeleteSafariPersistentURLCacheStorageMessageName];
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke;
  v8[3] = &unk_2643DC568;
  id v9 = v4;
  id v7 = v4;
  [(WebBookmarksXPCConnection *)connection sendMessage:v5 withReplyHandler:v8];
}

void __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)xpc_object_t v10 = 0;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete persistent URL cache storage", v10, 2u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

- (void)getSafariDataUsageByteCountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksGetSafariDataUsageSummaryMessageName];
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__WebBookmarksSettingsGateway_getSafariDataUsageByteCountWithCompletionHandler___block_invoke;
  v8[3] = &unk_2643DC568;
  id v9 = v4;
  id v7 = v4;
  [(WebBookmarksXPCConnection *)connection sendMessage:v5 withReplyHandler:v8];
}

uint64_t __80__WebBookmarksSettingsGateway_getSafariDataUsageByteCountWithCompletionHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (xdict) {
    xdict = (xpc_object_t)xpc_dictionary_get_uint64(xdict, kWebDataUsageSizeKey);
  }
  v3 = *(uint64_t (**)(uint64_t, xpc_object_t))(v2 + 16);
  return v3(v2, xdict);
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 profileIdentifiers:(id)a5 options:(int64_t)a6 clearAllSpotlightHistoryForProfile:(BOOL)a7 completionHandler:(id)a8
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksClearHistoryMessageName];
  v19 = kWebsiteStartDateKey;
  [v14 timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(v18, v19, v20);
  v21 = kWebsiteEndDateKey;
  [v15 timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(v18, v21, v22);
  xpc_dictionary_set_int64(v18, kWebsiteOptionsKey, a6);
  xpc_dictionary_set_BOOL(v18, kWebsiteClearAllSpotlightHistoryForProfileKey, a7);
  if (v16)
  {
    id v32 = v15;
    id v33 = v14;
    xpc_object_t v23 = xpc_array_create(0, 0);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v24 = v16;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v37;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v24);
          }
          xpc_object_t v29 = xpc_string_create((const char *)[*(id *)(*((void *)&v36 + 1) + 8 * v28) UTF8String]);
          xpc_array_append_value(v23, v29);

          ++v28;
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v26);
    }

    xpc_dictionary_set_value(v18, kWebsiteProfileIdentifiersKey, v23);
    id v15 = v32;
    id v14 = v33;
  }
  connection = self->_connection;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __155__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke;
  v34[3] = &unk_2643DC568;
  id v35 = v17;
  id v31 = v17;
  [(WebBookmarksXPCConnection *)connection sendMessage:v18 withReplyHandler:v34];
}

void __155__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __155__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)xpc_object_t v10 = 0;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to delete Safari's history", v10, 2u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

- (void)exportBookmarksToURL:(id)a3 sandboxExtension:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  connection = self->_connection;
  xpc_object_t v10 = kWebBookmarksExportBookmarksMessageName;
  id v11 = a4;
  id v12 = a3;
  xpc_object_t v13 = [(WebBookmarksXPCConnection *)connection messageWithName:v10];
  id v14 = kWebBookmarksExportBookmarksURLKey;
  id v15 = [v12 absoluteString];

  id v16 = v15;
  xpc_dictionary_set_string(v13, v14, (const char *)[v16 UTF8String]);

  id v17 = kWebBookmarksExportBookmarksSandboxExtensionKey;
  id v18 = v11;
  v19 = (const char *)[v18 UTF8String];

  xpc_dictionary_set_string(v13, v17, v19);
  double v20 = self->_connection;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __87__WebBookmarksSettingsGateway_exportBookmarksToURL_sandboxExtension_completionHandler___block_invoke;
  v22[3] = &unk_2643DC568;
  id v23 = v8;
  id v21 = v8;
  [(WebBookmarksXPCConnection *)v20 sendMessage:v13 withReplyHandler:v22];
}

void __87__WebBookmarksSettingsGateway_exportBookmarksToURL_sandboxExtension_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__WebBookmarksSettingsGateway_exportBookmarksToURL_sandboxExtension_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXExport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to export bookmarks", v9, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importBookmarksFromURL:(id)a3 inFolderWithSuggestedName:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v17 = 0;
  xpc_object_t v10 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksImportBookmarksMessageName];
    xpc_dictionary_set_string(v12, kWebBookmarksImportBookmarksSuggestedNameKey, (const char *)[v8 UTF8String]);
    xpc_dictionary_set_fd(v12, kWebBookmarksImportBookmarksFileDescriptorKey, [v10 fileDescriptor]);
    connection = self->_connection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __98__WebBookmarksSettingsGateway_importBookmarksFromURL_inFolderWithSuggestedName_completionHandler___block_invoke;
    v15[3] = &unk_2643DC568;
    id v16 = v9;
    [(WebBookmarksXPCConnection *)connection sendMessage:v12 withReplyHandler:v15];
  }
  else
  {
    id v14 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway importBookmarksFromURL:inFolderWithSuggestedName:completionHandler:](v14);
    }
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v11);
  }
}

void __98__WebBookmarksSettingsGateway_importBookmarksFromURL_inFolderWithSuggestedName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __98__WebBookmarksSettingsGateway_importBookmarksFromURL_inFolderWithSuggestedName_completionHandler___block_invoke_cold_1(v11);
    }
    (*(void (**)(void, void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v7);
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to import bookmarks", v12, 2u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, kWebBookmarksImportBookmarksItemsCountKey);
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, uint64, 0);
  }
}

- (void)exportSafariHistoryToURL:(id)a3 sandboxExtension:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  id v12 = kWebBookmarksExportHistoryMessageName;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(WebBookmarksXPCConnection *)connection messageWithName:v12];
  id v17 = kWebBookmarksHistoryExportURLKey;
  id v18 = [v15 absoluteString];

  id v19 = v18;
  xpc_dictionary_set_string(v16, v17, (const char *)[v19 UTF8String]);

  double v20 = kWebBookmarksHistoryExportSandboxExtensionKey;
  id v21 = v14;
  double v22 = (const char *)[v21 UTF8String];

  xpc_dictionary_set_string(v16, v20, v22);
  id v23 = kWebsiteProfileIdentifiersKey;
  id v24 = v13;
  uint64_t v25 = (const char *)[v24 UTF8String];

  xpc_dictionary_set_string(v16, v23, v25);
  uint64_t v26 = self->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __109__WebBookmarksSettingsGateway_exportSafariHistoryToURL_sandboxExtension_profileIdentifier_completionHandler___block_invoke;
  v28[3] = &unk_2643DC568;
  id v29 = v10;
  id v27 = v10;
  [(WebBookmarksXPCConnection *)v26 sendMessage:v16 withReplyHandler:v28];
}

void __109__WebBookmarksSettingsGateway_exportSafariHistoryToURL_sandboxExtension_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __109__WebBookmarksSettingsGateway_exportSafariHistoryToURL_sandboxExtension_profileIdentifier_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXExport();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_21C043000, v9, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to export Safari's history", v10, 2u);
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
  }
}

- (void)numberOfHistorySitesToBeExportedWithProfileIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  connection = self->_connection;
  uint64_t v8 = kWebBookmarksGetNumberOfHistorySitesToBeExportedMessageName;
  id v9 = a3;
  id v10 = [(WebBookmarksXPCConnection *)connection messageWithName:v8];
  id v11 = (void *)MEMORY[0x263F08910];
  id v12 = [v9 allObjects];

  id v21 = 0;
  id v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:0 error:&v21];
  id v14 = v21;

  if (v14)
  {
    id v15 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway numberOfHistorySitesToBeExportedWithProfileIdentifiers:completionHandler:](v15);
    }
    v6[2](v6, 0, v14);
  }
  else
  {
    id v16 = kWebBookmarksNumberOfHistorySitesToBeExportedProfileIdentifiersKey;
    id v17 = v13;
    xpc_dictionary_set_data(v10, v16, (const void *)[v17 bytes], objc_msgSend(v17, "length"));
    id v18 = self->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __104__WebBookmarksSettingsGateway_numberOfHistorySitesToBeExportedWithProfileIdentifiers_completionHandler___block_invoke;
    v19[3] = &unk_2643DC568;
    double v20 = v6;
    [(WebBookmarksXPCConnection *)v18 sendMessage:v10 withReplyHandler:v19];
  }
}

void __104__WebBookmarksSettingsGateway_numberOfHistorySitesToBeExportedWithProfileIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __109__WebBookmarksSettingsGateway_exportSafariHistoryToURL_sandboxExtension_profileIdentifier_completionHandler___block_invoke_cold_1(v11);
    }
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0);
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXExport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to export Safari's history", v12, 2u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, kWebBookmarksNumberOfHistorySitesToBeExportedKey);
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, uint64, 0);
  }
}

- (void)importSafariHistoryFromURL:(id)a3 ageLimit:(double)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v20 = 0;
  id v12 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v20];
  id v13 = v20;
  if (v12)
  {
    id v14 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksImportHistoryMessageName];
    xpc_dictionary_set_fd(v14, kWebBookmarksImportHistoryFileDescriptorKey, [v12 fileDescriptor]);
    xpc_dictionary_set_double(v14, kWebBookmarksImportHistoryAgeLimitKey, a4);
    if (v10) {
      id v15 = v10;
    }
    else {
      id v15 = (void *)*MEMORY[0x263F66420];
    }
    xpc_dictionary_set_string(v14, kWebsiteProfileIdentifiersKey, (const char *)[v15 UTF8String]);
    connection = self->_connection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __103__WebBookmarksSettingsGateway_importSafariHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke;
    v18[3] = &unk_2643DC568;
    id v19 = v11;
    [(WebBookmarksXPCConnection *)connection sendMessage:v14 withReplyHandler:v18];
  }
  else
  {
    id v17 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway importSafariHistoryFromURL:ageLimit:profileIdentifier:completionHandler:](v17);
    }
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
  }
}

void __103__WebBookmarksSettingsGateway_importSafariHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __103__WebBookmarksSettingsGateway_importSafariHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke_cold_1(v11);
    }
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0);
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to import Safari's history", v12, 2u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, kWebBookmarksImportHistoryItemsCountKey);
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, uint64, 0);
  }
}

- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void, id))a5;
  connection = self->_connection;
  id v11 = kWebBookmarksScanImportURLsMessageName;
  id v12 = a3;
  id v13 = [(WebBookmarksXPCConnection *)connection messageWithName:v11];
  id v28 = 0;
  id v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:0 error:&v28];

  id v15 = v28;
  if (v15)
  {
    id v16 = v15;
    id v17 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway scanImportURLs:sandboxExtensions:completionHandler:](v17);
    }
    v9[2](v9, MEMORY[0x263EFFA78], v16);
  }
  else
  {
    id v27 = 0;
    id v18 = [MEMORY[0x263F08910] archivedDataWithRootObject:v8 requiringSecureCoding:0 error:&v27];
    id v16 = v27;
    if (v16)
    {
      id v19 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarksSettingsGateway scanImportURLs:sandboxExtensions:completionHandler:](v19);
      }
      v9[2](v9, MEMORY[0x263EFFA78], v16);
    }
    else
    {
      id v20 = kWebBookmarksImportURLsKey;
      id v21 = v14;
      xpc_dictionary_set_data(v13, v20, (const void *)[v21 bytes], objc_msgSend(v21, "length"));
      double v22 = kWebBookmarksImportSandboxExtensionsKey;
      id v23 = v18;
      xpc_dictionary_set_data(v13, v22, (const void *)[v23 bytes], objc_msgSend(v23, "length"));
      id v24 = self->_connection;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __82__WebBookmarksSettingsGateway_scanImportURLs_sandboxExtensions_completionHandler___block_invoke;
      v25[3] = &unk_2643DC568;
      uint64_t v26 = v9;
      [(WebBookmarksXPCConnection *)v24 sendMessage:v13 withReplyHandler:v25];
    }
  }
}

void __82__WebBookmarksSettingsGateway_scanImportURLs_sandboxExtensions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v21 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __82__WebBookmarksSettingsGateway_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_cold_1(v21);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to scan import URLs", buf, 2u);
      }
    }
    *(void *)buf = 0;
    data = xpc_dictionary_get_data(v5, kWebBookmarksImportURLsResultKey, (size_t *)buf);
    id v10 = (void *)MEMORY[0x263F08928];
    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
    id v16 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:*(void *)buf];
    id v22 = 0;
    id v17 = [v10 unarchivedObjectOfClasses:v15 fromData:v16 error:&v22];
    id v18 = v22;

    if (v18)
    {
      id v19 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __82__WebBookmarksSettingsGateway_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_cold_2(v19);
      }
    }
    if (v17) {
      id v20 = v17;
    }
    else {
      id v20 = (void *)MEMORY[0x263EFFA78];
    }
    (*(void (**)(void, void *, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v20, v18);
  }
}

- (void)importChromeExtensionsFromURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v14 = 0;
  id v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v14];
  id v8 = v14;
  if (v7)
  {
    uint64_t v9 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksImportChromeExtensionsMessageName];
    xpc_dictionary_set_fd(v9, kWebBookmarksImportChromeExtensionsFileDescriptorKey, [v7 fileDescriptor]);
    connection = self->_connection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__WebBookmarksSettingsGateway_importChromeExtensionsFromURL_completionHandler___block_invoke;
    v12[3] = &unk_2643DC568;
    id v13 = v6;
    [(WebBookmarksXPCConnection *)connection sendMessage:v9 withReplyHandler:v12];
  }
  else
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway importChromeExtensionsFromURL:completionHandler:](v11);
    }
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __79__WebBookmarksSettingsGateway_importChromeExtensionsFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__WebBookmarksSettingsGateway_importChromeExtensionsFromURL_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to import extensions", v9, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importCreditCardsFromURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v13 = 0;
  id v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v13];
  id v8 = v13;
  if (v7)
  {
    uint64_t v9 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksImportCreditCardsMessageName];
    xpc_dictionary_set_fd(v9, kWebBookmarksImportCreditCardsFileDescriptorKey, [v7 fileDescriptor]);
    connection = self->_connection;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__WebBookmarksSettingsGateway_importCreditCardsFromURL_completionHandler___block_invoke;
    v11[3] = &unk_2643DC568;
    id v12 = v6;
    [(WebBookmarksXPCConnection *)connection sendMessage:v9 withReplyHandler:v11];
  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __74__WebBookmarksSettingsGateway_importCreditCardsFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__WebBookmarksSettingsGateway_importCreditCardsFromURL_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to import credit cards", v9, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)importExtensionsFromURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v14 = 0;
  id v7 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v14];
  id v8 = v14;
  if (v7)
  {
    uint64_t v9 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksImportExtensionsMessageName];
    xpc_dictionary_set_fd(v9, kWebBookmarksImportExtensionsFileDescriptorKey, [v7 fileDescriptor]);
    connection = self->_connection;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __73__WebBookmarksSettingsGateway_importExtensionsFromURL_completionHandler___block_invoke;
    v12[3] = &unk_2643DC568;
    id v13 = v6;
    [(WebBookmarksXPCConnection *)connection sendMessage:v9 withReplyHandler:v12];
  }
  else
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway importExtensionsFromURL:completionHandler:](v11);
    }
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void __73__WebBookmarksSettingsGateway_importExtensionsFromURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __79__WebBookmarksSettingsGateway_importChromeExtensionsFromURL_completionHandler___block_invoke_cold_1(v7);
    }
  }
  else if (v5)
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to import extensions", v9, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)computeNumberOfItemsToBeImportedFromURL:(id)a3 exportMetadataDataType:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v17 = 0;
  id v10 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v17];
  id v11 = v17;
  if (v10)
  {
    id v12 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksComputeNumberOfItemsToBeImportedMessageName];
    xpc_dictionary_set_fd(v12, kWebBookmarksComputeNumberOfItemsToBeImportedFileDescriptorKey, [v10 fileDescriptor]);
    xpc_dictionary_set_string(v12, kWebBookmarksComputeNumberOfItemsToBeImportedMetadataDataTypeKey, (const char *)[v8 UTF8String]);
    connection = self->_connection;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __112__WebBookmarksSettingsGateway_computeNumberOfItemsToBeImportedFromURL_exportMetadataDataType_completionHandler___block_invoke;
    v15[3] = &unk_2643DC568;
    id v16 = v9;
    [(WebBookmarksXPCConnection *)connection sendMessage:v12 withReplyHandler:v15];
  }
  else
  {
    id v14 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway computeNumberOfItemsToBeImportedFromURL:exportMetadataDataType:completionHandler:](v14);
    }
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v11);
  }
}

void __112__WebBookmarksSettingsGateway_computeNumberOfItemsToBeImportedFromURL_exportMetadataDataType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __112__WebBookmarksSettingsGateway_computeNumberOfItemsToBeImportedFromURL_exportMetadataDataType_completionHandler___block_invoke_cold_1(v11);
    }
    (*(void (**)(void, void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v7);
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to compute the number of items to be imported", v12, 2u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, kWebBookmarksComputeNumberOfItemsToBeImportedResultKey);
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, uint64, 0);
  }
}

- (void)importChromeHistoryFromURL:(id)a3 ageLimit:(double)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v20 = 0;
  id v12 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:a3 error:&v20];
  id v13 = v20;
  if (v12)
  {
    id v14 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksImportChromeHistoryMessageName];
    xpc_dictionary_set_fd(v14, kWebBookmarksImportChromeHistoryFileDescriptorKey, [v12 fileDescriptor]);
    xpc_dictionary_set_double(v14, kWebBookmarksImportChromeHistoryAgeLimitKey, a4);
    if (v10) {
      id v15 = v10;
    }
    else {
      id v15 = (void *)*MEMORY[0x263F66420];
    }
    xpc_dictionary_set_string(v14, kWebsiteProfileIdentifiersKey, (const char *)[v15 UTF8String]);
    connection = self->_connection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __103__WebBookmarksSettingsGateway_importChromeHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke;
    v18[3] = &unk_2643DC568;
    id v19 = v11;
    [(WebBookmarksXPCConnection *)connection sendMessage:v14 withReplyHandler:v18];
  }
  else
  {
    id v17 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarksSettingsGateway importSafariHistoryFromURL:ageLimit:profileIdentifier:completionHandler:](v17);
    }
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v13);
  }
}

void __103__WebBookmarksSettingsGateway_importChromeHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v11 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __103__WebBookmarksSettingsGateway_importSafariHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke_cold_1(v11);
    }
    (*(void (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, 0);
  }
  else
  {
    if (xpc_dictionary_get_BOOL(v5, webBookmarksMessageReceivedAcknowledgementKey))
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_21C043000, v8, OS_LOG_TYPE_INFO, "Received acknowledgement that XPC message was delivered to import Safari's history", v12, 2u);
      }
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, kWebBookmarksImportChromeHistoryItemsCountKey);
    (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, uint64, 0);
  }
}

- (void)_enableExtensionWithMessage:(id)a3 connection:(id)a4
{
  id v5 = kWebBookmarksEnableImportedExtensionAdamIdentifierKey;
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, v5);
  id v8 = (void *)xpc_dictionary_get_string(v6, kWebBookmarksEnableImportedExtensionAlternatePlatformAppBundleIdentifierKey);
  uint64_t v9 = (void *)xpc_dictionary_get_string(v6, kWebBookmarksEnableImportedExtensionAlternatePlatformExtensionBundleIdentifierKey);
  id v10 = (void *)xpc_dictionary_get_string(v6, kWebBookmarksEnableImportedExtensionComposedIdentifierKey);

  if (string)
  {
    id v12 = [NSString stringWithUTF8String:string];
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v12 = 0;
  if (v8)
  {
LABEL_3:
    id v8 = [NSString stringWithUTF8String:v8];
  }
LABEL_4:
  if (v9)
  {
    uint64_t v9 = [NSString stringWithUTF8String:v9];
  }
  if (v10)
  {
    id v10 = [NSString stringWithUTF8String:v10];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsImporterDelegate);
  [WeakRetained enableExtensionWithComposedIdentifier:v10 adamIdentifier:v12 alternatePlatformAppBundleIdentifier:v8 alternatePlatformExtensionBundleIdentifier:v9];
}

- (void)_finishedImportingExtensionsWithMessage:(id)a3 connection:(id)a4
{
  connection = self->_connection;
  messageReceivedAcknowledgementReply(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(WebBookmarksXPCConnection *)connection sendMessage:v5];
}

- (void)_saveCreditCardWithMessage:(id)a3 connection:(id)a4
{
  id v5 = NSString;
  id v6 = kWebBookmarksSaveImportedCreditCardNumberKey;
  id v7 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", xpc_dictionary_get_string(v7, v6));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v7, kWebBookmarksSaveImportedCreditCardNameKey);
  uint64_t v9 = (void *)xpc_dictionary_get_string(v7, kWebBookmarksSaveImportedCreditCardHolderNameKey);
  int64 = (void *)xpc_dictionary_get_int64(v7, kWebBookmarksSaveImportedCreditCardExpirationMonthKey);
  id v11 = (void *)xpc_dictionary_get_int64(v7, kWebBookmarksSaveImportedCreditCardExpirationYearKey);
  date = (void *)xpc_dictionary_get_date(v7, kWebBookmarksSaveImportedCreditCardLastUsedDateKey);

  if (string)
  {
    id v13 = [NSString stringWithUTF8String:string];
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v13 = 0;
  if (v9)
  {
LABEL_3:
    uint64_t v9 = [NSString stringWithUTF8String:v9];
  }
LABEL_4:
  if (int64)
  {
    int64 = [NSNumber numberWithLongLong:int64];
  }
  if (v11)
  {
    id v11 = [NSNumber numberWithLongLong:v11];
  }
  if (date)
  {
    date = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:(double)(uint64_t)date];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_creditCardImporterDelegate);
  [WeakRetained importCreditCardDataWithCardNumber:v15 cardName:v13 cardholderName:v9 cardExpirationMonth:int64 cardExpirationYear:v11 lastUsedDate:date];
}

- (void)_finishedImportingCreditCardsWithMessage:(id)a3 connection:(id)a4
{
  connection = self->_connection;
  messageReceivedAcknowledgementReply(a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(WebBookmarksXPCConnection *)connection sendMessage:v5];
}

- (void)scheduleBookmarksDatabaseMaintenance
{
  id v3 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:webBookmarksScheduleBookmarksDatabaseMaintenanceTask];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v3];
}

- (void)scheduleBookmarksDatabaseMigrationTask
{
  id v3 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:webBookmarksScheduleBookmarksDatabaseMigrationTask];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v3];
}

- (void)scheduleHSTSSuperCookieCleanup
{
  id v3 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:kWebBookmarksClearHSTSSuperCookiesMessageName];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v3];
}

- (void)schedulePasswordIconsCleanup
{
  id v3 = [(WebBookmarksXPCConnection *)self->_connection messageWithName:webBookmarksPasswordIconsCleanupMessageName];
  [(WebBookmarksXPCConnection *)self->_connection sendMessage:v3];
}

- (void)connection:(id)a3 didCloseWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = [v5 description];
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_21C043000, v7, OS_LOG_TYPE_INFO, "Settings gateway connection closed with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(WebBookmarksSettingsGateway *)self _setupConnection];
}

- (WBSCreditCardImporterDelegate)creditCardImporterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_creditCardImporterDelegate);
  return (WBSCreditCardImporterDelegate *)WeakRetained;
}

- (void)setCreditCardImporterDelegate:(id)a3
{
}

- (WBSExtensionsImporterDelegate)extensionsImporterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionsImporterDelegate);
  return (WBSExtensionsImporterDelegate *)WeakRetained;
}

- (void)setExtensionsImporterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionsImporterDelegate);
  objc_destroyWeak((id *)&self->_creditCardImporterDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __67__WebBookmarksSettingsGateway_getSafariWebDataUsageWithCompletion___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_6() localizedDescription];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error obtaining website data from webbookmarksd: %{public}@.", v6, v7, v8, v9, v10);
}

void __104__WebBookmarksSettingsGateway_deleteAllSafariSecurityOriginsForProfileWithIdentifier_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to delete all website data. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __79__WebBookmarksSettingsGateway_deleteSafariWebsiteDataRecord_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to delete individual website data. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __90__WebBookmarksSettingsGateway_deleteSafariPersistentURLCacheStorageWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to delete persistent URL cache storage. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __155__WebBookmarksSettingsGateway_clearHistoryVisitsAddedAfterDate_beforeDate_profileIdentifiers_options_clearAllSpotlightHistoryForProfile_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to delete Safari's history. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __87__WebBookmarksSettingsGateway_exportBookmarksToURL_sandboxExtension_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to export bookmarks. Error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)importBookmarksFromURL:(void *)a1 inFolderWithSuggestedName:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while creating a file handle to import bookmarks from: %{public}@", v6, v7, v8, v9, v10);
}

void __98__WebBookmarksSettingsGateway_importBookmarksFromURL_inFolderWithSuggestedName_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to import bookmarks. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __109__WebBookmarksSettingsGateway_exportSafariHistoryToURL_sandboxExtension_profileIdentifier_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to export Safari's history. Error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)numberOfHistorySitesToBeExportedWithProfileIdentifiers:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Failed to archive the profile identifiers to get the number of history sites for: %{public}@", v6, v7, v8, v9, v10);
}

- (void)importSafariHistoryFromURL:(void *)a1 ageLimit:profileIdentifier:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while creating a file handle to import history from: %{public}@", v6, v7, v8, v9, v10);
}

void __103__WebBookmarksSettingsGateway_importSafariHistoryFromURL_ageLimit_profileIdentifier_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to import Safari's history. Error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)scanImportURLs:(void *)a1 sandboxExtensions:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Failed to archive the sandbox extensions: %{public}@", v6, v7, v8, v9, v10);
}

- (void)scanImportURLs:(void *)a1 sandboxExtensions:completionHandler:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Failed to archive the import URLs to be scanned: %{public}@", v6, v7, v8, v9, v10);
}

void __82__WebBookmarksSettingsGateway_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to scan import URLs. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __82__WebBookmarksSettingsGateway_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Failed to read the reply data from scanning import URLs: %{public}@", v6, v7, v8, v9, v10);
}

- (void)importChromeExtensionsFromURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while creating a file handle to import Chrome extensions from: %{public}@", v6, v7, v8, v9, v10);
}

void __79__WebBookmarksSettingsGateway_importChromeExtensionsFromURL_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to import extensions. Error: %{public}@", v6, v7, v8, v9, v10);
}

void __74__WebBookmarksSettingsGateway_importCreditCardsFromURL_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to import credit cards. Error: %{public}@", v6, v7, v8, v9, v10);
}

- (void)importExtensionsFromURL:(void *)a1 completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while creating a file handle to import extensions from: %{public}@", v6, v7, v8, v9, v10);
}

- (void)computeNumberOfItemsToBeImportedFromURL:(void *)a1 exportMetadataDataType:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while creating a file handle for the file to compute the number of items to be imported from %{public}@", v6, v7, v8, v9, v10);
}

void __112__WebBookmarksSettingsGateway_computeNumberOfItemsToBeImportedFromURL_exportMetadataDataType_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_6(), "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v4, v5, "Error encountered while delivering XPC message to compute the number of items to be imported. Error: %{public}@", v6, v7, v8, v9, v10);
}

@end