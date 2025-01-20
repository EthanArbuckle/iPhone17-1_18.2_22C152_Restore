@interface OTClique
@end

@implementation OTClique

void __47__OTClique_Framework__removeRecoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      v5 = "octagon-remove-recovery-key: removeRecoveryKey failed: %@";
      v6 = v4;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
    }
  }
  else
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v5 = "removeRecoveryKey succeeded";
      v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_6;
    }
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __62__OTClique_Framework__tlkRecoverabilityForEscrowRecord_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = secLogObjForScope();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v17 = 138412290;
      id v18 = v6;
      v9 = "tlkRecoverabilityForEscrowRecordData errored: %@";
      int v10 = v7;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
    }
  }
  else if (v8)
  {
    LOWORD(v17) = 0;
    v9 = "tlkRecoverabilityForEscrowRecordData succeeded";
    int v10 = v7;
    uint32_t v11 = 2;
    goto LABEL_6;
  }

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v5;
  id v14 = v5;

  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v6;
}

void __63__OTClique_Framework__waitForPriorityViewKeychainDataRecovery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = v3;
      id v6 = "waitForPriorityViewKeychainDataRecovery errored: %@";
      uint32_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "waitForPriorityViewKeychainDataRecovery succeeded";
    uint32_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

void __44__OTClique_Framework__fetchAccountSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = secLogObjForScope();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "fetchAccountSettings errored: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "fetchAccountSettings succeeded", (uint8_t *)&v13, 2u);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = v5;
    uint32_t v7 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void __47__OTClique_Framework__setAccountSetting_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = v3;
      id v6 = "setAccountSetting errored: %@";
      uint32_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "setAccountSetting succeeded";
    uint32_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

void __59__OTClique_Framework__fetchTrustedSecureElementIdentities___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = secLogObjForScope();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "fetchTrustedSecureElementIdentities errored: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "fetchTrustedSecureElementIdentities succeeded", (uint8_t *)&v13, 2u);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = v5;
    uint32_t v7 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void __68__OTClique_Framework__removeLocalSecureElementIdentityPeerID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = v3;
      id v6 = "removeLocalSecureElementIdentityPeerID errored: %@";
      uint32_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "removeLocalSecureElementIdentityPeerID succeeded";
    uint32_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

void __59__OTClique_Framework__setLocalSecureElementIdentity_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v11 = 138412290;
      id v12 = v3;
      id v6 = "setLocalSecureElementIdentity errored: %@";
      uint32_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    id v6 = "setLocalSecureElementIdentity succeeded";
    uint32_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

void __55__OTClique_Framework__areRecoveryKeysDistrusted_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint32_t v7 = secLogObjForScope();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v10 = 138412290;
      int v11 = v6;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "areRecoveryKeysDistrusted errored: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = @"NO";
      if (a2) {
        uint64_t v9 = @"YES";
      }
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "areRecoveryKeysDistrusted succeeded, octagon circle contains distrusted recovery keys: %@", (uint8_t *)&v10, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __47__OTClique_Framework__totalTrustedPeers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint32_t v7 = secLogObjForScope();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "totalTrustedPeers errored: %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = a1 + 32;
    int v10 = v6;
  }
  else
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "totalTrustedPeers succeeded, total count: %@", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v9 = a1 + 40;
    int v10 = v5;
  }
  uint64_t v11 = *(void *)(*(void *)v9 + 8);
  id v12 = v10;
  uint64_t v13 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v12;
}

void __81__OTClique_Framework__preflightRecoverOctagonUsingRecoveryKey_recoveryKey_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = secLogObjForScope();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Preflight recovery key errored: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      BOOL v8 = @"incorrect";
      if (a2) {
        BOOL v8 = @"correct";
      }
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, "Recovery key is %@", (uint8_t *)&v11, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
}

void __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v3;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "reset and establish returned an error: %@", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v3;
    BOOL v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "successfully reset octagon, attempting enrolling recovery key", buf, 2u);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F3B440]) initWithConfiguration:*(void *)(a1 + 40)];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_110;
    v12[3] = &unk_1E58FE350;
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    [v9 createRecoveryKey:v10 recoveryKey:v11 reply:v12];

    BOOL v8 = v13;
  }
}

void __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk: joining with recovery key failed: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = v3;
    id v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    id v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "joining with recovery key succeeded", (uint8_t *)&v8, 2u);
    }
  }
}

void __64__OTClique_Framework__recoverWithRecoveryKey_recoveryKey_error___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v15 = v3;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "octagon-recover-with-rk, failed to enroll new recovery key: %@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = v3;
    id v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
LABEL_5:

    goto LABEL_6;
  }
  int v8 = secLogObjForScope();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C7B8000, v8, OS_LOG_TYPE_DEFAULT, "successfully enrolled recovery key", buf, 2u);
  }

  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    if ([*(id *)(a1 + 32) overrideForJoinAfterRestore])
    {
      id v9 = secLogObjForScope();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19C7B8000, v9, OS_LOG_TYPE_DEFAULT, "skipping SOSCCRequestToJoinCircleAfterRestore attempt for tests", buf, 2u);
      }

      uint64_t v10 = @"success";
    }
    else
    {
      int v11 = SOSCCRequestToJoinCircleAfterRestore();
      id v12 = secLogObjForScope();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)id v15 = v11;
        *(_WORD *)&v15[4] = 2112;
        *(void *)&v15[6] = 0;
        _os_log_impl(&dword_19C7B8000, v12, OS_LOG_TYPE_DEFAULT, "Join circle after restore: %d, error: %@", buf, 0x12u);
      }

      if (v11) {
        uint64_t v10 = @"success";
      }
      else {
        uint64_t v10 = @"failure";
      }
    }
    id v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)id v15 = v10;
      *(_WORD *)&v15[8] = 2112;
      *(void *)&v15[10] = v13;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "joinAfterRestore complete: %@, error: %@", buf, 0x16u);
    }
    goto LABEL_5;
  }
LABEL_6:
}

void __83__OTClique_Framework__doesRecoveryKeyExistInOctagonAndIsCorrect_recoveryKey_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = secLogObjForScope();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v10 = 138412290;
      int v11 = v6;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "Preflight recovery key errored: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (v8)
    {
      id v9 = @"incorrect";
      if (a2) {
        id v9 = @"correct";
      }
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "Recovery key is %@", (uint8_t *)&v10, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __55__OTClique_Framework__isRecoveryKeySetInOctagon_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "octagon-is-recovery-key-set-in-octagon: isRecoveryKeySet failed: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    BOOL v8 = secLogObjForScope();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      LODWORD(v10) = a2;
      _os_log_impl(&dword_19C7B8000, v8, OS_LOG_TYPE_DEFAULT, "isRecoveryKeySet: %{BOOL}d", (uint8_t *)&v9, 8u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __67__OTClique_Framework__setRecoveryKeyWithContext_recoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "octagon-set-recovery-key, failed to set octagon recovery key error: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = v3;
    id v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    id v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "successfully set octagon recovery key", (uint8_t *)&v8, 2u);
    }
  }
}

void __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "octagon-register-recovery-key, failed to create octagon recovery key error: %@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = v3;
    id v7 = *(NSObject **)(v5 + 40);
    *(void *)(v5 + 40) = v6;
  }
  else
  {
    id v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, "successfully set octagon recovery key", (uint8_t *)&v8, 2u);
    }
  }
}

void __72__OTClique_Framework__registerRecoveryKeyWithContext_recoveryKey_error___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      uint64_t v5 = "octagon-register-recovery-key, failed to remove recovery key from octagon error: %@";
      id v6 = v4;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_19C7B8000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, v7);
    }
  }
  else
  {
    v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v5 = "successfully removed octagon recovery key";
      id v6 = v4;
      uint32_t v7 = 2;
      goto LABEL_6;
    }
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __101__OTClique_Framework___fetchAccountWideSettingsDefaultWithForceFetch_useDefault_configuration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint32_t v7 = v6;
    if (*(unsigned char *)(a1 + 48)
      && [v6 code] == 53
      && ([v7 domain],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isEqualToString:*MEMORY[0x1E4F3B468]],
          v8,
          v9))
    {
      int v10 = objc_alloc_init(OTAccountSettings);
      id v11 = objc_alloc_init(OTWalrus);
      [(OTAccountSettings *)v10 setWalrus:v11];

      uint64_t v12 = [(OTAccountSettings *)v10 walrus];
      [v12 setEnabled:0];

      uint64_t v13 = objc_alloc_init(OTWebAccess);
      [(OTAccountSettings *)v10 setWebAccess:v13];

      uint64_t v14 = [(OTAccountSettings *)v10 webAccess];
      [v14 setEnabled:1];

      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v10;

      uint64_t v17 = secLogObjForScope();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_19C7B8000, v17, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings succeeded (returning default)", (uint8_t *)&v23, 2u);
      }
      uint32_t v7 = 0;
    }
    else
    {
      uint64_t v17 = secLogObjForScope();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        v24 = v7;
        _os_log_impl(&dword_19C7B8000, v17, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings errored: %@", (uint8_t *)&v23, 0xCu);
      }
    }
  }
  else
  {
    id v18 = secLogObjForScope();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_19C7B8000, v18, OS_LOG_TYPE_DEFAULT, "fetchAccountWideSettings succeeded", (uint8_t *)&v23, 2u);
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
    id v20 = v5;
    uint32_t v7 = 0;
    uint64_t v17 = *(NSObject **)(v19 + 40);
    *(void *)(v19 + 40) = v20;
  }

  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v7;
}

void __51__OTClique_Framework__invalidateEscrowCache_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache errored: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19C7B8000, v4, OS_LOG_TYPE_DEFAULT, "invalidateEscrowCache succeeded", (uint8_t *)&v8, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint32_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __112__OTClique_Framework__handleRecoveryResults_recoveredInformation_record_performedSilentBurn_recoverError_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_7;
    }
    int v20 = 138412290;
    id v21 = v3;
    uint64_t v6 = "restore bottle errored: %@";
    uint32_t v7 = v4;
    uint32_t v8 = 12;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    LOWORD(v20) = 0;
    uint64_t v6 = "restoring bottle succeeded";
    uint32_t v7 = v4;
    uint32_t v8 = 2;
  }
  _os_log_impl(&dword_19C7B8000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
LABEL_7:

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;

  int v11 = *(unsigned __int8 *)(a1 + 56);
  double v12 = (double)(unint64_t)_OctagonSignpostGetNanoseconds() / 1000000000.0;
  uint64_t v13 = _OctagonSignpostLogSystem();
  uint64_t v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 40);
  if (v11)
  {
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v20 = 67240192;
      LODWORD(v21) = 1;
      _os_signpost_emit_with_name_impl(&dword_19C7B8000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PerformOctagonJoinForSilent", " OctagonSignpostNamePerformOctagonJoinForSilent=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForSilent}d ", (uint8_t *)&v20, 8u);
    }

    uint64_t v16 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *(void **)(a1 + 40);
      int v20 = 134218496;
      id v21 = v17;
      __int16 v22 = 2048;
      double v23 = v12;
      __int16 v24 = 1026;
      int v25 = 1;
      id v18 = "END [%lld] %fs: PerformOctagonJoinForSilent  OctagonSignpostNamePerformOctagonJoinForSilent=%{public,signpos"
            "t.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForSilent}d ";
LABEL_18:
      _os_log_impl(&dword_19C7B8000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x1Cu);
    }
  }
  else
  {
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      int v20 = 67240192;
      LODWORD(v21) = 1;
      _os_signpost_emit_with_name_impl(&dword_19C7B8000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PerformOctagonJoinForNonSilent", " OctagonSignpostNamePerformOctagonJoinForNonSilent=%{public,signpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForNonSilent}d ", (uint8_t *)&v20, 8u);
    }

    uint64_t v16 = _OctagonSignpostLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void **)(a1 + 40);
      int v20 = 134218496;
      id v21 = v19;
      __int16 v22 = 2048;
      double v23 = v12;
      __int16 v24 = 1026;
      int v25 = 1;
      id v18 = "END [%lld] %fs: PerformOctagonJoinForNonSilent  OctagonSignpostNamePerformOctagonJoinForNonSilent=%{public,s"
            "ignpost.telemetry:number1,name=OctagonSignpostNamePerformOctagonJoinForNonSilent}d ";
      goto LABEL_18;
    }
  }
}

@end