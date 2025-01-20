@interface UARPiCloudManager
- (BOOL)fetchVerificationCertificateInContainer:(id)a3;
- (BOOL)handleRemoteFetchRequestForCHIPAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4;
- (BOOL)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:(id *)a3 productGroup:(id)a4 batchRequest:(BOOL)a5;
- (BOOL)processCHIPAccessoriesRecord:(id)a3;
- (BOOL)processCHIPAttestationCertificateRecord:(id)a3 subjectKeyIdentifier:(id)a4;
- (BOOL)validateCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5;
- (BOOL)validateSignatureForUARPAccessoryRecord:(id)a3 inContainer:(id)a4;
- (OS_os_log)log;
- (UARPiCloudContainer)container;
- (UARPiCloudManager)initWithDelegate:(id)a3 containerID:(id)a4;
- (UARPiCloudManagerDelegate)delegate;
- (__SecKey)copyPublicKeyForVerificationCertificateData:(id)a3 policy:(__SecPolicy *)a4;
- (__SecKey)copyPublicKeyFromCertificateID:(id)a3;
- (id)calculateDigestFromCHIPAccessoryCKRecord:(id)a3;
- (id)calculateDigestFromCHIPAttestationCertificateRecord:(id)a3;
- (id)calculateDigestFromUARPAccessoryRecord:(id)a3;
- (id)filterInterestedZonesInContainer:(id)a3 forAccessories:(id)a4;
- (int64_t)fetchRemoteDatabaseChangesInContainer:(id)a3 completion:(id)a4;
- (void)fetchZoneChangesInContainer:(id)a3 forAccessories:(id)a4;
- (void)handleRemoteFetchRequestForCHIPAttestationCertificates:(id)a3;
- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:(id *)a3 subjectKeyIdentifier:(id)a4;
- (void)performRemoteFetchForAccessories:(id)a3;
- (void)performRemoteFetchForAttestationCertificates:(id)a3;
- (void)performRemoteFetchForCHIPVerificationCertificateSync;
- (void)performRemoteFetchForSupportedAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4;
- (void)performRemoteFetchForSupportedAccessoriesMetadataInZone:(id)a3;
- (void)processCHIPAccessoriesRecords:(id)a3 isComplete:(BOOL)a4 productGroup:(id)a5;
- (void)processCHIPAttestationCertificateRecords:(id)a3 subjectKeyIdentifier:(id)a4;
- (void)processCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5;
- (void)processCKRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5;
- (void)processRecordsInContainer:(id)a3 forAccessory:(id)a4;
- (void)processUpdatedRecordsInContainer:(id)a3 forAccessories:(id)a4;
- (void)processVerificationCertificateRecord:(id)a3 forContainer:(id)a4;
- (void)qHandleRemoteFetchRequestForAccessories:(id)a3;
@end

@implementation UARPiCloudManager

- (BOOL)handleRemoteFetchRequestForCHIPAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)MEMORY[0x22A63FE10]();
  v8 = [(UARPiCloudManager *)self container];
  v9 = [v8 verificationCertificates];

  if (v9
    || (-[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync](self, "performRemoteFetchForCHIPVerificationCertificateSync"), -[UARPiCloudManager container](self, "container"), v10 = objc_claimAutoreleasedReturnValue(), [v10 verificationCertificates], v11 = objc_claimAutoreleasedReturnValue(), v11, v10, v11))
  {
    id v15 = 0;
    BOOL v12 = [(UARPiCloudManager *)self handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:&v15 productGroup:v6 batchRequest:v4];
    id v13 = v15;
    [(UARPiCloudManager *)self processCHIPAccessoriesRecords:v13 isComplete:v12 productGroup:v6];
  }
  else
  {
    LOBYTE(v12) = 1;
    [(UARPiCloudManager *)self processCHIPAccessoriesRecords:0 isComplete:1 productGroup:v6];
  }

  return v12;
}

- (BOOL)handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:(id *)a3 productGroup:(id)a4 batchRequest:(BOOL)a5
{
  BOOL v5 = a5;
  v47[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  v8 = [(UARPiCloudManager *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(UARPiCloudManager *)self container];
    v10 = [v9 containerID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_225D74000, v8, OS_LOG_TYPE_DEFAULT, "Fetching CHIPAccessories Record for Container:%@", (uint8_t *)&buf, 0xCu);
  }
  id v11 = objc_alloc(MEMORY[0x263EFD800]);
  BOOL v12 = (void *)[v11 initWithZoneName:@"chipAccessories" ownerName:*MEMORY[0x263EFD480]];
  id v13 = objc_alloc(MEMORY[0x263EFD6C0]);
  v47[0] = v12;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:1];
  id v15 = (void *)[v13 initWithRecordZoneIDs:v14 configurationsByRecordZoneID:0];

  [v15 setFetchAllChanges:!v5];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  if (v5)
  {
    v16 = [MEMORY[0x263EFF9A0] dictionary];
    id v17 = objc_alloc_init(MEMORY[0x263EFD6A8]);
    v18 = [(UARPiCloudManager *)self container];
    v19 = [v18 databaseChangeToken];
    [v17 setPreviousServerChangeToken:v19];

    [v16 setObject:v17 forKey:v12];
    [v15 setConfigurationsByRecordZoneID:v16];
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke;
  v35[3] = &unk_264777010;
  v35[4] = self;
  id v20 = v7;
  id v36 = v20;
  p_long long buf = &buf;
  [v15 setRecordChangedBlock:v35];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_14;
  v33[3] = &unk_264777038;
  BOOL v34 = v5;
  v33[4] = self;
  v33[5] = &v38;
  [v15 setRecordZoneFetchCompletionBlock:v33];
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_18;
  v31[3] = &unk_264777060;
  v31[4] = self;
  v22 = v21;
  v32 = v22;
  [v15 setFetchRecordZoneChangesCompletionBlock:v31];
  v23 = [(UARPiCloudManager *)self container];
  v24 = [v23 database];
  [v24 addOperation:v15];

  dispatch_time_t v25 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v22, v25))
  {
    v26 = [(UARPiCloudManager *)self log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]();
    }

    *a3 = 0;
    v27 = [(UARPiCloudManager *)self container];
    [v27 setDatabaseChangeToken:0];

    [v15 cancel];
    BOOL v28 = 1;
  }
  else
  {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
    BOOL v28 = *((unsigned char *)v39 + 24) != 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v38, 8);

  return v28;
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    id v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_225D74000, v4, OS_LOG_TYPE_DEFAULT, "%s: Record Changed: %@", (uint8_t *)&v19, 0x16u);
  }

  BOOL v5 = [v3 recordType];
  char v6 = [v5 isEqualToString:@"CHIPAccessory"];

  if (v6)
  {
    id v7 = [v3 recordID];
    v8 = [v7 recordName];
    v9 = [v8 componentsSeparatedByString:@"-"];
    v10 = [v9 firstObject];

    id v11 = *(void **)(a1 + 40);
    if (!v11 || [v11 isEqualToString:v10])
    {
      if ([*(id *)(a1 + 32) processCHIPAccessoriesRecord:v3])
      {
        BOOL v12 = [[CHIPAccessoriesRecord alloc] initWithCKRecord:v3];
        if (v12)
        {
          id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (!v13)
          {
            id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
            uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
            v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v14;

            id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
          [v13 addObject:v12];
        }
      }
      else
      {
        BOOL v12 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v3 recordID];
          v18 = [v17 recordName];
          int v19 = 136315394;
          id v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchReque"
                "st:]_block_invoke";
          __int16 v21 = 2112;
          id v22 = v18;
          _os_log_impl(&dword_225D74000, &v12->super, OS_LOG_TYPE_DEFAULT, "%s: Invalid CHIPAccessoryRecord: %@", (uint8_t *)&v19, 0x16u);
        }
      }
    }
  }
  else
  {
    v10 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      id v20 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v3;
      _os_log_impl(&dword_225D74000, v10, OS_LOG_TYPE_DEFAULT, "%s: Invalid Record type: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_14(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v12 = a6;
  id v13 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = "NO";
    int v17 = 136316162;
    v18 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    if (a5) {
      id v14 = "YES";
    }
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2080;
    v26 = v14;
    _os_log_impl(&dword_225D74000, v13, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed for recordZoneID: %@ changeToken:%@ error: %@ moreComing %s", (uint8_t *)&v17, 0x34u);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a5 ^ 1;
    if ((a5 ^ 1))
    {
      uint64_t v15 = [*(id *)(a1 + 32) container];
      [v15 setDatabaseChangeToken:0];
    }
    else
    {
      uint64_t v15 = (void *)[v11 copy];
      v16 = [*(id *)(a1 + 32) container];
      [v16 setDatabaseChangeToken:v15];
    }
  }
}

void __108__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata_productGroup_batchRequest___block_invoke_18(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    char v6 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAccessoriesMetadata:productGroup:batchRequest:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_225D74000, v4, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed with error: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)handleRemoteFetchRequestForCHIPAttestationCertificates:(id)a3
{
  id v4 = a3;
  int v5 = [(UARPiCloudManager *)self container];
  char v6 = [v5 verificationCertificates];

  if (v6
    || (-[UARPiCloudManager performRemoteFetchForCHIPVerificationCertificateSync](self, "performRemoteFetchForCHIPVerificationCertificateSync"), -[UARPiCloudManager container](self, "container"), __int16 v7 = objc_claimAutoreleasedReturnValue(), [v7 verificationCertificates], v8 = objc_claimAutoreleasedReturnValue(), v8, v7, v8))
  {
    id v10 = 0;
    [(UARPiCloudManager *)self handleRemoteFetchRequestSyncForCHIPAttestationCertificates:&v10 subjectKeyIdentifier:v4];
    id v9 = v10;
    [(UARPiCloudManager *)self processCHIPAttestationCertificateRecords:v9 subjectKeyIdentifier:v4];
  }
  else
  {
    [(UARPiCloudManager *)self processCHIPAttestationCertificateRecords:0 subjectKeyIdentifier:v4];
  }
}

- (void)handleRemoteFetchRequestSyncForCHIPAttestationCertificates:(id *)a3 subjectKeyIdentifier:(id)a4
{
  v32[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  __int16 v7 = [(UARPiCloudManager *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(UARPiCloudManager *)self container];
    id v9 = [v8 containerID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_225D74000, v7, OS_LOG_TYPE_DEFAULT, "Fetching CHIPAttestationCertificate Record for Container:%@", (uint8_t *)&buf, 0xCu);
  }
  id v10 = objc_alloc(MEMORY[0x263EFD800]);
  id v11 = (void *)[v10 initWithZoneName:@"chipAttestationCertificates" ownerName:*MEMORY[0x263EFD480]];
  id v12 = objc_alloc(MEMORY[0x263EFD6C0]);
  v32[0] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  id v14 = (void *)[v12 initWithRecordZoneIDs:v13 configurationsByRecordZoneID:0];

  [v14 setFetchAllChanges:1];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke;
  v24[3] = &unk_264777010;
  v24[4] = self;
  id v15 = v6;
  id v25 = v15;
  p_long long buf = &buf;
  [v14 setRecordChangedBlock:v24];
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke_24;
  v22[3] = &unk_264777060;
  v22[4] = self;
  int v17 = v16;
  __int16 v23 = v17;
  [v14 setFetchRecordZoneChangesCompletionBlock:v22];
  v18 = [(UARPiCloudManager *)self container];
  __int16 v19 = [v18 database];
  [v19 addOperation:v14];

  dispatch_time_t v20 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v17, v20))
  {
    __int16 v21 = [(UARPiCloudManager *)self log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]();
    }

    *a3 = 0;
    [v14 cancel];
  }
  else
  {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }

  _Block_object_dispose(&buf, 8);
}

void __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_225D74000, v4, OS_LOG_TYPE_DEFAULT, "%s: Record Changed :%@", (uint8_t *)&v14, 0x16u);
  }

  int v5 = *(void **)(a1 + 40);
  if (!v5
    || ([v3 recordID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 recordName],
        __int16 v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v5 isEqualToString:v7],
        v7,
        v6,
        v8))
  {
    id v9 = [[CHIPAttestationCertificateRecord alloc] initWithCKRecord:v3];
    if (v9)
    {
      id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      if (!v10)
      {
        id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        id v13 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v11;

        id v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      }
      [v10 addObject:v9];
    }
  }
}

void __107__UARPiCloudManager_CHIP__handleRemoteFetchRequestSyncForCHIPAttestationCertificates_subjectKeyIdentifier___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[UARPiCloudManager(CHIP) handleRemoteFetchRequestSyncForCHIPAttestationCertificates:subjectKeyIdentifier:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_225D74000, v4, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed with error: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)performRemoteFetchForCHIPVerificationCertificateSync
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(UARPiCloudManager *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(UARPiCloudManager *)self container];
    int v5 = [v4 containerID];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v28 = v5;
    _os_log_impl(&dword_225D74000, v3, OS_LOG_TYPE_DEFAULT, "Fetching CHIPVerificationCertificate Record for Container:%@", buf, 0xCu);
  }
  id v6 = objc_alloc(MEMORY[0x263EFD800]);
  __int16 v7 = (void *)[v6 initWithZoneName:@"certificates" ownerName:*MEMORY[0x263EFD480]];
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFD7E0]) initWithRecordName:@"certificates" zoneID:v7];
  id v9 = objc_alloc(MEMORY[0x263EFD6E0]);
  v26 = v8;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  id v11 = (void *)[v9 initWithRecordIDs:v10];

  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  __int16 v21 = __79__UARPiCloudManager_CHIP__performRemoteFetchForCHIPVerificationCertificateSync__block_invoke;
  id v22 = &unk_264777088;
  __int16 v23 = self;
  id v13 = v8;
  id v24 = v13;
  int v14 = v12;
  id v25 = v14;
  [v11 setFetchRecordsCompletionBlock:&v19];
  id v15 = [(UARPiCloudManager *)self container];
  __int16 v16 = [v15 database];
  [v16 addOperation:v11];

  dispatch_time_t v17 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    uint64_t v18 = [(UARPiCloudManager *)self log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) performRemoteFetchForCHIPVerificationCertificateSync]();
    }

    [v11 cancel];
  }
}

void __79__UARPiCloudManager_CHIP__performRemoteFetchForCHIPVerificationCertificateSync__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "-[UARPiCloudManager(CHIP) performRemoteFetchForCHIPVerificationCertificateSync]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_225D74000, v7, OS_LOG_TYPE_INFO, "%s: operationError = %@, recordsByRecordID: %@", (uint8_t *)&v10, 0x20u);
  }

  if (v5 && !v6)
  {
    id v8 = [v5 objectForKey:*(void *)(a1 + 40)];
    id v9 = [*(id *)(a1 + 32) container];
    [v9 processVerificationCertificateRecord:v8];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)processCHIPAccessoriesRecords:(id)a3 isComplete:(BOOL)a4 productGroup:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "accessoryMetadata", (void)v19);
          [v10 addObject:v16];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    dispatch_time_t v17 = [(UARPiCloudManager *)self delegate];
    [v17 remoteFetchCompletionForSupportedAccessories:v10 productGroup:v9 isComplete:v6 error:0];
  }
  else if (v6)
  {
    uint64_t v18 = [(UARPiCloudManager *)self delegate];
    [v18 remoteFetchCompletionForSupportedAccessories:0 productGroup:v9 isComplete:1 error:0];
  }
}

- (BOOL)processCHIPAccessoriesRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(UARPiCloudManager *)self calculateDigestFromCHIPAccessoryCKRecord:v4];
  uint64_t v6 = [v5 length];
  __int16 v7 = [(UARPiCloudManager *)self log];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v5;
      _os_log_impl(&dword_225D74000, v8, OS_LOG_TYPE_INFO, "CHIPAccessory record digest: %@", buf, 0xCu);
    }

    id v8 = [v4 objectForKey:@"signatureV2"];
    if (v8
      && (uint64_t v9 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0]) != 0)
    {
      CFDataRef v10 = (const __CFData *)v9;
      id v11 = [v4 objectForKey:@"verificationCertificateKey"];
      if (v11
        && (uint64_t v12 = [(UARPiCloudManager *)self copyPublicKeyFromCertificateID:v11]) != 0)
      {
        uint64_t v13 = v12;
        uint64_t v14 = [(UARPiCloudManager *)self log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v4 recordID];
          uint64_t v16 = [v15 recordName];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v27 = v16;
          _os_log_impl(&dword_225D74000, v14, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);
        }
        CFErrorRef error = 0;
        int v17 = SecKeyVerifySignature(v13, (SecKeyAlgorithm)*MEMORY[0x263F172A8], (CFDataRef)v5, v10, &error);
        BOOL v18 = v17 != 0;
        CFRelease(v13);
        long long v19 = [(UARPiCloudManager *)self log];
        long long v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            long long v21 = [v4 recordID];
            long long v22 = [v21 recordName];
            *(_DWORD *)long long buf = 138412290;
            uint64_t v27 = v22;
            _os_log_impl(&dword_225D74000, v20, OS_LOG_TYPE_DEFAULT, "Stonehenge Signature validation successful for CHIPAccessoryRecord %@", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:].cold.4(v4);
          }

          CFRelease(error);
        }
      }
      else
      {
        __int16 v23 = [(UARPiCloudManager *)self log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:](v4);
        }

        BOOL v18 = 0;
      }
    }
    else
    {
      CFDataRef v10 = [(UARPiCloudManager *)self log];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:](v4);
      }
      BOOL v18 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager(CHIP) processCHIPAccessoriesRecord:](v4);
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void)processCHIPAttestationCertificateRecords:(id)a3 subjectKeyIdentifier:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v35 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          if (v7)
          {
            uint64_t v15 = [*(id *)(*((void *)&v41 + 1) + 8 * i) recordName];
            int v16 = [v7 isEqualToString:v15];

            if (!v16) {
              continue;
            }
          }
          if ([(UARPiCloudManager *)self processCHIPAttestationCertificateRecord:v14 subjectKeyIdentifier:v7])
          {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v11);
    }
    BOOL v34 = self;

    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = v8;
    uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v38 != v20) {
            objc_enumerationMutation(obj);
          }
          long long v22 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          __int16 v23 = [v22 rootCertificate];
          uint64_t v24 = (void *)[v23 mutableCopy];

          uint64_t v25 = [v22 intermediateCertificates];
          if (v25)
          {
            v26 = (void *)v25;
            uint64_t v27 = [v22 intermediateCertificates];
            uint64_t v28 = [v27 length];

            if (v28)
            {
              uint64_t v29 = [v22 intermediateCertificates];
              [v24 appendFormat:@",%@", v29];
            }
          }
          v30 = [NSString stringWithString:v24];
          id v31 = [v22 recordName];
          [v17 setObject:v30 forKeyedSubscript:v31];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v19);
    }

    v32 = [(UARPiCloudManager *)v34 delegate];
    [v32 remoteFetchCompletionForAttestationCertificates:v17 subjectKeyIdentifier:v7 error:0];

    id v6 = v35;
  }
  else
  {
    v33 = [(UARPiCloudManager *)self delegate];
    [v33 remoteFetchCompletionForAttestationCertificates:0 subjectKeyIdentifier:v7 error:0];
  }
}

- (BOOL)processCHIPAttestationCertificateRecord:(id)a3 subjectKeyIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 verificationCertificateID];
  id v7 = [(UARPiCloudManager *)self copyPublicKeyFromCertificateID:v6];

  CFDataRef v8 = [(UARPiCloudManager *)self calculateDigestFromCHIPAttestationCertificateRecord:v5];
  id v9 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v10 = [v5 signature];
  CFDataRef v11 = (const __CFData *)[v9 initWithBase64EncodedString:v10 options:0];

  if (v7)
  {
    BOOL v12 = 0;
    if ([(__CFData *)v8 length] && v11)
    {
      uint64_t v13 = [(UARPiCloudManager *)self log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = [v5 ckRecord];
        uint64_t v15 = [v14 recordID];
        int v16 = [v15 recordName];
        *(_DWORD *)long long buf = 138412290;
        uint64_t v24 = v16;
        _os_log_impl(&dword_225D74000, v13, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);
      }
      CFErrorRef error = 0;
      int v17 = SecKeyVerifySignature(v7, (SecKeyAlgorithm)*MEMORY[0x263F172A8], v8, v11, &error);
      BOOL v12 = v17 != 0;
      CFRelease(v7);
      uint64_t v18 = [(UARPiCloudManager *)self log];
      uint64_t v19 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v5 ckRecord];
          *(_DWORD *)long long buf = 138412290;
          uint64_t v24 = v20;
          _os_log_impl(&dword_225D74000, v19, OS_LOG_TYPE_DEFAULT, "Signature validation successful CHIPAttestationCertificateRecord %@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[UARPiCloudManager(CHIP) processCHIPAttestationCertificateRecord:subjectKeyIdentifier:](v5);
        }

        CFRelease(error);
      }
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)calculateDigestFromCHIPAccessoryCKRecord:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  id v4 = [v3 recordID];
  id v5 = [v4 recordName];
  id v6 = [v5 componentsSeparatedByString:@"-"];

  id v7 = 0;
  if ([v6 count] == 2)
  {
    uint64_t v28 = v6;
    CFDataRef v8 = [v6 lastObject];
    id v9 = [v3 allKeys];
    uint64_t v10 = [v9 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v12)
    {
      unint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v33;
      uint64_t v16 = *MEMORY[0x263F38350];
      int v17 = @"verificationCertificateKey";
      v30 = v8;
      uint64_t v18 = *(void *)v33;
      id v29 = v3;
      while (1)
      {
        if (v18 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void **)(*((void *)&v32 + 1) + 8 * v14);
        if ([v19 isEqualToString:@"accessoryCategoryNumber"])
        {
          if (([v8 isEqualToString:v16] & 1) == 0) {
            break;
          }
        }
        if (([v19 isEqualToString:v17] & 1) == 0
          && ([v19 isEqualToString:@"signature"] & 1) == 0
          && ([v19 isEqualToString:@"signatureV2"] & 1) == 0
          && ([v19 isEqualToString:@"accessoryProductLabel"] & 1) == 0)
        {
          uint64_t v20 = [v3 objectForKey:v19];
          id v21 = [v20 dataUsingEncoding:4];
          long long v22 = v17;
          uint64_t v23 = [v21 bytes];
          CC_LONG v24 = [v21 length];
          uint64_t v25 = (const void *)v23;
          int v17 = v22;
          CC_SHA256_Update(&c, v25, v24);

          id v3 = v29;
          CFDataRef v8 = v30;
LABEL_14:
        }
        if (++v14 >= v13)
        {
          uint64_t v26 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (!v26) {
            goto LABEL_19;
          }
          unint64_t v13 = v26;
          uint64_t v14 = 0;
        }
        uint64_t v18 = *(void *)v33;
      }
      uint64_t v20 = [v3 objectForKey:@"accessoryCategoryNumber"];
      unint64_t data = 0;
      unint64_t data = bswap64([v20 unsignedLongLongValue]);
      CC_SHA256_Update(&c, &data, 8u);
      goto LABEL_14;
    }
LABEL_19:

    id v7 = [MEMORY[0x263EFF990] dataWithLength:32];
    CC_SHA256_Final((unsigned __int8 *)[v7 mutableBytes], &c);

    id v6 = v28;
  }

  return v7;
}

- (id)calculateDigestFromCHIPAttestationCertificateRecord:(id)a3
{
  id v3 = a3;
  memset(&v14, 0, sizeof(v14));
  CC_SHA256_Init(&v14);
  id v4 = [v3 rootCertificate];
  id v5 = [v4 dataUsingEncoding:4];
  CC_SHA256_Update(&v14, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  id v6 = [v3 intermediateCertificates];
  id v7 = v6;
  if (v6)
  {
    CFDataRef v8 = [v6 dataUsingEncoding:4];

    id v5 = v8;
    CC_SHA256_Update(&v14, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
  }
  id v9 = [v3 recordStatus];
  uint64_t v10 = [v9 dataUsingEncoding:4];

  id v11 = v10;
  CC_SHA256_Update(&v14, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  id v12 = [MEMORY[0x263EFF990] dataWithLength:32];
  CC_SHA256_Final((unsigned __int8 *)[v12 mutableBytes], &v14);

  return v12;
}

- (__SecKey)copyPublicKeyFromCertificateID:(id)a3
{
  id v4 = a3;
  id v5 = [(UARPiCloudManager *)self container];
  id v6 = [v5 verificationCertificates];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    CFDataRef v8 = [v7 dataUsingEncoding:4];
    uint64_t AppleCHIPUpdateSigning = SecPolicyCreateAppleCHIPUpdateSigning();
    if (AppleCHIPUpdateSigning)
    {
      uint64_t v10 = (const void *)AppleCHIPUpdateSigning;
      id v11 = [(UARPiCloudManager *)self copyPublicKeyForVerificationCertificateData:v8 policy:AppleCHIPUpdateSigning];
      CFRelease(v10);
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)processCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [[CHIPAccessoryFirmwareRecord alloc] initWithCKRecord:v10];

  LODWORD(v10) = [v9 signatureValidationNeeded];
  id v12 = [(UARPiCloudManager *)self log];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v13)
    {
      uint64_t v15 = [(CHIPAccessoryFirmwareRecord *)v11 recordName];
      int v17 = 136315394;
      uint64_t v18 = "-[UARPiCloudManager(CHIP) processCHIPFirmwareRecord:inContainer:forAccessory:]";
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_225D74000, v12, OS_LOG_TYPE_DEFAULT, "%s: Bypassing signature validation on Record %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_9;
  }
  if (v13)
  {
    CC_SHA256_CTX v14 = [(CHIPAccessoryFirmwareRecord *)v11 recordName];
    int v17 = 136315394;
    uint64_t v18 = "-[UARPiCloudManager(CHIP) processCHIPFirmwareRecord:inContainer:forAccessory:]";
    __int16 v19 = 2112;
    uint64_t v20 = v14;
    _os_log_impl(&dword_225D74000, v12, OS_LOG_TYPE_DEFAULT, "%s: Validating signature on Record %@", (uint8_t *)&v17, 0x16u);
  }
  if ([(UARPiCloudManager *)self validateCHIPFirmwareRecord:v11 inContainer:v8 forAccessory:v9])
  {
LABEL_9:
    [v9 setChipFirmwareRecord:v11];
  }
  uint64_t v16 = [(UARPiCloudManager *)self delegate];
  [v16 remoteFetchCompletion:v9 error:0];
}

- (BOOL)validateCHIPFirmwareRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 verificationCertificateID];
  id v8 = [(UARPiCloudManager *)self copyPublicKeyFromCertificateID:v7];

  if (v8)
  {
    CFDataRef v9 = [v6 digest];
    if ([(__CFData *)v9 length])
    {
      id v10 = [(UARPiCloudManager *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)cf = 138412290;
        *(void *)&cf[4] = v9;
        _os_log_impl(&dword_225D74000, v10, OS_LOG_TYPE_INFO, "CHIPAccessoryFirmware record digest: %@", cf, 0xCu);
      }

      id v11 = objc_alloc(MEMORY[0x263EFF8F8]);
      id v12 = [v6 signature];
      CFDataRef v13 = (const __CFData *)[v11 initWithBase64EncodedString:v12 options:0];

      if (v13)
      {
        CC_SHA256_CTX v14 = [(UARPiCloudManager *)self log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v6 recordName];
          *(_DWORD *)cf = 138412290;
          *(void *)&cf[4] = v15;
          _os_log_impl(&dword_225D74000, v14, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", cf, 0xCu);
        }
        *(void *)cf = 0;
        int v16 = SecKeyVerifySignature(v8, (SecKeyAlgorithm)*MEMORY[0x263F172A8], v9, v13, (CFErrorRef *)cf);
        BOOL v17 = v16 != 0;
        CFRelease(v8);
        if (!v16)
        {
          uint64_t v18 = [(UARPiCloudManager *)self log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            -[UARPiCloudManager(CHIP) validateCHIPFirmwareRecord:inContainer:forAccessory:](v6);
          }

          CFRelease(*(CFTypeRef *)cf);
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (UARPiCloudManager)initWithDelegate:(id)a3 containerID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UARPiCloudManager;
  CFDataRef v9 = [(UARPiCloudManager *)&v17 init];
  if (!dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 16))
  {
    container = v9;
    CFDataRef v9 = 0;
    goto LABEL_5;
  }
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_delegate, a3);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.UARPiCloudManager.recordProcessingQueue", 0);
    recordProcessingQueue = v9->_recordProcessingQueue;
    v9->_recordProcessingQueue = (OS_dispatch_queue *)v12;

    CC_SHA256_CTX v14 = [[UARPiCloudContainer alloc] initWithContainerID:v8];
    container = v9->_container;
    v9->_container = v14;
LABEL_5:
  }
  return v9;
}

- (void)performRemoteFetchForAccessories:(id)a3
{
  id v4 = a3;
  recordProcessingQueue = self->_recordProcessingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__UARPiCloudManager_performRemoteFetchForAccessories___block_invoke;
  v7[3] = &unk_264777150;
  id v8 = v4;
  CFDataRef v9 = self;
  id v6 = v4;
  dispatch_async(recordProcessingQueue, v7);
}

uint64_t __54__UARPiCloudManager_performRemoteFetchForAccessories___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    return [v3 qHandleRemoteFetchRequestForAccessories:v4];
  }
  return result;
}

- (void)qHandleRemoteFetchRequestForAccessories:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_container = (uint64_t *)&self->_container;
  if ([(UARPiCloudManager *)self fetchVerificationCertificateInContainer:self->_container])
  {
    container = self->_container;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __61__UARPiCloudManager_qHandleRemoteFetchRequestForAccessories___block_invoke;
    v13[3] = &unk_264777060;
    v13[4] = self;
    id v14 = v4;
    [(UARPiCloudManager *)self fetchRemoteDatabaseChangesInContainer:container completion:v13];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          [(UARPiCloudManagerDelegate *)self->_delegate remoteFetchCompletion:*(void *)(*((void *)&v15 + 1) + 8 * v11++) error:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:](p_container, log);
    }
  }
}

void __61__UARPiCloudManager_qHandleRemoteFetchRequestForAccessories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
    id v6 = v4;
    id v7 = [v5 updatedZones];
    *(_DWORD *)long long buf = 136315650;
    uint64_t v23 = "-[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:]_block_invoke";
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_225D74000, v6, OS_LOG_TYPE_INFO, "%s: container.updatedZones: %@ error: %@", buf, 0x20u);
  }
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) updatedZones];
  uint64_t v9 = [v8 count];
  if (v3) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  int v11 = !v10;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        if ((v11 & 1) == 0) {
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "remoteFetchCompletion:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), v3, (void)v17);
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  if (v11) {
    [*(id *)(a1 + 32) fetchZoneChangesInContainer:*(void *)(*(void *)(a1 + 32) + 16) forAccessories:*(void *)(a1 + 40)];
  }
}

- (int64_t)fetchRemoteDatabaseChangesInContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFD690]) initWithPreviousServerChangeToken:0];
  [v8 setFetchAllChanges:1];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke;
  v17[3] = &unk_2647771F0;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  [v8 setRecordZoneWithIDChangedBlock:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_274;
  v14[3] = &unk_264777240;
  v14[4] = self;
  id v15 = v9;
  id v16 = v7;
  id v10 = v7;
  id v11 = v9;
  [v8 setFetchDatabaseChangesCompletionBlock:v14];
  id v12 = [v11 database];
  [v12 addOperation:v8];

  return 0;
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2;
  block[3] = &unk_264777128;
  block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v9 = 136315394;
    id v10 = "-[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_INFO, "%s: Zone with ID %@ changed", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v4 = [UARPiCloudZone alloc];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) containerID];
  id v7 = [(UARPiCloudZone *)v4 initWithZoneID:v5 containerID:v6];

  id v8 = [*(id *)(a1 + 48) updatedZones];
  [v8 addObject:v7];
}

void __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_274(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2_275;
  v13[3] = &unk_264777218;
  v13[4] = v9;
  id v14 = v7;
  char v18 = a3;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v13);
}

uint64_t __70__UARPiCloudManager_fetchRemoteDatabaseChangesInContainer_completion___block_invoke_2_275(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 136315906;
    uint64_t v9 = "-[UARPiCloudManager fetchRemoteDatabaseChangesInContainer:completion:]_block_invoke_2";
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_INFO, "%s: Fetch database changes operation completed with token: %@ moreComing: %d error: %@", (uint8_t *)&v8, 0x26u);
  }
  if (!*(void *)(a1 + 48))
  {
    id v6 = (void *)[*(id *)(a1 + 40) copy];
    [*(id *)(a1 + 56) setDatabaseChangeToken:v6];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)fetchZoneChangesInContainer:(id)a3 forAccessories:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  __int16 v10 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"zoneName" ascending:1];
  uint64_t v11 = [v6 updatedZones];
  if ([v11 count])
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke;
    v28[3] = &unk_264777268;
    id v12 = v6;
    id v29 = v12;
    id v30 = v8;
    id v13 = v9;
    id v31 = v13;
    [v11 enumerateObjectsUsingBlock:v28];
    long long v32 = v10;
    __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    uint64_t v15 = [v13 sortedArrayUsingDescriptors:v14];

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFD6C0]) initWithRecordZoneIDs:v15 configurationsByRecordZoneID:0];
    [v16 setFetchAllChanges:1];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2;
    v26[3] = &unk_264777290;
    v26[4] = self;
    id v17 = v12;
    id v27 = v17;
    [v16 setRecordChangedBlock:v26];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_291;
    v24[3] = &unk_264777308;
    v24[4] = self;
    id v25 = v11;
    [v16 setRecordZoneFetchCompletionBlock:v24];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_295;
    v21[3] = &unk_264777358;
    v21[4] = self;
    id v18 = v17;
    id v22 = v18;
    id v23 = v7;
    [v16 setFetchRecordZoneChangesCompletionBlock:v21];
    long long v19 = [v18 database];
    [v19 addOperation:v16];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      long long v34 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]";
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_INFO, "%s: No updates available for accessories %@", buf, 0x16u);
    }
  }
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc_init(MEMORY[0x263EFD6A8]);
  uint64_t v4 = [*(id *)(a1 + 32) containerID];
  int v5 = [v4 containsString:@"com.apple.chip"];

  if (v5)
  {
    [v3 setPreviousServerChangeToken:0];
  }
  else
  {
    id v6 = [v11 changeToken];
    [v3 setPreviousServerChangeToken:v6];
  }
  id v7 = *(void **)(a1 + 40);
  int v8 = [v11 zoneID];
  [v7 setObject:v3 forKey:v8];

  uint64_t v9 = *(void **)(a1 + 48);
  __int16 v10 = [v11 zoneID];
  [v9 addObject:v10];
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3;
  block[3] = &unk_264777128;
  block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_3";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_INFO, "%s: Record changed: %@", (uint8_t *)&v5, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 48) updatedRecords];
  [v4 addObject:*(void *)(a1 + 40)];
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_291(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(NSObject **)(v12 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_292;
  block[3] = &unk_2647772E0;
  block[4] = v12;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v21 = *(id *)(a1 + 40);
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v13, block);
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_292(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)long long buf = 136315906;
    id v11 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_2";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed for recordZoneID: %@ changeToken:%@ error: %@", buf, 0x2Au);
  }
  id v6 = *(void **)(a1 + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_293;
  v7[3] = &unk_2647772B8;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v6 enumerateObjectsUsingBlock:v7];
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_293(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v5 = [v10 zoneID];
  id v6 = [v5 zoneName];
  __int16 v7 = [*(id *)(a1 + 32) zoneName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = (void *)[*(id *)(a1 + 40) copy];
    [v10 setChangeToken:v9];

    *a3 = 1;
  }
}

void __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_2_295(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3_296;
  v7[3] = &unk_264777330;
  void v7[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __64__UARPiCloudManager_fetchZoneChangesInContainer_forAccessories___block_invoke_3_296(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136315394;
    id v6 = "-[UARPiCloudManager fetchZoneChangesInContainer:forAccessories:]_block_invoke_3";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_INFO, "%s: Record Zone Fetch completed for all zones with error: %@", (uint8_t *)&v5, 0x16u);
  }
  return [*(id *)(a1 + 32) processUpdatedRecordsInContainer:*(void *)(a1 + 48) forAccessories:*(void *)(a1 + 56)];
}

- (void)processUpdatedRecordsInContainer:(id)a3 forAccessories:(id)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v52 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = log;
    uint64_t v9 = [v6 containerID];
    id v10 = [v6 updatedRecords];
    *(_DWORD *)long long buf = 136315650;
    v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
    __int16 v78 = 2112;
    v79 = v9;
    __int16 v80 = 2112;
    v81 = v10;
    _os_log_impl(&dword_225D74000, v8, OS_LOG_TYPE_INFO, "%s: Updated Records in Container %@: %@", buf, 0x20u);
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = [v6 updatedRecords];
  uint64_t v11 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  v58 = v6;
  v59 = self;
  if (!v11)
  {
    uint64_t v13 = 0;
    __int16 v14 = 0;
    goto LABEL_45;
  }
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  __int16 v14 = 0;
  uint64_t v57 = *(void *)v70;
  do
  {
    uint64_t v15 = 0;
    uint64_t v54 = v12;
    do
    {
      if (*(void *)v70 != v57) {
        objc_enumerationMutation(obj);
      }
      __int16 v16 = *(void **)(*((void *)&v69 + 1) + 8 * v15);
      uint64_t v17 = self->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
        __int16 v78 = 2112;
        v79 = v16;
        _os_log_impl(&dword_225D74000, v17, OS_LOG_TYPE_INFO, "%s: Processing Record %@", buf, 0x16u);
      }
      uint64_t v18 = [v16 recordType];
      if ([v18 isEqualToString:@"UARPAccessory"])
      {
      }
      else
      {
        [v16 recordType];
        id v20 = v19 = v15;
        int v21 = [v20 isEqualToString:@"CHIPAccessoryFirmware"];

        uint64_t v15 = v19;
        if (!v21)
        {
          long long v40 = self->_log;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            long long v41 = v40;
            long long v42 = [v16 recordType];
            *(_DWORD *)long long buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            __int16 v78 = 2112;
            v79 = v42;
            _os_log_impl(&dword_225D74000, v41, OS_LOG_TYPE_INFO, "%s: Unexpected RecordType %@, discarding", buf, 0x16u);
          }
          goto LABEL_41;
        }
      }
      id v22 = [v16 objectForKey:@"recordStatus"];
      if ([v22 isEqualToString:@"1"])
      {
        v56 = v22;
        id v23 = [v16 recordID];
        __int16 v24 = [v23 recordName];
        id v25 = [v24 componentsSeparatedByString:@"-"];
        uint64_t v26 = [v25 firstObject];

        if (v26)
        {
          v60 = v16;
          id v27 = [v16 recordID];
          uint64_t v28 = [v27 zoneID];
          uint64_t v29 = [v28 zoneName];

          if (v29)
          {
            uint64_t v53 = v15;
            long long v67 = 0u;
            long long v68 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            id v30 = v52;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
            if (!v31) {
              goto LABEL_27;
            }
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v66;
            while (1)
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v66 != v33) {
                  objc_enumerationMutation(v30);
                }
                __int16 v35 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                id v36 = [v35 productNumber];
                if ([v36 isEqualToString:v26])
                {
                  uint64_t v37 = [v35 productGroup];
                  int v38 = [v37 isEqualToString:v29];

                  if (!v38) {
                    continue;
                  }
                  id v36 = [v35 availableRecords];
                  [v36 addObject:v60];
                }
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v65 objects:v74 count:16];
              if (!v32)
              {
LABEL_27:

                self = v59;
                uint64_t v15 = v53;
                uint64_t v12 = v54;
                goto LABEL_36;
              }
            }
          }
          long long v44 = self->_log;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            __int16 v78 = 2112;
            v79 = v60;
            _os_log_impl(&dword_225D74000, v44, OS_LOG_TYPE_INFO, "%s: Unexpected format for zoneName for CKRecord %@, discarding", buf, 0x16u);
          }
          uint64_t v29 = 0;
          uint64_t v12 = v54;
        }
        else
        {
          long long v43 = self->_log;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315394;
            v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
            __int16 v78 = 2112;
            v79 = v16;
            _os_log_impl(&dword_225D74000, v43, OS_LOG_TYPE_INFO, "%s: Unexpected format for RecordName for CKRecord %@, discarding", buf, 0x16u);
          }
          uint64_t v26 = 0;
          uint64_t v29 = (uint64_t)v13;
          uint64_t v12 = v54;
LABEL_36:
          id v22 = v56;
        }
      }
      else
      {
        long long v39 = self->_log;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
          __int16 v78 = 2112;
          v79 = v16;
          _os_log_impl(&dword_225D74000, v39, OS_LOG_TYPE_DEFAULT, "%s: Discarding Inactive Record %@", buf, 0x16u);
        }
        uint64_t v29 = (uint64_t)v13;
        uint64_t v26 = (uint64_t)v14;
      }

      uint64_t v13 = (void *)v29;
      __int16 v14 = (void *)v26;
LABEL_41:
      ++v15;
    }
    while (v15 != v12);
    uint64_t v12 = [obj countByEnumeratingWithState:&v69 objects:v75 count:16];
  }
  while (v12);
LABEL_45:

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v45 = v52;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v62;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v62 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v61 + 1) + 8 * j);
        v51 = self->_log;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          v77 = "-[UARPiCloudManager processUpdatedRecordsInContainer:forAccessories:]";
          __int16 v78 = 2112;
          v79 = v50;
          _os_log_impl(&dword_225D74000, v51, OS_LOG_TYPE_INFO, "%s: Processing accessory %@", buf, 0x16u);
        }
        self = v59;
        [(UARPiCloudManager *)v59 processRecordsInContainer:v58 forAccessory:v50];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v61 objects:v73 count:16];
    }
    while (v47);
  }
}

- (void)processRecordsInContainer:(id)a3 forAccessory:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v6 = a4;
  __int16 v7 = [v6 availableRecords];
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_5;
  }
  uint64_t v9 = [v6 availableRecords];
  if ([v9 count] != 1)
  {

LABEL_7:
    __int16 v14 = NSNumber;
    uint64_t v15 = objc_msgSend(v6, "firmwareVersion", self);
    id v36 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));

    *(void *)long long buf = 0;
    *(void *)&buf[8] = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v6;
    obuint64_t j = [v6 availableRecords];
    uint64_t v16 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v37 = 0;
      uint64_t v13 = @"firmwareVersion";
      uint64_t v19 = &unk_26D9832A0;
      uint64_t v20 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if ([v38 isCHIPContainer])
          {
            id v23 = v19;
            __int16 v24 = [v22 objectForKey:@"firmwareVersionNumber"];
            id v25 = [v22 objectForKey:@"minFirmwareVersionNumber"];
            uint64_t v26 = [v22 objectForKey:@"maxFirmwareVersionNumber"];
            if ((!v25
               || ([v25 isEqualToNumber:v24] & 1) != 0
               || [v36 compare:v25] != -1)
              && (!v26
               || ([v26 isEqualToNumber:v24] & 1) != 0
               || [v36 compare:v26] != 1)
              && [v24 compare:v36] == 1
              && [v24 compare:v19] == 1)
            {
              id v23 = v24;

              id v27 = v22;
              uint64_t v37 = v27;
            }

            uint64_t v13 = @"firmwareVersionString";
            uint64_t v19 = v23;
          }
          else
          {
            uint64_t v28 = [v22 objectForKey:v13];

            long long v39 = 0uLL;
            [MEMORY[0x263F38330] versionFromString:v28 version:&v39];
            if (uarpVersionCompare(buf, &v39) == 1)
            {
              *(_OWORD *)long long buf = v39;
              id v29 = v22;

              uint64_t v37 = v29;
            }
            uint64_t v18 = (void *)v28;
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v37 = 0;
      uint64_t v13 = @"firmwareVersion";
      uint64_t v19 = &unk_26D9832A0;
    }

    self = v33;
    id v6 = v34;
    uint64_t v12 = v37;
    if (!v37) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
  char v10 = [v38 isCHIPContainer];

  if (v10) {
    goto LABEL_7;
  }
  uint64_t v11 = [v6 availableRecords];
  uint64_t v12 = [v11 firstObject];

  uint64_t v13 = @"firmwareVersion";
  if (!v12)
  {
LABEL_5:
    [(UARPiCloudManagerDelegate *)self->_delegate remoteFetchCompletion:v6 error:0];
    goto LABEL_34;
  }
LABEL_31:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uint64_t v31 = log;
    uint64_t v32 = [v12 objectForKey:v13];
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[UARPiCloudManager processRecordsInContainer:forAccessory:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    __int16 v45 = 2112;
    id v46 = v6;
    _os_log_impl(&dword_225D74000, v31, OS_LOG_TYPE_INFO, "%s: Greatest Firmware Version %@ available on iCloud for accessory: %@", buf, 0x20u);
  }
  [(UARPiCloudManager *)self processCKRecord:v12 inContainer:v38 forAccessory:v6];

LABEL_34:
}

- (void)processCKRecord:(id)a3 inContainer:(id)a4 forAccessory:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isCHIPContainer])
  {
    uint64_t v11 = [[UARPiCloudAccessoryRecord alloc] initWithCKRecord:v8];
    uint64_t v12 = v11;
    if (!v11) {
      goto LABEL_19;
    }
    uint64_t v13 = [(UARPiCloudAccessoryRecord *)v11 recordStatus];
    uint64_t v14 = [v13 compare:@"1" options:1];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = log;
      uint64_t v17 = [(UARPiCloudAccessoryRecord *)v12 recordName];
      uint64_t v18 = [(UARPiCloudAccessoryRecord *)v12 recordStatus];
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      __int16 v38 = 2112;
      long long v39 = v18;
      _os_log_impl(&dword_225D74000, v16, OS_LOG_TYPE_INFO, "%s: Record %@ Active Status: %@", buf, 0x20u);
    }
    if (v14) {
      goto LABEL_19;
    }
    uint64_t v19 = [v10 firmwareVersion];

    if (v19)
    {
      uint64_t v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = v20;
        id v22 = [(UARPiCloudAccessoryRecord *)v12 recordName];
        id v23 = [(UARPiCloudAccessoryRecord *)v12 firmwareVersion];
        __int16 v24 = [v10 firmwareVersion];
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        __int16 v38 = 2112;
        long long v39 = v23;
        __int16 v40 = 2112;
        long long v41 = v24;
        _os_log_impl(&dword_225D74000, v21, OS_LOG_TYPE_INFO, "%s: Comparing Record %@ Firmware Version %@ with %@ on accessory", buf, 0x2Au);
      }
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
      id v25 = (void *)MEMORY[0x263F38330];
      uint64_t v26 = [v10 firmwareVersion];
      [v25 versionFromString:v26 version:buf];

      id v27 = (void *)MEMORY[0x263F38330];
      uint64_t v28 = [(UARPiCloudAccessoryRecord *)v12 firmwareVersion];
      [v27 versionFromString:v28 version:&v36];

      if (uarpVersionCompare(buf, &v36) != 1) {
        goto LABEL_19;
      }
    }
    int v29 = [v10 signatureValidationNeeded];
    id v30 = self->_log;
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        uint64_t v32 = v30;
        uint64_t v33 = [(UARPiCloudAccessoryRecord *)v12 recordName];
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        _os_log_impl(&dword_225D74000, v32, OS_LOG_TYPE_INFO, "%s: Validating signature on Record %@", buf, 0x16u);
      }
      if (![(UARPiCloudManager *)self validateSignatureForUARPAccessoryRecord:v12 inContainer:v9])goto LABEL_19; {
    }
      }
    else if (v31)
    {
      id v34 = v30;
      __int16 v35 = [(UARPiCloudAccessoryRecord *)v12 recordName];
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[UARPiCloudManager processCKRecord:inContainer:forAccessory:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v35;
      _os_log_impl(&dword_225D74000, v34, OS_LOG_TYPE_INFO, "%s: Bypassing signature validation on Record %@", buf, 0x16u);
    }
    [v10 setRecord:v12];
LABEL_19:
    [(UARPiCloudManagerDelegate *)self->_delegate remoteFetchCompletion:v10 error:0];

    goto LABEL_20;
  }
  [(UARPiCloudManager *)self processCHIPFirmwareRecord:v8 inContainer:v9 forAccessory:v10];
LABEL_20:
}

- (void)processVerificationCertificateRecord:(id)a3 forContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"certificate"];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 assetContent];
    id v35 = v6;
    if (!v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudManager processVerificationCertificateRecord:forContainer:](log, v9);
      }
      uint64_t v12 = 0;
      AppleAccessoryUpdateSigning = 0;
      goto LABEL_15;
    }
    AppleAccessoryUpdateSigning = (const void *)SecPolicyCreateAppleAccessoryUpdateSigning();
    if (!AppleAccessoryUpdateSigning)
    {
      uint64_t v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      uint64_t v12 = 0;
      goto LABEL_14;
    }
    uint64_t v12 = [(UARPiCloudManager *)self copyPublicKeyForVerificationCertificateData:v10 policy:AppleAccessoryUpdateSigning];
    if (v12)
    {
LABEL_14:
      objc_msgSend(v7, "setVerificationCertificate:", v10, v6);
LABEL_15:
      objc_msgSend(v7, "setPublicKey:", v12, v35);
      id v22 = [MEMORY[0x263F08850] defaultManager];
      id v23 = [v9 fileURL];
      id v37 = 0;
      char v24 = [v22 removeItemAtURL:v23 error:&v37];
      id v25 = v37;

      if ((v24 & 1) == 0)
      {
        uint64_t v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[UARPiCloudManager processVerificationCertificateRecord:forContainer:](v26, v9, (uint64_t)v25);
        }
      }

      if (AppleAccessoryUpdateSigning) {
        CFRelease(AppleAccessoryUpdateSigning);
      }
      id v6 = v36;
      if (v12) {
        CFRelease(v12);
      }
      goto LABEL_22;
    }
    id v27 = self->_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager processVerificationCertificateRecord:forContainer:].cold.5(v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager processVerificationCertificateRecord:forContainer:]();
    }
    [v7 setPublicKey:0];
    id v10 = 0;
  }
LABEL_22:
}

- (__SecKey)copyPublicKeyForVerificationCertificateData:(id)a3 policy:(__SecPolicy *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(UARPiCloudContainer *)self->_container requiresPrefForSigningBeta])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "Setting Security Pref AllowAccessoryUpdateSigningBeta", buf, 2u);
    }
    CFPreferencesSetAppValue(@"AllowAccessoryUpdateSigningBeta", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.security");
  }
  char v24 = v5;
  id v7 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  id v8 = [v7 componentsSeparatedByString:@","];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        CFDataRef v15 = (const __CFData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:*(void *)(*((void *)&v28 + 1) + 8 * i) options:0];
        SecCertificateRef v16 = SecCertificateCreateWithData(0, v15);
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v12);
  }

  SecTrustRef trust = 0;
  OSStatus v17 = SecTrustCreateWithCertificates(v9, a4, &trust);
  if (trust)
  {
    CFErrorRef error = 0;
    BOOL v18 = SecTrustEvaluateWithError(trust, &error);
    uint64_t v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      BOOL v33 = v18;
      __int16 v34 = 2112;
      CFErrorRef v35 = error;
      _os_log_impl(&dword_225D74000, v19, OS_LOG_TYPE_DEFAULT, "Certificate is trusted: %d trustErrorRef %@", buf, 0x12u);
    }
    CertificateAtIndex = SecTrustGetCertificateAtIndex(trust, 0);
    uint64_t v21 = SecCertificateCopyKey(CertificateAtIndex);
    CFRelease(trust);
  }
  else
  {
    id v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager copyPublicKeyForVerificationCertificateData:policy:](v17, v22);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)filterInterestedZonesInContainer:(id)a3 forAccessories:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v28 = a4;
  id v6 = [MEMORY[0x263EFF9C0] set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v26 = v5;
  obuint64_t j = [v5 updatedZones];
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v37;
    uint64_t v27 = *(void *)v37;
    do
    {
      uint64_t v10 = 0;
      uint64_t v29 = v8;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        uint64_t v12 = [v11 zoneID];
        uint64_t v13 = [v12 zoneName];
        int v14 = [v13 isEqualToString:@"certificates"];

        if (v14)
        {
          [v6 addObject:v11];
        }
        else
        {
          uint64_t v31 = v10;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v15 = v28;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v33 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                uint64_t v21 = [v11 zoneID];
                id v22 = [v21 zoneName];
                id v23 = [v20 productGroup];
                int v24 = [v22 isEqualToString:v23];

                if (v24) {
                  [v6 addObject:v11];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v17);
          }

          uint64_t v9 = v27;
          uint64_t v8 = v29;
          uint64_t v10 = v31;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  return v6;
}

- (BOOL)validateSignatureForUARPAccessoryRecord:(id)a3 inContainer:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  CFErrorRef error = 0;
  uint64_t v8 = [v7 publicKey];

  if (!v8)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:](log, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_18;
  }
  uint64_t v9 = [(UARPiCloudManager *)self calculateDigestFromUARPAccessoryRecord:v6];
  if (!v9)
  {
    long long v32 = self->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:](v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_18;
  }
  uint64_t v10 = (void *)v9;
  id v11 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v12 = [v6 signature];
  CFDataRef v13 = (const __CFData *)[v11 initWithBase64EncodedString:v12 options:0];

  int v14 = self->_log;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudManager validateSignatureForUARPAccessoryRecord:inContainer:](v14, v40, v41, v42, v43, v44, v45, v46);
    }

LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    uint64_t v16 = [v6 recordName];
    *(_DWORD *)long long buf = 138412290;
    v50 = v16;
    _os_log_impl(&dword_225D74000, v15, OS_LOG_TYPE_DEFAULT, "Validating signature on Record %@", buf, 0xCu);
  }
  uint64_t v17 = [v7 publicKey];
  int v18 = SecKeyVerifySignature(v17, (SecKeyAlgorithm)*MEMORY[0x263F172A8], (CFDataRef)v10, v13, &error);
  BOOL v19 = v18 != 0;

  uint64_t v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = v20;
    id v22 = [v6 recordName];
    id v23 = @"INVALID";
    *(_DWORD *)long long buf = 138412802;
    v50 = v22;
    if (v18) {
      id v23 = @"VALID";
    }
    __int16 v51 = 2112;
    id v52 = v23;
    __int16 v53 = 2112;
    CFErrorRef v54 = error;
    _os_log_impl(&dword_225D74000, v21, OS_LOG_TYPE_DEFAULT, "Signature on Record %@: %@ error: %@", buf, 0x20u);
  }
LABEL_19:

  return v19;
}

- (id)calculateDigestFromUARPAccessoryRecord:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [v3 manufacturer];
  [v4 addObject:v5];

  id v6 = [v3 model];
  [v4 addObject:v6];

  id v7 = [v3 firmwareVersion];
  [v4 addObject:v7];

  uint64_t v8 = [v3 firmwareURL];
  [v4 addObject:v8];

  uint64_t v9 = [v3 releaseType];

  if (v9)
  {
    uint64_t v10 = [v3 releaseType];
    [v4 addObject:v10];
  }
  id v11 = [v3 updateClassification];

  if (v11)
  {
    uint64_t v12 = [v3 updateClassification];
    [v4 addObject:v12];
  }
  CFDataRef v13 = [v3 deploymentList];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    id v15 = [v3 deploymentStr];
    [v4 addObject:v15];
  }
  uint64_t v16 = [v3 releaseNotesURL];
  [v4 addObject:v16];

  uint64_t v17 = [v3 firmwareBinaryHash];
  [v4 addObject:v17];

  int v18 = [v3 releaseNotesHash];
  [v4 addObject:v18];

  BOOL v19 = [v3 recordStatus];
  [v4 addObject:v19];

  uint64_t v20 = [v3 releaseDate];
  [v4 addObject:v20];

  uint64_t v21 = [v3 firmwareFileSize];
  [v4 addObject:v21];

  id v22 = [v3 releaseNotesFileSize];
  [v4 addObject:v22];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v4;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "dataUsingEncoding:", 4, (void)v32);
        id v28 = objc_claimAutoreleasedReturnValue();
        CC_SHA256_Update(&c, (const void *)[v28 bytes], objc_msgSend(v28, "length"));
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }

  uint64_t v29 = [MEMORY[0x263EFF990] dataWithLength:32];
  uint64_t v30 = v29;
  if (v29) {
    CC_SHA256_Final((unsigned __int8 *)[v29 mutableBytes], &c);
  }

  return v30;
}

- (BOOL)fetchVerificationCertificateInContainer:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isCHIPContainer])
  {
    [(UARPiCloudManager *)self performRemoteFetchForCHIPVerificationCertificateSync];
  }
  else
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__0;
    v24[4] = __Block_byref_object_dispose__0;
    id v25 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_INFO, "Fetching Verification Certificate", buf, 2u);
    }
    id v7 = objc_alloc(MEMORY[0x263EFD800]);
    uint64_t v8 = (void *)[v7 initWithZoneName:@"certificates" ownerName:*MEMORY[0x263EFD480]];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFD7E0]) initWithRecordName:@"certificates" zoneID:v8];
    id v10 = objc_alloc(MEMORY[0x263EFD6E0]);
    v28[0] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    uint64_t v12 = (void *)[v10 initWithRecordIDs:v11];

    [v12 setShouldFetchAssetContentInMemory:1];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __61__UARPiCloudManager_fetchVerificationCertificateInContainer___block_invoke;
    v19[3] = &unk_264777380;
    v19[4] = self;
    id v23 = v24;
    id v13 = v9;
    id v20 = v13;
    id v14 = v4;
    id v21 = v14;
    id v15 = v5;
    id v22 = v15;
    [v12 setFetchRecordsCompletionBlock:v19];
    uint64_t v16 = [v14 database];
    [v16 addOperation:v12];

    uint64_t v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v27 = "-[UARPiCloudManager fetchVerificationCertificateInContainer:]";
      _os_log_impl(&dword_225D74000, v17, OS_LOG_TYPE_INFO, "%s: Waiting on the fetch record completion block to be finished", buf, 0xCu);
    }
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v24, 8);
  }

  return 1;
}

void __61__UARPiCloudManager_fetchVerificationCertificateInContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    uint64_t v12 = "-[UARPiCloudManager fetchVerificationCertificateInContainer:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_225D74000, v7, OS_LOG_TYPE_INFO, "%s: operationError = %@, recordsByRecordID: %@", (uint8_t *)&v11, 0x20u);
  }
  if (v5 && !v6)
  {
    uint64_t v8 = [v5 objectForKey:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [*(id *)(a1 + 32) processVerificationCertificateRecord:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forContainer:*(void *)(a1 + 48)];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)performRemoteFetchForSupportedAccessoriesMetadataInZone:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[UARPiCloudManager performRemoteFetchForSupportedAccessoriesMetadataInZone:]";
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "%s: Deprecated", (uint8_t *)&v4, 0xCu);
  }
}

- (void)performRemoteFetchForSupportedAccessoriesMetadata:(id)a3 batchRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "NO";
    *(void *)&uint8_t buf[4] = "-[UARPiCloudManager performRemoteFetchForSupportedAccessoriesMetadata:batchRequest:]";
    *(_DWORD *)long long buf = 136315650;
    if (v4) {
      uint64_t v8 = "YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&unsigned char buf[22] = 2080;
    uint64_t v29 = v8;
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "%s: productGroup:%@ batchRequest:%s", buf, 0x20u);
  }
  uint64_t v9 = [(UARPiCloudContainer *)self->_container containerID];
  if ([v9 isEqualToString:@"com.apple.chip"])
  {
  }
  else
  {
    id v10 = [(UARPiCloudContainer *)self->_container containerID];
    int v11 = [v10 isEqualToString:@"com.apple.chip.staging"];

    if (!v11) {
      goto LABEL_11;
    }
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v29) = 1;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  dispatch_time_t v27 = 0;
  dispatch_time_t v27 = dispatch_time(0, 0);
  uint64_t v13 = MEMORY[0x263EF8330];
  do
  {
    dispatch_time_t v14 = v25[3];
    recordProcessingQueue = self->_recordProcessingQueue;
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __84__UARPiCloudManager_performRemoteFetchForSupportedAccessoriesMetadata_batchRequest___block_invoke;
    v18[3] = &unk_2647773A8;
    id v21 = buf;
    v18[4] = self;
    id v16 = v6;
    BOOL v23 = v4;
    id v19 = v16;
    id v22 = &v24;
    uint64_t v17 = v12;
    id v20 = v17;
    dispatch_after(v14, recordProcessingQueue, v18);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  }
  while (!*(unsigned char *)(*(void *)&buf[8] + 24));
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(buf, 8);
LABEL_11:
}

intptr_t __84__UARPiCloudManager_performRemoteFetchForSupportedAccessoriesMetadata_batchRequest___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) handleRemoteFetchRequestForCHIPAccessoriesMetadata:*(void *)(a1 + 40) batchRequest:*(unsigned __int8 *)(a1 + 72)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(a1 + 72) && !*(unsigned char *)(v2 + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = dispatch_time(0, 1000000000);
  }
  else {
    *(unsigned char *)(v2 + 24) = 1;
  }
  id v3 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v3);
}

- (void)performRemoteFetchForAttestationCertificates:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v11 = "-[UARPiCloudManager performRemoteFetchForAttestationCertificates:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "%s: subjectKeyIdentifier:%@", buf, 0x16u);
  }
  recordProcessingQueue = self->_recordProcessingQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__UARPiCloudManager_performRemoteFetchForAttestationCertificates___block_invoke;
  v8[3] = &unk_264777150;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(recordProcessingQueue, v8);
}

void __66__UARPiCloudManager_performRemoteFetchForAttestationCertificates___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) containerID];
  if ([v2 isEqualToString:@"com.apple.chip"])
  {
  }
  else
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 16) containerID];
    int v4 = [v3 isEqualToString:@"com.apple.chip.staging"];

    if (!v4) {
      return;
    }
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  [v5 handleRemoteFetchRequestForCHIPAttestationCertificates:v6];
}

- (UARPiCloudContainer)container
{
  return (UARPiCloudContainer *)objc_getProperty(self, a2, 16, 1);
}

- (UARPiCloudManagerDelegate)delegate
{
  return (UARPiCloudManagerDelegate *)objc_getProperty(self, a2, 24, 1);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_recordProcessingQueue, 0);
}

- (void)qHandleRemoteFetchRequestForAccessories:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  int v4 = "-[UARPiCloudManager qHandleRemoteFetchRequestForAccessories:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_225D74000, a2, OS_LOG_TYPE_ERROR, "%s: failed to fetch verification certificate for container: %@", (uint8_t *)&v3, 0x16u);
}

- (void)processVerificationCertificateRecord:forContainer:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_225D74000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve CKAsset from %@", (uint8_t *)v1, 0x16u);
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:.cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  __int16 v5 = a1;
  uint64_t v6 = [a2 fileURL];
  v8[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v9 = v7;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_225D74000, v5, OS_LOG_TYPE_ERROR, "%s: Failed to delete asset at URL %@ withError %@", (uint8_t *)v8, 0x20u);
}

- (void)processVerificationCertificateRecord:(void *)a1 forContainer:(void *)a2 .cold.3(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = a1;
  int v4 = [a2 assetContent];
  __int16 v5 = [a2 assetTransferOptions];
  int v6 = 136315650;
  __int16 v7 = "-[UARPiCloudManager processVerificationCertificateRecord:forContainer:]";
  __int16 v8 = 2112;
  __int16 v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_225D74000, v3, OS_LOG_TYPE_ERROR, "%s: Failed to retrieve verification/certificate data from %@, %@", (uint8_t *)&v6, 0x20u);
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)processVerificationCertificateRecord:(uint64_t)a3 forContainer:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyPublicKeyForVerificationCertificateData:(int)a1 policy:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_225D74000, a2, OS_LOG_TYPE_ERROR, "Failed to create trust for certificate, status:0x%x", (uint8_t *)v2, 8u);
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)validateSignatureForUARPAccessoryRecord:(uint64_t)a3 inContainer:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end