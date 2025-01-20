@interface NSSCompanionServer
+ (void)associateProtobufHandlers:(id)a3;
- (BOOL)handleDarwinNotification:(id)a3;
- (BOOL)messageIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5;
- (BOOL)messageIdentifier:(id)a3 hasBeenDeliveredWithContext:(id)a4;
- (BOOL)shouldFetchBuiltinAppsNotice;
- (NPSDomainAccessor)nssDomainAccessor;
- (NPSManager)npsManager;
- (NSCache)fileTransferProgress;
- (NSMutableArray)coalescedUsageRequests;
- (NSMutableDictionary)aboutInfoReplyTimers;
- (NSMutableDictionary)aboutInfoRequests;
- (NSMutableDictionary)accountsInfoReplyTimers;
- (NSMutableDictionary)accountsInfoRequests;
- (NSMutableDictionary)airplaneModeSettingsReplyTimers;
- (NSMutableDictionary)airplaneModeSettingsRequests;
- (NSMutableDictionary)betaEnrollmentStatusReplyTimers;
- (NSMutableDictionary)betaEnrollmentStatusRequests;
- (NSMutableDictionary)cancelLogTransferReplyTimers;
- (NSMutableDictionary)cancelLogTransferRequests;
- (NSMutableDictionary)diagnosticLogFileReplyTimers;
- (NSMutableDictionary)diagnosticLogFileRequests;
- (NSMutableDictionary)diagnosticLogsInfoReplyTimers;
- (NSMutableDictionary)diagnosticLogsInfoRequests;
- (NSMutableDictionary)installProfileReplyTimers;
- (NSMutableDictionary)installProfileRequests;
- (NSMutableDictionary)legalDocumentsReplyTimers;
- (NSMutableDictionary)legalDocumentsRequests;
- (NSMutableDictionary)localesInfoReplyTimers;
- (NSMutableDictionary)localesInfoRequests;
- (NSMutableDictionary)logDeleteReplyTimers;
- (NSMutableDictionary)logDeleteRequests;
- (NSMutableDictionary)obliterationDeliveryTimers;
- (NSMutableDictionary)obliterationRequests;
- (NSMutableDictionary)profileDataReplyTimers;
- (NSMutableDictionary)profileDataRequests;
- (NSMutableDictionary)profilesInfoReplyTimers;
- (NSMutableDictionary)profilesInfoRequests;
- (NSMutableDictionary)purgeUsageBundleReplyTimers;
- (NSMutableDictionary)purgeUsageBundleRequests;
- (NSMutableDictionary)removeProfileReplyTimers;
- (NSMutableDictionary)removeProfileRequests;
- (NSMutableDictionary)updateBetaEnrollmentStatusReplyTimers;
- (NSMutableDictionary)updateBetaEnrollmentStatusRequests;
- (NSMutableDictionary)usageReplyTimers;
- (NSMutableDictionary)usageRequests;
- (NSSCompanionServer)init;
- (NSSCompanionSyncManager)syncManager;
- (NSSWatchFaceCoordinator)watchFaceCoordinator;
- (NSString)cancelledLogInTransit;
- (id)_fullFileNamesFrom:(id)a3 files:(id)a4;
- (id)acceptConnection:(id)a3;
- (void)cancelActiveLogFileTranfers;
- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4;
- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4;
- (void)earlyIvarInitialzation;
- (void)fetchBetaEnrollmentStatus:(id)a3;
- (void)getAboutInfo:(id)a3;
- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4;
- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4;
- (void)getDiagnosticLogsInfo:(id)a3;
- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5;
- (void)getLegalDocuments:(id)a3;
- (void)getLocalesInfo:(id)a3;
- (void)getProfilesInfo:(id)a3;
- (void)getUsage:(id)a3;
- (void)getUsageData:(id)a3;
- (void)getWatchFaces:(id)a3;
- (void)handleAboutInfoRespMsg:(id)a3;
- (void)handleAccountsInfoRespMsg:(id)a3;
- (void)handleAirplaneModeSettingsRespMsg:(id)a3;
- (void)handleBetaEnrollmentRespMsg:(id)a3;
- (void)handleCancelLogTransferRespMsg:(id)a3;
- (void)handleDiagnosticLogsInfoRespMsg:(id)a3;
- (void)handleIncomingDiagnosticLogFile:(id)a3 withContext:(id)a4;
- (void)handleIncomingFileTransferProgressMsg:(id)a3;
- (void)handleInstallProfileRespMsg:(id)a3;
- (void)handleLPMAutoDisabledRespMsg:(id)a3;
- (void)handleLegalDocumentsRespMsg:(id)a3;
- (void)handleLocalesInfoRespMsg:(id)a3;
- (void)handleLogDeleteRespMsg:(id)a3;
- (void)handleMemoryPressureEvent;
- (void)handleProfileDataRespMsg:(id)a3;
- (void)handleProfilesInfoRespMsg:(id)a3;
- (void)handlePurgeUsageBundleRespMsg:(id)a3;
- (void)handleRefreshAirplaneModeSettingsReqMsg:(id)a3;
- (void)handleRemoveProfileRespMsg:(id)a3;
- (void)handleUpdateEnrollmentStatusRespMsg:(id)a3;
- (void)handleUsageRespMsg:(id)a3;
- (void)installProfile:(id)a3 replyHandler:(id)a4;
- (void)invalidateOutstandingRequestsWithError:(id)a3;
- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4;
- (void)purgeUsageBundle:(id)a3 replyHandler:(id)a4;
- (void)rebootDevice;
- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5;
- (void)removeProfileWithIdentifier:(id)a3 replyHandler:(id)a4;
- (void)resetBecauseTheActivePairedDeviceChanged;
- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3;
- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4;
- (void)setAboutInfoReplyTimers:(id)a3;
- (void)setAboutInfoRequests:(id)a3;
- (void)setAccountsInfoReplyTimers:(id)a3;
- (void)setAccountsInfoRequests:(id)a3;
- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4;
- (void)setAirplaneModeSettingsReplyTimers:(id)a3;
- (void)setAirplaneModeSettingsRequests:(id)a3;
- (void)setBetaEnrollmentStatusReplyTimers:(id)a3;
- (void)setBetaEnrollmentStatusRequests:(id)a3;
- (void)setCancelLogTransferReplyTimers:(id)a3;
- (void)setCancelLogTransferRequests:(id)a3;
- (void)setCancelledLogInTransit:(id)a3;
- (void)setCoalescedUsageRequests:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDiagnosticLogFileReplyTimers:(id)a3;
- (void)setDiagnosticLogFileRequests:(id)a3;
- (void)setDiagnosticLogsInfoReplyTimers:(id)a3;
- (void)setDiagnosticLogsInfoRequests:(id)a3;
- (void)setFileTransferProgress:(id)a3;
- (void)setInstallProfileReplyTimers:(id)a3;
- (void)setInstallProfileRequests:(id)a3;
- (void)setLegalDocumentsReplyTimers:(id)a3;
- (void)setLegalDocumentsRequests:(id)a3;
- (void)setLocalesInfoReplyTimers:(id)a3;
- (void)setLocalesInfoRequests:(id)a3;
- (void)setLogDeleteReplyTimers:(id)a3;
- (void)setLogDeleteRequests:(id)a3;
- (void)setObliterationDeliveryTimers:(id)a3;
- (void)setObliterationRequests:(id)a3;
- (void)setProfileDataReplyTimers:(id)a3;
- (void)setProfileDataRequests:(id)a3;
- (void)setProfilesInfoReplyTimers:(id)a3;
- (void)setProfilesInfoRequests:(id)a3;
- (void)setPurgeUsageBundleReplyTimers:(id)a3;
- (void)setPurgeUsageBundleRequests:(id)a3;
- (void)setRemoveProfileReplyTimers:(id)a3;
- (void)setRemoveProfileRequests:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setUpdateBetaEnrollmentStatusReplyTimers:(id)a3;
- (void)setUpdateBetaEnrollmentStatusRequests:(id)a3;
- (void)setUsageReplyTimers:(id)a3;
- (void)setUsageRequests:(id)a3;
- (void)setWatchFaceCoordinator:(id)a3;
- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation NSSCompanionServer

- (NSSCompanionServer)init
{
  v7.receiver = self;
  v7.super_class = (Class)NSSCompanionServer;
  v2 = [(NSSServer *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(NSSCompanionSyncManager);
    syncManager = v2->_syncManager;
    v2->_syncManager = v3;

    id v5 = +[NSSGizmoPowerMonitor sharedMonitor];
  }
  return v2;
}

- (void)earlyIvarInitialzation
{
  v79.receiver = self;
  v79.super_class = (Class)NSSCompanionServer;
  [(NSSServer *)&v79 earlyIvarInitialzation];
  v3 = (NSMutableArray *)objc_opt_new();
  coalescedUsageRequests = self->_coalescedUsageRequests;
  self->_coalescedUsageRequests = v3;

  id v5 = (NSMutableDictionary *)objc_opt_new();
  usageRequests = self->_usageRequests;
  self->_usageRequests = v5;

  objc_super v7 = (NSMutableDictionary *)objc_opt_new();
  purgeUsageBundleRequests = self->_purgeUsageBundleRequests;
  self->_purgeUsageBundleRequests = v7;

  v9 = (NSMutableDictionary *)objc_opt_new();
  diagnosticLogFileRequests = self->_diagnosticLogFileRequests;
  self->_diagnosticLogFileRequests = v9;

  v11 = (NSMutableDictionary *)objc_opt_new();
  diagnosticLogsInfoRequests = self->_diagnosticLogsInfoRequests;
  self->_diagnosticLogsInfoRequests = v11;

  v13 = (NSMutableDictionary *)objc_opt_new();
  cancelLogTransferRequests = self->_cancelLogTransferRequests;
  self->_cancelLogTransferRequests = v13;

  v15 = (NSMutableDictionary *)objc_opt_new();
  airplaneModeSettingsRequests = self->_airplaneModeSettingsRequests;
  self->_airplaneModeSettingsRequests = v15;

  v17 = (NSMutableDictionary *)objc_opt_new();
  logDeleteRequests = self->_logDeleteRequests;
  self->_logDeleteRequests = v17;

  v19 = (NSMutableDictionary *)objc_opt_new();
  aboutInfoRequests = self->_aboutInfoRequests;
  self->_aboutInfoRequests = v19;

  v21 = (NSMutableDictionary *)objc_opt_new();
  obliterationRequests = self->_obliterationRequests;
  self->_obliterationRequests = v21;

  v23 = (NSMutableDictionary *)objc_opt_new();
  accountsInfoRequests = self->_accountsInfoRequests;
  self->_accountsInfoRequests = v23;

  v25 = (NSMutableDictionary *)objc_opt_new();
  profilesInfoRequests = self->_profilesInfoRequests;
  self->_profilesInfoRequests = v25;

  v27 = (NSMutableDictionary *)objc_opt_new();
  profileDataRequests = self->_profileDataRequests;
  self->_profileDataRequests = v27;

  v29 = (NSMutableDictionary *)objc_opt_new();
  installProfileRequests = self->_installProfileRequests;
  self->_installProfileRequests = v29;

  v31 = (NSMutableDictionary *)objc_opt_new();
  removeProfileRequests = self->_removeProfileRequests;
  self->_removeProfileRequests = v31;

  v33 = (NSMutableDictionary *)objc_opt_new();
  legalDocumentsRequests = self->_legalDocumentsRequests;
  self->_legalDocumentsRequests = v33;

  v35 = (NSMutableDictionary *)objc_opt_new();
  localesInfoRequests = self->_localesInfoRequests;
  self->_localesInfoRequests = v35;

  v37 = (NSMutableDictionary *)objc_opt_new();
  betaEnrollmentStatusRequests = self->_betaEnrollmentStatusRequests;
  self->_betaEnrollmentStatusRequests = v37;

  v39 = (NSMutableDictionary *)objc_opt_new();
  updateBetaEnrollmentStatusRequests = self->_updateBetaEnrollmentStatusRequests;
  self->_updateBetaEnrollmentStatusRequests = v39;

  v41 = (NSMutableDictionary *)objc_opt_new();
  usageReplyTimers = self->_usageReplyTimers;
  self->_usageReplyTimers = v41;

  v43 = (NSMutableDictionary *)objc_opt_new();
  purgeUsageBundleReplyTimers = self->_purgeUsageBundleReplyTimers;
  self->_purgeUsageBundleReplyTimers = v43;

  v45 = (NSMutableDictionary *)objc_opt_new();
  diagnosticLogFileReplyTimers = self->_diagnosticLogFileReplyTimers;
  self->_diagnosticLogFileReplyTimers = v45;

  v47 = (NSMutableDictionary *)objc_opt_new();
  diagnosticLogsInfoReplyTimers = self->_diagnosticLogsInfoReplyTimers;
  self->_diagnosticLogsInfoReplyTimers = v47;

  v49 = (NSMutableDictionary *)objc_opt_new();
  cancelLogTransferReplyTimers = self->_cancelLogTransferReplyTimers;
  self->_cancelLogTransferReplyTimers = v49;

  v51 = (NSMutableDictionary *)objc_opt_new();
  airplaneModeSettingsReplyTimers = self->_airplaneModeSettingsReplyTimers;
  self->_airplaneModeSettingsReplyTimers = v51;

  v53 = (NSMutableDictionary *)objc_opt_new();
  logDeleteReplyTimers = self->_logDeleteReplyTimers;
  self->_logDeleteReplyTimers = v53;

  v55 = (NSMutableDictionary *)objc_opt_new();
  aboutInfoReplyTimers = self->_aboutInfoReplyTimers;
  self->_aboutInfoReplyTimers = v55;

  v57 = (NSMutableDictionary *)objc_opt_new();
  obliterationDeliveryTimers = self->_obliterationDeliveryTimers;
  self->_obliterationDeliveryTimers = v57;

  v59 = (NSMutableDictionary *)objc_opt_new();
  accountsInfoReplyTimers = self->_accountsInfoReplyTimers;
  self->_accountsInfoReplyTimers = v59;

  v61 = (NSMutableDictionary *)objc_opt_new();
  profilesInfoReplyTimers = self->_profilesInfoReplyTimers;
  self->_profilesInfoReplyTimers = v61;

  v63 = (NSMutableDictionary *)objc_opt_new();
  profileDataReplyTimers = self->_profileDataReplyTimers;
  self->_profileDataReplyTimers = v63;

  v65 = (NSMutableDictionary *)objc_opt_new();
  installProfileReplyTimers = self->_installProfileReplyTimers;
  self->_installProfileReplyTimers = v65;

  v67 = (NSMutableDictionary *)objc_opt_new();
  removeProfileReplyTimers = self->_removeProfileReplyTimers;
  self->_removeProfileReplyTimers = v67;

  v69 = (NSMutableDictionary *)objc_opt_new();
  legalDocumentsReplyTimers = self->_legalDocumentsReplyTimers;
  self->_legalDocumentsReplyTimers = v69;

  v71 = (NSMutableDictionary *)objc_opt_new();
  localesInfoReplyTimers = self->_localesInfoReplyTimers;
  self->_localesInfoReplyTimers = v71;

  v73 = (NSMutableDictionary *)objc_opt_new();
  betaEnrollmentStatusReplyTimers = self->_betaEnrollmentStatusReplyTimers;
  self->_betaEnrollmentStatusReplyTimers = v73;

  v75 = (NSMutableDictionary *)objc_opt_new();
  updateBetaEnrollmentStatusReplyTimers = self->_updateBetaEnrollmentStatusReplyTimers;
  self->_updateBetaEnrollmentStatusReplyTimers = v75;

  v77 = (NSCache *)objc_opt_new();
  fileTransferProgress = self->_fileTransferProgress;
  self->_fileTransferProgress = v77;
}

- (id)acceptConnection:(id)a3
{
  id v4 = a3;
  id v5 = [[NSSCompanionConnectionHandler alloc] initWithConnection:v4 delegate:self];

  return v5;
}

- (void)resetBecauseTheActivePairedDeviceChanged
{
  [(NSSCompanionServer *)self handleMemoryPressureEvent];
  nssDomainAccessor = self->_nssDomainAccessor;
  self->_nssDomainAccessor = 0;

  npsManager = self->_npsManager;
  self->_npsManager = 0;

  NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v8 = @"Watch switch invalidated request";
  id v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v6 = +[NSError errorWithDomain:@"com.apple.NanoSystemSettings" code:333 userInfo:v5];

  [(NSSCompanionServer *)self invalidateOutstandingRequestsWithError:v6];
}

- (void)invalidateOutstandingRequestsWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NSSServer *)self idsQueue];
  dispatch_assert_queue_V2(v5);

  long long v338 = 0u;
  long long v337 = 0u;
  long long v336 = 0u;
  long long v335 = 0u;
  v6 = [(NSMutableDictionary *)self->_usageReplyTimers allValues];
  id v7 = [v6 countByEnumeratingWithState:&v335 objects:v375 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v336;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v336 != v9) {
          objc_enumerationMutation(v6);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v335 + 1) + 8 * (void)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v335 objects:v375 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)self->_usageReplyTimers removeAllObjects];
  long long v334 = 0u;
  long long v333 = 0u;
  long long v332 = 0u;
  long long v331 = 0u;
  v11 = self->_coalescedUsageRequests;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v331 objects:v374 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v332;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v332 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v331 + 1) + 8 * (void)v15) + 16))();
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v331 objects:v374 count:16];
    }
    while (v13);
  }

  [(NSMutableArray *)self->_coalescedUsageRequests removeAllObjects];
  long long v330 = 0u;
  long long v329 = 0u;
  long long v328 = 0u;
  long long v327 = 0u;
  v16 = [(NSMutableDictionary *)self->_usageRequests allValues];
  id v17 = [v16 countByEnumeratingWithState:&v327 objects:v373 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v328;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v328 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v327 + 1) + 8 * (void)v20) + 16))();
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v327 objects:v373 count:16];
    }
    while (v18);
  }

  [(NSMutableDictionary *)self->_usageRequests removeAllObjects];
  long long v326 = 0u;
  long long v325 = 0u;
  long long v324 = 0u;
  long long v323 = 0u;
  v21 = [(NSMutableDictionary *)self->_purgeUsageBundleReplyTimers allValues];
  id v22 = [v21 countByEnumeratingWithState:&v323 objects:v372 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v324;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v324 != v24) {
          objc_enumerationMutation(v21);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v323 + 1) + 8 * (void)v25));
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v323 objects:v372 count:16];
    }
    while (v23);
  }

  [(NSMutableDictionary *)self->_purgeUsageBundleReplyTimers removeAllObjects];
  long long v322 = 0u;
  long long v321 = 0u;
  long long v320 = 0u;
  long long v319 = 0u;
  v26 = [(NSMutableDictionary *)self->_purgeUsageBundleRequests allValues];
  id v27 = [v26 countByEnumeratingWithState:&v319 objects:v371 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v320;
    do
    {
      v30 = 0;
      do
      {
        if (*(void *)v320 != v29) {
          objc_enumerationMutation(v26);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v319 + 1) + 8 * (void)v30) + 16))();
        v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      id v28 = [v26 countByEnumeratingWithState:&v319 objects:v371 count:16];
    }
    while (v28);
  }

  [(NSMutableDictionary *)self->_purgeUsageBundleRequests removeAllObjects];
  long long v318 = 0u;
  long long v317 = 0u;
  long long v316 = 0u;
  long long v315 = 0u;
  v31 = [(NSMutableDictionary *)self->_diagnosticLogFileReplyTimers allValues];
  id v32 = [v31 countByEnumeratingWithState:&v315 objects:v370 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v316;
    do
    {
      v35 = 0;
      do
      {
        if (*(void *)v316 != v34) {
          objc_enumerationMutation(v31);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v315 + 1) + 8 * (void)v35));
        v35 = (char *)v35 + 1;
      }
      while (v33 != v35);
      id v33 = [v31 countByEnumeratingWithState:&v315 objects:v370 count:16];
    }
    while (v33);
  }

  [(NSMutableDictionary *)self->_diagnosticLogFileReplyTimers removeAllObjects];
  long long v314 = 0u;
  long long v313 = 0u;
  long long v312 = 0u;
  long long v311 = 0u;
  v36 = [(NSMutableDictionary *)self->_diagnosticLogFileRequests allValues];
  id v37 = [v36 countByEnumeratingWithState:&v311 objects:v369 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v312;
    do
    {
      v40 = 0;
      do
      {
        if (*(void *)v312 != v39) {
          objc_enumerationMutation(v36);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v311 + 1) + 8 * (void)v40) + 16))();
        v40 = (char *)v40 + 1;
      }
      while (v38 != v40);
      id v38 = [v36 countByEnumeratingWithState:&v311 objects:v369 count:16];
    }
    while (v38);
  }

  [(NSMutableDictionary *)self->_diagnosticLogFileRequests removeAllObjects];
  long long v310 = 0u;
  long long v309 = 0u;
  long long v308 = 0u;
  long long v307 = 0u;
  v41 = [(NSMutableDictionary *)self->_cancelLogTransferReplyTimers allValues];
  id v42 = [v41 countByEnumeratingWithState:&v307 objects:v368 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v308;
    do
    {
      v45 = 0;
      do
      {
        if (*(void *)v308 != v44) {
          objc_enumerationMutation(v41);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v307 + 1) + 8 * (void)v45));
        v45 = (char *)v45 + 1;
      }
      while (v43 != v45);
      id v43 = [v41 countByEnumeratingWithState:&v307 objects:v368 count:16];
    }
    while (v43);
  }

  [(NSMutableDictionary *)self->_cancelLogTransferReplyTimers removeAllObjects];
  long long v306 = 0u;
  long long v305 = 0u;
  long long v304 = 0u;
  long long v303 = 0u;
  v46 = [(NSMutableDictionary *)self->_cancelLogTransferRequests allValues];
  id v47 = [v46 countByEnumeratingWithState:&v303 objects:v367 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v304;
    do
    {
      v50 = 0;
      do
      {
        if (*(void *)v304 != v49) {
          objc_enumerationMutation(v46);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v303 + 1) + 8 * (void)v50) + 16))();
        v50 = (char *)v50 + 1;
      }
      while (v48 != v50);
      id v48 = [v46 countByEnumeratingWithState:&v303 objects:v367 count:16];
    }
    while (v48);
  }

  [(NSMutableDictionary *)self->_cancelLogTransferRequests removeAllObjects];
  long long v302 = 0u;
  long long v301 = 0u;
  long long v300 = 0u;
  long long v299 = 0u;
  v51 = [(NSMutableDictionary *)self->_diagnosticLogsInfoReplyTimers allValues];
  id v52 = [v51 countByEnumeratingWithState:&v299 objects:v366 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v300;
    do
    {
      v55 = 0;
      do
      {
        if (*(void *)v300 != v54) {
          objc_enumerationMutation(v51);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v299 + 1) + 8 * (void)v55));
        v55 = (char *)v55 + 1;
      }
      while (v53 != v55);
      id v53 = [v51 countByEnumeratingWithState:&v299 objects:v366 count:16];
    }
    while (v53);
  }

  [(NSMutableDictionary *)self->_diagnosticLogsInfoReplyTimers removeAllObjects];
  long long v298 = 0u;
  long long v297 = 0u;
  long long v296 = 0u;
  long long v295 = 0u;
  v56 = [(NSMutableDictionary *)self->_diagnosticLogsInfoRequests allValues];
  id v57 = [v56 countByEnumeratingWithState:&v295 objects:v365 count:16];
  if (v57)
  {
    id v58 = v57;
    uint64_t v59 = *(void *)v296;
    do
    {
      v60 = 0;
      do
      {
        if (*(void *)v296 != v59) {
          objc_enumerationMutation(v56);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v295 + 1) + 8 * (void)v60) + 16))();
        v60 = (char *)v60 + 1;
      }
      while (v58 != v60);
      id v58 = [v56 countByEnumeratingWithState:&v295 objects:v365 count:16];
    }
    while (v58);
  }

  [(NSMutableDictionary *)self->_diagnosticLogsInfoRequests removeAllObjects];
  long long v294 = 0u;
  long long v293 = 0u;
  long long v292 = 0u;
  long long v291 = 0u;
  v61 = [(NSMutableDictionary *)self->_airplaneModeSettingsReplyTimers allValues];
  id v62 = [v61 countByEnumeratingWithState:&v291 objects:v364 count:16];
  if (v62)
  {
    id v63 = v62;
    uint64_t v64 = *(void *)v292;
    do
    {
      v65 = 0;
      do
      {
        if (*(void *)v292 != v64) {
          objc_enumerationMutation(v61);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v291 + 1) + 8 * (void)v65));
        v65 = (char *)v65 + 1;
      }
      while (v63 != v65);
      id v63 = [v61 countByEnumeratingWithState:&v291 objects:v364 count:16];
    }
    while (v63);
  }

  [(NSMutableDictionary *)self->_airplaneModeSettingsReplyTimers removeAllObjects];
  long long v290 = 0u;
  long long v289 = 0u;
  long long v288 = 0u;
  long long v287 = 0u;
  v66 = [(NSMutableDictionary *)self->_airplaneModeSettingsRequests allValues];
  id v67 = [v66 countByEnumeratingWithState:&v287 objects:v363 count:16];
  if (v67)
  {
    id v68 = v67;
    uint64_t v69 = *(void *)v288;
    do
    {
      v70 = 0;
      do
      {
        if (*(void *)v288 != v69) {
          objc_enumerationMutation(v66);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v287 + 1) + 8 * (void)v70) + 16))();
        v70 = (char *)v70 + 1;
      }
      while (v68 != v70);
      id v68 = [v66 countByEnumeratingWithState:&v287 objects:v363 count:16];
    }
    while (v68);
  }

  [(NSMutableDictionary *)self->_airplaneModeSettingsRequests removeAllObjects];
  long long v286 = 0u;
  long long v285 = 0u;
  long long v284 = 0u;
  long long v283 = 0u;
  v71 = [(NSMutableDictionary *)self->_logDeleteReplyTimers allValues];
  id v72 = [v71 countByEnumeratingWithState:&v283 objects:v362 count:16];
  if (v72)
  {
    id v73 = v72;
    uint64_t v74 = *(void *)v284;
    do
    {
      v75 = 0;
      do
      {
        if (*(void *)v284 != v74) {
          objc_enumerationMutation(v71);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v283 + 1) + 8 * (void)v75));
        v75 = (char *)v75 + 1;
      }
      while (v73 != v75);
      id v73 = [v71 countByEnumeratingWithState:&v283 objects:v362 count:16];
    }
    while (v73);
  }

  [(NSMutableDictionary *)self->_logDeleteReplyTimers removeAllObjects];
  long long v282 = 0u;
  long long v281 = 0u;
  long long v280 = 0u;
  long long v279 = 0u;
  v76 = [(NSMutableDictionary *)self->_logDeleteRequests allValues];
  id v77 = [v76 countByEnumeratingWithState:&v279 objects:v361 count:16];
  if (v77)
  {
    id v78 = v77;
    uint64_t v79 = *(void *)v280;
    do
    {
      v80 = 0;
      do
      {
        if (*(void *)v280 != v79) {
          objc_enumerationMutation(v76);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v279 + 1) + 8 * (void)v80) + 16))();
        v80 = (char *)v80 + 1;
      }
      while (v78 != v80);
      id v78 = [v76 countByEnumeratingWithState:&v279 objects:v361 count:16];
    }
    while (v78);
  }

  [(NSMutableDictionary *)self->_logDeleteRequests removeAllObjects];
  long long v278 = 0u;
  long long v277 = 0u;
  long long v276 = 0u;
  long long v275 = 0u;
  v81 = [(NSMutableDictionary *)self->_aboutInfoReplyTimers allValues];
  id v82 = [v81 countByEnumeratingWithState:&v275 objects:v360 count:16];
  if (v82)
  {
    id v83 = v82;
    uint64_t v84 = *(void *)v276;
    do
    {
      v85 = 0;
      do
      {
        if (*(void *)v276 != v84) {
          objc_enumerationMutation(v81);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v275 + 1) + 8 * (void)v85));
        v85 = (char *)v85 + 1;
      }
      while (v83 != v85);
      id v83 = [v81 countByEnumeratingWithState:&v275 objects:v360 count:16];
    }
    while (v83);
  }

  [(NSMutableDictionary *)self->_aboutInfoReplyTimers removeAllObjects];
  long long v274 = 0u;
  long long v273 = 0u;
  long long v272 = 0u;
  long long v271 = 0u;
  v86 = [(NSMutableDictionary *)self->_aboutInfoRequests allValues];
  id v87 = [v86 countByEnumeratingWithState:&v271 objects:v359 count:16];
  if (v87)
  {
    id v88 = v87;
    uint64_t v89 = *(void *)v272;
    do
    {
      v90 = 0;
      do
      {
        if (*(void *)v272 != v89) {
          objc_enumerationMutation(v86);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v271 + 1) + 8 * (void)v90) + 16))();
        v90 = (char *)v90 + 1;
      }
      while (v88 != v90);
      id v88 = [v86 countByEnumeratingWithState:&v271 objects:v359 count:16];
    }
    while (v88);
  }

  [(NSMutableDictionary *)self->_aboutInfoRequests removeAllObjects];
  long long v270 = 0u;
  long long v269 = 0u;
  long long v268 = 0u;
  long long v267 = 0u;
  v91 = [(NSMutableDictionary *)self->_obliterationDeliveryTimers allValues];
  id v92 = [v91 countByEnumeratingWithState:&v267 objects:v358 count:16];
  if (v92)
  {
    id v93 = v92;
    uint64_t v94 = *(void *)v268;
    do
    {
      v95 = 0;
      do
      {
        if (*(void *)v268 != v94) {
          objc_enumerationMutation(v91);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v267 + 1) + 8 * (void)v95));
        v95 = (char *)v95 + 1;
      }
      while (v93 != v95);
      id v93 = [v91 countByEnumeratingWithState:&v267 objects:v358 count:16];
    }
    while (v93);
  }

  [(NSMutableDictionary *)self->_obliterationDeliveryTimers removeAllObjects];
  long long v266 = 0u;
  long long v265 = 0u;
  long long v264 = 0u;
  long long v263 = 0u;
  v96 = [(NSMutableDictionary *)self->_obliterationRequests allValues];
  id v97 = [v96 countByEnumeratingWithState:&v263 objects:v357 count:16];
  if (v97)
  {
    id v98 = v97;
    uint64_t v99 = *(void *)v264;
    do
    {
      v100 = 0;
      do
      {
        if (*(void *)v264 != v99) {
          objc_enumerationMutation(v96);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v263 + 1) + 8 * (void)v100) + 16))();
        v100 = (char *)v100 + 1;
      }
      while (v98 != v100);
      id v98 = [v96 countByEnumeratingWithState:&v263 objects:v357 count:16];
    }
    while (v98);
  }

  [(NSMutableDictionary *)self->_obliterationRequests removeAllObjects];
  long long v262 = 0u;
  long long v261 = 0u;
  long long v260 = 0u;
  long long v259 = 0u;
  v101 = [(NSMutableDictionary *)self->_accountsInfoReplyTimers allValues];
  id v102 = [v101 countByEnumeratingWithState:&v259 objects:v356 count:16];
  if (v102)
  {
    id v103 = v102;
    uint64_t v104 = *(void *)v260;
    do
    {
      v105 = 0;
      do
      {
        if (*(void *)v260 != v104) {
          objc_enumerationMutation(v101);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v259 + 1) + 8 * (void)v105));
        v105 = (char *)v105 + 1;
      }
      while (v103 != v105);
      id v103 = [v101 countByEnumeratingWithState:&v259 objects:v356 count:16];
    }
    while (v103);
  }

  [(NSMutableDictionary *)self->_accountsInfoReplyTimers removeAllObjects];
  long long v258 = 0u;
  long long v257 = 0u;
  long long v256 = 0u;
  long long v255 = 0u;
  v106 = [(NSMutableDictionary *)self->_accountsInfoRequests allValues];
  id v107 = [v106 countByEnumeratingWithState:&v255 objects:v355 count:16];
  if (v107)
  {
    id v108 = v107;
    uint64_t v109 = *(void *)v256;
    do
    {
      v110 = 0;
      do
      {
        if (*(void *)v256 != v109) {
          objc_enumerationMutation(v106);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v255 + 1) + 8 * (void)v110) + 16))();
        v110 = (char *)v110 + 1;
      }
      while (v108 != v110);
      id v108 = [v106 countByEnumeratingWithState:&v255 objects:v355 count:16];
    }
    while (v108);
  }

  [(NSMutableDictionary *)self->_accountsInfoRequests removeAllObjects];
  long long v253 = 0u;
  long long v254 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  v111 = [(NSMutableDictionary *)self->_profilesInfoReplyTimers allValues];
  id v112 = [v111 countByEnumeratingWithState:&v251 objects:v354 count:16];
  if (v112)
  {
    id v113 = v112;
    uint64_t v114 = *(void *)v252;
    do
    {
      v115 = 0;
      do
      {
        if (*(void *)v252 != v114) {
          objc_enumerationMutation(v111);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v251 + 1) + 8 * (void)v115));
        v115 = (char *)v115 + 1;
      }
      while (v113 != v115);
      id v113 = [v111 countByEnumeratingWithState:&v251 objects:v354 count:16];
    }
    while (v113);
  }

  [(NSMutableDictionary *)self->_profilesInfoReplyTimers removeAllObjects];
  long long v249 = 0u;
  long long v250 = 0u;
  long long v247 = 0u;
  long long v248 = 0u;
  v116 = [(NSMutableDictionary *)self->_profilesInfoRequests allValues];
  id v117 = [v116 countByEnumeratingWithState:&v247 objects:v353 count:16];
  if (v117)
  {
    id v118 = v117;
    uint64_t v119 = *(void *)v248;
    do
    {
      v120 = 0;
      do
      {
        if (*(void *)v248 != v119) {
          objc_enumerationMutation(v116);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v247 + 1) + 8 * (void)v120) + 16))();
        v120 = (char *)v120 + 1;
      }
      while (v118 != v120);
      id v118 = [v116 countByEnumeratingWithState:&v247 objects:v353 count:16];
    }
    while (v118);
  }

  [(NSMutableDictionary *)self->_profilesInfoRequests removeAllObjects];
  long long v245 = 0u;
  long long v246 = 0u;
  long long v243 = 0u;
  long long v244 = 0u;
  v121 = [(NSMutableDictionary *)self->_profileDataReplyTimers allValues];
  id v122 = [v121 countByEnumeratingWithState:&v243 objects:v352 count:16];
  if (v122)
  {
    id v123 = v122;
    uint64_t v124 = *(void *)v244;
    do
    {
      v125 = 0;
      do
      {
        if (*(void *)v244 != v124) {
          objc_enumerationMutation(v121);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v243 + 1) + 8 * (void)v125));
        v125 = (char *)v125 + 1;
      }
      while (v123 != v125);
      id v123 = [v121 countByEnumeratingWithState:&v243 objects:v352 count:16];
    }
    while (v123);
  }

  [(NSMutableDictionary *)self->_profileDataReplyTimers removeAllObjects];
  long long v241 = 0u;
  long long v242 = 0u;
  long long v239 = 0u;
  long long v240 = 0u;
  v126 = [(NSMutableDictionary *)self->_profileDataRequests allValues];
  id v127 = [v126 countByEnumeratingWithState:&v239 objects:v351 count:16];
  if (v127)
  {
    id v128 = v127;
    uint64_t v129 = *(void *)v240;
    do
    {
      v130 = 0;
      do
      {
        if (*(void *)v240 != v129) {
          objc_enumerationMutation(v126);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v239 + 1) + 8 * (void)v130) + 16))();
        v130 = (char *)v130 + 1;
      }
      while (v128 != v130);
      id v128 = [v126 countByEnumeratingWithState:&v239 objects:v351 count:16];
    }
    while (v128);
  }

  [(NSMutableDictionary *)self->_profileDataRequests removeAllObjects];
  long long v237 = 0u;
  long long v238 = 0u;
  long long v235 = 0u;
  long long v236 = 0u;
  v131 = [(NSMutableDictionary *)self->_installProfileReplyTimers allValues];
  id v132 = [v131 countByEnumeratingWithState:&v235 objects:v350 count:16];
  if (v132)
  {
    id v133 = v132;
    uint64_t v134 = *(void *)v236;
    do
    {
      v135 = 0;
      do
      {
        if (*(void *)v236 != v134) {
          objc_enumerationMutation(v131);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v235 + 1) + 8 * (void)v135));
        v135 = (char *)v135 + 1;
      }
      while (v133 != v135);
      id v133 = [v131 countByEnumeratingWithState:&v235 objects:v350 count:16];
    }
    while (v133);
  }

  [(NSMutableDictionary *)self->_installProfileReplyTimers removeAllObjects];
  long long v233 = 0u;
  long long v234 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  v136 = [(NSMutableDictionary *)self->_installProfileRequests allValues];
  id v137 = [v136 countByEnumeratingWithState:&v231 objects:v349 count:16];
  if (v137)
  {
    id v138 = v137;
    uint64_t v139 = *(void *)v232;
    do
    {
      v140 = 0;
      do
      {
        if (*(void *)v232 != v139) {
          objc_enumerationMutation(v136);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v231 + 1) + 8 * (void)v140) + 16))();
        v140 = (char *)v140 + 1;
      }
      while (v138 != v140);
      id v138 = [v136 countByEnumeratingWithState:&v231 objects:v349 count:16];
    }
    while (v138);
  }

  [(NSMutableDictionary *)self->_installProfileRequests removeAllObjects];
  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  v141 = [(NSMutableDictionary *)self->_removeProfileReplyTimers allValues];
  id v142 = [v141 countByEnumeratingWithState:&v227 objects:v348 count:16];
  if (v142)
  {
    id v143 = v142;
    uint64_t v144 = *(void *)v228;
    do
    {
      v145 = 0;
      do
      {
        if (*(void *)v228 != v144) {
          objc_enumerationMutation(v141);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v227 + 1) + 8 * (void)v145));
        v145 = (char *)v145 + 1;
      }
      while (v143 != v145);
      id v143 = [v141 countByEnumeratingWithState:&v227 objects:v348 count:16];
    }
    while (v143);
  }

  [(NSMutableDictionary *)self->_removeProfileReplyTimers removeAllObjects];
  long long v225 = 0u;
  long long v226 = 0u;
  long long v223 = 0u;
  long long v224 = 0u;
  v146 = [(NSMutableDictionary *)self->_removeProfileRequests allValues];
  id v147 = [v146 countByEnumeratingWithState:&v223 objects:v347 count:16];
  if (v147)
  {
    id v148 = v147;
    uint64_t v149 = *(void *)v224;
    do
    {
      v150 = 0;
      do
      {
        if (*(void *)v224 != v149) {
          objc_enumerationMutation(v146);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v223 + 1) + 8 * (void)v150) + 16))();
        v150 = (char *)v150 + 1;
      }
      while (v148 != v150);
      id v148 = [v146 countByEnumeratingWithState:&v223 objects:v347 count:16];
    }
    while (v148);
  }

  [(NSMutableDictionary *)self->_removeProfileRequests removeAllObjects];
  long long v221 = 0u;
  long long v222 = 0u;
  long long v219 = 0u;
  long long v220 = 0u;
  v151 = [(NSMutableDictionary *)self->_legalDocumentsReplyTimers allValues];
  id v152 = [v151 countByEnumeratingWithState:&v219 objects:v346 count:16];
  if (v152)
  {
    id v153 = v152;
    uint64_t v154 = *(void *)v220;
    do
    {
      v155 = 0;
      do
      {
        if (*(void *)v220 != v154) {
          objc_enumerationMutation(v151);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v219 + 1) + 8 * (void)v155));
        v155 = (char *)v155 + 1;
      }
      while (v153 != v155);
      id v153 = [v151 countByEnumeratingWithState:&v219 objects:v346 count:16];
    }
    while (v153);
  }

  [(NSMutableDictionary *)self->_legalDocumentsReplyTimers removeAllObjects];
  long long v217 = 0u;
  long long v218 = 0u;
  long long v215 = 0u;
  long long v216 = 0u;
  v156 = [(NSMutableDictionary *)self->_legalDocumentsRequests allValues];
  id v157 = [v156 countByEnumeratingWithState:&v215 objects:v345 count:16];
  if (v157)
  {
    id v158 = v157;
    uint64_t v159 = *(void *)v216;
    do
    {
      v160 = 0;
      do
      {
        if (*(void *)v216 != v159) {
          objc_enumerationMutation(v156);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v215 + 1) + 8 * (void)v160) + 16))();
        v160 = (char *)v160 + 1;
      }
      while (v158 != v160);
      id v158 = [v156 countByEnumeratingWithState:&v215 objects:v345 count:16];
    }
    while (v158);
  }

  [(NSMutableDictionary *)self->_legalDocumentsRequests removeAllObjects];
  long long v213 = 0u;
  long long v214 = 0u;
  long long v211 = 0u;
  long long v212 = 0u;
  v161 = [(NSMutableDictionary *)self->_localesInfoReplyTimers allValues];
  id v162 = [v161 countByEnumeratingWithState:&v211 objects:v344 count:16];
  if (v162)
  {
    id v163 = v162;
    uint64_t v164 = *(void *)v212;
    do
    {
      v165 = 0;
      do
      {
        if (*(void *)v212 != v164) {
          objc_enumerationMutation(v161);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v211 + 1) + 8 * (void)v165));
        v165 = (char *)v165 + 1;
      }
      while (v163 != v165);
      id v163 = [v161 countByEnumeratingWithState:&v211 objects:v344 count:16];
    }
    while (v163);
  }

  [(NSMutableDictionary *)self->_localesInfoReplyTimers removeAllObjects];
  long long v209 = 0u;
  long long v210 = 0u;
  long long v207 = 0u;
  long long v208 = 0u;
  v166 = [(NSMutableDictionary *)self->_localesInfoRequests allValues];
  id v167 = [v166 countByEnumeratingWithState:&v207 objects:v343 count:16];
  if (v167)
  {
    id v168 = v167;
    uint64_t v169 = *(void *)v208;
    do
    {
      v170 = 0;
      do
      {
        if (*(void *)v208 != v169) {
          objc_enumerationMutation(v166);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v207 + 1) + 8 * (void)v170) + 16))();
        v170 = (char *)v170 + 1;
      }
      while (v168 != v170);
      id v168 = [v166 countByEnumeratingWithState:&v207 objects:v343 count:16];
    }
    while (v168);
  }

  [(NSMutableDictionary *)self->_localesInfoRequests removeAllObjects];
  long long v205 = 0u;
  long long v206 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  v171 = [(NSMutableDictionary *)self->_betaEnrollmentStatusReplyTimers allValues];
  id v172 = [v171 countByEnumeratingWithState:&v203 objects:v342 count:16];
  if (v172)
  {
    id v173 = v172;
    uint64_t v174 = *(void *)v204;
    do
    {
      v175 = 0;
      do
      {
        if (*(void *)v204 != v174) {
          objc_enumerationMutation(v171);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v203 + 1) + 8 * (void)v175));
        v175 = (char *)v175 + 1;
      }
      while (v173 != v175);
      id v173 = [v171 countByEnumeratingWithState:&v203 objects:v342 count:16];
    }
    while (v173);
  }

  [(NSMutableDictionary *)self->_betaEnrollmentStatusReplyTimers removeAllObjects];
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  v176 = [(NSMutableDictionary *)self->_betaEnrollmentStatusRequests allValues];
  id v177 = [v176 countByEnumeratingWithState:&v199 objects:v341 count:16];
  if (v177)
  {
    id v178 = v177;
    uint64_t v179 = *(void *)v200;
    do
    {
      v180 = 0;
      do
      {
        if (*(void *)v200 != v179) {
          objc_enumerationMutation(v176);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v199 + 1) + 8 * (void)v180) + 16))();
        v180 = (char *)v180 + 1;
      }
      while (v178 != v180);
      id v178 = [v176 countByEnumeratingWithState:&v199 objects:v341 count:16];
    }
    while (v178);
  }

  [(NSMutableDictionary *)self->_betaEnrollmentStatusRequests removeAllObjects];
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  v181 = [(NSMutableDictionary *)self->_updateBetaEnrollmentStatusReplyTimers allValues];
  id v182 = [v181 countByEnumeratingWithState:&v195 objects:v340 count:16];
  if (v182)
  {
    id v183 = v182;
    uint64_t v184 = *(void *)v196;
    do
    {
      v185 = 0;
      do
      {
        if (*(void *)v196 != v184) {
          objc_enumerationMutation(v181);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v195 + 1) + 8 * (void)v185));
        v185 = (char *)v185 + 1;
      }
      while (v183 != v185);
      id v183 = [v181 countByEnumeratingWithState:&v195 objects:v340 count:16];
    }
    while (v183);
  }

  [(NSMutableDictionary *)self->_updateBetaEnrollmentStatusReplyTimers removeAllObjects];
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  v186 = [(NSMutableDictionary *)self->_updateBetaEnrollmentStatusRequests allValues];
  id v187 = [v186 countByEnumeratingWithState:&v191 objects:v339 count:16];
  if (v187)
  {
    id v188 = v187;
    uint64_t v189 = *(void *)v192;
    do
    {
      v190 = 0;
      do
      {
        if (*(void *)v192 != v189) {
          objc_enumerationMutation(v186);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v191 + 1) + 8 * (void)v190) + 16))();
        v190 = (char *)v190 + 1;
      }
      while (v188 != v190);
      id v188 = [v186 countByEnumeratingWithState:&v191 objects:v339 count:16];
    }
    while (v188);
  }

  [(NSMutableDictionary *)self->_updateBetaEnrollmentStatusRequests removeAllObjects];
}

- (BOOL)handleDarwinNotification:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSSCompanionServer;
  if ([(NSSServer *)&v13 handleDarwinNotification:v4]) {
    goto LABEL_18;
  }
  if (![v4 isEqualToString:@"AppleKeyboardsEmojiChangedNotification"])
  {
    if ([v4 isEqualToString:@"AppleKeyboardsPreferencesChangedNotification"])
    {
      id v5 = [(NSSCompanionServer *)self npsManager];
      +[NSSet setWithObjects:@"AppleKeyboards", @"AppleKeyboardsExpanded", 0];
      goto LABEL_6;
    }
    if ([v4 isEqualToString:@"AppleKeyboardsSettingsChangedNotification"])
    {
      id v5 = [(NSSCompanionServer *)self npsManager];
      v6 = +[NSSet setWithObjects:@"KeyboardLastUsed", @"KeyboardsCurrentAndNext", @"DictationLanguagesLastUsed", @"DictationLanguagesEnabled", @"KeyboardAutocapitalization", 0];
      CFStringRef v7 = @"com.apple.keyboard.preferences";
      goto LABEL_16;
    }
    if ([v4 isEqualToString:@"CPActiveCountryCodeChanged"])
    {
      id v5 = [(NSSCompanionServer *)self npsManager];
      CFStringRef v9 = @"CPActiveCountryCode";
    }
    else
    {
      if (![v4 isEqualToString:@"CPHomeCountryCodeChanged"])
      {
        if (![v4 isEqualToString:@"CPNetworkCountryCodeChanged"])
        {
          if ([v4 isEqualToString:@"AppleTemperatureUnitPreferencesChangedNotification"])
          {
            id v5 = [(NSSCompanionServer *)self npsManager];
            uint64_t v8 = +[NSSet setWithObject:@"AppleTemperatureUnit"];
            goto LABEL_7;
          }
          if (![v4 isEqualToString:@"AppleMeasurementSystemPreferencesChangedNotification"])
          {
            if (![v4 isEqualToString:@"com.apple.sharing.powerStatusNotification.watch"])
            {
              BOOL v11 = 0;
              goto LABEL_19;
            }
            id v5 = +[NSSGizmoPowerMonitor sharedMonitor];
            [v5 processBatteryUpdate];
            goto LABEL_17;
          }
          id v5 = [(NSSCompanionServer *)self npsManager];
          +[NSSet setWithObjects:@"AppleMeasurementUnits", @"AppleMetricUnits", 0];
          uint64_t v8 = LABEL_6:;
LABEL_7:
          v6 = (void *)v8;
          CFStringRef v7 = @".GlobalPreferences";
          goto LABEL_16;
        }
        id v5 = [(NSSCompanionServer *)self npsManager];
        uint64_t v10 = +[NSSet setWithObjects:@"CPNetworkCountryCode", @"CPLastKnownNetworkCountryCode", 0];
LABEL_15:
        v6 = (void *)v10;
        CFStringRef v7 = @"com.apple.AppSupport";
        goto LABEL_16;
      }
      id v5 = [(NSSCompanionServer *)self npsManager];
      CFStringRef v9 = @"CPHomeCountryCode";
    }
    uint64_t v10 = +[NSSet setWithObject:v9];
    goto LABEL_15;
  }
  id v5 = [(NSSCompanionServer *)self npsManager];
  v6 = +[NSSet setWithObject:@"EMFDefaultsKey"];
  CFStringRef v7 = @"com.apple.EmojiPreferences";
LABEL_16:
  [v5 synchronizeUserDefaultsDomain:v7 keys:v6];

LABEL_17:
LABEL_18:
  BOOL v11 = 1;
LABEL_19:

  return v11;
}

- (void)handleMemoryPressureEvent
{
  v4.receiver = self;
  v4.super_class = (Class)NSSCompanionServer;
  [(NSSServer *)&v4 handleMemoryPressureEvent];
  v3 = [(NSSServer *)self idsQueue];
  dispatch_async(v3, &stru_100034AB8);
}

+ (void)associateProtobufHandlers:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSSCompanionServer;
  id v3 = a3;
  objc_msgSendSuper2(&v4, "associateProtobufHandlers:", v3);
  objc_msgSend(v3, "setProtobufAction:forIncomingResponsesOfType:", "handleUsageRespMsg:", 2, v4.receiver, v4.super_class);
  [v3 setProtobufAction:"handlePurgeUsageBundleRespMsg:" forIncomingResponsesOfType:4];
  [v3 setProtobufAction:"handleAboutInfoRespMsg:" forIncomingResponsesOfType:6];
  [v3 setProtobufAction:"handleDiagnosticLogsInfoRespMsg:" forIncomingResponsesOfType:25];
  [v3 setProtobufAction:"handleCancelLogTransferRespMsg:" forIncomingResponsesOfType:34];
  [v3 setProtobufAction:"handleLogDeleteRespMsg:" forIncomingResponsesOfType:28];
  [v3 setProtobufAction:"handleIncomingFileTransferProgressMsg:" forIncomingRequestsOfType:32];
  [v3 setProtobufAction:"handleAirplaneModeSettingsRespMsg:" forIncomingResponsesOfType:30];
  [v3 setProtobufAction:"handleRefreshAirplaneModeSettingsReqMsg:" forIncomingRequestsOfType:35];
  [v3 setProtobufAction:"handleAccountsInfoRespMsg:" forIncomingResponsesOfType:10];
  [v3 setProtobufAction:"handleProfilesInfoRespMsg:" forIncomingResponsesOfType:12];
  [v3 setProtobufAction:"handleProfileDataRespMsg:" forIncomingResponsesOfType:14];
  [v3 setProtobufAction:"handleInstallProfileRespMsg:" forIncomingResponsesOfType:16];
  [v3 setProtobufAction:"handleRemoveProfileRespMsg:" forIncomingResponsesOfType:18];
  [v3 setProtobufAction:"handleLegalDocumentsRespMsg:" forIncomingResponsesOfType:21];
  [v3 setProtobufAction:"handleLocalesInfoRespMsg:" forIncomingResponsesOfType:23];
  [v3 setProtobufAction:"handleLPMAutoDisabledRespMsg:" forIncomingRequestsOfType:36];
  [v3 setProtobufAction:"handleBetaEnrollmentRespMsg:" forIncomingResponsesOfType:38];
  [v3 setProtobufAction:"handleUpdateEnrollmentStatusRespMsg:" forIncomingResponsesOfType:40];
}

- (NPSDomainAccessor)nssDomainAccessor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B48;
  block[3] = &unk_100034AE0;
  block[4] = self;
  if (qword_10003E760 != -1) {
    dispatch_once(&qword_10003E760, block);
  }
  return self->_nssDomainAccessor;
}

- (NPSManager)npsManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C48;
  block[3] = &unk_100034AE0;
  block[4] = self;
  if (qword_10003E768 != -1) {
    dispatch_once(&qword_10003E768, block);
  }
  return self->_npsManager;
}

- (void)getUsage:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008DD8;
    v8[3] = &unk_100034B08;
    id v9 = v4;
    CFStringRef v7 = objc_retainBlock(v8);
    [(NSSCompanionServer *)self getUsageData:v7];
  }
}

- (void)getUsageData:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    CFStringRef v7 = [(NSSServer *)self idsQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100008FC4;
    v8[3] = &unk_100034B58;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)purgeUsageBundle:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2048;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: (%@); replyBlock: (%p)",
      buf,
      0x16u);
  }
  if (v6)
  {
    uint64_t v10 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000093F4;
    block[3] = &unk_100034B80;
    id v12 = v6;
    objc_super v13 = self;
    id v14 = v7;
    dispatch_async(v10, block);
  }
}

- (void)getDiagnosticLogFileFromGizmo:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134217984;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v7)
  {
    uint64_t v10 = objc_opt_new();
    [v10 setLogFilePath:v6];
    id v11 = NSSLogForType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending request to download file: %@", buf, 0xCu);
    }

    id v12 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009694;
    block[3] = &unk_100034B80;
    void block[4] = self;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    dispatch_async(v12, block);
  }
}

- (void)retrieveDiagnosticLogTransferProgress:(id)a3 withProgress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134217984;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "replyBlock (%p)", buf, 0xCu);
  }
  if (v7)
  {
    uint64_t v10 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000098B4;
    block[3] = &unk_100034B80;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v10, block);
  }
}

- (void)cancelDiagnosticLogTranfer:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134217984;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v7)
  {
    uint64_t v10 = objc_opt_new();
    [v10 setLogFilePath:v6];
    [(NSSCompanionServer *)self setCancelledLogInTransit:v6];
    id v11 = NSSLogForType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending request to download file: %@", buf, 0xCu);
    }

    id v12 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009CC4;
    block[3] = &unk_100034B80;
    void block[4] = self;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    dispatch_async(v12, block);
  }
}

- (void)cancelActiveLogFileTranfers
{
  id v3 = objc_opt_new();
  id v6 = 0;
  id v4 = [(NSSServer *)self sendMessage:v3 identifier:&v6 sendTimeout:0 wantsAcknowledgement:@"cancelLogTranfers" queueOneIdentifier:0 overBluetoothOnly:30.0];
  id v5 = v6;
  [(NSMutableDictionary *)self->_diagnosticLogFileRequests removeAllObjects];
}

- (void)getDiagnosticLogsInfo:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = NSSLogForType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending diagnostic logs request", buf, 2u);
    }

    uint64_t v8 = [(NSSServer *)self idsQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009F94;
    v9[3] = &unk_100034B58;
    v9[4] = self;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
}

- (void)retrieveAirplaneModeSettingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = NSSLogForType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieving airplane mode settings", buf, 2u);
    }

    id v6 = [(NSSServer *)self idsQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A15C;
    v7[3] = &unk_100034B58;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

- (void)setAirplaneModeSettings:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = objc_opt_new();
    id v9 = [v7 objectForKey:kNSSAirplaneModeCellularKey];
    objc_msgSend(v8, "setCellularOn:", objc_msgSend(v9, "BOOLValue"));

    id v10 = [v7 objectForKey:kNSSAirplaneModeWifiKey];
    objc_msgSend(v8, "setWifiOn:", objc_msgSend(v10, "BOOLValue"));

    id v11 = [v7 objectForKey:kNSSAirplaneModeBluetoothKey];

    objc_msgSend(v8, "setBluetoothOn:", objc_msgSend(v11, "BOOLValue"));
    id v12 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A3AC;
    block[3] = &unk_100034B80;
    void block[4] = self;
    id v15 = v8;
    id v16 = v6;
    id v13 = v8;
    dispatch_async(v12, block);
  }
}

- (void)deleteDiagnosticLogFile:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134217984;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v7)
  {
    id v10 = NSSLogForType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending request to delete %@", buf, 0xCu);
    }

    id v11 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A61C;
    block[3] = &unk_100034B80;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    dispatch_async(v11, block);
  }
}

- (void)recordSoftwareUpdateSpaceFailure:(id)a3 osBeingUpdatedTo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSSLogForType();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_retainBlock(v10);
    *(_DWORD *)buf = 134217984;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A88C;
    v13[3] = &unk_100034BA8;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    [(NSSCompanionServer *)self getAboutInfo:v13];
  }
}

- (void)getAboutInfo:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = [(NSSServer *)self idsQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000AD9C;
    v8[3] = &unk_100034B58;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)setDeviceName:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "name: (%@)", buf, 0xCu);
  }

  id v6 = objc_opt_new();
  [v6 setName:v4];
  uint64_t v8 = 0;
  id v7 = [(NSSServer *)self sendMessage:v6 identifier:&v8 sendTimeout:0 wantsAcknowledgement:@"setName" queueOneIdentifier:0 overBluetoothOnly:30.0];
}

- (void)obliterateGizmoPreservingeSIM:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = NSSLogForType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_retainBlock(v6);
    *(_DWORD *)buf = 134218240;
    id v15 = v8;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p); preserveeSIM: (%d)",
      buf,
      0x12u);
  }
  id v9 = [(NSSServer *)self idsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B0C8;
  block[3] = &unk_100034BD0;
  BOOL v13 = v4;
  void block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);
}

- (void)getAccountsInfoForAccountType:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2048;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "accountType: (%@); replyBlock: (%p)",
      buf,
      0x16u);
  }
  if (v7)
  {
    id v10 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B344;
    block[3] = &unk_100034B80;
    id v12 = v6;
    BOOL v13 = self;
    id v14 = v7;
    dispatch_async(v10, block);
  }
}

- (void)getProfilesInfo:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = [(NSSServer *)self idsQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000B550;
    v8[3] = &unk_100034B58;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)getFullProfileInfoWithIdentifier:(id)a3 includeManagedPayloads:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = NSSLogForType();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_retainBlock(v9);
    *(_DWORD *)buf = 138412802;
    id v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    __int16 v22 = 2048;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "identifier: (%@); includeManagedPayloads: %{BOOL}d replyBlock: (%p)",
      buf,
      0x1Cu);
  }
  if (v8 && v9)
  {
    id v12 = [(NSSServer *)self idsQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000B7A4;
    v13[3] = &unk_100034BF8;
    BOOL v17 = v6;
    id v14 = v8;
    id v15 = self;
    id v16 = v9;
    dispatch_async(v12, v13);
  }
}

- (void)installProfile:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 length];
    id v10 = objc_retainBlock(v7);
    *(_DWORD *)buf = 134218240;
    id v17 = v9;
    __int16 v18 = 2048;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "profileData: (%lu bytes); replyBlock: (%p)",
      buf,
      0x16u);
  }
  if (v6 && v7)
  {
    id v11 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B9FC;
    block[3] = &unk_100034B80;
    id v13 = v6;
    id v14 = self;
    id v15 = v7;
    dispatch_async(v11, block);
  }
}

- (void)removeProfileWithIdentifier:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2048;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "identifier: (%@); replyBlock: (%p)", buf, 0x16u);
  }
  if (v6 && v7)
  {
    id v10 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BC38;
    block[3] = &unk_100034B80;
    id v12 = v6;
    id v13 = self;
    id v14 = v7;
    dispatch_async(v10, block);
  }
}

- (void)rebootDevice
{
  id v3 = NSSLogForType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_100028283, v7, 2u);
  }

  id v4 = objc_opt_new();
  v8[0] = IDSSendMessageOptionQueueOneIdentifierKey;
  v8[1] = IDSSendMessageOptionFireAndForgetKey;
  v9[0] = @"reboot";
  v9[1] = &__kCFBooleanTrue;
  v8[2] = IDSSendMessageOptionBypassDuetKey;
  v9[2] = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v6 = [(NSSServer *)self sendProtobuf:v4 options:v5 identifier:0];
}

- (BOOL)shouldFetchBuiltinAppsNotice
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  NRWatchOSVersionForRemoteDevice();
  id v6 = [v5 valueForProperty:NRDevicePropertyGreenTeaDevice];
  if ([v6 BOOLValue]) {
    char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
  }
  else {
    char IsGreaterThanOrEqual = 0;
  }

  return IsGreaterThanOrEqual;
}

- (void)getLegalDocuments:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = [(NSSServer *)self idsQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C040;
    void v8[3] = &unk_100034C20;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)getLocalesInfo:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 134217984;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "replyBlock: (%p)", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = [(NSSServer *)self idsQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C36C;
    void v8[3] = &unk_100034C20;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)getWatchFaces:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[NSSCompanionServer getWatchFaces:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(NSSServer *)self idsQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C5A4;
  void v8[3] = &unk_100034B58;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)setWatchFaceIdentifier:(id)a3 forFocusModeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = NSSLogForType();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v21 = "-[NSSCompanionServer setWatchFaceIdentifier:forFocusModeIdentifier:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v12 = [(NSSServer *)self idsQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C8E8;
  v16[3] = &unk_100034C70;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

- (BOOL)messageIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v103.receiver = self;
  v103.super_class = (Class)NSSCompanionServer;
  if (![(NSSServer *)&v103 messageIdentifier:v8 didSendWithSuccess:v6 error:v9])
  {
    if (v6)
    {
      uint64_t v11 = +[NSError errorWithDomain:@"NSSErrorDomain" code:0 userInfo:0];

      id v9 = (id)v11;
    }
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_10000D78C;
    v101[3] = &unk_100034C98;
    id v12 = v9;
    id v102 = v12;
    id v13 = objc_retainBlock(v101);
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_10000D7A4;
    v99[3] = &unk_100034CC0;
    id v14 = v12;
    id v100 = v14;
    v56 = objc_retainBlock(v99);
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472;
    v97[2] = sub_10000D7BC;
    v97[3] = &unk_100034CE8;
    id v15 = v14;
    id v98 = v15;
    v66 = objc_retainBlock(v97);
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10000D7D4;
    v95[3] = &unk_100034D10;
    id v16 = v15;
    id v96 = v16;
    v65 = objc_retainBlock(v95);
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_10000D7F0;
    v93[3] = &unk_100034CC0;
    id v17 = v16;
    id v94 = v17;
    uint64_t v64 = objc_retainBlock(v93);
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_10000D808;
    v91[3] = &unk_100034C98;
    id v18 = v17;
    id v92 = v18;
    id v62 = objc_retainBlock(v91);
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10000D820;
    v89[3] = &unk_100034CC0;
    id v19 = v18;
    id v90 = v19;
    id v63 = objc_retainBlock(v89);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10000D838;
    v87[3] = &unk_100034C98;
    id v20 = v19;
    id v88 = v20;
    v61 = objc_retainBlock(v87);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10000D850;
    v85[3] = &unk_100034CC0;
    id v21 = v20;
    id v86 = v21;
    v60 = objc_retainBlock(v85);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10000D868;
    v83[3] = &unk_100034C98;
    id v22 = v21;
    id v84 = v22;
    uint64_t v59 = objc_retainBlock(v83);
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10000D880;
    v81[3] = &unk_100034C98;
    id v23 = v22;
    id v82 = v23;
    id v58 = objc_retainBlock(v81);
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_10000D898;
    v79[3] = &unk_100034C98;
    id v24 = v23;
    id v80 = v24;
    id v57 = objc_retainBlock(v79);
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_10000D8B0;
    v77[3] = &unk_100034CC0;
    id v25 = v24;
    id v78 = v25;
    v55 = objc_retainBlock(v77);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_10000D8C8;
    v75[3] = &unk_100034CC0;
    id v26 = v25;
    id v76 = v26;
    id v27 = objc_retainBlock(v75);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_10000D8E0;
    v73[3] = &unk_100034C98;
    id v28 = v26;
    id v74 = v28;
    uint64_t v29 = objc_retainBlock(v73);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_10000D8F8;
    v71[3] = &unk_100034C98;
    id v30 = v28;
    id v72 = v30;
    v31 = objc_retainBlock(v71);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10000D910;
    v69[3] = &unk_100034D38;
    id v32 = v30;
    id v70 = v32;
    id v33 = objc_retainBlock(v69);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10000D928;
    v67[3] = &unk_100034D60;
    id v9 = v32;
    id v68 = v9;
    uint64_t v34 = objc_retainBlock(v67);
    v35 = v34;
    if (v6)
    {
      if ([(NSSServer *)self scheduleTimerForIdentifier:v8 requests:self->_usageRequests timeout:v13 timeoutHandler:self->_usageReplyTimers timers:@"usage" utilityName:130.0])
      {
        goto LABEL_26;
      }
      v36 = v56;
      if (!-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_purgeUsageBundleRequests, v56, self->_purgeUsageBundleReplyTimers, @"purgeBundle", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_diagnosticLogFileRequests, v66, self->_diagnosticLogFileReplyTimers, @"diagnosticLogFile", 1800.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self,
              "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:",
              v8,
              self->_diagnosticLogsInfoRequests,
              v65,
              self->_diagnosticLogsInfoReplyTimers,
              @"diagnosticLogs",
              30.0)
        && !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_cancelLogTransferRequests, v64, self->_cancelLogTransferReplyTimers, @"cancelLogTransfer", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_airplaneModeSettingsRequests, v62, self->_airplaneModeSettingsReplyTimers, @"airplaneModeSettings", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self,
              "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:",
              v8,
              self->_logDeleteRequests,
              v63,
              self->_logDeleteReplyTimers,
              @"logDelete",
              30.0)
        && !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_aboutInfoRequests, v61, self->_aboutInfoReplyTimers, @"about", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_obliterationRequests, v60, self->_obliterationDeliveryTimers, @"obliteration", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self,
              "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:",
              v8,
              self->_accountsInfoRequests,
              v59,
              self->_accountsInfoReplyTimers,
              @"accounts",
              30.0)
        && ![(NSSServer *)self scheduleTimerForIdentifier:v8 requests:self->_profilesInfoRequests timeout:v58 timeoutHandler:self->_profilesInfoReplyTimers timers:@"profilesInfo" utilityName:30.0]&& ![(NSSServer *)self scheduleTimerForIdentifier:v8 requests:self->_profileDataRequests timeout:v57 timeoutHandler:self->_profileDataReplyTimers timers:@"profileData" utilityName:30.0])
      {
        if (!-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_installProfileRequests, v55, self->_installProfileReplyTimers, @"installProfile", 60.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_removeProfileRequests, v27, self->_removeProfileReplyTimers, @"removeProfile", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self,
                "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:",
                v8,
                self->_legalDocumentsRequests,
                v29,
                self->_legalDocumentsReplyTimers,
                @"legal",
                30.0)
          && !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_localesInfoRequests, v31, self->_localesInfoReplyTimers, @"locales", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self, "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:", v8, self->_betaEnrollmentStatusRequests, v33, self->_betaEnrollmentStatusReplyTimers, @"betaEnrollmentStatus", 30.0)&& !-[NSSServer scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:](self,
                "scheduleTimerForIdentifier:requests:timeout:timeoutHandler:timers:utilityName:",
                v8,
                self->_updateBetaEnrollmentStatusRequests,
                v35,
                self->_updateBetaEnrollmentStatusReplyTimers,
                @"updateBetaEnrollmentStatus",
                30.0))
        {
LABEL_48:
          BOOL v10 = 0;
          goto LABEL_27;
        }
LABEL_26:
        BOOL v10 = 1;
LABEL_27:
        v36 = v56;
LABEL_40:

        goto LABEL_41;
      }
    }
    else
    {
      BOOL v37 = sub_10000D940((uint64_t)v34, v8, self->_usageRequests, v13, @"usage");
      if (v37) {
        goto LABEL_26;
      }
      v36 = v56;
      BOOL v38 = sub_10000D940(v37, v8, self->_purgeUsageBundleRequests, v56, @"purgeBundle");
      if (!v38)
      {
        BOOL v39 = sub_10000D940(v38, v8, self->_diagnosticLogFileRequests, v66, @"diagnosticLogFile");
        if (!v39)
        {
          BOOL v40 = sub_10000D940(v39, v8, self->_diagnosticLogsInfoRequests, v65, @"diagnosticLogs");
          if (!v40)
          {
            BOOL v41 = sub_10000D940(v40, v8, self->_cancelLogTransferRequests, v64, @"cancelLogTransfer");
            if (!v41)
            {
              BOOL v42 = sub_10000D940(v41, v8, self->_logDeleteRequests, v63, @"logDelete");
              if (!v42)
              {
                BOOL v43 = sub_10000D940(v42, v8, self->_aboutInfoRequests, v61, @"about");
                if (!v43)
                {
                  BOOL v44 = sub_10000D940(v43, v8, self->_obliterationRequests, v60, @"obliteration");
                  if (!v44)
                  {
                    BOOL v45 = sub_10000D940(v44, v8, self->_airplaneModeSettingsRequests, v62, @"airplaneModeSettings");
                    if (!v45)
                    {
                      BOOL v46 = sub_10000D940(v45, v8, self->_accountsInfoRequests, v59, @"accounts");
                      if (!v46)
                      {
                        BOOL v47 = sub_10000D940(v46, v8, self->_profilesInfoRequests, v58, @"profilesInfo");
                        if (!v47)
                        {
                          BOOL v48 = sub_10000D940(v47, v8, self->_profileDataRequests, v57, @"profileData");
                          if (!v48)
                          {
                            BOOL v50 = sub_10000D940(v48, v8, self->_installProfileRequests, v55, @"installProfile");
                            if (!v50)
                            {
                              BOOL v51 = sub_10000D940(v50, v8, self->_removeProfileRequests, v27, @"removeProfile");
                              if (!v51)
                              {
                                BOOL v52 = sub_10000D940(v51, v8, self->_legalDocumentsRequests, v29, @"legal");
                                if (!v52)
                                {
                                  BOOL v53 = sub_10000D940(v52, v8, self->_localesInfoRequests, v31, @"locales");
                                  if (!v53)
                                  {
                                    BOOL v54 = sub_10000D940(v53, v8, self->_betaEnrollmentStatusRequests, v33, @"betaEnrollmentStatus");
                                    if (!v54
                                      && !sub_10000D940(v54, v8, self->_updateBetaEnrollmentStatusRequests, v35, @"updateBetaEnrollmentStatus"))
                                    {
                                      goto LABEL_48;
                                    }
                                  }
                                }
                              }
                            }
                            goto LABEL_26;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v10 = 1;
    goto LABEL_40;
  }
  BOOL v10 = 1;
LABEL_41:

  return v10;
}

- (BOOL)messageIdentifier:(id)a3 hasBeenDeliveredWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NSSCompanionServer;
  if ([(NSSServer *)&v26 messageIdentifier:v6 hasBeenDeliveredWithContext:v7])
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(NSMutableDictionary *)self->_obliterationRequests objectForKey:v6];
    BOOL v8 = v9 != 0;
    if (v9)
    {
      BOOL v10 = NSSLogForType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_retainBlock(v9);
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p) for identifier: (%@)", buf, 0x16u);
      }
      [(NSMutableDictionary *)self->_obliterationRequests removeObjectForKey:v6];
      [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_obliterationDeliveryTimers utilityName:@"obliteration"];
      id v12 = +[NRPairedDeviceRegistry sharedInstance];
      id v13 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
      id v14 = [v12 getAllDevicesWithArchivedAltAccountDevicesMatching:v13];
      id v15 = [v14 firstObject];

      uint64_t v31 = NRUnpairOptionObliterate;
      id v32 = &__kCFBooleanTrue;
      id v16 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v17 = [v16 mutableCopy];

      id v18 = objc_retainBlock(v9);
      id v19 = objc_getAssociatedObject(v18, "kNSSObliterationRequestPreserveeSIMAssociatedObjectKey");

      if ([v19 BOOLValue]) {
        [v17 setObject:v19 forKeyedSubscript:@"BDE85C67-0FDD-4A95-A9B9-3CB5DD0C06A2"];
      }
      id v20 = NSSLogForType();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        id v28 = (uint64_t (*)(uint64_t, uint64_t))v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Unpairing from (%@) using (%@) options: (%@)", buf, 0x20u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      id v28 = sub_10000DE98;
      uint64_t v29 = sub_10000DEA8;
      id v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[NSSCompanionServer messageIdentifier:hasBeenDeliveredWithContext:]");
      NSSOSTransactionCreate();
      id v30 = (id)objc_claimAutoreleasedReturnValue();

      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000DEB0;
      v23[3] = &unk_100034D88;
      id v24 = v9;
      id v25 = buf;
      [v12 unpairWithDevice:v15 withOptions:v17 operationHasBegun:v23];

      _Block_object_dispose(buf, 8);
    }
  }
  return v8;
}

- (void)handleUsageRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  BOOL v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218498;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    objc_super v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v21,
      0x20u);
  }

  BOOL v10 = objc_opt_new();
  id v11 = objc_alloc((Class)PBDataReader);
  id v12 = [v4 data];
  id v13 = [v11 initWithData:v12];

  id v14 = [(NSMutableDictionary *)self->_usageRequests objectForKey:v6];
  id v15 = NSSLogForType();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      id v17 = objc_retainBlock(v14);
      int v21 = 134217984;
      id v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", (uint8_t *)&v21, 0xCu);
    }
    [(NSMutableDictionary *)self->_usageRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_usageReplyTimers utilityName:@"usage"];
    int v18 = NSSUsageRespMsgReadFrom();
    id v19 = NSSLogForType();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        int v21 = 138412290;
        id v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending usageRespMsg to client: %@", (uint8_t *)&v21, 0xCu);
      }

      ((void (**)(void, void *, void))v14)[2](v14, v10, 0);
    }
    else
    {
      if (v20)
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", (uint8_t *)&v21, 2u);
      }
    }
  }
  else
  {
    if (v16)
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Could not find reply block", (uint8_t *)&v21, 2u);
    }
  }
}

- (void)handlePurgeUsageBundleRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  BOOL v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v28 = v4;
    __int16 v29 = 2112;
    id v30 = v6;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  BOOL v10 = [(NSMutableDictionary *)self->_purgeUsageBundleRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_purgeUsageBundleRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_purgeUsageBundleReplyTimers utilityName:@"purgeBundle"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    int v17 = NSSUsagePurgeBundleRespMsgReadFrom();
    int v18 = NSSLogForType();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
      }
      goto LABEL_21;
    }
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: %@", buf, 0xCu);
    }

    if ([v11 hasError])
    {
      BOOL v20 = +[NSSet setWithObject:objc_opt_class()];
      int v21 = [v11 error];
      id v22 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v20 withData:v21];

      if (v22)
      {
        NSErrorUserInfoKey v25 = NSUnderlyingErrorKey;
        objc_super v26 = v22;
        __int16 v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        int v18 = +[NSError errorWithDomain:@"NSSErrorDomain" code:2 userInfo:v23];

        id v24 = NSSLogForType();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Returning an error: (%@)", buf, 0xCu);
        }

        goto LABEL_20;
      }
    }
    else
    {
      id v22 = 0;
    }
    int v18 = 0;
LABEL_20:
    ((void (**)(void, NSObject *))v10)[2](v10, v18);

LABEL_21:
    goto LABEL_22;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
LABEL_22:
}

- (void)handleIncomingDiagnosticLogFile:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Incoming log file at location: %@ with identifier: %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(NSMutableDictionary *)self->_diagnosticLogFileRequests objectForKey:v7];
  if (v9)
  {
    BOOL v10 = NSSLogForType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = objc_retainBlock(v9);
      int v12 = 134217984;
      id v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", (uint8_t *)&v12, 0xCu);
    }
    [(NSMutableDictionary *)self->_diagnosticLogFileRequests removeObjectForKey:v7];
    [(NSSServer *)self cancelTimerForIdentifier:v7 timers:self->_diagnosticLogFileReplyTimers utilityName:@"diagnosticLogFile"];
    ((void (**)(void, id, void))v9)[2](v9, v6, 0);
  }
}

- (void)handleDiagnosticLogsInfoRespMsg:(id)a3
{
  id v3 = a3;
  id v4 = [v3 context];
  id v5 = [v4 incomingResponseIdentifier];

  id v6 = [v3 context];
  id v7 = [v6 outgoingResponseIdentifier];

  BOOL v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    BOOL v54 = v3;
    __int16 v55 = 2112;
    v56 = v5;
    __int16 v57 = 2112;
    id v58 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  id v9 = [(NSMutableDictionary *)self->_diagnosticLogsInfoRequests objectForKey:v5];
  BOOL v10 = NSSLogForType();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      id v12 = objc_retainBlock(v9);
      *(_DWORD *)buf = 134217984;
      BOOL v54 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_diagnosticLogsInfoRequests removeObjectForKey:v5];
    [(NSSServer *)self cancelTimerForIdentifier:v5 timers:self->_diagnosticLogsInfoReplyTimers utilityName:@"diagnosticLogs"];
    BOOL v10 = objc_opt_new();
    id v13 = objc_alloc((Class)PBDataReader);
    __int16 v14 = [v3 data];
    id v15 = [v13 initWithData:v14];

    LODWORD(v13) = NSSDiagnosticLogsInfoRespMsgReadFrom();
    id v16 = NSSLogForType();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        BOOL v54 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: %@", buf, 0xCu);
      }

      id v16 = objc_opt_new();
      int v18 = [v10 paths];

      id v43 = v15;
      if (v18)
      {
        uint64_t v19 = [v10 paths];

        id v16 = v19;
      }
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      int v21 = [v10 filesByCategorys];

      if (v21)
      {
        BOOL v37 = v16;
        BOOL v38 = v10;
        BOOL v39 = v9;
        BOOL v40 = v7;
        BOOL v41 = v5;
        BOOL v42 = v3;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id obj = [v10 filesByCategorys];
        id v22 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v49;
          uint64_t v44 = NSSFilesCategoryTypeScreenCaptures;
          uint64_t v45 = NSSFilesCategoryTypeSysdiagnose;
          uint64_t v25 = NSSFilesCategoryTypeScreenshots;
          uint64_t v26 = NSSFilesCategoryTypeDiagnostics;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v49 != v24) {
                objc_enumerationMutation(obj);
              }
              id v28 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              __int16 v29 = [v28 directoryPath];
              id v30 = [v28 filePaths];
              __int16 v31 = [(NSSCompanionServer *)self _fullFileNamesFrom:v29 files:v30];

              unsigned int v32 = [v28 filesType];
              uint64_t v33 = v26;
              if (v32 == 1
                || (v34 = [v28 filesType], uint64_t v33 = v25, v34 == 3)
                || (v35 = [v28 filesType], uint64_t v33 = v45, v35 == 2)
                || (v36 = [v28 filesType], uint64_t v33 = v44, v36 == 4))
              {
                [v20 setObject:v31 forKeyedSubscript:v33];
              }
            }
            id v23 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
          }
          while (v23);
        }

        id v5 = v41;
        id v3 = v42;
        id v9 = v39;
        id v7 = v40;
        id v16 = v37;
        BOOL v10 = v38;
      }
      ((void (**)(void, NSObject *, id, void))v9)[2](v9, v16, v20, 0);

      id v15 = v43;
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf", buf, 2u);
    }
  }
  else if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
}

- (id)_fullFileNamesFrom:(id)a3 files:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(v5, "stringByAppendingPathComponent:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)handleCancelLogTransferRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 134218498;
    uint64_t v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = v6;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v23,
      0x20u);
  }

  id v10 = [(NSMutableDictionary *)self->_cancelLogTransferRequests objectForKey:v6];
  [(NSMutableDictionary *)self->_cancelLogTransferRequests removeObjectForKey:v6];
  [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_cancelLogTransferReplyTimers utilityName:@"cancelLogTransfer"];
  uint64_t v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      int v23 = 134217984;
      uint64_t v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock: (%p)", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    long long v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    if (NSSCancelLogTransferRespMsgReadFrom())
    {
      long long v17 = +[NSSet setWithObject:objc_opt_class()];
      long long v18 = [v11 error];
      uint64_t v19 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v17 withData:v18];

      id v20 = NSSLogForType();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138412290;
        uint64_t v24 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Error returned from deletion attempt: %@", (uint8_t *)&v23, 0xCu);
      }

      if (!v19)
      {
        int v21 = [(NSSCompanionServer *)self fileTransferProgress];
        id v22 = [(NSSCompanionServer *)self cancelledLogInTransit];
        [v21 removeObjectForKey:v22];
      }
      ((void (**)(void, NSObject *))v10)[2](v10, v19);
    }
    else
    {
      uint64_t v19 = NSSLogForType();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", (uint8_t *)&v23, 2u);
      }
    }
  }
  else if (v12)
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", (uint8_t *)&v23, 2u);
  }

  [(NSSCompanionServer *)self setCancelledLogInTransit:0];
}

- (void)handleLogDeleteRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134218498;
    id v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v21,
      0x20u);
  }

  id v10 = [(NSMutableDictionary *)self->_logDeleteRequests objectForKey:v6];
  uint64_t v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      int v21 = 134217984;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock: (%p)", (uint8_t *)&v21, 0xCu);
    }
    [(NSMutableDictionary *)self->_logDeleteRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_logDeleteReplyTimers utilityName:@"logDelete"];
    uint64_t v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    long long v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    if (NSSLogDeleteRespMsgReadFrom())
    {
      long long v17 = +[NSSet setWithObject:objc_opt_class()];
      long long v18 = [v11 error];
      uint64_t v19 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v17 withData:v18];

      id v20 = NSSLogForType();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        id v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Error returned from deletion attempt: %@", (uint8_t *)&v21, 0xCu);
      }

      ((void (**)(void, NSObject *))v10)[2](v10, v19);
    }
    else
    {
      uint64_t v19 = NSSLogForType();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", (uint8_t *)&v21, 2u);
      }
    }
  }
  else if (v12)
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", (uint8_t *)&v21, 2u);
  }
}

- (void)handleIncomingFileTransferProgressMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  id v10 = objc_opt_new();
  id v11 = objc_alloc((Class)PBDataReader);
  BOOL v12 = [v4 data];
  id v13 = [v11 initWithData:v12];

  if (NSSLogTransferProgressMsgReadFrom())
  {
    id v14 = [v10 path];
    id v15 = [v10 progress];
    id v16 = NSSLogForType();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v14;
      __int16 v25 = 2048;
      id v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "received file transfer progress message for filename: %@ and progress: %lu", buf, 0x16u);
    }

    long long v17 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F920;
    block[3] = &unk_100034DB0;
    int v21 = self;
    id v22 = v15;
    id v20 = v14;
    long long v18 = v14;
    dispatch_async(v17, block);
  }
  else
  {
    long long v18 = NSSLogForType();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
    }
  }
}

- (void)handleAirplaneModeSettingsRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v24 = v4;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  id v10 = [(NSMutableDictionary *)self->_airplaneModeSettingsRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_airplaneModeSettingsRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_airplaneModeSettingsReplyTimers utilityName:@"airplaneModeSettings"];
    BOOL v12 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    if (NSSAirplaneModeSettingsMsgReadFrom())
    {
      long long v17 = +[NSNumber numberWithBool:[v12 cellularOn]];
      v22[0] = v17;
      v21[1] = kNSSAirplaneModeBluetoothKey;
      long long v18 = +[NSNumber numberWithBool:[v12 bluetoothOn]];
      v22[1] = v18;
      v21[2] = kNSSAirplaneModeWifiKey;
      uint64_t v19 = +[NSNumber numberWithBool:[v12 wifiOn]];
      v22[2] = v19;
      id v20 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

      ((void (**)(void, void *, void))v10)[2](v10, v20, 0);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_10002232C(v12);
  }
}

- (void)handleRefreshAirplaneModeSettingsReqMsg:(id)a3
{
  id v3 = a3;
  id v4 = [v3 context];
  id v5 = [v4 incomingResponseIdentifier];

  id v6 = [v3 context];
  id v7 = [v6 outgoingResponseIdentifier];

  id v8 = NSSLogForType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218498;
    id v11 = v3;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v10,
      0x20u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, NSSAirplaneModeSettingsChangedNotification, 0, 0, 0);
}

- (void)handleAboutInfoRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 134218498;
    __int16 v29 = v4;
    __int16 v30 = 2112;
    __int16 v31 = v6;
    __int16 v32 = 2112;
    uint64_t v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v28,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_aboutInfoRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      int v28 = 134217984;
      __int16 v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", (uint8_t *)&v28, 0xCu);
    }
    [(NSMutableDictionary *)self->_aboutInfoRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_aboutInfoReplyTimers utilityName:@"about"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    int v17 = NSSAboutInfoRespMsgReadFrom();
    long long v18 = NSSLogForType();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        int v28 = 138412290;
        __int16 v29 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: %@", (uint8_t *)&v28, 0xCu);
      }

      long long v18 = objc_opt_new();
      if ([v11 hasAvailableStorageInBytes])
      {
        id v20 = +[NSNumber numberWithUnsignedLongLong:[v11 availableStorageInBytes]];
        [v18 setObject:v20 forKey:kNSSAboutAvailableStorageKey];
      }
      if ([v11 hasNumberOfApps])
      {
        int v21 = +[NSNumber numberWithUnsignedLongLong:[v11 numberOfApps]];
        [v18 setObject:v21 forKey:kNSSAboutAppsKey];
      }
      if ([v11 hasNumberOfSongs])
      {
        id v22 = +[NSNumber numberWithUnsignedLongLong:[v11 numberOfSongs]];
        [v18 setObject:v22 forKey:kNSSAboutSongsKey];
      }
      if ([v11 hasNumberOfPhotos])
      {
        __int16 v23 = +[NSNumber numberWithUnsignedLongLong:[v11 numberOfPhotos]];
        [v18 setObject:v23 forKey:kNSSAboutPhotosKey];
      }
      if ([v11 hasBatteryCurrentCapacity])
      {
        id v24 = +[NSNumber numberWithUnsignedLongLong:[v11 batteryCurrentCapacity]];
        [v18 setObject:v24 forKey:kNSSAboutBatteryCurrentCapacityKey];
      }
      if ([v11 hasBatteryIsCharging])
      {
        __int16 v25 = +[NSNumber numberWithBool:[v11 batteryIsCharging]];
        [v18 setObject:v25 forKey:kNSSAboutBatteryIsChargingKey];
      }
      if ([v11 hasPurgeableSpace])
      {
        id v26 = +[NSNumber numberWithUnsignedLongLong:[v11 purgeableSpace]];
        [v18 setObject:v26 forKey:kNSSAboutPurgableStorageKey];
      }
      if ([v11 userDeletableSpace])
      {
        __int16 v27 = +[NSNumber numberWithUnsignedLongLong:[v11 userDeletableSpace]];
        [v18 setObject:v27 forKey:kNSSAboutUserDeletableStorageKey];
      }
      ((void (**)(void, NSObject *, void))v10)[2](v10, v18, 0);
    }
    else if (v19)
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", (uint8_t *)&v28, 2u);
    }
  }
  else if (v12)
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", (uint8_t *)&v28, 2u);
  }
}

- (void)handleAccountsInfoRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v59 = v4;
    __int16 v60 = 2112;
    v61 = v6;
    __int16 v62 = 2112;
    id v63 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_accountsInfoRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v59 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_accountsInfoRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_accountsInfoReplyTimers utilityName:@"accounts"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    if (NSSAccountsInfoRespMsgReadFrom())
    {
      id v40 = v16;
      BOOL v42 = v10;
      id v43 = v8;
      uint64_t v44 = v6;
      id v45 = v4;
      BOOL v39 = objc_opt_new();
      int v17 = objc_opt_new();
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      BOOL v41 = v11;
      id obj = [v11 accounts];
      id v18 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v54;
        uint64_t v51 = kNSSAccountIdentifierKey;
        uint64_t v49 = kNSSAccountDSIDKey;
        uint64_t v50 = kNSSAccountTypeKey;
        uint64_t v47 = kNSSAccountUsernameKey;
        uint64_t v48 = kNSSAccountAltDSIDKey;
        uint64_t v46 = kNSSAccountIsAuthenticatedKey;
        uint64_t v21 = kNSSAccountIsPrimaryiCloudAccountKey;
        uint64_t v22 = kNSSAccountIsManagedKey;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v54 != v20) {
              objc_enumerationMutation(obj);
            }
            id v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            __int16 v25 = NSSLogForType();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v59 = v24;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found account: %@", buf, 0xCu);
            }

            id v26 = objc_opt_new();
            if ([v24 hasIdentifier])
            {
              __int16 v27 = [v24 identifier];
              [v26 setObject:v27 forKeyedSubscript:v51];
            }
            if ([v24 hasType])
            {
              int v28 = [v24 type];
              [v26 setObject:v28 forKeyedSubscript:v50];
            }
            if ([v24 hasDSID])
            {
              __int16 v29 = [v24 dSID];
              [v26 setObject:v29 forKeyedSubscript:v49];
            }
            if ([v24 hasAltDSID])
            {
              __int16 v30 = [v24 altDSID];
              [v26 setObject:v30 forKeyedSubscript:v48];
            }
            if ([v24 hasUsername])
            {
              __int16 v31 = [v24 username];
              [v26 setObject:v31 forKeyedSubscript:v47];
            }
            if ([v24 hasAuthenticated])
            {
              __int16 v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v24 authenticated]);
              [v26 setObject:v32 forKeyedSubscript:v46];
            }
            if ([v24 hasAaPrimaryAccount])
            {
              uint64_t v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v24 aaPrimaryAccount]);
              [v26 setObject:v33 forKeyedSubscript:v21];
            }
            if ([v24 hasAaIsManaged])
            {
              unsigned int v34 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v24 aaIsManaged]);
              [v26 setObject:v34 forKeyedSubscript:v22];
            }
            [v17 addObject:v26];
          }
          id v19 = [obj countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v19);
      }

      if ([v17 count])
      {
        unsigned int v35 = v39;
        [v39 setObject:v17 forKeyedSubscript:kNSSAccountsKey];
        int v10 = v42;
        id v8 = v43;
        id v11 = v41;
      }
      else
      {
        unsigned int v36 = NSSLogForType();
        int v10 = v42;
        id v8 = v43;
        id v11 = v41;
        unsigned int v35 = v39;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "No account on device", buf, 2u);
        }
      }
      id v6 = v44;
      id v4 = v45;
      if ([v11 hasWatchAKDevice])
      {
        BOOL v37 = [v11 watchAKDevice];
        BOOL v38 = +[AKDevice deviceWithSerializedData:v37];
        [v35 setObject:v38 forKeyedSubscript:kNSSAKDeviceKey];
      }
      ((void (**)(void, NSObject *, void))v10)[2](v10, v35, 0);

      id v16 = v40;
    }
    else
    {
      unsigned int v35 = NSSLogForType();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
      }
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
}

- (void)handleProfilesInfoRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v53 = v4;
    __int16 v54 = 2112;
    long long v55 = v6;
    __int16 v56 = 2112;
    __int16 v57 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_profilesInfoRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v53 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_profilesInfoRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_profilesInfoReplyTimers utilityName:@"profilesInfo"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    if (NSSProfilesInfoRespMsgReadFrom())
    {
      uint64_t v46 = objc_opt_new();
      if ([v11 hasMdmProfile])
      {
        int v17 = [v11 mdmProfile];
        id v18 = [v17 toMCProfileInfo];

        id v19 = [v11 mdmProfile];
        uint64_t v20 = [v19 toMCProfileInfo];
        [v46 setObject:v20 forKey:kNSSProfilesMDMProfileInfoKey];

        uint64_t v21 = NSSLogForType();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "- MDM profile: %@", buf, 0xCu);
        }
      }
      id v40 = v16;
      BOOL v42 = v10;
      id v43 = v8;
      uint64_t v44 = v6;
      id v45 = v4;
      id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSObject configProfilesCount](v11, "configProfilesCount"));
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      BOOL v41 = v11;
      __int16 v23 = [v11 configProfiles];
      id v24 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v48;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(void *)v48 != v26) {
              objc_enumerationMutation(v23);
            }
            int v28 = [*(id *)(*((void *)&v47 + 1) + 8 * i) toMCProfileInfo];
            [v22 addObject:v28];
            __int16 v29 = NSSLogForType();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v53 = v28;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "- Config profile: %@", buf, 0xCu);
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v25);
      }

      __int16 v30 = v46;
      if ([v22 count]) {
        [v46 setObject:v22 forKey:kNSSProfilesConfigurationProfilesInfoKey];
      }
      id v11 = v41;
      int v10 = v42;
      if ([v41 hasRmAccountData])
      {
        __int16 v31 = +[NSSet setWithObject:objc_opt_class()];
        __int16 v32 = [v41 rmAccountData];
        uint64_t v33 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v31 withData:v32];

        __int16 v30 = v46;
        if (v33) {
          [v46 setObject:v33 forKey:kNSSRemoteManagementAccountKey];
        }
      }
      id v4 = v45;
      if ([v41 hasManagedAppsData])
      {
        uint64_t v34 = objc_opt_class();
        uint64_t v35 = objc_opt_class();
        unsigned int v36 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v34, v35, objc_opt_class(), 0);
        BOOL v37 = [v41 managedAppsData];
        BOOL v38 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v36 withData:v37];

        __int16 v30 = v46;
        if (v38) {
          [v46 setObject:v38 forKey:kNSSManagedAppsInfoKey];
        }
      }
      id v16 = v40;
      if (![v30 count])
      {
        BOOL v39 = NSSLogForType();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "No installed profiles", buf, 2u);
        }
      }
      (*((void (**)(void *, NSObject *, void))v42 + 2))(v42, v30, 0);

      id v8 = v43;
      id v6 = v44;
    }
    else
    {
      __int16 v30 = NSSLogForType();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
      }
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
}

- (void)handleProfileDataRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v34 = v4;
    __int16 v35 = 2112;
    id v36 = v6;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_profileDataRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_profileDataRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_profileDataReplyTimers utilityName:@"profileData"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    int v17 = NSSProfileDataRespMsgReadFrom();
    id v18 = NSSLogForType();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        __int16 v31 = [v11 profileData];
        __int16 v32 = v8;
        id v20 = [v31 length];
        uint64_t v21 = [v11 profilePayloadsSummary];
        id v22 = [v21 length];
        __int16 v23 = [v11 rmConfigurationViewModels];
        id v24 = [v23 length];
        *(_DWORD *)buf = 134218496;
        id v34 = v20;
        id v8 = v32;
        __int16 v35 = 2048;
        id v36 = v22;
        __int16 v37 = 2048;
        id v38 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: {profileData: (%lu bytes)} {profilePayloadsSummary: (%lu bytes)} {rmConfigurationViewModels: (%lu bytes)}", buf, 0x20u);
      }
      id v18 = objc_alloc_init((Class)NSMutableDictionary);
      id v25 = [v11 profileData];

      if (v25)
      {
        uint64_t v26 = [v11 profileData];
        [v18 setObject:v26 forKey:kNSSProfileDataKey];
      }
      __int16 v27 = [v11 profilePayloadsSummary];

      if (v27)
      {
        int v28 = [v11 profilePayloadsSummary];
        [v18 setObject:v28 forKey:kNSSProfilePayloadsSummaryKey];
      }
      __int16 v29 = [v11 rmConfigurationViewModels];

      if (v29)
      {
        __int16 v30 = [v11 rmConfigurationViewModels];
        [v18 setObject:v30 forKey:kNSSRMConfigurationViewModelsKey];
      }
      ((void (**)(void, NSObject *, void))v10)[2](v10, v18, 0);
    }
    else if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
}

- (void)handleInstallProfileRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int v28 = v4;
    __int16 v29 = 2112;
    __int16 v30 = v6;
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_installProfileRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      int v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_installProfileRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_installProfileReplyTimers utilityName:@"installProfile"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    int v17 = NSSInstallProfileRespMsgReadFrom();
    id v18 = NSSLogForType();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
      }
      goto LABEL_21;
    }
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      int v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: %@", buf, 0xCu);
    }

    if ([v11 hasError])
    {
      id v20 = +[NSSet setWithObject:objc_opt_class()];
      uint64_t v21 = [v11 error];
      id v22 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v20 withData:v21];

      if (v22)
      {
        NSErrorUserInfoKey v25 = NSUnderlyingErrorKey;
        uint64_t v26 = v22;
        __int16 v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        id v18 = +[NSError errorWithDomain:@"NSSErrorDomain" code:3 userInfo:v23];

        id v24 = NSSLogForType();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Returning an error: (%@)", buf, 0xCu);
        }

        goto LABEL_20;
      }
    }
    else
    {
      id v22 = 0;
    }
    id v18 = 0;
LABEL_20:
    ((void (**)(void, NSObject *))v10)[2](v10, v18);

LABEL_21:
    goto LABEL_22;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
LABEL_22:
}

- (void)handleRemoveProfileRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    int v28 = v4;
    __int16 v29 = 2112;
    __int16 v30 = v6;
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_removeProfileRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      int v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_removeProfileRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_removeProfileReplyTimers utilityName:@"removeProfile"];
    id v11 = objc_opt_new();
    id v14 = objc_alloc((Class)PBDataReader);
    id v15 = [v4 data];
    id v16 = [v14 initWithData:v15];

    int v17 = NSSRemoveProfileRespMsgReadFrom();
    id v18 = NSSLogForType();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v17)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
      }
      goto LABEL_21;
    }
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      int v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: %@", buf, 0xCu);
    }

    if ([v11 hasError])
    {
      id v20 = +[NSSet setWithObject:objc_opt_class()];
      uint64_t v21 = [v11 error];
      id v22 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v20 withData:v21];

      if (v22)
      {
        NSErrorUserInfoKey v25 = NSUnderlyingErrorKey;
        uint64_t v26 = v22;
        __int16 v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        id v18 = +[NSError errorWithDomain:@"NSSErrorDomain" code:4 userInfo:v23];

        id v24 = NSSLogForType();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Returning an error: (%@)", buf, 0xCu);
        }

        goto LABEL_20;
      }
    }
    else
    {
      id v22 = 0;
    }
    id v18 = 0;
LABEL_20:
    ((void (**)(void, NSObject *))v10)[2](v10, v18);

LABEL_21:
    goto LABEL_22;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
LABEL_22:
}

- (void)handleLegalDocumentsRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v45 = v4;
    __int16 v46 = 2112;
    id v47 = v6;
    __int16 v48 = 2112;
    id v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_legalDocumentsRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v45 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_legalDocumentsRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_legalDocumentsReplyTimers utilityName:@"legal"];
    id v14 = objc_opt_new();
    id v15 = objc_alloc((Class)PBDataReader);
    id v16 = [v4 data];
    id v11 = [v15 initWithData:v16];

    LODWORD(v15) = NSSLegalDocumentsRespMsgReadFrom();
    int v17 = NSSLogForType();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      id v40 = v8;
      BOOL v41 = v6;
      if (v18)
      {
        BOOL v19 = [v14 legalNotices];
        id v34 = [v19 length];
        id v38 = [v14 license];
        id v33 = [v38 length];
        id v36 = [v14 sarStatement];
        id v20 = [v36 length];
        unsigned int v21 = [v14 hasSarUrlAdded];
        unsigned int v22 = [v14 sarUrlAdded];
        __int16 v23 = [v14 buildVersion];
        *(_DWORD *)buf = 134219266;
        id v45 = v34;
        __int16 v46 = 2048;
        id v47 = v33;
        __int16 v48 = 2048;
        id v49 = v20;
        __int16 v50 = 1024;
        unsigned int v51 = v21;
        __int16 v52 = 1024;
        unsigned int v53 = v22;
        __int16 v54 = 2112;
        long long v55 = v23;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully decoded message: {legalNotices: (%lu bytes); license: (%lu bytes); sarStatement: (%lu bytes); has"
          "SarUrlAdded: (%d) sarUrlAdded: (%d) buildVersion: (%@)}",
          buf,
          0x36u);
      }
      uint64_t v39 = [v14 buildVersion];
      id v24 = [v14 license];
      NSErrorUserInfoKey v25 = [v14 legalNotices];
      uint64_t v26 = [v14 sarStatement];
      int v17 = [v14 builtinApps];
      unsigned int v37 = [v14 hasSarUrlAdded];
      unsigned int v35 = [v14 sarUrlAdded];

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100012484;
      v42[3] = &unk_100034DD8;
      id v27 = (id)objc_opt_new();
      id v43 = v27;
      int v28 = objc_retainBlock(v42);
      ((void (*)(void *, void, void *))v28[2])(v28, kNSSLegalDocumentsLegalNoticesKey, v25);

      ((void (*)(void *, void, void *))v28[2])(v28, kNSSLegalDocumentsLicenseKey, v24);
      ((void (*)(void *, void, void *))v28[2])(v28, kNSSLegalDocumentsSarStatementKey, v26);

      __int16 v29 = +[NSNumber numberWithBool:v37 ^ 1 | v35];
      [v27 setObject:v29 forKeyedSubscript:kNSSLegalDocumentsSarUrlAddedKey];

      if ([v17 length])
      {
        ((void (*)(void *, void, NSObject *))v28[2])(v28, kNSSLegalDocumentsBuiltinAppsKey, v17);

        int v17 = 0;
      }
      id v8 = v40;
      ((void (**)(void, id, void))v10)[2](v10, v27, 0);
      id v30 = objc_retainBlock(v10);
      __int16 v31 = objc_getAssociatedObject(v30, "kNSSLegalDocumentsPreferredLanguagesAssociatedObjectKey");

      __int16 v32 = (void *)v39;
      +[NSSLegalDocumentsCache cacheReply:v27 forPreferredLanguages:v31 gizmoBuildVersion:v39];

      id v6 = v41;
    }
    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
      }
      __int16 v32 = v14;
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
}

- (void)handleLocalesInfoRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v81 = v4;
    __int16 v82 = 2112;
    id v83 = v6;
    __int16 v84 = 2112;
    v85 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      buf,
      0x20u);
  }

  int v10 = [(NSMutableDictionary *)self->_localesInfoRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      *(_DWORD *)buf = 134217984;
      id v81 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found matching replyBlock (%p)", buf, 0xCu);
    }
    [(NSMutableDictionary *)self->_localesInfoRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_localesInfoReplyTimers utilityName:@"locales"];
    id v14 = objc_alloc((Class)NSSLocalesInfoRespMsg);
    id v15 = [v4 data];
    id v11 = [v14 initWithData:v15];

    id v16 = NSSLogForType();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Successfully decoded message", buf, 2u);
      }

      BOOL v18 = NSSLogForType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = [v11 buildVersion];
        *(_DWORD *)buf = 138412290;
        id v81 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "- Build version: %@", buf, 0xCu);
      }
      id v20 = NSSLogForType();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v21 = [v11 systemLanguages];
        *(_DWORD *)buf = 138412290;
        id v81 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "- System languages: %@", buf, 0xCu);
      }
      unsigned int v22 = NSSLogForType();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [v11 localeIdentifiers];
        *(_DWORD *)buf = 138412290;
        id v81 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "- Local identifiers: %@", buf, 0xCu);
      }
      id v24 = NSSLogForType();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        NSErrorUserInfoKey v25 = [v11 supportedCalendars];
        *(_DWORD *)buf = 138412290;
        id v81 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "- Supported calendars: %@", buf, 0xCu);
      }
      uint64_t v26 = NSSLogForType();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v11 numberingSystems];
        *(_DWORD *)buf = 138412290;
        id v81 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "- Numbering systems: %@", buf, 0xCu);
      }
      int v28 = NSSLogForType();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = [v11 defaultCalendars];
        *(_DWORD *)buf = 138412290;
        id v81 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "- Default calendars: %@", buf, 0xCu);
      }
      id v16 = objc_opt_new();
      id v30 = [v11 systemLanguages];

      if (v30)
      {
        __int16 v31 = [v11 systemLanguages];
        [v16 setObject:v31 forKeyedSubscript:kNSSLocalesInfoSystemLanguagesKey];
      }
      __int16 v32 = [v11 localeIdentifiers];

      if (v32)
      {
        id v33 = [v11 localeIdentifiers];
        [v16 setObject:v33 forKeyedSubscript:kNSSLocalesInfoAvailableLocaleIdentifiers];
      }
      id v34 = [v11 supportedCalendars];

      if (v34)
      {
        unsigned int v35 = [v11 supportedCalendars];
        [v16 setObject:v35 forKeyedSubscript:kNSSLocalesInfoSupportedCalendars];
      }
      id v36 = [v11 numberingSystems];

      v66 = v6;
      id v68 = v4;
      __int16 v62 = v10;
      uint64_t v64 = v8;
      if (v36)
      {
        unsigned int v37 = objc_opt_new();
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v38 = [v11 numberingSystems];
        id v39 = [v38 countByEnumeratingWithState:&v74 objects:v79 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v75;
          do
          {
            for (i = 0; i != v40; i = (char *)i + 1)
            {
              if (*(void *)v75 != v41) {
                objc_enumerationMutation(v38);
              }
              id v43 = *(void **)(*((void *)&v74 + 1) + 8 * i);
              uint64_t v44 = objc_msgSend(v43, "localeIdentifier", v62, v64, v66, v68);
              if (v44)
              {
                id v45 = (void *)v44;
                __int16 v46 = [v43 numberingSystems];

                if (v46)
                {
                  id v47 = [v43 numberingSystems];
                  __int16 v48 = [v43 localeIdentifier];
                  [v37 setObject:v47 forKeyedSubscript:v48];
                }
              }
            }
            id v40 = [v38 countByEnumeratingWithState:&v74 objects:v79 count:16];
          }
          while (v40);
        }

        if ([v37 count]) {
          [v16 setObject:v37 forKeyedSubscript:kNSSLocalesInfoDefaultNumberingSystems];
        }

        id v6 = v66;
        id v4 = v68;
        int v10 = v62;
        id v8 = v64;
      }
      id v49 = [v11 defaultCalendars];

      if (v49)
      {
        __int16 v50 = objc_opt_new();
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        unsigned int v51 = [v11 defaultCalendars];
        id v52 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
        if (v52)
        {
          id v53 = v52;
          uint64_t v54 = *(void *)v71;
          do
          {
            for (j = 0; j != v53; j = (char *)j + 1)
            {
              if (*(void *)v71 != v54) {
                objc_enumerationMutation(v51);
              }
              __int16 v56 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
              __int16 v57 = [v56 locale];

              if (v57)
              {
                id v58 = [v56 calendar];
                id v59 = [v56 locale];
                [v50 setObject:v58 forKeyedSubscript:v59];
              }
            }
            id v53 = [v51 countByEnumeratingWithState:&v70 objects:v78 count:16];
          }
          while (v53);
        }

        if ([v50 count])
        {
          __int16 v60 = +[NSDictionary dictionaryWithDictionary:v50];
          [v16 setObject:v60 forKeyedSubscript:kNSSLocalesInfoDefaultCalendars];
        }
        id v6 = v67;
        id v4 = v69;
        int v10 = v63;
        id v8 = v65;
      }
      ((void (**)(void, NSObject *, void))v10)[2](v10, v16, 0);
      v61 = [v11 buildVersion];
      +[NSSLocaleInfoCache cacheReply:v16 forGizmoBuildVersion:v61];
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not parse incoming protobuf.", buf, 2u);
    }
  }
  else if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find reply block", buf, 2u);
  }
}

- (void)handleLPMAutoDisabledRespMsg:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSSUpdatePowerStatusMsgType);
  id v5 = [v3 data];

  id v8 = [v4 initWithData:v5];
  id v6 = [v8 notificationType];
  id v7 = +[NSSGizmoPowerMonitor sharedMonitor];
  [v7 processLowPowerModeAutoDisableUpdateType:v6];
}

- (void)fetchBetaEnrollmentStatus:(id)a3
{
  id v4 = a3;
  id v5 = NSSLogForType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_retainBlock(v4);
    *(_DWORD *)buf = 136315394;
    id v11 = "-[NSSCompanionServer fetchBetaEnrollmentStatus:]";
    __int16 v12 = 2048;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: replyBlock: (%p)", buf, 0x16u);
  }
  if (v4)
  {
    id v7 = [(NSSServer *)self idsQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001300C;
    void v8[3] = &unk_100034B58;
    void v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)handleBetaEnrollmentRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  id v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315906;
    BOOL v18 = "-[NSSCompanionServer handleBetaEnrollmentRespMsg:]";
    __int16 v19 = 2048;
    id v20 = v4;
    __int16 v21 = 2112;
    unsigned int v22 = v6;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v17,
      0x2Au);
  }

  int v10 = [(NSMutableDictionary *)self->_betaEnrollmentStatusRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      int v17 = 136315394;
      BOOL v18 = "-[NSSCompanionServer handleBetaEnrollmentRespMsg:]";
      __int16 v19 = 2048;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Found matching replyBlock (%p)", (uint8_t *)&v17, 0x16u);
    }
    [(NSMutableDictionary *)self->_betaEnrollmentStatusRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_betaEnrollmentStatusReplyTimers utilityName:@"betaEnrollmentStatus"];
    id v14 = objc_alloc((Class)NSSBetaEnrollmentStatusRespMsg);
    id v15 = [v4 data];
    id v11 = [v14 initWithData:v15];

    if (v11)
    {
      id v16 = [v11 selectedBetaProgramInfo];
      ((void (**)(void, NSObject *, void))v10)[2](v10, v16, 0);
    }
    else
    {
      id v16 = NSSLogForType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        BOOL v18 = "-[NSSCompanionServer handleBetaEnrollmentRespMsg:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Could not parse incoming protobuf.", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else if (v12)
  {
    int v17 = 136315138;
    BOOL v18 = "-[NSSCompanionServer handleBetaEnrollmentRespMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Could not find reply block", (uint8_t *)&v17, 0xCu);
  }
}

- (void)updateBetaEnrollmentStatus:(id)a3 requiresUnenroll:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  int v10 = NSSLogForType();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v19 = "-[NSSCompanionServer updateBetaEnrollmentStatus:requiresUnenroll:withCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v9)
  {
    id v11 = objc_alloc_init((Class)NSSUpdateBetaEnrollmentStatusReqMsg);
    BOOL v12 = v11;
    if (v8) {
      [v11 setBetaProgramInfo:v8];
    }
    [v12 setUnenroll:v6];
    id v13 = [(NSSServer *)self idsQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013574;
    block[3] = &unk_100034B80;
    void block[4] = self;
    id v16 = v12;
    id v17 = v9;
    id v14 = v12;
    dispatch_async(v13, block);
  }
}

- (void)handleUpdateEnrollmentStatusRespMsg:(id)a3
{
  id v4 = a3;
  id v5 = [v4 context];
  BOOL v6 = [v5 incomingResponseIdentifier];

  id v7 = [v4 context];
  id v8 = [v7 outgoingResponseIdentifier];

  id v9 = NSSLogForType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315906;
    id v20 = "-[NSSCompanionServer handleUpdateEnrollmentStatusRespMsg:]";
    __int16 v21 = 2048;
    id v22 = v4;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: idsProtobuf: (%p); incomingResponseIdentifier: (%@); outgoingResponseIdentifier: (%@)",
      (uint8_t *)&v19,
      0x2Au);
  }

  int v10 = [(NSMutableDictionary *)self->_updateBetaEnrollmentStatusRequests objectForKey:v6];
  id v11 = NSSLogForType();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = objc_retainBlock(v10);
      int v19 = 136315394;
      id v20 = "-[NSSCompanionServer handleUpdateEnrollmentStatusRespMsg:]";
      __int16 v21 = 2048;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Found matching replyBlock (%p)", (uint8_t *)&v19, 0x16u);
    }
    [(NSMutableDictionary *)self->_updateBetaEnrollmentStatusRequests removeObjectForKey:v6];
    [(NSSServer *)self cancelTimerForIdentifier:v6 timers:self->_updateBetaEnrollmentStatusReplyTimers utilityName:@"updateBetaEnrollmentStatus"];
    id v14 = objc_alloc((Class)NSSUpdateBetaEnrollmentStatusRespMsg);
    id v15 = [v4 data];
    id v11 = [v14 initWithData:v15];

    if (v11)
    {
      id v16 = [v11 error];

      if (v16)
      {
        id v17 = +[NSSet setWithObject:objc_opt_class()];
        BOOL v18 = [v11 error];
        id v16 = +[NSSKeyedArchiverUtil unarchiveObjectOfClasses:v17 withData:v18];
      }
      ((void (**)(void, id, NSObject *))v10)[2](v10, [v11 success], v16);
    }
    else
    {
      id v16 = NSSLogForType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        id v20 = "-[NSSCompanionServer handleUpdateEnrollmentStatusRespMsg:]";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: Could not parse incoming protobuf.", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  else if (v12)
  {
    int v19 = 136315138;
    id v20 = "-[NSSCompanionServer handleUpdateEnrollmentStatusRespMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Could not find reply block", (uint8_t *)&v19, 0xCu);
  }
}

- (NSMutableArray)coalescedUsageRequests
{
  return self->_coalescedUsageRequests;
}

- (void)setCoalescedUsageRequests:(id)a3
{
}

- (NSMutableDictionary)usageRequests
{
  return self->_usageRequests;
}

- (void)setUsageRequests:(id)a3
{
}

- (NSMutableDictionary)purgeUsageBundleRequests
{
  return self->_purgeUsageBundleRequests;
}

- (void)setPurgeUsageBundleRequests:(id)a3
{
}

- (NSMutableDictionary)diagnosticLogFileRequests
{
  return self->_diagnosticLogFileRequests;
}

- (void)setDiagnosticLogFileRequests:(id)a3
{
}

- (NSMutableDictionary)diagnosticLogsInfoRequests
{
  return self->_diagnosticLogsInfoRequests;
}

- (void)setDiagnosticLogsInfoRequests:(id)a3
{
}

- (NSMutableDictionary)cancelLogTransferRequests
{
  return self->_cancelLogTransferRequests;
}

- (void)setCancelLogTransferRequests:(id)a3
{
}

- (NSMutableDictionary)logDeleteRequests
{
  return self->_logDeleteRequests;
}

- (void)setLogDeleteRequests:(id)a3
{
}

- (NSMutableDictionary)airplaneModeSettingsRequests
{
  return self->_airplaneModeSettingsRequests;
}

- (void)setAirplaneModeSettingsRequests:(id)a3
{
}

- (NSMutableDictionary)aboutInfoRequests
{
  return self->_aboutInfoRequests;
}

- (void)setAboutInfoRequests:(id)a3
{
}

- (NSMutableDictionary)obliterationRequests
{
  return self->_obliterationRequests;
}

- (void)setObliterationRequests:(id)a3
{
}

- (NSMutableDictionary)accountsInfoRequests
{
  return self->_accountsInfoRequests;
}

- (void)setAccountsInfoRequests:(id)a3
{
}

- (NSMutableDictionary)profilesInfoRequests
{
  return self->_profilesInfoRequests;
}

- (void)setProfilesInfoRequests:(id)a3
{
}

- (NSMutableDictionary)profileDataRequests
{
  return self->_profileDataRequests;
}

- (void)setProfileDataRequests:(id)a3
{
}

- (NSMutableDictionary)installProfileRequests
{
  return self->_installProfileRequests;
}

- (void)setInstallProfileRequests:(id)a3
{
}

- (NSMutableDictionary)removeProfileRequests
{
  return self->_removeProfileRequests;
}

- (void)setRemoveProfileRequests:(id)a3
{
}

- (NSMutableDictionary)legalDocumentsRequests
{
  return self->_legalDocumentsRequests;
}

- (void)setLegalDocumentsRequests:(id)a3
{
}

- (NSMutableDictionary)localesInfoRequests
{
  return self->_localesInfoRequests;
}

- (void)setLocalesInfoRequests:(id)a3
{
}

- (NSMutableDictionary)betaEnrollmentStatusRequests
{
  return self->_betaEnrollmentStatusRequests;
}

- (void)setBetaEnrollmentStatusRequests:(id)a3
{
}

- (NSMutableDictionary)updateBetaEnrollmentStatusRequests
{
  return self->_updateBetaEnrollmentStatusRequests;
}

- (void)setUpdateBetaEnrollmentStatusRequests:(id)a3
{
}

- (NSMutableDictionary)usageReplyTimers
{
  return self->_usageReplyTimers;
}

- (void)setUsageReplyTimers:(id)a3
{
}

- (NSMutableDictionary)purgeUsageBundleReplyTimers
{
  return self->_purgeUsageBundleReplyTimers;
}

- (void)setPurgeUsageBundleReplyTimers:(id)a3
{
}

- (NSMutableDictionary)diagnosticLogFileReplyTimers
{
  return self->_diagnosticLogFileReplyTimers;
}

- (void)setDiagnosticLogFileReplyTimers:(id)a3
{
}

- (NSMutableDictionary)diagnosticLogsInfoReplyTimers
{
  return self->_diagnosticLogsInfoReplyTimers;
}

- (void)setDiagnosticLogsInfoReplyTimers:(id)a3
{
}

- (NSMutableDictionary)cancelLogTransferReplyTimers
{
  return self->_cancelLogTransferReplyTimers;
}

- (void)setCancelLogTransferReplyTimers:(id)a3
{
}

- (NSMutableDictionary)airplaneModeSettingsReplyTimers
{
  return self->_airplaneModeSettingsReplyTimers;
}

- (void)setAirplaneModeSettingsReplyTimers:(id)a3
{
}

- (NSMutableDictionary)logDeleteReplyTimers
{
  return self->_logDeleteReplyTimers;
}

- (void)setLogDeleteReplyTimers:(id)a3
{
}

- (NSMutableDictionary)aboutInfoReplyTimers
{
  return self->_aboutInfoReplyTimers;
}

- (void)setAboutInfoReplyTimers:(id)a3
{
}

- (NSMutableDictionary)obliterationDeliveryTimers
{
  return self->_obliterationDeliveryTimers;
}

- (void)setObliterationDeliveryTimers:(id)a3
{
}

- (NSMutableDictionary)accountsInfoReplyTimers
{
  return self->_accountsInfoReplyTimers;
}

- (void)setAccountsInfoReplyTimers:(id)a3
{
}

- (NSMutableDictionary)profilesInfoReplyTimers
{
  return self->_profilesInfoReplyTimers;
}

- (void)setProfilesInfoReplyTimers:(id)a3
{
}

- (NSMutableDictionary)profileDataReplyTimers
{
  return self->_profileDataReplyTimers;
}

- (void)setProfileDataReplyTimers:(id)a3
{
}

- (NSMutableDictionary)installProfileReplyTimers
{
  return self->_installProfileReplyTimers;
}

- (void)setInstallProfileReplyTimers:(id)a3
{
}

- (NSMutableDictionary)removeProfileReplyTimers
{
  return self->_removeProfileReplyTimers;
}

- (void)setRemoveProfileReplyTimers:(id)a3
{
}

- (NSMutableDictionary)legalDocumentsReplyTimers
{
  return self->_legalDocumentsReplyTimers;
}

- (void)setLegalDocumentsReplyTimers:(id)a3
{
}

- (NSMutableDictionary)localesInfoReplyTimers
{
  return self->_localesInfoReplyTimers;
}

- (void)setLocalesInfoReplyTimers:(id)a3
{
}

- (NSMutableDictionary)betaEnrollmentStatusReplyTimers
{
  return self->_betaEnrollmentStatusReplyTimers;
}

- (void)setBetaEnrollmentStatusReplyTimers:(id)a3
{
}

- (NSMutableDictionary)updateBetaEnrollmentStatusReplyTimers
{
  return self->_updateBetaEnrollmentStatusReplyTimers;
}

- (void)setUpdateBetaEnrollmentStatusReplyTimers:(id)a3
{
}

- (NSSCompanionSyncManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (NSCache)fileTransferProgress
{
  return self->_fileTransferProgress;
}

- (void)setFileTransferProgress:(id)a3
{
}

- (NSString)cancelledLogInTransit
{
  return self->_cancelledLogInTransit;
}

- (void)setCancelledLogInTransit:(id)a3
{
}

- (NSSWatchFaceCoordinator)watchFaceCoordinator
{
  return self->_watchFaceCoordinator;
}

- (void)setWatchFaceCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaceCoordinator, 0);
  objc_storeStrong((id *)&self->_cancelledLogInTransit, 0);
  objc_storeStrong((id *)&self->_fileTransferProgress, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_updateBetaEnrollmentStatusReplyTimers, 0);
  objc_storeStrong((id *)&self->_betaEnrollmentStatusReplyTimers, 0);
  objc_storeStrong((id *)&self->_localesInfoReplyTimers, 0);
  objc_storeStrong((id *)&self->_legalDocumentsReplyTimers, 0);
  objc_storeStrong((id *)&self->_removeProfileReplyTimers, 0);
  objc_storeStrong((id *)&self->_installProfileReplyTimers, 0);
  objc_storeStrong((id *)&self->_profileDataReplyTimers, 0);
  objc_storeStrong((id *)&self->_profilesInfoReplyTimers, 0);
  objc_storeStrong((id *)&self->_accountsInfoReplyTimers, 0);
  objc_storeStrong((id *)&self->_obliterationDeliveryTimers, 0);
  objc_storeStrong((id *)&self->_aboutInfoReplyTimers, 0);
  objc_storeStrong((id *)&self->_logDeleteReplyTimers, 0);
  objc_storeStrong((id *)&self->_airplaneModeSettingsReplyTimers, 0);
  objc_storeStrong((id *)&self->_cancelLogTransferReplyTimers, 0);
  objc_storeStrong((id *)&self->_diagnosticLogsInfoReplyTimers, 0);
  objc_storeStrong((id *)&self->_diagnosticLogFileReplyTimers, 0);
  objc_storeStrong((id *)&self->_purgeUsageBundleReplyTimers, 0);
  objc_storeStrong((id *)&self->_usageReplyTimers, 0);
  objc_storeStrong((id *)&self->_updateBetaEnrollmentStatusRequests, 0);
  objc_storeStrong((id *)&self->_betaEnrollmentStatusRequests, 0);
  objc_storeStrong((id *)&self->_localesInfoRequests, 0);
  objc_storeStrong((id *)&self->_legalDocumentsRequests, 0);
  objc_storeStrong((id *)&self->_removeProfileRequests, 0);
  objc_storeStrong((id *)&self->_installProfileRequests, 0);
  objc_storeStrong((id *)&self->_profileDataRequests, 0);
  objc_storeStrong((id *)&self->_profilesInfoRequests, 0);
  objc_storeStrong((id *)&self->_accountsInfoRequests, 0);
  objc_storeStrong((id *)&self->_obliterationRequests, 0);
  objc_storeStrong((id *)&self->_aboutInfoRequests, 0);
  objc_storeStrong((id *)&self->_airplaneModeSettingsRequests, 0);
  objc_storeStrong((id *)&self->_logDeleteRequests, 0);
  objc_storeStrong((id *)&self->_cancelLogTransferRequests, 0);
  objc_storeStrong((id *)&self->_diagnosticLogsInfoRequests, 0);
  objc_storeStrong((id *)&self->_diagnosticLogFileRequests, 0);
  objc_storeStrong((id *)&self->_purgeUsageBundleRequests, 0);
  objc_storeStrong((id *)&self->_usageRequests, 0);
  objc_storeStrong((id *)&self->_coalescedUsageRequests, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_nssDomainAccessor, 0);
}

@end