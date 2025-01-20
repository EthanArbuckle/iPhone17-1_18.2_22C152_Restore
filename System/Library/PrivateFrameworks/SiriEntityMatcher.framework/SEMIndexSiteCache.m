@interface SEMIndexSiteCache
- (NSURL)managerDirectory;
- (SEMIndexSiteCache)initWithManagerDirectory:(id)a3 readOnly:(BOOL)a4;
- (id)_loadIndexSiteDirectoryWithName:(id)a3 parentDirectory:(id)a4 error:(id *)a5;
- (id)cachedDefaultIndexSite:(id *)a3;
- (id)cachedUserVaultIndexSiteForCurrentPersona:(id *)a3;
- (id)indexSiteWithType:(unsigned __int8)a3 error:(id *)a4;
- (id)openUserVaultTransaction:(id *)a3 forPersonaIdentifier:(id)a4 error:(id *)a5;
- (void)_evictCachedUserVaultIndexSite:(id)a3;
- (void)clear;
- (void)enumerateIndexSitesUsingBlock:(id)a3;
- (void)indexSiteAvailableWithType:(unsigned __int8)a3;
- (void)indexSiteUnavailableSoonWithType:(unsigned __int8)a3;
- (void)indexSiteUnavailableWithType:(unsigned __int8)a3;
@end

@implementation SEMIndexSiteCache

- (SEMIndexSiteCache)initWithManagerDirectory:(id)a3 readOnly:(BOOL)a4
{
  id v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SEMIndexSiteCache;
  v8 = [(SEMIndexSiteCache *)&v20 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_managerDirectory, a3);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v15 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    v9->_readOnly = a4;
  }

  return v9;
}

- (id)indexSiteWithType:(unsigned __int8)a3 error:(id *)a4
{
  if (a3 == 2)
  {
    v5 = objc_msgSend_cachedUserVaultIndexSiteForCurrentPersona_(self, a2, (uint64_t)a4, (uint64_t)a4);
  }
  else if (a3 == 1)
  {
    v5 = objc_msgSend_cachedDefaultIndexSite_(self, a2, (uint64_t)a4, (uint64_t)a4);
  }
  else
  {
    v6 = NSString;
    id v7 = sub_25C7FBC68(a3, a2, a3, (uint64_t)a4);
    v10 = objc_msgSend_stringWithFormat_(v6, v8, @"Unexpected index site type: %@", v9, v7);
    id v11 = sub_25C7F5940(1u, v10, 0);
    v12 = v11;
    if (a4 && v11) {
      *a4 = v11;
    }

    v5 = 0;
  }
  return v5;
}

- (id)cachedDefaultIndexSite:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_25C7F55D4;
  v19 = sub_25C7F55E4;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_25C7F55D4;
  uint64_t v13 = sub_25C7F55E4;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7F5B60;
  block[3] = &unk_2654DE370;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(queue, block);
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5) {
      *a3 = v5;
    }
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (id)cachedUserVaultIndexSiteForCurrentPersona:(id *)a3
{
  v4 = sub_25C7F5940(1u, @"UserVault index sites not supported on this platform", 0);
  v5 = v4;
  if (a3 && v4) {
    *a3 = v4;
  }

  return 0;
}

- (id)openUserVaultTransaction:(id *)a3 forPersonaIdentifier:(id)a4 error:(id *)a5
{
  id v6 = sub_25C7F5940(1u, @"UserVault index sites not supported on this platform", 0);
  id v7 = v6;
  if (a5 && v6) {
    *a5 = v6;
  }

  return 0;
}

- (void)_evictCachedUserVaultIndexSite:(id)a3
{
}

- (id)_loadIndexSiteDirectoryWithName:(id)a3 parentDirectory:(id)a4 error:(id *)a5
{
  queue = self->_queue;
  id v9 = a4;
  id v10 = a3;
  dispatch_assert_queue_V2(queue);
  id v14 = objc_msgSend_path(v9, v11, v12, v13);

  uint64_t v17 = objc_msgSend_stringByAppendingPathComponent_(v14, v15, (uint64_t)v10, v16);

  v19 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v18, (uint64_t)v17, 1);
  v23 = v19;
  if (!self->_readOnly)
  {
    id v40 = 0;
    v33 = sub_25C7EFC30(v19, &v40);
    id v30 = v40;

    if (!v33)
    {
      v32 = objc_msgSend_stringWithFormat_(NSString, v34, @"Failed to create directory at path %@", v35, v17);
      v37 = sub_25C7F5940(3u, v32, v30);
      v38 = v37;
      if (a5 && v37) {
        *a5 = v37;
      }

      goto LABEL_13;
    }

LABEL_8:
    id v36 = v23;
    goto LABEL_14;
  }
  v24 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v20, v21, v22);
  char v27 = objc_msgSend_fileExistsAtPath_(v24, v25, (uint64_t)v17, v26);

  if (v27) {
    goto LABEL_8;
  }
  objc_msgSend_stringWithFormat_(NSString, v28, @"Read only: directory not found at path %@", v29, v17);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  v31 = sub_25C7F5940(2u, v30, 0);
  v32 = v31;
  if (a5 && v31) {
    *a5 = v31;
  }
LABEL_13:

  id v36 = 0;
LABEL_14:

  return v36;
}

- (void)clear
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7F5F54;
  block[3] = &unk_2654DE398;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)enumerateIndexSitesUsingBlock:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SEMIndexSiteCache enumerateIndexSitesUsingBlock:]";
      _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Enumerating index site cache", buf, 0xCu);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = sub_25C7F608C;
    v7[3] = &unk_2654DDE80;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)indexSiteUnavailableSoonWithType:(unsigned __int8)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    objc_msgSend__cachedUserVaultIndexSiteForCurrentPersonaIfExists_(self, a2, (uint64_t)&unk_2709E01D8, v3);
  }
  else
  {
    unsigned int v4 = a3;
    v5 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      id v10 = sub_25C7FBC68(v4, v7, v8, v9);
      int v11 = 136315394;
      uint64_t v12 = "-[SEMIndexSiteCache indexSiteUnavailableSoonWithType:]";
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_error_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_ERROR, "%s Index site type (%@) not expected to have variable availability", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)indexSiteUnavailableWithType:(unsigned __int8)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_25C7F65C0;
    v11[3] = &unk_2654DE3E0;
    v11[4] = self;
    objc_msgSend__cachedUserVaultIndexSiteForCurrentPersonaIfExists_(self, a2, (uint64_t)v11, v3);
  }
  else
  {
    unsigned int v4 = a3;
    v5 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      id v10 = sub_25C7FBC68(v4, v7, v8, v9);
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[SEMIndexSiteCache indexSiteUnavailableWithType:]";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_ERROR, "%s Index site type (%@) not expected to have variable availability", buf, 0x16u);
    }
  }
}

- (void)indexSiteAvailableWithType:(unsigned __int8)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = sub_25C7F6700;
    v11[3] = &unk_2654DE3E0;
    v11[4] = self;
    objc_msgSend__cachedUserVaultIndexSiteForCurrentPersonaIfExists_(self, a2, (uint64_t)v11, v3);
  }
  else
  {
    unsigned int v4 = a3;
    v5 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      id v10 = sub_25C7FBC68(v4, v7, v8, v9);
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[SEMIndexSiteCache indexSiteAvailableWithType:]";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_error_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_ERROR, "%s Index site type (%@) not expected to have variable availability", buf, 0x16u);
    }
  }
}

- (NSURL)managerDirectory
{
  return self->_managerDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerDirectory, 0);
  objc_storeStrong((id *)&self->_defaultIndexSite, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end