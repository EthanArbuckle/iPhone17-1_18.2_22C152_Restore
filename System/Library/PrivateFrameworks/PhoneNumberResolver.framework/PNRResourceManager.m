@interface PNRResourceManager
+ (id)sharedManager;
- (BOOL)_lookupString:(id)a3 inTrieMemory:(void *)a4 value:(unsigned int *)a5;
- (PNRResourceManager)init;
- (id)_assetQueryForPNRResource:(id)a3;
- (id)_getDataFrom:(id)a3 zeroCacheCost:(BOOL)a4 logId:(id)a5;
- (id)_lastCatalogLoadTime;
- (void)_URLForInstalledResourceOfType:(id)a3 logId:(id)a4 resultBlock:(id)a5;
- (void)_bestStringForInCountryPhoneNumber:(id)a3 phoneNumberCC:(id)a4 countryOfDevice:(id)a5 countryTrieData:(id)a6 countryStrings:(id)a7 logId:(id)a8 resultBlock:(id)a9;
- (void)_catalogDownloadFinishedWithResult:(int64_t)a3;
- (void)_openLatestAssetWithBasename:(id)a3 maType:(id)a4 logId:(id)a5 resultBlock:(id)a6;
- (void)_setLastCatalogLoadTime:(id)a3;
- (void)_updateCatalog;
- (void)_updateCatalogAfterDelay:(double)a3;
- (void)catalogLoadThen:(id)a3;
- (void)dealloc;
- (void)lookupCCForPhoneNumber:(id)a3 logId:(id)a4 withResult:(id)a5;
- (void)lookupISOCountryCodeFromNANPNumber:(id)a3 logId:(id)a4 withResult:(id)a5;
- (void)lookupStringForPhoneNumber:(id)a3 inCC:(id)a4 countryCodeOfDevice:(id)a5 logId:(id)a6 withResult:(id)a7;
- (void)openCountryCodeFileUsingLogId:(id)a3 withResult:(id)a4;
- (void)openNANPFileUsingLogId:(id)a3 withResult:(id)a4;
- (void)openPNRFilesForPrefix:(id)a3 logId:(id)a4 withResult:(id)a5;
@end

@implementation PNRResourceManager

- (void)lookupCCForPhoneNumber:(id)a3 logId:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__PNRResourceManager_lookupCCForPhoneNumber_logId_withResult___block_invoke;
  v12[3] = &unk_264D9F498;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  id v10 = v8;
  id v11 = v9;
  [(PNRResourceManager *)self openCountryCodeFileUsingLogId:a4 withResult:v12];
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

void __61__PNRResourceManager_openPNRFilesForPrefix_logId_withResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v7 = (void *)[[NSString alloc] initWithFormat:@"%@.pnr", *(void *)(a1 + 32)];
    id v8 = [v14 URLByAppendingPathComponent:v7];
    if (v8
      && ([*(id *)(a1 + 40) _getDataFrom:v8 zeroCacheCost:0 logId:*(void *)(a1 + 48)],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = (void *)v9;
      id v11 = (void *)[[NSString alloc] initWithFormat:@"%@.pnrs", *(void *)(a1 + 32)];
      v12 = [v14 URLByAppendingPathComponent:v11];
      id v13 = [*(id *)(a1 + 40) _getDataFrom:v12 zeroCacheCost:0 logId:*(void *)(a1 + 48)];
      if (v13)
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        v6 = 0;
      }
      else
      {
        v6 = [MEMORY[0x263F087E8] _PNRAssetUnavailableErrorWithUserInfo:&unk_26ECC8CE0];
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      v6 = [MEMORY[0x263F087E8] _PNRAssetUnavailableErrorWithUserInfo:&unk_26ECC8CB8];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

uint64_t __91__PNRResourceManager_lookupStringForPhoneNumber_inCC_countryCodeOfDevice_logId_withResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return [*(id *)(a1 + 32) _bestStringForInCountryPhoneNumber:*(void *)(a1 + 40) phoneNumberCC:*(void *)(a1 + 48) countryOfDevice:*(void *)(a1 + 56) countryTrieData:a2 countryStrings:a3 logId:*(void *)(a1 + 64) resultBlock:*(void *)(a1 + 72)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);

  return v4();
}

- (void)lookupISOCountryCodeFromNANPNumber:(id)a3 logId:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__PNRResourceManager_lookupISOCountryCodeFromNANPNumber_logId_withResult___block_invoke;
  v12[3] = &unk_264D9F498;
  id v13 = v8;
  id v14 = v9;
  v12[4] = self;
  id v10 = v8;
  id v11 = v9;
  [(PNRResourceManager *)self openNANPFileUsingLogId:a4 withResult:v12];
}

- (void)openPNRFilesForPrefix:(id)a3 logId:(id)a4 withResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__PNRResourceManager_openPNRFilesForPrefix_logId_withResult___block_invoke;
  v14[3] = &unk_264D9F4E8;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(PNRResourceManager *)self _URLForInstalledResourceOfType:v12 logId:v11 resultBlock:v14];
}

- (void)_openLatestAssetWithBasename:(id)a3 maType:(id)a4 logId:(id)a5 resultBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__PNRResourceManager__openLatestAssetWithBasename_maType_logId_resultBlock___block_invoke;
  v18[3] = &unk_264D9F470;
  id v19 = v10;
  v20 = self;
  id v22 = v11;
  id v23 = v13;
  id v21 = v12;
  id v14 = v11;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  [(PNRResourceManager *)self _URLForInstalledResourceOfType:v14 logId:v16 resultBlock:v18];
}

- (id)_getDataFrom:(id)a3 zeroCacheCost:(BOOL)a4 logId:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  log = self->_log;
  if (v8)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[PNRResourceManager _getDataFrom:zeroCacheCost:logId:]();
    }
    uint64_t v11 = [(NSCache *)self->_fileDataCache objectForKey:v8];
    if (v11)
    {
      id v12 = (void *)v11;
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[PNRResourceManager _getDataFrom:zeroCacheCost:logId:]();
      }
      id v13 = v12;
      goto LABEL_21;
    }
    [v8 startAccessingSecurityScopedResource];
    id v23 = 0;
    id v14 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8 options:1 error:&v23];
    id v15 = v23;
    [v8 stopAccessingSecurityScopedResource];
    if (v15 && (id v16 = self->_log, os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v9;
      __int16 v26 = 2114;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v15;
      _os_log_error_impl(&dword_23974B000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] failed to read file contents at %{public}@ : %{public}@", buf, 0x20u);
      if (v14) {
        goto LABEL_14;
      }
    }
    else if (v14)
    {
LABEL_14:
      if (a4) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = [v14 length];
      }
      id v18 = self->_log;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = NSNumber;
        v20 = v18;
        id v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
        *(_DWORD *)buf = 138544130;
        id v25 = v9;
        __int16 v26 = 2114;
        id v27 = v21;
        __int16 v28 = 2114;
        id v29 = v8;
        __int16 v30 = 2050;
        uint64_t v31 = v17;
        _os_log_impl(&dword_23974B000, v20, OS_LOG_TYPE_INFO, "[%{public}@] cached data of size %{public}@ with key %{public}@ and cost %{public}lu", buf, 0x2Au);
      }
      [(NSCache *)self->_fileDataCache setObject:v14 forKey:v8 cost:v17];
    }
    id v13 = v14;

LABEL_21:
    goto LABEL_22;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl(&dword_23974B000, log, OS_LOG_TYPE_INFO, "[%{public}@] fileURL is nil; no data for you", buf, 0xCu);
  }
  id v13 = 0;
LABEL_22:

  return v13;
}

- (void)_URLForInstalledResourceOfType:(id)a3 logId:(id)a4 resultBlock:(id)a5
{
  v66[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v43 = a4;
  v41 = (void (**)(id, void, void *))a5;
  id v9 = [(NSCache *)self->_maURLCache objectForKey:v8];
  if (!v9)
  {
    v38 = [(PNRResourceManager *)self _assetQueryForPNRResource:v8];
    if ([v38 queryMetaDataSync])
    {
      id v10 = (void *)MEMORY[0x263F087E8];
      v65 = @"queryResult";
      uint64_t v11 = MEMORY[0x23ECA3BD0]();
      v66[0] = v11;
      id v12 = [NSDictionary dictionaryWithObjects:v66 forKeys:&v65 count:1];
      v40 = [v10 _PNRAssetQueryErrorWithUserInfo:v12];

      v41[2](v41, 0, v40);
LABEL_5:
      id v9 = 0;
LABEL_39:

      goto LABEL_40;
    }
    id v13 = [v38 results];

    if (!v13)
    {
      uint64_t v31 = (void *)MEMORY[0x263F087E8];
      v63[0] = @"queryResult";
      uint64_t v32 = MEMORY[0x23ECA3BD0](0);
      v63[1] = @"results";
      v64[0] = v32;
      v64[1] = @"none";
      v33 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];
      v40 = [v31 _PNRAssetQueryErrorWithUserInfo:v33];

      v41[2](v41, 0, v40);
      goto LABEL_5;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = [v38 results];
    uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v14)
    {
      v40 = 0;
      os_unfair_lock_t lock = &self->_downloadsInflightLock;
      uint64_t v15 = *(void *)v51;
      id v16 = @"Unknown";
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v19 = [v18 attributes];
          uint64_t v20 = [v19 objectForKeyedSubscript:@"Build"];
          id v21 = (void *)v20;
          id v22 = @"Unknown";
          if (v20) {
            id v22 = (__CFString *)v20;
          }
          id v23 = v22;

          id v16 = v23;
          if ([v18 state] == 1)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543874;
              id v57 = v43;
              __int16 v58 = 2114;
              id v59 = v8;
              __int16 v60 = 2114;
              v61 = v23;
              _os_log_impl(&dword_23974B000, log, OS_LOG_TYPE_INFO, "[%{public}@] asset %{public}@/%{public}@ not present", buf, 0x20u);
            }
            os_unfair_lock_lock(lock);
            if ([(NSMutableSet *)self->_downloadsInflight containsObject:v8])
            {
              id v25 = self->_log;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                id v57 = v43;
                __int16 v58 = 2114;
                id v59 = v8;
                __int16 v60 = 2114;
                v61 = v23;
                _os_log_impl(&dword_23974B000, v25, OS_LOG_TYPE_INFO, "[%{public}@] download of asset %{public}@/%{public}@ is already inflight", buf, 0x20u);
              }
            }
            else
            {
              id v27 = objc_alloc_init(MEMORY[0x263F559B8]);
              [v27 setAllowsCellularAccess:1];
              [v27 setAllowsExpensiveAccess:1];
              [v27 setDiscretionary:0];
              objc_initWeak(&location, self);
              v44[0] = MEMORY[0x263EF8330];
              v44[1] = 3221225472;
              v44[2] = __71__PNRResourceManager__URLForInstalledResourceOfType_logId_resultBlock___block_invoke;
              v44[3] = &unk_264D9F510;
              objc_copyWeak(&v48, &location);
              id v28 = v8;
              id v45 = v28;
              id v29 = v23;
              v46 = v29;
              v47 = v18;
              [v18 startDownload:v27 then:v44];
              [(NSMutableSet *)self->_downloadsInflight addObject:v28];
              __int16 v30 = self->_log;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543874;
                id v57 = v43;
                __int16 v58 = 2114;
                id v59 = v8;
                __int16 v60 = 2114;
                v61 = v29;
                _os_log_impl(&dword_23974B000, v30, OS_LOG_TYPE_INFO, "[%{public}@] download of asset %{public}@/%{public}@ has been requested", buf, 0x20u);
              }

              objc_destroyWeak(&v48);
              objc_destroyWeak(&location);
            }
            os_unfair_lock_unlock(lock);
          }
          else
          {
            if ([v18 state] == 2)
            {
              id v34 = v18;

              v40 = v34;
              goto LABEL_32;
            }
            if ([v18 state] == 3)
            {
              id v26 = v18;

              v40 = v26;
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v14) {
          continue;
        }
        break;
      }
LABEL_32:

      if (v40)
      {
        id v9 = [v40 getLocalFileUrl];
        if (v9) {
          [(NSCache *)self->_maURLCache setObject:v9 forKey:v8];
        }
        ((void (**)(id, void *, void *))v41)[2](v41, v9, 0);
        goto LABEL_38;
      }
    }
    else
    {

      id v16 = @"Unknown";
    }
    v35 = (void *)MEMORY[0x263F087E8];
    v54[0] = @"type";
    v54[1] = @"build";
    v55[0] = v8;
    v55[1] = v16;
    v36 = [NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    v37 = [v35 _PNRAssetUnavailableErrorWithUserInfo:v36];

    v41[2](v41, 0, v37);
    v40 = 0;
    id v9 = 0;
LABEL_38:

    goto LABEL_39;
  }
  ((void (**)(id, void *, void *))v41)[2](v41, v9, 0);
LABEL_40:
}

- (id)_assetQueryForPNRResource:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F55950];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithType:@"com.apple.MobileAsset.phoneNumberResolver"];
  [v5 returnTypes:2];
  [v5 setDoNotBlockBeforeFirstUnlock:1];
  [v5 addKeyValuePair:@"PNRResource" with:v4];

  [v5 addKeyValuePair:@"FormatVersion" with:@"1"];

  return v5;
}

void __76__PNRResourceManager__openLatestAssetWithBasename_maType_logId_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [NSString stringWithFormat:@"%@.pnr", *(void *)(a1 + 32)];
    id v8 = [v5 URLByAppendingPathComponent:v7];
    uint64_t v9 = [*(id *)(a1 + 40) _getDataFrom:v8 zeroCacheCost:1 logId:*(void *)(a1 + 48)];
    if (v9)
    {
      id v10 = (void *)v9;
      goto LABEL_6;
    }
  }
  v7 = [NSString stringWithFormat:@"%@-default", *(void *)(a1 + 32)];
  uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v11 URLForResource:v7 withExtension:@"pnr"];

  id v10 = [*(id *)(a1 + 40) _getDataFrom:v8 zeroCacheCost:1 logId:*(void *)(a1 + 48)];
  if (!v10)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *(void *)(a1 + 56);
    id v16 = @"type";
    v17[0] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v15 = [v12 _PNRAssetUnavailableErrorWithUserInfo:v14];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_8;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_8:
}

void __74__PNRResourceManager_lookupISOCountryCodeFromNANPNumber_logId_withResult___block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  v14[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    id v5 = (_DWORD *)[a2 bytes];
    if (*v5 == 1347305806)
    {
      char v12 = 0;
      int v11 = 0;
      if ([*(id *)(a1 + 32) _lookupString:*(void *)(a1 + 40) inTrieMemory:v5 + 8 value:&v11])
      {
        uint64_t v10 = *(void *)(a1 + 48);
        id v6 = [NSString stringWithCString:&v11 encoding:1];
        (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v6, 0);
      }
      else
      {
        id v6 = [MEMORY[0x263F087E8] _PNRNotFoundErrorWithUserInfo:&unk_26ECC8C40];
        (*(void (**)(void, void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v6);
      }
    }
    else
    {
      id v6 = (void *)[[NSString alloc] initWithBytes:v5 length:4 encoding:1];
      v7 = (void *)MEMORY[0x263F087E8];
      v13[0] = @"expected";
      v13[1] = @"found";
      v14[0] = @"NANP";
      v14[1] = v6;
      id v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
      uint64_t v9 = [v7 _PNRBadMagicErrorWithUserInfo:v8];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __62__PNRResourceManager_lookupCCForPhoneNumber_logId_withResult___block_invoke(uint64_t a1, id a2, uint64_t a3)
{
  void v13[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    id v5 = (_DWORD *)[a2 bytes];
    if (*v5 == 1329811267)
    {
      unsigned int v11 = 0;
      if ([*(id *)(a1 + 32) _lookupString:*(void *)(a1 + 40) inTrieMemory:v5 + 8 value:&v11])
      {
        uint64_t v10 = *(void *)(a1 + 48);
        id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v11);
        (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v6, 0);
      }
      else
      {
        id v6 = [MEMORY[0x263F087E8] _PNRNotFoundErrorWithUserInfo:&unk_26ECC8C18];
        (*(void (**)(void, void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, v6);
      }
    }
    else
    {
      id v6 = (void *)[[NSString alloc] initWithBytes:v5 length:4 encoding:1];
      v7 = (void *)MEMORY[0x263F087E8];
      v12[0] = @"expected";
      v12[1] = @"found";
      v13[0] = @"COCO";
      v13[1] = v6;
      id v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
      uint64_t v9 = [v7 _PNRBadMagicErrorWithUserInfo:v8];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (BOOL)_lookupString:(id)a3 inTrieMemory:(void *)a4 value:(unsigned int *)a5
{
  id v6 = a3;
  uint64_t v7 = CFBurstTrieCreateFromMapBytes();
  if (v7)
  {
    if (CFBurstTrieCreateCursorForBytes())
    {
      id v8 = (unsigned char *)[v6 UTF8String];
      if (*v8)
      {
        uint64_t v9 = v8;
        char v10 = 0;
        do
        {
          if (!CFBurstTrieCursorAdvanceForBytes()) {
            break;
          }
          if (CFBurstTrieCursorGetPayload())
          {
            *a5 = 0;
            char v10 = 1;
          }
        }
        while (*++v9);
      }
      else
      {
        char v10 = 0;
      }
      CFBurstTrieCursorRelease();
    }
    else
    {
      char v10 = 0;
    }
    CFBurstTrieRelease();
    LOBYTE(v7) = v10 & 1;
  }

  return v7;
}

- (void)lookupStringForPhoneNumber:(id)a3 inCC:(id)a4 countryCodeOfDevice:(id)a5 logId:(id)a6 withResult:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __91__PNRResourceManager_lookupStringForPhoneNumber_inCC_countryCodeOfDevice_logId_withResult___block_invoke;
  v22[3] = &unk_264D9F4C0;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v16;
  [(PNRResourceManager *)self openPNRFilesForPrefix:v19 logId:v17 withResult:v22];
}

- (void)openNANPFileUsingLogId:(id)a3 withResult:(id)a4
{
}

- (void)openCountryCodeFileUsingLogId:(id)a3 withResult:(id)a4
{
}

- (id)_lastCatalogLoadTime
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 valueForKey:@"PNRltc"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_catalogLoadRetryMultiplier = 0;
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (PNRResourceManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)PNRResourceManager;
  v2 = [(PNRResourceManager *)&v14 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.PhoneNumberResolver", "ResourceManager");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = [(PNRResourceManager *)v2 _lastCatalogLoadTime];
    lastCatalogLoadTime = v2->_lastCatalogLoadTime;
    v2->_lastCatalogLoadTime = (NSDate *)v5;

    v2->_catalogLoadRetryMultiplier = 0;
    uint64_t v7 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    fileDataCache = v2->_fileDataCache;
    v2->_fileDataCache = v7;

    [(NSCache *)v2->_fileDataCache setTotalCostLimit:10485760];
    [(NSCache *)v2->_fileDataCache setName:@"PNR data cache"];
    uint64_t v9 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    maURLCache = v2->_maURLCache;
    v2->_maURLCache = v9;

    [(NSCache *)v2->_maURLCache setName:@"MA URL cache"];
    unsigned int v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    downloadsInflight = v2->_downloadsInflight;
    v2->_downloadsInflight = v11;

    v2->_downloadsInflightLock._os_unfair_lock_opaque = 0;
    [(PNRResourceManager *)v2 _updateCatalog];
  }
  return v2;
}

uint64_t __35__PNRResourceManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(PNRResourceManager);

  return MEMORY[0x270F9A758]();
}

- (void)_updateCatalog
{
  id v3 = objc_alloc_init(MEMORY[0x263F559B8]);
  [v3 setAllowsCellularAccess:1];
  [v3 setAllowsExpensiveAccess:1];
  id v4 = [(PNRResourceManager *)self _lastCatalogLoadTime];
  [v3 setDiscretionary:v4 != 0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__PNRResourceManager__updateCatalog__block_invoke;
  v5[3] = &unk_264D9F560;
  v5[4] = self;
  [MEMORY[0x263F55938] startCatalogDownload:@"com.apple.MobileAsset.phoneNumberResolver" options:v3 then:v5];
}

- (void)dealloc
{
  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)PNRResourceManager;
  [(PNRResourceManager *)&v3 dealloc];
}

- (void)_bestStringForInCountryPhoneNumber:(id)a3 phoneNumberCC:(id)a4 countryOfDevice:(id)a5 countryTrieData:(id)a6 countryStrings:(id)a7 logId:(id)a8 resultBlock:(id)a9
{
  v179[2] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = (unsigned int *)a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = v17;
  id v22 = (_DWORD *)[v21 bytes];
  if (!v22)
  {
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = &unk_26ECC8C68;
LABEL_6:
    id v24 = [v31 _PNRAssetUnavailableErrorWithUserInfo:v32];
LABEL_7:
    (*((void (**)(id, void, void, void *))v20 + 2))(v20, 0, 0, v24);
    goto LABEL_8;
  }
  id v23 = v22;
  if (*v22 != 1380864110)
  {
    id v24 = (void *)[[NSString alloc] initWithBytes:v22 length:4 encoding:1];
    id v25 = (void *)MEMORY[0x263F087E8];
    v178[0] = @"expected";
    v178[1] = @"found";
    v179[0] = @"nPNR";
    v179[1] = v24;
    id v26 = NSDictionary;
    id v27 = v179;
    id v28 = v178;
LABEL_4:
    id v29 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:2];
    __int16 v30 = [v25 _PNRBadMagicErrorWithUserInfo:v29];

    (*((void (**)(id, void, void, void *))v20 + 2))(v20, 0, 0, v30);
    goto LABEL_8;
  }
  id v130 = v18;
  v33 = (_DWORD *)[v130 bytes];
  if (!v33)
  {
    uint64_t v31 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = &unk_26ECC8C90;
    goto LABEL_6;
  }
  id v34 = v33;
  if (*v33 != 1397902928)
  {
    id v24 = (void *)[[NSString alloc] initWithBytes:v33 length:4 encoding:1];
    id v25 = (void *)MEMORY[0x263F087E8];
    v176[0] = @"expected";
    v176[1] = @"found";
    v177[0] = @"PNRS";
    v177[1] = v24;
    id v26 = NSDictionary;
    id v27 = v177;
    id v28 = v176;
    goto LABEL_4;
  }
  unsigned int v148 = 0;
  if (![(PNRResourceManager *)self _lookupString:v14 inTrieMemory:(char *)v23 + 34 value:&v148])
  {
    v108 = (void *)MEMORY[0x263F087E8];
    v174[0] = @"type";
    v174[1] = @"resource";
    v175[0] = @"trie";
    v175[1] = v15;
    v109 = [NSDictionary dictionaryWithObjects:v175 forKeys:v174 count:2];
    id v24 = [v108 _PNRNotFoundErrorWithUserInfo:v109];

    goto LABEL_7;
  }
  id v122 = v15;
  id v123 = v20;
  id v117 = v18;
  v118 = v21;
  id v120 = v19;
  v121 = v16;
  id v119 = v14;
  uint64_t v35 = v34[9];
  v36 = [MEMORY[0x263EFF980] arrayWithCapacity:v35];
  v37 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v35];
  if (v35)
  {
    v38 = (const char *)(v34 + 10);
    do
    {
      LODWORD(v35) = v35 - 1;
      v39 = [NSString stringWithUTF8String:v38];
      [v36 addObject:v39];
      v40 = [NSNumber numberWithInt:*(unsigned int *)&v38[strlen(v38) + 1]];
      [v37 setObject:v40 forKey:v39];

      v38 += strlen(v38) + 5;
    }
    while (v35);
  }
  v116 = v36;
  v41 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];
  v115 = v37;
  v128 = [NSDictionary dictionaryWithDictionary:v37];
  v42 = +[PNRUtils _preferredLanguages];
  id v43 = [MEMORY[0x263EFF980] array];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v44 = v42;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v144 objects:v173 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v145;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v145 != v47) {
          objc_enumerationMutation(v44);
        }
        v49 = (void *)MEMORY[0x263EFF960];
        uint64_t v172 = *(void *)(*((void *)&v144 + 1) + 8 * i);
        long long v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v172 count:1];
        long long v51 = [v49 mostPreferredLanguageOf:v41 withPreferredLanguages:v50 forUsage:1 options:0];

        if (v51) {
          [v43 addObject:v51];
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v144 objects:v173 count:16];
    }
    while (v46);
  }

  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id obj = v43;
  uint64_t v127 = [obj countByEnumeratingWithState:&v140 objects:v171 count:16];
  if (!v127)
  {
    v125 = 0;
    long long v52 = 0;
    goto LABEL_112;
  }
  long long v52 = 0;
  v125 = 0;
  uint64_t v126 = *(void *)v141;
  v114 = v152;
  do
  {
    uint64_t v53 = 0;
    do
    {
      v133 = v52;
      if (*(void *)v141 != v126) {
        objc_enumerationMutation(obj);
      }
      uint64_t v132 = v53;
      v54 = *(void **)(*((void *)&v140 + 1) + 8 * v53);
      unint64_t v55 = v148;
      id v56 = v130;
      uint64_t v57 = [v56 bytes];
      uint64_t v58 = [v56 length];
      unint64_t v59 = v57 + v58;
      __int16 v60 = [v128 objectForKey:v54];
      uint64_t v61 = v57 + [v60 unsignedIntValue];

      v62 = (unsigned int *)(v61 + 4 * (v55 & 0x1F));
      if ((unint64_t)(v62 + 1) < v57 + v58)
      {
        v131 = v54;
        v63 = (unsigned int *)(v61 + 4 * (v55 >> 5));
        if ((unint64_t)(v63 + 1) >= v59)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.7(&v136, v137);
          }
          log = self->_log;
          long long v52 = v133;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            v99 = log;
            uint64_t v100 = [v56 length];
            *(_DWORD *)buf = 138543618;
            id v164 = v120;
            __int16 v165 = 2050;
            uint64_t v166 = v100;
            _os_log_error_impl(&dword_23974B000, v99, OS_LOG_TYPE_ERROR, "[%{public}@] truncated pnrs data?; size %{public}lu ",
              buf,
              0x16u);
          }
          v89 = self->_log;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            id v164 = v120;
            __int16 v165 = 2050;
            uint64_t v166 = v57;
            __int16 v167 = 2050;
            unint64_t v168 = v59;
            __int16 v169 = 2050;
            v170 = v63;
            _os_log_error_impl(&dword_23974B000, v89, OS_LOG_TYPE_ERROR, "[%{public}@] begin: %{public}p, end: %{public}p, offsetPtr: %{public}p", buf, 0x2Au);
          }
          v90 = self->_log;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v101 = v90;
            uint64_t v102 = [v118 length];
            *(_DWORD *)buf = 138543618;
            id v164 = v120;
            __int16 v165 = 2050;
            uint64_t v166 = v102;
            _os_log_error_impl(&dword_23974B000, v101, OS_LOG_TYPE_ERROR, "[%{public}@] pnr data size: %{public}lu", buf, 0x16u);
          }
          v91 = self->_log;
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
        }
        else
        {
          v64 = (unsigned int *)(v61 + 4 * (v55 >> 13));
          if ((unint64_t)(v64 + 1) < v59)
          {
            uint64_t v65 = *v62;
            uint64_t v66 = *v63;
            uint64_t v67 = *v64;
            uint64_t v68 = v57 + v65;
            if (v58 < v65)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:](&v159, v160);
              }
LABEL_40:
              uint64_t v69 = 0;
            }
            else
            {
              uint64_t v69 = 0;
              while (*(unsigned char *)(v68 + v69))
              {
                ++v69;
                if (v68 + v69 > v59)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                    -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:](&v157, v158);
                  }
                  goto LABEL_40;
                }
              }
            }
            uint64_t v70 = v57 + v66;
            if (v58 < v66)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:](&v155, v156);
              }
LABEL_47:
              uint64_t v71 = 0;
            }
            else
            {
              uint64_t v71 = 0;
              while (*(unsigned char *)(v70 + v71))
              {
                ++v71;
                if (v70 + v71 > v59)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                    -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:](&v153, v154);
                  }
                  goto LABEL_47;
                }
              }
            }
            uint64_t v72 = v57 + v67;
            if (v58 < v67)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:](&v151, v114);
              }
LABEL_54:
              uint64_t v73 = 0;
            }
            else
            {
              uint64_t v73 = 0;
              while (*(unsigned char *)(v72 + v73))
              {
                ++v73;
                if (v72 + v73 > v59)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                    -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:](&v149, v150);
                  }
                  goto LABEL_54;
                }
              }
            }
            if (v69)
            {
              v74 = (void *)[[NSString alloc] initWithBytes:v68 length:v69 encoding:4];
              if (v71) {
                goto LABEL_57;
              }
LABEL_59:
              v75 = 0;
            }
            else
            {
              v74 = 0;
              if (!v71) {
                goto LABEL_59;
              }
LABEL_57:
              v75 = (void *)[[NSString alloc] initWithBytes:v70 length:v71 encoding:4];
            }
            long long v52 = v133;
            if (v73) {
              v76 = (void *)[[NSString alloc] initWithBytes:v72 length:v73 encoding:4];
            }
            else {
              v76 = 0;
            }
            v77 = [[PNRStringsFileReaderResult alloc] initWithCountry:v74 region:v75 city:v76];
            v78 = v77;
            if (v77)
            {
              uint64_t v79 = [(PNRStringsFileReaderResult *)v77 score];
              if (v79 > [(PNRStringsFileReaderResult *)v133 score])
              {
                v80 = v78;

                id v81 = v131;
                v125 = v81;
                long long v52 = v80;
              }
              uint64_t v82 = [(PNRStringsFileReaderResult *)v52 score];
              if (v82 == +[PNRStringsFileReaderResult maxPossibleScore])
              {

                goto LABEL_112;
              }
            }

LABEL_68:
            uint64_t v83 = v132;
            goto LABEL_69;
          }
          long long v52 = v133;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.7(&v134, v135);
          }
          v92 = self->_log;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            v103 = v92;
            uint64_t v104 = [v56 length];
            *(_DWORD *)buf = 138543618;
            id v164 = v120;
            __int16 v165 = 2050;
            uint64_t v166 = v104;
            _os_log_error_impl(&dword_23974B000, v103, OS_LOG_TYPE_ERROR, "[%{public}@] truncated pnrs data?; size %{public}lu ",
              buf,
              0x16u);
          }
          v93 = self->_log;
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138544130;
            id v164 = v120;
            __int16 v165 = 2050;
            uint64_t v166 = v57;
            __int16 v167 = 2050;
            unint64_t v168 = v59;
            __int16 v169 = 2050;
            v170 = v64;
            _os_log_error_impl(&dword_23974B000, v93, OS_LOG_TYPE_ERROR, "[%{public}@] begin: %{public}p, end: %{public}p, offsetPtr: %{public}p", buf, 0x2Au);
          }
          v94 = self->_log;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          {
            v105 = v94;
            uint64_t v106 = [v118 length];
            *(_DWORD *)buf = 138543618;
            id v164 = v120;
            __int16 v165 = 2050;
            uint64_t v166 = v106;
            _os_log_error_impl(&dword_23974B000, v105, OS_LOG_TYPE_ERROR, "[%{public}@] pnr data size: %{public}lu", buf, 0x16u);
          }
          v91 = self->_log;
          if (!os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
        }
        *(_DWORD *)buf = 138544130;
        id v164 = v120;
        __int16 v165 = 2114;
        uint64_t v166 = (uint64_t)v122;
        __int16 v167 = 2114;
        unint64_t v168 = (unint64_t)v119;
        __int16 v169 = 2114;
        v170 = v121;
        _os_log_error_impl(&dword_23974B000, v91, OS_LOG_TYPE_ERROR, "[%{public}@] prefix: '%{public}@', number: '%{public}@', country: %{public}@", buf, 0x2Au);
        goto LABEL_68;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        -[PNRResourceManager _bestStringForInCountryPhoneNumber:phoneNumberCC:countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:].cold.7(&v138, v139);
      }
      v84 = self->_log;
      long long v52 = v133;
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        v95 = v84;
        uint64_t v96 = [v56 length];
        *(_DWORD *)buf = 138543618;
        id v164 = v120;
        __int16 v165 = 2050;
        uint64_t v166 = v96;
        _os_log_error_impl(&dword_23974B000, v95, OS_LOG_TYPE_ERROR, "[%{public}@] truncated pnrs data?; size %{public}lu ",
          buf,
          0x16u);
      }
      v85 = self->_log;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        id v164 = v120;
        __int16 v165 = 2050;
        uint64_t v166 = v57;
        __int16 v167 = 2050;
        unint64_t v168 = v59;
        __int16 v169 = 2050;
        v170 = v62;
        _os_log_error_impl(&dword_23974B000, v85, OS_LOG_TYPE_ERROR, "[%{public}@] begin: %{public}p, end: %{public}p, offsetPtr: %{public}p", buf, 0x2Au);
      }
      v86 = self->_log;
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v97 = v86;
        uint64_t v98 = [v118 length];
        *(_DWORD *)buf = 138543618;
        id v164 = v120;
        __int16 v165 = 2050;
        uint64_t v166 = v98;
        _os_log_error_impl(&dword_23974B000, v97, OS_LOG_TYPE_ERROR, "[%{public}@] pnr data size: %{public}lu", buf, 0x16u);
      }
      v87 = self->_log;
      uint64_t v83 = v132;
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        id v164 = v120;
        __int16 v165 = 2114;
        uint64_t v166 = (uint64_t)v122;
        __int16 v167 = 2114;
        unint64_t v168 = (unint64_t)v119;
        __int16 v169 = 2114;
        v170 = v121;
        _os_log_error_impl(&dword_23974B000, v87, OS_LOG_TYPE_ERROR, "[%{public}@] prefix: '%{public}@', number: '%{public}@', country: %{public}@", buf, 0x2Au);
      }
LABEL_69:
      uint64_t v53 = v83 + 1;
    }
    while (v53 != v127);
    uint64_t v107 = [obj countByEnumeratingWithState:&v140 objects:v171 count:16];
    uint64_t v127 = v107;
  }
  while (v107);
LABEL_112:

  id v14 = v119;
  if ([(PNRStringsFileReaderResult *)v52 isPlaceHolderForEmpty])
  {
    (*((void (**)(id, void, void, void))v123 + 2))(v123, 0, 0, 0);
  }
  else
  {
    v110 = [(PNRStringsFileReaderResult *)v52 aggregateStringWhileInCountry:v121 forLanguage:v125 ccOfNumber:v122];
    if (v110)
    {
      (*((void (**)(id, void *, uint64_t, void))v123 + 2))(v123, v110, 1, 0);
    }
    else
    {
      v111 = (void *)MEMORY[0x263F087E8];
      v161[0] = @"type";
      v161[1] = @"resource";
      v162[0] = @"strings";
      v162[1] = v122;
      v112 = [NSDictionary dictionaryWithObjects:v162 forKeys:v161 count:2];
      v113 = [v111 _PNRNotFoundErrorWithUserInfo:v112];

      (*((void (**)(id, void, void, void *))v123 + 2))(v123, 0, 0, v113);
    }
  }
  id v16 = v121;
  id v15 = v122;
  id v18 = v117;
  id v21 = v118;
  id v19 = v120;
  id v20 = v123;
  id v24 = v116;
LABEL_8:
}

void __71__PNRResourceManager__URLForInstalledResourceOfType_logId_resultBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 16);
    [*(id *)&v3[14]._os_unfair_lock_opaque removeObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3 + 16);
    id v4 = *(NSObject **)&v3[12]._os_unfair_lock_opaque;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void **)(a1 + 48);
      id v8 = v4;
      uint64_t v9 = [v7 getLocalUrl];
      int v10 = 138544130;
      unsigned int v11 = @"asset";
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl(&dword_23974B000, v8, OS_LOG_TYPE_INFO, "[%{public}@] Got the download asset reply: %{public}@/%{public}@, and %{public}@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

- (void)_setLastCatalogLoadTime:(id)a3
{
  id v4 = (NSDate *)a3;
  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 setObject:v4 forKey:@"PNRltc"];

  lastCatalogLoadTime = self->_lastCatalogLoadTime;
  self->_lastCatalogLoadTime = v4;
}

- (void)_updateCatalogAfterDelay:(double)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    int v10 = @"catalog";
    __int16 v11 = 2050;
    uint64_t v12 = (uint64_t)a3;
    _os_log_impl(&dword_23974B000, log, OS_LOG_TYPE_INFO, "[%{public}@] phone number db catalog downloads in %{public}ld seconds", buf, 0x16u);
  }
  uint64_t v6 = dispatch_get_global_queue(9, 0);
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__PNRResourceManager__updateCatalogAfterDelay___block_invoke;
  block[3] = &unk_264D9F538;
  block[4] = self;
  dispatch_after(v7, v6, block);
}

uint64_t __47__PNRResourceManager__updateCatalogAfterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCatalog];
}

uint64_t __36__PNRResourceManager__updateCatalog__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _catalogDownloadFinishedWithResult:a2];
}

- (void)_catalogDownloadFinishedWithResult:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    int v10 = @"catalog";
    __int16 v11 = 2050;
    int64_t v12 = a3;
    _os_log_impl(&dword_23974B000, log, OS_LOG_TYPE_INFO, "[%{public}@] catalog download results : %{public}ld", (uint8_t *)&v9, 0x16u);
  }
  if (a3)
  {
    unsigned int catalogLoadRetryMultiplier = self->_catalogLoadRetryMultiplier;
    if (catalogLoadRetryMultiplier <= 0xB) {
      self->_unsigned int catalogLoadRetryMultiplier = ++catalogLoadRetryMultiplier;
    }
    double v7 = (double)(600 * catalogLoadRetryMultiplier);
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
    [(PNRResourceManager *)self _setLastCatalogLoadTime:v8];

    double v7 = 90000.0;
  }
  [(PNRResourceManager *)self _updateCatalogAfterDelay:v7];
}

- (void)catalogLoadThen:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F559B8]);
  [v4 setAllowsCellularAccess:1];
  [v4 setDiscretionary:0];
  uint64_t v5 = (void *)MEMORY[0x263F55938];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__PNRResourceManager_catalogLoadThen___block_invoke;
  v7[3] = &unk_264D9F588;
  id v8 = v3;
  id v6 = v3;
  [v5 startCatalogDownload:@"com.apple.MobileAsset.phoneNumberResolver" options:v4 then:v7];
}

uint64_t __38__PNRResourceManager_catalogLoadThen___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsInflight, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_maURLCache, 0);
  objc_storeStrong((id *)&self->_fileDataCache, 0);

  objc_storeStrong((id *)&self->_lastCatalogLoadTime, 0);
}

- (void)_bestStringForInCountryPhoneNumber:(unsigned char *)a1 phoneNumberCC:(unsigned char *)a2 countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_1(&dword_23974B000, &_os_log_internal, v2, "Assertion failed: r <= end", v3);
}

- (void)_bestStringForInCountryPhoneNumber:(unsigned char *)a1 phoneNumberCC:(unsigned char *)a2 countryOfDevice:countryTrieData:countryStrings:logId:resultBlock:.cold.7(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0(a1, a2);
  OUTLINED_FUNCTION_1(&dword_23974B000, &_os_log_internal, v2, "Assertion failed: (void*)offsetPtr + sizeof(*offsetPtr) < (void*)end", v3);
}

- (void)_getDataFrom:zeroCacheCost:logId:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_23974B000, v0, v1, "[%{public}@] found cached data for key %{public}@");
}

- (void)_getDataFrom:zeroCacheCost:logId:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_23974B000, v0, v1, "[%{public}@] lookup cached data with key %{public}@");
}

@end