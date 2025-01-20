@interface SUCoreMobileAsset
+ (BOOL)downloadConfig:(id)a3 isEqualToConfig:(id)a4;
+ (id)_reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 pSUReloadError:(id *)a8 pDocReloadError:(id *)a9;
+ (id)downloadConfigCopy:(id)a3;
+ (id)downloadConfigSummary:(id)a3;
+ (id)downloadOptionsDescription:(id)a3;
+ (void)_callReloadCompletion:(id)a3 withDescriptor:(id)a4 suError:(id)a5 docError:(id)a6;
+ (void)mapMobileAssetErrorIndications;
+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 completion:(id)a6;
+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 defaultValues:(id)a6 completion:(id)a7;
+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 completion:(id)a8;
+ (void)reloadDescriptor:(id)a3 completion:(id)a4;
- (BOOL)assetDownloaded;
- (BOOL)assetRemoved;
- (BOOL)checkedDownloadState;
- (BOOL)downloadingAsset;
- (BOOL)removingAsset;
- (MAAsset)asset;
- (MADownloadConfig)currentDownloadConfig;
- (MADownloadConfig)desiredDownloadConfig;
- (MADownloadConfig)requestedDownloadConfig;
- (MADownloadOptions)downloadOptions;
- (NSString)documentationStashBuild;
- (NSString)operationName;
- (NSString)updateUUID;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_dispatch_queue)maControlQueue;
- (OS_os_transaction)alterDownloadTransaction;
- (OS_os_transaction)downloadAssetTransaction;
- (OS_os_transaction)removeAssetTransaction;
- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5;
- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6 withCompletionQueue:(id)a7;
- (id)_updateAssetTypeName;
- (id)alterDownloadCompletion;
- (id)description;
- (id)downloadCompletion;
- (id)maDelegate;
- (id)removeCompletion;
- (void)_cancelDownloadAndPurge;
- (void)_downloadAssetWithOptions:(id)a3 completion:(id)a4;
- (void)_downloadAssetWithOptions:(id)a3 stashingDocumentationForBuild:(id)a4 completion:(id)a5;
- (void)_issueAlterDownloadCompletion:(int64_t)a3 forReason:(id)a4;
- (void)_registerProgressAndStartDownload;
- (void)_reportAnomaly:(id)a3;
- (void)_reportAnomaly:(id)a3 issuingCompletion:(id)a4;
- (void)_reportAssetRemoveFailed:(id)a3;
- (void)_reportAssetRemoved;
- (void)_reportDownloadFailed:(id)a3;
- (void)_reportDownloadProgress:(id)a3;
- (void)_reportDownloaded:(id)a3;
- (void)_requestChangeConfigDownload:(id)a3;
- (void)_trackMAAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5;
- (void)_trackMobileAssetBegin:(id)a3;
- (void)_trackMobileAssetBegin:(id)a3 withIdentifier:(id)a4;
- (void)_trackMobileAssetEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)_trackMobileAssetEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)alterDownloadOptions:(id)a3;
- (void)alterDownloadOptions:(id)a3 completion:(id)a4;
- (void)downloadConfigStatus:(id)a3;
- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4;
- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5;
- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 stashingDocumentationForBuild:(id)a5 completion:(id)a6;
- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4;
- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5;
- (void)removeAsset;
- (void)removeAsset:(id)a3;
- (void)setAlterDownloadCompletion:(id)a3;
- (void)setAlterDownloadTransaction:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetDownloaded:(BOOL)a3;
- (void)setAssetRemoved:(BOOL)a3;
- (void)setCheckedDownloadState:(BOOL)a3;
- (void)setCurrentDownloadConfig:(id)a3;
- (void)setDesiredDownloadConfig:(id)a3;
- (void)setDocumentationStashBuild:(id)a3;
- (void)setDownloadAssetTransaction:(id)a3;
- (void)setDownloadCompletion:(id)a3;
- (void)setDownloadOptions:(id)a3;
- (void)setDownloadingAsset:(BOOL)a3;
- (void)setOperationName:(id)a3;
- (void)setRemoveAssetTransaction:(id)a3;
- (void)setRemoveCompletion:(id)a3;
- (void)setRemovingAsset:(BOOL)a3;
- (void)setRequestedDownloadConfig:(id)a3;
- (void)setUpdateUUID:(id)a3;
@end

@implementation SUCoreMobileAsset

- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5
{
  return [(SUCoreMobileAsset *)self initWithDelegate:a3 forAsset:a4 updateUUID:a5 withCallbackQueue:0 withCompletionQueue:0];
}

- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6 withCompletionQueue:(id)a7
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v79.receiver = self;
  v79.super_class = (Class)SUCoreMobileAsset;
  v17 = [(SUCoreMobileAsset *)&v79 init];
  v18 = v17;
  if (!v17)
  {
LABEL_36:
    v71 = v18;
    goto LABEL_37;
  }
  objc_storeWeak(&v17->_maDelegate, v12);
  objc_storeStrong((id *)&v18->_asset, a4);
  objc_storeStrong((id *)&v18->_updateUUID, a5);
  documentationStashBuild = v18->_documentationStashBuild;
  v18->_documentationStashBuild = 0;

  downloadOptions = v18->_downloadOptions;
  v18->_downloadOptions = 0;

  currentDownloadConfig = v18->_currentDownloadConfig;
  v18->_currentDownloadConfig = 0;

  requestedDownloadConfig = v18->_requestedDownloadConfig;
  v18->_requestedDownloadConfig = 0;

  desiredDownloadConfig = v18->_desiredDownloadConfig;
  v18->_desiredDownloadConfig = 0;

  v18->_assetRemoved = 0;
  *(_DWORD *)&v18->_downloadingAsset = 0;
  operationName = v18->_operationName;
  v18->_operationName = 0;

  id downloadCompletion = v18->_downloadCompletion;
  v18->_id downloadCompletion = 0;

  id alterDownloadCompletion = v18->_alterDownloadCompletion;
  v18->_id alterDownloadCompletion = 0;

  id removeCompletion = v18->_removeCompletion;
  v18->_id removeCompletion = 0;

  v28 = [MEMORY[0x263F77D78] sharedCore];
  v29 = [v28 commonDomain];

  id v30 = (id) [[NSString alloc] initWithFormat:@"%@.%@", v29, @"ma.control"];
  v31 = (const char *)[v30 UTF8String];
  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v33 = dispatch_queue_create(v31, v32);
  maControlQueue = v18->_maControlQueue;
  v18->_maControlQueue = (OS_dispatch_queue *)v33;

  if (v18->_maControlQueue)
  {
    v35 = [MEMORY[0x263F77DE8] sharedLogger];
    v36 = [v35 oslog];

    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v37)
      {
        v38 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v39 = objc_opt_respondsToSelector();
        v40 = @"NO";
        if (v39) {
          v40 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v40;
        _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloadProgress:) %{public}@", buf, 0xCu);
      }
      v41 = [MEMORY[0x263F77DE8] sharedLogger];
      v42 = [v41 oslog];

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v44 = objc_opt_respondsToSelector();
        v45 = @"NO";
        if (v44) {
          v45 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v45;
        _os_log_impl(&dword_20C8EA000, v42, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloadStalled:) %{public}@", buf, 0xCu);
      }
      v46 = [MEMORY[0x263F77DE8] sharedLogger];
      v47 = [v46 oslog];

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v49 = objc_opt_respondsToSelector();
        v50 = @"NO";
        if (v49) {
          v50 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v50;
        _os_log_impl(&dword_20C8EA000, v47, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloaded:) %{public}@", buf, 0xCu);
      }
      v51 = [MEMORY[0x263F77DE8] sharedLogger];
      v52 = [v51 oslog];

      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v54 = objc_opt_respondsToSelector();
        v55 = @"NO";
        if (v54) {
          v55 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v55;
        _os_log_impl(&dword_20C8EA000, v52, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloadFailed:) %{public}@", buf, 0xCu);
      }
      v56 = [MEMORY[0x263F77DE8] sharedLogger];
      v57 = [v56 oslog];

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        v58 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v59 = objc_opt_respondsToSelector();
        v60 = @"NO";
        if (v59) {
          v60 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v60;
        _os_log_impl(&dword_20C8EA000, v57, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maAssetRemoved) %{public}@", buf, 0xCu);
      }
      v61 = [MEMORY[0x263F77DE8] sharedLogger];
      v62 = [v61 oslog];

      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        v63 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v64 = objc_opt_respondsToSelector();
        v65 = @"NO";
        if (v64) {
          v65 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v65;
        _os_log_impl(&dword_20C8EA000, v62, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maAssetRemoveFailed:) %{public}@", buf, 0xCu);
      }
      v66 = [MEMORY[0x263F77DE8] sharedLogger];
      v36 = [v66 oslog];

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [(SUCoreMobileAsset *)v18 maDelegate];
        char v68 = objc_opt_respondsToSelector();
        v69 = @"NO";
        if (v68) {
          v69 = @"YES";
        }
        *(_DWORD *)buf = 138543362;
        v81 = v69;
        _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maAnomaly:) %{public}@", buf, 0xCu);
      }
    }
    else if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating without delegate", buf, 2u);
    }

    v72 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v73 = [v72 selectDelegateCallbackQueue:v15];
    clientDelegateCallbackQueue = v18->_clientDelegateCallbackQueue;
    v18->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v73;

    v75 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v76 = [v75 selectCompletionQueue:v16];
    clientCompletionQueue = v18->_clientCompletionQueue;
    v18->_clientCompletionQueue = (OS_dispatch_queue *)v76;

    +[SUCoreMobileAsset mapMobileAssetErrorIndications];
    goto LABEL_36;
  }
  v70 = [MEMORY[0x263F77DA8] sharedDiag];
  [v70 trackError:@"[MA]" forReason:@"unable to create MA control dispatch queue" withResult:8100 withError:0];

  v71 = 0;
LABEL_37:

  return v71;
}

+ (void)mapMobileAssetErrorIndications
{
  if (mapMobileAssetErrorIndications_mobileAssetErrorInfoOnce != -1) {
    dispatch_once(&mapMobileAssetErrorIndications_mobileAssetErrorInfoOnce, &__block_literal_global_8);
  }
}

void __51__SUCoreMobileAsset_mapMobileAssetErrorIndications__block_invoke()
{
  v8[6] = *MEMORY[0x263EF8340];
  v7[0] = @"checkSpaceNeeded";
  v0 = [NSNumber numberWithUnsignedLongLong:4];
  v8[0] = v0;
  v7[1] = @"checkNetwork";
  v1 = [NSNumber numberWithUnsignedLongLong:1];
  v8[1] = v1;
  v7[2] = @"checkTimeoutConditions";
  v2 = [NSNumber numberWithUnsignedLongLong:1];
  v8[2] = v2;
  v7[3] = @"pallasNoPMVMatchFound";
  v3 = [NSNumber numberWithUnsignedLongLong:32];
  v8[3] = v3;
  v7[4] = @"pallasNoBuildVersionMatchFound";
  v4 = [NSNumber numberWithUnsignedLongLong:64];
  v8[4] = v4;
  v7[5] = @"timeoutWithDetail";
  v5 = [NSNumber numberWithUnsignedLongLong:128];
  v8[5] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:6];

  [MEMORY[0x263F77DB0] associateLayer:411 withDomain:@"com.apple.MobileAssetError.Download" keyMatchTrueMap:v6];
  [MEMORY[0x263F77DB0] associateLayer:412 withDomain:@"com.apple.MobileAssetError.Query" keyMatchTrueMap:v6];
  [MEMORY[0x263F77DB0] associateLayer:413 withDomain:@"com.apple.MobileAssetError.Purge" keyMatchTrueMap:v6];
  [MEMORY[0x263F77DB0] associateLayer:414 withDomain:@"com.apple.MobileAssetError.Xpc" keyMatchTrueMap:v6];
  [MEMORY[0x263F77DB0] associateLayer:411 withDomain:@"com.apple.MobileAssetError.Download" indicating:32 ifKeyTrue:@"pallasNoPMVMatchFound"];
  [MEMORY[0x263F77DB0] associateLayer:411 withDomain:@"com.apple.MobileAssetError.Download" indicating:128 ifKeyTrue:@"timeoutWithDetail"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:1 codeName:@"MADownloadXpcError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:2 codeName:@"MADownloadConnectionInterrupted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:3 codeName:@"MADownloadFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:4 codeName:@"MADownloadStagingFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:5 codeName:@"MADownloadMetaDataProcessFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:6 codeName:@"MADownloadUnzipFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:7 codeName:@"MADownloadMoveFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:8 codeName:@"MADownloadInstallFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:9 codeName:@"MADownloadDaemonExit"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:10 codeName:@"MADownloadAssetAlreadyInstalled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:11 codeName:@"MADownloadInvalidSZExtractor"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:12 codeName:@"MADownloadNotEntitled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:13 codeName:@"MADownloadDaemonNotReady"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:14 codeName:@"MADownloadNoChange"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:15 codeName:@"MADownloadNotApplicableForRequireByOs"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:16 codeName:@"MADownloadNoExtractorFailure"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:17 codeName:@"MADownloadTransformFailure"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:18 codeName:@"MADownloadNoMatchFound" indicating:32];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:19 codeName:@"MADownloadNilAssetType"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:20 codeName:@"MADownloadNilAssetId"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:21 codeName:@"MADownloadStreamingZipNotSupported"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:22 codeName:@"MADownloadBadOptions"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:23 codeName:@"MADownloadAssetBadMetaData"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:24 codeName:@"MADownloadUnableToCreateMessage"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:25 codeName:@"MADownloadFailedNoStandardUrl"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:26 codeName:@"MADownloadFailedNoFallBackUrl"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:27 codeName:@"MADownloadFailedNoPallasUrl"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:28 codeName:@"MADownloadLostTask"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:29 codeName:@"MADownloadNotApplicableForInstalledWithOs"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:30 codeName:@"MADownloadNoValidSession"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:31 codeName:@"MADownloadResponseDeferred"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:32 codeName:@"MADownloadIncomplete"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:33 codeName:@"MADownloadNoStagingDir"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:34 codeName:@"MADownloadsNotAllowed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:35 codeName:@"MADownloadUnknownResult"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:36 codeName:@"MADownloadAssetNoLongerInCatalog"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:37 codeName:@"MADownloadNoSpaceLeft"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:38 codeName:@"MADownloadCouldNotReplace"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:39 codeName:@"MADownloadMalformedAssetType"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:40 codeName:@"MADownloadServerBadRequest"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:41 codeName:@"MADownloadServerAuthFailure"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:42 codeName:@"MADownloadServerError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:43 codeName:@"MADownloadNotFoundOrDenied"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:44 codeName:@"MADownloadNotFound"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:45 codeName:@"MADownloadServerInternalError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:46 codeName:@"MADownloadMalformedAssetData"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:47 codeName:@"MADownloadNetworkingError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:48 codeName:@"MADownloadCancelled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:49 codeName:@"MADownloadBadUrl"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:50 codeName:@"MADownloadBadServerResponse"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:51 codeName:@"MADownloadTimedOut"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:52 codeName:@"MADownloadTimedOutRequest"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:53 codeName:@"MADownloadTimedOutResource"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:54 codeName:@"MADownloadTimedOutWatchdog"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:55 codeName:@"MADownloadTimedOutStart"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:56 codeName:@"MADownloadTimedOutConnection"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:80 codeName:@"MADownloadTimedOutNoContent"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:81 codeName:@"MADownloadTimedOutBecameStalled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:82 codeName:@"MADownloadTimedOutSlowDownload"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:83 codeName:@"MADownloadTimedOutFrequentStalls"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:57 codeName:@"MADownloadCannotLoadFromNetwork"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:58 codeName:@"MADownloadUnsupportedURL"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:59 codeName:@"MADownloadCannotFindHost"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:60 codeName:@"MADownloadCannotConnectToHost"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:61 codeName:@"MADownloadNetworkConnectionLost"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:62 codeName:@"MADownloadDNSLookupFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:63 codeName:@"MADownloadHTTPTooManyRedirects"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:64 codeName:@"MADownloadResourceUnavailable"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:65 codeName:@"MADownloadNotConnectedToInternet"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:66 codeName:@"MADownloadRedirectToNonExistentLocation"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:67 codeName:@"MADownloadInternationalRoamingOff"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:68 codeName:@"MADownloadCallIsActive"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:69 codeName:@"MADownloadDataNotAllowed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:70 codeName:@"MADownloadSecureConnectionFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:71 codeName:@"MADownloadInvalidReceipts"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:72 codeName:@"MADownloadFailedNoFallbackAllowed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:73 codeName:@"MADownloadLiveServerDisabledNoFallback"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Download" withCode:74 codeName:@"MADownloadMalformedPurpose"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:1 codeName:@"MAQueryXpcError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:2 codeName:@"MAQueryCatalogNotDownloaded"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:3 codeName:@"MAQueryFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:4 codeName:@"MAQueryDaemonExit"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:5 codeName:@"MAQueryNotEntitled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:6 codeName:@"MAQueryCannotCreateMessage"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:7 codeName:@"MAQueryNilAssetType"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:8 codeName:@"MAQueryParamsEncodeFailure"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:9 codeName:@"MAQueryBeforeFirstUnlock"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:10 codeName:@"MAQueryCouldNotEncodeResults"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:11 codeName:@"MAQueryXpcLengthError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:12 codeName:@"MAQueryUnknownResult"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:13 codeName:@"MAQueryTooManyResults"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Query" withCode:14 codeName:@"MAQueryHasAllowedDifferences"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:1 codeName:@"MAPurgeXpcError"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:2 codeName:@"MAPurgeConnectionInterrupted"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:3 codeName:@"MAPurgeAssetDidntExist"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:4 codeName:@"MAPurgeAssetCouldntPurge"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:5 codeName:@"MAPurgeFailed"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:6 codeName:@"MAPurgeNotEntitled"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:7 codeName:@"MAPurgeNotApplicableForRequireByOs"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:8 codeName:@"MAPurgeCouldNotCancelAllDownloads"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:9 codeName:@"MAPurgeCannotCreateMessage"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:10 codeName:@"MAPurgeEncodingFailure"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Purge" withCode:11 codeName:@"MAPurgeFailedBeforeFirstUnlock"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:1 codeName:@"MAXpcErrorParamMissing"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:2 codeName:@"MAXpcErrorLengthZero"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:3 codeName:@"MAXpcErrorLengthMissing"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:4 codeName:@"MAXpcErrorLengthMismatch"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:5 codeName:@"MAXpcErrorDataMismatch"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:6 codeName:@"MAXpcErrorEmptyData"];
  [MEMORY[0x263F77DB0] attributesOfErrorForDomain:@"com.apple.MobileAssetError.Xpc" withCode:7 codeName:@"MAXpcErrorConnectionTerminated"];
}

- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4
{
}

- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [a3 constructMASoftwareUpdateAssetDownloadOptionsWithUUID:a4];
  [(SUCoreMobileAsset *)self _downloadAssetWithOptions:v9 completion:v8];
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4
{
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5
{
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 stashingDocumentationForBuild:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [a3 constructMADocumentationAssetDownloadOptionsWithUUID:a4];
  [(SUCoreMobileAsset *)self _downloadAssetWithOptions:v12 stashingDocumentationForBuild:v11 completion:v10];
}

- (void)alterDownloadOptions:(id)a3
{
}

- (void)alterDownloadOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.AlterDownloadOptions"];
  id v9 = [(SUCoreMobileAsset *)self maControlQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke;
  v13[3] = &unk_2640DCCF8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) alterDownloadCompletion];

  if (v3)
  {
    v4 = [MEMORY[0x263F77DE8] sharedLogger];
    v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_3();
    }

    if (*(void *)(a1 + 56))
    {
      id v6 = [*(id *)(a1 + 32) clientCompletionQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_1025;
      block[3] = &unk_2640DCD98;
      v55 = @"alter download config when already altering with completion - cannot accept additional alteration request";
      id v57 = *(id *)(a1 + 56);
      id v56 = *(id *)(a1 + 40);
      dispatch_async(v6, block);

      id v7 = v55;
LABEL_18:

      return;
    }
    goto LABEL_19;
  }
  if ([*v2 removingAsset])
  {
    id v8 = [MEMORY[0x263F77DE8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_1();
    }

    if (*(void *)(a1 + 56))
    {
      id v10 = [*(id *)(a1 + 32) clientCompletionQueue];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_1029;
      v50[3] = &unk_2640DCD98;
      v51 = @"alter download config when removing asset - alteration of configuration ignored";
      id v53 = *(id *)(a1 + 56);
      id v52 = *(id *)(a1 + 40);
      dispatch_async(v10, v50);

      id v7 = v51;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (![*v2 downloadingAsset])
  {
    id v11 = [MEMORY[0x263F77DE8] sharedLogger];
    id v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_2();
    }

    if (*(void *)(a1 + 56))
    {
      id v13 = [*(id *)(a1 + 32) clientCompletionQueue];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_1036;
      v46[3] = &unk_2640DCD98;
      v47 = @"alter download config when not downloading - alteration of configuration ignored";
      id v49 = *(id *)(a1 + 56);
      id v48 = *(id *)(a1 + 40);
      dispatch_async(v13, v46);

      id v7 = v47;
      goto LABEL_18;
    }
LABEL_19:
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"ma.AlterDownloadOptions"];
    return;
  }
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlterDownloadCompletion:");
    [*(id *)(a1 + 32) setAlterDownloadTransaction:*(void *)(a1 + 40)];
  }
  else
  {
    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"ma.AlterDownloadOptions"];
  }
  id v14 = [*v2 desiredDownloadConfig];

  if (v14)
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = [*(id *)(a1 + 32) requestedDownloadConfig];
    BOOL v17 = +[SUCoreMobileAsset downloadConfig:v15 isEqualToConfig:v16];

    if (v17)
    {
      v18 = [MEMORY[0x263F77DE8] sharedLogger];
      v19 = [v18 oslog];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = *v2;
        v21 = [*v2 requestedDownloadConfig];
        v22 = +[SUCoreMobileAsset downloadConfigSummary:v21];
        *(_DWORD *)buf = 138543618;
        id v59 = v20;
        __int16 v60 = 2114;
        v61 = v22;
        _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ alter download config to same as being requested (%{public}@) | dropping earlier desire to alter", buf, 0x16u);
      }
      [*v2 setDesiredDownloadConfig:0];
      return;
    }
    [*(id *)(a1 + 32) setDesiredDownloadConfig:*(void *)(a1 + 48)];
    v34 = [MEMORY[0x263F77DE8] sharedLogger];
    v29 = [v34 oslog];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = *v2;
      v31 = [v35 desiredDownloadConfig];
      v32 = +[SUCoreMobileAsset downloadConfigSummary:v31];
      *(_DWORD *)buf = 138543618;
      id v59 = v35;
      __int16 v60 = 2114;
      v61 = v32;
      dispatch_queue_t v33 = "%{public}@ alter download config to different than requested | replacing earlier desire to alter with latest"
            " desired (%{public}@)";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v23 = [*(id *)(a1 + 32) requestedDownloadConfig];

  uint64_t v24 = *(void *)(a1 + 48);
  v25 = *(void **)(a1 + 32);
  if (v23)
  {
    v26 = [v25 requestedDownloadConfig];
    BOOL v27 = +[SUCoreMobileAsset downloadConfig:v24 isEqualToConfig:v26];

    if (v27)
    {
      v28 = [MEMORY[0x263F77DE8] sharedLogger];
      v29 = [v28 oslog];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = *v2;
        v31 = [v30 requestedDownloadConfig];
        v32 = +[SUCoreMobileAsset downloadConfigSummary:v31];
        *(_DWORD *)buf = 138543618;
        id v59 = v30;
        __int16 v60 = 2114;
        v61 = v32;
        dispatch_queue_t v33 = "%{public}@ alter download config to same as being requested (%{public}@)";
LABEL_38:
        _os_log_impl(&dword_20C8EA000, v29, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 32) setDesiredDownloadConfig:*(void *)(a1 + 48)];
      v41 = [MEMORY[0x263F77DE8] sharedLogger];
      v29 = [v41 oslog];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v42 = *v2;
        v31 = [v42 desiredDownloadConfig];
        v32 = +[SUCoreMobileAsset downloadConfigSummary:v31];
        *(_DWORD *)buf = 138543618;
        id v59 = v42;
        __int16 v60 = 2114;
        v61 = v32;
        dispatch_queue_t v33 = "%{public}@ alter download config to different than being requested | remembering desired (%{public}@)";
        goto LABEL_38;
      }
    }
LABEL_39:

    return;
  }
  v36 = [v25 currentDownloadConfig];
  BOOL v37 = +[SUCoreMobileAsset downloadConfig:v24 isEqualToConfig:v36];

  if (v37)
  {
    id v38 = [NSString alloc];
    char v39 = [*v2 currentDownloadConfig];
    v40 = +[SUCoreMobileAsset downloadConfigSummary:v39];
    id v45 = (id)[v38 initWithFormat:@"alter download config when currently at expressed config (%@)", v40];

    [*v2 _issueAlterDownloadCompletion:0 forReason:v45];
  }
  else
  {
    v43 = *(void **)(a1 + 32);
    uint64_t v44 = *(void *)(a1 + 48);
    [v43 _requestChangeConfigDownload:v44];
  }
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_1025(void *a1)
{
  v2 = [MEMORY[0x263F77D78] sharedCore];
  id v3 = [v2 buildError:8703 underlying:0 description:a1[4]];

  (*(void (**)(void))(a1[6] + 16))();
  [MEMORY[0x263F77D78] endTransaction:a1[5] withName:@"ma.AlterDownloadOptions"];
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_1029(void *a1)
{
  v2 = [MEMORY[0x263F77D78] sharedCore];
  id v3 = [v2 buildError:8703 underlying:0 description:a1[4]];

  (*(void (**)(void))(a1[6] + 16))();
  [MEMORY[0x263F77D78] endTransaction:a1[5] withName:@"ma.AlterDownloadOptions"];
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_1036(void *a1)
{
  v2 = [MEMORY[0x263F77D78] sharedCore];
  id v3 = [v2 buildError:8703 underlying:0 description:a1[4]];

  (*(void (**)(void))(a1[6] + 16))();
  [MEMORY[0x263F77D78] endTransaction:a1[5] withName:@"ma.AlterDownloadOptions"];
}

- (void)downloadConfigStatus:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.DownloadConfigStatus.Completion"];
  id v6 = [(SUCoreMobileAsset *)self maControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke;
  block[3] = &unk_2640DCD98;
  id v10 = v5;
  id v11 = v4;
  void block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

void __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke(id *a1)
{
  if ([a1[4] downloadingAsset] && (objc_msgSend(a1[4], "removingAsset") & 1) == 0)
  {
    id v6 = [a1[4] currentDownloadConfig];
    id v3 = +[SUCoreMobileAsset downloadConfigCopy:v6];

    id v7 = [a1[4] requestedDownloadConfig];
    id v4 = +[SUCoreMobileAsset downloadConfigCopy:v7];

    v2 = [a1[4] desiredDownloadConfig];
    v5 = +[SUCoreMobileAsset downloadConfigCopy:v2];
  }
  else
  {
    v2 = [a1[4] currentDownloadConfig];
    id v3 = +[SUCoreMobileAsset downloadConfigCopy:v2];
    id v4 = 0;
    v5 = 0;
  }

  id v8 = a1[4];
  if (a1[6])
  {
    id v9 = [v8 clientCompletionQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke_2;
    v10[3] = &unk_2640DCDC0;
    id v16 = a1[6];
    id v11 = v3;
    id v12 = v4;
    id v13 = v5;
    id v14 = 0;
    id v15 = a1[5];
    dispatch_async(v9, v10);
  }
  else
  {
    [v8 _trackMAAnomaly:@"CONFIG" result:8101 description:@"download config status requested with no completion provided"];
    [MEMORY[0x263F77D78] endTransaction:a1[5] withName:@"ma.DownloadConfigStatus.Completion"];
  }
}

uint64_t __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 64);

  return [v2 endTransaction:v3 withName:@"ma.DownloadConfigStatus.Completion"];
}

- (void)removeAsset
{
}

- (void)removeAsset:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.RemoveAsset"];
  id v6 = [(SUCoreMobileAsset *)self maControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__SUCoreMobileAsset_removeAsset___block_invoke;
  block[3] = &unk_2640DCD98;
  id v10 = v5;
  id v11 = v4;
  void block[4] = self;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, block);
}

uint64_t __33__SUCoreMobileAsset_removeAsset___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) removingAsset])
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = [MEMORY[0x263F77D78] sharedCore];
    id v4 = [v3 buildError:8115 underlying:0 description:@"remove requested when already removing"];
    [v2 _reportAnomaly:v4 issuingCompletion:*(void *)(a1 + 48)];

    v5 = (void *)MEMORY[0x263F77D78];
    uint64_t v6 = *(void *)(a1 + 40);
    return [v5 endTransaction:v6 withName:@"ma.RemoveAsset"];
  }
  else
  {
    [*(id *)(a1 + 32) setRemoveAssetTransaction:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setRemoveCompletion:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setRemovingAsset:1];
    [*(id *)(a1 + 32) setAssetDownloaded:0];
    [*(id *)(a1 + 32) setAssetRemoved:0];
    id v8 = [NSString alloc];
    id v9 = [*(id *)(a1 + 32) _updateAssetTypeName];
    id v10 = [*(id *)(a1 + 32) updateUUID];
    id v11 = (void *)[v8 initWithFormat:@"[MA-REMOVE:%@(%@)]", v9, v10];
    [*(id *)(a1 + 32) setOperationName:v11];

    id v12 = *(void **)(a1 + 32);
    return [v12 _cancelDownloadAndPurge];
  }
}

- (void)_downloadAssetWithOptions:(id)a3 completion:(id)a4
{
}

- (void)_downloadAssetWithOptions:(id)a3 stashingDocumentationForBuild:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.DownloadAsset"];
  id v12 = [(SUCoreMobileAsset *)self maControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SUCoreMobileAsset__downloadAssetWithOptions_stashingDocumentationForBuild_completion___block_invoke;
  block[3] = &unk_2640DCD20;
  id v20 = v9;
  id v21 = v10;
  void block[4] = self;
  id v18 = v11;
  id v19 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v12, block);
}

void __88__SUCoreMobileAsset__downloadAssetWithOptions_stashingDocumentationForBuild_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) downloadingAsset] & 1) != 0
    || [*(id *)(a1 + 32) removingAsset])
  {
    id v2 = [NSString alloc];
    if ([*(id *)(a1 + 32) downloadingAsset]) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    if ([*(id *)(a1 + 32) removingAsset]) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    id v38 = (id)[v2 initWithFormat:@"download requested when busy performing other MA operation (downloading=%@, removing=%@)", v3, v4];
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [MEMORY[0x263F77D78] sharedCore];
    id v7 = [v6 buildError:8115 underlying:0 description:v38];
    [v5 _reportAnomaly:v7 issuingCompletion:*(void *)(a1 + 64)];

    [MEMORY[0x263F77D78] endTransaction:*(void *)(a1 + 40) withName:@"ma.DownloadAsset"];

    return;
  }
  if ([*(id *)(a1 + 32) assetDownloaded])
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [MEMORY[0x263F77D78] sharedCore];
    id v10 = [v9 buildError:8115 underlying:0 description:@"download requested when asset was already downloaded"];
    [v8 _reportAnomaly:v10 issuingCompletion:*(void *)(a1 + 64)];

    id v11 = (void *)MEMORY[0x263F77D78];
    uint64_t v12 = *(void *)(a1 + 40);
    [v11 endTransaction:v12 withName:@"ma.DownloadAsset"];
    return;
  }
  [*(id *)(a1 + 32) setDownloadAssetTransaction:*(void *)(a1 + 40)];
  id v13 = [*(id *)(a1 + 32) currentDownloadConfig];
  if (v13
    || ([*(id *)(a1 + 32) requestedDownloadConfig],
        (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_19:
    id v14 = [NSString alloc];
    id v15 = [*(id *)(a1 + 32) currentDownloadConfig];
    if (v15)
    {
      id v16 = [*(id *)(a1 + 32) currentDownloadConfig];
    }
    else
    {
      id v16 = @"NONE";
    }
    BOOL v17 = [*(id *)(a1 + 32) requestedDownloadConfig];
    if (v17)
    {
      id v18 = [*(id *)(a1 + 32) requestedDownloadConfig];
    }
    else
    {
      id v18 = @"NONE";
    }
    id v19 = [*(id *)(a1 + 32) desiredDownloadConfig];
    if (v19)
    {
      id v20 = [*(id *)(a1 + 32) desiredDownloadConfig];
      id v21 = (void *)[v14 initWithFormat:@"starting to download asset with stale download config, current=%@, requested=%@, desired=%@", v16, v18, v20];
    }
    else
    {
      id v21 = (void *)[v14 initWithFormat:@"starting to download asset with stale download config, current=%@, requested=%@, desired=%@", v16, v18, @"NONE"];
    }

    if (v17) {
    if (v15)
    }

    v22 = *(void **)(a1 + 32);
    v23 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v24 = [v23 buildError:8111 underlying:0 description:v21];
    [v22 _reportAnomaly:v24 issuingCompletion:0];

    [*(id *)(a1 + 32) setCurrentDownloadConfig:0];
    [*(id *)(a1 + 32) setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];

    goto LABEL_33;
  }
  BOOL v37 = [*(id *)(a1 + 32) desiredDownloadConfig];

  if (v37) {
    goto LABEL_19;
  }
LABEL_33:
  [*(id *)(a1 + 32) setDownloadOptions:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDocumentationStashBuild:*(void *)(a1 + 56)];
  v25 = [MEMORY[0x263F77DE8] sharedLogger];
  v26 = [v25 oslog];

  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    uint64_t v40 = v27;
    _os_log_impl(&dword_20C8EA000, v26, OS_LOG_TYPE_DEFAULT, "Setting stashDocumentationBuild=%@", buf, 0xCu);
  }

  id v28 = objc_alloc_init(MEMORY[0x263F559A8]);
  [*(id *)(a1 + 32) setCurrentDownloadConfig:v28];

  v29 = [*(id *)(a1 + 32) downloadOptions];

  if (v29)
  {
    id v30 = [*(id *)(a1 + 32) downloadOptions];
    uint64_t v31 = [v30 discretionary];
    v32 = [*(id *)(a1 + 32) currentDownloadConfig];
    [v32 setDiscretionary:v31];
  }
  [*(id *)(a1 + 32) setDownloadCompletion:*(void *)(a1 + 64)];
  id v33 = [NSString alloc];
  v34 = [*(id *)(a1 + 32) _updateAssetTypeName];
  id v35 = [*(id *)(a1 + 32) updateUUID];
  v36 = (void *)[v33 initWithFormat:@"[MA-DOWNLOAD:%@(%@)]", v34, v35];
  [*(id *)(a1 + 32) setOperationName:v36];

  [*(id *)(a1 + 32) setDownloadingAsset:1];
  [*(id *)(a1 + 32) setAssetDownloaded:0];
  [*(id *)(a1 + 32) setAssetRemoved:0];
  [*(id *)(a1 + 32) _registerProgressAndStartDownload];
}

- (void)_registerProgressAndStartDownload
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ download options unexpectedly MADownloadOptions when expecting MAMsuDownloadOptions", (uint8_t *)&v2, 0xCu);
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) maControlQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2;
  v6[3] = &unk_2640DCE98;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) removingAsset] & 1) != 0
    || [*(id *)(a1 + 32) assetRemoved])
  {
    int v2 = [MEMORY[0x263F77DE8] sharedLogger];
    id v3 = [v2 oslog];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void **)(a1 + 32);
      if ([v4 removingAsset]) {
        id v5 = @"YES";
      }
      else {
        id v5 = @"NO";
      }
      int v6 = [*(id *)(a1 + 32) assetRemoved];
      *(_DWORD *)buf = 138543874;
      if (v6) {
        id v7 = @"YES";
      }
      else {
        id v7 = @"NO";
      }
      v23 = v4;
      __int16 v24 = 2114;
      v25 = v5;
      __int16 v26 = 2114;
      uint64_t v27 = v7;
      _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ download progress when removing(%{public}@), removed(%{public}@) - progress report ignored", buf, 0x20u);
    }
  }
  else if ([*(id *)(a1 + 32) downloadingAsset])
  {
    float v8 = 0.0;
    if ([*(id *)(a1 + 40) totalWritten] >= 1 && objc_msgSend(*(id *)(a1 + 40), "totalExpected"))
    {
      float v9 = (float)[*(id *)(a1 + 40) totalWritten];
      float v8 = v9 / (float)[*(id *)(a1 + 40) totalExpected];
    }
    id v10 = objc_alloc(MEMORY[0x263F77E08]);
    uint64_t v11 = *MEMORY[0x263F781A0];
    uint64_t v12 = [*(id *)(a1 + 40) isStalled];
    uint64_t v13 = [*(id *)(a1 + 40) totalWritten];
    uint64_t v14 = [*(id *)(a1 + 40) totalExpected];
    [*(id *)(a1 + 40) expectedTimeRemaining];
    double v16 = v15;
    BOOL v17 = [*(id *)(a1 + 40) taskDescription];
    *(float *)&double v18 = v8;
    id v21 = (id)[v10 initWithPhase:v11 isStalled:v12 portionComplete:v13 totalWrittenBytes:v14 totalExpectedBytes:v17 remaining:v18 taskDescription:v16];

    id v19 = *(void **)(a1 + 32);
    if (v21) {
      objc_msgSend(v19, "_reportDownloadProgress:");
    }
    else {
      [v19 _trackMAAnomaly:@"PROGRESS" result:8100 description:@"unable to create progress report"];
    }
  }
  else
  {
    id v20 = *(void **)(a1 + 32);
    [v20 _trackMAAnomaly:@"PROGRESS" result:8115 description:@"progress indication when not downloading (and not removing)"];
  }
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_1086(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"startDownload" withResult:a2 withError:v5];
  int v6 = [*(id *)(a1 + 32) maControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2_1087;
  block[3] = &unk_2640DDE70;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = a2;
  void block[4] = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2_1087(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) downloadingAsset];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setDownloadingAsset:0];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4 == 10 || v4 == 0)
    {
      int v6 = *(void **)(a1 + 32);
      id v7 = objc_alloc(MEMORY[0x263F77E08]);
      LODWORD(v8) = 1.0;
      float v9 = (void *)[v7 initWithPhase:*MEMORY[0x263F781A0] isStalled:0 portionComplete:-1 totalWrittenBytes:-1 totalExpectedBytes:v8 remaining:0.0];
      [v6 _reportDownloaded:v9];

      if (([*(id *)(a1 + 32) removingAsset] & 1) == 0)
      {
        uint64_t v11 = *(void **)(a1 + 32);
        [v11 setAssetDownloaded:1];
      }
    }
    else
    {
      id v10 = [MEMORY[0x263F77D78] sharedCore];
      id v12 = [v10 buildError:8700 underlying:*(void *)(a1 + 40) description:@"failed to download asset"];

      [*(id *)(a1 + 32) _reportDownloadFailed:v12];
    }
  }
  else
  {
    [v3 _trackMAAnomaly:@"DOWNLOAD" result:8115 description:@"download finished when not downloading"];
  }
}

- (void)_requestChangeConfigDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(SUCoreMobileAsset *)self asset];

  if (v6)
  {
    [(SUCoreMobileAsset *)self setRequestedDownloadConfig:v4];
    id v7 = [NSString alloc];
    double v8 = [(SUCoreMobileAsset *)self operationName];
    float v9 = +[SUCoreMobileAsset downloadConfigSummary:v4];
    id v10 = (void *)[v7 initWithFormat:@"%@ [requesting (%@)]", v8, v9];

    [(SUCoreMobileAsset *)self _trackMobileAssetBegin:@"configDownload" withIdentifier:v10];
    uint64_t v11 = [(SUCoreMobileAsset *)self asset];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke;
    v15[3] = &unk_2640DDF10;
    v15[4] = self;
    id v16 = v10;
    id v12 = v10;
    objc_msgSend(v11, "SUCoreBorder_configDownload:completion:", v4, v15);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreMobileAsset _requestChangeConfigDownload:]((uint64_t)self, v14);
    }

    [(SUCoreMobileAsset *)self setRequestedDownloadConfig:0];
    [(SUCoreMobileAsset *)self setDesiredDownloadConfig:0];
    id v12 = (id)[[NSString alloc] initWithFormat:@"alter download config failed - unable to change download config (self.asset is not present)"];
    [(SUCoreMobileAsset *)self _issueAlterDownloadCompletion:8703 forReason:v12];
  }
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"configDownload" withIdentifier:*(void *)(a1 + 40) withResult:a2 withError:0];
  id v4 = [*(id *)(a1 + 32) maControlQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_2;
  v5[3] = &unk_2640DDEE8;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a2;
  dispatch_async(v4, v5);
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    id v3 = [*(id *)(a1 + 32) alterDownloadCompletion];
    if (v3)
    {
    }
    else if (([*(id *)(a1 + 32) checkedDownloadState] & 1) == 0)
    {
      [*(id *)(a1 + 32) setCheckedDownloadState:1];
      id v12 = [MEMORY[0x263F77D78] sharedCore];
      uint64_t v13 = [v12 waitedOperationQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_3;
      block[3] = &unk_2640DC338;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v13, block);

      return;
    }
    uint64_t v2 = *(void *)(a1 + 40);
  }
  id v4 = *(void **)(a1 + 32);
  if (v2)
  {
    [v4 setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
    id v5 = *(void **)(a1 + 32);
    id v14 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"alter download config failed with result:%ld (MAOperationResult)", *(void *)(a1 + 40));
    [v5 _issueAlterDownloadCompletion:8703 forReason:v14];
LABEL_8:

    return;
  }
  int v6 = [v4 requestedDownloadConfig];

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    double v8 = [v7 requestedDownloadConfig];
    [*(id *)(a1 + 32) setCurrentDownloadConfig:v8];

    [*(id *)(a1 + 32) setRequestedDownloadConfig:0];
    float v9 = [*(id *)(a1 + 32) desiredDownloadConfig];

    id v10 = *(void **)(a1 + 32);
    if (v9)
    {
      id v14 = [v10 desiredDownloadConfig];
      [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
      [*(id *)(a1 + 32) _requestChangeConfigDownload:v14];
      goto LABEL_8;
    }
    uint64_t v11 = @"successful config and no later desired config";
  }
  else
  {
    [v7 _trackMAAnomaly:@"CONFIG" result:8101 description:@"successful config change when no change requested"];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = @"successful config change when no requested config";
  }

  [v10 _issueAlterDownloadCompletion:0 forReason:v11];
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _trackMobileAssetBegin:@"refreshState"];
  uint64_t v2 = [*(id *)(a1 + 32) asset];
  unsigned int v3 = objc_msgSend(v2, "SUCoreBorder_refreshState");

  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"refreshState" withResult:v3 withError:0];
  id v4 = [*(id *)(a1 + 32) maControlQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_4;
  v5[3] = &unk_2640DDEC0;
  char v6 = v3;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned int v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    [v3 setRequestedDownloadConfig:0];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
    float v9 = *(void **)(a1 + 32);
    id v10 = @"alter download config failed to config and failed to refresh state";
    uint64_t v11 = 8115;
    goto LABEL_6;
  }
  id v4 = [v3 desiredDownloadConfig];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) currentDownloadConfig];
    char v6 = [*(id *)(a1 + 32) desiredDownloadConfig];
    BOOL v7 = +[SUCoreMobileAsset downloadConfig:v5 isEqualToConfig:v6];

    double v8 = *(void **)(a1 + 32);
    if (v7)
    {
      [v8 setRequestedDownloadConfig:0];
      [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
      float v9 = *(void **)(a1 + 32);
      id v10 = @"successfully refreshed state when desired config matches current config";
      uint64_t v11 = 0;
LABEL_6:
      [v9 _issueAlterDownloadCompletion:v11 forReason:v10];
      return;
    }
    id v12 = [v8 desiredDownloadConfig];
    [*(id *)(a1 + 32) setDesiredDownloadConfig:0];
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) requestedDownloadConfig];
  }
  [*(id *)(a1 + 32) setRequestedDownloadConfig:0];
  [*(id *)(a1 + 32) _requestChangeConfigDownload:v12];
}

- (void)_issueAlterDownloadCompletion:(int64_t)a3 forReason:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v7);

  double v8 = [MEMORY[0x263F77DE8] sharedLogger];
  float v9 = [v8 oslog];

  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SUCoreMobileAsset _issueAlterDownloadCompletion:forReason:]();
    }

    float v9 = [MEMORY[0x263F77D78] sharedCore];
    id v10 = [v9 buildError:a3 underlying:0 description:v6];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(SUCoreMobileAsset *)self currentDownloadConfig];
      id v12 = +[SUCoreMobileAsset downloadConfigSummary:v11];
      *(_DWORD *)buf = 138543874;
      __int16 v24 = self;
      __int16 v25 = 2114;
      __int16 v26 = v12;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_20C8EA000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully altered download config (%{public}@) | %{public}@", buf, 0x20u);
    }
    id v10 = 0;
  }

  uint64_t v13 = [(SUCoreMobileAsset *)self alterDownloadCompletion];

  if (v13)
  {
    id v14 = [(SUCoreMobileAsset *)self alterDownloadCompletion];
    double v15 = [(SUCoreMobileAsset *)self alterDownloadTransaction];
    [(SUCoreMobileAsset *)self setAlterDownloadCompletion:0];
    [(SUCoreMobileAsset *)self setAlterDownloadTransaction:0];
    id v16 = [(SUCoreMobileAsset *)self clientCompletionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__SUCoreMobileAsset__issueAlterDownloadCompletion_forReason___block_invoke;
    block[3] = &unk_2640DC2C0;
    id v22 = v14;
    id v20 = v10;
    id v21 = v15;
    id v17 = v15;
    id v18 = v14;
    dispatch_async(v16, block);
  }
}

uint64_t __61__SUCoreMobileAsset__issueAlterDownloadCompletion_forReason___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  int v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"ma.AlterDownloadOptions"];
}

- (void)_cancelDownloadAndPurge
{
  uint64_t v3 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SUCoreMobileAsset *)self asset];

  if (v4)
  {
    [(SUCoreMobileAsset *)self _trackMobileAssetBegin:@"cancelDownload"];
    id v5 = [(SUCoreMobileAsset *)self asset];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke;
    v8[3] = &unk_2640DCC80;
    v8[4] = self;
    objc_msgSend(v5, "SUCoreBorder_cancelDownload:", v8);
  }
  else
  {
    id v6 = [MEMORY[0x263F77D78] sharedCore];
    id v7 = [v6 buildError:8701 underlying:0 description:@"failed to purge asset (self.asset is not present)"];

    [(SUCoreMobileAsset *)self _reportAssetRemoveFailed:v7];
  }
}

void __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"cancelDownload" withResult:a2 withError:0];
  [*(id *)(a1 + 32) _trackMobileAssetBegin:@"purgeWithError"];
  uint64_t v3 = [*(id *)(a1 + 32) asset];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_2;
  v4[3] = &unk_2640DDE98;
  v4[4] = *(void *)(a1 + 32);
  objc_msgSend(v3, "SUCoreBorder_purgeWithError:", v4);
}

void __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) _trackMobileAssetEnd:@"purgeWithError" withResult:a2 withError:v5];
  id v6 = [*(id *)(a1 + 32) maControlQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_3;
  block[3] = &unk_2640DDE70;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = a2;
  void block[4] = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) removingAsset])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2 == 3 || v2 == 0)
    {
      [*(id *)(a1 + 32) _reportAssetRemoved];
    }
    else
    {
      id v6 = [MEMORY[0x263F77D78] sharedCore];
      uint64_t v7 = [v6 buildError:8701 underlying:*(void *)(a1 + 40) description:@"failed to purge asset"];

      [*(id *)(a1 + 32) _reportAssetRemoveFailed:v7];
    }
    [*(id *)(a1 + 32) setAssetRemoved:1];
    id v8 = *(void **)(a1 + 32);
    return [v8 setRemovingAsset:0];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _trackMAAnomaly:@"CANCEL" result:8115 description:@"purge finished when not removing"];
  }
}

- (void)_reportDownloadProgress:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v5);

  if (![(SUCoreMobileAsset *)self removingAsset]
    && ![(SUCoreMobileAsset *)self assetRemoved])
  {
    int v6 = [v4 isStalled];
    uint64_t v7 = [(SUCoreMobileAsset *)self maDelegate];
    if (v6)
    {
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        float v9 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke;
        block[3] = &unk_2640DCE98;
        void block[4] = self;
        id v19 = v4;
        dispatch_async(v9, block);

        id v10 = v19;
LABEL_8:

        goto LABEL_12;
      }
    }
    else
    {
      int v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v12 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke_2;
        v16[3] = &unk_2640DCE98;
        v16[4] = self;
        id v17 = v4;
        dispatch_async(v12, v16);

        id v10 = v17;
        goto LABEL_8;
      }
    }
    uint64_t v13 = [MEMORY[0x263F77DE8] sharedLogger];
    id v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [v4 summary];
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ download progress (not reported): progress=%{public}@", buf, 0x16u);
    }
  }
LABEL_12:
}

void __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maDownloadStalled:*(void *)(a1 + 40)];
}

void __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maDownloadProgress:*(void *)(a1 + 40)];
}

- (void)_reportDownloaded:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [(SUCoreMobileAsset *)self documentationStashBuild];
    float v9 = +[SUCoreDocumentationDataManager sharedManager];
    *(_DWORD *)buf = 138412546;
    v47 = v8;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Report downloaded, found stashDocumentationBuild=%@ sharedmanager:%@", buf, 0x16u);
  }
  id v10 = [(SUCoreMobileAsset *)self documentationStashBuild];

  if (v10)
  {
    int v11 = [MEMORY[0x263F77DE8] sharedLogger];
    id v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(SUCoreMobileAsset *)self documentationStashBuild];
      *(_DWORD *)buf = 138543618;
      v47 = self;
      __int16 v48 = 2114;
      id v49 = v13;
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Stashing documentation asset for build: %{public}@", buf, 0x16u);
    }
    id v14 = +[SUCoreDocumentationDataManager sharedManager];
    double v15 = [(SUCoreMobileAsset *)self asset];
    id v16 = [(SUCoreMobileAsset *)self documentationStashBuild];
    id v45 = 0;
    char v17 = [v14 stashDocumentationAssetData:v15 forBuildVersion:v16 error:&v45];
    id v18 = v45;

    if ((v17 & 1) == 0)
    {
      id v19 = [MEMORY[0x263F77DE8] sharedLogger];
      id v20 = [v19 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SUCoreMobileAsset _reportDownloaded:]();
      }
    }
    [(SUCoreMobileAsset *)self setDocumentationStashBuild:0];
  }
  if ([(SUCoreMobileAsset *)self removingAsset]
    || [(SUCoreMobileAsset *)self assetRemoved]
    || ([(SUCoreMobileAsset *)self maDelegate],
        id v21 = objc_claimAutoreleasedReturnValue(),
        char v22 = objc_opt_respondsToSelector(),
        v21,
        (v22 & 1) == 0))
  {
    char v26 = 0;
  }
  else
  {
    v23 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.DownloadAsset.Delegate"];
    uint64_t v24 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SUCoreMobileAsset__reportDownloaded___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v43 = v4;
    id v44 = v23;
    id v25 = v23;
    dispatch_async(v24, block);

    char v26 = 1;
  }
  __int16 v27 = [(SUCoreMobileAsset *)self downloadCompletion];

  if (v27)
  {
    id v28 = [(SUCoreMobileAsset *)self downloadCompletion];
    [(SUCoreMobileAsset *)self setDownloadCompletion:0];
    uint64_t v29 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.DownloadAsset.Completion"];
    id v30 = [(SUCoreMobileAsset *)self clientCompletionQueue];
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    id v38 = __39__SUCoreMobileAsset__reportDownloaded___block_invoke_2;
    char v39 = &unk_2640DC4C8;
    id v40 = v29;
    id v41 = v28;
    id v31 = v29;
    v32 = v28;
    dispatch_async(v30, &v36);

LABEL_18:
    goto LABEL_19;
  }
  if (v26) {
    goto LABEL_20;
  }
  id v35 = [MEMORY[0x263F77DE8] sharedLogger];
  v32 = [v35 oslog];

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = [v4 summary];
    *(_DWORD *)buf = 138543618;
    v47 = self;
    __int16 v48 = 2114;
    id v49 = v31;
    _os_log_impl(&dword_20C8EA000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ downloaded (not reported): progress=%{public}@", buf, 0x16u);
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  id v33 = (void *)MEMORY[0x263F77D78];
  v34 = [(SUCoreMobileAsset *)self downloadAssetTransaction];
  [v33 endTransaction:v34 withName:@"ma.DownloadAsset"];

  [(SUCoreMobileAsset *)self setDownloadAssetTransaction:0];
}

uint64_t __39__SUCoreMobileAsset__reportDownloaded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maDownloaded:*(void *)(a1 + 40)];

  uint64_t v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"ma.DownloadAsset.Delegate"];
}

uint64_t __39__SUCoreMobileAsset__reportDownloaded___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 endTransaction:v3 withName:@"ma.DownloadAsset.Completion"];
}

- (void)_reportDownloadFailed:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v7 = [v6 oslog];

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [(SUCoreMobileAsset *)self documentationStashBuild];
    *(_DWORD *)buf = 138412290;
    id v35 = v8;
    _os_log_impl(&dword_20C8EA000, v7, OS_LOG_TYPE_DEFAULT, "Report download failed, found stashDocumentationBuild=%@", buf, 0xCu);
  }
  if ([(SUCoreMobileAsset *)self removingAsset]
    || [(SUCoreMobileAsset *)self assetRemoved]
    || ([(SUCoreMobileAsset *)self maDelegate],
        float v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) == 0))
  {
    char v14 = 0;
  }
  else
  {
    int v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.DownloadAsset.Delegate"];
    id v12 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v32 = v4;
    id v33 = v11;
    id v13 = v11;
    dispatch_async(v12, block);

    char v14 = 1;
  }
  double v15 = [(SUCoreMobileAsset *)self downloadCompletion];

  if (v15)
  {
    id v16 = [(SUCoreMobileAsset *)self downloadCompletion];
    [(SUCoreMobileAsset *)self setDownloadCompletion:0];
    char v17 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.DownloadAsset.Completion"];
    id v18 = [(SUCoreMobileAsset *)self clientCompletionQueue];
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    char v26 = __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke_2;
    __int16 v27 = &unk_2640DC2C0;
    id v30 = v16;
    id v28 = v4;
    id v29 = v17;
    id v19 = v17;
    id v20 = v16;
    dispatch_async(v18, &v24);
  }
  else
  {
    if (v14) {
      goto LABEL_11;
    }
    v23 = [MEMORY[0x263F77DE8] sharedLogger];
    id v20 = [v23 oslog];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = self;
      __int16 v36 = 2114;
      id v37 = v4;
      _os_log_impl(&dword_20C8EA000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ download failed (not reported): error=%{public}@", buf, 0x16u);
    }
  }

LABEL_11:
  -[SUCoreMobileAsset setDocumentationStashBuild:](self, "setDocumentationStashBuild:", 0, v24, v25, v26, v27);
  id v21 = (void *)MEMORY[0x263F77D78];
  char v22 = [(SUCoreMobileAsset *)self downloadAssetTransaction];
  [v21 endTransaction:v22 withName:@"ma.DownloadAsset"];

  [(SUCoreMobileAsset *)self setDownloadAssetTransaction:0];
}

uint64_t __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maDownloadFailed:*(void *)(a1 + 40)];

  uint64_t v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"ma.DownloadAsset.Delegate"];
}

uint64_t __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"ma.DownloadAsset.Completion"];
}

- (void)_reportAssetRemoved
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SUCoreMobileAsset *)self maDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.RemoveAsset.Delegate"];
    uint64_t v7 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke;
    block[3] = &unk_2640DCE98;
    void block[4] = self;
    id v25 = v6;
    id v8 = v6;
    dispatch_async(v7, block);
  }
  float v9 = [(SUCoreMobileAsset *)self removeCompletion];

  if (v9)
  {
    char v10 = [(SUCoreMobileAsset *)self removeCompletion];
    [(SUCoreMobileAsset *)self setRemoveCompletion:0];
    int v11 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.RemoveAsset.Completion"];
    id v12 = [(SUCoreMobileAsset *)self clientCompletionQueue];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    id v20 = __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke_2;
    id v21 = &unk_2640DC4C8;
    id v22 = v11;
    id v23 = v10;
    id v13 = v11;
    char v14 = v10;
    dispatch_async(v12, &v18);
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    char v17 = [MEMORY[0x263F77DE8] sharedLogger];
    char v14 = [v17 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v27 = self;
      _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ asset removed (not reported)", buf, 0xCu);
    }
  }

LABEL_6:
  double v15 = (void *)MEMORY[0x263F77D78];
  id v16 = [(SUCoreMobileAsset *)self removeAssetTransaction];
  [v15 endTransaction:v16 withName:@"ma.RemoveAsset"];

  [(SUCoreMobileAsset *)self setRemoveAssetTransaction:0];
}

uint64_t __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maAssetRemoved];

  uint64_t v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 endTransaction:v4 withName:@"ma.RemoveAsset.Delegate"];
}

uint64_t __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 endTransaction:v3 withName:@"ma.RemoveAsset.Completion"];
}

- (void)_reportAssetRemoveFailed:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [(SUCoreMobileAsset *)self maDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.RemoveAsset.Delegate"];
    float v9 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke;
    block[3] = &unk_2640DCD70;
    void block[4] = self;
    id v28 = v4;
    id v29 = v8;
    id v10 = v8;
    dispatch_async(v9, block);
  }
  int v11 = [(SUCoreMobileAsset *)self removeCompletion];

  if (v11)
  {
    id v12 = [(SUCoreMobileAsset *)self removeCompletion];
    [(SUCoreMobileAsset *)self setRemoveCompletion:0];
    id v13 = [MEMORY[0x263F77D78] beginTransactionWithName:@"ma.RemoveAsset.Completion"];
    char v14 = [(SUCoreMobileAsset *)self clientCompletionQueue];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke_2;
    id v23 = &unk_2640DC2C0;
    id v26 = v12;
    id v24 = v4;
    id v25 = v13;
    id v15 = v13;
    id v16 = v12;
    dispatch_async(v14, &v20);
  }
  else
  {
    if (v7) {
      goto LABEL_6;
    }
    uint64_t v19 = [MEMORY[0x263F77DE8] sharedLogger];
    id v16 = [v19 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v31 = self;
      __int16 v32 = 2114;
      id v33 = v4;
      _os_log_impl(&dword_20C8EA000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ asset remove failed (not reported): error=%{public}@", buf, 0x16u);
    }
  }

LABEL_6:
  char v17 = (void *)MEMORY[0x263F77D78];
  uint64_t v18 = [(SUCoreMobileAsset *)self removeAssetTransaction];
  [v17 endTransaction:v18 withName:@"ma.RemoveAsset"];

  [(SUCoreMobileAsset *)self setRemoveAssetTransaction:0];
}

uint64_t __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maAssetRemoveFailed:*(void *)(a1 + 40)];

  uint64_t v3 = (void *)MEMORY[0x263F77D78];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 endTransaction:v4 withName:@"ma.RemoveAsset.Delegate"];
}

uint64_t __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = (void *)MEMORY[0x263F77D78];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 endTransaction:v3 withName:@"ma.RemoveAsset.Completion"];
}

- (void)_reportAnomaly:(id)a3
{
}

- (void)_reportAnomaly:(id)a3 issuingCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v8);

  float v9 = [(SUCoreMobileAsset *)self maDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(SUCoreMobileAsset *)self clientDelegateCallbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke;
    block[3] = &unk_2640DCE98;
    void block[4] = self;
    id v19 = v6;
    dispatch_async(v11, block);

    if (!v7) {
      goto LABEL_7;
    }
  }
  else if (!v7)
  {
    char v14 = [MEMORY[0x263F77DE8] sharedLogger];
    id v13 = [v14 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v6;
      _os_log_impl(&dword_20C8EA000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ anomaly (not reported): error=%{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  id v12 = [(SUCoreMobileAsset *)self clientCompletionQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke_2;
  v15[3] = &unk_2640DC4C8;
  char v17 = v7;
  id v16 = v6;
  dispatch_async(v12, v15);

  id v13 = v17;
LABEL_6:

LABEL_7:
}

void __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) maDelegate];
  [v2 maAnomaly:*(void *)(a1 + 40)];
}

uint64_t __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_trackMobileAssetBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreMobileAsset *)self operationName];
  [(SUCoreMobileAsset *)self _trackMobileAssetBegin:v4 withIdentifier:v5];
}

- (void)_trackMobileAssetBegin:(id)a3 withIdentifier:(id)a4
{
  id v5 = (void *)MEMORY[0x263F77DA8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedDiag];
  [v8 trackBegin:v7 atLevel:1 forModule:@"ma" withIdentifier:v6];
}

- (void)_trackMobileAssetEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SUCoreMobileAsset *)self operationName];
  [(SUCoreMobileAsset *)self _trackMobileAssetEnd:v9 withIdentifier:v10 withResult:a4 withError:v8];
}

- (void)_trackMobileAssetEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v9 = (void *)MEMORY[0x263F77DA8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 sharedDiag];
  [v13 trackEnd:v12 atLevel:1 forModule:@"ma" withIdentifier:v11 withResult:a5 withError:v10];
}

- (void)_trackMAAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [MEMORY[0x263F77D78] sharedCore];
  id v15 = [v11 buildError:a4 underlying:0 description:v8];

  id v12 = [MEMORY[0x263F77DA8] sharedDiag];
  id v13 = (void *)[[NSString alloc] initWithFormat:@"[MA] %@", v9];

  char v14 = (void *)[[NSString alloc] initWithFormat:@"%@ %@", self, v8];
  [v12 trackAnomaly:v13 forReason:v14 withResult:a4 withError:v15];

  [(SUCoreMobileAsset *)self _reportAnomaly:v15];
}

- (id)_updateAssetTypeName
{
  uint64_t v3 = [(SUCoreMobileAsset *)self maControlQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SUCoreMobileAsset *)self asset];
  id v5 = [v4 assetType];
  id v6 = [v5 componentsSeparatedByString:@"."];

  if ([v6 count])
  {
    id v7 = [v6 lastObject];
  }
  else
  {
    id v8 = [(SUCoreMobileAsset *)self asset];
    id v7 = [v8 assetType];
  }

  return v7;
}

- (id)description
{
  id v2 = [(SUCoreMobileAsset *)self operationName];
  if (!v2) {
    id v2 = @"[MA(initialized)]";
  }

  return v2;
}

+ (id)downloadOptionsDescription:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v26 = [NSString alloc];
  if ([v3 allowsCellularAccess]) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  id v25 = v5;
  uint64_t v24 = [v3 timeoutIntervalForResource];
  if ([v3 discretionary]) {
    id v6 = @"YES";
  }
  else {
    id v6 = @"NO";
  }
  id v23 = v6;
  if ([v3 allowsExpensiveAccess]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  __int16 v22 = v7;
  if ([v3 requiresPowerPluggedIn]) {
    id v8 = @"YES";
  }
  else {
    id v8 = @"NO";
  }
  uint64_t v21 = v8;
  if ([v3 canUseLocalCacheServer]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  uint64_t v20 = v9;
  if ([v3 prefersInfraWiFi]) {
    id v10 = @"YES";
  }
  else {
    id v10 = @"NO";
  }
  id v11 = [v3 sessionId];
  if (v11)
  {
    id v12 = [v3 sessionId];
  }
  else
  {
    id v12 = @"NONE";
  }
  if ([v3 liveServerCatalogOnly]) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  if (v4)
  {
    char v14 = [v4 liveAssetAudienceUUID];
    id v15 = [v4 purpose];
  }
  else
  {
    char v14 = @"NONE";
    id v15 = @"NONE";
  }
  id v16 = [v3 additionalServerParams];
  if (v16)
  {
    char v17 = [v3 additionalServerParams];
    uint64_t v18 = (void *)[v26 initWithFormat:@"\n[>>>\n       allowsCellularAccess: %@\n timeoutIntervalForResource: %ld\n              discretionary: %@\n      allowsExpensiveAccess: %@\n     requiresPowerPluggedIn: %@\n     canUseLocalCacheServer: %@\n           prefersInfraWiFi: %@\n                  sessionId: %@\n      liveServerCatalogOnly: %@\n      liveAssetAudienceUUID: %@\n                    purpose: %@\n     additionalServerParams: %@\n<<<]", v25, v24, v23, v22, v21, v20, v10, v12, v13, v14, v15, v17];
  }
  else
  {
    uint64_t v18 = (void *)[v26 initWithFormat:@"\n[>>>\n       allowsCellularAccess: %@\n timeoutIntervalForResource: %ld\n              discretionary: %@\n      allowsExpensiveAccess: %@\n     requiresPowerPluggedIn: %@\n     canUseLocalCacheServer: %@\n           prefersInfraWiFi: %@\n                  sessionId: %@\n      liveServerCatalogOnly: %@\n      liveAssetAudienceUUID: %@\n                    purpose: %@\n     additionalServerParams: %@\n<<<]", v25, v24, v23, v22, v21, v20, v10, v12, v13, v14, v15, @"NONE"];
  }

  if (v4)
  {
  }
  if (v11) {

  }
  return v18;
}

+ (id)downloadConfigSummary:(id)a3
{
  if ([a3 discretionary]) {
    return @"background(discretionary)";
  }
  else {
    return @"foreground(non-discretionary)";
  }
}

+ (BOOL)downloadConfig:(id)a3 isEqualToConfig:(id)a4
{
  id v5 = a4;
  LOBYTE(a3) = [a3 discretionary];
  char v6 = [v5 discretionary];

  return a3 ^ v6 ^ 1;
}

+ (id)downloadConfigCopy:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F559A8];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    uint64_t v6 = [v4 discretionary];

    [v5 setDiscretionary:v6];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)reloadDescriptor:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x263F55948];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 requireSameAssetTypeAndAssetId];
  +[SUCoreMobileAsset reloadDescriptor:v7 allowingDifferences:v8 forceReload:0 completion:v6];
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 completion:(id)a6
{
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 defaultValues:(id)a6 completion:(id)a7
{
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 completion:(id)a8
{
  LODWORD(v10) = a6;
  LODWORD(v11) = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  char v17 = [MEMORY[0x263F77DE8] sharedLogger];
  uint64_t v18 = [v17 oslog];

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = [v13 summary];
    id v28 = [v14 summary];
    char v30 = (char)v11;
    char v31 = (char)v10;
    if (v11) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    id v32 = v14;
    if (v10) {
      id v19 = @"YES";
    }
    else {
      id v19 = @"NO";
    }
    if (v16) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    id v20 = v16;
    if ([v13 requiresSoftwareUpdateAssetReload]) {
      uint64_t v21 = @"YES";
    }
    else {
      uint64_t v21 = @"NO";
    }
    *(_DWORD *)buf = 138544898;
    if ([v13 requiresDocumentationReload]) {
      __int16 v22 = @"YES";
    }
    else {
      __int16 v22 = @"NO";
    }
    id v41 = v29;
    __int16 v42 = 2114;
    id v43 = v28;
    __int16 v44 = 2114;
    id v45 = v11;
    __int16 v46 = 2114;
    v47 = v19;
    id v14 = v32;
    __int16 v48 = 2114;
    id v49 = v10;
    LOBYTE(v11) = v30;
    LOBYTE(v10) = v31;
    __int16 v50 = 2114;
    v51 = v21;
    id v16 = v20;
    __int16 v52 = 2114;
    id v53 = v22;
    _os_log_impl(&dword_20C8EA000, v18, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Reload descriptor method called, descriptor:%{public}@ allowingDifferences:%{public}@ forceReload:%{public}@ skipMSU:%{public}@ completion:%{public}@ requiresSoftwareUpdateAssetReload:%{public}@ requiresDocumentationReload:%{public}@", buf, 0x48u);
  }
  id v23 = [MEMORY[0x263F77D78] sharedCore];
  uint64_t v24 = v23;
  if (v13)
  {
    id v25 = [v23 waitedOperationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__SUCoreMobileAsset_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion___block_invoke;
    block[3] = &unk_2640DDF38;
    id v34 = v13;
    id v35 = v14;
    char v38 = (char)v11;
    char v39 = (char)v10;
    id v36 = v15;
    id v37 = v16;
    dispatch_async(v25, block);

    id v26 = v34;
  }
  else
  {
    id v26 = [v23 buildError:8116 underlying:0 description:@"No descriptor was provided for descriptor reload"];

    __int16 v27 = [MEMORY[0x263F77DA8] sharedDiag];
    [v27 trackAnomaly:@"ReloadDescriptor" forReason:@"No descriptor was provided for descriptor reload" withResult:8116 withError:v26];

    +[SUCoreMobileAsset _callReloadCompletion:v16 withDescriptor:0 suError:v26 docError:v26];
  }
}

void __103__SUCoreMobileAsset_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 65);
  uint64_t v6 = *(void *)(a1 + 48);
  id v21 = 0;
  id v22 = 0;
  id v7 = +[SUCoreMobileAsset _reloadDescriptor:v2 allowingDifferences:v3 forceReload:v4 skipMSU:v5 defaultValues:v6 pSUReloadError:&v22 pDocReloadError:&v21];
  id v8 = v22;
  id v9 = v21;
  id v10 = [*(id *)(a1 + 32) associatedSplatDescriptor];

  if (v10 && !v8 && !v9)
  {
    id v11 = [MEMORY[0x263F77DE8] sharedLogger];
    id v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v12, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Reload the associated splat descriptor", buf, 2u);
    }

    id v13 = [*(id *)(a1 + 32) associatedSplatDescriptor];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v16 = *(unsigned __int8 *)(a1 + 65);
    id v18 = 0;
    id v19 = 0;
    char v17 = +[SUCoreMobileAsset _reloadDescriptor:v13 allowingDifferences:v14 forceReload:v15 skipMSU:v16 defaultValues:0 pSUReloadError:&v19 pDocReloadError:&v18];
    id v8 = v19;
    id v9 = v18;

    if (!v8) {
      [v7 setAssociatedSplatDescriptor:v17];
    }
  }
  +[SUCoreMobileAsset _callReloadCompletion:*(void *)(a1 + 56) withDescriptor:v7 suError:v8 docError:v9];
}

+ (id)_reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 pSUReloadError:(id *)a8 pDocReloadError:(id *)a9
{
  BOOL v10 = a6;
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v59 = a7;
  uint64_t v15 = (SUCoreDescriptor *)v13;
  uint64_t v16 = v15;
  unint64_t v17 = 0x263F77000uLL;
  if (a5 || [(SUCoreDescriptor *)v15 requiresSoftwareUpdateAssetReload])
  {
    id v18 = [MEMORY[0x263F77DE8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [(SUCoreDescriptor *)v16 softwareUpdateAssetAbsoluteID];
      id v21 = [(SUCoreDescriptor *)v16 softwareUpdateAssetPurpose];
      *(_DWORD *)buf = 138543874;
      id v63 = v14;
      __int16 v64 = 2114;
      v65 = v20;
      __int16 v66 = 2114;
      v67 = v21;
      _os_log_impl(&dword_20C8EA000, v19, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Attempting to reload software update asset, allowing differences:%{public}@ absoluteAssetID:%{public}@ purpose:%{public}@", buf, 0x20u);
    }
    id v22 = (void *)MEMORY[0x263F55938];
    id v23 = [(SUCoreDescriptor *)v16 softwareUpdateAssetAbsoluteID];
    uint64_t v24 = [(SUCoreDescriptor *)v16 softwareUpdateAssetPurpose];
    id v61 = 0;
    id v25 = objc_msgSend(v22, "SUCoreBorder_loadSync:allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:", v23, v14, v24, &v61, v16, 1);
    id v26 = v61;

    if (v26 || !v25)
    {
      char v31 = [MEMORY[0x263F77D78] sharedCore];
      id v29 = v31;
      if (v26)
      {
        id v32 = @"Failed to reload software update asset for descriptor with MobileAsset error";
        uint64_t v33 = 8704;
        id v34 = v26;
      }
      else
      {
        id v32 = @"Failed to reload software update asset for descriptor as asset was not found (no MobileAsset error)";
        uint64_t v33 = 8705;
        id v34 = 0;
      }
      id v35 = [v31 buildError:v33 underlying:v34 description:v32];
      id v36 = v16;
    }
    else
    {
      __int16 v27 = [MEMORY[0x263F77DE8] sharedLogger];
      id v28 = [v27 oslog];

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20C8EA000, v28, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Software update asset reload completed successfully", buf, 2u);
      }

      if (v10)
      {
        id v29 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor msuPrepareSize](v16, "msuPrepareSize"));
        char v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SUCoreDescriptor installationSize](v16, "installationSize"));
      }
      else
      {
        id v29 = 0;
        char v30 = 0;
      }
      id v37 = [SUCoreDescriptor alloc];
      char v38 = [(SUCoreDescriptor *)v16 releaseDate];
      id v36 = [(SUCoreDescriptor *)v37 initWithSUAsset:v25 releaseDate:v38 prepareSize:v29 applySize:v30 defaultValues:v59];

      [(SUCoreDescriptor *)v36 transferNonAssetPropertiesFromDescriptor:v16];
      id v35 = 0;
      unint64_t v17 = 0x263F77000;
    }

    if (a5) {
      goto LABEL_20;
    }
  }
  else
  {
    id v35 = 0;
    id v36 = v16;
  }
  if (![(SUCoreDescriptor *)v16 requiresDocumentationReload])
  {
    v51 = 0;
    goto LABEL_33;
  }
LABEL_20:
  unint64_t v39 = v17;
  id v40 = [*(id *)(v17 + 3560) sharedLogger];
  id v41 = [v40 oslog];

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v42 = [(SUCoreDescriptor *)v16 documentationAssetAbsoluteID];
    id v43 = [(SUCoreDescriptor *)v16 documentationAssetPurpose];
    *(_DWORD *)buf = 138543874;
    id v63 = v14;
    __int16 v64 = 2114;
    v65 = v42;
    __int16 v66 = 2114;
    v67 = v43;
    _os_log_impl(&dword_20C8EA000, v41, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Attempting to reload documentation asset, allowing differences:%{public}@ absoluteAssetID:%{public}@ purpose:%{public}@", buf, 0x20u);
  }
  __int16 v44 = (void *)MEMORY[0x263F55938];
  id v45 = [(SUCoreDescriptor *)v16 documentationAssetAbsoluteID];
  __int16 v46 = [(SUCoreDescriptor *)v16 documentationAssetPurpose];
  id v60 = 0;
  v47 = objc_msgSend(v44, "SUCoreBorder_loadSync:allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:", v45, v14, v46, &v60, v36, 2);
  id v48 = v60;

  if (v48 || !v47)
  {
    __int16 v52 = [MEMORY[0x263F77D78] sharedCore];
    id v53 = v52;
    if (v48)
    {
      uint64_t v54 = @"Failed to reload documentation asset for descriptor with MobileAsset error";
      uint64_t v55 = 8704;
      id v56 = v48;
    }
    else
    {
      uint64_t v54 = @"Failed to reload documentation asset for descriptor as asset was not found (no MobileAsset error)";
      uint64_t v55 = 8705;
      id v56 = 0;
    }
    v51 = [v52 buildError:v55 underlying:v56 description:v54];
  }
  else
  {
    id v49 = [*(id *)(v39 + 3560) sharedLogger];
    __int16 v50 = [v49 oslog];

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20C8EA000, v50, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Documentation asset reload completed successfully", buf, 2u);
    }

    -[SUCoreDescriptor assignDocumentationFromAsset:extendingBundleProperties:](v36, "assignDocumentationFromAsset:extendingBundleProperties:", v47, [v47 wasLocal]);
    v51 = 0;
  }

LABEL_33:
  if (a8) {
    *a8 = v35;
  }
  if (a9) {
    *a9 = v51;
  }

  return v36;
}

+ (void)_callReloadCompletion:(id)a3 withDescriptor:(id)a4 suError:(id)a5 docError:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263F77DE8] sharedLogger];
  id v14 = [v13 oslog];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = v10;
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl(&dword_20C8EA000, v14, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Dispatching onto shared completion queue and calling provided reload completion with descriptor:%{public}@ suError:%{public}@ docError:%{public}@", buf, 0x20u);
  }

  if (v9)
  {
    uint64_t v15 = [MEMORY[0x263F77D78] sharedCore];
    uint64_t v16 = [v15 completionQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __75__SUCoreMobileAsset__callReloadCompletion_withDescriptor_suError_docError___block_invoke;
    v18[3] = &unk_2640DC4A0;
    id v22 = v9;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    dispatch_async(v16, v18);

    unint64_t v17 = v22;
  }
  else
  {
    unint64_t v17 = [MEMORY[0x263F77DA8] sharedDiag];
    [v17 trackAnomaly:@"ReloadDescriptor" forReason:@"No completion was provided for descriptor reload" withResult:8116 withError:0];
  }
}

uint64_t __75__SUCoreMobileAsset__callReloadCompletion_withDescriptor_suError_docError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)maDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_maDelegate);

  return WeakRetained;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
}

- (MAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSString)documentationStashBuild
{
  return self->_documentationStashBuild;
}

- (void)setDocumentationStashBuild:(id)a3
{
}

- (MADownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
}

- (MADownloadConfig)currentDownloadConfig
{
  return self->_currentDownloadConfig;
}

- (void)setCurrentDownloadConfig:(id)a3
{
}

- (MADownloadConfig)requestedDownloadConfig
{
  return self->_requestedDownloadConfig;
}

- (void)setRequestedDownloadConfig:(id)a3
{
}

- (MADownloadConfig)desiredDownloadConfig
{
  return self->_desiredDownloadConfig;
}

- (void)setDesiredDownloadConfig:(id)a3
{
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (OS_dispatch_queue)maControlQueue
{
  return self->_maControlQueue;
}

- (BOOL)downloadingAsset
{
  return self->_downloadingAsset;
}

- (void)setDownloadingAsset:(BOOL)a3
{
  self->_downloadingAsset = a3;
}

- (BOOL)checkedDownloadState
{
  return self->_checkedDownloadState;
}

- (void)setCheckedDownloadState:(BOOL)a3
{
  self->_checkedDownloadState = a3;
}

- (BOOL)assetDownloaded
{
  return self->_assetDownloaded;
}

- (void)setAssetDownloaded:(BOOL)a3
{
  self->_assetDownloaded = a3;
}

- (BOOL)removingAsset
{
  return self->_removingAsset;
}

- (void)setRemovingAsset:(BOOL)a3
{
  self->_removingAsset = a3;
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
}

- (BOOL)assetRemoved
{
  return self->_assetRemoved;
}

- (void)setAssetRemoved:(BOOL)a3
{
  self->_assetRemoved = a3;
}

- (id)downloadCompletion
{
  return self->_downloadCompletion;
}

- (void)setDownloadCompletion:(id)a3
{
}

- (id)alterDownloadCompletion
{
  return self->_alterDownloadCompletion;
}

- (void)setAlterDownloadCompletion:(id)a3
{
}

- (id)removeCompletion
{
  return self->_removeCompletion;
}

- (void)setRemoveCompletion:(id)a3
{
}

- (OS_os_transaction)downloadAssetTransaction
{
  return self->_downloadAssetTransaction;
}

- (void)setDownloadAssetTransaction:(id)a3
{
}

- (OS_os_transaction)alterDownloadTransaction
{
  return self->_alterDownloadTransaction;
}

- (void)setAlterDownloadTransaction:(id)a3
{
}

- (OS_os_transaction)removeAssetTransaction
{
  return self->_removeAssetTransaction;
}

- (void)setRemoveAssetTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeAssetTransaction, 0);
  objc_storeStrong((id *)&self->_alterDownloadTransaction, 0);
  objc_storeStrong((id *)&self->_downloadAssetTransaction, 0);
  objc_storeStrong(&self->_removeCompletion, 0);
  objc_storeStrong(&self->_alterDownloadCompletion, 0);
  objc_storeStrong(&self->_downloadCompletion, 0);
  objc_storeStrong((id *)&self->_operationName, 0);
  objc_storeStrong((id *)&self->_maControlQueue, 0);
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_desiredDownloadConfig, 0);
  objc_storeStrong((id *)&self->_requestedDownloadConfig, 0);
  objc_storeStrong((id *)&self->_currentDownloadConfig, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_documentationStashBuild, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);

  objc_destroyWeak(&self->_maDelegate);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = @"alter download config when removing asset - alteration of configuration ignored";
  OUTLINED_FUNCTION_1_3(&dword_20C8EA000, v0, v1, "%{public}@ %{public}@", v2);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = @"alter download config when not downloading - alteration of configuration ignored";
  OUTLINED_FUNCTION_1_3(&dword_20C8EA000, v0, v1, "%{public}@ %{public}@", v2);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_5();
  uint64_t v3 = @"alter download config when already altering with completion - cannot accept additional alteration request";
  OUTLINED_FUNCTION_1_3(&dword_20C8EA000, v0, v1, "%{public}@ %{public}@", v2);
}

- (void)_requestChangeConfigDownload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C8EA000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Unable to change download config (self.asset is not present)", (uint8_t *)&v2, 0xCu);
}

- (void)_issueAlterDownloadCompletion:forReason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_3(&dword_20C8EA000, v0, (uint64_t)v0, "%{public}@ %{public}@", v1);
}

- (void)_reportDownloaded:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_3(&dword_20C8EA000, v0, (uint64_t)v0, "%{public}@ Failed to stash documentation asset data: %{public}@", v1);
}

@end