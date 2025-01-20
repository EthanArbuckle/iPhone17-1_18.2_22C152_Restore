@interface APOdmlAllowList
+ (id)sharedInstance;
- (APOdmlAllowList)init;
- (BOOL)isAllowed:(id)a3;
- (NSSet)allowList;
- (unint64_t)count;
- (void)reinitializeAllowList;
- (void)setAllowList:(id)a3;
@end

@implementation APOdmlAllowList

- (void)reinitializeAllowList
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  v6 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v5, 0, 0);

  v8 = objc_msgSend_pathForFactor_isDirectory_(v6, v7, @"AllowList", 0);
  if (v8)
  {
    v9 = objc_alloc_init(APOdmlAllowListReader);
    objc_msgSend_openForReadingContentsOfURL_(v9, v10, (uint64_t)v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = OdmlLogForCategory(7uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v25 = 138412546;
        *(void *)&v25[4] = objc_opt_class();
        *(_WORD *)&v25[12] = 2112;
        *(void *)&v25[14] = v13;
        id v15 = *(id *)&v25[4];
        _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "[%@] Error initializing AllowList: %@", v25, 0x16u);
      }
      objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v16, (uint64_t)v13, 0);
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    else
    {
      objc_msgSend_readFile(v9, v11, v12);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v17;
    objc_msgSend_setAllowList_(self, v18, (uint64_t)v17, *(_OWORD *)v25, *(void *)&v25[16]);
  }
  else
  {
    v19 = OdmlLogForCategory(7uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 138412290;
      *(void *)&v25[4] = objc_opt_class();
      id v20 = *(id *)&v25[4];
      _os_log_impl(&dword_1BBC44000, v19, OS_LOG_TYPE_ERROR, "[%@] Bad path for AllowList asset.", v25, 0xCu);
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v21, @"APOdmlRerankingErrorDomain", 3004, 0);
    v9 = (APOdmlAllowListReader *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsReranking, v22, (uint64_t)v9, 0);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    objc_msgSend_setAllowList_(self, v23, (uint64_t)v13);
  }
}

- (void)setAllowList:(id)a3
{
}

- (APOdmlAllowList)init
{
  v7.receiver = self;
  v7.super_class = (Class)APOdmlAllowList;
  uint64_t v2 = [(APOdmlAllowList *)&v7 init];
  v5 = v2;
  if (v2) {
    objc_msgSend_reinitializeAllowList(v2, v3, v4);
  }
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1EB9F9810 != -1) {
    dispatch_once(&qword_1EB9F9810, &unk_1F14FE7B8);
  }
  uint64_t v2 = (void *)qword_1EB9F98C8;

  return v2;
}

- (BOOL)isAllowed:(id)a3
{
  id v4 = a3;
  objc_super v7 = objc_msgSend_allowList(self, v5, v6);
  char v9 = objc_msgSend_containsObject_(v7, v8, (uint64_t)v4);

  return v9;
}

- (unint64_t)count
{
  v3 = objc_msgSend_allowList(self, a2, v2);
  unint64_t v6 = objc_msgSend_count(v3, v4, v5);

  return v6;
}

- (NSSet)allowList
{
  return self->_allowList;
}

- (void).cxx_destruct
{
}

@end