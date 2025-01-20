@interface OTClique(Framework)
+ (BOOL)areRecoveryKeysDistrusted:()Framework error:;
+ (BOOL)invalidateEscrowCache:()Framework error:;
+ (BOOL)isRecoveryKeySetInOctagon:()Framework error:;
+ (BOOL)preflightRecoverOctagonUsingRecoveryKey:()Framework recoveryKey:error:;
+ (BOOL)recoverWithRecoveryKey:()Framework recoveryKey:error:;
+ (BOOL)setRecoveryKeyWithContext:()Framework recoveryKey:error:;
+ (NSObject)fetchAndHandleEscrowRecords:()Framework shouldFilter:error:;
+ (id)_fetchAccountWideSettingsDefaultWithForceFetch:()Framework useDefault:configuration:error:;
+ (id)createAndSetRecoveryKeyWithContext:()Framework error:;
+ (id)fetchAllEscrowRecords:()Framework error:;
+ (id)fetchEscrowRecords:()Framework error:;
+ (id)filterRecords:()Framework;
+ (id)filterViableSOSRecords:()Framework;
+ (id)handleRecoveryResults:()Framework recoveredInformation:record:performedSilentBurn:recoverError:error:;
+ (id)performEscrowRecovery:()Framework cdpContext:escrowRecord:error:;
+ (id)performSilentEscrowRecovery:()Framework cdpContext:allRecords:error:;
+ (id)recordMatchingLabel:()Framework allRecords:;
+ (id)sortListPrioritizingiOSRecords:()Framework;
+ (id)totalTrustedPeers:()Framework error:;
+ (uint64_t)doesRecoveryKeyExistInOctagonAndIsCorrect:()Framework recoveryKey:error:;
+ (uint64_t)doesRecoveryKeyExistInSOSAndIsCorrect:()Framework recoveryKey:error:;
+ (uint64_t)ensureBackupKeyExistsinSOS:()Framework;
+ (uint64_t)fetchAccountWideSettings:()Framework error:;
+ (uint64_t)fetchAccountWideSettingsDefaultWithForceFetch:()Framework configuration:error:;
+ (uint64_t)fetchAccountWideSettingsWithForceFetch:()Framework configuration:error:;
+ (uint64_t)isRecoveryKeySet:()Framework error:;
+ (uint64_t)isRecoveryKeySetInSOS:()Framework error:;
+ (uint64_t)registerRecoveryKeyInSOSAndBackup:()Framework recoveryKey:error:;
+ (uint64_t)registerRecoveryKeyWithContext:()Framework recoveryKey:error:;
- (BOOL)removeLocalSecureElementIdentityPeerID:()Framework error:;
- (BOOL)removeRecoveryKey:()Framework error:;
- (BOOL)removeRecoveryKeyFromSOSWhenInCircle:()Framework error:;
- (BOOL)setAccountSetting:()Framework error:;
- (BOOL)setLocalSecureElementIdentity:()Framework error:;
- (BOOL)waitForPriorityViewKeychainDataRecovery:()Framework;
- (id)fetchAccountSettings:()Framework;
- (id)fetchTrustedSecureElementIdentities:()Framework;
- (id)tlkRecoverabilityForEscrowRecord:()Framework error:;
- (uint64_t)deliverAKDeviceListDelta:()Framework error:;
- (unint64_t)removeRecoveryKeyFromSOSWhenNOTInCircle:()Framework error:;
@end

@implementation OTClique(Framework)

- (BOOL)removeRecoveryKey:()Framework error:
{
  v35[2] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = secLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "Removing recovery key for context:%@", (uint8_t *)&buf, 0xCu);
  }

  v28[1] = 0;
  int v8 = SOSCCThisDeviceIsInCircle();
  int v9 = SOSCCIsSOSTrustAndSyncingEnabled();
  if (v8) {
    int v10 = 0;
  }
  else {
    int v10 = v9;
  }
  if (v10 == 1)
  {
    v28[0] = 0;
    [a1 removeRecoveryKeyFromSOSWhenInCircle:v6 error:v28];
    v11 = (id *)v28;
  }
  else
  {
    uint64_t v27 = 0;
    [a1 removeRecoveryKeyFromSOSWhenNOTInCircle:v6 error:&v27];
    v11 = (id *)&v27;
  }
  id v12 = *v11;
  if (v12)
  {
    v13 = secLogObjForScope();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    v14 = "octagon-remove-recovery-key, error removing recovery key from SOS: %@";
    v15 = v13;
    uint32_t v16 = 12;
  }
  else
  {
    v13 = secLogObjForScope();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    LOWORD(buf) = 0;
    v14 = "Removed recovery key from SOS";
    v15 = v13;
    uint32_t v16 = 2;
  }
  _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&buf, v16);
LABEL_15:

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35[0] = 0;
  id obj = 0;
  v17 = [v6 makeOTControl:&obj];
  objc_storeStrong(v35, obj);
  if (v17)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v6];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__OTClique_Framework__removeRecoveryKey_error___block_invoke;
    v25[3] = &unk_1E58FE260;
    v25[4] = &buf;
    [v17 removeRecoveryKey:v18 reply:v25];

    uint64_t v19 = *((void *)&buf + 1);
    if (a4)
    {
      v20 = *(void **)(*((void *)&buf + 1) + 40);
      if (v20)
      {
        *a4 = v20;
        uint64_t v19 = *((void *)&buf + 1);
      }
    }
    BOOL v21 = *(void *)(v19 + 40) == 0;
  }
  else
  {
    v22 = secLogObjForScope();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v29 = 138412290;
      uint64_t v30 = v23;
      _os_log_impl(&dword_19C7B8000, v22, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v29, 0xCu);
    }

    BOOL v21 = 0;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v21;
}

- (unint64_t)removeRecoveryKeyFromSOSWhenNOTInCircle:()Framework error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Removing recovery key when not in circle", buf, 2u);
  }

  id v18 = 0;
  if (SOSCCPushResetCircle())
  {
    v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "successfully pushed a reset circle", buf, 2u);
    }

    int v8 = [v5 sbd];
    unint64_t v9 = (unint64_t)v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = objc_alloc_init((Class)getSecureBackupClass());
    }
    id v12 = v10;

    id v17 = 0;
    LODWORD(v9) = [v12 removeRecoveryKeyFromBackup:&v17];
    id v13 = v17;
    if (v13) {
      unint64_t v9 = 0;
    }
    else {
      unint64_t v9 = v9;
    }
    if (v9)
    {
      v14 = secLogObjForScope();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19C7B8000, v14, OS_LOG_TYPE_DEFAULT, "removed recovery key from the backup", buf, 2u);
      }
    }
    else
    {
      v15 = secLogObjForScope();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v20 = v13;
        _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to remove recovery key from the backup: %@", buf, 0xCu);
      }

      if (a4) {
        *a4 = v13;
      }
    }
  }
  else
  {
    v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v18;
      _os_log_impl(&dword_19C7B8000, v11, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to push: %@", buf, 0xCu);
    }

    unint64_t v9 = 0;
    if (a4) {
      *a4 = v18;
    }
  }

  return v9;
}

- (BOOL)removeRecoveryKeyFromSOSWhenInCircle:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Removing recovery key when device is in circle", buf, 2u);
  }

  id v27 = 0;
  int v7 = [MEMORY[0x1E4F3B430] isRecoveryKeySetInSOS:v5 error:&v27];
  id v8 = v27;
  unint64_t v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    id v26 = 0;
    int v13 = [MEMORY[0x1E4F3B430] ensureBackupKeyExistsinSOS:&v26];
    id v14 = v26;
    v15 = v14;
    if (!v13 || v14)
    {
      if (a4)
      {
        id v19 = v14;
LABEL_23:
        BOOL v12 = 0;
        *a4 = v19;
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      if (SOSCCRegisterRecoveryPublicKey())
      {
        uint32_t v16 = [v5 sbd];
        id v17 = v16;
        if (v16) {
          id v18 = v16;
        }
        else {
          id v18 = objc_alloc_init((Class)getSecureBackupClass());
        }
        uint64_t v21 = v18;

        v22 = [v21 backupForRecoveryKeyWithInfo:0];
        BOOL v12 = v22 == 0;
        if (v22)
        {
          uint64_t v23 = secLogObjForScope();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v29 = v22;
            _os_log_impl(&dword_19C7B8000, v23, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to perform backup: %@", buf, 0xCu);
          }

          if (a4) {
            *a4 = v22;
          }
        }
        else
        {
          v24 = secLogObjForScope();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19C7B8000, v24, OS_LOG_TYPE_DEFAULT, "Removed recovery key from SOS", buf, 2u);
          }
        }
        goto LABEL_35;
      }
      id v20 = secLogObjForScope();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v29 = 0;
        _os_log_impl(&dword_19C7B8000, v20, OS_LOG_TYPE_DEFAULT, "octagon-remove-recovery-key: failed to remove recovery key from SOS: %@", buf, 0xCu);
      }

      if (a4)
      {
        id v19 = 0;
        goto LABEL_23;
      }
    }
    BOOL v12 = 0;
    goto LABEL_35;
  }
  v11 = secLogObjForScope();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v29 = v9;
    _os_log_impl(&dword_19C7B8000, v11, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, recovery key not registered in SOS: %@", buf, 0xCu);
  }

  BOOL v12 = 0;
  if (a4) {
    *a4 = v9;
  }
LABEL_36:

  return v12;
}

- (uint64_t)deliverAKDeviceListDelta:()Framework error:
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [a1 ctx];
    int v9 = 138412290;
    BOOL v10 = v7;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Unimplemented deliverAKDeviceListDelta for context:%@", (uint8_t *)&v9, 0xCu);
  }
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
  }
  return 0;
}

- (id)tlkRecoverabilityForEscrowRecord:()Framework error:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = secLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "tlkRecoverabiltyForEscrowRecord invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v40 = 0;
  int v9 = [a1 ctx];
  BOOL v10 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = [v9 makeOTControl:&obj];
  objc_storeStrong(v10, obj);

  if (v11)
  {
    *(void *)&long long v31 = 0;
    *((void *)&v31 + 1) = &v31;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    v34 = __Block_byref_object_dispose_;
    id v35 = 0;
    id v12 = objc_alloc(MEMORY[0x1E4F3B440]);
    int v13 = [a1 ctx];
    id v14 = (void *)[v12 initWithConfiguration:v13];
    v15 = [v6 data];
    uint32_t v16 = [a1 ctx];
    uint64_t v17 = [v16 escrowFetchSource];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__OTClique_Framework__tlkRecoverabilityForEscrowRecord_error___block_invoke;
    v25[3] = &unk_1E58FE300;
    v25[4] = &v31;
    void v25[5] = &buf;
    [v11 tlkRecoverabilityForEscrowRecordData:v14 recordData:v15 source:v17 reply:v25];

    if (a4)
    {
      id v18 = *(void **)(*((void *)&buf + 1) + 40);
      if (v18) {
        *a4 = v18;
      }
    }
    id v19 = secLogObjForScope();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 40);
      *(_DWORD *)id v27 = 138412546;
      uint64_t v28 = v20;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl(&dword_19C7B8000, v19, OS_LOG_TYPE_DEFAULT, "views %@ supported for record %@", v27, 0x16u);
    }

    id v21 = *(id *)(*((void *)&v31 + 1) + 40);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v22 = secLogObjForScope();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40);
      LODWORD(v31) = 138412290;
      *(void *)((char *)&v31 + 4) = v23;
      _os_log_impl(&dword_19C7B8000, v22, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v31, 0xCu);
    }

    id v21 = 0;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v21;
}

- (BOOL)waitForPriorityViewKeychainDataRecovery:()Framework
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = secLogObjForScope();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19C7B8000, v5, OS_LOG_TYPE_DEFAULT, "waitForPriorityViewKeychainDataRecovery invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  int v7 = [a1 ctx];
  id v8 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  int v9 = [v7 makeOTControl:&obj];
  objc_storeStrong(v8, obj);

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F3B440]);
    uint64_t v11 = [a1 ctx];
    id v12 = (void *)[v10 initWithConfiguration:v11];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__OTClique_Framework__waitForPriorityViewKeychainDataRecovery___block_invoke;
    v19[3] = &unk_1E58FE260;
    v19[4] = &buf;
    [v9 waitForPriorityViewKeychainDataRecovery:v12 reply:v19];

    uint64_t v13 = *((void *)&buf + 1);
    if (a3)
    {
      id v14 = *(void **)(*((void *)&buf + 1) + 40);
      if (v14)
      {
        *a3 = v14;
        uint64_t v13 = *((void *)&buf + 1);
      }
    }
    BOOL v15 = *(void *)(v13 + 40) == 0;
  }
  else
  {
    uint32_t v16 = secLogObjForScope();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)id v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v21, 0xCu);
    }

    BOOL v15 = 0;
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v15;
}

- (id)fetchAccountSettings:()Framework
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = secLogObjForScope();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19C7B8000, v5, OS_LOG_TYPE_DEFAULT, "fetchAccountSettings invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  int v7 = [a1 ctx];
  id v8 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  int v9 = [v7 makeOTControl:&obj];
  objc_storeStrong(v8, obj);

  if (v9)
  {
    *(void *)&long long v20 = 0;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy_;
    uint64_t v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    id v10 = objc_alloc(MEMORY[0x1E4F3B440]);
    uint64_t v11 = [a1 ctx];
    id v12 = (void *)[v10 initWithConfiguration:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__OTClique_Framework__fetchAccountSettings___block_invoke;
    v18[3] = &unk_1E58FE2B0;
    v18[4] = &v20;
    v18[5] = &buf;
    [v9 fetchAccountSettings:v12 reply:v18];

    if (a3)
    {
      uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40);
      if (v13) {
        *a3 = v13;
      }
    }
    id v14 = *(id *)(*((void *)&v20 + 1) + 40);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    BOOL v15 = secLogObjForScope();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
      LODWORD(v20) = 138412290;
      *(void *)((char *)&v20 + 4) = v16;
      _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v20, 0xCu);
    }

    id v14 = 0;
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)setAccountSetting:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = secLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "setAccountSetting invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  int v9 = [a1 ctx];
  id v10 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = [v9 makeOTControl:&obj];
  objc_storeStrong(v10, obj);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F3B440]);
    uint64_t v13 = [a1 ctx];
    id v14 = (void *)[v12 initWithConfiguration:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__OTClique_Framework__setAccountSetting_error___block_invoke;
    v21[3] = &unk_1E58FE260;
    uint8_t v21[4] = &buf;
    [v11 setAccountSetting:v14 setting:v6 reply:v21];

    uint64_t v15 = *((void *)&buf + 1);
    if (a4)
    {
      uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
      if (v16)
      {
        *a4 = v16;
        uint64_t v15 = *((void *)&buf + 1);
      }
    }
    BOOL v17 = *(void *)(v15 + 40) == 0;
  }
  else
  {
    id v18 = secLogObjForScope();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    BOOL v17 = 0;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (id)fetchTrustedSecureElementIdentities:()Framework
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = secLogObjForScope();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19C7B8000, v5, OS_LOG_TYPE_DEFAULT, "fetchTrustedSecureElementIdentities invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  int v7 = [a1 ctx];
  id v8 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  int v9 = [v7 makeOTControl:&obj];
  objc_storeStrong(v8, obj);

  if (v9)
  {
    *(void *)&long long v20 = 0;
    *((void *)&v20 + 1) = &v20;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy_;
    uint64_t v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    id v10 = objc_alloc(MEMORY[0x1E4F3B440]);
    uint64_t v11 = [a1 ctx];
    id v12 = (void *)[v10 initWithConfiguration:v11];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__OTClique_Framework__fetchTrustedSecureElementIdentities___block_invoke;
    v18[3] = &unk_1E58FE288;
    v18[4] = &v20;
    v18[5] = &buf;
    [v9 fetchTrustedSecureElementIdentities:v12 reply:v18];

    if (a3)
    {
      uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40);
      if (v13) {
        *a3 = v13;
      }
    }
    id v14 = *(id *)(*((void *)&v20 + 1) + 40);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    uint64_t v15 = secLogObjForScope();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*((void *)&buf + 1) + 40);
      LODWORD(v20) = 138412290;
      *(void *)((char *)&v20 + 4) = v16;
      _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v20, 0xCu);
    }

    id v14 = 0;
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v14;
}

- (BOOL)removeLocalSecureElementIdentityPeerID:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = secLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "removeLocalSecureElementIdentityPeerID invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  int v9 = [a1 ctx];
  id v10 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = [v9 makeOTControl:&obj];
  objc_storeStrong(v10, obj);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F3B440]);
    uint64_t v13 = [a1 ctx];
    id v14 = (void *)[v12 initWithConfiguration:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__OTClique_Framework__removeLocalSecureElementIdentityPeerID_error___block_invoke;
    v21[3] = &unk_1E58FE260;
    uint8_t v21[4] = &buf;
    [v11 removeLocalSecureElementIdentityPeerID:v14 secureElementIdentityPeerID:v6 reply:v21];

    uint64_t v15 = *((void *)&buf + 1);
    if (a4)
    {
      uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
      if (v16)
      {
        *a4 = v16;
        uint64_t v15 = *((void *)&buf + 1);
      }
    }
    BOOL v17 = *(void *)(v15 + 40) == 0;
  }
  else
  {
    id v18 = secLogObjForScope();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    BOOL v17 = 0;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

- (BOOL)setLocalSecureElementIdentity:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = secLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a1 ctx];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "setLocalSecureElementIdentity invoked for context:%@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  int v9 = [a1 ctx];
  id v10 = (id *)(*((void *)&buf + 1) + 40);
  id obj = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = [v9 makeOTControl:&obj];
  objc_storeStrong(v10, obj);

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F3B440]);
    uint64_t v13 = [a1 ctx];
    id v14 = (void *)[v12 initWithConfiguration:v13];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__OTClique_Framework__setLocalSecureElementIdentity_error___block_invoke;
    v21[3] = &unk_1E58FE260;
    uint8_t v21[4] = &buf;
    [v11 setLocalSecureElementIdentity:v14 secureElementIdentity:v6 reply:v21];

    uint64_t v15 = *((void *)&buf + 1);
    if (a4)
    {
      uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
      if (v16)
      {
        *a4 = v16;
        uint64_t v15 = *((void *)&buf + 1);
      }
    }
    BOOL v17 = *(void *)(v15 + 40) == 0;
  }
  else
  {
    id v18 = secLogObjForScope();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v23 = 138412290;
      uint64_t v24 = v19;
      _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    BOOL v17 = 0;
    if (a4) {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  return v17;
}

+ (BOOL)areRecoveryKeysDistrusted:()Framework error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "areRecoveryKeysDistrusted invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  id v22 = 0;
  id v8 = [v5 makeOTControl:&v22];
  id v9 = v22;
  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    id v27 = __Block_byref_object_copy_;
    uint64_t v28 = __Block_byref_object_dispose_;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__OTClique_Framework__areRecoveryKeysDistrusted_error___block_invoke;
    v17[3] = &unk_1E58FE328;
    v17[4] = &buf;
    v17[5] = &v18;
    [v8 areRecoveryKeysDistrusted:v10 reply:v17];

    uint64_t v11 = *(void **)(*((void *)&buf + 1) + 40);
    if (v11)
    {
      BOOL v12 = 0;
      if (a4) {
        *a4 = v11;
      }
    }
    else
    {
      id v14 = secLogObjForScope();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        if (*((unsigned char *)v19 + 24)) {
          uint64_t v15 = @"contains";
        }
        else {
          uint64_t v15 = @"does not contain";
        }
        *(_DWORD *)uint64_t v23 = 138412290;
        uint64_t v24 = v15;
        _os_log_impl(&dword_19C7B8000, v14, OS_LOG_TYPE_DEFAULT, "Octagon circle %@ distrusted recovery keys", v23, 0xCu);
      }

      BOOL v12 = *((unsigned char *)v19 + 24) != 0;
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_19C7B8000, v13, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v12 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v12;
}

+ (id)totalTrustedPeers:()Framework error:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "totalTrustedPeers invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  id v24 = 0;
  id v8 = [v5 makeOTControl:&v24];
  id v9 = v24;
  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy_;
    uint64_t v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    char v21 = __Block_byref_object_copy_;
    id v22 = __Block_byref_object_dispose_;
    id v23 = 0;
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__OTClique_Framework__totalTrustedPeers_error___block_invoke;
    v17[3] = &unk_1E58FE3A0;
    v17[4] = &buf;
    v17[5] = &v18;
    [v8 totalTrustedPeers:v10 reply:v17];

    uint64_t v11 = *(void **)(*((void *)&buf + 1) + 40);
    if (v11)
    {
      id v12 = 0;
      if (a4) {
        *a4 = v11;
      }
    }
    else
    {
      id v14 = secLogObjForScope();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v19[5];
        *(_DWORD *)v25 = 138412290;
        uint64_t v26 = v15;
        _os_log_impl(&dword_19C7B8000, v14, OS_LOG_TYPE_DEFAULT, "Number of trusted Octagon peers: %@", v25, 0xCu);
      }

      id v12 = (id)v19[5];
    }
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_19C7B8000, v13, OS_LOG_TYPE_DEFAULT, "failed to fetch OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    id v12 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  return v12;
}

+ (BOOL)preflightRecoverOctagonUsingRecoveryKey:()Framework recoveryKey:error:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = secLogObjForScope();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19C7B8000, v9, OS_LOG_TYPE_DEFAULT, "Preflight using recovery key for context: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  id v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  obj[1] = 0;
  if ((SecPasswordValidatePasswordFormat() & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:41 description:@"malformed recovery key"];
    uint64_t v15 = secLogObjForScope();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v26 = 138412290;
      id v27 = v11;
      _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "octagon-preflight-recovery-key: recovery failed validation with error:%@", v26, 0xCu);
    }

    if (a5)
    {
      id v16 = v11;
      uint64_t v11 = v16;
LABEL_17:
      BOOL v14 = 0;
      *a5 = v16;
      goto LABEL_20;
    }
LABEL_19:
    BOOL v14 = 0;
    goto LABEL_20;
  }
  id v10 = (id *)(*((void *)&buf + 1) + 40);
  obj[0] = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = [v7 makeOTControl:obj];
  objc_storeStrong(v10, obj[0]);
  if (!v11)
  {
    BOOL v17 = secLogObjForScope();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void **)(*((void *)&buf + 1) + 40);
      *(_DWORD *)uint64_t v26 = 138412290;
      id v27 = v18;
      _os_log_impl(&dword_19C7B8000, v17, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v26, 0xCu);
    }

    if (a5)
    {
      id v16 = *(id *)(*((void *)&buf + 1) + 40);
      uint64_t v11 = 0;
      goto LABEL_17;
    }
    uint64_t v11 = 0;
    goto LABEL_19;
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __81__OTClique_Framework__preflightRecoverOctagonUsingRecoveryKey_recoveryKey_error___block_invoke;
  v20[3] = &unk_1E58FE328;
  v20[4] = &v22;
  v20[5] = &buf;
  [v11 preflightRecoverOctagonUsingRecoveryKey:v12 recoveryKey:v8 reply:v20];

  if (a5)
  {
    uint64_t v13 = *(void **)(*((void *)&buf + 1) + 40);
    if (v13) {
      *a5 = v13;
    }
  }
  BOOL v14 = *((unsigned char *)v23 + 24) != 0;
LABEL_20:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&buf, 8);

  return v14;
}

+ (BOOL)recoverWithRecoveryKey:()Framework recoveryKey:error:
{
  v70[2] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = secLogObjForScope();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_19C7B8000, v9, OS_LOG_TYPE_DEFAULT, "Recovering account trust using recovery key for context:%@", (uint8_t *)&buf, 0xCu);
  }

  id v63 = 0;
  if (SecPasswordValidatePasswordFormat())
  {
    id v62 = 0;
    uint64_t v10 = [MEMORY[0x1E4F3B430] doesRecoveryKeyExistInSOSAndIsCorrect:v7 recoveryKey:v8 error:&v62];
    id v11 = v62;
    id v61 = 0;
    uint64_t v12 = [MEMORY[0x1E4F3B430] doesRecoveryKeyExistInOctagonAndIsCorrect:v7 recoveryKey:v8 error:&v61];
    id v52 = v61;
    if (v52)
    {
      uint64_t v13 = [v52 domain];
      if (![v13 isEqualToString:*MEMORY[0x1E4F3B4B0]]) {
        goto LABEL_27;
      }
      BOOL v14 = [v52 code] == 31;

      if (v14)
      {
        uint64_t v15 = [v52 userInfo];
        uint64_t v16 = *MEMORY[0x1E4F28A50];
        uint64_t v13 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

        if (v13)
        {
          BOOL v17 = [v13 domain];
          if (![v17 isEqualToString:*MEMORY[0x1E4F3B4B8]])
          {
LABEL_26:

            goto LABEL_27;
          }
          BOOL v18 = [v13 code] == 3;

          if (v18)
          {
            uint64_t v19 = [v13 userInfo];
            uint64_t v20 = [v19 objectForKeyedSubscript:v16];

            if (v20)
            {
              char v21 = [v20 domain];
              if ([v21 isEqualToString:*MEMORY[0x1E4F28760]])
              {
                BOOL v22 = [v20 code] == -25308;

                if (v22)
                {
                  id v23 = secLogObjForScope();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v20;
                    _os_log_impl(&dword_19C7B8000, v23, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: device is locked %@", (uint8_t *)&buf, 0xCu);
                  }

                  if (a5) {
                    *a5 = v20;
                  }

                  goto LABEL_99;
                }
              }
              else
              {
              }
              BOOL v17 = v20;
            }
            else
            {
              BOOL v17 = 0;
            }
            goto LABEL_26;
          }
        }
LABEL_27:
      }
    }
    if (v10 != 3 && v12 != 3)
    {
      uint64_t v26 = secLogObjForScope();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19C7B8000, v26, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: recovery key will not work for both SOS and Octagon", (uint8_t *)&buf, 2u);
      }

      if (!a5) {
        goto LABEL_99;
      }
      if (v10 == 1 && v12 == 1)
      {
        id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:64 description:@"Recovery key is not registered"];
LABEL_95:
        BOOL v25 = 0;
        *a5 = v27;
        goto LABEL_100;
      }
      if (v12 != 2 && v10 != 2)
      {
        if (v52)
        {
          id v27 = v52;
          goto LABEL_95;
        }
        int v31 = SOSCCIsSOSTrustAndSyncingEnabled();
        if (v11) {
          int v32 = v31;
        }
        else {
          int v32 = 0;
        }
        if (v32 == 1)
        {
          id v27 = v11;
          goto LABEL_95;
        }
      }
      id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:67 description:@"Recovery key is not correct"];
      goto LABEL_95;
    }
    if (v10 != 3) {
      goto LABEL_72;
    }
    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      uint64_t v28 = [v8 dataUsingEncoding:4];
      if (!v28)
      {
        if (!a5)
        {
LABEL_99:
          BOOL v25 = 0;
          goto LABEL_100;
        }
        id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:41 description:@"Malformed recovery key"];
        goto LABEL_95;
      }
      uint64_t v29 = [v7 sbd];
      uint64_t v30 = v29;
      if (v29) {
        id v51 = v29;
      }
      else {
        id v51 = objc_alloc_init((Class)getSecureBackupClass());
      }

      id v60 = 0;
      int v33 = [v51 restoreKeychainWithBackupPassword:v28 error:&v60];
      id v34 = v60;
      if (v33)
      {
        id v35 = secLogObjForScope();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19C7B8000, v35, OS_LOG_TYPE_DEFAULT, "restoreKeychainWithBackupPassword succeeded", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        v36 = secLogObjForScope();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v34;
          _os_log_impl(&dword_19C7B8000, v36, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: restoreKeychainWithBackupPassword returned error: %@", (uint8_t *)&buf, 0xCu);
        }

        if (v12 != 3)
        {
          if (a5)
          {
            if (v34)
            {
              id v37 = v34;
            }
            else
            {
              id v37 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:66 description:@"Restore Keychain With Backup Password Failed"];
            }
            *a5 = v37;
          }

          goto LABEL_99;
        }
      }
    }
    if (v12 == 1)
    {
      if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0 && [v7 octagonCapableRecordsExist])
      {
        v38 = secLogObjForScope();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19C7B8000, v38, OS_LOG_TYPE_DEFAULT, "Recovery key exists in SOS but not in Octagon and this platform does not support SOS.  Octagon records exist, forcing iCSC restore", (uint8_t *)&buf, 2u);
        }

        if (!a5) {
          goto LABEL_99;
        }
        id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468], 65, @"recover with recovery key configuration not supported, forcing iCSC restore" code description];
        goto LABEL_95;
      }
      int v39 = 1;
    }
    else
    {
LABEL_72:
      int v39 = 0;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy_;
    v69 = __Block_byref_object_dispose_;
    v70[0] = 0;
    id obj = 0;
    id v40 = [v7 makeOTControl:&obj];
    objc_storeStrong(v70, obj);
    if (v40)
    {
      if (v39)
      {
        uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
        char v42 = [v7 isGuitarfish];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke;
        v54[3] = &unk_1E58FE378;
        p_long long buf = &buf;
        id v55 = v40;
        id v56 = v7;
        id v57 = v8;
        LOBYTE(v50) = v42;
        [v55 resetAndEstablish:v41 resetReason:5 idmsTargetContext:0 idmsCuttlefishPassword:0 notifyIdMS:0 accountSettings:0 isGuitarfish:v50 reply:v54];

        id v43 = v55;
        goto LABEL_82;
      }
      if (v12 == 3)
      {
        id v43 = (id)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_117;
        v53[3] = &unk_1E58FE260;
        v53[4] = &buf;
        [v40 recoverWithRecoveryKey:v43 recoveryKey:v8 reply:v53];
LABEL_82:

        v47 = *(void **)(*((void *)&buf + 1) + 40);
        if (a5 && v47)
        {
          *a5 = v47;
          v47 = *(void **)(*((void *)&buf + 1) + 40);
        }
        BOOL v25 = v47 == 0;
        goto LABEL_93;
      }
      v48 = secLogObjForScope();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl(&dword_19C7B8000, v48, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: joining with recovery key failed, recovery key is not correct in Octagon", v64, 2u);
      }

      if (a5)
      {
        id v46 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:67 description:@"Recovery key is not correct"];
        goto LABEL_91;
      }
    }
    else
    {
      v44 = secLogObjForScope();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v45 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v64 = 138412290;
        uint64_t v65 = v45;
        _os_log_impl(&dword_19C7B8000, v44, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: unable to create otcontrol: %@", v64, 0xCu);
      }

      if (a5)
      {
        id v46 = *(id *)(*((void *)&buf + 1) + 40);
LABEL_91:
        BOOL v25 = 0;
        *a5 = v46;
LABEL_93:

        _Block_object_dispose(&buf, 8);
LABEL_100:

        goto LABEL_101;
      }
    }
    BOOL v25 = 0;
    goto LABEL_93;
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:41 description:@"Malformed Recovery Key" underlying:v63];

  uint64_t v24 = secLogObjForScope();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_19C7B8000, v24, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: recovery failed validation with error:%@", (uint8_t *)&buf, 0xCu);
  }

  if (a5)
  {
    id v11 = v11;
    BOOL v25 = 0;
    *a5 = v11;
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_101:

  return v25;
}

+ (uint64_t)doesRecoveryKeyExistInOctagonAndIsCorrect:()Framework recoveryKey:error:
{
  v33[2] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v25 = 0;
  id v9 = [v7 makeOTControl:&v25];
  id v10 = v25;
  if (v9)
  {
    *(void *)&long long v29 = 0;
    *((void *)&v29 + 1) = &v29;
    uint64_t v30 = 0x3032000000;
    int v31 = __Block_byref_object_copy_;
    int v32 = __Block_byref_object_dispose_;
    v33[0] = 0;
    id obj = 0;
    int v11 = [MEMORY[0x1E4F3B430] isRecoveryKeySetInOctagon:v7 error:&obj];
    objc_storeStrong(v33, obj);
    if (v11 && !*(void *)(*((void *)&v29 + 1) + 40))
    {
      uint64_t v19 = secLogObjForScope();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19C7B8000, v19, OS_LOG_TYPE_DEFAULT, "recovery key is registered in Octagon, checking if it is correct", (uint8_t *)&buf, 2u);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __83__OTClique_Framework__doesRecoveryKeyExistInOctagonAndIsCorrect_recoveryKey_error___block_invoke;
      v23[3] = &unk_1E58FE328;
      uint8_t v23[4] = &v29;
      v23[5] = &buf;
      [v9 preflightRecoverOctagonUsingRecoveryKey:v20 recoveryKey:v8 reply:v23];

      if (*(unsigned char *)(*((void *)&buf + 1) + 24) && !*(void *)(*((void *)&v29 + 1) + 40))
      {
        uint64_t v17 = 3;
      }
      else
      {
        if (a5)
        {
          char v21 = *(void **)(*((void *)&v29 + 1) + 40);
          if (v21)
          {
            id v22 = v21;
          }
          else
          {
            id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:67 description:@"Recovery key is incorrect"];
          }
          *a5 = v22;
        }
        uint64_t v17 = 2;
      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v12 = secLogObjForScope();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 40);
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_19C7B8000, v12, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: recovery key not registered in Octagon, error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a5)
      {
        BOOL v14 = *(void **)(*((void *)&v29 + 1) + 40);
        if (v14)
        {
          id v15 = v14;
        }
        else
        {
          id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:64 description:@"Recovery key does not exist in Octagon"];
        }
        *a5 = v15;
      }
      uint64_t v17 = 1;
    }
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    uint64_t v16 = secLogObjForScope();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v29) = 138412290;
      *(void *)((char *)&v29 + 4) = v10;
      _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: unable to create otcontrol: %@", (uint8_t *)&v29, 0xCu);
    }

    uint64_t v17 = 0;
    if (a5) {
      *a5 = v10;
    }
  }

  return v17;
}

+ (uint64_t)doesRecoveryKeyExistInSOSAndIsCorrect:()Framework recoveryKey:error:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v27 = 0;
  int v9 = [MEMORY[0x1E4F3B430] isRecoveryKeySetInSOS:v7 error:&v27];
  id v10 = v27;
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    id v15 = secLogObjForScope();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "recovery key is registered in SOS", buf, 2u);
    }

    uint64_t v16 = [v7 sbd];
    uint64_t v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = objc_alloc_init((Class)getSecureBackupClass());
    }
    uint64_t v19 = v18;

    id v26 = 0;
    int v20 = [v19 verifyRecoveryKey:v8 error:&v26];
    id v21 = v26;
    uint64_t v12 = v21;
    if (!v20 || v21)
    {
      id v23 = secLogObjForScope();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19C7B8000, v23, OS_LOG_TYPE_DEFAULT, "recovery key is NOT correct in SOS", buf, 2u);
      }

      if (a5)
      {
        if (v12)
        {
          id v24 = v12;
        }
        else
        {
          id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:67 description:@"Recovery key is incorrect"];
        }
        *a5 = v24;
      }
      uint64_t v22 = 2;
    }
    else
    {
      uint64_t v22 = 3;
    }
  }
  else
  {
    uint64_t v12 = v10;
    uint64_t v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v29 = v12;
      _os_log_impl(&dword_19C7B8000, v13, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: Recovery Key not registered in SOS: %@", buf, 0xCu);
    }

    if (a5)
    {
      if (v12)
      {
        id v14 = v12;
        uint64_t v12 = v14;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F3B468] code:64 description:@"Recovery key does not exist in Octagon"];
      }
      *a5 = v14;
    }
    uint64_t v22 = 1;
  }

  return v22;
}

+ (uint64_t)isRecoveryKeySet:()Framework error:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Checking recovery key status for context:%@", buf, 0xCu);
  }

  id v14 = 0;
  int v7 = [MEMORY[0x1E4F3B430] isRecoveryKeySetInOctagon:v5 error:&v14];
  id v8 = v14;
  id v13 = 0;
  unsigned int v9 = [MEMORY[0x1E4F3B430] isRecoveryKeySetInSOS:v5 error:&v13];
  id v10 = v13;
  if (a4)
  {
    if ((v9 & 1) == 0 && (v7 & 1) == 0)
    {
      BOOL v11 = v8;
      if (v8 || (BOOL v11 = v10) != 0) {
        *a4 = v11;
      }
    }
  }

  return v7 | v9;
}

+ (uint64_t)isRecoveryKeySetInSOS:()Framework error:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Checking SOS recovery key status for context:%@", buf, 0xCu);
  }

  int v7 = [v5 sbd];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init((Class)getSecureBackupClass());
  }
  id v10 = v9;

  id v16 = 0;
  uint64_t v11 = [v10 isRecoveryKeySet:&v16];
  id v12 = v16;
  if (v12)
  {
    id v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_19C7B8000, v13, OS_LOG_TYPE_DEFAULT, "octagon-is-recovery-key-set-in-sos: failed to check the recovery key in SOS: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    id v14 = secLogObjForScope();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v18) = v11;
      _os_log_impl(&dword_19C7B8000, v14, OS_LOG_TYPE_DEFAULT, "recovery key set in SOS: %{BOOL}d", buf, 8u);
    }
  }
  return v11;
}

+ (BOOL)isRecoveryKeySetInOctagon:()Framework error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Checking Octagon recovery key status for context:%@", (uint8_t *)&buf, 0xCu);
  }

  id v19 = 0;
  int v7 = [v5 makeOTControl:&v19];
  id v8 = v19;
  if (v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy_;
    id v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v5];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__OTClique_Framework__isRecoveryKeySetInOctagon_error___block_invoke;
    v14[3] = &unk_1E58FE328;
    v14[4] = &buf;
    v14[5] = &v15;
    [v7 isRecoveryKeySet:v9 reply:v14];

    if (a4)
    {
      id v10 = *(void **)(*((void *)&buf + 1) + 40);
      if (v10) {
        *a4 = v10;
      }
    }
    BOOL v11 = *((unsigned char *)v16 + 24) != 0;
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v12 = secLogObjForScope();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_19C7B8000, v12, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v11 = 0;
    if (a4) {
      *a4 = v8;
    }
  }

  return v11;
}

+ (BOOL)setRecoveryKeyWithContext:()Framework recoveryKey:error:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = secLogObjForScope();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19C7B8000, v9, OS_LOG_TYPE_DEFAULT, "setRecoveryKeyWithContext invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  id v19 = 0;
  BOOL v11 = [v7 makeOTControl:&v19];
  id v12 = v19;
  if (v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy_;
    id v23 = __Block_byref_object_dispose_;
    id v24 = 0;
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__OTClique_Framework__setRecoveryKeyWithContext_recoveryKey_error___block_invoke;
    v18[3] = &unk_1E58FE260;
    v18[4] = &buf;
    [v11 createRecoveryKey:v13 recoveryKey:v8 reply:v18];

    id v14 = *(void **)(*((void *)&buf + 1) + 40);
    BOOL v15 = v14 == 0;
    if (a5 && v14) {
      *a5 = v14;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v16 = secLogObjForScope();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, "failed to make OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v15 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v15;
}

+ (id)createAndSetRecoveryKeyWithContext:()Framework error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = secLogObjForScope();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 context];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v21 = v8;
    _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "createAndSetRecoveryKeyWithContext invoked for context: %@", buf, 0xCu);
  }
  v19[1] = 0;
  id v9 = SecRKCreateRecoveryKeyString();
  id v10 = 0;
  BOOL v11 = v10;
  if (!v9 || v10)
  {
    id v16 = secLogObjForScope();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, "octagon-create-recovery-key, failed to create recovery key error: %@", buf, 0xCu);
    }

    id v15 = 0;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    v19[0] = 0;
    int v12 = [a1 registerRecoveryKeyWithContext:v6 recoveryKey:v9 error:v19];
    id v13 = v19[0];
    id v14 = v13;
    if (!v12 || v13)
    {
      uint64_t v17 = secLogObjForScope();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v21 = v14;
        _os_log_impl(&dword_19C7B8000, v17, OS_LOG_TYPE_DEFAULT, "octagon-create-recovery-key, failed to register recovery key error: %@", buf, 0xCu);
      }

      id v15 = 0;
      if (a4 && v14)
      {
        id v15 = 0;
        *a4 = v14;
      }
    }
    else
    {
      id v15 = v9;
    }
  }
  return v15;
}

+ (uint64_t)registerRecoveryKeyWithContext:()Framework recoveryKey:error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = secLogObjForScope();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v7 context];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19C7B8000, v9, OS_LOG_TYPE_DEFAULT, "registerRecoveryKeyWithContext invoked for context: %@", (uint8_t *)&buf, 0xCu);
  }
  id v30 = 0;
  BOOL v11 = [v7 makeOTControl:&v30];
  id v12 = v30;
  if (v11)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v32 = 0x3032000000;
    int v33 = __Block_byref_object_copy_;
    id v34 = __Block_byref_object_dispose_;
    id v35 = 0;
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke;
    v29[3] = &unk_1E58FE260;
    uint8_t v29[4] = &buf;
    [v11 createRecoveryKey:v13 recoveryKey:v8 reply:v29];

    id v14 = *(void **)(*((void *)&buf + 1) + 40);
    if (v14)
    {
      uint64_t v15 = 0;
      if (a5) {
        *a5 = v14;
      }
    }
    else
    {
      id v28 = 0;
      LODWORD(v15) = [MEMORY[0x1E4F3B430] registerRecoveryKeyInSOSAndBackup:v7 recoveryKey:v8 error:&v28];
      id v17 = v28;
      if (v17) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v15;
      }
      if ((v15 & 1) == 0)
      {
        uint64_t v22 = 0;
        id v23 = &v22;
        uint64_t v24 = 0x3032000000;
        uint64_t v25 = __Block_byref_object_copy_;
        id v26 = __Block_byref_object_dispose_;
        id v27 = 0;
        char v18 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v7];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke_72;
        v21[3] = &unk_1E58FE260;
        uint8_t v21[4] = &v22;
        [v11 removeRecoveryKey:v18 reply:v21];

        if (a5)
        {
          id v19 = v17;
          if (v17 || (id v19 = (void *)v23[5]) != 0) {
            *a5 = v19;
          }
        }
        _Block_object_dispose(&v22, 8);
      }
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v16 = secLogObjForScope();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, "failed to make OTControl object: %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v15 = 0;
    if (a5) {
      *a5 = v12;
    }
  }

  return v15;
}

+ (uint64_t)registerRecoveryKeyInSOSAndBackup:()Framework recoveryKey:error:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v41[1] = 0;
  int v9 = SOSCCThisDeviceIsInCircle();
  int v10 = SOSCCIsSOSTrustAndSyncingEnabled();
  if (v9) {
    int v11 = 0;
  }
  else {
    int v11 = v10;
  }
  if (v11 != 1)
  {
    uint64_t v22 = secLogObjForScope();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19C7B8000, v22, OS_LOG_TYPE_DEFAULT, "device is not participating in SOS, skipping recovery key registration", (uint8_t *)&buf, 2u);
    }

    goto LABEL_19;
  }
  v41[0] = 0;
  char v12 = [MEMORY[0x1E4F3B430] ensureBackupKeyExistsinSOS:v41];
  id v13 = v41[0];
  if (v13) {
    char v14 = 0;
  }
  else {
    char v14 = v12;
  }
  if ((v14 & 1) == 0)
  {
    uint64_t v15 = v13;
    if (a5) {
      *a5 = v13;
    }
    goto LABEL_54;
  }
  uint64_t v15 = SecRKCreateRecoveryKeyWithError();
  id v16 = 0;
  id v17 = v16;
  if (!v15 || v16)
  {
    uint64_t v24 = secLogObjForScope();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_19C7B8000, v24, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SecRKCreateRecoveryKeyWithError() failed: %@", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    [v25 setObject:@"SecRKCreateRecoveryKeyWithError() failed" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v25 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    char v26 = [MEMORY[0x1E4F3B430] isCloudServicesAvailable];
    id v27 = (void *)MEMORY[0x1E4F28C58];
    if (v26)
    {
      id v42 = 0;
      id v43 = &v42;
      uint64_t v44 = 0x2020000000;
      id v28 = (id *)getkSecureBackupErrorDomainSymbolLoc_ptr;
      uint64_t v45 = getkSecureBackupErrorDomainSymbolLoc_ptr;
      if (!getkSecureBackupErrorDomainSymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v47 = __getkSecureBackupErrorDomainSymbolLoc_block_invoke;
        v48 = &unk_1E58FE3C8;
        v49 = &v42;
        long long v29 = (void *)CloudServicesLibrary_678();
        id v30 = dlsym(v29, "kSecureBackupErrorDomain");
        *((void *)v49[1] + 3) = v30;
        getkSecureBackupErrorDomainSymbolLoc_ptr = *((void *)v49[1] + 3);
        id v28 = (id *)v43[3];
      }
      _Block_object_dispose(&v42, 8);
      if (!v28)
      {
        dlerror();
        abort_report_np();
        __break(1u);
      }
      id v31 = *v28;
      uint64_t v32 = [v27 errorWithDomain:v31 code:24 userInfo:v25];

      if (!a5) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:v25];
      if (!a5)
      {
LABEL_38:

LABEL_55:
        uint64_t v23 = 0;
        goto LABEL_56;
      }
    }
    *a5 = v32;
    goto LABEL_38;
  }
  id v42 = 0;
  if ((SecRKRegisterBackupPublicKey() & 1) == 0)
  {
    int v33 = secLogObjForScope();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v42;
      _os_log_impl(&dword_19C7B8000, v33, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SecRKRegisterBackupPublicKey() failed: %@", (uint8_t *)&buf, 0xCu);
    }

    id v34 = v42;
    if (a5)
    {
      if (v42)
      {
        id v35 = v42;
      }
      else
      {
        id v35 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:11 description:@"Failed to register backup public key"];
      }
      *a5 = v35;
    }
    else if (v42)
    {
      id v42 = 0;
      CFRelease(v34);
    }
LABEL_54:

    goto LABEL_55;
  }
  char v18 = secLogObjForScope();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "successfully registered recovery key for SOS", (uint8_t *)&buf, 2u);
  }

  id v19 = [v7 sbd];
  int v20 = v19;
  if (v19) {
    id v21 = v19;
  }
  else {
    id v21 = objc_alloc_init((Class)getSecureBackupClass());
  }
  uint64_t v36 = v21;

  id v37 = [v36 backupForRecoveryKeyWithInfo:0];
  if (v37)
  {
    v38 = secLogObjForScope();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v37;
      _os_log_impl(&dword_19C7B8000, v38, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key: failed to perform backup: %@", (uint8_t *)&buf, 0xCu);
    }

    if (a5) {
      *a5 = v37;
    }
  }
  else
  {
    int v39 = secLogObjForScope();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19C7B8000, v39, OS_LOG_TYPE_DEFAULT, "created iCloud Identity backup", (uint8_t *)&buf, 2u);
    }
  }
  if (v37) {
    goto LABEL_55;
  }
LABEL_19:
  uint64_t v23 = 1;
LABEL_56:

  return v23;
}

+ (uint64_t)ensureBackupKeyExistsinSOS:()Framework
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (const void *)SOSCCCopyMyPeerInfo();
  if (v4)
  {
    id v5 = (const void *)SOSPeerInfoCopyBackupKey();
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      id v6 = secLogObjForScope();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "backup key already registered", buf, 2u);
      }

      return 1;
    }
    int v9 = (void *)SecPasswordGenerate();
    int v10 = v9;
    if (v9)
    {
      int v11 = [v9 dataUsingEncoding:4];
      uint64_t v12 = SOSCCCopyMyPeerWithNewDeviceRecoverySecret();
      if (v12)
      {
        id v13 = (const void *)v12;
        char v14 = secLogObjForScope();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19C7B8000, v14, OS_LOG_TYPE_DEFAULT, "registered backup key", buf, 2u);
        }

        CFRelease(v13);
        return 1;
      }
      id v16 = secLogObjForScope();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = 0;
        _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SOSCCCopyMyPeerWithNewDeviceRecoverySecret() failed: %@", buf, 0xCu);
      }

      if (a3) {
        *a3 = 0;
      }
    }
    else
    {
      uint64_t v15 = secLogObjForScope();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = 0;
        _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SecPasswordGenerate() failed: %@", buf, 0xCu);
      }

      if (a3) {
        *a3 = 0;
      }
    }
  }
  else
  {
    id v8 = secLogObjForScope();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = 0;
      _os_log_impl(&dword_19C7B8000, v8, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, SOSCCCopyMyPeerInfo() failed: %@", buf, 0xCu);
    }

    if (a3) {
      *a3 = 0;
    }
  }
  return 0;
}

+ (uint64_t)fetchAccountWideSettings:()Framework error:
{
  return [MEMORY[0x1E4F3B430] _fetchAccountWideSettingsDefaultWithForceFetch:0 useDefault:0 configuration:a3 error:a4];
}

+ (uint64_t)fetchAccountWideSettingsDefaultWithForceFetch:()Framework configuration:error:
{
  return [MEMORY[0x1E4F3B430] _fetchAccountWideSettingsDefaultWithForceFetch:a3 useDefault:1 configuration:a4 error:a5];
}

+ (uint64_t)fetchAccountWideSettingsWithForceFetch:()Framework configuration:error:
{
  return [MEMORY[0x1E4F3B430] _fetchAccountWideSettingsDefaultWithForceFetch:a3 useDefault:0 configuration:a4 error:a5];
}

+ (id)_fetchAccountWideSettingsDefaultWithForceFetch:()Framework useDefault:configuration:error:
{
  v29[2] = *(id *)MEMORY[0x1E4F143B8];
  id v9 = a5;
  int v10 = secLogObjForScope();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl(&dword_19C7B8000, v10, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings invoked for context:%@ forceFetch:%{BOOL}d", buf, 0x12u);
  }

  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v27 = __Block_byref_object_copy_;
  id v28 = __Block_byref_object_dispose_;
  v29[0] = 0;
  id obj = 0;
  int v11 = [v9 makeOTControl:&obj];
  objc_storeStrong(v29, obj);
  if (v11)
  {
    *(void *)&long long v21 = 0;
    *((void *)&v21 + 1) = &v21;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy_;
    uint64_t v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v9];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __101__OTClique_Framework___fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error___block_invoke;
    v18[3] = &unk_1E58FE2D8;
    char v19 = a4;
    v18[4] = &v21;
    void v18[5] = buf;
    [v11 fetchAccountWideSettingsWithForceFetch:a3 arguments:v12 reply:v18];

    if (a6)
    {
      id v13 = *(void **)(*(void *)&buf[8] + 40);
      if (v13) {
        *a6 = v13;
      }
    }
    id v14 = *(id *)(*((void *)&v21 + 1) + 40);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    uint64_t v15 = secLogObjForScope();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
      LODWORD(v21) = 138412290;
      *(void *)((char *)&v21 + 4) = v16;
      _os_log_impl(&dword_19C7B8000, v15, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", (uint8_t *)&v21, 0xCu);
    }

    id v14 = 0;
    if (a6) {
      *a6 = *(id *)(*(void *)&buf[8] + 40);
    }
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

+ (BOOL)invalidateEscrowCache:()Framework error:
{
  void v28[2] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 context];
    id v8 = [v5 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache invoked for context:%@, altdsid:%@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  char v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  v28[0] = 0;
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id obj = 0;
  id v9 = [v5 makeOTControl:&obj];
  objc_storeStrong(v28, obj);
  if (v9)
  {
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v5];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__OTClique_Framework__invalidateEscrowCache_error___block_invoke;
    v17[3] = &unk_1E58FE238;
    v17[4] = &v19;
    v17[5] = buf;
    [v9 invalidateEscrowCache:v10 reply:v17];

    if (a4)
    {
      int v11 = *(void **)(*(void *)&buf[8] + 40);
      if (v11) {
        *a4 = v11;
      }
    }
    uint64_t v12 = secLogObjForScope();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_impl(&dword_19C7B8000, v12, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache complete", v23, 2u);
    }
  }
  else
  {
    id v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v23 = 138412290;
      uint64_t v24 = v14;
      _os_log_impl(&dword_19C7B8000, v13, OS_LOG_TYPE_DEFAULT, "unable to create otcontrol: %@", v23, 0xCu);
    }

    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
  }
  BOOL v15 = *((unsigned char *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

+ (id)performSilentEscrowRecovery:()Framework cdpContext:allRecords:error:
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v58 = a5;
  uint64_t v12 = secLogObjForScope();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 context];
    uint64_t v14 = [v10 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_19C7B8000, v12, OS_LOG_TYPE_DEFAULT, "performSilentEscrowRecovery invoked for context:%@, altdsid:%@", buf, 0x16u);
  }
  if ([a1 isCloudServicesAvailable])
  {
    BOOL v15 = _OctagonSignpostLogSystem();
    uint64_t spid = _OctagonSignpostCreate();

    uint64_t v16 = _OctagonSignpostLogSystem();
    id v17 = v16;
    unint64_t v55 = spid - 1;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19C7B8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PerformSilentEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v18 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = spid;
      _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformSilentEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    uint64_t v19 = [v10 sbd];
    int v20 = v19;
    if (v19) {
      id v56 = v19;
    }
    else {
      id v56 = objc_alloc_init((Class)getSecureBackupClass());
    }

    BOOL v22 = +[OTEscrowTranslation supportedRestorePath:v11];
    uint64_t v23 = secLogObjForScope();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_19C7B8000, v23, OS_LOG_TYPE_DEFAULT, "restore path is supported? %{BOOL}d", buf, 8u);
    }

    if (v22)
    {
      uint64_t v24 = _OctagonSignpostLogSystem();
      os_signpost_id_t v25 = _OctagonSignpostCreate();

      char v26 = _OctagonSignpostLogSystem();
      id v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "RecoverSilentWithCDPContext", " enableTelemetry=YES ", buf, 2u);
      }

      id v28 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_19C7B8000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverSilentWithCDPContext  enableTelemetry=YES ", buf, 0xCu);
      }

      id v60 = 0;
      id v29 = [v56 recoverSilentWithCDPContext:v11 allRecords:v58 error:&v60];
      id v30 = v60;
      BOOL v54 = v30 == 0;
      uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
      uint64_t v32 = _OctagonSignpostLogSystem();
      int v33 = v32;
      if (v25 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v33, OS_SIGNPOST_INTERVAL_END, v25, "RecoverSilentWithCDPContext", " OctagonSignpostNameRecoverSilentWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverSilentWithCDPContext}d ", buf, 8u);
      }

      id v34 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v66) = v30 == 0;
        _os_log_impl(&dword_19C7B8000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverSilentWithCDPContext  OctagonSignpostNameRecoverSilentWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverSilentWithCDPContext}d ", buf, 0x1Cu);
      }
    }
    else
    {
      id v34 = +[OTEscrowTranslation CDPRecordContextToDictionary:v11];
      id v35 = _OctagonSignpostLogSystem();
      os_signpost_id_t v36 = _OctagonSignpostCreate();

      id v37 = _OctagonSignpostLogSystem();
      v38 = v37;
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "PerformRecoveryFromSBD", " enableTelemetry=YES ", buf, 2u);
      }

      int v39 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl(&dword_19C7B8000, v39, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ", buf, 0xCu);
      }

      id v59 = 0;
      id v30 = [v56 recoverWithInfo:v34 results:&v59];
      id v29 = v59;
      BOOL v54 = v30 == 0;
      uint64_t v40 = _OctagonSignpostGetNanoseconds();
      uint64_t v41 = _OctagonSignpostLogSystem();
      id v42 = v41;
      if (v36 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v41))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v42, OS_SIGNPOST_INTERVAL_END, v36, "PerformRecoveryFromSBD", " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 8u);
      }

      id v43 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v40 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v66) = v30 == 0;
        _os_log_impl(&dword_19C7B8000, v43, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 0x1Cu);
      }
    }
    uint64_t v61 = 0;
    id v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v44 = (void *)getkSecureBackupRecordLabelKeySymbolLoc_ptr_703;
    uint64_t v64 = getkSecureBackupRecordLabelKeySymbolLoc_ptr_703;
    if (!getkSecureBackupRecordLabelKeySymbolLoc_ptr_703)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkSecureBackupRecordLabelKeySymbolLoc_block_invoke_704;
      v66 = &unk_1E58FE3C8;
      uint64_t v67 = &v61;
      uint64_t v45 = (void *)CloudServicesLibrary_678();
      id v46 = dlsym(v45, "kSecureBackupRecordLabelKey");
      *(void *)(v67[1] + 24) = v46;
      getkSecureBackupRecordLabelKeySymbolLoc_ptr_703 = *(void *)(v67[1] + 24);
      uint64_t v44 = (void *)v62[3];
    }
    _Block_object_dispose(&v61, 8);
    if (!v44)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v47 = [v29 objectForKeyedSubscript:*v44];
    v48 = [MEMORY[0x1E4F3B430] recordMatchingLabel:v47 allRecords:v58];
    uint64_t v21 = [MEMORY[0x1E4F3B430] handleRecoveryResults:v10 recoveredInformation:v29 record:v48 performedSilentBurn:1 recoverError:v30 error:a6];
    uint64_t v49 = _OctagonSignpostGetNanoseconds();
    uint64_t v50 = _OctagonSignpostLogSystem();
    id v51 = v50;
    if (v30)
    {
      if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v51, OS_SIGNPOST_INTERVAL_END, spid, "PerformSilentEscrowRecovery", " OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ", buf, 8u);
      }

      id v52 = _OctagonSignpostLogSystem();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v49 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v66) = 0;
    }
    else
    {
      if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v54;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v51, OS_SIGNPOST_INTERVAL_END, spid, "PerformSilentEscrowRecovery", " OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ", buf, 8u);
      }

      id v52 = _OctagonSignpostLogSystem();
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v49 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v66) = v54;
    }
    _os_log_impl(&dword_19C7B8000, v52, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformSilentEscrowRecovery  OctagonSignpostNamePerformSilentEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformSilentEscrowRecovery}d ", buf, 0x1Cu);
LABEL_54:

    goto LABEL_55;
  }
  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
    uint64_t v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = 0;
  }
LABEL_55:

  return v21;
}

+ (id)recordMatchingLabel:()Framework allRecords:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "label", (void)v14);
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)performEscrowRecovery:()Framework cdpContext:escrowRecord:error:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  char v12 = secLogObjForScope();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v9 context];
    long long v14 = [v9 altDSID];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_19C7B8000, v12, OS_LOG_TYPE_DEFAULT, "performEscrowRecovery invoked for context:%@, altdsid:%@", buf, 0x16u);
  }
  if ([a1 isCloudServicesAvailable])
  {
    long long v15 = _OctagonSignpostLogSystem();
    uint64_t spid = _OctagonSignpostCreate();

    long long v16 = _OctagonSignpostLogSystem();
    long long v17 = v16;
    unint64_t v61 = spid - 1;
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19C7B8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PerformEscrowRecovery", " enableTelemetry=YES ", buf, 2u);
    }

    uint64_t v18 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      *(void *)&uint8_t buf[4] = spid;
      _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformEscrowRecovery  enableTelemetry=YES ", buf, 0xCu);
    }

    uint64_t v19 = [v9 sbd];
    int v20 = v19;
    if (v19) {
      id v62 = v19;
    }
    else {
      id v62 = objc_alloc_init((Class)getSecureBackupClass());
    }

    BOOL v22 = +[OTEscrowTranslation supportedRestorePath:v10];
    uint64_t v23 = secLogObjForScope();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_19C7B8000, v23, OS_LOG_TYPE_DEFAULT, "restore path is supported? %{BOOL}d", buf, 8u);
    }

    if (v22)
    {
      uint64_t v24 = _OctagonSignpostLogSystem();
      os_signpost_id_t v25 = _OctagonSignpostCreate();

      char v26 = _OctagonSignpostLogSystem();
      id v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "RecoverWithCDPContext", " enableTelemetry=YES ", buf, 2u);
      }

      id v28 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v25;
        _os_log_impl(&dword_19C7B8000, v28, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: RecoverWithCDPContext  enableTelemetry=YES ", buf, 0xCu);
      }

      id v66 = 0;
      id v29 = [v62 recoverWithCDPContext:v10 escrowRecord:v11 error:&v66];
      id v30 = v66;
      BOOL v59 = v30 == 0;
      uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
      uint64_t v32 = _OctagonSignpostLogSystem();
      int v33 = v32;
      if (v25 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v33, OS_SIGNPOST_INTERVAL_END, v25, "RecoverWithCDPContext", " OctagonSignpostNameRecoverWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverWithCDPContext}d ", buf, 8u);
      }

      id v34 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)Nanoseconds / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v72) = v30 == 0;
        _os_log_impl(&dword_19C7B8000, v34, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: RecoverWithCDPContext  OctagonSignpostNameRecoverWithCDPContext=%{public,signpost.telemetry:number1,name=OctagonSignpostNameRecoverWithCDPContext}d ", buf, 0x1Cu);
      }
    }
    else
    {
      id v35 = +[OTEscrowTranslation CDPRecordContextToDictionary:v10];
      id v34 = [v35 mutableCopy];

      os_signpost_id_t v36 = [v11 escrowInformationMetadata];
      id v60 = +[OTEscrowTranslation metadataToDictionary:v36];

      uint64_t v67 = 0;
      uint64_t v68 = &v67;
      uint64_t v69 = 0x2020000000;
      id v37 = (void *)getkSecureBackupMetadataKeySymbolLoc_ptr;
      uint64_t v70 = getkSecureBackupMetadataKeySymbolLoc_ptr;
      if (!getkSecureBackupMetadataKeySymbolLoc_ptr)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getkSecureBackupMetadataKeySymbolLoc_block_invoke;
        v72 = &unk_1E58FE3C8;
        v73 = &v67;
        v38 = (void *)CloudServicesLibrary_678();
        int v39 = dlsym(v38, "kSecureBackupMetadataKey");
        *(void *)(v73[1] + 24) = v39;
        getkSecureBackupMetadataKeySymbolLoc_ptr = *(void *)(v73[1] + 24);
        id v37 = (void *)v68[3];
      }
      _Block_object_dispose(&v67, 8);
      if (!v37) {
        goto LABEL_63;
      }
      [v34 setObject:v60 forKeyedSubscript:*v37];
      uint64_t v40 = [v11 recordId];
      uint64_t v67 = 0;
      uint64_t v68 = &v67;
      uint64_t v69 = 0x2020000000;
      uint64_t v41 = (void *)getkSecureBackupRecordIDKeySymbolLoc_ptr_705;
      uint64_t v70 = getkSecureBackupRecordIDKeySymbolLoc_ptr_705;
      if (!getkSecureBackupRecordIDKeySymbolLoc_ptr_705)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getkSecureBackupRecordIDKeySymbolLoc_block_invoke_706;
        v72 = &unk_1E58FE3C8;
        v73 = &v67;
        id v42 = (void *)CloudServicesLibrary_678();
        id v43 = dlsym(v42, "kSecureBackupRecordIDKey");
        *(void *)(v73[1] + 24) = v43;
        getkSecureBackupRecordIDKeySymbolLoc_ptr_705 = *(void *)(v73[1] + 24);
        uint64_t v41 = (void *)v68[3];
      }
      _Block_object_dispose(&v67, 8);
      if (!v41)
      {
LABEL_63:
        dlerror();
        abort_report_np();
        __break(1u);
      }
      [v34 setObject:v40 forKeyedSubscript:*v41];

      uint64_t v44 = secLogObjForScope();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl(&dword_19C7B8000, v44, OS_LOG_TYPE_DEFAULT, "using sbdRecoveryArguments: %@", buf, 0xCu);
      }

      uint64_t v45 = _OctagonSignpostLogSystem();
      os_signpost_id_t v46 = _OctagonSignpostCreate();

      v47 = _OctagonSignpostLogSystem();
      v48 = v47;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "PerformRecoveryFromSBD", " enableTelemetry=YES ", buf, 2u);
      }

      uint64_t v49 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_impl(&dword_19C7B8000, v49, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: PerformRecoveryFromSBD  enableTelemetry=YES ", buf, 0xCu);
      }

      id v65 = 0;
      id v30 = [v62 recoverWithInfo:v34 results:&v65];
      id v29 = v65;
      BOOL v59 = v30 == 0;
      uint64_t v50 = _OctagonSignpostGetNanoseconds();
      id v51 = _OctagonSignpostLogSystem();
      id v52 = v51;
      if (v46 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v51))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v30 == 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v52, OS_SIGNPOST_INTERVAL_END, v46, "PerformRecoveryFromSBD", " OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 8u);
      }

      v53 = _OctagonSignpostLogSystem();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v46;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = (double)(unint64_t)v50 / 1000000000.0;
        *(_WORD *)&buf[22] = 1026;
        LODWORD(v72) = v30 == 0;
        _os_log_impl(&dword_19C7B8000, v53, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformRecoveryFromSBD  OctagonSignpostNamePerformRecoveryFromSBD=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformRecoveryFromSBD}d ", buf, 0x1Cu);
      }
    }
    uint64_t v21 = [MEMORY[0x1E4F3B430] handleRecoveryResults:v9 recoveredInformation:v29 record:v11 performedSilentBurn:0 recoverError:v30 error:a6];
    uint64_t v54 = _OctagonSignpostGetNanoseconds();
    unint64_t v55 = _OctagonSignpostLogSystem();
    id v56 = v55;
    if (v30)
    {
      if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v56, OS_SIGNPOST_INTERVAL_END, spid, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
      }

      id v57 = _OctagonSignpostLogSystem();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_59;
      }
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v54 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v72) = 0;
    }
    else
    {
      if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_DWORD *)long long buf = 67240192;
        *(_DWORD *)&uint8_t buf[4] = v59;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v56, OS_SIGNPOST_INTERVAL_END, spid, "PerformEscrowRecovery", " OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 8u);
      }

      id v57 = _OctagonSignpostLogSystem();
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_59;
      }
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = spid;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(unint64_t)v54 / 1000000000.0;
      *(_WORD *)&buf[22] = 1026;
      LODWORD(v72) = v59;
    }
    _os_log_impl(&dword_19C7B8000, v57, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: PerformEscrowRecovery  OctagonSignpostNamePerformEscrowRecovery=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformEscrowRecovery}d ", buf, 0x1Cu);
LABEL_59:

    goto LABEL_60;
  }
  if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
    uint64_t v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v21 = 0;
  }
LABEL_60:

  return v21;
}

+ (id)handleRecoveryResults:()Framework recoveredInformation:record:performedSilentBurn:recoverError:error:
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if ([a1 isCloudServicesAvailable])
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F3B430]) initWithContextData:v14];
    if (v17)
    {
      uint64_t v19 = secLogObjForScope();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_19C7B8000, v19, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: sbd escrow recovery failed: %@", (uint8_t *)&buf, 0xCu);
      }

      int v20 = 0;
      if (a8) {
        *a8 = v17;
      }
      goto LABEL_93;
    }
    uint64_t v21 = [v14 otControl];

    if (v21)
    {
      v80 = [v14 otControl];
      id v79 = 0;
    }
    else
    {
      id v85 = 0;
      v80 = [v14 makeOTControl:&v85];
      id v79 = v85;
    }
    if (!v80)
    {
      v38 = secLogObjForScope();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v79;
        _os_log_impl(&dword_19C7B8000, v38, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: unable to create otcontrol: %@", (uint8_t *)&buf, 0xCu);
      }

      int v20 = 0;
      if (a8) {
        *a8 = v79;
      }
      goto LABEL_92;
    }
    v78 = [v15 objectForKeyedSubscript:@"bottleID"];
    v76 = [v15 objectForKeyedSubscript:@"bottleValid"];
    BOOL v22 = [v15 objectForKeyedSubscript:@"EscrowServiceEscrowData"];
    v77 = [v22 objectForKeyedSubscript:@"BottledPeerEntropy"];

    if (v77) {
      BOOL v23 = v78 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    int v24 = !v23;
    int v75 = v24;
    if (v23 || ![v76 isEqualToString:@"valid"])
    {
      id v34 = secLogObjForScope();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v78;
        _os_log_impl(&dword_19C7B8000, v34, OS_LOG_TYPE_DEFAULT, "bottle %@ is not valid, resetting octagon", (uint8_t *)&buf, 0xCu);
      }

      id v82 = 0;
      objc_msgSend(v18, "resetAndEstablish:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:error:", 3, 0, 0, 0, 0, objc_msgSend(v14, "isGuitarfish"), &v82);
      id v35 = v82;
      if (v35)
      {
        os_signpost_id_t v36 = v35;
        id v37 = secLogObjForScope();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v36;
          _os_log_impl(&dword_19C7B8000, v37, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: failed to reset octagon: %@", (uint8_t *)&buf, 0xCu);
        }

        if (a8) {
          *a8 = v36;
        }

        goto LABEL_57;
      }
      int v39 = secLogObjForScope();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19C7B8000, v39, OS_LOG_TYPE_DEFAULT, "reset octagon succeeded", (uint8_t *)&buf, 2u);
      }

      unsigned int v71 = 1;
LABEL_59:
      v47 = [v14 sbd];
      v48 = v47;
      if (v47) {
        id v74 = v47;
      }
      else {
        id v74 = objc_alloc_init((Class)getSecureBackupClass());
      }

      uint64_t v49 = [MEMORY[0x1E4F1CA80] set];
      [v49 addObject:@"iCloudIdentity"];
      [v49 addObject:@"PCS-MasterKey"];
      [v49 addObject:@"KeychainV0"];
      *(void *)&long long v91 = 0;
      *((void *)&v91 + 1) = &v91;
      uint64_t v92 = 0x2020000000;
      uint64_t v50 = (void *)getkEscrowServiceRecordDataKeySymbolLoc_ptr;
      uint64_t v93 = getkEscrowServiceRecordDataKeySymbolLoc_ptr;
      if (!getkEscrowServiceRecordDataKeySymbolLoc_ptr)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v87 = (uint64_t)__getkEscrowServiceRecordDataKeySymbolLoc_block_invoke;
        v88 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E58FE3C8;
        v89 = (void (*)(uint64_t))&v91;
        id v51 = (void *)CloudServicesLibrary_678();
        id v52 = dlsym(v51, "kEscrowServiceRecordDataKey");
        *(void *)(*((void *)v89 + 1) + 24) = v52;
        getkEscrowServiceRecordDataKeySymbolLoc_ptr = *(void *)(*((void *)v89 + 1) + 24);
        uint64_t v50 = *(void **)(*((void *)&v91 + 1) + 24);
      }
      _Block_object_dispose(&v91, 8);
      if (v50)
      {
        v53 = [v15 objectForKeyedSubscript:*v50];
        if (!v53)
        {
          uint64_t v63 = secLogObjForScope();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_19C7B8000, v63, OS_LOG_TYPE_DEFAULT, "unable to request keychain restore, record data missing", (uint8_t *)&buf, 2u);
          }

          id v64 = v18;
          goto LABEL_90;
        }
        *(void *)&long long v91 = 0;
        *((void *)&v91 + 1) = &v91;
        uint64_t v92 = 0x2020000000;
        uint64_t v54 = (void *)getkSecureBackupKeybagDigestKeySymbolLoc_ptr;
        uint64_t v93 = getkSecureBackupKeybagDigestKeySymbolLoc_ptr;
        if (!getkSecureBackupKeybagDigestKeySymbolLoc_ptr)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          uint64_t v87 = (uint64_t)__getkSecureBackupKeybagDigestKeySymbolLoc_block_invoke;
          v88 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E58FE3C8;
          v89 = (void (*)(uint64_t))&v91;
          unint64_t v55 = (void *)CloudServicesLibrary_678();
          id v56 = dlsym(v55, "kSecureBackupKeybagDigestKey");
          *(void *)(*((void *)v89 + 1) + 24) = v56;
          getkSecureBackupKeybagDigestKeySymbolLoc_ptr = *(void *)(*((void *)v89 + 1) + 24);
          uint64_t v54 = *(void **)(*((void *)&v91 + 1) + 24);
        }
        _Block_object_dispose(&v91, 8);
        if (v54)
        {
          v72 = [v53 objectForKeyedSubscript:*v54];
          *(void *)&long long v91 = 0;
          *((void *)&v91 + 1) = &v91;
          uint64_t v92 = 0x2020000000;
          id v57 = (void *)getkSecureBackupBagPasswordKeySymbolLoc_ptr;
          uint64_t v93 = getkSecureBackupBagPasswordKeySymbolLoc_ptr;
          if (!getkSecureBackupBagPasswordKeySymbolLoc_ptr)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            uint64_t v87 = (uint64_t)__getkSecureBackupBagPasswordKeySymbolLoc_block_invoke;
            v88 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E58FE3C8;
            v89 = (void (*)(uint64_t))&v91;
            id v58 = (void *)CloudServicesLibrary_678();
            BOOL v59 = dlsym(v58, "kSecureBackupBagPasswordKey");
            *(void *)(*((void *)v89 + 1) + 24) = v59;
            getkSecureBackupBagPasswordKeySymbolLoc_ptr = *(void *)(*((void *)v89 + 1) + 24);
            id v57 = *(void **)(*((void *)&v91 + 1) + 24);
          }
          _Block_object_dispose(&v91, 8);
          if (v57)
          {
            uint64_t v60 = [v53 objectForKeyedSubscript:*v57];
            unint64_t v61 = (void *)v60;
            if (v72 && v60)
            {
              if (v75 && ([v76 isEqualToString:@"valid"] & 1) != 0) {
                uint64_t v62 = 1;
              }
              else {
                uint64_t v62 = v71;
              }
              id v81 = 0;
              [v74 restoreKeychainAsyncWithPassword:v61 keybagDigest:v72 haveBottledPeer:v62 viewsNotToBeRestored:v49 error:&v81];
              id v67 = v81;
              if (v67)
              {
                uint64_t v68 = secLogObjForScope();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  LODWORD(buf) = 138412290;
                  *(void *)((char *)&buf + 4) = v67;
                  _os_log_impl(&dword_19C7B8000, v68, OS_LOG_TYPE_DEFAULT, "octagontrust-handleRecoveryResults: error restoring keychain items: %@", (uint8_t *)&buf, 0xCu);
                }
              }
              id v69 = v18;
            }
            else
            {
              id v65 = secLogObjForScope();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_19C7B8000, v65, OS_LOG_TYPE_DEFAULT, "unable to request keychain restore, digest or password missing", (uint8_t *)&buf, 2u);
              }

              id v66 = v18;
            }

LABEL_90:
            int v20 = v18;
            goto LABEL_91;
          }
        }
      }
      dlerror();
      abort_report_np();
      __break(1u);
    }
    os_signpost_id_t v25 = secLogObjForScope();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v78;
      _os_log_impl(&dword_19C7B8000, v25, OS_LOG_TYPE_DEFAULT, "recovering from bottle: %@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v87 = 0x3032000000;
    v88 = __Block_byref_object_copy_;
    v89 = __Block_byref_object_dispose_;
    id v90 = 0;
    if (a6)
    {
      char v26 = _OctagonSignpostLogSystem();
      uint64_t v27 = _OctagonSignpostCreate();
      uint64_t v73 = v28;
      os_signpost_id_t v29 = v27;

      id v30 = _OctagonSignpostLogSystem();
      id v31 = v30;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(v91) = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PerformOctagonJoinForSilent", " enableTelemetry=YES ", (uint8_t *)&v91, 2u);
      }

      uint64_t v32 = _OctagonSignpostLogSystem();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_53;
      }
      LODWORD(v91) = 134217984;
      *(void *)((char *)&v91 + 4) = v29;
      int v33 = "BEGIN [%lld]: PerformOctagonJoinForSilent  enableTelemetry=YES ";
    }
    else
    {
      uint64_t v40 = _OctagonSignpostLogSystem();
      uint64_t v41 = _OctagonSignpostCreate();
      uint64_t v73 = v42;
      os_signpost_id_t v29 = v41;

      id v43 = _OctagonSignpostLogSystem();
      uint64_t v44 = v43;
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
      {
        LOWORD(v91) = 0;
        _os_signpost_emit_with_name_impl(&dword_19C7B8000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v29, "PerformOctagonJoinForNonSilent", " enableTelemetry=YES ", (uint8_t *)&v91, 2u);
      }

      uint64_t v32 = _OctagonSignpostLogSystem();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_53;
      }
      LODWORD(v91) = 134217984;
      *(void *)((char *)&v91 + 4) = v29;
      int v33 = "BEGIN [%lld]: PerformOctagonJoinForNonSilent  enableTelemetry=YES ";
    }
    _os_log_impl(&dword_19C7B8000, v32, OS_LOG_TYPE_DEFAULT, v33, (uint8_t *)&v91, 0xCu);
LABEL_53:

    uint64_t v45 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:v14];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __112__OTClique_Framework__handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error___block_invoke;
    v83[3] = &unk_1E58FE210;
    char v84 = a6;
    v83[4] = &buf;
    v83[5] = v29;
    v83[6] = v73;
    [v80 restoreFromBottle:v45 entropy:v77 bottleID:v78 reply:v83];

    os_signpost_id_t v46 = *(void **)(*((void *)&buf + 1) + 40);
    if (v46)
    {
      if (a8) {
        *a8 = v46;
      }
      _Block_object_dispose(&buf, 8);

LABEL_57:
      int v20 = 0;
LABEL_91:

LABEL_92:
LABEL_93:

      goto LABEL_94;
    }
    _Block_object_dispose(&buf, 8);

    unsigned int v71 = 0;
    goto LABEL_59;
  }
  if (a8)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
    int v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v20 = 0;
  }
LABEL_94:

  return v20;
}

+ (id)fetchEscrowRecords:()Framework error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 context];
    uint64_t v8 = [v5 altDSID];
    int v11 = 138412546;
    char v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "fetching filtered escrow records for context:%@, altdsid:%@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F3B430] fetchAndHandleEscrowRecords:v5 shouldFilter:1 error:a4];

  return v9;
}

+ (id)fetchAllEscrowRecords:()Framework error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 context];
    uint64_t v8 = [v5 altDSID];
    int v11 = 138412546;
    char v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "fetching all escrow records for context :%@, altdsid:%@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F3B430] fetchAndHandleEscrowRecords:v5 shouldFilter:0 error:a4];

  return v9;
}

+ (NSObject)fetchAndHandleEscrowRecords:()Framework shouldFilter:error:
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _OctagonSignpostLogSystem();
  os_signpost_id_t v8 = _OctagonSignpostCreate();

  id v9 = _OctagonSignpostLogSystem();
  id v10 = v9;
  unint64_t v75 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19C7B8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FetchEscrowRecords", " enableTelemetry=YES ", buf, 2u);
  }

  int v11 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_19C7B8000, v11, OS_LOG_TYPE_DEFAULT, "BEGIN [%lld]: FetchEscrowRecords  enableTelemetry=YES ", buf, 0xCu);
  }

  id v85 = 0;
  char v12 = [MEMORY[0x1E4F3B430] fetchEscrowRecordsInternal:v6 error:&v85];
  id v76 = v85;
  if (v76)
  {
    __int16 v13 = secLogObjForScope();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v76;
      _os_log_impl(&dword_19C7B8000, v13, OS_LOG_TYPE_DEFAULT, "octagontrust-fetchAndHandleEscrowRecords: failed to fetch escrow records: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v76;
    }
    uint64_t Nanoseconds = _OctagonSignpostGetNanoseconds();
    uint64_t v15 = _OctagonSignpostLogSystem();
    id v16 = v15;
    if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(void *)long long buf = 67240192;
      _os_signpost_emit_with_name_impl(&dword_19C7B8000, v16, OS_SIGNPOST_INTERVAL_END, v8, "FetchEscrowRecords", " OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 8u);
    }

    id v17 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v88 = 2048;
      double v89 = (double)(unint64_t)Nanoseconds / 1000000000.0;
      __int16 v90 = 1026;
      int v91 = 0;
      _os_log_impl(&dword_19C7B8000, v17, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 0x1Cu);
    }
    uint64_t v18 = 0;
    goto LABEL_70;
  }
  os_signpost_id_t v72 = v8;
  id v73 = v6;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  unsigned int v71 = v12;
  id obj = v12;
  uint64_t v80 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
  if (v80)
  {
    uint64_t v79 = *(void *)v82;
    v78 = v17;
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v82 != v79) {
          objc_enumerationMutation(obj);
        }
        int v20 = [[OTEscrowRecord alloc] initWithData:*(void *)(*((void *)&v81 + 1) + 8 * i)];
        uint64_t v21 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
        uint64_t v22 = [v21 bottleValidity];
        if (v22)
        {
          BOOL v23 = (void *)v22;
          int v24 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
          os_signpost_id_t v25 = [v24 bottleValidity];
          int v26 = [v25 isEqualToString:&stru_1EED4A680];

          if (!v26) {
            goto LABEL_31;
          }
        }
        else
        {
        }
        unsigned int v27 = [(OTEscrowRecord *)v20 recordViability];
        if (v27 == 2)
        {
          uint64_t v28 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
          os_signpost_id_t v29 = v28;
          id v30 = @"invalid";
          goto LABEL_30;
        }
        if (v27 <= 1)
        {
          uint64_t v28 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
          os_signpost_id_t v29 = v28;
          id v30 = @"valid";
LABEL_30:
          [v28 setBottleValidity:v30];
        }
LABEL_31:
        uint64_t v31 = [(OTEscrowRecord *)v20 recordId];
        if (!v31
          || (uint64_t v32 = (void *)v31,
              [(OTEscrowRecord *)v20 recordId],
              int v33 = objc_claimAutoreleasedReturnValue(),
              int v34 = [v33 isEqualToString:&stru_1EED4A680],
              v33,
              v32,
              v34))
        {
          id v35 = [(OTEscrowRecord *)v20 label];
          os_signpost_id_t v36 = [v35 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F3B460] withString:&stru_1EED4A680];
          id v37 = (void *)[v36 mutableCopy];
          [(OTEscrowRecord *)v20 setRecordId:v37];
        }
        v38 = [(OTEscrowRecord *)v20 serialNumber];
        if (v38)
        {
          int v11 = [(OTEscrowRecord *)v20 serialNumber];
          if (![v11 isEqualToString:&stru_1EED4A680]) {
            goto LABEL_42;
          }
        }
        int v39 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
        uint64_t v40 = [v39 peerInfo];
        if (!v40)
        {

          if (!v38) {
            goto LABEL_43;
          }
LABEL_42:

          goto LABEL_43;
        }
        uint64_t v41 = (void *)v40;
        uint64_t v42 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
        id v43 = [v42 peerInfo];
        uint64_t v44 = [v43 length];

        if (v38)
        {
        }
        id v17 = v78;
        if (v44)
        {
          uint64_t v45 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
          os_signpost_id_t v46 = [v45 peerInfo];
          v47 = (const void *)SOSPeerInfoCreateFromData();

          id v57 = (void *)SOSPeerInfoCopySerialNumber();
          [(OTEscrowRecord *)v20 setSerialNumber:v57];

          uint64_t v58 = [(OTEscrowRecord *)v20 serialNumber];
          if (!v58
            || (BOOL v59 = (void *)v58,
                [(OTEscrowRecord *)v20 serialNumber],
                uint64_t v60 = objc_claimAutoreleasedReturnValue(),
                int v61 = [v60 isEqualToString:&stru_1EED4A680],
                v60,
                v59,
                v61))
          {
            uint64_t v62 = secLogObjForScope();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_19C7B8000, v62, OS_LOG_TYPE_DEFAULT, "attempted to use peer info's serial number and failed, using metadata", buf, 2u);
            }

            uint64_t v63 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
            id v64 = [v63 serial];
            [(OTEscrowRecord *)v20 setSerialNumber:v64];
          }
          if (v47) {
            CFRelease(v47);
          }
          goto LABEL_59;
        }
LABEL_43:
        v48 = [(OTEscrowRecord *)v20 serialNumber];
        if (v48)
        {
          id v6 = [(OTEscrowRecord *)v20 serialNumber];
          if (([v6 isEqualToString:&stru_1EED4A680] & 1) == 0) {
            goto LABEL_51;
          }
        }
        uint64_t v49 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
        uint64_t v50 = [v49 serial];
        if (!v50)
        {

          if (!v48) {
            goto LABEL_59;
          }
LABEL_51:

          goto LABEL_59;
        }
        id v51 = (void *)v50;
        id v52 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
        v53 = [v52 serial];
        char v54 = [v53 isEqualToString:&stru_1EED4A680];

        if (v48)
        {
        }
        id v17 = v78;
        if ((v54 & 1) == 0)
        {
          unint64_t v55 = [(OTEscrowRecord *)v20 escrowInformationMetadata];
          id v56 = [v55 serial];
          [(OTEscrowRecord *)v20 setSerialNumber:v56];
        }
LABEL_59:
        [v17 addObject:v20];
      }
      uint64_t v80 = [obj countByEnumeratingWithState:&v81 objects:v86 count:16];
    }
    while (v80);
  }

  uint64_t v65 = _OctagonSignpostGetNanoseconds();
  id v66 = _OctagonSignpostLogSystem();
  id v67 = v66;
  if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
  {
    *(_DWORD *)long long buf = 67240192;
    *(_DWORD *)&uint8_t buf[4] = 1;
    _os_signpost_emit_with_name_impl(&dword_19C7B8000, v67, OS_SIGNPOST_INTERVAL_END, v72, "FetchEscrowRecords", " OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 8u);
  }

  uint64_t v68 = _OctagonSignpostLogSystem();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    *(void *)&uint8_t buf[4] = v72;
    __int16 v88 = 2048;
    double v89 = (double)(unint64_t)v65 / 1000000000.0;
    __int16 v90 = 1026;
    int v91 = 1;
    _os_log_impl(&dword_19C7B8000, v68, OS_LOG_TYPE_DEFAULT, "END [%lld] %fs: FetchEscrowRecords  OctagonSignpostNameFetchEscrowRecords=%{public,signpost.telemetry:number1,name=OctagonSignpostNameFetchEscrowRecords}d ", buf, 0x1Cu);
  }

  id v6 = v73;
  char v12 = v71;
  if (a4)
  {
    id v69 = [MEMORY[0x1E4F3B430] filterRecords:v17];
  }
  else
  {
    id v69 = v17;
    id v17 = v69;
  }
  uint64_t v18 = v69;
LABEL_70:

  return v18;
}

+ (id)filterRecords:()Framework
{
  id v74 = a1;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v75 = [MEMORY[0x1E4F1CA48] array];
  id v82 = [MEMORY[0x1E4F1CA48] array];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v96 objects:v111 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v97;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v97 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v96 + 1) + 8 * v8);
        if (!objc_msgSend(v9, "recordViability", v74))
        {
          id v17 = [v9 escrowInformationMetadata];
          uint64_t v18 = [v17 bottleId];
          if (v18)
          {
            uint64_t v19 = (void *)v18;
            int v20 = [v9 escrowInformationMetadata];
            uint64_t v21 = [v20 bottleId];
            uint64_t v22 = [v21 length];

            id v16 = v4;
            if (v22) {
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        if ([v9 recordViability] == 1)
        {
          id v10 = [v9 escrowInformationMetadata];
          uint64_t v11 = [v10 bottleId];
          if (v11)
          {
            char v12 = (void *)v11;
            __int16 v13 = [v9 escrowInformationMetadata];
            id v14 = [v13 bottleId];
            uint64_t v15 = [v14 length];

            id v16 = v75;
            if (v15) {
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        id v16 = v82;
LABEL_16:
        [v16 addObject:v9];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v23 = [obj countByEnumeratingWithState:&v96 objects:v111 count:16];
      uint64_t v6 = v23;
    }
    while (v23);
  }

  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v24 = v4;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v92 objects:v110 count:16];
  v78 = v24;
  if (v25)
  {
    uint64_t v26 = v25;
    id v27 = *(id *)v93;
    id v80 = *(id *)v93;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(id *)v93 != v27) {
          objc_enumerationMutation(v24);
        }
        os_signpost_id_t v29 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        id v30 = secLogObjForScope();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = [v29 label];
          uint64_t v32 = [v29 escrowInformationMetadata];
          int v33 = [v32 serial];
          int v34 = [v29 escrowInformationMetadata];
          id v35 = [v34 bottleId];
          int v36 = [v29 silentAttemptAllowed];
          *(_DWORD *)long long buf = 138413058;
          v103 = v31;
          __int16 v104 = 2112;
          v105 = v33;
          __int16 v106 = 2112;
          v107 = v35;
          __int16 v108 = 1024;
          int v109 = v36;
          _os_log_impl(&dword_19C7B8000, v30, OS_LOG_TYPE_DEFAULT, "viable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d", buf, 0x26u);

          id v24 = v78;
          id v27 = v80;
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v92 objects:v110 count:16];
    }
    while (v26);
  }

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v81 = v75;
  uint64_t v37 = [v81 countByEnumeratingWithState:&v88 objects:v101 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v89;
    uint64_t v76 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v38; ++j)
      {
        if (*(void *)v89 != v39) {
          objc_enumerationMutation(v81);
        }
        uint64_t v41 = *(void **)(*((void *)&v88 + 1) + 8 * j);
        uint64_t v42 = secLogObjForScope();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          id v43 = [v41 label];
          uint64_t v44 = [v41 escrowInformationMetadata];
          uint64_t v45 = [v44 serial];
          os_signpost_id_t v46 = [v41 escrowInformationMetadata];
          v47 = [v46 bottleId];
          int v48 = [v41 silentAttemptAllowed];
          *(_DWORD *)long long buf = 138413058;
          v103 = v43;
          __int16 v104 = 2112;
          v105 = v45;
          __int16 v106 = 2112;
          v107 = v47;
          __int16 v108 = 1024;
          int v109 = v48;
          _os_log_impl(&dword_19C7B8000, v42, OS_LOG_TYPE_DEFAULT, "partially viable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d", buf, 0x26u);

          uint64_t v39 = v76;
        }
      }
      uint64_t v38 = [v81 countByEnumeratingWithState:&v88 objects:v101 count:16];
    }
    while (v38);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v83 = v82;
  uint64_t v49 = [v83 countByEnumeratingWithState:&v84 objects:v100 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v85;
    uint64_t v77 = *(void *)v85;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v85 != v51) {
          objc_enumerationMutation(v83);
        }
        v53 = *(void **)(*((void *)&v84 + 1) + 8 * k);
        char v54 = secLogObjForScope();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v55 = [v53 label];
          id v56 = [v53 escrowInformationMetadata];
          id v57 = [v56 serial];
          uint64_t v58 = [v53 escrowInformationMetadata];
          BOOL v59 = [v58 bottleId];
          int v60 = [v53 silentAttemptAllowed];
          *(_DWORD *)long long buf = 138413058;
          v103 = v55;
          __int16 v104 = 2112;
          v105 = v57;
          __int16 v106 = 2112;
          v107 = v59;
          __int16 v108 = 1024;
          int v109 = v60;
          _os_log_impl(&dword_19C7B8000, v54, OS_LOG_TYPE_DEFAULT, "nonviable record: %@ serial:%@ bottleID:%@ silent allowed:%{BOOL}d", buf, 0x26u);

          uint64_t v51 = v77;
        }
      }
      uint64_t v50 = [v83 countByEnumeratingWithState:&v84 objects:v100 count:16];
    }
    while (v50);
  }

  if ([v78 count])
  {
    int v61 = secLogObjForScope();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      int v62 = [v78 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v103) = v62;
      _os_log_impl(&dword_19C7B8000, v61, OS_LOG_TYPE_DEFAULT, "Returning %d viable records", buf, 8u);
    }

    uint64_t v63 = v74;
    id v64 = v78;
LABEL_55:
    uint64_t v67 = objc_msgSend(v63, "sortListPrioritizingiOSRecords:", v64, v74);
LABEL_56:
    uint64_t v68 = (void *)v67;
    goto LABEL_57;
  }
  if ([v81 count])
  {
    uint64_t v65 = secLogObjForScope();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      int v66 = [v81 count];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v103) = v66;
      _os_log_impl(&dword_19C7B8000, v65, OS_LOG_TYPE_DEFAULT, "Returning %d partially viable records", buf, 8u);
    }

    uint64_t v63 = v74;
    id v64 = v81;
    goto LABEL_55;
  }
  if (!SOSCCIsSOSTrustAndSyncingEnabled())
  {
    id v73 = secLogObjForScope();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19C7B8000, v73, OS_LOG_TYPE_DEFAULT, "no viable records!", buf, 2u);
    }

    uint64_t v67 = [MEMORY[0x1E4F1C978] array];
    goto LABEL_56;
  }
  uint64_t v70 = [v74 filterViableSOSRecords:v83];
  unsigned int v71 = secLogObjForScope();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    int v72 = [v70 count];
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v103) = v72;
    _os_log_impl(&dword_19C7B8000, v71, OS_LOG_TYPE_DEFAULT, "Returning %d sos viable records", buf, 8u);
  }

  uint64_t v68 = [v74 sortListPrioritizingiOSRecords:v70];

LABEL_57:
  return v68;
}

+ (id)sortListPrioritizingiOSRecords:()Framework
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = [v9 escrowInformationMetadata];
        uint64_t v11 = [v10 clientMetadata];
        if ([v11 hasSecureBackupUsesNumericPassphrase])
        {
          [v9 escrowInformationMetadata];
          v13 = char v12 = v4;
          id v14 = [v13 clientMetadata];
          uint64_t v15 = [v14 secureBackupUsesNumericPassphrase];

          v4 = v12;
          id v16 = v12;
          if (v15) {
            goto LABEL_11;
          }
        }
        else
        {
        }
        id v16 = v19;
LABEL_11:
        [v16 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  [v4 addObjectsFromArray:v19];
  return v4;
}

+ (id)filterViableSOSRecords:()Framework
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "viabilityStatus", (void)v12) == 1) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end