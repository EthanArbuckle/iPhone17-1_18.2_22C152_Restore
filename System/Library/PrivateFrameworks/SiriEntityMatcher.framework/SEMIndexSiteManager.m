@interface SEMIndexSiteManager
- (BOOL)_checkLastDateOfOperation:(unsigned __int8)a3 isOverdue:(BOOL *)a4 atSite:(id)a5;
- (BOOL)_didHandleUpdatedSets:(id)a3 shouldDefer:(id)a4;
- (BOOL)_didRefreshSettings:(id)a3 skipMaintenance:(BOOL *)a4;
- (BOOL)_enumerateAllIndexSiteWritersUsingBlock:(id)a3;
- (BOOL)_loadManagerDirectoryAndAvailableIndexSites;
- (BOOL)_performAnyDeferredOperationsAtIndexSite:(id)a3 outOperationPerformed:(unsigned __int8 *)a4 shouldDefer:(id)a5;
- (BOOL)_performAnyDeferredOperationsAtIndexSiteType:(unsigned __int8)a3 shouldDefer:(id)a4;
- (BOOL)_performMaintenance:(id)a3;
- (BOOL)_performOperation:(unsigned __int8)a3 atIndexSite:(id)a4 shouldDefer:(id)a5;
- (BOOL)_performOperation:(unsigned __int8)a3 atIndexSite:(id)a4 withDate:(id)a5 shouldDefer:(id)a6;
- (BOOL)_performOperationAtAllIndexSites:(unsigned __int8)a3 shouldDefer:(id)a4;
- (BOOL)_rebuildAllStateWithSetEnumerator:(id)a3;
- (BOOL)_resetManagerDirectory;
- (BOOL)_updateContainsSetsInUserVault:(id)a3;
- (BOOL)_updateIndexSiteType:(unsigned __int8)a3 updatedSets:(id)a4 shouldDefer:(id)a5;
- (BOOL)clearAllState;
- (BOOL)handleIndexSiteAvailableWithType:(unsigned __int8)a3 shouldDefer:(id)a4;
- (BOOL)handleSettingsChange;
- (BOOL)handleUpdatedSets:(id)a3;
- (BOOL)performMaintenance:(id)a3;
- (BOOL)rebuildAllStateWithSetEnumerator:(id)a3;
- (SEMIndexSiteManager)initWithManagerDirectory:(id)a3 indexSiteCache:(id)a4 setEnumerator:(id)a5 settings:(id)a6;
- (id)_cachedWriterForIndexSiteType:(unsigned __int8)a3;
- (id)_discoverAllSetsForIndexSiteType:(unsigned __int8)a3;
- (unsigned)_checkForDeferredOperationAtIndexSite:(id)a3;
- (void)_loadOrCreateManagerInfo;
- (void)_recordOperationTriggered:(unsigned __int8)a3 withDate:(id)a4;
- (void)handleSysdiagnoseStarted;
@end

@implementation SEMIndexSiteManager

- (SEMIndexSiteManager)initWithManagerDirectory:(id)a3 indexSiteCache:(id)a4 setEnumerator:(id)a5 settings:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SEMIndexSiteManager;
  v15 = [(SEMIndexSiteManager *)&v30 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v15->_managerDirectory, a3);
  objc_storeStrong((id *)&v16->_settings, a6);
  objc_storeStrong((id *)&v16->_setEnumerator, a5);
  objc_storeStrong((id *)&v16->_indexSiteCache, a4);
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  id v18 = objc_claimAutoreleasedReturnValue();
  v21 = (const char *)objc_msgSend_cStringUsingEncoding_(v18, v19, 4, v20);
  v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
  queue = v16->_queue;
  v16->_queue = (OS_dispatch_queue *)v23;

  v28 = 0;
  if (objc_msgSend__loadManagerDirectoryAndAvailableIndexSites(v16, v25, v26, v27)) {
LABEL_3:
  }
    v28 = v16;

  return v28;
}

- (BOOL)handleUpdatedSets:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7F6A54;
  block[3] = &unk_2654DE408;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)handleSettingsChange
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C7F6B3C;
  v5[3] = &unk_2654DE430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)performMaintenance:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7F6C48;
  block[3] = &unk_2654DE458;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)clearAllState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C7F6D2C;
  v5[3] = &unk_2654DE430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)rebuildAllStateWithSetEnumerator:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7F6E40;
  block[3] = &unk_2654DE408;
  id v9 = v4;
  v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)handleSysdiagnoseStarted
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7F6EEC;
  block[3] = &unk_2654DE398;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)handleIndexSiteAvailableWithType:(unsigned __int8)a3 shouldDefer:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_25C7F6FD8;
  v10[3] = &unk_2654DE480;
  id v11 = v6;
  id v12 = &v14;
  unsigned __int8 v13 = a3;
  v10[4] = self;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)_loadManagerDirectoryAndAvailableIndexSites
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  managerDirectory = self->_managerDirectory;
  id v25 = 0;
  id v4 = sub_25C7EFC30(managerDirectory, &v25);
  v5 = (__CFString *)v25;

  if (v4)
  {
    objc_msgSend__loadOrCreateManagerInfo(self, v6, v7, v8);
    objc_msgSend_objectForKey_(self->_managerInfo, v9, @"schemaVersion", v10);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqual_(&unk_2709EA550, v12, (uint64_t)v11, v13) & 1) == 0)
    {
      uint64_t v14 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        id v18 = @"empty";
        *(_DWORD *)buf = 136315650;
        uint64_t v27 = "-[SEMIndexSiteManager _loadManagerDirectoryAndAvailableIndexSites]";
        __int16 v28 = 2112;
        if (v11) {
          id v18 = v11;
        }
        uint64_t v29 = 0x2709EA550;
        __int16 v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_INFO, "%s Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x20u);
      }
      if (!objc_msgSend__resetManagerDirectory(self, v15, v16, v17))
      {
        BOOL v21 = 0;
        goto LABEL_14;
      }
      objc_msgSend__enumerateAllIndexSiteWritersUsingBlock_(self, v19, (uint64_t)&unk_2709E01F8, v20);
    }
    BOOL v21 = 1;
LABEL_14:

    goto LABEL_15;
  }
  v22 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    v24 = self->_managerDirectory;
    *(_DWORD *)buf = 136315650;
    uint64_t v27 = "-[SEMIndexSiteManager _loadManagerDirectoryAndAvailableIndexSites]";
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v24;
    __int16 v30 = 2112;
    v31 = v5;
    _os_log_error_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create manager directory: %@ error: %@", buf, 0x20u);
  }
  BOOL v21 = 0;
LABEL_15:

  return v21;
}

- (void)_loadOrCreateManagerInfo
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v3 = [SEMDictionaryLog alloc];
  managerDirectory = self->_managerDirectory;
  id v10 = 0;
  id v6 = (SEMDictionaryLog *)objc_msgSend_initWithFilename_protectionClass_directory_readOnly_create_error_(v3, v5, @"Manager", 4, managerDirectory, 0, 1, &v10);
  id v7 = v10;
  managerInfo = self->_managerInfo;
  self->_managerInfo = v6;

  if (!self->_managerInfo)
  {
    id v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[SEMIndexSiteManager _loadOrCreateManagerInfo]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s Failed to load manager info: %@", buf, 0x16u);
    }
  }
}

- (BOOL)_resetManagerDirectory
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v3 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    managerDirectory = self->_managerDirectory;
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "-[SEMIndexSiteManager _resetManagerDirectory]";
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)managerDirectory;
    _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s Clearing manager directory: %@", buf, 0x16u);
  }
  v5 = self->_managerDirectory;
  id v27 = 0;
  char v6 = sub_25C7EFD04(v5, &v27);
  id v10 = v27;
  if ((v6 & 1) == 0)
  {
    uint64_t v20 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "-[SEMIndexSiteManager _resetManagerDirectory]";
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v10;
      v22 = "%s Failed to remove manager directory: %@";
LABEL_15:
      _os_log_error_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);
    }
LABEL_16:
    BOOL v21 = 0;
    goto LABEL_17;
  }
  objc_msgSend_clear(self->_indexSiteCache, v7, v8, v9);
  id v11 = self->_managerDirectory;
  id v26 = v10;
  id v12 = sub_25C7EFC30(v11, &v26);
  id v13 = v26;

  if (v12)
  {
    objc_msgSend__loadOrCreateManagerInfo(self, v14, v15, v16);
    managerInfo = self->_managerInfo;
    id v25 = v13;
    char v19 = objc_msgSend_writeUpdatedObject_forKey_error_(managerInfo, v18, 0x2709EA550, @"schemaVersion", &v25);
    id v10 = v25;

    uint64_t v20 = qword_26B3549D8;
    if (v19)
    {
      BOOL v21 = 1;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v29 = "-[SEMIndexSiteManager _resetManagerDirectory]";
        __int16 v30 = 2112;
        uint64_t v31 = 0x2709EA550;
        _os_log_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_INFO, "%s Manager directory initialized with schema version: %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "-[SEMIndexSiteManager _resetManagerDirectory]";
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v10;
      v22 = "%s Failed to record schema version: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  dispatch_queue_t v23 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "-[SEMIndexSiteManager _resetManagerDirectory]";
    __int16 v30 = 2112;
    uint64_t v31 = (uint64_t)v13;
    _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, "%s Failed to create manager directory: %@", buf, 0x16u);
  }
  BOOL v21 = 0;
  id v10 = v13;
LABEL_17:

  return v21;
}

- (id)_cachedWriterForIndexSiteType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  indexSiteCache = self->_indexSiteCache;
  id v22 = 0;
  char v6 = objc_msgSend_indexSiteWithType_error_(indexSiteCache, a2, a3, (uint64_t)&v22);
  id v7 = v22;
  if (v6)
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_25C7F77C0;
    v19[3] = &unk_2654DE4C8;
    id v20 = v6;
    BOOL v21 = self;
    id v11 = objc_msgSend_cachedObjectForKey_initBlock_(v20, v10, (uint64_t)v9, (uint64_t)v19);
  }
  else
  {
    id v12 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      id v14 = v12;
      id v18 = sub_25C7FBC68(v3, v15, v16, v17);
      *(_DWORD *)buf = 136315650;
      v24 = "-[SEMIndexSiteManager _cachedWriterForIndexSiteType:]";
      __int16 v25 = 2112;
      id v26 = v18;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_error_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_ERROR, "%s Failed to resolve index site with type %@ error: %@", buf, 0x20u);
    }
    id v11 = 0;
  }

  return v11;
}

- (BOOL)_enumerateAllIndexSiteWritersUsingBlock:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  char v6 = (void (**)(id, void *))a3;
  if (v6)
  {
    id v10 = objc_msgSend__cachedWriterForIndexSiteType_(self, v4, 1, v5);
    BOOL v11 = v10 != 0;
    if (v10) {
      v6[2](v6, v10);
    }
    if (objc_msgSend_isUserVaultEnabled(SEMSettings, v7, v8, v9))
    {
      uint64_t v15 = sub_25C7FBC68(2u, v12, v13, v14);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = sub_25C7F7D00;
      v41 = sub_25C7F7D10;
      id v42 = objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2020000000;
      char v36 = 1;
      id v32 = 0;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = sub_25C7F7D18;
      v26[3] = &unk_2654DE4F0;
      v26[4] = self;
      char v31 = 2;
      id v28 = v6;
      uint64_t v29 = &v33;
      id v16 = v15;
      id v27 = v16;
      __int16 v30 = &v37;
      char v18 = objc_msgSend_enumerateAndAssumeAllUserPersonas_usingBlock_(SEMPersonaUtilities, v17, (uint64_t)&v32, (uint64_t)v26);
      id v19 = v32;
      if ((v18 & 1) == 0)
      {
        id v20 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[SEMIndexSiteManager _enumerateAllIndexSiteWritersUsingBlock:]";
          __int16 v45 = 2112;
          id v46 = v19;
          _os_log_error_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_ERROR, "%s Failed to enumerate and assume all personas: %@", buf, 0x16u);
        }
        *((unsigned char *)v34 + 24) = 0;
      }

      BOOL v21 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        if (*((unsigned char *)v34 + 24)) {
          id v22 = &stru_2709E04D0;
        }
        else {
          id v22 = @"in";
        }
        uint64_t v23 = v38[5];
        *(_DWORD *)buf = 136315906;
        v44 = "-[SEMIndexSiteManager _enumerateAllIndexSiteWritersUsingBlock:]";
        __int16 v45 = 2112;
        id v46 = v16;
        __int16 v47 = 2112;
        v48 = v22;
        __int16 v49 = 2112;
        uint64_t v50 = v23;
        _os_log_impl(&dword_25C7CA000, v21, OS_LOG_TYPE_INFO, "%s Enumeration of %@ sites for all personas was %@complete:\n%@", buf, 0x2Au);
      }
      if (v10) {
        BOOL v24 = *((unsigned char *)v34 + 24) == 0;
      }
      else {
        BOOL v24 = 1;
      }
      BOOL v11 = !v24;
      _Block_object_dispose(&v33, 8);
      _Block_object_dispose(&v37, 8);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_didHandleUpdatedSets:(id)a3 shouldDefer:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char isAssistantEnabled = objc_msgSend_isAssistantEnabled(self->_settings, v8, v9, v10);
  id v12 = qword_26B3549D8;
  BOOL v13 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
  if (isAssistantEnabled)
  {
    if (v13)
    {
      uint64_t v17 = v12;
      int v33 = 136315650;
      v34 = "-[SEMIndexSiteManager _didHandleUpdatedSets:shouldDefer:]";
      __int16 v35 = 1024;
      *(_DWORD *)char v36 = objc_msgSend_count(v6, v18, v19, v20);
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = v6;
      _os_log_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_INFO, "%s Handling updates from %u set(s): %@", (uint8_t *)&v33, 0x1Cu);
    }
    if (objc_msgSend_isUserVaultEnabled(SEMSettings, v14, v15, v16)
      && objc_msgSend__updateContainsSetsInUserVault_(self, v21, (uint64_t)v6, v22))
    {
      int shouldDefer = objc_msgSend__updateIndexSiteType_updatedSets_shouldDefer_(self, v21, 2, (uint64_t)v6, v7);
    }
    else
    {
      int shouldDefer = 1;
    }
    int v24 = shouldDefer & objc_msgSend__updateIndexSiteType_updatedSets_shouldDefer_(self, v21, 1, (uint64_t)v6, v7);
    __int16 v25 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      if (v24) {
        id v26 = @"Completed";
      }
      else {
        id v26 = @"Did not complete";
      }
      id v27 = v25;
      int v31 = objc_msgSend_count(v6, v28, v29, v30);
      int v33 = 136315650;
      v34 = "-[SEMIndexSiteManager _didHandleUpdatedSets:shouldDefer:]";
      __int16 v35 = 2112;
      *(void *)char v36 = v26;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = v31;
      _os_log_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_INFO, "%s %@ handling for %u set update(s)", (uint8_t *)&v33, 0x1Cu);
    }
  }
  else if (v13)
  {
    int v33 = 136315138;
    v34 = "-[SEMIndexSiteManager _didHandleUpdatedSets:shouldDefer:]";
    LOBYTE(v24) = 1;
    _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Skipping update(s) as Siri Assistant is not enabled in settings", (uint8_t *)&v33, 0xCu);
  }
  else
  {
    LOBYTE(v24) = 1;
  }

  return v24;
}

- (BOOL)_updateContainsSetsInUserVault:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend_isInUserVault(*(void **)(*((void *)&v12 + 1) + 8 * i), v5, v6, v7, (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v12, (uint64_t)v16, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)_updateIndexSiteType:(unsigned __int8)a3 updatedSets:(id)a4 shouldDefer:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  long long v12 = objc_msgSend__cachedWriterForIndexSiteType_(self, v10, v6, v11);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_25C7F8374;
  v32[3] = &unk_2654DE518;
  v32[4] = self;
  char v33 = v6;
  long long v13 = (void *)MEMORY[0x2611949C0](v32);
  uint64_t v17 = objc_msgSend_now(MEMORY[0x263EFF910], v14, v15, v16);
  objc_msgSend__recordOperationTriggered_withDate_(self, v18, 1, (uint64_t)v17);
  int shouldDefer = objc_msgSend_performOperation_updatedSets_allSetsBlock_shouldDefer_(v12, v19, 1, (uint64_t)v9, v13, v8);

  if (shouldDefer)
  {
    id v31 = 0;
    char v22 = objc_msgSend_recordDate_ofOperation_error_(v12, v21, (uint64_t)v17, 1, &v31);
    id v23 = v31;
    if ((v22 & 1) == 0)
    {
      int v24 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = v24;
        uint64_t v29 = sub_25C7FBCF8(1u, v26, v27, v28);
        *(_DWORD *)buf = 136316162;
        __int16 v35 = "-[SEMIndexSiteManager _updateIndexSiteType:updatedSets:shouldDefer:]";
        __int16 v36 = 2112;
        uint64_t v37 = v17;
        __int16 v38 = 2112;
        uint64_t v39 = v29;
        __int16 v40 = 2112;
        v41 = v12;
        __int16 v42 = 2112;
        id v43 = v23;
        _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s Failed to record date: %@ for operation \"%@\" at site (%@) in info log: %@", buf, 0x34u);
      }
    }
  }
  else
  {
    id v23 = 0;
  }

  return shouldDefer;
}

- (id)_discoverAllSetsForIndexSiteType:(unsigned __int8)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    setEnumerator = self->_setEnumerator;
    id v34 = 0;
    objc_msgSend_allSetsWithOptions_error_(setEnumerator, a2, 1, (uint64_t)&v34);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v34;
    if (!v14)
    {
      uint64_t v17 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        char v18 = v17;
        char v22 = sub_25C7FBC68(2u, v19, v20, v21);
        objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, v23, v24, v25);
        id v26 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[SEMIndexSiteManager _discoverAllSetsForIndexSiteType:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2112;
        __int16 v45 = v26;
        LOWORD(v46) = 2112;
        *(void *)((char *)&v46 + 2) = v16;
        _os_log_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_INFO, "%s Failed to enumerate %@ sets for persona: %@ error: %@", buf, 0x2Au);
      }
    }
  }
  else
  {
    unsigned int v4 = a3;
    if (a3 == 1)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v45 = sub_25C7F7D00;
      *(void *)&long long v46 = sub_25C7F7D10;
      *((void *)&v46 + 1) = objc_alloc_init(MEMORY[0x263EFF980]);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = sub_25C7F8774;
      v38[3] = &unk_2654DE590;
      v38[4] = self;
      v38[5] = buf;
      char v39 = 1;
      objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v5, 0, (uint64_t)v38);
      if (objc_msgSend_isVanillaContainersEnabled(self->_settings, v6, v7, v8))
      {
        id v37 = 0;
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = sub_25C7F8904;
        v35[3] = &unk_2654DE590;
        v35[4] = self;
        v35[5] = buf;
        char v36 = 1;
        char v10 = objc_msgSend_enumerateAndAssumeAllUserPersonas_usingBlock_(SEMPersonaUtilities, v9, (uint64_t)&v37, (uint64_t)v35);
        id v11 = v37;
        if ((v10 & 1) == 0)
        {
          long long v12 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)__int16 v40 = 136315394;
            v41 = "-[SEMIndexSiteManager _discoverAllSetsForIndexSiteType:]";
            __int16 v42 = 2112;
            id v43 = v11;
            _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, "%s Failed to enumerate all user personas: %@", v40, 0x16u);
          }
          long long v13 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = 0;
        }
      }
      id v14 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v27 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = v27;
        id v32 = sub_25C7FBC68(v4, v29, v30, v31);
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SEMIndexSiteManager _discoverAllSetsForIndexSiteType:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v32;
        _os_log_impl(&dword_25C7CA000, v28, OS_LOG_TYPE_INFO, "%s Unexpected index site type %@", buf, 0x16u);
      }
      id v14 = 0;
    }
  }
  return v14;
}

- (BOOL)_performOperationAtAllIndexSites:(unsigned __int8)a3 shouldDefer:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  sub_25C7FBCF8(v4, v7, v8, v9);
  char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_now(MEMORY[0x263EFF910], v11, v12, v13);
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v38 = "-[SEMIndexSiteManager _performOperationAtAllIndexSites:shouldDefer:]";
    __int16 v39 = 2112;
    __int16 v40 = v10;
    __int16 v41 = 2112;
    __int16 v42 = v14;
    _os_log_impl(&dword_25C7CA000, v15, OS_LOG_TYPE_INFO, "%s Performing operation \"%@\" at all available index sites with date: %@", buf, 0x20u);
  }
  objc_msgSend__recordOperationTriggered_withDate_(self, v16, v4, (uint64_t)v14);
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 1;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = sub_25C7F8E84;
  v28[3] = &unk_2654DE5B8;
  id v17 = v6;
  id v30 = v17;
  uint64_t v31 = &v33;
  v28[4] = self;
  char v32 = v4;
  char v18 = v14;
  uint64_t v29 = v18;
  int v21 = objc_msgSend__enumerateAllIndexSiteWritersUsingBlock_(self, v19, (uint64_t)v28, v20);
  char v22 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    id v23 = @"Not all";
    int v24 = *((unsigned __int8 *)v34 + 24);
    if (v21) {
      id v23 = @"All";
    }
    uint64_t v25 = @"Completed at";
    *(_DWORD *)buf = 136315906;
    __int16 v38 = "-[SEMIndexSiteManager _performOperationAtAllIndexSites:shouldDefer:]";
    __int16 v40 = v23;
    __int16 v39 = 2112;
    __int16 v41 = 2112;
    if (!v24) {
      uint64_t v25 = @"Failed to complete at some";
    }
    __int16 v42 = v10;
    __int16 v43 = 2112;
    uint64_t v44 = v25;
    _os_log_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_INFO, "%s %@ index sites visited. Operation \"%@\" %@ available index sites", buf, 0x2Au);
  }
  BOOL v26 = *((unsigned char *)v34 + 24) != 0;

  _Block_object_dispose(&v33, 8);
  return v26;
}

- (BOOL)_performOperation:(unsigned __int8)a3 atIndexSite:(id)a4 shouldDefer:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = sub_25C7FBCF8(v6, v10, v11, v12);
  id v17 = objc_msgSend_now(MEMORY[0x263EFF910], v14, v15, v16);
  char v18 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v23 = 136315906;
    int v24 = "-[SEMIndexSiteManager _performOperation:atIndexSite:shouldDefer:]";
    __int16 v25 = 2112;
    BOOL v26 = v13;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v17;
    _os_log_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_INFO, "%s Performing operation \"%@\" at index site (%@) date: %@", (uint8_t *)&v23, 0x2Au);
  }
  objc_msgSend__recordOperationTriggered_withDate_(self, v19, v6, (uint64_t)v17);
  char shouldDefer = objc_msgSend__performOperation_atIndexSite_withDate_shouldDefer_(self, v20, v6, (uint64_t)v8, v17, v9);

  return shouldDefer;
}

- (void)_recordOperationTriggered:(unsigned __int8)a3 withDate:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v10 = sub_25C7FBCF8(v4, v7, v8, v9);
  managerInfo = self->_managerInfo;
  id v16 = 0;
  char v13 = objc_msgSend_writeUpdatedObject_forKey_error_(managerInfo, v12, (uint64_t)v6, (uint64_t)v10, &v16);
  id v14 = v16;
  if ((v13 & 1) == 0)
  {
    uint64_t v15 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      char v18 = "-[SEMIndexSiteManager _recordOperationTriggered:withDate:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      char v22 = v10;
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_error_impl(&dword_25C7CA000, v15, OS_LOG_TYPE_ERROR, "%s Failed to record date: %@ for operation \"%@\" in manager info: %@", buf, 0x2Au);
    }
  }
}

- (BOOL)_performOperation:(unsigned __int8)a3 atIndexSite:(id)a4 withDate:(id)a5 shouldDefer:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v16 = objc_msgSend_indexSite(v10, v13, v14, v15);
  uint64_t v20 = objc_msgSend_type(v16, v17, v18, v19);
  __int16 v23 = objc_msgSend__discoverAllSetsForIndexSiteType_(self, v21, v20, v22);

  if (v23)
  {
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = sub_25C7F9450;
    v38[3] = &unk_2654DE5E0;
    id v24 = v23;
    id v39 = v24;
    uint64_t v25 = (void *)MEMORY[0x2611949C0](v38);
    int shouldDefer = objc_msgSend_performOperation_updatedSets_allSetsBlock_shouldDefer_(v10, v26, v8, (uint64_t)v24, v25, v12);
    if (shouldDefer)
    {
      uint64_t v31 = sub_25C7FBCF8(v8, v27, v28, v29);
      id v37 = 0;
      char v33 = objc_msgSend_recordDate_ofOperation_error_(v10, v32, (uint64_t)v11, v8, &v37);
      id v34 = v37;
      if ((v33 & 1) == 0)
      {
        uint64_t v35 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          __int16 v41 = "-[SEMIndexSiteManager _performOperation:atIndexSite:withDate:shouldDefer:]";
          __int16 v42 = 2112;
          id v43 = v11;
          __int16 v44 = 2112;
          uint64_t v45 = v31;
          __int16 v46 = 2112;
          id v47 = v10;
          __int16 v48 = 2112;
          id v49 = v34;
          _os_log_error_impl(&dword_25C7CA000, v35, OS_LOG_TYPE_ERROR, "%s Failed to record date: %@ for operation \"%@\" at site (%@) in info log: %@", buf, 0x34u);
        }
      }
    }
  }
  else
  {
    LOBYTE(shouldDefer) = 0;
  }

  return shouldDefer;
}

- (BOOL)_performAnyDeferredOperationsAtIndexSite:(id)a3 outOperationPerformed:(unsigned __int8 *)a4 shouldDefer:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v12 = objc_msgSend__checkForDeferredOperationAtIndexSite_(self, v10, (uint64_t)v8, v11);
  uint64_t v13 = v12;
  if (a4) {
    *a4 = v12;
  }
  uint64_t v14 = qword_26B3549D8;
  BOOL v15 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      id v17 = v14;
      __int16 v21 = sub_25C7FBCF8(v13, v18, v19, v20);
      int v24 = 136315650;
      uint64_t v25 = "-[SEMIndexSiteManager _performAnyDeferredOperationsAtIndexSite:outOperationPerformed:shouldDefer:]";
      __int16 v26 = 2112;
      id v27 = v21;
      __int16 v28 = 2112;
      id v29 = v8;
      _os_log_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_INFO, "%s Performing deferred operation \"%@\" at index site (%@)", (uint8_t *)&v24, 0x20u);
    }
    char shouldDefer = objc_msgSend__performOperation_atIndexSite_shouldDefer_(self, v16, v13, (uint64_t)v8, v9);
  }
  else if (v15)
  {
    int v24 = 136315394;
    uint64_t v25 = "-[SEMIndexSiteManager _performAnyDeferredOperationsAtIndexSite:outOperationPerformed:shouldDefer:]";
    __int16 v26 = 2112;
    id v27 = v8;
    char shouldDefer = 1;
    _os_log_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_INFO, "%s Index site (%@) verified with no deferred operations", (uint8_t *)&v24, 0x16u);
  }
  else
  {
    char shouldDefer = 1;
  }

  return shouldDefer;
}

- (unsigned)_checkForDeferredOperationAtIndexSite:(id)a3
{
  id v4 = a3;
  __int16 v11 = 0;
  char v10 = 0;
  unsigned __int8 v7 = 0;
  if (objc_msgSend__checkLastDateOfOperation_isOverdue_atSite_(self, v5, 2, (uint64_t)&v11 + 1, v4))
  {
    if (objc_msgSend__checkLastDateOfOperation_isOverdue_atSite_(self, v6, 1, (uint64_t)&v11, v4)
      && objc_msgSend__checkLastDateOfOperation_isOverdue_atSite_(self, v8, 3, (uint64_t)&v10, v4))
    {
      if (HIBYTE(v11))
      {
        unsigned __int8 v7 = 2;
      }
      else if ((_BYTE)v11)
      {
        unsigned __int8 v7 = 1;
      }
      else if (v10)
      {
        unsigned __int8 v7 = 3;
      }
      else
      {
        unsigned __int8 v7 = 0;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_checkLastDateOfOperation:(unsigned __int8)a3 isOverdue:(BOOL *)a4 atSite:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a5;
  char v10 = v8;
  if (a4)
  {
    id v33 = 0;
    __int16 v11 = objc_msgSend_lastRecordedDateOfOperation_error_(v8, v9, v6, (uint64_t)&v33);
    id v12 = v33;
    uint64_t v18 = sub_25C7FBCF8(v6, v13, v14, v15);
    BOOL v19 = v12 == 0;
    if (v12)
    {
      uint64_t v20 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[SEMIndexSiteManager _checkLastDateOfOperation:isOverdue:atSite:]";
        __int16 v36 = 2112;
        id v37 = v10;
        __int16 v38 = 2112;
        id v39 = v18;
        __int16 v40 = 2112;
        id v41 = v12;
        _os_log_error_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_ERROR, "%s Failed to check last date at site (%@) for operation \"%@\" error: %@", buf, 0x2Au);
      }
      goto LABEL_21;
    }
    __int16 v21 = objc_msgSend_objectForKey_(self->_managerInfo, v16, (uint64_t)v18, v17);
    int v24 = v21;
    if (!v21)
    {
      id v29 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v35 = "-[SEMIndexSiteManager _checkLastDateOfOperation:isOverdue:atSite:]";
        __int16 v36 = 2112;
        id v37 = v18;
        _os_log_debug_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_DEBUG, "%s Manager info has no date for operation \"%@\"", buf, 0x16u);
      }
      *a4 = 0;
      goto LABEL_20;
    }
    if (v11)
    {
      if (objc_msgSend_compare_(v21, v22, (uint64_t)v11, v23) != 1)
      {
        *a4 = 0;
        uint64_t v31 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v35 = "-[SEMIndexSiteManager _checkLastDateOfOperation:isOverdue:atSite:]";
          __int16 v36 = 2112;
          id v37 = v10;
          __int16 v38 = 2112;
          id v39 = v18;
          __int16 v40 = 2112;
          id v41 = v11;
          __int16 v42 = 2112;
          id v43 = v24;
          _os_log_debug_impl(&dword_25C7CA000, v31, OS_LOG_TYPE_DEBUG, "%s Site (%@) performed operation \"%@\" at date: %@ (manager date: %@)", buf, 0x34u);
        }
        goto LABEL_20;
      }
      uint64_t v25 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v35 = "-[SEMIndexSiteManager _checkLastDateOfOperation:isOverdue:atSite:]";
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = v24;
        __int16 v40 = 2112;
        id v41 = v10;
        __int16 v42 = 2112;
        id v43 = v11;
        __int16 v26 = "%s Manager performed operation \"%@\" at date: %@ later than site (%@) date: %@";
        id v27 = v25;
        uint32_t v28 = 52;
LABEL_16:
        _os_log_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_INFO, v26, buf, v28);
      }
    }
    else
    {
      uint64_t v30 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[SEMIndexSiteManager _checkLastDateOfOperation:isOverdue:atSite:]";
        __int16 v36 = 2112;
        id v37 = v10;
        __int16 v38 = 2112;
        id v39 = v18;
        __int16 v40 = 2112;
        id v41 = v24;
        __int16 v26 = "%s Site (%@) has no recorded date for operation \"%@\" last performed by manager at date: %@";
        id v27 = v30;
        uint32_t v28 = 42;
        goto LABEL_16;
      }
    }
    *a4 = 1;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)_didRefreshSettings:(id)a3 skipMaintenance:(BOOL *)a4
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unsigned __int8 v7 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
    _os_log_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_INFO, "%s Refreshing Settings", (uint8_t *)&buf, 0xCu);
  }
  objc_msgSend_refresh(self->_settings, v8, v9, v10);
  int isAssistantEnabled = objc_msgSend_isAssistantEnabled(self->_settings, v11, v12, v13);
  uint64_t v17 = objc_msgSend_objectForKey_(self->_managerInfo, v15, @"assistantEnabled", v16);
  int v21 = objc_msgSend_BOOLValue(v17, v18, v19, v20);

  uint64_t v25 = objc_msgSend_localization(self->_settings, v22, v23, v24);
  objc_msgSend_siriLanguageCode(v25, v26, v27, v28);
  id v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v97 = 0x2020000000;
  char v98 = 1;
  uint64_t v30 = qword_26B3549D8;
  if (((isAssistantEnabled ^ 1 | v21) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v88 = 136315138;
      v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
      _os_log_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_INFO, "%s Assistant is now enabled. Reading all sets to initialize filesystem state", v88, 0xCu);
    }
    char shouldDefer = objc_msgSend__performOperationAtAllIndexSites_shouldDefer_(self, v46, 2, (uint64_t)v6);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      char v50 = shouldDefer;
    }
    else {
      char v50 = 0;
    }
    *(unsigned char *)(*((void *)&buf + 1) + 24) = v50;
    if (a4) {
      *a4 = 1;
    }
    managerInfo = self->_managerInfo;
    v52 = objc_msgSend_numberWithBool_(NSNumber, v48, 1, v49);
    v95[0] = v52;
    v95[1] = v29;
    v54 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v53, (uint64_t)v95, 2);
    v94[0] = @"assistantEnabled";
    v94[1] = @"siriLanguageCode";
    v56 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v55, (uint64_t)v94, 2);
    id v87 = 0;
    LOBYTE(managerInfo) = objc_msgSend_writeUpdatedObjects_forKeys_error_(managerInfo, v57, (uint64_t)v54, (uint64_t)v56, &v87);
    v58 = (__CFString *)v87;

    if ((managerInfo & 1) == 0)
    {
      v59 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v88 = 136315394;
        v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
        __int16 v90 = 2112;
        v91 = v58;
        _os_log_error_impl(&dword_25C7CA000, v59, OS_LOG_TYPE_ERROR, "%s Failed to update manager info: %@", v88, 0x16u);
      }
    }
    BOOL v60 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    goto LABEL_58;
  }
  if (isAssistantEnabled)
  {
LABEL_31:
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v61 = @"disabled";
      if (isAssistantEnabled) {
        v61 = @"enabled";
      }
      *(_DWORD *)v88 = 136315394;
      v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
      __int16 v90 = 2112;
      v91 = v61;
      _os_log_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_INFO, "%s Assistant enablement status unchanged (%@)", v88, 0x16u);
    }
    if (isAssistantEnabled)
    {
      v62 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v88 = 136315138;
        v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
        _os_log_impl(&dword_25C7CA000, v62, OS_LOG_TYPE_INFO, "%s Verifying localization", v88, 0xCu);
      }
      v65 = objc_msgSend_objectForKey_(self->_managerInfo, v63, @"siriLanguageCode", v64);
      char isEqual = objc_msgSend_isEqual_(v29, v66, (uint64_t)v65, v67);
      v69 = qword_26B3549D8;
      BOOL v70 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
      if (isEqual)
      {
        if (v70)
        {
          *(_DWORD *)v88 = 136315394;
          v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
          __int16 v90 = 2112;
          v91 = v29;
          BOOL v60 = 1;
          _os_log_impl(&dword_25C7CA000, v69, OS_LOG_TYPE_INFO, "%s Localization unchanged (%@)", v88, 0x16u);
        }
        else
        {
          BOOL v60 = 1;
        }
      }
      else
      {
        if (v70)
        {
          *(_DWORD *)v88 = 136315650;
          v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
          __int16 v90 = 2112;
          v91 = v29;
          __int16 v92 = 2112;
          v93 = v65;
          _os_log_impl(&dword_25C7CA000, v69, OS_LOG_TYPE_INFO, "%s Refreshed Siri language code setting (%@) differs from stored (%@)", v88, 0x20u);
        }
        char v72 = objc_msgSend__performOperationAtAllIndexSites_shouldDefer_(self, v71, 2, (uint64_t)v6);
        if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
          char v74 = v72;
        }
        else {
          char v74 = 0;
        }
        *(unsigned char *)(*((void *)&buf + 1) + 24) = v74;
        if (a4) {
          *a4 = 1;
        }
        v75 = self->_managerInfo;
        id v82 = 0;
        char v76 = objc_msgSend_writeUpdatedObject_forKey_error_(v75, v73, (uint64_t)v29, @"siriLanguageCode", &v82);
        v77 = (__CFString *)v82;
        if ((v76 & 1) == 0)
        {
          v78 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v88 = 136315394;
            v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
            __int16 v90 = 2112;
            v91 = v77;
            _os_log_error_impl(&dword_25C7CA000, v78, OS_LOG_TYPE_ERROR, "%s Failed to update manager info: %@", v88, 0x16u);
          }
        }
        BOOL v60 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
      }
    }
    else
    {
      BOOL v60 = 1;
      if (a4) {
        *a4 = 1;
      }
    }
    goto LABEL_58;
  }
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v88 = 136315138;
    v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
    _os_log_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_INFO, "%s Assistant is disabled.", v88, 0xCu);
  }
  if (!a4)
  {
    uint64_t v30 = qword_26B3549D8;
    goto LABEL_31;
  }
  if (v21)
  {
    uint64_t v31 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v88 = 136315138;
      v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
      _os_log_impl(&dword_25C7CA000, v31, OS_LOG_TYPE_INFO, "%s Assistant was previously enabled. Clearing any obsolete filesystem state", v88, 0xCu);
    }
    if (!objc_msgSend__resetManagerDirectory(self, v32, v33, v34))
    {
      BOOL v60 = 0;
      goto LABEL_58;
    }
    char v36 = objc_msgSend__performOperationAtAllIndexSites_shouldDefer_(self, v35, 4, (uint64_t)v6);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      char v39 = v36;
    }
    else {
      char v39 = 0;
    }
    *(unsigned char *)(*((void *)&buf + 1) + 24) = v39;
    __int16 v40 = self->_managerInfo;
    id v41 = objc_msgSend_numberWithBool_(NSNumber, v37, 0, v38);
    id v86 = 0;
    char v43 = objc_msgSend_writeUpdatedObject_forKey_error_(v40, v42, (uint64_t)v41, @"assistantEnabled", &v86);
    uint64_t v44 = (__CFString *)v86;

    if ((v43 & 1) == 0)
    {
      uint64_t v45 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v88 = 136315394;
        v89 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
        __int16 v90 = 2112;
        v91 = v44;
        _os_log_error_impl(&dword_25C7CA000, v45, OS_LOG_TYPE_ERROR, "%s Failed to update manager info: %@", v88, 0x16u);
      }
    }
  }
  else
  {
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = sub_25C7FA228;
    v83[3] = &unk_2654DE608;
    v83[4] = self;
    p_long long buf = &buf;
    id v84 = v6;
    objc_msgSend__enumerateAllIndexSiteWritersUsingBlock_(self, v79, (uint64_t)v83, v80);
  }
  *a4 = 1;
  BOOL v60 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
LABEL_58:
  _Block_object_dispose(&buf, 8);

  return v60;
}

- (BOOL)_performMaintenance:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SEMIndexSiteManager _performMaintenance:]";
    _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Starting maintenance", (uint8_t *)&buf, 0xCu);
  }
  char v17 = 0;
  char refreshed = objc_msgSend__didRefreshSettings_skipMaintenance_(self, v6, (uint64_t)v4, (uint64_t)&v17);
  if (v17)
  {
    BOOL v8 = refreshed;
    uint64_t v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[SEMIndexSiteManager _performMaintenance:]";
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s No further Maintenance is required after settings refresh", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x2020000000;
    char v22 = 1;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_25C7FA580;
    v14[3] = &unk_2654DE608;
    v14[4] = self;
    id v15 = v4;
    p_long long buf = &buf;
    objc_msgSend__enumerateAllIndexSiteWritersUsingBlock_(self, v10, (uint64_t)v14, v11);
    uint64_t v12 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v18 = 136315138;
      uint64_t v19 = "-[SEMIndexSiteManager _performMaintenance:]";
      _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Maintenance completed", v18, 0xCu);
    }
    BOOL v8 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }

  return v8;
}

- (BOOL)_rebuildAllStateWithSetEnumerator:(id)a3
{
  id v4 = (CCSetEnumerator *)a3;
  uint64_t v5 = self->_setEnumerator;
  setEnumerator = self->_setEnumerator;
  self->_setEnumerator = v4;
  unsigned __int8 v7 = v4;

  LOBYTE(setEnumerator) = objc_msgSend__performOperationAtAllIndexSites_shouldDefer_(self, v8, 2, 0);
  uint64_t v9 = self->_setEnumerator;
  self->_setEnumerator = v5;

  return (char)setEnumerator;
}

- (BOOL)_performAnyDeferredOperationsAtIndexSiteType:(unsigned __int8)a3 shouldDefer:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_msgSend__cachedWriterForIndexSiteType_(self, v7, v4, v8);
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    uint64_t v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      char v17 = "-[SEMIndexSiteManager _performAnyDeferredOperationsAtIndexSiteType:shouldDefer:]";
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s Checking for deferred operations at index site (%@)", (uint8_t *)&v16, 0x16u);
    }
    int shouldDefer = objc_msgSend__performAnyDeferredOperationsAtIndexSite_outOperationPerformed_shouldDefer_(self, v11, (uint64_t)v9, 0, v6);
    uint64_t v13 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = @"Did not complete";
      int v16 = 136315650;
      char v17 = "-[SEMIndexSiteManager _performAnyDeferredOperationsAtIndexSiteType:shouldDefer:]";
      __int16 v18 = 2112;
      if (shouldDefer) {
        uint64_t v14 = @"Completed";
      }
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_25C7CA000, v13, OS_LOG_TYPE_INFO, "%s %@ performing deferred operations at index site (%@)", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    LOBYTE(shouldDefer) = 0;
  }

  return shouldDefer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSiteCache, 0);
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_managerDirectory, 0);
}

@end