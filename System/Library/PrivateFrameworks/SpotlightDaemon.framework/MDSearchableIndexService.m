@interface MDSearchableIndexService
- (BOOL)_canProcessIndexDataForBundle:(id)a3 itemsDecoder:(id)a4 deletesDecoder:(id)a5 clientState:(id)a6 clientStateName:(id)a7 outError:(id *)a8;
- (BOOL)_deleteInteractions:(id)a3 forGroup:(BOOL)a4;
- (BOOL)_jobForIndex:(int64_t)a3;
- (BOOL)addInteraction:(id)a3;
- (BOOL)allowMail;
- (BOOL)allowMessagesContent;
- (BOOL)allowNotifications;
- (BOOL)allowOpenJournalFile;
- (BOOL)allowPhotosLibraryDeletion;
- (BOOL)changeState:(id)a3;
- (BOOL)checkIn:(id)a3;
- (BOOL)dataMigration:(id)a3;
- (BOOL)deleteActionsBeforeTime:(id)a3;
- (BOOL)deleteActionsWithIdentifiers:(id)a3;
- (BOOL)deleteAllInteractions:(id)a3;
- (BOOL)deleteAllUserActivities:(id)a3;
- (BOOL)deleteBundle:(id)a3;
- (BOOL)deleteDomains:(id)a3;
- (BOOL)deleteSinceDate:(id)a3;
- (BOOL)deleteUserActivitiesWithPersistentIdentifiers:(id)a3;
- (BOOL)donateRelevantActions:(id)a3;
- (BOOL)fetchAttributes:(id)a3;
- (BOOL)fetchCacheFileDescriptors:(id)a3;
- (BOOL)fetchClientState:(id)a3;
- (BOOL)finishIndexingLocked:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4;
- (BOOL)isExtension;
- (BOOL)isInternal;
- (BOOL)isPrivate;
- (BOOL)issueCacheCommand:(id)a3;
- (BOOL)issueCommand:(id)a3;
- (BOOL)openJournalFile:(id)a3;
- (BOOL)photosLibraryDeleted:(id)a3;
- (BOOL)prepareIndexingLocked:(id)a3;
- (BOOL)processActivities:(id)a3;
- (BOOL)processIndexData:(id)a3;
- (BOOL)quotaDisabled;
- (BOOL)searchInternal;
- (BOOL)transferDeleteJournals:(id)a3;
- (BOOL)updateCorrections:(id)a3;
- (BOOL)willModify:(id)a3;
- (CSIndexingQueue)activityQueue;
- (MDIndexer)indexer;
- (NSString)clientBundleID;
- (NSString)clientPersonaID;
- (NSString)processDescription;
- (NSString)protectionClass;
- (OS_dispatch_queue)clientQueue;
- (OS_xpc_object)clientConnection;
- (id)_checkBundleIDHelper:(id)a3;
- (id)_checkItems:(id)a3 identifiers:(id)a4 protectionClass:(id)a5 bundleID:(id)a6;
- (id)_checkNonEmptyBundle:(id)a3 protectionClass:(id)a4;
- (int)entitledAttributes;
- (unsigned)clientUID;
- (void)_deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)_dispatchActivities:(id)a3;
- (void)_dispatchActivities:(id)a3 bundleID:(id)a4;
- (void)_dispatchToReceiversWithBundleID:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 deletes:(id)a9;
- (void)_forceAppWithBundleID:(id)a3 toPerformJob:(id)a4;
- (void)_issueCommand:(id)a3 outFileDescriptor:(int)a4 searchContext:(id)a5 completionHandler:(id)a6;
- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5;
- (void)_makeActivityQueueIfNecessary;
- (void)_processIndexDataForBundle:(id)a3 protectionClass:(id)a4 personaID:(id)a5 options:(int64_t)a6 items:(id)a7 itemsText:(id)a8 itemsHTML:(id)a9 clientState:(id)a10 expectedClientState:(id)a11 clientStateName:(id)a12 deletes:(id)a13 completionHandler:(id)a14;
- (void)_runLibraryDeletedCommand:(id)a3;
- (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 protectionClass:(id)a5 forBundleID:(id)a6 forUTIType:(id)a7 options:(int64_t)a8;
- (void)checkInWithProtectionClass:(id)a3 completionHandler:(id)a4;
- (void)deleteActionsBeforeTime:(double)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)deleteActionsWithIdentifiers:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6;
- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 fromClient:(id)a6 options:(int64_t)a7 completionHandler:(id)a8;
- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)donateRelevantActions:(id)a3 bundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(unsigned int)a8 qos:(unsigned int)a9 reply:(id)a10 completionHandler:(id)a11;
- (void)fetchCacheFileDescriptorsForProtectionClass:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(unsigned int)a7 qos:(unsigned int)a8 reply:(id)a9 completionHandler:(id)a10;
- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
- (void)finishIndexingWhileLocked:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5;
- (void)flushUserActivities;
- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 clientState:(id)a9 expectedClientState:(id)a10 clientStateName:(id)a11 deletes:(id)a12 userActivities:(BOOL)a13 completionHandler:(id)a14;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10;
- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9;
- (void)performDataMigrationWithTimeout:(id)a3 completionHandler:(id)a4;
- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5;
- (void)prepareIndexingWhileLocked:(id)a3 protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6;
- (void)provideDataForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6;
- (void)provideFileURLForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6;
- (void)setAllowMail:(BOOL)a3;
- (void)setAllowMessagesContent:(BOOL)a3;
- (void)setAllowNotifications:(BOOL)a3;
- (void)setAllowOpenJournalFile:(BOOL)a3;
- (void)setAllowPhotosLibraryDeletion:(BOOL)a3;
- (void)setClientBundleID:(id)a3;
- (void)setClientConnection:(id)a3;
- (void)setClientPersonaID:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setClientUID:(unsigned int)a3;
- (void)setEntitledAttributes:(int)a3;
- (void)setIndexer:(id)a3;
- (void)setIsExtension:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsPrivate:(BOOL)a3;
- (void)setProtectionClass:(id)a3;
- (void)setQuotaDisabled:(BOOL)a3;
- (void)setSearchInternal:(BOOL)a3;
- (void)transferDeleteJournalsForProtectionClass:(const char *)a3 toDirectory:(int)a4 withCompletionHandler:(id)a5;
- (void)updateCorrectionsWithFilePath:(id)a3 options:(int64_t)a4 completionHandler:(id)a5;
- (void)userPerformedAction:(id)a3 withItem:(id)a4 protectionClass:(id)a5;
- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7;
@end

@implementation MDSearchableIndexService

void __41__MDSearchableIndexService_issueCommand___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24))
  {
    v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __41__MDSearchableIndexService_issueCommand___block_invoke_2_cold_1(a1, v8, v9);
    }
  }
  else
  {
    *(unsigned char *)(v7 + 24) = 1;
    if ((*(_DWORD *)(a1 + 120) & 0x80000000) == 0) {
      guarded_close_np();
    }
    uint64_t v10 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v21 = *(_OWORD *)v10;
    long long v22 = *(_OWORD *)(v10 + 16);
    uint64_t v23 = *(void *)(v10 + 32);
    uint64_t v11 = *(void *)(a1 + 104);
    long long v12 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)(v10 + 16) = v12;
    *(void *)(v10 + 32) = v11;
    long long v18 = *(_OWORD *)(a1 + 72);
    long long v19 = *(_OWORD *)(a1 + 88);
    uint64_t v20 = *(void *)(a1 + 104);
    uint64_t v13 = *(void *)v10;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v15 = *(void *)(v10 + 8);
    *(void *)uint64_t v10 = v13;
    *(void *)(v10 + 8) = spanid;
    *(void *)(v10 + 16) = v15;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = "completion handler for issueCommand";
    si_tracing_log_span_begin();
    if (*(void *)(a1 + 32))
    {
      csindex_xpc_dictionary_encode_status_with_error();
      if (v5)
      {
        v16 = *(void **)(a1 + 32);
        id v17 = v5;
        xpc_dictionary_set_data(v16, "data", (const void *)objc_msgSend(v17, "bytes", v18, v19, v20), objc_msgSend(v17, "length"));
      }
      xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 112));
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
    }
    si_tracing_log_span_end();
    *(_OWORD *)uint64_t v10 = v21;
    *(_OWORD *)(v10 + 16) = v22;
    *(void *)(v10 + 32) = v23;
  }
}

uint64_t __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteSearchableItemsWithDomainIdentifiers:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40) client:a2];
}

void __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke_52(void *a1, uint64_t a2)
{
  if ((a2 | 2) == 2 && ((v4 = (void *)a1[4]) != 0 || (v4 = (void *)a1[5]) != 0)) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  +[SpotlightSender addOrUpdateSearchableItems:a1[6] itemsContent:v5 bundleID:a1[7] protectionClass:a1[8] client:a2];
}

uint64_t __110__MDSearchableIndexService_addInteraction_intentClassName_bundleID_protectionClass_options_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  return +[SpotlightSender addInteraction:a1[4] intentClassName:a1[5] bundleID:a1[6] protectionClass:a1[7] client:a2];
}

- (void)setSearchInternal:(BOOL)a3
{
  self->_searchInternal = a3;
}

- (void)setQuotaDisabled:(BOOL)a3
{
  self->_quotaDisabled = a3;
}

- (void)setProtectionClass:(id)a3
{
}

- (void)setIsPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (void)setIsExtension:(BOOL)a3
{
  self->_isExtension = a3;
}

- (void)setIndexer:(id)a3
{
}

- (void)setEntitledAttributes:(int)a3
{
  self->_entitledAttributes = a3;
}

- (void)setClientUID:(unsigned int)a3
{
  self->_clientUID = a3;
}

- (void)setClientQueue:(id)a3
{
}

- (void)setClientConnection:(id)a3
{
}

- (void)setClientBundleID:(id)a3
{
}

- (void)setAllowPhotosLibraryDeletion:(BOOL)a3
{
  self->_allowPhotosLibraryDeletion = a3;
}

- (void)setAllowOpenJournalFile:(BOOL)a3
{
  self->_allowOpenJournalFile = a3;
}

- (void)setAllowNotifications:(BOOL)a3
{
  self->_allowNotifications = a3;
}

- (void)setAllowMail:(BOOL)a3
{
  self->_allowMail = a3;
}

- (void)setClientPersonaID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_clientPersonaID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
}

- (BOOL)addInteraction:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    v31 = self;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v35 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    uint64_t v30 = xpc_dictionary_get_uint64(v4, "opt");
    v33 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    v32 = [MEMORY[0x263F02B30] dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:v4];
    uint64_t v10 = [v32 data];
    v34 = (void *)[v10 copy];

    uint64_t v11 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v12 = *(_OWORD *)(v11 + 16);
    long long v49 = *(_OWORD *)v11;
    long long v50 = v12;
    uint64_t v51 = *(void *)(v11 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v11 = v13;
    *(void *)(v11 + 8) = spanid;
    *(void *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = "-[MDSearchableIndexService addInteraction:]";
    si_tracing_log_span_begin();
    long long v15 = *(_OWORD *)(v11 + 16);
    long long v46 = *(_OWORD *)v11;
    long long v47 = v15;
    uint64_t v48 = *(void *)(v11 + 32);
    uint64_t v16 = *(void *)v11;
    uint64_t v17 = si_tracing_calc_next_spanid();
    uint64_t v18 = *(void *)(v11 + 8);
    int v19 = *(_DWORD *)(v11 + 24);
    if (v35)
    {
      id v20 = v35;
      if (!strcmp((const char *)[v20 UTF8String], "NSFileProtectionComplete"))
      {
        uint64_t v23 = "Class A index";
      }
      else
      {
        id v21 = v20;
        if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          uint64_t v23 = "Class B index";
        }
        else
        {
          id v22 = v21;
          if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            uint64_t v23 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            uint64_t v23 = "Class C index";
          }
          else
          {
            uint64_t v23 = "Unknown index";
          }
        }
      }
    }
    else
    {
      uint64_t v23 = "Nil index";
    }
    *(void *)uint64_t v11 = v16;
    *(void *)(v11 + 8) = v17;
    *(void *)(v11 + 16) = v18;
    *(_DWORD *)(v11 + 24) = v19;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = v23;
    si_tracing_log_span_begin();
    long long v24 = *(_OWORD *)(v11 + 16);
    long long v43 = *(_OWORD *)v11;
    long long v44 = v24;
    uint64_t v45 = *(void *)(v11 + 32);
    uint64_t v25 = [v34 length];
    BOOL v8 = v25 != 0;
    if (v25)
    {
      v26 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"icn" fromXPCDictionary:v4];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __43__MDSearchableIndexService_addInteraction___block_invoke;
      v36[3] = &unk_264509778;
      long long v39 = v43;
      long long v40 = v44;
      uint64_t v41 = v45;
      id v37 = v7;
      uint64_t v42 = uint64;
      id v38 = v5;
      [(MDSearchableIndexService *)v31 addInteraction:v34 intentClassName:v26 bundleID:v33 protectionClass:v35 options:v30 completionHandler:v36];
    }
    si_tracing_log_span_end();
    long long v27 = v47;
    *(_OWORD *)uint64_t v11 = v46;
    *(_OWORD *)(v11 + 16) = v27;
    *(void *)(v11 + 32) = v48;
    si_tracing_log_span_end();
    long long v28 = v50;
    *(_OWORD *)uint64_t v11 = v49;
    *(_OWORD *)(v11 + 16) = v28;
    *(void *)(v11 + 32) = v51;
  }
  return v8;
}

- (BOOL)processIndexData:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    uint64_t value = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v9 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(MDSearchableIndexService *)self clientBundleID];
    }
    id v12 = v11;

    v70 = [(MDSearchableIndexService *)self clientPersonaID];
    uint64_t v13 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [(MDSearchableIndexService *)self protectionClass];
    }
    id v76 = v15;

    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "opt");
    uint64_t v16 = [MEMORY[0x263F02B30] dataWrapperForKey:"items" sizeKey:"items-size" fromXPCDictionary:v4];
    v79 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v4];
    v78 = [MEMORY[0x263F02B30] dataWrapperForKey:"client-state-key" sizeKey:"client-state-size" fromXPCDictionary:v4];
    v71 = [MEMORY[0x263F02B30] dataWrapperForKey:"expected-client-state-key" sizeKey:"expected-client-state-size" fromXPCDictionary:v4];
    v75 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"n" fromXPCDictionary:v4];
    v77 = v16;
    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x263F02A48]);
      uint64_t v18 = [v16 data];
      id v80 = (id)[v17 initWithData:v18];
    }
    else
    {
      id v80 = 0;
    }
    xpc_connection_t connection = v5;
    if (v79)
    {
      id v19 = objc_alloc(MEMORY[0x263F02A48]);
      id v20 = [v79 data];
      v81 = (void *)[v19 initWithData:v20];
    }
    else
    {
      v81 = 0;
    }
    v73 = v12;
    uint64_t v21 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v22 = *(_OWORD *)(v21 + 16);
    long long v101 = *(_OWORD *)v21;
    long long v102 = v22;
    uint64_t v103 = *(void *)(v21 + 32);
    uint64_t v23 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v21 = v23;
    *(void *)(v21 + 8) = spanid;
    *(void *)(v21 + 16) = 0;
    *(_DWORD *)(v21 + 24) = value;
    *(unsigned char *)(v21 + 28) = 102;
    *(void *)(v21 + 32) = "-[MDSearchableIndexService processIndexData:]";
    si_tracing_log_span_begin();
    long long v25 = *(_OWORD *)(v21 + 16);
    long long v98 = *(_OWORD *)v21;
    long long v99 = v25;
    uint64_t v100 = *(void *)(v21 + 32);
    uint64_t v26 = *(void *)v21;
    uint64_t v27 = si_tracing_calc_next_spanid();
    uint64_t v28 = *(void *)(v21 + 8);
    int v29 = *(_DWORD *)(v21 + 24);
    if (v76)
    {
      id v30 = v76;
      if (!strcmp((const char *)[v30 UTF8String], "NSFileProtectionComplete"))
      {
        v33 = "Class A index";
      }
      else
      {
        id v31 = v30;
        if (!strcmp((const char *)[v31 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          v33 = "Class B index";
        }
        else
        {
          id v32 = v31;
          if (!strcmp((const char *)[v32 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            v33 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v32 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            v33 = "Class C index";
          }
          else
          {
            v33 = "Unknown index";
          }
        }
      }
    }
    else
    {
      v33 = "Nil index";
    }
    *(void *)uint64_t v21 = v26;
    *(void *)(v21 + 8) = v27;
    *(void *)(v21 + 16) = v28;
    *(_DWORD *)(v21 + 24) = v29;
    *(unsigned char *)(v21 + 28) = 102;
    *(void *)(v21 + 32) = v33;
    si_tracing_log_span_begin();
    [v78 data];
    id v35 = v34 = v73;
    id v97 = 0;
    BOOL v8 = [(MDSearchableIndexService *)self _canProcessIndexDataForBundle:v73 itemsDecoder:v80 deletesDecoder:v81 clientState:v35 clientStateName:v75 outError:&v97];
    id v68 = v97;

    if (v8)
    {
      v36 = v80;
      if (v80
        && ([v80 obj], BOOL v37 = _MDPlistGetPlistObjectType() == 240, v36 = v80, v37)
        && ([v80 obj], LODWORD(v38) = _MDPlistArrayGetCount(), v36 = v80, v38))
      {
        v67 = [MEMORY[0x263F02B30] dataWrapperForKey:"textdata" sizeKey:"text-data-size" fromXPCDictionary:v4];
        char v39 = 0;
        uint64_t v38 = v38;
      }
      else
      {

        uint64_t v38 = 0;
        v77 = 0;
        id v80 = 0;
        v67 = 0;
        char v39 = 1;
      }
      long long v40 = v81;
      if (v81
        && ([v81 obj], PlistObjectType = _MDPlistGetPlistObjectType(), long long v40 = v81, PlistObjectType == 240)
        && ([v81 obj], Count = _MDPlistArrayGetCount(), long long v40 = v81, Count))
      {
        uint64_t v43 = Count;
      }
      else
      {

        uint64_t v43 = 0;
        v79 = 0;
        v81 = 0;
      }
      long long v44 = 0;
      if (v43 | v38 && (uint64 & 0x24F) != 4)
      {
        if (self->_isPrivate
          || (+[CSRecieverState sharedInstance],
              uint64_t v45 = objc_claimAutoreleasedReturnValue(),
              int v46 = [v45 checkBundleIdentifier:v73],
              v45,
              !v46))
        {
          long long v44 = 0;
        }
        else
        {
          if (v39)
          {
            v65 = 0;
            long long v47 = 0;
            uint64_t v48 = 0;
            long long v49 = v80;
          }
          else
          {
            v65 = [MEMORY[0x263F02B30] dataWrapperForKey:"htmldata" sizeKey:"html-data-size" fromXPCDictionary:v4];
            long long v49 = v80;
            if (v65)
            {
              id v60 = objc_alloc(MEMORY[0x263F02A48]);
              v61 = [v65 data];
              uint64_t v48 = (void *)[v60 initWithData:v61];

              [v48 setBackingStore:v65];
            }
            else
            {
              uint64_t v48 = 0;
            }
            if (v67)
            {
              id v62 = objc_alloc(MEMORY[0x263F02A48]);
              v63 = [v67 data];
              long long v47 = (void *)[v62 initWithData:v63];

              [v47 setBackingStore:v67];
            }
            else
            {
              long long v47 = 0;
            }
          }
          [v49 setBackingStore:v77];
          [v81 setBackingStore:v79];
          [(MDSearchableIndexService *)self _dispatchToReceiversWithBundleID:v73 protectionClass:v76 options:uint64 items:v49 itemsText:v47 itemsHTML:v48 deletes:v81];

          long long v44 = v65;
        }
      }
      if ([(MDSearchableIndexService *)self _jobForIndex:uint64])
      {
        v64 = v7;
        v66 = v44;
        long long v50 = *(_OWORD *)(v21 + 16);
        long long v94 = *(_OWORD *)v21;
        long long v95 = v50;
        uint64_t v96 = *(void *)(v21 + 32);
        uint64_t v51 = [v77 data];
        v52 = [v67 data];
        v53 = [v44 data];
        v54 = [v78 data];
        v55 = [v71 data];
        v56 = [v79 data];
        v82[0] = MEMORY[0x263EF8330];
        v82[1] = 3221225472;
        long long v90 = v94;
        v82[2] = __45__MDSearchableIndexService_processIndexData___block_invoke;
        v82[3] = &unk_264509750;
        long long v91 = v95;
        uint64_t v92 = v96;
        id v83 = v77;
        id v84 = v67;
        id v85 = v66;
        id v86 = v79;
        id v87 = v78;
        id v88 = v64;
        uint64_t v93 = value;
        v89 = connection;
        [(MDSearchableIndexService *)self _processIndexDataForBundle:v73 protectionClass:v76 personaID:v70 options:uint64 items:v51 itemsText:v52 itemsHTML:v53 clientState:v54 expectedClientState:v55 clientStateName:v75 deletes:v56 completionHandler:v82];

        v34 = v73;
        uint64_t v7 = v64;
        long long v44 = v66;
      }
      else
      {
        csindex_xpc_dictionary_encode_status_with_error();
        xpc_dictionary_set_uint64(v7, "id", value);
        xpc_connection_send_message(connection, v7);
      }
    }
    si_tracing_log_span_end();
    long long v57 = v99;
    *(_OWORD *)uint64_t v21 = v98;
    *(_OWORD *)(v21 + 16) = v57;
    *(void *)(v21 + 32) = v100;
    si_tracing_log_span_end();
    long long v58 = v102;
    *(_OWORD *)uint64_t v21 = v101;
    *(_OWORD *)(v21 + 16) = v58;
    *(void *)(v21 + 32) = v103;

    id v5 = connection;
  }

  return v8;
}

- (BOOL)deleteDomains:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t v38 = self;
    BOOL v35 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v41 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    char v39 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v37 = xpc_dictionary_get_uint64(v4, "opt");
    id v11 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v4];
    id v12 = objc_alloc(MEMORY[0x263F02A48]);
    v36 = v11;
    uint64_t v13 = [v11 data];
    v14 = (void *)[v12 initWithData:v13];

    v34 = v14;
    long long v40 = [v14 decode];
    uint64_t v15 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v16 = *(_OWORD *)(v15 + 16);
    long long v56 = *(_OWORD *)v15;
    long long v57 = v16;
    uint64_t v58 = *(void *)(v15 + 32);
    uint64_t v17 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v15 = v17;
    *(void *)(v15 + 8) = spanid;
    *(void *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = "-[MDSearchableIndexService deleteDomains:]";
    si_tracing_log_span_begin();
    long long v19 = *(_OWORD *)(v15 + 16);
    long long v53 = *(_OWORD *)v15;
    long long v54 = v19;
    uint64_t v55 = *(void *)(v15 + 32);
    uint64_t v20 = *(void *)v15;
    uint64_t v21 = si_tracing_calc_next_spanid();
    uint64_t v22 = *(void *)(v15 + 8);
    int v23 = *(_DWORD *)(v15 + 24);
    if (v41)
    {
      id v24 = v41;
      if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionComplete"))
      {
        uint64_t v27 = "Class A index";
      }
      else
      {
        id v25 = v24;
        if (!strcmp((const char *)[v25 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          uint64_t v27 = "Class B index";
        }
        else
        {
          id v26 = v25;
          if (!strcmp((const char *)[v26 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            uint64_t v27 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v26 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            uint64_t v27 = "Class C index";
          }
          else
          {
            uint64_t v27 = "Unknown index";
          }
        }
      }
    }
    else
    {
      uint64_t v27 = "Nil index";
    }
    *(void *)uint64_t v15 = v20;
    *(void *)(v15 + 8) = v21;
    *(void *)(v15 + 16) = v22;
    *(_DWORD *)(v15 + 24) = v23;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = v27;
    si_tracing_log_span_begin();
    long long v28 = *(_OWORD *)(v15 + 16);
    long long v50 = *(_OWORD *)v15;
    long long v51 = v28;
    uint64_t v52 = *(void *)(v15 + 32);
    int v29 = [(MDSearchableIndexService *)v38 clientBundleID];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    long long v46 = v50;
    long long v47 = v51;
    v42[2] = __42__MDSearchableIndexService_deleteDomains___block_invoke;
    v42[3] = &unk_2645097A0;
    uint64_t v48 = v52;
    id v30 = v36;
    id v43 = v30;
    id v44 = v7;
    uint64_t v49 = uint64;
    id v45 = v5;
    [(MDSearchableIndexService *)v38 deleteSearchableItemsWithDomainIdentifiers:v40 protectionClass:v41 forBundleID:v39 fromClient:v29 options:v37 completionHandler:v42];

    si_tracing_log_span_end();
    long long v31 = v54;
    *(_OWORD *)uint64_t v15 = v53;
    *(_OWORD *)(v15 + 16) = v31;
    *(void *)(v15 + 32) = v55;
    si_tracing_log_span_end();
    long long v32 = v57;
    *(_OWORD *)uint64_t v15 = v56;
    *(_OWORD *)(v15 + 16) = v32;
    *(void *)(v15 + 32) = v58;

    BOOL v9 = v35;
  }

  return v9;
}

- (BOOL)checkIn:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5)
  {
    long long v32 = self;
    v33 = reply;
    BOOL v8 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v10 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v11 = *(_OWORD *)(v10 + 16);
    long long v48 = *(_OWORD *)v10;
    long long v49 = v11;
    uint64_t v50 = *(void *)(v10 + 32);
    uint64_t v12 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v10 = v12;
    *(void *)(v10 + 8) = spanid;
    *(void *)(v10 + 16) = 0;
    *(_DWORD *)(v10 + 24) = uint64;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = "-[MDSearchableIndexService checkIn:]";
    si_tracing_log_span_begin();
    long long v14 = *(_OWORD *)(v10 + 16);
    long long v45 = *(_OWORD *)v10;
    long long v46 = v14;
    uint64_t v47 = *(void *)(v10 + 32);
    uint64_t v15 = *(void *)v10;
    uint64_t v16 = si_tracing_calc_next_spanid();
    uint64_t v17 = *(void *)(v10 + 8);
    int v18 = *(_DWORD *)(v10 + 24);
    if (v8)
    {
      id v19 = v8;
      if (!strcmp((const char *)[v19 UTF8String], "NSFileProtectionComplete"))
      {
        uint64_t v22 = "Class A index";
      }
      else
      {
        id v20 = v19;
        if (!strcmp((const char *)[v20 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          uint64_t v22 = "Class B index";
        }
        else
        {
          id v21 = v20;
          if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            uint64_t v22 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            uint64_t v22 = "Class C index";
          }
          else
          {
            uint64_t v22 = "Unknown index";
          }
        }
      }
    }
    else
    {
      uint64_t v22 = "Nil index";
    }
    *(void *)uint64_t v10 = v15;
    *(void *)(v10 + 8) = v16;
    *(void *)(v10 + 16) = v17;
    *(_DWORD *)(v10 + 24) = v18;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = v22;
    si_tracing_log_span_begin();
    long long v23 = *(_OWORD *)(v10 + 16);
    long long v42 = *(_OWORD *)v10;
    long long v43 = v23;
    uint64_t v44 = *(void *)(v10 + 32);
    uint64_t v7 = v33;
    if (v33)
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      long long v38 = v42;
      long long v39 = v43;
      v34[2] = __36__MDSearchableIndexService_checkIn___block_invoke;
      v34[3] = &unk_264509728;
      uint64_t v40 = v44;
      id v35 = v33;
      uint64_t v41 = uint64;
      id v36 = v8;
      id v37 = v5;
      id v24 = v32;
      id v25 = (void (**)(void, void, void))MEMORY[0x223C48320](v34);
    }
    else
    {
      id v25 = 0;
      id v24 = v32;
    }
    if (v24->_isExtension)
    {
      id v26 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(MDSearchableIndexService *)v24 processDescription];
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = v27;
        _os_log_impl(&dword_21F1CE000, v26, OS_LOG_TYPE_DEFAULT, "*warn* indexDelegate not supported with Extensions process:%@", buf, 0xCu);
      }
      if (v25)
      {
        long long v28 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
        ((void (**)(void, void, void *))v25)[2](v25, 0, v28);
      }
    }
    else
    {
      [(MDSearchableIndexService *)v24 checkInWithProtectionClass:v8 completionHandler:v25];
    }

    si_tracing_log_span_end();
    long long v29 = v46;
    *(_OWORD *)uint64_t v10 = v45;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v47;
    si_tracing_log_span_end();
    long long v30 = v49;
    *(_OWORD *)uint64_t v10 = v48;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v50;
  }
  return v5 != 0;
}

- (void)checkInWithProtectionClass:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = (void *)MEMORY[0x223C480D0]();
  if (!v6)
  {
    id v6 = [(MDSearchableIndexService *)self protectionClass];
  }
  BOOL v9 = [(MDSearchableIndexService *)self clientBundleID];
  uint64_t v10 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = [(MDSearchableIndexService *)self processDescription];
    int v15 = 138412802;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_debug_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_DEBUG, "(%@) checkInWithProtectionClass, protectionClass:%@, process:%@", (uint8_t *)&v15, 0x20u);
  }
  long long v11 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:0 bundleID:0];
  if (v11)
  {
    if (v7) {
LABEL_16:
    }
      v7[2](v7, 0, v11);
  }
  else if (v9)
  {
    indexer = self->_indexer;
    if (v7 && !indexer)
    {
      v7[2](v7, 0, 0);
      indexer = self->_indexer;
    }
    [(MDIndexer *)indexer clientDidCheckin:v9 protectionClass:v6 service:self completionHandler:v7];
    long long v11 = 0;
  }
  else
  {
    uint64_t v13 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService checkInWithProtectionClass:completionHandler:](self);
    }

    long long v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    if (v7) {
      goto LABEL_16;
    }
  }
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v6];
  if (([v7 isEqualToString:@"com.apple.usernotificationsd"] & 1) == 0)
  {
    BOOL v8 = [(MDSearchableIndexService *)self clientBundleID];
    if (([v8 isEqualToString:@"com.apple.usernotificationsd"] & 1) == 0)
    {

      goto LABEL_11;
    }
    BOOL v9 = [(MDSearchableIndexService *)self allowNotifications];

    if (v9) {
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v10 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _issueCommand:outFileDescriptor:searchContext:completionHandler:](self);
    }

    goto LABEL_9;
  }
  if (![(MDSearchableIndexService *)self allowNotifications]) {
    goto LABEL_6;
  }
LABEL_11:
  if (!strcmp(a3, "delete-bundle"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteBundle:v6];
LABEL_65:
    BOOL v11 = v13;
    goto LABEL_66;
  }
  if (!strcmp(a3, "delete-from-date"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteSinceDate:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "check-in"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self checkIn:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "process-index-data"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self processIndexData:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "will-modify"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self willModify:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete-domains"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteDomains:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "issue"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self issueCommand:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "fetch-client-state"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self fetchClientState:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "change-state"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self changeState:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "data-migration"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self dataMigration:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete-journal-transfer"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self transferDeleteJournals:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "fetch_attributes"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self fetchAttributes:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "fetch_cache_file_descriptors"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self fetchCacheFileDescriptors:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete_all_activities"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteAllUserActivities:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete_activities"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteUserActivitiesWithPersistentIdentifiers:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete-actions-before-time"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteActionsBeforeTime:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete-actions-with-identifiers"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteActionsWithIdentifiers:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "activities"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self processActivities:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "add_interaction"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self addInteraction:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete_interactions"))
  {
    long long v14 = self;
    id v15 = v6;
    uint64_t v16 = 0;
LABEL_64:
    BOOL v13 = [(MDSearchableIndexService *)v14 _deleteInteractions:v15 forGroup:v16];
    goto LABEL_65;
  }
  if (!strcmp(a3, "delete_group_interactions"))
  {
    long long v14 = self;
    id v15 = v6;
    uint64_t v16 = 1;
    goto LABEL_64;
  }
  if (!strcmp(a3, "delete_all_interactions"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self deleteAllInteractions:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "donate_relevant_actions"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self donateRelevantActions:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "photoslibrary-deleted"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self photosLibraryDeleted:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "prepare-indexing-locked"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self prepareIndexingLocked:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "finish-indexing-locked"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self finishIndexingLocked:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "cache-command-issue"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self issueCacheCommand:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "update-corrections"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self updateCorrections:v6];
    goto LABEL_65;
  }
  if (!strcmp(a3, "open-journal"))
  {
    BOOL v13 = [(MDSearchableIndexService *)self openJournalFile:v6];
    goto LABEL_65;
  }
  uint64_t v12 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[MDSearchableIndexService handleCommand:info:]();
  }

LABEL_9:
  BOOL v11 = 0;
LABEL_66:

  return v11;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (BOOL)fetchClientState:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    long long v32 = self;
    BOOL v30 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v34 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    v33 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "opt");
    long long v31 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"client-state-name" fromXPCDictionary:v4];
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v13 = *(_OWORD *)(v12 + 16);
    long long v48 = *(_OWORD *)v12;
    long long v49 = v13;
    uint64_t v50 = *(void *)(v12 + 32);
    uint64_t v14 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v14;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService fetchClientState:]";
    si_tracing_log_span_begin();
    uint64_t v29 = v11;
    long long v16 = *(_OWORD *)(v12 + 16);
    long long v45 = *(_OWORD *)v12;
    long long v46 = v16;
    uint64_t v47 = *(void *)(v12 + 32);
    uint64_t v17 = *(void *)v12;
    uint64_t v18 = si_tracing_calc_next_spanid();
    uint64_t v19 = *(void *)(v12 + 8);
    int v20 = *(_DWORD *)(v12 + 24);
    if (v34)
    {
      id v21 = v34;
      if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionComplete"))
      {
        id v24 = "Class A index";
      }
      else
      {
        id v22 = v21;
        if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          id v24 = "Class B index";
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            id v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            id v24 = "Class C index";
          }
          else
          {
            id v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      id v24 = "Nil index";
    }
    *(void *)uint64_t v12 = v17;
    *(void *)(v12 + 8) = v18;
    *(void *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    long long v25 = *(_OWORD *)(v12 + 16);
    long long v42 = *(_OWORD *)v12;
    long long v43 = v25;
    uint64_t v44 = *(void *)(v12 + 32);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __45__MDSearchableIndexService_fetchClientState___block_invoke;
    v35[3] = &unk_2645097C8;
    long long v38 = v42;
    long long v39 = v25;
    uint64_t v40 = v44;
    id v36 = v7;
    uint64_t v41 = uint64;
    id v37 = v5;
    [(MDSearchableIndexService *)v32 fetchLastClientStateWithProtectionClass:v34 forBundleID:v33 clientStateName:v31 options:v29 completionHandler:v35];

    si_tracing_log_span_end();
    long long v26 = v46;
    *(_OWORD *)uint64_t v12 = v45;
    *(_OWORD *)(v12 + 16) = v26;
    *(void *)(v12 + 32) = v47;
    si_tracing_log_span_end();
    long long v27 = v49;
    *(_OWORD *)uint64_t v12 = v48;
    *(_OWORD *)(v12 + 16) = v27;
    *(void *)(v12 + 32) = v50;

    BOOL v9 = v30;
  }

  return v9;
}

- (void)fetchLastClientStateWithProtectionClass:(id)a3 forBundleID:(id)a4 clientStateName:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, void *))a7;
  long long v16 = (void *)MEMORY[0x223C480D0]();
  if (v13)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [(MDSearchableIndexService *)self clientBundleID];
    if (v12) {
      goto LABEL_3;
    }
  }
  id v12 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  uint64_t v17 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v20 = [(MDSearchableIndexService *)self protectionClass];
    *(_DWORD *)buf = 138413314;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v12;
    __int16 v29 = 2112;
    BOOL v30 = v20;
    __int16 v31 = 2048;
    int64_t v32 = a6;
    _os_log_debug_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_DEBUG, "(%@) fetchLastClientStateWithProtectionClass, clientStateName:%@, protectionClass:%@/%@, options:0x%lx", buf, 0x34u);
  }
  uint64_t v18 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v12 bundleID:v13];
  if (v18)
  {
    if (v15)
    {
      v15[2](v15, 0, v18);
LABEL_15:
    }
  }
  else
  {
    if ([(MDSearchableIndexService *)self _jobForIndex:a6]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __122__MDSearchableIndexService_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke;
      v21[3] = &unk_264509548;
      id v22 = v15;
      [(MDIndexer *)indexer fetchLastClientStateWithProtectionClass:v12 forBundleID:v13 clientStateName:v14 options:a6 completionHandler:v21];
      id v15 = v22;
      goto LABEL_15;
    }
    if (v15)
    {
      v15[2](v15, 0, 0);
      goto LABEL_15;
    }
  }
}

- (id)_checkItems:(id)a3 identifiers:(id)a4 protectionClass:(id)a5 bundleID:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_isInternal) {
    goto LABEL_2;
  }
  __int16 v29 = [(MDSearchableIndexService *)self clientBundleID];

  if (!v29)
  {
    id v36 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:](self, v36);
    }

    id v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
    goto LABEL_44;
  }
  BOOL v30 = [(MDSearchableIndexService *)self _checkBundleIDHelper:v13];
  if (v30)
  {
    __int16 v31 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.6();
    }

    id v32 = v30;
LABEL_43:
    id v23 = v32;

    goto LABEL_44;
  }
  uid_t v37 = geteuid();
  if (v37 != [(MDSearchableIndexService *)self clientUID])
  {
    long long v38 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.5(self);
    }

    id v32 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
    goto LABEL_43;
  }
LABEL_2:
  id v41 = v12;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (!v15) {
    goto LABEL_11;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v47;
  id v40 = v10;
  while (2)
  {
    id v18 = v13;
    id v19 = v11;
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v47 != v17) {
        objc_enumerationMutation(v14);
      }
      id v21 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      if ((objc_msgSend(v21, "_isFullyFormed", v40) & 1) == 0)
      {
        uint64_t v33 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:].cold.4();
        }

        id v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1001 userInfo:0];
        goto LABEL_31;
      }
      id v22 = [v21 bundleID];
      id v23 = [(MDSearchableIndexService *)self _checkBundleIDHelper:v22];

      if (v23)
      {
        id v34 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:]();
        }

LABEL_31:
        id v12 = v41;

        id v11 = v19;
        id v13 = v18;
        id v10 = v40;
        goto LABEL_44;
      }
    }
    uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v51 count:16];
    id v11 = v19;
    id v13 = v18;
    id v10 = v40;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_11:

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v24 = v11;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v43;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v35 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[MDSearchableIndexService _checkItems:identifiers:protectionClass:bundleID:]();
          }

          id v23 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1001 userInfo:0];

          goto LABEL_35;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

  id v23 = 0;
LABEL_35:
  id v12 = v41;
LABEL_44:

  return v23;
}

- (BOOL)_jobForIndex:(int64_t)a3
{
  return (a3 & 0x24F) == 0 || (a3 & 4) != 0;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (unsigned)clientUID
{
  return self->_clientUID;
}

- (id)_checkBundleIDHelper:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(MDSearchableIndexService *)self clientBundleID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToString:v5],
        v5,
        (v6 & 1) != 0)
    || self->_isInternal)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
  }

  return v7;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 fromClient:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = (void (**)(id, void *))a8;
  id v19 = (void *)MEMORY[0x223C480D0]();
  if (v16)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [(MDSearchableIndexService *)self clientBundleID];
    if (v15) {
      goto LABEL_3;
    }
  }
  id v15 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  int v20 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2048;
    uint64_t v39 = [v14 count];
    _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEFAULT, "(%@) deleteSearchableItemsWithDomainIdentifiers, protectionClass:%@, domainIdentifier num:%ld", buf, 0x20u);
  }

  id v21 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:]();
  }

  id v22 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:v14 protectionClass:v15 bundleID:v16];
  if (v22)
  {
    if (v18)
    {
      v18[2](v18, v22);
LABEL_20:
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance];
      id v28 = v17;
      id v23 = v19;
      v25 = int64_t v24 = a7;
      int v26 = [v25 checkBundleIdentifier:v16];

      a7 = v24;
      id v19 = v23;
      id v17 = v28;
      if (v26)
      {
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke;
        v31[3] = &unk_2645094F8;
        id v32 = v14;
        id v33 = v16;
        +[SpotlightSender dispatchWithOptions:a7 block:v31];
      }
    }
    if ([(MDSearchableIndexService *)self _jobForIndex:a7]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke_2;
      v29[3] = &unk_264507280;
      BOOL v30 = v18;
      [(MDIndexer *)indexer deleteSearchableItemsWithDomainIdentifiers:v14 protectionClass:v15 forBundleID:v16 fromClient:v17 options:a7 completionHandler:v29];
      id v18 = v30;
      goto LABEL_20;
    }
    if (v18)
    {
      v18[2](v18, 0);
      goto LABEL_20;
    }
  }
}

- (BOOL)issueCommand:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (v5)
  {
    id v21 = self;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    BOOL v8 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"request" fromXPCDictionary:v4];
    uint64_t v9 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v10 = *(_OWORD *)(v9 + 16);
    long long v47 = *(_OWORD *)v9;
    long long v48 = v10;
    uint64_t v49 = *(void *)(v9 + 32);
    uint64_t v11 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v9 = v11;
    *(void *)(v9 + 8) = spanid;
    *(void *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 24) = uint64;
    *(unsigned char *)(v9 + 28) = 102;
    *(void *)(v9 + 32) = "-[MDSearchableIndexService issueCommand:]";
    si_tracing_log_span_begin();
    long long v13 = *(_OWORD *)(v9 + 16);
    long long v44 = *(_OWORD *)v9;
    long long v45 = v13;
    uint64_t v46 = *(void *)(v9 + 32);
    BOOL v14 = v8 != 0;
    if (v8)
    {
      if (([v8 isEqualToString:@"diagnosemd"] & 1) != 0
        || [v8 isEqualToString:@"diagnosemd_q"])
      {
        uint64_t v15 = objc_msgSend(v8, "isEqualToString:", @"diagnosemd_q", v21);
        uint64_t v16 = xpc_dictionary_dup_fd(v4, "fd");
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __41__MDSearchableIndexService_issueCommand___block_invoke;
        v37[3] = &unk_2645097C8;
        long long v40 = v44;
        long long v41 = v45;
        uint64_t v42 = v46;
        id v38 = reply;
        uint64_t v43 = uint64;
        id v39 = v5;
        [v22 _issueDiagnose:v16 logQuery:v15 completionHandler:v37];
      }
      else
      {
        uint64_t v17 = xpc_dictionary_dup_fd(v4, "fd");
        uint64_t __buf = 0;
        if ((v17 & 0x80000000) != 0)
        {
          uint64_t v18 = 0;
        }
        else
        {
          arc4random_buf(&__buf, 8uLL);
          change_fdguard_np();
          uint64_t v18 = __buf;
        }
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        char v35 = 0;
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        long long v29 = v44;
        long long v30 = v45;
        v23[2] = __41__MDSearchableIndexService_issueCommand___block_invoke_2;
        v23[3] = &unk_2645097F0;
        int v33 = v17;
        uint64_t v27 = v34;
        uint64_t v28 = v18;
        uint64_t v31 = v46;
        id v24 = reply;
        uint64_t v32 = uint64;
        id v25 = v5;
        id v26 = v8;
        [(MDSearchableIndexService *)v21 _issueCommand:v26 outFileDescriptor:v17 searchContext:0 completionHandler:v23];

        _Block_object_dispose(v34, 8);
      }
    }
    si_tracing_log_span_end();
    long long v19 = v48;
    *(_OWORD *)uint64_t v9 = v47;
    *(_OWORD *)(v9 + 16) = v19;
    *(void *)(v9 + 32) = v49;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSString)clientPersonaID
{
  return self->_clientPersonaID;
}

- (BOOL)_canProcessIndexDataForBundle:(id)a3 itemsDecoder:(id)a4 deletesDecoder:(id)a5 clientState:(id)a6 clientStateName:(id)a7 outError:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14)
  {
    id v14 = [(MDSearchableIndexService *)self clientBundleID];
  }
  long long v19 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:0 bundleID:v14];
  if (v19) {
    goto LABEL_9;
  }
  if (v17 && !v18)
  {
    int v20 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _canProcessIndexDataForBundle:itemsDecoder:deletesDecoder:clientState:clientStateName:outError:]();
    }

    long long v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1002 userInfo:0];
LABEL_9:
    BOOL v21 = v19 == 0;
    goto LABEL_10;
  }
  if (v17)
  {
    long long v19 = 0;
    BOOL v21 = 1;
  }
  else
  {
    if (v15 && ([v15 obj], _MDPlistGetPlistObjectType() == 240))
    {
      [v15 obj];
      uint64_t Count = _MDPlistArrayGetCount();
    }
    else
    {
      uint64_t Count = 0;
    }
    if (v16 && ([v16 obj], _MDPlistGetPlistObjectType() == 240))
    {
      [v16 obj];
      BOOL v24 = _MDPlistArrayGetCount() != 0;
    }
    else
    {
      BOOL v24 = 0;
    }
    long long v19 = 0;
    if (Count) {
      BOOL v21 = 1;
    }
    else {
      BOOL v21 = v24;
    }
  }
LABEL_10:
  if (a8) {
    *a8 = v19;
  }

  return v21;
}

void __45__MDSearchableIndexService_fetchClientState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  uint64_t v6 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v18 = *(_OWORD *)v6;
  long long v19 = *(_OWORD *)(v6 + 16);
  uint64_t v20 = *(void *)(v6 + 32);
  uint64_t v7 = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(void *)(v6 + 32) = v7;
  uint64_t v9 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v11 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v9;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v11;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "completion handler for fetchClientState";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  if (!v5)
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = v17;
    uint64_t v14 = [v13 bytes];
    size_t v15 = [v13 length];
    if (v14) {
      id v16 = (const char *)v14;
    }
    else {
      id v16 = "";
    }
    xpc_dictionary_set_data(v12, "client-state-key", v16, v15);
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v18;
  *(_OWORD *)(v6 + 16) = v19;
  *(void *)(v6 + 32) = v20;
}

uint64_t __122__MDSearchableIndexService_fetchLastClientStateWithProtectionClass_forBundleID_clientStateName_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __42__MDSearchableIndexService_deleteDomains___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v11 = *(_OWORD *)v3;
  long long v12 = *(_OWORD *)(v3 + 16);
  uint64_t v13 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteDomains";
  si_tracing_log_span_begin();
  id v9 = self;
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "id", *(void *)(a1 + 96));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 40));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(void *)(v3 + 32) = v13;
}

uint64_t __136__MDSearchableIndexService_deleteSearchableItemsWithDomainIdentifiers_protectionClass_forBundleID_fromClient_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_issueCommand:(id)a3 outFileDescriptor:(int)a4 searchContext:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  long long v12 = (void (**)(id, void, void *))a6;
  if (![v10 hasPrefix:@"provide:"])
  {
    if (([v10 hasPrefix:@"setUISearchEnabled:"] & 1) != 0
      || self->_isInternal
      || self->_isPrivate)
    {
      goto LABEL_39;
    }
LABEL_43:
    id v25 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:]();
    }

    id v26 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
    v12[2](v12, 0, v26);

    goto LABEL_46;
  }
  if ([(MDSearchableIndexService *)self searchInternal])
  {
    int v13 = 1;
    goto LABEL_17;
  }
  if (![(MDSearchableIndexService *)self allowMail])
  {
    int v13 = 0;
    goto LABEL_17;
  }
  uint64_t v14 = [v10 componentsSeparatedByString:@":"];
  if ((unint64_t)[v14 count] < 4) {
    goto LABEL_15;
  }
  size_t v15 = [v14 objectAtIndexedSubscript:3];
  if (![v15 isEqualToString:@"com.apple.mobilemail"])
  {
    id v16 = [v14 objectAtIndexedSubscript:3];
    char v17 = [v16 isEqualToString:@"com.apple.MobileSMS"];

    if (v17) {
      goto LABEL_14;
    }
LABEL_15:
    int v13 = 0;
    goto LABEL_16;
  }

LABEL_14:
  int v13 = 1;
LABEL_16:

LABEL_17:
  if ([(MDSearchableIndexService *)self allowNotifications]) {
    goto LABEL_29;
  }
  long long v18 = [v10 componentsSeparatedByString:@":"];
  if ((unint64_t)[v18 count] <= 5)
  {
    if ((unint64_t)[v18 count] < 4)
    {
      uint64_t v20 = 0;
      goto LABEL_24;
    }
    uint64_t v19 = 3;
  }
  else
  {
    uint64_t v19 = 4;
  }
  uint64_t v20 = [v18 objectAtIndexedSubscript:v19];
LABEL_24:
  if ([v20 isEqualToString:@"com.apple.usernotificationsd"])
  {
    BOOL v21 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _issueCommand:outFileDescriptor:searchContext:completionHandler:](self);
    }

    int v13 = 0;
  }

LABEL_29:
  if (![(MDSearchableIndexService *)self allowMessagesContent])
  {
    id v22 = [v10 componentsSeparatedByString:@":"];
    if ((unint64_t)[v22 count] < 5)
    {
      id v23 = 0;
    }
    else
    {
      id v23 = [v22 objectAtIndexedSubscript:2];
    }
    if ([v23 isEqualToString:@"com.apple.metadata-importer.messages.plain-text"])
    {
      BOOL v24 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[MDSearchableIndexService _issueCommand:outFileDescriptor:searchContext:completionHandler:](self);
      }

      goto LABEL_43;
    }
  }
  if (!v13) {
    goto LABEL_43;
  }
LABEL_39:
  if (objc_opt_respondsToSelector())
  {
    [(MDIndexer *)self->_indexer _issueCommand:v10 outFileDescriptor:v8 searchContext:v11 completionHandler:v12];
LABEL_46:

    goto LABEL_47;
  }
  if (v12)
  {
    v12[2](v12, 0, 0);
    goto LABEL_46;
  }
LABEL_47:
}

- (void)_processIndexDataForBundle:(id)a3 protectionClass:(id)a4 personaID:(id)a5 options:(int64_t)a6 items:(id)a7 itemsText:(id)a8 itemsHTML:(id)a9 clientState:(id)a10 expectedClientState:(id)a11 clientStateName:(id)a12 deletes:(id)a13 completionHandler:(id)a14
{
  id v34 = a3;
  id v19 = a4;
  id v20 = a5;
  id v33 = a7;
  id v32 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = (void (**)(id, void))a14;
  if ([(MDSearchableIndexService *)self _jobForIndex:a6] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    indexer = self->_indexer;
    LOBYTE(v30) = 1;
    uint64_t v28 = v33;
    long long v29 = v32;
    [(MDIndexer *)indexer indexFromBundle:v34 protectionClass:v19 personaID:v20 options:a6 items:v33 itemsText:v32 itemsHTML:v21 clientState:v22 expectedClientState:v23 clientStateName:v24 deletes:v25 canCreateNewIndex:v30 completionHandler:v26];
  }
  else
  {
    long long v29 = v32;
    uint64_t v28 = v33;
    if (!v26) {
      goto LABEL_7;
    }
    v26[2](v26, 0);
  }

LABEL_7:
}

void __45__MDSearchableIndexService_processIndexData___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v15 = *(_OWORD *)v3;
  long long v16 = *(_OWORD *)(v3 + 16);
  uint64_t v17 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 120);
  long long v5 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for processIndexData";
  si_tracing_log_span_begin();
  id v9 = self;
  id v10 = self;
  id v11 = self;
  id v12 = self;
  id v13 = self;
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 72), "id", *(void *)(a1 + 128));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), *(xpc_object_t *)(a1 + 72));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v15;
  *(_OWORD *)(v3 + 16) = v16;
  *(void *)(v3 + 32) = v17;
}

void __43__MDSearchableIndexService_addInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for addInteraction";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (void)addInteraction:(id)a3 intentClassName:(id)a4 bundleID:(id)a5 protectionClass:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  long long v18 = (void (**)(id, void *))a8;
  id v19 = (void *)MEMORY[0x223C480D0]();
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [(MDSearchableIndexService *)self clientBundleID];
    if (v17) {
      goto LABEL_3;
    }
  }
  id v17 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v35 = v16;
    __int16 v36 = 2112;
    id v37 = v15;
    __int16 v38 = 2112;
    id v39 = v17;
    __int16 v40 = 2048;
    int64_t v41 = a7;
    _os_log_debug_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEBUG, "(%@) addInteraction:%@, protectionClass:%@, options:0x%lx", buf, 0x2Au);
  }

  id v21 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v17 bundleID:v16];
  if (v21)
  {
    if (v18) {
      v18[2](v18, v21);
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      +[CSRecieverState sharedInstance];
      uint64_t v28 = v19;
      id v22 = v15;
      v24 = int64_t v23 = a7;
      int v25 = [v24 checkBundleIdentifier:v16];

      int64_t v26 = v23;
      id v15 = v22;
      id v19 = v28;
      if (v25)
      {
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __110__MDSearchableIndexService_addInteraction_intentClassName_bundleID_protectionClass_options_completionHandler___block_invoke;
        v29[3] = &unk_264509700;
        id v30 = v14;
        id v31 = v15;
        id v32 = v16;
        id v33 = v17;
        +[SpotlightSender dispatchWithOptions:v26 block:v29];
      }
    }
    if (v14)
    {
      uint64_t v27 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:0];
      if (v27 && (objc_opt_respondsToSelector() & 1) != 0) {
        [(MDIndexer *)self->_indexer addInteraction:v27 bundleID:v16 protectionClass:v17];
      }
    }
    if (v18) {
      v18[2](v18, 0);
    }
  }
}

- (void)_dispatchToReceiversWithBundleID:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 deletes:(id)a9
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = &off_21F26A000;
  if (v19)
  {
    id v21 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (+[SpotlightSender jobForTest:a5]) {
        id v22 = @"YES";
      }
      else {
        id v22 = @"NO";
      }
      uint64_t v27 = v22;
      id v23 = v17;
      if (+[SpotlightSender jobForDuet:a5]) {
        id v24 = @"YES";
      }
      else {
        id v24 = @"NO";
      }
      *(_DWORD *)buf = 138413314;
      if (+[SpotlightSender jobForSuggestions:a5]) {
        int v25 = @"YES";
      }
      else {
        int v25 = @"NO";
      }
      id v38 = v14;
      __int16 v39 = 2048;
      int64_t v40 = a5;
      __int16 v41 = 2112;
      uint64_t v42 = v27;
      __int16 v43 = 2112;
      long long v44 = v24;
      id v17 = v23;
      id v20 = &off_21F26A000;
      __int16 v45 = 2112;
      uint64_t v46 = v25;
      _os_log_impl(&dword_21F1CE000, v21, OS_LOG_TYPE_DEFAULT, "_dispatchToReceivers, deleteSearchableItemsWithEncodedIdentifiers, bundleID:%@, options:0x%lx, test/duet/suggestions:%@/%@/%@", buf, 0x34u);
    }

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = *((void *)v20 + 465);
    v34[2] = __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke;
    void v34[3] = &unk_2645094F8;
    id v35 = v19;
    id v36 = v14;
    +[SpotlightSender dispatchWithOptions:a5 block:v34];
  }
  if (v16)
  {
    int64_t v26 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[MDSearchableIndexService _dispatchToReceiversWithBundleID:protectionClass:options:items:itemsText:itemsHTML:deletes:]();
    }

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = *((void *)v20 + 465);
    v28[2] = __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke_52;
    v28[3] = &unk_264509520;
    id v29 = v18;
    id v30 = v17;
    id v31 = v16;
    id v32 = v14;
    id v33 = v15;
    +[SpotlightSender dispatchWithOptions:a5 block:v28];
  }
}

- (NSString)processDescription
{
  v2 = [(MDSearchableIndexService *)self clientConnection];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [MEMORY[0x263F02B30] processNameForPID:xpc_connection_get_pid(v2)];
  }
  else
  {
    uint64_t v4 = &stru_26D0BD940;
  }

  return (NSString *)v4;
}

- (void)_makeActivityQueueIfNecessary
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activityQueue && ([MEMORY[0x263F02B38] disabledUserActivities] & 1) == 0)
  {
    id location = 0;
    objc_initWeak(&location, v2);
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __57__MDSearchableIndexService__makeActivityQueueIfNecessary__block_invoke;
    long long v10 = &unk_2645094D0;
    objc_copyWeak(&v11, &location);
    uint64_t v3 = (void *)[&v7 copy];
    id v4 = objc_alloc(MEMORY[0x263F02A70]);
    uint64_t v5 = objc_msgSend(v4, "initWithIdleTime:idleTimeLeeway:maximumBatchSize:mode:notifyBlock:", 1, 0, v3, 1.0, 0.25, v7, v8, v9, v10);
    activityQueue = v2->_activityQueue;
    v2->_activityQueue = (CSIndexingQueue *)v5;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

void __57__MDSearchableIndexService__makeActivityQueueIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x223C480D0]();
  uint64_t v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    uint64_t v8 = [v3 count];
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "Flushing UA queue, count:%lu", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dispatchActivities:v3];
}

- (CSIndexingQueue)activityQueue
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_activityQueue;
  objc_sync_exit(v2);

  return v3;
}

- (id)_checkNonEmptyBundle:(id)a3 protectionClass:(id)a4
{
  if (a3)
  {
    uint64_t v5 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:a4 bundleID:a3];
  }
  else
  {
    uint64_t v6 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService _checkNonEmptyBundle:protectionClass:](self);
    }

    uint64_t v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1001 userInfo:0];
  }
  return v5;
}

uint64_t __119__MDSearchableIndexService__dispatchToReceiversWithBundleID_protectionClass_options_items_itemsText_itemsHTML_deletes___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteSearchableItemsWithEncodedIdentifiers:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40) client:a2];
}

- (void)willModifySearchableItemsWithIdentifiers:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a7;
  id v16 = (void *)MEMORY[0x223C480D0]();
  if (v14)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [(MDSearchableIndexService *)self clientBundleID];
    if (v13) {
      goto LABEL_3;
    }
  }
  id v13 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v17 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v14;
    __int16 v24 = 2048;
    uint64_t v25 = [v12 count];
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2048;
    int64_t v29 = a6;
    _os_log_debug_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_DEBUG, "(%@) willModifySearchableItemsWithIdentifiers, identifiers/%ld:%@, options:0x%lx", buf, 0x2Au);
  }

  id v18 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:v12 protectionClass:v13 bundleID:v14];
  if (v18)
  {
    if (v15)
    {
      v15[2](v15, v18);
LABEL_15:
    }
  }
  else
  {
    if ([(MDSearchableIndexService *)self _jobForIndex:a6]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __123__MDSearchableIndexService_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke;
      v20[3] = &unk_264507280;
      id v21 = v15;
      [(MDIndexer *)indexer willModifySearchableItemsWithIdentifiers:v12 protectionClass:v13 forBundleID:v14 options:a6 completionHandler:v20];
      id v15 = v21;
      goto LABEL_15;
    }
    if (v15)
    {
      v15[2](v15, 0);
      goto LABEL_15;
    }
  }
}

uint64_t __123__MDSearchableIndexService_willModifySearchableItemsWithIdentifiers_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateCorrectionsWithFilePath:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x223C480D0]();
  uint64_t v9 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService updateCorrectionsWithFilePath:options:completionHandler:]();
  }

  long long v10 = +[SPCorrectionHandler sharedHandler];
  [v10 updateWithFilePath:v6];

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)fetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 userCtx:(id)a7 flags:(unsigned int)a8 qos:(unsigned int)a9 reply:(id)a10 completionHandler:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a10;
  id v22 = (void (**)(id, uint64_t))a11;
  id v23 = (void *)MEMORY[0x223C480D0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v24 = v19;
  }
  else {
    id v24 = 0;
  }
  uint64_t v25 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:v24 protectionClass:v17 bundleID:v18];
  if (v25)
  {
    __int16 v26 = (void *)v25;
    v22[2](v22, v25);
  }
  else
  {
    indexer = self->_indexer;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __123__MDSearchableIndexService_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_reply_completionHandler___block_invoke;
    v30[3] = &unk_264509570;
    id v31 = (void (**)(id, uint64_t))v21;
    id v32 = v22;
    LODWORD(v28) = a9;
    [(MDIndexer *)indexer fetchAttributes:v16 protectionClass:v17 bundleID:v18 identifiers:v19 userCtx:v20 flags:a8 qos:v28 completionHandler:v30];

    id v22 = v31;
  }
}

void __123__MDSearchableIndexService_fetchAttributes_protectionClass_bundleID_identifiers_userCtx_flags_qos_reply_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x263F02B30] dictionary:*(void *)(a1 + 32) setPlistBytes:a2 forKey:"fetch-data-key" sizeKey:"fetch-data-size"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchCacheFileDescriptorsForProtectionClass:(id)a3 bundleID:(id)a4 identifiers:(id)a5 userCtx:(id)a6 flags:(unsigned int)a7 qos:(unsigned int)a8 reply:(id)a9 completionHandler:(id)a10
{
  uint64_t v10 = *(void *)&a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  id v20 = (void (**)(id, uint64_t))a10;
  id v21 = (void *)MEMORY[0x223C480D0]();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v22 = v17;
  }
  else {
    id v22 = 0;
  }
  uint64_t v23 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:v22 protectionClass:v15 bundleID:v16];
  if (v23)
  {
    id v24 = (void *)v23;
    v20[2](v20, v23);
  }
  else
  {
    indexer = self->_indexer;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __135__MDSearchableIndexService_fetchCacheFileDescriptorsForProtectionClass_bundleID_identifiers_userCtx_flags_qos_reply_completionHandler___block_invoke;
    v27[3] = &unk_264509570;
    uint64_t v28 = (void (**)(id, uint64_t))v19;
    int64_t v29 = v20;
    [(MDIndexer *)indexer fetchCacheFileDescriptorsForProtectionClass:v15 bundleID:v16 identifiers:v17 userCtx:v18 flags:v10 qos:a8 completionHandler:v27];

    id v20 = v28;
  }
}

void __135__MDSearchableIndexService_fetchCacheFileDescriptorsForProtectionClass_bundleID_identifiers_userCtx_flags_qos_reply_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x263F02B30] dictionary:*(void *)(a1 + 32) setXPCFdArray:a2 forKey:"file-descriptors"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deleteSearchableItemsSinceDate:(id)a3 protectionClass:(id)a4 forBundleID:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a7;
  id v16 = (void *)MEMORY[0x223C480D0]();
  if (v14)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [(MDSearchableIndexService *)self clientBundleID];
    if (v13) {
      goto LABEL_3;
    }
  }
  id v13 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v17 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v12;
    __int16 v31 = 2048;
    int64_t v32 = a6;
    _os_log_debug_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_DEBUG, "(%@) deleteSearchableItemsSinceDate, startDate:%@, options:0x%lx", buf, 0x20u);
  }

  id v18 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v13 bundleID:v14];
  if (v18)
  {
    if (v15)
    {
      v15[2](v15, v18);
LABEL_18:
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      id v19 = +[CSRecieverState sharedInstance];
      int v20 = [v19 checkBundleIdentifier:v14];

      if (v20)
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke;
        v24[3] = &unk_2645094F8;
        id v25 = v12;
        id v26 = v14;
        +[SpotlightSender dispatchWithOptions:a6 block:v24];
      }
    }
    if ([(MDSearchableIndexService *)self _jobForIndex:a6]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2;
      v22[3] = &unk_264507280;
      uint64_t v23 = v15;
      [(MDIndexer *)indexer deleteSearchableItemsSinceDate:v12 protectionClass:v13 forBundleID:v14 options:a6 completionHandler:v22];
      id v15 = v23;
      goto LABEL_18;
    }
    if (v15)
    {
      v15[2](v15, 0);
      goto LABEL_18;
    }
  }
}

uint64_t __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteSearchableItemsSinceDate:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40) client:a2];
}

uint64_t __113__MDSearchableIndexService_deleteSearchableItemsSinceDate_protectionClass_forBundleID_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)provideDataForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (![(MDSearchableIndexService *)self searchInternal]
    && (![(MDSearchableIndexService *)self allowMail]
     || ([v10 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
    && (![(MDSearchableIndexService *)self allowMessagesContent]
     || ([v10 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0))
  {
    id v14 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:]();
    }

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
    v13[2](v13, 0, v15);

    goto LABEL_13;
  }
  if (objc_opt_respondsToSelector())
  {
    [(MDIndexer *)self->_indexer provideDataForBundle:v10 identifier:v11 type:v12 completionHandler:v13];
LABEL_13:

    goto LABEL_14;
  }
  if (v13)
  {
    v13[2](v13, 0, 0);
    goto LABEL_13;
  }
LABEL_14:
}

- (void)provideFileURLForBundle:(id)a3 identifier:(id)a4 type:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  if (![(MDSearchableIndexService *)self searchInternal])
  {
    id v14 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:]();
    }

    id v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
    v13[2](v13, 0, v15);

    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    [(MDIndexer *)self->_indexer provideFileURLForBundle:v10 identifier:v11 type:v12 completionHandler:v13];
LABEL_9:

    goto LABEL_10;
  }
  if (v13)
  {
    v13[2](v13, 0, 0);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_issueDiagnose:(int)a3 logQuery:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v10 = (void (**)(void))a5;
  if (self->_isInternal || self->_isPrivate)
  {
    if (objc_opt_respondsToSelector())
    {
      [(MDIndexer *)self->_indexer _issueDiagnose:v6 logQuery:v5 completionHandler:v10];
    }
    else
    {
      if (!v10) {
        return;
      }
      v10[2]();
    }
  }
  else
  {
    uint64_t v8 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:]();
    }

    uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1003 userInfo:0];
    ((void (*)(void (**)(void), void, void *))v10[2])(v10, 0, v9);
  }
}

- (void)prepareIndexingWhileLocked:(id)a3 protectionClass:(id)a4 holdAssertionFor:(double)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a6;
  if (objc_opt_respondsToSelector())
  {
    [(MDIndexer *)self->_indexer prepareIndexingWhileLocked:v13 protectionClass:v10 holdAssertionFor:v11 completionHandler:a5];
  }
  else
  {
    if (!v11) {
      goto LABEL_6;
    }
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    v11[2](v11, v12);
  }
LABEL_6:
}

- (void)finishIndexingWhileLocked:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  if (objc_opt_respondsToSelector())
  {
    [(MDIndexer *)self->_indexer finishIndexingWhileLocked:v11 protectionClass:v8 completionHandler:v9];
  }
  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    v9[2](v9, v10);
  }
LABEL_6:
}

- (void)_deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = (void (**)(id, void *))a7;
  id v15 = (void *)MEMORY[0x223C480D0]();
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [(MDSearchableIndexService *)self clientBundleID];
    if (v13) {
      goto LABEL_3;
    }
  }
  id v13 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v16 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = "NO";
    unsigned int v32 = v9;
    if (v9) {
      id v17 = "YES";
    }
    id v30 = v17;
    uint64_t v31 = qos_class_self();
    id v18 = [(MDSearchableIndexService *)self clientConnection];
    uint64_t v33 = v15;
    if (v18)
    {
      __int16 v29 = [(MDSearchableIndexService *)self clientConnection];
      name = xpc_connection_get_name(v29);
    }
    else
    {
      name = "";
    }
    uint64_t v20 = [(MDSearchableIndexService *)self clientConnection];
    id v21 = (void *)v20;
    if (v20)
    {
      id v7 = [(MDSearchableIndexService *)self clientConnection];
      LODWORD(v20) = xpc_connection_get_pid(v7);
    }
    *(_DWORD *)buf = 138413826;
    id v42 = v12;
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 2080;
    uint64_t v46 = v30;
    __int16 v47 = 2048;
    int64_t v48 = a6;
    __int16 v49 = 2048;
    uint64_t v50 = v31;
    __int16 v51 = 2080;
    uint64_t v52 = name;
    __int16 v53 = 1024;
    int v54 = v20;
    _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "(%@) deleteAllSearchableItemsWithBundleID, protectionClass:%@, shouldGC:%s, options:0x%lx, qos:0x%lx conn:%s(%d)", buf, 0x44u);
    if (v21) {

    }
    if (v18) {
    id v15 = v33;
    }
    uint64_t v9 = v32;
  }

  id v22 = [(MDSearchableIndexService *)self _checkNonEmptyBundle:v12 protectionClass:v13];
  if (v22)
  {
    if (v14)
    {
      v14[2](v14, v22);
LABEL_31:
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      uint64_t v23 = +[CSRecieverState sharedInstance];
      int v24 = [v23 checkBundleIdentifier:v12];

      if (v24)
      {
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke;
        v39[3] = &unk_264509598;
        id v40 = v12;
        +[SpotlightSender dispatchWithOptions:a6 block:v39];
      }
    }
    if ([(MDSearchableIndexService *)self _jobForIndex:a6])
    {
      char v25 = objc_opt_respondsToSelector();
      indexer = self->_indexer;
      if (v25)
      {
        id v27 = [(MDSearchableIndexService *)self clientBundleID];
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_2;
        v37[3] = &unk_264507280;
        id v38 = v14;
        [(MDIndexer *)indexer deleteAllSearchableItemsWithBundleID:v12 fromClient:v27 protectionClass:v13 shouldGC:v9 completionHandler:v37];

        id v14 = v38;
        goto LABEL_31;
      }
      if (objc_opt_respondsToSelector())
      {
        id v28 = self->_indexer;
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_3;
        v35[3] = &unk_264507280;
        id v36 = v14;
        [(MDIndexer *)v28 deleteAllSearchableItemsWithProtectionClass:v13 forBundleID:v12 options:a6 completionHandler:v35];
        id v14 = v36;
        goto LABEL_31;
      }
    }
    if (v14)
    {
      v14[2](v14, 0);
      goto LABEL_31;
    }
  }
}

uint64_t __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteAllSearchableItemsWithBundleID:*(void *)(a1 + 32) client:a2];
}

uint64_t __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __117__MDSearchableIndexService__deleteAllSearchableItemsWithBundleID_protectionClass_shouldGC_options_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteAllSearchableItemsWithBundleID:(id)a3 protectionClass:(id)a4 shouldGC:(BOOL)a5 completionHandler:(id)a6
{
}

- (void)deleteAllSearchableItemsWithProtectionClass:(id)a3 forBundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
}

- (void)changeStateOfSearchableItemsWithUIDs:(id)a3 toState:(int64_t)a4 protectionClass:(id)a5 forBundleID:(id)a6 forUTIType:(id)a7 options:(int64_t)a8
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void *)MEMORY[0x223C480D0]();
  if (v16)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [(MDSearchableIndexService *)self clientBundleID];
    if (v15) {
      goto LABEL_3;
    }
  }
  id v15 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v19 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:v14 protectionClass:v15 bundleID:v16];
  if (!v19)
  {
    __int16 v29 = v18;
    uint64_t v20 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v28 = a4;
      id v21 = @"YES";
      if (+[SpotlightSender jobForTest:a8]) {
        id v22 = @"YES";
      }
      else {
        id v22 = @"NO";
      }
      id v27 = v22;
      if (+[SpotlightSender jobForDuet:a8]) {
        uint64_t v23 = @"YES";
      }
      else {
        uint64_t v23 = @"NO";
      }
      if (!+[SpotlightSender jobForSuggestions:](SpotlightSender, "jobForSuggestions:", a8, v23)) {
        id v21 = @"NO";
      }
      *(_DWORD *)buf = 138414338;
      id v36 = v16;
      __int16 v37 = 2112;
      id v38 = v17;
      __int16 v39 = 2048;
      int64_t v40 = v28;
      __int16 v41 = 2048;
      int64_t v42 = a8;
      __int16 v43 = 2112;
      id v44 = v27;
      __int16 v45 = 2112;
      uint64_t v46 = v26;
      __int16 v47 = 2112;
      int64_t v48 = v21;
      a4 = v28;
      __int16 v49 = 2048;
      uint64_t v50 = [v14 count];
      __int16 v51 = 2112;
      id v52 = v14;
      _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_DEFAULT, "(%@) changeStateOfSearchableItemsWithUIDs (delete or purge), uti:%@, state:%ld, options:0x%lx, test/duet/suggestions/:%@/%@/%@, identifiers/%ld:%@", buf, 0x5Cu);
    }

    if (!self->_isPrivate)
    {
      int v24 = +[CSRecieverState sharedInstance];
      int v25 = [v24 checkBundleIdentifier:v16];

      if (v25)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __120__MDSearchableIndexService_changeStateOfSearchableItemsWithUIDs_toState_protectionClass_forBundleID_forUTIType_options___block_invoke;
        v30[3] = &unk_2645095C0;
        int64_t v34 = a4;
        id v31 = v14;
        id v32 = v16;
        id v33 = v17;
        +[SpotlightSender dispatchWithOptions:a8 block:v30];
      }
    }
    id v18 = v29;
    if ([(MDSearchableIndexService *)self _jobForIndex:a8]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [(MDIndexer *)self->_indexer changeStateOfSearchableItemsWithUIDs:v14 toState:a4 protectionClass:v15 forBundleID:v16 forUTIType:v17 options:a8];
    }
  }
}

void *__120__MDSearchableIndexService_changeStateOfSearchableItemsWithUIDs_toState_protectionClass_forBundleID_forUTIType_options___block_invoke(void *result, uint64_t a2)
{
  uint64_t v2 = result[7];
  if (v2 == 1) {
    return (void *)+[SpotlightSender purgeSearchableItemsWithIdentifiers:result[4] bundleID:result[5] client:a2];
  }
  if (v2 == 2) {
    return (void *)+[SpotlightSender deleteSearchableItemsWithIdentifiers:result[4] bundleID:result[5] contentType:result[6] client:a2];
  }
  return result;
}

- (void)userPerformedAction:(id)a3 withItem:(id)a4 protectionClass:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x223C480D0]();
  if (!v10)
  {
    id v10 = [(MDSearchableIndexService *)self protectionClass];
  }
  id v12 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v18 = [(MDSearchableIndexService *)self clientBundleID];
    *(_DWORD *)buf = 138413058;
    id v22 = v18;
    __int16 v23 = 2112;
    id v24 = v8;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_debug_impl(&dword_21F1CE000, v12, OS_LOG_TYPE_DEBUG, "(%@) userPerformedAction, action:%@, item:%@, protectionClass:%@", buf, 0x2Au);
  }
  if (v8 && v9)
  {
    id v20 = v9;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
    id v14 = [(MDSearchableIndexService *)self _checkItems:v13 identifiers:0 protectionClass:v10 bundleID:0];

    if (!v14)
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x263F02B18]) initWithAction:v8 item:v9];
      [v15 setProtectionClass:v10];
      [(MDSearchableIndexService *)self _makeActivityQueueIfNecessary];
      id v16 = [(MDSearchableIndexService *)self activityQueue];
      id v19 = v15;
      id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
      [v16 queueItems:v17];
    }
  }
  else
  {
    id v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[MDSearchableIndexService userPerformedAction:withItem:protectionClass:]();
    }
  }
}

- (void)_dispatchActivities:(id)a3 bundleID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [v13 protectionClass];
        id v15 = [v7 objectForKeyedSubscript:v14];
        if (!v15)
        {
          id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
        [v15 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke;
  v18[3] = &unk_264509610;
  id v19 = v6;
  id v20 = self;
  id v16 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v18];
}

void __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 count];
  id v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (v7 == 1) {
      uint64_t v9 = "y";
    }
    else {
      uint64_t v9 = "ies";
    }
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v37 = v7;
    __int16 v38 = 2080;
    __int16 v39 = v9;
    __int16 v40 = 2112;
    uint64_t v41 = v10;
    __int16 v42 = 2112;
    id v43 = v5;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_INFO, "Sending %lu activit%s to the receivers, bundleID:%@, protectionClass:%@", buf, 0x2Au);
  }

  if (!*(unsigned char *)(*(void *)(a1 + 40) + 19))
  {
    uint64_t v11 = +[CSRecieverState sharedInstance];
    int v12 = [v11 checkBundleIdentifier:*(void *)(a1 + 32)];

    if (v12)
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke_114;
      v31[3] = &unk_2645095E8;
      id v32 = v6;
      id v33 = *(id *)(a1 + 32);
      id v34 = v5;
      +[SpotlightSender dispatchWithOptions:0 block:v31];
    }
  }
  id v13 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if (v7 == 1) {
      id v14 = "y";
    }
    else {
      id v14 = "ies";
    }
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v37 = v7;
    __int16 v38 = 2080;
    __int16 v39 = v14;
    __int16 v40 = 2112;
    uint64_t v41 = v15;
    __int16 v42 = 2112;
    id v43 = v5;
    _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_INFO, "Sending %lu activit%s to the index, bundleID:%@, protectionClass:%@", buf, 0x2Au);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v28;
    *(void *)&long long v18 = 138412546;
    long long v26 = v18;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v16);
        }
        long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = objc_msgSend(v22, "action", v26, (void)v27);
        long long v24 = [v22 searchableItem];
        if ([v24 noIndex] & 1) == 0 && (objc_msgSend(v23, "eligibility"))
        {
          [*(id *)(*(void *)(a1 + 40) + 40) userPerformedAction:v23 withItem:v24 protectionClass:v5 forBundleID:*(void *)(a1 + 32) personaID:0];
        }
        else
        {
          __int16 v25 = logForCSLogCategoryDefault();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v26;
            uint64_t v37 = (uint64_t)v23;
            __int16 v38 = 2112;
            __int16 v39 = v24;
            _os_log_debug_impl(&dword_21F1CE000, v25, OS_LOG_TYPE_DEBUG, "Ignoring action:%@, item:%@", buf, 0x16u);
          }
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }
}

uint64_t __57__MDSearchableIndexService__dispatchActivities_bundleID___block_invoke_114(void *a1, uint64_t a2)
{
  return +[SpotlightSender addUserActions:a1[4] bundleID:a1[5] protectionClass:a1[6] client:a2];
}

- (void)_dispatchActivities:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MDSearchableIndexService *)self clientBundleID];
  if (self->_isInternal)
  {
    long long v28 = self;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v35;
LABEL_4:
      uint64_t v11 = 0;
      int v12 = v9;
      while (1)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = [*(id *)(*((void *)&v34 + 1) + 8 * v11) item];
        id v9 = [v13 bundleID];

        if ([v9 length])
        {
          if (![v5 isEqualToString:v9]) {
            break;
          }
        }
        ++v11;
        int v12 = v9;
        if (v8 == v11)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_16;
        }
      }

      if ([v6 count] == 1)
      {
        id v14 = v28;
        id v15 = v6;
        id v16 = v9;
        goto LABEL_17;
      }
      id v27 = v4;
      uint64_t v17 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = v6;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            long long v24 = [v23 item];
            __int16 v25 = [v24 bundleID];

            if ([v25 length])
            {
              id v9 = v25;
            }
            else
            {
              id v9 = v5;
            }
            id v26 = [v17 objectForKeyedSubscript:v9];
            if (!v26)
            {
              id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
              [v17 setObject:v26 forKeyedSubscript:v9];
            }
            [v26 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v20);
      }

      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __48__MDSearchableIndexService__dispatchActivities___block_invoke;
      v29[3] = &unk_264509638;
      void v29[4] = v28;
      [v17 enumerateKeysAndObjectsUsingBlock:v29];

      id v4 = v27;
    }
    else
    {
      id v9 = 0;
LABEL_16:

      id v14 = v28;
      id v15 = v6;
      id v16 = v5;
LABEL_17:
      [(MDSearchableIndexService *)v14 _dispatchActivities:v15 bundleID:v16];
    }
  }
  else
  {
    [(MDSearchableIndexService *)self _dispatchActivities:v4 bundleID:v5];
  }
}

uint64_t __48__MDSearchableIndexService__dispatchActivities___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dispatchActivities:a3 bundleID:a2];
}

- (void)flushUserActivities
{
  id v2 = [(MDSearchableIndexService *)self activityQueue];
  [v2 flush];
}

- (void)performIndexJob:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x223C480D0]();
  int v12 = [(MDSearchableIndexService *)self clientConnection];
  uint64_t v13 = [(MDSearchableIndexService *)self clientQueue];
  id v14 = v13;
  if (v12 && v13)
  {
    id v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "command", "perform-job");
    id v16 = objc_msgSend(v8, "xpc_dictionary");
    xpc_dictionary_set_value(v15, "j", v16);

    if (v9) {
      xpc_dictionary_set_string(v15, "pc", (const char *)[v9 UTF8String]);
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __83__MDSearchableIndexService_performIndexJob_protectionClass_acknowledgementHandler___block_invoke;
    handler[3] = &unk_264509660;
    id v18 = v10;
    xpc_connection_send_message_with_reply(v12, v15, v14, handler);

    goto LABEL_8;
  }
  if (v10)
  {
    id v15 = [MEMORY[0x263F087E8] errorWithDomain:@"CSIndexErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
LABEL_8:
  }
}

void __83__MDSearchableIndexService_performIndexJob_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (MEMORY[0x223C48A20]() == MEMORY[0x263EF8708])
  {
    id v3 = csindex_xpc_dictionary_decode_status_with_error();
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)deleteAllUserActivities:(id)a3 fromClient:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  int v12 = (void (**)(id, void *))a6;
  uint64_t v13 = (void *)MEMORY[0x223C480D0]();
  if (!v10)
  {
    id v10 = [(MDSearchableIndexService *)self clientBundleID];
  }
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService deleteAllUserActivities:fromClient:options:completionHandler:]();
  }

  id v15 = [(MDSearchableIndexService *)self _checkNonEmptyBundle:v10 protectionClass:0];
  if (v15)
  {
    if (v12)
    {
      v12[2](v12, v15);
LABEL_16:
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      id v16 = +[CSRecieverState sharedInstance];
      int v17 = [v16 checkBundleIdentifier:v10];

      if (v17)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke;
        v22[3] = &unk_264509598;
        id v23 = v10;
        +[SpotlightSender dispatchWithOptions:a5 block:v22];
      }
    }
    if ([(MDSearchableIndexService *)self _jobForIndex:a5]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      uint64_t v19 = [(MDSearchableIndexService *)self clientBundleID];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke_2;
      v20[3] = &unk_264507280;
      uint64_t v21 = v12;
      [(MDIndexer *)indexer deleteAllUserActivities:v10 fromClient:v19 completionHandler:v20];

      int v12 = v21;
      goto LABEL_16;
    }
    if (v12)
    {
      v12[2](v12, 0);
      goto LABEL_16;
    }
  }
}

uint64_t __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteAllUserActivities:*(void *)(a1 + 32) client:a2];
}

uint64_t __89__MDSearchableIndexService_deleteAllUserActivities_fromClient_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:(id)a3 bundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  int v12 = (void (**)(id, void *))a6;
  uint64_t v13 = (void *)MEMORY[0x223C480D0]();
  if (!v11)
  {
    id v11 = [(MDSearchableIndexService *)self clientBundleID];
  }
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService deleteUserActivitiesWithPersistentIdentifiers:bundleID:options:completionHandler:]();
  }

  id v15 = [(MDSearchableIndexService *)self _checkNonEmptyBundle:v11 protectionClass:0];
  if (v15)
  {
    if (v12)
    {
      v12[2](v12, v15);
LABEL_15:
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      id v16 = +[CSRecieverState sharedInstance];
      int v17 = [v16 checkBundleIdentifier:v11];

      if (v17)
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __109__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers_bundleID_options_completionHandler___block_invoke;
        v19[3] = &unk_264509688;
        id v20 = v10;
        id v21 = v11;
        long long v22 = v12;
        +[SpotlightSender dispatchWithOptions:a5 block:v19];
      }
    }
    if ([(MDSearchableIndexService *)self _jobForIndex:a5])
    {
      id v18 = [v10 data];
      [(MDSearchableIndexService *)self _processIndexDataForBundle:v11 protectionClass:0 personaID:0 options:a5 items:0 itemsText:0 itemsHTML:0 clientState:0 expectedClientState:0 clientStateName:0 deletes:v18 completionHandler:v12];

      goto LABEL_15;
    }
    if (v12)
    {
      v12[2](v12, 0);
      goto LABEL_15;
    }
  }
}

void __109__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers_bundleID_options_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v5 = (id)MEMORY[0x223C48320](a1[6]);
  +[SpotlightSender deleteUserActivitiesWithPersistentIdentifiers:v3 bundleID:v4 client:a2 retainedData:v5];
}

- (void)deleteActionsBeforeTime:(double)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x223C480D0]();
  id v10 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v16 = (unint64_t)a3;
    __int16 v17 = 2048;
    int64_t v18 = a4;
    _os_log_impl(&dword_21F1CE000, v10, OS_LOG_TYPE_INFO, "deleteActionsBeforeTime:%lu options:0x%lx", buf, 0x16u);
  }

  if (self->_isInternal)
  {
    if ([(MDSearchableIndexService *)self _jobForIndex:a4]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __78__MDSearchableIndexService_deleteActionsBeforeTime_options_completionHandler___block_invoke;
      v13[3] = &unk_264507280;
      id v14 = v8;
      [(MDIndexer *)indexer deleteActionsBeforeTime:v13 completionHandler:a3];
      id v8 = v14;
LABEL_11:

      goto LABEL_12;
    }
    if (v8)
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
      goto LABEL_11;
    }
  }
  else if (v8)
  {
    int v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1001 userInfo:0];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __78__MDSearchableIndexService_deleteActionsBeforeTime_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteActionsWithIdentifiers:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x223C480D0]();
  id v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = [v8 count];
    __int16 v18 = 2048;
    int64_t v19 = a4;
    _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_INFO, "deleteActionsWithIdentifiers:%lu options:0x%lx", buf, 0x16u);
  }

  if (self->_isInternal)
  {
    if ([(MDSearchableIndexService *)self _jobForIndex:a4]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __83__MDSearchableIndexService_deleteActionsWithIdentifiers_options_completionHandler___block_invoke;
      v14[3] = &unk_264507280;
      id v15 = v9;
      [(MDIndexer *)indexer deleteActionsWithIdentifiers:v8 completionHandler:v14];
      id v9 = v15;
LABEL_11:

      goto LABEL_12;
    }
    if (v9)
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
      goto LABEL_11;
    }
  }
  else if (v9)
  {
    uint64_t v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1001 userInfo:0];
    (*((void (**)(id, void *))v9 + 2))(v9, v13);

    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __83__MDSearchableIndexService_deleteActionsWithIdentifiers_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_forceAppWithBundleID:(id)a3 toPerformJob:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [(MDSearchableIndexService *)self clientBundleID];
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_debug_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEBUG, "(%@) _forceAppWithBundleID, bundleID:%@, job:%@", (uint8_t *)&v12, 0x20u);
  }
  id v9 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:0 bundleID:v6];
  if (!v9)
  {
    id v10 = [MEMORY[0x263F02B50] sharedManager];
    [v10 indexRequestsPerformJob:v7 forBundle:v6 completionHandler:0];
  }
}

- (void)performDataMigrationWithTimeout:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(9, 0);
  id v10 = v6;
  id v8 = v6;
  id v9 = v5;
  tracing_dispatch_async();
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x223C480D0]();
  uint64_t v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_4(a1);
  }

  uint64_t v4 = [*(id *)(a1 + 40) _checkItems:0 identifiers:0 protectionClass:0 bundleID:0];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F02B50] sharedManager];
    uint64_t v7 = [v6 allExtensionsWithBlock:&__block_literal_global_134];
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:@"com.apple.corespotlight.dataMigration.start" object:*(void *)(a1 + 40) userInfo:0];

    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v10 = (void *)[objc_alloc(MEMORY[0x263F02A68]) initWithJobType:3];
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2;
    v29[3] = &unk_2645096B0;
    id v12 = v9;
    id v30 = v12;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_141;
    v27[3] = &unk_2645063F8;
    uint64_t v13 = v11;
    long long v28 = v13;
    id v26 = (void *)v7;
    [v6 indexRequestsPerformJob:v10 extensions:v7 perExtensionCompletionHandler:v29 completionHandler:v27];
    __int16 v14 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_3();
    }

    dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    [*(id *)(*(void *)(a1 + 40) + 40) lastUpdateTime];
    double v16 = v15;
    id v17 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_2();
    }

    double v18 = v16;
    do
    {
      double v19 = v18;
      sleep(2u);
      [*(id *)(*(void *)(a1 + 40) + 40) lastUpdateTime];
      double v18 = v20;
    }
    while (v19 != v20);
    id v21 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_1(v21, v18, v16);
    }

    long long v22 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v23 = *(void *)(a1 + 40);
    long long v31 = @"bundleIDs";
    v32[0] = v12;
    long long v24 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [v22 postNotificationName:@"com.apple.corespotlight.dataMigration.finish" object:v23 userInfo:v24];

    uint64_t v25 = *(void *)(a1 + 48);
    if (v25) {
      (*(void (**)(uint64_t, void))(v25 + 16))(v25, 0);
    }
  }
}

uint64_t __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_131(uint64_t a1, void *a2)
{
  return [a2 dontRunDuringMigration] ^ 1;
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2_cold_1();
  }

  if (!v6)
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    [*(id *)(a1 + 32) addObject:v5];
    objc_sync_exit(v8);
  }
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_141(uint64_t a1)
{
}

- (void)transferDeleteJournalsForProtectionClass:(const char *)a3 toDirectory:(int)a4 withCompletionHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v9 = (void (**)(id, void *))a5;
  memset(&v23, 0, sizeof(v23));
  if (fstat(v5, &v23))
  {
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08438];
    uint64_t v12 = *__error();
    uint64_t v13 = v10;
    uint64_t v14 = v11;
LABEL_15:
    double v20 = [v13 errorWithDomain:v14 code:v12 userInfo:0];
    v9[2](v9, v20);

    goto LABEL_16;
  }
  if ((v23.st_mode & 0xF000) != 0x4000)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08438];
    uint64_t v12 = 20;
    goto LABEL_15;
  }
  double v15 = (void *)MEMORY[0x223C480D0]();
  double v16 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService transferDeleteJournalsForProtectionClass:toDirectory:withCompletionHandler:](a2);
  }

  id v17 = (void *)[[NSString alloc] initWithUTF8String:a3];
  double v18 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v17 bundleID:0];
  if (v18)
  {
    if (v9) {
      v9[2](v9, v18);
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    indexer = self->_indexer;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __103__MDSearchableIndexService_transferDeleteJournalsForProtectionClass_toDirectory_withCompletionHandler___block_invoke;
    v21[3] = &unk_264507280;
    long long v22 = v9;
    [(MDIndexer *)indexer transferDeleteJournalsForProtectionClass:v17 toDirectory:v5 completionHandler:v21];

    id v9 = 0;
  }

  if (!v18 && v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08438];
    uint64_t v12 = 45;
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __103__MDSearchableIndexService_transferDeleteJournalsForProtectionClass_toDirectory_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteInteractionsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = (void (**)(id, void *))a7;
  double v16 = (void *)MEMORY[0x223C480D0]();
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [(MDSearchableIndexService *)self clientBundleID];
    if (v14) {
      goto LABEL_3;
    }
  }
  id v14 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = [v12 count];
    _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithIdentifiers, protectionClass:%@, identifiers num:%lu", buf, 0x20u);
  }

  double v18 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:]();
  }

  double v19 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v14 bundleID:v13];
  if (v19)
  {
    if (v15) {
      v15[2](v15, v19);
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      double v20 = +[CSRecieverState sharedInstance];
      int v21 = [v20 checkBundleIdentifier:v13];

      if (v21)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __113__MDSearchableIndexService_deleteInteractionsWithIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke;
        v22[3] = &unk_2645095E8;
        id v23 = v12;
        id v24 = v13;
        id v25 = v14;
        +[SpotlightSender dispatchWithOptions:a6 block:v22];
      }
    }
    if (v15) {
      v15[2](v15, 0);
    }
  }
}

uint64_t __113__MDSearchableIndexService_deleteInteractionsWithIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  return +[SpotlightSender deleteInteractionsWithIdentifiers:a1[4] bundleID:a1[5] protectionClass:a1[6] client:a2];
}

- (void)deleteInteractionsWithGroupIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 options:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = (void (**)(id, void *))a7;
  double v16 = (void *)MEMORY[0x223C480D0]();
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v13 = [(MDSearchableIndexService *)self clientBundleID];
    if (v14) {
      goto LABEL_3;
    }
  }
  id v14 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v17 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = [v12 count];
    _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_DEFAULT, "(%@) deleteInteractionsWithGroupIdentifiers, protectionClass:%@, identifiers num:%lu", buf, 0x20u);
  }

  double v18 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:]();
  }

  double v19 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v14 bundleID:v13];
  if (v19)
  {
    if (v15) {
      v15[2](v15, v19);
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      double v20 = +[CSRecieverState sharedInstance];
      int v21 = [v20 checkBundleIdentifier:v13];

      if (v21)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __118__MDSearchableIndexService_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke;
        v22[3] = &unk_2645095E8;
        id v23 = v12;
        id v24 = v13;
        id v25 = v14;
        +[SpotlightSender dispatchWithOptions:a6 block:v22];
      }
    }
    if (v15) {
      v15[2](v15, 0);
    }
  }
}

uint64_t __118__MDSearchableIndexService_deleteInteractionsWithGroupIdentifiers_bundleID_protectionClass_options_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  return +[SpotlightSender deleteInteractionsWithGroupIdentifiers:a1[4] bundleID:a1[5] protectionClass:a1[6] client:a2];
}

- (void)deleteAllInteractionsWithBundleID:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)MEMORY[0x223C480D0]();
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v10 = [(MDSearchableIndexService *)self clientBundleID];
    if (v11) {
      goto LABEL_3;
    }
  }
  id v11 = [(MDSearchableIndexService *)self protectionClass];
LABEL_3:
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2048;
    int64_t v30 = a5;
    _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_DEFAULT, "(%@) deleteAllInteractionsWithBundleID, protectionClass:%@, options:0x%lx", buf, 0x20u);
  }

  double v15 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:v11 bundleID:v10];
  if (v15)
  {
    if (v12)
    {
      v12[2](v12, v15);
LABEL_19:
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      double v16 = +[CSRecieverState sharedInstance];
      int v17 = [v16 checkBundleIdentifier:v10];

      if (v17)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke;
        v22[3] = &unk_2645094F8;
        id v23 = v10;
        id v24 = v11;
        +[SpotlightSender dispatchWithOptions:a5 block:v22];
      }
    }
    if ([v10 length]
      && [(MDSearchableIndexService *)self _jobForIndex:a5]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      indexer = self->_indexer;
      double v19 = [(MDSearchableIndexService *)self clientBundleID];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke_2;
      v20[3] = &unk_264507280;
      int v21 = v12;
      [(MDIndexer *)indexer deleteAllInteractionsWithBundleID:v10 fromClient:v19 completionHandler:v20];

      id v12 = v21;
      goto LABEL_19;
    }
    if (v12)
    {
      v12[2](v12, 0);
      goto LABEL_19;
    }
  }
}

uint64_t __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender deleteAllInteractionsWithBundleID:*(void *)(a1 + 32) protectionClass:*(void *)(a1 + 40) client:a2];
}

uint64_t __104__MDSearchableIndexService_deleteAllInteractionsWithBundleID_protectionClass_options_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)donateRelevantActions:(id)a3 bundleID:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void *))a6;
  id v13 = (void *)MEMORY[0x223C480D0]();
  if (!v11)
  {
    id v11 = [(MDSearchableIndexService *)self clientBundleID];
  }
  id v14 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchableIndexService donateRelevantActions:bundleID:options:completionHandler:]();
  }

  double v15 = [(MDSearchableIndexService *)self _checkItems:0 identifiers:0 protectionClass:0 bundleID:v11];
  if (v15)
  {
    if (v12) {
      v12[2](v12, v15);
    }
  }
  else
  {
    if (!self->_isPrivate)
    {
      double v16 = +[CSRecieverState sharedInstance];
      int v17 = [v16 checkBundleIdentifier:v11];

      if (v17)
      {
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __85__MDSearchableIndexService_donateRelevantActions_bundleID_options_completionHandler___block_invoke;
        v18[3] = &unk_2645094F8;
        id v19 = v10;
        id v20 = v11;
        +[SpotlightSender dispatchWithOptions:a5 block:v18];
      }
    }
    if (v12) {
      v12[2](v12, 0);
    }
  }
}

uint64_t __85__MDSearchableIndexService_donateRelevantActions_bundleID_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[SpotlightSender donateRelevantActions:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40) client:a2];
}

void __36__MDSearchableIndexService_checkIn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v14 = *(_OWORD *)v6;
  long long v15 = *(_OWORD *)(v6 + 16);
  uint64_t v16 = *(void *)(v6 + 32);
  uint64_t v7 = *(void *)(a1 + 88);
  long long v8 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v6 + 16) = v8;
  *(void *)(v6 + 32) = v7;
  uint64_t v9 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v11 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v9;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v11;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "completion handler for checkIn";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 96));
  id v12 = *(void **)(a1 + 40);
  if (v12) {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), "pc", (const char *)[v12 UTF8String]);
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v14;
  *(_OWORD *)(v6 + 16) = v15;
  *(void *)(v6 + 32) = v16;
}

- (BOOL)prepareIndexingLocked:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5)
  {
    __int16 v29 = self;
    uint64_t v31 = reply;
    long long v8 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    int64_t v30 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    double v9 = xpc_dictionary_get_double(v4, "time");
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v11 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v12 = *(_OWORD *)(v11 + 16);
    long long v45 = *(_OWORD *)v11;
    long long v46 = v12;
    uint64_t v47 = *(void *)(v11 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v11 = v13;
    *(void *)(v11 + 8) = spanid;
    *(void *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = "-[MDSearchableIndexService prepareIndexingLocked:]";
    si_tracing_log_span_begin();
    long long v15 = *(_OWORD *)(v11 + 16);
    long long v42 = *(_OWORD *)v11;
    long long v43 = v15;
    uint64_t v44 = *(void *)(v11 + 32);
    uint64_t v16 = *(void *)v11;
    uint64_t v17 = si_tracing_calc_next_spanid();
    uint64_t v18 = *(void *)(v11 + 8);
    int v19 = *(_DWORD *)(v11 + 24);
    if (v8)
    {
      id v20 = v8;
      if (!strcmp((const char *)[v20 UTF8String], "NSFileProtectionComplete"))
      {
        id v23 = "Class A index";
      }
      else
      {
        id v21 = v20;
        if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          id v23 = "Class B index";
        }
        else
        {
          id v22 = v21;
          if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            id v23 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            id v23 = "Class C index";
          }
          else
          {
            id v23 = "Unknown index";
          }
        }
      }
    }
    else
    {
      id v23 = "Nil index";
    }
    *(void *)uint64_t v11 = v16;
    *(void *)(v11 + 8) = v17;
    *(void *)(v11 + 16) = v18;
    *(_DWORD *)(v11 + 24) = v19;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = v23;
    si_tracing_log_span_begin();
    long long v24 = *(_OWORD *)(v11 + 16);
    long long v39 = *(_OWORD *)v11;
    long long v40 = v24;
    uint64_t v41 = *(void *)(v11 + 32);
    uint64_t v7 = v31;
    if (v31)
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      void v32[2] = __50__MDSearchableIndexService_prepareIndexingLocked___block_invoke;
      v32[3] = &unk_264509778;
      long long v35 = v39;
      long long v36 = v40;
      uint64_t v37 = v41;
      id v33 = v31;
      uint64_t v38 = uint64;
      id v34 = v5;
      id v25 = (void *)MEMORY[0x223C48320](v32);
    }
    else
    {
      id v25 = 0;
    }
    [(MDSearchableIndexService *)v29 prepareIndexingWhileLocked:v30 protectionClass:v8 holdAssertionFor:v25 completionHandler:v9];

    si_tracing_log_span_end();
    long long v26 = v43;
    *(_OWORD *)uint64_t v11 = v42;
    *(_OWORD *)(v11 + 16) = v26;
    *(void *)(v11 + 32) = v44;
    si_tracing_log_span_end();
    long long v27 = v46;
    *(_OWORD *)uint64_t v11 = v45;
    *(_OWORD *)(v11 + 16) = v27;
    *(void *)(v11 + 32) = v47;
  }
  return v5 != 0;
}

void __50__MDSearchableIndexService_prepareIndexingLocked___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for checkIn";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)finishIndexingLocked:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5)
  {
    id v28 = self;
    int64_t v30 = reply;
    uint64_t v8 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    __int16 v29 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v10 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v11 = *(_OWORD *)(v10 + 16);
    long long v44 = *(_OWORD *)v10;
    long long v45 = v11;
    uint64_t v46 = *(void *)(v10 + 32);
    uint64_t v12 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v10 = v12;
    *(void *)(v10 + 8) = spanid;
    *(void *)(v10 + 16) = 0;
    *(_DWORD *)(v10 + 24) = uint64;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = "-[MDSearchableIndexService finishIndexingLocked:]";
    si_tracing_log_span_begin();
    long long v14 = *(_OWORD *)(v10 + 16);
    long long v41 = *(_OWORD *)v10;
    long long v42 = v14;
    uint64_t v43 = *(void *)(v10 + 32);
    uint64_t v15 = *(void *)v10;
    uint64_t v16 = si_tracing_calc_next_spanid();
    uint64_t v17 = *(void *)(v10 + 8);
    int v18 = *(_DWORD *)(v10 + 24);
    if (v8)
    {
      id v19 = v8;
      if (!strcmp((const char *)[v19 UTF8String], "NSFileProtectionComplete"))
      {
        id v22 = "Class A index";
      }
      else
      {
        id v20 = v19;
        if (!strcmp((const char *)[v20 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          id v22 = "Class B index";
        }
        else
        {
          id v21 = v20;
          if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            id v22 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            id v22 = "Class C index";
          }
          else
          {
            id v22 = "Unknown index";
          }
        }
      }
    }
    else
    {
      id v22 = "Nil index";
    }
    *(void *)uint64_t v10 = v15;
    *(void *)(v10 + 8) = v16;
    *(void *)(v10 + 16) = v17;
    *(_DWORD *)(v10 + 24) = v18;
    *(unsigned char *)(v10 + 28) = 102;
    *(void *)(v10 + 32) = v22;
    si_tracing_log_span_begin();
    long long v23 = *(_OWORD *)(v10 + 16);
    long long v38 = *(_OWORD *)v10;
    long long v39 = v23;
    uint64_t v40 = *(void *)(v10 + 32);
    uint64_t v7 = v30;
    if (v30)
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __49__MDSearchableIndexService_finishIndexingLocked___block_invoke;
      v31[3] = &unk_264509778;
      long long v34 = v38;
      long long v35 = v39;
      uint64_t v36 = v40;
      id v32 = v30;
      uint64_t v37 = uint64;
      id v33 = v5;
      long long v24 = (void *)MEMORY[0x223C48320](v31);
    }
    else
    {
      long long v24 = 0;
    }
    [(MDSearchableIndexService *)v28 finishIndexingWhileLocked:v29 protectionClass:v8 completionHandler:v24];

    si_tracing_log_span_end();
    long long v25 = v42;
    *(_OWORD *)uint64_t v10 = v41;
    *(_OWORD *)(v10 + 16) = v25;
    *(void *)(v10 + 32) = v43;
    si_tracing_log_span_end();
    long long v26 = v45;
    *(_OWORD *)uint64_t v10 = v44;
    *(_OWORD *)(v10 + 16) = v26;
    *(void *)(v10 + 32) = v46;
  }
  return v5 != 0;
}

void __49__MDSearchableIndexService_finishIndexingLocked___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for checkIn";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 protectionClass:(id)a6 forBundleID:(id)a7 options:(int64_t)a8 completionHandler:(id)a9
{
}

- (void)indexSearchableItems:(id)a3 deleteSearchableItemsWithIdentifiers:(id)a4 clientState:(id)a5 clientStateName:(id)a6 protectionClass:(id)a7 forBundleID:(id)a8 options:(int64_t)a9 completionHandler:(id)a10
{
  long long v10 = (void (**)(id, void *))a10;
  long long v11 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[MDSearchableIndexService indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:]();
  }

  if (v10)
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v10[2](v10, v12);
  }
}

- (void)indexFromBundle:(id)a3 protectionClass:(id)a4 options:(int64_t)a5 items:(id)a6 itemsText:(id)a7 itemsHTML:(id)a8 clientState:(id)a9 expectedClientState:(id)a10 clientStateName:(id)a11 deletes:(id)a12 userActivities:(BOOL)a13 completionHandler:(id)a14
{
  long long v14 = (void (**)(id, void *))a14;
  uint64_t v15 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MDSearchableIndexService indexFromBundle:protectionClass:options:items:itemsText:itemsHTML:clientState:expectedClientState:clientStateName:deletes:userActivities:completionHandler:]();
  }

  if (v14)
  {
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    v14[2](v14, v16);
  }
}

- (BOOL)willModify:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    long long v38 = self;
    BOOL v34 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v40 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    long long v39 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v36 = xpc_dictionary_get_uint64(v4, "opt");
    long long v11 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v4];
    id v12 = objc_alloc(MEMORY[0x263F02A48]);
    long long v35 = v11;
    uint64_t v13 = [v11 data];
    long long v14 = (void *)[v12 initWithData:v13];

    id v33 = v14;
    uint64_t v37 = [v14 decode];
    uint64_t v15 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v16 = *(_OWORD *)(v15 + 16);
    long long v55 = *(_OWORD *)v15;
    long long v56 = v16;
    uint64_t v57 = *(void *)(v15 + 32);
    uint64_t v17 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v15 = v17;
    *(void *)(v15 + 8) = spanid;
    *(void *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = "-[MDSearchableIndexService willModify:]";
    si_tracing_log_span_begin();
    long long v19 = *(_OWORD *)(v15 + 16);
    long long v52 = *(_OWORD *)v15;
    long long v53 = v19;
    uint64_t v54 = *(void *)(v15 + 32);
    uint64_t v20 = *(void *)v15;
    uint64_t v21 = si_tracing_calc_next_spanid();
    uint64_t v22 = *(void *)(v15 + 8);
    int v23 = *(_DWORD *)(v15 + 24);
    if (v40)
    {
      id v24 = v40;
      if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionComplete"))
      {
        long long v27 = "Class A index";
      }
      else
      {
        id v25 = v24;
        if (!strcmp((const char *)[v25 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          long long v27 = "Class B index";
        }
        else
        {
          id v26 = v25;
          if (!strcmp((const char *)[v26 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            long long v27 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v26 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            long long v27 = "Class C index";
          }
          else
          {
            long long v27 = "Unknown index";
          }
        }
      }
    }
    else
    {
      long long v27 = "Nil index";
    }
    *(void *)uint64_t v15 = v20;
    *(void *)(v15 + 8) = v21;
    *(void *)(v15 + 16) = v22;
    *(_DWORD *)(v15 + 24) = v23;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = v27;
    si_tracing_log_span_begin();
    long long v28 = *(_OWORD *)(v15 + 16);
    long long v49 = *(_OWORD *)v15;
    long long v50 = v28;
    uint64_t v51 = *(void *)(v15 + 32);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __39__MDSearchableIndexService_willModify___block_invoke;
    v41[3] = &unk_2645097A0;
    long long v45 = v49;
    long long v46 = v28;
    uint64_t v47 = v51;
    id v29 = v35;
    id v42 = v29;
    id v43 = v7;
    uint64_t v48 = uint64;
    id v44 = v5;
    [(MDSearchableIndexService *)v38 willModifySearchableItemsWithIdentifiers:v37 protectionClass:v40 forBundleID:v39 options:v36 completionHandler:v41];

    si_tracing_log_span_end();
    long long v30 = v53;
    *(_OWORD *)uint64_t v15 = v52;
    *(_OWORD *)(v15 + 16) = v30;
    *(void *)(v15 + 32) = v54;
    si_tracing_log_span_end();
    long long v31 = v56;
    *(_OWORD *)uint64_t v15 = v55;
    *(_OWORD *)(v15 + 16) = v31;
    *(void *)(v15 + 32) = v57;

    BOOL v9 = v34;
  }

  return v9;
}

void __39__MDSearchableIndexService_willModify___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v11 = *(_OWORD *)v3;
  long long v12 = *(_OWORD *)(v3 + 16);
  uint64_t v13 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for willModify";
  si_tracing_log_span_begin();
  id v9 = self;
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "id", *(void *)(a1 + 96));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 40));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(void *)(v3 + 32) = v13;
}

- (BOOL)deleteBundle:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    long long v31 = self;
    BOOL v30 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v33 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    id v32 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "opt");
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v13 = *(_OWORD *)(v12 + 16);
    long long v47 = *(_OWORD *)v12;
    long long v48 = v13;
    uint64_t v49 = *(void *)(v12 + 32);
    uint64_t v14 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v14;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService deleteBundle:]";
    si_tracing_log_span_begin();
    uint64_t v29 = v11;
    long long v16 = *(_OWORD *)(v12 + 16);
    long long v44 = *(_OWORD *)v12;
    long long v45 = v16;
    uint64_t v46 = *(void *)(v12 + 32);
    uint64_t v17 = *(void *)v12;
    uint64_t v18 = si_tracing_calc_next_spanid();
    uint64_t v19 = *(void *)(v12 + 8);
    int v20 = *(_DWORD *)(v12 + 24);
    if (v33)
    {
      id v21 = v33;
      if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionComplete"))
      {
        id v24 = "Class A index";
      }
      else
      {
        id v22 = v21;
        if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          id v24 = "Class B index";
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            id v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            id v24 = "Class C index";
          }
          else
          {
            id v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      id v24 = "Nil index";
    }
    *(void *)uint64_t v12 = v17;
    *(void *)(v12 + 8) = v18;
    *(void *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    long long v25 = *(_OWORD *)(v12 + 16);
    long long v41 = *(_OWORD *)v12;
    long long v42 = v25;
    uint64_t v43 = *(void *)(v12 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __41__MDSearchableIndexService_deleteBundle___block_invoke;
    void v34[3] = &unk_264509778;
    long long v37 = v41;
    long long v38 = v25;
    uint64_t v39 = v43;
    id v35 = v7;
    uint64_t v40 = uint64;
    id v36 = v5;
    [(MDSearchableIndexService *)v31 _deleteAllSearchableItemsWithBundleID:v32 protectionClass:v33 shouldGC:1 options:v29 completionHandler:v34];

    si_tracing_log_span_end();
    long long v26 = v45;
    *(_OWORD *)uint64_t v12 = v44;
    *(_OWORD *)(v12 + 16) = v26;
    *(void *)(v12 + 32) = v46;
    si_tracing_log_span_end();
    long long v27 = v48;
    *(_OWORD *)uint64_t v12 = v47;
    *(_OWORD *)(v12 + 16) = v27;
    *(void *)(v12 + 32) = v49;

    BOOL v9 = v30;
  }

  return v9;
}

void __41__MDSearchableIndexService_deleteBundle___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteBundle";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)deleteSinceDate:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    id v32 = self;
    BOOL v30 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v34 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    id v33 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v31 = xpc_dictionary_get_uint64(v4, "opt");
    double v11 = xpc_dictionary_get_double(v4, "time");
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v13 = *(_OWORD *)(v12 + 16);
    long long v48 = *(_OWORD *)v12;
    long long v49 = v13;
    uint64_t v50 = *(void *)(v12 + 32);
    uint64_t v14 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v14;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService deleteSinceDate:]";
    si_tracing_log_span_begin();
    long long v16 = *(_OWORD *)(v12 + 16);
    long long v45 = *(_OWORD *)v12;
    long long v46 = v16;
    uint64_t v47 = *(void *)(v12 + 32);
    uint64_t v17 = *(void *)v12;
    uint64_t v18 = si_tracing_calc_next_spanid();
    uint64_t v19 = *(void *)(v12 + 8);
    int v20 = *(_DWORD *)(v12 + 24);
    if (v34)
    {
      id v21 = v34;
      if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionComplete"))
      {
        id v24 = "Class A index";
      }
      else
      {
        id v22 = v21;
        if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          id v24 = "Class B index";
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            id v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            id v24 = "Class C index";
          }
          else
          {
            id v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      id v24 = "Nil index";
    }
    *(void *)uint64_t v12 = v17;
    *(void *)(v12 + 8) = v18;
    *(void *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    long long v25 = *(_OWORD *)(v12 + 16);
    long long v42 = *(_OWORD *)v12;
    long long v43 = v25;
    uint64_t v44 = *(void *)(v12 + 32);
    long long v26 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v11];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __44__MDSearchableIndexService_deleteSinceDate___block_invoke;
    v35[3] = &unk_264509778;
    long long v38 = v42;
    long long v39 = v43;
    uint64_t v40 = v44;
    id v36 = v7;
    uint64_t v41 = uint64;
    id v37 = v5;
    [(MDSearchableIndexService *)v32 deleteSearchableItemsSinceDate:v26 protectionClass:v34 forBundleID:v33 options:v31 completionHandler:v35];

    si_tracing_log_span_end();
    long long v27 = v46;
    *(_OWORD *)uint64_t v12 = v45;
    *(_OWORD *)(v12 + 16) = v27;
    *(void *)(v12 + 32) = v47;
    si_tracing_log_span_end();
    long long v28 = v49;
    *(_OWORD *)uint64_t v12 = v48;
    *(_OWORD *)(v12 + 16) = v28;
    *(void *)(v12 + 32) = v50;

    BOOL v9 = v30;
  }

  return v9;
}

void __44__MDSearchableIndexService_deleteSinceDate___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteSinceDate";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (void)_runLibraryDeletedCommand:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F08D68];
  id v4 = a3;
  id v7 = (id)[[v3 alloc] initWithMachServiceName:@"com.apple.photos.service" options:0];
  long long v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D0D9748];
  [v7 setRemoteObjectInterface:v5];

  [v7 resume];
  uint64_t v6 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_203];
  [v6 photoLibraryDeletedAtURL:v4 reply:&__block_literal_global_206];
}

void __54__MDSearchableIndexService__runLibraryDeletedCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_INFO, "Photoslibrary delete connection error:%@", (uint8_t *)&v4, 0xCu);
  }
}

void __54__MDSearchableIndexService__runLibraryDeletedCommand___block_invoke_204(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = logForCSLogCategoryIndex();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v2;
      id v5 = "Photoslibrary delete service error:%@";
      uint64_t v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "Photoslibrary delete";
    uint64_t v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

- (BOOL)photosLibraryDeleted:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint32_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    long long v11 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"path" fromXPCDictionary:v4];
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v17 = *(_OWORD *)v12;
    long long v18 = *(_OWORD *)(v12 + 16);
    uint64_t v19 = *(void *)(v12 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v13;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService photosLibraryDeleted:]";
    si_tracing_log_span_begin();
    if ([(MDSearchableIndexService *)self searchInternal]
      && [(MDSearchableIndexService *)self allowPhotosLibraryDeletion])
    {
      uint64_t v15 = [NSURL fileURLWithPath:v11 isDirectory:1];
      [(MDSearchableIndexService *)self _runLibraryDeletedCommand:v15];
    }
    csindex_xpc_dictionary_encode_status_with_error();
    xpc_dictionary_set_uint64(v7, "id", uint64);
    xpc_connection_send_message(v5, v7);
    si_tracing_log_span_end();
    *(_OWORD *)uint64_t v12 = v17;
    *(_OWORD *)(v12 + 16) = v18;
    *(void *)(v12 + 32) = v19;
  }
  return v9;
}

- (BOOL)openJournalFile:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint32_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    if ([(MDSearchableIndexService *)self allowOpenJournalFile])
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
      uint64_t v10 = [MEMORY[0x263F02B30] copyNSStringForKey:"journal-name" fromXPCDictionary:v4];
      long long v11 = v10;
      if (v10 && [v10 length])
      {
        long long v11 = v11;
        int v12 = open((const char *)[v11 UTF8String], 0);
        if (v12 < 0)
        {
          uint64_t v15 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[MDSearchableIndexService openJournalFile:]((uint64_t)v11, v15);
          }
        }
        else
        {
          int v13 = v12;
          xpc_dictionary_set_fd(v7, "journal-fd", v12);
          close(v13);
        }
        xpc_dictionary_set_uint64(v7, "id", uint64);
        xpc_connection_send_message(v5, v7);
        BOOL v8 = 1;
        goto LABEL_11;
      }
    }
    else
    {
      long long v11 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v16 = 0;
        _os_log_impl(&dword_21F1CE000, v11, OS_LOG_TYPE_DEFAULT, "*warn* Connection not entitled to open journal file", v16, 2u);
      }
    }
    BOOL v8 = 0;
LABEL_11:
  }
  return v8;
}

void __41__MDSearchableIndexService_issueCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v15 = *(_OWORD *)v6;
  long long v16 = *(_OWORD *)(v6 + 16);
  uint64_t v17 = *(void *)(v6 + 32);
  uint64_t v7 = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(void *)(v6 + 32) = v7;
  uint64_t v9 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v11 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v9;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v11;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "completion handler for issueDiagnose";
  si_tracing_log_span_begin();
  if (*(void *)(a1 + 32))
  {
    csindex_xpc_dictionary_encode_status_with_error();
    if (v14)
    {
      int v12 = *(void **)(a1 + 32);
      id v13 = v14;
      xpc_dictionary_set_data(v12, "data", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v15;
  *(_OWORD *)(v6 + 16) = v16;
  *(void *)(v6 + 32) = v17;
}

- (BOOL)fetchAttributes:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    uint64_t v9 = (void *)MEMORY[0x263F02B30];
    uint64_t v10 = xpc_dictionary_get_value(v4, "identifiers");
    uint64_t v11 = [v9 copyNSStringArrayFromXPCArray:v10];

    if (v11)
    {
      long long v46 = self;
      id v12 = 0;
    }
    else
    {
      uint64_t v29 = [MEMORY[0x263F02B30] dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:v4];
      id v12 = v29;
      if (!v29) {
        goto LABEL_17;
      }
      if (!self->_isInternal)
      {
        id v32 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[MDSearchableIndexService provideDataForBundle:identifier:type:completionHandler:]();
        }
        uint64_t v31 = 0;
        BOOL v8 = 0;
        goto LABEL_29;
      }
      uint64_t v30 = [v29 data];
      if (!v30)
      {
LABEL_17:
        uint64_t v31 = 0;
        BOOL v8 = 0;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v11 = v30;
      long long v46 = self;
    }
    uint64_t v44 = (void *)v11;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v47 = [MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    long long v43 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    id v14 = (void *)MEMORY[0x263F02B30];
    long long v15 = xpc_dictionary_get_value(v4, "fa");
    uint64_t v45 = [v14 copyNSStringArrayFromXPCArray:v15];

    BOOL v42 = xpc_dictionary_get_BOOL(v4, "fpa");
    int int64 = xpc_dictionary_get_int64(v4, "qos");
    uint64_t v16 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v17 = *(_OWORD *)(v16 + 16);
    long long v62 = *(_OWORD *)v16;
    long long v63 = v17;
    uint64_t v64 = *(void *)(v16 + 32);
    uint64_t v18 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v16 = v18;
    *(void *)(v16 + 8) = spanid;
    *(void *)(v16 + 16) = 0;
    *(_DWORD *)(v16 + 24) = uint64;
    *(unsigned char *)(v16 + 28) = 102;
    *(void *)(v16 + 32) = "-[MDSearchableIndexService fetchAttributes:]";
    si_tracing_log_span_begin();
    uint64_t v40 = uint64;
    long long v20 = *(_OWORD *)(v16 + 16);
    long long v59 = *(_OWORD *)v16;
    long long v60 = v20;
    uint64_t v61 = *(void *)(v16 + 32);
    uint64_t v21 = *(void *)v16;
    uint64_t v22 = si_tracing_calc_next_spanid();
    uint64_t v23 = *(void *)(v16 + 8);
    int v24 = *(_DWORD *)(v16 + 24);
    if (v47)
    {
      long long v25 = v47;
      if (!strcmp((const char *)[v25 UTF8String], "NSFileProtectionComplete"))
      {
        long long v28 = "Class A index";
      }
      else
      {
        long long v26 = v25;
        if (!strcmp((const char *)[v26 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          long long v28 = "Class B index";
        }
        else
        {
          long long v27 = v26;
          if (!strcmp((const char *)[v27 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            long long v28 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v27 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            long long v28 = "Class C index";
          }
          else
          {
            long long v28 = "Unknown index";
          }
        }
      }
    }
    else
    {
      long long v28 = "Nil index";
    }
    *(void *)uint64_t v16 = v21;
    *(void *)(v16 + 8) = v22;
    *(void *)(v16 + 16) = v23;
    *(_DWORD *)(v16 + 24) = v24;
    *(unsigned char *)(v16 + 28) = 102;
    *(void *)(v16 + 32) = v28;
    si_tracing_log_span_begin();
    long long v33 = *(_OWORD *)(v16 + 16);
    long long v56 = *(_OWORD *)v16;
    long long v57 = v33;
    uint64_t v58 = *(void *)(v16 + 32);
    if (v46->_entitledAttributes)
    {
      id v34 = (void *)v45;
      id v35 = (void *)SIUserCtxCreateWithLanguages();
      if (v35) {
        SIUserCtxSetEntitlements();
      }
    }
    else
    {
      id v35 = 0;
      id v34 = (void *)v45;
    }
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    long long v52 = v56;
    long long v53 = v57;
    v48[2] = __44__MDSearchableIndexService_fetchAttributes___block_invoke;
    v48[3] = &unk_2645097A0;
    uint64_t v54 = v58;
    id v49 = v7;
    uint64_t v55 = v40;
    id v50 = v5;
    id v12 = v12;
    id v51 = v12;
    LODWORD(v39) = int64;
    id v32 = v47;
    uint64_t v31 = v44;
    [(MDSearchableIndexService *)v46 fetchAttributes:v34 protectionClass:v47 bundleID:v43 identifiers:v44 userCtx:v35 flags:v42 qos:v39 reply:v49 completionHandler:v48];

    si_tracing_log_span_end();
    long long v36 = v60;
    *(_OWORD *)uint64_t v16 = v59;
    *(_OWORD *)(v16 + 16) = v36;
    *(void *)(v16 + 32) = v61;
    si_tracing_log_span_end();
    long long v37 = v63;
    *(_OWORD *)uint64_t v16 = v62;
    *(_OWORD *)(v16 + 16) = v37;
    *(void *)(v16 + 32) = v64;

    BOOL v8 = 1;
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:

  return v8;
}

void __44__MDSearchableIndexService_fetchAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v11 = *(_OWORD *)v3;
  long long v12 = *(_OWORD *)(v3 + 16);
  uint64_t v13 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for fetchAttributes";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 96));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  id v9 = self;
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(void *)(v3 + 32) = v13;
}

- (BOOL)fetchCacheFileDescriptors:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    id v9 = (void *)MEMORY[0x263F02B30];
    id v10 = xpc_dictionary_get_value(v4, "identifiers");
    long long v11 = (void *)[v9 copyNSStringArrayFromXPCArray:v10];

    BOOL v8 = v11 != 0;
    if (v11)
    {
      id v34 = v11;
      id v35 = self;
      uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
      id v36 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
      long long v33 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
      int64_t int64 = xpc_dictionary_get_int64(v4, "qos");
      uint64_t v13 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
      long long v14 = *(_OWORD *)(v13 + 16);
      long long v50 = *(_OWORD *)v13;
      long long v51 = v14;
      uint64_t v52 = *(void *)(v13 + 32);
      uint64_t v15 = si_tracing_calc_traceid();
      uint64_t spanid = si_tracing_calc_next_spanid();
      *(void *)uint64_t v13 = v15;
      *(void *)(v13 + 8) = spanid;
      *(void *)(v13 + 16) = 0;
      *(_DWORD *)(v13 + 24) = uint64;
      *(unsigned char *)(v13 + 28) = 102;
      *(void *)(v13 + 32) = "-[MDSearchableIndexService fetchCacheFileDescriptors:]";
      si_tracing_log_span_begin();
      uint64_t v31 = uint64;
      long long v17 = *(_OWORD *)(v13 + 16);
      long long v47 = *(_OWORD *)v13;
      long long v48 = v17;
      uint64_t v49 = *(void *)(v13 + 32);
      uint64_t v18 = *(void *)v13;
      uint64_t v19 = si_tracing_calc_next_spanid();
      uint64_t v20 = *(void *)(v13 + 8);
      int v21 = *(_DWORD *)(v13 + 24);
      if (v36)
      {
        id v22 = v36;
        if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionComplete"))
        {
          long long v25 = "Class A index";
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
          {
            long long v25 = "Class B index";
          }
          else
          {
            id v24 = v23;
            if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
            {
              long long v25 = "Class Cx index";
            }
            else if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
            {
              long long v25 = "Class C index";
            }
            else
            {
              long long v25 = "Unknown index";
            }
          }
        }
      }
      else
      {
        long long v25 = "Nil index";
      }
      *(void *)uint64_t v13 = v18;
      *(void *)(v13 + 8) = v19;
      *(void *)(v13 + 16) = v20;
      *(_DWORD *)(v13 + 24) = v21;
      *(unsigned char *)(v13 + 28) = 102;
      *(void *)(v13 + 32) = v25;
      si_tracing_log_span_begin();
      long long v26 = *(_OWORD *)(v13 + 16);
      long long v44 = *(_OWORD *)v13;
      long long v45 = v26;
      uint64_t v46 = *(void *)(v13 + 32);
      if (v35->_entitledAttributes)
      {
        long long v27 = (void *)SIUserCtxCreateWithLanguages();
        if (v27) {
          SIUserCtxSetEntitlements();
        }
      }
      else
      {
        long long v27 = 0;
      }
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __54__MDSearchableIndexService_fetchCacheFileDescriptors___block_invoke;
      v37[3] = &unk_264509778;
      long long v40 = v44;
      long long v41 = v45;
      uint64_t v42 = v46;
      id v38 = v7;
      uint64_t v43 = v31;
      id v39 = v5;
      long long v11 = v34;
      [(MDSearchableIndexService *)v35 fetchCacheFileDescriptorsForProtectionClass:v36 bundleID:v33 identifiers:v34 userCtx:v27 flags:0 qos:int64 reply:v38 completionHandler:v37];

      si_tracing_log_span_end();
      long long v28 = v48;
      *(_OWORD *)uint64_t v13 = v47;
      *(_OWORD *)(v13 + 16) = v28;
      *(void *)(v13 + 32) = v49;
      si_tracing_log_span_end();
      long long v29 = v51;
      *(_OWORD *)uint64_t v13 = v50;
      *(_OWORD *)(v13 + 16) = v29;
      *(void *)(v13 + 32) = v52;
    }
  }

  return v8;
}

void __54__MDSearchableIndexService_fetchCacheFileDescriptors___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for fetchCacheFileDescriptors";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)changeState:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  long long v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    id v32 = self;
    BOOL v29 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v36 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    id v35 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v31 = xpc_dictionary_get_uint64(v4, "opt");
    long long v11 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v4];
    id v12 = objc_alloc(MEMORY[0x263F02A48]);
    long long v28 = v11;
    uint64_t v13 = [v11 data];
    long long v14 = (void *)[v12 initWithData:v13];

    long long v27 = v14;
    id v34 = [v14 decode];
    uint64_t v30 = xpc_dictionary_get_uint64(v4, "modify-state");
    long long v33 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"ct" fromXPCDictionary:v4];
    uint64_t v15 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v40 = *(_OWORD *)v15;
    long long v41 = *(_OWORD *)(v15 + 16);
    uint64_t v42 = *(void *)(v15 + 32);
    uint64_t v16 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v15 = v16;
    *(void *)(v15 + 8) = spanid;
    *(void *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = "-[MDSearchableIndexService changeState:]";
    si_tracing_log_span_begin();
    long long v37 = *(_OWORD *)v15;
    long long v38 = *(_OWORD *)(v15 + 16);
    uint64_t v39 = *(void *)(v15 + 32);
    uint64_t v18 = *(void *)v15;
    uint64_t v19 = si_tracing_calc_next_spanid();
    uint64_t v20 = *(void *)(v15 + 8);
    int v21 = *(_DWORD *)(v15 + 24);
    if (v36)
    {
      id v22 = v36;
      if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionComplete"))
      {
        long long v25 = "Class A index";
      }
      else
      {
        id v23 = v22;
        if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          long long v25 = "Class B index";
        }
        else
        {
          id v24 = v23;
          if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            long long v25 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            long long v25 = "Class C index";
          }
          else
          {
            long long v25 = "Unknown index";
          }
        }
      }
    }
    else
    {
      long long v25 = "Nil index";
    }
    *(void *)uint64_t v15 = v18;
    *(void *)(v15 + 8) = v19;
    *(void *)(v15 + 16) = v20;
    *(_DWORD *)(v15 + 24) = v21;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = v25;
    si_tracing_log_span_begin();
    [(MDSearchableIndexService *)v32 changeStateOfSearchableItemsWithUIDs:v34 toState:v30 protectionClass:v36 forBundleID:v35 forUTIType:v33 options:v31];
    csindex_xpc_dictionary_encode_status_with_error();
    xpc_dictionary_set_uint64(v7, "id", uint64);
    xpc_connection_send_message(v5, v7);
    si_tracing_log_span_end();
    *(_OWORD *)uint64_t v15 = v37;
    *(_OWORD *)(v15 + 16) = v38;
    *(void *)(v15 + 32) = v39;
    si_tracing_log_span_end();
    *(_OWORD *)uint64_t v15 = v40;
    *(_OWORD *)(v15 + 16) = v41;
    *(void *)(v15 + 32) = v42;

    BOOL v9 = v29;
  }

  return v9;
}

- (BOOL)dataMigration:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    long long v11 = objc_msgSend(NSNumber, "numberWithDouble:", xpc_dictionary_get_double(v4, "timeout"));
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v13 = *(_OWORD *)(v12 + 16);
    long long v29 = *(_OWORD *)v12;
    long long v30 = v13;
    uint64_t v31 = *(void *)(v12 + 32);
    uint64_t v14 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v14;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService dataMigration:]";
    si_tracing_log_span_begin();
    long long v16 = *(_OWORD *)(v12 + 16);
    long long v26 = *(_OWORD *)v12;
    long long v27 = v16;
    uint64_t v28 = *(void *)(v12 + 32);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __42__MDSearchableIndexService_dataMigration___block_invoke;
    v19[3] = &unk_264509778;
    long long v22 = v26;
    long long v23 = v16;
    uint64_t v24 = v28;
    id v20 = v7;
    uint64_t v25 = uint64;
    id v21 = v5;
    [(MDSearchableIndexService *)self performDataMigrationWithTimeout:v11 completionHandler:v19];

    si_tracing_log_span_end();
    long long v17 = v30;
    *(_OWORD *)uint64_t v12 = v29;
    *(_OWORD *)(v12 + 16) = v17;
    *(void *)(v12 + 32) = v31;
  }
  return v9;
}

void __42__MDSearchableIndexService_dataMigration___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for dataMigration";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)transferDeleteJournals:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    int v37 = 0;
    int v37 = xpc_dictionary_dup_fd(v4, "fd");
    int v9 = *((_DWORD *)v35 + 6);
    BOOL v8 = v9 > 0;
    if (v9 >= 1)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
      string = xpc_dictionary_get_string(v4, "pc");
      uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
      long long v13 = *(_OWORD *)(v12 + 16);
      long long v31 = *(_OWORD *)v12;
      long long v32 = v13;
      uint64_t v33 = *(void *)(v12 + 32);
      uint64_t v14 = si_tracing_calc_traceid();
      uint64_t spanid = si_tracing_calc_next_spanid();
      *(void *)uint64_t v12 = v14;
      *(void *)(v12 + 8) = spanid;
      *(void *)(v12 + 16) = 0;
      *(_DWORD *)(v12 + 24) = uint64;
      *(unsigned char *)(v12 + 28) = 102;
      *(void *)(v12 + 32) = "-[MDSearchableIndexService transferDeleteJournals:]";
      si_tracing_log_span_begin();
      long long v16 = *(_OWORD *)(v12 + 16);
      long long v28 = *(_OWORD *)v12;
      long long v29 = v16;
      uint64_t v30 = *(void *)(v12 + 32);
      uint64_t v17 = *((unsigned int *)v35 + 6);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __51__MDSearchableIndexService_transferDeleteJournals___block_invoke;
      v20[3] = &unk_264509818;
      uint64_t v26 = v30;
      long long v24 = v28;
      long long v25 = v16;
      id v21 = v7;
      uint64_t v27 = uint64;
      id v22 = v5;
      long long v23 = &v34;
      [(MDSearchableIndexService *)self transferDeleteJournalsForProtectionClass:string toDirectory:v17 withCompletionHandler:v20];

      si_tracing_log_span_end();
      long long v18 = v32;
      *(_OWORD *)uint64_t v12 = v31;
      *(_OWORD *)(v12 + 16) = v18;
      *(void *)(v12 + 32) = v33;
    }
    _Block_object_dispose(&v34, 8);
  }

  return v8;
}

void __51__MDSearchableIndexService_transferDeleteJournals___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for transferDeleteJournals";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 96));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  close(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)deleteAllUserActivities:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "opt");
    uint64_t v12 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v13 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v14 = *(_OWORD *)(v13 + 16);
    long long v31 = *(_OWORD *)v13;
    long long v32 = v14;
    uint64_t v33 = *(void *)(v13 + 32);
    uint64_t v15 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v13 = v15;
    *(void *)(v13 + 8) = spanid;
    *(void *)(v13 + 16) = 0;
    *(_DWORD *)(v13 + 24) = uint64;
    *(unsigned char *)(v13 + 28) = 102;
    *(void *)(v13 + 32) = "-[MDSearchableIndexService deleteAllUserActivities:]";
    si_tracing_log_span_begin();
    long long v17 = *(_OWORD *)(v13 + 16);
    long long v28 = *(_OWORD *)v13;
    long long v29 = v17;
    uint64_t v30 = *(void *)(v13 + 32);
    long long v18 = [(MDSearchableIndexService *)self clientBundleID];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __52__MDSearchableIndexService_deleteAllUserActivities___block_invoke;
    v21[3] = &unk_264509778;
    long long v24 = v28;
    long long v25 = v29;
    uint64_t v26 = v30;
    id v22 = v7;
    uint64_t v27 = uint64;
    id v23 = v5;
    [(MDSearchableIndexService *)self deleteAllUserActivities:v12 fromClient:v18 options:v11 completionHandler:v21];

    si_tracing_log_span_end();
    long long v19 = v32;
    *(_OWORD *)uint64_t v13 = v31;
    *(_OWORD *)(v13 + 16) = v19;
    *(void *)(v13 + 32) = v33;
  }
  return v9;
}

void __52__MDSearchableIndexService_deleteAllUserActivities___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteAllUserActivities";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)deleteUserActivitiesWithPersistentIdentifiers:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    id v22 = self;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v10 = xpc_dictionary_get_uint64(v4, "opt");
    id v23 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v11 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v12 = *(_OWORD *)(v11 + 16);
    long long v35 = *(_OWORD *)v11;
    long long v36 = v12;
    uint64_t v37 = *(void *)(v11 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v11 = v13;
    *(void *)(v11 + 8) = spanid;
    *(void *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = "-[MDSearchableIndexService deleteUserActivitiesWithPersistentIdentifiers:]";
    si_tracing_log_span_begin();
    long long v15 = *(_OWORD *)(v11 + 16);
    long long v32 = *(_OWORD *)v11;
    long long v33 = v15;
    uint64_t v34 = *(void *)(v11 + 32);
    long long v16 = [MEMORY[0x263F02B30] dataWrapperForKey:"ids" sizeKey:"ids-size" fromXPCDictionary:v4];
    BOOL v8 = v16 != 0;
    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x263F02A48]);
      long long v18 = [v16 data];
      long long v19 = (void *)[v17 initWithData:v18];

      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      long long v28 = v32;
      long long v29 = v33;
      v24[2] = __74__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers___block_invoke;
      v24[3] = &unk_2645097A0;
      uint64_t v30 = v34;
      id v25 = v16;
      id v26 = v7;
      uint64_t v31 = uint64;
      id v27 = v5;
      [(MDSearchableIndexService *)v22 deleteUserActivitiesWithPersistentIdentifiers:v19 bundleID:v23 options:v10 completionHandler:v24];
    }
    si_tracing_log_span_end();
    long long v20 = v36;
    *(_OWORD *)uint64_t v11 = v35;
    *(_OWORD *)(v11 + 16) = v20;
    *(void *)(v11 + 32) = v37;
  }
  return v8;
}

void __74__MDSearchableIndexService_deleteUserActivitiesWithPersistentIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v11 = *(_OWORD *)v3;
  long long v12 = *(_OWORD *)(v3 + 16);
  uint64_t v13 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteUserActivitiesWithPersistentIdentifiers";
  si_tracing_log_span_begin();
  id v9 = self;
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "id", *(void *)(a1 + 96));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 40));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(void *)(v3 + 32) = v13;
}

- (BOOL)deleteActionsBeforeTime:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "opt");
    double v12 = xpc_dictionary_get_double(v4, "time");
    uint64_t v13 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v14 = *(_OWORD *)(v13 + 16);
    long long v30 = *(_OWORD *)v13;
    long long v31 = v14;
    uint64_t v32 = *(void *)(v13 + 32);
    uint64_t v15 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v13 = v15;
    *(void *)(v13 + 8) = spanid;
    *(void *)(v13 + 16) = 0;
    *(_DWORD *)(v13 + 24) = uint64;
    *(unsigned char *)(v13 + 28) = 102;
    *(void *)(v13 + 32) = "-[MDSearchableIndexService deleteActionsBeforeTime:]";
    si_tracing_log_span_begin();
    long long v17 = *(_OWORD *)(v13 + 16);
    long long v27 = *(_OWORD *)v13;
    long long v28 = v17;
    uint64_t v29 = *(void *)(v13 + 32);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __52__MDSearchableIndexService_deleteActionsBeforeTime___block_invoke;
    v20[3] = &unk_264509778;
    long long v23 = v27;
    long long v24 = v17;
    uint64_t v25 = v29;
    id v21 = v7;
    uint64_t v26 = uint64;
    id v22 = v5;
    [(MDSearchableIndexService *)self deleteActionsBeforeTime:v11 options:v20 completionHandler:v12];

    si_tracing_log_span_end();
    long long v18 = v31;
    *(_OWORD *)uint64_t v13 = v30;
    *(_OWORD *)(v13 + 16) = v18;
    *(void *)(v13 + 32) = v32;
  }

  return v9;
}

void __52__MDSearchableIndexService_deleteActionsBeforeTime___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteActionsBeforeTime";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)deleteActionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "opt");
    uint64_t v12 = (void *)MEMORY[0x263F02B30];
    uint64_t v13 = xpc_dictionary_get_value(v4, "identifiers");
    long long v14 = (void *)[v12 copyNSStringArrayFromXPCArray:v13];

    uint64_t v15 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v16 = *(_OWORD *)(v15 + 16);
    long long v32 = *(_OWORD *)v15;
    long long v33 = v16;
    uint64_t v34 = *(void *)(v15 + 32);
    uint64_t v17 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v15 = v17;
    *(void *)(v15 + 8) = spanid;
    *(void *)(v15 + 16) = 0;
    *(_DWORD *)(v15 + 24) = uint64;
    *(unsigned char *)(v15 + 28) = 102;
    *(void *)(v15 + 32) = "-[MDSearchableIndexService deleteActionsWithIdentifiers:]";
    si_tracing_log_span_begin();
    long long v19 = *(_OWORD *)(v15 + 16);
    long long v29 = *(_OWORD *)v15;
    long long v30 = v19;
    uint64_t v31 = *(void *)(v15 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __57__MDSearchableIndexService_deleteActionsWithIdentifiers___block_invoke;
    v22[3] = &unk_264509778;
    long long v25 = v29;
    long long v26 = v19;
    uint64_t v27 = v31;
    id v23 = v7;
    uint64_t v28 = uint64;
    id v24 = v5;
    [(MDSearchableIndexService *)self deleteActionsWithIdentifiers:v14 options:v11 completionHandler:v22];

    si_tracing_log_span_end();
    long long v20 = v33;
    *(_OWORD *)uint64_t v15 = v32;
    *(_OWORD *)(v15 + 16) = v20;
    *(void *)(v15 + 32) = v34;
  }
  return v9;
}

void __57__MDSearchableIndexService_deleteActionsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteActionsWithIdentifiers";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)processActivities:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  xpc_object_t original = a3;
  xpc_dictionary_get_remote_connection(original);
  xpc_connection_t connection = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (connection) {
    BOOL v4 = reply == 0;
  }
  else {
    BOOL v4 = 1;
  }
  char v5 = !v4;
  BOOL v32 = v5;
  if (!v4)
  {
    xpc_object_t message = reply;
    uint64_t v6 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v7 = *(_OWORD *)(v6 + 16);
    long long v41 = *(_OWORD *)v6;
    long long v42 = v7;
    uint64_t v31 = v6;
    uint64_t v43 = *(void *)(v6 + 32);
    uint64_t v8 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v31 = v8;
    *(void *)(v31 + 8) = spanid;
    *(void *)(v31 + 16) = 0;
    *(_DWORD *)(v31 + 24) = -1;
    *(unsigned char *)(v31 + 28) = 102;
    *(void *)(v31 + 32) = "-[MDSearchableIndexService processActivities:]";
    si_tracing_log_span_begin();
    uint64_t v27 = [MEMORY[0x263F02B30] dataWrapperForKey:"data" sizeKey:"data-size" fromXPCDictionary:original];
    long long v29 = [v27 data];
    if ([v29 length])
    {
      long long v26 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v29 error:0];
      long long v10 = (void *)MEMORY[0x263EFFA08];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
      uint64_t v28 = [v26 decodeObjectOfClasses:v15 forKey:*MEMORY[0x263F081D0]];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v16 = v28;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v38;
          long long v35 = (void *)*MEMORY[0x263F08080];
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v38 != v18) {
                objc_enumerationMutation(v16);
              }
              long long v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              id v21 = [v20 objectForKeyedSubscript:@"action"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v22 = [v20 objectForKeyedSubscript:@"item"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v23 = v35;
                  [(MDSearchableIndexService *)self userPerformedAction:v21 withItem:v22 protectionClass:v23];
                }
              }
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
          }
          while (v17);
        }
      }
    }
    if (xpc_dictionary_get_BOOL(original, "flush")) {
      [(MDSearchableIndexService *)self flushUserActivities];
    }
    csindex_xpc_dictionary_encode_status_with_error();
    xpc_connection_send_message(connection, message);

    si_tracing_log_span_end();
    long long v24 = v42;
    xpc_object_t reply = message;
    *(_OWORD *)uint64_t v31 = v41;
    *(_OWORD *)(v31 + 16) = v24;
    *(void *)(v31 + 32) = v43;
  }

  return v32;
}

- (BOOL)_deleteInteractions:(id)a3 forGroup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v7 = xpc_dictionary_get_remote_connection(v6);
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  id v9 = reply;
  BOOL v10 = 0;
  if (v7 && reply)
  {
    BOOL v35 = v4;
    uint64_t v34 = self;
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "id");
    id v38 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v6];
    uint64_t v33 = xpc_dictionary_get_uint64(v6, "opt");
    long long v37 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v6];
    uint64_t v12 = (void *)MEMORY[0x263F02B30];
    uint64_t v13 = xpc_dictionary_get_value(v6, "identifiers");
    long long v36 = (void *)[v12 copyNSStringArrayFromXPCArray:v13];

    uint64_t v14 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v15 = *(_OWORD *)(v14 + 16);
    long long v55 = *(_OWORD *)v14;
    long long v56 = v15;
    uint64_t v57 = *(void *)(v14 + 32);
    uint64_t v16 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v14 = v16;
    *(void *)(v14 + 8) = spanid;
    *(void *)(v14 + 16) = 0;
    *(_DWORD *)(v14 + 24) = uint64;
    *(unsigned char *)(v14 + 28) = 102;
    *(void *)(v14 + 32) = "-[MDSearchableIndexService _deleteInteractions:forGroup:]";
    si_tracing_log_span_begin();
    long long v18 = *(_OWORD *)(v14 + 16);
    long long v52 = *(_OWORD *)v14;
    long long v53 = v18;
    uint64_t v54 = *(void *)(v14 + 32);
    uint64_t v19 = *(void *)v14;
    uint64_t v20 = si_tracing_calc_next_spanid();
    uint64_t v21 = *(void *)(v14 + 8);
    int v22 = *(_DWORD *)(v14 + 24);
    if (v38)
    {
      id v23 = v38;
      if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionComplete"))
      {
        long long v26 = "Class A index";
      }
      else
      {
        id v24 = v23;
        if (!strcmp((const char *)[v24 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          long long v26 = "Class B index";
        }
        else
        {
          id v25 = v24;
          if (!strcmp((const char *)[v25 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            long long v26 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v25 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            long long v26 = "Class C index";
          }
          else
          {
            long long v26 = "Unknown index";
          }
        }
      }
    }
    else
    {
      long long v26 = "Nil index";
    }
    *(void *)uint64_t v14 = v19;
    *(void *)(v14 + 8) = v20;
    *(void *)(v14 + 16) = v21;
    *(_DWORD *)(v14 + 24) = v22;
    *(unsigned char *)(v14 + 28) = 102;
    *(void *)(v14 + 32) = v26;
    si_tracing_log_span_begin();
    long long v27 = *(_OWORD *)(v14 + 16);
    long long v49 = *(_OWORD *)v14;
    long long v50 = v27;
    uint64_t v51 = *(void *)(v14 + 32);
    uint64_t v28 = [v36 count];
    BOOL v10 = v28 != 0;
    if (v28)
    {
      if (v35)
      {
        long long v29 = v44;
        v44[0] = MEMORY[0x263EF8330];
        v44[1] = 3221225472;
        v44[2] = __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke;
        v44[3] = &unk_264509778;
        long long v45 = v49;
        long long v46 = v50;
        uint64_t v47 = v51;
        v44[4] = v9;
        uint64_t v48 = uint64;
        v44[5] = v7;
        [(MDSearchableIndexService *)v34 deleteInteractionsWithGroupIdentifiers:v36 bundleID:v37 protectionClass:v38 options:v33 completionHandler:v44];
      }
      else
      {
        long long v29 = v39;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke_2;
        v39[3] = &unk_264509778;
        long long v40 = v49;
        long long v41 = v50;
        uint64_t v42 = v51;
        void v39[4] = v9;
        uint64_t v43 = uint64;
        v39[5] = v7;
        [(MDSearchableIndexService *)v34 deleteInteractionsWithIdentifiers:v36 bundleID:v37 protectionClass:v38 options:v33 completionHandler:v39];
      }
    }
    si_tracing_log_span_end();
    long long v30 = v53;
    *(_OWORD *)uint64_t v14 = v52;
    *(_OWORD *)(v14 + 16) = v30;
    *(void *)(v14 + 32) = v54;
    si_tracing_log_span_end();
    long long v31 = v56;
    *(_OWORD *)uint64_t v14 = v55;
    *(_OWORD *)(v14 + 16) = v31;
    *(void *)(v14 + 32) = v57;
  }
  return v10;
}

void __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteInteractions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

void __57__MDSearchableIndexService__deleteInteractions_forGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteInteractions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)deleteAllInteractions:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  long long v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    long long v31 = self;
    BOOL v30 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v33 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    uint64_t v11 = xpc_dictionary_get_uint64(v4, "opt");
    BOOL v32 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v13 = *(_OWORD *)(v12 + 16);
    long long v47 = *(_OWORD *)v12;
    long long v48 = v13;
    uint64_t v49 = *(void *)(v12 + 32);
    uint64_t v14 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v14;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService deleteAllInteractions:]";
    si_tracing_log_span_begin();
    uint64_t v29 = v11;
    long long v16 = *(_OWORD *)(v12 + 16);
    long long v44 = *(_OWORD *)v12;
    long long v45 = v16;
    uint64_t v46 = *(void *)(v12 + 32);
    uint64_t v17 = *(void *)v12;
    uint64_t v18 = si_tracing_calc_next_spanid();
    uint64_t v19 = *(void *)(v12 + 8);
    int v20 = *(_DWORD *)(v12 + 24);
    if (v33)
    {
      id v21 = v33;
      if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionComplete"))
      {
        id v24 = "Class A index";
      }
      else
      {
        id v22 = v21;
        if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          id v24 = "Class B index";
        }
        else
        {
          id v23 = v22;
          if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            id v24 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v23 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            id v24 = "Class C index";
          }
          else
          {
            id v24 = "Unknown index";
          }
        }
      }
    }
    else
    {
      id v24 = "Nil index";
    }
    *(void *)uint64_t v12 = v17;
    *(void *)(v12 + 8) = v18;
    *(void *)(v12 + 16) = v19;
    *(_DWORD *)(v12 + 24) = v20;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = v24;
    si_tracing_log_span_begin();
    long long v25 = *(_OWORD *)(v12 + 16);
    long long v41 = *(_OWORD *)v12;
    long long v42 = v25;
    uint64_t v43 = *(void *)(v12 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __50__MDSearchableIndexService_deleteAllInteractions___block_invoke;
    void v34[3] = &unk_264509778;
    long long v37 = v41;
    long long v38 = v25;
    uint64_t v39 = v43;
    id v35 = v7;
    uint64_t v40 = uint64;
    id v36 = v5;
    [(MDSearchableIndexService *)v31 deleteAllInteractionsWithBundleID:v32 protectionClass:v33 options:v29 completionHandler:v34];

    si_tracing_log_span_end();
    long long v26 = v45;
    *(_OWORD *)uint64_t v12 = v44;
    *(_OWORD *)(v12 + 16) = v26;
    *(void *)(v12 + 32) = v46;
    si_tracing_log_span_end();
    long long v27 = v48;
    *(_OWORD *)uint64_t v12 = v47;
    *(_OWORD *)(v12 + 16) = v27;
    *(void *)(v12 + 32) = v49;

    BOOL v9 = v30;
  }

  return v9;
}

void __50__MDSearchableIndexService_deleteAllInteractions___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for deleteAllInteractions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)donateRelevantActions:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  long long v7 = reply;
  BOOL v8 = 0;
  if (v5 && reply)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    uint64_t v10 = xpc_dictionary_get_uint64(v4, "opt");
    long long v11 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v12 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v13 = *(_OWORD *)(v12 + 16);
    long long v30 = *(_OWORD *)v12;
    long long v31 = v13;
    uint64_t v32 = *(void *)(v12 + 32);
    uint64_t v14 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v12 = v14;
    *(void *)(v12 + 8) = spanid;
    *(void *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = uint64;
    *(unsigned char *)(v12 + 28) = 102;
    *(void *)(v12 + 32) = "-[MDSearchableIndexService donateRelevantActions:]";
    si_tracing_log_span_begin();
    long long v16 = *(_OWORD *)(v12 + 16);
    long long v27 = *(_OWORD *)v12;
    long long v28 = v16;
    uint64_t v29 = *(void *)(v12 + 32);
    uint64_t v17 = xpc_dictionary_get_value(v4, "data");
    BOOL v8 = v17 != 0;
    if (v17)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __50__MDSearchableIndexService_donateRelevantActions___block_invoke;
      v20[3] = &unk_264509778;
      long long v23 = v27;
      long long v24 = v28;
      uint64_t v25 = v29;
      id v21 = v7;
      uint64_t v26 = uint64;
      id v22 = v5;
      [(MDSearchableIndexService *)self donateRelevantActions:v17 bundleID:v11 options:v10 completionHandler:v20];
    }
    si_tracing_log_span_end();
    long long v18 = v31;
    *(_OWORD *)uint64_t v12 = v30;
    *(_OWORD *)(v12 + 16) = v18;
    *(void *)(v12 + 32) = v32;
  }
  return v8;
}

void __50__MDSearchableIndexService_donateRelevantActions___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v10 = *(_OWORD *)v3;
  long long v11 = *(_OWORD *)(v3 + 16);
  uint64_t v12 = *(void *)(v3 + 32);
  uint64_t v4 = *(void *)(a1 + 80);
  long long v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(void *)(v3 + 32) = v4;
  uint64_t v6 = *(void *)v3;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v8 = *(void *)(v3 + 8);
  *(void *)uint64_t v3 = v6;
  *(void *)(v3 + 8) = spanid;
  *(void *)(v3 + 16) = v8;
  *(unsigned char *)(v3 + 28) = 102;
  *(void *)(v3 + 32) = "completion handler for donateRelevantActions";
  si_tracing_log_span_begin();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(void *)(v3 + 32) = v12;
}

- (BOOL)updateCorrections:(id)a3
{
  id v4 = a3;
  long long v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  long long v7 = reply;
  if (v5) {
    BOOL v8 = reply == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    uint64_t v32 = self;
    BOOL v29 = v9;
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    id v33 = (id)[MEMORY[0x263F02B30] copyNSStringForKey:"pc" fromXPCDictionary:v4];
    long long v28 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"b" fromXPCDictionary:v4];
    uint64_t v30 = xpc_dictionary_get_uint64(v4, "opt");
    long long v31 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"filepath" fromXPCDictionary:v4];
    uint64_t v11 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v12 = *(_OWORD *)(v11 + 16);
    long long v47 = *(_OWORD *)v11;
    long long v48 = v12;
    uint64_t v49 = *(void *)(v11 + 32);
    uint64_t v13 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v11 = v13;
    *(void *)(v11 + 8) = spanid;
    *(void *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = "-[MDSearchableIndexService updateCorrections:]";
    si_tracing_log_span_begin();
    long long v15 = *(_OWORD *)(v11 + 16);
    long long v44 = *(_OWORD *)v11;
    long long v45 = v15;
    uint64_t v46 = *(void *)(v11 + 32);
    uint64_t v16 = *(void *)v11;
    uint64_t v17 = si_tracing_calc_next_spanid();
    uint64_t v18 = *(void *)(v11 + 8);
    int v19 = *(_DWORD *)(v11 + 24);
    if (v33)
    {
      id v20 = v33;
      if (!strcmp((const char *)objc_msgSend(v20, "UTF8String", v28), "NSFileProtectionComplete"))
      {
        long long v23 = "Class A index";
      }
      else
      {
        id v21 = v20;
        if (!strcmp((const char *)[v21 UTF8String], "NSFileProtectionCompleteUnlessOpen"))
        {
          long long v23 = "Class B index";
        }
        else
        {
          id v22 = v21;
          if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteWhenUserInactive"))
          {
            long long v23 = "Class Cx index";
          }
          else if (!strcmp((const char *)[v22 UTF8String], "NSFileProtectionCompleteUntilFirstUserAuthentication"))
          {
            long long v23 = "Class C index";
          }
          else
          {
            long long v23 = "Unknown index";
          }
        }
      }
    }
    else
    {
      long long v23 = "Nil index";
    }
    *(void *)uint64_t v11 = v16;
    *(void *)(v11 + 8) = v17;
    *(void *)(v11 + 16) = v18;
    *(_DWORD *)(v11 + 24) = v19;
    *(unsigned char *)(v11 + 28) = 102;
    *(void *)(v11 + 32) = v23;
    si_tracing_log_span_begin();
    long long v24 = *(_OWORD *)(v11 + 16);
    long long v41 = *(_OWORD *)v11;
    long long v42 = v24;
    uint64_t v43 = *(void *)(v11 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __46__MDSearchableIndexService_updateCorrections___block_invoke;
    void v34[3] = &unk_2645097C8;
    long long v37 = v41;
    long long v38 = v24;
    uint64_t v39 = v43;
    id v35 = v7;
    uint64_t v40 = uint64;
    id v36 = v5;
    [(MDSearchableIndexService *)v32 updateCorrectionsWithFilePath:v31 options:v30 completionHandler:v34];

    si_tracing_log_span_end();
    long long v25 = v45;
    *(_OWORD *)uint64_t v11 = v44;
    *(_OWORD *)(v11 + 16) = v25;
    *(void *)(v11 + 32) = v46;
    si_tracing_log_span_end();
    long long v26 = v48;
    *(_OWORD *)uint64_t v11 = v47;
    *(_OWORD *)(v11 + 16) = v26;
    *(void *)(v11 + 32) = v49;

    BOOL v9 = v29;
  }

  return v9;
}

void __46__MDSearchableIndexService_updateCorrections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v13 = *(_OWORD *)v6;
  long long v14 = *(_OWORD *)(v6 + 16);
  uint64_t v15 = *(void *)(v6 + 32);
  uint64_t v7 = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(void *)(v6 + 32) = v7;
  uint64_t v9 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v11 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v9;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v11;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "completion handler for updateCorrections";
  si_tracing_log_span_begin();
  csindex_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v13;
  *(_OWORD *)(v6 + 16) = v14;
  *(void *)(v6 + 32) = v15;
}

- (BOOL)issueCacheCommand:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (v5)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "id");
    long long v8 = (void *)[MEMORY[0x263F02B30] copyNSStringForKey:"cache-request" fromXPCDictionary:v4];
    uint64_t v9 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
    long long v10 = *(_OWORD *)(v9 + 16);
    long long v32 = *(_OWORD *)v9;
    long long v33 = v10;
    uint64_t v34 = *(void *)(v9 + 32);
    uint64_t v11 = si_tracing_calc_traceid();
    uint64_t spanid = si_tracing_calc_next_spanid();
    *(void *)uint64_t v9 = v11;
    *(void *)(v9 + 8) = spanid;
    *(void *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 24) = uint64;
    *(unsigned char *)(v9 + 28) = 102;
    *(void *)(v9 + 32) = "-[MDSearchableIndexService issueCacheCommand:]";
    si_tracing_log_span_begin();
    long long v13 = *(_OWORD *)(v9 + 16);
    long long v29 = *(_OWORD *)v9;
    long long v30 = v13;
    uint64_t v31 = *(void *)(v9 + 32);
    BOOL v14 = v8 != 0;
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __46__MDSearchableIndexService_issueCacheCommand___block_invoke;
      id v22 = &unk_2645097C8;
      long long v25 = v29;
      long long v26 = v30;
      uint64_t v27 = v31;
      id v15 = reply;
      id v23 = v15;
      uint64_t v28 = uint64;
      id v24 = v5;
      uint64_t v16 = (void *)MEMORY[0x223C48320](&v19);
      -[MDIndexer _issueCacheCommand:xpc:searchContext:completionHandler:](self->_indexer, "_issueCacheCommand:xpc:searchContext:completionHandler:", v8, v15, 0, v16, v19, v20, v21, v22);
    }
    si_tracing_log_span_end();
    long long v17 = v33;
    *(_OWORD *)uint64_t v9 = v32;
    *(_OWORD *)(v9 + 16) = v17;
    *(void *)(v9 + 32) = v34;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __46__MDSearchableIndexService_issueCacheCommand___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  long long v15 = *(_OWORD *)v6;
  long long v16 = *(_OWORD *)(v6 + 16);
  uint64_t v17 = *(void *)(v6 + 32);
  uint64_t v7 = *(void *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v6 + 16) = v8;
  *(void *)(v6 + 32) = v7;
  uint64_t v9 = *(void *)v6;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v11 = *(void *)(v6 + 8);
  *(void *)uint64_t v6 = v9;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = v11;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "completion handler for issueCacheCommand";
  si_tracing_log_span_begin();
  if (*(void *)(a1 + 32))
  {
    csindex_xpc_dictionary_encode_status_with_error();
    if (v14)
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = v14;
      xpc_dictionary_set_data(v12, "cache-data-key", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    }
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "id", *(void *)(a1 + 88));
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v15;
  *(_OWORD *)(v6 + 16) = v16;
  *(void *)(v6 + 32) = v17;
}

- (MDIndexer)indexer
{
  return self->_indexer;
}

- (OS_xpc_object)clientConnection
{
  return self->_clientConnection;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (BOOL)searchInternal
{
  return self->_searchInternal;
}

- (BOOL)quotaDisabled
{
  return self->_quotaDisabled;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)allowMail
{
  return self->_allowMail;
}

- (BOOL)allowPhotosLibraryDeletion
{
  return self->_allowPhotosLibraryDeletion;
}

- (BOOL)allowOpenJournalFile
{
  return self->_allowOpenJournalFile;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (int)entitledAttributes
{
  return self->_entitledAttributes;
}

- (BOOL)allowNotifications
{
  return self->_allowNotifications;
}

- (BOOL)allowMessagesContent
{
  return self->_allowMessagesContent;
}

- (void)setAllowMessagesContent:(BOOL)a3
{
  self->_allowMessagesContent = a3;
}

- (void)_checkNonEmptyBundle:(void *)a1 protectionClass:.cold.1(void *a1)
{
  v1 = [a1 processDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "No bundle ID found for process:%@", v4, v5, v6, v7, v8);
}

- (void)_checkItems:(void *)a1 identifiers:(NSObject *)a2 protectionClass:bundleID:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 processDescription];
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = @"application-identifier";
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "No client bundle ID found for process:%@ - if this is an app, makes sure it has the \"%@\" entitlement", (uint8_t *)&v4, 0x16u);
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, v0, v1, "Identifier %@ isn't a string", v2);
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.3()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t v2 = [v1 bundleID];
  uint64_t v9 = [v0 clientBundleID];
  OUTLINED_FUNCTION_11_0(&dword_21F1CE000, v3, v4, "Searchable item:%@ has bundleID:%@ but should be %@", v5, v6, v7, v8, 2u);
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, v0, v1, "Searchable item %@ does not have an unique identifier or content type", v2);
}

- (void)_checkItems:(void *)a1 identifiers:protectionClass:bundleID:.cold.5(void *a1)
{
  uint64_t v1 = [a1 processDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Caller uid doesn't match daemon uid for process:%@", v4, v5, v6, v7, v8);
}

- (void)_checkItems:identifiers:protectionClass:bundleID:.cold.6()
{
  OUTLINED_FUNCTION_8_1();
  uint64_t v2 = [v1 processDescription];
  uint64_t v9 = [v0 clientBundleID];
  OUTLINED_FUNCTION_11_0(&dword_21F1CE000, v3, v4, "Invalid bundle ID for process:%@, bundleID:%@, clientBundleID:%@", v5, v6, v7, v8, 2u);
}

- (void)_canProcessIndexDataForBundle:itemsDecoder:deletesDecoder:clientState:clientStateName:outError:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, v0, v1, "Expected non-nil client state name for %@", v2);
}

- (void)_dispatchToReceiversWithBundleID:protectionClass:options:items:itemsText:itemsHTML:deletes:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  +[SpotlightSender jobForTest:v1];
  +[SpotlightSender jobForDuet:v0];
  +[SpotlightSender jobForSuggestions:v0];
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x34u);
}

- (void)deleteSearchableItemsWithDomainIdentifiers:protectionClass:forBundleID:fromClient:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "domainIdentifier:%@, options:0x%lx");
}

- (void)updateCorrectionsWithFilePath:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "updateCorrectionsWithProtectionClass, filePath:%@, options:0x%lx");
}

- (void)provideDataForBundle:identifier:type:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Missing entitlement.", v2, v3, v4, v5, v6);
}

- (void)_issueCommand:(void *)a1 outFileDescriptor:searchContext:completionHandler:.cold.2(void *a1)
{
  uint64_t v1 = [a1 clientBundleID];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Attempt to access full messages text content by client %@", v4, v5, v6, v7, v8);
}

- (void)_issueCommand:(void *)a1 outFileDescriptor:searchContext:completionHandler:.cold.3(void *a1)
{
  uint64_t v1 = [a1 clientBundleID];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "Attempt to access notifications by client %@", v4, v5, v6, v7, v8);
}

- (void)userPerformedAction:withItem:protectionClass:.cold.1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Ignoring action:%@, item:%@");
}

- (void)checkInWithProtectionClass:(void *)a1 completionHandler:.cold.1(void *a1)
{
  os_log_t v1 = [a1 processDescription];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_21F1CE000, v2, v3, "checkInWithProtectionClass failed, nil client bundleID for process:%@", v4, v5, v6, v7, v8);
}

- (void)deleteAllUserActivities:fromClient:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "(%@) deleteAllActivties, options:0x%lx");
}

- (void)deleteUserActivitiesWithPersistentIdentifiers:bundleID:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "(%@) deleteActivties, options:0x%lx");
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_1(os_log_t log, double a2, double a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = (uint64_t)(a2 - a3);
  _os_log_debug_impl(&dword_21F1CE000, log, OS_LOG_TYPE_DEBUG, "Finished waiting for index to update, totalTime:%llds", (uint8_t *)&v3, 0xCu);
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_DEBUG, "Waiting for index to update", v1, 2u);
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_21F1CE000, v0, OS_LOG_TYPE_DEBUG, "Waiting for indexing extensions to finish migration", v1, 2u);
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_cold_4(uint64_t a1)
{
  os_log_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

void __78__MDSearchableIndexService_performDataMigrationWithTimeout_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "Extension \"%@\" completed migration, error:%@");
}

- (void)transferDeleteJournalsForProtectionClass:(const char *)a1 toDirectory:withCompletionHandler:.cold.1(const char *a1)
{
  os_log_t v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);
}

- (void)deleteInteractionsWithIdentifiers:bundleID:protectionClass:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "options:0x%lx, identifiers:%@");
}

- (void)donateRelevantActions:bundleID:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4(&dword_21F1CE000, v0, v1, "(%@) donateRelevantActions options:0x%lx");
}

- (void)indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:clientStateName:protectionClass:forBundleID:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "indexSearchableItems: not supported by service", v2, v3, v4, v5, v6);
}

- (void)indexFromBundle:protectionClass:options:items:itemsText:itemsHTML:clientState:expectedClientState:clientStateName:deletes:userActivities:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "indexFromBundle: not supported by service", v2, v3, v4, v5, v6);
}

- (void)openJournalFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  long long v10 = v5;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "Unable to open path: %@, error: %s(%d)", (uint8_t *)&v7, 0x1Cu);
}

void __41__MDSearchableIndexService_issueCommand___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, a3, "_issueCommand callback called twice! %@", (uint8_t *)&v4);
}

- (void)processActivities:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a3, (uint64_t)a3, "Error: %@", (uint8_t *)a2);
}

- (void)handleCommand:info:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, v0, v1, "unknown command: %s", v2);
}

@end