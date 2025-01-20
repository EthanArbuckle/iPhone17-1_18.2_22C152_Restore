@interface PLAssetsdConnectionAuthorization
- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken;
- (BOOL)_isPhotosPickerClient;
- (BOOL)_isPreferencesClient;
- (BOOL)_shouldTrackEventForBundle:(id)a3;
- (BOOL)analyticsCacheReadEntitled;
- (BOOL)analyticsCacheWriteEntitled;
- (BOOL)clientIsSandboxed;
- (BOOL)cloudInternalEntitled;
- (BOOL)coreSceneUnderstandingTaxonomyReadAuthorized;
- (BOOL)coreSceneUnderstandingTaxonomyWriteAuthorized;
- (BOOL)directDatabaseAccessAuthorized;
- (BOOL)directDatabaseWriteAuthorized;
- (BOOL)internalDataReadWriteAuthorized;
- (BOOL)isCameraClient;
- (BOOL)isClientAuthorizedForLibraryUpgrade;
- (BOOL)isClientAuthorizedForSandboxExtensions;
- (BOOL)isClientAuthorizedForTCCServicePhotos;
- (BOOL)isClientAuthorizedForTCCServicePhotosAdd;
- (BOOL)isClientEntitledForPhotoKitOrPrivatePhotosTCC;
- (BOOL)isClientInFullLibraryMode;
- (BOOL)isClientInLimitedLibraryMode;
- (BOOL)isClientInRestrictedMode;
- (BOOL)isClientLimitedLibraryCapable;
- (BOOL)isPhotosClient;
- (BOOL)isQuickCheckReadyForAnalysisClient;
- (BOOL)managedSpotlightIndexReadWriteEntitled;
- (BOOL)photoKitEntitled;
- (BOOL)photoKitEntitledFor:(id)a3;
- (BOOL)photosDataVaultEntitled;
- (BOOL)smartSharingCacheReadEntitled;
- (BOOL)smartSharingCacheWriteEntitled;
- (LSBundleRecord)trustedCallerContainingBundleRecord;
- (NSString)description;
- (NSString)fetchFilterIdentifier;
- (NSString)trustedCallerBundleID;
- (NSString)trustedCallerDisplayName;
- (NSString)trustedCallerPhotoLibraryUsageDescription;
- (PLAssetsdConnectionAuthorization)initWithConnection:(id)a3 daemonServices:(id)a4;
- (PLCaptureSessionState)captureSessionState;
- (id)_captureSessionState;
- (id)_captureSessionStateFromAuditToken:(id *)a3;
- (id)_fetchFilterIdentifier;
- (id)_isPhotosAccessAllowed;
- (id)_isPhotosAddAccessAllowed;
- (id)_trustedCallerContainingBundleRecord;
- (id)_trustedCallerDisplayName;
- (id)_trustedCallerPhotoLibraryUsageDescription;
- (int)clientProcessIdentifier;
- (void)_setupAnalyticsCacheWithConnection:(id)a3;
- (void)_setupSmartSharingCacheWithConnection:(id)a3;
- (void)_trackCAConnectionEvent;
- (void)invalidateClientAuthorizationCache;
- (void)setClientLimitedLibraryCapable:(BOOL)a3;
- (void)setClientMainBundleSandboxedURL:(id)a3;
@end

@implementation PLAssetsdConnectionAuthorization

- (PLAssetsdConnectionAuthorization)initWithConnection:(id)a3 daemonServices:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v97.receiver = self;
  v97.super_class = (Class)PLAssetsdConnectionAuthorization;
  v8 = [(PLAssetsdConnectionAuthorization *)&v97 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_daemonServices, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    p_auditToken = &v9->_auditToken;
    long long v11 = *(_OWORD *)&token.val[4];
    *(_OWORD *)v9->_auditToken.val = *(_OWORD *)token.val;
    *(_OWORD *)&v9->_auditToken.val[4] = v11;
    int v12 = [v6 processIdentifier];
    v13 = (const __CFAllocator **)MEMORY[0x1E4F1CF80];
    v9->_clientProcessIdentifier = v12;
    CFAllocatorRef v14 = *v13;
    long long v15 = *(_OWORD *)&v9->_auditToken.val[4];
    *(_OWORD *)token.val = *(_OWORD *)v9->_auditToken.val;
    *(_OWORD *)&token.val[4] = v15;
    v16 = SecTaskCreateWithAuditToken(v14, &token);
    v17 = v16;
    if (v16)
    {
      CFStringRef v18 = SecTaskCopySigningIdentifier(v16, 0);
      trustedCallerBundleID = v9->_trustedCallerBundleID;
      v9->_trustedCallerBundleID = &v18->isa;

      CFRelease(v17);
    }
    v20 = (void *)MEMORY[0x1E4F8B9D8];
    v21 = [v6 _xpcConnection];
    uint64_t v22 = *MEMORY[0x1E4F8C5C0];
    v98[0] = *MEMORY[0x1E4F8C5B8];
    v98[1] = v22;
    v98[2] = *MEMORY[0x1E4F8C5A8];
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
    uint64_t v24 = [v20 connection:v21 grantedEntitlements:v23];
    photoKitEntitlements = v9->_photoKitEntitlements;
    v9->_photoKitEntitlements = (NSSet *)v24;

    v9->_photoKitEntitled = [MEMORY[0x1E4F8B9D8] containsPhotoKitEntitlement:v9->_photoKitEntitlements];
    v26 = (void *)MEMORY[0x1E4F8B9D8];
    v27 = [v6 _xpcConnection];
    v9->_clientAuthorizedForLibraryUpgrade = [v26 connection:v27 hasEntitlement:*MEMORY[0x1E4F8C5B0]];

    v28 = (void *)MEMORY[0x1E4F8B9D8];
    v29 = [v6 _xpcConnection];
    v9->_cloudInternalEntitled = [v28 connection:v29 hasEntitlement:*MEMORY[0x1E4F8BA98]];

    v30 = (void *)MEMORY[0x1E4F8B9D8];
    v31 = [v6 _xpcConnection];
    v9->_managedSpotlightIndexReadWriteEntitled = [v30 connection:v31 hasEntitlement:*MEMORY[0x1E4F8C5F8]];

    [(PLAssetsdConnectionAuthorization *)v9 _setupAnalyticsCacheWithConnection:v6];
    [(PLAssetsdConnectionAuthorization *)v9 _setupSmartSharingCacheWithConnection:v6];
    long long v32 = *(_OWORD *)&v9->_auditToken.val[4];
    *(_OWORD *)token.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&token.val[4] = v32;
    char v33 = [MEMORY[0x1E4F8B9D8] isEntitledForPhotoKitOrPrivatePhotosTCCForToken:&token];
    v9->_clientEntitledForPhotoKitOrPrivatePhotosTCC = v33;
    v9->_directDatabaseAccessAuthorized = v33;
    v34 = (void *)MEMORY[0x1E4F8B9D8];
    v35 = [v6 _xpcConnection];
    v9->_directDatabaseWriteAuthorized = [v34 connection:v35 hasEntitlement:*MEMORY[0x1E4F8C5D8]];

    long long v36 = *(_OWORD *)&v9->_auditToken.val[4];
    *(_OWORD *)token.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&token.val[4] = v36;
    int v37 = sandbox_check_by_audit_token();
    if (v37 == -1)
    {
      v38 = PLBackendGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        int v39 = *__error();
        v40 = __error();
        v41 = strerror(*v40);
        token.val[0] = 67109378;
        token.val[1] = v39;
        LOWORD(token.val[2]) = 2080;
        *(void *)((char *)&token.val[2] + 2) = v41;
        _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_ERROR, "Error checking client sandbox: errno %d %s", (uint8_t *)&token, 0x12u);
      }
    }
    v9->_clientIsSandboxed = v37 == 1;
    v42 = (void *)MEMORY[0x1E4F8B9D8];
    v43 = [v6 _xpcConnection];
    v9->_photosDataVaultEntitled = [v42 connection:v43 hasEntitlement:@"com.apple.private.security.storage.PhotosLibraries"];

    v44 = (void *)MEMORY[0x1E4F8B9D8];
    v45 = [v6 _xpcConnection];
    v9->_internalDataReadWriteAuthorized = [v44 connection:v45 hasEntitlement:*MEMORY[0x1E4F8C5E0]];

    v46 = (void *)MEMORY[0x1E4F8B9D8];
    v47 = [v6 _xpcConnection];
    v9->_coreSceneUnderstandingTaxonomyReadAuthorized = [v46 connection:v47 hasEntitlement:@"com.apple.private.photos.coresceneunderstanding.taxonomy.read-only"];

    v48 = (void *)MEMORY[0x1E4F8B9D8];
    v49 = [v6 _xpcConnection];
    v9->_coreSceneUnderstandingTaxonomyWriteAuthorized = [v48 connection:v49 hasEntitlement:@"com.apple.private.photos.coresceneunderstanding.taxonomy.read-write"];

    id v50 = objc_initWeak((id *)&token, v9);
    id v51 = objc_alloc(MEMORY[0x1E4F8B948]);
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke;
    v95[3] = &unk_1E5874070;
    objc_copyWeak(&v96, (id *)&token);
    uint64_t v52 = [v51 initWithRetriableBlock:v95];
    objc_destroyWeak(&v96);
    objc_destroyWeak((id *)&token);
    lazyPhotosAccessAllowed = v9->_lazyPhotosAccessAllowed;
    v9->_lazyPhotosAccessAllowed = (PLLazyObject *)v52;

    id v54 = objc_initWeak((id *)&token, v9);
    id v55 = objc_alloc(MEMORY[0x1E4F8B948]);
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_2;
    v93[3] = &unk_1E5874070;
    objc_copyWeak(&v94, (id *)&token);
    uint64_t v56 = [v55 initWithRetriableBlock:v93];
    objc_destroyWeak(&v94);
    objc_destroyWeak((id *)&token);
    lazyPhotosAddAccessAllowed = v9->_lazyPhotosAddAccessAllowed;
    v9->_lazyPhotosAddAccessAllowed = (PLLazyObject *)v56;

    id v58 = objc_initWeak((id *)&token, v9);
    id v59 = objc_alloc(MEMORY[0x1E4F8B948]);
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_3;
    v91[3] = &unk_1E5874070;
    objc_copyWeak(&v92, (id *)&token);
    uint64_t v60 = [v59 initWithRetriableBlock:v91];
    objc_destroyWeak(&v92);
    objc_destroyWeak((id *)&token);
    lazytrustedCallerContainingBundleRecord = v9->_lazytrustedCallerContainingBundleRecord;
    v9->_lazytrustedCallerContainingBundleRecord = (PLLazyObject *)v60;

    id v62 = objc_initWeak((id *)&token, v9);
    id v63 = objc_alloc(MEMORY[0x1E4F8B948]);
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_4;
    v89[3] = &unk_1E5874070;
    objc_copyWeak(&v90, (id *)&token);
    uint64_t v64 = [v63 initWithRetriableBlock:v89];
    objc_destroyWeak(&v90);
    objc_destroyWeak((id *)&token);
    lazyTrustedCallerDisplayName = v9->_lazyTrustedCallerDisplayName;
    v9->_lazyTrustedCallerDisplayName = (PLLazyObject *)v64;

    id v66 = objc_initWeak((id *)&token, v9);
    id v67 = objc_alloc(MEMORY[0x1E4F8B948]);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_5;
    v87[3] = &unk_1E5874070;
    objc_copyWeak(&v88, (id *)&token);
    uint64_t v68 = [v67 initWithRetriableBlock:v87];
    objc_destroyWeak(&v88);
    objc_destroyWeak((id *)&token);
    lazyTrustedCallerPhotoLibraryUsageDescription = v9->_lazyTrustedCallerPhotoLibraryUsageDescription;
    v9->_lazyTrustedCallerPhotoLibraryUsageDescription = (PLLazyObject *)v68;

    id v70 = objc_initWeak((id *)&token, v9);
    id v71 = objc_alloc(MEMORY[0x1E4F8B948]);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_6;
    v85[3] = &unk_1E5874070;
    objc_copyWeak(&v86, (id *)&token);
    uint64_t v72 = [v71 initWithRetriableBlock:v85];
    objc_destroyWeak(&v86);
    objc_destroyWeak((id *)&token);
    lazyFetchFilterIdentifier = v9->_lazyFetchFilterIdentifier;
    v9->_lazyFetchFilterIdentifier = (PLLazyObject *)v72;

    id v74 = objc_initWeak((id *)&token, v9);
    id v75 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v80 = MEMORY[0x1E4F143A8];
    uint64_t v81 = 3221225472;
    v82 = __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_7;
    v83 = &unk_1E5874070;
    objc_copyWeak(&v84, (id *)&token);
    uint64_t v76 = [v75 initWithBlock:&v80];
    objc_destroyWeak(&v84);
    objc_destroyWeak((id *)&token);
    lazyCaptureSessionState = v9->_lazyCaptureSessionState;
    v9->_lazyCaptureSessionState = (PLLazyObject *)v76;

    if (v17) {
      [(PLAssetsdConnectionAuthorization *)v9 _trackCAConnectionEvent];
    }
    v78 = v9;
  }

  return v9;
}

- (void)_setupSmartSharingCacheWithConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F8B9D8];
  id v5 = a3;
  id v6 = [v5 _xpcConnection];
  self->_smartSharingCacheReadEntitled = [v4 connection:v6 hasEntitlement:*MEMORY[0x1E4F8C5E8]];

  id v7 = (void *)MEMORY[0x1E4F8B9D8];
  v8 = [v5 _xpcConnection];

  uint64_t v9 = *MEMORY[0x1E4F8C5F0];
  LODWORD(v5) = [v7 connection:v8 hasEntitlement:*MEMORY[0x1E4F8C5F0]];

  if (v5)
  {
    if ([(NSString *)self->_trustedCallerBundleID isEqualToString:@"com.apple.photoanalysisd"])
    {
      self->_smartSharingCacheWriteEntitled = 1;
    }
    else
    {
      self->_smartSharingCacheWriteEntitled = 0;
      v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        trustedCallerBundleID = self->_trustedCallerBundleID;
        int v12 = 138412546;
        v13 = trustedCallerBundleID;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_FAULT, "BundleID: %@ not permitted for %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)_setupAnalyticsCacheWithConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F8B9D8];
  id v5 = a3;
  id v6 = [v5 _xpcConnection];
  self->_analyticsCacheReadEntitled = [v4 connection:v6 hasEntitlement:*MEMORY[0x1E4F8C5C8]];

  id v7 = (void *)MEMORY[0x1E4F8B9D8];
  v8 = [v5 _xpcConnection];

  uint64_t v9 = *MEMORY[0x1E4F8C5D0];
  LODWORD(v5) = [v7 connection:v8 hasEntitlement:*MEMORY[0x1E4F8C5D0]];

  if (v5)
  {
    if ([(NSString *)self->_trustedCallerBundleID isEqualToString:@"com.apple.photoanalysisd"])
    {
      self->_analyticsCacheWriteEntitled = 1;
    }
    else
    {
      self->_analyticsCacheWriteEntitled = 0;
      v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        trustedCallerBundleID = self->_trustedCallerBundleID;
        int v12 = 138412546;
        v13 = trustedCallerBundleID;
        __int16 v14 = 2112;
        uint64_t v15 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_FAULT, "BundleID: %@ not permitted for %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (BOOL)photoKitEntitled
{
  return self->_photoKitEntitled;
}

- (BOOL)isClientEntitledForPhotoKitOrPrivatePhotosTCC
{
  return self->_clientEntitledForPhotoKitOrPrivatePhotosTCC;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  long long v3 = *(_OWORD *)self[1].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    long long v3 = [WeakRetained _isPhotosAddAccessAllowed];
  }
  else
  {
    long long v3 = 0;
  }

  return v3;
}

- (id)_isPhotosAddAccessAllowed
{
  long long v3 = [MEMORY[0x1E4F8B998] sharedInstance];
  long long v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  [v3 photosAccessAllowedWithScope:1 auditToken:v7 clientAuthorization:self];

  id v5 = [NSNumber numberWithBool:PLPhotosAccessAllowed()];
  return v5;
}

- (void)invalidateClientAuthorizationCache
{
  [(PLLazyObject *)self->_lazyPhotosAccessAllowed resetObject];
  lazyPhotosAddAccessAllowed = self->_lazyPhotosAddAccessAllowed;
  [(PLLazyObject *)lazyPhotosAddAccessAllowed resetObject];
}

- (void)_trackCAConnectionEvent
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if ([(PLAssetsdConnectionAuthorization *)self _shouldTrackEventForBundle:self->_trustedCallerBundleID])
  {
    long long v3 = [(NSString *)self->_trustedCallerBundleID lowercaseString];
    long long v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];
    int v6 = [v5 isEqualToString:@"null"];

    if (v6)
    {
      uint64_t v27 = *MEMORY[0x1E4F8BB60];
      v28[0] = *MEMORY[0x1E4F8BB68];
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      p_trustedCallerBundleID = (NSString **)v28;
      uint64_t v9 = &v27;
    }
    else
    {
      uint64_t v25 = *MEMORY[0x1E4F8BB60];
      trustedCallerBundleID = self->_trustedCallerBundleID;
      id v7 = (void *)MEMORY[0x1E4F1C9E8];
      p_trustedCallerBundleID = &trustedCallerBundleID;
      uint64_t v9 = &v25;
    }
    v10 = [v7 dictionaryWithObjects:p_trustedCallerBundleID forKeys:v9 count:1];
    PLSendCoreAnalyticEvent();

    BOOL v11 = [(PLAssetsdConnectionAuthorization *)self isClientInFullLibraryMode];
    BOOL v12 = [(PLAssetsdConnectionAuthorization *)self isClientInLimitedLibraryMode];
    BOOL v13 = [(PLAssetsdConnectionAuthorization *)self isClientAuthorizedForTCCServicePhotosAdd];
    BOOL v14 = [(PLAssetsdConnectionAuthorization *)self isClientInRestrictedMode];
    BOOL v15 = !v11 && !v12;
    v24[0] = self->_trustedCallerBundleID;
    uint64_t v16 = *MEMORY[0x1E4F8C168];
    v23[0] = *MEMORY[0x1E4F8C190];
    v23[1] = v16;
    v17 = [NSNumber numberWithBool:v11];
    v24[1] = v17;
    v23[2] = *MEMORY[0x1E4F8C178];
    CFStringRef v18 = [NSNumber numberWithBool:v12];
    v24[2] = v18;
    v23[3] = *MEMORY[0x1E4F8C180];
    v19 = [NSNumber numberWithBool:v13];
    v24[3] = v19;
    v23[4] = *MEMORY[0x1E4F8C188];
    v20 = [NSNumber numberWithBool:v14];
    v24[4] = v20;
    v23[5] = *MEMORY[0x1E4F8C170];
    v21 = [NSNumber numberWithBool:v15];
    v24[5] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
    PLSendCoreAnalyticEvent();
  }
}

- (BOOL)isClientAuthorizedForTCCServicePhotosAdd
{
  v2 = [(PLLazyObject *)self->_lazyPhotosAddAccessAllowed objectValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isClientInRestrictedMode
{
  char v3 = [MEMORY[0x1E4F8B998] sharedInstance];
  long long v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  uint64_t v5 = [v3 photosAccessAllowedWithScope:7 auditToken:v7 clientAuthorization:self];

  return v5 == 3;
}

- (BOOL)isClientInLimitedLibraryMode
{
  char v3 = [MEMORY[0x1E4F8B998] sharedInstance];
  long long v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  uint64_t v5 = [v3 photosAccessAllowedWithScope:7 auditToken:v7 clientAuthorization:self];

  return v5 == 4;
}

- (BOOL)isClientInFullLibraryMode
{
  char v3 = [MEMORY[0x1E4F8B998] sharedInstance];
  long long v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  uint64_t v5 = [v3 photosAccessAllowedWithScope:7 auditToken:v7 clientAuthorization:self];

  return v5 == 0;
}

- (BOOL)_shouldTrackEventForBundle:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 length]
    && (![v3 hasPrefix:@"com.apple."]
     || ([v3 hasPrefix:@"com.apple.mobileslideshow"] & 1) != 0
     || (PLIsCameraBundleIdentifier() & 1) != 0
     || [v3 isEqualToString:@"com.apple.Photos"]);

  return v4;
}

- (BOOL)smartSharingCacheWriteEntitled
{
  return self->_smartSharingCacheWriteEntitled;
}

- (BOOL)smartSharingCacheReadEntitled
{
  return self->_smartSharingCacheReadEntitled;
}

- (BOOL)internalDataReadWriteAuthorized
{
  return self->_internalDataReadWriteAuthorized;
}

- (BOOL)coreSceneUnderstandingTaxonomyWriteAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyWriteAuthorized;
}

- (BOOL)coreSceneUnderstandingTaxonomyReadAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyReadAuthorized;
}

- (BOOL)analyticsCacheWriteEntitled
{
  return self->_analyticsCacheWriteEntitled;
}

- (BOOL)analyticsCacheReadEntitled
{
  return self->_analyticsCacheReadEntitled;
}

- (NSString)trustedCallerBundleID
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
  objc_storeStrong((id *)&self->_clientMainBundleSandboxedURL, 0);
  objc_storeStrong((id *)&self->_lazyCaptureSessionState, 0);
  objc_storeStrong((id *)&self->_lazyFetchFilterIdentifier, 0);
  objc_storeStrong((id *)&self->_lazyTrustedCallerPhotoLibraryUsageDescription, 0);
  objc_storeStrong((id *)&self->_lazyTrustedCallerDisplayName, 0);
  objc_storeStrong((id *)&self->_lazytrustedCallerContainingBundleRecord, 0);
  objc_storeStrong((id *)&self->_lazyPhotosAddAccessAllowed, 0);
  objc_storeStrong((id *)&self->_lazyPhotosAccessAllowed, 0);
  objc_storeStrong((id *)&self->_photoKitEntitlements, 0);
  objc_storeStrong((id *)&self->_daemonServices, 0);
}

- (BOOL)isClientAuthorizedForLibraryUpgrade
{
  return self->_clientAuthorizedForLibraryUpgrade;
}

- (BOOL)managedSpotlightIndexReadWriteEntitled
{
  return self->_managedSpotlightIndexReadWriteEntitled;
}

- (BOOL)photosDataVaultEntitled
{
  return self->_photosDataVaultEntitled;
}

- (BOOL)clientIsSandboxed
{
  return self->_clientIsSandboxed;
}

- (BOOL)cloudInternalEntitled
{
  return self->_cloudInternalEntitled;
}

- (BOOL)directDatabaseWriteAuthorized
{
  return self->_directDatabaseWriteAuthorized;
}

- (BOOL)directDatabaseAccessAuthorized
{
  return self->_directDatabaseAccessAuthorized;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (id)_captureSessionStateFromAuditToken:(id *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (PLIsCaptureSessionEnabled())
  {
    daemonServices = self->_daemonServices;
    long long v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)BOOL v11 = *(_OWORD *)a3->var0;
    *(_OWORD *)&v11[16] = v6;
    id v7 = [(PLDaemonServices *)daemonServices captureSessionStateFromAuditToken:v11];
    v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(PLAssetsdConnectionAuthorization *)self description];
      *(_DWORD *)BOOL v11 = 138543618;
      *(void *)&v11[4] = v9;
      *(_WORD *)&v11[12] = 2114;
      *(void *)&v11[14] = v7;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Capture Session: [client %{public}@] Session state from audit token: %{public}@", v11, 0x16u);
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F8B898] none];
  }
  return v7;
}

- (id)_captureSessionState
{
  long long v2 = *(_OWORD *)&self->_auditToken.val[4];
  v5[0] = *(_OWORD *)self->_auditToken.val;
  v5[1] = v2;
  id v3 = [(PLAssetsdConnectionAuthorization *)self _captureSessionStateFromAuditToken:v5];
  return v3;
}

- (PLCaptureSessionState)captureSessionState
{
  return (PLCaptureSessionState *)[(PLLazyObject *)self->_lazyCaptureSessionState objectValue];
}

- (BOOL)photoKitEntitledFor:(id)a3
{
  return [(NSSet *)self->_photoKitEntitlements containsObject:a3];
}

- (id)_fetchFilterIdentifier
{
  return +[PLLimitedLibraryFetchFilter fetchFilterIdentifierForConnectionAuthorization:self];
}

- (NSString)fetchFilterIdentifier
{
  return (NSString *)[(PLLazyObject *)self->_lazyFetchFilterIdentifier objectValue];
}

- (id)_trustedCallerPhotoLibraryUsageDescription
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  long long v3 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v3;
  BOOL v4 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:&v10];
  id v5 = v10;
  if (v4)
  {
    long long v6 = [v4 infoDictionary];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F8C4F0] ofClass:objc_opt_class()];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "%@ failed to get bundle proxy with error %@", buf, 0x16u);
    }
  }
  id v7 = &stru_1EEB2EB80;
LABEL_8:

  return v7;
}

- (NSString)trustedCallerPhotoLibraryUsageDescription
{
  return (NSString *)[(PLLazyObject *)self->_lazyTrustedCallerPhotoLibraryUsageDescription objectValue];
}

- (id)_trustedCallerDisplayName
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x19F38BDA0](self, a2))
  {
    long long v3 = [(PLAssetsdConnectionAuthorization *)self trustedCallerBundleID];
    if ([v3 containsString:@"photosctl"])
    {

LABEL_5:
      long long v6 = [(PLAssetsdConnectionAuthorization *)self trustedCallerBundleID];
      id v7 = (id)[v6 copy];

      goto LABEL_18;
    }
    BOOL v4 = [(PLAssetsdConnectionAuthorization *)self trustedCallerBundleID];
    int v5 = [v4 containsString:@"jujubectl"];

    if (v5) {
      goto LABEL_5;
    }
  }
  id v17 = 0;
  long long v8 = *(_OWORD *)&self->_auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->_auditToken.val;
  *(_OWORD *)&buf[16] = v8;
  uint64_t v9 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:buf error:&v17];
  id v10 = v17;
  BOOL v11 = [(PLAssetsdConnectionAuthorization *)self trustedCallerContainingBundleRecord];

  if (v11)
  {
    uint64_t v12 = [(PLAssetsdConnectionAuthorization *)self trustedCallerContainingBundleRecord];

    uint64_t v9 = (void *)v12;
  }
  if (!v9)
  {
    BOOL v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "%@ failed to get bundle proxy with error %@", buf, 0x16u);
    }
    id v7 = 0;
    goto LABEL_14;
  }
  id v7 = 0;
  if (![0 length])
  {
    BOOL v13 = [v9 localizedName];
    id v7 = [v13 copy];
LABEL_14:
  }
  if (![v7 length])
  {
    BOOL v14 = [(PLAssetsdConnectionAuthorization *)self trustedCallerBundleID];
    uint64_t v15 = [v14 copy];

    id v7 = (id)v15;
  }

LABEL_18:
  return v7;
}

- (NSString)trustedCallerDisplayName
{
  return (NSString *)[(PLLazyObject *)self->_lazyTrustedCallerDisplayName objectValue];
}

- (id)_trustedCallerContainingBundleRecord
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F223A0]);
  BOOL v4 = [(PLAssetsdConnectionAuthorization *)self trustedCallerBundleID];
  id v13 = 0;
  int v5 = (void *)[v3 initWithBundleIdentifier:v4 error:&v13];
  id v6 = v13;

  if (v5)
  {
    id v7 = [v5 containingBundleRecord];
    long long v8 = [v7 bundleIdentifier];

    if (v8)
    {
      uint64_t v9 = [v5 containingBundleRecord];
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = [(PLAssetsdConnectionAuthorization *)self trustedCallerBundleID];
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Unable to get application record for bundleID: %@ with error: %@", buf, 0x16u);
    }
  }
  uint64_t v9 = 0;
LABEL_8:

  return v9;
}

- (LSBundleRecord)trustedCallerContainingBundleRecord
{
  return (LSBundleRecord *)[(PLLazyObject *)self->_lazytrustedCallerContainingBundleRecord objectValue];
}

- (BOOL)isClientAuthorizedForSandboxExtensions
{
  uint64_t v2 = *MEMORY[0x1E4F8BAE0];
  long long v3 = *(_OWORD *)&self->_auditToken.val[4];
  v5[0] = *(_OWORD *)self->_auditToken.val;
  v5[1] = v3;
  return [MEMORY[0x1E4F8B9D8] auditToken:v5 hasEntitlement:v2];
}

- (BOOL)isCameraClient
{
  return PLIsCameraBundleIdentifier();
}

- (BOOL)_isPreferencesClient
{
  return [(NSString *)self->_trustedCallerBundleID isEqualToString:@"com.apple.Preferences"];
}

- (BOOL)_isPhotosPickerClient
{
  if (self->_trustedCallerBundleID) {
    return objc_msgSend(&unk_1EEBF2210, "containsObject:");
  }
  else {
    return 0;
  }
}

- (BOOL)isQuickCheckReadyForAnalysisClient
{
  if ([(PLAssetsdConnectionAuthorization *)self isCameraClient]
    || [(PLAssetsdConnectionAuthorization *)self isPhotosClient]
    || [(PLAssetsdConnectionAuthorization *)self _isPhotosPickerClient]
    || [(PLAssetsdConnectionAuthorization *)self _isPreferencesClient])
  {
    return 1;
  }
  trustedCallerBundleID = self->_trustedCallerBundleID;
  return [(NSString *)trustedCallerBundleID containsString:@"photosctl"];
}

- (BOOL)isPhotosClient
{
  return [(NSString *)self->_trustedCallerBundleID isEqualToString:@"com.apple.mobileslideshow"];
}

- (void)setClientMainBundleSandboxedURL:(id)a3
{
}

- (BOOL)isClientLimitedLibraryCapable
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __65__PLAssetsdConnectionAuthorization_isClientLimitedLibraryCapable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 116);
  return result;
}

- (void)setClientLimitedLibraryCapable:(BOOL)a3
{
}

uint64_t __67__PLAssetsdConnectionAuthorization_setClientLimitedLibraryCapable___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 116) = *(unsigned char *)(result + 40);
  return result;
}

- (id)_isPhotosAccessAllowed
{
  long long v3 = [MEMORY[0x1E4F8B998] sharedInstance];
  long long v4 = *(_OWORD *)&self->_auditToken.val[4];
  v7[0] = *(_OWORD *)self->_auditToken.val;
  v7[1] = v4;
  [v3 photosAccessAllowedWithScope:7 auditToken:v7 clientAuthorization:self];

  int v5 = [NSNumber numberWithBool:PLPhotosAccessAllowed()];
  return v5;
}

- (BOOL)isClientAuthorizedForTCCServicePhotos
{
  char v2 = [(PLLazyObject *)self->_lazyPhotosAccessAllowed objectValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@(%d)", self->_trustedCallerBundleID, self->_clientProcessIdentifier];
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _isPhotosAccessAllowed];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _trustedCallerContainingBundleRecord];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _trustedCallerDisplayName];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _trustedCallerPhotoLibraryUsageDescription];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _fetchFilterIdentifier];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

id __70__PLAssetsdConnectionAuthorization_initWithConnection_daemonServices___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained _captureSessionState];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

@end