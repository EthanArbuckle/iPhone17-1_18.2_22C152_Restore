@interface SEMIndexSiteReadAccess
+ (BOOL)_isFileNotFoundError:(id)a3;
+ (id)defaultSharedInstance;
- (BOOL)setEntityPool:(id)a3 error:(id *)a4;
- (BOOL)supportsIndexSiteType:(unsigned __int8)a3;
- (SEMIndexSiteReadAccess)initWithIndexSiteCache:(id)a3 settings:(id)a4;
- (id)accessDescription;
- (id)ftsDatabaseReadAccessWithIndexSiteType:(unsigned __int8)a3;
- (id)skitReadAccessWithIndexSiteType:(unsigned __int8)a3;
- (void)reset;
@end

@implementation SEMIndexSiteReadAccess

+ (id)defaultSharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_25C7FB180;
  block[3] = &unk_2654DE1F8;
  block[4] = a1;
  if (qword_26B354A40 != -1) {
    dispatch_once(&qword_26B354A40, block);
  }
  v2 = (void *)qword_26B354A38;
  return v2;
}

- (SEMIndexSiteReadAccess)initWithIndexSiteCache:(id)a3 settings:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SEMIndexSiteReadAccess;
  v7 = [(SEMIndexSiteReadAccess *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_indexSiteCache, a3);
  }

  return v8;
}

- (void)reset
{
  objc_msgSend_enumerateIndexSitesUsingBlock_(self->_indexSiteCache, a2, (uint64_t)&unk_2709E0218, v2);
  indexSiteCache = self->_indexSiteCache;
  objc_msgSend_clear(indexSiteCache, v4, v5, v6);
}

+ (BOOL)_isFileNotFoundError:(id)a3
{
  v4 = objc_msgSend_underlyingErrors(a3, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_firstObject(v4, v5, v6, v7);

  v12 = objc_msgSend_domain(v8, v9, v10, v11);
  if (objc_msgSend_isEqual_(v12, v13, *MEMORY[0x263F07F70], v14)) {
    BOOL v18 = objc_msgSend_code(v8, v15, v16, v17) == 260;
  }
  else {
    BOOL v18 = 0;
  }

  return v18;
}

- (id)skitReadAccessWithIndexSiteType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  indexSiteCache = self->_indexSiteCache;
  id v36 = 0;
  uint64_t v6 = objc_msgSend_indexSiteWithType_error_(indexSiteCache, a2, a3, (uint64_t)&v36);
  uint64_t v7 = (__CFString *)v36;
  if (v6)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = sub_25C7FB6B8;
    v34 = &unk_2654DE680;
    id v8 = v6;
    id v35 = v8;
    v9 = (void (**)(void))MEMORY[0x2611949C0](&v31);
    if (objc_msgSend_isEvaluationEnabled(self->_settings, v10, v11, v12, v31, v32, v33, v34))
    {
      v13 = v9[2](v9);
      if (v13)
      {
LABEL_4:
        uint64_t v14 = v13;
LABEL_9:
        uint64_t v16 = v14;

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      BOOL v18 = NSStringFromClass(v17);
      v13 = objc_msgSend_cachedObjectForKey_initBlock_(v8, v19, (uint64_t)v18, (uint64_t)v9);

      if (v13) {
        goto LABEL_4;
      }
    }
    uint64_t v14 = objc_alloc_init(SEMSkitEmptyAccess);
    goto LABEL_9;
  }
  v15 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    v21 = v15;
    v25 = sub_25C7FBC68(v3, v22, v23, v24);
    v26 = objc_opt_class();
    int isFileNotFoundError = objc_msgSend__isFileNotFoundError_(v26, v27, (uint64_t)v7, v28);
    v30 = @"No such file.";
    *(_DWORD *)buf = 136315650;
    v38 = "-[SEMIndexSiteReadAccess skitReadAccessWithIndexSiteType:]";
    __int16 v39 = 2112;
    if (!isFileNotFoundError) {
      v30 = v7;
    }
    v40 = v25;
    __int16 v41 = 2112;
    v42 = v30;
    _os_log_error_impl(&dword_25C7CA000, v21, OS_LOG_TYPE_ERROR, "%s Failed to resolve index site (%@) - %@ Returning empty access", buf, 0x20u);
  }
  uint64_t v16 = objc_alloc_init(SEMSkitEmptyAccess);
LABEL_10:

  return v16;
}

- (BOOL)supportsIndexSiteType:(unsigned __int8)a3
{
  return (a3 - 1) < 2;
}

- (BOOL)setEntityPool:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accessDescription
{
  return @"Index";
}

- (id)ftsDatabaseReadAccessWithIndexSiteType:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  indexSiteCache = self->_indexSiteCache;
  id v36 = 0;
  uint64_t v6 = objc_msgSend_indexSiteWithType_error_(indexSiteCache, a2, a3, (uint64_t)&v36);
  uint64_t v7 = (__CFString *)v36;
  if (v6)
  {
    uint64_t v31 = MEMORY[0x263EF8330];
    uint64_t v32 = 3221225472;
    v33 = sub_25C7FBAC4;
    v34 = &unk_2654DE6A8;
    id v8 = v6;
    id v35 = v8;
    v9 = (void (**)(void))MEMORY[0x2611949C0](&v31);
    if (objc_msgSend_isEvaluationEnabled(self->_settings, v10, v11, v12, v31, v32, v33, v34))
    {
      v13 = v9[2](v9);
      if (v13)
      {
LABEL_4:
        uint64_t v14 = v13;
LABEL_9:
        uint64_t v16 = v14;

        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      BOOL v18 = NSStringFromClass(v17);
      v13 = objc_msgSend_cachedObjectForKey_initBlock_(v8, v19, (uint64_t)v18, (uint64_t)v9);

      if (v13) {
        goto LABEL_4;
      }
    }
    uint64_t v14 = objc_alloc_init(SEMDatabaseEmptyAccess);
    goto LABEL_9;
  }
  v15 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    v21 = v15;
    v25 = sub_25C7FBC68(v3, v22, v23, v24);
    v26 = objc_opt_class();
    int isFileNotFoundError = objc_msgSend__isFileNotFoundError_(v26, v27, (uint64_t)v7, v28);
    v30 = @"No such file.";
    *(_DWORD *)buf = 136315650;
    v38 = "-[SEMIndexSiteReadAccess ftsDatabaseReadAccessWithIndexSiteType:]";
    __int16 v39 = 2112;
    if (!isFileNotFoundError) {
      v30 = v7;
    }
    v40 = v25;
    __int16 v41 = 2112;
    v42 = v30;
    _os_log_error_impl(&dword_25C7CA000, v21, OS_LOG_TYPE_ERROR, "%s Failed to resolve index site (%@) - %@ Returning empty access", buf, 0x20u);
  }
  uint64_t v16 = objc_alloc_init(SEMDatabaseEmptyAccess);
LABEL_10:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSiteCache, 0);
}

@end