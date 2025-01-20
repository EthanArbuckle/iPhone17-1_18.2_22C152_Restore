@interface TLToneStoreDownloadStoreServicesController
- (NSString)storeAccountName;
- (TLToneStoreDownloadStoreServicesController)init;
- (void)_assertRunningOnAccessQueue;
- (void)_handleAccountStoreDidChangeNotification:(id)a3;
- (void)_handleToneManagerContentsDidChangeNotification:(id)a3;
- (void)_notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload;
- (void)_notifyObserversOfStartedToneStoreDownloads:(id)a3 progressedToneStoreDownload:(id)a4 finishedToneStoreDownloads:(id)a5;
- (void)_notifyObserversOfUpdatedStoreAccountName:(id)a3;
- (void)_openToneStoreWithStoreItemKind:(id)a3;
- (void)_performBlockOnAccessQueue:(id)a3;
- (void)_updateStoreAccountName;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4;
- (void)openAlertToneStore;
- (void)openRingtoneStore;
- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4;
- (void)redownloadAllTones;
- (void)removeObserver:(id)a3;
@end

@implementation TLToneStoreDownloadStoreServicesController

- (TLToneStoreDownloadStoreServicesController)init
{
  v131[2] = *MEMORY[0x1E4F143B8];
  v117.receiver = self;
  v117.super_class = (Class)TLToneStoreDownloadStoreServicesController;
  v2 = [(TLToneStoreDownloadStoreServicesController *)&v117 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSString;
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    v6 = [v5 bundleIdentifier];
    v7 = NSStringFromClass(v3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [v4 stringWithFormat:@"%@.%@-%@-%@", v6, v7, @"AccessQueue", v9];
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v10;

    dispatch_queue_t v12 = dispatch_queue_create([(NSString *)v2->_accessQueueLabel UTF8String], 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2050000000;
    v14 = (void *)getSSDownloadManagerOptionsClass_softClass;
    uint64_t v126 = getSSDownloadManagerOptionsClass_softClass;
    if (!getSSDownloadManagerOptionsClass_softClass)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadManagerOptionsClass_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      __getSSDownloadManagerOptionsClass_block_invoke((uint64_t)&v118);
      v14 = (void *)v124[3];
    }
    v15 = v14;
    _Block_object_dispose(&v123, 8);
    id v114 = objc_alloc_init(v15);
    v16 = getSSDownloadKindRingtone();
    v131[0] = v16;
    v17 = getSSDownloadKindTone();
    v131[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
    [v114 setDownloadKinds:v18];

    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v19 = (id *)getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v20 = (void *)StoreServicesLibrary();
      v21 = dlsym(v20, "SSDownloadExternalPropertyBytesDownloaded");
      *(void *)(v122[1] + 24) = v21;
      getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v19 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v19) {
      goto LABEL_61;
    }
    id v22 = *v19;
    v129[0] = v22;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v23 = (id *)getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadExternalPropertyPercentCompleteSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v24 = (void *)StoreServicesLibrary();
      v25 = dlsym(v24, "SSDownloadExternalPropertyPercentComplete");
      *(void *)(v122[1] + 24) = v25;
      getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v23 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v23) {
      goto LABEL_61;
    }
    id v26 = *v23;
    v129[1] = v26;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v27 = (id *)getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v28 = (void *)StoreServicesLibrary();
      v29 = dlsym(v28, "SSDownloadExternalPropertyPolicySizeLimit");
      *(void *)(v122[1] + 24) = v29;
      getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v27 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v27) {
      goto LABEL_61;
    }
    id v30 = *v27;
    v129[2] = v30;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v31 = (id *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadExternalPropertyRentalInformationSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v32 = (void *)StoreServicesLibrary();
      v33 = dlsym(v32, "SSDownloadExternalPropertyRentalInformation");
      *(void *)(v122[1] + 24) = v33;
      getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v31 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v31) {
      goto LABEL_61;
    }
    id v130 = *v31;
    v34 = (void *)MEMORY[0x1E4F1C978];
    id v35 = v130;
    v36 = [v34 arrayWithObjects:v129 count:4];

    [v114 setPrefetchedDownloadExternalProperties:v36];
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v37 = (id *)getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyClientBundleIdentifierSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v38 = (void *)StoreServicesLibrary();
      v39 = dlsym(v38, "SSDownloadPropertyClientBundleIdentifier");
      *(void *)(v122[1] + 24) = v39;
      getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v37 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v37) {
      goto LABEL_61;
    }
    p_isa = (id *)&v2->super.isa;
    id v40 = *v37;
    v127[0] = v40;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v41 = (id *)getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
    if (!getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyDownloadPhaseSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v42 = (void *)StoreServicesLibrary();
      v43 = dlsym(v42, "SSDownloadPropertyDownloadPhase");
      *(void *)(v122[1] + 24) = v43;
      getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v41 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v41) {
      goto LABEL_61;
    }
    id v44 = *v41;
    v127[1] = v44;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v45 = (id *)getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
    if (!getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyEncodedErrorDataSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v46 = (void *)StoreServicesLibrary();
      v47 = dlsym(v46, "SSDownloadPropertyEncodedErrorData");
      *(void *)(v122[1] + 24) = v47;
      getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v45 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v45) {
      goto LABEL_61;
    }
    id v48 = *v45;
    v127[2] = v48;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v49 = (id *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
    if (!getSSDownloadPropertyIsRestoreSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyIsRestoreSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v50 = (void *)StoreServicesLibrary();
      v51 = dlsym(v50, "SSDownloadPropertyIsRestore");
      *(void *)(v122[1] + 24) = v51;
      getSSDownloadPropertyIsRestoreSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v49 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v49) {
      goto LABEL_61;
    }
    id v52 = *v49;
    v127[3] = v52;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v53 = (id *)getSSDownloadPropertyKindSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyKindSymbolLoc_ptr;
    if (!getSSDownloadPropertyKindSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyKindSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v54 = (void *)StoreServicesLibrary();
      v55 = dlsym(v54, "SSDownloadPropertyKind");
      *(void *)(v122[1] + 24) = v55;
      getSSDownloadPropertyKindSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v53 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v53) {
      goto LABEL_61;
    }
    id v112 = *v53;
    v127[4] = v112;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v56 = (id *)getSSDownloadPropertyReasonSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyReasonSymbolLoc_ptr;
    if (!getSSDownloadPropertyReasonSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyReasonSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v57 = (void *)StoreServicesLibrary();
      v58 = dlsym(v57, "SSDownloadPropertyReason");
      *(void *)(v122[1] + 24) = v58;
      getSSDownloadPropertyReasonSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v56 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v56) {
      goto LABEL_61;
    }
    id v111 = *v56;
    v127[5] = v111;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v59 = (id *)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyStoreItemIdentifierSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v60 = (void *)StoreServicesLibrary();
      v61 = dlsym(v60, "SSDownloadPropertyStoreItemIdentifier");
      *(void *)(v122[1] + 24) = v61;
      getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v59 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v59) {
      goto LABEL_61;
    }
    id v110 = *v59;
    v127[6] = v110;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v62 = (id *)getSSDownloadPropertyTitleSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyTitleSymbolLoc_ptr;
    if (!getSSDownloadPropertyTitleSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyTitleSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v63 = (void *)StoreServicesLibrary();
      v64 = dlsym(v63, "SSDownloadPropertyTitle");
      *(void *)(v122[1] + 24) = v64;
      getSSDownloadPropertyTitleSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v62 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v62) {
      goto LABEL_61;
    }
    id v109 = *v62;
    v127[7] = v109;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v65 = (id *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    if (!getSSDownloadPropertyHandlerIDSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyHandlerIDSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v66 = (void *)StoreServicesLibrary();
      v67 = dlsym(v66, "SSDownloadPropertyHandlerID");
      *(void *)(v122[1] + 24) = v67;
      getSSDownloadPropertyHandlerIDSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v65 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v65) {
      goto LABEL_61;
    }
    id v68 = *v65;
    v127[8] = v68;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v69 = (id *)getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
    if (!getSSDownloadPropertyCollectionNameSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyCollectionNameSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v70 = (void *)StoreServicesLibrary();
      v71 = dlsym(v70, "SSDownloadPropertyCollectionName");
      *(void *)(v122[1] + 24) = v71;
      getSSDownloadPropertyCollectionNameSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v69 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v69) {
      goto LABEL_61;
    }
    id v72 = *v69;
    v127[9] = v72;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v73 = (id *)getSSDownloadPropertyArtistNameSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyArtistNameSymbolLoc_ptr;
    if (!getSSDownloadPropertyArtistNameSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyArtistNameSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v74 = (void *)StoreServicesLibrary();
      v75 = dlsym(v74, "SSDownloadPropertyArtistName");
      *(void *)(v122[1] + 24) = v75;
      getSSDownloadPropertyArtistNameSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v73 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v73) {
      goto LABEL_61;
    }
    id v76 = *v73;
    v127[10] = v76;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v77 = (id *)getSSDownloadPropertyGenreSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyGenreSymbolLoc_ptr;
    if (!getSSDownloadPropertyGenreSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyGenreSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v78 = (void *)StoreServicesLibrary();
      v79 = dlsym(v78, "SSDownloadPropertyGenre");
      *(void *)(v122[1] + 24) = v79;
      getSSDownloadPropertyGenreSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v77 = (id *)v124[3];
    }
    v108 = v40;
    _Block_object_dispose(&v123, 8);
    if (!v77) {
      goto LABEL_61;
    }
    id v80 = *v77;
    v127[11] = v80;
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2020000000;
    v81 = (id *)getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr;
    uint64_t v126 = getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr;
    if (!getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadPropertyDurationInMillisecondsSymbolLoc_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      v82 = (void *)StoreServicesLibrary();
      v83 = dlsym(v82, "SSDownloadPropertyDurationInMilliseconds");
      *(void *)(v122[1] + 24) = v83;
      getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr = *(void *)(v122[1] + 24);
      v81 = (id *)v124[3];
    }
    _Block_object_dispose(&v123, 8);
    if (!v81)
    {
LABEL_61:
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
      __break(1u);
    }
    id v128 = *v81;
    v84 = (void *)MEMORY[0x1E4F1C978];
    id v85 = v128;
    [v84 arrayWithObjects:v127 count:13];
    v86 = v2 = (TLToneStoreDownloadStoreServicesController *)p_isa;

    [v114 setPrefetchedDownloadProperties:v86];
    [v114 setShouldFilterExternalOriginatedDownloads:0];
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2050000000;
    v87 = (void *)getSSDownloadManagerClass_softClass;
    uint64_t v126 = getSSDownloadManagerClass_softClass;
    if (!getSSDownloadManagerClass_softClass)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSDownloadManagerClass_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      __getSSDownloadManagerClass_block_invoke((uint64_t)&v118);
      v87 = (void *)v124[3];
    }
    v88 = v87;
    _Block_object_dispose(&v123, 8);
    uint64_t v89 = [[v88 alloc] initWithManagerOptions:v114];
    id v90 = p_isa[6];
    p_isa[6] = (id)v89;

    [p_isa[6] addObserver:p_isa];
    uint64_t v123 = 0;
    v124 = &v123;
    uint64_t v125 = 0x2050000000;
    v91 = (void *)getSSPurchaseManagerClass_softClass;
    uint64_t v126 = getSSPurchaseManagerClass_softClass;
    if (!getSSPurchaseManagerClass_softClass)
    {
      uint64_t v118 = MEMORY[0x1E4F143A8];
      uint64_t v119 = 3221225472;
      v120 = __getSSPurchaseManagerClass_block_invoke;
      v121 = &unk_1E6C210C8;
      v122 = &v123;
      __getSSPurchaseManagerClass_block_invoke((uint64_t)&v118);
      v91 = (void *)v124[3];
    }
    v92 = v91;
    _Block_object_dispose(&v123, 8);
    id v93 = [v92 alloc];
    v94 = NSString;
    v95 = [MEMORY[0x1E4F28B50] mainBundle];
    v96 = [v95 bundleIdentifier];
    v97 = (objc_class *)objc_opt_class();
    v98 = NSStringFromClass(v97);
    v99 = [v94 stringWithFormat:@"%@.%@", v96, v98];
    uint64_t v100 = [v93 initWithManagerIdentifier:v99];
    id v101 = p_isa[7];
    p_isa[7] = (id)v100;

    [p_isa[7] setDelegate:p_isa];
    v115[0] = MEMORY[0x1E4F143A8];
    v115[1] = 3221225472;
    v115[2] = __50__TLToneStoreDownloadStoreServicesController_init__block_invoke;
    v115[3] = &unk_1E6C20D60;
    v102 = p_isa;
    v116 = v102;
    [v102 _performBlockOnAccessQueue:v115];
    v103 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v104 = getSSAccountStoreChangedNotification();
    v105 = [getSSAccountStoreClass() defaultStore];
    [v103 addObserver:v102 selector:sel__handleAccountStoreDidChangeNotification_ name:v104 object:v105];

    v106 = +[TLToneManager sharedToneManager];
    [v103 addObserver:v102 selector:sel__handleToneManagerContentsDidChangeNotification_ name:@"_TLToneManagerContentsChangedNotification" object:v106];
  }
  return v2;
}

uint64_t __50__TLToneStoreDownloadStoreServicesController_init__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(a1 + 32);

  return [v5 _updateStoreAccountName];
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  [(SSDownloadManager *)self->_storeDownloadManager removeObserver:self];
  [(SSPurchaseManager *)self->_storePurchaseManager setDelegate:0];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6 = getSSAccountStoreChangedNotification();
  v7 = [getSSAccountStoreClass() defaultStore];
  [v5 removeObserver:self name:v6 object:v7];

  v8 = +[TLToneManager sharedToneManager];
  [v5 removeObserver:self name:@"_TLToneManagerContentsChangedNotification" object:v8];

  dispatch_sync(v4, &__block_literal_global_1);
  v9.receiver = self;
  v9.super_class = (Class)TLToneStoreDownloadStoreServicesController;
  [(TLToneStoreDownloadStoreServicesController *)&v9 dealloc];
}

- (NSString)storeAccountName
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  objc_super v9 = __Block_byref_object_dispose__0;
  uint64_t v10 = &stru_1F35F7550;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__TLToneStoreDownloadStoreServicesController_storeAccountName__block_invoke;
  v4[3] = &unk_1E6C20D10;
  v4[4] = self;
  v4[5] = &v5;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

uint64_t __62__TLToneStoreDownloadStoreServicesController_storeAccountName__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)_updateStoreAccountName
{
  [(TLToneStoreDownloadStoreServicesController *)self _assertRunningOnAccessQueue];
  id v10 = [getSSAccountStoreClass() defaultStore];
  uint64_t v3 = [v10 activeAccount];
  v4 = [v3 accountName];
  uint64_t v5 = (void *)[v4 copy];

  unint64_t v6 = self->_storeAccountName;
  unint64_t v7 = v5;
  v8 = (void *)v7;
  if (!(v7 | v6)) {
    goto LABEL_7;
  }
  if (!v7 || !v6)
  {

    goto LABEL_9;
  }
  if (v6 == v7)
  {
LABEL_7:

    goto LABEL_10;
  }
  BOOL v9 = [(id)v6 isEqualToString:v7];

  if (!v9)
  {
LABEL_9:
    objc_storeStrong((id *)&self->_storeAccountName, v5);
    [(TLToneStoreDownloadStoreServicesController *)self _notifyObserversOfUpdatedStoreAccountName:v8];
  }
LABEL_10:
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__TLToneStoreDownloadStoreServicesController__handleAccountStoreDidChangeNotification___block_invoke;
  v3[3] = &unk_1E6C20D60;
  v3[4] = self;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v3];
}

uint64_t __87__TLToneStoreDownloadStoreServicesController__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStoreAccountName];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__TLToneStoreDownloadStoreServicesController_addObserver___block_invoke;
  v6[3] = &unk_1E6C20CC0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v6];
}

uint64_t __58__TLToneStoreDownloadStoreServicesController_addObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(*(void *)(result + 40) + 24), "containsObject:");
    if ((result & 1) == 0)
    {
      id v2 = *(void **)(*(void *)(v1 + 40) + 24);
      if (!v2)
      {
        uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        uint64_t v4 = *(void *)(v1 + 40);
        id v5 = *(void **)(v4 + 24);
        *(void *)(v4 + 24) = v3;

        id v2 = *(void **)(*(void *)(v1 + 40) + 24);
      }
      uint64_t v6 = *(void *)(v1 + 32);
      return [v2 addObject:v6];
    }
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__TLToneStoreDownloadStoreServicesController_removeObserver___block_invoke;
  v6[3] = &unk_1E6C20CC0;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v6];
}

uint64_t __61__TLToneStoreDownloadStoreServicesController_removeObserver___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    result = objc_msgSend(*(id *)(*(void *)(result + 40) + 24), "containsObject:");
    if (result)
    {
      uint64_t v2 = *(void *)(v1 + 32);
      uint64_t v3 = *(void **)(*(void *)(v1 + 40) + 24);
      return [v3 removeObject:v2];
    }
  }
  return result;
}

- (void)_notifyObserversOfUpdatedStoreAccountName:(id)a3
{
  id v4 = a3;
  [(TLToneStoreDownloadStoreServicesController *)self _assertRunningOnAccessQueue];
  id v5 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__TLToneStoreDownloadStoreServicesController__notifyObserversOfUpdatedStoreAccountName___block_invoke;
  v9[3] = &unk_1E6C20CC0;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

void __88__TLToneStoreDownloadStoreServicesController__notifyObserversOfUpdatedStoreAccountName___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "storeAccountNameDidChange:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload
{
  [(TLToneStoreDownloadStoreServicesController *)self _assertRunningOnAccessQueue];
  uint64_t v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__TLToneStoreDownloadStoreServicesController__notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload__block_invoke;
  block[3] = &unk_1E6C20D60;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __121__TLToneStoreDownloadStoreServicesController__notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v6, "didFinishCheckingForAvailableToneStoreDownloads:", 0, (void)v7);
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_notifyObserversOfStartedToneStoreDownloads:(id)a3 progressedToneStoreDownload:(id)a4 finishedToneStoreDownloads:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(TLToneStoreDownloadStoreServicesController *)self _assertRunningOnAccessQueue];
  uint64_t v11 = [v8 count];
  uint64_t v12 = [v9 count];
  uint64_t v13 = [v10 count];
  if (v11 || v12 || v13)
  {
    BOOL v14 = v13 != 0;
    BOOL v15 = v11 != 0;
    v16 = [(NSHashTable *)self->_observers allObjects];
    v17 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __145__TLToneStoreDownloadStoreServicesController__notifyObserversOfStartedToneStoreDownloads_progressedToneStoreDownload_finishedToneStoreDownloads___block_invoke;
    block[3] = &unk_1E6C21310;
    id v20 = v16;
    BOOL v24 = v15;
    id v21 = v8;
    BOOL v25 = v12 != 0;
    id v22 = v9;
    BOOL v26 = v14;
    id v23 = v10;
    id v18 = v16;
    dispatch_async(v17, block);
  }
}

void __145__TLToneStoreDownloadStoreServicesController__notifyObserversOfStartedToneStoreDownloads_progressedToneStoreDownload_finishedToneStoreDownloads___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 64))
        {
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v7, "didFinishCheckingForAvailableToneStoreDownloads:", 1, (void)v8);
          }
          if (objc_opt_respondsToSelector()) {
            [v7 toneStoreDownloadsDidStart:*(void *)(a1 + 40)];
          }
        }
        if (*(unsigned char *)(a1 + 65) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 toneStoreDownloadsDidProgress:*(void *)(a1 + 48)];
        }
        if (*(unsigned char *)(a1 + 66) && (objc_opt_respondsToSelector() & 1) != 0) {
          [v7 toneStoreDownloadsDidFinish:*(void *)(a1 + 56)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)openAlertToneStore
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v3 = (void *)getSSItemKindToneSymbolLoc_ptr;
  uint64_t v9 = getSSItemKindToneSymbolLoc_ptr;
  if (!getSSItemKindToneSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v4, "SSItemKindTone");
    getSSItemKindToneSymbolLoc_ptr = v7[3];
    uint64_t v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    uint64_t v5 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  [(TLToneStoreDownloadStoreServicesController *)self _openToneStoreWithStoreItemKind:*v3];
}

- (void)openRingtoneStore
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v3 = (void *)getSSItemKindRingtoneSymbolLoc_ptr;
  uint64_t v9 = getSSItemKindRingtoneSymbolLoc_ptr;
  if (!getSSItemKindRingtoneSymbolLoc_ptr)
  {
    uint64_t v4 = (void *)StoreServicesLibrary();
    v7[3] = (uint64_t)dlsym(v4, "SSItemKindRingtone");
    getSSItemKindRingtoneSymbolLoc_ptr = v7[3];
    uint64_t v3 = (void *)v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    uint64_t v5 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  [(TLToneStoreDownloadStoreServicesController *)self _openToneStoreWithStoreItemKind:*v3];
}

- (void)_openToneStoreWithStoreItemKind:(id)a3
{
  id v3 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v4 = (void (*)(id))getSSItemStoreFrontURLForItemKindSymbolLoc_ptr;
  id v22 = getSSItemStoreFrontURLForItemKindSymbolLoc_ptr;
  if (!getSSItemStoreFrontURLForItemKindSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __getSSItemStoreFrontURLForItemKindSymbolLoc_block_invoke;
    v17 = &unk_1E6C210C8;
    id v18 = &v19;
    uint64_t v5 = (void *)StoreServicesLibrary();
    v20[3] = (uint64_t)dlsym(v5, "SSItemStoreFrontURLForItemKind");
    getSSItemStoreFrontURLForItemKindSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
    uint64_t v4 = (void (*)(id))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v4)
  {
    uint64_t v9 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v9);
  }
  uint64_t v6 = v4(v3);

  uint64_t v10 = MEMORY[0x1E4F143A8];
  long long v11 = __78__TLToneStoreDownloadStoreServicesController__openToneStoreWithStoreItemKind___block_invoke;
  uint64_t v12 = &unk_1E6C20D60;
  id v13 = v6;
  long long v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = v6;
  if (objc_msgSend(v7, "isMainThread", v10, 3221225472)) {
    v11((uint64_t)&v10);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v10);
  }
}

void __78__TLToneStoreDownloadStoreServicesController__openToneStoreWithStoreItemKind___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getUIApplicationClass_softClass;
  uint64_t v9 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getUIApplicationClass_block_invoke;
    v5[3] = &unk_1E6C210C8;
    v5[4] = &v6;
    __getUIApplicationClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  uint64_t v4 = [v3 sharedApplication];
  [v4 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)redownloadAllTones
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  id v3 = (void *)getSSTonePurchaseClass_softClass;
  uint64_t v33 = getSSTonePurchaseClass_softClass;
  if (!getSSTonePurchaseClass_softClass)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getSSTonePurchaseClass_block_invoke;
    v28 = &unk_1E6C210C8;
    v29 = &v30;
    __getSSTonePurchaseClass_block_invoke((uint64_t)&v25);
    id v3 = (void *)v31[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v30, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v6 = (id *)getSSItemToneStyleRingtoneSymbolLoc_ptr;
  uint64_t v33 = getSSItemToneStyleRingtoneSymbolLoc_ptr;
  if (!getSSItemToneStyleRingtoneSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getSSItemToneStyleRingtoneSymbolLoc_block_invoke;
    v28 = &unk_1E6C210C8;
    v29 = &v30;
    long long v7 = (void *)StoreServicesLibrary();
    uint64_t v8 = dlsym(v7, "SSItemToneStyleRingtone");
    *(void *)(v29[1] + 24) = v8;
    getSSItemToneStyleRingtoneSymbolLoc_ptr = *(void *)(v29[1] + 24);
    uint64_t v6 = (id *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v6) {
    goto LABEL_17;
  }
  id v9 = *v6;
  id v35 = v9;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v10 = (id *)getSSItemToneStyleTextToneSymbolLoc_ptr;
  uint64_t v33 = getSSItemToneStyleTextToneSymbolLoc_ptr;
  if (!getSSItemToneStyleTextToneSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getSSItemToneStyleTextToneSymbolLoc_block_invoke;
    v28 = &unk_1E6C210C8;
    v29 = &v30;
    long long v11 = (void *)StoreServicesLibrary();
    uint64_t v12 = dlsym(v11, "SSItemToneStyleTextTone");
    *(void *)(v29[1] + 24) = v12;
    getSSItemToneStyleTextToneSymbolLoc_ptr = *(void *)(v29[1] + 24);
    uint64_t v10 = (id *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v10) {
    goto LABEL_17;
  }
  id v36 = *v10;
  id v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = v36;
  uint64_t v15 = [v13 arrayWithObjects:&v35 count:2];
  [v5 setAllowedToneStyles:v15];

  [v5 setCreatesDownloads:0];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v16 = (void *)getSSDownloadPropertyIsRedownloadSymbolLoc_ptr;
  uint64_t v33 = getSSDownloadPropertyIsRedownloadSymbolLoc_ptr;
  if (!getSSDownloadPropertyIsRedownloadSymbolLoc_ptr)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getSSDownloadPropertyIsRedownloadSymbolLoc_block_invoke;
    v28 = &unk_1E6C210C8;
    v29 = &v30;
    v17 = (void *)StoreServicesLibrary();
    id v18 = dlsym(v17, "SSDownloadPropertyIsRedownload");
    *(void *)(v29[1] + 24) = v18;
    getSSDownloadPropertyIsRedownloadSymbolLoc_ptr = *(void *)(v29[1] + 24);
    v16 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v16)
  {
LABEL_17:
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  [v5 setValue:MEMORY[0x1E4F1CC38] forDownloadProperty:*v16];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2050000000;
  uint64_t v19 = (void *)getSSMutableURLRequestPropertiesClass_softClass;
  uint64_t v33 = getSSMutableURLRequestPropertiesClass_softClass;
  if (!getSSMutableURLRequestPropertiesClass_softClass)
  {
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __getSSMutableURLRequestPropertiesClass_block_invoke;
    v28 = &unk_1E6C210C8;
    v29 = &v30;
    __getSSMutableURLRequestPropertiesClass_block_invoke((uint64_t)&v25);
    uint64_t v19 = (void *)v31[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v30, 8);
  uint64_t v21 = (void *)[[v20 alloc] initWithURLRequest:0];
  [v21 setURLBagKey:@"redownloadAllTones"];
  [v5 setRequestProperties:v21];
  id v22 = TLLogToneManagement();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_1DB936000, v22, OS_LOG_TYPE_DEFAULT, "Issuing store purchase for tones.", (uint8_t *)&v25, 2u);
  }

  storePurchaseManager = self->_storePurchaseManager;
  id v34 = v5;
  BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [(SSPurchaseManager *)storePurchaseManager addPurchases:v24 withCompletionBlock:&__block_literal_global_39];
}

void __64__TLToneStoreDownloadStoreServicesController_redownloadAllTones__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  id v5 = TLLogToneManagement();
  uint64_t v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v7 = 0;
      _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "Store purchase did complete successfully for tones.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __64__TLToneStoreDownloadStoreServicesController_redownloadAllTones__block_invoke_cold_1(v4);
  }
}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__TLToneStoreDownloadStoreServicesController_downloadManager_downloadStatesDidChange___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v7];
}

void __86__TLToneStoreDownloadStoreServicesController_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = a1;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v28;
    id v23 = &v33;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v28 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v27 + 1) + 8 * v4);
        id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "persistentIdentifier", v23));
        long long v7 = [*(id *)(*(void *)(v26 + 40) + 40) objectForKey:v6];
        if (v7)
        {
          id v8 = [v5 downloadPhaseIdentifier];
          uint64_t v36 = 0;
          uint64_t v37 = &v36;
          uint64_t v38 = 0x2020000000;
          id v9 = (id *)getSSDownloadPhaseFinishedSymbolLoc_ptr;
          uint64_t v39 = getSSDownloadPhaseFinishedSymbolLoc_ptr;
          if (!getSSDownloadPhaseFinishedSymbolLoc_ptr)
          {
            uint64_t v31 = MEMORY[0x1E4F143A8];
            uint64_t v32 = 3221225472;
            uint64_t v33 = __getSSDownloadPhaseFinishedSymbolLoc_block_invoke;
            id v34 = &unk_1E6C210C8;
            id v35 = &v36;
            uint64_t v10 = (void *)StoreServicesLibrary();
            long long v11 = dlsym(v10, "SSDownloadPhaseFinished");
            *(void *)(v35[1] + 24) = v11;
            getSSDownloadPhaseFinishedSymbolLoc_ptr = *(void *)(v35[1] + 24);
            id v9 = (id *)v37[3];
          }
          _Block_object_dispose(&v36, 8);
          if (!v9)
          {
LABEL_29:
            __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
            __break(1u);
          }
          id v12 = *v9;
          if ([v8 isEqualToString:v12])
          {
LABEL_16:
          }
          else
          {
            uint64_t v36 = 0;
            uint64_t v37 = &v36;
            uint64_t v38 = 0x2020000000;
            id v13 = (id *)getSSDownloadPhaseFailedSymbolLoc_ptr;
            uint64_t v39 = getSSDownloadPhaseFailedSymbolLoc_ptr;
            if (!getSSDownloadPhaseFailedSymbolLoc_ptr)
            {
              uint64_t v31 = MEMORY[0x1E4F143A8];
              uint64_t v32 = 3221225472;
              uint64_t v33 = __getSSDownloadPhaseFailedSymbolLoc_block_invoke;
              id v34 = &unk_1E6C210C8;
              id v35 = &v36;
              id v14 = (void *)StoreServicesLibrary();
              uint64_t v15 = dlsym(v14, "SSDownloadPhaseFailed");
              *(void *)(v35[1] + 24) = v15;
              getSSDownloadPhaseFailedSymbolLoc_ptr = *(void *)(v35[1] + 24);
              id v13 = (id *)v37[3];
            }
            _Block_object_dispose(&v36, 8);
            if (!v13) {
              goto LABEL_29;
            }
            id v16 = *v13;
            if ([v8 isEqualToString:v16])
            {

              goto LABEL_16;
            }
            uint64_t v36 = 0;
            uint64_t v37 = &v36;
            uint64_t v38 = 0x2020000000;
            id v18 = (void *)getSSDownloadPhaseCanceledSymbolLoc_ptr;
            uint64_t v39 = getSSDownloadPhaseCanceledSymbolLoc_ptr;
            if (!getSSDownloadPhaseCanceledSymbolLoc_ptr)
            {
              uint64_t v31 = MEMORY[0x1E4F143A8];
              uint64_t v32 = 3221225472;
              uint64_t v33 = __getSSDownloadPhaseCanceledSymbolLoc_block_invoke;
              id v34 = &unk_1E6C210C8;
              id v35 = &v36;
              uint64_t v19 = (void *)StoreServicesLibrary();
              id v20 = dlsym(v19, "SSDownloadPhaseCanceled");
              *(void *)(v35[1] + 24) = v20;
              getSSDownloadPhaseCanceledSymbolLoc_ptr = *(void *)(v35[1] + 24);
              id v18 = (void *)v37[3];
            }
            _Block_object_dispose(&v36, 8);
            if (!v18) {
              goto LABEL_29;
            }
            char v21 = [v8 isEqualToString:*v18];

            if ((v21 & 1) == 0)
            {
              [v5 percentComplete];
LABEL_19:
              *(float *)&double v17 = v17;
              [v7 _setDownloadProgress:v17];
              [v25 addObject:v7];

              goto LABEL_20;
            }
          }
          [v5 percentComplete];
          if (v17 < 0.99) {
            double v17 = 0.99;
          }
          goto LABEL_19;
        }
LABEL_20:

        ++v4;
      }
      while (v2 != v4);
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v40 count:16];
      uint64_t v2 = v22;
    }
    while (v22);
  }

  [*(id *)(v26 + 40) _notifyObserversOfStartedToneStoreDownloads:0 progressedToneStoreDownload:v25 finishedToneStoreDownloads:0];
}

- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v5 = a4;
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v5;
  uint64_t v51 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v78;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v78 != v50)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v52 = v6;
        id v8 = *(void **)(*((void *)&v77 + 1) + 8 * v6);
        id v9 = TLLogToneManagement();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = objc_msgSend(v8, "URLResponse", v47);
          long long v11 = [v10 storeCorrelationID];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v11;
          _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "Did finish store purchase with correlation key: %{public}@.", buf, 0xCu);
        }
        v62 = +[TLToneManager sharedToneManager];
        v55 = [v62 _installedTones];
        id v12 = [v8 downloadsMetadata];
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v56 = v12;
        uint64_t v58 = [v56 countByEnumeratingWithState:&v73 objects:v86 count:16];
        if (v58)
        {
          uint64_t v57 = *(void *)v74;
          while (2)
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v74 != v57)
              {
                uint64_t v14 = v13;
                objc_enumerationMutation(v56);
                uint64_t v13 = v14;
              }
              uint64_t v60 = v13;
              id v15 = *(id *)(*((void *)&v73 + 1) + 8 * v13);
              v61 = [v15 kind];
              id v16 = getSSDownloadKindRingtone();
              if ([v61 isEqualToString:v16])
              {
              }
              else
              {
                double v17 = getSSDownloadKindTone();
                char v18 = [v61 isEqualToString:v17];

                if ((v18 & 1) == 0)
                {
                  uint64_t v19 = getSSDownloadKindRingtone();

                  id v20 = (void *)[v15 copy];
                  [v20 setKind:v19];
                  v61 = (void *)v19;
                  id v15 = v20;
                }
              }
              char v21 = objc_alloc_init(TLToneStoreDownload);
              uint64_t v22 = [v15 title];
              [(TLToneStoreDownload *)v21 _setName:v22];

              id v23 = [v15 collectionName];
              [(TLToneStoreDownload *)v21 _setAlbumTitle:v23];

              BOOL v24 = [v15 artistName];
              [(TLToneStoreDownload *)v21 _setArtistName:v24];

              id v25 = [v15 durationInMilliseconds];
              if (objc_opt_respondsToSelector()) {
                unint64_t v26 = [v25 unsignedIntegerValue];
              }
              else {
                unint64_t v26 = 0;
              }
              -[TLToneStoreDownload _setDuration:](v21, "_setDuration:", (double)v26 / 1000.0, v47);

              long long v27 = [v15 genre];
              [(TLToneStoreDownload *)v21 _setGenreName:v27];

              -[TLToneStoreDownload _setStoreItemIdentifier:](v21, "_setStoreItemIdentifier:", [v15 itemIdentifier]);
              long long v28 = getSSDownloadKindTone();
              -[TLToneStoreDownload _setRingtone:](v21, "_setRingtone:", [v61 isEqualToString:v28] ^ 1);

              uint64_t v29 = [v59 indexOfObject:v21];
              if (v29 == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v30 = [[TLITunesTone alloc] initWithToneStoreDownload:v21];
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                uint64_t v31 = v55;
                uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v85 count:16];
                if (v32)
                {
                  id v9 = *(NSObject **)v70;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v32; ++i)
                    {
                      if (*(NSObject **)v70 != v9) {
                        objc_enumerationMutation(v31);
                      }
                      id v34 = *(void **)(*((void *)&v69 + 1) + 8 * i);
                      if ([(TLITunesTone *)v30 isDuplicateOfTone:v34])
                      {
                        id v35 = [v34 identifier];
                        int v36 = [v62 toneWithIdentifierIsValid:v35];

                        if (v36)
                        {
                          v43 = TLLogToneManagement();
                          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138543618;
                            *(void *)&buf[4] = v15;
                            *(_WORD *)&buf[12] = 2114;
                            *(void *)&buf[14] = v34;
                            _os_log_impl(&dword_1DB936000, v43, OS_LOG_TYPE_DEFAULT, "Store download metadata %{public}@ of tone was found to be a duplicate of the following existing tone: %{public}@. This tone will not be re-downloaded.", buf, 0x16u);
                          }

                          goto LABEL_43;
                        }
                      }
                    }
                    uint64_t v32 = [v31 countByEnumeratingWithState:&v69 objects:v85 count:16];
                    if (v32) {
                      continue;
                    }
                    break;
                  }
                }

                [v59 addObject:v21];
                uint64_t v81 = 0;
                v82 = &v81;
                uint64_t v83 = 0x2050000000;
                uint64_t v37 = (void *)getSSDownloadClass_softClass;
                uint64_t v84 = getSSDownloadClass_softClass;
                if (!getSSDownloadClass_softClass)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __getSSDownloadClass_block_invoke;
                  uint64_t v89 = &unk_1E6C210C8;
                  id v90 = &v81;
                  __getSSDownloadClass_block_invoke((uint64_t)buf);
                  uint64_t v37 = (void *)v82[3];
                }
                uint64_t v38 = v37;
                _Block_object_dispose(&v81, 8);
                long long v30 = (TLITunesTone *)[[v38 alloc] initWithDownloadMetadata:v15];
                uint64_t v81 = 0;
                v82 = &v81;
                uint64_t v83 = 0x2020000000;
                uint64_t v39 = (void *)getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr;
                uint64_t v84 = getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr;
                if (!getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr)
                {
                  *(void *)buf = MEMORY[0x1E4F143A8];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __getSSDownloadPropertyIsStoreDownloadSymbolLoc_block_invoke;
                  uint64_t v89 = &unk_1E6C210C8;
                  id v90 = &v81;
                  id v40 = (void *)StoreServicesLibrary();
                  uint64_t v41 = dlsym(v40, "SSDownloadPropertyIsStoreDownload");
                  *(void *)(v90[1] + 24) = v41;
                  getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr = *(void *)(v90[1] + 24);
                  uint64_t v39 = (void *)v82[3];
                }
                _Block_object_dispose(&v81, 8);
                if (!v39)
                {
                  int v45 = __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
                  __break(1u);
                  goto LABEL_52;
                }
                [(TLITunesTone *)v30 setValue:MEMORY[0x1E4F1CC38] forProperty:*v39];
                [v54 addObject:v30];
                uint64_t v31 = objc_msgSend(NSNumber, "numberWithLongLong:", -[TLITunesTone persistentIdentifier](v30, "persistentIdentifier"));
                [v53 setObject:v21 forKey:v31];
                v42 = TLLogToneManagement();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v21;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v30;
                  *(_WORD *)&buf[22] = 2114;
                  uint64_t v89 = v15;
                  _os_log_impl(&dword_1DB936000, v42, OS_LOG_TYPE_DEFAULT, "Issuing store download for %{public}@: %{public}@ (based on %{public}@).", buf, 0x20u);
                }
              }
              else
              {
                long long v30 = [v59 objectAtIndex:v29];
                uint64_t v31 = TLLogToneManagement();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v15;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v30;
                  _os_log_impl(&dword_1DB936000, v31, OS_LOG_TYPE_DEFAULT, "Store download metadata %{public}@ of tone was found to be a duplicate of the following upcoming tone download: %{public}@. This tone will not be re-downloaded.", buf, 0x16u);
                }
              }
LABEL_43:

              uint64_t v13 = v60 + 1;
            }
            while (v60 + 1 != v58);
            uint64_t v58 = [v56 countByEnumeratingWithState:&v73 objects:v86 count:16];
            if (v58) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v52 + 1;
      }
      while (v52 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v51);
  }

  uint64_t v44 = [v54 count];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke;
  v66[3] = &unk_1E6C21358;
  uint64_t v68 = v44;
  v66[4] = self;
  uint64_t v39 = v53;
  id v67 = v39;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v66];
  id v9 = TLLogToneManagement();
  int v45 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v44)
  {
    if (v45)
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v44;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "Adding %lu tone store downloads.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    storeDownloadManager = self->_storeDownloadManager;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_44;
    v63[3] = &unk_1E6C21380;
    objc_copyWeak(&v65, (id *)buf);
    id v64 = v59;
    [(SSDownloadManager *)storeDownloadManager addDownloads:v54 completionBlock:v63];

    objc_destroyWeak(&v65);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_52:
    if (v45)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB936000, v9, OS_LOG_TYPE_DEFAULT, "No previously purchased tone needs to be redownloaded. We're done here.", buf, 2u);
    }
  }
}

uint64_t __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    return [*(id *)(*(void *)(a1 + 32) + 40) addEntriesFromDictionary:*(void *)(a1 + 40)];
  }
  else {
    return [*(id *)(a1 + 32) _notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload];
  }
}

void __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = TLLogToneManagement();
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_44_cold_1(v3);
      }

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_45;
      v10[3] = &unk_1E6C20D60;
      v10[4] = WeakRetained;
      [WeakRetained _performBlockOnAccessQueue:v10];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB936000, v6, OS_LOG_TYPE_DEFAULT, "Successfully added store downloads for tones.", buf, 2u);
      }

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_46;
      v7[3] = &unk_1E6C20CC0;
      void v7[4] = WeakRetained;
      id v8 = *(id *)(a1 + 32);
      [WeakRetained _performBlockOnAccessQueue:v7];
    }
  }
}

uint64_t __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_45(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload];
}

uint64_t __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_46(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversOfStartedToneStoreDownloads:*(void *)(a1 + 40) progressedToneStoreDownload:0 finishedToneStoreDownloads:0];
}

- (void)_handleToneManagerContentsDidChangeNotification:(id)a3
{
  uint64_t v4 = +[TLToneManager sharedToneManager];
  id v5 = [v4 _installedTones];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke;
  v8[3] = &unk_1E6C213D0;
  v8[4] = self;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(TLToneStoreDownloadStoreServicesController *)self _performBlockOnAccessQueue:v8];
}

void __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke(id *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = (void *)*((void *)a1[4] + 5);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke_2;
  id v10 = &unk_1E6C213A8;
  id v11 = a1[5];
  id v12 = a1[6];
  id v13 = v2;
  id v14 = v3;
  id v5 = v3;
  id v6 = v2;
  [v4 enumerateKeysAndObjectsUsingBlock:&v7];
  objc_msgSend(*((id *)a1[4] + 5), "removeObjectsForKeys:", v5, v7, v8, v9, v10);
  [a1[4] _notifyObserversOfStartedToneStoreDownloads:0 progressedToneStoreDownload:0 finishedToneStoreDownloads:v6];
}

void __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [[TLITunesTone alloc] initWithToneStoreDownload:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = a1[4];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "identifier", (void)v15);
        if ([v13 isDuplicateOfTone:v7]
          && [a1[5] toneWithIdentifierIsValid:v14])
        {
          [v6 _setToneIdentifier:v14];
          [a1[6] addObject:v6];
          [a1[7] addObject:v5];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_performBlockOnAccessQueue:(id)a3
{
  accessQueue = self->_accessQueue;
  if (accessQueue) {
    dispatch_sync(accessQueue, a3);
  }
}

- (void)_assertRunningOnAccessQueue
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DB936000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePurchaseManager, 0);
  objc_storeStrong((id *)&self->_storeDownloadManager, 0);
  objc_storeStrong((id *)&self->_toneStoreDownloadsByStoreDownloadPersistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __64__TLToneStoreDownloadStoreServicesController_redownloadAllTones__block_invoke_cold_1(void *a1)
{
  id v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed to add store purchase for tones with error: %{public}@.", v4, v5, v6, v7, 2u);
}

void __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_44_cold_1(void *a1)
{
  id v1 = objc_msgSend(a1, "tl_nonRedundantDescription");
  OUTLINED_FUNCTION_0(&dword_1DB936000, v2, v3, "Failed to add store downloads for tones with error: %{public}@.", v4, v5, v6, v7, 2u);
}

@end