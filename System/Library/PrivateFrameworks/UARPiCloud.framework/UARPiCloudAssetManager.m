@interface UARPiCloudAssetManager
- (BOOL)checkLocalUARPCacheForAccessory:(id)a3 versionAvailable:(id *)a4 firmwarePath:(id *)a5 releaseNotesPath:(id *)a6;
- (BOOL)isFirmwareHash:(id)a3 equalToHash:(id)a4;
- (BOOL)moveFileAtURL:(id)a3 toTempURL:(id)a4;
- (BOOL)uarpDownloadOnCellularAllowed;
- (OS_dispatch_queue)delegateQueue;
- (UARPiCloudAssetManager)initWithManager:(id)a3;
- (id)moveToUARPCacheFromRemoteURL:(id)a3 assetType:(int64_t)a4 forAcessory:(id)a5;
- (id)pathToSuperBinaryInAccessoryVersionDirectory:(id)a3 uarpVersion:(id *)a4;
- (int64_t)downloadFirmwareForAccessory:(id)a3;
- (int64_t)downloadReleaseNotesForAccessory:(id)a3;
- (int64_t)getAttestationCertificates:(id)a3 inContainer:(id)a4;
- (int64_t)getSupportedAccessories:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5;
- (int64_t)handleReleaseNotesDownloadRequestForAccessory:(id)a3;
- (int64_t)handleRemoteFirmwareDownloadRequestForAccessory:(id)a3;
- (int64_t)handleRemoteQueryRequestForAccessories:(id)a3 inContainer:(id)a4;
- (int64_t)performRemoteUpdateCheckForAccessories:(id)a3 inContainer:(id)a4;
- (unsigned)_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:(unint64_t)a3;
- (void)cleanupAssetCache;
- (void)handleFirmwareDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4;
- (void)handleReleaseNotesDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4;
- (void)handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:(id)a3 inContainer:(id)a4;
- (void)handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5;
- (void)handleRemoteDownloadResponseForAttestationCertificates:(id)a3 forSubKeyIdentifier:(id)a4;
- (void)handleRemoteDownloadResponseForSupportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5;
- (void)handleRemoteFetchCompletion:(id)a3 error:(id)a4;
- (void)remoteFetchCompletion:(id)a3 error:(id)a4;
- (void)remoteFetchCompletionForAttestationCertificates:(id)a3 subjectKeyIdentifier:(id)a4 error:(id)a5;
- (void)setFirmwareDownloadFailureStatusForAccessory:(id)a3;
- (void)setFirmwareDownloadSuccessStatusForAccessory:(id)a3;
- (void)setReleaseNotesDownloadFailureStatusForAccessory:(id)a3;
- (void)setReleaseNotesDownloadSuccessStatusForAccessory:(id)a3;
- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3;
@end

@implementation UARPiCloudAssetManager

- (UARPiCloudAssetManager)initWithManager:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UARPiCloudAssetManager;
  v6 = [(UARPiCloudAssetManager *)&v16 init];
  if (v6)
  {
    os_log_t v7 = os_log_create("com.apple.accessoryupdater.uarp", "iCloudAssetManager");
    log = v6->_log;
    v6->_log = (OS_os_log *)v7;

    objc_storeStrong((id *)&v6->_assetManager, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager.queue", 0);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.aam.uarpiCloudAssetManager.batched", 0);
    batchedProcessingQueue = v6->_batchedProcessingQueue;
    v6->_batchedProcessingQueue = (OS_dispatch_queue *)v13;
  }
  return v6;
}

- (void)cleanupAssetCache
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = InternalStorageDirectoryPath();
  id v5 = UARPArrayOfExpiredFiles(v4, 0, 2592000.0);

  v6 = NSString;
  os_log_t v7 = (void *)MEMORY[0x263F08AE8];
  v8 = InternalStorageDirectoryPath();
  dispatch_queue_t v9 = [v7 escapedPatternForString:v8];
  uint64_t v10 = [v6 stringWithFormat:@"^%@\\S+\\/\\S+\\/(%@|%@)\\/.+$", v9, *MEMORY[0x263F38340], *MEMORY[0x263F38348]];

  v37 = (void *)v10;
  v38 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:v10 options:1 error:0];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v54 count:16];
  obuint64_t j = v11;
  if (!v12)
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v48;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      v18 = [v17 pathExtension];
      char v19 = [@"urlasset" isEqualToString:v18];

      if (v19)
      {
        uint64_t v20 = v14;
      }
      else
      {
        uint64_t v20 = 1;
        if (objc_msgSend(v38, "rangeOfFirstMatchInString:options:range:", v17, 1, 0, objc_msgSend(v17, "length")) == 0x7FFFFFFFFFFFFFFFLL) {
          continue;
        }
      }
      [v3 addObject:v17];
      uint64_t v14 = v20;
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
  }
  while (v13);

  if (v14)
  {
    v21 = NSString;
    v22 = InternalStorageDirectoryPath();
    id v11 = [v21 stringWithFormat:@"%@%@", v22, @"icloudTokens.plist"];

    [v3 addObject:v11];
    goto LABEL_14;
  }
LABEL_15:
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v39 = v3;
  uint64_t v42 = [v39 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v42)
  {
    uint64_t v41 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v39);
        }
        v24 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v24;
          _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "Deleting iCloud Cache file:%@", buf, 0xCu);
        }
        v26 = [MEMORY[0x263F08850] defaultManager];
        [v26 removeItemAtPath:v24 error:0];

        v27 = [v24 stringByDeletingLastPathComponent];
        v28 = InternalStorageDirectoryPath();
        char v29 = [v27 isEqualToString:v28];

        if ((v29 & 1) == 0)
        {
          while (1)
          {
            v30 = [MEMORY[0x263F08850] defaultManager];
            v31 = [v30 contentsOfDirectoryAtPath:v27 error:0];

            if ([v31 count]) {
              break;
            }
            v32 = self->_log;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v27;
              _os_log_impl(&dword_225D74000, v32, OS_LOG_TYPE_DEFAULT, "Deleting iCloud Cache directory:%@", buf, 0xCu);
            }
            v33 = [MEMORY[0x263F08850] defaultManager];
            [v33 removeItemAtPath:v27 error:0];

            v34 = [v27 stringByDeletingLastPathComponent];

            v35 = InternalStorageDirectoryPath();
            int v36 = [v34 isEqualToString:v35];

            v27 = v34;
            if (v36) {
              goto LABEL_30;
            }
          }
        }
        v34 = v27;
LABEL_30:
      }
      uint64_t v42 = [v39 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v42);
  }
}

- (int64_t)performRemoteUpdateCheckForAccessories:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__UARPiCloudAssetManager_performRemoteUpdateCheckForAccessories_inContainer___block_invoke;
  v13[3] = &unk_2647770B0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  objc_super v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(workQueue, v13);
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __77__UARPiCloudAssetManager_performRemoteUpdateCheckForAccessories_inContainer___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleRemoteQueryRequestForAccessories:*(void *)(a1 + 40) inContainer:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (int64_t)downloadFirmwareForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__UARPiCloudAssetManager_downloadFirmwareForAccessory___block_invoke;
  block[3] = &unk_2647770D8;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __55__UARPiCloudAssetManager_downloadFirmwareForAccessory___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleRemoteFirmwareDownloadRequestForAccessory:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)downloadReleaseNotesForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__UARPiCloudAssetManager_downloadReleaseNotesForAccessory___block_invoke;
  block[3] = &unk_2647770D8;
  id v10 = v4;
  int64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(workQueue, block);
  int64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__UARPiCloudAssetManager_downloadReleaseNotesForAccessory___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) handleReleaseNotesDownloadRequestForAccessory:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)getSupportedAccessories:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__UARPiCloudAssetManager_getSupportedAccessories_batchRequest_inContainer___block_invoke;
  v14[3] = &unk_264777100;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(workQueue, v14);

  return 0;
}

uint64_t __75__UARPiCloudAssetManager_getSupportedAccessories_batchRequest_inContainer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:*(void *)(a1 + 40) batchRequest:*(unsigned __int8 *)(a1 + 56) inContainer:*(void *)(a1 + 48)];
}

- (int64_t)handleRemoteQueryRequestForAccessories:(id)a3 inContainer:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "Performing Remote Check on iCloud ContainerID:%@ for accessories: %@", buf, 0x16u);
  }
  id v10 = [[UARPiCloudManager alloc] initWithDelegate:self containerID:v7];
  id cloudManager = self->_cloudManager;
  self->_id cloudManager = v10;

  if (self->_cloudManager)
  {
    if (!self->_accessories)
    {
      id v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      accessories = self->_accessories;
      self->_accessories = v12;
    }
    id v40 = v7;
    uint64_t v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_accessories;
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[UARPiCloudAssetManager handleRemoteQueryRequestForAccessories:inContainer:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_225D74000, v14, OS_LOG_TYPE_DEFAULT, "%s: Current _accessories %@", buf, 0x16u);
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v41 = v6;
    obuint64_t j = v6;
    uint64_t v45 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v45)
    {
      uint64_t v43 = *(void *)v48;
      long long v44 = v8;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v48 != v43) {
            objc_enumerationMutation(obj);
          }
          BOOL v17 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "accessoryID", v40);
          uint64_t v19 = [v18 firmwareVersion];

          uint64_t v20 = [v17 accessoryID];
          v21 = [v20 stagedFirmwareVersion];

          v22 = [v17 assetID];
          if ([v22 type] == 15)
          {

LABEL_16:
            if (v21 && ([v21 isEqualToString:v19] & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
          v23 = [v17 assetID];
          uint64_t v24 = [v23 type];

          if (v24 == 16) {
            goto LABEL_16;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          v25 = (void *)MEMORY[0x263F38330];
          v26 = [v17 accessoryID];
          v27 = [v26 firmwareVersion];
          [v25 versionFromString:v27 version:buf];

          if (v21)
          {
            v46[0] = 0;
            v46[1] = 0;
            [MEMORY[0x263F38330] versionFromString:v21 version:v46];
            if (uarpVersionCompare(buf, v46) == 1)
            {
LABEL_21:
              id v28 = v21;

              uint64_t v19 = v28;
            }
          }
LABEL_22:
          char v29 = [UARPiCloudAccessory alloc];
          v30 = [v17 accessoryID];
          v31 = [v30 productGroup];
          v32 = [v17 accessoryID];
          v33 = [v32 productNumber];
          v34 = [(UARPiCloudAccessory *)v29 initWithProductGroup:v31 productNumber:v33 firmwareVersion:v19];

          v35 = [v17 assetID];
          -[UARPiCloudAccessory setSignatureValidationNeeded:](v34, "setSignatureValidationNeeded:", [v35 signatureValidationNeeded]);

          id v8 = v44;
          [v44 addObject:v34];
          [(NSMutableDictionary *)self->_accessories setObject:v17 forKey:v34];
          int v36 = self->_log;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = self->_accessories;
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "-[UARPiCloudAssetManager handleRemoteQueryRequestForAccessories:inContainer:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v17;
            __int16 v52 = 2112;
            v53 = v37;
            _os_log_impl(&dword_225D74000, v36, OS_LOG_TYPE_DEFAULT, "%s: Added internalAccessory %@ to _accessories %@", buf, 0x20u);
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v45);
    }

    [self->_cloudManager performRemoteFetchForAccessories:v8];
    int64_t v38 = 0;
    id v7 = v40;
    id v6 = v41;
  }
  else
  {
    int64_t v38 = 2;
  }

  return v38;
}

- (int64_t)getAttestationCertificates:(id)a3 inContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UARPiCloudAssetManager_getAttestationCertificates_inContainer___block_invoke;
  block[3] = &unk_264777128;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(workQueue, block);

  return 0;
}

uint64_t __65__UARPiCloudAssetManager_getAttestationCertificates_inContainer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:*(void *)(a1 + 40) inContainer:*(void *)(a1 + 48)];
}

- (void)remoteFetchCompletion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UARPiCloudAssetManager_remoteFetchCompletion_error___block_invoke;
  block[3] = &unk_264777128;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

uint64_t __54__UARPiCloudAssetManager_remoteFetchCompletion_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteFetchCompletion:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)handleRemoteFetchCompletion:(id)a3 error:(id)a4
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v6 setNumberStyle:1];
  id v7 = [(NSMutableDictionary *)self->_accessories objectForKeyedSubscript:v5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    accessories = self->_accessories;
    *(_DWORD *)buf = 136315650;
    v126 = "-[UARPiCloudAssetManager handleRemoteFetchCompletion:error:]";
    __int16 v127 = 2112;
    v128 = v7;
    __int16 v129 = 2112;
    v130 = accessories;
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "%s: Found internalAccessory %@, from _accessories %@", buf, 0x20u);
  }
  if (v7)
  {
    id v10 = [v5 chipFirmwareRecord];

    if (v10)
    {
      id v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        id v13 = [v5 chipFirmwareRecord];
        id v14 = [v13 firmwareURL];
        *(_DWORD *)buf = 138412546;
        v126 = v14;
        __int16 v127 = 2112;
        v128 = v7;
        _os_log_impl(&dword_225D74000, v12, OS_LOG_TYPE_DEFAULT, "Found an update on %@ from iCloud for accessory %@", buf, 0x16u);
      }
      id v15 = [v5 chipFirmwareRecord];
      [(NSMutableDictionary *)v7 setRecord:v15];

      id v16 = [v5 chipFirmwareRecord];
      BOOL v17 = [v16 firmwareVersion];
      v18 = [(NSMutableDictionary *)v7 assetID];
      [v18 setAssetVersion:v17];

      uint64_t v19 = [v5 chipFirmwareRecord];
      uint64_t v20 = [v19 firmwareVersionNumber];
      v21 = [(NSMutableDictionary *)v7 assetID];
      [v21 setAssetVersionNumber:v20];

      v22 = NSURL;
      v23 = [v5 chipFirmwareRecord];
      uint64_t v24 = [v23 firmwareURL];
      v25 = [v22 URLWithString:v24];
      v26 = [(NSMutableDictionary *)v7 assetID];
      [v26 setRemoteURL:v25];

      v27 = [(NSMutableDictionary *)v7 assetID];
      [v27 setDownloadStatus:0];

      id v28 = [(NSMutableDictionary *)v7 assetID];
      [v28 setUpdateAvailabilityStatus:1];

      char v29 = NSURL;
      v30 = [v5 chipFirmwareRecord];
      v31 = [v30 releaseNotesURL];
      v32 = [v29 URLWithString:v31];
      v33 = [(NSMutableDictionary *)v7 assetID];
      [v33 setReleaseNotesRemoteURL:v32];

      v34 = [(NSMutableDictionary *)v7 assetID];
      [v34 setReleaseNotesDownloadStatus:0];

      v35 = [(NSMutableDictionary *)v7 assetID];
      [v35 setReleaseNotesAvailabilityStatus:1];

      int v36 = [v5 chipFirmwareRecord];
      v37 = [v36 firmwareFileSize];
      int64_t v38 = [v6 numberFromString:v37];
      id v39 = [(NSMutableDictionary *)v7 assetID];
      [v39 setFirmwareFileSize:v38];

      id v40 = [v5 chipFirmwareRecord];
      id v41 = [v40 releaseDate];
      uint64_t v42 = [(NSMutableDictionary *)v7 assetID];
      [v42 setAssetReleaseDate:v41];

      uint64_t v43 = [(NSMutableDictionary *)v7 assetID];
      [(NSMutableDictionary *)v7 analyticsSetDownloadAvailableForAssetID:v43];

      long long v44 = [(NSMutableDictionary *)v7 assetID];
      [(NSMutableDictionary *)v7 analyticsSetDownloadConsentRequestedForAssetID:v44];

      uint64_t v45 = [(UARPiCloudAssetManager *)self delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke;
      block[3] = &unk_264777150;
      block[4] = self;
      v124 = v7;
      dispatch_async(v45, block);

      long long v46 = v124;
LABEL_16:

      goto LABEL_17;
    }
    long long v47 = [v5 record];

    long long v48 = self->_log;
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
    if (v47)
    {
      if (v49)
      {
        long long v50 = v48;
        v51 = [v5 record];
        __int16 v52 = [v51 firmwareURL];
        *(_DWORD *)buf = 138412546;
        v126 = v52;
        __int16 v127 = 2112;
        v128 = v7;
        _os_log_impl(&dword_225D74000, v50, OS_LOG_TYPE_DEFAULT, "Found an update on %@ from iCloud for accessory %@", buf, 0x16u);
      }
      v53 = [v5 record];
      v54 = [v53 deploymentList];

      if (v54)
      {
        uint64_t v55 = [(NSMutableDictionary *)v7 assetID];
        v56 = [v5 record];
        v57 = [v56 deploymentList];
        [v55 processUARPDeploymentRules:v57];
      }
      v58 = [v5 record];
      v59 = [v58 releaseDate];

      if (v59)
      {
        id v60 = objc_alloc_init(MEMORY[0x263F08790]);
        [v60 setDateFormat:@"MM/dd/yyyy"];
        v61 = [v5 record];
        v62 = [v61 releaseDate];
        v63 = [v60 dateFromString:v62];
        v64 = [(NSMutableDictionary *)v7 assetID];
        [v64 setAssetReleaseDate:v63];
      }
      v65 = [(NSMutableDictionary *)v7 assetID];
      unsigned int v66 = [v65 signatureValidationNeeded];

      v67 = [(NSMutableDictionary *)v7 assetID];
      [v67 setValidationStatus:v66];

      v68 = [v5 record];
      [(NSMutableDictionary *)v7 setRecord:v68];

      v69 = [v5 record];
      v70 = [v69 firmwareVersion];
      v71 = [(NSMutableDictionary *)v7 assetID];
      [v71 setAssetVersion:v70];

      v72 = NSURL;
      v73 = [v5 record];
      v74 = [v73 firmwareURL];
      v75 = [v72 URLWithString:v74];
      v76 = [(NSMutableDictionary *)v7 assetID];
      [v76 setRemoteURL:v75];

      v77 = [(NSMutableDictionary *)v7 assetID];
      [v77 setDownloadStatus:0];

      v78 = [(NSMutableDictionary *)v7 assetID];
      [v78 setUpdateAvailabilityStatus:1];

      v79 = NSURL;
      v80 = [v5 record];
      v81 = [v80 releaseNotesURL];
      v82 = [v79 URLWithString:v81];
      v83 = [(NSMutableDictionary *)v7 assetID];
      [v83 setReleaseNotesRemoteURL:v82];

      v84 = [(NSMutableDictionary *)v7 assetID];
      [v84 setReleaseNotesDownloadStatus:0];

      v85 = [(NSMutableDictionary *)v7 assetID];
      [v85 setReleaseNotesAvailabilityStatus:1];

      v86 = [v5 record];
      v87 = [v86 releaseNotesFileSize];
      v88 = [v6 numberFromString:v87];
      v89 = [(NSMutableDictionary *)v7 assetID];
      [v89 setReleaseNotesFileSize:v88];

      v90 = [v5 record];
      v91 = [v90 firmwareFileSize];
      v92 = [v6 numberFromString:v91];
      v93 = [(NSMutableDictionary *)v7 assetID];
      [v93 setFirmwareFileSize:v92];

      v94 = [(NSMutableDictionary *)v7 assetID];
      [(NSMutableDictionary *)v7 analyticsSetDownloadAvailableForAssetID:v94];

      v95 = [(NSMutableDictionary *)v7 assetID];
      [(NSMutableDictionary *)v7 analyticsSetDownloadConsentRequestedForAssetID:v95];

      v96 = [(UARPiCloudAssetManager *)self delegateQueue];
      v121[0] = MEMORY[0x263EF8330];
      v121[1] = 3221225472;
      v121[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_296;
      v121[3] = &unk_264777150;
      v121[4] = self;
      v122 = v7;
      dispatch_async(v96, v121);

      long long v46 = v122;
      goto LABEL_16;
    }
    if (v49)
    {
      *(_DWORD *)buf = 138412290;
      v126 = (const char *)v7;
      _os_log_impl(&dword_225D74000, v48, OS_LOG_TYPE_DEFAULT, "No new update found on iCloud since last check for %@, checking in local UARP cache ", buf, 0xCu);
    }
    id v119 = 0;
    id v120 = 0;
    id v118 = 0;
    BOOL v97 = [(UARPiCloudAssetManager *)self checkLocalUARPCacheForAccessory:v7 versionAvailable:&v120 firmwarePath:&v119 releaseNotesPath:&v118];
    v98 = (char *)v120;
    v99 = (NSMutableDictionary *)v119;
    v100 = (char *)v118;
    v101 = self->_log;
    BOOL v102 = os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT);
    if (v97 && v98 && v99)
    {
      if (v102)
      {
        *(_DWORD *)buf = 138412802;
        v126 = v98;
        __int16 v127 = 2112;
        v128 = v99;
        __int16 v129 = 2112;
        v130 = v7;
        _os_log_impl(&dword_225D74000, v101, OS_LOG_TYPE_DEFAULT, "Found update %@ in local UARP cache %@ path for accessory %@", buf, 0x20u);
      }
      v103 = [(NSMutableDictionary *)v7 assetID];
      [(NSMutableDictionary *)v7 analyticsSetDownloadCompleteForAssetID:v103 status:2];

      v104 = [(NSMutableDictionary *)v7 assetID];
      [v104 setAssetVersion:v98];

      v105 = [(NSMutableDictionary *)v7 assetID];
      [v105 setRemoteURL:v99];

      v106 = [(NSMutableDictionary *)v7 assetID];
      [v106 setLocalURL:v99];

      v107 = [(NSMutableDictionary *)v7 assetID];
      [v107 setDownloadStatus:1];

      v108 = [(NSMutableDictionary *)v7 assetID];
      [v108 setUpdateAvailabilityStatus:3];

      if (v100)
      {
        v109 = self->_log;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          v110 = v109;
          v111 = [(NSMutableDictionary *)v7 accessoryID];
          *(_DWORD *)buf = 138412546;
          v126 = v100;
          __int16 v127 = 2112;
          v128 = v111;
          _os_log_impl(&dword_225D74000, v110, OS_LOG_TYPE_DEFAULT, "Found releaseNotes in local UARP cache %@ path for accessory %@", buf, 0x16u);
        }
        v112 = [(NSMutableDictionary *)v7 assetID];
        [v112 setReleaseNotesLocalURL:v100];

        v113 = [(NSMutableDictionary *)v7 assetID];
        [v113 setReleaseNotesDownloadStatus:1];

        v114 = [(NSMutableDictionary *)v7 assetID];
        [v114 setReleaseNotesAvailabilityStatus:3];
      }
      v115 = [(UARPiCloudAssetManager *)self delegateQueue];
      v116[0] = MEMORY[0x263EF8330];
      v116[1] = 3221225472;
      v116[2] = __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_297;
      v116[3] = &unk_264777150;
      v116[4] = self;
      v117 = v7;
      dispatch_async(v115, v116);
    }
    else if (v102)
    {
      *(_DWORD *)buf = 138412290;
      v126 = (const char *)v7;
      _os_log_impl(&dword_225D74000, v101, OS_LOG_TYPE_DEFAULT, "No new update found in local UARP cache for accessory: %@", buf, 0xCu);
    }
  }
LABEL_17:
}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_DEFAULT, "Updated internalAccessory.assetID state, notifying client for accessory %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [*(id *)(a1 + 40) accessoryID];
  id v6 = [*(id *)(a1 + 40) assetID];
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_296(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_DEFAULT, "Updated internalAccessory.assetID state, notifying client for accessory %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [*(id *)(a1 + 40) accessoryID];
  id v6 = [*(id *)(a1 + 40) assetID];
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

void __60__UARPiCloudAssetManager_handleRemoteFetchCompletion_error___block_invoke_297(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_DEFAULT, "Updated internalAccessory.assetID state, notifying client for accessory %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [*(id *)(a1 + 40) accessoryID];
  id v6 = [*(id *)(a1 + 40) assetID];
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

- (BOOL)moveFileAtURL:(id)a3 toTempURL:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  if ([v7 checkResourceIsReachableAndReturnError:0])
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    id v16 = 0;
    [v9 removeItemAtURL:v7 error:&v16];
    id v8 = v16;
  }
  id v10 = [MEMORY[0x263F08850] defaultManager];
  id v15 = v8;
  char v11 = [v10 moveItemAtURL:v6 toURL:v7 error:&v15];
  id v12 = v15;

  if ((v11 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_error_impl(&dword_225D74000, log, OS_LOG_TYPE_ERROR, "Failed to moved file from %@ to temporary location %@ for validation: %@", buf, 0x20u);
    }
  }

  return v11;
}

- (int64_t)handleRemoteFirmwareDownloadRequestForAccessory:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v6 = log;
    id v7 = [v4 assetID];
    id v8 = [v7 remoteURL];
    uint64_t v9 = [v4 accessoryID];
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v9;
    _os_log_impl(&dword_225D74000, v6, OS_LOG_TYPE_INFO, "Downloading asset from remote url %@ for accessory %@", buf, 0x16u);
  }
  id v10 = [v4 assetID];
  char v11 = [v10 remoteURL];

  id v12 = [MEMORY[0x263F08BF8] sharedSession];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke;
  v17[3] = &unk_264777178;
  v17[4] = self;
  id v18 = v4;
  id v19 = v11;
  id v13 = v11;
  id v14 = v4;
  id v15 = [v12 downloadTaskWithURL:v13 completionHandler:v17];

  [v15 resume];
  return 0;
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *((void *)a1[4] + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = a1[5];
    id v12 = v10;
    id v13 = [v11 assetID];
    id v14 = [v13 remoteURL];
    id v15 = [a1[5] accessoryID];
    *(_DWORD *)buf = 138413314;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    uint64_t v43 = v14;
    __int16 v44 = 2112;
    uint64_t v45 = v15;
    __int16 v46 = 2112;
    id v47 = v7;
    _os_log_impl(&dword_225D74000, v12, OS_LOG_TYPE_INFO, "Download result: %@ error:%@ from remote url %@ for accessory %@ %@", buf, 0x34u);
  }
  if (!v7 || v9)
  {
    [a1[4] setFirmwareDownloadFailureStatusForAccessory:a1[5]];
    id v28 = [a1[4] delegateQueue];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_299;
    v36[3] = &unk_264777150;
    id v29 = a1[5];
    v36[4] = a1[4];
    id v37 = v29;
    dispatch_async(v28, v36);
  }
  else
  {
    id v16 = NSString;
    BOOL v17 = InternalStorageDirectoryPath();
    id v18 = [a1[6] lastPathComponent];
    id v19 = [v16 stringWithFormat:@"%@/%@.%@", v17, v18, @"urlasset"];

    id v20 = NSURL;
    id v21 = v19;
    __int16 v22 = objc_msgSend(v20, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(v21, "UTF8String"), 0, 0);
    char v23 = [a1[4] moveFileAtURL:v7 toTempURL:v22];
    uint64_t v24 = a1[4];
    if (v23)
    {
      v25 = v24[5];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_3;
      block[3] = &unk_264777128;
      block[4] = v24;
      v26 = &v32;
      id v32 = v22;
      v33 = a1[5];
      dispatch_sync(v25, block);
      v27 = v33;
    }
    else
    {
      [v24 setFirmwareDownloadFailureStatusForAccessory:a1[5]];
      v27 = [a1[4] delegateQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_2;
      v34[3] = &unk_264777150;
      id v30 = a1[5];
      v34[4] = a1[4];
      v26 = &v35;
      id v35 = v30;
      dispatch_async(v27, v34);
    }
  }
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_299(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) accessoryID];
  uint64_t v3 = [*(id *)(a1 + 40) assetID];
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

void __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) accessoryID];
  uint64_t v3 = [*(id *)(a1 + 40) assetID];
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

uint64_t __74__UARPiCloudAssetManager_handleRemoteFirmwareDownloadRequestForAccessory___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleFirmwareDownloadResponseFromLocation:*(void *)(a1 + 40) forAccessory:*(void *)(a1 + 48)];
}

- (BOOL)isFirmwareHash:(id)a3 equalToHash:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a4, "caseInsensitiveCompare:") == 0;
    }
  }
  return result;
}

- (void)handleFirmwareDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 assetID];
  int v9 = [v8 signatureValidationNeeded];

  if (v9)
  {
    id v10 = [v7 record];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [v7 record];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = [v7 record];
        id v15 = [v14 hashAlgorithmType];
        uint64_t v16 = [v15 unsignedLongValue];
      }
      else
      {
        uint64_t v16 = 1;
      }
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = log;
        __int16 v22 = [v7 record];
        *(_DWORD *)buf = 136315650;
        uint64_t v45 = "-[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:]";
        __int16 v46 = 2112;
        id v47 = v7;
        __int16 v48 = 2112;
        id v49 = v22;
        _os_log_impl(&dword_225D74000, v21, OS_LOG_TYPE_DEFAULT, "%s: UARPAccessoryInternal %@, record %@", buf, 0x20u);
      }
      int v23 = [(UARPiCloudAssetManager *)self _getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:v16];
      uint64_t v24 = [v7 record];
      v25 = [v24 firmwareBinaryHash];

      id v43 = 0;
      generateHashForDataAtLocation(v6, v23, (uint64_t)&v43);
      v26 = (char *)objc_claimAutoreleasedReturnValue();
      id v27 = v43;
      id v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v45 = v26;
        __int16 v46 = 2114;
        id v47 = v25;
        __int16 v48 = 2114;
        id v49 = v27;
        _os_log_impl(&dword_225D74000, v28, OS_LOG_TYPE_DEFAULT, "calculatedHash: %{public}@, expectedHash:%{public}@, error:%{public}@", buf, 0x20u);
      }
      id v29 = [v7 assetID];
      [v29 setFirmwareHash:v26];

      if ([(UARPiCloudAssetManager *)self isFirmwareHash:v25 equalToHash:v26]) {
        goto LABEL_17;
      }
      id v30 = [v7 record];
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0) {
        goto LABEL_18;
      }
      id v42 = v27;
      uint64_t v32 = generateBase64HashForDataAtLocation(v6, v23, (uint64_t)&v42);
      id v33 = v42;

      v34 = [v7 assetID];
      [v34 setFirmwareHash:v32];

      v26 = (char *)v32;
      id v27 = v33;
      if ([(UARPiCloudAssetManager *)self isFirmwareHash:v25 equalToHash:v32])
      {
LABEL_17:
        id v35 = [v7 assetID];
        [v35 setValidationStatus:1];

        id v18 = [(UARPiCloudAssetManager *)self moveToUARPCacheFromRemoteURL:v6 assetType:0 forAcessory:v7];
      }
      else
      {
LABEL_18:
        int v36 = [v7 assetID];
        [v36 setValidationStatus:2];

        id v18 = 0;
      }

      if (v18) {
        goto LABEL_20;
      }
    }
    else
    {
      id v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:](v19, v7);
      }
    }
LABEL_21:
    [(UARPiCloudAssetManager *)self setFirmwareDownloadFailureStatusForAccessory:v7];
    goto LABEL_22;
  }
  BOOL v17 = [v7 assetID];
  [v17 setValidationStatus:0];

  id v18 = [(UARPiCloudAssetManager *)self moveToUARPCacheFromRemoteURL:v6 assetType:0 forAcessory:v7];
  if (!v18) {
    goto LABEL_21;
  }
LABEL_20:
  id v37 = [v7 assetID];
  [v37 setLocalURL:v18];

  [(UARPiCloudAssetManager *)self setFirmwareDownloadSuccessStatusForAccessory:v7];
LABEL_22:
  int64_t v38 = [(UARPiCloudAssetManager *)self delegateQueue];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __82__UARPiCloudAssetManager_handleFirmwareDownloadResponseFromLocation_forAccessory___block_invoke;
  v40[3] = &unk_264777150;
  v40[4] = self;
  id v41 = v7;
  id v39 = v7;
  dispatch_async(v38, v40);
}

void __82__UARPiCloudAssetManager_handleFirmwareDownloadResponseFromLocation_forAccessory___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 136315394;
    id v8 = "-[UARPiCloudAssetManager handleFirmwareDownloadResponseFromLocation:forAccessory:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_225D74000, v2, OS_LOG_TYPE_DEFAULT, "%s: Updated assetID state %@, notifying client", (uint8_t *)&v7, 0x16u);
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v5 = [*(id *)(a1 + 40) accessoryID];
  id v6 = [*(id *)(a1 + 40) assetID];
  [v4 assetAvailabilityUpdateForAccessory:v5 assetID:v6 downstreamAppleModelNumber:0];
}

- (void)setFirmwareDownloadFailureStatusForAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 assetID];
  [v5 setLocalURL:0];

  id v6 = [v4 assetID];
  [v6 setDownloadStatus:2];

  int v7 = [v4 assetID];
  [v7 setUpdateAvailabilityStatus:0];

  id v8 = [v4 assetID];
  [v4 analyticsSetDownloadCompleteForAssetID:v8 status:3];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[UARPiCloudAssetManager setFirmwareDownloadFailureStatusForAccessory:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "%s: Set Download Failure Status for accessory %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)setFirmwareDownloadSuccessStatusForAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 assetID];
  [v5 setDownloadStatus:1];

  id v6 = [v4 assetID];
  [v6 setUpdateAvailabilityStatus:3];

  int v7 = [v4 assetID];
  [v4 analyticsSetDownloadCompleteForAssetID:v7 status:1];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[UARPiCloudAssetManager setFirmwareDownloadSuccessStatusForAccessory:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "%s: Set Download Success Status for accessory %@", (uint8_t *)&v9, 0x16u);
  }
}

- (int64_t)handleReleaseNotesDownloadRequestForAccessory:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v6 = log;
    int v7 = [v4 assetID];
    id v8 = [v7 releaseNotesRemoteURL];
    int v9 = [v4 accessoryID];
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl(&dword_225D74000, v6, OS_LOG_TYPE_INFO, "Downloading Release Notes from remote url %@ for accessory %@", buf, 0x16u);
  }
  int v10 = [v4 assetID];
  __int16 v11 = [v10 releaseNotesRemoteURL];

  id v12 = [MEMORY[0x263F08BF8] sharedSession];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke;
  v17[3] = &unk_264777178;
  v17[4] = self;
  id v18 = v4;
  id v19 = v11;
  id v13 = v11;
  id v14 = v4;
  id v15 = [v12 downloadTaskWithURL:v13 completionHandler:v17];

  [v15 resume];
  return 0;
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = *((void *)a1[4] + 1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = a1[5];
    id v12 = v10;
    id v13 = [v11 assetID];
    id v14 = [v13 remoteURL];
    id v15 = [a1[5] accessoryID];
    *(_DWORD *)buf = 138413058;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    uint64_t v45 = v15;
    _os_log_impl(&dword_225D74000, v12, OS_LOG_TYPE_INFO, "Download result: %@ error:%@ from remote url %@ for accessory %@", buf, 0x2Au);
  }
  if (!v7 || v9)
  {
    [a1[4] setReleaseNotesDownloadFailureStatusForAccessory:a1[5]];
    id v28 = [a1[4] delegateQueue];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_307;
    v36[3] = &unk_264777150;
    id v29 = a1[5];
    v36[4] = a1[4];
    id v37 = v29;
    dispatch_async(v28, v36);
  }
  else
  {
    uint64_t v16 = NSString;
    BOOL v17 = InternalStorageDirectoryPath();
    id v18 = [a1[6] lastPathComponent];
    id v19 = [v16 stringWithFormat:@"%@/%@.%@", v17, v18, @"urlasset"];

    id v20 = NSURL;
    id v21 = v19;
    __int16 v22 = objc_msgSend(v20, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", objc_msgSend(v21, "UTF8String"), 0, 0);
    char v23 = [a1[4] moveFileAtURL:v7 toTempURL:v22];
    uint64_t v24 = a1[4];
    if (v23)
    {
      v25 = v24[5];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_3;
      block[3] = &unk_264777128;
      block[4] = v24;
      v26 = &v32;
      id v32 = v22;
      id v33 = a1[5];
      dispatch_sync(v25, block);
      id v27 = v33;
    }
    else
    {
      [v24 setReleaseNotesDownloadFailureStatusForAccessory:a1[5]];
      id v27 = [a1[4] delegateQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_2;
      v34[3] = &unk_264777150;
      id v30 = a1[5];
      v34[4] = a1[4];
      v26 = &v35;
      id v35 = v30;
      dispatch_async(v27, v34);
    }
  }
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_307(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) accessoryID];
  uint64_t v3 = [*(id *)(a1 + 40) assetID];
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

void __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) accessoryID];
  uint64_t v3 = [*(id *)(a1 + 40) assetID];
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

uint64_t __72__UARPiCloudAssetManager_handleReleaseNotesDownloadRequestForAccessory___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleReleaseNotesDownloadResponseFromLocation:*(void *)(a1 + 40) forAccessory:*(void *)(a1 + 48)];
}

- (void)setReleaseNotesDownloadFailureStatusForAccessory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 assetID];
  [v4 setReleaseNotesLocalURL:0];

  id v5 = [v3 assetID];
  [v5 setReleaseNotesDownloadStatus:2];

  id v6 = [v3 assetID];
  [v6 setReleaseNotesAvailabilityStatus:0];

  id v7 = [v3 assetID];
  [v3 analyticsSetDownloadCompleteForAssetID:v7 status:3];
}

- (void)setReleaseNotesDownloadSuccessStatusForAccessory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 assetID];
  [v4 setReleaseNotesDownloadStatus:1];

  id v5 = [v3 assetID];
  [v5 setReleaseNotesAvailabilityStatus:3];

  id v6 = [v3 assetID];
  [v3 analyticsSetDownloadCompleteForAssetID:v6 status:1];
}

- (void)handleReleaseNotesDownloadResponseFromLocation:(id)a3 forAccessory:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 assetID];
  int v9 = [v8 signatureValidationNeeded];

  if (v9)
  {
    int v10 = [v7 record];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [v7 record];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = [v7 record];
        id v15 = [v14 hashAlgorithmType];
        uint64_t v16 = [v15 unsignedLongValue];
      }
      else
      {
        uint64_t v16 = 1;
      }
      int v20 = [(UARPiCloudAssetManager *)self _getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:v16];
      id v21 = [v7 record];
      __int16 v22 = [v21 releaseNotesHash];

      id v33 = 0;
      char v23 = generateHashForDataAtLocation(v6, v20, (uint64_t)&v33);
      id v24 = v33;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v35 = v23;
        __int16 v36 = 2114;
        id v37 = v22;
        __int16 v38 = 2114;
        id v39 = v24;
        _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_DEFAULT, "calculatedHash: %{public}@, expectedHash:%{public}@, error:%{public}@", buf, 0x20u);
      }
      if (v22 && [v23 isEqualToString:v22])
      {
        v26 = [v7 assetID];
        [v26 setValidationStatus:1];

        id v18 = [(UARPiCloudAssetManager *)self moveToUARPCacheFromRemoteURL:v6 assetType:1 forAcessory:v7];
      }
      else
      {
        id v27 = [v7 assetID];
        [v27 setValidationStatus:2];

        id v18 = 0;
      }

      if (v18) {
        goto LABEL_17;
      }
    }
    else
    {
      id v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudAssetManager handleReleaseNotesDownloadResponseFromLocation:forAccessory:](v19, v7);
      }
    }
LABEL_18:
    [(UARPiCloudAssetManager *)self setReleaseNotesDownloadFailureStatusForAccessory:v7];
    goto LABEL_19;
  }
  BOOL v17 = [v7 assetID];
  [v17 setValidationStatus:0];

  id v18 = [(UARPiCloudAssetManager *)self moveToUARPCacheFromRemoteURL:v6 assetType:1 forAcessory:v7];
  if (!v18) {
    goto LABEL_18;
  }
LABEL_17:
  id v28 = [v7 assetID];
  [v28 setReleaseNotesLocalURL:v18];

  [(UARPiCloudAssetManager *)self setReleaseNotesDownloadSuccessStatusForAccessory:v7];
LABEL_19:
  id v29 = [(UARPiCloudAssetManager *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__UARPiCloudAssetManager_handleReleaseNotesDownloadResponseFromLocation_forAccessory___block_invoke;
  block[3] = &unk_264777150;
  block[4] = self;
  id v32 = v7;
  id v30 = v7;
  dispatch_async(v29, block);
}

void __86__UARPiCloudAssetManager_handleReleaseNotesDownloadResponseFromLocation_forAccessory___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [*(id *)(a1 + 40) accessoryID];
  id v3 = [*(id *)(a1 + 40) assetID];
  [v2 assetAvailabilityUpdateForAccessory:v4 assetID:v3 downstreamAppleModelNumber:0];
}

- (BOOL)checkLocalUARPCacheForAccessory:(id)a3 versionAvailable:(id *)a4 firmwarePath:(id *)a5 releaseNotesPath:(id *)a6
{
  id v10 = a3;
  char v11 = [v10 assetID];
  if ([v11 type] != 15)
  {
    id v12 = [v10 assetID];
    uint64_t v13 = [v12 type];

    if (v13 == 16) {
      goto LABEL_4;
    }
    uint64_t v16 = (void *)MEMORY[0x263F089D8];
    BOOL v17 = InternalStorageDirectoryPath();
    id v18 = [v10 identifier];
    id v19 = [v16 stringWithFormat:@"%@/%@", v17, v18];

    int v20 = [NSURL fileURLWithPath:v19];
    id v21 = [MEMORY[0x263F08850] defaultManager];
    __int16 v22 = [v21 contentsOfDirectoryAtURL:v20 includingPropertiesForKeys:0 options:4 error:0];
    char v23 = (void *)[v22 mutableCopy];

    if ([v23 count])
    {
      if ([v23 count] == 1) {
        goto LABEL_11;
      }
      if ((unint64_t)[v23 count] >= 2)
      {
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __105__UARPiCloudAssetManager_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath___block_invoke;
        v55[3] = &unk_2647771A0;
        v55[4] = self;
        [v23 sortUsingComparator:v55];
LABEL_11:
        id v24 = [v23 firstObject];
        v25 = v24;
        if (v24)
        {
          v54 = v19;
          uint64_t v26 = [v24 URLByAppendingPathComponent:*MEMORY[0x263F38340]];
          id v27 = [MEMORY[0x263F08850] defaultManager];
          v53 = (void *)v26;
          id v28 = [v27 contentsOfDirectoryAtURL:v26 includingPropertiesForKeys:0 options:4 error:0];

          id v29 = v28;
          if ([v28 count] == 1)
          {
            id v49 = v20;
            uint64_t v50 = v28;
            v51 = [v28 firstObject];
            id v30 = [v51 path];
            char v31 = getSuperBinaryVersionForAsset((uint64_t)v30);

            id v32 = [v25 lastPathComponent];
            __int16 v52 = v31;
            int v33 = [v31 isEqualToString:v32];

            id v19 = v54;
            int v48 = v33;
            if (v33)
            {
              v34 = [v10 accessoryID];
              id v35 = [v34 firmwareVersion];
              uint64_t v46 = uarpVersionCompareStrings();

              BOOL v15 = v46 == 1;
              if (v46 == 1)
              {
                *a4 = (id)[v52 copy];
                *a5 = (id)[v51 copy];
              }
              uint64_t v36 = [v25 URLByAppendingPathComponent:*MEMORY[0x263F38348]];
              id v37 = [MEMORY[0x263F08850] defaultManager];
              id v47 = (void *)v36;
              __int16 v38 = [v37 contentsOfDirectoryAtURL:v36 includingPropertiesForKeys:0 options:4 error:0];

              if ([v38 count] == 1)
              {
                id v39 = [v38 firstObject];
                *a6 = (id)[v39 copy];

                uint64_t v40 = v52;
                int v41 = v48;
                __int16 v42 = v47;
              }
              else
              {
                BOOL v45 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
                uint64_t v40 = v52;
                int v41 = v48;
                __int16 v42 = v47;
                if (v45) {
                  -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:]();
                }
              }

              __int16 v44 = v53;
            }
            else
            {
              uint64_t v40 = v52;
              if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
              {
                __int16 v44 = v53;
                -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:]();
                BOOL v15 = 0;
              }
              else
              {
                BOOL v15 = 0;
                __int16 v44 = v53;
              }
              int v41 = v48;
            }

            if (!v41) {
              BOOL v15 = 0;
            }
            int v20 = v49;
            goto LABEL_23;
          }
          id v19 = v54;
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:]();
          }
        }
LABEL_22:
        BOOL v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v25 = 0;
    goto LABEL_22;
  }

LABEL_4:
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPiCloudAssetManager checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:](log, v10);
  }
  BOOL v15 = 0;
LABEL_24:

  return v15;
}

uint64_t __105__UARPiCloudAssetManager_checkLocalUARPCacheForAccessory_versionAvailable_firmwarePath_releaseNotesPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v17 = 0;
  id v6 = a3;
  id v7 = [v5 pathToSuperBinaryInAccessoryVersionDirectory:a2 uarpVersion:&v17];
  id v8 = v17;
  int v9 = [v7 path];

  id v10 = *(void **)(a1 + 32);
  id v16 = 0;
  char v11 = [v10 pathToSuperBinaryInAccessoryVersionDirectory:v6 uarpVersion:&v16];

  id v12 = v16;
  uint64_t v13 = [v11 path];

  uint64_t v14 = -1;
  if (v9 && v13) {
    uint64_t v14 = uarpVersionCompareStrings();
  }

  return v14;
}

- (id)pathToSuperBinaryInAccessoryVersionDirectory:(id)a3 uarpVersion:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  id v7 = [v5 URLByAppendingPathComponent:*MEMORY[0x263F38340]];
  id v8 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:4 error:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        BOOL v15 = objc_msgSend(v14, "path", (void)v19);
        id v16 = getSuperBinaryVersionForAsset((uint64_t)v15);

        if (v16)
        {
          *a4 = (id)[v16 copy];
          id v17 = (void *)[v14 copy];

          goto LABEL_11;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_11:

  return v17;
}

- (id)moveToUARPCacheFromRemoteURL:(id)a3 assetType:(int64_t)a4 forAcessory:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    uint64_t v10 = (void *)MEMORY[0x263F089D8];
    uint64_t v11 = InternalStorageDirectoryPath();
    uint64_t v12 = [v9 identifier];
    uint64_t v13 = [v9 assetID];
    uint64_t v14 = [v13 assetVersion];
    BOOL v15 = (void *)v14;
    id v16 = (void *)MEMORY[0x263F38348];
  }
  else
  {
    if (a4)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]();
      }
      goto LABEL_32;
    }
    uint64_t v10 = (void *)MEMORY[0x263F089D8];
    uint64_t v11 = InternalStorageDirectoryPath();
    uint64_t v12 = [v9 identifier];
    uint64_t v13 = [v9 assetID];
    uint64_t v14 = [v13 assetVersion];
    BOOL v15 = (void *)v14;
    id v16 = (void *)MEMORY[0x263F38340];
  }
  id v17 = [v10 stringWithFormat:@"%@/%@/%@/%@", v11, v12, v14, *v16];

  id v18 = [MEMORY[0x263F08850] defaultManager];
  char v19 = [v18 fileExistsAtPath:v17];

  if (v19)
  {
    id v20 = 0;
  }
  else
  {
    long long v21 = [MEMORY[0x263F08850] defaultManager];
    id v47 = 0;
    char v22 = [v21 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v47];
    id v23 = v47;

    log = self->_log;
    BOOL v25 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
    if ((v22 & 1) == 0)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v23;
        _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_INFO, "Failed to create UARP Firmware directory error: %@", buf, 0xCu);
      }
LABEL_31:

LABEL_32:
      id v40 = 0;
      goto LABEL_33;
    }
    if (v25)
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v17;
      _os_log_impl(&dword_225D74000, log, OS_LOG_TYPE_INFO, "UARP Firmware directory created %@", buf, 0xCu);
    }
    uint64_t v50 = *MEMORY[0x263F08078];
    v51 = &unk_26D983270;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    id v27 = [MEMORY[0x263F08850] defaultManager];
    id v46 = v23;
    char v28 = [v27 setAttributes:v26 ofItemAtPath:v17 error:&v46];
    id v20 = v46;

    if ((v28 & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]();
    }
  }
  id v29 = [v8 URLByDeletingPathExtension];
  id v30 = [v29 lastPathComponent];
  [v17 appendFormat:@"/%@", v30];

  id v23 = [NSURL fileURLWithPath:v17];
  if (([v23 checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v32 = [MEMORY[0x263F08850] defaultManager];
    id v45 = v20;
    char v33 = [v32 copyItemAtURL:v8 toURL:v23 error:&v45];
    id v34 = v45;

    if (v33)
    {
      id v43 = v9;
      id v31 = v8;
      id v20 = v34;
      goto LABEL_20;
    }
    int v41 = self->_log;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v23;
      _os_log_impl(&dword_225D74000, v41, OS_LOG_TYPE_INFO, "Failed to write to path %@", buf, 0xCu);
    }

    goto LABEL_31;
  }
  id v43 = v9;
  id v31 = v8;
LABEL_20:
  uint64_t v48 = *MEMORY[0x263F08078];
  id v49 = &unk_26D983288;
  id v35 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  uint64_t v36 = [MEMORY[0x263F08850] defaultManager];
  id v37 = [v23 path];
  id v44 = v20;
  char v38 = [v36 setAttributes:v35 ofItemAtPath:v37 error:&v44];
  id v39 = v44;

  if (v38)
  {
    id v40 = v23;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[UARPiCloudAssetManager moveToUARPCacheFromRemoteURL:assetType:forAcessory:]();
    }
    id v40 = 0;
  }
  id v8 = v31;

  id v9 = v43;
LABEL_33:

  return v40;
}

- (void)handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup:(id)a3 batchRequest:(BOOL)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [[UARPiCloudManager alloc] initWithDelegate:self containerID:v9];

  batchedProcessingQueue = self->_batchedProcessingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__UARPiCloudAssetManager_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer___block_invoke;
  block[3] = &unk_2647771C8;
  BOOL v15 = v10;
  id v16 = v8;
  BOOL v17 = a4;
  id v12 = v8;
  uint64_t v13 = v10;
  dispatch_async(batchedProcessingQueue, block);
}

uint64_t __117__UARPiCloudAssetManager_handleRemoteDownloadRequestForSupportedAccessoriesForProductGroup_batchRequest_inContainer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performRemoteFetchForSupportedAccessoriesMetadata:*(void *)(a1 + 40) batchRequest:*(unsigned __int8 *)(a1 + 48)];
}

- (void)handleRemoteDownloadResponseForSupportedAccessories:(id)a3 forProductGroup:(id)a4 isComplete:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(UARPiCloudAssetManager *)self delegateQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __105__UARPiCloudAssetManager_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete___block_invoke;
  v13[3] = &unk_264777100;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __105__UARPiCloudAssetManager_handleRemoteDownloadResponseForSupportedAccessories_forProductGroup_isComplete___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) supportedAccessories:*(void *)(a1 + 40) forProductGroup:*(void *)(a1 + 48) isComplete:*(unsigned __int8 *)(a1 + 56)];
}

- (void)handleRemoteDownloadRequestForAttestationCertificatesForSubjectKeyIdentifier:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[UARPiCloudManager alloc] initWithDelegate:self containerID:v6];

  [(UARPiCloudManager *)v8 performRemoteFetchForAttestationCertificates:v7];
}

- (void)remoteFetchCompletionForAttestationCertificates:(id)a3 subjectKeyIdentifier:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__UARPiCloudAssetManager_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error___block_invoke;
  block[3] = &unk_264777128;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(workQueue, block);
}

uint64_t __101__UARPiCloudAssetManager_remoteFetchCompletionForAttestationCertificates_subjectKeyIdentifier_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleRemoteDownloadResponseForAttestationCertificates:*(void *)(a1 + 40) forSubKeyIdentifier:*(void *)(a1 + 48)];
}

- (void)handleRemoteDownloadResponseForAttestationCertificates:(id)a3 forSubKeyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UARPiCloudAssetManager *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__UARPiCloudAssetManager_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier___block_invoke;
  block[3] = &unk_264777128;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __101__UARPiCloudAssetManager_handleRemoteDownloadResponseForAttestationCertificates_forSubKeyIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) attestationCertificates:a1[5] forSubjectKeyIdentifier:a1[6]];
}

- (unsigned)_getCoreCryptoDigestAlgorithmFromCHIPFirmwareAlgorithm:(unint64_t)a3
{
  if (a3 - 1 > 0xB) {
    return 0;
  }
  else {
    return dword_225D91C20[a3 - 1];
  }
}

- (BOOL)uarpDownloadOnCellularAllowed
{
  return self->_uarpDownloadOnCellularAllowed;
}

- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3
{
  self->_uarpDownloadOnCellularAllowed = a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_batchedProcessingQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong(&self->_cloudManager, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)handleFirmwareDownloadResponseFromLocation:(void *)a1 forAccessory:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 record];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_225D74000, v5, v6, "Downloaded firmware record %@ missing 'firmwareBinaryHash' property", v7, v8, v9, v10, v11);
}

- (void)handleReleaseNotesDownloadResponseFromLocation:(void *)a1 forAccessory:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 record];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_225D74000, v5, v6, "Downloaded firmware record %@ missing 'releaseNotesHash' property", v7, v8, v9, v10, v11);
}

- (void)checkLocalUARPCacheForAccessory:(void *)a1 versionAvailable:(void *)a2 firmwarePath:releaseNotesPath:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 assetID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_225D74000, v5, v6, "Asset with CHIP iCloud asset type not supported for cache %@", v7, v8, v9, v10, v11);
}

- (void)checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_225D74000, v0, v1, "Invalid contents in directory %@, contents %@");
}

- (void)checkLocalUARPCacheForAccessory:versionAvailable:firmwarePath:releaseNotesPath:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_225D74000, v0, v1, "Mismatch firmware version %@ found in directory %@, discarding");
}

- (void)moveToUARPCacheFromRemoteURL:assetType:forAcessory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_225D74000, v0, OS_LOG_TYPE_ERROR, "Invalid assetType %ld", v1, 0xCu);
}

- (void)moveToUARPCacheFromRemoteURL:assetType:forAcessory:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_225D74000, v0, v1, "Failed to set permission for location %@: %@");
}

@end