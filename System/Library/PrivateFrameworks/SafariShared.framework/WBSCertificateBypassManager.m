@interface WBSCertificateBypassManager
+ (WBSCertificateBypassManager)sharedManager;
- (BOOL)_didCertificatExceptionsApplySuccessfully:(id)a3 protectionSpace:(id)a4;
- (BOOL)didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:(id)a3 inPrivateBrowsing:(BOOL)a4;
- (WBSCertificateBypassManager)init;
- (id)_hostAndPortForProtectionSpace:(id)a3;
- (id)_readStateFromStorage;
- (void)_clearBypassesInRelationToDate:(id)a3 comparison:(int64_t)a4;
- (void)_readStateFromStorage;
- (void)clearCertificateBypassesCreatedAfterDate:(id)a3;
- (void)clearCertificateBypassesCreatedBeforeDate:(id)a3;
- (void)clearCertificateBypassesForHostIfNecessary:(id)a3 withTrust:(__SecTrust *)a4;
- (void)rememberCertificateBypassForProtectionSpace:(id)a3 inPrivateBrowsing:(BOOL)a4;
- (void)savePendingChangesBeforeTermination;
@end

@implementation WBSCertificateBypassManager

- (void)_clearBypassesInRelationToDate:(id)a3 comparison:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[(NSMutableDictionary *)self->_bypassedHostsToCertificateExceptions mutableCopy];
  bypassedHostsToCertificateExceptions = self->_bypassedHostsToCertificateExceptions;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__WBSCertificateBypassManager__clearBypassesInRelationToDate_comparison___block_invoke;
  v12[3] = &unk_1E5C8CE68;
  id v9 = v6;
  id v13 = v9;
  int64_t v15 = a4;
  id v10 = v7;
  id v14 = v10;
  [(NSMutableDictionary *)bypassedHostsToCertificateExceptions enumerateKeysAndObjectsUsingBlock:v12];
  uint64_t v11 = [(NSMutableDictionary *)self->_bypassedHostsToCertificateExceptions count];
  if (v11 != [v10 count])
  {
    objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptions, v7);
    [(WBSCoalescedAsynchronousWriter *)self->_plistWriter scheduleWrite];
  }
}

- (void)clearCertificateBypassesCreatedBeforeDate:(id)a3
{
}

void __44__WBSCertificateBypassManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WBSCertificateBypassManager);
  v1 = (void *)+[WBSCertificateBypassManager sharedManager]::manager;
  +[WBSCertificateBypassManager sharedManager]::manager = (uint64_t)v0;
}

- (WBSCertificateBypassManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)WBSCertificateBypassManager;
  v2 = [(WBSCertificateBypassManager *)&v17 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(WBSCertificateBypassManager *)v2 _readStateFromStorage];
    bypassedHostsToCertificateExceptions = v3->_bypassedHostsToCertificateExceptions;
    v3->_bypassedHostsToCertificateExceptions = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    bypassedHostsToCertificateExceptionsInPrivateBrowsing = v3->_bypassedHostsToCertificateExceptionsInPrivateBrowsing;
    v3->_bypassedHostsToCertificateExceptionsInPrivateBrowsing = (NSMutableDictionary *)v6;

    objc_initWeak(&location, v3);
    id v8 = objc_alloc(MEMORY[0x1E4F97E70]);
    id v9 = _urlForStorage();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__WBSCertificateBypassManager_init__block_invoke;
    v14[3] = &unk_1E5C8CE40;
    objc_copyWeak(&v15, &location);
    uint64_t v10 = [v8 initWithName:@"CertificateBypassesWriter" fileURL:v9 dataSourceQueue:0 plistFormat:200 plistDictionarySourceBlock:v14];
    plistWriter = v3->_plistWriter;
    v3->_plistWriter = (WBSCoalescedAsynchronousWriter *)v10;

    v12 = v3;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (id)_readStateFromStorage
{
  v2 = _urlForStorage();
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfURL:v2];
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v7 = v5;
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXCertificates();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[WBSCertificateBypassManager _readStateFromStorage](v6);
    }
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  return v7;
}

+ (WBSCertificateBypassManager)sharedManager
{
  if (+[WBSCertificateBypassManager sharedManager]::onceToken != -1) {
    dispatch_once(&+[WBSCertificateBypassManager sharedManager]::onceToken, &__block_literal_global_11);
  }
  v2 = (void *)+[WBSCertificateBypassManager sharedManager]::manager;
  return (WBSCertificateBypassManager *)v2;
}

id __35__WBSCertificateBypassManager_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained[1];

  return v2;
}

- (BOOL)didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(WBSCertificateBypassManager *)self _didCertificatExceptionsApplySuccessfully:self->_bypassedHostsToCertificateExceptions protectionSpace:v6];
  if (!v4 || v7) {
    BOOL v8 = v4 || v7;
  }
  else {
    BOOL v8 = [(WBSCertificateBypassManager *)self _didCertificatExceptionsApplySuccessfully:self->_bypassedHostsToCertificateExceptionsInPrivateBrowsing protectionSpace:v6];
  }

  return v8;
}

- (BOOL)_didCertificatExceptionsApplySuccessfully:(id)a3 protectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(WBSCertificateBypassManager *)self _hostAndPortForProtectionSpace:v7];
  id v9 = [v6 objectForKeyedSubscript:v8];

  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:v8];
    objc_msgSend(v10, "safari_dataForKey:", @"BypassedInvalidCertificateExceptionData");
    CFDataRef v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    if (v11) {
      BOOL v12 = SecTrustSetExceptions((SecTrustRef)[v7 serverTrust], v11);
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)rememberCertificateBypassForProtectionSpace:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__SecTrust *)[v6 serverTrust];
  if (v7)
  {
    CFDataRef v8 = SecTrustCopyExceptions(v7);
    id v9 = [(WBSCertificateBypassManager *)self _hostAndPortForProtectionSpace:v6];
    if (v4)
    {
      v17[0] = @"BypassedInvalidCertificateExceptionData";
      v17[1] = @"BypassedInvalidCertificateHost";
      v18[0] = v8;
      uint64_t v10 = [v6 host];
      v18[1] = v10;
      CFDataRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
      [(NSMutableDictionary *)self->_bypassedHostsToCertificateExceptionsInPrivateBrowsing setObject:v11 forKeyedSubscript:v9];
    }
    else
    {
      v15[0] = @"BypassedInvalidCertificateDate";
      BOOL v12 = [MEMORY[0x1E4F1C9C8] now];
      v16[0] = v12;
      v16[1] = v8;
      v15[1] = @"BypassedInvalidCertificateExceptionData";
      v15[2] = @"BypassedInvalidCertificateHost";
      id v13 = [v6 host];
      v16[2] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
      [(NSMutableDictionary *)self->_bypassedHostsToCertificateExceptions setObject:v14 forKeyedSubscript:v9];

      [(WBSCoalescedAsynchronousWriter *)self->_plistWriter scheduleWrite];
    }
  }
}

- (void)clearCertificateBypassesForHostIfNecessary:(id)a3 withTrust:(__SecTrust *)a4
{
  id v6 = a3;
  if (a4)
  {
    id v7 = (void *)[(NSMutableDictionary *)self->_bypassedHostsToCertificateExceptions mutableCopy];
    bypassedHostsToCertificateExceptions = self->_bypassedHostsToCertificateExceptions;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __84__WBSCertificateBypassManager_clearCertificateBypassesForHostIfNecessary_withTrust___block_invoke;
    v11[3] = &unk_1E5C8CE68;
    id v14 = a4;
    id v12 = v6;
    id v9 = v7;
    id v13 = v9;
    [(NSMutableDictionary *)bypassedHostsToCertificateExceptions enumerateKeysAndObjectsUsingBlock:v11];
    uint64_t v10 = [(NSMutableDictionary *)self->_bypassedHostsToCertificateExceptions count];
    if (v10 != [v9 count])
    {
      objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptions, v7);
      [(WBSCoalescedAsynchronousWriter *)self->_plistWriter scheduleWrite];
    }
  }
}

void __84__WBSCertificateBypassManager_clearCertificateBypassesForHostIfNecessary_withTrust___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = objc_msgSend(v5, "safari_stringForKey:", @"BypassedInvalidCertificateHost");
  id v7 = objc_msgSend(v5, "safari_dataForKey:", @"BypassedInvalidCertificateExceptionData");
  CFDataRef v8 = SecTrustCopyExceptions(*(SecTrustRef *)(a1 + 48));
  if ([v6 isEqualToString:*(void *)(a1 + 32)]
    && ([v7 isEqualToData:v8] & 1) == 0)
  {
    [*(id *)(a1 + 40) removeObjectForKey:v9];
  }
}

- (void)clearCertificateBypassesCreatedAfterDate:(id)a3
{
}

void __73__WBSCertificateBypassManager__clearBypassesInRelationToDate_comparison___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(a3, "safari_dateForKey:", @"BypassedInvalidCertificateDate");
  if ([v5 compare:*(void *)(a1 + 32)] == *(void *)(a1 + 48)) {
    [*(id *)(a1 + 40) setObject:0 forKeyedSubscript:v6];
  }
}

- (void)savePendingChangesBeforeTermination
{
}

- (id)_hostAndPortForProtectionSpace:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 host];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "port"));
  id v6 = [v5 stringValue];
  id v7 = [v4 stringByAppendingString:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plistWriter, 0);
  objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptionsInPrivateBrowsing, 0);
  objc_storeStrong((id *)&self->_bypassedHostsToCertificateExceptions, 0);
}

- (void)_readStateFromStorage
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Could not get certificate bypass plist URL", v1, 2u);
}

@end