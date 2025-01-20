@interface PKAppletSubcredentialManagementSession
+ (id)createSessionWithDelegate:(id)a3;
- (id)trackSubcredential:(id)a3 deviceData:(id)a4 attestation:(id)a5;
- (id)trackSubcredential:(id)a3 encryptedContainer:(id)a4 withReceipt:(id)a5;
- (void)accountAttestationRequestForCredential:(id)a3 completion:(id)a4;
- (void)accountAttestationRequestForManufacturer:(id)a3 completion:(id)a4;
- (void)commitUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6;
- (void)credentialDidActivateWithCredential:(id)a3 completion:(id)a4;
- (void)deleteCredential:(id)a3 completionHandler:(id)a4;
- (void)hasUpgradeAvailableForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completion:(id)a6;
- (void)immobilizerTokensCountForCredential:(id)a3 completion:(id)a4;
- (void)listCredentialsWithCompletion:(id)a3;
- (void)listReceivedSharingInvitationsWithCompletion:(id)a3;
- (void)listSharingInvitationsForKeyIdentifier:(id)a3 withCompletion:(id)a4;
- (void)preWarmForManufacturer:(id)a3 completion:(id)a4;
- (void)removeSharedCredentialsWithIdentifiers:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)rescindInvitations:(id)a3 onCredential:(id)a4 withCompletion:(id)a5;
- (void)revertUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6;
- (void)revokeSharedCredentials:(id)a3 onCredential:(id)a4 withCompletion:(id)a5;
- (void)revokeSharesWithGroupIdentifiers:(id)a3 shouldCascade:(BOOL)a4 credential:(id)a5 completion:(id)a6;
- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8;
- (void)updateCredentialConfigurationForCredential:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)upgradeKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completion:(id)a7;
@end

@implementation PKAppletSubcredentialManagementSession

+ (id)createSessionWithDelegate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKDASession *)[PKAppletSubcredentialManagementSession alloc] initWithDelegate:v4];

  v6 = [MEMORY[0x1E4F5F4E8] sharedManager];
  v7 = [v6 createManagementSessionWithDelegate:v5];

  if (v7)
  {
    [(PKDASession *)v5 setSession:v7];
    v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      id v13 = a1;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Starting management session: %p", (uint8_t *)&v12, 0xCu);
    }

    v9 = v5;
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create management session!", (uint8_t *)&v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (void)listCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(PKDASession *)self state] == 2)
    {
      v5 = [(PKDASession *)self session];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __72__PKAppletSubcredentialManagementSession_listCredentialsWithCompletion___block_invoke;
      v7[3] = &unk_1E56D90D8;
      id v8 = v4;
      [v5 listKeysWithHandler:v7];
    }
    else
    {
      v6 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for enumeration operation", buf, 2u);
      }

      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

void __72__PKAppletSubcredentialManagementSession_listCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v20 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = (uint64_t)v7;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Failed to list keys with error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = [v5 count];
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "list Credentials count: %lu", buf, 0xCu);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v16 = [PKAppletSubcredential alloc];
          v17 = -[PKAppletSubcredential initWithKeyInformation:](v16, "initWithKeyInformation:", v15, (void)v21);
          if (v17) {
            [v8 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    v19 = (void *)[v8 copy];
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v19);
  }
}

- (void)revokeSharedCredentials:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v23 + 1) + 8 * v16) identifier];
          [v11 safelyAddObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [(PKDASession *)self session];
    v19 = [v9 identifier];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__PKAppletSubcredentialManagementSession_revokeSharedCredentials_onCredential_withCompletion___block_invoke;
    v21[3] = &unk_1E56EF270;
    id v22 = v10;
    [v18 revokeKeysWithIdentifiers:v11 sharedByOwnerKeyWithIdentifier:v19 callback:v21];

    goto LABEL_14;
  }
  v20 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", buf, 2u);
  }

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v11);
LABEL_14:
  }
}

void __94__PKAppletSubcredentialManagementSession_revokeSharedCredentials_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = v7;
      id v10 = "Failed to revoke credentials with error: %@";
      id v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = [[PKSubcredentialEncryptedContainer alloc] initWithRequest:v5];
    if (v8) {
      goto LABEL_10;
    }
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      id v10 = "Failed to parse attestation while revoking credentials";
      id v11 = v9;
      uint32_t v12 = 2;
LABEL_8:
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }

  id v8 = 0;
LABEL_10:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, PKSubcredentialEncryptedContainer *, void *))(v13 + 16))(v13, v8, v7);
  }
}

- (void)revokeSharesWithGroupIdentifiers:(id)a3 shouldCascade:(BOOL)a4 credential:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([(PKDASession *)self state] == 2)
  {
    if (v8) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v8) {
      int v14 = v10;
    }
    else {
      int v14 = 0;
    }
    id v15 = v14;
    id v16 = v13;
    v17 = [(PKDASession *)self session];
    uint64_t v18 = [v11 identifier];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __111__PKAppletSubcredentialManagementSession_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke;
    v21[3] = &unk_1E56EF270;
    id v22 = v12;
    [v17 revokeNodesWithGroupIdentifiers:v16 treesWithGroupIdentifier:v15 authorizedByKeyWithIdentifier:v18 callback:v21];

    v19 = v22;
    goto LABEL_13;
  }
  v20 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", buf, 2u);
  }

  if (v12)
  {
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v19);
LABEL_13:
  }
}

void __111__PKAppletSubcredentialManagementSession_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v7;
      id v10 = "Failed to revoke credentials with error: %@";
      id v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v8 = [[PKSubcredentialEncryptedContainer alloc] initWithRequest:v5];
    if (v8) {
      goto LABEL_10;
    }
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      id v10 = "Failed to parse attestation while revoking credentials";
      id v11 = v9;
      uint32_t v12 = 2;
LABEL_8:
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }

  BOOL v8 = 0;
LABEL_10:
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, PKSubcredentialEncryptedContainer *, void *))(v13 + 16))(v13, v8, v7);
  }
}

- (void)rescindInvitations:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v23 + 1) + 8 * v16) identifier];
          if (v17) {
            [v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [(PKDASession *)self session];
    v19 = [v9 identifier];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89__PKAppletSubcredentialManagementSession_rescindInvitations_onCredential_withCompletion___block_invoke;
    v21[3] = &unk_1E56D8388;
    id v22 = v10;
    [v18 cancelInvitationsWithIdentifiers:v11 sentByOwnerKeyWithIdentifier:v19 callback:v21];

    goto LABEL_16;
  }
  v20 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", buf, 2u);
  }

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, id))v10 + 2))(v10, v11);
LABEL_16:
  }
}

void __89__PKAppletSubcredentialManagementSession_rescindInvitations_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to revoke invitations with error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)trackSubcredential:(id)a3 encryptedContainer:(id)a4 withReceipt:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    id v11 = PKDAAlishaKeyEncryptedRequestFromSubcredentialEncryptedRequest(v9);
    id v12 = [(PKDASession *)self session];
    uint64_t v13 = [v8 identifier];
    uint64_t v14 = [v12 setTrackingReceipt:v10 vehicleMobilizationData:v11 forKeyWithIdentifier:v13];
  }
  else
  {
    uint64_t v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for track operation", v17, 2u);
    }

    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  }

  return v14;
}

- (id)trackSubcredential:(id)a3 deviceData:(id)a4 attestation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    id v11 = [(PKDASession *)self session];
    id v12 = [v8 identifier];
    uint64_t v13 = [v11 setTrackingReceipt:v10 decryptedDeviceData:v9 forKeyWithIdentifier:v12];
  }
  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for track operation", v16, 2u);
    }

    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
  }

  return v13;
}

- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v19)
  {
    if ([(PKDASession *)self state] == 2)
    {
      v20 = [v16 dataUsingEncoding:4];
      long long v25 = [v17 dataUsingEncoding:4];
      long long v21 = [v18 identifier];
      id v22 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v21;
        _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Requesting data signing for key identifier: %@", buf, 0xCu);
      }

      long long v23 = [(PKDASession *)self session];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __101__PKAppletSubcredentialManagementSession_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke;
      v26[3] = &unk_1E56F3870;
      id v27 = v19;
      [v23 signAppData:v14 appBundleIdentifier:v20 nonce:v25 auth:v15 keyIdentifier:v21 callback:v26];
    }
    else
    {
      long long v24 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for signing operation", buf, 2u);
      }

      v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
      (*((void (**)(id, void, void, void *))v19 + 2))(v19, 0, 0, v20);
    }
  }
}

void __101__PKAppletSubcredentialManagementSession_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v9;
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Signing response with error: %@", (uint8_t *)&v11, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)immobilizerTokensCountForCredential:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v8 = [v6 identifier];
      id v9 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v8;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Requesting immo token count for credential: %@", buf, 0xCu);
      }

      id v10 = [(PKDASession *)self session];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __89__PKAppletSubcredentialManagementSession_immobilizerTokensCountForCredential_completion___block_invoke;
      v13[3] = &unk_1E56F3898;
      id v14 = v8;
      id v15 = v7;
      id v11 = v8;
      [v10 countImmobilizerTokensForKeyWithIdentifier:v11 callback:v13];
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for token count operation", buf, 2u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

uint64_t __89__PKAppletSubcredentialManagementSession_immobilizerTokensCountForCredential_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = a3;
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Got immo token count / depth for credential (%@): %lu / %lu", (uint8_t *)&v9, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeSharedCredentialsWithIdentifiers:(id)a3 credential:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    __int16 v11 = [v9 identifier];
    uint64_t v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v21 = v11;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Removing shared credentials from KML (%@): %@", buf, 0x16u);
    }

    __int16 v13 = [(PKDASession *)self session];
    uint64_t v14 = [v8 allObjects];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __103__PKAppletSubcredentialManagementSession_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke;
    v17[3] = &unk_1E56D9528;
    id v18 = v11;
    id v19 = v10;
    id v15 = v11;
    [v13 removeSharedKeysWithIdentifiers:v14 ownerKeyWithIdentifier:v15 callback:v17];

    goto LABEL_9;
  }
  id v16 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for token count operation", buf, 2u);
  }

  if (v10)
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:0];
    (*((void (**)(id, id))v10 + 2))(v10, v15);
LABEL_9:
  }
}

void __103__PKAppletSubcredentialManagementSession_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Removed shared credentials from KML (%@): %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)listSharingInvitationsForKeyIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PKDASession *)self session];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96__PKAppletSubcredentialManagementSession_listSharingInvitationsForKeyIdentifier_withCompletion___block_invoke;
  v10[3] = &unk_1E56D90D8;
  id v11 = v6;
  id v9 = v6;
  [v8 listSharingInvitationsForKeyIdentifier:v7 callback:v10];
}

void __96__PKAppletSubcredentialManagementSession_listSharingInvitationsForKeyIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    __int16 v22 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = (uint64_t)v7;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Failed to list sharing invitations with error: %@", buf, 0xCu);
    }

    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
    }
  }
  else
  {
    uint64_t v24 = a1;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = [v5 count];
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "list sharing invitations found %lu invites", buf, 0xCu);
    }

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v25 = v5;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v16 = [[PKPassCredentialShare alloc] initWithInvitationData:v15];
          id v17 = [v15 sharingSessionIdentifier];
          id v18 = [v17 UUIDString];

          id v19 = [v8 objectForKeyedSubscript:v18];
          if (!v19)
          {
            id v19 = objc_alloc_init(PKPassShare);
            [(PKPassShare *)v19 setIdentifier:v18];
            [(PKPassShare *)v19 setRecipientNickname:@"[Name]"];
            [v8 setObject:v19 forKeyedSubscript:v18];
          }
          [(PKPassShare *)v19 addCredentialShare:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }

    uint64_t v20 = *(void *)(v24 + 32);
    if (v20)
    {
      long long v21 = [v8 allValues];
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
    }
    id v7 = 0;
    id v5 = v25;
  }
}

- (void)listReceivedSharingInvitationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = [(PKDASession *)self session];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__PKAppletSubcredentialManagementSession_listReceivedSharingInvitationsWithCompletion___block_invoke;
  v9[3] = &unk_1E56DD728;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  [v6 listReceivedSharingInvitationsWithCallback:v9];
}

void __87__PKAppletSubcredentialManagementSession_listReceivedSharingInvitationsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v5 || v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = (uint64_t)v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Failed to list received sharing invitations with error: %@", buf, 0xCu);
    }

    uint64_t v19 = *(void *)(a1 + 40);
    if (v19) {
      (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = [v5 count];
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "list received invitations: %lu", buf, 0xCu);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v15 = [[PKPassCredentialShare alloc] initWithInvitationData:v14];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [v14 invitationState];
            *(_DWORD *)buf = 134217984;
            uint64_t v26 = v16;
            _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "list received DAKeySharingInvitationData state: %ld", buf, 0xCu);
          }

          if (v15) {
            [*(id *)(a1 + 32) addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    id v6 = 0;
    if (v17)
    {
      id v18 = (void *)[*(id *)(a1 + 32) copy];
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
    }
  }
}

- (void)deleteCredential:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKDASession *)self state] == 2)
  {
    BOOL v8 = [(PKDASession *)self session];
    [v8 deleteKey:v6 completionHandler:v7];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for revoke operation", v10, 2u);
    }

    if (v7) {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
}

- (void)accountAttestationRequestForManufacturer:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKDASession *)self state] == 2)
    {
      BOOL v8 = [(PKDASession *)self session];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke;
      v13[3] = &unk_1E56F38C0;
      id v15 = v7;
      void v13[4] = self;
      id v14 = v6;
      [v8 preWarmForManufacturer:v14 callback:v13];

      id v9 = v15;
    }
    else
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
      }

      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"Session not active";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v12 = [v11 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v9];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    }
  }
}

void __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to prewarm for binding attestation request data error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) session];
    id v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke_31;
    v7[3] = &unk_1E56EF248;
    id v8 = v6;
    id v9 = *(id *)(a1 + 48);
    [v5 requestBindingAttestationDataForManufacturer:v8 callback:v7];
  }
}

void __94__PKAppletSubcredentialManagementSession_accountAttestationRequestForManufacturer_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get binding attestation request for manufacturer (%@) with error: %@", (uint8_t *)&v11, 0x16u);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = [[PKAppletSubcredentialAccountAttestationRequest alloc] initWithRequestData:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)accountAttestationRequestForCredential:(id)a3 completion:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v8 = [(PKDASession *)self session];
      id v9 = [v6 identifier];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __92__PKAppletSubcredentialManagementSession_accountAttestationRequestForCredential_completion___block_invoke;
      v14[3] = &unk_1E56EF248;
      id v15 = v6;
      id v16 = v7;
      [v8 requestBindingAttestationDataForKeyWithIdentifier:v9 callback:v14];

      uint64_t v10 = v15;
    }
    else
    {
      int v11 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKAppletSubcredentialManagementSession: Session is in invalid state for account attestation", buf, 2u);
      }

      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28228];
      v19[0] = @"Session not active";
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      __int16 v13 = [v12 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v10];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
    }
  }
}

void __92__PKAppletSubcredentialManagementSession_accountAttestationRequestForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) identifier];
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKAppletSubcredentialManagementSession: Failed to get binding attestation request for credential (%@) with error: %@", (uint8_t *)&v11, 0x16u);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = [[PKAppletSubcredentialAccountAttestationRequest alloc] initWithRequestData:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)preWarmForManufacturer:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([(PKDASession *)self state] == 2)
    {
      id v8 = [(PKDASession *)self session];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __76__PKAppletSubcredentialManagementSession_preWarmForManufacturer_completion___block_invoke;
      v13[3] = &unk_1E56D9528;
      id v14 = v6;
      id v15 = v7;
      [v8 preWarmForManufacturer:v14 callback:v13];

      id v9 = v14;
    }
    else
    {
      uint64_t v10 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for accepting sharing operation", buf, 2u);
      }

      int v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28228];
      v18[0] = @"Session not active";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v12 = [v11 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v9];
      (*((void (**)(id, void *))v7 + 2))(v7, v12);
    }
  }
}

void __76__PKAppletSubcredentialManagementSession_preWarmForManufacturer_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get binding attestation request for manufacturer (%@) with error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialDidActivateWithCredential:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(PKDASession *)self state] == 2)
  {
    id v9 = [(PKDASession *)self session];
    uint64_t v10 = [v7 identifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__PKAppletSubcredentialManagementSession_credentialDidActivateWithCredential_completion___block_invoke;
    v13[3] = &unk_1E56D9528;
    id v14 = v7;
    id v15 = v8;
    [v9 handleActivationForKeyWithIdentifier:v10 callback:v13];
  }
  else
  {
    int v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v12;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", buf, 0xCu);
    }
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

void __89__PKAppletSubcredentialManagementSession_credentialDidActivateWithCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to notify KML that credential %@ activated with error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)updateCredentialConfigurationForCredential:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(PKDASession *)self state] == 2)
  {
    uint64_t v12 = [(PKDASession *)self session];
    __int16 v13 = [v9 identifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __110__PKAppletSubcredentialManagementSession_updateCredentialConfigurationForCredential_configuration_completion___block_invoke;
    v16[3] = &unk_1E56D9528;
    id v17 = v9;
    id v18 = v11;
    [v12 updateConfiguration:v10 forKeyWithIdentifier:v13 completionHandler:v16];
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      long long v20 = v15;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", buf, 0xCu);
    }
    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
}

void __110__PKAppletSubcredentialManagementSession_updateCredentialConfigurationForCredential_configuration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) identifier];
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Failed to notify KML that credential %@ activated with error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)hasUpgradeAvailableForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if ([(PKDASession *)self state] == 2)
  {
    id v14 = [(PKDASession *)self session];
    id v15 = [v11 identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __114__PKAppletSubcredentialManagementSession_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke;
    v18[3] = &unk_1E56F38E8;
    id v19 = v13;
    [v14 hasUpgradeAvailableForKeyWithIdentifier:v15 versionType:2 * (a4 != 1) versions:v12 completionHandler:v18];
  }
  else
  {
    id v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      long long v22 = v17;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", buf, 0xCu);
    }
    if (v13)
    {
      v20[0] = a4;
      memset(&v20[1], 0, 24);
      (*((void (**)(id, void *, void))v13 + 2))(v13, v20, 0);
    }
  }
}

void __114__PKAppletSubcredentialManagementSession_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  long long v8 = *(_OWORD *)(a2 + 16);
  id v6 = a3;
  if (v4 > 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_1916756B8[v4];
  }
  uint64_t v9 = v7;
  char v10 = v5;
  long long v11 = v8;
  (*(void (**)(uint64_t, uint64_t *, id))(v3 + 16))(v3, &v9, v6);
}

- (void)upgradeKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completion:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = (void (**)(id, void))a7;
  if ([(PKDASession *)self state] == 2)
  {
    id v16 = [(PKDASession *)self session];
    id v17 = [v13 identifier];
    [v16 upgradeKeyWithIdentifier:v17 versionType:2 * (a4 != 1) version:a5 upgradeInformation:v14 completionHandler:v15];
  }
  else
  {
    id v18 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = NSStringFromSelector(a2);
      int v20 = 138412290;
      uint64_t v21 = v19;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", (uint8_t *)&v20, 0xCu);
    }
    if (v15) {
      v15[2](v15, 0);
    }
  }
}

- (void)commitUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (void (**)(id, void))a6;
  if ([(PKDASession *)self state] == 2)
  {
    id v13 = [(PKDASession *)self session];
    id v14 = [v11 identifier];
    [v13 commitUpgradeForKeyWithIdentifier:v14 versionType:2 * (a4 != 1) version:a5 completionHandler:v12];
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", (uint8_t *)&v17, 0xCu);
    }
    if (v12) {
      v12[2](v12, 0);
    }
  }
}

- (void)revertUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (void (**)(id, void))a6;
  if ([(PKDASession *)self state] == 2)
  {
    id v13 = [(PKDASession *)self session];
    id v14 = [v11 identifier];
    [v13 revertUpgradeForKeyWithIdentifier:v14 versionType:2 * (a4 != 1) version:a5 completionHandler:v12];
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(a2);
      int v17 = 138412290;
      id v18 = v16;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Session is in invalid state for %@", (uint8_t *)&v17, 0xCu);
    }
    if (v12) {
      v12[2](v12, 0);
    }
  }
}

@end