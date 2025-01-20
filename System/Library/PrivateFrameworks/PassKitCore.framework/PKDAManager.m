@interface PKDAManager
+ (BOOL)isCarKeySupportedForManufacturerIdentifier:(id)a3 issuerIdentifier:(id)a4 productPlanIdentifier:(id)a5;
+ (BOOL)isSupported;
- (BOOL)deletePrivacyKey:(id)a3 outError:(id *)a4;
- (BOOL)hasLongTermPrivacyKeyForGroupIdentifier:(id)a3;
- (PKDAManager)init;
- (id)createPrivacyKeyForGroupIdentifier:(id)a3 outError:(id *)a4;
- (id)decryptData:(id)a3 withCredential:(id)a4 ephemeralPublicKey:(id)a5;
- (id)decryptPayload:(id)a3 groupIdentifier:(id)a4 outError:(id *)a5;
- (id)description;
- (id)privacyKeysForGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 outError:(id *)a5;
- (id)storeSEBlobForSubcredentialIdentifier:(id)a3 seBlob:(id)a4;
- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 transportChannelIdentifier:(id)a4 activationCode:(id)a5 encryptedProductPlanIdentifierContainer:(id)a6 completion:(id)a7;
- (void)acceptInvitationWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)accountAttestationRequestForManufacturer:(id)a3 completion:(id)a4;
- (void)accountAttestionRequestForCredential:(id)a3 withCompletion:(id)a4;
- (void)commitUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6;
- (void)createAliroHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 homeIdentifier:(id)a7 withCompletion:(id)a8;
- (void)createAliroHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 withCompletion:(id)a6;
- (void)createInviteForShare:(id)a3 forCredential:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSilentInviteForSharingSessionIdentifier:(id)a3 completion:(id)a4;
- (void)credentialDidActivateWithCredential:(id)a3 completion:(id)a4;
- (void)declineSharingInvitation:(id)a3 completion:(id)a4;
- (void)declineSharingInvitationWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteCredential:(id)a3 completion:(id)a4;
- (void)deleteCredentials:(id)a3 completion:(id)a4;
- (void)deleteCredentialsForIdentifiers:(id)a3 completion:(id)a4;
- (void)deleteCredentialsForReaderIdentifiers:(id)a3 completion:(id)a4;
- (void)deviceCredentialForIdentifier:(id)a3 completion:(id)a4;
- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4;
- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4;
- (void)generateTransactionKeyWithSession:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 completion:(id)a7;
- (void)getPretrackRequestForKeyWithIdentifier:(id)a3 withCompletion:(id)a4;
- (void)getProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5;
- (void)handleOutstandingMessage:(id)a3 subcredentialIdentifier:(id)a4 credentialShareIdentifier:(id)a5 transportIdentifier:(id)a6 completion:(id)a7;
- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)hasUpgradeAvailableForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completion:(id)a6;
- (void)immobilizerTokensCountForCredential:(id)a3 completion:(id)a4;
- (void)listCredentialsWithCompletion:(id)a3;
- (void)listCredentialsWithSession:(id)a3 seid:(id)a4 completion:(id)a5;
- (void)listDACredentialsWithSession:(id)a3 seid:(id)a4 completion:(id)a5;
- (void)outstandingInvitesForCredential:(id)a3 completion:(id)a4;
- (void)preWarmForManufacturer:(id)a3 completion:(id)a4;
- (void)prewarmWithManufacturerIdentifier:(id)a3 completion:(id)a4;
- (void)probeTerminalForPairingStatusWithCompletion:(id)a3;
- (void)rejectInvitation:(id)a3 completion:(id)a4;
- (void)removeSharedCredentialsWithIdentifiers:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)requestSharingInvitation:(id)a3 from:(id)a4 completion:(id)a5;
- (void)rescindInvitations:(id)a3 onCredential:(id)a4 withCompletion:(id)a5;
- (void)retryActivationCode:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)retryActivationCodeForCredentialIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)retryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)revertUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6;
- (void)revokeSharedCredentials:(id)a3 onCredential:(id)a4 withCompletion:(id)a5;
- (void)revokeSharesWithGroupIdentifiers:(id)a3 shouldCascade:(BOOL)a4 credential:(id)a5 completion:(id)a6;
- (void)routingInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendSharingInvitation:(id)a3 forInvitationRequest:(id)a4 completion:(id)a5;
- (void)sendSharingInvitationWithRequest:(id)a3 auth:(id)a4 completion:(id)a5;
- (void)setAccountAttestation:(id)a3 forCredential:(id)a4 withCompletion:(id)a5;
- (void)setEncryptedProductPlanIdentifierContainer:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5;
- (void)setTransportChannelIdentifier:(id)a3 forCredential:(id)a4 forCredentialShare:(id)a5 completion:(id)a6;
- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8;
- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5;
- (void)statusForReceivedSharingInvitationWithIdentifier:(id)a3 completion:(id)a4;
- (void)statusForSentSharingInvitationWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateCredentialConfigurationForCredential:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)updateTrackingAttestation:(id)a3 forCredential:(id)a4 encryptedContainer:(id)a5 completion:(id)a6;
- (void)upgradeKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completion:(id)a7;
@end

@implementation PKDAManager

- (PKDAManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PKDAManager;
  v2 = [(PKDAManager *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passkit.damanager.work", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = [[PKDAPairingSessionManager alloc] initWithQueue:v2->_workQueue sessionCreationBlock:&__block_literal_global_45];
    pairingSessionManager = v2->_pairingSessionManager;
    v2->_pairingSessionManager = v5;

    v7 = [[PKDASessionManager alloc] initWithQueue:v2->_workQueue sessionCreationBlock:&__block_literal_global_129];
    managementSessionManager = v2->_managementSessionManager;
    v2->_managementSessionManager = v7;

    v9 = [[PKDASessionManager alloc] initWithQueue:v2->_workQueue sessionCreationBlock:&__block_literal_global_132_0];
    sharingSessionManager = v2->_sharingSessionManager;
    v2->_sharingSessionManager = v9;
  }
  return v2;
}

id __19__PKDAManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PKAppletSubcredentialPairingSession createSessionWithDelegate:a2];
}

id __19__PKDAManager_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[PKAppletSubcredentialManagementSession createSessionWithDelegate:a2];
}

id __19__PKDAManager_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[PKAppletSubcredentialSharingSession createSessionWithDelegate:a2];
}

+ (BOOL)isSupported
{
  return [MEMORY[0x1E4F5F4E8] isSupported];
}

+ (BOOL)isCarKeySupportedForManufacturerIdentifier:(id)a3 issuerIdentifier:(id)a4 productPlanIdentifier:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  char v5 = [MEMORY[0x1E4F5F4E8] isCarKeySupportedForManufacturer:a3 brand:a4 ppid:a5 error:&v9];
  id v6 = v9;
  if (v6)
  {
    v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager: Failed to check isCarKeySupported: %@", buf, 0xCu);
    }
  }
  return v5;
}

- (void)listCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = self->_managementSessionManager;
    managementSessionManager = self->_managementSessionManager;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PKDAManager_listCredentialsWithCompletion___block_invoke;
    v8[3] = &unk_1E56E0988;
    id v9 = v5;
    id v10 = v4;
    v7 = v5;
    [(PKDASessionManager *)managementSessionManager performBlockWithSession:v8];
  }
}

void __45__PKDAManager_listCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PKDAManager_listCredentialsWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56E0730;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  id v9 = v8;
  if (v5) {
    [v5 listCredentialsWithCompletion:v8];
  }
  else {
    (*((void (**)(void *, void))v8 + 2))(v8, 0);
  }
}

uint64_t __45__PKDAManager_listCredentialsWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    dispatch_queue_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)listCredentialsWithSession:(id)a3 seid:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F5F4E8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PKDAManager_listCredentialsWithSession_seid_completion___block_invoke;
    v10[3] = &unk_1E56D90B0;
    id v11 = v7;
    id v12 = v8;
    [v9 listKeysWithSession:a3 seid:v11 callback:v10];
  }
}

void __58__PKDAManager_listCredentialsWithSession_seid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v19 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Failed to list keys on seid %@ with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = [PKAppletSubcredential alloc];
          v16 = -[PKAppletSubcredential initWithKeyInformation:](v15, "initWithKeyInformation:", v14, (void)v21);
          if (v16) {
            [v8 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    uint64_t v17 = *(void *)(a1 + 40);
    v18 = (void *)[v8 copy];
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
  }
}

- (void)listDACredentialsWithSession:(id)a3 seid:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F5F4E8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__PKDAManager_listDACredentialsWithSession_seid_completion___block_invoke;
    v10[3] = &unk_1E56D90B0;
    id v11 = v7;
    id v12 = v8;
    [v9 listKeysWithSession:a3 seid:v11 callback:v10];
  }
}

void __60__PKDAManager_listDACredentialsWithSession_seid_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
      uint64_t v14 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to list keys on seid %@ with error: %@", (uint8_t *)&v11, 0x16u);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (void)revokeSharedCredentials:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke;
  v16[3] = &unk_1E56E0780;
  uint64_t v17 = v11;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  uint64_t v15 = v11;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56E0758;
  id v13 = *(id *)(a1 + 32);
  id v7 = v6;
  id v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v8 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v5)
  {
    [v5 revokeSharedCredentials:*(void *)(a1 + 40) onCredential:*(void *)(a1 + 48) withCompletion:v8];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get session to revoke shared credentials with.", v11, 2u);
    }

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    v8[2](v8, 0, v10);
  }
}

void __67__PKDAManager_revokeSharedCredentials_onCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)revokeSharesWithGroupIdentifiers:(id)a3 shouldCascade:(BOOL)a4 credential:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = self->_managementSessionManager;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke;
  v18[3] = &unk_1E56E07A8;
  id v19 = v13;
  id v20 = v10;
  BOOL v23 = a4;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  uint64_t v17 = v13;
  [(PKDASessionManager *)v17 performBlockWithSession:v18];
}

void __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E0758;
  id v13 = *(id *)(a1 + 32);
  id v7 = v6;
  id v14 = v7;
  id v15 = *(id *)(a1 + 56);
  id v8 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v5)
  {
    [v5 revokeSharesWithGroupIdentifiers:*(void *)(a1 + 40) shouldCascade:*(unsigned __int8 *)(a1 + 64) credential:*(void *)(a1 + 48) completion:v8];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get session to revoke shared credentials with.", v11, 2u);
    }

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    v8[2](v8, 0, v10);
  }
}

void __84__PKDAManager_revokeSharesWithGroupIdentifiers_shouldCascade_credential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)rescindInvitations:(id)a3 onCredential:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke;
  v16[3] = &unk_1E56E0780;
  uint64_t v17 = v11;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = v11;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56E07D0;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 56);
  id v7 = v6;
  id v15 = v7;
  id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v5)
  {
    [v5 rescindInvitations:*(void *)(a1 + 40) onCredential:*(void *)(a1 + 48) withCompletion:v8];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Unable to get session to revoke shared credentials with.", v11, 2u);
    }

    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    v8[2](v8, v10);
  }
}

void __62__PKDAManager_rescindInvitations_onCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    id v3 = v6;
  }
}

- (void)updateTrackingAttestation:(id)a3 forCredential:(id)a4 encryptedContainer:(id)a5 completion:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v16 = 0;
    goto LABEL_7;
  }
  id v14 = [v12 data];
  id v15 = [v12 rawEphemeralPublicKey];
  id v16 = [(PKDAManager *)self decryptData:v14 withCredential:v11 ephemeralPublicKey:v15];

  if (v16)
  {
LABEL_7:
    id v18 = self->_managementSessionManager;
    managementSessionManager = self->_managementSessionManager;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __85__PKDAManager_updateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke;
    v22[3] = &unk_1E56E07F8;
    BOOL v23 = v18;
    id v24 = v11;
    id v25 = v16;
    id v26 = v10;
    id v27 = v13;
    id v20 = v16;
    id v21 = v18;
    [(PKDASessionManager *)managementSessionManager performBlockWithSession:v22];

    goto LABEL_8;
  }
  uint64_t v17 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v11;
    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Failed to decrypt data to track credential %@", buf, 0xCu);
  }

  (*((void (**)(id, void))v13 + 2))(v13, 0);
LABEL_8:
}

void __85__PKDAManager_updateTrackingAttestation_forCredential_encryptedContainer_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 trackSubcredential:a1[5] deviceData:a1[6] attestation:a1[7]];
    BOOL v8 = v7 == 0;
    if (v7)
    {
      id v9 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = a1[5];
        int v12 = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to track credential %@: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  uint64_t v11 = a1[8];
  if (v11) {
    (*(void (**)(uint64_t, BOOL))(v11 + 16))(v11, v8);
  }
  if (v6) {
    v6[2](v6);
  }
}

- (void)declineSharingInvitation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 identifier];
  [(PKDAManager *)self declineSharingInvitationWithIdentifier:v7 completion:v6];
}

- (void)declineSharingInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = self->_sharingSessionManager;
    sharingSessionManager = self->_sharingSessionManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PKDAManager_declineSharingInvitationWithIdentifier_completion___block_invoke;
    v11[3] = &unk_1E56E0C70;
    int v12 = v8;
    id v13 = v6;
    id v14 = v7;
    uint64_t v10 = v8;
    [(PKDASessionManager *)sharingSessionManager performBlockWithSession:v11];
  }
}

void __65__PKDAManager_declineSharingInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  [a2 cancelSharingInvitationWithIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    id v5 = v6;
  }
}

- (void)sendSharingInvitationWithRequest:(id)a3 auth:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self->_sharingSessionManager;
  sharingSessionManager = self->_sharingSessionManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke;
  v17[3] = &unk_1E56E0C20;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  uint64_t v16 = v11;
  [(PKDASessionManager *)sharingSessionManager performBlockWithSession:v17];
}

void __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E0820;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  id v7 = v6;
  id v13 = v7;
  id v8 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v5)
  {
    [v5 sendSharingInvitationWithRequest:*(void *)(a1 + 40) auth:*(void *)(a1 + 48) completion:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    v8[2](v8, 0, v9);
  }
}

void __64__PKDAManager_sendSharingInvitationWithRequest_auth_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v5);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

- (void)sendSharingInvitation:(id)a3 forInvitationRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_sharingSessionManager;
  sharingSessionManager = self->_sharingSessionManager;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke;
  v17[3] = &unk_1E56E0C20;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  uint64_t v16 = v11;
  [(PKDASessionManager *)sharingSessionManager performBlockWithSession:v17];
}

void __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E0848;
  id v11 = *(id *)(a1 + 32);
  id v7 = v6;
  id v12 = v7;
  id v13 = *(id *)(a1 + 56);
  id v8 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v5)
  {
    [v5 sendSharingInvitation:*(void *)(a1 + 40) forInvitationRequest:*(void *)(a1 + 48) completion:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    v8[2](v8, 0, v9);
  }
}

void __69__PKDAManager_sendSharingInvitation_forInvitationRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }
}

- (void)probeTerminalForPairingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->_pairingSessionManager;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke;
    v7[3] = &unk_1E56E0898;
    id v8 = v5;
    id v9 = v4;
    uint64_t v6 = v5;
    [(PKDASessionManager *)v6 performBlockWithSession:v7];
  }
}

void __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E56E0870;
  id v17 = *(id *)(a1 + 40);
  id v7 = v6;
  id v18 = v7;
  id v8 = _Block_copy(aBlock);
  int v9 = [*(id *)(a1 + 32) isProbingTerminalPairingStatus];
  id v10 = PKLogFacilityTypeGetObject(0x16uLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Already probing terminal", v15, 2u);
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Probing terminal...", v15, 2u);
    }

    [*(id *)(a1 + 32) setProbingTerminalPairingStatus:1];
    if (!v5
      || ([v5 probeTerminalForPairingStatus],
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v14))
    {
      (*((void (**)(void *, void, void))v8 + 2))(v8, 0, 0);
      goto LABEL_11;
    }
  }
  id v12 = [*(id *)(a1 + 32) probingCompletionBlocks];
  id v13 = _Block_copy(v8);
  [v12 addObject:v13];

LABEL_11:
}

uint64_t __59__PKDAManager_probeTerminalForPairingStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)prewarmWithManufacturerIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_pairingSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke;
  v12[3] = &unk_1E56E08E8;
  id v14 = v6;
  id v15 = v7;
  id v13 = v8;
  id v9 = v6;
  id v10 = v7;
  BOOL v11 = v8;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E08C0;
  id v16 = *(id *)(a1 + 48);
  id v7 = v6;
  id v17 = v7;
  id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (!v5)
  {
    BOOL v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = 1;
LABEL_7:
    id v13 = [v11 errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:v12 userInfo:0];
    v8[2](v8, v13);
    goto LABEL_11;
  }
  id v9 = [*(id *)(a1 + 32) prewarmCompletion];

  if (v9)
  {
    id v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Outstanding prewarm operation in progress", v14, 2u);
    }

    BOOL v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  id v13 = [v5 prewarmWithManufacturerIdentifier:*(void *)(a1 + 40)];
  if (v13) {
    v8[2](v8, v13);
  }
  [*(id *)(a1 + 32) setPrewarmCompletion:v8];
LABEL_11:
}

void __60__PKDAManager_prewarmWithManufacturerIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    id v3 = v6;
  }
}

- (id)decryptData:(id)a3 withCredential:(id)a4 ephemeralPublicKey:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v7 identifier];
  BOOL v11 = SESEndPointPrivacyDecryption();

  id v12 = 0;
  id v13 = v11;
  if (v12)
  {
    id v14 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v7 identifier];
      *(_DWORD *)buf = 138412546;
      id v19 = v15;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Failed to decrypt data for credential '%@' with error: %@", buf, 0x16u);
    }
    id v13 = 0;
  }
  id v16 = v13;

  return v16;
}

- (void)requestSharingInvitation:(id)a3 from:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = self->_sharingSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke;
  v16[3] = &unk_1E56E0C20;
  id v17 = v11;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = v11;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke_2;
  id v13 = &unk_1E56E08C0;
  id v14 = *(id *)(a1 + 56);
  id v7 = v6;
  id v15 = v7;
  id v8 = (void (**)(void *, void *))_Block_copy(&v10);
  if (v5)
  {
    objc_msgSend(v5, "requestSharingInvitation:from:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48), v8, v10, v11, v12, v13, v14);
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"PKSubcredentialProvisioningErrorDomain", 1, 0, v10, v11, v12, v13, v14);
    v8[2](v8, v9);
  }
}

void __56__PKDAManager_requestSharingInvitation_from_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    id v3 = v6;
  }
}

- (void)signData:(id)a3 auth:(id)a4 bundleIdentifier:(id)a5 nonce:(id)a6 credential:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v19)
  {
    managementSessionManager = self->_managementSessionManager;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke;
    v22[3] = &unk_1E56E0938;
    id v23 = v14;
    id v24 = v15;
    id v25 = v16;
    id v26 = v17;
    id v27 = v18;
    id v28 = v19;
    id v21 = managementSessionManager;
    [(PKDASessionManager *)v21 performBlockWithSession:v22];
  }
}

void __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke_2;
    v14[3] = &unk_1E56E0910;
    uint64_t v11 = *(void *)(a1 + 64);
    id v15 = *(id *)(a1 + 72);
    id v16 = v6;
    [v5 signData:v7 auth:v8 bundleIdentifier:v9 nonce:v10 credential:v11 completion:v14];
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Failed to get session to sign with", v13, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    if (v6) {
      v6[2](v6);
    }
  }
}

uint64_t __74__PKDAManager_signData_auth_bundleIdentifier_nonce_credential_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)immobilizerTokensCountForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    managementSessionManager = self->_managementSessionManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke;
    v11[3] = &unk_1E56E0988;
    id v13 = v7;
    id v12 = v6;
    uint64_t v10 = managementSessionManager;
    [(PKDASessionManager *)v10 performBlockWithSession:v11];
  }
}

void __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke_148;
    v10[3] = &unk_1E56E0960;
    uint64_t v11 = v6;
    id v12 = *(id *)(a1 + 40);
    [v5 immobilizerTokensCountForCredential:v8 completion:v10];
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get session to count immo tokens with", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __62__PKDAManager_immobilizerTokensCountForCredential_completion___block_invoke_148(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)removeSharedCredentialsWithIdentifiers:(id)a3 credential:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke;
  v16[3] = &unk_1E56E0B08;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = managementSessionManager;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke_2;
    v13[3] = &unk_1E56E08C0;
    id v14 = *(id *)(a1 + 48);
    id v15 = v6;
    [v5 removeSharedCredentialsWithIdentifiers:v7 credential:v8 completion:v13];
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get session to count immo tokens with", v12, 2u);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

void __76__PKDAManager_removeSharedCredentialsWithIdentifiers_credential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    id v3 = v6;
  }
}

- (void)statusForSentSharingInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_managementSessionManager;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56E0A28;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  id v14 = v15;
  [(PKDASessionManager *)v8 performBlockWithSession:v11];

  _Block_object_dispose(v15, 8);
}

void __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E09B0;
  id v19 = *(id *)(a1 + 40);
  id v7 = v6;
  id v20 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_3;
    v13[3] = &unk_1E56E0A00;
    id v14 = *(id *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 48);
    id v15 = v9;
    uint64_t v17 = v10;
    id v16 = v8;
    [v9 listCredentialsWithCompletion:v13];
  }
  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Failed to get session to obtain sent sharing invitation status", v12, 2u);
    }

    (*((void (**)(void *, void))v8 + 2))(v8, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
}

uint64_t __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v27 = v5;
    __int16 v28 = 2048;
    uint64_t v29 = [v3 count];
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for sent invitationIdentifier: %@, credentials count: %lu", buf, 0x16u);
  }
  oslog = v4;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
      if ((objc_msgSend(v11, "isSharedCredential", oslog) & 1) == 0)
      {
        id v12 = *(void **)(a1 + 40);
        id v13 = [v11 identifier];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_151;
        v18[3] = &unk_1E56E09D8;
        void v18[4] = v11;
        id v14 = *(id *)(a1 + 32);
        uint64_t v15 = *(void *)(a1 + 56);
        id v19 = v14;
        uint64_t v20 = v15;
        [v12 listSharingInvitationsForKeyIdentifier:v13 withCompletion:v18];
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v16;
      _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "status for sent invitation identifier not found: %@", buf, 0xCu);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 8;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __71__PKDAManager_statusForSentSharingInvitationWithIdentifier_completion___block_invoke_151(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    *(_DWORD *)buf = 138412546;
    uint64_t v31 = v5;
    __int16 v32 = 2112;
    id v33 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Checking status for credential: %@ \n shares: %@", buf, 0x16u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v3;
  uint64_t v19 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v7 = *(void *)v25;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = objc_msgSend(v9, "credentialShares", v18);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              uint64_t v16 = [v15 identifier];
              int v17 = [v16 isEqualToString:a1[5]];

              if (v17)
              {
                *(void *)(*(void *)(a1[6] + 8) + 24) = [v15 status];

                goto LABEL_20;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v18;
      }
      uint64_t v19 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }
LABEL_20:
}

- (void)outstandingInvitesForCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke;
  v12[3] = &unk_1E56E0988;
  id v13 = v6;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = managementSessionManager;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E0A50;
  id v14 = *(id *)(a1 + 40);
  id v15 = v5;
  id v6 = v5;
  id v7 = a2;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = [*(id *)(a1 + 32) identifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_3;
  v11[3] = &unk_1E56D9100;
  id v12 = v8;
  id v10 = v8;
  [v7 listSharingInvitationsForKeyIdentifier:v9 withCompletion:v11];
}

void __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    id v3 = v6;
  }
}

uint64_t __58__PKDAManager_outstandingInvitesForCredential_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)statusForReceivedSharingInvitationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_managementSessionManager;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56E0A28;
  id v9 = v7;
  id v13 = v9;
  id v10 = v6;
  id v12 = v10;
  id v14 = v15;
  [(PKDASessionManager *)v8 performBlockWithSession:v11];

  _Block_object_dispose(v15, 8);
}

void __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_2;
  aBlock[3] = &unk_1E56E09B0;
  id v19 = *(id *)(a1 + 40);
  id v7 = v6;
  id v20 = v7;
  uint64_t v8 = _Block_copy(aBlock);
  if (v5)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_3;
    v13[3] = &unk_1E56E0AA0;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    id v14 = v9;
    uint64_t v17 = v10;
    id v15 = v5;
    id v16 = v8;
    [v15 listReceivedSharingInvitationsWithCompletion:v13];
  }
  else
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Failed to get session to obtain received sharing invitation status", v12, 2u);
    }

    (*((void (**)(void *, void))v8 + 2))(v8, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
}

uint64_t __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    __int16 v28 = v5;
    __int16 v29 = 2048;
    uint64_t v30 = [v3 count];
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received invitationIdentifier: %@, count: %lu", buf, 0x16u);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v28 = v11;
          _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received invitation receipt: %@", buf, 0xCu);
        }

        id v12 = *(void **)(a1 + 32);
        id v13 = [v11 identifier];
        LODWORD(v12) = [v12 isEqualToString:v13];

        if (v12)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            __int16 v28 = v14;
            _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received matched: %@", buf, 0xCu);
          }

          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v11 status];
          goto LABEL_17;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_152;
    v19[3] = &unk_1E56E0A78;
    id v15 = *(void **)(a1 + 40);
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 56);
    id v20 = v16;
    uint64_t v21 = v17;
    [v15 listCredentialsWithCompletion:v19];

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        __int16 v28 = v18;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received invitation identifier not found: %@", buf, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 8;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __75__PKDAManager_statusForReceivedSharingInvitationWithIdentifier_completion___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v3;
    __int16 v20 = 2048;
    uint64_t v21 = [v3 count];
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received listCredentials: %@, count: %lu", buf, 0x16u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v19 = v10;
          _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received credential: %@", buf, 0xCu);
        }

        uint64_t v11 = *(void **)(a1 + 32);
        id v12 = [v10 invitationIdentifier];
        LODWORD(v11) = [v11 isEqualToString:v12];

        if (v11)
        {
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "status for received credential matched", buf, 2u);
          }

          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_17;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%@: %p; management: %@; sharing: %@ >",
               objc_opt_class(),
               self,
               self->_managementSessionManager,
               self->_sharingSessionManager);
}

- (void)generateTransactionKeyWithSession:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 completion:(id)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v15 = (void (**)(id, void *, id))a7;
  if (v13 && v14)
  {
    id v20 = 0;
    long long v16 = [MEMORY[0x1E4F5F4E8] createHomeKey:v11 seid:v12 readerIdentifier:v13 readerPublicKey:v14 outError:&v20];
    id v17 = v20;
    uint64_t v18 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      id v24 = v17;
      _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithReaderIdentifier returned %{private}@ error: %@", buf, 0x16u);
    }

    v15[2](v15, v16, v17);
  }
  else
  {
    id v19 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithReaderIdentifier missing readerIdentifier or readerPublicKey", buf, 2u);
    }

    v15[2](v15, 0, 0);
  }
}

- (void)createAliroHomeKey:(id)a3 seid:(id)a4 readerIdentifier:(id)a5 readerPublicKey:(id)a6 homeIdentifier:(id)a7 withCompletion:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, void *, id))a8;
  if (v15 && v16)
  {
    id v23 = 0;
    id v19 = [MEMORY[0x1E4F5F4E8] createAliroHomeKey:v13 seid:v14 readerIdentifier:v15 readerPublicKey:v16 homeUUID:v17 outError:&v23];
    id v20 = v23;
    uint64_t v21 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHomeKey returned %{private}@ error: %@", buf, 0x16u);
    }

    v18[2](v18, v19, v20);
  }
  else
  {
    uint64_t v22 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHomeKey missing readerIdentifier or readerPublicKey", buf, 2u);
    }

    v18[2](v18, 0, 0);
  }
}

- (void)generateTransactionKeyWithParameters:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void *, id))a4;
  if (v5)
  {
    id v11 = 0;
    uint64_t v7 = [MEMORY[0x1E4F5F4E8] createHydraKey:0 seid:0 serverParameters:v5 outError:&v11];
    id v8 = v11;
    uint64_t v9 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithParameters returned %{private}@ error: %@", buf, 0x16u);
    }

    v6[2](v6, v7, v8);
  }
  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithParameters missing parameters", buf, 2u);
    }

    v6[2](v6, 0, 0);
  }
}

- (void)createAliroHydraKey:(id)a3 seid:(id)a4 serverParameters:(id)a5 withCompletion:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, id))a6;
  if (v10 && v11)
  {
    id v17 = 0;
    id v13 = [MEMORY[0x1E4F5F4E8] createAliroHydraKey:v9 seid:v10 serverParameters:v11 outError:&v17];
    id v14 = v17;
    id v15 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHydraKey returned %{private}@ error: %@", buf, 0x16u);
    }

    v12[2](v12, v13, v14);
  }
  else
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "PKDAManager createAliroHomeKey missing seid or serverParameters", buf, 2u);
    }

    v12[2](v12, 0, 0);
  }
}

- (void)generateSEEncryptionCertificateForSubCredentialId:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void, id))a4;
  if (v6)
  {
    if (v5)
    {
      id v12 = 0;
      uint64_t v7 = [MEMORY[0x1E4F5F4E8] getHydraEncryptionCert:v5 session:0 seid:0 outError:&v12];
      id v8 = v12;
      id v9 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateTransactionKeyWithParameters returned error: %@", buf, 0xCu);
      }

      if (v8) {
        id v10 = 0;
      }
      else {
        id v10 = v7;
      }
      ((void (**)(id, void *, id))v6)[2](v6, v10, v8);
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "PKDAManager GenerateSEEncryptionCertificateForSubCredentialId missing parameters", buf, 2u);
      }

      id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
      v6[2](v6, 0, v8);
    }
  }
}

- (id)storeSEBlobForSubcredentialIdentifier:(id)a3 seBlob:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6)
  {
    id v14 = 0;
    int v8 = [MEMORY[0x1E4F5F4E8] updateHydraKey:v5 session:0 seid:0 encryptedSEData:v6 outError:&v14];
    id v9 = v14;
    id v10 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = @"N";
      if (v8) {
        id v11 = @"Y";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "PKDAManager StoreSEBlobForSubcredentialIdentifier success: %@ error: %@", buf, 0x16u);
    }
  }
  else
  {
    id v12 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "PKDAManager StoreSEBlobForSubcredentialIdentifier missing parameters", buf, 2u);
    }

    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
  }

  return v9;
}

- (id)privacyKeysForGroupIdentifier:(id)a3 privacyKeyIdentifier:(id)a4 outError:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F97A28];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 sharedManager];
  id v17 = 0;
  id v11 = [v10 privacyKeysForGroupIdentifier:v9 privacyKeyIdentifier:v8 outError:&v17];

  id v12 = v17;
  if (v12)
  {
    id v13 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v12;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Failed to get privacy keys: %@", buf, 0xCu);
    }

    id v14 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend(v11, "pk_arrayByApplyingBlock:", &__block_literal_global_166);
    id v14 = [v15 sortedArrayUsingComparator:&__block_literal_global_170_0];
  }
  return v14;
}

PKLongTermPrivacyKey *__75__PKDAManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKLongTermPrivacyKey alloc] initWithSESPrivacyKey:v2];

  return v3;
}

uint64_t __75__PKDAManager_privacyKeysForGroupIdentifier_privacyKeyIdentifier_outError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 creationDate];
  id v6 = [v4 creationDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)createPrivacyKeyForGroupIdentifier:(id)a3 outError:(id *)a4
{
  id v5 = (void *)MEMORY[0x1E4F97A28];
  id v6 = a3;
  uint64_t v7 = [v5 sharedManager];
  id v8 = [v7 createPrivacyKeyForGroupIdentifier:v6 withOptions:0 outError:a4];

  id v9 = [[PKLongTermPrivacyKey alloc] initWithSESPrivacyKey:v8];
  return v9;
}

- (BOOL)hasLongTermPrivacyKeyForGroupIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F97A28];
  id v4 = a3;
  id v5 = [v3 sharedManager];
  uint64_t v11 = 0;
  id v6 = [v5 privacyKeysForGroupIdentifier:v4 privacyKeyIdentifier:0 outError:&v11];

  uint64_t v7 = v11;
  if ([v6 count]) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = v8;

  return v9;
}

- (BOOL)deletePrivacyKey:(id)a3 outError:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F97A28] sharedManager];
  uint64_t v7 = [v5 groupIdentifier];
  BOOL v8 = [v5 keyIdentifier];
  id v19 = 0;
  BOOL v9 = [v6 privacyKeysForGroupIdentifier:v7 privacyKeyIdentifier:v8 outError:&v19];
  id v10 = v19;

  if (v10)
  {
    if (a4) {
      *a4 = v10;
    }
    uint64_t v11 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v5 keyIdentifier];
      *(_DWORD *)buf = 138412546;
      id v21 = v12;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Failed to find privacy key with identifier %@: %@", buf, 0x16u);
    }
    char v13 = 0;
  }
  else
  {
    uint64_t v11 = [v9 firstObject];
    id v18 = 0;
    char v13 = [v6 deletePrivacyKey:v11 outError:&v18];
    id v14 = v18;
    id v10 = v14;
    if (a4 || (v13 & 1) == 0)
    {
      if (a4) {
        *a4 = v14;
      }
      uint64_t v15 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v5 keyIdentifier];
        *(_DWORD *)buf = 138412546;
        id v21 = v16;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete privacy key with identifier %@: %@", buf, 0x16u);
      }
    }
    else
    {
      char v13 = 1;
    }
  }

  return v13;
}

- (id)decryptPayload:(id)a3 groupIdentifier:(id)a4 outError:(id *)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F97A28];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 sharedManager];
  uint64_t v11 = [v10 decryptPayload:v9 withGroupIdentifier:v8 outError:a5];

  return v11;
}

- (void)credentialDidActivateWithCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke;
  v12[3] = &unk_1E56E0988;
  id v13 = v6;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = managementSessionManager;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke_2;
    v10[3] = &unk_1E56E08C0;
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    [a2 credentialDidActivateWithCredential:v7 completion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void __62__PKDAManager_credentialDidActivateWithCredential_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)updateCredentialConfigurationForCredential:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke;
  v16[3] = &unk_1E56E0B08;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  uint64_t v15 = managementSessionManager;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke_2;
    v11[3] = &unk_1E56E08C0;
    id v12 = v5;
    id v13 = *(id *)(a1 + 48);
    [a2 updateCredentialConfigurationForCredential:v7 configuration:v8 completion:v11];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __83__PKDAManager_updateCredentialConfigurationForCredential_configuration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)deleteCredentials:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_msgSend(a3, "pk_createArrayByApplyingBlock:", &__block_literal_global_173_1);
  [(PKDAManager *)self deleteCredentialsForIdentifiers:v7 completion:v6];
}

uint64_t __44__PKDAManager_deleteCredentials_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)deleteCredentialsForIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke;
  v12[3] = &unk_1E56E0988;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = managementSessionManager;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v23 = v5;
  if (v5)
  {
    __int16 v22 = v6;
    uint64_t v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_2;
          v29[3] = &unk_1E56E0B58;
          id v30 = v23;
          uint64_t v31 = v15;
          id v32 = v9;
          [(PKAsyncUnaryOperationComposer *)v8 addOperation:v29];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_178;
    v25[3] = &unk_1E56E0BA8;
    id v17 = *(id *)(a1 + 40);
    id v26 = v9;
    id v27 = v17;
    id v7 = v22;
    uint64_t v28 = v22;
    id v18 = v9;
    id v19 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v16 completion:v25];
  }
  else
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Failed to get session to delete credentials", buf, 2u);
    }

    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
    v7[2](v7);
  }
}

void __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_3;
  v13[3] = &unk_1E56E0B30;
  void v13[4] = v9;
  id v10 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v7;
  id v14 = v10;
  id v11 = v6;
  id v12 = v7;
  [v8 deleteCredential:v9 completionHandler:v13];
}

void __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager error deleting credential %@, error: %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __58__PKDAManager_deleteCredentialsForIdentifiers_completion___block_invoke_178(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if ([*(id *)(a1 + 32) count]) {
      uint64_t v3 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v3 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (void)deleteCredentialsForReaderIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke;
  v12[3] = &unk_1E56E0988;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  __int16 v11 = managementSessionManager;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_2;
    v21[3] = &unk_1E56E0B80;
    id v22 = *(id *)(a1 + 32);
    id v23 = v7;
    id v24 = v5;
    id v9 = v8;
    id v25 = v9;
    id v10 = v7;
    [v24 listCredentialsWithCompletion:v21];
    __int16 v11 = [MEMORY[0x1E4F1CA98] null];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_180;
    v17[3] = &unk_1E56E0BA8;
    id v19 = v6;
    id v20 = *(id *)(a1 + 40);
    id v18 = v9;
    id v12 = v9;
    id v13 = [(PKAsyncUnaryOperationComposer *)v10 evaluateWithInput:v11 completion:v17];
  }
  else
  {
    id v14 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Failed to get session to delete credentials", v16, 2u);
    }

    v6[2](v6);
    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
    }
  }
}

void __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 32);
        id v10 = [v8 pairedReaderIdentifier];
        LODWORD(v9) = [v9 containsObject:v10];

        if (v9)
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_3;
          v12[3] = &unk_1E56E0B58;
          void v12[4] = v8;
          __int16 v11 = *(void **)(a1 + 40);
          id v13 = *(id *)(a1 + 48);
          id v14 = *(id *)(a1 + 56);
          [v11 addOperation:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

void __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) identifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_4;
  v14[3] = &unk_1E56E0B30;
  id v15 = v8;
  id v9 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v17 = v6;
  id v18 = v7;
  id v16 = v10;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  [v9 deleteCredential:v13 completionHandler:v14];
}

void __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager error deleting credential %@, error: %@", (uint8_t *)&v9, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v6];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t __64__PKDAManager_deleteCredentialsForReaderIdentifiers_completion___block_invoke_180(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    if ([*(id *)(a1 + 32) count]) {
      uint64_t v4 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
    return v5(v3, v4);
  }
  return result;
}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__PKDAManager_deleteCredential_completion___block_invoke;
  v12[3] = &unk_1E56E0988;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  __int16 v11 = managementSessionManager;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __43__PKDAManager_deleteCredential_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__PKDAManager_deleteCredential_completion___block_invoke_2;
    v11[3] = &unk_1E56E0BD0;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    [v5 deleteCredential:v12 completionHandler:v11];
  }
  else
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Failed to get session to delete credentials", v10, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
    }
  }
  v6[2](v6);
}

void __43__PKDAManager_deleteCredential_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PKLogFacilityTypeGetObject(0x16uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKDAManager deleted credential %@, error: %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
}

- (void)createInviteForShare:(id)a3 forCredential:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v13)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke;
    v17[3] = &unk_1E56E0C20;
    id v21 = v13;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v16 = sharingSessionManager;
    [(PKDASessionManager *)v16 performBlockWithSession:v17];
  }
}

void __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke_2;
    v10[3] = &unk_1E56E0BF8;
    id v11 = v5;
    id v12 = *(id *)(a1 + 56);
    [a2 createInviteForShare:v7 forCredential:v8 authorization:v9 completion:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __75__PKDAManager_createInviteForShare_forCredential_authorization_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setTransportChannelIdentifier:(id)a3 forCredential:(id)a4 forCredentialShare:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = v13;
  if (v13)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke;
    v17[3] = &unk_1E56E0C20;
    id v21 = v13;
    id v18 = v10;
    id v19 = v11;
    id v20 = v12;
    id v16 = sharingSessionManager;
    [(PKDASessionManager *)v16 performBlockWithSession:v17];
  }
}

void __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke_2;
    v10[3] = &unk_1E56E08C0;
    id v11 = v5;
    id v12 = *(id *)(a1 + 56);
    [a2 setTransportChannelIdentifier:v7 forCredential:v8 forCredentialShare:v9 completion:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __89__PKDAManager_setTransportChannelIdentifier_forCredential_forCredentialShare_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleOutstandingMessage:(id)a3 subcredentialIdentifier:(id)a4 credentialShareIdentifier:(id)a5 transportIdentifier:(id)a6 completion:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  if (v12)
  {
    id v13 = PKDACarKeySharingMessageFromMessage(a3);
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F5F4E8];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __121__PKDAManager_handleOutstandingMessage_subcredentialIdentifier_credentialShareIdentifier_transportIdentifier_completion___block_invoke;
      v16[3] = &unk_1E56D8388;
      id v17 = v12;
      [v14 handleSharingMessage:v13 forInvitationIdentifier:v10 fromMailboxIdentifier:v11 completionHandler:v16];
    }
    else
    {
      id v15 = PKLogFacilityTypeGetObject(0x1BuLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKDAManager: Error: unable to create DACarKeySharingMessage", buf, 2u);
      }

      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

uint64_t __121__PKDAManager_handleOutstandingMessage_subcredentialIdentifier_credentialShareIdentifier_transportIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)routingInformationForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2;
    v9[3] = &unk_1E56E0C48;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 routingInformationForInvitationWithIdentifier:v7 fromMailboxIdentifier:v8 completionHandler:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __101__PKDAManager_routingInformationForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getProductPlanIdentifierRequestForInvitationWithIdentifier:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke_2;
    v9[3] = &unk_1E56E0C98;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 getProductPlanIdentifierRequestForInvitationWithIdentifier:v7 fromMailboxIdentifier:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __107__PKDAManager_getProductPlanIdentifierRequestForInvitationWithIdentifier_fromMailboxIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getPretrackRequestForKeyWithIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke;
    v11[3] = &unk_1E56E0CC0;
    id v13 = v7;
    id v12 = v6;
    id v10 = sharingSessionManager;
    [(PKDASessionManager *)v10 performBlockWithSession:v11];
  }
}

void __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke_2;
    v8[3] = &unk_1E56E0C98;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    [a2 getPretrackRequestForKeyWithIdentifier:v7 withCompletion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __69__PKDAManager_getPretrackRequestForKeyWithIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startShareAcceptanceFlowWithInvitation:(id)a3 fromMailboxIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = PKDACarKeySharingMessageFromMessage(*(void **)(a1 + 32));
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke_182;
      v10[3] = &unk_1E56E08C0;
      id v11 = v6;
      id v12 = *(id *)(a1 + 48);
      [v5 startShareAcceptanceFlowWithInvitation:v7 fromMailboxIdentifier:v8 completion:v10];
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject(0x1BuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager: Error: unable to create DACarKeySharingMessage", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __87__PKDAManager_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completion___block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)acceptCrossPlatformInvitationWithIdentifier:(id)a3 transportChannelIdentifier:(id)a4 activationCode:(id)a5 encryptedProductPlanIdentifierContainer:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v16)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke;
    v20[3] = &unk_1E56E0D38;
    id v26 = v16;
    id v21 = v12;
    id v22 = v13;
    id v23 = v14;
    id v24 = v15;
    id v25 = self;
    id v19 = sharingSessionManager;
    [(PKDASessionManager *)v19 performBlockWithSession:v20];
  }
}

void __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_2;
    v13[3] = &unk_1E56E0D10;
    id v14 = v5;
    id v11 = *(id *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 64);
    id v15 = v11;
    void v13[4] = v12;
    [a2 acceptCrossPlatformInvitationWithIdentifier:v7 transportChannelIdentifier:v8 activationCode:v9 encryptedProductPlanIdentifierContainer:v10 completion:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void (**)(uint64_t))(v8 + 16);
  id v10 = a3;
  id v11 = a2;
  v9(v8);
  uint64_t v12 = PKCarKeyMessageFromDACarKeySharingMessage(v11);

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    id v14 = [v10 identifier];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_3;
    v15[3] = &unk_1E56E0CE8;
    id v18 = *(id *)(a1 + 48);
    id v16 = v12;
    id v17 = 0;
    [v13 deviceCredentialForIdentifier:v14 completion:v15];

    id v10 = v18;
  }
}

uint64_t __152__PKDAManager_acceptCrossPlatformInvitationWithIdentifier_transportChannelIdentifier_activationCode_encryptedProductPlanIdentifierContainer_completion___block_invoke_3(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[6] + 16))(a1[6], a1[4], a2, a1[5]);
}

- (void)deviceCredentialForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56E0988;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PKDASessionManager *)managementSessionManager performBlockWithSession:v11];
}

void __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_2;
  v7[3] = &unk_1E56E0D60;
  id v9 = v5;
  id v8 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  [a2 listCredentialsWithCompletion:v7];
}

void __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_3;
  v7[3] = &unk_1E56DBA78;
  id v8 = *(id *)(a1 + 32);
  id v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v7);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __56__PKDAManager_deviceCredentialForIdentifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  id v4 = v2;
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (void)accountAttestionRequestForCredential:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  managementSessionManager = self->_managementSessionManager;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke;
  v12[3] = &unk_1E56E0988;
  id v13 = v6;
  id v14 = v7;
  id v9 = v6;
  id v10 = v7;
  id v11 = managementSessionManager;
  [(PKDASessionManager *)v11 performBlockWithSession:v12];
}

void __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke_2;
    v8[3] = &unk_1E56E0D88;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    [a2 accountAttestationRequestForCredential:v7 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__PKDAManager_accountAttestionRequestForCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setAccountAttestation:(id)a3 forCredential:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sharingSessionManager = self->_sharingSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke;
  v16[3] = &unk_1E56E0C70;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = sharingSessionManager;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke_2;
    v9[3] = &unk_1E56E08C0;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 setAccountAttestation:v7 forCredential:v8 withCompletion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __66__PKDAManager_setAccountAttestation_forCredential_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retryActivationCodeForCredentialIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sharingSessionManager = self->_sharingSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke;
  v16[3] = &unk_1E56E0C70;
  id v18 = v9;
  id v19 = v10;
  id v17 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  id v15 = sharingSessionManager;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke_2;
    v9[3] = &unk_1E56E08C0;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 retryActivationCodeForCredentialIdentifier:v7 activationCode:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __84__PKDAManager_retryActivationCodeForCredentialIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = [v3 domain];
  id v5 = (void *)*MEMORY[0x1E4F5F4C0];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7)
    {

LABEL_12:
      goto LABEL_13;
    }
    int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_12;
    }
  }
  uint64_t v10 = [v3 code];

  if (v10 != 116)
  {
LABEL_13:
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_14;
  }
  id v11 = PKLogFacilityTypeGetObject(0x21uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "KML returned 'friend not ready for passcode' error. Ignoring error so that call and KML both think they are waiting on the sender.", v13, 2u);
  }

  id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_14:
  v12();
}

- (void)rejectInvitation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = PKDACarKeySharingMessageFromMessage(a3);
  id v7 = (void *)MEMORY[0x1E4F5F4E8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PKDAManager_rejectInvitation_completion___block_invoke;
  v9[3] = &unk_1E56E0DB0;
  id v10 = v5;
  id v8 = v5;
  [v7 rejectSharingInvitation:v6 completionHandler:v9];
}

void __43__PKDAManager_rejectInvitation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    PKCarKeyMessageFromDACarKeySharingMessage(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

- (void)acceptInvitationWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke_2;
    v9[3] = &unk_1E56E0DD8;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 acceptInvitationWithIdentifier:v7 activationCode:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __72__PKDAManager_acceptInvitationWithIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retryActivationCode:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke_2;
    v9[3] = &unk_1E56E0DD8;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 retryActivationCode:v7 forInvitationIdentifier:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __70__PKDAManager_retryActivationCode_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleRecipientMessage:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = PKDACarKeySharingMessageFromMessage(*(void **)(a1 + 32));
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke_189;
      v10[3] = &unk_1E56E0DD8;
      id v11 = v6;
      id v12 = *(id *)(a1 + 48);
      [v5 handleRecipientMessage:v7 forInvitationIdentifier:v8 completion:v10];
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject(0x1BuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKDAManager: Error: unable to create DACarKeySharingMessage", buf, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __73__PKDAManager_handleRecipientMessage_forInvitationIdentifier_completion___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)retryActivationCodeWithInvitationIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v9;
    id v16 = v8;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke_2;
    v9[3] = &unk_1E56E0DD8;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 retryActivationCode:v7 forInvitationIdentifier:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __85__PKDAManager_retryActivationCodeWithInvitationIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setEncryptedProductPlanIdentifierContainer:(id)a3 forInvitationIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke;
    v14[3] = &unk_1E56E0C70;
    id v17 = v10;
    id v15 = v8;
    id v16 = v9;
    id v13 = sharingSessionManager;
    [(PKDASessionManager *)v13 performBlockWithSession:v14];
  }
}

void __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke_2;
    v9[3] = &unk_1E56E08C0;
    id v10 = v5;
    id v11 = *(id *)(a1 + 48);
    [a2 setEncryptedProductPlanIdentifierContainer:v7 forInvitationIdentifier:v8 completion:v9];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __93__PKDAManager_setEncryptedProductPlanIdentifierContainer_forInvitationIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createSilentInviteForSharingSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    sharingSessionManager = self->_sharingSessionManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke;
    v11[3] = &unk_1E56E0CC0;
    id v13 = v7;
    id v12 = v6;
    id v10 = sharingSessionManager;
    [(PKDASessionManager *)v10 performBlockWithSession:v11];
  }
}

void __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke_2;
    v8[3] = &unk_1E56E0E00;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    [a2 createSilentInviteForSharingSessionIdentifier:v7 completion:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__PKDAManager_createSilentInviteForSharingSessionIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v7 = *(void *)(a1 + 40);
  if (v5)
  {
    v9[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
  }
}

- (void)accountAttestationRequestForManufacturer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    managementSessionManager = self->_managementSessionManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke;
    v11[3] = &unk_1E56E0988;
    id v13 = v7;
    id v12 = v6;
    id v10 = managementSessionManager;
    [(PKDASessionManager *)v10 performBlockWithSession:v11];
  }
}

void __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke_2;
    v10[3] = &unk_1E56E0D88;
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    [a2 accountAttestationRequestForManufacturer:v7 completion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

void __67__PKDAManager_accountAttestationRequestForManufacturer_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)preWarmForManufacturer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    managementSessionManager = self->_managementSessionManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__PKDAManager_preWarmForManufacturer_completion___block_invoke;
    v11[3] = &unk_1E56E0988;
    id v13 = v7;
    id v12 = v6;
    id v10 = managementSessionManager;
    [(PKDASessionManager *)v10 performBlockWithSession:v11];
  }
}

void __49__PKDAManager_preWarmForManufacturer_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PKDAManager_preWarmForManufacturer_completion___block_invoke_2;
    v10[3] = &unk_1E56E08C0;
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    [a2 preWarmForManufacturer:v7 completion:v10];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

void __49__PKDAManager_preWarmForManufacturer_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)hasUpgradeAvailableForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 versions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (v12)
  {
    managementSessionManager = self->_managementSessionManager;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke;
    v16[3] = &unk_1E56E0E50;
    id v19 = v12;
    unint64_t v20 = a4;
    id v17 = v10;
    id v18 = v11;
    id v15 = managementSessionManager;
    [(PKDASessionManager *)v15 performBlockWithSession:v16];
  }
}

void __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke_2;
    v12[3] = &unk_1E56E0E28;
    id v13 = v5;
    id v14 = *(id *)(a1 + 48);
    [a2 hasUpgradeAvailableForKeyWithCredential:v8 versionType:v7 versions:v9 completion:v12];

    id v10 = v13;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 48);
    v15[0] = *(void *)(a1 + 56);
    memset(&v15[1], 0, 24);
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v15, v10);
  }
}

void __87__PKDAManager_hasUpgradeAvailableForKeyWithCredential_versionType_versions_completion___block_invoke_2(uint64_t a1, _OWORD *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void (**)(uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void (**)(uint64_t, _OWORD *, id, uint64_t))(v8 + 16);
  long long v10 = a2[1];
  v12[0] = *a2;
  v12[1] = v10;
  v9(v8, v12, v7, v11);
}

- (void)upgradeKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 upgradeInformation:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  managementSessionManager = self->_managementSessionManager;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke;
  v20[3] = &unk_1E56E0E78;
  id v23 = v14;
  unint64_t v24 = a4;
  unint64_t v25 = a5;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = managementSessionManager;
  [(PKDASessionManager *)v19 performBlockWithSession:v20];
}

void __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke_2;
    v14[3] = &unk_1E56E08C0;
    id v15 = v6;
    id v16 = *(id *)(a1 + 48);
    [v5 upgradeKeyWithCredential:v10 versionType:v8 version:v9 upgradeInformation:v11 completion:v14];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
  }
}

void __90__PKDAManager_upgradeKeyWithCredential_versionType_version_upgradeInformation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)commitUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke;
  v16[3] = &unk_1E56E0EA0;
  id v17 = v10;
  id v18 = v11;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v13 = v10;
  id v14 = v11;
  id v15 = managementSessionManager;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2;
    v13[3] = &unk_1E56E08C0;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    [v5 commitUpgradeForKeyWithCredential:v8 versionType:v9 version:v10 completion:v13];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }
}

void __80__PKDAManager_commitUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)revertUpgradeForKeyWithCredential:(id)a3 versionType:(unint64_t)a4 version:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  managementSessionManager = self->_managementSessionManager;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke;
  v16[3] = &unk_1E56E0EA0;
  id v17 = v10;
  id v18 = v11;
  unint64_t v19 = a4;
  unint64_t v20 = a5;
  id v13 = v10;
  id v14 = v11;
  id v15 = managementSessionManager;
  [(PKDASessionManager *)v15 performBlockWithSession:v16];
}

void __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2;
    v13[3] = &unk_1E56E08C0;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    [v5 revertUpgradeForKeyWithCredential:v8 versionType:v9 version:v10 completion:v13];
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKSubcredentialProvisioningErrorDomain" code:1 userInfo:0];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
    }
  }
}

void __80__PKDAManager_revertUpgradeForKeyWithCredential_versionType_version_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessionManager, 0);
  objc_storeStrong((id *)&self->_managementSessionManager, 0);
  objc_storeStrong((id *)&self->_pairingSessionManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end