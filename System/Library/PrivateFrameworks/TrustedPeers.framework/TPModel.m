@interface TPModel
+ (id)pickClock:(id)a3;
+ (id)preapprovalsFromKeys:(id)a3;
- (BOOL)anyTrustedPeerDistrustsOtherPeer:(id)a3 error:(id *)a4;
- (BOOL)canIntroduceCandidate:(id)a3 withSponsor:(id)a4 toEpoch:(unint64_t)a5 underPolicy:(id)a6 disposition:(id)a7;
- (BOOL)canTrustCandidate:(id)a3 inEpoch:(unint64_t)a4;
- (BOOL)checkIntroductionForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 error:(id *)a6;
- (BOOL)considerPolicyFromPeerID:(id)a3 stableInfo:(id)a4 secrets:(id)a5 newestPolicyDoc:(id *)a6 error:(id *)a7;
- (BOOL)currentStatePossiblyMissingDataWithError:(id *)a3;
- (BOOL)doesOctagonContainDistrustedRecoveryKeysWithError:(id *)a3;
- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)hasAnyPeersWithError:(id *)a3;
- (BOOL)hasPeerWithID:(id)a3 error:(id *)a4;
- (BOOL)hasPotentiallyTrustedPeerPreapprovingKey:(id)a3 error:(id *)a4;
- (BOOL)hasPotentiallyTrustedPeerTestingOnlyWithError:(id *)a3;
- (BOOL)hasPotentiallyTrustedPeerWithSigningKey:(id)a3 error:(id *)a4;
- (BOOL)isCustodianRecoveryKeyTrusted:(id)a3 error:(id *)a4;
- (BOOL)isRecoveryKeyEnrolledWithError:(id *)a3;
- (BOOL)isRecoveryKeyExcluded:(id)a3 error:(id *)a4;
- (BOOL)suppressInitialInfoLogging;
- (BOOL)validatePeerWithPreApproval:(id)a3 sponsor:(id)a4;
- (BOOL)validateVoucherForPeer:(id)a3 sponsor:(id)a4;
- (BOOL)verifyVoucherSignature:(id)a3;
- (NSData)recoveryEncryptionPubKey;
- (NSData)recoverySigningPubKey;
- (NSMutableDictionary)custodianRecoveryKeys;
- (TPDecrypter)decrypter;
- (TPModel)initWithDecrypter:(id)a3 dbAdapter:(id)a4;
- (TPModelDBAdapterProtocol)dbAdapter;
- (id)_iterateOverPeersWithBlock:(id)a3 error:(id *)a4;
- (id)actualPeerWithID:(id)a3 error:(id *)a4;
- (id)allCustodianRecoveryKeyPeerIDs;
- (id)allCustodianRecoveryKeys;
- (id)allMachineIDsWithError:(id *)a3;
- (id)allPeerIDs;
- (id)allPolicyVersionsWithError:(id *)a3;
- (id)allRegisteredPolicyVersionsWithError:(id *)a3;
- (id)allTrustedPeersWithCurrentRecoveryKeyWithError:(id *)a3;
- (id)bestRecoveryKeyForStableInfo:(id)a3 vouchers:(id)a4 error:(id *)a5;
- (id)bestWalrusAcrossTrustedPeersWithError:(id *)a3;
- (id)bestWalrusForStableInfo:(id)a3 walrusStableChanges:(id)a4 error:(id *)a5;
- (id)bestWebAccessAcrossTrustedPeersWithError:(id *)a3;
- (id)bestWebAccessForStableInfo:(id)a3 webAccessStableChanges:(id)a4 error:(id *)a5;
- (id)calculateDynamicInfoForPeerWithID:(id)a3 addingPeerIDs:(id)a4 removingPeerIDs:(id)a5 preapprovedKeys:(id)a6 signingKeyPair:(id)a7 currentMachineIDs:(id)a8 error:(id *)a9;
- (id)calculateDynamicInfoFromModel:(id)a3 peer:(id)a4 peerPermanentInfo:(id)a5 peerStableInfo:(id)a6 startingDynamicInfo:(id)a7 addingPeerIDs:(id)a8 removingPeerIDs:(id)a9 preapprovedKeys:(id)a10 signingKeyPair:(id)a11 currentMachineIDs:(id)a12 sponsorPeerID:(id)a13 error:(id *)a14;
- (id)considerCandidateID:(id)a3 withSponsorID:(id)a4 sponsorPermanentInfo:(id)a5 toExpandIncludedPeerIDs:(id)a6 andExcludedPeerIDs:(id)a7 dispositions:(id)a8 currentMachineIDs:(id)a9 forEpoch:(unint64_t)a10;
- (id)considerPreapprovalsSponsoredByPeer:(id)a3 toRecursivelyExpandIncludedPeerIDs:(id)a4 andExcludedPeerIDs:(id)a5 dispositions:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8;
- (id)copyPeerWithNewDynamicInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5;
- (id)copyPeerWithNewStableInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5;
- (id)createDynamicInfoWithIncludedPeerIDs:(id)a3 excludedPeerIDs:(id)a4 dispositions:(id)a5 preapprovals:(id)a6 signingKeyPair:(id)a7 error:(id *)a8;
- (id)createStableInfoWithFrozenPolicyVersion:(id)a3 flexiblePolicyVersion:(id)a4 policySecrets:(id)a5 syncUserControllableViews:(int)a6 secureElementIdentity:(id)a7 walrusSetting:(id)a8 webAccess:(id)a9 deviceName:(id)a10 serialNumber:(id)a11 osVersion:(id)a12 signingKeyPair:(id)a13 recoverySigningPubKey:(id)a14 recoveryEncryptionPubKey:(id)a15 isInheritedAccount:(BOOL)a16 error:(id *)a17;
- (id)createVoucherForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 reason:(unint64_t)a6 signingKeyPair:(id)a7 error:(id *)a8;
- (id)custodianPeerWithID:(id)a3;
- (id)dynamicInfoForJoiningPeerID:(id)a3 peerPermanentInfo:(id)a4 peerStableInfo:(id)a5 sponsorID:(id)a6 preapprovedKeys:(id)a7 signingKeyPair:(id)a8 currentMachineIDs:(id)a9 error:(id *)a10;
- (id)filterPeerList:(id)a3 byMachineIDs:(id)a4 sponsorPeerID:(id)a5 dispositions:(id)a6;
- (id)filterPreapprovals:(id)a3 forExistingPeers:(id)a4;
- (id)findCustodianRecoveryKeyWithUUID:(id)a3;
- (id)getDynamicInfoForPeerWithID:(id)a3 error:(id *)a4;
- (id)getPeerIDsTrustedByPeerWithDynamicInfo:(id)a3 toAccessView:(id)a4 error:(id *)a5;
- (id)getPeerIDsTrustedByPeerWithID:(id)a3 toAccessView:(id)a4 error:(id *)a5;
- (id)getStableInfoForPeerWithID:(id)a3 error:(id *)a4;
- (id)getViewsForCRK:(id)a3 donorPermanentInfo:(id)a4 donorStableInfo:(id)a5 error:(id *)a6;
- (id)getViewsForPeer:(id)a3 stableInfo:(id)a4 error:(id *)a5;
- (id)peerCountsByMachineIDWithError:(id *)a3;
- (id)peerIDThatTrustsCustodianRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6;
- (id)peerIDThatTrustsRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6;
- (id)peerWithID:(id)a3 error:(id *)a4;
- (id)peersWithMachineID:(id)a3 error:(id *)a4;
- (id)policyForPeerIDs:(id)a3 candidatePeerID:(id)a4 candidateStableInfo:(id)a5 error:(id *)a6;
- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4;
- (id)possibleSponsorsForCustodianRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5;
- (id)possibleSponsorsForRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5;
- (id)recoveryEncryptionPublicKey;
- (id)recoveryKeyPeerID:(id)a3;
- (id)recoverySigningPublicKey;
- (id)recursivelyExpandIncludedPeerIDs:(id)a3 andExcludedPeerIDs:(id)a4 dispositions:(id)a5 withPeersTrustedBySponsorID:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8;
- (id)untrustedPeerIDsWithError:(id *)a3;
- (id)vectorClockWithError:(id *)a3;
- (id)viablePeerCountsByModelIDWithError:(id *)a3;
- (int)userViewSyncabilityConsensusAmongTrustedPeers:(id)a3 error:(id *)a4;
- (unint64_t)latestEpochAmongPeerIDs:(id)a3 error:(id *)a4;
- (unint64_t)maxClockWithError:(id *)a3;
- (unint64_t)peerCountWithError:(id *)a3;
- (unint64_t)statusOfPeerWithID:(id)a3 error:(id *)a4;
- (unint64_t)trustedPeerCountWithError:(id *)a3;
- (unint64_t)voucherCountWithError:(id *)a3;
- (void)considerVouchersSponsoredByPeerID:(id)a3 sponsorPermanentInfo:(id)a4 toRecursivelyExpandIncludedPeerIDs:(id)a5 andExcludedPeerIDs:(id)a6 dispositions:(id)a7 currentMachineIDs:(id)a8 forEpoch:(unint64_t)a9;
- (void)registerCustodianRecoveryKey:(id)a3;
- (void)removeCustodianRecoveryKey:(id)a3;
- (void)removeRecoveryKey;
- (void)setCustodianRecoveryKeys:(id)a3;
- (void)setDbAdapter:(id)a3;
- (void)setDecrypter:(id)a3;
- (void)setRecoveryEncryptionPubKey:(id)a3;
- (void)setRecoveryKeys:(id)a3;
- (void)setRecoverySigningPubKey:(id)a3;
- (void)setSuppressInitialInfoLogging:(BOOL)a3;
@end

@implementation TPModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_custodianRecoveryKeys, 0);
  objc_storeStrong((id *)&self->_recoveryEncryptionPubKey, 0);
  objc_storeStrong((id *)&self->_recoverySigningPubKey, 0);
  objc_storeStrong((id *)&self->_decrypter, 0);
  objc_storeStrong((id *)&self->_dbAdapter, 0);
}

- (void)setCustodianRecoveryKeys:(id)a3
{
}

- (NSMutableDictionary)custodianRecoveryKeys
{
  return self->_custodianRecoveryKeys;
}

- (void)setRecoveryEncryptionPubKey:(id)a3
{
}

- (NSData)recoveryEncryptionPubKey
{
  return self->_recoveryEncryptionPubKey;
}

- (void)setRecoverySigningPubKey:(id)a3
{
}

- (NSData)recoverySigningPubKey
{
  return self->_recoverySigningPubKey;
}

- (void)setDecrypter:(id)a3
{
}

- (TPDecrypter)decrypter
{
  return self->_decrypter;
}

- (void)setDbAdapter:(id)a3
{
}

- (TPModelDBAdapterProtocol)dbAdapter
{
  return self->_dbAdapter;
}

- (void)setSuppressInitialInfoLogging:(BOOL)a3
{
  self->_suppressInitialInfoLogging = a3;
}

- (BOOL)suppressInitialInfoLogging
{
  return self->_suppressInitialInfoLogging;
}

- (BOOL)currentStatePossiblyMissingDataWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x210554CF0](self, a2);
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = (id)0xAAAAAAAAAAAAAAAALL;
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  id v33 = (id)0xAAAAAAAAAAAAAAAALL;
  id v33 = [MEMORY[0x263EFF9C0] set];
  v4 = (void *)MEMORY[0x263EFFA08];
  v5 = [(TPModel *)self custodianRecoveryKeys];
  v6 = [v5 allKeys];
  v7 = [v4 setWithArray:v6];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __52__TPModel_currentStatePossiblyMissingDataWithError___block_invoke;
  v28[3] = &unk_2640EC8D0;
  v30 = v32;
  id v8 = v7;
  id v29 = v8;
  v31 = &v34;
  id v27 = 0;
  [(TPModel *)self enumeratePeersUsingBlock:v28 error:&v27];
  id v22 = v27;
  v20 = v8;
  if (v22 || ![(id)v35[5] count])
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)v35[5];
    uint64_t v9 = [v10 countByEnumeratingWithState:&v23 objects:v44 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v10);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v14 = [(id)v35[5] objectForKeyedSubscript:v13];
          v15 = TPModelLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v14;
            __int16 v42 = 2114;
            uint64_t v43 = v13;
            _os_log_impl(&dword_20CB20000, v15, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ trusts the following unknown peer IDs: %{public}@", buf, 0x16u);
          }

          if (+[TPHashBuilder algoOfHash:v13] != -1)
          {

            LOBYTE(v9) = 1;
            goto LABEL_18;
          }
          v16 = TPModelLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v41 = v14;
            __int16 v42 = 2114;
            uint64_t v43 = v13;
            _os_log_impl(&dword_20CB20000, v16, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ trusts the following peer ID, but we don't recognize the hash: %{public}@", buf, 0x16u);
          }
        }
        uint64_t v9 = [v10 countByEnumeratingWithState:&v23 objects:v44 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  v17 = v22;
  if ((v9 & 1) == 0 && a3 && v22)
  {
    *a3 = v22;
    v17 = v22;
  }

  return v9;
}

void __52__TPModel_currentStatePossiblyMissingDataWithError___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 peerID];
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v4];
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = [v3 dynamicInfo];
  v7 = [v6 includedPeerIDs];
  id v8 = [v5 setWithSet:v7];

  [v8 minusSet:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [v8 minusSet:a1[4]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v4, *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:0 forKeyedSubscript:v4];
}

- (id)allCustodianRecoveryKeyPeerIDs
{
  v2 = [(TPModel *)self custodianRecoveryKeys];
  id v3 = [v2 allKeys];

  return v3;
}

- (id)allCustodianRecoveryKeys
{
  v2 = [(TPModel *)self custodianRecoveryKeys];
  id v3 = [v2 allValues];

  return v3;
}

- (id)findCustodianRecoveryKeyWithUUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(TPModel *)self custodianRecoveryKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [(TPModel *)self custodianRecoveryKeys];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 uuid];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          long long v15 = [(TPModel *)self custodianRecoveryKeys];
          long long v14 = [v15 objectForKeyedSubscript:v9];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  long long v14 = 0;
LABEL_11:

  return v14;
}

- (void)removeCustodianRecoveryKey:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = TPModelLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_20CB20000, v4, OS_LOG_TYPE_DEFAULT, "removeCustodianRecoveryKey: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)registerCustodianRecoveryKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    long long v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"TPModel.m" lineNumber:2687 description:@"custodianRecoveryKey"];
  }
  id v6 = [(TPModel *)self custodianRecoveryKeys];
  uint64_t v7 = [v5 peerID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    uint64_t v9 = [(TPModel *)self custodianRecoveryKeys];
    uint64_t v10 = [v5 peerID];
    [v9 setObject:v5 forKeyedSubscript:v10];
  }
  uint64_t v11 = TPModelLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v5 peerID];
    char v13 = [(TPModel *)self custodianRecoveryKeys];
    int v15 = 138543618;
    long long v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = [v13 count];
    _os_log_impl(&dword_20CB20000, v11, OS_LOG_TYPE_DEFAULT, "registerCustodianRecoveryKey %{public}@ -- size now %lu", (uint8_t *)&v15, 0x16u);
  }
}

- (BOOL)isCustodianRecoveryKeyTrusted:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v10 = 0;
  id v5 = [(TPModel *)self possibleSponsorsForCustodianRecoveryKey:a3 block:&__block_literal_global_134 error:&v10];
  id v6 = v10;
  if (v6)
  {
    uint64_t v7 = TPModelLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v6;
      _os_log_impl(&dword_20CB20000, v7, OS_LOG_TYPE_DEFAULT, "Error determining possible sponsors: %{public}@", buf, 0xCu);
    }

    BOOL v8 = 0;
    if (a4) {
      *a4 = v6;
    }
  }
  else
  {
    BOOL v8 = [v5 count] != 0;
  }

  return v8;
}

uint64_t __47__TPModel_isCustodianRecoveryKeyTrusted_error___block_invoke()
{
  return 1;
}

- (id)peerIDThatTrustsCustodianRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __83__TPModel_peerIDThatTrustsCustodianRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke;
  v20[3] = &unk_2640EC860;
  v20[4] = self;
  id v12 = v10;
  id v21 = v12;
  id v13 = v11;
  id v22 = v13;
  id v19 = 0;
  long long v14 = [(TPModel *)self possibleSponsorsForCustodianRecoveryKey:a3 block:v20 error:&v19];
  id v15 = v19;
  long long v16 = v15;
  if (v15)
  {
    __int16 v17 = 0;
    if (a6) {
      *a6 = v15;
    }
  }
  else
  {
    __int16 v17 = [v14 anyObject];
  }

  return v17;
}

uint64_t __83__TPModel_peerIDThatTrustsCustodianRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [a2 peerID];
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v12 = 0;
  uint64_t v7 = [v4 checkIntroductionForCandidate:v5 stableInfo:v6 withSponsorID:v3 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    uint64_t v9 = TPModelLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(id)a1[5] peerID];
      *(_DWORD *)buf = 138543874;
      long long v14 = v3;
      __int16 v15 = 2114;
      long long v16 = v10;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_20CB20000, v9, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ supports this Custodian RK, but cannot sponsor peer %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v7;
}

- (id)possibleSponsorsForCustodianRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = (id)0xAAAAAAAAAAAAAAAALL;
  id v38 = [MEMORY[0x263EFF9C0] set];
  id v11 = (void *)MEMORY[0x210554CF0]();
  id v12 = TPModelLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v9 uuid];
    id v13 = [v9 peerID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_20CB20000, v12, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: %{public}@/%{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = (id)0xAAAAAAAAAAAAAAAALL;
  id v48 = [MEMORY[0x263EFF9C0] set];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __63__TPModel_possibleSponsorsForCustodianRecoveryKey_block_error___block_invoke;
  v28[3] = &unk_2640EC8A8;
  id v14 = v9;
  id v29 = v14;
  v31 = buf;
  id v15 = v10;
  id v30 = v15;
  v32 = &v33;
  id v27 = 0;
  long long v16 = [(TPModel *)self _iterateOverPeersWithBlock:v28 error:&v27];
  id v17 = v27;
  if (!v17)
  {
    [*(id *)(*(void *)&buf[8] + 40) intersectSet:v16];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      id v18 = TPModelLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v14 uuid];
        long long v20 = [v14 peerID];
        *(_DWORD *)id v39 = 138543618;
        v40 = v19;
        __int16 v41 = 2114;
        __int16 v42 = v20;
        _os_log_impl(&dword_20CB20000, v18, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: CRK %{public}@/%{public}@ is not trusted", v39, 0x16u);
      }
LABEL_7:

      id v5 = 0;
      goto LABEL_12;
    }
    [(id)v34[5] intersectSet:v16];
    uint64_t v21 = [(id)v34[5] count];
    id v18 = TPModelLog();
    BOOL v22 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v21)
    {
      if (v22)
      {
        *(_WORD *)id v39 = 0;
        _os_log_impl(&dword_20CB20000, v18, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: no sponsors, no distrust", v39, 2u);
      }
      goto LABEL_7;
    }
    if (v22)
    {
      uint64_t v23 = [v14 uuid];
      long long v24 = [v14 peerID];
      uint64_t v25 = v34[5];
      *(_DWORD *)id v39 = 138543874;
      v40 = v23;
      __int16 v41 = 2114;
      __int16 v42 = v24;
      __int16 v43 = 2114;
      uint64_t v44 = v25;
      _os_log_impl(&dword_20CB20000, v18, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForCustodianRecoveryKey: CRK %{public}@/%{public}@ returning %{public}@", v39, 0x20u);
    }
    id v5 = (id)v34[5];
  }
LABEL_12:

  _Block_object_dispose(buf, 8);
  if (v17)
  {
    id v5 = 0;
    if (a5) {
      *a5 = v17;
    }
  }
  _Block_object_dispose(&v33, 8);

  return v5;
}

void __63__TPModel_possibleSponsorsForCustodianRecoveryKey_block_error___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 peerID];
  id v4 = [v13 dynamicInfo];
  id v5 = [v4 excludedPeerIDs];
  uint64_t v6 = [*(id *)(a1 + 32) peerID];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 48);
LABEL_6:
    [*(id *)(*(void *)(v8 + 8) + 40) addObject:v3];
    goto LABEL_8;
  }
  id v9 = [v13 dynamicInfo];
  id v10 = [v9 includedPeerIDs];
  id v11 = [*(id *)(a1 + 32) peerID];
  if ([v10 containsObject:v11])
  {
    int v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

    if (!v12) {
      goto LABEL_8;
    }
    uint64_t v8 = *(void *)(a1 + 56);
    goto LABEL_6;
  }

LABEL_8:
}

- (id)recoveryEncryptionPublicKey
{
  return self->_recoveryEncryptionPubKey;
}

- (id)recoverySigningPublicKey
{
  return self->_recoverySigningPubKey;
}

- (void)setRecoveryKeys:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(TPModel *)self recoverySigningPubKey];
  uint64_t v6 = [v4 signingKeyData];
  if ([v5 isEqualToData:v6])
  {
    int v7 = [(TPModel *)self recoveryEncryptionPubKey];
    uint64_t v8 = [v4 encryptionKeyData];
    char v9 = [v7 isEqualToData:v8];

    if (v9) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = TPModelLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(TPModel *)self recoverySigningPubKey];
    int v12 = [(TPModel *)self recoveryEncryptionPubKey];
    id v13 = [v4 signingKeyData];
    id v14 = [v4 encryptionKeyData];
    int v17 = 138544130;
    id v18 = v11;
    __int16 v19 = 2114;
    long long v20 = v12;
    __int16 v21 = 2114;
    BOOL v22 = v13;
    __int16 v23 = 2114;
    long long v24 = v14;
    _os_log_impl(&dword_20CB20000, v10, OS_LOG_TYPE_DEFAULT, "Recovery Keys changed! currently set signingKey: %{public}@, currently set encryptionKey: %{public}@, new signingKey: %{public}@, new encryption Key: %{public}@", (uint8_t *)&v17, 0x2Au);
  }
LABEL_8:
  id v15 = [v4 encryptionKeyData];
  [(TPModel *)self setRecoveryEncryptionPubKey:v15];

  long long v16 = [v4 signingKeyData];
  [(TPModel *)self setRecoverySigningPubKey:v16];
}

- (void)removeRecoveryKey
{
  [(TPModel *)self setRecoverySigningPubKey:0];
  [(TPModel *)self setRecoveryEncryptionPubKey:0];
}

- (BOOL)isRecoveryKeyEnrolledWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(TPModel *)self recoverySigningPubKey];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)v5;
  int v7 = [(TPModel *)self recoveryEncryptionPubKey];

  if (!v7) {
    return 0;
  }
  uint64_t v8 = [TPRecoveryKeyPair alloc];
  char v9 = [(TPModel *)self recoverySigningPubKey];
  id v10 = [(TPModel *)self recoveryEncryptionPubKey];
  id v11 = [(TPRecoveryKeyPair *)v8 initWithSigningKeyData:v9 encryptionKeyData:v10];

  id v17 = 0;
  int v12 = [(TPModel *)self possibleSponsorsForRecoveryKey:v11 block:&__block_literal_global_132 error:&v17];
  id v13 = v17;
  if (v13)
  {
    id v14 = TPModelLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v13;
      _os_log_impl(&dword_20CB20000, v14, OS_LOG_TYPE_DEFAULT, "Error determining possible sponsors: %{public}@", buf, 0xCu);
    }

    BOOL v15 = 0;
    if (a3) {
      *a3 = v13;
    }
  }
  else
  {
    BOOL v15 = [v12 count] != 0;
  }

  return v15;
}

uint64_t __42__TPModel_isRecoveryKeyEnrolledWithError___block_invoke()
{
  return 1;
}

- (id)peerIDThatTrustsRecoveryKeys:(id)a3 canIntroducePeer:(id)a4 stableInfo:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__TPModel_peerIDThatTrustsRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke;
  v18[3] = &unk_2640EC860;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = [(TPModel *)self possibleSponsorsForRecoveryKey:a3 block:v18 error:a6];
  BOOL v15 = v14;
  if (*a6)
  {
    long long v16 = 0;
  }
  else
  {
    long long v16 = [v14 anyObject];
  }

  return v16;
}

uint64_t __74__TPModel_peerIDThatTrustsRecoveryKeys_canIntroducePeer_stableInfo_error___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [a2 peerID];
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v12 = 0;
  uint64_t v7 = [v4 checkIntroductionForCandidate:v5 stableInfo:v6 withSponsorID:v3 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    char v9 = TPModelLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(id)a1[5] peerID];
      *(_DWORD *)buf = 138543874;
      id v14 = v3;
      __int16 v15 = 2114;
      long long v16 = v10;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_impl(&dword_20CB20000, v9, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ supports this recovery key, but cannot sponsor peer %{public}@: %{public}@", buf, 0x20u);
    }
  }

  return v7;
}

- (id)possibleSponsorsForRecoveryKey:(id)a3 block:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  id v38 = (id)0xAAAAAAAAAAAAAAAALL;
  id v38 = [MEMORY[0x263EFF9C0] set];
  id v11 = (void *)MEMORY[0x210554CF0]();
  id v12 = TPModelLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v9 signingKeyData];
    id v5 = [v9 encryptionKeyData];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_20CB20000, v12, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: sign %{public}@, enc %{public}@", buf, 0x16u);
  }
  id v14 = [v9 signingKeyData];
  __int16 v15 = [(TPModel *)self recoveryKeyPeerID:v14];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v42 = __Block_byref_object_copy_;
  __int16 v43 = __Block_byref_object_dispose_;
  id v44 = (id)0xAAAAAAAAAAAAAAAALL;
  id v44 = [MEMORY[0x263EFF9C0] set];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __54__TPModel_possibleSponsorsForRecoveryKey_block_error___block_invoke;
  v27[3] = &unk_2640EC838;
  id v16 = v15;
  id v28 = v16;
  v31 = buf;
  id v17 = v9;
  id v29 = v17;
  id v18 = v10;
  id v30 = v18;
  v32 = &v33;
  id v26 = 0;
  uint64_t v19 = [(TPModel *)self _iterateOverPeersWithBlock:v27 error:&v26];
  id v20 = v26;
  if (!v20)
  {
    [*(id *)(*(void *)&buf[8] + 40) intersectSet:v19];
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      __int16 v21 = TPModelLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v39 = 0;
        _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: registered recovery key is not trusted", v39, 2u);
      }
LABEL_7:

      id v5 = 0;
      goto LABEL_12;
    }
    [(id)v34[5] intersectSet:v19];
    uint64_t v22 = [(id)v34[5] count];
    __int16 v21 = TPModelLog();
    BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v22)
    {
      if (v23)
      {
        *(_WORD *)id v39 = 0;
        _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: no sponsors, no distrust", v39, 2u);
      }
      goto LABEL_7;
    }
    if (v23)
    {
      uint64_t v24 = v34[5];
      *(_DWORD *)id v39 = 138543362;
      uint64_t v40 = v24;
      _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_DEFAULT, "possibleSponsorsForRecoveryKey: returning %{public}@", v39, 0xCu);
    }

    id v5 = (id)v34[5];
  }
LABEL_12:

  _Block_object_dispose(buf, 8);
  if (v20)
  {
    id v5 = 0;
    if (a5) {
      *a5 = v20;
    }
  }
  _Block_object_dispose(&v33, 8);

  return v5;
}

void __54__TPModel_possibleSponsorsForRecoveryKey_block_error___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  id v3 = [v28 peerID];
  id v4 = [v28 dynamicInfo];
  id v5 = [v4 excludedPeerIDs];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 56);
LABEL_3:
    [*(id *)(*(void *)(v7 + 8) + 40) addObject:v3];
    goto LABEL_15;
  }
  uint64_t v8 = [v28 stableInfo];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v28 stableInfo];
    uint64_t v11 = [v10 recoverySigningPublicKey];
    if (v11)
    {
      id v12 = (void *)v11;
      id v13 = [v28 stableInfo];
      uint64_t v14 = [v13 recoveryEncryptionPublicKey];
      if (v14)
      {
        __int16 v15 = (void *)v14;
        id v16 = [*(id *)(a1 + 40) signingKeyData];
        id v17 = [v28 stableInfo];
        id v18 = [v17 recoverySigningPublicKey];
        if ([v16 isEqualToData:v18])
        {
          id v27 = v16;
          uint64_t v19 = [*(id *)(a1 + 40) encryptionKeyData];
          uint64_t v25 = [v28 stableInfo];
          uint64_t v20 = [v25 recoveryEncryptionPublicKey];
          id v26 = (void *)v19;
          __int16 v21 = (void *)v19;
          uint64_t v22 = (void *)v20;
          int v23 = objc_msgSend(v21, "isEqualToData:");
          if (v23) {
            int v23 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
          }
          int v24 = v23;

          if (v24)
          {
            uint64_t v7 = *(void *)(a1 + 64);
            goto LABEL_3;
          }
          goto LABEL_15;
        }
      }
    }
  }
LABEL_15:
}

- (id)untrustedPeerIDsWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  __int16 v15 = __Block_byref_object_dispose_;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = [MEMORY[0x263EFF9C0] set];
  id v9 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__TPModel_untrustedPeerIDsWithError___block_invoke;
  v10[3] = &unk_2640EC5C8;
  v10[4] = &v11;
  [(TPModel *)self enumeratePeersUsingBlock:v10 error:&v9];
  id v5 = v9;
  int v6 = v5;
  if (v5)
  {
    id v7 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    id v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __37__TPModel_untrustedPeerIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = [a2 dynamicInfo];
  id v3 = [v5 excludedPeerIDs];
  if (v3)
  {
    [v2 unionSet:v3];
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA08] set];
    [v2 unionSet:v4];
  }
}

- (id)bestWebAccessForStableInfo:(id)a3 webAccessStableChanges:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = 0;
  id v10 = [(TPModel *)self bestWebAccessAcrossTrustedPeersWithError:&v21];
  id v11 = v21;
  id v12 = v11;
  if (v11)
  {
    id v13 = 0;
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    if (v9 && v10)
    {
      uint64_t v14 = [v10 clock];
      __int16 v15 = [v8 webAccess];
      if (v14 == [v15 clock])
      {
        id v16 = [v8 webAccess];
        int v17 = [v16 value];
        int v18 = [v9 value];

        if (v17 == v18)
        {
          id v13 = [v8 webAccess];
          goto LABEL_19;
        }
      }
      else
      {
      }
      objc_msgSend(v10, "setClock:", objc_msgSend(v10, "clock") + 1);
      objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
    }
    else
    {
      if (v9 && !v10)
      {
        id v10 = (void *)[v9 copy];
        [v10 setClock:0];
      }
      if (!v10)
      {
        id v10 = [v8 webAccess];

        if (v10)
        {
          uint64_t v19 = [v8 webAccess];
          id v10 = (void *)[v19 copy];

          [v10 setClock:0];
        }
      }
    }
    id v13 = v10;
    id v10 = v13;
  }
LABEL_19:

  return v13;
}

- (id)bestWebAccessAcrossTrustedPeersWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v6 = (void *)MEMORY[0x210554CF0](self, a2);
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = [MEMORY[0x263EFF9A0] dictionary];
  id v21 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __52__TPModel_bestWebAccessAcrossTrustedPeersWithError___block_invoke;
  v22[3] = &unk_2640EC5A0;
  v22[4] = &v23;
  id v7 = [(TPModel *)self _iterateOverPeersWithBlock:v22 error:&v21];
  id v8 = v21;
  if (!v8)
  {
    id v9 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = (id)v24[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14, (void)v17))
          {
            __int16 v15 = [(id)v24[5] objectForKeyedSubscript:v14];
            [v9 addObject:v15];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }
      while (v11);
    }

    id v3 = +[TPModel pickClock:v9];
  }
  _Block_object_dispose(&v23, 8);

  if (v8)
  {
    id v3 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

void __52__TPModel_bestWebAccessAcrossTrustedPeersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 peerID];
  id v4 = [v3 stableInfo];

  id v5 = [v4 webAccess];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
}

- (id)bestWalrusAcrossTrustedPeersWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x210554CF0](self, a2);
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = [MEMORY[0x263EFF9A0] dictionary];
  id v21 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __49__TPModel_bestWalrusAcrossTrustedPeersWithError___block_invoke;
  v22[3] = &unk_2640EC5A0;
  v22[4] = &v23;
  id v7 = [(TPModel *)self _iterateOverPeersWithBlock:v22 error:&v21];
  id v8 = v21;
  if (!v8)
  {
    id v9 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = (id)v24[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v14, (void)v17))
          {
            __int16 v15 = [(id)v24[5] objectForKeyedSubscript:v14];
            [v9 addObject:v15];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v29 count:16];
      }
      while (v11);
    }

    id v3 = +[TPModel pickClock:v9];
  }
  _Block_object_dispose(&v23, 8);

  if (v8)
  {
    id v3 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

void __49__TPModel_bestWalrusAcrossTrustedPeersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 peerID];
  id v4 = [v3 stableInfo];

  id v5 = [v4 walrusSetting];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
}

- (unint64_t)trustedPeerCountWithError:(id *)a3
{
  id v5 = (void *)MEMORY[0x210554CF0](self, a2);
  id v10 = 0;
  id v6 = [(TPModel *)self _iterateOverPeersWithBlock:&__block_literal_global error:&v10];
  id v7 = v10;
  if (v7)
  {

    unint64_t v8 = 0;
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    unint64_t v8 = [v6 count];
  }

  return v8;
}

- (id)bestWalrusForStableInfo:(id)a3 walrusStableChanges:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = 0;
  id v10 = [(TPModel *)self bestWalrusAcrossTrustedPeersWithError:&v21];
  id v11 = v21;
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = 0;
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    if (v9 && v10)
    {
      uint64_t v14 = [v10 clock];
      __int16 v15 = [v8 walrusSetting];
      if (v14 == [v15 clock])
      {
        id v16 = [v8 walrusSetting];
        int v17 = [v16 value];
        int v18 = [v9 value];

        if (v17 == v18)
        {
          id v13 = [v8 walrusSetting];
          goto LABEL_19;
        }
      }
      else
      {
      }
      objc_msgSend(v10, "setClock:", objc_msgSend(v10, "clock") + 1);
      objc_msgSend(v10, "setValue:", objc_msgSend(v9, "value"));
    }
    else
    {
      if (v9 && !v10)
      {
        id v10 = (void *)[v9 copy];
        [v10 setClock:0];
      }
      if (!v10)
      {
        id v10 = [v8 walrusSetting];

        if (v10)
        {
          long long v19 = [v8 walrusSetting];
          id v10 = (void *)[v19 copy];

          [v10 setClock:0];
        }
      }
    }
    id v13 = v10;
    id v10 = v13;
  }
LABEL_19:

  return v13;
}

- (id)bestRecoveryKeyForStableInfo:(id)a3 vouchers:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [[TPRecoveryKeyPair alloc] initWithStableInfo:v8];
  id v11 = [(TPRecoveryKeyPair *)v10 signingKeyData];
  uint64_t v12 = [(TPModel *)self recoveryKeyPeerID:v11];

  id v13 = (void *)MEMORY[0x210554CF0]();
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  id v48 = __Block_byref_object_dispose_;
  id v49 = (id)0xAAAAAAAAAAAAAAAALL;
  id v49 = [MEMORY[0x263EFF9C0] set];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  __int16 v41 = __Block_byref_object_copy_;
  __int16 v42 = __Block_byref_object_dispose_;
  id v43 = (id)0xAAAAAAAAAAAAAAAALL;
  id v43 = [MEMORY[0x263EFF9C0] set];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __55__TPModel_bestRecoveryKeyForStableInfo_vouchers_error___block_invoke;
  v32[3] = &unk_2640EC7D0;
  id v14 = v12;
  id v33 = v14;
  uint64_t v36 = &v38;
  id v15 = v9;
  id v34 = v15;
  uint64_t v35 = self;
  v37 = &v44;
  id v31 = 0;
  id v16 = [(TPModel *)self _iterateOverPeersWithBlock:v32 error:&v31];
  id v17 = v31;
  if (v17)
  {
    id v18 = v17;
    long long v19 = 0;
LABEL_3:
    LODWORD(v20) = 1;
    goto LABEL_6;
  }
  [(id)v39[5] intersectSet:v16];
  if ([(id)v39[5] count])
  {
    [(TPModel *)self removeRecoveryKey];
    long long v19 = 0;
    id v18 = 0;
    LODWORD(v20) = 0;
    goto LABEL_6;
  }
  [(id)v45[5] intersectSet:v16];
  long long v20 = [(id)v45[5] anyObject];
  if (v20)
  {
    id v30 = 0;
    id v29 = [(TPModel *)self peerWithID:v20 error:&v30];
    id v18 = v30;
    if (v29)
    {
      uint64_t v23 = [TPRecoveryKeyPair alloc];
      int v24 = [v29 stableInfo];
      long long v19 = [(TPRecoveryKeyPair *)v23 initWithStableInfo:v24];
LABEL_25:

      goto LABEL_3;
    }
    int v24 = TPModelLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138543618;
        v51 = v20;
        __int16 v52 = 2114;
        id v53 = v18;
        id v26 = "Error finding peer %{public}@: %{public}@";
        id v27 = v24;
        uint32_t v28 = 22;
LABEL_23:
        _os_log_impl(&dword_20CB20000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 138543362;
      v51 = v20;
      id v26 = "Peer not in DB %{public}@";
      id v27 = v24;
      uint32_t v28 = 12;
      goto LABEL_23;
    }
    long long v19 = 0;
    goto LABEL_25;
  }
  long long v19 = 0;
  id v18 = 0;
LABEL_6:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  if (v20)
  {
    if (a5) {
      *a5 = v18;
    }
    id v21 = v19;
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

void __55__TPModel_bestRecoveryKeyForStableInfo_vouchers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 peerID];
  id v5 = [v3 dynamicInfo];
  id v6 = [v5 excludedPeerIDs];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  id v8 = (void *)v4;
  uint64_t v9 = a1;

  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  uint64_t v42 = a1;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v46;
    uint64_t v40 = v8;
    uint64_t v41 = *(void *)v46;
    do
    {
      uint64_t v13 = 0;
      uint64_t v43 = v11;
      do
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
        id v15 = [v14 sponsorID];
        int v16 = [v8 isEqualToString:v15];

        if (v16)
        {
          id v17 = [v3 stableInfo];
          uint64_t v18 = [v17 recoverySigningPublicKey];
          if (!v18) {
            goto LABEL_15;
          }
          long long v19 = (void *)v18;
          uint64_t v20 = [*(id *)(v9 + 48) recoverySigningPubKey];
          if (!v20)
          {

            uint64_t v11 = v43;
LABEL_15:

            goto LABEL_16;
          }
          id v21 = (void *)v20;
          [v3 stableInfo];
          v23 = id v22 = v3;
          int v24 = [v23 recoverySigningPublicKey];
          BOOL v25 = [*(id *)(v9 + 48) recoverySigningPubKey];
          int v26 = [v24 isEqualToData:v25];

          uint64_t v9 = v42;
          uint64_t v12 = v41;

          id v3 = v22;
          id v8 = v40;

          uint64_t v11 = v43;
          if (v26)
          {
            id v27 = [v3 stableInfo];
            uint32_t v28 = [v27 recoverySigningPublicKey];
            id v29 = [v14 createRecoveryECPublicKey:v28];
            int v30 = [v14 checkSignatureWithKey:v29];

            uint64_t v12 = v41;
            uint64_t v9 = v42;
            if (v30)
            {
              [*(id *)(*(void *)(*(void *)(v42 + 64) + 8) + 40) addObject:v40];
              goto LABEL_18;
            }
          }
        }
LABEL_16:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v11);
  }
LABEL_18:

  id v31 = [v3 stableInfo];

  if (v31)
  {
    v32 = v8;
    id v33 = [v3 stableInfo];
    id v34 = [v33 recoverySigningPublicKey];
    uint64_t v35 = [*(id *)(v42 + 48) recoverySigningPubKey];
    if ([v34 isEqualToData:v35])
    {
      uint64_t v36 = [v3 stableInfo];
      v37 = [v36 recoveryEncryptionPublicKey];
      uint64_t v38 = [*(id *)(v42 + 48) recoveryEncryptionPubKey];
      int v39 = [v37 isEqualToData:v38];

      id v8 = v32;
      if (v39) {
        [*(id *)(*(void *)(*(void *)(v42 + 64) + 8) + 40) addObject:v32];
      }
    }
    else
    {

      id v8 = v32;
    }
  }
}

- (BOOL)doesOctagonContainDistrustedRecoveryKeysWithError:(id *)a3
{
  id v6 = (void *)MEMORY[0x210554CF0](self, a2);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = [MEMORY[0x263EFF9C0] set];
  id v10 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__TPModel_doesOctagonContainDistrustedRecoveryKeysWithError___block_invoke;
  v11[3] = &unk_2640EC5A0;
  v11[4] = &v12;
  int v7 = [(TPModel *)self _iterateOverPeersWithBlock:v11 error:&v10];
  id v8 = v10;
  if (!v8)
  {
    [(id)v13[5] intersectSet:v7];
    BOOL v3 = [(id)v13[5] count] != 0;
  }

  _Block_object_dispose(&v12, 8);
  if (v8)
  {
    BOOL v3 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

void __61__TPModel_doesOctagonContainDistrustedRecoveryKeysWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 peerID];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v3, "dynamicInfo", 0);
  id v6 = [v5 excludedPeerIDs];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"RK-"])
        {
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v4];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)vectorClockWithError:(id *)a3
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__TPModel_vectorClockWithError___block_invoke;
  v12[3] = &unk_2640EC5F0;
  id v6 = v5;
  id v13 = v6;
  id v11 = 0;
  [(TPModel *)self enumeratePeersUsingBlock:v12 error:&v11];
  id v7 = v11;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = 0;
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

void __32__TPModel_vectorClockWithError___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stableInfo];
  if (v3)
  {

LABEL_4:
    id v5 = [v13 stableInfo];
    unint64_t v6 = [v5 clock];

    id v7 = [v13 dynamicInfo];
    unint64_t v8 = [v7 clock];

    if (v6 <= v8) {
      unint64_t v9 = v8;
    }
    else {
      unint64_t v9 = v6;
    }
    id v10 = [NSNumber numberWithUnsignedLongLong:v9];
    id v11 = *(void **)(a1 + 32);
    long long v12 = [v13 peerID];
    [v11 setObject:v10 forKeyedSubscript:v12];

    goto LABEL_8;
  }
  uint64_t v4 = [v13 dynamicInfo];

  if (v4) {
    goto LABEL_4;
  }
LABEL_8:
}

- (id)getPeerIDsTrustedByPeerWithDynamicInfo:(id)a3 toAccessView:(id)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v31 = a4;
  unint64_t v9 = [v8 includedPeerIDs];
  id v10 = [MEMORY[0x263EFF9C0] set];
  id v39 = 0;
  int v30 = [(TPModel *)self policyForPeerIDs:v9 candidatePeerID:0 candidateStableInfo:0 error:&v39];
  id v11 = v39;
  if (!v11)
  {
    uint32_t v28 = v10;
    int v26 = v9;
    id v27 = v8;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v9;
    uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    id v12 = 0;
    if (!v33) {
      goto LABEL_20;
    }
    uint64_t v32 = *(void *)v36;
    while (1)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        id v15 = v12;
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v17 = (void *)MEMORY[0x210554CF0]();
        id v34 = v12;
        uint64_t v18 = [(TPModel *)self peerWithID:v16 error:&v34];
        id v12 = v34;

        if (v18)
        {
          long long v19 = [v18 permanentInfo];
          uint64_t v20 = [v19 modelID];
          id v21 = [v30 categoryForModel:v20];

          if ([v30 peerInCategory:v21 canAccessView:v31]) {
            [v28 addObject:v16];
          }
        }
        else
        {
          id v21 = TPModelLog();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (v12)
          {
            if (!v22) {
              goto LABEL_18;
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v16;
            __int16 v42 = 2114;
            id v43 = v12;
            uint64_t v23 = v21;
            int v24 = "Error finding peer %{public}@: %{public}@";
          }
          else
          {
            if (!v22) {
              goto LABEL_18;
            }
            *(_DWORD *)buf = 138543618;
            uint64_t v41 = v16;
            __int16 v42 = 2114;
            id v43 = 0;
            uint64_t v23 = v21;
            int v24 = "Peer not in DB %{public}@: %{public}@";
          }
          _os_log_impl(&dword_20CB20000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
        }
LABEL_18:
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (!v33)
      {
LABEL_20:

        id v10 = v28;
        id v13 = v28;
        unint64_t v9 = v26;
        id v8 = v27;
        goto LABEL_22;
      }
    }
  }
  id v12 = v11;
  if (a5)
  {
    id v12 = v11;
    id v13 = 0;
    *a5 = v12;
  }
  else
  {
    id v13 = 0;
  }
LABEL_22:

  return v13;
}

- (id)getPeerIDsTrustedByPeerWithID:(id)a3 toAccessView:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unint64_t v9 = [(TPModel *)self actualPeerWithID:a3 error:a5];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 dynamicInfo];
    id v12 = [(TPModel *)self getPeerIDsTrustedByPeerWithDynamicInfo:v11 toAccessView:v8 error:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)getViewsForCRK:(id)a3 donorPermanentInfo:(id)a4 donorStableInfo:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(TPModel *)self getViewsForPeer:v11 stableInfo:v12 error:a6];
  long long v14 = (void *)[v13 mutableCopy];

  if (v14)
  {
    if ([v10 kind] != 2)
    {
LABEL_9:
      id v19 = v14;
      goto LABEL_11;
    }
    id v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = [v11 peerID];
    id v17 = [v15 setWithObject:v16];
    uint64_t v18 = [v11 peerID];
    id v19 = [(TPModel *)self policyForPeerIDs:v17 candidatePeerID:v18 candidateStableInfo:v12 error:a6];

    if (!v19) {
      goto LABEL_11;
    }
    uint64_t v20 = [v19 inheritedExcludedViews];
    id v21 = [v19 version];
    if ((unint64_t)[v21 versionNumber] <= 0xB)
    {
      uint64_t v22 = [v20 count];

      if (v22)
      {
LABEL_8:
        [v14 minusSet:v20];

        goto LABEL_9;
      }
      [MEMORY[0x263EFFA08] setWithArray:&unk_26C1C1D78];
      uint64_t v20 = v21 = v20;
    }

    goto LABEL_8;
  }
  id v19 = 0;
LABEL_11:

  return v19;
}

- (id)getViewsForPeer:(id)a3 stableInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  unint64_t v9 = (void *)MEMORY[0x263EFFA08];
  id v10 = a4;
  id v11 = [v8 peerID];
  id v12 = [v9 setWithObject:v11];
  id v13 = [v8 peerID];
  long long v14 = [(TPModel *)self policyForPeerIDs:v12 candidatePeerID:v13 candidateStableInfo:v10 error:a5];

  if (v14)
  {
    id v15 = [v8 modelID];
    uint64_t v16 = [v14 viewsForModel:v15 error:a5];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (BOOL)considerPolicyFromPeerID:(id)a3 stableInfo:(id)a4 secrets:(id)a5 newestPolicyDoc:(id *)a6 error:(id *)a7
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    BOOL v29 = 1;
    goto LABEL_28;
  }
  v57 = a7;
  v58 = self;
  id v15 = a6;
  id v59 = v12;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v16 = [v13 policySecrets];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v22 = [v13 policySecrets];
        uint64_t v23 = [v22 objectForKeyedSubscript:v21];
        [v14 setObject:v23 forKeyedSubscript:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v18);
  }

  int v24 = v15;
  if (!*v15) {
    goto LABEL_12;
  }
  BOOL v25 = [*v15 version];
  unint64_t v26 = [v25 versionNumber];
  id v27 = [v13 bestPolicyVersion];
  unint64_t v28 = [v27 versionNumber];

  if (v26 <= v28)
  {
LABEL_12:
    int v30 = [(TPModel *)v58 dbAdapter];
    id v31 = [v13 bestPolicyVersion];
    id v60 = 0;
    uint64_t v32 = objc_msgSend(v30, "policyWithVersion:error:", objc_msgSend(v31, "versionNumber"), &v60);
    id v33 = v60;

    id v12 = v59;
    if (v33)
    {
      if (v57)
      {
        BOOL v29 = 0;
        id *v57 = v33;
LABEL_27:

        goto LABEL_28;
      }
LABEL_21:
      BOOL v29 = 0;
      goto LABEL_27;
    }
    if (!v32)
    {
      if (v57)
      {
        uint64_t v40 = (void *)MEMORY[0x263F087E8];
        uint64_t v41 = TPErrorDomain;
        v67[0] = @"peerID";
        v67[1] = @"policyVersion";
        v68[0] = v59;
        __int16 v42 = NSNumber;
        id v43 = [v13 bestPolicyVersion];
        uint64_t v44 = objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v43, "versionNumber"));
        v68[1] = v44;
        uint64_t v45 = [NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:2];
        id *v57 = [v40 errorWithDomain:v41 code:1 userInfo:v45];
      }
      goto LABEL_21;
    }
    id v34 = [v32 version];
    long long v35 = [v34 policyHash];
    long long v36 = [v13 bestPolicyVersion];
    long long v37 = [v36 policyHash];
    long long v38 = v32;
    char v39 = [v35 isEqualToString:v37];

    if (v39)
    {
      *int v24 = v38;
      BOOL v29 = 1;
    }
    else
    {
      if (v57)
      {
        uint64_t v53 = TPErrorDomain;
        uint64_t v54 = (void *)MEMORY[0x263F087E8];
        v66[0] = v59;
        v65[0] = @"peerID";
        v65[1] = @"policyVersion";
        long long v46 = NSNumber;
        v56 = [v13 bestPolicyVersion];
        v55 = objc_msgSend(v46, "numberWithUnsignedLongLong:", objc_msgSend(v56, "versionNumber"));
        v66[1] = v55;
        v65[2] = @"policyDocHash";
        long long v47 = [v38 version];
        long long v48 = [v47 policyHash];
        v66[2] = v48;
        v65[3] = @"peerExpectsHash";
        id v49 = [v13 bestPolicyVersion];
        uint64_t v50 = [v49 policyHash];
        v66[3] = v50;
        v51 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
        id *v57 = [v54 errorWithDomain:v53 code:2 userInfo:v51];

        uint64_t v32 = v38;
        BOOL v29 = 0;
LABEL_26:
        id v33 = 0;
        goto LABEL_27;
      }
      BOOL v29 = 0;
    }
    uint64_t v32 = v38;
    goto LABEL_26;
  }
  BOOL v29 = 1;
  id v12 = v59;
LABEL_28:

  return v29;
}

- (id)policyForPeerIDs:(id)a3 candidatePeerID:(id)a4 candidateStableInfo:(id)a5 error:(id *)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v10 count])
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:TPErrorDomain code:8 userInfo:0];
      BOOL v29 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v29 = 0;
    }
    goto LABEL_35;
  }
  long long v35 = a6;
  id v36 = v12;
  id v37 = v11;
  uint64_t v40 = [MEMORY[0x263EFF9A0] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v34 = v10;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (!v13)
  {
    id v15 = 0;
    goto LABEL_25;
  }
  uint64_t v14 = v13;
  id v15 = 0;
  uint64_t v39 = *(void *)v46;
  while (2)
  {
    uint64_t v16 = 0;
    uint64_t v17 = v15;
    do
    {
      if (*(void *)v46 != v39) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * v16);
      uint64_t v19 = (void *)MEMORY[0x210554CF0]();
      id v44 = 0;
      uint64_t v20 = [(TPModel *)self peerWithID:v18 error:&v44];
      id v21 = v44;
      if (!v20)
      {
        uint64_t v22 = TPModelLog();
        BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        if (v21)
        {
          if (v23)
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v50 = v18;
            __int16 v51 = 2114;
            id v52 = v21;
            int v24 = v22;
            BOOL v25 = "Error finding peer %{public}@: %{public}@";
LABEL_13:
            _os_log_impl(&dword_20CB20000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
          }
        }
        else if (v23)
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v50 = v18;
          __int16 v51 = 2114;
          id v52 = 0;
          int v24 = v22;
          BOOL v25 = "Peer not in DB %{public}@: %{public}@";
          goto LABEL_13;
        }
      }
      unint64_t v26 = [v20 stableInfo];
      id v42 = 0;
      id v43 = v17;
      BOOL v27 = [(TPModel *)self considerPolicyFromPeerID:v18 stableInfo:v26 secrets:v40 newestPolicyDoc:&v43 error:&v42];
      id v15 = v43;

      id v28 = v42;
      if (!v27)
      {
        if (v35) {
          id *v35 = v28;
        }

        BOOL v29 = 0;
        id v10 = v34;
        id v12 = v36;
        id v11 = v37;
        goto LABEL_34;
      }

      ++v16;
      uint64_t v17 = v15;
    }
    while (v14 != v16);
    uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_25:
  int v30 = v15;

  id v41 = v15;
  id v12 = v36;
  id v11 = v37;
  BOOL v31 = [(TPModel *)self considerPolicyFromPeerID:v37 stableInfo:v36 secrets:v40 newestPolicyDoc:&v41 error:v35];
  id v15 = v41;

  if (!v31) {
    goto LABEL_32;
  }
  if (!v15)
  {
    if (v35)
    {
      [MEMORY[0x263F087E8] errorWithDomain:TPErrorDomain code:3 userInfo:0];
      id v15 = 0;
      BOOL v29 = 0;
      id *v35 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    id v15 = 0;
LABEL_32:
    BOOL v29 = 0;
    goto LABEL_33;
  }
  uint64_t v32 = [(TPModel *)self decrypter];
  BOOL v29 = [v15 policyWithSecrets:v40 decrypter:v32 error:v35];

LABEL_33:
  id v10 = v34;
LABEL_34:

LABEL_35:
  return v29;
}

- (id)dynamicInfoForJoiningPeerID:(id)a3 peerPermanentInfo:(id)a4 peerStableInfo:(id)a5 sponsorID:(id)a6 preapprovedKeys:(id)a7 signingKeyPair:(id)a8 currentMachineIDs:(id)a9 error:(id *)a10
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v45 = a4;
  id v46 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v47 = a9;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = __Block_byref_object_copy_;
  long long v61 = __Block_byref_object_dispose_;
  id v62 = (id)0xAAAAAAAAAAAAAAAALL;
  long long v48 = v16;
  id v62 = [MEMORY[0x263EFF9C0] setWithObject:v16];
  uint64_t v20 = [MEMORY[0x263EFFA08] set];
  if (!v17) {
    goto LABEL_13;
  }
  id v56 = 0;
  id v21 = [(TPModel *)self peerWithID:v17 error:&v56];
  id v22 = v56;
  if (!v21)
  {
    unint64_t v26 = TPModelLog();
    BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (!v28) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138543618;
      id v64 = v17;
      __int16 v65 = 2114;
      id v66 = v22;
      BOOL v29 = "Error finding peer %{public}@: %{public}@";
    }
    else
    {
      if (!v28) {
        goto LABEL_10;
      }
      *(_DWORD *)buf = 138543618;
      id v64 = v17;
      __int16 v65 = 2114;
      id v66 = 0;
      BOOL v29 = "Peer not in DB %{public}@: %{public}@";
    }
    _os_log_impl(&dword_20CB20000, v26, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    goto LABEL_10;
  }
  BOOL v23 = (void *)v58[5];
  int v24 = [v21 dynamicInfo];
  BOOL v25 = [v24 includedPeerIDs];
  [v23 unionSet:v25];

  unint64_t v26 = [v21 dynamicInfo];
  uint64_t v27 = [v26 excludedPeerIDs];

  uint64_t v20 = (void *)v27;
LABEL_10:

  int v30 = TPModelLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v31 = (void *)v58[5];
    *(_DWORD *)buf = 138543874;
    id v64 = v17;
    __int16 v65 = 2114;
    id v66 = v31;
    __int16 v67 = 2114;
    v68 = v20;
    _os_log_impl(&dword_20CB20000, v30, OS_LOG_TYPE_DEFAULT, "From our sponsor (%{public}@), included: %{public}@ excluded: %{public}@", buf, 0x20u);
  }

LABEL_13:
  if (v18)
  {
    uint64_t v32 = [v19 publicKey];
    id v33 = [v32 spki];

    id v34 = (void *)MEMORY[0x263F08A98];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke;
    v54[3] = &unk_2640EC780;
    id v35 = v33;
    id v55 = v35;
    id v36 = [v34 predicateWithBlock:v54];
    id v37 = [v18 filteredArrayUsingPredicate:v36];

    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke_2;
    v50[3] = &unk_2640EC7A8;
    id v18 = v37;
    id v51 = v18;
    id v52 = v20;
    uint64_t v53 = &v57;
    id v49 = 0;
    [(TPModel *)self enumeratePeersUsingBlock:v50 error:&v49];
    id v38 = v49;
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = TPModelLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v64 = v39;
        _os_log_impl(&dword_20CB20000, v40, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", buf, 0xCu);
      }

      if (a10) {
        *a10 = v39;
      }

      id v41 = 0;
      id v42 = v55;
      goto LABEL_26;
    }
  }
  id v35 = +[TPModel preapprovalsFromKeys:v18];
  id v42 = [(TPModel *)self createDynamicInfoWithIncludedPeerIDs:v58[5] excludedPeerIDs:v20 dispositions:MEMORY[0x263EFFA78] preapprovals:v35 signingKeyPair:v19 error:a10];
  if (v42)
  {
    id v41 = -[TPModel calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:](self, "calculateDynamicInfoFromModel:peer:peerPermanentInfo:peerStableInfo:startingDynamicInfo:addingPeerIDs:removingPeerIDs:preapprovedKeys:signingKeyPair:currentMachineIDs:sponsorPeerID:error:", v48, 0, v45, v46, v42, MEMORY[0x263EFFA68], v18, v19, v47, v17, a10);
  }
  else
  {
    id v43 = TPModelLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v64 = v48;
      _os_log_impl(&dword_20CB20000, v43, OS_LOG_TYPE_DEFAULT, "Unable to create initial dynamic info for peer: %{public}@", buf, 0xCu);
    }

    id v42 = 0;
    id v41 = 0;
  }
LABEL_26:

  _Block_object_dispose(&v57, 8);
  return v41;
}

uint64_t __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)] ^ 1;
}

void __137__TPModel_dynamicInfoForJoiningPeerID_peerPermanentInfo_peerStableInfo_sponsorID_preapprovedKeys_signingKeyPair_currentMachineIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 permanentInfo];
  id v5 = [v4 signingPubKey];
  unint64_t v6 = [v5 spki];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v23;
    *(void *)&long long v9 = 138543362;
    long long v21 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v6, "isEqual:", *(void *)(*((void *)&v22 + 1) + 8 * i), v21, (void)v22))
        {
          uint64_t v13 = *(void **)(a1 + 40);
          uint64_t v14 = [v3 peerID];
          LOBYTE(v13) = [v13 containsObject:v14];

          if (v13)
          {
            id v15 = TPModelLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = [v3 peerID];
              *(_DWORD *)buf = v21;
              uint64_t v27 = v16;
              id v17 = v15;
              id v18 = "Not including %{public}@ even through they are preapproved";
              goto LABEL_12;
            }
          }
          else
          {
            id v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            uint64_t v20 = [v3 peerID];
            [v19 addObject:v20];

            id v15 = TPModelLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = [v3 peerID];
              *(_DWORD *)buf = v21;
              uint64_t v27 = v16;
              id v17 = v15;
              id v18 = "Trusting %{public}@ due to preapproval";
LABEL_12:
              _os_log_impl(&dword_20CB20000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
            }
          }

          continue;
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v10);
  }
}

- (id)filterPreapprovals:(id)a3 forExistingPeers:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v6 allObjects];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        int64_t v14 = +[TPHashBuilder algoOfHash:v13];
        if (v14 != -1)
        {
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __47__TPModel_filterPreapprovals_forExistingPeers___block_invoke;
          v20[3] = &unk_2640EC758;
          int64_t v23 = v14;
          v20[4] = v13;
          id v21 = v7;
          id v22 = v6;
          id v19 = 0;
          [(TPModel *)self enumeratePeersUsingBlock:v20 error:&v19];
          id v15 = v19;
          id v16 = v22;
          if (v15)
          {
            id v17 = v15;

            goto LABEL_13;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

void __47__TPModel_filterPreapprovals_forExistingPeers___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v11 = [v5 peerID];
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = [v5 permanentInfo];

  uint64_t v8 = [v7 signingPubKey];
  uint64_t v9 = [v8 spki];
  uint64_t v10 = +[TPHashBuilder hashWithAlgo:v6 ofData:v9];

  if ([*(id *)(a1 + 32) isEqualToString:v10]
    && [*(id *)(a1 + 40) containsObject:v11])
  {
    [*(id *)(a1 + 48) removeObject:*(void *)(a1 + 32)];
    *a3 = 1;
  }
}

- (id)peersWithMachineID:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy_;
    id v17 = __Block_byref_object_dispose_;
    id v18 = (id)0xAAAAAAAAAAAAAAAALL;
    id v18 = [MEMORY[0x263EFF9C0] set];
    *a4 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__TPModel_peersWithMachineID_error___block_invoke;
    v11[3] = &unk_2640EC730;
    id v12 = v6;
    p_long long buf = &buf;
    [(TPModel *)self enumeratePeersUsingBlock:v11 error:a4];
    if (*a4) {
      id v7 = 0;
    }
    else {
      id v7 = *(void **)(*((void *)&buf + 1) + 40);
    }
    id v9 = v7;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v8 = TPModelLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl(&dword_20CB20000, v8, OS_LOG_TYPE_ERROR, "Unexpected nil error in peersWithMachineID:%{public}@", (uint8_t *)&buf, 0xCu);
    }

    id v9 = 0;
  }

  return v9;
}

void __36__TPModel_peersWithMachineID_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 permanentInfo];
  uint64_t v4 = [v3 machineID];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = [v8 peerID];
    [v6 addObject:v7];
  }
}

- (id)filterPeerList:(id)a3 byMachineIDs:(id)a4 sponsorPeerID:(id)a5 dispositions:(id)a6
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v64 = a6;
  id v60 = v11;
  if (v11)
  {
    [MEMORY[0x263EFF9C0] set];
    id v56 = v10;
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (!v13) {
      goto LABEL_42;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v67;
    uint64_t v62 = *(void *)v67;
    v58 = self;
    id v59 = v12;
    while (1)
    {
      uint64_t v16 = 0;
      uint64_t v61 = v14;
      do
      {
        if (*(void *)v67 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v66 + 1) + 8 * v16);
        id v18 = (void *)MEMORY[0x210554CF0]();
        id v65 = 0;
        uint64_t v19 = [(TPModel *)self peerWithID:v17 error:&v65];
        id v20 = v65;
        id v21 = v20;
        if (v19)
        {
          if ([v17 isEqualToString:v12]) {
            goto LABEL_40;
          }
          id v22 = [v19 permanentInfo];
          int64_t v23 = [v22 machineID];
          long long v24 = [v60 entryFor:v23];

          if (v24) {
            uint64_t v25 = [v24 status];
          }
          else {
            uint64_t v25 = 0;
          }
          long long v26 = objc_msgSend(v19, "peerID", v56);
          long long v27 = [v64 objectForKeyedSubscript:v26];
          BOOL v28 = v27;
          if (v27) {
            uint64_t v29 = v27;
          }
          else {
            uint64_t v29 = objc_alloc_init(TPPBDisposition);
          }
          int v30 = v29;

          uint64_t v15 = v62;
          switch(v25)
          {
            case 0:
              BOOL v31 = [(TPPBDisposition *)v30 disallowedMachineID];

              if (v31)
              {
                uint64_t v32 = TPModelLog();
                if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_37;
                }
                id v33 = [v19 permanentInfo];
                id v34 = [v33 machineID];
                *(_DWORD *)long long buf = 138543618;
                v71 = v17;
                __int16 v72 = 2114;
                v73 = v34;
                id v35 = v32;
                id v36 = "Peer (%{public}@) has an unknown machine ID (%{public}@), but leaving disposition as 'disallowed'";
              }
              else
              {
                uint64_t v53 = objc_alloc_init(TPPBUnknownMachineID);
                [(TPPBDisposition *)v30 setUnknownMachineID:v53];

                uint64_t v54 = [v19 peerID];
                [v64 setObject:v30 forKeyedSubscript:v54];

                uint64_t v32 = TPModelLog();
                if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_37;
                }
                id v33 = [v19 permanentInfo];
                id v34 = [v33 machineID];
                *(_DWORD *)long long buf = 138543618;
                v71 = v17;
                __int16 v72 = 2114;
                v73 = v34;
                id v35 = v32;
                id v36 = "Peer (%{public}@) has an unknown machine ID (%{public}@)";
              }
              goto LABEL_36;
            case 1:
              id v37 = [v19 peerID];
              id v38 = v64;
              uint64_t v39 = 0;
              goto LABEL_33;
            case 2:
              uint64_t v40 = objc_alloc_init(TPPBDispositionDisallowedMachineID);
              [(TPPBDisposition *)v30 setDisallowedMachineID:v40];

              id v41 = [v19 peerID];
              [v64 setObject:v30 forKeyedSubscript:v41];

              id v42 = TPModelLog();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                id v43 = [v19 permanentInfo];
                id v44 = [v43 machineID];
                *(_DWORD *)long long buf = 138543618;
                v71 = v17;
                __int16 v72 = 2114;
                v73 = v44;
                _os_log_impl(&dword_20CB20000, v42, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) has a disallowed machine ID (%{public}@)", buf, 0x16u);

                uint64_t v15 = v62;
              }

              [v57 addObject:v17];
              break;
            case 3:
              [(TPPBDisposition *)v30 setUnknownMachineID:0];
              [(TPPBDisposition *)v30 setDisallowedMachineID:0];
              [(TPPBDisposition *)v30 setUnknownReasonRemovalMachineID:0];
              id v45 = objc_alloc_init(TPPBDispositionEvictedMachineID);
              [(TPPBDisposition *)v30 setEvictedMachineID:v45];

              id v46 = [v19 peerID];
              [v64 setObject:v30 forKeyedSubscript:v46];

              uint64_t v32 = TPModelLog();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_37;
              }
              id v33 = [v19 permanentInfo];
              id v34 = [v33 machineID];
              *(_DWORD *)long long buf = 138543618;
              v71 = v17;
              __int16 v72 = 2114;
              v73 = v34;
              id v35 = v32;
              id v36 = "Peer (%{public}@) has an evicted machine ID (%{public}@)";
              goto LABEL_36;
            case 4:
              [(TPPBDisposition *)v30 setUnknownMachineID:0];
              [(TPPBDisposition *)v30 setDisallowedMachineID:0];
              [(TPPBDisposition *)v30 setEvictedMachineID:0];
              id v47 = objc_alloc_init(TPPBDispositionUnknownReasonRemovalMachineID);
              [(TPPBDisposition *)v30 setUnknownReasonRemovalMachineID:v47];

              long long v48 = [v19 peerID];
              [v64 setObject:v30 forKeyedSubscript:v48];

              uint64_t v32 = TPModelLog();
              if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_37;
              }
              id v33 = [v19 permanentInfo];
              id v34 = [v33 machineID];
              *(_DWORD *)long long buf = 138543618;
              v71 = v17;
              __int16 v72 = 2114;
              v73 = v34;
              id v35 = v32;
              id v36 = "Peer (%{public}@) with machine ID (%{public}@) has been removed with an unknown reason";
LABEL_36:
              _os_log_impl(&dword_20CB20000, v35, OS_LOG_TYPE_DEFAULT, v36, buf, 0x16u);

              uint64_t v15 = v62;
LABEL_37:

              break;
            case 5:
              id v49 = TPModelLog();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v50 = [v19 permanentInfo];
                id v51 = [v50 machineID];
                *(_DWORD *)long long buf = 138543618;
                v71 = v17;
                __int16 v72 = 2114;
                v73 = v51;
                _os_log_impl(&dword_20CB20000, v49, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) with machine ID (%{public}@) has ghosted the TDL", buf, 0x16u);

                uint64_t v15 = v62;
              }

              id v52 = objc_alloc_init(TPPBDispositionGhostedMachineID);
              [(TPPBDisposition *)v30 setGhostedMachineID:v52];

              id v37 = [v19 peerID];
              id v38 = v64;
              uint64_t v39 = v30;
LABEL_33:
              [v38 setObject:v39 forKeyedSubscript:v37];

              break;
            default:
              break;
          }

          self = v58;
          id v12 = v59;
          uint64_t v14 = v61;
        }
        else
        {
          if (!v20) {
            goto LABEL_40;
          }
          long long v24 = TPModelLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543618;
            v71 = v17;
            __int16 v72 = 2114;
            v73 = v21;
            _os_log_impl(&dword_20CB20000, v24, OS_LOG_TYPE_DEFAULT, "Error finding peer %{public}@: %{public}@", buf, 0x16u);
          }
        }

LABEL_40:
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (!v14)
      {
LABEL_42:

        id v10 = v56;
        goto LABEL_44;
      }
    }
  }
  id v57 = [MEMORY[0x263EFFA08] set];
LABEL_44:

  return v57;
}

- (id)calculateDynamicInfoFromModel:(id)a3 peer:(id)a4 peerPermanentInfo:(id)a5 peerStableInfo:(id)a6 startingDynamicInfo:(id)a7 addingPeerIDs:(id)a8 removingPeerIDs:(id)a9 preapprovedKeys:(id)a10 signingKeyPair:(id)a11 currentMachineIDs:(id)a12 sponsorPeerID:(id)a13 error:(id *)a14
{
  uint64_t v291 = *MEMORY[0x263EF8340];
  id v212 = a3;
  id v205 = a4;
  id v20 = a5;
  id v206 = a6;
  id v213 = a7;
  id v210 = a8;
  id v211 = a9;
  id v204 = a10;
  id v201 = a11;
  id v217 = a12;
  v202 = v20;
  id v203 = a13;
  uint64_t v214 = [v20 epoch];
  id v21 = (void *)MEMORY[0x263EFFA08];
  v219 = self;
  id v22 = [(TPModel *)self allPeerIDs];
  v207 = [v21 setWithArray:v22];

  int64_t v23 = TPModelLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v212;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v207;
    _os_log_impl(&dword_20CB20000, v23, OS_LOG_TYPE_DEFAULT, "Calculating dynamic info for peer %{public}@ with peer set %{public}@", buf, 0x16u);
  }

  if ([v210 count])
  {
    long long v24 = TPModelLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v210;
      _os_log_impl(&dword_20CB20000, v24, OS_LOG_TYPE_DEFAULT, "Adding peer IDs: %{public}@", buf, 0xCu);
    }
  }
  if ([v211 count])
  {
    uint64_t v25 = TPModelLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v211;
      _os_log_impl(&dword_20CB20000, v25, OS_LOG_TYPE_DEFAULT, "Removing peer IDs: %{public}@", buf, 0xCu);
    }
  }
  long long v26 = [v213 excludedPeerIDs];
  int v27 = [v26 containsObject:v212];

  if (v27)
  {
    BOOL v28 = TPModelLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v212;
      _os_log_impl(&dword_20CB20000, v28, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) excludes itself", buf, 0xCu);
    }

    id v29 = v213;
    goto LABEL_271;
  }
  int v30 = (void *)MEMORY[0x263EFF9C0];
  BOOL v31 = [v213 includedPeerIDs];
  v218 = [v30 setWithSet:v31];

  uint64_t v32 = (void *)MEMORY[0x263EFF9C0];
  id v33 = [v213 excludedPeerIDs];
  v216 = [v32 setWithSet:v33];

  id v34 = TPModelLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v218;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v216;
    _os_log_impl(&dword_20CB20000, v34, OS_LOG_TYPE_DEFAULT, "Initial sets: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  id v35 = (void *)MEMORY[0x263EFF9A0];
  id v36 = [v213 dispositions];
  v224 = [v35 dictionaryWithDictionary:v36];

  [v218 addObject:v212];
  v199 = [[TPRecoveryKeyPair alloc] initWithStableInfo:v206];
  id v37 = [(TPRecoveryKeyPair *)v199 signingKeyData];
  id v38 = +[TPHashBuilder hashWithAlgo:2 ofData:v37];

  v198 = [v38 stringByReplacingOccurrencesOfString:@"SHA384:" withString:&stru_26C1BBA10];

  v197 = [NSString stringWithFormat:@"RK-%@", v198];
  v221 = [MEMORY[0x263EFF9C0] setWithSet:v207];
  [v221 addObject:v197];
  uint64_t v39 = [(TPModel *)self allCustodianRecoveryKeyPeerIDs];
  [v221 addObjectsFromArray:v39];

  long long v274 = 0u;
  long long v275 = 0u;
  long long v272 = 0u;
  long long v273 = 0u;
  id obj = v211;
  uint64_t v40 = [obj countByEnumeratingWithState:&v272 objects:v290 count:16];
  if (v40)
  {
    uint64_t v41 = *(void *)v273;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v273 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = *(void *)(*((void *)&v272 + 1) + 8 * i);
        if (([v221 containsObject:v43] & 1) == 0)
        {
          id v59 = TPModelLog();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v43;
            _os_log_impl(&dword_20CB20000, v59, OS_LOG_TYPE_DEFAULT, "No peer for given peer id: %{public}@", buf, 0xCu);
          }

          failWithNoPeerWithIDError(a14);
          id v29 = 0;
          goto LABEL_270;
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v272 objects:v290 count:16];
    }
    while (v40);
  }

  [v218 addObjectsFromArray:v210];
  [v216 addObjectsFromArray:obj];
  [v218 minusSet:v216];
  id v44 = TPModelLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v218;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v216;
    _os_log_impl(&dword_20CB20000, v44, OS_LOG_TYPE_DEFAULT, "After removals: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  id v45 = TPModelLog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v217;
    _os_log_impl(&dword_20CB20000, v45, OS_LOG_TYPE_DEFAULT, "Beginning sponsor checking; machine ID list: %{public}@",
      buf,
      0xCu);
  }

  long long v270 = 0u;
  long long v271 = 0u;
  long long v268 = 0u;
  long long v269 = 0u;
  id obj = (id)[v218 copy];
  uint64_t v46 = [obj countByEnumeratingWithState:&v268 objects:v289 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v269;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v269 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void *)(*((void *)&v268 + 1) + 8 * j);
        uint64_t v50 = (void *)MEMORY[0x210554CF0]();
        id v51 = [(TPModel *)v219 recursivelyExpandIncludedPeerIDs:v218 andExcludedPeerIDs:v216 dispositions:v224 withPeersTrustedBySponsorID:v49 currentMachineIDs:v217 forEpoch:v214];
        if (v51)
        {

          id v60 = TPModelLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v51;
            _os_log_impl(&dword_20CB20000, v60, OS_LOG_TYPE_DEFAULT, "Error sponsor checking: %{public}@", buf, 0xCu);
          }

          if (a14)
          {
            id v61 = v51;
            id v29 = 0;
            *a14 = v61;
          }
          else
          {
            id v29 = 0;
            id v61 = v51;
          }
          goto LABEL_269;
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v268 objects:v289 count:16];
    }
    while (v46);
  }

  id v52 = TPModelLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v218;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v216;
    _os_log_impl(&dword_20CB20000, v52, OS_LOG_TYPE_DEFAULT, "After sponsor checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  if (v205)
  {
    uint64_t v53 = [v205 peerID];
    uint64_t v54 = [v205 permanentInfo];
    [(TPModel *)v219 considerVouchersSponsoredByPeerID:v53 sponsorPermanentInfo:v54 toRecursivelyExpandIncludedPeerIDs:v218 andExcludedPeerIDs:v216 dispositions:v224 currentMachineIDs:v217 forEpoch:v214];
  }
  id v55 = TPModelLog();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v218;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v216;
    _os_log_impl(&dword_20CB20000, v55, OS_LOG_TYPE_DEFAULT, "After voucher checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  if (v204)
  {
    id v56 = TPModelLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v204;
      _os_log_impl(&dword_20CB20000, v56, OS_LOG_TYPE_DEFAULT, "Preapproved keys: %{public}@", buf, 0xCu);
    }

    v196 = +[TPModel preapprovalsFromKeys:v204];
    id v57 = TPModelLog();
    if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_59;
    }
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v196;
    v58 = "New preapproval list: %{public}@";
    goto LABEL_58;
  }
  uint64_t v62 = (void *)MEMORY[0x263EFF9C0];
  long long v63 = [v213 preapprovals];
  v196 = [v62 setWithSet:v63];

  id v57 = TPModelLog();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v196;
    v58 = "Using existing preapproval list: %{public}@";
LABEL_58:
    _os_log_impl(&dword_20CB20000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 0xCu);
  }
LABEL_59:

  v195 = [v218 setByAddingObjectsFromSet:v216];
  id v200 = [(TPModel *)v219 filterPreapprovals:v196 forExistingPeers:v195];
  id v64 = TPModelLog();
  BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
  if (v200)
  {
    if (v65)
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v200;
      _os_log_impl(&dword_20CB20000, v64, OS_LOG_TYPE_DEFAULT, "Error filtering preapprovals: %{public}@", buf, 0xCu);
    }

    if (a14)
    {
      id v200 = v200;
      id v29 = 0;
      *a14 = v200;
      goto LABEL_268;
    }
    goto LABEL_90;
  }
  if (v65)
  {
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v196;
    _os_log_impl(&dword_20CB20000, v64, OS_LOG_TYPE_DEFAULT, "Final preapproval list: %{public}@", buf, 0xCu);
  }

  long long v266 = 0u;
  long long v267 = 0u;
  long long v264 = 0u;
  long long v265 = 0u;
  id v208 = [v196 allObjects];
  id v66 = (id)[v208 countByEnumeratingWithState:&v264 objects:v288 count:16];
  if (!v66)
  {
    id v200 = 0;
    goto LABEL_92;
  }
  id v200 = 0;
  uint64_t v67 = *(void *)v265;
  do
  {
    for (k = 0; k != v66; k = (char *)k + 1)
    {
      if (*(void *)v265 != v67) {
        objc_enumerationMutation(v208);
      }
      uint64_t v69 = *(void *)(*((void *)&v264 + 1) + 8 * (void)k);
      int64_t v70 = +[TPHashBuilder algoOfHash:v69];
      if (v70 == -1) {
        continue;
      }

      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v286 = __Block_byref_object_copy_;
      *(void *)&long long v287 = __Block_byref_object_dispose_;
      *((void *)&v287 + 1) = 0;
      v255[0] = MEMORY[0x263EF8330];
      v255[1] = 3221225472;
      v255[2] = __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke;
      v255[3] = &unk_2640EC6E0;
      v255[4] = v69;
      v255[5] = v219;
      int64_t v262 = v70;
      uint64_t v263 = v214;
      id v256 = v218;
      v261 = buf;
      id v257 = v216;
      id v258 = v224;
      id v259 = v217;
      id v260 = v196;
      id v254 = 0;
      [(TPModel *)v219 enumeratePeersUsingBlock:v255 error:&v254];
      id v71 = v254;
      id v200 = v71;
      if (v71)
      {
        id v72 = v71;
        v73 = TPModelLog();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v283 = 138543362;
          id v284 = v72;
          _os_log_impl(&dword_20CB20000, v73, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", v283, 0xCu);
        }

        if (a14)
        {
          id v74 = v200;
LABEL_82:
          int v77 = 0;
          *a14 = v74;
          goto LABEL_85;
        }
LABEL_83:
        int v77 = 0;
        goto LABEL_85;
      }
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        uint64_t v75 = TPModelLog();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          v76 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)v283 = 138543362;
          id v284 = v76;
          _os_log_impl(&dword_20CB20000, v75, OS_LOG_TYPE_DEFAULT, "Error recursively expanding peers: %{public}@", v283, 0xCu);
        }

        if (a14)
        {
          id v74 = 0;
          goto LABEL_82;
        }
        goto LABEL_83;
      }
      int v77 = 1;
LABEL_85:

      _Block_object_dispose(buf, 8);
      if (!v77)
      {

LABEL_90:
        id v29 = 0;
        goto LABEL_268;
      }
    }
    id v66 = (id)[v208 countByEnumeratingWithState:&v264 objects:v288 count:16];
  }
  while (v66);
LABEL_92:

  [v218 minusSet:v216];
  v78 = TPModelLog();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v218;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v216;
    _os_log_impl(&dword_20CB20000, v78, OS_LOG_TYPE_DEFAULT, "After preapproval checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  v79 = [v205 permanentInfo];
  v192 = [v79 modelID];

  if (([v192 containsString:@"AppleTV"] & 1) != 0
    || [v192 containsString:@"AudioAccessory"])
  {
    v80 = TPModelLog();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_20CB20000, v80, OS_LOG_TYPE_DEFAULT, "Ignoring TDL Disallowed Machine IDs", buf, 2u);
    }

    v81 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    v81 = [(TPModel *)v219 filterPeerList:v218 byMachineIDs:v217 sponsorPeerID:v203 dispositions:v224];
  }
  id v191 = v81;

  v190 = [(TPModel *)v219 filterPeerList:v216 byMachineIDs:v217 sponsorPeerID:v203 dispositions:v224];
  if ([v218 count] != 1 || (objc_msgSend(v218, "containsObject:", v212) & 1) == 0)
  {
    [v218 minusSet:v191];
    [v216 unionSet:v191];
    [v216 unionSet:v190];
  }
  if (v203)
  {
    v82 = TPModelLog();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_20CB20000, v82, OS_LOG_TYPE_DEFAULT, "Joining using a sponsor! Opting not to kick out past selves yet.", buf, 2u);
    }
    goto LABEL_106;
  }
  v101 = [v202 machineID];
  BOOL v102 = [v101 length] == 0;

  if (v102)
  {
    v82 = TPModelLog();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_20CB20000, v82, OS_LOG_TYPE_DEFAULT, "No local machine ID; not filtering peers", buf, 2u);
    }
LABEL_106:
  }
  else
  {
    contexta = (void *)MEMORY[0x210554CF0]();
    v103 = [v202 machineID];
    id v253 = 0;
    id v66 = [(TPModel *)v219 peersWithMachineID:v103 error:&v253];
    id v193 = v253;

    if (v193)
    {

      id v29 = 0;
      if (a14) {
        *a14 = v193;
      }
      goto LABEL_267;
    }
    v169 = (void *)[v66 mutableCopy];
    [v169 removeObject:v212];
    v170 = TPModelLog();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v169;
      _os_log_impl(&dword_20CB20000, v170, OS_LOG_TYPE_DEFAULT, "Remote peers with the ego machine ID: %{public}@", buf, 0xCu);
    }

    [v218 minusSet:v169];
    [v216 unionSet:v169];
    long long v251 = 0u;
    long long v252 = 0u;
    long long v249 = 0u;
    long long v250 = 0u;
    id v171 = v169;
    uint64_t v172 = [v171 countByEnumeratingWithState:&v249 objects:v282 count:16];
    if (v172)
    {
      uint64_t v173 = *(void *)v250;
      do
      {
        for (uint64_t m = 0; m != v172; ++m)
        {
          if (*(void *)v250 != v173) {
            objc_enumerationMutation(v171);
          }
          uint64_t v175 = *(void *)(*((void *)&v249 + 1) + 8 * m);
          v176 = [v224 objectForKeyedSubscript:v175];
          v177 = v176;
          if (v176)
          {
            v178 = v176;
          }
          else
          {
            v178 = objc_alloc_init(TPPBDisposition);
          }
          v179 = objc_alloc_init(TPPBDispositionDuplicateMachineID);
          [(TPPBDisposition *)v178 setDuplicateMachineID:v179];

          [v224 setObject:v178 forKeyedSubscript:v175];
        }
        uint64_t v172 = [v171 countByEnumeratingWithState:&v249 objects:v282 count:16];
      }
      while (v172);
    }
  }
  v83 = TPModelLog();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = v218;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v216;
    _os_log_impl(&dword_20CB20000, v83, OS_LOG_TYPE_DEFAULT, "After machine ID checking: included:%{public}@ excluded:%{public}@", buf, 0x16u);
  }

  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  id v209 = v218;
  uint64_t v84 = [v209 countByEnumeratingWithState:&v245 objects:v281 count:16];
  if (v84)
  {
    id v66 = *(id *)v246;
    do
    {
      uint64_t v85 = 0;
      do
      {
        if (*(id *)v246 != v66) {
          objc_enumerationMutation(v209);
        }
        uint64_t v86 = *(void *)(*((void *)&v245 + 1) + 8 * v85);
        v87 = [v224 objectForKeyedSubscript:v86];
        v88 = v87;
        if (v87)
        {
          if ([v87 hasUnknownMachineID])
          {
            v89 = objc_alloc_init(TPPBDisposition);

            v90 = [v88 unknownMachineID];
            [(TPPBDisposition *)v89 setUnknownMachineID:v90];

            if ([v88 hasEvictedMachineID])
            {
              if (v89)
              {
                v91 = v89;
                goto LABEL_121;
              }
LABEL_120:
              v91 = objc_alloc_init(TPPBDisposition);
LABEL_121:
              v89 = v91;

              v92 = [v88 evictedMachineID];
              [(TPPBDisposition *)v89 setEvictedMachineID:v92];
            }
            if ([v88 hasUnknownReasonRemovalMachineID])
            {
              if (v89)
              {
                v93 = v89;
                goto LABEL_127;
              }
LABEL_126:
              v93 = objc_alloc_init(TPPBDisposition);
LABEL_127:
              v89 = v93;

              v94 = [v88 unknownReasonRemovalMachineID];
              [(TPPBDisposition *)v89 setUnknownReasonRemovalMachineID:v94];
            }
            if ([v88 hasGhostedMachineID])
            {
              if (v89)
              {
                v95 = v89;
                goto LABEL_133;
              }
LABEL_132:
              v95 = objc_alloc_init(TPPBDisposition);
LABEL_133:
              v89 = v95;

              v96 = [v88 ghostedMachineID];
              [(TPPBDisposition *)v89 setGhostedMachineID:v96];
            }
          }
          else
          {
            if ([v88 hasEvictedMachineID]) {
              goto LABEL_120;
            }
            if ([v88 hasUnknownReasonRemovalMachineID]) {
              goto LABEL_126;
            }
            if ([v88 hasGhostedMachineID]) {
              goto LABEL_132;
            }
            v89 = 0;
          }
          [v224 setObject:v89 forKeyedSubscript:v86];
        }
        ++v85;
      }
      while (v84 != v85);
      uint64_t v97 = [v209 countByEnumeratingWithState:&v245 objects:v281 count:16];
      uint64_t v84 = v97;
    }
    while (v97);
  }

  id v244 = 0;
  context = [(TPModel *)v219 policyForPeerIDs:v209 candidatePeerID:v212 candidateStableInfo:v206 error:&v244];
  id v98 = v244;
  if (v98)
  {
    v99 = TPModelLog();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v98;
      _os_log_impl(&dword_20CB20000, v99, OS_LOG_TYPE_DEFAULT, "ignoring error getting policy for peerIDs %{public}@", buf, 0xCu);
    }
  }
  if (context && ([context unknownRedactions] & 1) == 0)
  {
    if (v206)
    {
      v104 = [context version];
      uint64_t v105 = [v104 versionNumber];
      id v66 = [v206 flexiblePolicyVersion];
      int v100 = v105 == [v66 versionNumber];
    }
    else
    {
      int v100 = 1;
    }
  }
  else
  {
    int v100 = 0;
  }

  long long v242 = 0u;
  long long v243 = 0u;
  long long v240 = 0u;
  long long v241 = 0u;
  id v239 = 0;
  v106 = [(TPModel *)v219 allPolicyVersionsWithError:&v239];
  id v193 = v239;
  uint64_t v107 = [v106 countByEnumeratingWithState:&v240 objects:v280 count:16];
  if (v107)
  {
    uint64_t v108 = *(void *)v241;
    do
    {
      for (uint64_t n = 0; n != v107; ++n)
      {
        if (*(void *)v241 != v108) {
          objc_enumerationMutation(v106);
        }
        v110 = *(void **)(*((void *)&v240 + 1) + 8 * n);
        unint64_t v111 = [v110 versionNumber];
        v112 = [context version];
        BOOL v113 = v111 <= [v112 versionNumber];

        uint64_t v114 = [v110 versionNumber];
        id v66 = [context version];
        v100 &= v113;
        if (v114 == [v66 versionNumber])
        {
          v115 = [v110 policyHash];
          v116 = [context version];
          uint64_t v117 = [v116 policyHash];
          v118 = (void *)v117;
          if (v117) {
            v119 = (__CFString *)v117;
          }
          else {
            v119 = &stru_26C1BBA10;
          }
          int v120 = [v115 isEqualToString:v119];

          v100 &= v120;
        }
        else
        {
        }
      }
      uint64_t v107 = [v106 countByEnumeratingWithState:&v240 objects:v280 count:16];
    }
    while (v107);
  }

  if (v193)
  {
    id v29 = 0;
    if (a14) {
      *a14 = v193;
    }
    goto LABEL_266;
  }
  if (v100)
  {
    v121 = [MEMORY[0x263EFF9C0] setWithSet:v207];
    [v121 minusSet:v209];
    [v121 minusSet:v216];
    v122 = TPModelLog();
    if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v121;
      _os_log_impl(&dword_20CB20000, v122, OS_LOG_TYPE_DEFAULT, "Unknown peers, distrusting by default: %{public}@", buf, 0xCu);
    }

    [v216 unionSet:v121];
  }
  else
  {
    v121 = TPModelLog();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      v123 = [v206 bestPolicyVersion];
      uint64_t v124 = [v123 versionNumber];
      *(_DWORD *)long long buf = 138544130;
      *(void *)&uint8_t buf[4] = v212;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v124;
      *(_WORD *)&buf[22] = 2114;
      v286 = (uint64_t (*)(uint64_t, uint64_t))context;
      LOWORD(v287) = 2114;
      *(void *)((char *)&v287 + 2) = 0;
      _os_log_impl(&dword_20CB20000, v121, OS_LOG_TYPE_DEFAULT, "Peer (%{public}@) is using an unknown policy version (%llu, %{public}@), not distrusting unknown peers (error: %{public}@)", buf, 0x2Au);
    }
  }

  if ([v216 containsObject:v212])
  {
    v125 = TPModelLog();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_20CB20000, v125, OS_LOG_TYPE_DEFAULT, "Peer distrusts self", buf, 2u);
    }

    id v238 = 0;
    v126 = [(TPModel *)v219 untrustedPeerIDsWithError:&v238];
    id v127 = v238;
    v128 = v127;
    if (v127)
    {
      id v29 = 0;
      if (a14) {
        *a14 = v127;
      }
      goto LABEL_265;
    }
    v180 = [v126 setByAddingObjectsFromSet:v216];
    if ([v207 isSubsetOfSet:v180])
    {
      v181 = TPModelLog();
      if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_20CB20000, v181, OS_LOG_TYPE_DEFAULT, "Update would result in zero trusted peers; failing",
          buf,
          2u);
      }

      if (a14)
      {
        v182 = (void *)MEMORY[0x263F087E8];
        uint64_t v183 = TPErrorDomain;
        uint64_t v278 = *MEMORY[0x263F08320];
        v279 = @"Update would result in no trusted peers";
        v184 = [NSDictionary dictionaryWithObjects:&v279 forKeys:&v278 count:1];
        [v182 errorWithDomain:v183 code:11 userInfo:v184];
        id v29 = 0;
        *a14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_263;
      }
      id v29 = 0;
    }
    else
    {
      v184 = [MEMORY[0x263EFFA08] setWithArray:v210];
      v185 = [MEMORY[0x263EFFA08] setWithObject:v212];
      id v29 = [(TPModel *)v219 createDynamicInfoWithIncludedPeerIDs:v184 excludedPeerIDs:v185 dispositions:v224 preapprovals:v196 signingKeyPair:v201 error:a14];

LABEL_263:
    }

LABEL_265:
    goto LABEL_266;
  }
  v237[0] = MEMORY[0x263EF8330];
  v237[1] = 3221225472;
  v237[2] = __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke_104;
  v237[3] = &unk_2640EC708;
  v237[4] = v219;
  v237[5] = v214;
  v129 = [v216 objectsPassingTest:v237];
  v194 = (void *)[v129 mutableCopy];

  long long v235 = 0u;
  long long v236 = 0u;
  long long v233 = 0u;
  long long v234 = 0u;
  id v130 = v216;
  uint64_t v131 = [v130 countByEnumeratingWithState:&v233 objects:v277 count:16];
  if (!v131) {
    goto LABEL_210;
  }
  uint64_t v215 = *(void *)v234;
  while (2)
  {
    uint64_t v132 = 0;
    while (2)
    {
      if (*(void *)v234 != v215) {
        objc_enumerationMutation(v130);
      }
      uint64_t v133 = *(void *)(*((void *)&v233 + 1) + 8 * v132);
      v134 = (void *)MEMORY[0x210554CF0]();
      id v232 = 0;
      v135 = [(TPModel *)v219 peerWithID:v133 error:&v232];
      id v136 = v232;
      if (v136)
      {
        id v66 = v136;
        v137 = TPModelLog();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          *(void *)&uint8_t buf[4] = v133;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v66;
          v138 = v137;
          v139 = "Error finding excluded peer %{public}@: %{public}@";
          uint32_t v140 = 22;
          goto LABEL_193;
        }
        goto LABEL_194;
      }
      id v66 = [v135 stableInfo];
      v141 = [v66 recoverySigningPublicKey];
      BOOL v142 = v141 == 0;

      if (!v142)
      {
        v143 = [v135 stableInfo];
        v144 = [v143 recoverySigningPublicKey];
        id v231 = 0;
        BOOL v145 = [(TPModel *)v219 isRecoveryKeyExcluded:v144 error:&v231];
        id v66 = v231;

        if (v66)
        {
          v137 = TPModelLog();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v66;
            v138 = v137;
            v139 = "Error determining whether recovery key is excluded: %{public}@";
            uint32_t v140 = 12;
LABEL_193:
            _os_log_impl(&dword_20CB20000, v138, OS_LOG_TYPE_DEFAULT, v139, buf, v140);
          }
          goto LABEL_194;
        }
        if (!v145)
        {
          id v230 = 0;
          v137 = [(TPModel *)v219 allTrustedPeersWithCurrentRecoveryKeyWithError:&v230];
          id v66 = v230;
          if (v66)
          {
            v146 = TPModelLog();
            if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138543362;
              *(void *)&uint8_t buf[4] = v66;
              _os_log_impl(&dword_20CB20000, v146, OS_LOG_TYPE_DEFAULT, "Error finding peers with current recovery key: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            if ([v137 count])
            {
              id v66 = 0;
              goto LABEL_194;
            }
            v147 = [v135 stableInfo];
            v148 = [v147 recoverySigningPublicKey];
            v146 = [(TPModel *)v219 recoveryKeyPeerID:v148];

            [v194 addObject:v146];
          }

LABEL_194:
        }
      }

      if (v131 != ++v132) {
        continue;
      }
      break;
    }
    uint64_t v149 = [v130 countByEnumeratingWithState:&v233 objects:v277 count:16];
    uint64_t v131 = v149;
    if (v149) {
      continue;
    }
    break;
  }
LABEL_210:

  long long v228 = 0u;
  long long v229 = 0u;
  long long v226 = 0u;
  long long v227 = 0u;
  id v150 = v130;
  uint64_t v151 = [v150 countByEnumeratingWithState:&v226 objects:v276 count:16];
  if (!v151) {
    goto LABEL_229;
  }
  uint64_t v152 = *(void *)v227;
  while (2)
  {
    uint64_t v153 = 0;
    while (2)
    {
      if (*(void *)v227 != v152) {
        objc_enumerationMutation(v150);
      }
      v154 = *(void **)(*((void *)&v226 + 1) + 8 * v153);
      if (([v154 containsString:@"RK-"] & 1) != 0
        || ([(TPModel *)v219 allCustodianRecoveryKeyPeerIDs],
            v155 = objc_claimAutoreleasedReturnValue(),
            char v156 = [v155 containsObject:v154],
            v155,
            (v156 & 1) != 0))
      {
        id v66 = 0;
        goto LABEL_218;
      }
      id v225 = 0;
      v157 = [(TPModel *)v219 peerWithID:v154 error:&v225];
      id v66 = v225;

      if (!v157)
      {
        v158 = TPModelLog();
        BOOL v159 = os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT);
        if (v66)
        {
          if (v159)
          {
            *(_DWORD *)long long buf = 138543618;
            *(void *)&uint8_t buf[4] = v154;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v66;
            v160 = v158;
            v161 = "Error finding peer %{public}@ in model, removing: %{public}@";
            uint32_t v162 = 22;
            goto LABEL_226;
          }
        }
        else if (v159)
        {
          *(_DWORD *)long long buf = 138543362;
          *(void *)&uint8_t buf[4] = v154;
          v160 = v158;
          v161 = "Peer %{public}@ not registered in the model, removing";
          uint32_t v162 = 12;
LABEL_226:
          _os_log_impl(&dword_20CB20000, v160, OS_LOG_TYPE_DEFAULT, v161, buf, v162);
        }

        [v194 removeObject:v154];
      }
LABEL_218:

      if (v151 != ++v153) {
        continue;
      }
      break;
    }
    uint64_t v163 = [v150 countByEnumeratingWithState:&v226 objects:v276 count:16];
    uint64_t v151 = v163;
    if (v163) {
      continue;
    }
    break;
  }
LABEL_229:

  v164 = [v213 includedPeerIDs];
  if (![v209 isEqualToSet:v164]) {
    goto LABEL_235;
  }
  v165 = [v213 excludedPeerIDs];
  if (![v194 isEqualToSet:v165]) {
    goto LABEL_234;
  }
  if (!v196
    || ([v213 preapprovals],
        id v66 = (id)objc_claimAutoreleasedReturnValue(),
        ([v196 isEqual:v66] & 1) != 0))
  {
    v187 = [v213 dispositions];
    int v188 = [v224 isEqualToDictionary:v187];

    if (v196)
    {

      if ((v188 & 1) == 0) {
        goto LABEL_236;
      }
    }
    else
    {

      if (!v188) {
        goto LABEL_236;
      }
    }
    v189 = TPModelLog();
    if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_20CB20000, v189, OS_LOG_TYPE_DEFAULT, "Analysis didn't actually change anything, returning old dynamicInfo", buf, 2u);
    }

    id v29 = v213;
  }
  else
  {

LABEL_234:
LABEL_235:

LABEL_236:
    v166 = TPModelLog();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v209;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v194;
      _os_log_impl(&dword_20CB20000, v166, OS_LOG_TYPE_DEFAULT, "After exclusion filtering: included:%{public}@ excluded:%{public}@", buf, 0x16u);
    }

    v167 = [(TPModel *)v219 createDynamicInfoWithIncludedPeerIDs:v209 excludedPeerIDs:v194 dispositions:v224 preapprovals:v196 signingKeyPair:v201 error:a14];
    v168 = TPModelLog();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v167;
      _os_log_impl(&dword_20CB20000, v168, OS_LOG_TYPE_DEFAULT, "Returning new dynamicinfo: %{public}@", buf, 0xCu);
    }

    id v29 = v167;
  }

LABEL_266:
LABEL_267:

LABEL_268:
  id v61 = v200;
LABEL_269:

LABEL_270:
LABEL_271:

  return v29;
}

void __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 peerID];
  uint64_t v7 = *(void *)(a1 + 96);
  id v8 = [v5 permanentInfo];
  id v9 = [v8 signingPubKey];
  id v10 = [v9 spki];
  id v11 = +[TPHashBuilder hashWithAlgo:v7 ofData:v10];

  if ([*(id *)(a1 + 32) isEqualToString:v11])
  {
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = [v5 permanentInfo];
    LODWORD(v12) = [v12 canTrustCandidate:v13 inEpoch:*(void *)(a1 + 104)];

    if (v12)
    {
      uint64_t v14 = TPModelLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138543362;
        uint64_t v19 = v6;
        _os_log_impl(&dword_20CB20000, v14, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ preapproved", (uint8_t *)&v18, 0xCu);
      }

      [*(id *)(a1 + 48) addObject:v6];
      uint64_t v15 = [*(id *)(a1 + 40) recursivelyExpandIncludedPeerIDs:*(void *)(a1 + 48) andExcludedPeerIDs:*(void *)(a1 + 56) dispositions:*(void *)(a1 + 64) withPeersTrustedBySponsorID:v6 currentMachineIDs:*(void *)(a1 + 72) forEpoch:*(void *)(a1 + 104)];
      uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
      id v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      [*(id *)(a1 + 80) removeObject:*(void *)(a1 + 32)];
      *a3 = 1;
    }
  }
}

uint64_t __198__TPModel_calculateDynamicInfoFromModel_peer_peerPermanentInfo_peerStableInfo_startingDynamicInfo_addingPeerIDs_removingPeerIDs_preapprovedKeys_signingKeyPair_currentMachineIDs_sponsorPeerID_error___block_invoke_104(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x210554CF0]();
  id v5 = *(void **)(a1 + 32);
  id v13 = 0;
  id v6 = [v5 peerWithID:v3 error:&v13];
  id v7 = v13;
  id v8 = v7;
  if (v6)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [v6 permanentInfo];
    uint64_t v11 = [v9 canTrustCandidate:v10 inEpoch:*(void *)(a1 + 40)];
  }
  else
  {
    if (!v7)
    {
      uint64_t v11 = 1;
      goto LABEL_8;
    }
    id v10 = TPModelLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v15 = v3;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_20CB20000, v10, OS_LOG_TYPE_DEFAULT, "Error finding excluded peer %{public}@: %{public}@", buf, 0x16u);
    }
    uint64_t v11 = 1;
  }

LABEL_8:

  return v11;
}

- (id)calculateDynamicInfoForPeerWithID:(id)a3 addingPeerIDs:(id)a4 removingPeerIDs:(id)a5 preapprovedKeys:(id)a6 signingKeyPair:(id)a7 currentMachineIDs:(id)a8 error:(id *)a9
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v36 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = [(TPModel *)self actualPeerWithID:v15 error:a9];
  id v21 = v20;
  if (v20)
  {
    [v20 peerID];
    id v22 = v34 = v15;
    [v21 permanentInfo];
    id v35 = v19;
    v24 = id v23 = v16;
    [v21 stableInfo];
    v26 = uint64_t v25 = v17;
    int v27 = [v21 dynamicInfo];
    BOOL v28 = self;
    id v29 = v36;
    int v30 = [(TPModel *)v28 calculateDynamicInfoFromModel:v22 peer:v21 peerPermanentInfo:v24 peerStableInfo:v26 startingDynamicInfo:v27 addingPeerIDs:v36 removingPeerIDs:v23 preapprovedKeys:v25 signingKeyPair:v18 currentMachineIDs:v35 sponsorPeerID:0 error:a9];

    id v16 = v23;
    id v15 = v34;
    id v19 = v35;
  }
  else
  {
    id v31 = v18;
    uint64_t v25 = v17;
    id v29 = v36;
    uint64_t v32 = TPModelLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v38 = v15;
      _os_log_impl(&dword_20CB20000, v32, OS_LOG_TYPE_DEFAULT, "No peer for ID %{public}@", buf, 0xCu);
    }

    int v30 = 0;
    id v18 = v31;
  }

  return v30;
}

- (id)recursivelyExpandIncludedPeerIDs:(id)a3 andExcludedPeerIDs:(id)a4 dispositions:(id)a5 withPeersTrustedBySponsorID:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v57 = 0;
  id v51 = self;
  id v18 = [(TPModel *)self peerWithID:v16 error:&v57];
  id v19 = v57;
  uint64_t v20 = v19;
  if (v18)
  {
    id v46 = v19;
    id v48 = v17;
    id v49 = v15;
    id v50 = v13;
    id v21 = TPModelLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v18 peerID];
      id v23 = [v18 dynamicInfo];
      long long v24 = [v23 includedPeerIDs];
      uint64_t v25 = [v18 dynamicInfo];
      long long v26 = [v25 excludedPeerIDs];
      *(_DWORD *)long long buf = 138543874;
      id v60 = v22;
      __int16 v61 = 2114;
      uint64_t v62 = v24;
      __int16 v63 = 2114;
      id v64 = v26;
      _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_INFO, "Including information from sponsor (%{public}@): included: %{public}@ excluded: %{public}@", buf, 0x20u);
    }
    id v47 = v16;

    int v27 = [v18 dynamicInfo];
    BOOL v28 = [v27 excludedPeerIDs];
    id v29 = v14;
    [v14 unionSet:v28];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    int v30 = [v18 dynamicInfo];
    id v31 = [v30 includedPeerIDs];

    uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v54 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          id v37 = (void *)MEMORY[0x210554CF0]();
          id v38 = [v18 peerID];
          uint64_t v39 = [v18 permanentInfo];
          id v40 = [(TPModel *)v51 considerCandidateID:v36 withSponsorID:v38 sponsorPermanentInfo:v39 toExpandIncludedPeerIDs:v50 andExcludedPeerIDs:v29 dispositions:v49 currentMachineIDs:v48 forEpoch:a8];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v33);
    }

    uint64_t v41 = [v18 peerID];
    id v42 = [v18 permanentInfo];
    id v15 = v49;
    id v13 = v50;
    id v14 = v29;
    id v17 = v48;
    [(TPModel *)v51 considerVouchersSponsoredByPeerID:v41 sponsorPermanentInfo:v42 toRecursivelyExpandIncludedPeerIDs:v50 andExcludedPeerIDs:v29 dispositions:v49 currentMachineIDs:v48 forEpoch:a8];

    id v43 = [(TPModel *)v51 considerPreapprovalsSponsoredByPeer:v18 toRecursivelyExpandIncludedPeerIDs:v50 andExcludedPeerIDs:v29 dispositions:v49 currentMachineIDs:v48 forEpoch:a8];
    uint64_t v20 = v46;
    id v16 = v47;
  }
  else if (v19)
  {
    id v44 = TPModelLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v60 = v16;
      __int16 v61 = 2114;
      uint64_t v62 = v20;
      _os_log_impl(&dword_20CB20000, v44, OS_LOG_TYPE_DEFAULT, "Could not find peer %{public}@: %{public}@", buf, 0x16u);
    }

    id v43 = v20;
  }
  else
  {
    id v43 = 0;
  }

  return v43;
}

- (id)considerPreapprovalsSponsoredByPeer:(id)a3 toRecursivelyExpandIncludedPeerIDs:(id)a4 andExcludedPeerIDs:(id)a5 dispositions:(id)a6 currentMachineIDs:(id)a7 forEpoch:(unint64_t)a8
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v14 = a7;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = [v13 dynamicInfo];
  id v16 = [v15 preapprovals];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v44;
    *(void *)&long long v18 = 138543362;
    long long v27 = v18;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * v21);
      int64_t v23 = +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v22, v27);
      if (v23 != -1)
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __141__TPModel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke;
        v34[3] = &unk_2640EC6B8;
        int64_t v41 = v23;
        v34[4] = v22;
        id v35 = v13;
        uint64_t v36 = self;
        id v37 = v32;
        id v38 = v31;
        id v39 = v30;
        id v40 = v14;
        unint64_t v42 = a8;
        id v33 = 0;
        [(TPModel *)self enumeratePeersUsingBlock:v34 error:&v33];
        id v24 = v33;
        if (v24)
        {
          uint64_t v25 = TPModelLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v27;
            id v48 = v24;
            _os_log_impl(&dword_20CB20000, v25, OS_LOG_TYPE_DEFAULT, "Error enumerating peers: %{public}@", buf, 0xCu);
          }

          id v28 = v24;
        }

        if (v24) {
          break;
        }
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v16 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v19) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    id v28 = 0;
  }

  return v28;
}

void __141__TPModel_considerPreapprovalsSponsoredByPeer_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 peerID];
  uint64_t v5 = *(void *)(a1 + 88);
  id v6 = [v3 permanentInfo];

  id v7 = [v6 signingPubKey];
  id v8 = [v7 spki];
  id v9 = +[TPHashBuilder hashWithAlgo:v5 ofData:v8];

  if ([*(id *)(a1 + 32) isEqualToString:v9])
  {
    id v10 = TPModelLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [*(id *)(a1 + 40) peerID];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 2114;
      uint64_t v19 = v4;
      _os_log_impl(&dword_20CB20000, v10, OS_LOG_TYPE_DEFAULT, "Sponsor %{public}@ preapproves peer %{public}@", buf, 0x16u);
    }
    id v12 = *(void **)(a1 + 48);
    id v13 = [*(id *)(a1 + 40) peerID];
    id v14 = [*(id *)(a1 + 40) permanentInfo];
    id v15 = (id)[v12 considerCandidateID:v4 withSponsorID:v13 sponsorPermanentInfo:v14 toExpandIncludedPeerIDs:*(void *)(a1 + 56) andExcludedPeerIDs:*(void *)(a1 + 64) dispositions:*(void *)(a1 + 72) currentMachineIDs:*(void *)(a1 + 80) forEpoch:*(void *)(a1 + 96)];
  }
}

- (void)considerVouchersSponsoredByPeerID:(id)a3 sponsorPermanentInfo:(id)a4 toRecursivelyExpandIncludedPeerIDs:(id)a5 andExcludedPeerIDs:(id)a6 dispositions:(id)a7 currentMachineIDs:(id)a8 forEpoch:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  uint64_t v41 = 0;
  unint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy_;
  long long v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  uint64_t v21 = [(TPModel *)self dbAdapter];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __160__TPModel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke;
  v31[3] = &unk_2640EC690;
  id v22 = v15;
  id v32 = v22;
  id v23 = v17;
  id v33 = v23;
  id v24 = v18;
  id v39 = &v41;
  id v34 = v24;
  id v35 = self;
  id v25 = v16;
  id v36 = v25;
  id v26 = v19;
  id v37 = v26;
  id v27 = v20;
  id v38 = v27;
  unint64_t v40 = a9;
  id v30 = 0;
  [v21 enumerateVouchersUsingBlock:v31 error:&v30];
  id v28 = v30;

  if (!v28)
  {
    id v29 = (void *)v42[5];
    if (v29) {
      id v28 = v29;
    }
    else {
      id v28 = 0;
    }
  }

  _Block_object_dispose(&v41, 8);
}

void __160__TPModel_considerVouchersSponsoredByPeerID_sponsorPermanentInfo_toRecursivelyExpandIncludedPeerIDs_andExcludedPeerIDs_dispositions_currentMachineIDs_forEpoch___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [v5 sponsorID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v5 beneficiaryID];
    if ([v8 containsObject:v9])
    {

LABEL_5:
      id v12 = TPModelLog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        goto LABEL_9;
      }
      *(_DWORD *)long long buf = 138543362;
      id v29 = v5;
      id v13 = "Skipping voucher for already known beneficiary: %{public}@";
LABEL_7:
      _os_log_impl(&dword_20CB20000, v12, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
      goto LABEL_8;
    }
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = [v5 beneficiaryID];
    LODWORD(v10) = [v10 containsObject:v11];

    if (v10) {
      goto LABEL_5;
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    id v16 = *(void **)(a1 + 56);
    id v17 = [v5 sponsorID];
    uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
    id obj = *(id *)(v18 + 40);
    LOBYTE(v16) = [v16 hasPeerWithID:v17 error:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);

    if ((v16 & 1) == 0)
    {
      id v12 = TPModelLog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_8;
      }
      *(_DWORD *)long long buf = 138543362;
      id v29 = v5;
      id v13 = "Skipping voucher for unknown sponsor: %{public}@";
      goto LABEL_7;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
    {
      id v19 = TPModelLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        *(_DWORD *)long long buf = 138543618;
        id v29 = v5;
        __int16 v30 = 2114;
        uint64_t v31 = v26;
        _os_log_error_impl(&dword_20CB20000, v19, OS_LOG_TYPE_ERROR, "DB error for sponsor %{public}@: %{public}@", buf, 0x16u);
      }

      *a3 = 1;
    }
    else
    {
      char v20 = [*(id *)(a1 + 56) verifyVoucherSignature:v5];
      uint64_t v21 = TPModelLog();
      id v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138543362;
          id v29 = v5;
          _os_log_impl(&dword_20CB20000, v22, OS_LOG_TYPE_INFO, "Inspecting voucher claiming to be from sponsor: %{public}@", buf, 0xCu);
        }

        id v23 = *(void **)(a1 + 56);
        id v24 = [v5 beneficiaryID];
        id v25 = (id)[v23 considerCandidateID:v24 withSponsorID:*(void *)(a1 + 32) sponsorPermanentInfo:*(void *)(a1 + 64) toExpandIncludedPeerIDs:*(void *)(a1 + 40) andExcludedPeerIDs:*(void *)(a1 + 48) dispositions:*(void *)(a1 + 72) currentMachineIDs:*(void *)(a1 + 80) forEpoch:*(void *)(a1 + 96)];
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v29 = v5;
          _os_log_impl(&dword_20CB20000, v22, OS_LOG_TYPE_DEFAULT, "voucher: voucher has failed signature checking: %{public}@", buf, 0xCu);
        }
      }
    }
  }
LABEL_9:
}

- (id)considerCandidateID:(id)a3 withSponsorID:(id)a4 sponsorPermanentInfo:(id)a5 toExpandIncludedPeerIDs:(id)a6 andExcludedPeerIDs:(id)a7 dispositions:(id)a8 currentMachineIDs:(id)a9 forEpoch:(unint64_t)a10
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = (TPPBDisposition *)a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if ([v19 containsObject:v16]) {
    goto LABEL_8;
  }
  if ([v20 containsObject:v16])
  {
    id v23 = TPModelLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v73 = v16;
      _os_log_impl(&dword_20CB20000, v23, OS_LOG_TYPE_DEFAULT, "voucher: peer (%{public}@) already excluded", buf, 0xCu);
    }

    goto LABEL_8;
  }
  id v24 = [(TPModel *)self allCustodianRecoveryKeyPeerIDs];
  int v25 = [v24 containsObject:v16];

  if (v25)
  {
    [v19 addObject:v16];
LABEL_8:
    uint64_t v26 = 0;
    goto LABEL_9;
  }
  id v71 = 0;
  id v28 = [(TPModel *)self peerWithID:v16 error:&v71];
  uint64_t v67 = (TPPBDisposition *)v71;
  id v68 = v18;
  uint64_t v69 = v28;
  if (!v28)
  {
    id v33 = TPModelLog();
    id v34 = v67;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v73 = v16;
      __int16 v74 = 2114;
      uint64_t v75 = v67;
      _os_log_impl(&dword_20CB20000, v33, OS_LOG_TYPE_DEFAULT, "voucher: no peer for id %{public}@: %{public}@", buf, 0x16u);
    }

    uint64_t v26 = v67;
    goto LABEL_62;
  }
  __int16 v63 = v17;
  id v29 = [v28 permanentInfo];
  __int16 v30 = [v29 machineID];
  uint64_t v31 = [v22 entryFor:v30];

  uint64_t v65 = v31;
  if (v31) {
    uint64_t v32 = [v31 status];
  }
  else {
    uint64_t v32 = 0;
  }
  id v35 = [v21 objectForKeyedSubscript:v16];
  id v36 = v35;
  if (v35) {
    id v37 = v35;
  }
  else {
    id v37 = objc_alloc_init(TPPBDisposition);
  }
  id v66 = v37;

  switch(v32)
  {
    case 0:
      if (v22)
      {
        id v38 = objc_alloc_init(TPPBUnknownMachineID);
        [(TPPBDisposition *)v66 setUnknownMachineID:v38];
      }
      [(TPPBDisposition *)v66 setDisallowedMachineID:0];
      [(TPPBDisposition *)v66 setEvictedMachineID:0];
      [(TPPBDisposition *)v66 setUnknownReasonRemovalMachineID:0];
      [v21 setObject:v66 forKeyedSubscript:v16];
      id v39 = TPModelLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v73 = v31;
        __int16 v74 = 2114;
        uint64_t v75 = v66;
        _os_log_impl(&dword_20CB20000, v39, OS_LOG_TYPE_DEFAULT, "voucher: unknown machineID %{public}@ %{public}@", buf, 0x16u);
      }

      break;
    case 1:
      unint64_t v40 = v21;
      uint64_t v41 = 0;
      goto LABEL_42;
    case 2:
      unint64_t v42 = objc_alloc_init(TPPBDispositionDisallowedMachineID);
      [(TPPBDisposition *)v66 setDisallowedMachineID:v42];

      [v21 setObject:v66 forKeyedSubscript:v16];
      uint64_t v43 = TPModelLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v73 = v31;
        __int16 v74 = 2114;
        uint64_t v75 = v66;
        _os_log_impl(&dword_20CB20000, v43, OS_LOG_TYPE_DEFAULT, "voucher: disallowed machineID %{public}@ %{public}@", buf, 0x16u);
      }
      uint64_t v26 = 0;
      id v34 = v67;
      goto LABEL_61;
    case 3:
      long long v44 = TPModelLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v73 = v31;
        __int16 v74 = 2114;
        uint64_t v75 = v66;
        _os_log_impl(&dword_20CB20000, v44, OS_LOG_TYPE_DEFAULT, "voucher: evicted machineID %{public}@ %{public}@", buf, 0x16u);
      }

      [(TPPBDisposition *)v66 setUnknownMachineID:0];
      [(TPPBDisposition *)v66 setDisallowedMachineID:0];
      [(TPPBDisposition *)v66 setUnknownReasonRemovalMachineID:0];
      long long v45 = objc_alloc_init(TPPBDispositionEvictedMachineID);
      [(TPPBDisposition *)v66 setEvictedMachineID:v45];
      goto LABEL_41;
    case 4:
      id v46 = TPModelLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v73 = v31;
        __int16 v74 = 2114;
        uint64_t v75 = v66;
        _os_log_impl(&dword_20CB20000, v46, OS_LOG_TYPE_DEFAULT, "voucher: unknown reason removed machineID %{public}@ %{public}@", buf, 0x16u);
      }

      [(TPPBDisposition *)v66 setUnknownMachineID:0];
      [(TPPBDisposition *)v66 setDisallowedMachineID:0];
      [(TPPBDisposition *)v66 setEvictedMachineID:0];
      long long v45 = objc_alloc_init(TPPBDispositionUnknownReasonRemovalMachineID);
      [(TPPBDisposition *)v66 setUnknownReasonRemovalMachineID:v45];
      goto LABEL_41;
    case 5:
      id v47 = TPModelLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v73 = v31;
        __int16 v74 = 2114;
        uint64_t v75 = v66;
        _os_log_impl(&dword_20CB20000, v47, OS_LOG_TYPE_DEFAULT, "voucher: ghosted machineID %{public}@ %{public}@", buf, 0x16u);
      }

      long long v45 = objc_alloc_init(TPPBDispositionGhostedMachineID);
      [(TPPBDisposition *)v66 setGhostedMachineID:v45];
LABEL_41:

      unint64_t v40 = v21;
      uint64_t v41 = v66;
LABEL_42:
      [v40 setObject:v41 forKeyedSubscript:v16];
      break;
    default:
      break;
  }
  uint64_t v43 = [MEMORY[0x263EFF9C0] setWithSet:v19];
  [v43 minusSet:v20];
  [v43 addObject:v16];
  id v70 = 0;
  uint64_t v48 = [(TPModel *)self policyForPeerIDs:v43 candidatePeerID:v16 candidateStableInfo:0 error:&v70];
  id v62 = v70;
  id v64 = (void *)v48;
  if (v48)
  {
    __int16 v61 = v43;
    id v49 = [(TPPBDisposition *)v66 unknownMachineID];
    if (v49) {
      goto LABEL_49;
    }
    id v49 = [(TPPBDisposition *)v66 evictedMachineID];
    if (v49
      || ([(TPPBDisposition *)v66 unknownReasonRemovalMachineID],
          (id v49 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(TPPBDisposition *)v66 unknownMachineID],
          (id v49 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([(TPPBDisposition *)v66 disallowedMachineID],
          (id v49 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_49:

      unint64_t v50 = a10;
      id v51 = v66;
    }
    else
    {
      [(TPPBDisposition *)v66 ghostedMachineID];
      id v60 = v51 = v66;

      unint64_t v50 = a10;
      if (!v60) {
        goto LABEL_51;
      }
    }
    [v21 setObject:v51 forKeyedSubscript:v16];
LABEL_51:
    id v52 = [v69 permanentInfo];
    BOOL v53 = [(TPModel *)self canIntroduceCandidate:v52 withSponsor:v18 toEpoch:v50 underPolicy:v64 disposition:v51];

    if (v53)
    {
      long long v54 = TPModelLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        long long v55 = [v69 peerID];
        *(_DWORD *)long long buf = 138543618;
        id v73 = v55;
        __int16 v74 = 2114;
        uint64_t v75 = v63;
        _os_log_impl(&dword_20CB20000, v54, OS_LOG_TYPE_DEFAULT, "voucher: %{public}@ presented valid voucher from %{public}@", buf, 0x16u);
      }
      [v19 addObject:v16];
      long long v56 = [v69 dynamicInfo];
      id v57 = [v56 excludedPeerIDs];
      [v20 unionSet:v57];

      uint64_t v26 = [(TPModel *)self recursivelyExpandIncludedPeerIDs:v19 andExcludedPeerIDs:v20 dispositions:v21 withPeersTrustedBySponsorID:v16 currentMachineIDs:v22 forEpoch:a10];
    }
    else
    {
      uint64_t v26 = 0;
    }
    id v34 = v67;
    uint64_t v31 = v65;
    uint64_t v43 = v61;
    id v59 = v62;
    goto LABEL_60;
  }
  v58 = TPModelLog();
  uint64_t v31 = v65;
  id v59 = v62;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v73 = v62;
    _os_log_impl(&dword_20CB20000, v58, OS_LOG_TYPE_DEFAULT, "voucher: failed to fetch policy: %{public}@", buf, 0xCu);
  }

  uint64_t v26 = (TPPBDisposition *)v62;
  id v34 = v67;
LABEL_60:

LABEL_61:
  id v17 = v63;
LABEL_62:

  id v18 = v68;
LABEL_9:

  return v26;
}

- (BOOL)validateVoucherForPeer:(id)a3 sponsor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v8 = [(TPModel *)self dbAdapter];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__TPModel_validateVoucherForPeer_sponsor___block_invoke;
  v14[3] = &unk_2640EC668;
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  id v17 = self;
  id v18 = &v19;
  id v13 = 0;
  [v8 enumerateVouchersUsingBlock:v14 error:&v13];
  id v11 = v13;

  LOBYTE(v8) = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);

  return (char)v8;
}

void __42__TPModel_validateVoucherForPeer_sponsor___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  id v5 = [v11 beneficiaryID];
  id v6 = [*(id *)(a1 + 32) peerID];
  if (([v5 isEqualToString:v6] & 1) == 0) {
    goto LABEL_6;
  }
  id v7 = [v11 sponsorID];
  id v8 = [*(id *)(a1 + 40) peerID];
  if (![v7 isEqualToString:v8])
  {

LABEL_6:
    id v10 = v11;
    goto LABEL_7;
  }
  int v9 = [*(id *)(a1 + 48) verifyVoucherSignature:v11];

  id v10 = v11;
  if (v9)
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_7:
}

- (BOOL)verifyVoucherSignature:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 sponsorID];
  id v36 = 0;
  id v6 = [(TPModel *)self peerWithID:v5 error:&v36];
  id v7 = v36;

  if (v6 && !v7) {
    goto LABEL_26;
  }
  id v8 = TPModelLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v4 sponsorID];
    *(_DWORD *)long long buf = 138543618;
    id v39 = v9;
    __int16 v40 = 2114;
    id v41 = v7;
    _os_log_impl(&dword_20CB20000, v8, OS_LOG_TYPE_DEFAULT, "Can't find peer %{public}@: %{public}@", buf, 0x16u);
  }
  if (v6)
  {
LABEL_26:
    id v10 = [v6 permanentInfo];
    id v11 = [v10 signingPubKey];
    char v12 = [v4 checkSignatureWithKey:v11];

    if (v12) {
      goto LABEL_9;
    }
  }
  id v13 = [v6 stableInfo];
  uint64_t v14 = [v13 recoverySigningPublicKey];

  if (!v14) {
    goto LABEL_10;
  }
  id v15 = [v6 stableInfo];
  id v16 = [v15 recoverySigningPublicKey];
  id v17 = [v4 createRecoveryECPublicKey:v16];
  char v18 = [v4 checkSignatureWithKey:v17];

  if (v18)
  {
LABEL_9:
    BOOL v19 = 1;
  }
  else
  {
LABEL_10:
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = [(TPModel *)self custodianRecoveryKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v31 = v7;
      uint64_t v23 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v26 = [(TPModel *)self custodianRecoveryKeys];
          id v27 = [v26 objectForKeyedSubscript:v25];

          id v28 = [v27 signingPublicKey];
          char v29 = [v4 checkSignatureWithKey:v28];

          if (v29)
          {
            BOOL v19 = 1;
            goto LABEL_20;
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      BOOL v19 = 0;
LABEL_20:
      id v7 = v31;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  return v19;
}

- (id)createVoucherForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 reason:(unint64_t)a6 signingKeyPair:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  if ([(TPModel *)self checkIntroductionForCandidate:v14 stableInfo:a4 withSponsorID:v15 error:a8])
  {
    id v17 = [v14 peerID];
    char v18 = +[TPVoucher voucherWithReason:a6 beneficiaryID:v17 sponsorID:v15 signingKeyPair:v16 error:a8];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (BOOL)checkIntroductionForCandidate:(id)a3 stableInfo:(id)a4 withSponsorID:(id)a5 error:(id *)a6
{
  v48[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  char v12 = [(TPModel *)self actualPeerWithID:a5 error:a6];
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 trustedPeerIDs];
    id v15 = [v10 peerID];
    id v16 = [(TPModel *)self policyForPeerIDs:v14 candidatePeerID:v15 candidateStableInfo:v11 error:a6];

    if (!v16)
    {
      BOOL v22 = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v17 = [v10 modelID];
    char v18 = [v16 categoryForModel:v17];

    if (v18)
    {
      BOOL v19 = objc_alloc_init(TPPBDisposition);
      id v20 = [v13 permanentInfo];
      uint64_t v21 = [v13 permanentInfo];
      BOOL v22 = -[TPModel canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:](self, "canIntroduceCandidate:withSponsor:toEpoch:underPolicy:disposition:", v10, v20, [v21 epoch], v16, v19);

      if (!a6 || v22) {
        goto LABEL_18;
      }
      uint64_t v39 = TPErrorDomain;
      __int16 v40 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08320];
      v46[0] = @"Policy prohibits introducing candidate";
      v45[0] = v23;
      v45[1] = @"sponsorID";
      uint64_t v42 = [(TPPBDisposition *)v19 policyProhibits];
      uint64_t v43 = [v42 sponsorId];
      v46[1] = v43;
      v45[2] = @"sponsorCategory";
      id v41 = [(TPPBDisposition *)v19 policyProhibits];
      uint64_t v24 = [v41 sponsorCategory];
      id v38 = (void *)v24;
      long long v44 = v18;
      if (v24) {
        uint64_t v25 = (__CFString *)v24;
      }
      else {
        uint64_t v25 = @"unknown";
      }
      v46[2] = v25;
      v45[3] = @"candidateCategory";
      id v37 = [(TPPBDisposition *)v19 policyProhibits];
      uint64_t v26 = [v37 candidateCategory];
      id v27 = (void *)v26;
      if (v26) {
        id v28 = (__CFString *)v26;
      }
      else {
        id v28 = @"unknown";
      }
      v46[3] = v28;
      v45[4] = @"policyVersion";
      char v29 = NSNumber;
      __int16 v30 = [(TPPBDisposition *)v19 policyProhibits];
      id v31 = objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v30, "policyVersion"));
      v46[4] = v31;
      long long v32 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:5];
      *a6 = [v40 errorWithDomain:v39 code:6 userInfo:v32];

      char v18 = v44;
      long long v33 = v42;
    }
    else
    {
      if (!a6)
      {
        BOOL v22 = 0;
        goto LABEL_19;
      }
      long long v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = TPErrorDomain;
      v47[0] = *MEMORY[0x263F08320];
      v47[1] = @"model";
      v48[0] = @"Unrecognized modelID for candidate";
      BOOL v19 = [v10 modelID];
      v48[1] = v19;
      long long v33 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
      *a6 = [v34 errorWithDomain:v35 code:9 userInfo:v33];
    }

    BOOL v22 = 0;
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  BOOL v22 = 0;
LABEL_21:

  return v22;
}

- (BOOL)canIntroduceCandidate:(id)a3 withSponsor:(id)a4 toEpoch:(unint64_t)a5 underPolicy:(id)a6 disposition:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([(TPModel *)self canTrustCandidate:v12 inEpoch:a5])
  {
    id v16 = [v13 modelID];
    id v17 = [v14 categoryForModel:v16];

    char v18 = [v12 modelID];
    BOOL v19 = [v14 categoryForModel:v18];

    char v20 = [v14 trustedPeerInCategory:v17 canIntroduceCategory:v19];
    if ((v20 & 1) == 0)
    {
      uint64_t v21 = objc_alloc_init(TPPBPolicyProhibits);
      [v15 setPolicyProhibits:v21];

      BOOL v22 = [v14 version];
      uint64_t v23 = [v22 versionNumber];
      uint64_t v24 = [v15 policyProhibits];
      [v24 setPolicyVersion:v23];

      uint64_t v25 = [v13 peerID];
      uint64_t v26 = [v15 policyProhibits];
      [v26 setSponsorId:v25];

      id v27 = [v15 policyProhibits];
      [v27 setSponsorCategory:v17];

      id v28 = [v15 policyProhibits];
      [v28 setCandidateCategory:v19];

      if (v19)
      {
        char v29 = 0;
      }
      else
      {
        long long v33 = NSString;
        id v28 = [v12 modelID];
        char v29 = [v33 stringWithFormat:@"unrecognized modelID: %@", v28];
      }
      long long v34 = [v15 policyProhibits];
      [v34 setExplanation:v29];

      if (!v19)
      {
      }
    }
  }
  else
  {
    __int16 v30 = objc_alloc_init(TPPBAncientEpoch);
    [v15 setAncientEpoch:v30];

    uint64_t v31 = [v12 epoch];
    long long v32 = [v15 ancientEpoch];
    [v32 setCandidateEpoch:v31];

    id v17 = [v15 ancientEpoch];
    [v17 setMyEpoch:a5];
    char v20 = 0;
  }

  return v20;
}

- (BOOL)canTrustCandidate:(id)a3 inEpoch:(unint64_t)a4
{
  return [a3 epoch] + 1 >= a4;
}

- (id)createDynamicInfoWithIncludedPeerIDs:(id)a3 excludedPeerIDs:(id)a4 dispositions:(id)a5 preapprovals:(id)a6 signingKeyPair:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v24 = 0;
  unint64_t v19 = [(TPModel *)self maxClockWithError:&v24];
  id v20 = v24;
  uint64_t v21 = v20;
  if (v20)
  {
    BOOL v22 = 0;
    if (a8) {
      *a8 = v20;
    }
  }
  else
  {
    BOOL v22 = +[TPPeerDynamicInfo dynamicInfoWithClock:v19 + 1 includedPeerIDs:v14 excludedPeerIDs:v15 dispositions:v16 preapprovals:v17 signingKeyPair:v18 error:a8];
  }

  return v22;
}

- (unint64_t)maxClockWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v8 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__TPModel_maxClockWithError___block_invoke;
  v9[3] = &unk_2640EC5C8;
  v9[4] = &v10;
  [(TPModel *)self enumeratePeersUsingBlock:v9 error:&v8];
  id v4 = v8;
  if (v4)
  {
    id v5 = TPModelLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v15 = v4;
      _os_log_impl(&dword_20CB20000, v5, OS_LOG_TYPE_DEFAULT, "maxClock error enumerating peers: %{public}@", buf, 0xCu);
    }

    unint64_t v6 = 0;
    if (a3) {
      *a3 = v4;
    }
  }
  else
  {
    unint64_t v6 = v11[3];
  }

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __29__TPModel_maxClockWithError___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stableInfo];

  if (v3)
  {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    id v5 = [v13 stableInfo];
    unint64_t v6 = [v5 clock];

    if (v4 <= v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = v4;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;
  }
  id v8 = [v13 dynamicInfo];

  if (v8)
  {
    unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v10 = [v13 dynamicInfo];
    unint64_t v11 = [v10 clock];

    if (v9 <= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v9;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v12;
  }
}

- (id)createStableInfoWithFrozenPolicyVersion:(id)a3 flexiblePolicyVersion:(id)a4 policySecrets:(id)a5 syncUserControllableViews:(int)a6 secureElementIdentity:(id)a7 walrusSetting:(id)a8 webAccess:(id)a9 deviceName:(id)a10 serialNumber:(id)a11 osVersion:(id)a12 signingKeyPair:(id)a13 recoverySigningPubKey:(id)a14 recoveryEncryptionPubKey:(id)a15 isInheritedAccount:(BOOL)a16 error:(id *)a17
{
  id v40 = a3;
  id v21 = a4;
  id v45 = a5;
  id v44 = a7;
  id v43 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  v46[0] = 0;
  unint64_t v29 = [(TPModel *)self maxClockWithError:v46];
  id v30 = v46[0];
  uint64_t v31 = v30;
  if (v30)
  {
    long long v32 = v27;
    long long v33 = v40;
    uint64_t v42 = 0;
    if (a17) {
      *a17 = v30;
    }
  }
  else
  {
    long long v34 = [TPPeerStableInfo alloc];
    LOBYTE(v38) = a16;
    id v37 = v27;
    unint64_t v35 = v29 + 1;
    long long v32 = v27;
    long long v33 = v40;
    uint64_t v42 = -[TPPeerStableInfo initWithClock:frozenPolicyVersion:flexiblePolicyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:deviceName:serialNumber:osVersion:signingKeyPair:recoverySigningPubKey:recoveryEncryptionPubKey:isInheritedAccount:error:](v34, "initWithClock:frozenPolicyVersion:flexiblePolicyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:deviceName:serialNumber:osVersion:signingKeyPair:recoverySigningPubKey:recoveryEncryptionPubKey:isInheritedAccount:error:", v35, v40, v21, v45, a6, v44, v43, v22, v23, v24, v25, v26, v37, v28, v38,
            a17);
  }

  return v42;
}

- (int)userViewSyncabilityConsensusAmongTrustedPeers:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  unint64_t v7 = [v6 includedPeerIDs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v28 = a4;
    uint64_t v10 = *(void *)v32;
    int v11 = 1;
    id v29 = v6;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
      id v14 = (void *)MEMORY[0x210554CF0]();
      id v30 = 0;
      id v15 = [(TPModel *)self peerWithID:v13 error:&v30];
      id v16 = v30;
      if (v16) {
        break;
      }
      id v17 = [v15 stableInfo];
      int v18 = [v17 syncUserControllableViews];

      if (v18 == 1)
      {
        id v25 = TPModelLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v15 peerID];
          *(_DWORD *)long long buf = 138543362;
          id v36 = v26;
          _os_log_impl(&dword_20CB20000, v25, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ has disabled user view syncing", buf, 0xCu);
        }

        id v23 = 0;
LABEL_24:
        int v11 = 1;
        id v6 = v29;
        goto LABEL_25;
      }
      unint64_t v19 = [v15 stableInfo];
      int v20 = [v19 syncUserControllableViews];

      if (v20 == 2)
      {
        id v21 = TPModelLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = [v15 peerID];
          *(_DWORD *)long long buf = 138543362;
          id v36 = v22;
          _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_DEFAULT, "Peer %{public}@ has enabled user view syncing", buf, 0xCu);
        }
        int v11 = 2;
      }

      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v39 count:16];
        id v6 = v29;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    id v23 = v16;
    id v24 = TPModelLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v36 = v13;
      __int16 v37 = 2114;
      id v38 = v23;
      _os_log_impl(&dword_20CB20000, v24, OS_LOG_TYPE_DEFAULT, "Can't find peer %{public}@: %{public}@", buf, 0x16u);
    }

    if (v28)
    {
      id v23 = v23;
      *id v28 = v23;
    }
    goto LABEL_24;
  }
  int v11 = 1;
LABEL_16:

  id v23 = 0;
LABEL_25:

  return v11;
}

- (id)getDynamicInfoForPeerWithID:(id)a3 error:(id *)a4
{
  unint64_t v4 = [(TPModel *)self peerWithID:a3 error:a4];
  id v5 = [v4 dynamicInfo];

  return v5;
}

- (id)getStableInfoForPeerWithID:(id)a3 error:(id *)a4
{
  unint64_t v4 = [(TPModel *)self peerWithID:a3 error:a4];
  id v5 = [v4 stableInfo];

  return v5;
}

- (unint64_t)statusOfPeerWithID:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v27 = 0;
  unint64_t v7 = [(TPModel *)self peerWithID:v6 error:&v27];
  id v8 = v27;
  id v9 = v8;
  if (v7) {
    goto LABEL_2;
  }
  if (!v8)
  {
    v29[3] |= 0x20uLL;
LABEL_2:
    uint64_t v10 = [v7 dynamicInfo];
    int v11 = [v10 includedPeerIDs];
    BOOL v12 = [v11 count] == 0;

    if (v12)
    {
      id v15 = TPModelLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v33 = v6;
        _os_log_impl(&dword_20CB20000, v15, OS_LOG_TYPE_DEFAULT, "status: peerID %{public}@ has no included peer IDs?", buf, 0xCu);
      }
    }
    else
    {
      v29[3] |= 2uLL;
    }

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __36__TPModel_statusOfPeerWithID_error___block_invoke;
    v22[3] = &unk_2640EC640;
    id v16 = v6;
    id v23 = v16;
    id v26 = &v28;
    id v24 = v7;
    id v25 = self;
    id v21 = 0;
    [(TPModel *)self enumeratePeersUsingBlock:v22 error:&v21];
    id v9 = v21;
    id v17 = TPModelLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v18)
      {
        *(_DWORD *)long long buf = 138543362;
        id v33 = v9;
        _os_log_impl(&dword_20CB20000, v17, OS_LOG_TYPE_DEFAULT, "status: error enumerating peers: %{public}@", buf, 0xCu);
      }

      unint64_t v14 = 0;
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      if (v18)
      {
        unint64_t v19 = TPPeerStatusToString(v29[3]);
        *(_DWORD *)long long buf = 138543618;
        id v33 = v16;
        __int16 v34 = 2114;
        id v35 = v19;
        _os_log_impl(&dword_20CB20000, v17, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ trust status is: %{public}@", buf, 0x16u);
      }
      unint64_t v14 = v29[3];
    }

    goto LABEL_21;
  }
  id v13 = TPModelLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v33 = v6;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl(&dword_20CB20000, v13, OS_LOG_TYPE_DEFAULT, "can't find peer for status %{public}@: %{public}@", buf, 0x16u);
  }

  if (a4)
  {
    id v9 = v9;
    unint64_t v14 = 0;
    *a4 = v9;
  }
  else
  {
    unint64_t v14 = 0;
  }
LABEL_21:

  _Block_object_dispose(&v28, 8);
  return v14;
}

void __36__TPModel_statusOfPeerWithID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t v4 = [v3 peerID];
  id v5 = [v3 dynamicInfo];
  id v6 = [v5 includedPeerIDs];
  int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  id v8 = [v3 dynamicInfo];
  id v9 = [v8 excludedPeerIDs];
  int v10 = [v9 containsObject:*(void *)(a1 + 32)];

  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    if (v7)
    {
      int v11 = TPModelLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v37 = 138543362;
        *(void *)&v37[4] = v4;
        _os_log_impl(&dword_20CB20000, v11, OS_LOG_TYPE_DEFAULT, "status: peerID %{public}@ trusts itself", v37, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x40uLL;
    }
    if (v10)
    {
      BOOL v12 = TPModelLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)__int16 v37 = 138543362;
        *(void *)&v37[4] = v13;
        _os_log_impl(&dword_20CB20000, v12, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ excludes itself", v37, 0xCu);
      }

      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 4uLL;
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      unint64_t v15 = *(void *)(v14 + 24) & 0xFFFFFFFFFFFFFFBFLL;
LABEL_31:
      *(void *)(v14 + 24) = v15;
      goto LABEL_32;
    }
    goto LABEL_32;
  }
  if (((v10 | v7) & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x80uLL;
  }
  id v16 = [*(id *)(a1 + 40) dynamicInfo];
  id v17 = [v16 includedPeerIDs];
  int v18 = [v17 containsObject:v4];

  if (!v18) {
    goto LABEL_32;
  }
  if ((v7 & 1) != 0
    || ([*(id *)(a1 + 48) validateVoucherForPeer:*(void *)(a1 + 40) sponsor:v3] & 1) != 0
    || [*(id *)(a1 + 48) validatePeerWithPreApproval:*(void *)(a1 + 40) sponsor:v3])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 1uLL;
    unint64_t v19 = TPModelLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    uint64_t v20 = *(void *)(a1 + 32);
    *(_DWORD *)__int16 v37 = 138543618;
    *(void *)&v37[4] = v4;
    *(_WORD *)&v37[12] = 2114;
    *(void *)&v37[14] = v20;
    id v21 = "status: peer %{public}@ trusts %{public}@";
    goto LABEL_18;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) &= ~2uLL;
  unint64_t v19 = TPModelLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = *(void *)(a1 + 32);
    *(_DWORD *)__int16 v37 = 138543618;
    *(void *)&v37[4] = v4;
    *(_WORD *)&v37[12] = 2114;
    *(void *)&v37[14] = v36;
    id v21 = "status: peer %{public}@ doesn't trust %{public}@";
LABEL_18:
    _os_log_impl(&dword_20CB20000, v19, OS_LOG_TYPE_INFO, v21, v37, 0x16u);
  }
LABEL_19:

  if (v10)
  {
    id v22 = TPModelLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)__int16 v37 = 138543618;
      *(void *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v23;
      _os_log_impl(&dword_20CB20000, v22, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ excludes %{public}@", v37, 0x16u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 4uLL;
  }
  id v24 = objc_msgSend(v3, "permanentInfo", *(_OWORD *)v37, *(void *)&v37[16], v38);
  unint64_t v25 = [v24 epoch];
  id v26 = [*(id *)(a1 + 40) permanentInfo];
  unint64_t v27 = [v26 epoch];

  if (v25 > v27)
  {
    uint64_t v28 = TPModelLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)__int16 v37 = 138543618;
      *(void *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v29;
      _os_log_impl(&dword_20CB20000, v28, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ outdates %{public}@", v37, 0x16u);
    }

    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 8uLL;
  }
  uint64_t v30 = [v3 permanentInfo];
  unint64_t v31 = [v30 epoch];
  long long v32 = [*(id *)(a1 + 40) permanentInfo];
  unint64_t v33 = [v32 epoch] + 1;

  if (v31 > v33)
  {
    __int16 v34 = TPModelLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      *(_DWORD *)__int16 v37 = 138543618;
      *(void *)&v37[4] = v4;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v35;
      _os_log_impl(&dword_20CB20000, v34, OS_LOG_TYPE_DEFAULT, "status: peer %{public}@ far outdates %{public}@", v37, 0x16u);
    }

    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    unint64_t v15 = *(void *)(v14 + 24) | 0x10;
    goto LABEL_31;
  }
LABEL_32:
}

- (BOOL)validatePeerWithPreApproval:(id)a3 sponsor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 dynamicInfo];
  id v8 = [v7 preapprovals];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    int v10 = [v5 permanentInfo];
    int v11 = [v10 signingPubKey];
    BOOL v12 = [v11 spki];
    uint64_t v13 = +[TPHashBuilder hashWithAlgo:1 ofData:v12];

    uint64_t v14 = [v6 dynamicInfo];
    unint64_t v15 = [v14 preapprovals];
    char v16 = [v15 containsObject:v13];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)hasPotentiallyTrustedPeerWithSigningKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x210554CF0]();
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = [MEMORY[0x263EFF9C0] set];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__TPModel_hasPotentiallyTrustedPeerWithSigningKey_error___block_invoke;
  v14[3] = &unk_2640EC618;
  id v9 = v7;
  id v15 = v9;
  char v16 = &v17;
  id v13 = 0;
  int v10 = [(TPModel *)self _iterateOverPeersWithBlock:v14 error:&v13];
  id v11 = v13;
  if (!v11)
  {
    [(id)v18[5] intersectSet:v10];
    BOOL v4 = [(id)v18[5] count] != 0;
  }

  _Block_object_dispose(&v17, 8);
  if (v11)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v4;
}

void __57__TPModel_hasPotentiallyTrustedPeerWithSigningKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 peerID];
  BOOL v4 = [v3 permanentInfo];

  id v5 = [v4 signingPubKey];
  id v6 = [v5 spki];
  int v7 = [v6 isEqualToData:*(void *)(a1 + 32)];

  if (v7) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
  }
}

- (BOOL)anyTrustedPeerDistrustsOtherPeer:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x210554CF0]();
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  id v21 = __Block_byref_object_dispose_;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = [MEMORY[0x263EFF9C0] set];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__TPModel_anyTrustedPeerDistrustsOtherPeer_error___block_invoke;
  v14[3] = &unk_2640EC618;
  id v9 = v7;
  id v15 = v9;
  char v16 = &v17;
  id v13 = 0;
  int v10 = [(TPModel *)self _iterateOverPeersWithBlock:v14 error:&v13];
  id v11 = v13;
  if (!v11)
  {
    [(id)v18[5] intersectSet:v10];
    BOOL v4 = [(id)v18[5] count] != 0;
  }

  _Block_object_dispose(&v17, 8);
  if (v11)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v4;
}

void __50__TPModel_anyTrustedPeerDistrustsOtherPeer_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 dynamicInfo];
  BOOL v4 = [v3 excludedPeerIDs];
  int v5 = [v4 containsObject:*(void *)(a1 + 32)];

  if (v5)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v7 = [v8 peerID];
    [v6 addObject:v7];
  }
}

- (BOOL)hasPotentiallyTrustedPeerPreapprovingKey:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x210554CF0]();
  id v9 = +[TPHashBuilder hashWithAlgo:1 ofData:v7];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = [MEMORY[0x263EFF9C0] set];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__TPModel_hasPotentiallyTrustedPeerPreapprovingKey_error___block_invoke;
  v15[3] = &unk_2640EC618;
  id v10 = v9;
  id v16 = v10;
  uint64_t v17 = &v18;
  id v14 = 0;
  id v11 = [(TPModel *)self _iterateOverPeersWithBlock:v15 error:&v14];
  id v12 = v14;
  if (!v12)
  {
    [(id)v19[5] intersectSet:v11];
    BOOL v4 = [(id)v19[5] count] != 0;
  }

  _Block_object_dispose(&v18, 8);
  if (v12)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v4;
}

void __58__TPModel_hasPotentiallyTrustedPeerPreapprovingKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 peerID];
  BOOL v4 = [v3 dynamicInfo];

  int v5 = [v4 preapprovals];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

- (id)allTrustedPeersWithCurrentRecoveryKeyWithError:(id *)a3
{
  int v5 = &v12;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = [MEMORY[0x263EFF9C0] set];
  int v6 = (void *)MEMORY[0x210554CF0]();
  id v10 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__TPModel_allTrustedPeersWithCurrentRecoveryKeyWithError___block_invoke;
  v11[3] = &unk_2640EC618;
  void v11[4] = self;
  void v11[5] = &v12;
  id v7 = [(TPModel *)self _iterateOverPeersWithBlock:v11 error:&v10];
  id v8 = v10;
  if (!v8)
  {
    [(id)v13[5] intersectSet:v7];
    int v5 = (uint64_t *)(id)v13[5];
  }

  if (v8)
  {
    int v5 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __58__TPModel_allTrustedPeersWithCurrentRecoveryKeyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [v19 peerID];
  BOOL v4 = [v19 stableInfo];
  uint64_t v5 = [v4 recoverySigningPublicKey];
  if (!v5) {
    goto LABEL_8;
  }
  int v6 = (void *)v5;
  id v7 = [v19 stableInfo];
  uint64_t v8 = [v7 recoveryEncryptionPublicKey];
  if (!v8)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  id v9 = (void *)v8;
  id v10 = [*(id *)(a1 + 32) recoverySigningPublicKey];
  id v11 = [v19 stableInfo];
  uint64_t v12 = [v11 recoverySigningPublicKey];
  if (![v10 isEqualToData:v12])
  {

    goto LABEL_7;
  }
  id v13 = [*(id *)(a1 + 32) recoveryEncryptionPublicKey];
  [v19 stableInfo];
  uint64_t v14 = v18 = v3;
  [v14 recoveryEncryptionPublicKey];
  id v15 = v16 = a1;
  int v17 = [v13 isEqualToData:v15];

  id v3 = v18;
  if (v17) {
    [*(id *)(*(void *)(*(void *)(v16 + 40) + 8) + 40) addObject:v18];
  }
LABEL_9:
}

- (BOOL)isRecoveryKeyExcluded:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x210554CF0]();
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy_;
  id v22 = __Block_byref_object_dispose_;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = [MEMORY[0x263EFF9C0] set];
  id v9 = [(TPModel *)self recoveryKeyPeerID:v7];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__TPModel_isRecoveryKeyExcluded_error___block_invoke;
  v15[3] = &unk_2640EC618;
  id v10 = v9;
  id v16 = v10;
  int v17 = &v18;
  id v14 = 0;
  id v11 = [(TPModel *)self _iterateOverPeersWithBlock:v15 error:&v14];
  id v12 = v14;
  if (!v12)
  {
    [(id)v19[5] intersectSet:v11];
    BOOL v4 = [(id)v19[5] count] != 0;
  }

  _Block_object_dispose(&v18, 8);
  if (v12)
  {
    BOOL v4 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v4;
}

void __39__TPModel_isRecoveryKeyExcluded_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 peerID];
  BOOL v4 = [v3 dynamicInfo];

  uint64_t v5 = [v4 excludedPeerIDs];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
  }
}

- (id)peerCountsByMachineIDWithError:(id *)a3
{
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__TPModel_peerCountsByMachineIDWithError___block_invoke;
  v12[3] = &unk_2640EC5F0;
  id v6 = v5;
  id v13 = v6;
  id v11 = 0;
  [(TPModel *)self enumeratePeersUsingBlock:v12 error:&v11];
  id v7 = v11;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = 0;
    if (a3) {
      *a3 = v7;
    }
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

void __42__TPModel_peerCountsByMachineIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 permanentInfo];
  id v7 = [v3 machineID];

  BOOL v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v4, "longValue") + 1);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:&unk_26C1C1D90 forKeyedSubscript:v7];
  }
}

- (id)viablePeerCountsByModelIDWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  context = (void *)MEMORY[0x210554CF0]();
  uint64_t v26 = 0;
  unint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy_;
  uint64_t v30 = __Block_byref_object_dispose_;
  id v31 = (id)0xAAAAAAAAAAAAAAAALL;
  id v31 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v24 = 0;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __46__TPModel_viablePeerCountsByModelIDWithError___block_invoke;
  v25[3] = &unk_2640EC5A0;
  v25[4] = &v26;
  id v7 = [(TPModel *)self _iterateOverPeersWithBlock:v25 error:&v24];
  id v19 = v24;
  if (v19)
  {

    _Block_object_dispose(&v26, 8);
    id v8 = 0;
    if (a3) {
      *a3 = v19;
    }
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = objc_msgSend((id)v27[5], "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * i), context, v19, (void)v20);
          id v14 = [v6 objectForKeyedSubscript:v13];
          id v15 = v14;
          if (v14)
          {
            id v3 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v14, "longValue") + 1);
            id v16 = v3;
          }
          else
          {
            id v16 = &unk_26C1C1D90;
          }
          [v6 setObject:v16 forKeyedSubscript:v13];
          if (v15) {
        }
          }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v10);
    }

    _Block_object_dispose(&v26, 8);
    id v8 = v6;
  }

  return v8;
}

void __46__TPModel_viablePeerCountsByModelIDWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 peerID];
  BOOL v4 = [v3 permanentInfo];

  uint64_t v5 = [v4 modelID];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
}

- (id)allMachineIDsWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = [MEMORY[0x263EFF9C0] set];
  id v9 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__TPModel_allMachineIDsWithError___block_invoke;
  v10[3] = &unk_2640EC5C8;
  v10[4] = &v11;
  [(TPModel *)self enumeratePeersUsingBlock:v10 error:&v9];
  id v5 = v9;
  id v6 = v5;
  if (v5)
  {
    id v7 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    id v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __34__TPModel_allMachineIDsWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 permanentInfo];
  id v3 = [v4 machineID];
  [v2 addObject:v3];
}

- (id)actualPeerWithID:(id)a3 error:(id *)a4
{
  id v9 = 0;
  id v5 = [(TPModel *)self peerWithID:a3 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      if (a4) {
        *a4 = v6;
      }
    }
    else
    {
      failWithNoPeerWithIDError(a4);
    }
  }

  return v5;
}

- (id)custodianPeerWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(TPModel *)self custodianRecoveryKeys];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)copyPeerWithNewDynamicInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v27 = 0;
  uint64_t v10 = [(TPModel *)self peerWithID:v9 error:&v27];
  uint64_t v11 = v27;
  id v12 = v11;
  if (v10)
  {
    id v26 = 0;
    uint64_t v13 = [v10 peerWithUpdatedDynamicInfo:v8 error:&v26];
    id v14 = v26;
    if (!v13)
    {
      long long v23 = TPModelLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v29 = v9;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl(&dword_20CB20000, v23, OS_LOG_TYPE_DEFAULT, "failed to update dynamic info for peerID %{public}@: %{public}@", buf, 0x16u);
      }

      if (a5) {
        *a5 = v14;
      }
      goto LABEL_26;
    }
    if ([(TPModel *)self suppressInitialInfoLogging]
      && ([v10 dynamicInfo], id v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      uint64_t v18 = TPModelLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 138543362;
      id v29 = v9;
      long long v20 = "peer(%{public}@) initially loaded dynamic info";
    }
    else
    {
      id v16 = [v10 dynamicInfo];
      int v17 = [v13 dynamicInfo];

      uint64_t v18 = TPModelLog();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 != v17)
      {
        if (v19)
        {
          *(_DWORD *)long long buf = 138543618;
          id v29 = v9;
          __int16 v30 = 2114;
          id v31 = v8;
          long long v20 = "peer(%{public}@) dynamic info is now: %{public}@";
          long long v21 = v18;
          uint32_t v22 = 22;
LABEL_24:
          _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }
LABEL_25:

        id v24 = v13;
LABEL_26:

        goto LABEL_27;
      }
      if (!v19) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 138543362;
      id v29 = v9;
      long long v20 = "peer(%{public}@) dynamic info didn't actually change";
    }
    long long v21 = v18;
    uint32_t v22 = 12;
    goto LABEL_24;
  }
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    failWithNoPeerWithIDError(a5);
  }
  id v14 = TPModelLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = v9;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl(&dword_20CB20000, v14, OS_LOG_TYPE_DEFAULT, "can't update dynamic info for peerID %{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_27:

  return v13;
}

- (id)copyPeerWithNewStableInfo:(id)a3 forPeerWithID:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v27 = 0;
  uint64_t v10 = [(TPModel *)self peerWithID:v9 error:&v27];
  uint64_t v11 = v27;
  id v12 = v11;
  if (v10)
  {
    id v26 = 0;
    uint64_t v13 = [v10 peerWithUpdatedStableInfo:v8 error:&v26];
    id v14 = v26;
    if (!v13)
    {
      long long v23 = TPModelLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v29 = v9;
        __int16 v30 = 2114;
        id v31 = v14;
        _os_log_impl(&dword_20CB20000, v23, OS_LOG_TYPE_DEFAULT, "failed to update stable info for peerID %{public}@: %{public}@", buf, 0x16u);
      }

      if (a5) {
        *a5 = v14;
      }
      goto LABEL_26;
    }
    if ([(TPModel *)self suppressInitialInfoLogging]
      && ([v10 stableInfo], id v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      uint64_t v18 = TPModelLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 138543362;
      id v29 = v9;
      long long v20 = "peer(%{public}@) initially loaded stable info";
    }
    else
    {
      id v16 = [v10 stableInfo];
      int v17 = [v13 stableInfo];

      uint64_t v18 = TPModelLog();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v16 != v17)
      {
        if (v19)
        {
          *(_DWORD *)long long buf = 138543618;
          id v29 = v9;
          __int16 v30 = 2114;
          id v31 = v8;
          long long v20 = "peer(%{public}@) stable info is now: %{public}@";
          long long v21 = v18;
          uint32_t v22 = 22;
LABEL_24:
          _os_log_impl(&dword_20CB20000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }
LABEL_25:

        id v24 = v13;
LABEL_26:

        goto LABEL_27;
      }
      if (!v19) {
        goto LABEL_25;
      }
      *(_DWORD *)long long buf = 138543362;
      id v29 = v9;
      long long v20 = "peer(%{public}@) stable info didn't actually change";
    }
    long long v21 = v18;
    uint32_t v22 = 12;
    goto LABEL_24;
  }
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    failWithNoPeerWithIDError(a5);
  }
  id v14 = TPModelLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = v9;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl(&dword_20CB20000, v14, OS_LOG_TYPE_DEFAULT, "can't update stable info for peerID %{public}@: %{public}@", buf, 0x16u);
  }
  uint64_t v13 = 0;
LABEL_27:

  return v13;
}

- (id)peerWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(TPModel *)self dbAdapter];
  id v8 = [v7 peerWithID:v6 error:a4];

  return v8;
}

- (BOOL)hasPeerWithID:(id)a3 error:(id *)a4
{
  id v4 = [(TPModel *)self peerWithID:a3 error:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)allRegisteredPolicyVersionsWithError:(id *)a3
{
  id v4 = [(TPModel *)self dbAdapter];
  BOOL v5 = [v4 allRegisteredPolicyVersions:a3];

  return v5;
}

- (id)allPolicyVersionsWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = (id)0xAAAAAAAAAAAAAAAALL;
  id v16 = [MEMORY[0x263EFF9C0] set];
  id v9 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__TPModel_allPolicyVersionsWithError___block_invoke;
  v10[3] = &unk_2640EC5C8;
  v10[4] = &v11;
  [(TPModel *)self enumeratePeersUsingBlock:v10 error:&v9];
  id v5 = v9;
  id v6 = v5;
  if (v5)
  {
    id v7 = 0;
    if (a3) {
      *a3 = v5;
    }
  }
  else
  {
    id v7 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __38__TPModel_allPolicyVersionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 stableInfo];
  id v4 = [v3 frozenPolicyVersion];

  if (v4)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v6 = [v13 stableInfo];
    id v7 = [v6 frozenPolicyVersion];
    [v5 addObject:v7];
  }
  id v8 = [v13 stableInfo];
  id v9 = [v8 flexiblePolicyVersion];

  if (v9)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v11 = [v13 stableInfo];
    id v12 = [v11 flexiblePolicyVersion];
    [v10 addObject:v12];
  }
}

- (id)recoveryKeyPeerID:(id)a3
{
  id v3 = a3;
  ccsha384_di();
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:*(void *)ccsha384_di()];
  [v3 length];
  id v5 = v3;
  [v5 bytes];

  id v6 = v4;
  [v6 mutableBytes];
  ccdigest();
  id v7 = [v6 base64EncodedStringWithOptions:0];
  id v8 = [NSString stringWithFormat:@"RK-%@", v7];

  return v8;
}

- (BOOL)hasPotentiallyTrustedPeerTestingOnlyWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x210554CF0](self, a2);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = (id)0xAAAAAAAAAAAAAAAALL;
  id v17 = [MEMORY[0x263EFF9C0] set];
  id v11 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__TPModel_hasPotentiallyTrustedPeerTestingOnlyWithError___block_invoke;
  v12[3] = &unk_2640EC5A0;
  void v12[4] = &buf;
  id v7 = [(TPModel *)self _iterateOverPeersWithBlock:v12 error:&v11];
  id v8 = v11;
  if (!v8)
  {
    [*(id *)(*((void *)&buf + 1) + 40) intersectSet:v7];
    BOOL v3 = [*(id *)(*((void *)&buf + 1) + 40) count] != 0;
  }

  _Block_object_dispose(&buf, 8);
  if (v8)
  {
    id v9 = TPModelLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_20CB20000, v9, OS_LOG_TYPE_DEFAULT, "hasPotentiallyTrustedPeer error: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    BOOL v3 = 0;
    if (a3) {
      *a3 = v8;
    }
  }

  return v3;
}

void __57__TPModel_hasPotentiallyTrustedPeerTestingOnlyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 peerID];
  id v4 = [v3 dynamicInfo];

  id v5 = [v4 includedPeerIDs];
  int v6 = [v5 containsObject:v7];

  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  }
}

- (id)_iterateOverPeersWithBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = &v23;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  id v27 = __Block_byref_object_dispose_;
  id v28 = (id)0xAAAAAAAAAAAAAAAALL;
  id v28 = [MEMORY[0x263EFF9C0] set];
  id v8 = (void *)MEMORY[0x210554CF0]();
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = __Block_byref_object_copy_;
  long long v21 = __Block_byref_object_dispose_;
  id v22 = (id)0xAAAAAAAAAAAAAAAALL;
  id v22 = [MEMORY[0x263EFF9C0] set];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__TPModel__iterateOverPeersWithBlock_error___block_invoke;
  v13[3] = &unk_2640EC578;
  id v15 = &v23;
  id v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v12 = 0;
  [(TPModel *)self enumeratePeersUsingBlock:v13 error:&v12];
  id v10 = v12;
  if (!v10)
  {
    [(id)v24[5] minusSet:v18[5]];
    id v7 = (uint64_t *)(id)v24[5];
  }

  _Block_object_dispose(&v17, 8);
  if (v10)
  {
    id v7 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  _Block_object_dispose(&v23, 8);

  return v7;
}

void __44__TPModel__iterateOverPeersWithBlock_error___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 peerID];
  [*(id *)(*(void *)(a1[5] + 8) + 40) addObject:v3];
  id v4 = *(void **)(*(void *)(a1[6] + 8) + 40);
  id v5 = [v8 dynamicInfo];
  id v6 = [v5 excludedPeerIDs];
  if (v6)
  {
    [v4 unionSet:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263EFFA08] set];
    [v4 unionSet:v7];
  }
  (*(void (**)(void))(a1[4] + 16))();
}

- (unint64_t)voucherCountWithError:(id *)a3
{
  id v4 = [(TPModel *)self dbAdapter];
  unint64_t v5 = [v4 voucherCount:a3];

  return v5;
}

- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x210554CF0]();
  id v8 = [(TPModel *)self dbAdapter];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__TPModel_enumerateVouchersUsingBlock_error___block_invoke;
  v13[3] = &unk_2640EC550;
  id v9 = v6;
  id v14 = v9;
  id v12 = 0;
  [v8 enumerateVouchersUsingBlock:v13 error:&v12];
  id v10 = v12;

  if (a4 && v10) {
    *a4 = v10;
  }

  return v10 == 0;
}

void __45__TPModel_enumerateVouchersUsingBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x210554CF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x210554CF0]();
  id v8 = [(TPModel *)self dbAdapter];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __42__TPModel_enumeratePeersUsingBlock_error___block_invoke;
  v13[3] = &unk_2640EC528;
  id v9 = v6;
  id v14 = v9;
  id v12 = 0;
  [v8 enumeratePeersUsingBlock:v13 error:&v12];
  id v10 = v12;

  if (a4 && v10) {
    *a4 = v10;
  }

  return v10 == 0;
}

void __42__TPModel_enumeratePeersUsingBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void *)MEMORY[0x210554CF0]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasAnyPeersWithError:(id *)a3
{
  return [(TPModel *)self peerCountWithError:a3] != 0;
}

- (unint64_t)peerCountWithError:(id *)a3
{
  id v4 = [(TPModel *)self dbAdapter];
  unint64_t v5 = [v4 peerCount:a3];

  return v5;
}

- (id)allPeerIDs
{
  v2 = [(TPModel *)self dbAdapter];
  uint64_t v5 = 0;
  id v3 = [v2 allPeerIDs:&v5];

  return v3;
}

- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4
{
  id v6 = [(TPModel *)self dbAdapter];
  id v7 = [v6 policyWithVersion:a3 error:a4];

  return v7;
}

- (unint64_t)latestEpochAmongPeerIDs:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v21 = a4;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x210554CF0]();
        id v22 = 0;
        id v14 = [(TPModel *)self peerWithID:v12 error:&v22];
        id v15 = v22;
        if (v15)
        {
          id v18 = v15;
          uint64_t v19 = TPModelLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543618;
            uint64_t v28 = v12;
            __int16 v29 = 2114;
            id v30 = v18;
            _os_log_impl(&dword_20CB20000, v19, OS_LOG_TYPE_DEFAULT, "error determining epoch of peerID %{public}@: %{public}@", buf, 0x16u);
          }

          if (v21)
          {
            id v18 = v18;
            unint64_t v9 = 0;
            *long long v21 = v18;
          }
          else
          {
            unint64_t v9 = 0;
          }
          goto LABEL_20;
        }
        if (v14)
        {
          id v16 = [v14 permanentInfo];
          unint64_t v17 = [v16 epoch];

          if (v9 <= v17) {
            unint64_t v9 = v17;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  id v18 = 0;
LABEL_20:

  return v9;
}

- (TPModel)initWithDecrypter:(id)a3 dbAdapter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TPModel;
  unint64_t v9 = [(TPModel *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_suppressInitialInfoLogging = 0;
    objc_storeStrong((id *)&v9->_dbAdapter, a4);
    objc_storeStrong((id *)&v10->_decrypter, a3);
    id v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    custodianRecoveryKeys = v10->_custodianRecoveryKeys;
    v10->_custodianRecoveryKeys = v11;
  }
  return v10;
}

+ (id)pickClock:(id)a3
{
  id v3 = a3;
  [v3 sortUsingComparator:&__block_literal_global_128];
  id v4 = [v3 firstObject];
  uint64_t v5 = (void *)[v4 copy];

  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v6 = 1;
    while (1)
    {
      id v7 = [v3 objectAtIndexedSubscript:v6];
      unint64_t v8 = [v7 clock];
      if (v8 < [v5 clock]) {
        break;
      }
      uint64_t v9 = [v7 clock];
      if (v9 == [v5 clock])
      {
        int v10 = [v7 value];
        if (v10 != [v5 value])
        {
          [v5 setValue:1];
          break;
        }
      }

      if (++v6 >= (unint64_t)[v3 count]) {
        goto LABEL_10;
      }
    }
  }
LABEL_10:

  return v5;
}

uint64_t __21__TPModel_pickClock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 clock];
  if (v6 <= [v5 clock])
  {
    uint64_t v8 = [v4 clock];
    uint64_t v7 = v8 != [v5 clock];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)preapprovalsFromKeys:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
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
        int v10 = +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", 1, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end