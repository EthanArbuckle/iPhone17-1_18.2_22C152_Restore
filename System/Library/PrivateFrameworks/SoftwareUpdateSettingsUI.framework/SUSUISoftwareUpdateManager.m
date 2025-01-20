@interface SUSUISoftwareUpdateManager
+ (double)timeRemainingForProgress:(id)a3 isValid:(BOOL *)a4;
- (BOOL)_SUDownloadPhaseIsQueued:(id)a3;
- (BOOL)allowCellularOverride;
- (BOOL)automaticDownloadEnabled:(BOOL *)a3;
- (BOOL)automaticInstallSystemDataFilesStatusEnabled:(BOOL *)a3;
- (BOOL)automaticUpdateEnabled:(BOOL *)a3;
- (BOOL)automaticUpdatePreviousUserSpecifiedStatus:(BOOL *)a3;
- (BOOL)automaticUpdateScheduled;
- (BOOL)bypassTermsAndConditions;
- (BOOL)canCancelAutoInstall;
- (BOOL)clearingSpaceForDownload;
- (BOOL)clientIsBuddy;
- (BOOL)didCompleteBetaProgramScan;
- (BOOL)enableUpdateButtonForError:(id)a3;
- (BOOL)errorsAreEqual:(id)a3 error2:(id)a4 oldDescription:(id)a5;
- (BOOL)hidingAlternateUpdate;
- (BOOL)hidingPreferredUpdate;
- (BOOL)isAutoInstallArmedAndReady;
- (BOOL)isDelayingUpdates;
- (BOOL)isDeviceBetaEnrolled;
- (BOOL)isRollingBack;
- (BOOL)previousUserSpecifiedSecurityResponseStatus:(BOOL *)a3;
- (BOOL)readyToDownload;
- (BOOL)readyToDownloadAlternateUpdate;
- (BOOL)readyToDownloadPreferredUpdate;
- (BOOL)readyToResume;
- (BOOL)securityResponseStatus:(BOOL *)a3;
- (BOOL)shouldIgnoreUpdateError:(id)a3;
- (BOOL)shouldSetStateForInstallError:(id)a3 outError:(id *)a4 outState:(int *)a5;
- (BOOL)shouldShowPreferredUpdateAsAlternate;
- (BOOL)suPathsRestricted;
- (NSArray)betaPrograms;
- (NSError)alternateUpdateError;
- (NSError)preferredUpdateError;
- (NSError)scanError;
- (NSString)actionString;
- (NSString)alternateUpdateErrorDescription;
- (NSString)preferredUpdateErrorDescription;
- (NSString)prettyUpdateName;
- (NSString)progressString;
- (RUIStyle)serverFlowStyle;
- (SDBetaProgram)enrolledBetaProgram;
- (SDDevice)currentSeedingDevice;
- (SUCoreDDMDeclaration)ddmDeclaration;
- (SUDescriptor)alternateUpdate;
- (SUDescriptor)hiddenAlternateUpdate;
- (SUDescriptor)hiddenPreferredUpdate;
- (SUDescriptor)preferredUpdate;
- (SUDescriptor)update;
- (SUDownload)download;
- (SUInstallPolicy)installPolicy;
- (SUManagerClient)SUManager;
- (SUMutableDownloadMetadata)downloadMetadata;
- (SUSUISoftwareUpdateManager)initWithDelegate:(id)a3 hostController:(id)a4;
- (SUSUISoftwareUpdateManagerDelegate)delegate;
- (UIViewController)hostController;
- (id)actionStringForBuddy;
- (id)betaUpdatesAppleID;
- (id)buildVersionIncludingRSR;
- (id)eligibleRollback;
- (id)humanReadableDescriptionForError:(id)a3;
- (id)humanReadableDescriptionForError:(id)a3 enableButton:(BOOL *)a4;
- (id)humanReadableDescriptionForError:(id)a3 enableButton:(BOOL *)a4 showAsButtonFooter:(BOOL *)a5;
- (id)humanReadableTitleForError:(id)a3;
- (id)prettyNameForUpdate:(id)a3;
- (id)productVersionWithExtra;
- (id)statusStringForBuddy;
- (id)timeRemainingStringForProgress:(id)a3;
- (int)state;
- (unint64_t)ignorableConstraints;
- (void)_alertForDownloadConstraintsWithCompletion:(id)a3;
- (void)_batteryLevelChanged:(id)a3;
- (void)_batteryStateChanged:(id)a3;
- (void)_didBecomeActive:(id)a3;
- (void)_notifyScanFailed:(id)a3;
- (void)_reallyDownloadAndInstall:(unint64_t)a3 update:(id)a4 AcceptingCellularFees:(int)a5 completion:(id)a6;
- (void)_reallyDownloadAndInstallDidFinishWithResult:(BOOL)a3 andError:(id)a4 forUpdate:(id)a5 withDownload:(id)a6 andDownloadError:(id)a7 usingCompletionHandler:(id)a8;
- (void)_reallyResumeDownloadAcceptingCellularFees:(int)a3;
- (void)_requestLayoutSubviews;
- (void)_scanForBetaProgramsWithSeedingDevice:(id)a3;
- (void)_setState:(int)a3 preferredUpdateError:(id)a4 alternateUpdateError:(id)a5;
- (void)_updateDownloadProgressWithDownload:(id)a3 stateFromDownload:(int *)a4;
- (void)assignScanResults:(id)a3;
- (void)cancelAutoInstall;
- (void)cancelOrPurgeIfNecessaryWithUpdate:(id)a3 completion:(id)a4;
- (void)checkAndSetReadyToInstall;
- (void)checkAutoInstall;
- (void)clearPastScanResults;
- (void)dealloc;
- (void)downloadAlternateHidePreferred;
- (void)enrollInBetaUpdatesForProgram:(id)a3 completion:(id)a4;
- (void)handleDownloadError:(id)a3;
- (void)handleRollbackApplied;
- (void)handleScanError:(id)a3;
- (void)hideAlternateUpdate;
- (void)hidePreferredUpdate;
- (void)manager:(id)a3 autoUpdateScheduleStateChanged:(BOOL)a4 autoInstallOperation:(id)a5;
- (void)manager:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5;
- (void)manager:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5;
- (void)manager:(id)a3 downloadDidStart:(id)a4;
- (void)manager:(id)a3 downloadProgressDidChange:(id)a4;
- (void)manager:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4;
- (void)manager:(id)a3 handleDDMDeclaration:(id)a4;
- (void)manager:(id)a3 inUserInteraction:(id)a4;
- (void)manager:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 installDidFinish:(id)a4;
- (void)manager:(id)a3 installDidStart:(id)a4;
- (void)manager:(id)a3 rollingBackStateChanged:(BOOL)a4 rollback:(id)a5;
- (void)manager:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6;
- (void)manager:(id)a3 scanRequestDidStartForOptions:(id)a4;
- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4;
- (void)presentTermsIfNecessaryCompletion:(id)a3;
- (void)presentTermsIfNecessaryForUpdate:(id)a3 completion:(id)a4;
- (void)promptForDevicePasscodeForDescriptor:(id)a3 unattendedInstall:(BOOL)a4 completion:(id)a5;
- (void)purgeCurrentDownloadWithHandler:(id)a3;
- (void)refreshErrors:(id)a3 alternateError:(id)a4 completion:(id)a5;
- (void)refreshState;
- (void)rescanForUpdatesInBackgroundWithOptions:(id)a3 andCompletionHandler:(id)a4;
- (void)resumeDownload;
- (void)revealHiddenAlteranteUpdate;
- (void)revealHiddenPreferredUpdate;
- (void)runEntryScan:(BOOL)a3;
- (void)scanFinishedWithUpdates:(id)a3 options:(id)a4 andError:(id)a5;
- (void)scanForBetaPrograms;
- (void)scanForUpdateCompletion:(id)a3;
- (void)scanForUpdatesCompletion:(id)a3;
- (void)scanForUpdatesWithOptions:(id)a3 andCompletion:(id)a4;
- (void)setActionString:(id)a3;
- (void)setAllowCellularOverride:(BOOL)a3;
- (void)setAlternateUpdate:(id)a3;
- (void)setAlternateUpdateError:(id)a3;
- (void)setAlternateUpdateErrorDescription:(id)a3;
- (void)setAutoInstall:(id)a3;
- (void)setAutomaticDownloadEnabled:(BOOL)a3;
- (void)setAutomaticInstallSystemDataFilesStatusEnabled:(BOOL)a3;
- (void)setAutomaticUpdateEnabled:(BOOL)a3;
- (void)setBetaPrograms:(id)a3;
- (void)setBypassTermsAndConditions:(BOOL)a3;
- (void)setClearingSpaceForDownload:(BOOL)a3;
- (void)setClientIsBuddy:(BOOL)a3;
- (void)setCurrentSeedingDevice:(id)a3;
- (void)setDdmDeclaration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCompleteBetaProgramScan:(BOOL)a3;
- (void)setDownload:(id)a3;
- (void)setDownloadMetadata:(id)a3;
- (void)setEnrolledBetaProgram:(id)a3;
- (void)setHiddenAlternateUpdate:(id)a3;
- (void)setHiddenPreferredUpdate:(id)a3;
- (void)setHostController:(id)a3;
- (void)setInstallPolicy:(id)a3;
- (void)setIsDelayingUpdates:(BOOL)a3;
- (void)setPreferredUpdate:(id)a3;
- (void)setPreferredUpdateError:(id)a3;
- (void)setPreferredUpdateErrorDescription:(id)a3;
- (void)setPreviousUserSpecifiedAutomaticUpdateStatus:(BOOL)a3;
- (void)setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3;
- (void)setProgressString:(id)a3;
- (void)setSecurityResponseStatus:(BOOL)a3;
- (void)setServerFlowStyle:(id)a3;
- (void)setState:(int)a3;
- (void)setState:(int)a3 withDownloadUpdateError:(id)a4;
- (void)setSuPathsRestricted:(BOOL)a3;
- (void)setUpdate:(id)a3;
- (void)startDownloadAndInstall:(unint64_t)a3 update:(id)a4 withHandler:(id)a5;
- (void)startDownloadAndInstall:(unint64_t)a3 withHandler:(id)a4;
- (void)startInstallWithHandler:(id)a3;
- (void)startRollbackWithOptions:(id)a3 withHandler:(id)a4;
- (void)unenrollBetaUpdatesWithCompletion:(id)a3;
- (void)updateStateFromDownload:(id)a3;
- (void)upgradeDownloadToUserInitiated;
@end

@implementation SUSUISoftwareUpdateManager

- (SUSUISoftwareUpdateManager)initWithDelegate:(id)a3 hostController:(id)a4
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  v4 = v36;
  v36 = 0;
  v33.receiver = v4;
  v33.super_class = (Class)SUSUISoftwareUpdateManager;
  v36 = [(SUSUISoftwareUpdateManager *)&v33 init];
  objc_storeStrong((id *)&v36, v36);
  if (v36)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.softwareupdatesettings._concurrentqueue", 0);
    concurrentQueue = v36->_concurrentQueue;
    v36->_concurrentQueue = (OS_dispatch_queue *)v5;

    v23 = +[SUSUIServiceManager sharedInstance];
    Class v32 = [(SUSUIServiceManager *)v23 classForService:objc_opt_class()];

    id v25 = [v32 alloc];
    v24 = v36;
    id v26 = MEMORY[0x263EF83A0];
    uint64_t v7 = objc_msgSend(v25, "initWithDelegate:completionQueue:", v24);
    suClient = v36->_suClient;
    v36->_suClient = (SUSUISoftwareUpdateClientManager *)v7;

    v9 = [(SUSUISoftwareUpdateClientManager *)v36->_suClient suManagerClient];
    SUManager = v36->_SUManager;
    v36->_SUManager = v9;

    objc_storeWeak((id *)&v36->_delegate, location[0]);
    objc_storeWeak((id *)&v36->_hostController, v34);
    v36->_clearingSpaceForDownload = 0;
    id v31 = (id)[getSUNetworkMonitorClass_0() sharedInstance];
    int v11 = [v31 currentNetworkType];
    v36->_networkType = v11;
    [v31 addObserver:v36];
    PSSetBatteryMonitoringEnabled();
    id v27 = (id)[MEMORY[0x263F82670] currentDevice];
    uint64_t v28 = [v27 batteryState];

    BOOL v29 = 1;
    if (v28 != 2) {
      BOOL v29 = v28 == 3;
    }
    v36->_connectedToPowerSource = v29;
    id v19 = (id)[MEMORY[0x263F82670] currentDevice];
    [v19 batteryLevel];
    v36->_batteryLevel = v12;

    id v20 = (id)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v20, "addObserver:selector:name:object:", v36, sel__batteryStateChanged_, *MEMORY[0x263F834A0]);

    id v21 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v36 selector:sel__batteryLevelChanged_ name:*MEMORY[0x263F83498] object:0];

    id v22 = (id)[MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v36 selector:sel__didBecomeActive_ name:*MEMORY[0x263F83318] object:0];

    uint64_t v13 = SBSSpringBoardServerPort();
    MEMORY[0x22A696F20](v13, &v36->_originalCellFlag, &v36->_originalWifiFlag);
    uint64_t v14 = SBSSpringBoardServerPort();
    MEMORY[0x22A696F40](v14, 1);
    v36->_previousTimeRemaining = -1.0;
    v36->_hidingPreferredUpdate = 0;
    v36->_hidingAlternateUpdate = 0;
    v15 = objc_alloc_init(SUSUIUpdateAgreementManager);
    updateAgreementManager = v36->_updateAgreementManager;
    v36->_updateAgreementManager = v15;

    objc_storeStrong((id *)&v36->_enrolledBetaProgram, 0);
    objc_storeStrong((id *)&v36->_currentSeedingDevice, 0);
    objc_storeStrong(&v31, 0);
  }
  v18 = v36;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v36, 0);
  return v18;
}

- (void)dealloc
{
  v10 = self;
  SEL v9 = a2;
  uint64_t v2 = SBSSpringBoardServerPort();
  MEMORY[0x22A696F40](v2, v10->_originalCellFlag, v10->_originalWifiFlag);
  id v4 = (id)[getSUNetworkMonitorClass_0() sharedInstance];
  [v4 removeObserver:v10];

  PSSetBatteryMonitoringEnabled();
  id v5 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&v10->_hostController);
  id v7 = (id)[WeakRetained presentedViewController];

  if (v7)
  {
    id v3 = objc_loadWeakRetained((id *)&v10->_hostController);
    [v3 dismissViewControllerAnimated:0 completion:0];
  }
  v8.receiver = v10;
  v8.super_class = (Class)SUSUISoftwareUpdateManager;
  [(SUSUISoftwareUpdateManager *)&v8 dealloc];
}

- (void)setPreferredUpdateError:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_preferredUpdateError, location[0]);
  id v3 = [(SUSUISoftwareUpdateManager *)v5 humanReadableDescriptionForError:location[0] enableButton:0];
  -[SUSUISoftwareUpdateManager setPreferredUpdateErrorDescription:](v5, "setPreferredUpdateErrorDescription:");

  objc_storeStrong(location, 0);
}

- (void)setAlternateUpdateError:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v5->_alternateUpdateError, location[0]);
  id v3 = [(SUSUISoftwareUpdateManager *)v5 humanReadableDescriptionForError:location[0] enableButton:0];
  -[SUSUISoftwareUpdateManager setAlternateUpdateErrorDescription:](v5, "setAlternateUpdateErrorDescription:");

  objc_storeStrong(location, 0);
}

+ (double)timeRemainingForProgress:(id)a3 isValid:(BOOL *)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4) {
    *a4 = 0;
  }
  if (!location[0]) {
    goto LABEL_13;
  }
  [location[0] timeRemaining];
  double v7 = v4;
  if (v4 < 0.0) {
    goto LABEL_13;
  }
  if (v4 > 0.0 && v4 < 1.0) {
    double v7 = 1.0;
  }
  if (v7 < (double)0x93A80uLL && v7 > 0.0)
  {
    if (a4) {
      *a4 = 1;
    }
    double v9 = v7;
  }
  else
  {
LABEL_13:
    double v9 = -1.0;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)timeRemainingStringForProgress:(id)a3
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v39 = 0;
  BOOL v17 = 0;
  if (location[0])
  {
    id v40 = (id)[location[0] phase];
    char v39 = 1;
    BOOL v17 = 0;
    if ([v40 isEqualToString:*MEMORY[0x263F78428]])
    {
      [location[0] percentComplete];
      BOOL v17 = v3 >= 1.0;
    }
  }
  if (v39) {

  }
  if (v17)
  {
    v15 = [(SUSUISoftwareUpdateManager *)v42 download];
    v16 = [(SUDownload *)v15 descriptor];
    char v37 = 0;
    char v35 = 0;
    char v33 = 0;
    char v31 = 0;
    if ([(SUDescriptor *)v16 isSplatOnly])
    {
      id v38 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v37 = 1;
      id v36 = (id)[v38 localizedStringForKey:@"PREPARING_RSR" value:&stru_26DCD7690 table:@"Software Update"];
      char v35 = 1;
      id v4 = v36;
    }
    else
    {
      id v34 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v33 = 1;
      id v32 = (id)[v34 localizedStringForKey:@"PREPARING_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
      char v31 = 1;
      id v4 = v32;
    }
    id v43 = v4;
    if (v31) {

    }
    if (v33) {
    if (v35)
    }

    if (v37) {
    int v30 = 1;
    }
  }
  else
  {
    uint64_t v13 = [(SUSUISoftwareUpdateManager *)v42 download];
    uint64_t v14 = [(SUDownload *)v13 descriptor];
    char v27 = 0;
    char v25 = 0;
    char v23 = 0;
    char v21 = 0;
    if ([(SUDescriptor *)v14 isSplatOnly])
    {
      id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v27 = 1;
      id v26 = (id)[v28 localizedStringForKey:@"RSR_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
      char v25 = 1;
      id v5 = v26;
    }
    else
    {
      id v24 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v23 = 1;
      id v22 = (id)[v24 localizedStringForKey:@"UPDATE_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
      char v21 = 1;
      id v5 = v22;
    }
    id v29 = v5;
    if (v21) {

    }
    if (v23) {
    if (v25)
    }

    if (v27) {
    char v20 = 0;
    }
    +[SUSUISoftwareUpdateManager timeRemainingForProgress:location[0] isValid:&v20];
    double v19 = v6;
    if (v20)
    {
      id v18 = 0;
      id v7 = objc_alloc_init(MEMORY[0x263F08780]);
      id v8 = v18;
      id v18 = v7;

      [v18 setUnitsStyle:3];
      [v18 setAllowedUnits:240];
      [v18 setMaximumUnitCount:1];
      [v18 setIncludesApproximationPhrase:1];
      [v18 setIncludesTimeRemainingPhrase:1];
      [v18 setFormattingContext:2];
      id v9 = (id)[v18 stringFromTimeInterval:v19];
      id v10 = v29;
      id v29 = v9;

      objc_storeStrong(&v18, 0);
    }
    id v43 = v29;
    int v30 = 1;
    objc_storeStrong(&v29, 0);
  }
  objc_storeStrong(location, 0);
  int v11 = v43;
  return v11;
}

- (id)statusStringForBuddy
{
  v63 = self;
  SEL v62 = a2;
  unsigned int state = 0;
  unsigned int state = self->_state;
  char v20 = [(SUSUISoftwareUpdateManager *)self download];
  id v60 = [(SUDownload *)v20 progress];

  id v59 = (id)[v60 phase];
  [v60 percentComplete];
  float v58 = v2;
  id v22 = [(SUSUISoftwareUpdateManager *)v63 download];
  char v21 = [(SUDownload *)v22 descriptor];
  char v23 = [(SUDescriptor *)v21 isSplatOnly];

  char v57 = v23 & 1;
  id location = [(SUSUISoftwareUpdateManager *)v63 preferredUpdateError];
  if (!location || [(SUSUISoftwareUpdateManager *)v63 shouldIgnoreUpdateError:location])
  {
    if (state <= 6)
    {
      uint64_t v5 = state - 6;
      char v4 = 0;
    }
    else
    {
      uint64_t v5 = state - 6;
      char v4 = 1;
    }
    if ((v4 & 1) == 0)
    {
      switch(v5)
      {
        case 0:
        case 2:
        case 3:
          if ([(SUSUISoftwareUpdateManager *)v63 clearingSpaceForDownload])
          {
            char v46 = 0;
            char v44 = 0;
            char v42 = 0;
            char v40 = 0;
            if (v57)
            {
              id v47 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v46 = 1;
              id v6 = (id)[v47 localizedStringForKey:@"RSR_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
              v45 = v6;
              char v44 = 1;
            }
            else
            {
              id v43 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v42 = 1;
              id v6 = (id)[v43 localizedStringForKey:@"UPDATE_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
              v41 = v6;
              char v40 = 1;
            }
            v64 = (__CFString *)v6;
            if (v40) {

            }
            if (v42) {
            if (v44)
            }

            if (v46) {
          }
            }
          else
          {
            v15 = (void *)MEMORY[0x263F086F0];
            v16 = [(SUSUISoftwareUpdateManager *)v63 preferredUpdate];
            v64 = (__CFString *)(id)objc_msgSend(v15, "stringFromByteCount:countStyle:", -[SUDescriptor downloadSize](v16, "downloadSize"), 2);
          }
          goto LABEL_65;
        case 1:
          break;
        case 4:
        case 5:
          id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v64 = (__CFString *)(id)[v11 localizedStringForKey:@"DOWNLOADED" value:&stru_26DCD7690 table:@"Software Update"];

          goto LABEL_65;
        case 6:
        case 7:
          id v13 = getkSUDownloadPhasePreparingForInstallation_1();
          char v14 = objc_msgSend(v59, "isEqualToString:");

          if (v14)
          {
            char v38 = 0;
            char v36 = 0;
            char v34 = 0;
            char v32 = 0;
            if (v57)
            {
              id v39 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v38 = 1;
              id v37 = (id)[v39 localizedStringForKey:@"PREPARING_RSR" value:&stru_26DCD7690 table:@"Software Update"];
              char v36 = 1;
              id v7 = (__CFString *)v37;
            }
            else
            {
              id v35 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v34 = 1;
              id v33 = (id)[v35 localizedStringForKey:@"PREPARING_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
              char v32 = 1;
              id v7 = (__CFString *)v33;
            }
            v64 = v7;
            if (v32) {

            }
            if (v34) {
            if (v36)
            }

            if (v38) {
          }
            }
          else if (v58 >= 0.005)
          {
            v64 = (__CFString *)[(SUSUISoftwareUpdateManager *)v63 timeRemainingStringForProgress:v60];
          }
          else
          {
            char v30 = 0;
            char v28 = 0;
            char v26 = 0;
            char v24 = 0;
            if (v57)
            {
              id v31 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v30 = 1;
              id v29 = (id)[v31 localizedStringForKey:@"RSR_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
              char v28 = 1;
              id v8 = (__CFString *)v29;
            }
            else
            {
              id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v26 = 1;
              id v25 = (id)[v27 localizedStringForKey:@"UPDATE_REQUESTED" value:&stru_26DCD7690 table:@"Software Update"];
              char v24 = 1;
              id v8 = (__CFString *)v25;
            }
            v64 = v8;
            if (v24) {

            }
            if (v26) {
            if (v28)
            }

            if (v30) {
          }
            }
          goto LABEL_65;
        case 8:
          id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v64 = (__CFString *)(id)[v12 localizedStringForKey:@"PAUSED" value:&stru_26DCD7690 table:@"Software Update"];

          goto LABEL_65;
        default:
          JUMPOUT(0);
      }
    }
    v64 = &stru_26DCD7690;
  }
  else
  {
    BOOL v17 = [(SUSUISoftwareUpdateManager *)v63 download];
    id v18 = [(SUDownload *)v17 descriptor];
    double v19 = [(SUSUISoftwareUpdateManager *)v63 preferredUpdate];
    char v54 = 0;
    char v52 = 0;
    char v50 = 0;
    char v48 = 0;
    if ((-[SUDescriptor isEqual:](v18, "isEqual:") & 1) != 0 && state >= 0xA)
    {
      id v55 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v54 = 1;
      id v53 = (id)[v55 localizedStringForKey:@"UNABLE_TO_INSTALL" value:&stru_26DCD7690 table:@"Software Update"];
      char v52 = 1;
      float v3 = (__CFString *)v53;
    }
    else
    {
      id v51 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      char v50 = 1;
      id v49 = (id)[v51 localizedStringForKey:@"UNABLE_TO_DOWNLOAD" value:&stru_26DCD7690 table:@"Software Update"];
      char v48 = 1;
      float v3 = (__CFString *)v49;
    }
    v64 = v3;
    if (v48) {

    }
    if (v50) {
    if (v52)
    }

    if (v54) {
  }
    }
LABEL_65:
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  id v9 = v64;
  return v9;
}

- (NSString)progressString
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v6 = self;
  v5[1] = (id)a2;
  if (PSIsRunningInAssistant())
  {
    v5[0] = [(SUSUISoftwareUpdateManager *)v6 statusStringForBuddy];
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateManager progressString]", (uint64_t)v5[0]);
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v7 = (NSString *)v5[0];
    objc_storeStrong(v5, 0);
  }
  else
  {
    id v7 = v6->_progressString;
  }
  float v2 = v7;
  return v2;
}

- (id)actionStringForBuddy
{
  unsigned int state = self->_state;
  BOOL v3 = state > 6;
  uint64_t v4 = state - 6;
  if (v3)
  {
    uint64_t v6 = v4;
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    switch(v6)
    {
      case 0:
      case 2:
      case 3:
        id v12 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v13 = (__CFString *)(id)[v12 localizedStringForKey:@"UPDATE_NOW" value:&stru_26DCD7690 table:@"Software Update"];

        goto LABEL_12;
      case 1:
        break;
      case 4:
      case 5:
        id v9 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v13 = (__CFString *)(id)[v9 localizedStringForKey:@"INSTALL_NOW" value:&stru_26DCD7690 table:@"Software Update"];

        goto LABEL_12;
      case 6:
      case 7:
        id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v13 = (__CFString *)(id)[v10 localizedStringForKey:@"DOWNLOADING_IN_PROGRESS" value:&stru_26DCD7690 table:@"Software Update"];

        goto LABEL_12;
      case 8:
        id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v13 = (__CFString *)(id)[v11 localizedStringForKey:@"PAUSED" value:&stru_26DCD7690 table:@"Software Update"];

        goto LABEL_12;
      case 9:
      case 10:
        id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v13 = (__CFString *)(id)[v8 localizedStringForKey:@"INSTALLING" value:&stru_26DCD7690 table:@"Software Update"];

        goto LABEL_12;
      default:
        JUMPOUT(0);
    }
  }
  id v13 = &stru_26DCD7690;
LABEL_12:
  return v13;
}

- (NSString)actionString
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v6 = self;
  v5[1] = (id)a2;
  if (PSIsRunningInAssistant())
  {
    v5[0] = [(SUSUISoftwareUpdateManager *)v6 actionStringForBuddy];
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateManager actionString]", (uint64_t)v5[0]);
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v8, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v7 = (NSString *)v5[0];
    objc_storeStrong(v5, 0);
  }
  else
  {
    id v7 = v6->_actionString;
  }
  float v2 = v7;
  return v2;
}

- (void)_setState:(int)a3 preferredUpdateError:(id)a4 alternateUpdateError:(id)a5
{
  id obj = a5;
  v99 = "-[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:]";
  uint64_t v175 = *MEMORY[0x263EF8340];
  id v172 = self;
  SEL v171 = a2;
  unsigned int v170 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v168 = 0;
  objc_storeStrong(&v168, obj);
  if (*((unsigned char *)v172 + 51))
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)v95 = type;
      id v96 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      id v97 = v96;
      id v165 = v97;
      int v98 = *((_DWORD *)v172 + 22);
      BOOL v5 = *((void *)v172 + 15) == 0;
      char v163 = 0;
      if (v5)
      {
        v93 = @"N/A";
      }
      else
      {
        id v164 = (id)[*((id *)v172 + 15) humanReadableUpdateName];
        char v163 = 1;
        v93 = (__CFString *)v164;
      }
      v90 = v93;
      uint64_t v91 = *((void *)v172 + 15);
      uint64_t v92 = *((void *)v172 + 20);
      BOOL v6 = *((void *)v172 + 16) == 0;
      char v161 = 0;
      if (v6)
      {
        v89 = @"N/A";
      }
      else
      {
        id v162 = (id)[*((id *)v172 + 16) humanReadableUpdateName];
        char v161 = 1;
        v89 = (__CFString *)v162;
      }
      v85 = v89;
      uint64_t v86 = *((void *)v172 + 16);
      uint64_t v87 = *((void *)v172 + 21);
      uint64_t v88 = *((void *)v172 + 1);
      BOOL v7 = *((void *)v172 + 1) == 0;
      char v159 = 0;
      char v157 = 0;
      char v155 = 0;
      if (v7
        || (v160 = (id)[*((id *)v172 + 1) descriptor], char v159 = 1, !v160))
      {
        v84 = @"N/A";
      }
      else
      {
        id v158 = (id)[*((id *)v172 + 1) descriptor];
        int v83 = 1;
        char v157 = 1;
        id v156 = (id)[v158 humanReadableUpdateName];
        char v155 = 1;
        v84 = (__CFString *)v156;
      }
      v80 = v84;
      id WeakRetained = objc_loadWeakRetained((id *)v172 + 13);
      id v82 = objc_loadWeakRetained((id *)v172 + 13);
      char v153 = 0;
      char v151 = 0;
      if (v82)
      {
        id v154 = objc_loadWeakRetained((id *)v172 + 13);
        int v78 = 1;
        char v153 = 1;
        id v8 = (objc_class *)objc_opt_class();
        id v152 = NSStringFromClass(v8);
        char v151 = 1;
        v79 = (__CFString *)v152;
      }
      else
      {
        v79 = @"N/A";
      }
      v75 = v79;
      id v76 = objc_loadWeakRetained((id *)v172 + 14);
      id v77 = objc_loadWeakRetained((id *)v172 + 14);
      char v149 = 0;
      char v147 = 0;
      if (v77)
      {
        id v150 = objc_loadWeakRetained((id *)v172 + 14);
        int v73 = 1;
        char v149 = 1;
        uint64_t v9 = (objc_class *)objc_opt_class();
        id v148 = NSStringFromClass(v9);
        char v147 = 1;
        v74 = (__CFString *)v148;
      }
      else
      {
        v74 = @"N/A";
      }
      v66 = v74;
      id v72 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      id v67 = v72;
      id v146 = v67;
      int v68 = *((_DWORD *)v172 + 22);
      id v71 = SUSUISoftwareUpdateStateToString(v170);
      id v145 = v71;
      v69 = &v15;
      buf = v174;
      __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0((uint64_t)v174, (uint64_t)v99, (uint64_t)v97, v98, (uint64_t)v90, v91, v92, (uint64_t)v85, v86, v87, v88, (uint64_t)v80, (uint64_t)WeakRetained, (uint64_t)v75, (uint64_t)v76, (uint64_t)v74, (uint64_t)v67, v68, (uint64_t)v145,
        v170);
      _os_log_impl(&dword_228401000, log, v95[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nSkipping setting state due to initial scan. _state: %{public}@ (%d), new state: %{public}@ (%d)", buf, 0xB4u);

      if (v147) {
      if (v149)
      }

      if (v151) {
      if (v153)
      }

      if (v155) {
      if (v157)
      }

      if (v159) {
      if (v161)
      }

      if (v163) {
      id v65 = 0;
      }
      objc_storeStrong(&v145, 0);
      objc_storeStrong(&v146, v65);
      objc_storeStrong(&v165, v65);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v144 = 1;
  }
  else
  {
    os_log_t v143 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v142 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v60 = v143;
      *(_DWORD *)v61 = v142;
      id v62 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      id v63 = v62;
      id v141 = v63;
      int v64 = *((_DWORD *)v172 + 22);
      BOOL v10 = *((void *)v172 + 15) == 0;
      char v139 = 0;
      if (v10)
      {
        id v59 = @"N/A";
      }
      else
      {
        id v140 = (id)[*((id *)v172 + 15) humanReadableUpdateName];
        char v139 = 1;
        id v59 = (__CFString *)v140;
      }
      v56 = v59;
      uint64_t v57 = *((void *)v172 + 15);
      uint64_t v58 = *((void *)v172 + 20);
      BOOL v11 = *((void *)v172 + 16) == 0;
      char v137 = 0;
      if (v11)
      {
        id v55 = @"N/A";
      }
      else
      {
        id v138 = (id)[*((id *)v172 + 16) humanReadableUpdateName];
        char v137 = 1;
        id v55 = (__CFString *)v138;
      }
      id v51 = v55;
      uint64_t v52 = *((void *)v172 + 16);
      uint64_t v53 = *((void *)v172 + 21);
      uint64_t v54 = *((void *)v172 + 1);
      BOOL v12 = *((void *)v172 + 1) == 0;
      char v135 = 0;
      char v133 = 0;
      char v131 = 0;
      if (v12
        || (v136 = (id)[*((id *)v172 + 1) descriptor], char v135 = 1, !v136))
      {
        char v50 = @"N/A";
      }
      else
      {
        id v134 = (id)[*((id *)v172 + 1) descriptor];
        int v49 = 1;
        char v133 = 1;
        id v132 = (id)[v134 humanReadableUpdateName];
        char v131 = 1;
        char v50 = (__CFString *)v132;
      }
      char v46 = v50;
      id v47 = objc_loadWeakRetained((id *)v172 + 13);
      id v48 = objc_loadWeakRetained((id *)v172 + 13);
      char v129 = 0;
      char v127 = 0;
      if (v48)
      {
        id v130 = objc_loadWeakRetained((id *)v172 + 13);
        int v44 = 1;
        char v129 = 1;
        id v13 = (objc_class *)objc_opt_class();
        id v128 = NSStringFromClass(v13);
        char v127 = 1;
        v45 = (__CFString *)v128;
      }
      else
      {
        v45 = @"N/A";
      }
      v41 = v45;
      id v42 = objc_loadWeakRetained((id *)v172 + 14);
      id v43 = objc_loadWeakRetained((id *)v172 + 14);
      char v125 = 0;
      char v123 = 0;
      if (v43)
      {
        id v126 = objc_loadWeakRetained((id *)v172 + 14);
        int v39 = 1;
        char v125 = 1;
        char v14 = (objc_class *)objc_opt_class();
        id v124 = NSStringFromClass(v14);
        char v123 = 1;
        char v40 = (__CFString *)v124;
      }
      else
      {
        char v40 = @"N/A";
      }
      char v32 = v40;
      id v38 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v172 + 22));
      id v33 = v38;
      id v122 = v33;
      int v34 = *((_DWORD *)v172 + 22);
      id v37 = SUSUISoftwareUpdateStateToString(v170);
      id v121 = v37;
      id v35 = &v15;
      char v36 = v173;
      __os_log_helper_16_2_21_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_4_0_8_66_8_66((uint64_t)v173, (uint64_t)v99, (uint64_t)v63, v64, (uint64_t)v56, v57, v58, (uint64_t)v51, v52, v53, v54, (uint64_t)v46, (uint64_t)v47, (uint64_t)v41, (uint64_t)v42, (uint64_t)v40, (uint64_t)v33, v34, (uint64_t)v121,
        v170,
        (uint64_t)location,
        (uint64_t)v168);
      _os_log_impl(&dword_228401000, v60, v61[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nAssigning new state: %{public}@ (%d) -> %{public}@ (%d). preferredUpdateError: %{public}@, alternateUpdateError: %{public}@", v36, 0xC8u);

      if (v123) {
      if (v125)
      }

      if (v127) {
      if (v129)
      }

      if (v131) {
      if (v133)
      }

      if (v135) {
      if (v137)
      }

      if (v139) {
      id v31 = 0;
      }
      objc_storeStrong(&v121, 0);
      objc_storeStrong(&v122, v31);
      objc_storeStrong(&v141, v31);
    }
    objc_storeStrong((id *)&v143, 0);
    int v120 = 0;
    int v120 = *((_DWORD *)v172 + 22);
    id v119 = *((id *)v172 + 20);
    id v118 = *((id *)v172 + 29);
    id v117 = *((id *)v172 + 21);
    id v116 = *((id *)v172 + 30);
    char v30 = (id *)&v107;
    uint64_t v107 = MEMORY[0x263EF8330];
    int v108 = -1073741824;
    int v109 = 0;
    v110 = __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke;
    v111 = &unk_264840838;
    char v23 = (id *)v112;
    v112[0] = v172;
    unsigned int v113 = v170;
    char v24 = v30 + 5;
    v112[1] = v119;
    id v25 = v30 + 6;
    v112[2] = v118;
    char v26 = v30 + 7;
    v112[3] = v117;
    id v27 = v30 + 8;
    v112[4] = v116;
    char v28 = v30 + 9;
    v112[5] = location;
    id v29 = v30 + 10;
    v112[6] = v168;
    int v114 = v120;
    id v115 = (id)MEMORY[0x22A697370](v30);
    if (v170 < 5)
    {
      (*((void (**)(void))v115 + 2))();
    }
    else
    {
      id v21 = v172;
      id v18 = location;
      id v19 = v168;
      char v20 = &v101;
      uint64_t v101 = MEMORY[0x263EF8330];
      int v102 = -1073741824;
      int v103 = 0;
      v104 = __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_2;
      v105 = &unk_26483BAE0;
      id v22 = &v106;
      id v106 = v115;
      [v21 refreshErrors:v18 alternateError:v19 completion:v20];
      objc_storeStrong(v22, 0);
    }
    id v17 = 0;
    objc_storeStrong(&v115, 0);
    objc_storeStrong(v29, v17);
    objc_storeStrong(v28, v17);
    objc_storeStrong(v27, v17);
    objc_storeStrong(v26, v17);
    objc_storeStrong(v25, v17);
    objc_storeStrong(v24, v17);
    objc_storeStrong(v23, v17);
    objc_storeStrong(&v116, v17);
    objc_storeStrong(&v117, v17);
    objc_storeStrong(&v118, v17);
    objc_storeStrong(&v119, v17);
    int v144 = 0;
  }
  id v16 = 0;
  objc_storeStrong(&v168, 0);
  objc_storeStrong(&location, v16);
}

void __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke(uint64_t a1)
{
  uint64_t v60 = a1;
  v61 = "-[SUSUISoftwareUpdateManager _setState:preferredUpdateError:alternateUpdateError:]_block_invoke";
  uint64_t v93 = *MEMORY[0x263EF8340];
  v91[2] = (id)a1;
  v91[1] = (id)a1;
  if (*(_DWORD *)(*(void *)(a1 + 32) + 88) == *(_DWORD *)(a1 + 88)
    && ([*(id *)(v60 + 32) errorsAreEqual:*(void *)(*(void *)(v60 + 32) + 160) error2:*(void *)(v60 + 40) oldDescription:*(void *)(v60 + 48)] & 1) != 0&& (objc_msgSend(*(id *)(v60 + 32), "errorsAreEqual:error2:oldDescription:", *(void *)(*(void *)(v60 + 32) + 168), *(void *)(v60 + 56), *(void *)(v60 + 64)) & 1) != 0)
  {
    v91[0] = _SUSUILoggingFacility();
    unsigned __int8 v90 = 0;
    if (os_log_type_enabled((os_log_t)v91[0], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)v91[0];
      *(_DWORD *)os_log_type_t type = v90;
      id v57 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v60 + 32) + 88));
      id v58 = v57;
      id v89 = v58;
      int v59 = *(_DWORD *)(*(void *)(v60 + 32) + 88);
      BOOL v1 = *(void *)(*(void *)(v60 + 32) + 120) == 0;
      char v87 = 0;
      if (v1)
      {
        uint64_t v54 = @"N/A";
      }
      else
      {
        id v88 = (id)[*(id *)(*(void *)(v60 + 32) + 120) humanReadableUpdateName];
        char v87 = 1;
        uint64_t v54 = (__CFString *)v88;
      }
      id v51 = v54;
      uint64_t v52 = *(void *)(*(void *)(v60 + 32) + 120);
      uint64_t v53 = *(void *)(*(void *)(v60 + 32) + 160);
      BOOL v2 = *(void *)(*(void *)(v60 + 32) + 128) == 0;
      char v85 = 0;
      if (v2)
      {
        char v50 = @"N/A";
      }
      else
      {
        id v86 = (id)[*(id *)(*(void *)(v60 + 32) + 128) humanReadableUpdateName];
        char v85 = 1;
        char v50 = (__CFString *)v86;
      }
      char v46 = v50;
      uint64_t v47 = *(void *)(*(void *)(v60 + 32) + 128);
      uint64_t v48 = *(void *)(*(void *)(v60 + 32) + 168);
      uint64_t v49 = *(void *)(*(void *)(v60 + 32) + 8);
      BOOL v3 = *(void *)(*(void *)(v60 + 32) + 8) == 0;
      char v83 = 0;
      char v81 = 0;
      char v79 = 0;
      if (v3
        || (v84 = (id)[*(id *)(*(void *)(v60 + 32) + 8) descriptor], char v83 = 1, !v84))
      {
        v45 = @"N/A";
      }
      else
      {
        id v82 = (id)[*(id *)(*(void *)(v60 + 32) + 8) descriptor];
        int v44 = 1;
        char v81 = 1;
        id v80 = (id)[v82 humanReadableUpdateName];
        char v79 = 1;
        v45 = (__CFString *)v80;
      }
      v41 = v45;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 104));
      id v43 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 104));
      char v77 = 0;
      char v75 = 0;
      if (v43)
      {
        id v78 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 104));
        int v39 = 1;
        char v77 = 1;
        uint64_t v4 = (objc_class *)objc_opt_class();
        id v76 = NSStringFromClass(v4);
        char v75 = 1;
        char v40 = (__CFString *)v76;
      }
      else
      {
        char v40 = @"N/A";
      }
      char v36 = v40;
      id v37 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 112));
      id v38 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 112));
      char v73 = 0;
      char v71 = 0;
      if (v38)
      {
        id v74 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 112));
        int v34 = 1;
        char v73 = 1;
        BOOL v5 = (objc_class *)objc_opt_class();
        id v72 = NSStringFromClass(v5);
        char v71 = 1;
        id v35 = (__CFString *)v72;
      }
      else
      {
        id v35 = @"N/A";
      }
      char v30 = v35;
      id v33 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v60 + 32) + 88));
      id location = v33;
      int v6 = *(_DWORD *)(*(void *)(v60 + 32) + 88);
      uint64_t v7 = *(void *)(v60 + 72);
      uint64_t v8 = *(void *)(v60 + 80);
      id v31 = v14;
      buf = v92;
      __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0_8_66_8_66((uint64_t)v92, (uint64_t)v61, (uint64_t)v58, v59, (uint64_t)v51, v52, v53, (uint64_t)v46, v47, v48, v49, (uint64_t)v41, (uint64_t)WeakRetained, (uint64_t)v36, (uint64_t)v37, (uint64_t)v35, (uint64_t)location, v6, v7,
        v8);
      _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nSkipping setting state due to same error. _state: %{public}@ (%d), preferredError: %{public}@ alternateError: %{public}@", buf, 0xB8u);

      if (v71) {
      if (v73)
      }

      if (v75) {
      if (v77)
      }

      if (v79) {
      if (v81)
      }

      if (v83) {
      if (v85)
      }

      if (v87) {
      id obj = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v89, obj);
    }
    objc_storeStrong(v91, 0);
  }
  else
  {
    uint64_t v9 = v60;
    *(_DWORD *)(*(void *)(v60 + 32) + 88) = *(_DWORD *)(v60 + 88);
    LODWORD(v9) = *(_DWORD *)(*(void *)(v9 + 32) + 88);
    BOOL v10 = v9 > 6;
    uint64_t v11 = (v9 - 6);
    uint64_t v28 = v11;
    if (v10)
    {
      uint64_t v13 = v11;
      char v12 = 1;
    }
    else
    {
      uint64_t v13 = v11;
      char v12 = 0;
    }
    if ((v12 & 1) == 0)
    {
      switch(v13)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
          break;
        case 6:
          id v24 = *(id *)(v60 + 32);
          id v25 = (id)[*(id *)(v60 + 32) download];
          objc_msgSend(v24, "_updateDownloadProgressWithDownload:stateFromDownload:");

          break;
        case 7:
          if (*(unsigned char *)(*(void *)(v60 + 32) + 54))
          {
            id v22 = *(id *)(v60 + 32);
            id v23 = (id)[*(id *)(v60 + 32) download];
            objc_msgSend(v22, "_updateDownloadProgressWithDownload:stateFromDownload:");
          }
          else
          {
            [*(id *)(v60 + 32) hidePreferredUpdate];
          }
          break;
        case 8:
          id v26 = *(id *)(v60 + 32);
          id v27 = (id)[*(id *)(v60 + 32) download];
          objc_msgSend(v26, "_updateDownloadProgressWithDownload:stateFromDownload:");

          break;
        default:
          JUMPOUT(0);
      }
    }
    id v20 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 104));
    int v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v19 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 104));
      [v19 manager:*(void *)(v60 + 32) didTransitionToState:*(unsigned int *)(v60 + 88) fromState:*(unsigned int *)(v60 + 92)];
    }
    else
    {
      id v17 = objc_loadWeakRetained((id *)(*(void *)(v60 + 32) + 104));
      int v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        dispatch_queue_t queue = (dispatch_queue_t)MEMORY[0x263EF83A0];
        v14[13] = &v62;
        uint64_t v62 = MEMORY[0x263EF8330];
        int v63 = -1073741824;
        int v64 = 0;
        id v65 = __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_408;
        v66 = &unk_26483BEA0;
        id v16 = &v67;
        id v67 = *(id *)(v60 + 32);
        int v68 = *(_DWORD *)(v60 + 88);
        int v69 = *(_DWORD *)(v60 + 92);
        dispatch_async(queue, &v62);

        objc_storeStrong(&v67, 0);
      }
    }
  }
}

void __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_408(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
  [WeakRetained manager:*(void *)(a1 + 32) didTransitionToState:*(unsigned int *)(a1 + 40) fromState:*(unsigned int *)(a1 + 44) error:*(void *)(*(void *)(a1 + 32) + 160)];
}

uint64_t __82__SUSUISoftwareUpdateManager__setState_preferredUpdateError_alternateUpdateError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2);
}

- (void)setState:(int)a3 withDownloadUpdateError:(id)a4
{
  uint64_t v13 = self;
  SEL v12 = a2;
  unsigned int v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  uint64_t v8 = [(SUSUISoftwareUpdateManager *)v13 download];
  uint64_t v7 = [(SUDownload *)v8 descriptor];
  char v9 = [(SUDescriptor *)v7 isEqual:v13->_preferredUpdate];

  if (v9)
  {
    [(SUSUISoftwareUpdateManager *)v13 _setState:v11 preferredUpdateError:location alternateUpdateError:v13->_alternateUpdateError];
  }
  else
  {
    BOOL v5 = [(SUSUISoftwareUpdateManager *)v13 download];
    uint64_t v4 = [(SUDownload *)v5 descriptor];
    char v6 = [(SUDescriptor *)v4 isEqual:v13->_alternateUpdate];

    if (v6) {
      [(SUSUISoftwareUpdateManager *)v13 _setState:v11 preferredUpdateError:v13->_preferredUpdateError alternateUpdateError:location];
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)setState:(int)a3
{
}

- (void)setClearingSpaceForDownload:(BOOL)a3
{
  uint64_t v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  dispatch_queue_t queue = self->_concurrentQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __58__SUSUISoftwareUpdateManager_setClearingSpaceForDownload___block_invoke;
  uint64_t v8 = &unk_26483BE00;
  char v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

void __58__SUSUISoftwareUpdateManager_setClearingSpaceForDownload___block_invoke(uint64_t a1)
{
  int v39 = (os_log_t *)&v59;
  uint64_t v40 = a1;
  v41 = "-[SUSUISoftwareUpdateManager setClearingSpaceForDownload:]_block_invoke";
  uint64_t v64 = *MEMORY[0x263EF8340];
  v62[2] = (id)a1;
  v62[1] = (id)a1;
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 53) & 1) != (*(unsigned char *)(a1 + 40) & 1))
  {
    BOOL v1 = _SUSUILoggingFacility();
    BOOL v2 = v39;
    v39[3] = v1;
    unsigned __int8 v61 = 0;
    if (os_log_type_enabled(v2[3], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v39[3];
      *(_DWORD *)os_log_type_t type = v61;
      id v36 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v40 + 32) + 88));
      BOOL v3 = v36;
      uint64_t v4 = v40;
      uint64_t v37 = (uint64_t)v3;
      v39[1] = v3;
      int v38 = *(_DWORD *)(*(void *)(v4 + 32) + 88);
      LOBYTE(v4) = *(void *)(*(void *)(v4 + 32) + 120) == 0;
      char v58 = 0;
      if (v4)
      {
        id v33 = @"N/A";
      }
      else
      {
        int v5 = (__CFString *)(id)[*(id *)(*(void *)(v40 + 32) + 120) humanReadableUpdateName];
        *int v39 = (os_log_t)v5;
        char v58 = 1;
        id v33 = v5;
      }
      char v30 = v33;
      uint64_t v31 = *(void *)(*(void *)(v40 + 32) + 120);
      uint64_t v32 = *(void *)(*(void *)(v40 + 32) + 160);
      BOOL v6 = *(void *)(*(void *)(v40 + 32) + 128) == 0;
      char v56 = 0;
      if (v6)
      {
        id v29 = @"N/A";
      }
      else
      {
        id v57 = (__CFString *)(id)[*(id *)(*(void *)(v40 + 32) + 128) humanReadableUpdateName];
        char v56 = 1;
        id v29 = v57;
      }
      id v25 = v29;
      uint64_t v26 = *(void *)(*(void *)(v40 + 32) + 128);
      uint64_t v27 = *(void *)(*(void *)(v40 + 32) + 168);
      uint64_t v28 = *(void *)(*(void *)(v40 + 32) + 8);
      BOOL v7 = *(void *)(*(void *)(v40 + 32) + 8) == 0;
      char v54 = 0;
      char v52 = 0;
      char v50 = 0;
      if (v7
        || (v55 = (id)[*(id *)(*(void *)(v40 + 32) + 8) descriptor], char v54 = 1, !v55))
      {
        id v24 = @"N/A";
      }
      else
      {
        id v53 = (id)[*(id *)(*(void *)(v40 + 32) + 8) descriptor];
        int v23 = 1;
        char v52 = 1;
        id v51 = (id)[v53 humanReadableUpdateName];
        char v50 = 1;
        id v24 = (__CFString *)v51;
      }
      id v20 = v24;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v40 + 32) + 104));
      id v22 = objc_loadWeakRetained((id *)(*(void *)(v40 + 32) + 104));
      char v48 = 0;
      char v46 = 0;
      if (v22)
      {
        id v49 = objc_loadWeakRetained((id *)(*(void *)(v40 + 32) + 104));
        int v18 = 1;
        char v48 = 1;
        uint64_t v8 = (objc_class *)objc_opt_class();
        id v47 = NSStringFromClass(v8);
        char v46 = 1;
        id v19 = (__CFString *)v47;
      }
      else
      {
        id v19 = @"N/A";
      }
      uint64_t v15 = v19;
      id v16 = objc_loadWeakRetained((id *)(*(void *)(v40 + 32) + 112));
      id v17 = objc_loadWeakRetained((id *)(*(void *)(v40 + 32) + 112));
      char v44 = 0;
      char v42 = 0;
      if (v17)
      {
        id v45 = objc_loadWeakRetained((id *)(*(void *)(v40 + 32) + 112));
        int v13 = 1;
        char v44 = 1;
        char v9 = (objc_class *)objc_opt_class();
        id v43 = NSStringFromClass(v9);
        char v42 = 1;
        char v14 = (__CFString *)v43;
      }
      else
      {
        char v14 = @"N/A";
      }
      BOOL v10 = @"YES";
      if ((*(unsigned char *)(v40 + 40) & 1) == 0) {
        BOOL v10 = @"NO";
      }
      v11[9] = (uint8_t *)v11;
      buf = v63;
      __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66((uint64_t)v63, (uint64_t)v41, v37, v38, (uint64_t)v30, v31, v32, (uint64_t)v25, v26, v27, v28, (uint64_t)v20, (uint64_t)WeakRetained, (uint64_t)v15, (uint64_t)v16, (uint64_t)v14, (uint64_t)v10);
      _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdating _clearingSpaceForDownload to %{public}@", buf, 0x9Eu);
      if (v42) {

      }
      if (v44) {
      if (v46)
      }

      if (v48) {
      if (v50)
      }

      if (v52) {
      if (v54)
      }

      if (v56) {
      if (v58)
      }

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(v62, 0);
    *(unsigned char *)(*(void *)(v40 + 32) + 53) = *(unsigned char *)(v40 + 40) & 1;
  }
}

- (BOOL)clearingSpaceForDownload
{
  id v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  dispatch_queue_t queue = self->_concurrentQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __54__SUSUISoftwareUpdateManager_clearingSpaceForDownload__block_invoke;
  char v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __54__SUSUISoftwareUpdateManager_clearingSpaceForDownload__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 53) & 1;
  return result;
}

- (void)checkAndSetReadyToInstall
{
  char v15 = self;
  SEL v14 = a2;
  int state = 0;
  int state = self->_state;
  id v12 = objc_alloc_init(MEMORY[0x263F781E8]);
  uint64_t v2 = [(SUSUISoftwareUpdateManager *)v15 ignorableConstraints];
  [v12 setIgnorableConstraints:v2];
  suClient = v15->_suClient;
  id v3 = v12;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __55__SUSUISoftwareUpdateManager_checkAndSetReadyToInstall__block_invoke;
  char v9 = &unk_264840860;
  BOOL v10 = v15;
  int v11 = state;
  -[SUSUISoftwareUpdateClientManager isUpdateReadyForInstallationWithOptions:completion:](suClient, "isUpdateReadyForInstallationWithOptions:completion:", v3);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v12, 0);
}

void __55__SUSUISoftwareUpdateManager_checkAndSetReadyToInstall__block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v41 = a1;
  uint64_t v40 = "-[SUSUISoftwareUpdateManager checkAndSetReadyToInstall]_block_invoke";
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v68 = a1;
  char v67 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v65[1] = (id)v41;
  v65[0] = _SUSUILoggingFacility();
  unsigned __int8 v64 = 0;
  if (os_log_type_enabled((os_log_t)v65[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v65[0];
    *(_DWORD *)os_log_type_t type = v64;
    id v37 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v41 + 32) + 88));
    id v38 = v37;
    id v63 = v38;
    int v39 = *(_DWORD *)(*(void *)(v41 + 32) + 88);
    BOOL v3 = *(void *)(*(void *)(v41 + 32) + 120) == 0;
    char v61 = 0;
    if (v3)
    {
      int v34 = @"N/A";
    }
    else
    {
      uint64_t v62 = (__CFString *)(id)[*(id *)(*(void *)(v41 + 32) + 120) humanReadableUpdateName];
      char v61 = 1;
      int v34 = v62;
    }
    uint64_t v31 = v34;
    uint64_t v32 = *(void *)(*(void *)(v41 + 32) + 120);
    uint64_t v33 = *(void *)(*(void *)(v41 + 32) + 160);
    BOOL v4 = *(void *)(*(void *)(v41 + 32) + 128) == 0;
    char v59 = 0;
    if (v4)
    {
      char v30 = @"N/A";
    }
    else
    {
      id v60 = (id)[*(id *)(*(void *)(v41 + 32) + 128) humanReadableUpdateName];
      char v59 = 1;
      char v30 = (__CFString *)v60;
    }
    uint64_t v26 = v30;
    uint64_t v27 = *(void *)(*(void *)(v41 + 32) + 128);
    uint64_t v28 = *(void *)(*(void *)(v41 + 32) + 168);
    uint64_t v29 = *(void *)(*(void *)(v41 + 32) + 8);
    BOOL v5 = *(void *)(*(void *)(v41 + 32) + 8) == 0;
    char v57 = 0;
    char v55 = 0;
    char v53 = 0;
    if (v5
      || (id v58 = (id)[*(id *)(*(void *)(v41 + 32) + 8) descriptor],
          char v57 = 1,
          !v58))
    {
      id v25 = @"N/A";
    }
    else
    {
      id v56 = (id)[*(id *)(*(void *)(v41 + 32) + 8) descriptor];
      int v24 = 1;
      char v55 = 1;
      id v54 = (id)[v56 humanReadableUpdateName];
      char v53 = 1;
      id v25 = (__CFString *)v54;
    }
    int v21 = v25;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v41 + 32) + 104));
    id v23 = objc_loadWeakRetained((id *)(*(void *)(v41 + 32) + 104));
    char v51 = 0;
    char v49 = 0;
    if (v23)
    {
      id v52 = objc_loadWeakRetained((id *)(*(void *)(v41 + 32) + 104));
      int v19 = 1;
      char v51 = 1;
      int v6 = (objc_class *)objc_opt_class();
      id v50 = NSStringFromClass(v6);
      char v49 = 1;
      id v20 = (__CFString *)v50;
    }
    else
    {
      id v20 = @"N/A";
    }
    SEL v16 = v20;
    id v17 = objc_loadWeakRetained((id *)(*(void *)(v41 + 32) + 112));
    id v18 = objc_loadWeakRetained((id *)(*(void *)(v41 + 32) + 112));
    char v47 = 0;
    char v45 = 0;
    if (v18)
    {
      id v48 = objc_loadWeakRetained((id *)(*(void *)(v41 + 32) + 112));
      int v14 = 1;
      char v47 = 1;
      int v7 = (objc_class *)objc_opt_class();
      id v46 = NSStringFromClass(v7);
      char v45 = 1;
      char v15 = (__CFString *)v46;
    }
    else
    {
      char v15 = @"N/A";
    }
    id v12 = &v9;
    buf = v69;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66((uint64_t)v69, (uint64_t)v40, (uint64_t)v38, v39, (uint64_t)v31, v32, v33, (uint64_t)v26, v27, v28, v29, (uint64_t)v21, (uint64_t)WeakRetained, (uint64_t)v16, (uint64_t)v17, (uint64_t)v15, v67 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisReady: %d; error: %{public}@",
      buf,
      0xA4u);
    if (v45) {

    }
    if (v47) {
    if (v49)
    }

    if (v51) {
    if (v53)
    }

    if (v55) {
    if (v57)
    }

    if (v59) {
    if (v61)
    }

    objc_storeStrong(&v63, 0);
  }
  objc_storeStrong(v65, 0);
  if (*(_DWORD *)(*(void *)(v41 + 32) + 88) == *(_DWORD *)(v41 + 40))
  {
    if (location)
    {
      unsigned int v44 = 0;
      BOOL v10 = &v43;
      id v43 = 0;
      uint64_t v8 = *(void **)(v41 + 32);
      id obja = 0;
      int v11 = [v8 shouldSetStateForInstallError:location outError:&obja outState:&v44];
      objc_storeStrong(v10, obja);
      if (v11) {
        [*(id *)(v41 + 32) setState:v44 withDownloadUpdateError:v43];
      }
      objc_storeStrong(&v43, 0);
    }
    else
    {
      [*(id *)(v41 + 32) setState:10 withDownloadUpdateError:0];
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)runEntryScan:(BOOL)a3
{
  BOOL v3 = a3;
  -[SUSUISoftwareUpdateManager setState:](self, "setState:");
  self->_runningInitialScan = v3;
  self->_userInitiatedRescan = 0;
  [(SUSUISoftwareUpdateManager *)self scanForUpdatesCompletion:0];
}

- (void)refreshState
{
  unsigned int v44 = "-[SUSUISoftwareUpdateManager refreshState]";
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v74 = self;
  v73[1] = (id)a2;
  v73[0] = _SUSUILoggingFacility();
  unsigned __int8 v72 = 0;
  if (os_log_type_enabled((os_log_t)v73[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v73[0];
    *(_DWORD *)os_log_type_t type = v72;
    id v41 = SUSUISoftwareUpdateStateToString(v74->_state);
    id v42 = v41;
    id location = v42;
    int state = v74->_state;
    BOOL v2 = v74->_preferredUpdate == 0;
    char v69 = 0;
    if (v2)
    {
      id v38 = @"N/A";
    }
    else
    {
      uint64_t v70 = (__CFString *)(id)[(SUDescriptor *)v74->_preferredUpdate humanReadableUpdateName];
      char v69 = 1;
      id v38 = v70;
    }
    id v35 = v38;
    preferredUpdate = v74->_preferredUpdate;
    preferredUpdateError = v74->_preferredUpdateError;
    BOOL v3 = v74->_alternateUpdate == 0;
    char v67 = 0;
    if (v3)
    {
      int v34 = @"N/A";
    }
    else
    {
      uint64_t v68 = (__CFString *)(id)[(SUDescriptor *)v74->_alternateUpdate humanReadableUpdateName];
      char v67 = 1;
      int v34 = v68;
    }
    char v30 = v34;
    alternateUpdate = v74->_alternateUpdate;
    alternateUpdateError = v74->_alternateUpdateError;
    download = v74->_download;
    BOOL v4 = v74->_download == 0;
    char v65 = 0;
    char v63 = 0;
    char v61 = 0;
    if (v4
      || (v66 = [(SUDownload *)v74->_download descriptor], char v65 = 1, !v66))
    {
      uint64_t v29 = @"N/A";
    }
    else
    {
      id v64 = [(SUDownload *)v74->_download descriptor];
      int v28 = 1;
      char v63 = 1;
      id v62 = (id)[v64 humanReadableUpdateName];
      char v61 = 1;
      uint64_t v29 = (__CFString *)v62;
    }
    id v25 = v29;
    id WeakRetained = objc_loadWeakRetained((id *)&v74->_delegate);
    id v27 = objc_loadWeakRetained((id *)&v74->_delegate);
    char v59 = 0;
    char v57 = 0;
    if (v27)
    {
      id v60 = objc_loadWeakRetained((id *)&v74->_delegate);
      int v23 = 1;
      char v59 = 1;
      BOOL v5 = (objc_class *)objc_opt_class();
      id v58 = NSStringFromClass(v5);
      char v57 = 1;
      int v24 = (__CFString *)v58;
    }
    else
    {
      int v24 = @"N/A";
    }
    id v20 = v24;
    id v21 = objc_loadWeakRetained((id *)&v74->_hostController);
    id v22 = objc_loadWeakRetained((id *)&v74->_hostController);
    char v55 = 0;
    char v53 = 0;
    if (v22)
    {
      id v56 = objc_loadWeakRetained((id *)&v74->_hostController);
      int v18 = 1;
      char v55 = 1;
      int v6 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v6);
      char v53 = 1;
      int v19 = (__CFString *)v54;
    }
    else
    {
      int v19 = @"N/A";
    }
    SEL v16 = &v7;
    buf = v76;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v76, (uint64_t)v44, (uint64_t)v42, state, (uint64_t)v35, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v30, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if (v53) {

    }
    if (v55) {
    if (v57)
    }

    if (v59) {
    if (v61)
    }

    if (v63) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v73, 0);
  id v14 = (id)[MEMORY[0x263F77DA0] sharedDevice];
  int v15 = [v14 hasSemiSplatActive];

  if (v15)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v51 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v11 = oslog;
      *(_DWORD *)id v12 = v51;
      int v13 = v75;
      __os_log_helper_16_2_1_8_32((uint64_t)v75, (uint64_t)v44);
      _os_log_impl(&dword_228401000, v11, v12[0], "%s: Rollback already applied, show the user an alert to reboot, and show no available updates", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(SUSUISoftwareUpdateManager *)v74 clearPastScanResults];
    [(SUSUISoftwareUpdateManager *)v74 setState:3];
    [(SUSUISoftwareUpdateManager *)v74 handleRollbackApplied];
  }
  else
  {
    if (!v74->_state) {
      [(SUSUISoftwareUpdateManager *)v74 setState:1];
    }
    suClient = v74->_suClient;
    uint64_t v8 = &v45;
    uint64_t v45 = MEMORY[0x263EF8330];
    int v46 = -1073741824;
    int v47 = 0;
    id v48 = __42__SUSUISoftwareUpdateManager_refreshState__block_invoke;
    char v49 = &unk_264840888;
    BOOL v10 = (id *)&v50;
    id v50 = v74;
    [(SUSUISoftwareUpdateClientManager *)suClient download:v8];
    objc_storeStrong(v10, 0);
  }
}

void __42__SUSUISoftwareUpdateManager_refreshState__block_invoke(id *a1, void *a2, void *a3)
{
  char v57 = a1;
  id obj = a3;
  char v55 = "-[SUSUISoftwareUpdateManager refreshState]_block_invoke";
  uint64_t v89 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v86 = 0;
  objc_storeStrong(&v86, obj);
  v85[1] = v57;
  v85[0] = _SUSUILoggingFacility();
  unsigned __int8 v84 = 0;
  if (os_log_type_enabled((os_log_t)v85[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v85[0];
    *(_DWORD *)os_log_type_t type = v84;
    id v52 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v57[4] + 22));
    id v53 = v52;
    id v83 = v53;
    int v54 = *((_DWORD *)v57[4] + 22);
    BOOL v3 = *((void *)v57[4] + 15) == 0;
    char v81 = 0;
    if (v3)
    {
      char v49 = @"N/A";
    }
    else
    {
      id v82 = (id)[*((id *)v57[4] + 15) humanReadableUpdateName];
      char v81 = 1;
      char v49 = (__CFString *)v82;
    }
    int v46 = v49;
    uint64_t v47 = *((void *)v57[4] + 15);
    uint64_t v48 = *((void *)v57[4] + 20);
    BOOL v4 = *((void *)v57[4] + 16) == 0;
    char v79 = 0;
    if (v4)
    {
      uint64_t v45 = @"N/A";
    }
    else
    {
      id v80 = (id)[*((id *)v57[4] + 16) humanReadableUpdateName];
      char v79 = 1;
      uint64_t v45 = (__CFString *)v80;
    }
    id v41 = v45;
    uint64_t v42 = *((void *)v57[4] + 16);
    uint64_t v43 = *((void *)v57[4] + 21);
    uint64_t v44 = *((void *)v57[4] + 1);
    BOOL v5 = *((void *)v57[4] + 1) == 0;
    char v77 = 0;
    char v75 = 0;
    char v73 = 0;
    if (v5
      || (v78 = (id)[*((id *)v57[4] + 1) descriptor], char v77 = 1, !v78))
    {
      uint64_t v40 = @"N/A";
    }
    else
    {
      id v76 = (id)[*((id *)v57[4] + 1) descriptor];
      int v39 = 1;
      char v75 = 1;
      id v74 = (id)[v76 humanReadableUpdateName];
      char v73 = 1;
      uint64_t v40 = (__CFString *)v74;
    }
    id v36 = v40;
    id WeakRetained = objc_loadWeakRetained((id *)v57[4] + 13);
    id v38 = objc_loadWeakRetained((id *)v57[4] + 13);
    char v71 = 0;
    char v69 = 0;
    if (v38)
    {
      id v72 = objc_loadWeakRetained((id *)v57[4] + 13);
      int v34 = 1;
      char v71 = 1;
      int v6 = (objc_class *)objc_opt_class();
      id v70 = NSStringFromClass(v6);
      char v69 = 1;
      id v35 = (__CFString *)v70;
    }
    else
    {
      id v35 = @"N/A";
    }
    uint64_t v31 = v35;
    id v32 = objc_loadWeakRetained((id *)v57[4] + 14);
    id v33 = objc_loadWeakRetained((id *)v57[4] + 14);
    char v67 = 0;
    char v65 = 0;
    if (v33)
    {
      id v68 = objc_loadWeakRetained((id *)v57[4] + 14);
      int v29 = 1;
      char v67 = 1;
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v66 = NSStringFromClass(v7);
      char v65 = 1;
      char v30 = (__CFString *)v66;
    }
    else
    {
      char v30 = @"N/A";
    }
    int v24 = v30;
    id v25 = location[0];
    id v28 = (id)[location[0] descriptor];
    id v64 = v28;
    uint64_t v26 = &v8;
    buf = v88;
    __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0_8_66((uint64_t)v88, (uint64_t)v55, (uint64_t)v53, v54, (uint64_t)v46, v47, v48, (uint64_t)v41, v42, v43, v44, (uint64_t)v36, (uint64_t)WeakRetained, (uint64_t)v31, (uint64_t)v32, (uint64_t)v30, (uint64_t)v25, (uint64_t)v64, (uint64_t)v86);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ndownload: %p (owner SUDescriptor: %p), error: %{public}@", buf, 0xB2u);

    if (v65) {
    if (v67)
    }

    if (v69) {
    if (v71)
    }

    if (v73) {
    if (v75)
    }

    if (v77) {
    if (v79)
    }

    if (v81) {
    id v23 = 0;
    }
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v83, v23);
  }
  objc_storeStrong(v85, 0);
  [v57[4] setDownload:location[0]];
  if (location[0])
  {
    id v16 = (id)*((void *)v57[4] + 8);
    id v18 = (id)[location[0] downloadOptions];
    unsigned int v15 = [v18 downloadFeeAgreementStatus];
    id v17 = (id)[location[0] descriptor];
    objc_msgSend(v16, "setCellularFeeAgreementStatus:forUpdate:", v15);

    id v20 = (id)*((void *)v57[4] + 8);
    id v22 = (id)[location[0] downloadOptions];
    unsigned int v19 = [v22 termsAndConditionsAgreementStatus];
    id v21 = (id)[location[0] descriptor];
    objc_msgSend(v20, "setTermsAgreementStatus:forUpdate:", v19);
  }
  id v10 = (id)*((void *)v57[4] + 7);
  uint64_t v9 = &v58;
  uint64_t v58 = MEMORY[0x263EF8330];
  int v59 = -1073741824;
  int v60 = 0;
  char v61 = __42__SUSUISoftwareUpdateManager_refreshState__block_invoke_419;
  id v62 = &unk_26483BD38;
  id v12 = (id *)v63;
  v63[0] = v57[4];
  os_log_t v11 = (id *)(v9 + 5);
  int v13 = location;
  v63[1] = location[0];
  [v10 isScanning:v9];
  id v14 = 0;
  objc_storeStrong(v11, 0);
  objc_storeStrong(v12, v14);
  objc_storeStrong(&v86, v14);
  objc_storeStrong(v13, v14);
}

void __42__SUSUISoftwareUpdateManager_refreshState__block_invoke_419(id *a1, char a2, id obj)
{
  id v56 = &v75;
  char v55 = a1;
  int v54 = "-[SUSUISoftwareUpdateManager refreshState]_block_invoke";
  uint64_t v87 = *MEMORY[0x263EF8340];
  char v85 = a1;
  char v84 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v82[1] = (os_log_t)v55;
  v82[0] = (os_log_t)_SUSUILoggingFacility();
  unsigned __int8 v81 = 0;
  if (os_log_type_enabled(v82[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v56 + 11);
    *(_DWORD *)os_log_type_t type = v81;
    id v51 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v55[4] + 22));
    id v3 = v51;
    BOOL v4 = v55;
    uint64_t v52 = (uint64_t)v3;
    *((void *)v56 + 9) = v3;
    int v53 = *((_DWORD *)v4[4] + 22);
    LOBYTE(v4) = *((void *)v4[4] + 15) == 0;
    char v79 = 0;
    if (v4)
    {
      uint64_t v48 = @"N/A";
    }
    else
    {
      BOOL v5 = (__CFString *)(id)[*((id *)v55[4] + 15) humanReadableUpdateName];
      *((void *)v56 + 8) = v5;
      char v79 = 1;
      uint64_t v48 = v5;
    }
    uint64_t v45 = v48;
    uint64_t v46 = *((void *)v55[4] + 15);
    uint64_t v47 = *((void *)v55[4] + 20);
    BOOL v6 = *((void *)v55[4] + 16) == 0;
    char v78 = 0;
    if (v6)
    {
      uint64_t v44 = @"N/A";
    }
    else
    {
      uint64_t v7 = (__CFString *)(id)[*((id *)v55[4] + 16) humanReadableUpdateName];
      *((void *)v56 + 6) = v7;
      char v78 = 1;
      uint64_t v44 = v7;
    }
    uint64_t v40 = v44;
    uint64_t v41 = *((void *)v55[4] + 16);
    uint64_t v42 = *((void *)v55[4] + 21);
    uint64_t v43 = *((void *)v55[4] + 1);
    BOOL v8 = *((void *)v55[4] + 1) == 0;
    char v77 = 0;
    char v76 = 0;
    char v74 = 0;
    if (v8
      || (id v9 = (id)[*((id *)v55[4] + 1) descriptor],
          *((void *)v56 + 4) = v9,
          char v77 = 1,
          !v9))
    {
      int v39 = @"N/A";
    }
    else
    {
      id v10 = (id)[*((id *)v55[4] + 1) descriptor];
      *((void *)v56 + 2) = v10;
      int v38 = 1;
      char v76 = 1;
      os_log_t v11 = (__CFString *)(id)[v10 humanReadableUpdateName];
      *(void *)id v56 = v11;
      char v74 = 1;
      int v39 = v11;
    }
    id v35 = v39;
    id WeakRetained = objc_loadWeakRetained((id *)v55[4] + 13);
    id v37 = objc_loadWeakRetained((id *)v55[4] + 13);
    char v72 = 0;
    char v70 = 0;
    if (v37)
    {
      id v73 = objc_loadWeakRetained((id *)v55[4] + 13);
      int v33 = 1;
      char v72 = 1;
      id v12 = (objc_class *)objc_opt_class();
      id v71 = NSStringFromClass(v12);
      char v70 = 1;
      int v34 = (__CFString *)v71;
    }
    else
    {
      int v34 = @"N/A";
    }
    char v30 = v34;
    id v31 = objc_loadWeakRetained((id *)v55[4] + 14);
    id v32 = objc_loadWeakRetained((id *)v55[4] + 14);
    char v68 = 0;
    char v66 = 0;
    if (v32)
    {
      id v69 = objc_loadWeakRetained((id *)v55[4] + 14);
      int v28 = 1;
      char v68 = 1;
      int v13 = (objc_class *)objc_opt_class();
      id v67 = NSStringFromClass(v13);
      char v66 = 1;
      int v29 = (__CFString *)v67;
    }
    else
    {
      int v29 = @"N/A";
    }
    uint64_t v14 = *((void *)v56 + 13);
    uint64_t v26 = &v16;
    buf = v86;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66((uint64_t)v86, (uint64_t)v54, v52, v53, (uint64_t)v45, v46, v47, (uint64_t)v40, v41, v42, v43, (uint64_t)v35, (uint64_t)WeakRetained, (uint64_t)v30, (uint64_t)v31, (uint64_t)v29, v84 & 1, v14);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisScanning: %d; error: %{public}@",
      buf,
      0xA4u);
    if (v66) {

    }
    if (v68) {
    if (v70)
    }

    if (v72) {
    if (v74)
    }

    if (v76) {
    if (v77)
    }

    if (v78) {
    if (v79)
    }

    objc_storeStrong(&v80, 0);
  }
  objc_storeStrong((id *)v82, 0);
  id v65 = (id)[v55[4] download];
  if (v84) {
    goto LABEL_58;
  }
  char v63 = 0;
  char v61 = 0;
  char v59 = 0;
  char v57 = 0;
  int v25 = 0;
  if (v65)
  {
    id v23 = (id)[v55[5] descriptor];
    id v64 = v23;
    int v22 = 1;
    char v63 = 1;
    id v62 = (id)[v55[4] preferredUpdate];
    char v61 = v22 & 1;
    char v15 = objc_msgSend(v23, "isEqual:");
    int v24 = 1;
    if ((v15 & 1) == 0)
    {
      id v21 = (id)[v55[5] descriptor];
      id v60 = v21;
      int v20 = 1;
      char v59 = 1;
      id v58 = (id)[v55[4] alternateUpdate];
      char v57 = v20 & 1;
      int v24 = objc_msgSend(v21, "isEqual:");
    }
    int v25 = v24;
  }
  int v19 = v25;
  if (v57) {

  }
  if (v59) {
  if (v61)
  }

  if (v63) {
  if (v19)
  }
  {
    [v55[4] updateStateFromDownload:v65];
    goto LABEL_59;
  }
  if ([v55[4] shouldShowPreferredUpdateAsAlternate])
  {
    [v55[4] setState:6];
    goto LABEL_59;
  }
  id v18 = (id)[v55[4] preferredUpdate];

  if (v18)
  {
    [v55[4] setState:8];
    goto LABEL_59;
  }
  if (*((_DWORD *)v55[4] + 22) != 3 && *((_DWORD *)v55[4] + 22) != 4) {
LABEL_58:
  }
    [v55[4] scanForUpdatesCompletion:0];
LABEL_59:
  id obja = 0;
  objc_storeStrong(&v65, 0);
  objc_storeStrong(&location, obja);
}

- (SUDescriptor)update
{
  BOOL v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)[objc_alloc(MEMORY[0x263F78248]) initWithPreferredDescriptor:v5->_preferredUpdate alternateDescriptor:v5->_alternateUpdate];
  id v3 = (id)[v4[0] latestUpdate];
  objc_storeStrong(v4, 0);
  return (SUDescriptor *)v3;
}

- (void)downloadAlternateHidePreferred
{
}

- (void)hidePreferredUpdate
{
  id v3 = self;
  v2[1] = (id)a2;
  objc_storeStrong((id *)&self->_hiddenPreferredUpdate, self->_preferredUpdate);
  objc_storeStrong((id *)&v3->_preferredUpdate, v3->_alternateUpdate);
  objc_storeStrong((id *)&v3->_alternateUpdate, 0);
  v2[0] = v3->_preferredUpdateError;
  [(SUSUISoftwareUpdateManager *)v3 setPreferredUpdateError:v3->_alternateUpdateError];
  [(SUSUISoftwareUpdateManager *)v3 setAlternateUpdateError:v2[0]];
  v3->_hidingPreferredUpdate = 1;
  objc_storeStrong(v2, 0);
}

- (void)revealHiddenPreferredUpdate
{
  id v3 = self;
  v2[1] = (id)a2;
  objc_storeStrong((id *)&self->_alternateUpdate, self->_preferredUpdate);
  objc_storeStrong((id *)&v3->_preferredUpdate, v3->_hiddenPreferredUpdate);
  objc_storeStrong((id *)&v3->_hiddenPreferredUpdate, 0);
  v2[0] = v3->_preferredUpdateError;
  [(SUSUISoftwareUpdateManager *)v3 setPreferredUpdateError:v3->_alternateUpdateError];
  [(SUSUISoftwareUpdateManager *)v3 setAlternateUpdateError:v2[0]];
  v3->_hidingPreferredUpdate = 0;
  objc_storeStrong(v2, 0);
}

- (void)hideAlternateUpdate
{
  self->_hidingAlternateUpdate = 1;
}

- (void)revealHiddenAlteranteUpdate
{
  self->_hidingAlternateUpdate = 0;
}

- (void)refreshErrors:(id)a3 alternateError:(id)a4 completion:(id)a5
{
  uint64_t v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v23 = 0;
  objc_storeStrong(&v23, a5);
  id v5 = objc_alloc(MEMORY[0x263F781E0]);
  id v22 = (id)[v5 initWithDescriptor:v26->_preferredUpdate];
  objc_msgSend(v22, "setAllowUnrestrictedCellularDownload:", -[SUSUISoftwareUpdateManager allowCellularOverride](v26, "allowCellularOverride"));
  objc_msgSend(v22, "setDownloadFeeAgreementStatus:", -[SUSUIUpdateAgreementManager cellularFeeAgreementStatusForUpdate:](v26->_updateAgreementManager, "cellularFeeAgreementStatusForUpdate:", v26->_preferredUpdate));
  id v6 = objc_alloc(MEMORY[0x263F781E0]);
  id v21 = (id)[v6 initWithDescriptor:v26->_alternateUpdate];
  objc_msgSend(v21, "setAllowUnrestrictedCellularDownload:", -[SUSUISoftwareUpdateManager allowCellularOverride](v26, "allowCellularOverride"));
  objc_msgSend(v21, "setDownloadFeeAgreementStatus:", -[SUSUIUpdateAgreementManager cellularFeeAgreementStatusForUpdate:](v26->_updateAgreementManager, "cellularFeeAgreementStatusForUpdate:", v26->_alternateUpdate));
  suClient = v26->_suClient;
  id v9 = v22;
  id v10 = v21;
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  char v15 = __70__SUSUISoftwareUpdateManager_refreshErrors_alternateError_completion___block_invoke;
  uint64_t v16 = &unk_2648408B0;
  id v17 = v26;
  id v18 = location[0];
  id v19 = v24;
  id v20 = v23;
  -[SUSUISoftwareUpdateClientManager updatesDownloadable:alternateUpdate:completion:](suClient, "updatesDownloadable:alternateUpdate:completion:", v9, v10);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

void __70__SUSUISoftwareUpdateManager_refreshErrors_alternateError_completion___block_invoke(NSObject *a1, char a2, char a3, id obj, void *a5)
{
  id v65 = &v83;
  id v64 = a1;
  id obja = a5;
  id v62 = "-[SUSUISoftwareUpdateManager refreshErrors:alternateError:completion:]_block_invoke";
  uint64_t v93 = *MEMORY[0x263EF8340];
  uint64_t v91 = a1;
  char v90 = a2 & 1;
  char v89 = a3 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v87 = 0;
  objc_storeStrong(&v87, obja);
  v86[1] = v64;
  v86[0] = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v86[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v65 + 3);
    *(_DWORD *)id v58 = type;
    id v59 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v64[4].isa + 22));
    id v5 = v59;
    id v6 = v64;
    uint64_t v60 = (uint64_t)v5;
    *((void *)v65 + 1) = v5;
    int v61 = *((_DWORD *)v6[4].isa + 22);
    LOBYTE(v6) = *((void *)v6[4].isa + 15) == 0;
    char v82 = 0;
    if (v6)
    {
      id v56 = @"N/A";
    }
    else
    {
      uint64_t v7 = (__CFString *)(id)[*((id *)v64[4].isa + 15) humanReadableUpdateName];
      *(void *)id v65 = v7;
      char v82 = 1;
      id v56 = v7;
    }
    int v53 = v56;
    uint64_t v54 = *((void *)v64[4].isa + 15);
    uint64_t v55 = *((void *)v64[4].isa + 20);
    BOOL v8 = *((void *)v64[4].isa + 16) == 0;
    char v80 = 0;
    if (v8)
    {
      uint64_t v52 = @"N/A";
    }
    else
    {
      id v81 = (id)[*((id *)v64[4].isa + 16) humanReadableUpdateName];
      char v80 = 1;
      uint64_t v52 = (__CFString *)v81;
    }
    uint64_t v48 = v52;
    uint64_t v49 = *((void *)v64[4].isa + 16);
    uint64_t v50 = *((void *)v64[4].isa + 21);
    uint64_t v51 = *((void *)v64[4].isa + 1);
    BOOL v9 = *((void *)v64[4].isa + 1) == 0;
    char v78 = 0;
    char v76 = 0;
    char v74 = 0;
    if (v9
      || (id v79 = (id)[*((id *)v64[4].isa + 1) descriptor],
          char v78 = 1,
          !v79))
    {
      uint64_t v47 = @"N/A";
    }
    else
    {
      id v77 = (id)[*((id *)v64[4].isa + 1) descriptor];
      int v46 = 1;
      char v76 = 1;
      id v75 = (id)[v77 humanReadableUpdateName];
      char v74 = 1;
      uint64_t v47 = (__CFString *)v75;
    }
    uint64_t v43 = v47;
    id WeakRetained = objc_loadWeakRetained((id *)v64[4].isa + 13);
    id v45 = objc_loadWeakRetained((id *)v64[4].isa + 13);
    char v72 = 0;
    char v70 = 0;
    if (v45)
    {
      id v73 = objc_loadWeakRetained((id *)v64[4].isa + 13);
      int v41 = 1;
      char v72 = 1;
      id v10 = (objc_class *)objc_opt_class();
      id v71 = NSStringFromClass(v10);
      char v70 = 1;
      uint64_t v42 = (__CFString *)v71;
    }
    else
    {
      uint64_t v42 = @"N/A";
    }
    int v38 = v42;
    id v39 = objc_loadWeakRetained((id *)v64[4].isa + 14);
    id v40 = objc_loadWeakRetained((id *)v64[4].isa + 14);
    char v68 = 0;
    char v66 = 0;
    if (v40)
    {
      id v69 = objc_loadWeakRetained((id *)v64[4].isa + 14);
      int v36 = 1;
      char v68 = 1;
      os_log_t v11 = (objc_class *)objc_opt_class();
      id v67 = NSStringFromClass(v11);
      char v66 = 1;
      id v37 = (__CFString *)v67;
    }
    else
    {
      id v37 = @"N/A";
    }
    uint64_t v12 = *((void *)v65 + 6);
    uint64_t v13 = *((void *)v65 + 5);
    int v34 = &v15;
    buf = v92;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66_4_0_8_66((uint64_t)v92, (uint64_t)v62, v60, v61, (uint64_t)v53, v54, v55, (uint64_t)v48, v49, v50, v51, (uint64_t)v43, (uint64_t)WeakRetained, (uint64_t)v38, (uint64_t)v39, (uint64_t)v37, v90 & 1, v12, v89 & 1,
      v13);
    _os_log_impl(&dword_228401000, log, v58[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\npreferredDownloadable: %d, preferredError: %{public}@, alternateDownloadable: %d, alternateError: %{public}@", buf, 0xB4u);
    if (v66) {

    }
    if (v68) {
    if (v70)
    }

    if (v72) {
    if (v74)
    }

    if (v76) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    objc_storeStrong(&v84, 0);
  }
  objc_storeStrong((id *)v86, 0);
  int v14 = v64;
  *((unsigned char *)v64[4].isa + 48) = v90 & 1;
  *((unsigned char *)v14[4].isa + 49) = v89 & 1;
  id v32 = (id)[(objc_class *)v14[4].isa download];
  id v31 = (id)[v32 progress];
  int v33 = [v31 isDone];

  if (v33)
  {
    id v29 = (id)[(objc_class *)v64[4].isa download];
    id v28 = (id)[v29 descriptor];
    id v27 = (id)[(objc_class *)v64[4].isa preferredUpdate];
    int v30 = objc_msgSend(v28, "isEqual:");

    if (v30)
    {
      objc_storeStrong(&location, 0);
    }
    else
    {
      id v25 = (id)[(objc_class *)v64[4].isa download];
      id v24 = (id)[v25 descriptor];
      id v23 = (id)[(objc_class *)v64[4].isa alternateUpdate];
      int v26 = objc_msgSend(v24, "isEqual:");

      if (v26) {
        objc_storeStrong(&v87, 0);
      }
    }
  }
  Class isa = v64[4].isa;
  Class v22 = v64[5].isa;
  if (v22) {
    uint64_t v20 = (uint64_t)v22;
  }
  else {
    uint64_t v20 = *((void *)v65 + 6);
  }
  [(objc_class *)isa setPreferredUpdateError:v20];
  Class v18 = v64[4].isa;
  Class v19 = v64[6].isa;
  if (v19) {
    uint64_t v17 = (uint64_t)v19;
  }
  else {
    uint64_t v17 = *((void *)v65 + 5);
  }
  [(objc_class *)v18 setAlternateUpdateError:v17];
  if (v64[7].isa) {
    (*((void (**)(void))v64[7].isa + 2))();
  }
  id v16 = 0;
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&location, v16);
}

- (BOOL)errorsAreEqual:(id)a3 error2:(id)a4 oldDescription:(id)a5
{
  uint64_t v20 = self;
  SEL v19 = a2;
  *((void *)&v18 + 1) = 0;
  objc_storeStrong((id *)&v18 + 1, a3);
  *(void *)&long long v18 = 0;
  objc_storeStrong((id *)&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  if (v18 == 0)
  {
    BOOL v21 = 1;
    int v16 = 1;
  }
  else
  {
    id v7 = (id)[*((id *)&v18 + 1) domain];
    id v8 = (id)[(id)v18 domain];
    BOOL v9 = 1;
    if (objc_msgSend(v7, "isEqualToString:"))
    {
      uint64_t v6 = [*((id *)&v18 + 1) code];
      BOOL v9 = v6 != [(id)v18 code];
    }

    if (v9)
    {
      BOOL v21 = 0;
      int v16 = 1;
    }
    else
    {
      char v15 = 0;
      char v14 = 0;
      id v13 = [(SUSUISoftwareUpdateManager *)v20 humanReadableDescriptionForError:*((void *)&v18 + 1) enableButton:&v15];
      id v12 = [(SUSUISoftwareUpdateManager *)v20 humanReadableDescriptionForError:(void)v18 enableButton:&v14];
      if ((v15 & 1) == (v14 & 1))
      {
        if (v13 || v12)
        {
          if (v12 && ([v13 isEqualToString:v12] & 1) != 0)
          {
            BOOL v21 = ([v17 isEqualToString:v13] & 1) != 0;
            int v16 = 1;
          }
          else
          {
            BOOL v21 = 0;
            int v16 = 1;
          }
        }
        else
        {
          BOOL v21 = v17 == 0;
          int v16 = 1;
        }
      }
      else
      {
        BOOL v21 = 0;
        int v16 = 1;
      }
      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v18, 0);
  objc_storeStrong((id *)&v18 + 1, 0);
  return v21;
}

- (void)_requestLayoutSubviews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v2 = objc_loadWeakRetained((id *)&self->_delegate);
    [v2 manager:self needsLayoutSubviewsForState:self->_state];
  }
}

- (void)_batteryStateChanged:(id)a3
{
  id v45 = &v64;
  uint64_t v42 = "-[SUSUISoftwareUpdateManager _batteryStateChanged:]";
  uint64_t v72 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v69 = 0;
  id v43 = (id)[MEMORY[0x263F82670] currentDevice];
  uint64_t v44 = [v43 batteryState];

  uint64_t v69 = v44;
  BOOL v68 = 0;
  BOOL v46 = 1;
  if (v44 != 2) {
    BOOL v46 = *((void *)v45 + 5) == 3;
  }
  BOOL v68 = v46;
  id v3 = _SUSUILoggingFacility();
  char v4 = (os_log_t *)v45;
  *((void *)v45 + 3) = v3;
  unsigned __int8 v66 = 0;
  if (os_log_type_enabled(v4[3], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v45 + 3);
    *(_DWORD *)os_log_type_t type = v66;
    id v39 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v45 + 8) + 88));
    id v5 = v39;
    uint64_t v6 = v45;
    uint64_t v40 = (uint64_t)v5;
    *((void *)v45 + 1) = v5;
    int v41 = *(_DWORD *)(*((void *)v6 + 8) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 8) + 120) == 0;
    char v63 = 0;
    if (v6)
    {
      int v36 = @"N/A";
    }
    else
    {
      id v7 = (__CFString *)(id)[*(id *)(*((void *)v45 + 8) + 120) humanReadableUpdateName];
      *(void *)id v45 = v7;
      char v63 = 1;
      int v36 = v7;
    }
    int v33 = v36;
    uint64_t v34 = *(void *)(*((void *)v45 + 8) + 120);
    uint64_t v35 = *(void *)(*((void *)v45 + 8) + 160);
    BOOL v8 = *(void *)(*((void *)v45 + 8) + 128) == 0;
    char v61 = 0;
    if (v8)
    {
      id v32 = @"N/A";
    }
    else
    {
      id v62 = (id)[*(id *)(*((void *)v45 + 8) + 128) humanReadableUpdateName];
      char v61 = 1;
      id v32 = (__CFString *)v62;
    }
    id v28 = v32;
    uint64_t v29 = *(void *)(*((void *)v45 + 8) + 128);
    uint64_t v30 = *(void *)(*((void *)v45 + 8) + 168);
    uint64_t v31 = *(void *)(*((void *)v45 + 8) + 8);
    BOOL v9 = *(void *)(*((void *)v45 + 8) + 8) == 0;
    char v59 = 0;
    char v57 = 0;
    char v55 = 0;
    if (v9
      || (id v60 = (id)[*(id *)(*((void *)v45 + 8) + 8) descriptor],
          char v59 = 1,
          !v60))
    {
      id v27 = @"N/A";
    }
    else
    {
      id v58 = (id)[*(id *)(*((void *)v45 + 8) + 8) descriptor];
      int v26 = 1;
      char v57 = 1;
      id v56 = (id)[v58 humanReadableUpdateName];
      char v55 = 1;
      id v27 = (__CFString *)v56;
    }
    id v23 = v27;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v45 + 8) + 104));
    id v25 = objc_loadWeakRetained((id *)(*((void *)v45 + 8) + 104));
    char v53 = 0;
    char v51 = 0;
    if (v25)
    {
      id v54 = objc_loadWeakRetained((id *)(*((void *)v45 + 8) + 104));
      int v21 = 1;
      char v53 = 1;
      id v10 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v10);
      char v51 = 1;
      Class v22 = (__CFString *)v52;
    }
    else
    {
      Class v22 = @"N/A";
    }
    long long v18 = v22;
    id v19 = objc_loadWeakRetained((id *)(*((void *)v45 + 8) + 112));
    id v20 = objc_loadWeakRetained((id *)(*((void *)v45 + 8) + 112));
    char v49 = 0;
    char v47 = 0;
    if (v20)
    {
      id v50 = objc_loadWeakRetained((id *)(*((void *)v45 + 8) + 112));
      int v16 = 1;
      char v49 = 1;
      os_log_t v11 = (objc_class *)objc_opt_class();
      id v48 = NSStringFromClass(v11);
      char v47 = 1;
      id v17 = (__CFString *)v48;
    }
    else
    {
      id v17 = @"N/A";
    }
    int v12 = *(unsigned char *)(*((void *)v45 + 8) + 24) & 1;
    v14[9] = (uint8_t *)v14;
    buf = v71;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_4_0((uint64_t)v71, (uint64_t)v42, v40, v41, (uint64_t)v33, v34, v35, (uint64_t)v28, v29, v30, v31, (uint64_t)v23, (uint64_t)WeakRetained, (uint64_t)v18, (uint64_t)v19, (uint64_t)v17, v12, v68);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nBattery state changed: %d -> %d", buf, 0xA0u);
    if (v47) {

    }
    if (v49) {
    if (v51)
    }

    if (v53) {
    if (v55)
    }

    if (v57) {
    if (v59)
    }

    if (v61) {
    if (v63)
    }

    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(&v67, 0);
  if ((*(unsigned char *)(*((void *)v45 + 8) + 24) & 1) != v68)
  {
    id v13 = (id *)v45;
    *(unsigned char *)(*((void *)v45 + 8) + 24) = v68;
    [v13[8] refreshState];
  }
  objc_storeStrong(location, 0);
}

- (void)_batteryLevelChanged:(id)a3
{
  BOOL v46 = &v65;
  uint64_t v44 = "-[SUSUISoftwareUpdateManager _batteryLevelChanged:]";
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  float v47 = 0.2;
  int v71 = 1045220557;
  float v70 = 0.5;
  float batteryLevel = 0.0;
  float batteryLevel = v73->_batteryLevel;
  id v45 = (id)[MEMORY[0x263F82670] currentDevice];
  [v45 batteryLevel];
  id v3 = v45;
  v73->_float batteryLevel = v4;

  if (*(float *)(*((void *)v46 + 8) + 28) < v47 && *((float *)v46 + 9) >= 0.2
    || *(float *)(*((void *)v46 + 8) + 28) >= 0.2 && *((float *)v46 + 9) < 0.2
    || *(float *)(*((void *)v46 + 8) + 28) < 0.5 && *((float *)v46 + 9) >= 0.5
    || *(float *)(*((void *)v46 + 8) + 28) >= 0.5 && *((float *)v46 + 9) < 0.5)
  {
    id v5 = _SUSUILoggingFacility();
    uint64_t v6 = (os_log_t *)v46;
    *((void *)v46 + 3) = v5;
    unsigned __int8 v67 = 0;
    if (os_log_type_enabled(v6[3], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)*((void *)v46 + 3);
      *(_DWORD *)os_log_type_t type = v67;
      id v41 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v46 + 8) + 88));
      id v7 = v41;
      BOOL v8 = v46;
      uint64_t v42 = (uint64_t)v7;
      *((void *)v46 + 1) = v7;
      int v43 = *(_DWORD *)(*((void *)v8 + 8) + 88);
      LOBYTE(v8) = *(void *)(*((void *)v8 + 8) + 120) == 0;
      char v64 = 0;
      if (v8)
      {
        int v38 = @"N/A";
      }
      else
      {
        BOOL v9 = (__CFString *)(id)[*(id *)(*((void *)v46 + 8) + 120) humanReadableUpdateName];
        *(void *)BOOL v46 = v9;
        char v64 = 1;
        int v38 = v9;
      }
      uint64_t v35 = v38;
      uint64_t v36 = *(void *)(*((void *)v46 + 8) + 120);
      uint64_t v37 = *(void *)(*((void *)v46 + 8) + 160);
      BOOL v10 = *(void *)(*((void *)v46 + 8) + 128) == 0;
      char v62 = 0;
      if (v10)
      {
        uint64_t v34 = @"N/A";
      }
      else
      {
        id v63 = (id)[*(id *)(*((void *)v46 + 8) + 128) humanReadableUpdateName];
        char v62 = 1;
        uint64_t v34 = (__CFString *)v63;
      }
      uint64_t v30 = v34;
      uint64_t v31 = *(void *)(*((void *)v46 + 8) + 128);
      uint64_t v32 = *(void *)(*((void *)v46 + 8) + 168);
      uint64_t v33 = *(void *)(*((void *)v46 + 8) + 8);
      BOOL v11 = *(void *)(*((void *)v46 + 8) + 8) == 0;
      char v60 = 0;
      char v58 = 0;
      char v56 = 0;
      if (v11
        || (id v61 = (id)[*(id *)(*((void *)v46 + 8) + 8) descriptor],
            char v60 = 1,
            !v61))
      {
        uint64_t v29 = @"N/A";
      }
      else
      {
        id v59 = (id)[*(id *)(*((void *)v46 + 8) + 8) descriptor];
        int v28 = 1;
        char v58 = 1;
        id v57 = (id)[v59 humanReadableUpdateName];
        char v56 = 1;
        uint64_t v29 = (__CFString *)v57;
      }
      id v25 = v29;
      id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v46 + 8) + 104));
      id v27 = objc_loadWeakRetained((id *)(*((void *)v46 + 8) + 104));
      char v54 = 0;
      char v52 = 0;
      if (v27)
      {
        id v55 = objc_loadWeakRetained((id *)(*((void *)v46 + 8) + 104));
        int v23 = 1;
        char v54 = 1;
        int v12 = (objc_class *)objc_opt_class();
        id v53 = NSStringFromClass(v12);
        char v52 = 1;
        id v24 = (__CFString *)v53;
      }
      else
      {
        id v24 = @"N/A";
      }
      id v20 = v24;
      id v21 = objc_loadWeakRetained((id *)(*((void *)v46 + 8) + 112));
      id v22 = objc_loadWeakRetained((id *)(*((void *)v46 + 8) + 112));
      char v50 = 0;
      char v48 = 0;
      if (v22)
      {
        id v51 = objc_loadWeakRetained((id *)(*((void *)v46 + 8) + 112));
        int v18 = 1;
        char v50 = 1;
        id v13 = (objc_class *)objc_opt_class();
        id v49 = NSStringFromClass(v13);
        char v48 = 1;
        id v19 = (__CFString *)v49;
      }
      else
      {
        id v19 = @"N/A";
      }
      *(double *)&uint64_t v14 = *((float *)v46 + 9);
      *(double *)&uint64_t v15 = *(float *)(*((void *)v46 + 8) + 28);
      v16[10] = (uint8_t *)v16;
      buf = v74;
      __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_0((uint64_t)v74, (uint64_t)v44, v42, v43, (uint64_t)v35, v36, v37, (uint64_t)v30, v31, v32, v33, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19, v14, v15);
      _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nBattery level changed: %f -> %f", buf, 0xA8u);
      if (v48) {

      }
      if (v50) {
      if (v52)
      }

      if (v54) {
      if (v56)
      }

      if (v58) {
      if (v60)
      }

      if (v62) {
      if (v64)
      }

      objc_storeStrong(&v66, 0);
    }
    objc_storeStrong(&v68, 0);
    [*((id *)v46 + 8) refreshState];
  }
  objc_storeStrong(location, 0);
}

- (void)_didBecomeActive:(id)a3
{
  float v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v4->_state != 1) {
    [(SUSUISoftwareUpdateManager *)v4 refreshState];
  }
  objc_storeStrong(location, 0);
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  int v16 = self;
  SEL v15 = a2;
  int v14 = a3;
  int v13 = a4;
  dispatch_queue_t queue = MEMORY[0x263EF83A0];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = __74__SUSUISoftwareUpdateManager_networkChangedFromNetworkType_toNetworkType___block_invoke;
  BOOL v9 = &unk_26483BEA0;
  int v11 = v13;
  BOOL v10 = v16;
  int v12 = v14;
  dispatch_async(queue, &v5);

  objc_storeStrong((id *)&v10, 0);
}

uint64_t __74__SUSUISoftwareUpdateManager_networkChangedFromNetworkType_toNetworkType___block_invoke(uint64_t result)
{
  id v51 = &v71;
  uint64_t v52 = result;
  id v53 = "-[SUSUISoftwareUpdateManager networkChangedFromNetworkType:toNetworkType:]_block_invoke";
  uint64_t v78 = *MEMORY[0x263EF8340];
  v76[2] = (id)result;
  v76[1] = (id)result;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(*(void *)(result + 32) + 20))
  {
    id v1 = _SUSUILoggingFacility();
    id v2 = (os_log_t *)v51;
    *((void *)v51 + 7) = v1;
    unsigned __int8 v75 = 0;
    if (os_log_type_enabled(v2[7], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)*((void *)v51 + 7);
      *(_DWORD *)os_log_type_t type = v75;
      id v48 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v52 + 32) + 88));
      id v3 = v48;
      uint64_t v4 = v52;
      uint64_t v49 = (uint64_t)v3;
      *((void *)v51 + 5) = v3;
      int v50 = *(_DWORD *)(*(void *)(v4 + 32) + 88);
      LOBYTE(v4) = *(void *)(*(void *)(v4 + 32) + 120) == 0;
      char v73 = 0;
      if (v4)
      {
        id v45 = @"N/A";
      }
      else
      {
        uint64_t v5 = (__CFString *)(id)[*(id *)(*(void *)(v52 + 32) + 120) humanReadableUpdateName];
        *((void *)v51 + 4) = v5;
        char v73 = 1;
        id v45 = v5;
      }
      uint64_t v42 = v45;
      uint64_t v43 = *(void *)(*(void *)(v52 + 32) + 120);
      uint64_t v44 = *(void *)(*(void *)(v52 + 32) + 160);
      BOOL v6 = *(void *)(*(void *)(v52 + 32) + 128) == 0;
      char v72 = 0;
      if (v6)
      {
        id v41 = @"N/A";
      }
      else
      {
        int v7 = (__CFString *)(id)[*(id *)(*(void *)(v52 + 32) + 128) humanReadableUpdateName];
        *((void *)v51 + 2) = v7;
        char v72 = 1;
        id v41 = v7;
      }
      uint64_t v37 = v41;
      uint64_t v38 = *(void *)(*(void *)(v52 + 32) + 128);
      uint64_t v39 = *(void *)(*(void *)(v52 + 32) + 168);
      uint64_t v40 = *(void *)(*(void *)(v52 + 32) + 8);
      BOOL v8 = *(void *)(*(void *)(v52 + 32) + 8) == 0;
      char v70 = 0;
      char v68 = 0;
      char v66 = 0;
      if (v8
        || (id v9 = (id)[*(id *)(*(void *)(v52 + 32) + 8) descriptor],
            *(void *)id v51 = v9,
            char v70 = 1,
            !v9))
      {
        uint64_t v36 = @"N/A";
      }
      else
      {
        id v69 = (id)[*(id *)(*(void *)(v52 + 32) + 8) descriptor];
        int v35 = 1;
        char v68 = 1;
        id v67 = (id)[v69 humanReadableUpdateName];
        char v66 = 1;
        uint64_t v36 = (__CFString *)v67;
      }
      uint64_t v32 = v36;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v52 + 32) + 104));
      id v34 = objc_loadWeakRetained((id *)(*(void *)(v52 + 32) + 104));
      char v64 = 0;
      char v62 = 0;
      if (v34)
      {
        id v65 = objc_loadWeakRetained((id *)(*(void *)(v52 + 32) + 104));
        int v30 = 1;
        char v64 = 1;
        BOOL v10 = (objc_class *)objc_opt_class();
        id v63 = NSStringFromClass(v10);
        char v62 = 1;
        uint64_t v31 = (__CFString *)v63;
      }
      else
      {
        uint64_t v31 = @"N/A";
      }
      id v27 = v31;
      id v28 = objc_loadWeakRetained((id *)(*(void *)(v52 + 32) + 112));
      id v29 = objc_loadWeakRetained((id *)(*(void *)(v52 + 32) + 112));
      char v60 = 0;
      char v58 = 0;
      if (v29)
      {
        id v61 = objc_loadWeakRetained((id *)(*(void *)(v52 + 32) + 112));
        int v25 = 1;
        char v60 = 1;
        int v11 = (objc_class *)objc_opt_class();
        id v59 = NSStringFromClass(v11);
        char v58 = 1;
        int v26 = (__CFString *)v59;
      }
      else
      {
        int v26 = @"N/A";
      }
      int v18 = v26;
      id v24 = (id)SUStringFromNetworkType();
      id v19 = v24;
      id v57 = v19;
      int v20 = *(_DWORD *)(v52 + 44);
      id v23 = (id)SUStringFromNetworkType();
      id location = v23;
      int v12 = *(_DWORD *)(v52 + 40);
      id v21 = &v14;
      buf = v77;
      __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0_8_66_4_0((uint64_t)v77, (uint64_t)v53, v49, v50, (uint64_t)v42, v43, v44, (uint64_t)v37, v38, v39, v40, (uint64_t)v32, (uint64_t)WeakRetained, (uint64_t)v27, (uint64_t)v28, (uint64_t)v26, (uint64_t)v19, v20, (uint64_t)location,
        v12);
      _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nChanged network type: %@ (%d) -> %{public}@ (%d)", buf, 0xB4u);

      if (v58) {
      if (v60)
      }

      if (v62) {
      if (v64)
      }

      if (v66) {
      if (v68)
      }

      if (v70) {
      if (v72)
      }

      if (v73) {
      id obj = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v57, obj);
      objc_storeStrong(&v74, obj);
    }
    objc_storeStrong(v76, 0);
    uint64_t v13 = v52;
    *(_DWORD *)(*(void *)(v52 + 32) + 20) = *(_DWORD *)(v52 + 40);
    LOBYTE(v13) = *(_DWORD *)(*(void *)(v13 + 32) + 20) == 0;
    char v54 = 0;
    BOOL v16 = 0;
    if ((v13 & 1) == 0)
    {
      id v55 = (id)[*(id *)(v52 + 32) preferredUpdate];
      char v54 = 1;
      BOOL v16 = 0;
      if (!v55) {
        BOOL v16 = *(_DWORD *)(*(void *)(v52 + 32) + 88) != 3;
      }
    }
    BOOL v15 = v16;
    if (v54) {

    }
    if (v15) {
      return [*(id *)(v52 + 32) setState:0];
    }
    else {
      return [*(id *)(v52 + 32) refreshState];
    }
  }
  return result;
}

- (NSString)prettyUpdateName
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = [(SUSUISoftwareUpdateManager *)self update];
  if (location[0]) {
    id v6 = [(SUSUISoftwareUpdateManager *)v5 prettyNameForUpdate:location[0]];
  }
  else {
    id v6 = 0;
  }
  objc_storeStrong(location, 0);
  id v2 = v6;
  return (NSString *)v2;
}

- (id)prettyNameForUpdate:(id)a3
{
  uint64_t v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = 0;
  if (location[0])
  {
    id v3 = (id)[location[0] humanReadableUpdateName];
    id v4 = v36;
    id v36 = v3;
  }
  if (!v36 || ![v36 length])
  {
    id v35 = 0;
    id v27 = (id)[MEMORY[0x263F82670] currentDevice];
    char v28 = objc_msgSend(v27, "sf_isiPad");

    if (v28)
    {
      id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = (id)[v26 localizedStringForKey:@"iPadOS_VERSION" value:&stru_26DCD7690 table:@"Software Update"];
      id v6 = v35;
      id v35 = v5;
    }
    else
    {
      id v25 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v7 = (id)[v25 localizedStringForKey:@"iOS_VERSION" value:&stru_26DCD7690 table:@"Software Update"];
      id v8 = v35;
      id v35 = v7;
    }
    id v34 = 0;
    char v32 = 0;
    BOOL v24 = 0;
    if (location[0])
    {
      id v33 = (id)[location[0] productVersion];
      char v32 = 1;
      BOOL v24 = v33 != 0;
    }
    if (v32) {

    }
    if (v24)
    {
      id v9 = (id)[location[0] productVersion];
      id v10 = v34;
      id v34 = v9;
    }
    else
    {
      id v11 = [(SUSUISoftwareUpdateManager *)v38 productVersionWithExtra];
      id v12 = v34;
      id v34 = v11;

      if (!v34)
      {
        id v23 = (id)[MEMORY[0x263F82670] currentDevice];
        id v34 = (id)[v23 systemVersion];
      }
    }
    id v13 = (id)[NSString stringWithValidatedFormat:v35 validFormatSpecifiers:@"%@" error:v34];
    id v14 = v36;
    id v36 = v13;

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  char v30 = 0;
  char v22 = 0;
  if (!location[0])
  {
    id v31 = (id)[MEMORY[0x263F82670] currentDevice];
    char v30 = 1;
    char v22 = objc_msgSend(v31, "sf_isInternalInstall");
  }
  if (v30) {

  }
  if (v22)
  {
    id v29 = [(SUSUISoftwareUpdateManager *)v38 buildVersionIncludingRSR];
    id v19 = NSString;
    id v21 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v20 = (id)[v21 localizedStringForKey:@"%@ (%@)" value:&stru_26DCD7690 table:@"Software Update"];
    id v15 = (id)objc_msgSend(v19, "stringWithFormat:", v36, v29);
    id v16 = v36;
    id v36 = v15;

    objc_storeStrong(&v29, 0);
  }
  id v18 = v36;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  return v18;
}

- (id)productVersionWithExtra
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    id v2 = (id)[location objectForKeyedSubscript:*MEMORY[0x263EFFAC8]];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

- (id)buildVersionIncludingRSR
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  id location = (id)_CFCopySupplementalVersionDictionary();
  if (location)
  {
    id v2 = (id)[location objectForKeyedSubscript:*MEMORY[0x263EFFAB0]];
    id v3 = v7[0];
    v7[0] = v2;
  }
  id v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

- (BOOL)readyToDownload
{
  BOOL v3 = 1;
  if (![(SUSUISoftwareUpdateManager *)self readyToDownloadPreferredUpdate]) {
    return [(SUSUISoftwareUpdateManager *)self readyToDownloadAlternateUpdate];
  }
  return v3;
}

- (BOOL)readyToDownloadPreferredUpdate
{
  return self->_readyToDownloadPreferred;
}

- (BOOL)readyToDownloadAlternateUpdate
{
  return self->_readyToDownloadAlternate;
}

- (BOOL)readyToResume
{
  return self->_readyToResume;
}

- (BOOL)canCancelAutoInstall
{
  BOOL v3 = [(SUSUISoftwareUpdateManager *)self installPolicy];
  BOOL v4 = [(SUInstallPolicy *)v3 type] != 1;

  return v4;
}

- (void)purgeCurrentDownloadWithHandler:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  suClient = v11->_suClient;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __62__SUSUISoftwareUpdateManager_purgeCurrentDownloadWithHandler___block_invoke;
  id v8 = &unk_2648408D8;
  id v9 = location[0];
  -[SUSUISoftwareUpdateClientManager purgeDownload:](suClient, "purgeDownload:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateManager_purgeCurrentDownloadWithHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (SUDownload)download
{
  id obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = self->_download;
  objc_sync_exit(obj);

  return v4;
}

- (void)setDownload:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = v26;
  objc_sync_enter(obj);
  if (location[0] != v26->_download || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v24 = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      char v22 = 0;
      char v20 = 0;
      char v18 = 0;
      if (v26->_download
        && (id v23 = [(SUDownload *)v26->_download descriptor],
            char v22 = 1,
            v23))
      {
        id v21 = [(SUDownload *)v26->_download descriptor];
        char v20 = 1;
        id v19 = (__CFString *)(id)[(SUDescriptor *)v21 humanReadableUpdateName];
        char v18 = 1;
        id v10 = v19;
      }
      else
      {
        id v10 = @"N/A";
      }
      uint64_t download = (uint64_t)v26->_download;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      BOOL v3 = @"YES";
      if ((isKindOfClass & 1) == 0) {
        BOOL v3 = @"NO";
      }
      uint64_t v7 = (uint64_t)v3;
      char v16 = 0;
      char v14 = 0;
      char v12 = 0;
      if (location[0]
        && (id v17 = (id)[location[0] descriptor], v16 = 1, v17))
      {
        id v15 = (id)[location[0] descriptor];
        char v14 = 1;
        id v13 = (__CFString *)(id)[v15 humanReadableUpdateName];
        char v12 = 1;
        uint64_t v6 = v13;
      }
      else
      {
        uint64_t v6 = @"N/A";
      }
      id v5 = location[0];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v4 = @"YES";
      }
      else {
        uint64_t v4 = @"NO";
      }
      __os_log_helper_16_2_7_8_32_8_66_8_0_8_66_8_66_8_0_8_66((uint64_t)v27, (uint64_t)"-[SUSUISoftwareUpdateManager setDownload:]", (uint64_t)v10, download, v7, (uint64_t)v6, (uint64_t)v5, (uint64_t)v4);
      _os_log_impl(&dword_228401000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "%s: Replacing the current download object with a new one.\n\tCurrent: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n\tNew: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n", v27, 0x48u);
      if (v12) {

      }
      if (v14) {
      if (v16)
      }

      if (v18) {
      if (v20)
      }

      if (v22) {
    }
      }
    objc_storeStrong(&v24, 0);
    objc_storeStrong((id *)&v26->_download, location[0]);
  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (void)_reallyDownloadAndInstall:(unint64_t)a3 update:(id)a4 AcceptingCellularFees:(int)a5 completion:(id)a6
{
  id v74 = &v92;
  int v75 = a5;
  id obj = a6;
  id v77 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]";
  uint64_t v107 = *MEMORY[0x263EF8340];
  id location[3] = self;
  id location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  unsigned int v104 = v75;
  id v103 = 0;
  objc_storeStrong(&v103, obj);
  id v73 = _SUSUILoggingFacility();
  id v102 = v73;
  unsigned __int8 v101 = 0;
  if (os_log_type_enabled((os_log_t)v102, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v74 + 17);
    *(_DWORD *)os_log_type_t type = v101;
    id updated = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v74 + 23) + 88));
    id v67 = updated;
    id v6 = v67;
    uint64_t v7 = v74;
    uint64_t v68 = (uint64_t)v6;
    *((void *)v74 + 15) = v6;
    int v69 = *(_DWORD *)(*((void *)v7 + 23) + 88);
    LOBYTE(v7) = *(void *)(*((void *)v7 + 23) + 120) == 0;
    char v99 = 0;
    if (v7)
    {
      id v65 = @"N/A";
    }
    else
    {
      id v66 = (id)[*(id *)(*((void *)v74 + 23) + 120) humanReadableUpdateName];
      id v8 = (__CFString *)v66;
      *((void *)v74 + 14) = v8;
      char v99 = 1;
      id v65 = v8;
    }
    char v62 = v65;
    uint64_t v63 = *(void *)(*((void *)v74 + 23) + 120);
    uint64_t v64 = *(void *)(*((void *)v74 + 23) + 160);
    BOOL v9 = *(void *)(*((void *)v74 + 23) + 128) == 0;
    char v98 = 0;
    if (v9)
    {
      char v60 = @"N/A";
    }
    else
    {
      id v61 = (id)[*(id *)(*((void *)v74 + 23) + 128) humanReadableUpdateName];
      id v10 = (__CFString *)v61;
      *((void *)v74 + 12) = v10;
      char v98 = 1;
      char v60 = v10;
    }
    char v56 = v60;
    uint64_t v57 = *(void *)(*((void *)v74 + 23) + 128);
    uint64_t v58 = *(void *)(*((void *)v74 + 23) + 168);
    uint64_t v59 = *(void *)(*((void *)v74 + 23) + 8);
    BOOL v11 = *(void *)(*((void *)v74 + 23) + 8) == 0;
    char v97 = 0;
    char v96 = 0;
    char v95 = 0;
    if (v11
      || (id v55 = (id)[*(id *)(*((void *)v74 + 23) + 8) descriptor],
          id v12 = v55,
          *((void *)v74 + 10) = v12,
          char v97 = 1,
          !v12))
    {
      uint64_t v52 = @"N/A";
    }
    else
    {
      id v54 = (id)[*(id *)(*((void *)v74 + 23) + 8) descriptor];
      id v13 = v54;
      *((void *)v74 + 8) = v13;
      char v96 = 1;
      id v53 = (id)[v13 humanReadableUpdateName];
      char v14 = (__CFString *)v53;
      *((void *)v74 + 6) = v14;
      char v95 = 1;
      uint64_t v52 = v14;
    }
    int v50 = v52;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v74 + 23) + 104));
    id v49 = objc_loadWeakRetained((id *)(*((void *)v74 + 23) + 104));
    char v94 = 0;
    char v93 = 0;
    if (v49)
    {
      id v48 = objc_loadWeakRetained((id *)(*((void *)v74 + 23) + 104));
      *((void *)v74 + 4) = v48;
      char v94 = 1;
      Class aClass = (Class)objc_opt_class();
      id v46 = NSStringFromClass(aClass);
      id v15 = (__CFString *)v46;
      *((void *)v74 + 2) = v15;
      char v93 = 1;
      id v45 = v15;
    }
    else
    {
      id v45 = @"N/A";
    }
    uint64_t v43 = v45;
    id v44 = objc_loadWeakRetained((id *)(*((void *)v74 + 23) + 112));
    id v42 = objc_loadWeakRetained((id *)(*((void *)v74 + 23) + 112));
    char v91 = 0;
    char v89 = 0;
    if (v42)
    {
      id v41 = objc_loadWeakRetained((id *)(*((void *)v74 + 23) + 112));
      *(void *)id v74 = v41;
      char v91 = 1;
      Class v40 = (Class)objc_opt_class();
      id v39 = NSStringFromClass(v40);
      id v90 = v39;
      char v89 = 1;
      uint64_t v38 = (__CFString *)v90;
    }
    else
    {
      uint64_t v38 = @"N/A";
    }
    id v36 = v38;
    id v37 = (id)[*((id *)v74 + 20) humanReadableUpdateName];
    id v35 = v37;
    id v88 = v35;
    id v33 = &v17;
    buf = v106;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_4_0((uint64_t)v106, (uint64_t)v77, v68, v69, (uint64_t)v62, v63, v64, (uint64_t)v56, v57, v58, v59, (uint64_t)v50, (uint64_t)WeakRetained, (uint64_t)v43, (uint64_t)v44, (uint64_t)v38, (uint64_t)v88, v104);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nStarting the download and install of '%{public}@'. cellularFeeAcceptance: %d", buf, 0xA4u);

    if (v89) {
    if (v91)
    }

    if (v93) {
    if (v94)
    }

    if (v95) {
    if (v96)
    }

    if (v97) {
    if (v98)
    }

    if (v99) {
    objc_storeStrong(&v88, 0);
    }
    objc_storeStrong(&v100, 0);
  }
  objc_storeStrong(&v102, 0);
  id v32 = objc_alloc(MEMORY[0x263F781E0]);
  id v31 = (void *)[v32 initWithDescriptor:*((void *)v74 + 20)];
  id v87 = v31;
  id SUDownloadPolicyFactoryClass_0 = getSUDownloadPolicyFactoryClass_0();
  uint64_t v28 = *((void *)v74 + 20);
  int v29 = [*((id *)v74 + 23) allowCellularOverride];
  id v27 = (id)[SUDownloadPolicyFactoryClass_0 userDownloadPolicyForDescriptor:v28 existingPolicy:0 allowCellularOverride:v29 & 1];
  id v86 = v27;
  uint64_t v26 = *((void *)v74 + 21);
  if (!v26) {
    goto LABEL_40;
  }
  if (v26 == 2)
  {
    [v87 setUserUpdateTonight:1];
LABEL_40:
    [v87 setDownloadOnly:1];
  }
  [v87 setActiveDownloadPolicy:v86];
  [v87 setDownloadFeeAgreementStatus:v104];
  [v87 setTermsAndConditionsAgreementStatus:1];
  char v16 = (id *)v74;
  *(double *)(*((void *)v74 + 23) + 40) = -1.0;
  objc_initWeak(&from, v16[23]);
  id v21 = *(id *)(*((void *)v74 + 23) + 56);
  id v22 = v87;
  id v24 = (id *)&v78;
  uint64_t v78 = MEMORY[0x263EF8330];
  int v79 = -1073741824;
  int v80 = 0;
  id v81 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke;
  char v82 = &unk_264840978;
  id v23 = &v83;
  id v83 = *((id *)v74 + 23);
  id v25 = v24 + 7;
  objc_copyWeak(v24 + 7, &from);
  char v20 = &v78;
  char v18 = (id *)v84;
  v84[0] = *((id *)v74 + 20);
  id v19 = (id *)(v20 + 6);
  v84[1] = *((id *)v74 + 18);
  v84[3] = *((void *)v74 + 21);
  [v21 startDownloadWithOptions:v22 completion:v20];
  objc_storeStrong(v19, 0);
  objc_storeStrong(v18, 0);
  objc_destroyWeak(v25);
  objc_storeStrong(v23, 0);
  objc_destroyWeak(&from);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(&v103, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke(NSObject *a1, char a2, id obj)
{
  uint64_t v68 = &v84;
  int v69 = a1;
  char v70 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke";
  uint64_t v98 = *MEMORY[0x263EF8340];
  char v96 = a1;
  char v95 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v93[1] = v69;
  id v67 = _SUSUILoggingFacility();
  v93[0] = (os_log_t)v67;
  unsigned __int8 v92 = 0;
  if (os_log_type_enabled(v93[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v68 + 15);
    *(_DWORD *)os_log_type_t type = v92;
    id updated = SUSUISoftwareUpdateStateToString(*((_DWORD *)v69[4].isa + 22));
    id v61 = updated;
    id v3 = v61;
    uint64_t v4 = v69;
    uint64_t v62 = (uint64_t)v3;
    *((void *)v68 + 13) = v3;
    int v63 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((void *)v4[4].isa + 15) == 0;
    char v90 = 0;
    if (v4)
    {
      uint64_t v59 = @"N/A";
    }
    else
    {
      id v60 = (id)[*((id *)v69[4].isa + 15) humanReadableUpdateName];
      id v5 = (__CFString *)v60;
      *((void *)v68 + 12) = v5;
      char v90 = 1;
      uint64_t v59 = v5;
    }
    char v56 = v59;
    uint64_t v57 = *((void *)v69[4].isa + 15);
    uint64_t v58 = *((void *)v69[4].isa + 20);
    BOOL v6 = *((void *)v69[4].isa + 16) == 0;
    char v89 = 0;
    if (v6)
    {
      id v54 = @"N/A";
    }
    else
    {
      id v55 = (id)[*((id *)v69[4].isa + 16) humanReadableUpdateName];
      uint64_t v7 = (__CFString *)v55;
      *((void *)v68 + 10) = v7;
      char v89 = 1;
      id v54 = v7;
    }
    int v50 = v54;
    uint64_t v51 = *((void *)v69[4].isa + 16);
    uint64_t v52 = *((void *)v69[4].isa + 21);
    uint64_t v53 = *((void *)v69[4].isa + 1);
    BOOL v8 = *((void *)v69[4].isa + 1) == 0;
    char v88 = 0;
    char v87 = 0;
    char v86 = 0;
    if (v8
      || (id v49 = (id)[*((id *)v69[4].isa + 1) descriptor],
          id v9 = v49,
          *((void *)v68 + 8) = v9,
          char v88 = 1,
          !v9))
    {
      id v46 = @"N/A";
    }
    else
    {
      id v48 = (id)[*((id *)v69[4].isa + 1) descriptor];
      id v10 = v48;
      *((void *)v68 + 6) = v10;
      char v87 = 1;
      id v47 = (id)[v10 humanReadableUpdateName];
      BOOL v11 = (__CFString *)v47;
      *((void *)v68 + 4) = v11;
      char v86 = 1;
      id v46 = v11;
    }
    id v44 = v46;
    id WeakRetained = objc_loadWeakRetained((id *)v69[4].isa + 13);
    id v43 = objc_loadWeakRetained((id *)v69[4].isa + 13);
    char v85 = 0;
    char v83 = 0;
    if (v43)
    {
      id v42 = objc_loadWeakRetained((id *)v69[4].isa + 13);
      *((void *)v68 + 2) = v42;
      char v85 = 1;
      Class aClass = (Class)objc_opt_class();
      id v40 = NSStringFromClass(aClass);
      id v12 = (__CFString *)v40;
      *(void *)uint64_t v68 = v12;
      char v83 = 1;
      id v39 = v12;
    }
    else
    {
      id v39 = @"N/A";
    }
    id v37 = v39;
    id v38 = objc_loadWeakRetained((id *)v69[4].isa + 14);
    id v36 = objc_loadWeakRetained((id *)v69[4].isa + 14);
    char v81 = 0;
    char v79 = 0;
    if (v36)
    {
      id v35 = objc_loadWeakRetained((id *)v69[4].isa + 14);
      id v82 = v35;
      char v81 = 1;
      Class v34 = (Class)objc_opt_class();
      id v33 = NSStringFromClass(v34);
      id v80 = v33;
      char v79 = 1;
      id v32 = (__CFString *)v80;
    }
    else
    {
      id v32 = @"N/A";
    }
    uint64_t v13 = *((void *)v68 + 17);
    char v30 = &v14;
    buf = v97;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_66((uint64_t)v97, (uint64_t)v70, v62, v63, (uint64_t)v56, v57, v58, (uint64_t)v50, v51, v52, v53, (uint64_t)v44, (uint64_t)WeakRetained, (uint64_t)v37, (uint64_t)v38, (uint64_t)v32, v95 & 1, v13);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nstartDownloadWithOptions - successfullyStarted: %d; error: %{public}@",
      buf,
      0xA4u);
    if (v79) {

    }
    if (v81) {
    if (v83)
    }

    if (v85) {
    if (v86)
    }

    if (v87) {
    if (v88)
    }

    if (v89) {
    if (v90)
    }

    objc_storeStrong(&v91, 0);
  }
  objc_storeStrong((id *)v93, 0);
  id v29 = (id)[*((id *)v68 + 17) domain];
  id v27 = v29;
  id SUErrorDomain_3 = getSUErrorDomain_3();
  id v25 = SUErrorDomain_3;
  int v26 = objc_msgSend(v27, "isEqualToString:");

  if (v26)
  {
    uint64_t v24 = [*((id *)v68 + 17) code];
    if (v24 == 11 || (uint64_t v23 = [*((id *)v68 + 17) code], v23 == 41)) {
      char v95 = 1;
    }
  }
  id v19 = (id)*((void *)v69[4].isa + 7);
  id v21 = (id *)&v71;
  uint64_t v71 = MEMORY[0x263EF8330];
  int v72 = -1073741824;
  int v73 = 0;
  id v74 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_439;
  int v75 = &unk_264840950;
  char v20 = (id *)&v76;
  char v76 = v69[4].isa;
  id v22 = v21 + 8;
  objc_copyWeak(v21 + 8, (id *)&v69[7].isa);
  char v18 = &v71;
  id v15 = (id *)v77;
  v77[0] = v69[5].isa;
  char v78 = v95 & 1;
  char v16 = (id *)(v18 + 6);
  v77[1] = *((id *)v68 + 17);
  uint64_t v17 = (id *)(v18 + 7);
  v77[2] = v69[6].isa;
  v77[4] = v69[8].isa;
  [v19 download:v18];
  objc_storeStrong(v17, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(v15, 0);
  objc_destroyWeak(v22);
  objc_storeStrong(v20, 0);
  objc_storeStrong(&location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_439(id *a1, void *a2, void *a3)
{
  uint64_t v64 = a1;
  id obj = a3;
  id v66 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke";
  id v67 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke_3";
  uint64_t v111 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v107 = 0;
  objc_storeStrong(&v107, obj);
  v106[1] = v64;
  id v63 = _SUSUILoggingFacility();
  v106[0] = v63;
  unsigned __int8 v105 = 0;
  if (os_log_type_enabled((os_log_t)v106[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v106[0];
    *(_DWORD *)os_log_type_t type = v105;
    id updated = SUSUISoftwareUpdateStateToString(*((_DWORD *)v64[4] + 22));
    id v57 = updated;
    id v58 = v57;
    id v104 = v58;
    int v59 = *((_DWORD *)v64[4] + 22);
    BOOL v3 = *((void *)v64[4] + 15) == 0;
    char v102 = 0;
    if (v3)
    {
      id v55 = @"N/A";
    }
    else
    {
      id v56 = (id)[*((id *)v64[4] + 15) humanReadableUpdateName];
      id v103 = v56;
      char v102 = 1;
      id v55 = (__CFString *)v103;
    }
    uint64_t v52 = v55;
    uint64_t v53 = *((void *)v64[4] + 15);
    uint64_t v54 = *((void *)v64[4] + 20);
    BOOL v4 = *((void *)v64[4] + 16) == 0;
    char v100 = 0;
    if (v4)
    {
      int v50 = @"N/A";
    }
    else
    {
      id v51 = (id)[*((id *)v64[4] + 16) humanReadableUpdateName];
      id v101 = v51;
      char v100 = 1;
      int v50 = (__CFString *)v101;
    }
    id v46 = v50;
    uint64_t v47 = *((void *)v64[4] + 16);
    uint64_t v48 = *((void *)v64[4] + 21);
    uint64_t v49 = *((void *)v64[4] + 1);
    BOOL v5 = *((void *)v64[4] + 1) == 0;
    char v98 = 0;
    char v96 = 0;
    char v94 = 0;
    if (v5
      || (id v45 = (id)[*((id *)v64[4] + 1) descriptor],
          id v99 = v45,
          char v98 = 1,
          !v99))
    {
      id v42 = @"N/A";
    }
    else
    {
      id v44 = (id)[*((id *)v64[4] + 1) descriptor];
      id v97 = v44;
      char v96 = 1;
      id v43 = (id)[v97 humanReadableUpdateName];
      id v95 = v43;
      char v94 = 1;
      id v42 = (__CFString *)v95;
    }
    id v40 = v42;
    id WeakRetained = objc_loadWeakRetained((id *)v64[4] + 13);
    id v39 = objc_loadWeakRetained((id *)v64[4] + 13);
    char v92 = 0;
    char v90 = 0;
    if (v39)
    {
      id v38 = objc_loadWeakRetained((id *)v64[4] + 13);
      id v93 = v38;
      char v92 = 1;
      Class aClass = (Class)objc_opt_class();
      id v36 = NSStringFromClass(aClass);
      id v91 = v36;
      char v90 = 1;
      id v35 = (__CFString *)v91;
    }
    else
    {
      id v35 = @"N/A";
    }
    id v33 = v35;
    id v34 = objc_loadWeakRetained((id *)v64[4] + 14);
    id v32 = objc_loadWeakRetained((id *)v64[4] + 14);
    char v88 = 0;
    char v86 = 0;
    if (v32)
    {
      id v31 = objc_loadWeakRetained((id *)v64[4] + 14);
      id v89 = v31;
      char v88 = 1;
      Class v30 = (Class)objc_opt_class();
      id v29 = NSStringFromClass(v30);
      id v87 = v29;
      char v86 = 1;
      uint64_t v28 = (__CFString *)v87;
    }
    else
    {
      uint64_t v28 = @"N/A";
    }
    int v26 = &v6;
    buf = v110;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66((uint64_t)v110, (uint64_t)v66, (uint64_t)v58, v59, (uint64_t)v52, v53, v54, (uint64_t)v46, v47, v48, v49, (uint64_t)v40, (uint64_t)WeakRetained, (uint64_t)v33, (uint64_t)v34, (uint64_t)v28, (uint64_t)location[0], (uint64_t)v107);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ndownload fetched the initiated download object - download: %{public}@, downloadError: %{public}@", buf, 0xA8u);
    if (v86) {

    }
    if (v88) {
    if (v90)
    }

    if (v92) {
    if (v94)
    }

    if (v96) {
    if (v98)
    }

    if (v100) {
    if (v102)
    }

    objc_storeStrong(&v104, 0);
  }
  objc_storeStrong(v106, 0);
  id v25 = objc_loadWeakRetained(v64 + 8);
  id v85 = v25;
  uint64_t v76 = MEMORY[0x263EF8330];
  int v77 = -1073741824;
  int v78 = 0;
  char v79 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_440;
  id v80 = &unk_264840928;
  uint64_t v24 = &v82;
  objc_copyWeak(&v82, v64 + 8);
  id v22 = (id *)&v76;
  id v15 = (id *)v81;
  v81[0] = v64[4];
  char v16 = v22 + 5;
  v81[1] = v85;
  uint64_t v17 = v22 + 6;
  v81[2] = v64[5];
  char v18 = v22 + 7;
  v81[3] = location[0];
  id v19 = v22 + 8;
  v81[4] = v107;
  char v83 = (_BYTE)v64[10] & 1;
  char v20 = v22 + 9;
  v81[5] = v64[6];
  id v21 = v22 + 10;
  v81[6] = v64[7];
  uint64_t v23 = (void *)MEMORY[0x22A697370](v22);
  id v84 = v23;
  if (v64[9] == (id)2)
  {
    id v14 = _SUSUILoggingFacility();
    os_log_t oslog = (os_log_t)v14;
    os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v11 = oslog;
      *(_DWORD *)id v12 = v74;
      uint64_t v13 = v109;
      __os_log_helper_16_2_1_8_32((uint64_t)v109, (uint64_t)v67);
      _os_log_impl(&dword_228401000, v11, v12[0], "%s: Attempts to schedule the download for auto-installation", v13, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v10 = v85;
    id v9 = &v68;
    uint64_t v68 = MEMORY[0x263EF8330];
    int v69 = -1073741824;
    int v70 = 0;
    uint64_t v71 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_443;
    int v72 = &unk_26483DF58;
    uint64_t v7 = (id *)v73;
    v73[0] = v64[4];
    BOOL v8 = (id *)(v9 + 5);
    v73[1] = v84;
    [v10 setAutoInstall:v9];
    objc_storeStrong(v8, 0);
    objc_storeStrong(v7, 0);
  }
  else
  {
    (*((void (**)(void))v84 + 2))();
  }
  objc_storeStrong(&v84, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(v20, 0);
  objc_storeStrong(v19, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(v17, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(v15, 0);
  objc_destroyWeak(v24);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v107, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_440(uint64_t a1)
{
  v26[2] = (id)a1;
  v26[1] = (id)a1;
  v26[0] = objc_loadWeakRetained((id *)(a1 + 88));
  if (v26[0])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
    char v24 = 0;
    char v9 = 0;
    if (WeakRetained)
    {
      id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
      char v24 = 1;
      char v9 = objc_opt_respondsToSelector();
    }
    if (v24) {

    }
    if (v9)
    {
      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 104));
      uint64_t v1 = *(void *)(a1 + 40);
      uint64_t v2 = *(void *)(a1 + 48);
      uint64_t v3 = *(void *)(a1 + 56);
      uint64_t v4 = *(void *)(a1 + 64);
      char v5 = *(unsigned char *)(a1 + 96);
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v11 = MEMORY[0x263EF8330];
      int v12 = -1073741824;
      int v13 = 0;
      id v14 = __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_2;
      id v15 = &unk_264840900;
      objc_copyWeak(&v22, (id *)(a1 + 88));
      id v16 = *(id *)(a1 + 40);
      char v23 = *(unsigned char *)(a1 + 96) & 1;
      id v17 = *(id *)(a1 + 72);
      id v18 = *(id *)(a1 + 48);
      id v19 = *(id *)(a1 + 56);
      id v20 = *(id *)(a1 + 64);
      id v21 = *(id *)(a1 + 80);
      [v7 manager:v1 prepareToDownloadAndInstall:v2 withDownload:v3 andDownloadError:v4 didSuccessfullyStart:v5 & 1 withError:v6 usingCompletionHandler:&v11];

      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v16, 0);
      objc_destroyWeak(&v22);
    }
    else
    {
      [v26[0] _reallyDownloadAndInstallDidFinishWithResult:*(unsigned char *)(a1 + 96) & 1 andError:*(void *)(a1 + 72) forUpdate:*(void *)(a1 + 48) withDownload:*(void *)(a1 + 56) andDownloadError:*(void *)(a1 + 64) usingCompletionHandler:*(void *)(a1 + 80)];
    }
  }
  objc_storeStrong(v26, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_2(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 80));
  if (location[0]) {
    [*(id *)(a1 + 32) _reallyDownloadAndInstallDidFinishWithResult:*(unsigned char *)(a1 + 88) & 1 andError:*(void *)(a1 + 40) forUpdate:*(void *)(a1 + 48) withDownload:*(void *)(a1 + 56) andDownloadError:*(void *)(a1 + 64) usingCompletionHandler:*(void *)(a1 + 72)];
  }
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager__reallyDownloadAndInstall_update_AcceptingCellularFees_completion___block_invoke_443(NSObject *a1, char a2, id obj)
{
  id v44 = &v62;
  id v43 = a1;
  id v42 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstall:update:AcceptingCellularFees:completion:]_block_invoke";
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v68 = a1;
  char v67 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v65[1] = v43;
  v65[0] = (os_log_t)_SUSUILoggingFacility();
  unsigned __int8 v64 = 0;
  if (os_log_type_enabled(v65[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v44 + 3);
    *(_DWORD *)os_log_type_t type = v64;
    id v39 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v43[4].isa + 22));
    id v3 = v39;
    uint64_t v4 = v43;
    uint64_t v40 = (uint64_t)v3;
    *((void *)v44 + 1) = v3;
    int v41 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((void *)v4[4].isa + 15) == 0;
    char v61 = 0;
    if (v4)
    {
      id v36 = @"N/A";
    }
    else
    {
      char v5 = (__CFString *)(id)[*((id *)v43[4].isa + 15) humanReadableUpdateName];
      *(void *)id v44 = v5;
      char v61 = 1;
      id v36 = v5;
    }
    id v33 = v36;
    uint64_t v34 = *((void *)v43[4].isa + 15);
    uint64_t v35 = *((void *)v43[4].isa + 20);
    BOOL v6 = *((void *)v43[4].isa + 16) == 0;
    char v59 = 0;
    if (v6)
    {
      id v32 = @"N/A";
    }
    else
    {
      id v60 = (id)[*((id *)v43[4].isa + 16) humanReadableUpdateName];
      char v59 = 1;
      id v32 = (__CFString *)v60;
    }
    uint64_t v28 = v32;
    uint64_t v29 = *((void *)v43[4].isa + 16);
    uint64_t v30 = *((void *)v43[4].isa + 21);
    uint64_t v31 = *((void *)v43[4].isa + 1);
    BOOL v7 = *((void *)v43[4].isa + 1) == 0;
    char v57 = 0;
    char v55 = 0;
    char v53 = 0;
    if (v7
      || (id v58 = (id)[*((id *)v43[4].isa + 1) descriptor],
          char v57 = 1,
          !v58))
    {
      id v27 = @"N/A";
    }
    else
    {
      id v56 = (id)[*((id *)v43[4].isa + 1) descriptor];
      int v26 = 1;
      char v55 = 1;
      id v54 = (id)[v56 humanReadableUpdateName];
      char v53 = 1;
      id v27 = (__CFString *)v54;
    }
    char v23 = v27;
    id WeakRetained = objc_loadWeakRetained((id *)v43[4].isa + 13);
    id v25 = objc_loadWeakRetained((id *)v43[4].isa + 13);
    char v51 = 0;
    char v49 = 0;
    if (v25)
    {
      id v52 = objc_loadWeakRetained((id *)v43[4].isa + 13);
      int v21 = 1;
      char v51 = 1;
      BOOL v8 = (objc_class *)objc_opt_class();
      id v50 = NSStringFromClass(v8);
      char v49 = 1;
      id v22 = (__CFString *)v50;
    }
    else
    {
      id v22 = @"N/A";
    }
    id v18 = v22;
    id v19 = objc_loadWeakRetained((id *)v43[4].isa + 14);
    id v20 = objc_loadWeakRetained((id *)v43[4].isa + 14);
    char v47 = 0;
    char v45 = 0;
    if (v20)
    {
      id v48 = objc_loadWeakRetained((id *)v43[4].isa + 14);
      int v16 = 1;
      char v47 = 1;
      char v9 = (objc_class *)objc_opt_class();
      id v46 = NSStringFromClass(v9);
      char v45 = 1;
      id v17 = (__CFString *)v46;
    }
    else
    {
      id v17 = @"N/A";
    }
    id v10 = @"Failed to";
    if (v67) {
      id v10 = @"Successfully";
    }
    uint64_t v11 = *((void *)v44 + 5);
    id v14 = &v12;
    buf = v69;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v69, (uint64_t)v42, v40, v41, (uint64_t)v33, v34, v35, (uint64_t)v28, v29, v30, v31, (uint64_t)v23, (uint64_t)WeakRetained, (uint64_t)v18, (uint64_t)v19, (uint64_t)v17, (uint64_t)v10, v11);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n%@ setup auto install error: %@", buf, 0xA8u);
    if (v45) {

    }
    if (v47) {
    if (v49)
    }

    if (v51) {
    if (v53)
    }

    if (v55) {
    if (v57)
    }

    if (v59) {
    if (v61)
    }

    objc_storeStrong(&v63, 0);
  }
  id obja = 0;
  objc_storeStrong((id *)v65, 0);
  (*((void (**)(void))v43[5].isa + 2))();
  objc_storeStrong(&location, obja);
}

- (void)_reallyDownloadAndInstallDidFinishWithResult:(BOOL)a3 andError:(id)a4 forUpdate:(id)a5 withDownload:(id)a6 andDownloadError:(id)a7 usingCompletionHandler:(id)a8
{
  id v87 = &v106;
  id obj = a5;
  id v84 = a6;
  id v85 = a7;
  id v86 = a8;
  id v82 = "-[SUSUISoftwareUpdateManager _reallyDownloadAndInstallDidFinishWithResult:andError:forUpdate:withDownload:andDow"
        "nloadError:usingCompletionHandler:]";
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v121 = self;
  SEL v120 = a2;
  BOOL v119 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v117 = 0;
  objc_storeStrong(&v117, obj);
  id v116 = 0;
  objc_storeStrong(&v116, v84);
  id v115 = 0;
  objc_storeStrong(&v115, v85);
  id v114 = 0;
  objc_storeStrong(&v114, v86);
  id v113 = _SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v87 + 11);
    *(_DWORD *)int v78 = type;
    id v79 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v87 + 19) + 88));
    id v8 = v79;
    char v9 = v87;
    uint64_t v80 = (uint64_t)v8;
    *((void *)v87 + 9) = v8;
    int v81 = *(_DWORD *)(*((void *)v9 + 19) + 88);
    LOBYTE(v9) = *(void *)(*((void *)v9 + 19) + 120) == 0;
    char v110 = 0;
    if (v9)
    {
      uint64_t v76 = @"N/A";
    }
    else
    {
      id v10 = (__CFString *)(id)[*(id *)(*((void *)v87 + 19) + 120) humanReadableUpdateName];
      *((void *)v87 + 8) = v10;
      char v110 = 1;
      uint64_t v76 = v10;
    }
    int v73 = v76;
    uint64_t v74 = *(void *)(*((void *)v87 + 19) + 120);
    uint64_t v75 = *(void *)(*((void *)v87 + 19) + 160);
    BOOL v11 = *(void *)(*((void *)v87 + 19) + 128) == 0;
    char v109 = 0;
    if (v11)
    {
      int v72 = @"N/A";
    }
    else
    {
      uint64_t v12 = (__CFString *)(id)[*(id *)(*((void *)v87 + 19) + 128) humanReadableUpdateName];
      *((void *)v87 + 6) = v12;
      char v109 = 1;
      int v72 = v12;
    }
    uint64_t v68 = v72;
    uint64_t v69 = *(void *)(*((void *)v87 + 19) + 128);
    uint64_t v70 = *(void *)(*((void *)v87 + 19) + 168);
    uint64_t v71 = *(void *)(*((void *)v87 + 19) + 8);
    BOOL v13 = *(void *)(*((void *)v87 + 19) + 8) == 0;
    char v108 = 0;
    char v107 = 0;
    char v105 = 0;
    if (v13
      || (id v14 = (id)[*(id *)(*((void *)v87 + 19) + 8) descriptor],
          *((void *)v87 + 4) = v14,
          char v108 = 1,
          !v14))
    {
      char v67 = @"N/A";
    }
    else
    {
      id v15 = (id)[*(id *)(*((void *)v87 + 19) + 8) descriptor];
      *((void *)v87 + 2) = v15;
      int v66 = 1;
      char v107 = 1;
      int v16 = (__CFString *)(id)[v15 humanReadableUpdateName];
      *(void *)id v87 = v16;
      char v105 = 1;
      char v67 = v16;
    }
    id v63 = v67;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v87 + 19) + 104));
    id v65 = objc_loadWeakRetained((id *)(*((void *)v87 + 19) + 104));
    char v103 = 0;
    char v101 = 0;
    if (v65)
    {
      id v104 = objc_loadWeakRetained((id *)(*((void *)v87 + 19) + 104));
      int v61 = 1;
      char v103 = 1;
      id v17 = (objc_class *)objc_opt_class();
      id v102 = NSStringFromClass(v17);
      char v101 = 1;
      char v62 = (__CFString *)v102;
    }
    else
    {
      char v62 = @"N/A";
    }
    id v58 = v62;
    id v59 = objc_loadWeakRetained((id *)(*((void *)v87 + 19) + 112));
    id v60 = objc_loadWeakRetained((id *)(*((void *)v87 + 19) + 112));
    char v99 = 0;
    char v97 = 0;
    if (v60)
    {
      id v100 = objc_loadWeakRetained((id *)(*((void *)v87 + 19) + 112));
      int v56 = 1;
      char v99 = 1;
      id v18 = (objc_class *)objc_opt_class();
      id v98 = NSStringFromClass(v18);
      char v97 = 1;
      char v57 = (__CFString *)v98;
    }
    else
    {
      char v57 = @"N/A";
    }
    id v52 = v57;
    id v55 = (id)[*((id *)v87 + 15) humanReadableUpdateName];
    id v96 = v55;
    uint64_t v19 = *((void *)v87 + 16);
    uint64_t v20 = *((void *)v87 + 14);
    uint64_t v21 = *((void *)v87 + 13);
    char v53 = &v29;
    buf = v124;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_66((uint64_t)v124, (uint64_t)v82, v80, v81, (uint64_t)v73, v74, v75, (uint64_t)v68, v69, v70, v71, (uint64_t)v63, (uint64_t)WeakRetained, (uint64_t)v58, (uint64_t)v59, (uint64_t)v57, (uint64_t)v96, v19, v20,
      v21);
    _os_log_impl(&dword_228401000, log, v78[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nupdate: %{public}@, error: %{public}@, download: %{public}@, downloadError: %{public}@", buf, 0xBCu);

    if (v97) {
    if (v99)
    }

    if (v101) {
    if (v103)
    }

    if (v105) {
    if (v107)
    }

    if (v108) {
    if (v109)
    }

    if (v110) {
    id v51 = 0;
    }
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v111, v51);
  }
  objc_storeStrong(&v113, 0);
  BOOL v22 = *((void *)v87 + 14) != 0;
  char v94 = 0;
  char v92 = 0;
  BOOL v50 = 0;
  if (!v22)
  {
    id v49 = (id)[*((id *)v87 + 16) domain];
    id v95 = v49;
    int v48 = 1;
    char v94 = 1;
    id v93 = getSUErrorDomain_3();
    char v92 = v48 & 1;
    char v23 = objc_msgSend(v49, "isEqualToString:");
    BOOL v50 = 0;
    if (v23) {
      BOOL v50 = [*((id *)v87 + 16) code] == 11;
    }
  }
  BOOL v47 = v50;
  if (v92) {

  }
  if (v94) {
  if (v47)
  }
  {
    char v24 = [SUSUIUninitializedDownload alloc];
    uint64_t v25 = [(SUSUIUninitializedDownload *)v24 initWithDescriptor:*((void *)v87 + 15)];
    int v26 = (void *)*((void *)v87 + 14);
    *((void *)v87 + 14) = v25;

    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v90 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v44 = oslog;
      *(_DWORD *)char v45 = v90;
      uint64_t v27 = *((void *)v87 + 16);
      uint64_t v28 = *((void *)v87 + 14);
      id v46 = v123;
      __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v123, (uint64_t)v82, v27, v28);
      _os_log_impl(&dword_228401000, v44, v45[0], "%s: Received a nil download and SUErrorCodeDownloadInProgress error (%{public}@) - assigned SUDownloadUninitialized to the download object: %{public}@", v46, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  [*((id *)v87 + 19) setDownload:*((void *)v87 + 14)];
  if (*((void *)v87 + 14))
  {
    id v37 = *(id *)(*((void *)v87 + 19) + 64);
    id v39 = (id)[*((id *)v87 + 14) downloadOptions];
    unsigned int v36 = [v39 downloadFeeAgreementStatus];
    id v38 = (id)[*((id *)v87 + 14) descriptor];
    objc_msgSend(v37, "setCellularFeeAgreementStatus:forUpdate:", v36);

    id v41 = *(id *)(*((void *)v87 + 19) + 64);
    id v43 = (id)[*((id *)v87 + 14) downloadOptions];
    unsigned int v40 = [v43 termsAndConditionsAgreementStatus];
    id v42 = (id)[*((id *)v87 + 14) descriptor];
    objc_msgSend(v41, "setTermsAgreementStatus:forUpdate:", v40);
  }
  if (v119)
  {
    id v34 = (id)[*((id *)v87 + 14) progress];
    int v35 = [v34 isDone];

    if (v35) {
      [*((id *)v87 + 19) setState:10];
    }
    else {
      [*((id *)v87 + 19) setState:12];
    }
  }
  else
  {
    os_log_t v89 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v88 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v31 = v89;
      *(_DWORD *)id v32 = v88;
      id v33 = v122;
      __os_log_helper_16_2_1_8_32((uint64_t)v122, (uint64_t)v82);
      _os_log_impl(&dword_228401000, v31, v32[0], "%s: failed to start download successfuly, calling destroyInstallationKeybag", v33, 0xCu);
    }
    objc_storeStrong((id *)&v89, 0);
    [*(id *)(*((void *)v87 + 19) + 96) destroyInstallationKeybag];
  }
  if (*((void *)v87 + 12)) {
    (*(void (**)(void))(*((void *)v87 + 12) + 16))();
  }
  if (!v119) {
    [*((id *)v87 + 19) handleDownloadError:*((void *)v87 + 16)];
  }
  id v30 = 0;
  objc_storeStrong(&v114, 0);
  objc_storeStrong(&v115, v30);
  objc_storeStrong(&v116, v30);
  objc_storeStrong(&v117, v30);
  objc_storeStrong(&location, v30);
}

- (void)startDownloadAndInstall:(unint64_t)a3 withHandler:(id)a4
{
  id v10 = self;
  SEL v9 = a2;
  unint64_t v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v5 = v10;
  unint64_t v4 = v8;
  BOOL v6 = [(SUSUISoftwareUpdateManager *)v10 update];
  -[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:](v5, "startDownloadAndInstall:update:withHandler:", v4);

  objc_storeStrong(&location, 0);
}

- (void)startDownloadAndInstall:(unint64_t)a3 update:(id)a4 withHandler:(id)a5
{
  id obj = a5;
  int v56 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]";
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v93 = self;
  SEL v92 = a2;
  unint64_t v91 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v89 = 0;
  objc_storeStrong(&v89, obj);
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v52 = type;
    id v53 = SUSUISoftwareUpdateStateToString(v93->_state);
    id v54 = v53;
    id v86 = v54;
    int state = v93->_state;
    BOOL v5 = v93->_preferredUpdate == 0;
    char v84 = 0;
    if (v5)
    {
      BOOL v50 = @"N/A";
    }
    else
    {
      id v85 = (id)[(SUDescriptor *)v93->_preferredUpdate humanReadableUpdateName];
      char v84 = 1;
      BOOL v50 = (__CFString *)v85;
    }
    BOOL v47 = v50;
    preferredUpdate = v93->_preferredUpdate;
    preferredUpdateError = v93->_preferredUpdateError;
    BOOL v6 = v93->_alternateUpdate == 0;
    char v82 = 0;
    if (v6)
    {
      id v46 = @"N/A";
    }
    else
    {
      id v83 = (id)[(SUDescriptor *)v93->_alternateUpdate humanReadableUpdateName];
      char v82 = 1;
      id v46 = (__CFString *)v83;
    }
    id v42 = v46;
    alternateUpdate = v93->_alternateUpdate;
    alternateUpdateError = v93->_alternateUpdateError;
    uint64_t download = v93->_download;
    BOOL v7 = v93->_download == 0;
    char v80 = 0;
    char v78 = 0;
    char v76 = 0;
    if (v7
      || (v81 = [(SUDownload *)v93->_download descriptor], char v80 = 1, !v81))
    {
      id v41 = @"N/A";
    }
    else
    {
      id v79 = [(SUDownload *)v93->_download descriptor];
      int v40 = 1;
      char v78 = 1;
      id v77 = (id)[v79 humanReadableUpdateName];
      char v76 = 1;
      id v41 = (__CFString *)v77;
    }
    id v37 = v41;
    id WeakRetained = objc_loadWeakRetained((id *)&v93->_delegate);
    id v39 = objc_loadWeakRetained((id *)&v93->_delegate);
    char v74 = 0;
    char v72 = 0;
    if (v39)
    {
      id v75 = objc_loadWeakRetained((id *)&v93->_delegate);
      int v35 = 1;
      char v74 = 1;
      unint64_t v8 = (objc_class *)objc_opt_class();
      id v73 = NSStringFromClass(v8);
      char v72 = 1;
      unsigned int v36 = (__CFString *)v73;
    }
    else
    {
      unsigned int v36 = @"N/A";
    }
    id v32 = v36;
    id v33 = objc_loadWeakRetained((id *)&v93->_hostController);
    id v34 = objc_loadWeakRetained((id *)&v93->_hostController);
    char v70 = 0;
    char v68 = 0;
    if (v34)
    {
      id v71 = objc_loadWeakRetained((id *)&v93->_hostController);
      int v30 = 1;
      char v70 = 1;
      SEL v9 = (objc_class *)objc_opt_class();
      id v69 = NSStringFromClass(v9);
      char v68 = 1;
      os_log_t v31 = (__CFString *)v69;
    }
    else
    {
      os_log_t v31 = @"N/A";
    }
    char v23 = v31;
    id v29 = SUInstallationTypeToString(v91);
    id v24 = v29;
    id v67 = v24;
    unint64_t v25 = v91;
    id v28 = (id)[location humanReadableUpdateName];
    id v66 = v28;
    int v26 = &v10;
    buf = v94;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_0_8_64_8_0((uint64_t)v94, (uint64_t)v56, (uint64_t)v54, state, (uint64_t)v47, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v42, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v37, (uint64_t)WeakRetained, (uint64_t)v32, (uint64_t)v33, (uint64_t)v31, (uint64_t)v24, v25, (uint64_t)v66,
      (uint64_t)location);
    _os_log_impl(&dword_228401000, log, v52[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ninstallationType: %@ (%lu), update: %@ (%p)", buf, 0xBCu);

    if (v68) {
    if (v70)
    }

    if (v72) {
    if (v74)
    }

    if (v76) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    if (v84) {
    id v22 = 0;
    }
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, v22);
    objc_storeStrong(&v86, v22);
  }
  objc_storeStrong((id *)&oslog, 0);
  BOOL v65 = 0;
  BOOL v21 = 1;
  if (v91 != 2) {
    BOOL v21 = v91 == 1;
  }
  int v11 = 1;
  BOOL v65 = v21;
  id v14 = v93;
  p_id location = &location;
  id v12 = location;
  BOOL v13 = &v58;
  uint64_t v58 = MEMORY[0x263EF8330];
  int v59 = -1073741824;
  int v60 = 0;
  int v61 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke;
  char v62 = &unk_2648409F0;
  id v17 = (id *)v63;
  v63[0] = v93;
  int v16 = (id *)(v13 + 5);
  v63[1] = location;
  char v64 = v65 & v11;
  v63[3] = v91;
  id v15 = (id *)(v13 + 6);
  id v18 = &v89;
  void v63[2] = v89;
  [(SUSUISoftwareUpdateManager *)v14 cancelOrPurgeIfNecessaryWithUpdate:v12 completion:v13];
  id v20 = 0;
  objc_storeStrong(v15, 0);
  objc_storeStrong(v16, v20);
  objc_storeStrong(v17, v20);
  objc_storeStrong(v18, v20);
  objc_storeStrong(p_location, v20);
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v23 = a1;
  char v22 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v20[2] = (id)a1;
  if ((v22 & 1) == 0 || location)
  {
    if (v22)
    {
      if (location)
      {
        os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v24, (uint64_t)location);
          _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "Error canceling update: %@", v24, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      id v12 = _SUSUILoggingFacility();
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = v12;
        os_log_type_t type = v11;
        __os_log_helper_16_0_0(v10);
        _os_log_impl(&dword_228401000, log, type, "User denied canceling update", v10, 2u);
      }
      objc_storeStrong(&v12, 0);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    char v6 = *(unsigned char *)(a1 + 64);
    uint64_t v13 = MEMORY[0x263EF8330];
    int v14 = -1073741824;
    int v15 = 0;
    int v16 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_2;
    id v17 = &unk_2648409C8;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    v20[1] = *(id *)(a1 + 56);
    v20[0] = *(id *)(a1 + 48);
    [v7 promptForDevicePasscodeForDescriptor:v5 unattendedInstall:v6 & 1 completion:&v13];
    objc_storeStrong(v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(&location, 0);
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_2(NSObject *a1, char a2, id obj)
{
  int v59 = &v75;
  uint64_t v58 = a1;
  char v57 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]_block_invoke_2";
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v86 = a1;
  char v85 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v83[1] = v58;
  v83[0] = (os_log_t)_SUSUILoggingFacility();
  unsigned __int8 v82 = 0;
  if (os_log_type_enabled(v83[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v59 + 13);
    *(_DWORD *)os_log_type_t type = v82;
    id v54 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v58[4].isa + 22));
    id v3 = v54;
    unint64_t v4 = v58;
    uint64_t v55 = (uint64_t)v3;
    *((void *)v59 + 11) = v3;
    int v56 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((void *)v4[4].isa + 15) == 0;
    char v80 = 0;
    if (v4)
    {
      id v51 = @"N/A";
    }
    else
    {
      uint64_t v5 = (__CFString *)(id)[*((id *)v58[4].isa + 15) humanReadableUpdateName];
      *((void *)v59 + 10) = v5;
      char v80 = 1;
      id v51 = v5;
    }
    int v48 = v51;
    uint64_t v49 = *((void *)v58[4].isa + 15);
    uint64_t v50 = *((void *)v58[4].isa + 20);
    BOOL v6 = *((void *)v58[4].isa + 16) == 0;
    char v79 = 0;
    if (v6)
    {
      BOOL v47 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*((id *)v58[4].isa + 16) humanReadableUpdateName];
      *((void *)v59 + 8) = v7;
      char v79 = 1;
      BOOL v47 = v7;
    }
    id v43 = v47;
    uint64_t v44 = *((void *)v58[4].isa + 16);
    uint64_t v45 = *((void *)v58[4].isa + 21);
    uint64_t v46 = *((void *)v58[4].isa + 1);
    BOOL v8 = *((void *)v58[4].isa + 1) == 0;
    char v78 = 0;
    char v77 = 0;
    char v76 = 0;
    if (v8
      || (id v9 = (id)[*((id *)v58[4].isa + 1) descriptor],
          *((void *)v59 + 6) = v9,
          char v78 = 1,
          !v9))
    {
      id v42 = @"N/A";
    }
    else
    {
      id v10 = (id)[*((id *)v58[4].isa + 1) descriptor];
      *((void *)v59 + 4) = v10;
      int v41 = 1;
      char v77 = 1;
      os_log_type_t v11 = (__CFString *)(id)[v10 humanReadableUpdateName];
      *((void *)v59 + 2) = v11;
      char v76 = 1;
      id v42 = v11;
    }
    id v38 = v42;
    id WeakRetained = objc_loadWeakRetained((id *)v58[4].isa + 13);
    id v40 = objc_loadWeakRetained((id *)v58[4].isa + 13);
    char v74 = 0;
    char v72 = 0;
    if (v40)
    {
      *(void *)int v59 = objc_loadWeakRetained((id *)v58[4].isa + 13);
      int v36 = 1;
      char v74 = 1;
      id v12 = (objc_class *)objc_opt_class();
      id v73 = NSStringFromClass(v12);
      char v72 = 1;
      id v37 = (__CFString *)v73;
    }
    else
    {
      id v37 = @"N/A";
    }
    id v33 = v37;
    id v34 = objc_loadWeakRetained((id *)v58[4].isa + 14);
    id v35 = objc_loadWeakRetained((id *)v58[4].isa + 14);
    char v70 = 0;
    char v68 = 0;
    if (v35)
    {
      id v71 = objc_loadWeakRetained((id *)v58[4].isa + 14);
      int v31 = 1;
      char v70 = 1;
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v69 = NSStringFromClass(v13);
      char v68 = 1;
      id v32 = (__CFString *)v69;
    }
    else
    {
      id v32 = @"N/A";
    }
    uint64_t v14 = *((void *)v59 + 15);
    id v29 = &v16;
    buf = v87;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v87, (uint64_t)v57, v55, v56, (uint64_t)v48, v49, v50, (uint64_t)v43, v44, v45, v46, (uint64_t)v38, (uint64_t)WeakRetained, (uint64_t)v33, (uint64_t)v34, (uint64_t)v32, v85 & 1, v14);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nsuccess: %d, passcodeError: %@", buf, 0xA4u);
    if (v68) {

    }
    if (v70) {
    if (v72)
    }

    if (v74) {
    if (v76)
    }

    if (v77) {
    if (v78)
    }

    if (v79) {
    if (v80)
    }

    objc_storeStrong(&v81, 0);
  }
  objc_storeStrong((id *)v83, 0);
  if (v85)
  {
    Class isa = v58[4].isa;
    uint64_t v22 = (uint64_t)v58[5].isa;
    uint64_t v23 = &v62;
    uint64_t v62 = MEMORY[0x263EF8330];
    int v63 = -1073741824;
    int v64 = 0;
    BOOL v65 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_450;
    id v66 = &unk_2648409C8;
    uint64_t v27 = (id *)v67;
    v67[0] = v58[4].isa;
    int v26 = (id *)(v23 + 5);
    v67[1] = v58[5].isa;
    v67[3] = v58[7].isa;
    uint64_t v25 = (id *)(v23 + 6);
    v67[2] = v58[6].isa;
    [(objc_class *)isa presentTermsIfNecessaryForUpdate:v22 completion:v23];
    id obja = 0;
    objc_storeStrong(v25, 0);
    objc_storeStrong(v26, obja);
    objc_storeStrong(v27, obja);
  }
  else
  {
    BOOL v15 = *((void *)v59 + 15) == 0;
    char v60 = 0;
    int v21 = 0;
    if (!v15)
    {
      id v61 = (id)[(objc_class *)v58[4].isa delegate];
      char v60 = 1;
      int v21 = objc_opt_respondsToSelector();
    }
    int v20 = v21;
    if (v60) {

    }
    if (v20)
    {
      id v19 = (id)[(objc_class *)v58[4].isa delegate];
      uint64_t v17 = (uint64_t)v58[4].isa;
      id v18 = (id)[(objc_class *)v58[4].isa download];
      objc_msgSend(v19, "manager:download:failedWithError:", v17);
    }
    if (v58[6].isa) {
      (*((void (**)(void))v58[6].isa + 2))();
    }
  }
  objc_storeStrong(&location, 0);
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_450(uint64_t a1, char a2, id obj)
{
  uint64_t v56 = a1;
  id v54 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]_block_invoke";
  uint64_t v55 = "-[SUSUISoftwareUpdateManager startDownloadAndInstall:update:withHandler:]_block_invoke_2";
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v97 = a1;
  char v96 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v94[1] = (id)v56;
  v94[0] = _SUSUILoggingFacility();
  unsigned __int8 v93 = 0;
  if (os_log_type_enabled((os_log_t)v94[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v94[0];
    *(_DWORD *)os_log_type_t type = v93;
    id v51 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v56 + 32) + 88));
    id v52 = v51;
    id v92 = v52;
    int v53 = *(_DWORD *)(*(void *)(v56 + 32) + 88);
    BOOL v3 = *(void *)(*(void *)(v56 + 32) + 120) == 0;
    char v90 = 0;
    if (v3)
    {
      int v48 = @"N/A";
    }
    else
    {
      id v91 = (id)[*(id *)(*(void *)(v56 + 32) + 120) humanReadableUpdateName];
      char v90 = 1;
      int v48 = (__CFString *)v91;
    }
    uint64_t v45 = v48;
    uint64_t v46 = *(void *)(*(void *)(v56 + 32) + 120);
    uint64_t v47 = *(void *)(*(void *)(v56 + 32) + 160);
    BOOL v4 = *(void *)(*(void *)(v56 + 32) + 128) == 0;
    char v88 = 0;
    if (v4)
    {
      uint64_t v44 = @"N/A";
    }
    else
    {
      id v89 = (id)[*(id *)(*(void *)(v56 + 32) + 128) humanReadableUpdateName];
      char v88 = 1;
      uint64_t v44 = (__CFString *)v89;
    }
    id v40 = v44;
    uint64_t v41 = *(void *)(*(void *)(v56 + 32) + 128);
    uint64_t v42 = *(void *)(*(void *)(v56 + 32) + 168);
    uint64_t v43 = *(void *)(*(void *)(v56 + 32) + 8);
    BOOL v5 = *(void *)(*(void *)(v56 + 32) + 8) == 0;
    char v86 = 0;
    char v84 = 0;
    char v82 = 0;
    if (v5
      || (id v87 = (id)[*(id *)(*(void *)(v56 + 32) + 8) descriptor],
          char v86 = 1,
          !v87))
    {
      id v39 = @"N/A";
    }
    else
    {
      id v85 = (id)[*(id *)(*(void *)(v56 + 32) + 8) descriptor];
      int v38 = 1;
      char v84 = 1;
      id v83 = (id)[v85 humanReadableUpdateName];
      char v82 = 1;
      id v39 = (__CFString *)v83;
    }
    id v35 = v39;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v56 + 32) + 104));
    id v37 = objc_loadWeakRetained((id *)(*(void *)(v56 + 32) + 104));
    char v80 = 0;
    char v78 = 0;
    if (v37)
    {
      id v81 = objc_loadWeakRetained((id *)(*(void *)(v56 + 32) + 104));
      int v33 = 1;
      char v80 = 1;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v79 = NSStringFromClass(v6);
      char v78 = 1;
      id v34 = (__CFString *)v79;
    }
    else
    {
      id v34 = @"N/A";
    }
    int v30 = v34;
    id v31 = objc_loadWeakRetained((id *)(*(void *)(v56 + 32) + 112));
    id v32 = objc_loadWeakRetained((id *)(*(void *)(v56 + 32) + 112));
    char v76 = 0;
    char v74 = 0;
    if (v32)
    {
      id v77 = objc_loadWeakRetained((id *)(*(void *)(v56 + 32) + 112));
      int v28 = 1;
      char v76 = 1;
      BOOL v7 = (objc_class *)objc_opt_class();
      id v75 = NSStringFromClass(v7);
      char v74 = 1;
      id v29 = (__CFString *)v75;
    }
    else
    {
      id v29 = @"N/A";
    }
    int v26 = &v9;
    buf = v99;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v99, (uint64_t)v54, (uint64_t)v52, v53, (uint64_t)v45, v46, v47, (uint64_t)v40, v41, v42, v43, (uint64_t)v35, (uint64_t)WeakRetained, (uint64_t)v30, (uint64_t)v31, (uint64_t)v29, v96 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\ntermsAccepted: %d, termsError: %@", buf, 0xA4u);
    if (v74) {

    }
    if (v76) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    if (v84) {
    if (v86)
    }

    if (v88) {
    if (v90)
    }

    objc_storeStrong(&v92, 0);
  }
  objc_storeStrong(v94, 0);
  unsigned int v73 = 0;
  if (v96) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }
  unsigned int v73 = v8;
  id v25 = (id)[*(id *)(v56 + 32) download];
  id v24 = (id)[v25 downloadOptions];
  [v24 setTermsAndConditionsAgreementStatus:v73];

  if (v96)
  {
    id v19 = *(id *)(v56 + 32);
    id v18 = &v66;
    uint64_t v66 = MEMORY[0x263EF8330];
    int v67 = -1073741824;
    int v68 = 0;
    id v69 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_451;
    char v70 = &unk_2648409A0;
    uint64_t v22 = (id *)v71;
    v71[0] = *(id *)(v56 + 32);
    int v21 = (id *)(v18 + 5);
    v71[1] = *(id *)(v56 + 40);
    unsigned int v72 = v73;
    v71[3] = *(void *)(v56 + 56);
    int v20 = (id *)(v18 + 6);
    v71[2] = *(id *)(v56 + 48);
    [v19 _alertForDownloadConstraintsWithCompletion:v18];
    id obja = 0;
    objc_storeStrong(v20, 0);
    objc_storeStrong(v21, obja);
    objc_storeStrong(v22, obja);
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v15 = oslog;
      *(_DWORD *)uint64_t v16 = v64;
      uint64_t v17 = v98;
      __os_log_helper_16_2_1_8_32((uint64_t)v98, (uint64_t)v55);
      _os_log_impl(&dword_228401000, v15, v16[0], "%s: terms not accepted, calling destroyInstallationKeybag", v17, 0xCu);
    }
    id v14 = 0;
    objc_storeStrong((id *)&oslog, 0);
    id v11 = *(id *)(*(void *)(v56 + 32) + 56);
    id v10 = &v57;
    uint64_t v57 = MEMORY[0x263EF8330];
    int v58 = -1073741824;
    int v59 = 0;
    char v60 = __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_453;
    id v61 = &unk_26483EB18;
    uint64_t v13 = &v63;
    id v63 = *(id *)(v56 + 48);
    id v12 = (id *)(v10 + 4);
    id v62 = location;
    [v11 destroyInstallationKeybag:v10];
    objc_storeStrong(v12, v14);
    objc_storeStrong(v13, v14);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_451(uint64_t a1, unsigned int a2)
{
  return [*(id *)(a1 + 32) _reallyDownloadAndInstall:*(void *)(a1 + 56) update:*(void *)(a1 + 40) AcceptingCellularFees:a2 completion:*(void *)(a1 + 48)];
}

void __73__SUSUISoftwareUpdateManager_startDownloadAndInstall_update_withHandler___block_invoke_453(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (void)_reallyResumeDownloadAcceptingCellularFees:(int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v17 = self;
  SEL v16 = a2;
  unsigned int v15 = a3;
  id v14 = [(SUSUISoftwareUpdateManager *)self download];
  id v13 = [(SUDownload *)v14 downloadOptions];
  [v13 setDownloadFeeAgreementStatus:v15];
  id location = _SUSUILoggingFacility();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v18, v15);
    _os_log_impl(&dword_228401000, (os_log_t)location, v11, "Resuming SU download with cellular fee acceptance state: %d", v18, 8u);
  }
  objc_storeStrong(&location, 0);
  BOOL v4 = [(SUSUISoftwareUpdateManager *)v17 SUManager];
  BOOL v3 = [(SUDownload *)v14 downloadOptions];
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __73__SUSUISoftwareUpdateManager__reallyResumeDownloadAcceptingCellularFees___block_invoke;
  uint64_t v9 = &unk_264840358;
  id v10 = v17;
  [(SUManagerClient *)v4 updateDownloadOptions:v3 withResult:&v5];

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v14, 0);
}

void __73__SUSUISoftwareUpdateManager__reallyResumeDownloadAcceptingCellularFees___block_invoke(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v8, (uint64_t)"-[SUSUISoftwareUpdateManager _reallyResumeDownloadAcceptingCellularFees:]_block_invoke", v6 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s - resumeSuccessful: %d; error: %{public}@",
      v8,
      0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v6) {
    [(objc_class *)a1[4].isa refreshState];
  }
  else {
    [(objc_class *)a1[4].isa handleDownloadError:location];
  }
  objc_storeStrong(&location, 0);
}

- (void)resumeDownload
{
  v8[2] = self;
  v8[1] = (id)a2;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  char v6 = __44__SUSUISoftwareUpdateManager_resumeDownload__block_invoke;
  int v7 = &unk_264840A18;
  v8[0] = self;
  -[SUSUISoftwareUpdateManager _alertForDownloadConstraintsWithCompletion:](self, "_alertForDownloadConstraintsWithCompletion:");
  objc_storeStrong(v8, 0);
}

uint64_t __44__SUSUISoftwareUpdateManager_resumeDownload__block_invoke(uint64_t a1, unsigned int a2)
{
  return [*(id *)(a1 + 32) _reallyResumeDownloadAcceptingCellularFees:a2];
}

- (void)_updateDownloadProgressWithDownload:(id)a3 stateFromDownload:(int *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v27 = a4;
  id v26 = (id)[location[0] progress];
  unsigned int v25 = 0;
  [v26 normalizedPercentComplete];
  float v24 = v4;
  [v26 percentComplete];
  float v23 = v5;
  id v22 = (id)[v26 phase];
  if (a4) {
    *uint64_t v27 = v29->_state;
  }
  id v21 = _SUSUILoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [(SUSUISoftwareUpdateManager *)v29 state];
    [v26 timeRemaining];
    __os_log_helper_16_2_6_8_32_8_0_8_64_8_0_4_0_8_0((uint64_t)v31, (uint64_t)"-[SUSUISoftwareUpdateManager _updateDownloadProgressWithDownload:stateFromDownload:]", COERCE__INT64(v23), (uint64_t)v22, COERCE__INT64(v24), v17, v6);
    _os_log_impl(&dword_228401000, (os_log_t)v21, v20, "%s - progress: %.02f; phase: %@; totalProgress: %.02f; state: %d; time remaining: %f",
      v31,
      0x3Au);
  }
  objc_storeStrong(&v21, 0);
  int v7 = [(SUSUISoftwareUpdateManager *)v29 preferredUpdate];
  BOOL v16 = v7 != 0;

  if (v16)
  {
    if (SUPrefsDownloadPhaseIsStalled_0(v22))
    {
      if (v27) {
        *uint64_t v27 = 14;
      }
      unsigned int v25 = 2;
    }
    else if ([(SUSUISoftwareUpdateManager *)v29 _SUDownloadPhaseIsQueued:v22])
    {
      if (v27) {
        *uint64_t v27 = 5;
      }
    }
    else if (([v26 isDone] & 1) == 0)
    {
      [v26 timeRemaining];
      BOOL v15 = 0;
      if (v8 < 604800.0)
      {
        [v26 timeRemaining];
        BOOL v15 = v9 > 0.0;
      }
      id v12 = v22;
      id v13 = getkSUDownloadPhasePreparingForInstallation_1();
      char v14 = 1;
      if ((objc_msgSend(v12, "isEqualToString:") & 1) == 0)
      {
        char v11 = 0;
        if (v23 >= 0.005) {
          char v11 = v15;
        }
        char v14 = v11;
      }

      if (v14) {
        unsigned int v25 = 1;
      }
      if (v27)
      {
        if (v29->_state == 13) {
          *uint64_t v27 = 13;
        }
        else {
          *uint64_t v27 = 12;
        }
      }
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v30, (uint64_t)"-[SUSUISoftwareUpdateManager _updateDownloadProgressWithDownload:stateFromDownload:]");
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s - no preferred update yet, ignoring progress update", v30, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v10 = [(SUSUISoftwareUpdateManager *)v29 delegate];
  [(SUSUISoftwareUpdateManagerDelegate *)v10 manager:v29 downloadProgressChanged:location[0] displayStyle:v25];

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (void)upgradeDownloadToUserInitiated
{
  float v4 = self;
  v3[1] = (id)a2;
  uint64_t v2 = [(SUSUISoftwareUpdateManager *)self download];
  v3[0] = [(SUDownload *)v2 downloadOptions];

  [v3[0] setAutoDownload:0];
  [(SUSUISoftwareUpdateClientManager *)v4->_suClient updateDownloadOptions:v3[0] completion:&__block_literal_global_5];
  objc_storeStrong(v3, 0);
}

void __60__SUSUISoftwareUpdateManager_upgradeDownloadToUserInitiated__block_invoke(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v6 & 1) == 0)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)location);
      _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "Failed to update download options: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)setAutoInstall:(id)a3
{
  uint64_t v45 = "-[SUSUISoftwareUpdateManager setAutoInstall:]";
  uint64_t v76 = *MEMORY[0x263EF8340];
  char v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v72 = _SUSUILoggingFacility();
  unsigned __int8 v71 = 0;
  if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v72;
    *(_DWORD *)os_log_type_t type = v71;
    id v42 = SUSUISoftwareUpdateStateToString(v74->_state);
    id v43 = v42;
    id v70 = v43;
    int state = v74->_state;
    BOOL v3 = v74->_preferredUpdate == 0;
    char v68 = 0;
    if (v3)
    {
      id v39 = @"N/A";
    }
    else
    {
      id v69 = (__CFString *)(id)[(SUDescriptor *)v74->_preferredUpdate humanReadableUpdateName];
      char v68 = 1;
      id v39 = v69;
    }
    int v36 = v39;
    preferredUpdate = v74->_preferredUpdate;
    preferredUpdateError = v74->_preferredUpdateError;
    BOOL v4 = v74->_alternateUpdate == 0;
    char v66 = 0;
    if (v4)
    {
      id v35 = @"N/A";
    }
    else
    {
      int v67 = (__CFString *)(id)[(SUDescriptor *)v74->_alternateUpdate humanReadableUpdateName];
      char v66 = 1;
      id v35 = v67;
    }
    id v31 = v35;
    alternateUpdate = v74->_alternateUpdate;
    alternateUpdateError = v74->_alternateUpdateError;
    uint64_t download = v74->_download;
    BOOL v5 = v74->_download == 0;
    char v64 = 0;
    char v62 = 0;
    char v60 = 0;
    if (v5
      || (v65 = [(SUDownload *)v74->_download descriptor], char v64 = 1, !v65))
    {
      int v30 = @"N/A";
    }
    else
    {
      id v63 = [(SUDownload *)v74->_download descriptor];
      int v29 = 1;
      char v62 = 1;
      id v61 = (id)[v63 humanReadableUpdateName];
      char v60 = 1;
      int v30 = (__CFString *)v61;
    }
    id v26 = v30;
    id WeakRetained = objc_loadWeakRetained((id *)&v74->_delegate);
    id v28 = objc_loadWeakRetained((id *)&v74->_delegate);
    char v58 = 0;
    char v56 = 0;
    if (v28)
    {
      id v59 = objc_loadWeakRetained((id *)&v74->_delegate);
      int v24 = 1;
      char v58 = 1;
      char v6 = (objc_class *)objc_opt_class();
      id v57 = NSStringFromClass(v6);
      char v56 = 1;
      unsigned int v25 = (__CFString *)v57;
    }
    else
    {
      unsigned int v25 = @"N/A";
    }
    id v21 = v25;
    id v22 = objc_loadWeakRetained((id *)&v74->_hostController);
    id v23 = objc_loadWeakRetained((id *)&v74->_hostController);
    char v54 = 0;
    char v52 = 0;
    if (v23)
    {
      id v55 = objc_loadWeakRetained((id *)&v74->_hostController);
      int v19 = 1;
      char v54 = 1;
      int v7 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v7);
      char v52 = 1;
      os_log_type_t v20 = (__CFString *)v53;
    }
    else
    {
      os_log_type_t v20 = @"N/A";
    }
    int v17 = &v8;
    buf = v75;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v75, (uint64_t)v45, (uint64_t)v43, state, (uint64_t)v36, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v31, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if (v52) {

    }
    if (v54) {
    if (v56)
    }

    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    if (v66) {
    if (v68)
    }

    objc_storeStrong(&v70, 0);
  }
  id obj = 0;
  objc_storeStrong(&v72, 0);
  id v10 = v74;
  id v12 = [(SUSUISoftwareUpdateManager *)v74 download];
  id v11 = (id)[v12 descriptor];
  uint64_t v9 = &v46;
  uint64_t v46 = MEMORY[0x263EF8330];
  int v47 = -1073741824;
  int v48 = 0;
  uint64_t v49 = __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke;
  uint64_t v50 = &unk_26483DF58;
  char v14 = (id *)v51;
  v51[0] = v74;
  id v13 = (id *)(v9 + 5);
  BOOL v15 = location;
  v51[1] = location[0];
  [(SUSUISoftwareUpdateManager *)v10 promptForDevicePasscodeForDescriptor:v11 unattendedInstall:1 completion:v9];

  objc_storeStrong(v13, obj);
  objc_storeStrong(v14, obj);
  objc_storeStrong(v15, obj);
}

void __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke(id *a1, char a2, id obj)
{
  BOOL v16 = a1;
  char v15 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v13[1] = a1;
  if (v15)
  {
    id v3 = a1[4];
    id v5 = (id)[v3 download];
    id v4 = (id)[v5 descriptor];
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_2;
    id v11 = &unk_26483DF58;
    id v12 = a1[4];
    v13[0] = a1[5];
    [v3 presentTermsIfNecessaryForUpdate:v4 completion:&v7];

    objc_storeStrong(v13, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_2(NSObject *a1, char a2, id obj)
{
  char v52 = &v72;
  id v51 = a1;
  uint64_t v49 = "-[SUSUISoftwareUpdateManager setAutoInstall:]_block_invoke_2";
  uint64_t v50 = "-[SUSUISoftwareUpdateManager setAutoInstall:]_block_invoke";
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v81 = a1;
  char v80 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v78[1] = v51;
  v78[0] = (os_log_t)_SUSUILoggingFacility();
  unsigned __int8 v77 = 0;
  if (os_log_type_enabled(v78[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v52 + 9);
    *(_DWORD *)os_log_type_t type = v77;
    id v46 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v51[4].isa + 22));
    id v3 = v46;
    id v4 = v51;
    uint64_t v47 = (uint64_t)v3;
    *((void *)v52 + 7) = v3;
    int v48 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((void *)v4[4].isa + 15) == 0;
    char v75 = 0;
    if (v4)
    {
      id v43 = @"N/A";
    }
    else
    {
      id v5 = (__CFString *)(id)[*((id *)v51[4].isa + 15) humanReadableUpdateName];
      *((void *)v52 + 6) = v5;
      char v75 = 1;
      id v43 = v5;
    }
    id v40 = v43;
    uint64_t v41 = *((void *)v51[4].isa + 15);
    uint64_t v42 = *((void *)v51[4].isa + 20);
    BOOL v6 = *((void *)v51[4].isa + 16) == 0;
    char v74 = 0;
    if (v6)
    {
      id v39 = @"N/A";
    }
    else
    {
      uint64_t v7 = (__CFString *)(id)[*((id *)v51[4].isa + 16) humanReadableUpdateName];
      *((void *)v52 + 4) = v7;
      char v74 = 1;
      id v39 = v7;
    }
    id v35 = v39;
    uint64_t v36 = *((void *)v51[4].isa + 16);
    uint64_t v37 = *((void *)v51[4].isa + 21);
    uint64_t v38 = *((void *)v51[4].isa + 1);
    BOOL v8 = *((void *)v51[4].isa + 1) == 0;
    char v73 = 0;
    char v71 = 0;
    char v69 = 0;
    if (v8
      || (id v9 = (id)[*((id *)v51[4].isa + 1) descriptor],
          *((void *)v52 + 2) = v9,
          char v73 = 1,
          !v9))
    {
      id v34 = @"N/A";
    }
    else
    {
      id v10 = (id)[*((id *)v51[4].isa + 1) descriptor];
      *(void *)char v52 = v10;
      int v33 = 1;
      char v71 = 1;
      id v70 = (id)[v10 humanReadableUpdateName];
      char v69 = 1;
      id v34 = (__CFString *)v70;
    }
    int v30 = v34;
    id WeakRetained = objc_loadWeakRetained((id *)v51[4].isa + 13);
    id v32 = objc_loadWeakRetained((id *)v51[4].isa + 13);
    char v67 = 0;
    char v65 = 0;
    if (v32)
    {
      id v68 = objc_loadWeakRetained((id *)v51[4].isa + 13);
      int v28 = 1;
      char v67 = 1;
      id v11 = (objc_class *)objc_opt_class();
      id v66 = NSStringFromClass(v11);
      char v65 = 1;
      int v29 = (__CFString *)v66;
    }
    else
    {
      int v29 = @"N/A";
    }
    unsigned int v25 = v29;
    id v26 = objc_loadWeakRetained((id *)v51[4].isa + 14);
    id v27 = objc_loadWeakRetained((id *)v51[4].isa + 14);
    char v63 = 0;
    char v61 = 0;
    if (v27)
    {
      id v64 = objc_loadWeakRetained((id *)v51[4].isa + 14);
      int v23 = 1;
      char v63 = 1;
      id v12 = (objc_class *)objc_opt_class();
      id v62 = NSStringFromClass(v12);
      char v61 = 1;
      int v24 = (__CFString *)v62;
    }
    else
    {
      int v24 = @"N/A";
    }
    uint64_t v13 = *((void *)v52 + 11);
    id v21 = &v14;
    buf = v83;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v83, (uint64_t)v49, v47, v48, (uint64_t)v40, v41, v42, (uint64_t)v35, v36, v37, v38, (uint64_t)v30, (uint64_t)WeakRetained, (uint64_t)v25, (uint64_t)v26, (uint64_t)v24, v80 & 1, v13);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\naccepted: %d, error: %@", buf, 0xA4u);
    if (v61) {

    }
    if (v63) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    if (v71) {
    if (v73)
    }

    if (v74) {
    if (v75)
    }

    objc_storeStrong(&v76, 0);
  }
  objc_storeStrong((id *)v78, 0);
  if (v80)
  {
    id v19 = (id)*((void *)v51[4].isa + 7);
    id v18 = &v55;
    uint64_t v55 = MEMORY[0x263EF8330];
    int v56 = -1073741824;
    int v57 = 0;
    char v58 = __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_456;
    id v59 = &unk_264840A60;
    os_log_type_t v20 = (id *)&v60;
    char v60 = v51[5].isa;
    [v19 currentAutoInstallOperation:1 completion:v18];
    objc_storeStrong(v20, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v53 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v15 = oslog;
      *(_DWORD *)BOOL v16 = v53;
      int v17 = v82;
      __os_log_helper_16_2_1_8_32((uint64_t)v82, (uint64_t)v50);
      _os_log_impl(&dword_228401000, v15, v16[0], "%s: Auto install failed (T&C not accepted)", v17, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v51[5].isa) {
      (*((void (**)(void))v51[5].isa + 2))();
    }
  }
  objc_storeStrong(&location, 0);
}

void __45__SUSUISoftwareUpdateManager_setAutoInstall___block_invoke_456(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  BOOL v8 = a1;
  if (a1[4])
  {
    char v7 = 0;
    LOBYTE(v3) = 0;
    if ([location[0] agreementStatus] == 1) {
      int v3 = [location[0] isCanceled] ^ 1;
    }
    char v7 = v3 & 1;
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateManager setAutoInstall:]_block_invoke", v7 & 1);
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: Auto install started successfully - %d", v11, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)checkAutoInstall
{
  id v4 = [(SUSUISoftwareUpdateManager *)self download];
  int v3 = [(SUDownload *)v4 progress];
  char v5 = [(SUOperationProgress *)v3 isDone];

  if (v5)
  {
    if ([(SUSUISoftwareUpdateClientManager *)self->_suClient isAutoUpdateArmedAndReady]) {
      uint64_t v2 = 11;
    }
    else {
      uint64_t v2 = 10;
    }
    [(SUSUISoftwareUpdateManager *)self setState:v2];
  }
}

- (BOOL)isAutoInstallArmedAndReady
{
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isAutoUpdateArmedAndReady];
}

- (void)cancelAutoInstall
{
}

- (BOOL)automaticUpdateScheduled
{
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isAutoUpdateScheduled];
}

- (BOOL)automaticUpdateEnabled:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isAutoInstallEnabled];
}

- (void)setAutomaticUpdateEnabled:(BOOL)a3
{
}

- (BOOL)automaticUpdatePreviousUserSpecifiedStatus:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isAutoInstallPreviousUserSettingsEnabled];
}

- (void)setPreviousUserSpecifiedAutomaticUpdateStatus:(BOOL)a3
{
}

- (BOOL)automaticDownloadEnabled:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isAutoDownloadEnabled];
}

- (void)setAutomaticDownloadEnabled:(BOOL)a3
{
}

- (BOOL)securityResponseStatus:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isSecurityResponseEnabled];
}

- (void)setSecurityResponseStatus:(BOOL)a3
{
}

- (BOOL)previousUserSpecifiedSecurityResponseStatus:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient previousUserSpecifiedSecurityResponseEnabled];
}

- (void)setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
}

- (BOOL)automaticInstallSystemDataFilesStatusEnabled:(BOOL *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isAutomaticInstallSystemDataFilesEnabled];
}

- (void)setAutomaticInstallSystemDataFilesStatusEnabled:(BOOL)a3
{
}

- (BOOL)isRollingBack
{
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient isRollingBack];
}

- (id)eligibleRollback
{
  return [(SUSUISoftwareUpdateClientManager *)self->_suClient eligibleRollback];
}

- (void)startRollbackWithOptions:(id)a3 withHandler:(id)a4
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(SUSUISoftwareUpdateClientManager *)v7->_suClient rollbackUpdateWithOptions:location[0] completion:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)startInstallWithHandler:(id)a3
{
  id v46 = "-[SUSUISoftwareUpdateManager startInstallWithHandler:]";
  uint64_t v77 = *MEMORY[0x263EF8340];
  char v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v73 = _SUSUILoggingFacility();
  unsigned __int8 v72 = 0;
  if (os_log_type_enabled((os_log_t)v73, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v73;
    *(_DWORD *)os_log_type_t type = v72;
    id v43 = SUSUISoftwareUpdateStateToString(v75->_state);
    id v44 = v43;
    id v71 = v44;
    int state = v75->_state;
    BOOL v3 = v75->_preferredUpdate == 0;
    char v69 = 0;
    if (v3)
    {
      id v40 = @"N/A";
    }
    else
    {
      id v70 = (__CFString *)(id)[(SUDescriptor *)v75->_preferredUpdate humanReadableUpdateName];
      char v69 = 1;
      id v40 = v70;
    }
    uint64_t v37 = v40;
    preferredUpdate = v75->_preferredUpdate;
    preferredUpdateError = v75->_preferredUpdateError;
    BOOL v4 = v75->_alternateUpdate == 0;
    char v67 = 0;
    if (v4)
    {
      uint64_t v36 = @"N/A";
    }
    else
    {
      id v68 = (__CFString *)(id)[(SUDescriptor *)v75->_alternateUpdate humanReadableUpdateName];
      char v67 = 1;
      uint64_t v36 = v68;
    }
    id v32 = v36;
    alternateUpdate = v75->_alternateUpdate;
    alternateUpdateError = v75->_alternateUpdateError;
    uint64_t download = v75->_download;
    BOOL v5 = v75->_download == 0;
    char v65 = 0;
    char v63 = 0;
    char v61 = 0;
    if (v5
      || (v66 = [(SUDownload *)v75->_download descriptor], char v65 = 1, !v66))
    {
      id v31 = @"N/A";
    }
    else
    {
      id v64 = [(SUDownload *)v75->_download descriptor];
      int v30 = 1;
      char v63 = 1;
      id v62 = (id)[v64 humanReadableUpdateName];
      char v61 = 1;
      id v31 = (__CFString *)v62;
    }
    id v27 = v31;
    id WeakRetained = objc_loadWeakRetained((id *)&v75->_delegate);
    id v29 = objc_loadWeakRetained((id *)&v75->_delegate);
    char v59 = 0;
    char v57 = 0;
    if (v29)
    {
      id v60 = objc_loadWeakRetained((id *)&v75->_delegate);
      int v25 = 1;
      char v59 = 1;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v58 = NSStringFromClass(v6);
      char v57 = 1;
      id v26 = (__CFString *)v58;
    }
    else
    {
      id v26 = @"N/A";
    }
    id v22 = v26;
    id v23 = objc_loadWeakRetained((id *)&v75->_hostController);
    id v24 = objc_loadWeakRetained((id *)&v75->_hostController);
    char v55 = 0;
    char v53 = 0;
    if (v24)
    {
      id v56 = objc_loadWeakRetained((id *)&v75->_hostController);
      int v20 = 1;
      char v55 = 1;
      char v7 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v7);
      char v53 = 1;
      id v21 = (__CFString *)v54;
    }
    else
    {
      id v21 = @"N/A";
    }
    id v18 = &v8;
    buf = v76;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v76, (uint64_t)v46, (uint64_t)v44, state, (uint64_t)v37, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v32, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if (v53) {

    }
    if (v55) {
    if (v57)
    }

    if (v59) {
    if (v61)
    }

    if (v63) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    objc_storeStrong(&v71, 0);
  }
  id obj = 0;
  objc_storeStrong(&v73, 0);
  id v11 = v75;
  id v13 = [(SUSUISoftwareUpdateManager *)v75 download];
  id v12 = (id)[v13 descriptor];
  id v10 = &v47;
  uint64_t v47 = MEMORY[0x263EF8330];
  int v48 = -1073741824;
  int v9 = 0;
  int v49 = 0;
  uint64_t v50 = __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke;
  id v51 = &unk_26483DF58;
  os_log_t v15 = (id *)v52;
  v52[0] = v75;
  uint64_t v14 = (id *)(v10 + 5);
  BOOL v16 = location;
  v52[1] = location[0];
  [(SUSUISoftwareUpdateManager *)v11 promptForDevicePasscodeForDescriptor:v12 unattendedInstall:v9 & 1 completion:v10];

  objc_storeStrong(v14, obj);
  objc_storeStrong(v15, obj);
  objc_storeStrong(v16, obj);
}

void __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke(id *a1, char a2, id obj)
{
  uint64_t v45 = a1;
  id v44 = "-[SUSUISoftwareUpdateManager startInstallWithHandler:]_block_invoke";
  uint64_t v77 = *MEMORY[0x263EF8340];
  char v75 = a1;
  char v74 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v72[1] = v45;
  v72[0] = _SUSUILoggingFacility();
  unsigned __int8 v71 = 0;
  if (os_log_type_enabled((os_log_t)v72[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v72[0];
    *(_DWORD *)os_log_type_t type = v71;
    id v41 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v45[4] + 22));
    id v42 = v41;
    id v70 = v42;
    int v43 = *((_DWORD *)v45[4] + 22);
    BOOL v3 = *((void *)v45[4] + 15) == 0;
    char v68 = 0;
    if (v3)
    {
      uint64_t v38 = @"N/A";
    }
    else
    {
      char v69 = (__CFString *)(id)[*((id *)v45[4] + 15) humanReadableUpdateName];
      char v68 = 1;
      uint64_t v38 = v69;
    }
    id v35 = v38;
    uint64_t v36 = *((void *)v45[4] + 15);
    uint64_t v37 = *((void *)v45[4] + 20);
    BOOL v4 = *((void *)v45[4] + 16) == 0;
    char v66 = 0;
    if (v4)
    {
      id v34 = @"N/A";
    }
    else
    {
      id v67 = (id)[*((id *)v45[4] + 16) humanReadableUpdateName];
      char v66 = 1;
      id v34 = (__CFString *)v67;
    }
    int v30 = v34;
    uint64_t v31 = *((void *)v45[4] + 16);
    uint64_t v32 = *((void *)v45[4] + 21);
    uint64_t v33 = *((void *)v45[4] + 1);
    BOOL v5 = *((void *)v45[4] + 1) == 0;
    char v64 = 0;
    char v62 = 0;
    char v60 = 0;
    if (v5
      || (v65 = (id)[*((id *)v45[4] + 1) descriptor], char v64 = 1, !v65))
    {
      id v29 = @"N/A";
    }
    else
    {
      id v63 = (id)[*((id *)v45[4] + 1) descriptor];
      int v28 = 1;
      char v62 = 1;
      id v61 = (id)[v63 humanReadableUpdateName];
      char v60 = 1;
      id v29 = (__CFString *)v61;
    }
    int v25 = v29;
    id WeakRetained = objc_loadWeakRetained((id *)v45[4] + 13);
    id v27 = objc_loadWeakRetained((id *)v45[4] + 13);
    char v58 = 0;
    char v56 = 0;
    if (v27)
    {
      id v59 = objc_loadWeakRetained((id *)v45[4] + 13);
      int v23 = 1;
      char v58 = 1;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v57 = NSStringFromClass(v6);
      char v56 = 1;
      id v24 = (__CFString *)v57;
    }
    else
    {
      id v24 = @"N/A";
    }
    int v20 = v24;
    id v21 = objc_loadWeakRetained((id *)v45[4] + 14);
    id v22 = objc_loadWeakRetained((id *)v45[4] + 14);
    char v54 = 0;
    char v52 = 0;
    if (v22)
    {
      id v55 = objc_loadWeakRetained((id *)v45[4] + 14);
      int v18 = 1;
      char v54 = 1;
      char v7 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v7);
      char v52 = 1;
      id v19 = (__CFString *)v53;
    }
    else
    {
      id v19 = @"N/A";
    }
    BOOL v16 = &v8;
    buf = v76;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v76, (uint64_t)v44, (uint64_t)v42, v43, (uint64_t)v35, v36, v37, (uint64_t)v30, v31, v32, v33, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19, v74 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nsuccess; %d, passcodeError: %@",
      buf,
      0xA4u);
    if (v52) {

    }
    if (v54) {
    if (v56)
    }

    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    if (v66) {
    if (v68)
    }

    objc_storeStrong(&v70, 0);
  }
  objc_storeStrong(v72, 0);
  if (v74)
  {
    id v10 = v45[4];
    id v12 = (id)[v45[4] download];
    id v11 = (id)[v12 descriptor];
    int v9 = &v46;
    uint64_t v46 = MEMORY[0x263EF8330];
    int v47 = -1073741824;
    int v48 = 0;
    int v49 = __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_458;
    uint64_t v50 = &unk_26483DF58;
    uint64_t v14 = (id *)v51;
    v51[0] = v45[4];
    id v13 = (id *)(v9 + 5);
    v51[1] = v45[5];
    [v10 presentTermsIfNecessaryForUpdate:v11 completion:v9];

    id obja = 0;
    objc_storeStrong(v13, 0);
    objc_storeStrong(v14, obja);
  }
  else
  {
    (*((void (**)(void))v45[5] + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_458(id *a1, char a2, id obj)
{
  int v47 = a1;
  uint64_t v46 = "-[SUSUISoftwareUpdateManager startInstallWithHandler:]_block_invoke";
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v79 = a1;
  char v78 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v76[1] = v47;
  v76[0] = _SUSUILoggingFacility();
  unsigned __int8 v75 = 0;
  if (os_log_type_enabled((os_log_t)v76[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v76[0];
    *(_DWORD *)os_log_type_t type = v75;
    id v43 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v47[4] + 22));
    id v44 = v43;
    id v74 = v44;
    int v45 = *((_DWORD *)v47[4] + 22);
    BOOL v3 = *((void *)v47[4] + 15) == 0;
    char v72 = 0;
    if (v3)
    {
      id v40 = @"N/A";
    }
    else
    {
      id v73 = (__CFString *)(id)[*((id *)v47[4] + 15) humanReadableUpdateName];
      char v72 = 1;
      id v40 = v73;
    }
    uint64_t v37 = v40;
    uint64_t v38 = *((void *)v47[4] + 15);
    uint64_t v39 = *((void *)v47[4] + 20);
    BOOL v4 = *((void *)v47[4] + 16) == 0;
    char v70 = 0;
    if (v4)
    {
      uint64_t v36 = @"N/A";
    }
    else
    {
      id v71 = (id)[*((id *)v47[4] + 16) humanReadableUpdateName];
      char v70 = 1;
      uint64_t v36 = (__CFString *)v71;
    }
    uint64_t v32 = v36;
    uint64_t v33 = *((void *)v47[4] + 16);
    uint64_t v34 = *((void *)v47[4] + 21);
    uint64_t v35 = *((void *)v47[4] + 1);
    BOOL v5 = *((void *)v47[4] + 1) == 0;
    char v68 = 0;
    char v66 = 0;
    char v64 = 0;
    if (v5
      || (v69 = (id)[*((id *)v47[4] + 1) descriptor], char v68 = 1, !v69))
    {
      uint64_t v31 = @"N/A";
    }
    else
    {
      id v67 = (id)[*((id *)v47[4] + 1) descriptor];
      int v30 = 1;
      char v66 = 1;
      id v65 = (id)[v67 humanReadableUpdateName];
      char v64 = 1;
      uint64_t v31 = (__CFString *)v65;
    }
    id v27 = v31;
    id WeakRetained = objc_loadWeakRetained((id *)v47[4] + 13);
    id v29 = objc_loadWeakRetained((id *)v47[4] + 13);
    char v62 = 0;
    char v60 = 0;
    if (v29)
    {
      id v63 = objc_loadWeakRetained((id *)v47[4] + 13);
      int v25 = 1;
      char v62 = 1;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v61 = NSStringFromClass(v6);
      char v60 = 1;
      id v26 = (__CFString *)v61;
    }
    else
    {
      id v26 = @"N/A";
    }
    id v22 = v26;
    id v23 = objc_loadWeakRetained((id *)v47[4] + 14);
    id v24 = objc_loadWeakRetained((id *)v47[4] + 14);
    char v58 = 0;
    char v56 = 0;
    if (v24)
    {
      id v59 = objc_loadWeakRetained((id *)v47[4] + 14);
      int v20 = 1;
      char v58 = 1;
      char v7 = (objc_class *)objc_opt_class();
      id v57 = NSStringFromClass(v7);
      char v56 = 1;
      id v21 = (__CFString *)v57;
    }
    else
    {
      id v21 = @"N/A";
    }
    int v18 = &v10;
    buf = v80;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v80, (uint64_t)v46, (uint64_t)v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v78 & 1, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\naccepted: %d, error: %@", buf, 0xA4u);
    if (v56) {

    }
    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    if (v66) {
    if (v68)
    }

    if (v70) {
    if (v72)
    }

    objc_storeStrong(&v74, 0);
  }
  objc_storeStrong(v76, 0);
  if (v78)
  {
    [v47[4] setState:15];
    id v8 = objc_alloc_init(MEMORY[0x263F781E8]);
    BOOL v16 = &v55;
    id v55 = v8;
    uint64_t v9 = [v47[4] ignorableConstraints];
    [v55 setIgnorableConstraints:v9];
    id v13 = (id)*((void *)v47[4] + 7);
    id v11 = v55;
    id v12 = &v48;
    uint64_t v48 = MEMORY[0x263EF8330];
    int v49 = -1073741824;
    int v50 = 0;
    id v51 = __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_459;
    char v52 = &unk_26483EB18;
    os_log_t v15 = &v54;
    id v54 = v47[5];
    uint64_t v14 = (id *)(v12 + 4);
    id v53 = v47[4];
    [v13 installUpdateWithOptions:v11 completion:v12];
    id obja = 0;
    objc_storeStrong(v14, 0);
    objc_storeStrong(v15, obja);
    objc_storeStrong(v16, obja);
  }
  else if (v47[5])
  {
    (*((void (**)(void))v47[5] + 2))();
  }
  objc_storeStrong(&location, 0);
}

void __54__SUSUISoftwareUpdateManager_startInstallWithHandler___block_invoke_459(uint64_t a1, char a2, id obj)
{
  uint64_t v12 = a1;
  char v11 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v9 = a1;
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if ((v11 & 1) == 0)
  {
    unsigned int v8 = 0;
    id v7 = 0;
    BOOL v3 = *(void **)(a1 + 32);
    id obja = 0;
    char v4 = [v3 shouldSetStateForInstallError:location outError:&obja outState:&v8];
    objc_storeStrong(&v7, obja);
    if (v4) {
      [*(id *)(a1 + 32) setState:v8 withDownloadUpdateError:v7];
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(&location, 0);
}

- (unint64_t)ignorableConstraints
{
  return 3072;
}

- (void)_notifyScanFailed:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v7->_scanError, location[0]);
  char v4 = [(SUSUISoftwareUpdateManager *)v7 delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    BOOL v3 = [(SUSUISoftwareUpdateManager *)v7 delegate];
    [(SUSUISoftwareUpdateManagerDelegate *)v3 manager:v7 scanFoundUpdates:0 error:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)handleScanError:(id)a3
{
  id v121 = "-[SUSUISoftwareUpdateManager handleScanError:]";
  uint64_t v179 = *MEMORY[0x263EF8340];
  v176 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v173 = 0;
  char v171 = 0;
  int v122 = 0;
  if (![(SUSUISoftwareUpdateManager *)v176 clientIsBuddy])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v176->_delegate);
    char v173 = 1;
    int v122 = 0;
    if (WeakRetained)
    {
      id v172 = [(SUSUISoftwareUpdateManager *)v176 delegate];
      char v171 = 1;
      int v122 = objc_opt_respondsToSelector();
    }
  }
  int v120 = v122;
  if (v171) {

  }
  if (v173) {
  if (v120)
  }
  {
    objc_storeStrong((id *)&v176->_scanError, location[0]);
    id v119 = [(SUSUISoftwareUpdateManager *)v176 delegate];
    [v119 manager:v176 scanFailedWithError:location[0]];

    int v170 = 1;
  }
  else
  {
    char v168 = 0;
    int v118 = 0;
    if ([(SUSUISoftwareUpdateManager *)v176 clientIsBuddy])
    {
      id v169 = [(SUSUISoftwareUpdateManager *)v176 delegate];
      char v168 = 1;
      int v118 = objc_opt_respondsToSelector();
    }
    int v117 = v118;
    if (v168) {

    }
    if ((v117 & 1) == 0
      || (id v115 = [(SUSUISoftwareUpdateManager *)v176 delegate],
          int v116 = [v115 manager:v176 shouldShowAlertForScanError:location[0]],
          v115,
          (v116 & 1) != 0))
    {
      os_log_t v165 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v164 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v107 = v165;
        *(_DWORD *)char v108 = v164;
        id v109 = SUSUISoftwareUpdateStateToString(v176->_state);
        id v110 = v109;
        id v163 = v110;
        int state = v176->_state;
        BOOL v3 = v176->_preferredUpdate == 0;
        char v161 = 0;
        if (v3)
        {
          char v106 = @"N/A";
        }
        else
        {
          id v162 = (id)[(SUDescriptor *)v176->_preferredUpdate humanReadableUpdateName];
          char v161 = 1;
          char v106 = (__CFString *)v162;
        }
        char v103 = v106;
        preferredUpdate = v176->_preferredUpdate;
        preferredUpdateError = v176->_preferredUpdateError;
        BOOL v4 = v176->_alternateUpdate == 0;
        char v159 = 0;
        if (v4)
        {
          id v102 = @"N/A";
        }
        else
        {
          id v160 = (id)[(SUDescriptor *)v176->_alternateUpdate humanReadableUpdateName];
          char v159 = 1;
          id v102 = (__CFString *)v160;
        }
        id v98 = v102;
        alternateUpdate = v176->_alternateUpdate;
        alternateUpdateError = v176->_alternateUpdateError;
        uint64_t download = v176->_download;
        BOOL v5 = v176->_download == 0;
        char v157 = 0;
        char v155 = 0;
        char v153 = 0;
        if (v5
          || (id v158 = [(SUDownload *)v176->_download descriptor],
              char v157 = 1,
              !v158))
        {
          uint64_t v97 = @"N/A";
        }
        else
        {
          id v156 = [(SUDownload *)v176->_download descriptor];
          int v96 = 1;
          char v155 = 1;
          id v154 = (id)[v156 humanReadableUpdateName];
          char v153 = 1;
          uint64_t v97 = (__CFString *)v154;
        }
        unsigned __int8 v93 = v97;
        id v94 = objc_loadWeakRetained((id *)&v176->_delegate);
        id v95 = objc_loadWeakRetained((id *)&v176->_delegate);
        char v151 = 0;
        char v149 = 0;
        if (v95)
        {
          id v152 = objc_loadWeakRetained((id *)&v176->_delegate);
          int v91 = 1;
          char v151 = 1;
          BOOL v6 = (objc_class *)objc_opt_class();
          id v150 = NSStringFromClass(v6);
          char v149 = 1;
          id v92 = (__CFString *)v150;
        }
        else
        {
          id v92 = @"N/A";
        }
        char v88 = v92;
        id v89 = objc_loadWeakRetained((id *)&v176->_hostController);
        id v90 = objc_loadWeakRetained((id *)&v176->_hostController);
        char v147 = 0;
        char v145 = 0;
        if (v90)
        {
          id v148 = objc_loadWeakRetained((id *)&v176->_hostController);
          int v86 = 1;
          char v147 = 1;
          id v7 = (objc_class *)objc_opt_class();
          id v146 = NSStringFromClass(v7);
          char v145 = 1;
          id v87 = (__CFString *)v146;
        }
        else
        {
          id v87 = @"N/A";
        }
        char v82 = v87;
        id v83 = location[0];
        uint64_t v84 = &v14;
        id v85 = v177;
        __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0((uint64_t)v177, (uint64_t)v121, (uint64_t)v110, state, (uint64_t)v103, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v98, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v93, (uint64_t)v94, (uint64_t)v88, (uint64_t)v89, (uint64_t)v87, (uint64_t)location[0], [(SUSUISoftwareUpdateManager *)v176 state]);
        _os_log_impl(&dword_228401000, v107, v108[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nScan error: %@; state: %d",
          v85,
          0xA4u);
        if (v145) {

        }
        if (v147) {
        if (v149)
        }

        if (v151) {
        if (v153)
        }

        if (v155) {
        if (v157)
        }

        if (v159) {
        if (v161)
        }

        objc_storeStrong(&v163, 0);
      }
      objc_storeStrong((id *)&v165, 0);
      id v79 = (id)[location[0] domain];
      id v80 = getSUErrorDomain_3();
      char v8 = objc_msgSend(v79, "isEqualToString:");
      BOOL v81 = 0;
      if (v8) {
        BOOL v81 = [location[0] code] == 26;
      }
      BOOL v78 = v81;

      if (v78)
      {
        id v56 = (id)MEMORY[0x263F82418];
        unint64_t v61 = 0x263F08000uLL;
        uint64_t v54 = MEMORY[0x263F086E0];
        unint64_t v62 = 0x263F78000uLL;
        id v60 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        char v64 = &stru_26DCD7690;
        id v65 = @"Software Update";
        id v59 = (id)objc_msgSend(v60, "localizedStringForKey:value:table:", @"UNABLE_TO_CHECK_FOR_UPDATE");
        id v55 = *(id *)(v61 + 1760);
        id v58 = (id)[v55 bundleForClass:objc_opt_class()];
        id v57 = (id)[v58 localizedStringForKey:@"NETWORK_SCAN_ERROR" value:v64 table:v65];
        uint64_t v66 = 1;
        id v9 = (id)objc_msgSend(v56, "alertControllerWithTitle:message:preferredStyle:", v59);
        id v76 = &v144;
        id v144 = v9;

        id v69 = v144;
        id v68 = (id)MEMORY[0x263F82400];
        id v63 = *(id *)(v61 + 1760);
        id v72 = (id)[v63 bundleForClass:objc_opt_class()];
        id v71 = (id)[v72 localizedStringForKey:@"CANCEL" value:v64 table:v65];
        id v67 = &v138;
        uint64_t v138 = MEMORY[0x263EF8330];
        int v139 = -1073741824;
        int v140 = 0;
        id v141 = __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke;
        os_log_type_t v142 = &unk_264840A88;
        unsigned __int8 v75 = (id *)v143;
        v143[0] = v176;
        id v74 = (id *)(v67 + 5);
        v143[1] = location[0];
        id v70 = (id)[v68 actionWithTitle:v71 style:v66 handler:v67];
        objc_msgSend(v69, "addAction:");

        id v73 = objc_loadWeakRetained((id *)&v176->_hostController);
        id obj = 0;
        objc_msgSend(v73, "presentViewController:animated:completion:", v144, 1);

        objc_storeStrong(v74, obj);
        objc_storeStrong(v75, obj);
        objc_storeStrong(v76, obj);
      }
      else
      {
        id v137 = 0;
        id v52 = (id)[MEMORY[0x263F82670] currentDevice];
        int v53 = objc_msgSend(v52, "sf_isInternalInstall");

        if (v53)
        {
          id v51 = (id)[location[0] userInfo];
          id v136 = (id)[v51 objectForKey:*MEMORY[0x263F08348]];

          if (!v136) {
            objc_storeStrong(&v136, @"Verify that you are connected to the Internal Network; trigger VPN manually if applicable.");
          }
          id v47 = (id)NSString;
          uint64_t v46 = MEMORY[0x263F086E0];
          id v49 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v48 = (id)[v49 localizedStringForKey:@"GENERIC_SCAN_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          int v50 = &v136;
          id v10 = (id)[v47 stringWithFormat:@"%@\n\n[Internal Only]\n%@", v48, v136];
          id v11 = v137;
          id v137 = v10;

          objc_storeStrong(v50, 0);
        }
        else
        {
          uint64_t v44 = MEMORY[0x263F086E0];
          id v45 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v12 = (id)[v45 localizedStringForKey:@"GENERIC_SCAN_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
          id v13 = v137;
          id v137 = v12;
        }
        id v27 = (id)MEMORY[0x263F82418];
        unint64_t v30 = 0x263F08000uLL;
        uint64_t v26 = MEMORY[0x263F086E0];
        unint64_t v31 = 0x263F78000uLL;
        id v29 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v33 = &stru_26DCD7690;
        uint64_t v34 = @"Software Update";
        id v28 = (id)objc_msgSend(v29, "localizedStringForKey:value:table:", @"UNABLE_TO_CHECK_FOR_UPDATE");
        uint64_t v37 = 1;
        id v135 = (id)objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:");

        id v40 = v135;
        id v39 = (id)MEMORY[0x263F82400];
        id v32 = *(id *)(v30 + 1760);
        id v43 = (id)[v32 bundleForClass:objc_opt_class()];
        id v42 = (id)[v43 localizedStringForKey:@"CANCEL" value:v33 table:v34];
        uint64_t v38 = &v129;
        uint64_t v129 = MEMORY[0x263EF8330];
        int v130 = -1073741824;
        int v131 = 0;
        id v132 = __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_2;
        char v133 = &unk_264840A88;
        uint64_t v35 = (id *)v134;
        v134[0] = v176;
        uint64_t v36 = (id *)(v38 + 5);
        v134[1] = location[0];
        id v41 = (id)[v39 actionWithTitle:v42 style:v37 handler:v38];
        objc_msgSend(v40, "addAction:");

        if (![(SUSUISoftwareUpdateManager *)v176 clientIsBuddy])
        {
          id v21 = v135;
          id v20 = (id)MEMORY[0x263F82400];
          uint64_t v18 = MEMORY[0x263F086E0];
          id v24 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v23 = (id)[v24 localizedStringForKey:@"TRY_AGAIN" value:&stru_26DCD7690 table:@"Software Update"];
          id v19 = &v123;
          uint64_t v123 = MEMORY[0x263EF8330];
          int v124 = -1073741824;
          int v125 = 0;
          id v126 = __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_3;
          char v127 = &unk_26483B738;
          int v25 = (id *)&v128;
          id v128 = v176;
          id v22 = (id)[v20 actionWithTitle:v23 style:0 handler:v19];
          objc_msgSend(v21, "addAction:");

          objc_storeStrong(v25, 0);
        }
        id v15 = objc_loadWeakRetained((id *)&v176->_hostController);
        BOOL v16 = &v135;
        id v17 = 0;
        objc_msgSend(v15, "presentViewController:animated:completion:", v135, 1);

        objc_storeStrong(v36, v17);
        objc_storeStrong(v35, v17);
        objc_storeStrong(v16, v17);
        objc_storeStrong(&v137, v17);
      }
      int v170 = 0;
    }
    else
    {
      os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = oslog;
        *(_DWORD *)id v113 = type;
        buf = v178;
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v178, (uint64_t)v121, (uint64_t)location[0]);
        _os_log_impl(&dword_228401000, oslog, type, "%s: Buddy: don't show the alert for %@", v178, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(SUSUISoftwareUpdateManager *)v176 _notifyScanFailed:location[0]];
      int v170 = 1;
    }
  }
  objc_storeStrong(location, 0);
}

void __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _notifyScanFailed:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0);
}

void __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [*(id *)(a1 + 32) _notifyScanFailed:*(void *)(a1 + 40)];
  objc_storeStrong(location, 0);
}

void __46__SUSUISoftwareUpdateManager_handleScanError___block_invoke_3(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] setState:0];
  objc_storeStrong(location, 0);
}

- (void)handleRollbackApplied
{
  id v67 = "-[SUSUISoftwareUpdateManager handleRollbackApplied]";
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v97 = self;
  v96[1] = (id)a2;
  v96[0] = _SUSUILoggingFacility();
  unsigned __int8 v95 = 0;
  if (os_log_type_enabled((os_log_t)v96[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v96[0];
    *(_DWORD *)os_log_type_t type = v95;
    id v64 = SUSUISoftwareUpdateStateToString(v97->_state);
    id v65 = v64;
    id location = v65;
    int state = v97->_state;
    BOOL v2 = v97->_preferredUpdate == 0;
    char v92 = 0;
    if (v2)
    {
      unint64_t v61 = @"N/A";
    }
    else
    {
      unsigned __int8 v93 = (__CFString *)(id)[(SUDescriptor *)v97->_preferredUpdate humanReadableUpdateName];
      char v92 = 1;
      unint64_t v61 = v93;
    }
    id v58 = v61;
    preferredUpdate = v97->_preferredUpdate;
    preferredUpdateError = v97->_preferredUpdateError;
    BOOL v3 = v97->_alternateUpdate == 0;
    char v90 = 0;
    if (v3)
    {
      id v57 = @"N/A";
    }
    else
    {
      int v91 = (__CFString *)(id)[(SUDescriptor *)v97->_alternateUpdate humanReadableUpdateName];
      char v90 = 1;
      id v57 = v91;
    }
    int v53 = v57;
    alternateUpdate = v97->_alternateUpdate;
    alternateUpdateError = v97->_alternateUpdateError;
    uint64_t download = v97->_download;
    BOOL v4 = v97->_download == 0;
    char v88 = 0;
    char v86 = 0;
    char v84 = 0;
    if (v4
      || (v89 = [(SUDownload *)v97->_download descriptor], char v88 = 1, !v89))
    {
      id v52 = @"N/A";
    }
    else
    {
      id v87 = [(SUDownload *)v97->_download descriptor];
      int v51 = 1;
      char v86 = 1;
      id v85 = (id)[v87 humanReadableUpdateName];
      char v84 = 1;
      id v52 = (__CFString *)v85;
    }
    id v48 = v52;
    id WeakRetained = objc_loadWeakRetained((id *)&v97->_delegate);
    id v50 = objc_loadWeakRetained((id *)&v97->_delegate);
    char v82 = 0;
    char v80 = 0;
    if (v50)
    {
      id v83 = objc_loadWeakRetained((id *)&v97->_delegate);
      int v46 = 1;
      char v82 = 1;
      BOOL v5 = (objc_class *)objc_opt_class();
      id v81 = NSStringFromClass(v5);
      char v80 = 1;
      id v47 = (__CFString *)v81;
    }
    else
    {
      id v47 = @"N/A";
    }
    id v43 = v47;
    id v44 = objc_loadWeakRetained((id *)&v97->_hostController);
    id v45 = objc_loadWeakRetained((id *)&v97->_hostController);
    char v78 = 0;
    char v76 = 0;
    if (v45)
    {
      id v79 = objc_loadWeakRetained((id *)&v97->_hostController);
      int v41 = 1;
      char v78 = 1;
      BOOL v6 = (objc_class *)objc_opt_class();
      id v77 = NSStringFromClass(v6);
      char v76 = 1;
      id v42 = (__CFString *)v77;
    }
    else
    {
      id v42 = @"N/A";
    }
    id v39 = v9;
    buf = v98;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v98, (uint64_t)v67, (uint64_t)v65, state, (uint64_t)v58, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v53, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v48, (uint64_t)WeakRetained, (uint64_t)v43, (uint64_t)v44, (uint64_t)v42);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nHandle rollback already applied", buf, 0x94u);
    if (v76) {

    }
    if (v78) {
    if (v80)
    }

    if (v82) {
    if (v84)
    }

    if (v86) {
    if (v88)
    }

    if (v90) {
    if (v92)
    }

    objc_storeStrong(&location, 0);
  }
  id obj = 0;
  objc_storeStrong(v96, 0);
  unint64_t v24 = 0x263F08000uLL;
  v9[8] = (id)MEMORY[0x263F086E0];
  unint64_t v25 = 0x263F78000uLL;
  id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v27 = &stru_26DCD7690;
  id v28 = @"Software Update";
  id v7 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", @"ROLLBACK_APPLIED_ALERT_BODY");
  uint64_t v37 = &v75;
  id v75 = v7;

  id v12 = (id)MEMORY[0x263F82418];
  id v11 = *(id *)(v24 + 1760);
  id v14 = (id)[v11 bundleForClass:objc_opt_class()];
  id v13 = (id)[v14 localizedStringForKey:@"ROLLBACK_APPLIED_ALERT_TITLE" value:v27 table:v28];
  uint64_t v16 = 1;
  id v8 = (id)objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:");
  uint64_t v36 = &v74;
  id v74 = v8;

  id v19 = v74;
  unint64_t v23 = 0x263F82000uLL;
  id v18 = (id)MEMORY[0x263F82400];
  id v15 = *(id *)(v24 + 1760);
  id v22 = (id)[v15 bundleForClass:objc_opt_class()];
  id v21 = (id)[v22 localizedStringForKey:@"CANCEL" value:v27 table:v28];
  id v17 = &v68;
  uint64_t v68 = MEMORY[0x263EF8330];
  int v69 = -1073741824;
  int v70 = 0;
  id v71 = __51__SUSUISoftwareUpdateManager_handleRollbackApplied__block_invoke;
  id v72 = &unk_26483B738;
  uint64_t v35 = (id *)&v73;
  id v73 = v97;
  id v20 = (id)[v18 actionWithTitle:v21 style:v16 handler:v17];
  objc_msgSend(v19, "addAction:");

  id v30 = v74;
  id v29 = *(id *)(v23 + 1024);
  id v26 = *(id *)(v24 + 1760);
  id v33 = (id)[v26 bundleForClass:objc_opt_class()];
  id v32 = (id)[v33 localizedStringForKey:@"ROLLBACK_APPLIED_ALERT_BUTTON_REBOOT_NOW" value:v27 table:v28];
  id v31 = (id)objc_msgSend(v29, "actionWithTitle:style:handler:");
  objc_msgSend(v30, "addAction:");

  id v34 = objc_loadWeakRetained((id *)&v97->_hostController);
  [v34 presentViewController:v74 animated:1 completion:obj];

  objc_storeStrong(v35, obj);
  objc_storeStrong(v36, obj);
  objc_storeStrong(v37, obj);
}

void __51__SUSUISoftwareUpdateManager_handleRollbackApplied__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [a1[4] _notifyScanFailed:0];
  objc_storeStrong(location, 0);
}

void __51__SUSUISoftwareUpdateManager_handleRollbackApplied__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  v4[0] = (id)[objc_alloc(MEMORY[0x263F3F800]) initWithReason:@"Reboot for rollback apply"];
  [v4[0] setRebootType:1];
  id v3 = objc_alloc_init(MEMORY[0x263F3F808]);
  [v3 shutdownWithOptions:v4[0]];
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
  objc_storeStrong(location, 0);
}

- (void)handleDownloadError:(id)a3
{
  id v121 = &v139;
  int v120 = "-[SUSUISoftwareUpdateManager handleDownloadError:]";
  uint64_t v171 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v168 = _SUSUILoggingFacility();
  unsigned __int8 v167 = 0;
  if (os_log_type_enabled((os_log_t)v168, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v121 + 53);
    *(_DWORD *)os_log_type_t type = v167;
    id v117 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v121 + 56) + 88));
    id v3 = v117;
    BOOL v4 = v121;
    uint64_t v118 = (uint64_t)v3;
    *((void *)v121 + 51) = v3;
    int v119 = *(_DWORD *)(*((void *)v4 + 56) + 88);
    LOBYTE(v4) = *(void *)(*((void *)v4 + 56) + 120) == 0;
    char v165 = 0;
    if (v4)
    {
      id v114 = @"N/A";
    }
    else
    {
      BOOL v5 = (__CFString *)(id)[*(id *)(*((void *)v121 + 56) + 120) humanReadableUpdateName];
      *((void *)v121 + 50) = v5;
      char v165 = 1;
      id v114 = v5;
    }
    id v111 = v114;
    uint64_t v112 = *(void *)(*((void *)v121 + 56) + 120);
    uint64_t v113 = *(void *)(*((void *)v121 + 56) + 160);
    BOOL v6 = *(void *)(*((void *)v121 + 56) + 128) == 0;
    char v164 = 0;
    if (v6)
    {
      id v110 = @"N/A";
    }
    else
    {
      id v7 = (__CFString *)(id)[*(id *)(*((void *)v121 + 56) + 128) humanReadableUpdateName];
      *((void *)v121 + 48) = v7;
      char v164 = 1;
      id v110 = v7;
    }
    char v106 = v110;
    uint64_t v107 = *(void *)(*((void *)v121 + 56) + 128);
    uint64_t v108 = *(void *)(*((void *)v121 + 56) + 168);
    uint64_t v109 = *(void *)(*((void *)v121 + 56) + 8);
    BOOL v8 = *(void *)(*((void *)v121 + 56) + 8) == 0;
    char v163 = 0;
    char v162 = 0;
    char v161 = 0;
    if (v8
      || (id v9 = (id)[*(id *)(*((void *)v121 + 56) + 8) descriptor],
          *((void *)v121 + 46) = v9,
          char v163 = 1,
          !v9))
    {
      char v105 = @"N/A";
    }
    else
    {
      id v10 = (id)[*(id *)(*((void *)v121 + 56) + 8) descriptor];
      *((void *)v121 + 44) = v10;
      int v104 = 1;
      char v162 = 1;
      id v11 = (__CFString *)(id)[v10 humanReadableUpdateName];
      *((void *)v121 + 42) = v11;
      char v161 = 1;
      char v105 = v11;
    }
    char v101 = v105;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 104));
    id v103 = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 104));
    char v160 = 0;
    char v159 = 0;
    if (v103)
    {
      *((void *)v121 + 40) = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 104));
      int v99 = 1;
      char v160 = 1;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *((void *)v121 + 38) = v13;
      char v159 = 1;
      uint64_t v100 = (__CFString *)v13;
    }
    else
    {
      uint64_t v100 = @"N/A";
    }
    int v96 = v100;
    id v97 = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 112));
    id v98 = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 112));
    char v158 = 0;
    char v157 = 0;
    if (v98)
    {
      *((void *)v121 + 36) = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 112));
      int v94 = 1;
      char v158 = 1;
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *((void *)v121 + 34) = v15;
      char v157 = 1;
      unsigned __int8 v95 = v15;
    }
    else
    {
      unsigned __int8 v95 = @"N/A";
    }
    uint64_t v16 = *((void *)v121 + 54);
    char v92 = v47;
    buf = v170;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v170, (uint64_t)v120, v118, v119, (uint64_t)v111, v112, v113, (uint64_t)v106, v107, v108, v109, (uint64_t)v101, (uint64_t)WeakRetained, (uint64_t)v96, (uint64_t)v97, (uint64_t)v95, v16);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nError: %@", buf, 0x9Eu);
    if (v157) {

    }
    if (v158) {
    if (v159)
    }

    if (v160) {
    if (v161)
    }

    if (v162) {
    if (v163)
    }

    if (v164) {
    if (v165)
    }

    objc_storeStrong(&v166, 0);
  }
  objc_storeStrong(&v168, 0);
  id v90 = (id)[*((id *)v121 + 54) domain];
  int v91 = [v90 isEqualToString:*MEMORY[0x263F78360]];

  if (v91)
  {
    unint64_t v17 = [*((id *)v121 + 54) code];
    unint64_t v89 = v17 - 1;
    if (v17 <= 1)
    {
      unint64_t v19 = v17 - 1;
      char v18 = 0;
    }
    else
    {
      unint64_t v19 = v17 - 1;
      char v18 = 1;
    }
    if ((v18 & 1) == 0)
    {
      switch(v19)
      {
        case 0uLL:
          if (*(void *)(*((void *)v121 + 56) + 120))
          {
            if ([*((id *)v121 + 56) shouldShowPreferredUpdateAsAlternate]) {
              [*((id *)v121 + 56) setState:6];
            }
            else {
              [*((id *)v121 + 56) setState:8];
            }
          }
          else
          {
            [*((id *)v121 + 56) setState:3];
          }
          goto LABEL_124;
        case 1uLL:
        case 3uLL:
        case 4uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x29uLL:
        case 0x2AuLL:
        case 0x2BuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2EuLL:
        case 0x2FuLL:
        case 0x30uLL:
        case 0x31uLL:
        case 0x32uLL:
        case 0x33uLL:
        case 0x34uLL:
        case 0x35uLL:
          break;
        case 2uLL:
        case 0xDuLL:
        case 0x17uLL:
          id v88 = (id)MEMORY[0x263F82418];
          BOOL v20 = *(void *)(*((void *)v121 + 56) + 8) == 0;
          char v155 = 0;
          char v154 = 0;
          char v153 = 0;
          char v152 = 0;
          char v151 = 0;
          char v150 = 0;
          if (!v20
            && (id v21 = (id)[*(id *)(*((void *)v121 + 56) + 8) descriptor], *((void *)v121 + 31) = v21, v155 = 1, v21)&& (v22 = (id)objc_msgSend(*(id *)(*((void *)v121 + 56) + 8), "descriptor"), *((void *)v121 + 29) = v22, v154 = 1, (objc_msgSend(v22, "isSplatOnly") & 1) != 0))
          {
            uint64_t v85 = MEMORY[0x263F086E0];
            id v23 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            *((void *)v121 + 27) = v23;
            int v86 = 1;
            char v153 = 1;
            id v24 = (id)[v23 localizedStringForKey:@"RSR_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            char v25 = v86;
            *((void *)v121 + 25) = v24;
            char v152 = v25 & 1;
            id v87 = v24;
          }
          else
          {
            uint64_t v83 = MEMORY[0x263F086E0];
            id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            *((void *)v121 + 23) = v26;
            int v84 = 1;
            char v151 = 1;
            id v27 = (id)[v26 localizedStringForKey:@"DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            char v28 = v84;
            *((void *)v121 + 21) = v27;
            char v150 = v28 & 1;
            id v87 = v27;
          }
          id v82 = v87;
          BOOL v29 = *(void *)(*((void *)v121 + 56) + 8) == 0;
          char v149 = 0;
          char v148 = 0;
          char v147 = 0;
          char v146 = 0;
          char v145 = 0;
          char v144 = 0;
          if (!v29
            && (v30 = (id)[*(id *)(*((void *)v121 + 56) + 8) descriptor], *((void *)v121 + 19) = v30, v149 = 1, v30)&& (id v31 = (id)objc_msgSend(*(id *)(*((void *)v121 + 56) + 8), "descriptor"), *((void *)v121 + 17) = v31, v148 = 1, (objc_msgSend(v31, "isSplatOnly") & 1) != 0))
          {
            uint64_t v79 = MEMORY[0x263F086E0];
            id v32 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            *((void *)v121 + 15) = v32;
            int v80 = 1;
            char v147 = 1;
            id v33 = (id)[v32 localizedStringForKey:@"RSR_DOWNLOAD_ERROR_DETAILS" value:&stru_26DCD7690 table:@"Software Update"];
            char v34 = v80;
            *((void *)v121 + 13) = v33;
            char v146 = v34 & 1;
            id v81 = v33;
          }
          else
          {
            uint64_t v77 = MEMORY[0x263F086E0];
            id v35 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            *((void *)v121 + 11) = v35;
            int v78 = 1;
            char v145 = 1;
            id v36 = (id)[v35 localizedStringForKey:@"DOWNLOAD_ERROR_DETAILS" value:&stru_26DCD7690 table:@"Software Update"];
            char v37 = v78;
            *((void *)v121 + 9) = v36;
            char v144 = v37 & 1;
            id v81 = v36;
          }
          id v38 = (id)[v88 alertControllerWithTitle:v82 message:v81 preferredStyle:1];
          *((void *)v121 + 32) = v38;
          if (v144) {

          }
          if (v145) {
          if (v146)
          }

          if (v147) {
          if (v148)
          }

          if (v149) {
          if (v150)
          }

          if (v151) {
          if (v152)
          }

          if (v153) {
          if (v154)
          }

          if (v155) {
          id v75 = (id *)&v156;
          }
          id v70 = (id)*((void *)v121 + 32);
          id v69 = (id)MEMORY[0x263F82400];
          uint64_t v68 = MEMORY[0x263F086E0];
          id v73 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v72 = (id)[v73 localizedStringForKey:@"OK" value:&stru_26DCD7690 table:@"Software Update"];
          id obj = 0;
          id v71 = (id)objc_msgSend(v69, "actionWithTitle:style:handler:");
          objc_msgSend(v70, "addAction:");

          id v74 = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 112));
          [v74 presentViewController:*((void *)v121 + 32) animated:1 completion:obj];

          [*((id *)v121 + 56) setState:3];
          objc_storeStrong(v75, obj);
          goto LABEL_124;
        case 5uLL:
          id v67 = (id)MEMORY[0x263F82418];
          BOOL v39 = *(void *)(*((void *)v121 + 56) + 8) == 0;
          char v142 = 0;
          char v141 = 0;
          char v140 = 0;
          char v138 = 0;
          char v136 = 0;
          char v134 = 0;
          if (!v39
            && (id v40 = (id)[*(id *)(*((void *)v121 + 56) + 8) descriptor], *((void *)v121 + 6) = v40, v142 = 1, v40)&& (v41 = (id)objc_msgSend(*(id *)(*((void *)v121 + 56) + 8), "descriptor"), *((void *)v121 + 4) = v41, v141 = 1, (objc_msgSend(v41, "isSplatOnly") & 1) != 0))
          {
            uint64_t v64 = MEMORY[0x263F086E0];
            id v42 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            *((void *)v121 + 2) = v42;
            int v65 = 1;
            char v140 = 1;
            id v43 = (id)[v42 localizedStringForKey:@"RSR_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            char v44 = v65;
            *(void *)id v121 = v43;
            char v138 = v44 & 1;
            id v66 = v43;
          }
          else
          {
            uint64_t v62 = MEMORY[0x263F086E0];
            id v137 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            int v63 = 1;
            char v136 = 1;
            id v135 = (id)[v137 localizedStringForKey:@"DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            char v134 = v63 & 1;
            id v66 = v135;
          }
          id v61 = v66;
          BOOL v45 = *(void *)(*((void *)v121 + 56) + 8) == 0;
          char v132 = 0;
          char v130 = 0;
          char v128 = 0;
          char v126 = 0;
          char v124 = 0;
          char v122 = 0;
          if (!v45
            && (v133 = (id)[*(id *)(*((void *)v121 + 56) + 8) descriptor], v132 = 1, v133)&& (v131 = (id)objc_msgSend(*(id *)(*((void *)v121 + 56) + 8), "descriptor"), char v130 = 1, (objc_msgSend(v131, "isSplatOnly") & 1) != 0))
          {
            uint64_t v58 = MEMORY[0x263F086E0];
            id v129 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            int v59 = 1;
            char v128 = 1;
            id v127 = (id)[v129 localizedStringForKey:@"RSR_DOWNLOAD_ERROR_INSUFFICIENT_SPACE" value:&stru_26DCD7690 table:@"Software Update"];
            char v126 = v59 & 1;
            id v60 = v127;
          }
          else
          {
            uint64_t v56 = MEMORY[0x263F086E0];
            id v125 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            int v57 = 1;
            char v124 = 1;
            id v123 = (id)[v125 localizedStringForKey:@"DOWNLOAD_ERROR_INSUFFICIENT_SPACE" value:&stru_26DCD7690 table:@"Software Update"];
            char v122 = v57 & 1;
            id v60 = v123;
          }
          id v46 = (id)[v67 alertControllerWithTitle:v61 message:v60 preferredStyle:1];
          *((void *)v121 + 7) = v46;
          if (v122) {

          }
          if (v124) {
          if (v126)
          }

          if (v128) {
          if (v130)
          }

          if (v132) {
          if (v134)
          }

          if (v136) {
          if (v138)
          }

          if (v140) {
          if (v141)
          }

          if (v142) {
          uint64_t v54 = (id *)&v143;
          }
          id v49 = (id)*((void *)v121 + 7);
          id v48 = (id)MEMORY[0x263F82400];
          v47[10] = MEMORY[0x263F086E0];
          id v52 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v51 = (id)[v52 localizedStringForKey:@"OK" value:&stru_26DCD7690 table:@"Software Update"];
          id v55 = 0;
          id v50 = (id)objc_msgSend(v48, "actionWithTitle:style:handler:");
          objc_msgSend(v49, "addAction:");

          id v53 = objc_loadWeakRetained((id *)(*((void *)v121 + 56) + 112));
          [v53 presentViewController:*((void *)v121 + 7) animated:1 completion:v55];

          [*((id *)v121 + 56) setState:8];
          objc_storeStrong(v54, v55);
          goto LABEL_124;
        case 0xAuLL:
          [*((id *)v121 + 56) setState:12];
          goto LABEL_124;
        case 0x36uLL:
          [*((id *)v121 + 56) setState:4];
          goto LABEL_124;
        default:
          JUMPOUT(0);
      }
    }
    if ([*((id *)v121 + 56) state] != 8
      && [*((id *)v121 + 56) state] != 6
      && [*((id *)v121 + 56) state] != 14)
    {
      [*((id *)v121 + 56) setState:8 withDownloadUpdateError:*((void *)v121 + 54)];
    }
  }
LABEL_124:
  objc_storeStrong(location, 0);
}

- (BOOL)shouldIgnoreUpdateError:(id)a3
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v19 = [location[0] code];
  id v12 = (id)[location[0] domain];
  char v13 = [v12 isEqualToString:*MEMORY[0x263F78360]];

  if (v13)
  {
    if (v19 == 3 || v19 == 11 || v19 == 13)
    {
      char v22 = 1;
      int v18 = 1;
      goto LABEL_36;
    }
    BOOL v3 = v21->_download == 0;
    char v16 = 0;
    BOOL v11 = 0;
    if (!v3)
    {
      unint64_t v17 = [(SUDownload *)v21->_download progress];
      char v16 = 1;
      BOOL v11 = 0;
      if (v17)
      {
        BOOL v10 = 1;
        if (v21->_state != 12) {
          BOOL v10 = v21->_state == 13;
        }
        BOOL v11 = v10;
      }
    }
    if (v16) {

    }
    if (!v11)
    {
LABEL_35:
      char v22 = 0;
      int v18 = 1;
      goto LABEL_36;
    }
    id v15 = [(SUDownload *)v21->_download progress];
    id v8 = (id)[v15 phase];
    BOOL v9 = 0;
    if ([v8 isEqualToString:*MEMORY[0x263F78428]])
    {
      [v15 percentComplete];
      BOOL v9 = v4 >= 1.0;
    }

    if (!v9) {
      goto LABEL_33;
    }
    if (v19 == 33 || v19 == 34 || v19 == 8 || v19 == 31 || v19 == 9 || v19 == 83)
    {
      char v22 = 1;
      int v18 = 1;
      goto LABEL_34;
    }
    if (v19 == 6)
    {
      char v22 = 1;
      int v18 = 1;
      goto LABEL_34;
    }
    if (v19 != 20) {
      goto LABEL_33;
    }
    id v7 = (id)[location[0] userInfo];
    id v6 = getkSUInstallationConstraintsUnmetKey_1();
    id v14 = (id)objc_msgSend(v7, "objectForKey:");

    if (v14 && [v14 unsignedIntegerValue] == 4)
    {
      char v22 = 1;
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
    }
    objc_storeStrong(&v14, 0);
    if (!v18) {
LABEL_33:
    }
      int v18 = 0;
LABEL_34:
    objc_storeStrong(&v15, 0);
    if (v18) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  char v22 = 0;
  int v18 = 1;
LABEL_36:
  objc_storeStrong(location, 0);
  return v22 & 1;
}

- (BOOL)shouldSetStateForInstallError:(id)a3 outError:(id *)a4 outState:(int *)a5
{
  id v73 = &v93;
  id v71 = a4;
  id v72 = a5;
  id v70 = "-[SUSUISoftwareUpdateManager shouldSetStateForInstallError:outError:outState:]";
  uint64_t v107 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v101[2] = (os_log_t)v71;
  v101[1] = (os_log_t)v72;
  v101[0] = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v101[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v73 + 13);
    *(_DWORD *)id v66 = type;
    id v67 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v73 + 18) + 88));
    id v5 = v67;
    id v6 = v73;
    uint64_t v68 = (uint64_t)v5;
    *((void *)v73 + 11) = v5;
    int v69 = *(_DWORD *)(*((void *)v6 + 18) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 18) + 120) == 0;
    char v98 = 0;
    if (v6)
    {
      uint64_t v64 = @"N/A";
    }
    else
    {
      id v7 = (__CFString *)(id)[*(id *)(*((void *)v73 + 18) + 120) humanReadableUpdateName];
      *((void *)v73 + 10) = v7;
      char v98 = 1;
      uint64_t v64 = v7;
    }
    id v61 = v64;
    uint64_t v62 = *(void *)(*((void *)v73 + 18) + 120);
    uint64_t v63 = *(void *)(*((void *)v73 + 18) + 160);
    BOOL v8 = *(void *)(*((void *)v73 + 18) + 128) == 0;
    char v97 = 0;
    if (v8)
    {
      id v60 = @"N/A";
    }
    else
    {
      BOOL v9 = (__CFString *)(id)[*(id *)(*((void *)v73 + 18) + 128) humanReadableUpdateName];
      *((void *)v73 + 8) = v9;
      char v97 = 1;
      id v60 = v9;
    }
    uint64_t v56 = v60;
    uint64_t v57 = *(void *)(*((void *)v73 + 18) + 128);
    uint64_t v58 = *(void *)(*((void *)v73 + 18) + 168);
    uint64_t v59 = *(void *)(*((void *)v73 + 18) + 8);
    BOOL v10 = *(void *)(*((void *)v73 + 18) + 8) == 0;
    char v96 = 0;
    char v95 = 0;
    char v94 = 0;
    if (v10
      || (id v11 = (id)[*(id *)(*((void *)v73 + 18) + 8) descriptor],
          *((void *)v73 + 6) = v11,
          char v96 = 1,
          !v11))
    {
      id v55 = @"N/A";
    }
    else
    {
      id v12 = (id)[*(id *)(*((void *)v73 + 18) + 8) descriptor];
      *((void *)v73 + 4) = v12;
      int v54 = 1;
      char v95 = 1;
      char v13 = (__CFString *)(id)[v12 humanReadableUpdateName];
      *((void *)v73 + 2) = v13;
      char v94 = 1;
      id v55 = v13;
    }
    id v51 = v55;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v73 + 18) + 104));
    id v53 = objc_loadWeakRetained((id *)(*((void *)v73 + 18) + 104));
    char v92 = 0;
    char v90 = 0;
    if (v53)
    {
      *(void *)id v73 = objc_loadWeakRetained((id *)(*((void *)v73 + 18) + 104));
      int v49 = 1;
      char v92 = 1;
      id v14 = (objc_class *)objc_opt_class();
      id v91 = NSStringFromClass(v14);
      char v90 = 1;
      id v50 = (__CFString *)v91;
    }
    else
    {
      id v50 = @"N/A";
    }
    id v46 = v50;
    id v47 = objc_loadWeakRetained((id *)(*((void *)v73 + 18) + 112));
    id v48 = objc_loadWeakRetained((id *)(*((void *)v73 + 18) + 112));
    char v88 = 0;
    char v86 = 0;
    if (v48)
    {
      id v89 = objc_loadWeakRetained((id *)(*((void *)v73 + 18) + 112));
      int v44 = 1;
      char v88 = 1;
      id v15 = (objc_class *)objc_opt_class();
      id v87 = NSStringFromClass(v15);
      char v86 = 1;
      BOOL v45 = (__CFString *)v87;
    }
    else
    {
      BOOL v45 = @"N/A";
    }
    uint64_t v16 = *((void *)v73 + 16);
    id v42 = &v24;
    buf = v106;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v106, (uint64_t)v70, v68, v69, (uint64_t)v61, v62, v63, (uint64_t)v56, v57, v58, v59, (uint64_t)v51, (uint64_t)WeakRetained, (uint64_t)v46, (uint64_t)v47, (uint64_t)v45, v16);
    _os_log_impl(&dword_228401000, log, v66[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nerror: %@", buf, 0x9Eu);
    if (v86) {

    }
    if (v88) {
    if (v90)
    }

    if (v92) {
    if (v94)
    }

    if (v95) {
    if (v96)
    }

    if (v97) {
    if (v98)
    }

    objc_storeStrong(&v99, 0);
  }
  objc_storeStrong((id *)v101, 0);
  if (*((void *)v73 + 15))
  {
    id v17 = *((id *)v73 + 16);
    **((void **)v73 + 15) = v17;
  }
  if (*((void *)v73 + 14)) {
    **((_DWORD **)v73 + 14) = 10;
  }
  unint64_t v18 = [*((id *)v73 + 16) code];
  unint64_t v41 = v18 - 3;
  if (v18 <= 3)
  {
    unint64_t v20 = v18 - 3;
    char v19 = 0;
  }
  else
  {
    unint64_t v20 = v18 - 3;
    char v19 = 1;
  }
  if (v19)
  {
LABEL_66:
    os_log_t v75 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v26 = v75;
      *(_DWORD *)id v27 = v74;
      uint64_t v22 = *((void *)v73 + 16);
      char v28 = v104;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v104, (uint64_t)v70, v22);
      _os_log_impl(&dword_228401000, v26, v27[0], "%s: Couldn't resolve the installation error: %@", v28, 0x16u);
    }
    objc_storeStrong((id *)&v75, 0);
    unsigned __int8 v103 = 1;
    int v85 = 1;
  }
  else
  {
    switch(v20)
    {
      case 0uLL:
      case 8uLL:
      case 0xFuLL:
        os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v83 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v38 = oslog;
          *(_DWORD *)BOOL v39 = v83;
          uint64_t v21 = *((void *)v73 + 16);
          id v40 = v105;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v105, (uint64_t)v70, v21);
          _os_log_impl(&dword_228401000, v38, v39[0], "%s: Starting a new scan due to installation error: %@", v40, 0x16u);
        }
        id obj = 0;
        objc_storeStrong((id *)&oslog, 0);
        id v34 = (id)*((void *)v73 + 18);
        id v33 = &v77;
        uint64_t v77 = MEMORY[0x263EF8330];
        int v78 = -1073741824;
        int v35 = 0;
        int v79 = 0;
        int v80 = __78__SUSUISoftwareUpdateManager_shouldSetStateForInstallError_outError_outState___block_invoke;
        id v81 = &unk_264840AB0;
        id v36 = &v82;
        id v82 = *((id *)v73 + 18);
        [v34 scanForUpdatesCompletion:v33];
        unsigned __int8 v103 = v35 & 1;
        int v85 = 1;
        objc_storeStrong(v36, obj);
        break;
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 9uLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1CuLL:
      case 0x1DuLL:
      case 0x1EuLL:
      case 0x1FuLL:
      case 0x20uLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x23uLL:
      case 0x24uLL:
      case 0x25uLL:
      case 0x26uLL:
        goto LABEL_66;
      case 0xAuLL:
      case 0xEuLL:
      case 0x10uLL:
        unsigned __int8 v103 = 1;
        int v85 = 1;
        break;
      case 0xBuLL:
        if (*((void *)v73 + 14)) {
          **((_DWORD **)v73 + 14) = 15;
        }
        if (*((void *)v73 + 15)) {
          **((void **)v73 + 15) = 0;
        }
        unsigned __int8 v103 = 1;
        int v85 = 1;
        break;
      case 0x11uLL:
        uint64_t v76 = 0;
        id v31 = (id)[*((id *)v73 + 16) userInfo];
        id v30 = getkSUInstallationConstraintsUnmetKey_1();
        id v29 = (id)objc_msgSend(v31, "objectForKey:");
        uint64_t v32 = [v29 unsignedIntegerValue];

        uint64_t v76 = v32;
        if (v32 != 16 && v76 != 32 && v76 != 48) {
          goto LABEL_66;
        }
        if (*((void *)v73 + 15)) {
          **((void **)v73 + 15) = 0;
        }
        unsigned __int8 v103 = 1;
        int v85 = 1;
        break;
      case 0x27uLL:
        if (*((void *)v73 + 14)) {
          **((_DWORD **)v73 + 14) = 16;
        }
        if (*((void *)v73 + 15)) {
          **((void **)v73 + 15) = 0;
        }
        unsigned __int8 v103 = 1;
        int v85 = 1;
        break;
      default:
        JUMPOUT(0);
    }
  }
  objc_storeStrong(location, 0);
  int v25 = v103;
  return v103 & 1;
}

void __78__SUSUISoftwareUpdateManager_shouldSetStateForInstallError_outError_outState___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  if (v5) {
    [a1[4] handleScanError:v5];
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (id)humanReadableDescriptionForError:(id)a3 enableButton:(BOOL *)a4
{
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4) {
    *a4 = [(SUSUISoftwareUpdateManager *)v9 enableUpdateButtonForError:location[0]];
  }
  id v6 = -[SUSUISoftwareUpdateManager humanReadableDescriptionForError:](v9, "humanReadableDescriptionForError:", location[0], location);
  objc_storeStrong(v5, 0);
  return v6;
}

- (BOOL)enableUpdateButtonForError:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (![(SUSUISoftwareUpdateManager *)v27 shouldIgnoreUpdateError:location[0]])
  {
    id v12 = (id)[location[0] domain];
    id v11 = getSUErrorDomain_3();
    char v13 = objc_msgSend(v12, "isEqualToString:");

    if (v13)
    {
      uint64_t v24 = [location[0] code];
      if ((unint64_t)(v24 - 33) > 1 || [(SUSUISoftwareUpdateManager *)v27 state] != 14) {
        goto LABEL_23;
      }
      id v23 = 0;
      id v8 = objc_alloc(MEMORY[0x263F02D30]);
      BOOL v9 = dispatch_get_global_queue(33, 0);
      id v22 = (id)objc_msgSend(v8, "initWithQueue:");

      id v21 = 0;
      id v19 = 0;
      id v10 = (id)[v22 getPreferredDataSubscriptionContextSync:&v19];
      objc_storeStrong(&v21, v19);
      id v20 = v10;
      if (v10)
      {
        id v16 = 0;
        id obj = 0;
        id v6 = (void *)[v22 copyRegistrationStatus:v20 error:&obj];
        objc_storeStrong(&v16, obj);
        id v3 = v23;
        id v23 = v6;

        if (!v23)
        {
          os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v5 = (id)[v16 description];
            __os_log_helper_16_2_1_8_64((uint64_t)v29, (uint64_t)v5);
            _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "Failed to copyRegistrationStatus from CoreTelephony. %@", v29, 0xCu);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        objc_storeStrong(&v16, 0);
      }
      else
      {
        id v18 = _SUSUILoggingFacility();
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = (id)[v21 description];
          __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v7);
          _os_log_impl(&dword_228401000, (os_log_t)v18, v17, "Failed to get preferred CTXPCServiceSubscriptionContext. %@", v30, 0xCu);
        }
        objc_storeStrong(&v18, 0);
      }
      if ([v23 isEqualToString:*MEMORY[0x263F03010]])
      {
        if (PSIsDataRoamingEnabled())
        {
          char v28 = 1;
          int v25 = 1;
        }
        else
        {
          int v25 = 2;
        }
      }
      else
      {
        int v25 = 0;
      }
      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v23, 0);
      if (!v25)
      {
LABEL_23:
        char v28 = 0;
        int v25 = 1;
        goto LABEL_25;
      }
      if (v25 != 2) {
        goto LABEL_25;
      }
    }
    char v28 = 0;
    int v25 = 1;
    goto LABEL_25;
  }
  char v28 = 0;
  int v25 = 1;
LABEL_25:
  objc_storeStrong(location, 0);
  return v28 & 1;
}

- (id)humanReadableTitleForError:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v57 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v55 = 0;
  if ([(SUSUISoftwareUpdateManager *)v57 shouldIgnoreUpdateError:location[0]])
  {
    id v58 = 0;
    int v54 = 1;
  }
  else
  {
    id v44 = (id)[location[0] domain];
    id v43 = getSUErrorDomain_3();
    char v45 = objc_msgSend(v44, "isEqualToString:");

    if (v45)
    {
      unint64_t v53 = [location[0] code];
      if (v53 <= 6)
      {
        unint64_t v4 = v53 - 6;
        char v3 = 0;
      }
      else
      {
        unint64_t v4 = v53 - 6;
        char v3 = 1;
      }
      if ((v3 & 1) == 0)
      {
        switch(v4)
        {
          case 0uLL:
            id v42 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v5 = (id)[v42 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSUFFICIENT_DISK_SPACE" value:&stru_26DCD7690 table:@"Software Update"];
            id v6 = v55;
            id v55 = v5;

            break;
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 0x1BuLL:
          case 0x1CuLL:
          case 0x33uLL:
          case 0x4DuLL:
            id v41 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v7 = (id)[v41 localizedStringForKey:@"UPDATE_ERROR_TITLE_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            id v8 = v55;
            id v55 = v7;

            break;
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xCuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x1AuLL:
          case 0x1DuLL:
          case 0x1EuLL:
          case 0x1FuLL:
          case 0x20uLL:
          case 0x21uLL:
          case 0x22uLL:
          case 0x23uLL:
          case 0x24uLL:
          case 0x25uLL:
          case 0x26uLL:
          case 0x27uLL:
          case 0x28uLL:
          case 0x29uLL:
          case 0x2AuLL:
          case 0x2BuLL:
          case 0x2CuLL:
          case 0x2DuLL:
          case 0x2EuLL:
          case 0x2FuLL:
          case 0x30uLL:
          case 0x31uLL:
          case 0x32uLL:
          case 0x34uLL:
          case 0x35uLL:
          case 0x36uLL:
          case 0x37uLL:
          case 0x38uLL:
          case 0x39uLL:
          case 0x3AuLL:
          case 0x3BuLL:
          case 0x3CuLL:
          case 0x3DuLL:
          case 0x3EuLL:
          case 0x3FuLL:
          case 0x40uLL:
          case 0x41uLL:
          case 0x42uLL:
          case 0x43uLL:
          case 0x44uLL:
          case 0x45uLL:
          case 0x46uLL:
          case 0x47uLL:
          case 0x48uLL:
          case 0x49uLL:
          case 0x4AuLL:
          case 0x4BuLL:
          case 0x4CuLL:
          case 0x4EuLL:
          case 0x4FuLL:
          case 0x50uLL:
          case 0x51uLL:
          case 0x52uLL:
          case 0x53uLL:
          case 0x54uLL:
          case 0x55uLL:
          case 0x56uLL:
          case 0x57uLL:
          case 0x58uLL:
          case 0x59uLL:
          case 0x5AuLL:
          case 0x5BuLL:
          case 0x5CuLL:
          case 0x5DuLL:
          case 0x5EuLL:
          case 0x5FuLL:
          case 0x60uLL:
          case 0x61uLL:
          case 0x63uLL:
            break;
          case 0xBuLL:
          case 0xDuLL:
          case 0x64uLL:
            id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v19 = (id)[v26 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            id v20 = v55;
            id v55 = v19;

            break;
          case 0xEuLL:
            float v52 = 0.0;
            BOOL v39 = [(SUSUISoftwareUpdateManager *)v57 preferredUpdate];
            char v50 = 0;
            if (v39)
            {
              id v51 = [(SUSUISoftwareUpdateManager *)v57 preferredUpdate];
              char v50 = 1;
              SURequiredBatteryLevelForInstallForDescriptor();
            }
            else
            {
              SUPrefsRequiredBatteryLevelForInstall();
            }
            float v38 = v11;
            if (v50) {

            }
            float v52 = v38;
            id v36 = (id)[location[0] userInfo];
            id v35 = getkSUInstallationConstraintsUnmetKey_1();
            id v34 = (id)objc_msgSend(v36, "objectForKey:");
            uint64_t v37 = [v34 unsignedIntegerValue];

            uint64_t v49 = v37;
            if ([(SUSUISoftwareUpdateManager *)v57 clientIsBuddy] || (v49 & 4) == 0)
            {
              if (v49)
              {
                double v14 = floorf(100.0 * v52) / 100.0;
                *(float *)&double v14 = v14;
                int v48 = LODWORD(v14);
                char v28 = (void *)MEMORY[0x263F08A30];
                id v29 = (id)[NSNumber numberWithFloat:v14];
                id v47 = (id)objc_msgSend(v28, "localizedStringFromNumber:numberStyle:");

                id v30 = NSString;
                id v32 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v31 = (id)[v32 localizedStringForKey:@"UPDATE_ERROR_TITLE_LOW_BATTERY" value:&stru_26DCD7690 table:@"Software Update"];
                id v15 = (id)[v30 stringWithFormat:v47];
                id v16 = v55;
                id v55 = v15;

                objc_storeStrong(&v47, 0);
              }
              else
              {
                id v27 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v17 = (id)[v27 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                id v18 = v55;
                id v55 = v17;
              }
            }
            else
            {
              id v33 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v12 = (id)[v33 localizedStringForKey:@"UPDATE_ERROR_TITLE_INSUFFICIENT_DISK_SPACE" value:&stru_26DCD7690 table:@"Software Update"];
              id v13 = v55;
              id v55 = v12;
            }
            break;
          case 0x19uLL:
            id v40 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v9 = (id)[v40 localizedStringForKey:@"UPDATE_ERROR_TITLE_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
            id v10 = v55;
            id v55 = v9;

            break;
          case 0x62uLL:
            objc_storeStrong(&v55, @"Unable to Update");
            break;
          default:
            JUMPOUT(0);
        }
      }
    }
    if (!v55)
    {
      id v46 = _SUSUILoggingFacility();
      if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)location[0]);
        _os_log_impl(&dword_228401000, (os_log_t)v46, OS_LOG_TYPE_DEFAULT, "SU generic title for error: %@", v59, 0xCu);
      }
      objc_storeStrong(&v46, 0);
      id v25 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v21 = (id)[v25 localizedStringForKey:@"UPDATE_ERROR_TITLE_GENERAL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
      id v22 = v55;
      id v55 = v21;
    }
    id v58 = v55;
    int v54 = 1;
  }
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  id v23 = v58;
  return v23;
}

- (id)humanReadableDescriptionForError:(id)a3
{
  uint64_t v455 = *MEMORY[0x263EF8340];
  v450 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v448 = 0;
  if ([(SUSUISoftwareUpdateManager *)v450 shouldIgnoreUpdateError:location[0]])
  {
    id v451 = 0;
    int v447 = 1;
  }
  else
  {
    id v137 = (id)[location[0] domain];
    id v136 = getSUErrorDomain_3();
    char v138 = objc_msgSend(v137, "isEqualToString:");

    if (v138)
    {
      unint64_t v446 = [location[0] code];
      if (v446 <= 6)
      {
        unint64_t v4 = v446 - 6;
        char v3 = 0;
      }
      else
      {
        unint64_t v4 = v446 - 6;
        char v3 = 1;
      }
      if ((v3 & 1) == 0)
      {
        switch(v4)
        {
          case 0uLL:
            uint64_t v112 = (void *)MEMORY[0x263F086F0];
            id v111 = (void *)MEMORY[0x263F78250];
            uint64_t v113 = [(SUSUISoftwareUpdateManager *)v450 preferredUpdate];
            id v400 = (id)objc_msgSend(v112, "stringFromByteCount:countStyle:", objc_msgSend(v111, "totalDiskSpaceForUpdate:"), 2);

            id v114 = NSString;
            BOOL v26 = v450->_download == 0;
            char v398 = 0;
            char v396 = 0;
            char v394 = 0;
            char v392 = 0;
            char v390 = 0;
            char v388 = 0;
            if (!v26
              && (v399 = [(SUDownload *)v450->_download descriptor],
                  char v398 = 1,
                  v399)
              && (v397 = [(SUDownload *)v450->_download descriptor],
                  char v396 = 1,
                  ([(SUDescriptor *)v397 isSplatOnly] & 1) != 0))
            {
              id v395 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v394 = 1;
              id v393 = (id)[v395 localizedStringForKey:@"RSR_STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
              char v392 = 1;
              id v110 = v393;
            }
            else
            {
              id v391 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v390 = 1;
              id v389 = (id)[v391 localizedStringForKey:@"STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
              char v388 = 1;
              id v110 = v389;
            }
            id v27 = (id)objc_msgSend(v114, "stringWithFormat:", v110, v400);
            id v28 = v448;
            id v448 = v27;

            if (v388) {
            if (v390)
            }

            if (v392) {
            if (v394)
            }

            if (v396) {
            if (v398)
            }

            int v447 = 2;
            objc_storeStrong(&v400, 0);
            break;
          case 1uLL:
          case 0x33uLL:
            BOOL v5 = v450->_download == 0;
            char v444 = 0;
            char v442 = 0;
            char v440 = 0;
            char v438 = 0;
            char v436 = 0;
            char v434 = 0;
            if (!v5
              && (v445 = [(SUDownload *)v450->_download descriptor],
                  char v444 = 1,
                  v445)
              && (v443 = [(SUDownload *)v450->_download descriptor],
                  char v442 = 1,
                  ([(SUDescriptor *)v443 isSplatOnly] & 1) != 0))
            {
              id v441 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v440 = 1;
              id v439 = (id)[v441 localizedStringForKey:@"RSR_ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
              char v438 = 1;
              objc_storeStrong(&v448, v439);
            }
            else
            {
              id v437 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v436 = 1;
              id v435 = (id)[v437 localizedStringForKey:@"ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
              char v434 = 1;
              objc_storeStrong(&v448, v435);
            }
            if (v434) {

            }
            if (v436) {
            if (v438)
            }

            if (v440) {
            if (v442)
            }

            if (v444) {
            break;
            }
          case 2uLL:
            goto LABEL_63;
          case 3uLL:
          case 0x4DuLL:
            if ([(SUSUISoftwareUpdateManager *)v450 state] == 14)
            {
              id v118 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v117 = (id)SFLocalizableWAPIStringKeyForKey();
              id v21 = (id)objc_msgSend(v118, "localizedStringForKey:value:table:");
              id v22 = v448;
              id v448 = v21;
            }
            else
            {
              id v116 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              BOOL v23 = v450->_download == 0;
              char v403 = 0;
              char v401 = 0;
              if (!v23)
              {
                v404 = [(SUDownload *)v450->_download descriptor];
                char v403 = 1;
                if (v404)
                {
                  v402 = [(SUDownload *)v450->_download descriptor];
                  char v401 = 1;
                  [(SUDescriptor *)v402 isSplatOnly];
                }
              }
              id v115 = (id)SFLocalizableWAPIStringKeyForKey();
              id v24 = (id)objc_msgSend(v116, "localizedStringForKey:value:table:");
              id v25 = v448;
              id v448 = v24;

              if (v401) {
              if (v403)
              }
            }
            break;
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xCuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x1AuLL:
          case 0x1DuLL:
          case 0x1EuLL:
          case 0x1FuLL:
          case 0x20uLL:
          case 0x21uLL:
          case 0x22uLL:
          case 0x23uLL:
          case 0x24uLL:
          case 0x25uLL:
          case 0x26uLL:
          case 0x27uLL:
          case 0x28uLL:
          case 0x29uLL:
          case 0x2AuLL:
          case 0x2BuLL:
          case 0x2CuLL:
          case 0x2DuLL:
          case 0x2EuLL:
          case 0x2FuLL:
          case 0x30uLL:
          case 0x31uLL:
          case 0x32uLL:
          case 0x34uLL:
          case 0x35uLL:
          case 0x36uLL:
          case 0x37uLL:
          case 0x38uLL:
          case 0x39uLL:
          case 0x3AuLL:
          case 0x3BuLL:
          case 0x3CuLL:
          case 0x3DuLL:
          case 0x3EuLL:
          case 0x3FuLL:
          case 0x40uLL:
          case 0x41uLL:
          case 0x42uLL:
          case 0x43uLL:
          case 0x44uLL:
          case 0x45uLL:
          case 0x46uLL:
          case 0x47uLL:
          case 0x48uLL:
          case 0x49uLL:
          case 0x4AuLL:
          case 0x4BuLL:
          case 0x4CuLL:
          case 0x4EuLL:
          case 0x4FuLL:
          case 0x50uLL:
          case 0x51uLL:
          case 0x52uLL:
          case 0x53uLL:
          case 0x54uLL:
          case 0x55uLL:
          case 0x56uLL:
          case 0x57uLL:
          case 0x58uLL:
          case 0x59uLL:
          case 0x5AuLL:
          case 0x5BuLL:
          case 0x5CuLL:
          case 0x5DuLL:
          case 0x5EuLL:
          case 0x5FuLL:
          case 0x60uLL:
          case 0x61uLL:
          case 0x63uLL:
            break;
          case 0xBuLL:
            BOOL v66 = v450->_download == 0;
            char v168 = 0;
            char v166 = 0;
            char v164 = 0;
            char v162 = 0;
            char v160 = 0;
            char v158 = 0;
            char v156 = 0;
            char v154 = 0;
            if (!v66
              && (id v169 = [(SUDownload *)v450->_download descriptor],
                  char v168 = 1,
                  v169)
              && (unsigned __int8 v167 = [(SUDownload *)v450->_download descriptor],
                  char v166 = 1,
                  ([(SUDescriptor *)v167 isSplatOnly] & 1) != 0))
            {
              id v165 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v164 = 1;
              id v163 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RSR_VERIFICATION_FAILED"];
              char v162 = 1;
              id v161 = (id)objc_msgSend(v165, "localizedStringForKey:value:table:");
              char v160 = 1;
              objc_storeStrong(&v448, v161);
            }
            else
            {
              id v159 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v158 = 1;
              id v157 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"VERIFICATION_FAILED"];
              char v156 = 1;
              id v155 = (id)objc_msgSend(v159, "localizedStringForKey:value:table:");
              char v154 = 1;
              objc_storeStrong(&v448, v155);
            }
            if (v154) {

            }
            if (v156) {
            if (v158)
            }

            if (v160) {
            if (v162)
            }

            if (v164) {
            if (v166)
            }

            if (v168) {
            break;
            }
          case 0xDuLL:
            os_log_type_t v83 = NSString;
            BOOL v67 = v450->_download == 0;
            char v152 = 0;
            char v150 = 0;
            char v148 = 0;
            char v146 = 0;
            char v144 = 0;
            char v142 = 0;
            if (!v67
              && (id v153 = [(SUDownload *)v450->_download descriptor],
                  char v152 = 1,
                  v153)
              && (id v151 = [(SUDownload *)v450->_download descriptor],
                  char v150 = 1,
                  ([v151 isSplatOnly] & 1) != 0))
            {
              id v149 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v148 = 1;
              id v147 = (id)[v149 localizedStringForKey:@"RSR_PERSONALIZATION_FAILED" value:&stru_26DCD7690 table:@"Software Update"];
              char v146 = 1;
              id v82 = v147;
            }
            else
            {
              id v145 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v144 = 1;
              id v143 = (id)[v145 localizedStringForKey:@"PERSONALIZATION_FAILED" value:&stru_26DCD7690 table:@"Software Update"];
              char v142 = 1;
              id v82 = v143;
            }
            id v81 = [(SUSUISoftwareUpdateManager *)v450 preferredUpdate];
            id v80 = (id)[(SUDescriptor *)v81 humanReadableUpdateName];
            id v68 = (id)objc_msgSend(v83, "stringWithFormat:", v82, v80);
            id v69 = v448;
            id v448 = v68;

            if (v142) {
            if (v144)
            }

            if (v146) {
            if (v148)
            }

            if (v150) {
            if (v152)
            }

            break;
          case 0xEuLL:
            id v102 = [(SUSUISoftwareUpdateManager *)v450 preferredUpdate];
            SURequiredBatteryLevelForInstallation();
            float v103 = v29;

            float v30 = 100.0 * v103;
            float v31 = floorf(v30) / 100.0;
            float v387 = v31;
            int v104 = (void *)MEMORY[0x263F086F0];
            char v105 = [(SUSUISoftwareUpdateManager *)v450 preferredUpdate];
            id v386 = (id)objc_msgSend(v104, "stringFromByteCount:countStyle:", -[SUDescriptor installationSize](v105, "installationSize"), 2);

            id v108 = (id)[location[0] userInfo];
            id v107 = getkSUInstallationConstraintsUnmetKey_1();
            id v106 = (id)objc_msgSend(v108, "objectForKey:");
            uint64_t v109 = [v106 unsignedIntegerValue];

            uint64_t v385 = v109;
            if ((v109 & 8) != 0)
            {
              BOOL v33 = v450->_download == 0;
              char v383 = 0;
              char v381 = 0;
              char v379 = 0;
              char v377 = 0;
              char v375 = 0;
              char v373 = 0;
              char v371 = 0;
              char v369 = 0;
              if (!v33
                && (v384 = [(SUDownload *)v450->_download descriptor],
                    char v383 = 1,
                    v384)
                && (v382 = [(SUDownload *)v450->_download descriptor],
                    char v381 = 1,
                    ([(SUDescriptor *)v382 isSplatOnly] & 1) != 0))
              {
                id v380 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                char v379 = 1;
                id v378 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"RSR_INSTALL_DELAYED_OTA_RESTORE"];
                char v377 = 1;
                id v376 = (id)objc_msgSend(v380, "localizedStringForKey:value:table:");
                char v375 = 1;
                objc_storeStrong(&v448, v376);
              }
              else
              {
                id v374 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                char v373 = 1;
                id v372 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"INSTALL_DELAYED_OTA_RESTORE"];
                char v371 = 1;
                id v370 = (id)objc_msgSend(v374, "localizedStringForKey:value:table:");
                char v369 = 1;
                objc_storeStrong(&v448, v370);
              }
              if (v369) {

              }
              if (v371) {
              if (v373)
              }

              if (v375) {
              if (v377)
              }

              if (v379) {
              if (v381)
              }

              if (v383) {
              int v447 = 2;
              }
            }
            else
            {
              uint64_t v368 = 7;
              uint64_t v367 = 3;
              uint64_t v366 = 5;
              uint64_t v365 = 6;
              uint64_t v100 = (void *)MEMORY[0x263F08A30];
              *(float *)&double v32 = v387;
              id v101 = (id)[NSNumber numberWithFloat:v32];
              id v364 = (id)objc_msgSend(v100, "localizedStringFromNumber:numberStyle:");

              char v363 = 0;
              char v362 = SUPrefsconnectedToCharger((uint64_t)&v363) & 1;
              if ((v385 & v368) == v368)
              {
                id v99 = NSString;
                BOOL v34 = v450->_download == 0;
                char v360 = 0;
                char v358 = 0;
                char v356 = 0;
                char v354 = 0;
                char v352 = 0;
                char v350 = 0;
                if (!v34
                  && (v361 = [(SUDownload *)v450->_download descriptor],
                      char v360 = 1,
                      v361)
                  && (v359 = [(SUDownload *)v450->_download descriptor],
                      char v358 = 1,
                      ([(SUDescriptor *)v359 isSplatOnly] & 1) != 0))
                {
                  id v357 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v356 = 1;
                  id v355 = (id)[v357 localizedStringForKey:@"RSR_BATTERY_STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v354 = 1;
                  id v98 = v355;
                }
                else
                {
                  id v353 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v352 = 1;
                  id v351 = (id)[v353 localizedStringForKey:@"BATTERY_STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v350 = 1;
                  id v98 = v351;
                }
                id v35 = (id)objc_msgSend(v99, "stringWithFormat:", v98, v364, v386);
                id v36 = v448;
                id v448 = v35;

                if (v350) {
                if (v352)
                }

                if (v354) {
                if (v356)
                }

                if (v358) {
                if (v360)
                }
              }
              else if ((v385 & v365) == v365)
              {
                char v97 = NSString;
                BOOL v37 = v450->_download == 0;
                char v348 = 0;
                char v346 = 0;
                char v344 = 0;
                char v342 = 0;
                char v340 = 0;
                char v338 = 0;
                if (!v37
                  && (v349 = [(SUDownload *)v450->_download descriptor],
                      char v348 = 1,
                      v349)
                  && (v347 = [(SUDownload *)v450->_download descriptor],
                      char v346 = 1,
                      ([(SUDescriptor *)v347 isSplatOnly] & 1) != 0))
                {
                  id v345 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v344 = 1;
                  id v343 = (id)[v345 localizedStringForKey:@"RSR_STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v342 = 1;
                  id v96 = v343;
                }
                else
                {
                  id v341 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v340 = 1;
                  id v339 = (id)[v341 localizedStringForKey:@"STORAGE_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v338 = 1;
                  id v96 = v339;
                }
                id v38 = (id)objc_msgSend(v97, "stringWithFormat:", v96, v386);
                id v39 = v448;
                id v448 = v38;

                if (v338) {
                if (v340)
                }

                if (v342) {
                if (v344)
                }

                if (v346) {
                if (v348)
                }
              }
              else if ((v385 & v367) == v367)
              {
                char v95 = NSString;
                BOOL v40 = v450->_download == 0;
                char v336 = 0;
                char v334 = 0;
                char v332 = 0;
                char v330 = 0;
                char v328 = 0;
                char v326 = 0;
                if (!v40
                  && (v337 = [(SUDownload *)v450->_download descriptor],
                      char v336 = 1,
                      v337)
                  && (v335 = [(SUDownload *)v450->_download descriptor],
                      char v334 = 1,
                      ([(SUDescriptor *)v335 isSplatOnly] & 1) != 0))
                {
                  id v333 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v332 = 1;
                  id v331 = (id)[v333 localizedStringForKey:@"RSR_BATTERY_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v330 = 1;
                  id v94 = v331;
                }
                else
                {
                  id v329 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v328 = 1;
                  id v327 = (id)[v329 localizedStringForKey:@"BATTERY_AND_NETWORK_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v326 = 1;
                  id v94 = v327;
                }
                id v41 = (id)objc_msgSend(v95, "stringWithFormat:", v94, v364);
                id v42 = v448;
                id v448 = v41;

                if (v326) {
                if (v328)
                }

                if (v330) {
                if (v332)
                }

                if (v334) {
                if (v336)
                }
              }
              else if ((v385 & v366) == v366)
              {
                char v93 = NSString;
                BOOL v43 = v450->_download == 0;
                char v324 = 0;
                char v322 = 0;
                char v320 = 0;
                char v318 = 0;
                char v316 = 0;
                char v314 = 0;
                if (!v43
                  && (v325 = [(SUDownload *)v450->_download descriptor],
                      char v324 = 1,
                      v325)
                  && (v323 = [(SUDownload *)v450->_download descriptor],
                      char v322 = 1,
                      ([(SUDescriptor *)v323 isSplatOnly] & 1) != 0))
                {
                  id v321 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v320 = 1;
                  id v319 = (id)[v321 localizedStringForKey:@"RSR_BATTERY_AND_STORAGE_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v318 = 1;
                  id v92 = v319;
                }
                else
                {
                  id v317 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v316 = 1;
                  id v315 = (id)[v317 localizedStringForKey:@"BATTERY_AND_STORAGE_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v314 = 1;
                  id v92 = v315;
                }
                id v44 = (id)objc_msgSend(v93, "stringWithFormat:", v92, v364, v386);
                id v45 = v448;
                id v448 = v44;

                if (v314) {
                if (v316)
                }

                if (v318) {
                if (v320)
                }

                if (v322) {
                if (v324)
                }
              }
              else if (v385 & 1) == 0 || (v362)
              {
                if ((v385 & 1) != 0 && (v362 & 1) != 0 && (v363 & 1) == 0)
                {
                  id v89 = NSString;
                  BOOL v49 = v450->_download == 0;
                  char v300 = 0;
                  char v298 = 0;
                  char v296 = 0;
                  char v294 = 0;
                  char v292 = 0;
                  char v290 = 0;
                  if (!v49
                    && (v301 = [(SUDownload *)v450->_download descriptor],
                        char v300 = 1,
                        v301)
                    && (v299 = [(SUDownload *)v450->_download descriptor],
                        char v298 = 1,
                        ([(SUDescriptor *)v299 isSplatOnly] & 1) != 0))
                  {
                    id v297 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v296 = 1;
                    id v295 = (id)[v297 localizedStringForKey:@"RSR_BATTERY_WIRED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v294 = 1;
                    id v88 = v295;
                  }
                  else
                  {
                    id v293 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v292 = 1;
                    id v291 = (id)[v293 localizedStringForKey:@"BATTERY_WIRED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v290 = 1;
                    id v88 = v291;
                  }
                  id v50 = (id)objc_msgSend(v89, "stringWithFormat:", v88, v364);
                  id v51 = v448;
                  id v448 = v50;

                  if (v290) {
                  if (v292)
                  }

                  if (v294) {
                  if (v296)
                  }

                  if (v298) {
                  if (v300)
                  }
                }
                else if (v385 & 1) != 0 && (v362 & 1) != 0 && (v363)
                {
                  id v87 = NSString;
                  BOOL v52 = v450->_download == 0;
                  char v288 = 0;
                  char v286 = 0;
                  char v284 = 0;
                  char v282 = 0;
                  char v280 = 0;
                  char v278 = 0;
                  if (!v52
                    && (v289 = [(SUDownload *)v450->_download descriptor],
                        char v288 = 1,
                        v289)
                    && (v287 = [(SUDownload *)v450->_download descriptor],
                        char v286 = 1,
                        ([(SUDescriptor *)v287 isSplatOnly] & 1) != 0))
                  {
                    id v285 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v284 = 1;
                    id v283 = (id)[v285 localizedStringForKey:@"RSR_BATTERY_WIRELESS_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v282 = 1;
                    id v86 = v283;
                  }
                  else
                  {
                    id v281 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v280 = 1;
                    id v279 = (id)[v281 localizedStringForKey:@"BATTERY_WIRELESS_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v278 = 1;
                    id v86 = v279;
                  }
                  id v53 = (id)objc_msgSend(v87, "stringWithFormat:", v86, v364);
                  id v54 = v448;
                  id v448 = v53;

                  if (v278) {
                  if (v280)
                  }

                  if (v282) {
                  if (v284)
                  }

                  if (v286) {
                  if (v288)
                  }
                }
                else if ((v385 & 4) != 0)
                {
                  int v85 = NSString;
                  BOOL v55 = v450->_download == 0;
                  char v276 = 0;
                  char v274 = 0;
                  char v272 = 0;
                  char v270 = 0;
                  char v268 = 0;
                  char v266 = 0;
                  if (!v55
                    && (v277 = [(SUDownload *)v450->_download descriptor],
                        char v276 = 1,
                        v277)
                    && (v275 = [(SUDownload *)v450->_download descriptor],
                        char v274 = 1,
                        ([(SUDescriptor *)v275 isSplatOnly] & 1) != 0))
                  {
                    id v273 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v272 = 1;
                    id v271 = (id)[v273 localizedStringForKey:@"RSR_STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
                    char v270 = 1;
                    id v84 = v271;
                  }
                  else
                  {
                    id v269 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v268 = 1;
                    id v267 = (id)[v269 localizedStringForKey:@"STORAGE_DOWNLOAD_ERROR_%@" value:&stru_26DCD7690 table:@"Software Update"];
                    char v266 = 1;
                    id v84 = v267;
                  }
                  id v56 = (id)objc_msgSend(v85, "stringWithFormat:", v84, v386);
                  id v57 = v448;
                  id v448 = v56;

                  if (v266) {
                  if (v268)
                  }

                  if (v270) {
                  if (v272)
                  }

                  if (v274) {
                  if (v276)
                  }
                }
                else if ((v385 & 2) != 0)
                {
                  BOOL v58 = v450->_download == 0;
                  char v264 = 0;
                  char v262 = 0;
                  char v260 = 0;
                  char v258 = 0;
                  char v256 = 0;
                  char v254 = 0;
                  if (!v58
                    && (v265 = [(SUDownload *)v450->_download descriptor],
                        char v264 = 1,
                        v265)
                    && (v263 = [(SUDownload *)v450->_download descriptor],
                        char v262 = 1,
                        ([(SUDescriptor *)v263 isSplatOnly] & 1) != 0))
                  {
                    id v261 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v260 = 1;
                    id v259 = (id)[v261 localizedStringForKey:@"RSR_NETWORK_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v258 = 1;
                    objc_storeStrong(&v448, v259);
                  }
                  else
                  {
                    id v257 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v256 = 1;
                    id v255 = (id)[v257 localizedStringForKey:@"NETWORK_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v254 = 1;
                    objc_storeStrong(&v448, v255);
                  }
                  if (v254) {

                  }
                  if (v256) {
                  if (v258)
                  }

                  if (v260) {
                  if (v262)
                  }

                  if (v264) {
                }
                  }
                else if ((v385 & 0x80) != 0)
                {
                  BOOL v59 = v450->_download == 0;
                  char v252 = 0;
                  char v250 = 0;
                  char v248 = 0;
                  char v246 = 0;
                  char v244 = 0;
                  char v242 = 0;
                  if (!v59
                    && (v253 = [(SUDownload *)v450->_download descriptor],
                        char v252 = 1,
                        v253)
                    && (v251 = [(SUDownload *)v450->_download descriptor],
                        char v250 = 1,
                        ([(SUDescriptor *)v251 isSplatOnly] & 1) != 0))
                  {
                    id v249 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v248 = 1;
                    id v247 = (id)[v249 localizedStringForKey:@"RSR_SYNCING_DATA_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v246 = 1;
                    objc_storeStrong(&v448, v247);
                  }
                  else
                  {
                    id v245 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v244 = 1;
                    id v243 = (id)[v245 localizedStringForKey:@"SYNCING_DATA_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v242 = 1;
                    objc_storeStrong(&v448, v243);
                  }
                  if (v242) {

                  }
                  if (v244) {
                  if (v246)
                  }

                  if (v248) {
                  if (v250)
                  }

                  if (v252) {
                }
                  }
                else if ((v385 & 0x100) != 0)
                {
                  BOOL v60 = v450->_download == 0;
                  char v240 = 0;
                  char v238 = 0;
                  char v236 = 0;
                  char v234 = 0;
                  char v232 = 0;
                  char v230 = 0;
                  if (!v60
                    && (v241 = [(SUDownload *)v450->_download descriptor],
                        char v240 = 1,
                        v241)
                    && (v239 = [(SUDownload *)v450->_download descriptor],
                        char v238 = 1,
                        ([(SUDescriptor *)v239 isSplatOnly] & 1) != 0))
                  {
                    id v237 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v236 = 1;
                    id v235 = (id)[v237 localizedStringForKey:@"RSR_PHONE_CALL_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v234 = 1;
                    objc_storeStrong(&v448, v235);
                  }
                  else
                  {
                    id v233 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v232 = 1;
                    id v231 = (id)[v233 localizedStringForKey:@"PHONE_CALL_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v230 = 1;
                    objc_storeStrong(&v448, v231);
                  }
                  if (v230) {

                  }
                  if (v232) {
                  if (v234)
                  }

                  if (v236) {
                  if (v238)
                  }

                  if (v240) {
                }
                  }
                else if ((v385 & 0x40) != 0)
                {
                  BOOL v61 = v450->_download == 0;
                  char v228 = 0;
                  char v226 = 0;
                  char v224 = 0;
                  char v222 = 0;
                  char v220 = 0;
                  char v218 = 0;
                  if (!v61
                    && (v229 = [(SUDownload *)v450->_download descriptor],
                        char v228 = 1,
                        v229)
                    && (v227 = [(SUDownload *)v450->_download descriptor],
                        char v226 = 1,
                        ([(SUDescriptor *)v227 isSplatOnly] & 1) != 0))
                  {
                    id v225 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v224 = 1;
                    id v223 = (id)[v225 localizedStringForKey:@"RSR_RESTORING_FROM_BACKUP_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v222 = 1;
                    objc_storeStrong(&v448, v223);
                  }
                  else
                  {
                    id v221 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v220 = 1;
                    id v219 = (id)[v221 localizedStringForKey:@"RESTORING_FROM_BACKUP_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v218 = 1;
                    objc_storeStrong(&v448, v219);
                  }
                  if (v218) {

                  }
                  if (v220) {
                  if (v222)
                  }

                  if (v224) {
                  if (v226)
                  }

                  if (v228) {
                }
                  }
                else if ((v385 & 0x200) != 0)
                {
                  BOOL v62 = v450->_download == 0;
                  char v216 = 0;
                  char v214 = 0;
                  char v212 = 0;
                  char v210 = 0;
                  char v208 = 0;
                  char v206 = 0;
                  if (!v62
                    && (v217 = [(SUDownload *)v450->_download descriptor],
                        char v216 = 1,
                        v217)
                    && (v215 = [(SUDownload *)v450->_download descriptor],
                        char v214 = 1,
                        ([(SUDescriptor *)v215 isSplatOnly] & 1) != 0))
                  {
                    id v213 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v212 = 1;
                    id v211 = (id)[v213 localizedStringForKey:@"RSR_CARPLAY_CONNECTED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v210 = 1;
                    objc_storeStrong(&v448, v211);
                  }
                  else
                  {
                    id v209 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v208 = 1;
                    id v207 = (id)[v209 localizedStringForKey:@"CARPLAY_CONNECTED_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v206 = 1;
                    objc_storeStrong(&v448, v207);
                  }
                  if (v206) {

                  }
                  if (v208) {
                  if (v210)
                  }

                  if (v212) {
                  if (v214)
                  }

                  if (v216) {
                }
                  }
                else if ((v385 & 0x400) != 0)
                {
                  BOOL v63 = v450->_download == 0;
                  char v204 = 0;
                  char v202 = 0;
                  char v200 = 0;
                  char v198 = 0;
                  char v196 = 0;
                  char v194 = 0;
                  if (!v63
                    && (v205 = [(SUDownload *)v450->_download descriptor],
                        char v204 = 1,
                        v205)
                    && (v203 = [(SUDownload *)v450->_download descriptor],
                        char v202 = 1,
                        ([(SUDescriptor *)v203 isSplatOnly] & 1) != 0))
                  {
                    id v201 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v200 = 1;
                    id v199 = (id)[v201 localizedStringForKey:@"RSR_MEDIA_PLAYING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v198 = 1;
                    objc_storeStrong(&v448, v199);
                  }
                  else
                  {
                    id v197 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v196 = 1;
                    id v195 = (id)[v197 localizedStringForKey:@"MEDIA_PLAYING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v194 = 1;
                    objc_storeStrong(&v448, v195);
                  }
                  if (v194) {

                  }
                  if (v196) {
                  if (v198)
                  }

                  if (v200) {
                  if (v202)
                  }

                  if (v204) {
                }
                  }
                else if ((v385 & 0x800) != 0)
                {
                  BOOL v64 = v450->_download == 0;
                  char v192 = 0;
                  char v190 = 0;
                  char v188 = 0;
                  char v186 = 0;
                  char v184 = 0;
                  char v182 = 0;
                  if (!v64
                    && (v193 = [(SUDownload *)v450->_download descriptor],
                        char v192 = 1,
                        v193)
                    && (v191 = [(SUDownload *)v450->_download descriptor],
                        char v190 = 1,
                        ([(SUDescriptor *)v191 isSplatOnly] & 1) != 0))
                  {
                    id v189 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v188 = 1;
                    id v187 = (id)[v189 localizedStringForKey:@"RSR_DRIVING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v186 = 1;
                    objc_storeStrong(&v448, v187);
                  }
                  else
                  {
                    id v185 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v184 = 1;
                    id v183 = (id)[v185 localizedStringForKey:@"DRIVING_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v182 = 1;
                    objc_storeStrong(&v448, v183);
                  }
                  if (v182) {

                  }
                  if (v184) {
                  if (v186)
                  }

                  if (v188) {
                  if (v190)
                  }

                  if (v192) {
                }
                  }
                else if ((v385 & 0x1000) != 0)
                {
                  BOOL v65 = v450->_download == 0;
                  char v180 = 0;
                  char v178 = 0;
                  char v176 = 0;
                  char v174 = 0;
                  char v172 = 0;
                  char v170 = 0;
                  if (!v65
                    && (v181 = [(SUDownload *)v450->_download descriptor],
                        char v180 = 1,
                        v181)
                    && (uint64_t v179 = [(SUDownload *)v450->_download descriptor],
                        char v178 = 1,
                        ([(SUDescriptor *)v179 isSplatOnly] & 1) != 0))
                  {
                    id v177 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v176 = 1;
                    id v175 = (id)[v177 localizedStringForKey:@"RSR_WOMBAT_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v174 = 1;
                    objc_storeStrong(&v448, v175);
                  }
                  else
                  {
                    id v173 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                    char v172 = 1;
                    id v171 = (id)[v173 localizedStringForKey:@"WOMBAT_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                    char v170 = 1;
                    objc_storeStrong(&v448, v171);
                  }
                  if (v170) {

                  }
                  if (v172) {
                  if (v174)
                  }

                  if (v176) {
                  if (v178)
                  }

                  if (v180) {
                }
                  }
              }
              else
              {
                id v91 = NSString;
                BOOL v46 = v450->_download == 0;
                char v312 = 0;
                char v310 = 0;
                char v308 = 0;
                char v306 = 0;
                char v304 = 0;
                char v302 = 0;
                if (!v46
                  && (v313 = [(SUDownload *)v450->_download descriptor],
                      char v312 = 1,
                      v313)
                  && (v311 = [(SUDownload *)v450->_download descriptor],
                      char v310 = 1,
                      ([(SUDescriptor *)v311 isSplatOnly] & 1) != 0))
                {
                  id v309 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v308 = 1;
                  id v307 = (id)[v309 localizedStringForKey:@"RSR_BATTERY_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v306 = 1;
                  id v90 = v307;
                }
                else
                {
                  id v305 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                  char v304 = 1;
                  id v303 = (id)[v305 localizedStringForKey:@"BATTERY_INSTALL_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                  char v302 = 1;
                  id v90 = v303;
                }
                id v47 = (id)objc_msgSend(v91, "stringWithFormat:", v90, v364);
                id v48 = v448;
                id v448 = v47;

                if (v302) {
                if (v304)
                }

                if (v306) {
                if (v308)
                }

                if (v310) {
                if (v312)
                }
              }
              int v447 = 2;
              objc_storeStrong(&v364, 0);
            }
            objc_storeStrong(&v386, 0);
            break;
          case 0x19uLL:
            id v122 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v121 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPDATE_NOT_OTA_DOWNLOADABLE"];
            id v17 = (id)objc_msgSend(v122, "localizedStringForKey:value:table:");
            id v18 = v448;
            id v448 = v17;

            break;
          case 0x1BuLL:
          case 0x1CuLL:
            if ([(SUSUISoftwareUpdateManager *)v450 state] != 14) {
              goto LABEL_63;
            }
            id v433 = 0;
            id v133 = objc_alloc(MEMORY[0x263F02D30]);
            char v134 = dispatch_get_global_queue(33, 0);
            id v432 = (id)objc_msgSend(v133, "initWithQueue:");

            id v431 = 0;
            id v429 = 0;
            id v135 = (id)[v432 getPreferredDataSubscriptionContextSync:&v429];
            objc_storeStrong(&v431, v429);
            id v430 = v135;
            if (v135)
            {
              id v426 = 0;
              id v425 = 0;
              id v131 = (void *)[v432 copyRegistrationStatus:v430 error:&v425];
              objc_storeStrong(&v426, v425);
              id v6 = v433;
              id v433 = v131;

              if (!v433)
              {
                id v424 = _SUSUILoggingFacility();
                os_log_type_t v423 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled((os_log_t)v424, OS_LOG_TYPE_DEFAULT))
                {
                  id v130 = (id)[v426 description];
                  __os_log_helper_16_2_1_8_64((uint64_t)v453, (uint64_t)v130);
                  _os_log_impl(&dword_228401000, (os_log_t)v424, v423, "Failed to copyRegistrationStatus from CoreTelephony. %@", v453, 0xCu);
                }
                objc_storeStrong(&v424, 0);
              }
              objc_storeStrong(&v426, 0);
            }
            else
            {
              id v428 = _SUSUILoggingFacility();
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled((os_log_t)v428, OS_LOG_TYPE_DEFAULT))
              {
                id v132 = (id)[v431 description];
                __os_log_helper_16_2_1_8_64((uint64_t)v454, (uint64_t)v132);
                _os_log_impl(&dword_228401000, (os_log_t)v428, type, "Failed to get preferred CTXPCServiceSubscriptionContext. %@", v454, 0xCu);
              }
              objc_storeStrong(&v428, 0);
            }
            char v422 = 0;
            char v422 = [v433 isEqualToString:*MEMORY[0x263F03010]] & 1;
            if (v422)
            {
              if (PSIsDataRoamingEnabled() & 1)
              {
                id v129 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v7 = (id)[v129 localizedStringForKey:@"DOWNLOAD_RESUME_ROAMING_REQUIRED" value:&stru_26DCD7690 table:@"Software Update"];
                id v8 = v448;
                id v448 = v7;
              }
              else
              {
                id v128 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v127 = (id)SFLocalizableWAPIStringKeyForKey();
                id v9 = (id)objc_msgSend(v128, "localizedStringForKey:value:table:");
                id v10 = v448;
                id v448 = v9;
              }
              int v447 = 2;
            }
            else if (v446 == 33)
            {
              BOOL v11 = v450->_download == 0;
              char v419 = 0;
              char v417 = 0;
              char v415 = 0;
              char v413 = 0;
              char v411 = 0;
              char v409 = 0;
              if (!v11
                && (v420 = [(SUDownload *)v450->_download descriptor],
                    char v419 = 1,
                    v420)
                && (v418 = [(SUDownload *)v450->_download descriptor],
                    char v417 = 1,
                    ([(SUDescriptor *)v418 isSplatOnly] & 1) != 0))
              {
                id v416 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                char v415 = 1;
                id v414 = (id)[v416 localizedStringForKey:@"RSR_ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                char v413 = 1;
                objc_storeStrong(&v448, v414);
              }
              else
              {
                id v412 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                char v411 = 1;
                id v410 = (id)[v412 localizedStringForKey:@"ANY_NETWORK_DOWNLOAD_ERROR" value:&stru_26DCD7690 table:@"Software Update"];
                char v409 = 1;
                objc_storeStrong(&v448, v410);
              }
              if (v409) {

              }
              if (v411) {
              if (v413)
              }

              if (v415) {
              if (v417)
              }

              if (v419) {
              int v447 = 2;
              }
            }
            else
            {
              int v447 = 0;
            }
            objc_storeStrong(&v430, 0);
            objc_storeStrong(&v431, 0);
            objc_storeStrong(&v432, 0);
            objc_storeStrong(&v433, 0);
            if (!v447)
            {
LABEL_63:
              if ([(SUSUISoftwareUpdateManager *)v450 state] == 14)
              {
                id v126 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                id v125 = (id)SFLocalizableWAPIStringKeyForKey();
                id v12 = (id)objc_msgSend(v126, "localizedStringForKey:value:table:");
                id v13 = v448;
                id v448 = v12;
              }
              else
              {
                id v124 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
                BOOL v14 = v450->_download == 0;
                char v407 = 0;
                char v405 = 0;
                if (!v14)
                {
                  v408 = [(SUDownload *)v450->_download descriptor];
                  char v407 = 1;
                  if (v408)
                  {
                    v406 = [(SUDownload *)v450->_download descriptor];
                    char v405 = 1;
                    [(SUDescriptor *)v406 isSplatOnly];
                  }
                }
                id v123 = (id)SFLocalizableWAPIStringKeyForKey();
                id v15 = (id)objc_msgSend(v124, "localizedStringForKey:value:table:");
                id v16 = v448;
                id v448 = v15;

                if (v405) {
                if (v407)
                }
              }
            }
            break;
          case 0x62uLL:
            objc_storeStrong(&v448, @"INTERNAL ONLY: Device needs to be rooted from snapshot to update.\nAs root user, run 'snapshottool golive 0' then 'reboot'.\nYou'll be able to update once the device boots back.");
            break;
          case 0x64uLL:
            id v120 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v119 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UPDATE_NOT_OTA_INSTALLABLE"];
            id v19 = (id)objc_msgSend(v120, "localizedStringForKey:value:table:");
            id v20 = v448;
            id v448 = v19;

            break;
          default:
            JUMPOUT(0);
        }
      }
    }
    else
    {
      id v78 = (id)[location[0] domain];
      char v79 = [v78 isEqualToString:@"com.apple.preferences.softwareupdate"];

      if ((v79 & 1) != 0 && [location[0] code] == 1)
      {
        id v77 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v70 = (id)[v77 localizedStringForKey:@"UPDATE_REQUESTED_EXPLANATION" value:&stru_26DCD7690 table:@"Software Update"];
        id v71 = v448;
        id v448 = v70;
      }
    }
    if (location[0] && !v448)
    {
      os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v452, (uint64_t)location[0]);
        _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "SU generic error: %@", v452, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v448, &stru_26DCD7690);
    }
    char v139 = 0;
    char v76 = 0;
    if (location[0])
    {
      char v76 = 0;
      if ([v448 isEqualToString:&stru_26DCD7690])
      {
        id v140 = (id)[MEMORY[0x263F82670] currentDevice];
        char v139 = 1;
        char v76 = objc_msgSend(v140, "sf_isInternalInstall");
      }
    }
    if (v139) {

    }
    if (v76)
    {
      id v72 = (id)[NSString stringWithFormat:@"[Internal Only] An unresolvable error has occurred, please file a radar. Error Code: %ld.", objc_msgSend(location[0], "code")];
      id v73 = v448;
      id v448 = v72;
    }
    id v451 = v448;
    int v447 = 1;
  }
  objc_storeStrong(&v448, 0);
  objc_storeStrong(location, 0);
  os_log_type_t v74 = v451;
  return v74;
}

- (id)humanReadableDescriptionForError:(id)a3 enableButton:(BOOL *)a4 showAsButtonFooter:(BOOL *)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a5) {
    *a5 = 0;
  }
  id v6 = [(SUSUISoftwareUpdateManager *)v10 humanReadableDescriptionForError:location[0] enableButton:a4];
  objc_storeStrong(location, 0);
  return v6;
}

- (void)promptForDevicePasscodeForDescriptor:(id)a3 unattendedInstall:(BOOL)a4 completion:(id)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  suClient = v16->_suClient;
  id v7 = location[0];
  id v9 = v16;
  id v10 = location[0];
  BOOL v12 = v14;
  id v11 = v13;
  -[SUSUISoftwareUpdateClientManager isInstallationKeybagRequiredForDescriptor:result:](suClient, "isInstallationKeybagRequiredForDescriptor:result:", v7);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke(uint64_t a1, char a2, id obj)
{
  id v71 = &v93;
  uint64_t v70 = a1;
  id v69 = "-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke";
  uint64_t v113 = *MEMORY[0x263EF8340];
  uint64_t v109 = a1;
  char v108 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v106[1] = (os_log_t)v70;
  v106[0] = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v106[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v71 + 21);
    *(_DWORD *)BOOL v65 = type;
    id v66 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v70 + 32) + 88));
    id v3 = v66;
    uint64_t v4 = v70;
    uint64_t v67 = (uint64_t)v3;
    *((void *)v71 + 19) = v3;
    int v68 = *(_DWORD *)(*(void *)(v4 + 32) + 88);
    LOBYTE(v4) = *(void *)(*(void *)(v4 + 32) + 120) == 0;
    char v103 = 0;
    if (v4)
    {
      BOOL v63 = @"N/A";
    }
    else
    {
      BOOL v5 = (__CFString *)(id)[*(id *)(*(void *)(v70 + 32) + 120) humanReadableUpdateName];
      *((void *)v71 + 18) = v5;
      char v103 = 1;
      BOOL v63 = v5;
    }
    BOOL v60 = v63;
    uint64_t v61 = *(void *)(*(void *)(v70 + 32) + 120);
    uint64_t v62 = *(void *)(*(void *)(v70 + 32) + 160);
    BOOL v6 = *(void *)(*(void *)(v70 + 32) + 128) == 0;
    char v102 = 0;
    if (v6)
    {
      BOOL v59 = @"N/A";
    }
    else
    {
      id v7 = (__CFString *)(id)[*(id *)(*(void *)(v70 + 32) + 128) humanReadableUpdateName];
      *((void *)v71 + 16) = v7;
      char v102 = 1;
      BOOL v59 = v7;
    }
    BOOL v55 = v59;
    uint64_t v56 = *(void *)(*(void *)(v70 + 32) + 128);
    uint64_t v57 = *(void *)(*(void *)(v70 + 32) + 168);
    uint64_t v58 = *(void *)(*(void *)(v70 + 32) + 8);
    BOOL v8 = *(void *)(*(void *)(v70 + 32) + 8) == 0;
    char v101 = 0;
    char v100 = 0;
    char v99 = 0;
    if (v8
      || (id v9 = (id)[*(id *)(*(void *)(v70 + 32) + 8) descriptor],
          *((void *)v71 + 14) = v9,
          char v101 = 1,
          !v9))
    {
      id v54 = @"N/A";
    }
    else
    {
      id v10 = (id)[*(id *)(*(void *)(v70 + 32) + 8) descriptor];
      *((void *)v71 + 12) = v10;
      int v53 = 1;
      char v100 = 1;
      id v11 = (__CFString *)(id)[v10 humanReadableUpdateName];
      *((void *)v71 + 10) = v11;
      char v99 = 1;
      id v54 = v11;
    }
    id v50 = v54;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v70 + 32) + 104));
    id v52 = objc_loadWeakRetained((id *)(*(void *)(v70 + 32) + 104));
    char v98 = 0;
    char v97 = 0;
    if (v52)
    {
      *((void *)v71 + 8) = objc_loadWeakRetained((id *)(*(void *)(v70 + 32) + 104));
      int v48 = 1;
      char v98 = 1;
      BOOL v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *((void *)v71 + 6) = v13;
      char v97 = 1;
      BOOL v49 = (__CFString *)v13;
    }
    else
    {
      BOOL v49 = @"N/A";
    }
    id v45 = v49;
    id v46 = objc_loadWeakRetained((id *)(*(void *)(v70 + 32) + 112));
    id v47 = objc_loadWeakRetained((id *)(*(void *)(v70 + 32) + 112));
    char v96 = 0;
    char v95 = 0;
    if (v47)
    {
      *((void *)v71 + 4) = objc_loadWeakRetained((id *)(*(void *)(v70 + 32) + 112));
      int v43 = 1;
      char v96 = 1;
      BOOL v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      *((void *)v71 + 2) = v15;
      char v95 = 1;
      id v44 = v15;
    }
    else
    {
      id v44 = @"N/A";
    }
    id v41 = &v18;
    buf = v112;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v112, (uint64_t)v69, v67, v68, (uint64_t)v60, v61, v62, (uint64_t)v55, v56, v57, v58, (uint64_t)v50, (uint64_t)WeakRetained, (uint64_t)v45, (uint64_t)v46, (uint64_t)v44, v108 & 1);
    _os_log_impl(&dword_228401000, log, v65[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisKeybagRequired: %d", buf, 0x9Au);
    if (v95) {

    }
    if (v96) {
    if (v97)
    }

    if (v98) {
    if (v99)
    }

    if (v100) {
    if (v101)
    }

    if (v102) {
    if (v103)
    }

    objc_storeStrong(&v104, 0);
  }
  objc_storeStrong((id *)v106, 0);
  char v94 = v108 & 1;
  char v92 = 0;
  int v40 = 0;
  if ((v108 & 1) == 0)
  {
    char v16 = [*(id *)(v70 + 40) isSplatOnly];
    int v40 = 0;
    if (v16)
    {
      id v17 = (id)[MEMORY[0x263F781F0] sharedInstance];
      *(void *)id v71 = v17;
      char v92 = 1;
      int v40 = [v17 hasPasscodeSet];
    }
  }
  int v39 = v40;
  if (v92) {

  }
  if (v39)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v90 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v36 = oslog;
      *(_DWORD *)BOOL v37 = v90;
      id v38 = v111;
      __os_log_helper_16_2_1_8_32((uint64_t)v111, (uint64_t)v69);
      _os_log_impl(&dword_228401000, v36, v37[0], "%s: prompting for passcode for splat-only update, but not generating an installation keybag", v38, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v94 = 1;
  }
  if (v94)
  {
    id v34 = (id)[*(id *)(v70 + 32) delegate];
    int v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      id v30 = (id)[*(id *)(v70 + 32) delegate];
      uint64_t v28 = *(void *)(v70 + 32);
      float v29 = &v82;
      uint64_t v82 = MEMORY[0x263EF8330];
      int v83 = -1073741824;
      int v84 = 0;
      int v85 = __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_712;
      id v86 = &unk_264840AD8;
      char v88 = v108 & 1;
      char v89 = *(unsigned char *)(v70 + 56) & 1;
      double v32 = (id *)v87;
      v87[0] = *(id *)(v70 + 32);
      float v31 = (id *)(v29 + 5);
      v87[1] = *(id *)(v70 + 48);
      [v30 manager:v28 promptForDeviceLAContextWithDescriptorCompletion:v29];

      id obja = 0;
      objc_storeStrong(v31, 0);
      objc_storeStrong(v32, obja);
    }
    else
    {
      id v24 = (id)[*(id *)(v70 + 32) delegate];
      uint64_t v22 = *(void *)(v70 + 32);
      BOOL v23 = &v74;
      uint64_t v74 = MEMORY[0x263EF8330];
      int v75 = -1073741824;
      int v76 = 0;
      id v77 = __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_715;
      id v78 = &unk_264840B00;
      char v80 = v108 & 1;
      char v81 = *(unsigned char *)(v70 + 56) & 1;
      BOOL v26 = (id *)v79;
      v79[0] = *(id *)(v70 + 32);
      id v25 = (id *)(v23 + 5);
      v79[1] = *(id *)(v70 + 48);
      [v24 manager:v22 promptForDevicePasscodeWithDescriptorCompletion:v23];

      id v27 = 0;
      objc_storeStrong(v25, 0);
      objc_storeStrong(v26, v27);
    }
  }
  else if (*(void *)(v70 + 48))
  {
    (*(void (**)(void))(*(void *)(v70 + 48) + 16))();
  }
  else
  {
    os_log_t v73 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v72 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v19 = v73;
      *(_DWORD *)id v20 = v72;
      id v21 = v110;
      __os_log_helper_16_2_1_8_32((uint64_t)v110, (uint64_t)v69);
      _os_log_impl(&dword_228401000, v19, v20[0], "%s: No completion callback has been supplied.", v21, 0xCu);
    }
    objc_storeStrong((id *)&v73, 0);
  }
  objc_storeStrong(&location, 0);
}

void __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_712(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = (id)a1;
  if (*(unsigned char *)(a1 + 48))
  {
    if (location[0])
    {
      v8[0] = _SUSUILoggingFacility();
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke", *(unsigned char *)(a1 + 49) & 1);
        _os_log_impl(&dword_228401000, (os_log_t)v8[0], v7, "%s: asynchronously creating installation keybag - forUnattendedInstall:%d", v12, 0x12u);
      }
      objc_storeStrong(v8, 0);
      id v6 = objc_alloc_init(MEMORY[0x263F781F8]);
      [v6 setLaContext:location[0]];
      [v6 setDescriptor:v9];
      [v6 setKeybagType:(*(unsigned char *)(a1 + 49) & 1) != 0];
      [*(id *)(*(void *)(a1 + 32) + 56) createInstallationKeybagWithOptions:v6 completion:*(void *)(a1 + 40)];
      objc_storeStrong(&v6, 0);
    }
    else
    {
      os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke");
        _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: failed to get user passcode", v11, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }
  else if (*(void *)(a1 + 40))
  {
    (*(void (**)(void, BOOL, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), location[0] != 0, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __96__SUSUISoftwareUpdateManager_promptForDevicePasscodeForDescriptor_unattendedInstall_completion___block_invoke_715(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  v8[1] = (id)a1;
  if (*(unsigned char *)(a1 + 48))
  {
    if (location[0])
    {
      v8[0] = _SUSUILoggingFacility();
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke", *(unsigned char *)(a1 + 49) & 1);
        _os_log_impl(&dword_228401000, (os_log_t)v8[0], v7, "%s: asynchronously creating installation keybag - forUnattendedInstall:%d", v12, 0x12u);
      }
      objc_storeStrong(v8, 0);
      id v6 = objc_alloc_init(MEMORY[0x263F781F8]);
      [v6 setPasscode:location[0]];
      [v6 setDescriptor:v9];
      [v6 setKeybagType:(*(unsigned char *)(a1 + 49) & 1) != 0];
      [*(id *)(*(void *)(a1 + 32) + 56) createInstallationKeybagWithOptions:v6 completion:*(void *)(a1 + 40)];
      objc_storeStrong(&v6, 0);
    }
    else
    {
      os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSUISoftwareUpdateManager promptForDevicePasscodeForDescriptor:unattendedInstall:completion:]_block_invoke");
        _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%s: failed to get user passcode", v11, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
  }
  else if (*(void *)(a1 + 40))
  {
    (*(void (**)(void, BOOL, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), location[0] != 0, 0);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_alertForDownloadConstraintsWithCompletion:(id)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  char v103 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v98 = 0;
    id v97 = 0;
    id SUDownloadPolicyFactoryClass_0 = getSUDownloadPolicyFactoryClass_0();
    id v45 = [(SUSUISoftwareUpdateManager *)v103 preferredUpdate];
    id v44 = [(SUSUISoftwareUpdateManager *)v103 download];
    int v43 = [(SUDownload *)v44 downloadOptions];
    id v42 = (id)[(SUDownloadOptions *)v43 activeDownloadPolicy];
    id v96 = (id)objc_msgSend(SUDownloadPolicyFactoryClass_0, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v45, v42, -[SUSUISoftwareUpdateManager allowCellularOverride](v103, "allowCellularOverride"));

    id v95 = (id)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:0];
    if (!v95) {
      goto LABEL_65;
    }
    id v94 = (id)[v95 getInternetDataStatusSync:0];
    if (!v94 || ([v94 cellularDataPossible] & 1) != 0)
    {
      int v99 = 0;
    }
    else
    {
      id v93 = _SUSUILoggingFacility();
      os_log_type_t v92 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v93, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = v93;
        os_log_type_t v40 = v92;
        __os_log_helper_16_0_0(v91);
        _os_log_impl(&dword_228401000, v39, v40, "Cellular data not possible on device. Not prompting for cellular download acceptance.", v91, 2u);
      }
      objc_storeStrong(&v93, 0);
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
      int v99 = 1;
    }
    objc_storeStrong(&v94, 0);
    if (!v99)
    {
LABEL_65:
      if (![(SUSUISoftwareUpdateManager *)v103 clientIsBuddy]) {
        goto LABEL_21;
      }
      id v90 = (id)[MEMORY[0x263F78208] sharedInstance];
      if ([v90 isBootstrap] & 1) == 0 || (objc_msgSend(v90, "isPathSatisfied"))
      {
        int v99 = 0;
      }
      else
      {
        id v89 = _SUSUILoggingFacility();
        os_log_type_t v88 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v89, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v37 = v89;
          os_log_type_t v38 = v88;
          __os_log_helper_16_0_0(v87);
          _os_log_impl(&dword_228401000, v37, v38, "Can't download update in bootstrap network. Not prompting for cellular download acceptance", v87, 2u);
        }
        objc_storeStrong(&v89, 0);
        (*((void (**)(id, void))location[0] + 2))(location[0], 0);
        int v99 = 1;
      }
      objc_storeStrong(&v90, 0);
      if (!v99)
      {
LABEL_21:
        if (MGGetBoolAnswer() & 1)
        {
          if ([v96 isDownloadAllowableForCellular])
          {
            if (v103->_networkType == 1)
            {
              id v79 = _SUSUILoggingFacility();
              os_log_type_t v78 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled((os_log_t)v79, OS_LOG_TYPE_DEFAULT))
              {
                float v31 = v79;
                os_log_type_t v32 = v78;
                __os_log_helper_16_0_0(v77);
                _os_log_impl(&dword_228401000, v31, v32, "Device is currently using Wi-Fi. Not prompting for cellular download acceptance.", v77, 2u);
              }
              objc_storeStrong(&v79, 0);
              (*((void (**)(id, void))location[0] + 2))(location[0], 0);
              int v99 = 1;
            }
            else if ([v96 is5GDownloadAllowed])
            {
              os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
              os_log_type_t v75 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                float v29 = oslog;
                os_log_type_t v30 = v75;
                __os_log_helper_16_0_0(v74);
                _os_log_impl(&dword_228401000, v29, v30, "Device is using inexpensive HDM. Not prompting for cellular download acceptance.", v74, 2u);
              }
              objc_storeStrong((id *)&oslog, 0);
              (*((void (**)(id, void))location[0] + 2))(location[0], 0);
              int v99 = 1;
            }
            else
            {
              char v73 = [v96 isDownloadFreeForCellular] & 1;
              id v72 = 0;
              id v71 = 0;
              os_log_t v70 = (os_log_t)_SUSUILoggingFacility();
              os_log_type_t v69 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                __os_log_helper_16_0_1_4_0((uint64_t)v104, v73 & 1);
                _os_log_impl(&dword_228401000, v70, v69, "Alerting user about cellular fees. zero rated = %d", v104, 8u);
              }
              objc_storeStrong((id *)&v70, 0);
              id v28 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              char v67 = 0;
              char v65 = 0;
              char v63 = 0;
              char v61 = 0;
              if (v73)
              {
                char v27 = 0;
                if (v103->_download)
                {
                  id v68 = [(SUDownload *)v103->_download descriptor];
                  char v67 = 1;
                  char v27 = 0;
                  if (v68)
                  {
                    id v66 = [(SUDownload *)v103->_download descriptor];
                    char v65 = 1;
                    char v27 = [v66 isSplatOnly];
                  }
                }
                id v3 = @"RSR_CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES";
                if ((v27 & 1) == 0) {
                  id v3 = @"CELLULAR_DOWNLOAD_ACCEPT_POSSIBLE_FEES";
                }
                BOOL v26 = v3;
              }
              else
              {
                char v25 = 0;
                if (v103->_download)
                {
                  id v64 = [(SUDownload *)v103->_download descriptor];
                  char v63 = 1;
                  char v25 = 0;
                  if (v64)
                  {
                    id v62 = [(SUDownload *)v103->_download descriptor];
                    char v61 = 1;
                    char v25 = [v62 isSplatOnly];
                  }
                }
                uint64_t v4 = @"RSR_CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES";
                if ((v25 & 1) == 0) {
                  uint64_t v4 = @"CELLULAR_DOWNLOAD_ACCEPT_DEFINITE_FEES";
                }
                BOOL v26 = v4;
              }
              id v5 = (id)[v28 localizedStringForKey:v26 value:&stru_26DCD7690 table:@"Software Update"];
              id v6 = v97;
              id v97 = v5;

              if (v61) {
              if (v63)
              }

              if (v65) {
              if (v67)
              }

              id v13 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v7 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", @"CONTINUE");
              id v8 = v72;
              id v72 = v7;

              id v14 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v9 = (id)[v14 localizedStringForKey:@"CANCEL" value:&stru_26DCD7690 table:@"Software Update"];
              id v10 = v71;
              id v71 = v9;

              id v15 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              id v11 = (id)[v15 localizedStringForKey:@"ALLOW_CELLULAR_DOWNLOAD" value:&stru_26DCD7690 table:@"Software Update"];
              id v12 = v98;
              id v98 = v11;

              id v60 = (id)objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v98, v97);
              id v18 = v60;
              id v17 = (void *)MEMORY[0x263F82400];
              id v16 = v72;
              uint64_t v53 = MEMORY[0x263EF8330];
              int v54 = -1073741824;
              int v55 = 0;
              uint64_t v56 = __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke;
              uint64_t v57 = &unk_264840B50;
              id v58 = v72;
              id v59 = location[0];
              id v19 = (id)[v17 actionWithTitle:v16 style:0 handler:&v53];
              objc_msgSend(v18, "addAction:");

              id v22 = v60;
              id v21 = (void *)MEMORY[0x263F82400];
              id v20 = v71;
              uint64_t v46 = MEMORY[0x263EF8330];
              int v47 = -1073741824;
              int v48 = 0;
              BOOL v49 = __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke_739;
              id v50 = &unk_264840B50;
              id v51 = v71;
              id v52 = location[0];
              id v23 = (id)[v21 actionWithTitle:v20 style:1 handler:&v46];
              objc_msgSend(v22, "addAction:");

              id WeakRetained = objc_loadWeakRetained((id *)&v103->_hostController);
              objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v60, 1);

              objc_storeStrong(&v52, 0);
              objc_storeStrong(&v51, 0);
              objc_storeStrong(&v59, 0);
              objc_storeStrong(&v58, 0);
              objc_storeStrong(&v60, 0);
              objc_storeStrong(&v71, 0);
              objc_storeStrong(&v72, 0);
              int v99 = 0;
            }
          }
          else
          {
            id v82 = _SUSUILoggingFacility();
            os_log_type_t v81 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v82, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v33 = v82;
              os_log_type_t v34 = v81;
              __os_log_helper_16_0_0(v80);
              _os_log_impl(&dword_228401000, v33, v34, "Download policy doesn't allow cellular. Not prompting for cellular download acceptance.", v80, 2u);
            }
            objc_storeStrong(&v82, 0);
            (*((void (**)(id, void))location[0] + 2))(location[0], 0);
            int v99 = 1;
          }
        }
        else
        {
          id v85 = _SUSUILoggingFacility();
          os_log_type_t v84 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_DEFAULT))
          {
            int v35 = v85;
            os_log_type_t v36 = v84;
            __os_log_helper_16_0_0(v83);
            _os_log_impl(&dword_228401000, v35, v36, "Cellular data not possible on device (2nd check). Not prompting for cellular download acceptance.", v83, 2u);
          }
          objc_storeStrong(&v85, 0);
          (*((void (**)(id, void))location[0] + 2))(location[0], 0);
          int v99 = 1;
        }
      }
    }
    objc_storeStrong(&v95, 0);
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v98, 0);
  }
  else
  {
    id v101 = _SUSUILoggingFacility();
    os_log_type_t v100 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v105, (uint64_t)"-[SUSUISoftwareUpdateManager _alertForDownloadConstraintsWithCompletion:]");
      _os_log_error_impl(&dword_228401000, (os_log_t)v101, v100, "[%s] completion is nil. Do nothing", v105, 0xCu);
    }
    objc_storeStrong(&v101, 0);
    int v99 = 1;
  }
  objc_storeStrong(location, 0);
}

void __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, *(void *)(a1 + 32));
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "User clicked %@. Allowing cellular.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

void __73__SUSUISoftwareUpdateManager__alertForDownloadConstraintsWithCompletion___block_invoke_739(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, *(void *)(a1 + 32));
    _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "User clicked %@. Declining cellular.", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

- (void)cancelOrPurgeIfNecessaryWithUpdate:(id)a3 completion:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke;
  id v10 = &unk_264840B78;
  id v11 = location[0];
  id v13 = v14;
  id v12 = v16;
  -[SUSUISoftwareUpdateClientManager download:](suClient, "download:");
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v60 = 0;
  objc_storeStrong(&v60, a3);
  v59[1] = (id)a1;
  id v31 = (id)[location[0] descriptor];
  char v32 = [v31 isEqual:*(void *)(a1 + 32)];

  if (v32)
  {
    v59[0] = _SUSUILoggingFacility();
    os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v59[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v62, *(void *)(a1 + 32));
      _os_log_impl(&dword_228401000, (os_log_t)v59[0], v58, "Currently downloading descriptor is the same as requested descriptor, do not purge (%@)", v62, 0xCu);
    }
    objc_storeStrong(v59, 0);
    if (*(void *)(a1 + 48)) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    int v57 = 1;
  }
  else
  {
    if (location[0])
    {
      if ([*(id *)(a1 + 40) clientIsBuddy])
      {
        int v7 = *(void **)(*(void *)(a1 + 40) + 56);
        uint64_t v33 = MEMORY[0x263EF8330];
        int v34 = -1073741824;
        int v35 = 0;
        os_log_type_t v36 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_4;
        BOOL v37 = &unk_2648408D8;
        id v38 = *(id *)(a1 + 48);
        [v7 purgeDownload:&v33];
        objc_storeStrong(&v38, 0);
      }
      else
      {
        id v56 = 0;
        id v19 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v55 = (id)objc_msgSend(v19, "localizedStringForKey:value:table:", @"CANCEL");

        id v20 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v54 = (id)[v20 localizedStringForKey:@"OK" value:&stru_26DCD7690 table:@"Software Update"];

        id v21 = NSString;
        id v26 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v25 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"DELETE_CONFIRMATION_TITLE"];
        id v24 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:");
        id v23 = (id)[location[0] descriptor];
        id v22 = (id)[v23 productVersion];
        id v53 = (id)objc_msgSend(v21, "stringWithFormat:", v24, v22);

        id v27 = (id)[location[0] progress];
        char v28 = [v27 isDone];

        if (v28)
        {
          id v18 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v3 = (id)[v18 localizedStringForKey:@"DELETE_CONFIRMATION_BODY_DOWNLOADED" value:&stru_26DCD7690 table:@"Software Update"];
          id v4 = v56;
          id v56 = v3;
        }
        else
        {
          id v17 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v5 = (id)[v17 localizedStringForKey:@"DELETE_CONFIRMATION_BODY_DOWNLOADING" value:&stru_26DCD7690 table:@"Software Update"];
          id v6 = v56;
          id v56 = v5;
        }
        id v52 = (id)objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v53, v56);
        id v10 = v52;
        id v9 = (void *)MEMORY[0x263F82400];
        id v8 = v55;
        uint64_t v46 = MEMORY[0x263EF8330];
        int v47 = -1073741824;
        int v48 = 0;
        BOOL v49 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_749;
        id v50 = &unk_26483CC78;
        id v51 = *(id *)(a1 + 48);
        id v11 = (id)[v9 actionWithTitle:v8 style:1 handler:&v46];
        objc_msgSend(v10, "addAction:");

        id v14 = v52;
        id v13 = (void *)MEMORY[0x263F82400];
        id v12 = v54;
        uint64_t v39 = MEMORY[0x263EF8330];
        int v40 = -1073741824;
        int v41 = 0;
        id v42 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_2;
        int v43 = &unk_264840B50;
        id v44 = *(id *)(a1 + 40);
        id v45 = *(id *)(a1 + 48);
        id v15 = (id)[v13 actionWithTitle:v12 style:0 handler:&v39];
        objc_msgSend(v14, "addAction:");

        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 112));
        objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v52, 1);

        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v51, 0);
        objc_storeStrong(&v52, 0);
        objc_storeStrong(&v53, 0);
        objc_storeStrong(&v54, 0);
        objc_storeStrong(&v55, 0);
        objc_storeStrong(&v56, 0);
      }
    }
    else if (*(void *)(a1 + 48))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    int v57 = 0;
  }
  objc_storeStrong(&v60, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_749(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (a1[4]) {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = (id)a1;
  id v3 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_3;
  id v8 = &unk_2648408D8;
  v9[0] = *(id *)(a1 + 40);
  objc_msgSend(v3, "purgeDownload:");
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_3(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(&location, 0);
}

void __76__SUSUISoftwareUpdateManager_cancelOrPurgeIfNecessaryWithUpdate_completion___block_invoke_4(uint64_t a1, char a2, id obj)
{
  uint64_t v6 = a1;
  char v5 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(&location, 0);
}

- (void)presentTermsIfNecessaryCompletion:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateManager *)v4 presentTermsIfNecessaryForUpdate:0 completion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)presentTermsIfNecessaryForUpdate:(id)a3 completion:(id)a4
{
  id obj = a4;
  char v162 = "-[SUSUISoftwareUpdateManager presentTermsIfNecessaryForUpdate:completion:]";
  uint64_t v260 = *MEMORY[0x263EF8340];
  id v256 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v254 = 0;
  objc_storeStrong(&v254, obj);
  uint64_t v247 = 0;
  char v248 = (id *)&v247;
  int v249 = 838860800;
  int v250 = 48;
  v251 = __Block_byref_object_copy__0;
  char v252 = __Block_byref_object_dispose__0;
  uint64_t v160 = objc_opt_new();
  uint64_t v253 = v160;
  id v159 = (id *)&v253;
  [v248[5] setServerFlowStyle:*((void *)v256 + 18)];
  id v158 = (id)[v256 download];
  id v246 = v158;
  if (!v246) {
    goto LABEL_42;
  }
  id v157 = _SUSUILoggingFacility();
  os_log_t oslog = (os_log_t)v157;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    *(_DWORD *)id v155 = type;
    id updated = SUSUISoftwareUpdateStateToString(*((_DWORD *)v256 + 22));
    id v151 = updated;
    id v152 = v151;
    id v243 = v152;
    int v153 = *((_DWORD *)v256 + 22);
    BOOL v4 = *((void *)v256 + 15) == 0;
    char v241 = 0;
    if (v4)
    {
      id v149 = @"N/A";
    }
    else
    {
      id v150 = (id)[*((id *)v256 + 15) humanReadableUpdateName];
      id v242 = v150;
      char v241 = 1;
      id v149 = (__CFString *)v242;
    }
    char v146 = v149;
    uint64_t v147 = *((void *)v256 + 15);
    uint64_t v148 = *((void *)v256 + 20);
    BOOL v5 = *((void *)v256 + 16) == 0;
    char v239 = 0;
    if (v5)
    {
      char v144 = @"N/A";
    }
    else
    {
      id v145 = (id)[*((id *)v256 + 16) humanReadableUpdateName];
      id v240 = v145;
      char v239 = 1;
      char v144 = (__CFString *)v240;
    }
    id v140 = v144;
    uint64_t v141 = *((void *)v256 + 16);
    uint64_t v142 = *((void *)v256 + 21);
    uint64_t v143 = *((void *)v256 + 1);
    BOOL v6 = *((void *)v256 + 1) == 0;
    char v237 = 0;
    char v235 = 0;
    char v233 = 0;
    if (v6
      || (id v139 = (id)[*((id *)v256 + 1) descriptor],
          id v238 = v139,
          char v237 = 1,
          !v238))
    {
      id v136 = @"N/A";
    }
    else
    {
      id v138 = (id)[*((id *)v256 + 1) descriptor];
      id v236 = v138;
      char v235 = 1;
      id v137 = (id)[v236 humanReadableUpdateName];
      id v234 = v137;
      char v233 = 1;
      id v136 = (__CFString *)v234;
    }
    char v134 = v136;
    id WeakRetained = objc_loadWeakRetained((id *)v256 + 13);
    id v133 = objc_loadWeakRetained((id *)v256 + 13);
    char v231 = 0;
    char v229 = 0;
    if (v133)
    {
      id v132 = objc_loadWeakRetained((id *)v256 + 13);
      id v232 = v132;
      char v231 = 1;
      Class aClass = (Class)objc_opt_class();
      id v130 = NSStringFromClass(aClass);
      id v230 = v130;
      char v229 = 1;
      id v129 = (__CFString *)v230;
    }
    else
    {
      id v129 = @"N/A";
    }
    id v127 = v129;
    id v128 = objc_loadWeakRetained((id *)v256 + 14);
    id v126 = objc_loadWeakRetained((id *)v256 + 14);
    char v227 = 0;
    char v225 = 0;
    if (v126)
    {
      id v125 = objc_loadWeakRetained((id *)v256 + 14);
      id v228 = v125;
      char v227 = 1;
      Class v124 = (Class)objc_opt_class();
      id v123 = NSStringFromClass(v124);
      id v226 = v123;
      char v225 = 1;
      id v122 = (__CFString *)v226;
    }
    else
    {
      id v122 = @"N/A";
    }
    id v120 = v122;
    id v121 = (id)[v246 downloadOptions];
    id v118 = v121;
    int v119 = [v118 termsAndConditionsAgreementStatus];
    id v116 = &v13;
    buf = v259;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v259, (uint64_t)v162, (uint64_t)v152, v153, (uint64_t)v146, v147, v148, (uint64_t)v140, v141, v142, v143, (uint64_t)v134, (uint64_t)WeakRetained, (uint64_t)v127, (uint64_t)v128, (uint64_t)v122, v119);
    _os_log_impl(&dword_228401000, log, v155[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nSU Terms: Agreement status %i", buf, 0x9Au);

    if (v225) {
    if (v227)
    }

    if (v229) {
    if (v231)
    }

    if (v233) {
    if (v235)
    }

    if (v237) {
    if (v239)
    }

    if (v241) {
    objc_storeStrong(&v243, 0);
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  id v115 = (id)[v246 downloadOptions];
  id v113 = v115;
  int v114 = [v113 termsAndConditionsAgreementStatus];
  BOOL v112 = v114 != 1;

  if (v112)
  {
LABEL_42:
    BOOL v217 = 0;
    if (location[0])
    {
      int v107 = [location[0] isSplatOnly];
      int v106 = v107 & 1;
    }
    else
    {
      int v105 = [*((id *)v256 + 15) isSplatOnly];
      int v106 = v105 & 1;
    }
    BOOL v217 = v106 != 0;
    if (v106)
    {
      id v104 = _SUSUILoggingFacility();
      os_log_t v216 = (os_log_t)v104;
      os_log_type_t v215 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v216, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v101 = v216;
        *(_DWORD *)char v102 = v215;
        id v103 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v256 + 22));
        id v98 = v103;
        id v99 = v98;
        id v214 = v99;
        int v100 = *((_DWORD *)v256 + 22);
        BOOL v7 = *((void *)v256 + 15) == 0;
        char v212 = 0;
        if (v7)
        {
          id v96 = @"N/A";
        }
        else
        {
          id v97 = (id)[*((id *)v256 + 15) humanReadableUpdateName];
          id v213 = v97;
          char v212 = 1;
          id v96 = (__CFString *)v213;
        }
        id v93 = v96;
        uint64_t v94 = *((void *)v256 + 15);
        uint64_t v95 = *((void *)v256 + 20);
        BOOL v8 = *((void *)v256 + 16) == 0;
        char v210 = 0;
        if (v8)
        {
          id v91 = @"N/A";
        }
        else
        {
          id v92 = (id)[*((id *)v256 + 16) humanReadableUpdateName];
          id v211 = v92;
          char v210 = 1;
          id v91 = (__CFString *)v211;
        }
        id v87 = v91;
        uint64_t v88 = *((void *)v256 + 16);
        uint64_t v89 = *((void *)v256 + 21);
        uint64_t v90 = *((void *)v256 + 1);
        BOOL v9 = *((void *)v256 + 1) == 0;
        char v208 = 0;
        char v206 = 0;
        char v204 = 0;
        if (v9
          || (id v86 = (id)[*((id *)v256 + 1) descriptor],
              id v209 = v86,
              char v208 = 1,
              !v209))
        {
          int v83 = @"N/A";
        }
        else
        {
          id v85 = (id)[*((id *)v256 + 1) descriptor];
          id v207 = v85;
          char v206 = 1;
          id v84 = (id)[v207 humanReadableUpdateName];
          id v205 = v84;
          char v204 = 1;
          int v83 = (__CFString *)v205;
        }
        os_log_type_t v81 = v83;
        id v82 = objc_loadWeakRetained((id *)v256 + 13);
        id v80 = objc_loadWeakRetained((id *)v256 + 13);
        char v202 = 0;
        char v200 = 0;
        if (v80)
        {
          id v79 = objc_loadWeakRetained((id *)v256 + 13);
          id v203 = v79;
          char v202 = 1;
          Class v78 = (Class)objc_opt_class();
          id v77 = NSStringFromClass(v78);
          id v201 = v77;
          char v200 = 1;
          int v76 = (__CFString *)v201;
        }
        else
        {
          int v76 = @"N/A";
        }
        uint64_t v74 = v76;
        id v75 = objc_loadWeakRetained((id *)v256 + 14);
        id v73 = objc_loadWeakRetained((id *)v256 + 14);
        char v198 = 0;
        char v196 = 0;
        if (v73)
        {
          id v72 = objc_loadWeakRetained((id *)v256 + 14);
          id v199 = v72;
          char v198 = 1;
          Class v71 = (Class)objc_opt_class();
          id v70 = NSStringFromClass(v71);
          id v197 = v70;
          char v196 = 1;
          os_log_type_t v69 = (__CFString *)v197;
        }
        else
        {
          os_log_type_t v69 = @"N/A";
        }
        char v67 = &v13;
        id v68 = v258;
        __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v258, (uint64_t)v162, (uint64_t)v99, v100, (uint64_t)v93, v94, v95, (uint64_t)v87, v88, v89, v90, (uint64_t)v81, (uint64_t)v82, (uint64_t)v74, (uint64_t)v75, (uint64_t)v69);
        _os_log_impl(&dword_228401000, v101, v102[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nRapid Security Response - Skipping SU Terms presentation", v68, 0x94u);
        if (v196) {

        }
        if (v198) {
        if (v200)
        }

        if (v202) {
        if (v204)
        }

        if (v206) {
        if (v208)
        }

        if (v210) {
        if (v212)
        }

        objc_storeStrong(&v214, 0);
      }
      objc_storeStrong((id *)&v216, 0);
      if (v254)
      {
        id v66 = MEMORY[0x263EF83A0];
        dispatch_queue_t v65 = (dispatch_queue_t)v66;
        dispatch_block_t v64 = &v190;
        uint64_t v190 = MEMORY[0x263EF8330];
        int v191 = -1073741824;
        int v192 = 0;
        v193 = __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_751;
        char v194 = &unk_26483BAE0;
        uint64_t v63 = &v195;
        id v195 = v254;
        dispatch_async(v65, v64);

        objc_storeStrong(v63, 0);
      }
      int v218 = 1;
    }
    else
    {
      int v62 = [v256 bypassTermsAndConditions];
      if (v62)
      {
        id v61 = _SUSUILoggingFacility();
        os_log_t v189 = (os_log_t)v61;
        os_log_type_t v188 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v58 = v189;
          *(_DWORD *)id v59 = v188;
          id v60 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v256 + 22));
          id v55 = v60;
          id v56 = v55;
          id v187 = v56;
          int v57 = *((_DWORD *)v256 + 22);
          BOOL v10 = *((void *)v256 + 15) == 0;
          char v185 = 0;
          if (v10)
          {
            id v53 = @"N/A";
          }
          else
          {
            id v54 = (id)[*((id *)v256 + 15) humanReadableUpdateName];
            id v186 = v54;
            char v185 = 1;
            id v53 = (__CFString *)v186;
          }
          id v50 = v53;
          uint64_t v51 = *((void *)v256 + 15);
          uint64_t v52 = *((void *)v256 + 20);
          BOOL v11 = *((void *)v256 + 16) == 0;
          char v183 = 0;
          if (v11)
          {
            int v48 = @"N/A";
          }
          else
          {
            id v49 = (id)[*((id *)v256 + 16) humanReadableUpdateName];
            id v184 = v49;
            char v183 = 1;
            int v48 = (__CFString *)v184;
          }
          id v44 = v48;
          uint64_t v45 = *((void *)v256 + 16);
          uint64_t v46 = *((void *)v256 + 21);
          uint64_t v47 = *((void *)v256 + 1);
          BOOL v12 = *((void *)v256 + 1) == 0;
          char v181 = 0;
          char v179 = 0;
          char v177 = 0;
          if (v12
            || (id v43 = (id)[*((id *)v256 + 1) descriptor],
                id v182 = v43,
                char v181 = 1,
                !v182))
          {
            int v40 = @"N/A";
          }
          else
          {
            id v42 = (id)[*((id *)v256 + 1) descriptor];
            id v180 = v42;
            char v179 = 1;
            id v41 = (id)[v180 humanReadableUpdateName];
            id v178 = v41;
            char v177 = 1;
            int v40 = (__CFString *)v178;
          }
          id v38 = v40;
          id v39 = objc_loadWeakRetained((id *)v256 + 13);
          id v37 = objc_loadWeakRetained((id *)v256 + 13);
          char v175 = 0;
          char v173 = 0;
          if (v37)
          {
            id v36 = objc_loadWeakRetained((id *)v256 + 13);
            id v176 = v36;
            char v175 = 1;
            Class v35 = (Class)objc_opt_class();
            id v34 = NSStringFromClass(v35);
            id v174 = v34;
            char v173 = 1;
            uint64_t v33 = (__CFString *)v174;
          }
          else
          {
            uint64_t v33 = @"N/A";
          }
          id v31 = v33;
          id v32 = objc_loadWeakRetained((id *)v256 + 14);
          id v30 = objc_loadWeakRetained((id *)v256 + 14);
          char v171 = 0;
          char v169 = 0;
          if (v30)
          {
            id v29 = objc_loadWeakRetained((id *)v256 + 14);
            id v172 = v29;
            char v171 = 1;
            Class v28 = (Class)objc_opt_class();
            id v27 = NSStringFromClass(v28);
            id v170 = v27;
            char v169 = 1;
            id v26 = (__CFString *)v170;
          }
          else
          {
            id v26 = @"N/A";
          }
          id v24 = &v13;
          id v25 = v257;
          __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v257, (uint64_t)v162, (uint64_t)v56, v57, (uint64_t)v50, v51, v52, (uint64_t)v44, v45, v46, v47, (uint64_t)v38, (uint64_t)v39, (uint64_t)v31, (uint64_t)v32, (uint64_t)v26);
          _os_log_impl(&dword_228401000, v58, v59[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nBypassing TOS because bypassTermsAndConditions=YES", v25, 0x94u);
          if (v169) {

          }
          if (v171) {
          if (v173)
          }

          if (v175) {
          if (v177)
          }

          if (v179) {
          if (v181)
          }

          if (v183) {
          if (v185)
          }

          objc_storeStrong(&v187, 0);
        }
        objc_storeStrong((id *)&v189, 0);
        if (v254) {
          (*((void (**)(id, uint64_t, void))v254 + 2))(v254, 1, 0);
        }
        objc_storeStrong(v248 + 5, 0);
        int v218 = 1;
      }
      else
      {
        id v22 = v248[5];
        id v23 = location[0];
        if (location[0]) {
          id v21 = v23;
        }
        else {
          id v21 = (id)*((void *)v256 + 15);
        }
        id v19 = v21;
        id v20 = objc_loadWeakRetained((id *)v256 + 14);
        id v18 = &v163;
        uint64_t v163 = MEMORY[0x263EF8330];
        int v164 = -1073741824;
        int v17 = 0;
        int v165 = 0;
        char v166 = __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_752;
        unsigned __int8 v167 = &unk_264840BA0;
        id v14 = (id *)v168;
        v168[0] = v256;
        id v15 = (id *)(v18 + 5);
        v168[1] = location[0];
        id v16 = (id *)(v18 + 6);
        v168[2] = v254;
        v168[3] = &v247;
        [v22 presentTermsIfNecessaryForUpdate:v19 overController:v20 showLoadSpinner:v17 & 1 completion:v18];

        objc_storeStrong(v16, 0);
        objc_storeStrong(v15, 0);
        objc_storeStrong(v14, 0);
        int v218 = 0;
      }
    }
  }
  else
  {
    if (v254)
    {
      id v111 = MEMORY[0x263EF83A0];
      dispatch_queue_t queue = (dispatch_queue_t)v111;
      dispatch_block_t block = &v219;
      uint64_t v219 = MEMORY[0x263EF8330];
      int v220 = -1073741824;
      int v221 = 0;
      char v222 = __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke;
      id v223 = &unk_26483BAE0;
      char v108 = &v224;
      id v224 = v254;
      dispatch_async(queue, block);

      objc_storeStrong(v108, 0);
    }
    int v218 = 1;
  }
  objc_storeStrong(&v246, 0);
  _Block_object_dispose(&v247, 8);
  objc_storeStrong(v159, 0);
  objc_storeStrong(&v254, 0);
  objc_storeStrong(location, 0);
}

uint64_t __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
}

uint64_t __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_751(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
}

void __74__SUSUISoftwareUpdateManager_presentTermsIfNecessaryForUpdate_completion___block_invoke_752(NSObject *a1, char a2, id obj)
{
  uint64_t v47 = &v65;
  uint64_t v46 = a1;
  uint64_t v45 = "-[SUSUISoftwareUpdateManager presentTermsIfNecessaryForUpdate:completion:]_block_invoke";
  uint64_t v73 = *MEMORY[0x263EF8340];
  Class v71 = a1;
  char v70 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v68[1] = v46;
  v68[0] = (os_log_t)_SUSUILoggingFacility();
  unsigned __int8 v67 = 0;
  if (os_log_type_enabled(v68[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v47 + 3);
    *(_DWORD *)os_log_type_t type = v67;
    id v42 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v46[4].isa + 22));
    id v3 = v42;
    BOOL v4 = v46;
    uint64_t v43 = (uint64_t)v3;
    *((void *)v47 + 1) = v3;
    int v44 = *((_DWORD *)v4[4].isa + 22);
    LOBYTE(v4) = *((void *)v4[4].isa + 15) == 0;
    char v64 = 0;
    if (v4)
    {
      id v39 = @"N/A";
    }
    else
    {
      BOOL v5 = (__CFString *)(id)[*((id *)v46[4].isa + 15) humanReadableUpdateName];
      *(void *)uint64_t v47 = v5;
      char v64 = 1;
      id v39 = v5;
    }
    id v36 = v39;
    uint64_t v37 = *((void *)v46[4].isa + 15);
    uint64_t v38 = *((void *)v46[4].isa + 20);
    BOOL v6 = *((void *)v46[4].isa + 16) == 0;
    char v62 = 0;
    if (v6)
    {
      Class v35 = @"N/A";
    }
    else
    {
      id v63 = (id)[*((id *)v46[4].isa + 16) humanReadableUpdateName];
      char v62 = 1;
      Class v35 = (__CFString *)v63;
    }
    id v31 = v35;
    uint64_t v32 = *((void *)v46[4].isa + 16);
    uint64_t v33 = *((void *)v46[4].isa + 21);
    uint64_t v34 = *((void *)v46[4].isa + 1);
    BOOL v7 = *((void *)v46[4].isa + 1) == 0;
    char v60 = 0;
    char v58 = 0;
    char v56 = 0;
    if (v7
      || (id v61 = (id)[*((id *)v46[4].isa + 1) descriptor],
          char v60 = 1,
          !v61))
    {
      id v30 = @"N/A";
    }
    else
    {
      id v59 = (id)[*((id *)v46[4].isa + 1) descriptor];
      int v29 = 1;
      char v58 = 1;
      id v57 = (id)[v59 humanReadableUpdateName];
      char v56 = 1;
      id v30 = (__CFString *)v57;
    }
    id v26 = v30;
    id WeakRetained = objc_loadWeakRetained((id *)v46[4].isa + 13);
    id v28 = objc_loadWeakRetained((id *)v46[4].isa + 13);
    char v54 = 0;
    char v52 = 0;
    if (v28)
    {
      id v55 = objc_loadWeakRetained((id *)v46[4].isa + 13);
      int v24 = 1;
      char v54 = 1;
      BOOL v8 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v8);
      char v52 = 1;
      id v25 = (__CFString *)v53;
    }
    else
    {
      id v25 = @"N/A";
    }
    id v21 = v25;
    id v22 = objc_loadWeakRetained((id *)v46[4].isa + 14);
    id v23 = objc_loadWeakRetained((id *)v46[4].isa + 14);
    char v50 = 0;
    char v48 = 0;
    if (v23)
    {
      id v51 = objc_loadWeakRetained((id *)v46[4].isa + 14);
      int v19 = 1;
      char v50 = 1;
      BOOL v9 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v9);
      char v48 = 1;
      id v20 = (__CFString *)v49;
    }
    else
    {
      id v20 = @"N/A";
    }
    int v17 = v20;
    uint64_t isa = (uint64_t)v46[5].isa;
    if (isa) {
      uint64_t v16 = isa;
    }
    else {
      uint64_t v16 = *((void *)v46[4].isa + 15);
    }
    uint64_t v10 = *((void *)v47 + 5);
    id v14 = &v12;
    buf = v72;
    __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_4_0_8_64((uint64_t)v72, (uint64_t)v45, v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v17, v16, v70 & 1, v10);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nAccepted TOS for update %p: %d, error: %@", buf, 0xAEu);
    if (v48) {

    }
    if (v50) {
    if (v52)
    }

    if (v54) {
    if (v56)
    }

    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong((id *)v68, 0);
  if (v46[6].isa) {
    (*((void (**)(void))v46[6].isa + 2))();
  }
  BOOL v11 = (id *)(*((void *)v46[7].isa + 1) + 40);
  id obja = 0;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, obja);
}

- (void)scanForUpdateCompletion:(id)a3
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = __54__SUSUISoftwareUpdateManager_scanForUpdateCompletion___block_invoke;
  BOOL v8 = &unk_264840BC8;
  id v9 = location[0];
  -[SUSUISoftwareUpdateManager scanForUpdatesCompletion:](v3, "scanForUpdatesCompletion:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__SUSUISoftwareUpdateManager_scanForUpdateCompletion___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  if (a1[4])
  {
    id v3 = (void (**)(void))(a1[4] + 16);
    id v4 = (id)[location[0] latestUpdate];
    (*v3)();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)scanForUpdatesCompletion:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_userInitiatedRescan = 0;
  [(SUSUISoftwareUpdateManager *)v4 scanForUpdatesWithOptions:0 andCompletion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)rescanForUpdatesInBackgroundWithOptions:(id)a3 andCompletionHandler:(id)a4
{
  char v48 = &v66;
  id obj = a4;
  uint64_t v46 = "-[SUSUISoftwareUpdateManager rescanForUpdatesInBackgroundWithOptions:andCompletionHandler:]";
  uint64_t v73 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v70 = 0;
  objc_storeStrong(&v70, obj);
  id v69 = _SUSUILoggingFacility();
  unsigned __int8 v68 = 0;
  if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v48 + 3);
    *(_DWORD *)os_log_type_t type = v68;
    id v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v48 + 7) + 88));
    id v4 = v43;
    int v5 = v48;
    uint64_t v44 = (uint64_t)v4;
    *((void *)v48 + 1) = v4;
    int v45 = *(_DWORD *)(*((void *)v5 + 7) + 88);
    LOBYTE(v5) = *(void *)(*((void *)v5 + 7) + 120) == 0;
    char v65 = 0;
    if (v5)
    {
      int v40 = @"N/A";
    }
    else
    {
      int v6 = (__CFString *)(id)[*(id *)(*((void *)v48 + 7) + 120) humanReadableUpdateName];
      *(void *)char v48 = v6;
      char v65 = 1;
      int v40 = v6;
    }
    uint64_t v37 = v40;
    uint64_t v38 = *(void *)(*((void *)v48 + 7) + 120);
    uint64_t v39 = *(void *)(*((void *)v48 + 7) + 160);
    BOOL v7 = *(void *)(*((void *)v48 + 7) + 128) == 0;
    char v63 = 0;
    if (v7)
    {
      id v36 = @"N/A";
    }
    else
    {
      char v64 = (__CFString *)(id)[*(id *)(*((void *)v48 + 7) + 128) humanReadableUpdateName];
      char v63 = 1;
      id v36 = v64;
    }
    uint64_t v32 = v36;
    uint64_t v33 = *(void *)(*((void *)v48 + 7) + 128);
    uint64_t v34 = *(void *)(*((void *)v48 + 7) + 168);
    uint64_t v35 = *(void *)(*((void *)v48 + 7) + 8);
    BOOL v8 = *(void *)(*((void *)v48 + 7) + 8) == 0;
    char v61 = 0;
    char v59 = 0;
    char v57 = 0;
    if (v8
      || (id v62 = (id)[*(id *)(*((void *)v48 + 7) + 8) descriptor],
          char v61 = 1,
          !v62))
    {
      id v31 = @"N/A";
    }
    else
    {
      id v60 = (id)[*(id *)(*((void *)v48 + 7) + 8) descriptor];
      int v30 = 1;
      char v59 = 1;
      id v58 = (id)[v60 humanReadableUpdateName];
      char v57 = 1;
      id v31 = (__CFString *)v58;
    }
    id v27 = v31;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v48 + 7) + 104));
    id v29 = objc_loadWeakRetained((id *)(*((void *)v48 + 7) + 104));
    char v55 = 0;
    char v53 = 0;
    if (v29)
    {
      id v56 = objc_loadWeakRetained((id *)(*((void *)v48 + 7) + 104));
      int v25 = 1;
      char v55 = 1;
      id v9 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v9);
      char v53 = 1;
      id v26 = (__CFString *)v54;
    }
    else
    {
      id v26 = @"N/A";
    }
    id v22 = v26;
    id v23 = objc_loadWeakRetained((id *)(*((void *)v48 + 7) + 112));
    id v24 = objc_loadWeakRetained((id *)(*((void *)v48 + 7) + 112));
    char v51 = 0;
    char v49 = 0;
    if (v24)
    {
      id v52 = objc_loadWeakRetained((id *)(*((void *)v48 + 7) + 112));
      int v20 = 1;
      char v51 = 1;
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v50 = NSStringFromClass(v10);
      char v49 = 1;
      id v21 = (__CFString *)v50;
    }
    else
    {
      id v21 = @"N/A";
    }
    id v18 = &v14;
    buf = v72;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v72, (uint64_t)v46, v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
    if (v49) {

    }
    if (v51) {
    if (v53)
    }

    if (v55) {
    if (v57)
    }

    if (v59) {
    if (v61)
    }

    if (v63) {
    if (v65)
    }

    objc_storeStrong(&v67, 0);
  }
  id v17 = 0;
  objc_storeStrong(&v69, 0);
  BOOL v11 = v48;
  *(unsigned char *)(*((void *)v48 + 7) + 18) = 1;
  uint64_t v12 = (void *)*((void *)v11 + 7);
  uint64_t v16 = location;
  uint64_t v13 = *((void *)v11 + 5);
  id v15 = &v70;
  [v12 scanForUpdatesWithOptions:v13 andCompletion:*((void *)v11 + 4)];
  objc_storeStrong(v15, v17);
  objc_storeStrong(v16, v17);
}

- (void)scanForUpdatesWithOptions:(id)a3 andCompletion:(id)a4
{
  id obj = a4;
  id v60 = "-[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:]";
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v95 = 0;
  objc_storeStrong(&v95, obj);
  id v58 = _SUSUILoggingFacility();
  id v94 = v58;
  unsigned __int8 v93 = 0;
  if (os_log_type_enabled((os_log_t)v94, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v94;
    *(_DWORD *)os_log_type_t type = v93;
    id updated = SUSUISoftwareUpdateStateToString(v97->_state);
    id v52 = updated;
    id v53 = v52;
    id v92 = v53;
    int state = v97->_state;
    BOOL v4 = v97->_preferredUpdate == 0;
    char v90 = 0;
    if (v4)
    {
      id v50 = @"N/A";
    }
    else
    {
      id v51 = (id)[(SUDescriptor *)v97->_preferredUpdate humanReadableUpdateName];
      id v91 = (__CFString *)v51;
      char v90 = 1;
      id v50 = v91;
    }
    uint64_t v47 = v50;
    preferredUpdate = v97->_preferredUpdate;
    preferredUpdateError = v97->_preferredUpdateError;
    BOOL v5 = v97->_alternateUpdate == 0;
    char v88 = 0;
    if (v5)
    {
      int v45 = @"N/A";
    }
    else
    {
      id v46 = (id)[(SUDescriptor *)v97->_alternateUpdate humanReadableUpdateName];
      id v89 = v46;
      char v88 = 1;
      int v45 = (__CFString *)v89;
    }
    id v41 = v45;
    alternateUpdate = v97->_alternateUpdate;
    alternateUpdateError = v97->_alternateUpdateError;
    uint64_t download = v97->_download;
    BOOL v6 = v97->_download == 0;
    char v86 = 0;
    char v84 = 0;
    char v82 = 0;
    if (v6
      || (id v40 = [(SUDownload *)v97->_download descriptor],
          id v87 = v40,
          char v86 = 1,
          !v87))
    {
      uint64_t v37 = @"N/A";
    }
    else
    {
      id v39 = [(SUDownload *)v97->_download descriptor];
      id v85 = v39;
      char v84 = 1;
      id v38 = (id)[v85 humanReadableUpdateName];
      id v83 = v38;
      char v82 = 1;
      uint64_t v37 = (__CFString *)v83;
    }
    uint64_t v35 = v37;
    id WeakRetained = objc_loadWeakRetained((id *)&v97->_delegate);
    id v34 = objc_loadWeakRetained((id *)&v97->_delegate);
    char v80 = 0;
    char v78 = 0;
    if (v34)
    {
      id v33 = objc_loadWeakRetained((id *)&v97->_delegate);
      id v81 = v33;
      char v80 = 1;
      Class aClass = (Class)objc_opt_class();
      id v31 = NSStringFromClass(aClass);
      id v79 = v31;
      char v78 = 1;
      int v30 = (__CFString *)v79;
    }
    else
    {
      int v30 = @"N/A";
    }
    id v28 = v30;
    id v29 = objc_loadWeakRetained((id *)&v97->_hostController);
    id v27 = objc_loadWeakRetained((id *)&v97->_hostController);
    char v76 = 0;
    char v74 = 0;
    if (v27)
    {
      id v26 = objc_loadWeakRetained((id *)&v97->_hostController);
      id v77 = v26;
      char v76 = 1;
      Class v25 = (Class)objc_opt_class();
      id v24 = NSStringFromClass(v25);
      id v75 = v24;
      char v74 = 1;
      id v23 = (__CFString *)v75;
    }
    else
    {
      id v23 = @"N/A";
    }
    int userInitiatedRescan = v97->_userInitiatedRescan;
    id v21 = &v9;
    buf = v98;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v98, (uint64_t)v60, (uint64_t)v53, state, (uint64_t)v47, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v41, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v35, (uint64_t)WeakRetained, (uint64_t)v28, (uint64_t)v29, (uint64_t)v23, userInitiatedRescan);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nis user-initiated rescan: %d", buf, 0x9Au);
    if (v74) {

    }
    if (v76) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    if (v84) {
    if (v86)
    }

    if (v88) {
    if (v90)
    }

    objc_storeStrong(&v92, 0);
  }
  objc_storeStrong(&v94, 0);
  id v20 = v97;
  objc_sync_enter(v20);
  if (!v97->_userInitiatedRescan && v97->_state != 1) {
    [(SUSUISoftwareUpdateManager *)v97 setState:1];
  }
  if (v97->_manuallyStartedScan)
  {
    v97->_int userInitiatedRescan = 0;
    int v73 = 1;
  }
  else
  {
    v97->_manuallyStartedScan = 1;
    if (!location[0])
    {
      Class SUScanOptionsClass = (Class)getSUScanOptionsClass();
      id v18 = objc_alloc_init(SUScanOptionsClass);
      id v8 = location[0];
      location[0] = v18;

      [location[0] setForced:1];
      [location[0] setIdentifier:@"com.apple.Preferences.software_update"];
    }
    int v73 = 0;
  }
  objc_sync_exit(v20);

  if (!v73)
  {
    [(SUSUISoftwareUpdateManager *)v97 scanForBetaPrograms];
    suClient = v97->_suClient;
    uint64_t v16 = &v67;
    uint64_t v67 = MEMORY[0x263EF8330];
    int v68 = -1073741824;
    int v69 = 0;
    id v70 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke;
    Class v71 = &unk_264840BF0;
    id v15 = (id *)&v72;
    id v72 = v97;
    [(SUSUISoftwareUpdateClientManager *)suClient getDDMDeclaration:v16];
    uint64_t v14 = v97->_suClient;
    uint64_t v13 = &v61;
    uint64_t v61 = MEMORY[0x263EF8330];
    int v62 = -1073741824;
    int v63 = 0;
    char v64 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_754;
    char v65 = &unk_264840C40;
    uint64_t v10 = (id *)v66;
    v66[0] = v97;
    BOOL v11 = (id *)(v13 + 5);
    v66[1] = location[0];
    uint64_t v12 = (id *)(v13 + 6);
    v66[2] = v95;
    [(SUSUISoftwareUpdateClientManager *)v14 softwareUpdatePathRestriction:v13];
    objc_storeStrong(v12, 0);
    objc_storeStrong(v11, 0);
    objc_storeStrong(v10, 0);
    objc_storeStrong(v15, 0);
    int v73 = 0;
  }
  objc_storeStrong(&v95, 0);
  objc_storeStrong(location, 0);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke(NSObject *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  if (v6)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v6);
      _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "Failed to get a ddm declaration: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    [(objc_class *)a1[4].isa setDdmDeclaration:location[0]];
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_754(id *a1, void *a2, id obj)
{
  id v15 = a1;
  uint64_t v14 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  v12[2] = a1;
  BOOL v4 = (void *)*((void *)a1[4] + 7);
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_2;
  uint64_t v9 = &unk_2648409C8;
  id v10 = a1[4];
  v12[1] = v14;
  id v11 = a1[5];
  v12[0] = a1[6];
  objc_msgSend(v4, "isDelayingUpdates:");
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_2(uint64_t a1, char a2, id obj)
{
  uint64_t v47 = a1;
  id v46 = "-[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:]_block_invoke_2";
  uint64_t v79 = *MEMORY[0x263EF8340];
  uint64_t v77 = a1;
  char v76 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v74[1] = (id)v47;
  v74[0] = _SUSUILoggingFacility();
  unsigned __int8 v73 = 0;
  if (os_log_type_enabled((os_log_t)v74[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v74[0];
    *(_DWORD *)os_log_type_t type = v73;
    id v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*(void *)(v47 + 32) + 88));
    id v44 = v43;
    id v72 = v44;
    int v45 = *(_DWORD *)(*(void *)(v47 + 32) + 88);
    BOOL v3 = *(void *)(*(void *)(v47 + 32) + 120) == 0;
    char v70 = 0;
    if (v3)
    {
      id v40 = @"N/A";
    }
    else
    {
      id v71 = (id)[*(id *)(*(void *)(v47 + 32) + 120) humanReadableUpdateName];
      char v70 = 1;
      id v40 = (__CFString *)v71;
    }
    uint64_t v37 = v40;
    uint64_t v38 = *(void *)(*(void *)(v47 + 32) + 120);
    uint64_t v39 = *(void *)(*(void *)(v47 + 32) + 160);
    BOOL v4 = *(void *)(*(void *)(v47 + 32) + 128) == 0;
    char v68 = 0;
    if (v4)
    {
      id v36 = @"N/A";
    }
    else
    {
      id v69 = (id)[*(id *)(*(void *)(v47 + 32) + 128) humanReadableUpdateName];
      char v68 = 1;
      id v36 = (__CFString *)v69;
    }
    uint64_t v32 = v36;
    uint64_t v33 = *(void *)(*(void *)(v47 + 32) + 128);
    uint64_t v34 = *(void *)(*(void *)(v47 + 32) + 168);
    uint64_t v35 = *(void *)(*(void *)(v47 + 32) + 8);
    BOOL v5 = *(void *)(*(void *)(v47 + 32) + 8) == 0;
    char v66 = 0;
    char v64 = 0;
    char v62 = 0;
    if (v5
      || (id v67 = (id)[*(id *)(*(void *)(v47 + 32) + 8) descriptor],
          char v66 = 1,
          !v67))
    {
      id v31 = @"N/A";
    }
    else
    {
      id v65 = (id)[*(id *)(*(void *)(v47 + 32) + 8) descriptor];
      int v30 = 1;
      char v64 = 1;
      id v63 = (id)[v65 humanReadableUpdateName];
      char v62 = 1;
      id v31 = (__CFString *)v63;
    }
    id v27 = v31;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 104));
    id v29 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 104));
    char v60 = 0;
    char v58 = 0;
    if (v29)
    {
      id v61 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 104));
      int v25 = 1;
      char v60 = 1;
      int v6 = (objc_class *)objc_opt_class();
      id v59 = NSStringFromClass(v6);
      char v58 = 1;
      id v26 = (__CFString *)v59;
    }
    else
    {
      id v26 = @"N/A";
    }
    id v22 = v26;
    id v23 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 112));
    id v24 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 112));
    char v56 = 0;
    char v54 = 0;
    if (v24)
    {
      id v57 = objc_loadWeakRetained((id *)(*(void *)(v47 + 32) + 112));
      int v20 = 1;
      char v56 = 1;
      int v7 = (objc_class *)objc_opt_class();
      id v55 = NSStringFromClass(v7);
      char v54 = 1;
      id v21 = (__CFString *)v55;
    }
    else
    {
      id v21 = @"N/A";
    }
    uint64_t v8 = *(void *)(v47 + 56);
    id v18 = &v10;
    buf = v78;
    __os_log_helper_16_2_18_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_0_8_64((uint64_t)v78, (uint64_t)v46, (uint64_t)v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v76 & 1, v8, (uint64_t)location);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisDelaying: %d; pathRestriction: %lu, error: %@",
      buf,
      0xAEu);
    if (v54) {

    }
    if (v56) {
    if (v58)
    }

    if (v60) {
    if (v62)
    }

    if (v64) {
    if (v66)
    }

    if (v68) {
    if (v70)
    }

    objc_storeStrong(&v72, 0);
  }
  id obja = 0;
  objc_storeStrong(v74, 0);
  [*(id *)(v47 + 32) setIsDelayingUpdates:v76 & 1];
  [*(id *)(v47 + 32) setSuPathsRestricted:*(void *)(v47 + 56) != 0];
  uint64_t v9 = v47;
  *(unsigned char *)(*(void *)(v47 + 32) + 17) = 1;
  id v13 = *(id *)(*(void *)(v9 + 32) + 56);
  uint64_t v11 = *(void *)(v9 + 40);
  uint64_t v12 = &v48;
  uint64_t v48 = MEMORY[0x263EF8330];
  int v49 = -1073741824;
  int v50 = 0;
  id v51 = __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_755;
  id v52 = &unk_264840C18;
  uint64_t v16 = (id *)v53;
  v53[0] = *(id *)(v9 + 32);
  id v15 = (id *)(v12 + 5);
  v53[1] = *(id *)(v47 + 40);
  uint64_t v14 = (id *)(v12 + 6);
  v53[2] = *(id *)(v47 + 48);
  [v13 scanforUpdatesWithOptions:v11 completion:v12];
  objc_storeStrong(v14, obja);
  objc_storeStrong(v15, obja);
  objc_storeStrong(v16, obja);
  objc_storeStrong(&location, obja);
}

void __70__SUSUISoftwareUpdateManager_scanForUpdatesWithOptions_andCompletion___block_invoke_755(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12 = 0;
  objc_storeStrong(&v12, a3);
  v11[1] = (id)a1;
  v11[0] = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_4_0((uint64_t)v14, (uint64_t)"-[SUSUISoftwareUpdateManager scanForUpdatesWithOptions:andCompletion:]_block_invoke", *(unsigned char *)(*(void *)(a1 + 32) + 51) & 1, *(unsigned char *)(*(void *)(a1 + 32) + 18) & 1);
    _os_log_impl(&dword_228401000, (os_log_t)v11[0], OS_LOG_TYPE_DEFAULT, "%s: _runningInitialScan: %d, _userInitiatedRescan: %d", v14, 0x18u);
  }
  objc_storeStrong(v11, 0);
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(unsigned char *)(*(void *)(a1 + 32) + 51) = 0;
  objc_sync_exit(v5);

  char v9 = 0;
  char v6 = 0;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 18))
  {
    id v10 = (id)[*(id *)(a1 + 32) delegate];
    char v9 = 1;
    char v6 = objc_opt_respondsToSelector();
  }
  if (v9) {

  }
  if (v6)
  {
    id v4 = (id)[*(id *)(a1 + 32) delegate];
    [v4 managerDidFinishRescan:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) scanFinishedWithUpdates:location[0] options:*(void *)(a1 + 40) andError:v12];
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  *(unsigned char *)(*(void *)(a1 + 32) + 18) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  objc_sync_exit(v3);

  if (*(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_SUDownloadPhaseIsQueued:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = location[0];
  id v6 = getkSUDownloadPhaseBrainFetchingQueuedRemote();
  char v8 = 0;
  char v7 = 1;
  if ((objc_msgSend(v5, "isEqualToString:") & 1) == 0)
  {
    id v4 = location[0];
    id v9 = getkSUDownloadPhaseUpdateFetchingQueuedRemote();
    char v8 = 1;
    char v7 = objc_msgSend(v4, "isEqualToString:");
  }
  char v11 = v7 & 1;
  if (v8) {

  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)updateStateFromDownload:(id)a3
{
  id v57 = &v76;
  char v56 = "-[SUSUISoftwareUpdateManager updateStateFromDownload:]";
  uint64_t v85 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v81 = (id)[location[0] progress];
  id v80 = _SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v57 + 5);
    *(_DWORD *)id v52 = type;
    id v53 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v57 + 9) + 88));
    id v3 = v53;
    id v4 = v57;
    uint64_t v54 = (uint64_t)v3;
    *((void *)v57 + 3) = v3;
    int v55 = *(_DWORD *)(*((void *)v4 + 9) + 88);
    LOBYTE(v4) = *(void *)(*((void *)v4 + 9) + 120) == 0;
    char v77 = 0;
    if (v4)
    {
      int v50 = @"N/A";
    }
    else
    {
      id v5 = (__CFString *)(id)[*(id *)(*((void *)v57 + 9) + 120) humanReadableUpdateName];
      *((void *)v57 + 2) = v5;
      char v77 = 1;
      int v50 = v5;
    }
    uint64_t v47 = v50;
    uint64_t v48 = *(void *)(*((void *)v57 + 9) + 120);
    uint64_t v49 = *(void *)(*((void *)v57 + 9) + 160);
    BOOL v6 = *(void *)(*((void *)v57 + 9) + 128) == 0;
    char v75 = 0;
    if (v6)
    {
      id v46 = @"N/A";
    }
    else
    {
      char v7 = (__CFString *)(id)[*(id *)(*((void *)v57 + 9) + 128) humanReadableUpdateName];
      *(void *)id v57 = v7;
      char v75 = 1;
      id v46 = v7;
    }
    id v42 = v46;
    uint64_t v43 = *(void *)(*((void *)v57 + 9) + 128);
    uint64_t v44 = *(void *)(*((void *)v57 + 9) + 168);
    uint64_t v45 = *(void *)(*((void *)v57 + 9) + 8);
    BOOL v8 = *(void *)(*((void *)v57 + 9) + 8) == 0;
    char v73 = 0;
    char v71 = 0;
    char v69 = 0;
    if (v8
      || (id v74 = (id)[*(id *)(*((void *)v57 + 9) + 8) descriptor],
          char v73 = 1,
          !v74))
    {
      id v41 = @"N/A";
    }
    else
    {
      id v72 = (id)[*(id *)(*((void *)v57 + 9) + 8) descriptor];
      int v40 = 1;
      char v71 = 1;
      id v70 = (id)[v72 humanReadableUpdateName];
      char v69 = 1;
      id v41 = (__CFString *)v70;
    }
    uint64_t v37 = v41;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v57 + 9) + 104));
    id v39 = objc_loadWeakRetained((id *)(*((void *)v57 + 9) + 104));
    char v67 = 0;
    char v65 = 0;
    if (v39)
    {
      id v68 = objc_loadWeakRetained((id *)(*((void *)v57 + 9) + 104));
      int v35 = 1;
      char v67 = 1;
      id v9 = (objc_class *)objc_opt_class();
      id v66 = NSStringFromClass(v9);
      char v65 = 1;
      id v36 = (__CFString *)v66;
    }
    else
    {
      id v36 = @"N/A";
    }
    uint64_t v32 = v36;
    id v33 = objc_loadWeakRetained((id *)(*((void *)v57 + 9) + 112));
    id v34 = objc_loadWeakRetained((id *)(*((void *)v57 + 9) + 112));
    char v63 = 0;
    char v61 = 0;
    if (v34)
    {
      id v64 = objc_loadWeakRetained((id *)(*((void *)v57 + 9) + 112));
      int v30 = 1;
      char v63 = 1;
      id v10 = (objc_class *)objc_opt_class();
      id v62 = NSStringFromClass(v10);
      char v61 = 1;
      id v31 = (__CFString *)v62;
    }
    else
    {
      id v31 = @"N/A";
    }
    id v26 = v31;
    uint64_t v27 = *((void *)v57 + 6);
    char v11 = [*((id *)v57 + 6) isDone];
    id v28 = &v14;
    buf = v84;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_4_0((uint64_t)v84, (uint64_t)v56, v54, v55, (uint64_t)v47, v48, v49, (uint64_t)v42, v43, v44, v45, (uint64_t)v37, (uint64_t)WeakRetained, (uint64_t)v32, (uint64_t)v33, (uint64_t)v31, v27, v11 & 1);
    _os_log_impl(&dword_228401000, log, v52[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\noperationProgress: %@; download done: %d",
      buf,
      0xA4u);
    if (v61) {

    }
    if (v63) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    if (v71) {
    if (v73)
    }

    if (v75) {
    if (v77)
    }

    objc_storeStrong(&v78, 0);
  }
  objc_storeStrong(&v80, 0);
  id v24 = (id)[*((id *)v57 + 7) downloadOptions];
  char v12 = [v24 isAutoDownload];
  int v25 = 0;
  if ((v12 & 1) == 0)
  {
    char v13 = *(unsigned char *)(*((void *)v57 + 9) + 55);
    int v25 = 0;
    if ((v13 & 1) == 0) {
      int v25 = *(unsigned __int8 *)(*((void *)v57 + 9) + 54) ^ 1;
    }
  }
  int v23 = v25;

  if (v23)
  {
    id v21 = (id)[*((id *)v57 + 7) descriptor];
    int v22 = [v21 isEqual:*(void *)(*((void *)v57 + 9) + 120)];

    if (v22)
    {
      [*((id *)v57 + 9) hideAlternateUpdate];
    }
    else
    {
      id v19 = (id)[*((id *)v57 + 7) descriptor];
      int v20 = [v19 isEqual:*(void *)(*((void *)v57 + 9) + 128)];

      if (v20) {
        [*((id *)v57 + 9) hidePreferredUpdate];
      }
    }
  }
  if ([*((id *)v57 + 6) isDone])
  {
    [*((id *)v57 + 9) checkAndSetReadyToInstall];
  }
  else
  {
    id v60 = (id)[*((id *)v57 + 6) phase];
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v58 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v16 = oslog;
      *(_DWORD *)id v17 = v58;
      id v18 = v83;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v83, (uint64_t)v56, (uint64_t)v60);
      _os_log_impl(&dword_228401000, v16, v17[0], "%s - phase: %@", v18, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (SUPrefsDownloadPhaseIsStalled_0(v60))
    {
      [*((id *)v57 + 9) setState:14];
    }
    else if ([*((id *)v57 + 9) _SUDownloadPhaseIsQueued:v60])
    {
      [*((id *)v57 + 9) setState:5];
    }
    else
    {
      [*((id *)v57 + 9) setState:12];
    }
    objc_storeStrong(&v60, 0);
  }
  id obj = 0;
  objc_storeStrong(&v81, 0);
  objc_storeStrong(location, obj);
}

- (void)scanFinishedWithUpdates:(id)a3 options:(id)a4 andError:(id)a5
{
  id v128 = v148;
  id obj = a4;
  id v130 = a5;
  id v131 = "-[SUSUISoftwareUpdateManager scanFinishedWithUpdates:options:andError:]";
  uint64_t v178 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v173 = 0;
  objc_storeStrong(&v173, obj);
  id v172 = 0;
  objc_storeStrong(&v172, v130);
  id v127 = _SUSUILoggingFacility();
  id v171 = v127;
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v171, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v128 + 35);
    *(_DWORD *)id v125 = type;
    id updated = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v128 + 40) + 88));
    id v121 = updated;
    id v5 = v121;
    BOOL v6 = v128;
    uint64_t v122 = (uint64_t)v5;
    *((void *)v128 + 33) = v5;
    int v123 = *(_DWORD *)(*((void *)v6 + 40) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 40) + 120) == 0;
    char v168 = 0;
    if (v6)
    {
      int v119 = @"N/A";
    }
    else
    {
      id v120 = (id)[*(id *)(*((void *)v128 + 40) + 120) humanReadableUpdateName];
      char v7 = (__CFString *)v120;
      *((void *)v128 + 32) = v7;
      char v168 = 1;
      int v119 = v7;
    }
    id v116 = v119;
    uint64_t v117 = *(void *)(*((void *)v128 + 40) + 120);
    uint64_t v118 = *(void *)(*((void *)v128 + 40) + 160);
    BOOL v8 = *(void *)(*((void *)v128 + 40) + 128) == 0;
    char v167 = 0;
    if (v8)
    {
      int v114 = @"N/A";
    }
    else
    {
      id v115 = (id)[*(id *)(*((void *)v128 + 40) + 128) humanReadableUpdateName];
      id v9 = (__CFString *)v115;
      *((void *)v128 + 30) = v9;
      char v167 = 1;
      int v114 = v9;
    }
    id v110 = v114;
    uint64_t v111 = *(void *)(*((void *)v128 + 40) + 128);
    uint64_t v112 = *(void *)(*((void *)v128 + 40) + 168);
    uint64_t v113 = *(void *)(*((void *)v128 + 40) + 8);
    BOOL v10 = *(void *)(*((void *)v128 + 40) + 8) == 0;
    char v166 = 0;
    char v165 = 0;
    char v164 = 0;
    if (v10
      || (id v109 = (id)[*(id *)(*((void *)v128 + 40) + 8) descriptor],
          id v11 = v109,
          *((void *)v128 + 28) = v11,
          char v166 = 1,
          !v11))
    {
      int v106 = @"N/A";
    }
    else
    {
      id v108 = (id)[*(id *)(*((void *)v128 + 40) + 8) descriptor];
      id v12 = v108;
      *((void *)v128 + 26) = v12;
      char v165 = 1;
      id v107 = (id)[v12 humanReadableUpdateName];
      char v13 = (__CFString *)v107;
      *((void *)v128 + 24) = v13;
      char v164 = 1;
      int v106 = v13;
    }
    id v104 = v106;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v128 + 40) + 104));
    id v103 = objc_loadWeakRetained((id *)(*((void *)v128 + 40) + 104));
    char v163 = 0;
    char v162 = 0;
    if (v103)
    {
      id v102 = objc_loadWeakRetained((id *)(*((void *)v128 + 40) + 104));
      *((void *)v128 + 22) = v102;
      char v163 = 1;
      Class aClass = (Class)objc_opt_class();
      id v100 = NSStringFromClass(aClass);
      uint64_t v14 = (__CFString *)v100;
      *((void *)v128 + 20) = v14;
      char v162 = 1;
      uint64_t v99 = v14;
    }
    else
    {
      uint64_t v99 = @"N/A";
    }
    id v97 = v99;
    id v98 = objc_loadWeakRetained((id *)(*((void *)v128 + 40) + 112));
    id v96 = objc_loadWeakRetained((id *)(*((void *)v128 + 40) + 112));
    char v161 = 0;
    char v160 = 0;
    if (v96)
    {
      id v95 = objc_loadWeakRetained((id *)(*((void *)v128 + 40) + 112));
      *((void *)v128 + 18) = v95;
      char v161 = 1;
      Class v94 = (Class)objc_opt_class();
      id v93 = NSStringFromClass(v94);
      uint64_t v15 = (__CFString *)v93;
      *((void *)v128 + 16) = v15;
      char v160 = 1;
      id v92 = v15;
    }
    else
    {
      id v92 = @"N/A";
    }
    char v90 = v92;
    id v91 = (id)[*((id *)v128 + 37) identifier];
    id v88 = v91;
    id v89 = (id)[*((id *)v128 + 37) clientName];
    id v87 = v89;
    uint64_t v16 = *((void *)v128 + 36);
    uint64_t v17 = *((void *)v128 + 38);
    uint64_t v85 = &v29;
    buf = v177;
    __os_log_helper_16_2_19_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_64((uint64_t)v177, (uint64_t)v131, v122, v123, (uint64_t)v116, v117, v118, (uint64_t)v110, v111, v112, v113, (uint64_t)v104, (uint64_t)WeakRetained, (uint64_t)v97, (uint64_t)v98, (uint64_t)v92, (uint64_t)v88, (uint64_t)v87, v16,
      v17);
    _os_log_impl(&dword_228401000, log, v125[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nscanId: %{public}@ (client: %{public}@), error: %{public}@; SUScanResults: %@",
      buf,
      0xBCu);

    if (v160) {
    if (v161)
    }

    if (v162) {
    if (v163)
    }

    if (v164) {
    if (v165)
    }

    if (v166) {
    if (v167)
    }

    if (v168) {
    objc_storeStrong(&v169, 0);
    }
  }
  objc_storeStrong(&v171, 0);
  if (*(unsigned char *)(*((void *)v128 + 40) + 17))
  {
    id v80 = (id)[MEMORY[0x263F77DA0] sharedDevice];
    id v78 = v80;
    int v79 = [v78 hasSemiSplatActive];

    if (v79)
    {
      SULogInfo();
      [*((id *)v128 + 40) clearPastScanResults];
      [*((id *)v128 + 40) setState:3];
      [*((id *)v128 + 40) handleRollbackApplied];
      int v157 = 1;
    }
    else
    {
      int v20 = v128;
      *(unsigned char *)(*((void *)v128 + 40) + 17) = 0;
      objc_storeStrong((id *)(*((void *)v20 + 40) + 152), 0);
      if (*((void *)v128 + 36))
      {
        id v45 = (id)[*((id *)v128 + 36) domain];
        id v43 = v45;
        id SUErrorDomain_3 = getSUErrorDomain_3();
        id v41 = SUErrorDomain_3;
        int v42 = objc_msgSend(v43, "isEqualToString:");
        BOOL v40 = 0;
        if (v42)
        {
          uint64_t v39 = [*((id *)v128 + 36) code];
          BOOL v40 = v39 == 3;
        }
        BOOL v38 = v40;

        if (v38)
        {
          [*((id *)v128 + 40) clearPastScanResults];
          [*((id *)v128 + 40) setState:3];
        }
        else
        {
          id v37 = (id)[*((id *)v128 + 36) domain];
          id v35 = v37;
          id v36 = getSUErrorDomain_3();
          id v33 = v36;
          int v34 = objc_msgSend(v35, "isEqualToString:");
          BOOL v32 = 0;
          if (v34)
          {
            uint64_t v31 = [*((id *)v128 + 36) code];
            BOOL v32 = v31 == 55;
          }
          BOOL v30 = v32;

          if (v30) {
            [*((id *)v128 + 40) setState:4];
          }
          else {
            [*((id *)v128 + 40) handleScanError:*((void *)v128 + 36)];
          }
        }
      }
      else
      {
        objc_initWeak(&from, *((id *)v128 + 40));
        char v155 = 0;
        BOOL v21 = *(_DWORD *)(*((void *)v128 + 40) + 88) == 1;
        char v154 = 0;
        int v77 = 1;
        if (!v21)
        {
          id v76 = (id)[*((id *)v128 + 40) download];
          id v22 = v76;
          *((void *)v128 + 8) = v22;
          char v154 = 1;
          int v77 = 1;
          if (!v22) {
            int v77 = *(unsigned __int8 *)(*((void *)v128 + 40) + 18);
          }
        }
        int v75 = v77;
        if (v154) {

        }
        int v23 = v128;
        char v155 = v75 & 1;
        *(void *)id v128 = MEMORY[0x263EF8330];
        int v149 = -1073741824;
        int v150 = 0;
        *((void *)v23 + 2) = __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke;
        *((void *)v23 + 3) = &unk_264840C68;
        id v74 = &v151;
        objc_copyWeak(&v151, &from);
        char v152 = v155 & 1;
        uint64_t v73 = MEMORY[0x22A697370](v148);
        id v24 = v128;
        *((void *)v128 + 6) = v73;
        if (*((void *)v24 + 38))
        {
          char v25 = *(unsigned char *)(*((void *)v128 + 40) + 54);
          char v146 = 0;
          char v144 = 0;
          char v142 = 0;
          int v72 = 0;
          if (v25)
          {
            id v70 = *(id *)(*((void *)v128 + 40) + 216);
            id v71 = (id)[*((id *)v128 + 38) preferredDescriptor];
            id v147 = v71;
            char v146 = 1;
            int v69 = objc_msgSend(v70, "isEqual:");
            int v72 = 0;
            if (v69)
            {
              if (*(void *)(*((void *)v128 + 40) + 120)
                || (id v68 = (id)[*((id *)v128 + 38) alternateDescriptor],
                    id v145 = v68,
                    char v144 = 1,
                    int v67 = 1,
                    v145))
              {
                BOOL v26 = *(void *)(*((void *)v128 + 40) + 120) == 0;
                int v66 = 0;
                if (!v26)
                {
                  id v64 = *(id *)(*((void *)v128 + 40) + 120);
                  id v65 = (id)[*((id *)v128 + 38) alternateDescriptor];
                  id v143 = v65;
                  char v142 = 1;
                  int v63 = objc_msgSend(v64, "isEqual:");
                  int v66 = v63;
                }
                int v67 = v66;
              }
              int v72 = v67;
            }
          }
          int v62 = v72;
          if (v142) {

          }
          if (v144) {
          if (v146)
          }

          if (v62)
          {
            id v61 = _SUSUILoggingFacility();
            os_log_t oslog = (os_log_t)v61;
            os_log_type_t v140 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              os_log_t v58 = oslog;
              *(_DWORD *)id v59 = v140;
              uint64_t v27 = *((void *)v128 + 38);
              id v60 = v175;
              __os_log_helper_16_2_2_8_32_8_64((uint64_t)v175, (uint64_t)v131, v27);
              _os_log_impl(&dword_228401000, v58, v59[0], "%s: Skipping on assigning the results preferred update and alternate update as _hidingPreferredUpdate = YES while _hiddenPreferredUpdate = results.preferredDescriptor and _preferredUpdate = results.alternateDescriptor. Results: %@", v60, 0x16u);
            }
            objc_storeStrong((id *)&oslog, 0);
          }
          else
          {
            [*((id *)v128 + 40) assignScanResults:*((void *)v128 + 38)];
          }
          if (v155)
          {
            id v56 = *(id *)(*((void *)v128 + 40) + 56);
            uint64_t v133 = MEMORY[0x263EF8330];
            int v134 = -1073741824;
            int v135 = 0;
            id v136 = __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_762;
            id v137 = &unk_264840CB8;
            id v57 = &v139;
            objc_copyWeak(&v139, &from);
            int v55 = &v133;
            id v52 = (id *)v138;
            v138[0] = *((id *)v128 + 40);
            id v53 = (id *)(v55 + 5);
            v138[1] = *((id *)v128 + 38);
            uint64_t v54 = (id *)(v55 + 6);
            v138[2] = *((id *)v128 + 6);
            [v56 download:v55];
            objc_storeStrong(v54, 0);
            objc_storeStrong(v53, 0);
            objc_storeStrong(v52, 0);
            objc_destroyWeak(v57);
          }
          else
          {
            [*((id *)v128 + 40) _requestLayoutSubviews];
          }
        }
        else
        {
          id v51 = (id)[*((id *)v128 + 40) download];
          id v50 = v51;

          if (v50)
          {
            if (v155)
            {
              id v48 = (id)*((void *)v128 + 40);
              id v49 = (id)[*((id *)v128 + 40) download];
              id v47 = v49;
              objc_msgSend(v48, "updateStateFromDownload:");
            }
          }
          else if (*(void *)(*((void *)v128 + 40) + 120))
          {
            int v132 = 0;
            int v46 = [*((id *)v128 + 40) shouldShowPreferredUpdateAsAlternate];
            if (v46) {
              int v28 = 6;
            }
            else {
              int v28 = 8;
            }
            int v132 = v28;
            (*(void (**)(void))(*((void *)v128 + 6) + 16))();
          }
          else
          {
            (*(void (**)(void))(*((void *)v128 + 6) + 16))();
          }
        }
        objc_storeStrong(&v153, 0);
        objc_destroyWeak(v74);
        objc_destroyWeak(&from);
      }
      int v157 = 0;
    }
  }
  else
  {
    id v84 = _SUSUILoggingFacility();
    id v18 = v84;
    id v19 = (os_log_t *)v128;
    *((void *)v128 + 14) = v18;
    os_log_type_t v158 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v19[14], OS_LOG_TYPE_ERROR))
    {
      os_log_t v81 = (os_log_t)*((void *)v128 + 14);
      *(_DWORD *)char v82 = v158;
      id v83 = v176;
      __os_log_helper_16_2_1_8_32((uint64_t)v176, (uint64_t)v131);
      _os_log_error_impl(&dword_228401000, v81, v82[0], "%s: Called while _anyScanInProgress = NO. Stopping.", v83, 0xCu);
    }
    objc_storeStrong(&v159, 0);
    int v157 = 1;
  }
  objc_storeStrong(&v172, 0);
  objc_storeStrong(&v173, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v5 = a1;
  unsigned int v4 = a2;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (location[0])
  {
    if (*(unsigned char *)(a1 + 40)) {
      [location[0] setState:v4];
    }
    else {
      [location[0] _requestLayoutSubviews];
    }
  }
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_762(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v35 = 0;
  objc_storeStrong(&v35, a3);
  v34[1] = (id)a1;
  v34[0] = objc_loadWeakRetained((id *)(a1 + 56));
  if (v34[0])
  {
    [v34[0] setDownload:location[0]];
    if (!location[0])
    {
      objc_msgSend(v34[0], "setHiddenAlternateUpdate:");
      [v34[0] setHiddenPreferredUpdate:0];
      *(unsigned char *)(*(void *)(a1 + 32) + 55) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 54) = 0;
      uint64_t v16 = *(void **)(a1 + 32);
      id v17 = (id)[*(id *)(a1 + 40) preferredDescriptor];
      objc_msgSend(v16, "setPreferredUpdate:");

      id v18 = *(void **)(a1 + 32);
      id v19 = (id)[*(id *)(a1 + 40) alternateDescriptor];
      objc_msgSend(v18, "setAlternateUpdate:");

      int v33 = 0;
      if ([v34[0] shouldShowPreferredUpdateAsAlternate]) {
        int v3 = 6;
      }
      else {
        int v3 = 8;
      }
      int v33 = v3;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      int v32 = 1;
      goto LABEL_16;
    }
    id v9 = *(void **)(*(void *)(a1 + 32) + 64);
    id v11 = (id)[location[0] downloadOptions];
    unsigned int v8 = [v11 downloadFeeAgreementStatus];
    id v10 = (id)[location[0] descriptor];
    objc_msgSend(v9, "setCellularFeeAgreementStatus:forUpdate:", v8);

    char v13 = *(void **)(*(void *)(a1 + 32) + 64);
    id v15 = (id)[location[0] downloadOptions];
    unsigned int v12 = [v15 termsAndConditionsAgreementStatus];
    id v14 = (id)[location[0] descriptor];
    objc_msgSend(v13, "setTermsAgreementStatus:forUpdate:", v12);

    char v31 = 0;
    id v6 = (id)[location[0] descriptor];
    char v4 = [v6 isEqual:*(void *)(*(void *)(a1 + 32) + 120)];
    char v29 = 0;
    char v7 = 1;
    if ((v4 & 1) == 0)
    {
      id v30 = (id)[location[0] descriptor];
      char v29 = 1;
      char v7 = [v30 isEqual:*(void *)(*(void *)(a1 + 32) + 128)];
    }
    if (v29) {

    }
    char v31 = v7 & 1;
    if (v7)
    {
      [v34[0] updateStateFromDownload:location[0]];
    }
    else if (*(_DWORD *)(*(void *)(a1 + 32) + 88) == 1)
    {
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 56);
      uint64_t v22 = MEMORY[0x263EF8330];
      int v23 = -1073741824;
      int v24 = 0;
      char v25 = __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_2;
      BOOL v26 = &unk_264840C90;
      objc_copyWeak(&v28, (id *)(a1 + 56));
      id v27 = *(id *)(a1 + 48);
      [v5 isClearingSpaceForDownload:&v22];
      objc_storeStrong(&v27, 0);
      objc_destroyWeak(&v28);
    }
  }
  int v32 = 0;
LABEL_16:
  objc_storeStrong(v34, 0);
  if (!v32) {
    int v32 = 0;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_scanFinishedWithUpdates_options_andError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v4[1] = (id)a1;
  v4[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v4[0])
  {
    [v4[0] setClearingSpaceForDownload:v6 & 1];
    [v4[0] shouldShowPreferredUpdateAsAlternate];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

- (void)clearPastScanResults
{
  self->_hidingAlternateUpdate = 0;
  self->_hidingPreferredUpdate = 0;
}

- (BOOL)shouldShowPreferredUpdateAsAlternate
{
  if (self->_preferredUpdate
    && [(SUDescriptor *)self->_preferredUpdate audienceType] == 1
    && !self->_alternateUpdate)
  {
    return [(SUDescriptor *)self->_preferredUpdate promoteAlternateUpdate] & 1;
  }
  else
  {
    return 0;
  }
}

- (void)assignScanResults:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v60 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = (id)[location[0] preferredDescriptor];
  char v57 = 0;
  char v55 = 0;
  if (v27 || (char v26 = 1, v60->_preferredUpdate))
  {
    id v58 = (id)[location[0] preferredDescriptor];
    char v57 = 1;
    char v25 = 0;
    if (v58)
    {
      id v56 = (id)[location[0] preferredDescriptor];
      char v55 = 1;
      char v25 = [v56 isEqual:v60->_preferredUpdate];
    }
    char v26 = v25;
  }
  if (v55) {

  }
  if (v57) {
  if (v26)
  }
  {
    id v46 = _SUSUILoggingFacility();
    os_log_type_t v45 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = v60->_preferredUpdate == 0;
      char v43 = 0;
      if (v4)
      {
        id v17 = @"N/A";
      }
      else
      {
        uint64_t v44 = (__CFString *)(id)[(SUDescriptor *)v60->_preferredUpdate humanReadableUpdateName];
        char v43 = 1;
        id v17 = v44;
      }
      __os_log_helper_16_2_4_8_32_8_64_8_0_8_64((uint64_t)v63, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v17, (uint64_t)v60->_preferredUpdate, (uint64_t)v60->_preferredUpdateError);
      _os_log_impl(&dword_228401000, (os_log_t)v46, v45, "%s: The previous stored preferred update \"%@\" (%p) is the same as the new recieved one. Keeping it with its related error: %@", v63, 0x2Au);
      if (v43) {
    }
      }
    objc_storeStrong(&v46, 0);
  }
  else
  {
    id v54 = _SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v3 = v60->_preferredUpdate == 0;
      char v51 = 0;
      if (v3)
      {
        int v24 = @"N/A";
      }
      else
      {
        id v52 = (__CFString *)(id)[(SUDescriptor *)v60->_preferredUpdate humanReadableUpdateName];
        char v51 = 1;
        int v24 = v52;
      }
      uint64_t preferredUpdate = (uint64_t)v60->_preferredUpdate;
      id v23 = (id)[location[0] preferredDescriptor];
      char v49 = 0;
      char v47 = 0;
      if (v23)
      {
        id v50 = (id)[location[0] preferredDescriptor];
        char v49 = 1;
        id v48 = (__CFString *)(id)[v50 humanReadableUpdateName];
        char v47 = 1;
        BOOL v21 = v48;
      }
      else
      {
        BOOL v21 = @"N/A";
      }
      id v20 = (id)[location[0] preferredDescriptor];
      __os_log_helper_16_2_6_8_32_8_64_8_0_8_64_8_0_8_64((uint64_t)v64, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v24, preferredUpdate, (uint64_t)v21, (uint64_t)v20, (uint64_t)v60->_preferredUpdateError);
      _os_log_impl(&dword_228401000, (os_log_t)v54, type, "%s: Replacing the previous stored preferred update \"%@\" (%p) with a new, different, preferred update: %@ (%p) and clearing the previous preferred update error: %@", v64, 0x3Eu);

      if (v47) {
      if (v49)
      }

      if (v51) {
    }
      }
    objc_storeStrong(&v54, 0);
    id v18 = v60;
    id v19 = (id)[location[0] preferredDescriptor];
    -[SUSUISoftwareUpdateManager setPreferredUpdate:](v18, "setPreferredUpdate:");

    [(SUSUISoftwareUpdateManager *)v60 setPreferredUpdateError:0];
  }
  id v16 = (id)[location[0] alternateDescriptor];
  char v41 = 0;
  char v39 = 0;
  if (v16 || (char v15 = 1, v60->_alternateUpdate))
  {
    id v42 = (id)[location[0] alternateDescriptor];
    char v41 = 1;
    char v14 = 0;
    if (v42)
    {
      id v40 = (id)[location[0] alternateDescriptor];
      char v39 = 1;
      char v14 = [v40 isEqual:v60->_alternateUpdate];
    }
    char v15 = v14;
  }
  if (v39) {

  }
  if (v41) {
  if (v15)
  }
  {
    os_log_t v30 = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      char v28 = 0;
      if (v60->_alternateUpdate)
      {
        char v29 = (__CFString *)(id)[(SUDescriptor *)v60->_alternateUpdate humanReadableUpdateName];
        char v28 = 1;
        char v6 = v29;
      }
      else
      {
        char v6 = @"N/A";
      }
      __os_log_helper_16_2_4_8_32_8_64_8_0_8_64((uint64_t)v61, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v6, (uint64_t)v60->_alternateUpdate, (uint64_t)v60->_alternateUpdateError);
      _os_log_impl(&dword_228401000, v30, OS_LOG_TYPE_DEFAULT, "%s: The previous stored alternate update \"%@\" (%p) is the same as the new recieved one. Keeping it with its related error: %@", v61, 0x2Au);
      if (v28) {
    }
      }
    objc_storeStrong((id *)&v30, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = v60->_alternateUpdate == 0;
      char v35 = 0;
      if (v5)
      {
        char v13 = @"N/A";
      }
      else
      {
        id v36 = (id)[(SUDescriptor *)v60->_alternateUpdate humanReadableUpdateName];
        char v35 = 1;
        char v13 = (__CFString *)v36;
      }
      uint64_t alternateUpdate = (uint64_t)v60->_alternateUpdate;
      id v12 = (id)[location[0] alternateDescriptor];
      char v33 = 0;
      char v31 = 0;
      if (v12)
      {
        id v34 = (id)[location[0] alternateDescriptor];
        char v33 = 1;
        id v32 = (id)[v34 humanReadableUpdateName];
        char v31 = 1;
        id v10 = (__CFString *)v32;
      }
      else
      {
        id v10 = @"N/A";
      }
      id v9 = (id)[location[0] alternateDescriptor];
      __os_log_helper_16_2_6_8_32_8_64_8_0_8_64_8_0_8_64((uint64_t)v62, (uint64_t)"-[SUSUISoftwareUpdateManager assignScanResults:]", (uint64_t)v13, alternateUpdate, (uint64_t)v10, (uint64_t)v9, (uint64_t)v60->_alternateUpdateError);
      _os_log_impl(&dword_228401000, oslog, v37, "%s: Replacing the previous stored alternate update \"%@\" (%p) with a new, different, alternate update: %@ (%p) and clearing the previous alternate update error: %@", v62, 0x3Eu);

      if (v31) {
      if (v33)
      }

      if (v35) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    uint64_t v7 = v60;
    id v8 = (id)[location[0] alternateDescriptor];
    -[SUSUISoftwareUpdateManager setAlternateUpdate:](v7, "setAlternateUpdate:");

    [(SUSUISoftwareUpdateManager *)v60 setAlternateUpdateError:0];
  }
  objc_storeStrong(location, 0);
}

- (void)enrollInBetaUpdatesForProgram:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  os_log_t v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  if (_os_feature_enabled_impl())
  {
    id v10 = [(SUSUISoftwareUpdateManager *)v30 betaPrograms];
    char v23 = 0;
    BOOL v11 = 1;
    if (v10)
    {
      int v24 = [(SUSUISoftwareUpdateManager *)v30 betaPrograms];
      char v23 = 1;
      BOOL v11 = [(NSArray *)v24 count] == 0;
    }
    if (v23) {

    }
    if (v11)
    {
      id v22 = _SUSUILoggingFacility();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]");
        _os_log_impl(&dword_228401000, (os_log_t)v22, v21, "%s: No programs to enroll in, aborting", v31, 0xCu);
      }
      objc_storeStrong(&v22, 0);
      [(SUSUISoftwareUpdateManager *)v30 scanForUpdatesCompletion:0];
      (*((void (**)(id, void))v28 + 2))(v28, 0);
      int v25 = 1;
    }
    else
    {
      if (!location[0])
      {
        id v9 = [(SUSUISoftwareUpdateManager *)v30 betaPrograms];
        id v4 = [(NSArray *)v9 firstObject];
        id v5 = location[0];
        location[0] = v4;
      }
      id v8 = (id)[MEMORY[0x263F67CE8] sharedManager];
      uint64_t v7 = [(SUSUISoftwareUpdateManager *)v30 currentSeedingDevice];
      id v6 = location[0];
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke;
      id v17 = &unk_26483C008;
      id v18 = v30;
      id v19 = location[0];
      id v20 = v28;
      [v8 enrollDevice:v7 inBetaProgram:v6 completion:&v13];

      objc_storeStrong(&v20, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong((id *)&v18, 0);
      int v25 = 0;
    }
  }
  else
  {
    id v27 = _SUSUILoggingFacility();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v32, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]");
      _os_log_impl(&dword_228401000, (os_log_t)v27, v26, "%s: enrollInBetaUpdates feature is not enabled", v32, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    (*((void (**)(id, void))v28 + 2))(v28, 0);
    int v25 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke(id *a1, void *a2)
{
  id v46 = a1;
  os_log_type_t v45 = "-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]_block_invoke";
  uint64_t v76 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v73[1] = v46;
  v73[0] = _SUSUILoggingFacility();
  unsigned __int8 v72 = 0;
  if (os_log_type_enabled((os_log_t)v73[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v73[0];
    *(_DWORD *)os_log_type_t type = v72;
    id v42 = SUSUISoftwareUpdateStateToString(*((_DWORD *)v46[4] + 22));
    id v43 = v42;
    id v71 = v43;
    int v44 = *((_DWORD *)v46[4] + 22);
    BOOL v2 = *((void *)v46[4] + 15) == 0;
    char v69 = 0;
    if (v2)
    {
      char v39 = @"N/A";
    }
    else
    {
      id v70 = (__CFString *)(id)[*((id *)v46[4] + 15) humanReadableUpdateName];
      char v69 = 1;
      char v39 = v70;
    }
    id v36 = v39;
    uint64_t v37 = *((void *)v46[4] + 15);
    uint64_t v38 = *((void *)v46[4] + 20);
    BOOL v3 = *((void *)v46[4] + 16) == 0;
    char v67 = 0;
    if (v3)
    {
      char v35 = @"N/A";
    }
    else
    {
      id v68 = (id)[*((id *)v46[4] + 16) humanReadableUpdateName];
      char v67 = 1;
      char v35 = (__CFString *)v68;
    }
    char v31 = v35;
    uint64_t v32 = *((void *)v46[4] + 16);
    uint64_t v33 = *((void *)v46[4] + 21);
    uint64_t v34 = *((void *)v46[4] + 1);
    BOOL v4 = *((void *)v46[4] + 1) == 0;
    char v65 = 0;
    char v63 = 0;
    char v61 = 0;
    if (v4
      || (v66 = (id)[*((id *)v46[4] + 1) descriptor], char v65 = 1, !v66))
    {
      os_log_t v30 = @"N/A";
    }
    else
    {
      id v64 = (id)[*((id *)v46[4] + 1) descriptor];
      int v29 = 1;
      char v63 = 1;
      id v62 = (id)[v64 humanReadableUpdateName];
      char v61 = 1;
      os_log_t v30 = (__CFString *)v62;
    }
    os_log_type_t v26 = v30;
    id WeakRetained = objc_loadWeakRetained((id *)v46[4] + 13);
    id v28 = objc_loadWeakRetained((id *)v46[4] + 13);
    char v59 = 0;
    char v57 = 0;
    if (v28)
    {
      id v60 = objc_loadWeakRetained((id *)v46[4] + 13);
      int v24 = 1;
      char v59 = 1;
      id v5 = (objc_class *)objc_opt_class();
      id v58 = NSStringFromClass(v5);
      char v57 = 1;
      int v25 = (__CFString *)v58;
    }
    else
    {
      int v25 = @"N/A";
    }
    os_log_type_t v21 = v25;
    id v22 = objc_loadWeakRetained((id *)v46[4] + 14);
    id v23 = objc_loadWeakRetained((id *)v46[4] + 14);
    char v55 = 0;
    char v53 = 0;
    if (v23)
    {
      id v56 = objc_loadWeakRetained((id *)v46[4] + 14);
      int v19 = 1;
      char v55 = 1;
      id v6 = (objc_class *)objc_opt_class();
      id v54 = NSStringFromClass(v6);
      char v53 = 1;
      id v20 = (__CFString *)v54;
    }
    else
    {
      id v20 = @"N/A";
    }
    uint64_t v7 = (uint64_t)v46[5];
    id v17 = &v8;
    buf = v75;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v75, (uint64_t)v45, (uint64_t)v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20, v7, (uint64_t)location[0]);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nEnroll in program: %@, error: %@", buf, 0xA8u);
    if (v53) {

    }
    if (v55) {
    if (v57)
    }

    if (v59) {
    if (v61)
    }

    if (v63) {
    if (v65)
    }

    if (v67) {
    if (v69)
    }

    objc_storeStrong(&v71, 0);
  }
  id obj = 0;
  objc_storeStrong(v73, 0);
  dispatch_queue_t queue = (dispatch_queue_t)MEMORY[0x263EF83A0];
  dispatch_block_t block = &v47;
  uint64_t v47 = MEMORY[0x263EF8330];
  int v48 = -1073741824;
  int v49 = 0;
  id v50 = __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke_766;
  char v51 = &unk_264840CE0;
  int v14 = (id *)v52;
  int v15 = location;
  v52[0] = location[0];
  uint64_t v13 = (id *)((char *)block + 56);
  v52[3] = v46[6];
  id v12 = (id *)((char *)block + 40);
  v52[1] = v46[4];
  BOOL v11 = (id *)((char *)block + 48);
  void v52[2] = v46[5];
  dispatch_async(queue, block);

  objc_storeStrong(v11, obj);
  objc_storeStrong(v12, obj);
  objc_storeStrong(v13, obj);
  objc_storeStrong(v14, obj);
  objc_storeStrong(v15, obj);
}

void __71__SUSUISoftwareUpdateManager_enrollInBetaUpdatesForProgram_completion___block_invoke_766(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(void *)(a1 + 32))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    location[0] = _SUSUILoggingFacility();
    os_log_type_t v3 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]_block_invoke");
      _os_log_error_impl(&dword_228401000, (os_log_t)location[0], v3, "%s: Failed to enroll device in seeding", v6, 0xCu);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v5, (uint64_t)"-[SUSUISoftwareUpdateManager enrollInBetaUpdatesForProgram:completion:]_block_invoke");
      _os_log_error_impl(&dword_228401000, oslog, OS_LOG_TYPE_ERROR, "%s: Finished to enroll device in seeding", v5, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    [*(id *)(a1 + 40) setEnrolledBetaProgram:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) scanForUpdatesCompletion:0];
  }
}

- (void)unenrollBetaUpdatesWithCompletion:(id)a3
{
  int v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (_os_feature_enabled_impl())
  {
    id v4 = (id)[MEMORY[0x263F67CE8] sharedManager];
    os_log_type_t v3 = [(SUSUISoftwareUpdateManager *)v14 currentSeedingDevice];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    uint64_t v8 = __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke;
    id v9 = &unk_26483BE28;
    id v10 = v14;
    id v11 = location[0];
    [v4 unenrollDevice:v3 completion:&v5];

    objc_storeStrong(&v11, 0);
    objc_storeStrong((id *)&v10, 0);
    int v12 = 0;
  }
  else
  {
    int v12 = 1;
  }
  objc_storeStrong(location, 0);
}

void __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke(void *a1, char a2)
{
  char v41 = a1;
  id v42 = "-[SUSUISoftwareUpdateManager unenrollBetaUpdatesWithCompletion:]_block_invoke";
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v73 = a1;
  char v72 = a2 & 1;
  v71[1] = a1;
  v71[0] = _SUSUILoggingFacility();
  unsigned __int8 v70 = 0;
  if (os_log_type_enabled((os_log_t)v71[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v71[0];
    *(_DWORD *)os_log_type_t type = v70;
    id v38 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v41 + 4) + 88));
    id v39 = v38;
    id location = v39;
    int v40 = *(_DWORD *)(*((void *)v41 + 4) + 88);
    BOOL v2 = *(void *)(*((void *)v41 + 4) + 120) == 0;
    char v67 = 0;
    if (v2)
    {
      char v35 = @"N/A";
    }
    else
    {
      id v68 = (__CFString *)(id)[*(id *)(*((void *)v41 + 4) + 120) humanReadableUpdateName];
      char v67 = 1;
      char v35 = v68;
    }
    uint64_t v32 = v35;
    uint64_t v33 = *(void *)(*((void *)v41 + 4) + 120);
    uint64_t v34 = *(void *)(*((void *)v41 + 4) + 160);
    BOOL v3 = *(void *)(*((void *)v41 + 4) + 128) == 0;
    char v65 = 0;
    if (v3)
    {
      char v31 = @"N/A";
    }
    else
    {
      id v66 = (id)[*(id *)(*((void *)v41 + 4) + 128) humanReadableUpdateName];
      char v65 = 1;
      char v31 = (__CFString *)v66;
    }
    id v27 = v31;
    uint64_t v28 = *(void *)(*((void *)v41 + 4) + 128);
    uint64_t v29 = *(void *)(*((void *)v41 + 4) + 168);
    uint64_t v30 = *(void *)(*((void *)v41 + 4) + 8);
    BOOL v4 = *(void *)(*((void *)v41 + 4) + 8) == 0;
    char v63 = 0;
    char v61 = 0;
    char v59 = 0;
    if (v4
      || (id v64 = (id)[*(id *)(*((void *)v41 + 4) + 8) descriptor],
          char v63 = 1,
          !v64))
    {
      os_log_type_t v26 = @"N/A";
    }
    else
    {
      id v62 = (id)[*(id *)(*((void *)v41 + 4) + 8) descriptor];
      int v25 = 1;
      char v61 = 1;
      id v60 = (id)[v62 humanReadableUpdateName];
      char v59 = 1;
      os_log_type_t v26 = (__CFString *)v60;
    }
    id v22 = v26;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v41 + 4) + 104));
    id v24 = objc_loadWeakRetained((id *)(*((void *)v41 + 4) + 104));
    char v57 = 0;
    char v55 = 0;
    if (v24)
    {
      id v58 = objc_loadWeakRetained((id *)(*((void *)v41 + 4) + 104));
      int v20 = 1;
      char v57 = 1;
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v56 = NSStringFromClass(v5);
      char v55 = 1;
      os_log_type_t v21 = (__CFString *)v56;
    }
    else
    {
      os_log_type_t v21 = @"N/A";
    }
    id v17 = v21;
    id v18 = objc_loadWeakRetained((id *)(*((void *)v41 + 4) + 112));
    id v19 = objc_loadWeakRetained((id *)(*((void *)v41 + 4) + 112));
    char v53 = 0;
    char v51 = 0;
    if (v19)
    {
      id v54 = objc_loadWeakRetained((id *)(*((void *)v41 + 4) + 112));
      int v15 = 1;
      char v53 = 1;
      int v6 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v6);
      char v51 = 1;
      id v16 = (__CFString *)v52;
    }
    else
    {
      id v16 = @"N/A";
    }
    uint64_t v13 = &v7;
    buf = v74;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0((uint64_t)v74, (uint64_t)v42, (uint64_t)v39, v40, (uint64_t)v32, v33, v34, (uint64_t)v27, v28, v29, v30, (uint64_t)v22, (uint64_t)WeakRetained, (uint64_t)v17, (uint64_t)v18, (uint64_t)v16, v72 & 1);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUn-enroll from beta program success: %d", buf, 0x9Au);
    if (v51) {

    }
    if (v53) {
    if (v55)
    }

    if (v57) {
    if (v59)
    }

    if (v61) {
    if (v63)
    }

    if (v65) {
    if (v67)
    }

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v71, 0);
  if (v72) {
    [*((id *)v41 + 4) setEnrolledBetaProgram:0];
  }
  dispatch_queue_t queue = (dispatch_queue_t)MEMORY[0x263EF83A0];
  dispatch_block_t block = &v43;
  uint64_t v43 = MEMORY[0x263EF8330];
  int v44 = -1073741824;
  int v45 = 0;
  id v46 = __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke_768;
  uint64_t v47 = &unk_26483BC98;
  id v11 = &v49;
  id v49 = *((id *)v41 + 5);
  char v50 = v72 & 1;
  id v10 = (id *)((char *)block + 32);
  id v48 = *((id *)v41 + 4);
  dispatch_async(queue, block);

  id obj = 0;
  objc_storeStrong(v10, 0);
  objc_storeStrong(v11, obj);
}

uint64_t __64__SUSUISoftwareUpdateManager_unenrollBetaUpdatesWithCompletion___block_invoke_768(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanForUpdatesCompletion:0];
}

- (void)scanForBetaPrograms
{
  uint64_t v37 = "-[SUSUISoftwareUpdateManager scanForBetaPrograms]";
  uint64_t v67 = *MEMORY[0x263EF8340];
  char v65 = self;
  v64[1] = (id)a2;
  if (_os_feature_enabled_impl())
  {
    if ([(SUSUISoftwareUpdateManager *)v65 clientIsBuddy])
    {
      v64[0] = _SUSUILoggingFacility();
      unsigned __int8 v63 = 0;
      if (os_log_type_enabled((os_log_t)v64[0], OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = (os_log_t)v64[0];
        *(_DWORD *)os_log_type_t type = v63;
        id v34 = SUSUISoftwareUpdateStateToString(v65->_state);
        id v35 = v34;
        id location = v35;
        int state = v65->_state;
        BOOL v2 = v65->_preferredUpdate == 0;
        char v60 = 0;
        if (v2)
        {
          char v31 = @"N/A";
        }
        else
        {
          char v61 = (__CFString *)(id)[(SUDescriptor *)v65->_preferredUpdate humanReadableUpdateName];
          char v60 = 1;
          char v31 = v61;
        }
        uint64_t v28 = v31;
        uint64_t preferredUpdate = v65->_preferredUpdate;
        preferredUpdateError = v65->_preferredUpdateError;
        BOOL v3 = v65->_alternateUpdate == 0;
        char v58 = 0;
        if (v3)
        {
          id v27 = @"N/A";
        }
        else
        {
          char v59 = (__CFString *)(id)[(SUDescriptor *)v65->_alternateUpdate humanReadableUpdateName];
          char v58 = 1;
          id v27 = v59;
        }
        id v23 = v27;
        uint64_t alternateUpdate = v65->_alternateUpdate;
        alternateUpdateError = v65->_alternateUpdateError;
        uint64_t download = v65->_download;
        BOOL v4 = v65->_download == 0;
        char v56 = 0;
        char v54 = 0;
        char v52 = 0;
        if (v4
          || (char v57 = [(SUDownload *)v65->_download descriptor],
              char v56 = 1,
              !v57))
        {
          id v22 = @"N/A";
        }
        else
        {
          id v55 = [(SUDownload *)v65->_download descriptor];
          int v21 = 1;
          char v54 = 1;
          id v53 = (id)[v55 humanReadableUpdateName];
          char v52 = 1;
          id v22 = (__CFString *)v53;
        }
        id v18 = v22;
        id WeakRetained = objc_loadWeakRetained((id *)&v65->_delegate);
        id v20 = objc_loadWeakRetained((id *)&v65->_delegate);
        char v50 = 0;
        char v48 = 0;
        if (v20)
        {
          id v51 = objc_loadWeakRetained((id *)&v65->_delegate);
          int v16 = 1;
          char v50 = 1;
          uint64_t v5 = (objc_class *)objc_opt_class();
          id v49 = NSStringFromClass(v5);
          char v48 = 1;
          id v17 = (__CFString *)v49;
        }
        else
        {
          id v17 = @"N/A";
        }
        uint64_t v13 = v17;
        id v14 = objc_loadWeakRetained((id *)&v65->_hostController);
        id v15 = objc_loadWeakRetained((id *)&v65->_hostController);
        char v46 = 0;
        char v44 = 0;
        if (v15)
        {
          id v47 = objc_loadWeakRetained((id *)&v65->_hostController);
          int v11 = 1;
          char v46 = 1;
          int v6 = (objc_class *)objc_opt_class();
          id v45 = NSStringFromClass(v6);
          char v44 = 1;
          int v12 = (__CFString *)v45;
        }
        else
        {
          int v12 = @"N/A";
        }
        id v9 = &v7;
        buf = v66;
        __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v66, (uint64_t)v37, (uint64_t)v35, state, (uint64_t)v28, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v23, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v18, (uint64_t)WeakRetained, (uint64_t)v13, (uint64_t)v14, (uint64_t)v12);
        _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nNot scanning for beta programs because this is buddy.", buf, 0x94u);
        if (v44) {

        }
        if (v46) {
        if (v48)
        }

        if (v50) {
        if (v52)
        }

        if (v54) {
        if (v56)
        }

        if (v58) {
        if (v60)
        }

        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(v64, 0);
    }
    else if (v65->_currentSeedingDevice)
    {
      [(SUSUISoftwareUpdateManager *)v65 _scanForBetaProgramsWithSeedingDevice:v65->_currentSeedingDevice];
    }
    else
    {
      id v8 = (id)MEMORY[0x263F67CF8];
      uint64_t v38 = MEMORY[0x263EF8330];
      int v39 = -1073741824;
      int v40 = 0;
      char v41 = __49__SUSUISoftwareUpdateManager_scanForBetaPrograms__block_invoke;
      id v42 = &unk_264840D08;
      uint64_t v43 = v65;
      [v8 getCurrentDevice:&v38];
      objc_storeStrong((id *)&v43, 0);
    }
  }
}

void __49__SUSUISoftwareUpdateManager_scanForBetaPrograms__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_storeStrong((id *)a1[4] + 31, location[0]);
  [a1[4] _scanForBetaProgramsWithSeedingDevice:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_scanForBetaProgramsWithSeedingDevice:(id)a3
{
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    id v15 = (id)[MEMORY[0x263F67CE8] sharedManager];
    id v4 = v15;
    uint64_t v3 = [location[0] platform];
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    id v10 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke;
    int v11 = &unk_264840D80;
    int v12 = v21;
    id v13 = v15;
    id v14 = location[0];
    [v4 queryProgramsForSystemAccountsWithPlatforms:v3 completion:&v7];
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong(&v15, 0);
    int v16 = 0;
  }
  else
  {
    id v19 = _SUSUILoggingFacility();
    char v18 = 16;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v19;
      os_log_type_t type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_228401000, log, type, "Tried to scan for beta programs without a seeding device.", v17, 2u);
    }
    objc_storeStrong(&v19, 0);
    int v16 = 1;
  }
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v15 = a3;
  v14[2] = a1;
  dispatch_queue_t queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2;
  id v10 = &unk_264840D58;
  id v11 = a1[4];
  v14[1] = v15;
  id v12 = location[0];
  id v13 = a1[5];
  v14[0] = a1[6];
  dispatch_async(queue, &v6);

  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2(void *a1)
{
  id v55 = a1;
  char v56 = "-[SUSUISoftwareUpdateManager _scanForBetaProgramsWithSeedingDevice:]_block_invoke_2";
  uint64_t v92 = *MEMORY[0x263EF8340];
  v88[2] = a1;
  v88[1] = a1;
  v88[0] = _SUSUILoggingFacility();
  unsigned __int8 v87 = 0;
  if (os_log_type_enabled((os_log_t)v88[0], OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v88[0];
    *(_DWORD *)os_log_type_t type = v87;
    id v52 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v55 + 4) + 88));
    id v53 = v52;
    id location = v53;
    int v54 = *(_DWORD *)(*((void *)v55 + 4) + 88);
    BOOL v1 = *(void *)(*((void *)v55 + 4) + 120) == 0;
    char v84 = 0;
    if (v1)
    {
      id v49 = @"N/A";
    }
    else
    {
      uint64_t v85 = (__CFString *)(id)[*(id *)(*((void *)v55 + 4) + 120) humanReadableUpdateName];
      char v84 = 1;
      id v49 = v85;
    }
    char v46 = v49;
    uint64_t v47 = *(void *)(*((void *)v55 + 4) + 120);
    uint64_t v48 = *(void *)(*((void *)v55 + 4) + 160);
    BOOL v2 = *(void *)(*((void *)v55 + 4) + 128) == 0;
    char v82 = 0;
    if (v2)
    {
      id v45 = @"N/A";
    }
    else
    {
      id v83 = (id)[*(id *)(*((void *)v55 + 4) + 128) humanReadableUpdateName];
      char v82 = 1;
      id v45 = (__CFString *)v83;
    }
    char v41 = v45;
    uint64_t v42 = *(void *)(*((void *)v55 + 4) + 128);
    uint64_t v43 = *(void *)(*((void *)v55 + 4) + 168);
    uint64_t v44 = *(void *)(*((void *)v55 + 4) + 8);
    BOOL v3 = *(void *)(*((void *)v55 + 4) + 8) == 0;
    char v80 = 0;
    char v78 = 0;
    char v76 = 0;
    if (v3
      || (id v81 = (id)[*(id *)(*((void *)v55 + 4) + 8) descriptor],
          char v80 = 1,
          !v81))
    {
      int v40 = @"N/A";
    }
    else
    {
      id v79 = (id)[*(id *)(*((void *)v55 + 4) + 8) descriptor];
      int v39 = 1;
      char v78 = 1;
      id v77 = (id)[v79 humanReadableUpdateName];
      char v76 = 1;
      int v40 = (__CFString *)v77;
    }
    id v36 = v40;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v55 + 4) + 104));
    id v38 = objc_loadWeakRetained((id *)(*((void *)v55 + 4) + 104));
    char v74 = 0;
    char v72 = 0;
    if (v38)
    {
      id v75 = objc_loadWeakRetained((id *)(*((void *)v55 + 4) + 104));
      int v34 = 1;
      char v74 = 1;
      id v4 = (objc_class *)objc_opt_class();
      id v73 = NSStringFromClass(v4);
      char v72 = 1;
      id v35 = (__CFString *)v73;
    }
    else
    {
      id v35 = @"N/A";
    }
    char v31 = v35;
    id v32 = objc_loadWeakRetained((id *)(*((void *)v55 + 4) + 112));
    id v33 = objc_loadWeakRetained((id *)(*((void *)v55 + 4) + 112));
    char v70 = 0;
    char v68 = 0;
    if (v33)
    {
      id v71 = objc_loadWeakRetained((id *)(*((void *)v55 + 4) + 112));
      int v29 = 1;
      char v70 = 1;
      uint64_t v5 = (objc_class *)objc_opt_class();
      id v69 = NSStringFromClass(v5);
      char v68 = 1;
      uint64_t v30 = (__CFString *)v69;
    }
    else
    {
      uint64_t v30 = @"N/A";
    }
    id v27 = &v9;
    buf = v91;
    __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v91, (uint64_t)v56, (uint64_t)v53, v54, (uint64_t)v46, v47, v48, (uint64_t)v41, v42, v43, v44, (uint64_t)v36, (uint64_t)WeakRetained, (uint64_t)v31, (uint64_t)v32, (uint64_t)v30);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nCompleted beta program scan.", buf, 0x94u);
    if (v68) {

    }
    if (v70) {
    if (v72)
    }

    if (v74) {
    if (v76)
    }

    if (v78) {
    if (v80)
    }

    if (v82) {
    if (v84)
    }

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v88, 0);
  if (*((void *)v55 + 8))
  {
    objc_storeStrong((id *)(*((void *)v55 + 4) + 256), MEMORY[0x263EFFA68]);
    uint64_t v6 = (id *)v55;
    *(unsigned char *)(*((void *)v55 + 4) + 85) = 1;
    id v25 = (id)[v6[4] delegate];
    int v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v24 = (id)[*((id *)v55 + 4) delegate];
      [v24 manager:*((void *)v55 + 4) didReceiveBetaPrograms:*(void *)(*((void *)v55 + 4) + 256)];
    }
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v66 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      os_log_t v21 = oslog;
      *(_DWORD *)id v22 = v66;
      uint64_t v7 = *((void *)v55 + 8);
      id v23 = v90;
      __os_log_helper_16_0_1_8_0((uint64_t)v90, v7);
      _os_log_error_impl(&dword_228401000, v21, v22[0], "error fetching new beta programs: %ld", v23, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    objc_storeStrong((id *)(*((void *)v55 + 4) + 256), *((id *)v55 + 5));
    os_log_t v65 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v16 = v65;
      *(_DWORD *)id v17 = v64;
      id v19 = (id)[*(id *)(*((void *)v55 + 4) + 256) valueForKey:@"programID"];
      id v8 = v19;
      id v20 = &v63;
      id v63 = v8;
      char v18 = v89;
      __os_log_helper_16_2_1_8_64((uint64_t)v89, (uint64_t)v8);
      _os_log_impl(&dword_228401000, v16, v17[0], "got new beta programs: %@", v18, 0xCu);

      objc_storeStrong(v20, 0);
    }
    id obj = 0;
    objc_storeStrong((id *)&v65, 0);
    id v12 = (id)*((void *)v55 + 6);
    uint64_t v10 = *((void *)v55 + 7);
    id v11 = &v57;
    uint64_t v57 = MEMORY[0x263EF8330];
    int v58 = -1073741824;
    int v59 = 0;
    char v60 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_777;
    char v61 = &unk_264840D30;
    id v14 = (id *)v62;
    v62[0] = *((id *)v55 + 4);
    id v13 = (id *)(v11 + 5);
    v62[1] = *((id *)v55 + 5);
    [v12 enrolledBetaProgramForDevice:v10 completion:v11];
    objc_storeStrong(v13, obj);
    objc_storeStrong(v14, obj);
  }
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_777(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = a1;
  dispatch_queue_t queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2_778;
  id v8 = &unk_26483BB58;
  id v9 = a1[4];
  id v10 = location[0];
  v11[0] = a1[5];
  dispatch_async(queue, &v4);

  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSUISoftwareUpdateManager__scanForBetaProgramsWithSeedingDevice___block_invoke_2_778(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id location[2] = (id)a1;
  location[1] = (id)a1;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 85) = 1;
  location[0] = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v6, *(void *)(a1 + 40));
    _os_log_impl(&dword_228401000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "refreshed current beta program: %@", v6, 0xCu);
  }
  objc_storeStrong(location, 0);
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v1 = (id)[*(id *)(a1 + 32) delegate];
    [v1 manager:*(void *)(a1 + 32) didReceiveBetaPrograms:*(void *)(a1 + 48)];
  }
}

- (BOOL)isDeviceBetaEnrolled
{
  return self->_enrolledBetaProgram != 0;
}

- (id)betaUpdatesAppleID
{
  id v3 = (id)[MEMORY[0x263F67CE8] sharedManager];
  id v4 = (id)[v3 seedingAppleIDUsernameForCurrentDevice];

  return v4;
}

- (void)manager:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  char v46 = &v66;
  id obj = a4;
  uint64_t v44 = "-[SUSUISoftwareUpdateManager manager:scanRequestDidStartForOptions:]";
  uint64_t v73 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v70 = 0;
  objc_storeStrong(&v70, obj);
  id v47 = (id)[v70 identifier];
  int v48 = [v47 isEqualToString:@"com.apple.Preferences.software_update"];

  if (v48)
  {
    id v4 = _SUSUILoggingFacility();
    int v5 = (os_log_t *)v46;
    *((void *)v46 + 3) = v4;
    unsigned __int8 v68 = 0;
    if (os_log_type_enabled(v5[3], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = (os_log_t)*((void *)v46 + 3);
      *(_DWORD *)os_log_type_t type = v68;
      id v41 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v46 + 7) + 88));
      id v6 = v41;
      uint64_t v7 = v46;
      uint64_t v42 = (uint64_t)v6;
      *((void *)v46 + 1) = v6;
      int v43 = *(_DWORD *)(*((void *)v7 + 7) + 88);
      LOBYTE(v7) = *(void *)(*((void *)v7 + 7) + 120) == 0;
      char v65 = 0;
      if (v7)
      {
        id v38 = @"N/A";
      }
      else
      {
        id v8 = (__CFString *)(id)[*(id *)(*((void *)v46 + 7) + 120) humanReadableUpdateName];
        *(void *)char v46 = v8;
        char v65 = 1;
        id v38 = v8;
      }
      id v35 = v38;
      uint64_t v36 = *(void *)(*((void *)v46 + 7) + 120);
      uint64_t v37 = *(void *)(*((void *)v46 + 7) + 160);
      BOOL v9 = *(void *)(*((void *)v46 + 7) + 128) == 0;
      char v63 = 0;
      if (v9)
      {
        int v34 = @"N/A";
      }
      else
      {
        os_log_type_t v64 = (__CFString *)(id)[*(id *)(*((void *)v46 + 7) + 128) humanReadableUpdateName];
        char v63 = 1;
        int v34 = v64;
      }
      uint64_t v30 = v34;
      uint64_t v31 = *(void *)(*((void *)v46 + 7) + 128);
      uint64_t v32 = *(void *)(*((void *)v46 + 7) + 168);
      uint64_t v33 = *(void *)(*((void *)v46 + 7) + 8);
      BOOL v10 = *(void *)(*((void *)v46 + 7) + 8) == 0;
      char v61 = 0;
      char v59 = 0;
      char v57 = 0;
      if (v10
        || (id v62 = (id)[*(id *)(*((void *)v46 + 7) + 8) descriptor],
            char v61 = 1,
            !v62))
      {
        int v29 = @"N/A";
      }
      else
      {
        id v60 = (id)[*(id *)(*((void *)v46 + 7) + 8) descriptor];
        int v28 = 1;
        char v59 = 1;
        id v58 = (id)[v60 humanReadableUpdateName];
        char v57 = 1;
        int v29 = (__CFString *)v58;
      }
      id v25 = v29;
      id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v46 + 7) + 104));
      id v27 = objc_loadWeakRetained((id *)(*((void *)v46 + 7) + 104));
      char v55 = 0;
      char v53 = 0;
      if (v27)
      {
        id v56 = objc_loadWeakRetained((id *)(*((void *)v46 + 7) + 104));
        int v23 = 1;
        char v55 = 1;
        id v11 = (objc_class *)objc_opt_class();
        id v54 = NSStringFromClass(v11);
        char v53 = 1;
        id v24 = (__CFString *)v54;
      }
      else
      {
        id v24 = @"N/A";
      }
      id v20 = v24;
      id v21 = objc_loadWeakRetained((id *)(*((void *)v46 + 7) + 112));
      id v22 = objc_loadWeakRetained((id *)(*((void *)v46 + 7) + 112));
      char v51 = 0;
      char v49 = 0;
      if (v22)
      {
        id v52 = objc_loadWeakRetained((id *)(*((void *)v46 + 7) + 112));
        int v18 = 1;
        char v51 = 1;
        id v12 = (objc_class *)objc_opt_class();
        id v50 = NSStringFromClass(v12);
        char v49 = 1;
        id v19 = (__CFString *)v50;
      }
      else
      {
        id v19 = @"N/A";
      }
      os_log_t v16 = &v14;
      buf = v72;
      __os_log_helper_16_2_15_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66((uint64_t)v72, (uint64_t)v44, v42, v43, (uint64_t)v35, v36, v37, (uint64_t)v30, v31, v32, v33, (uint64_t)v25, (uint64_t)WeakRetained, (uint64_t)v20, (uint64_t)v21, (uint64_t)v19);
      _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\n", buf, 0x94u);
      if (v49) {

      }
      if (v51) {
      if (v53)
      }

      if (v55) {
      if (v57)
      }

      if (v59) {
      if (v61)
      }

      if (v63) {
      if (v65)
      }

      objc_storeStrong(&v67, 0);
    }
    objc_storeStrong(&v69, 0);
    id v13 = v46;
    *(unsigned char *)(*((void *)v46 + 7) + 17) = 1;
    if (*(_DWORD *)(*((void *)v13 + 7) + 88) != 1 && (*(unsigned char *)(*((void *)v46 + 7) + 18) & 1) == 0) {
      [*((id *)v46 + 7) setState:1];
    }
  }
  id v15 = 0;
  objc_storeStrong(&v70, 0);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  char v55 = &v73;
  id obj = a4;
  id v53 = a5;
  id v54 = a6;
  char v51 = "-[SUSUISoftwareUpdateManager manager:scanRequestDidFinishForOptions:results:error:]";
  uint64_t v83 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v80 = 0;
  objc_storeStrong(&v80, obj);
  id v79 = 0;
  objc_storeStrong(&v79, v53);
  id v78 = 0;
  objc_storeStrong(&v78, v54);
  id v77 = _SUSUILoggingFacility();
  unsigned __int8 v76 = 0;
  if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v55 + 5);
    *(_DWORD *)os_log_type_t type = v76;
    id v48 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v55 + 11) + 88));
    id v6 = v48;
    uint64_t v7 = v55;
    uint64_t v49 = (uint64_t)v6;
    *((void *)v55 + 3) = v6;
    int v50 = *(_DWORD *)(*((void *)v7 + 11) + 88);
    LOBYTE(v7) = *(void *)(*((void *)v7 + 11) + 120) == 0;
    char v74 = 0;
    if (v7)
    {
      id v45 = @"N/A";
    }
    else
    {
      id v8 = (__CFString *)(id)[*(id *)(*((void *)v55 + 11) + 120) humanReadableUpdateName];
      *((void *)v55 + 2) = v8;
      char v74 = 1;
      id v45 = v8;
    }
    uint64_t v42 = v45;
    uint64_t v43 = *(void *)(*((void *)v55 + 11) + 120);
    uint64_t v44 = *(void *)(*((void *)v55 + 11) + 160);
    BOOL v9 = *(void *)(*((void *)v55 + 11) + 128) == 0;
    char v72 = 0;
    if (v9)
    {
      id v41 = @"N/A";
    }
    else
    {
      BOOL v10 = (__CFString *)(id)[*(id *)(*((void *)v55 + 11) + 128) humanReadableUpdateName];
      *(void *)char v55 = v10;
      char v72 = 1;
      id v41 = v10;
    }
    uint64_t v37 = v41;
    uint64_t v38 = *(void *)(*((void *)v55 + 11) + 128);
    uint64_t v39 = *(void *)(*((void *)v55 + 11) + 168);
    uint64_t v40 = *(void *)(*((void *)v55 + 11) + 8);
    BOOL v11 = *(void *)(*((void *)v55 + 11) + 8) == 0;
    char v70 = 0;
    char v68 = 0;
    char v66 = 0;
    if (v11
      || (id v71 = (id)[*(id *)(*((void *)v55 + 11) + 8) descriptor],
          char v70 = 1,
          !v71))
    {
      uint64_t v36 = @"N/A";
    }
    else
    {
      id v69 = (id)[*(id *)(*((void *)v55 + 11) + 8) descriptor];
      int v35 = 1;
      char v68 = 1;
      id v67 = (id)[v69 humanReadableUpdateName];
      char v66 = 1;
      uint64_t v36 = (__CFString *)v67;
    }
    uint64_t v32 = v36;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v55 + 11) + 104));
    id v34 = objc_loadWeakRetained((id *)(*((void *)v55 + 11) + 104));
    char v64 = 0;
    char v62 = 0;
    if (v34)
    {
      id v65 = objc_loadWeakRetained((id *)(*((void *)v55 + 11) + 104));
      int v30 = 1;
      char v64 = 1;
      id v12 = (objc_class *)objc_opt_class();
      id v63 = NSStringFromClass(v12);
      char v62 = 1;
      uint64_t v31 = (__CFString *)v63;
    }
    else
    {
      uint64_t v31 = @"N/A";
    }
    id v27 = v31;
    id v28 = objc_loadWeakRetained((id *)(*((void *)v55 + 11) + 112));
    id v29 = objc_loadWeakRetained((id *)(*((void *)v55 + 11) + 112));
    char v60 = 0;
    char v58 = 0;
    if (v29)
    {
      id v61 = objc_loadWeakRetained((id *)(*((void *)v55 + 11) + 112));
      int v25 = 1;
      char v60 = 1;
      id v13 = (objc_class *)objc_opt_class();
      id v59 = NSStringFromClass(v13);
      char v58 = 1;
      int v26 = (__CFString *)v59;
    }
    else
    {
      int v26 = @"N/A";
    }
    uint64_t v14 = *((void *)v55 + 8);
    int v23 = &v18;
    buf = v82;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_66((uint64_t)v82, (uint64_t)v51, v49, v50, (uint64_t)v42, v43, v44, (uint64_t)v37, v38, v39, v40, (uint64_t)v32, (uint64_t)WeakRetained, (uint64_t)v27, (uint64_t)v28, (uint64_t)v26, v14);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\noptions: %{public}@", buf, 0x9Eu);
    if (v58) {

    }
    if (v60) {
    if (v62)
    }

    if (v64) {
    if (v66)
    }

    if (v68) {
    if (v70)
    }

    if (v72) {
    if (v74)
    }

    objc_storeStrong(&v75, 0);
  }
  objc_storeStrong(&v77, 0);
  BOOL v15 = ([*((id *)v55 + 8) isForced] & 1) != 0;
  char v56 = 0;
  int v22 = 0;
  if (!v15)
  {
    id v57 = (id)[*((id *)v55 + 8) types];
    char v56 = 1;
    BOOL v16 = [v57 count] != 1;
    int v21 = 0;
    if (!v16) {
      int v21 = [*((id *)v55 + 8) containsType:3];
    }
    int v22 = v21 ^ 1;
  }
  int v20 = v22;
  if (v56) {

  }
  if (v20)
  {
    id v17 = (id *)v55;
    *(unsigned char *)(*((void *)v55 + 11) + 17) = 1;
    [v17[11] scanFinishedWithUpdates:v17[7] options:v17[8] andError:v17[6]];
  }
  id v19 = 0;
  objc_storeStrong(&v78, 0);
  objc_storeStrong(&v79, v19);
  objc_storeStrong(&v80, v19);
  objc_storeStrong(location, v19);
}

- (void)manager:(id)a3 downloadDidStart:(id)a4
{
  uint64_t v49 = &v67;
  id obj = a4;
  id v47 = "-[SUSUISoftwareUpdateManager manager:downloadDidStart:]";
  uint64_t v75 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v72 = 0;
  objc_storeStrong(&v72, obj);
  id v71 = _SUSUILoggingFacility();
  unsigned __int8 v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v49 + 5);
    *(_DWORD *)os_log_type_t type = v70;
    id v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v49 + 9) + 88));
    id v4 = v44;
    int v5 = v49;
    uint64_t v45 = (uint64_t)v4;
    *((void *)v49 + 3) = v4;
    int v46 = *(_DWORD *)(*((void *)v5 + 9) + 88);
    LOBYTE(v5) = *(void *)(*((void *)v5 + 9) + 120) == 0;
    char v68 = 0;
    if (v5)
    {
      id v41 = @"N/A";
    }
    else
    {
      id v6 = (__CFString *)(id)[*(id *)(*((void *)v49 + 9) + 120) humanReadableUpdateName];
      *((void *)v49 + 2) = v6;
      char v68 = 1;
      id v41 = v6;
    }
    uint64_t v38 = v41;
    uint64_t v39 = *(void *)(*((void *)v49 + 9) + 120);
    uint64_t v40 = *(void *)(*((void *)v49 + 9) + 160);
    BOOL v7 = *(void *)(*((void *)v49 + 9) + 128) == 0;
    char v66 = 0;
    if (v7)
    {
      uint64_t v37 = @"N/A";
    }
    else
    {
      id v8 = (__CFString *)(id)[*(id *)(*((void *)v49 + 9) + 128) humanReadableUpdateName];
      *(void *)uint64_t v49 = v8;
      char v66 = 1;
      uint64_t v37 = v8;
    }
    uint64_t v33 = v37;
    uint64_t v34 = *(void *)(*((void *)v49 + 9) + 128);
    uint64_t v35 = *(void *)(*((void *)v49 + 9) + 168);
    uint64_t v36 = *(void *)(*((void *)v49 + 9) + 8);
    BOOL v9 = *(void *)(*((void *)v49 + 9) + 8) == 0;
    char v64 = 0;
    char v62 = 0;
    char v60 = 0;
    if (v9
      || (id v65 = (id)[*(id *)(*((void *)v49 + 9) + 8) descriptor],
          char v64 = 1,
          !v65))
    {
      uint64_t v32 = @"N/A";
    }
    else
    {
      id v63 = (id)[*(id *)(*((void *)v49 + 9) + 8) descriptor];
      int v31 = 1;
      char v62 = 1;
      id v61 = (id)[v63 humanReadableUpdateName];
      char v60 = 1;
      uint64_t v32 = (__CFString *)v61;
    }
    id v28 = v32;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v49 + 9) + 104));
    id v30 = objc_loadWeakRetained((id *)(*((void *)v49 + 9) + 104));
    char v58 = 0;
    char v56 = 0;
    if (v30)
    {
      id v59 = objc_loadWeakRetained((id *)(*((void *)v49 + 9) + 104));
      int v26 = 1;
      char v58 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v57 = NSStringFromClass(v10);
      char v56 = 1;
      id v27 = (__CFString *)v57;
    }
    else
    {
      id v27 = @"N/A";
    }
    int v23 = v27;
    id v24 = objc_loadWeakRetained((id *)(*((void *)v49 + 9) + 112));
    id v25 = objc_loadWeakRetained((id *)(*((void *)v49 + 9) + 112));
    char v54 = 0;
    char v52 = 0;
    if (v25)
    {
      id v55 = objc_loadWeakRetained((id *)(*((void *)v49 + 9) + 112));
      int v21 = 1;
      char v54 = 1;
      BOOL v11 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v11);
      char v52 = 1;
      int v22 = (__CFString *)v53;
    }
    else
    {
      int v22 = @"N/A";
    }
    uint64_t v12 = *((void *)v49 + 6);
    id v19 = &v13;
    buf = v74;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v74, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, v12);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nStarting to download: %@", buf, 0x9Eu);
    if (v52) {

    }
    if (v54) {
    if (v56)
    }

    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    if (v66) {
    if (v68)
    }

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  [*((id *)v49 + 9) setDownload:*((void *)v49 + 6)];
  [*((id *)v49 + 9) updateStateFromDownload:*((void *)v49 + 6)];
  id v17 = (id)[*((id *)v49 + 9) delegate];
  char v50 = 0;
  int v18 = 0;
  if (v17)
  {
    id v51 = (id)[*((id *)v49 + 9) delegate];
    char v50 = 1;
    int v18 = objc_opt_respondsToSelector();
  }
  int v16 = v18;
  if (v50) {

  }
  if (v16)
  {
    id v15 = (id)[*((id *)v49 + 9) delegate];
    [v15 manager:*((void *)v49 + 9) downloadDidStart:*((void *)v49 + 6)];
  }
  id v14 = 0;
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, v14);
}

- (void)manager:(id)a3 downloadProgressDidChange:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  [(SUSUISoftwareUpdateManager *)v25 setDownload:v23];
  id v22 = (id)[v23 progress];
  [v22 normalizedPercentComplete];
  float v21 = v4;
  id v20 = (id)[v22 phase];
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = oslog;
    os_log_type_t v13 = type;
    *(double *)&uint64_t v8 = v21;
    id v9 = v20;
    id v14 = SUSUISoftwareUpdateStateToString([(SUSUISoftwareUpdateManager *)v25 state]);
    BOOL v10 = v14;
    id v17 = v10;
    int v11 = [(SUSUISoftwareUpdateManager *)v25 state];
    [v22 timeRemaining];
    __os_log_helper_16_2_7_8_32_8_0_8_64_8_64_4_0_8_0_8_0((uint64_t)v26, (uint64_t)"-[SUSUISoftwareUpdateManager manager:downloadProgressDidChange:]", v8, (uint64_t)v9, (uint64_t)v10, v11, v5, (uint64_t)v23);
    _os_log_impl(&dword_228401000, log, v13, "%s - progress: %.02f; phase: %@; state: %@ (%d); time remaining: %f, download: %p",
      v26,
      0x44u);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  unsigned int state = 0;
  unsigned int state = v25->_state;
  [(SUSUISoftwareUpdateManager *)v25 _updateDownloadProgressWithDownload:v23 stateFromDownload:&state];
  id v6 = (id)[v23 progress];
  BOOL v7 = 0;
  if ([v6 isDone])
  {
    BOOL v7 = 0;
    if (v25->_state == state) {
      BOOL v7 = state == 10;
    }
  }

  if (v7) {
    [(SUSUISoftwareUpdateManager *)v25 checkAndSetReadyToInstall];
  }
  else {
    [(SUSUISoftwareUpdateManager *)v25 setState:state];
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  uint64_t v49 = &v67;
  id obj = a4;
  id v48 = a5;
  int v46 = "-[SUSUISoftwareUpdateManager manager:downloadDidFinish:withInstallPolicy:]";
  uint64_t v75 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v72 = 0;
  objc_storeStrong(&v72, obj);
  id v71 = 0;
  objc_storeStrong(&v71, v48);
  id v70 = _SUSUILoggingFacility();
  unsigned __int8 v69 = 0;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v49 + 3);
    *(_DWORD *)os_log_type_t type = v69;
    id v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v49 + 8) + 88));
    id v5 = v43;
    id v6 = v49;
    uint64_t v44 = (uint64_t)v5;
    *((void *)v49 + 1) = v5;
    int v45 = *(_DWORD *)(*((void *)v6 + 8) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 8) + 120) == 0;
    char v66 = 0;
    if (v6)
    {
      uint64_t v40 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*(id *)(*((void *)v49 + 8) + 120) humanReadableUpdateName];
      *(void *)uint64_t v49 = v7;
      char v66 = 1;
      uint64_t v40 = v7;
    }
    uint64_t v37 = v40;
    uint64_t v38 = *(void *)(*((void *)v49 + 8) + 120);
    uint64_t v39 = *(void *)(*((void *)v49 + 8) + 160);
    BOOL v8 = *(void *)(*((void *)v49 + 8) + 128) == 0;
    char v64 = 0;
    if (v8)
    {
      uint64_t v36 = @"N/A";
    }
    else
    {
      id v65 = (id)[*(id *)(*((void *)v49 + 8) + 128) humanReadableUpdateName];
      char v64 = 1;
      uint64_t v36 = (__CFString *)v65;
    }
    uint64_t v32 = v36;
    uint64_t v33 = *(void *)(*((void *)v49 + 8) + 128);
    uint64_t v34 = *(void *)(*((void *)v49 + 8) + 168);
    uint64_t v35 = *(void *)(*((void *)v49 + 8) + 8);
    BOOL v9 = *(void *)(*((void *)v49 + 8) + 8) == 0;
    char v62 = 0;
    char v60 = 0;
    char v58 = 0;
    if (v9
      || (id v63 = (id)[*(id *)(*((void *)v49 + 8) + 8) descriptor],
          char v62 = 1,
          !v63))
    {
      int v31 = @"N/A";
    }
    else
    {
      id v61 = (id)[*(id *)(*((void *)v49 + 8) + 8) descriptor];
      int v30 = 1;
      char v60 = 1;
      id v59 = (id)[v61 humanReadableUpdateName];
      char v58 = 1;
      int v31 = (__CFString *)v59;
    }
    uint64_t v27 = v31;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
    id v29 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
    char v56 = 0;
    char v54 = 0;
    if (v29)
    {
      id v57 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
      int v25 = 1;
      char v56 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v55 = NSStringFromClass(v10);
      char v54 = 1;
      int v26 = (__CFString *)v55;
    }
    else
    {
      int v26 = @"N/A";
    }
    id v22 = v26;
    id v23 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 112));
    id v24 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 112));
    char v52 = 0;
    char v50 = 0;
    if (v24)
    {
      id v53 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 112));
      int v20 = 1;
      char v52 = 1;
      int v11 = (objc_class *)objc_opt_class();
      id v51 = NSStringFromClass(v11);
      char v50 = 1;
      float v21 = (__CFString *)v51;
    }
    else
    {
      float v21 = @"N/A";
    }
    uint64_t v12 = *((void *)v49 + 5);
    int v18 = &v13;
    buf = v74;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v74, (uint64_t)v46, v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v12);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nFinished to download: %@", buf, 0x9Eu);
    if (v50) {

    }
    if (v52) {
    if (v54)
    }

    if (v56) {
    if (v58)
    }

    if (v60) {
    if (v62)
    }

    if (v64) {
    if (v66)
    }

    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(&v70, 0);
  [*((id *)v49 + 8) setDownload:*((void *)v49 + 5)];
  [*((id *)v49 + 8) setInstallPolicy:*((void *)v49 + 4)];
  [*((id *)v49 + 8) checkAndSetReadyToInstall];
  id v16 = (id)[*((id *)v49 + 8) delegate];
  int v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v15 = (id)[*((id *)v49 + 8) delegate];
    [v15 manager:*((void *)v49 + 8) downloadFinished:*((void *)v49 + 5)];
  }
  id v14 = 0;
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, v14);
  objc_storeStrong(location, v14);
}

- (void)manager:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4
{
  id obj = a4;
  uint64_t v40 = "-[SUSUISoftwareUpdateManager manager:downloadWasInvalidatedForNewUpdatesAvailable:]";
  uint64_t v68 = *MEMORY[0x263EF8340];
  char v66 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v64 = 0;
  objc_storeStrong(&v64, obj);
  id v63 = _SUSUILoggingFacility();
  unsigned __int8 v62 = 0;
  if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)v63;
    *(_DWORD *)os_log_type_t type = v62;
    id v37 = SUSUISoftwareUpdateStateToString(v66->_state);
    id v38 = v37;
    id v61 = v38;
    int state = v66->_state;
    BOOL v4 = v66->_preferredUpdate == 0;
    char v59 = 0;
    if (v4)
    {
      uint64_t v34 = @"N/A";
    }
    else
    {
      char v60 = (__CFString *)(id)[(SUDescriptor *)v66->_preferredUpdate humanReadableUpdateName];
      char v59 = 1;
      uint64_t v34 = v60;
    }
    int v31 = v34;
    uint64_t preferredUpdate = v66->_preferredUpdate;
    preferredUpdateError = v66->_preferredUpdateError;
    BOOL v5 = v66->_alternateUpdate == 0;
    char v57 = 0;
    if (v5)
    {
      int v30 = @"N/A";
    }
    else
    {
      id v58 = (id)[(SUDescriptor *)v66->_alternateUpdate humanReadableUpdateName];
      char v57 = 1;
      int v30 = (__CFString *)v58;
    }
    int v26 = v30;
    uint64_t alternateUpdate = v66->_alternateUpdate;
    alternateUpdateError = v66->_alternateUpdateError;
    uint64_t download = v66->_download;
    BOOL v6 = v66->_download == 0;
    char v55 = 0;
    char v53 = 0;
    char v51 = 0;
    if (v6
      || (v56 = [(SUDownload *)v66->_download descriptor], char v55 = 1, !v56))
    {
      int v25 = @"N/A";
    }
    else
    {
      id v54 = [(SUDownload *)v66->_download descriptor];
      int v24 = 1;
      char v53 = 1;
      id v52 = (id)[v54 humanReadableUpdateName];
      char v51 = 1;
      int v25 = (__CFString *)v52;
    }
    float v21 = v25;
    id WeakRetained = objc_loadWeakRetained((id *)&v66->_delegate);
    id v23 = objc_loadWeakRetained((id *)&v66->_delegate);
    char v49 = 0;
    char v47 = 0;
    if (v23)
    {
      id v50 = objc_loadWeakRetained((id *)&v66->_delegate);
      int v19 = 1;
      char v49 = 1;
      BOOL v7 = (objc_class *)objc_opt_class();
      id v48 = NSStringFromClass(v7);
      char v47 = 1;
      int v20 = (__CFString *)v48;
    }
    else
    {
      int v20 = @"N/A";
    }
    id v16 = v20;
    id v17 = objc_loadWeakRetained((id *)&v66->_hostController);
    id v18 = objc_loadWeakRetained((id *)&v66->_hostController);
    char v45 = 0;
    char v43 = 0;
    if (v18)
    {
      id v46 = objc_loadWeakRetained((id *)&v66->_hostController);
      int v14 = 1;
      char v45 = 1;
      BOOL v8 = (objc_class *)objc_opt_class();
      id v44 = NSStringFromClass(v8);
      char v43 = 1;
      id v15 = (__CFString *)v44;
    }
    else
    {
      id v15 = @"N/A";
    }
    uint64_t v12 = &v9;
    buf = v67;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0((uint64_t)v67, (uint64_t)v40, (uint64_t)v38, state, (uint64_t)v31, (uint64_t)preferredUpdate, (uint64_t)preferredUpdateError, (uint64_t)v26, (uint64_t)alternateUpdate, (uint64_t)alternateUpdateError, (uint64_t)download, (uint64_t)v21, (uint64_t)WeakRetained, (uint64_t)v16, (uint64_t)v17, (uint64_t)v15, (uint64_t)v64);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nNew scan results: %p", buf, 0x9Eu);
    if (v43) {

    }
    if (v45) {
    if (v47)
    }

    if (v49) {
    if (v51)
    }

    if (v53) {
    if (v55)
    }

    if (v57) {
    if (v59)
    }

    objc_storeStrong(&v61, 0);
  }
  uint64_t v11 = 0;
  objc_storeStrong(&v63, 0);
  [(SUSUISoftwareUpdateManager *)v66 setDownload:v11];
  unsigned int v42 = 8;
  if (v66->_hidingPreferredUpdate)
  {
    unsigned int v42 = 9;
    [(SUSUISoftwareUpdateManager *)v66 revealHiddenPreferredUpdate];
  }
  if (v66->_hidingAlternateUpdate)
  {
    unsigned int v42 = 9;
    [(SUSUISoftwareUpdateManager *)v66 revealHiddenAlteranteUpdate];
  }
  [(SUSUISoftwareUpdateManager *)v66 setState:v42];
  id v10 = 0;
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, v10);
}

- (void)manager:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v65 = &v85;
  id obj = a4;
  id v64 = a5;
  unsigned __int8 v62 = "-[SUSUISoftwareUpdateManager manager:downloadDidFail:withError:]";
  uint64_t v97 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v93 = 0;
  objc_storeStrong(&v93, obj);
  id v92 = 0;
  objc_storeStrong(&v92, v64);
  id v91 = _SUSUILoggingFacility();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v91, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v65 + 9);
    *(_DWORD *)id v58 = type;
    id v59 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v65 + 14) + 88));
    id v5 = v59;
    BOOL v6 = v65;
    uint64_t v60 = (uint64_t)v5;
    *((void *)v65 + 7) = v5;
    int v61 = *(_DWORD *)(*((void *)v6 + 14) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 14) + 120) == 0;
    char v88 = 0;
    if (v6)
    {
      id v56 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*(id *)(*((void *)v65 + 14) + 120) humanReadableUpdateName];
      *((void *)v65 + 6) = v7;
      char v88 = 1;
      id v56 = v7;
    }
    char v53 = v56;
    uint64_t v54 = *(void *)(*((void *)v65 + 14) + 120);
    uint64_t v55 = *(void *)(*((void *)v65 + 14) + 160);
    BOOL v8 = *(void *)(*((void *)v65 + 14) + 128) == 0;
    char v87 = 0;
    if (v8)
    {
      id v52 = @"N/A";
    }
    else
    {
      uint64_t v9 = (__CFString *)(id)[*(id *)(*((void *)v65 + 14) + 128) humanReadableUpdateName];
      *((void *)v65 + 4) = v9;
      char v87 = 1;
      id v52 = v9;
    }
    id v48 = v52;
    uint64_t v49 = *(void *)(*((void *)v65 + 14) + 128);
    uint64_t v50 = *(void *)(*((void *)v65 + 14) + 168);
    uint64_t v51 = *(void *)(*((void *)v65 + 14) + 8);
    BOOL v10 = *(void *)(*((void *)v65 + 14) + 8) == 0;
    char v86 = 0;
    char v84 = 0;
    char v82 = 0;
    if (v10
      || (id v11 = (id)[*(id *)(*((void *)v65 + 14) + 8) descriptor],
          *((void *)v65 + 2) = v11,
          char v86 = 1,
          !v11))
    {
      char v47 = @"N/A";
    }
    else
    {
      id v12 = (id)[*(id *)(*((void *)v65 + 14) + 8) descriptor];
      *(void *)id v65 = v12;
      int v46 = 1;
      char v84 = 1;
      id v83 = (id)[v12 humanReadableUpdateName];
      char v82 = 1;
      char v47 = (__CFString *)v83;
    }
    char v43 = v47;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v65 + 14) + 104));
    id v45 = objc_loadWeakRetained((id *)(*((void *)v65 + 14) + 104));
    char v80 = 0;
    char v78 = 0;
    if (v45)
    {
      id v81 = objc_loadWeakRetained((id *)(*((void *)v65 + 14) + 104));
      int v41 = 1;
      char v80 = 1;
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v79 = NSStringFromClass(v13);
      char v78 = 1;
      unsigned int v42 = (__CFString *)v79;
    }
    else
    {
      unsigned int v42 = @"N/A";
    }
    id v38 = v42;
    id v39 = objc_loadWeakRetained((id *)(*((void *)v65 + 14) + 112));
    id v40 = objc_loadWeakRetained((id *)(*((void *)v65 + 14) + 112));
    char v76 = 0;
    char v74 = 0;
    if (v40)
    {
      id v77 = objc_loadWeakRetained((id *)(*((void *)v65 + 14) + 112));
      int v36 = 1;
      char v76 = 1;
      int v14 = (objc_class *)objc_opt_class();
      id v75 = NSStringFromClass(v14);
      char v74 = 1;
      id v37 = (__CFString *)v75;
    }
    else
    {
      id v37 = @"N/A";
    }
    uint64_t v15 = *((void *)v65 + 10);
    uint64_t v34 = &v19;
    buf = v96;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v96, (uint64_t)v62, v60, v61, (uint64_t)v53, v54, v55, (uint64_t)v48, v49, v50, v51, (uint64_t)v43, (uint64_t)WeakRetained, (uint64_t)v38, (uint64_t)v39, (uint64_t)v37, v15);
    _os_log_impl(&dword_228401000, log, v58[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nDownload failed with error: %@", buf, 0x9Eu);
    if (v74) {

    }
    if (v76) {
    if (v78)
    }

    if (v80) {
    if (v82)
    }

    if (v84) {
    if (v86)
    }

    if (v87) {
    if (v88)
    }

    objc_storeStrong(&v89, 0);
  }
  uint64_t v33 = 0;
  objc_storeStrong(&v91, 0);
  char v73 = 0;
  [*((id *)v65 + 14) setDownload:v33];
  [*(id *)(*((void *)v65 + 14) + 96) destroyInstallationKeybag];
  if (*(unsigned char *)(*((void *)v65 + 14) + 54))
  {
    char v73 = 1;
    [*((id *)v65 + 14) revealHiddenPreferredUpdate];
  }
  if (*(unsigned char *)(*((void *)v65 + 14) + 55))
  {
    char v73 = 1;
    [*((id *)v65 + 14) revealHiddenAlteranteUpdate];
  }
  id v30 = (id)[*((id *)v65 + 10) domain];
  id v31 = getSUErrorDomain_3();
  char v16 = objc_msgSend(v30, "isEqualToString:");
  char v71 = 0;
  char v69 = 0;
  int v32 = 0;
  if (v16)
  {
    BOOL v17 = [*((id *)v65 + 10) code] != 16;
    int v32 = 0;
    if (!v17)
    {
      id v72 = (id)[*((id *)v65 + 10) userInfo];
      int v29 = 1;
      char v71 = 1;
      id v70 = (id)[v72 objectForKey:*MEMORY[0x263F784B0]];
      char v69 = v29 & 1;
      int v32 = [v70 BOOLValue];
    }
  }
  int v28 = v32;
  if (v69) {

  }
  if (v71) {
  if (v28)
  }
  {
    unsigned int v68 = 0;
    if ([*((id *)v65 + 14) shouldShowPreferredUpdateAsAlternate])
    {
      unsigned int v68 = 6;
    }
    else
    {
      if (v73) {
        int v18 = 9;
      }
      else {
        int v18 = 8;
      }
      unsigned int v68 = v18;
    }
    [*((id *)v65 + 14) setState:v68];
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t v25 = oslog;
      *(_DWORD *)int v26 = v66;
      uint64_t v27 = v95;
      __os_log_helper_16_2_1_8_32((uint64_t)v95, (uint64_t)v62);
      _os_log_impl(&dword_228401000, v25, v26[0], "%s: Rescanning for update", v27, 0xCu);
    }
    uint64_t v24 = 0;
    objc_storeStrong((id *)&oslog, 0);
    [*((id *)v65 + 14) scanForUpdatesCompletion:v24];
  }
  id v22 = (id)[*((id *)v65 + 14) delegate];
  int v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v21 = (id)[*((id *)v65 + 14) delegate];
    [v21 manager:*((void *)v65 + 14) download:*((void *)v65 + 11) failedWithError:*((void *)v65 + 10)];
  }
  id v20 = 0;
  objc_storeStrong(&v92, 0);
  objc_storeStrong(&v93, v20);
  objc_storeStrong(location, v20);
}

- (void)manager:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5
{
  uint64_t v50 = &v68;
  id obj = a4;
  BOOL v49 = a5;
  char v47 = "-[SUSUISoftwareUpdateManager manager:clearingSpaceForDownload:clearingSpace:]";
  uint64_t v76 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v73 = 0;
  objc_storeStrong(&v73, obj);
  BOOL v72 = v49;
  id v71 = _SUSUILoggingFacility();
  unsigned __int8 v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v50 + 3);
    *(_DWORD *)os_log_type_t type = v70;
    id v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v50 + 8) + 88));
    id v5 = v44;
    BOOL v6 = v50;
    uint64_t v45 = (uint64_t)v5;
    *((void *)v50 + 1) = v5;
    int v46 = *(_DWORD *)(*((void *)v6 + 8) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 8) + 120) == 0;
    char v67 = 0;
    if (v6)
    {
      int v41 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*(id *)(*((void *)v50 + 8) + 120) humanReadableUpdateName];
      *(void *)uint64_t v50 = v7;
      char v67 = 1;
      int v41 = v7;
    }
    id v38 = v41;
    uint64_t v39 = *(void *)(*((void *)v50 + 8) + 120);
    uint64_t v40 = *(void *)(*((void *)v50 + 8) + 160);
    BOOL v8 = *(void *)(*((void *)v50 + 8) + 128) == 0;
    char v65 = 0;
    if (v8)
    {
      id v37 = @"N/A";
    }
    else
    {
      id v66 = (id)[*(id *)(*((void *)v50 + 8) + 128) humanReadableUpdateName];
      char v65 = 1;
      id v37 = (__CFString *)v66;
    }
    uint64_t v33 = v37;
    uint64_t v34 = *(void *)(*((void *)v50 + 8) + 128);
    uint64_t v35 = *(void *)(*((void *)v50 + 8) + 168);
    uint64_t v36 = *(void *)(*((void *)v50 + 8) + 8);
    BOOL v9 = *(void *)(*((void *)v50 + 8) + 8) == 0;
    char v63 = 0;
    char v61 = 0;
    char v59 = 0;
    if (v9
      || (id v64 = (id)[*(id *)(*((void *)v50 + 8) + 8) descriptor],
          char v63 = 1,
          !v64))
    {
      int v32 = @"N/A";
    }
    else
    {
      id v62 = (id)[*(id *)(*((void *)v50 + 8) + 8) descriptor];
      int v31 = 1;
      char v61 = 1;
      id v60 = (id)[v62 humanReadableUpdateName];
      char v59 = 1;
      int v32 = (__CFString *)v60;
    }
    int v28 = v32;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    id v30 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    char v57 = 0;
    char v55 = 0;
    if (v30)
    {
      id v58 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
      int v26 = 1;
      char v57 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v56 = NSStringFromClass(v10);
      char v55 = 1;
      uint64_t v27 = (__CFString *)v56;
    }
    else
    {
      uint64_t v27 = @"N/A";
    }
    int v23 = v27;
    id v24 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
    id v25 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
    char v53 = 0;
    char v51 = 0;
    if (v25)
    {
      id v54 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
      int v21 = 1;
      char v53 = 1;
      id v11 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v11);
      char v51 = 1;
      id v22 = (__CFString *)v52;
    }
    else
    {
      id v22 = @"N/A";
    }
    id v12 = @"YES";
    if (!v72) {
      id v12 = @"NO";
    }
    uint64_t v19 = &v14;
    buf = v75;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v75, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, (uint64_t)v12);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nclearing: %@", buf, 0x9Eu);
    if (v51) {

    }
    if (v53) {
    if (v55)
    }

    if (v57) {
    if (v59)
    }

    if (v61) {
    if (v63)
    }

    if (v65) {
    if (v67)
    }

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  char v13 = [*((id *)v50 + 8) clearingSpaceForDownload];
  if ((v13 & 1) != v72)
  {
    [*((id *)v50 + 8) setClearingSpaceForDownload:v72];
    id v17 = (id)[*((id *)v50 + 8) delegate];
    int v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v16 = (id)[*((id *)v50 + 8) delegate];
      [v16 manager:*((void *)v50 + 8) clearingSpaceForDownload:v72];
    }
  }
  id v15 = 0;
  objc_storeStrong(&v73, 0);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 installDidStart:(id)a4
{
  char v47 = &v65;
  id obj = a4;
  uint64_t v45 = "-[SUSUISoftwareUpdateManager manager:installDidStart:]";
  uint64_t v72 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v69 = 0;
  objc_storeStrong(&v69, obj);
  id v68 = _SUSUILoggingFacility();
  unsigned __int8 v67 = 0;
  if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v47 + 3);
    *(_DWORD *)os_log_type_t type = v67;
    id v42 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v47 + 7) + 88));
    id v4 = v42;
    id v5 = v47;
    uint64_t v43 = (uint64_t)v4;
    *((void *)v47 + 1) = v4;
    int v44 = *(_DWORD *)(*((void *)v5 + 7) + 88);
    LOBYTE(v5) = *(void *)(*((void *)v5 + 7) + 120) == 0;
    char v64 = 0;
    if (v5)
    {
      uint64_t v39 = @"N/A";
    }
    else
    {
      BOOL v6 = (__CFString *)(id)[*(id *)(*((void *)v47 + 7) + 120) humanReadableUpdateName];
      *(void *)char v47 = v6;
      char v64 = 1;
      uint64_t v39 = v6;
    }
    uint64_t v36 = v39;
    uint64_t v37 = *(void *)(*((void *)v47 + 7) + 120);
    uint64_t v38 = *(void *)(*((void *)v47 + 7) + 160);
    BOOL v7 = *(void *)(*((void *)v47 + 7) + 128) == 0;
    char v62 = 0;
    if (v7)
    {
      uint64_t v35 = @"N/A";
    }
    else
    {
      id v63 = (id)[*(id *)(*((void *)v47 + 7) + 128) humanReadableUpdateName];
      char v62 = 1;
      uint64_t v35 = (__CFString *)v63;
    }
    int v31 = v35;
    uint64_t v32 = *(void *)(*((void *)v47 + 7) + 128);
    uint64_t v33 = *(void *)(*((void *)v47 + 7) + 168);
    uint64_t v34 = *(void *)(*((void *)v47 + 7) + 8);
    BOOL v8 = *(void *)(*((void *)v47 + 7) + 8) == 0;
    char v60 = 0;
    char v58 = 0;
    char v56 = 0;
    if (v8
      || (id v61 = (id)[*(id *)(*((void *)v47 + 7) + 8) descriptor],
          char v60 = 1,
          !v61))
    {
      id v30 = @"N/A";
    }
    else
    {
      id v59 = (id)[*(id *)(*((void *)v47 + 7) + 8) descriptor];
      int v29 = 1;
      char v58 = 1;
      id v57 = (id)[v59 humanReadableUpdateName];
      char v56 = 1;
      id v30 = (__CFString *)v57;
    }
    int v26 = v30;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 104));
    id v28 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 104));
    char v54 = 0;
    char v52 = 0;
    if (v28)
    {
      id v55 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 104));
      int v24 = 1;
      char v54 = 1;
      BOOL v9 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v9);
      char v52 = 1;
      id v25 = (__CFString *)v53;
    }
    else
    {
      id v25 = @"N/A";
    }
    int v21 = v25;
    id v22 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 112));
    id v23 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 112));
    char v50 = 0;
    char v48 = 0;
    if (v23)
    {
      id v51 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 112));
      int v19 = 1;
      char v50 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v10);
      char v48 = 1;
      id v20 = (__CFString *)v49;
    }
    else
    {
      id v20 = @"N/A";
    }
    uint64_t v11 = *((void *)v47 + 4);
    id v17 = &v12;
    buf = v71;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v71, (uint64_t)v45, v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20, v11);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdate: %@", buf, 0x9Eu);
    if (v48) {

    }
    if (v50) {
    if (v52)
    }

    if (v54) {
    if (v56)
    }

    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&v68, 0);
  [*((id *)v47 + 7) setState:15];
  id v15 = (id)[*((id *)v47 + 7) delegate];
  int v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v14 = (id)[*((id *)v47 + 7) delegate];
    [v14 manager:*((void *)v47 + 7) installStartedForUpdate:*((void *)v47 + 4)];
  }
  id v13 = 0;
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, v13);
}

- (void)manager:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  char v50 = &v68;
  id obj = a4;
  id v49 = a5;
  char v47 = "-[SUSUISoftwareUpdateManager manager:installDidFail:withError:]";
  uint64_t v76 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v73 = 0;
  objc_storeStrong(&v73, obj);
  id v72 = 0;
  objc_storeStrong(&v72, v49);
  id v71 = _SUSUILoggingFacility();
  unsigned __int8 v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v50 + 3);
    *(_DWORD *)os_log_type_t type = v70;
    id v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v50 + 8) + 88));
    id v5 = v44;
    BOOL v6 = v50;
    uint64_t v45 = (uint64_t)v5;
    *((void *)v50 + 1) = v5;
    int v46 = *(_DWORD *)(*((void *)v6 + 8) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 8) + 120) == 0;
    char v67 = 0;
    if (v6)
    {
      int v41 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*(id *)(*((void *)v50 + 8) + 120) humanReadableUpdateName];
      *(void *)char v50 = v7;
      char v67 = 1;
      int v41 = v7;
    }
    uint64_t v38 = v41;
    uint64_t v39 = *(void *)(*((void *)v50 + 8) + 120);
    uint64_t v40 = *(void *)(*((void *)v50 + 8) + 160);
    BOOL v8 = *(void *)(*((void *)v50 + 8) + 128) == 0;
    char v65 = 0;
    if (v8)
    {
      uint64_t v37 = @"N/A";
    }
    else
    {
      id v66 = (id)[*(id *)(*((void *)v50 + 8) + 128) humanReadableUpdateName];
      char v65 = 1;
      uint64_t v37 = (__CFString *)v66;
    }
    uint64_t v33 = v37;
    uint64_t v34 = *(void *)(*((void *)v50 + 8) + 128);
    uint64_t v35 = *(void *)(*((void *)v50 + 8) + 168);
    uint64_t v36 = *(void *)(*((void *)v50 + 8) + 8);
    BOOL v9 = *(void *)(*((void *)v50 + 8) + 8) == 0;
    char v63 = 0;
    char v61 = 0;
    char v59 = 0;
    if (v9
      || (id v64 = (id)[*(id *)(*((void *)v50 + 8) + 8) descriptor],
          char v63 = 1,
          !v64))
    {
      uint64_t v32 = @"N/A";
    }
    else
    {
      id v62 = (id)[*(id *)(*((void *)v50 + 8) + 8) descriptor];
      int v31 = 1;
      char v61 = 1;
      id v60 = (id)[v62 humanReadableUpdateName];
      char v59 = 1;
      uint64_t v32 = (__CFString *)v60;
    }
    id v28 = v32;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    id v30 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    char v57 = 0;
    char v55 = 0;
    if (v30)
    {
      id v58 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
      int v26 = 1;
      char v57 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v56 = NSStringFromClass(v10);
      char v55 = 1;
      uint64_t v27 = (__CFString *)v56;
    }
    else
    {
      uint64_t v27 = @"N/A";
    }
    id v23 = v27;
    id v24 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
    id v25 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
    char v53 = 0;
    char v51 = 0;
    if (v25)
    {
      id v54 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
      int v21 = 1;
      char v53 = 1;
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v11);
      char v51 = 1;
      id v22 = (__CFString *)v52;
    }
    else
    {
      id v22 = @"N/A";
    }
    uint64_t v12 = *((void *)v50 + 5);
    uint64_t v13 = *((void *)v50 + 4);
    int v19 = &v14;
    buf = v75;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v75, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, v12, v13);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdate: %@, error: %@", buf, 0xA8u);
    if (v51) {

    }
    if (v53) {
    if (v55)
    }

    if (v57) {
    if (v59)
    }

    if (v61) {
    if (v63)
    }

    if (v65) {
    if (v67)
    }

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  id v17 = (id)[*((id *)v50 + 8) delegate];
  int v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v16 = (id)[*((id *)v50 + 8) delegate];
    [v16 manager:*((void *)v50 + 8) installFailedWithError:*((void *)v50 + 4)];
  }
  [*((id *)v50 + 8) refreshState];
  id v15 = 0;
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, v15);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 installDidFinish:(id)a4
{
  char v47 = &v65;
  id obj = a4;
  uint64_t v45 = "-[SUSUISoftwareUpdateManager manager:installDidFinish:]";
  uint64_t v72 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v69 = 0;
  objc_storeStrong(&v69, obj);
  id v68 = _SUSUILoggingFacility();
  unsigned __int8 v67 = 0;
  if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v47 + 3);
    *(_DWORD *)os_log_type_t type = v67;
    id v42 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v47 + 7) + 88));
    id v4 = v42;
    id v5 = v47;
    uint64_t v43 = (uint64_t)v4;
    *((void *)v47 + 1) = v4;
    int v44 = *(_DWORD *)(*((void *)v5 + 7) + 88);
    LOBYTE(v5) = *(void *)(*((void *)v5 + 7) + 120) == 0;
    char v64 = 0;
    if (v5)
    {
      uint64_t v39 = @"N/A";
    }
    else
    {
      BOOL v6 = (__CFString *)(id)[*(id *)(*((void *)v47 + 7) + 120) humanReadableUpdateName];
      *(void *)char v47 = v6;
      char v64 = 1;
      uint64_t v39 = v6;
    }
    uint64_t v36 = v39;
    uint64_t v37 = *(void *)(*((void *)v47 + 7) + 120);
    uint64_t v38 = *(void *)(*((void *)v47 + 7) + 160);
    BOOL v7 = *(void *)(*((void *)v47 + 7) + 128) == 0;
    char v62 = 0;
    if (v7)
    {
      uint64_t v35 = @"N/A";
    }
    else
    {
      id v63 = (id)[*(id *)(*((void *)v47 + 7) + 128) humanReadableUpdateName];
      char v62 = 1;
      uint64_t v35 = (__CFString *)v63;
    }
    int v31 = v35;
    uint64_t v32 = *(void *)(*((void *)v47 + 7) + 128);
    uint64_t v33 = *(void *)(*((void *)v47 + 7) + 168);
    uint64_t v34 = *(void *)(*((void *)v47 + 7) + 8);
    BOOL v8 = *(void *)(*((void *)v47 + 7) + 8) == 0;
    char v60 = 0;
    char v58 = 0;
    char v56 = 0;
    if (v8
      || (id v61 = (id)[*(id *)(*((void *)v47 + 7) + 8) descriptor],
          char v60 = 1,
          !v61))
    {
      id v30 = @"N/A";
    }
    else
    {
      id v59 = (id)[*(id *)(*((void *)v47 + 7) + 8) descriptor];
      int v29 = 1;
      char v58 = 1;
      id v57 = (id)[v59 humanReadableUpdateName];
      char v56 = 1;
      id v30 = (__CFString *)v57;
    }
    int v26 = v30;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 104));
    id v28 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 104));
    char v54 = 0;
    char v52 = 0;
    if (v28)
    {
      id v55 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 104));
      int v24 = 1;
      char v54 = 1;
      BOOL v9 = (objc_class *)objc_opt_class();
      id v53 = NSStringFromClass(v9);
      char v52 = 1;
      id v25 = (__CFString *)v53;
    }
    else
    {
      id v25 = @"N/A";
    }
    int v21 = v25;
    id v22 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 112));
    id v23 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 112));
    char v50 = 0;
    char v48 = 0;
    if (v23)
    {
      id v51 = objc_loadWeakRetained((id *)(*((void *)v47 + 7) + 112));
      int v19 = 1;
      char v50 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v49 = NSStringFromClass(v10);
      char v48 = 1;
      id v20 = (__CFString *)v49;
    }
    else
    {
      id v20 = @"N/A";
    }
    uint64_t v11 = *((void *)v47 + 4);
    id v17 = &v12;
    buf = v71;
    __os_log_helper_16_2_16_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64((uint64_t)v71, (uint64_t)v45, v43, v44, (uint64_t)v36, v37, v38, (uint64_t)v31, v32, v33, v34, (uint64_t)v26, (uint64_t)WeakRetained, (uint64_t)v21, (uint64_t)v22, (uint64_t)v20, v11);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nUpdate: %@", buf, 0x9Eu);
    if (v48) {

    }
    if (v50) {
    if (v52)
    }

    if (v54) {
    if (v56)
    }

    if (v58) {
    if (v60)
    }

    if (v62) {
    if (v64)
    }

    objc_storeStrong(&v66, 0);
  }
  objc_storeStrong(&v68, 0);
  [*((id *)v47 + 7) setState:16];
  id v15 = (id)[*((id *)v47 + 7) delegate];
  int v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v14 = (id)[*((id *)v47 + 7) delegate];
    [v14 manager:*((void *)v47 + 7) installFinished:*((void *)v47 + 4)];
  }
  id v13 = 0;
  objc_storeStrong(&v69, 0);
  objc_storeStrong(location, v13);
}

- (void)manager:(id)a3 autoUpdateScheduleStateChanged:(BOOL)a4 autoInstallOperation:(id)a5
{
  id v49 = &v67;
  BOOL v47 = a4;
  id obj = a5;
  int v46 = "-[SUSUISoftwareUpdateManager manager:autoUpdateScheduleStateChanged:autoInstallOperation:]";
  uint64_t v75 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v72 = v47;
  id v71 = 0;
  objc_storeStrong(&v71, obj);
  id v70 = _SUSUILoggingFacility();
  unsigned __int8 v69 = 0;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v49 + 3);
    *(_DWORD *)os_log_type_t type = v69;
    id v43 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v49 + 8) + 88));
    id v5 = v43;
    BOOL v6 = v49;
    uint64_t v44 = (uint64_t)v5;
    *((void *)v49 + 1) = v5;
    int v45 = *(_DWORD *)(*((void *)v6 + 8) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 8) + 120) == 0;
    char v66 = 0;
    if (v6)
    {
      uint64_t v40 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*(id *)(*((void *)v49 + 8) + 120) humanReadableUpdateName];
      *(void *)id v49 = v7;
      char v66 = 1;
      uint64_t v40 = v7;
    }
    uint64_t v37 = v40;
    uint64_t v38 = *(void *)(*((void *)v49 + 8) + 120);
    uint64_t v39 = *(void *)(*((void *)v49 + 8) + 160);
    BOOL v8 = *(void *)(*((void *)v49 + 8) + 128) == 0;
    char v64 = 0;
    if (v8)
    {
      uint64_t v36 = @"N/A";
    }
    else
    {
      id v65 = (id)[*(id *)(*((void *)v49 + 8) + 128) humanReadableUpdateName];
      char v64 = 1;
      uint64_t v36 = (__CFString *)v65;
    }
    uint64_t v32 = v36;
    uint64_t v33 = *(void *)(*((void *)v49 + 8) + 128);
    uint64_t v34 = *(void *)(*((void *)v49 + 8) + 168);
    uint64_t v35 = *(void *)(*((void *)v49 + 8) + 8);
    BOOL v9 = *(void *)(*((void *)v49 + 8) + 8) == 0;
    char v62 = 0;
    char v60 = 0;
    char v58 = 0;
    if (v9
      || (id v63 = (id)[*(id *)(*((void *)v49 + 8) + 8) descriptor],
          char v62 = 1,
          !v63))
    {
      int v31 = @"N/A";
    }
    else
    {
      id v61 = (id)[*(id *)(*((void *)v49 + 8) + 8) descriptor];
      int v30 = 1;
      char v60 = 1;
      id v59 = (id)[v61 humanReadableUpdateName];
      char v58 = 1;
      int v31 = (__CFString *)v59;
    }
    uint64_t v27 = v31;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
    id v29 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
    char v56 = 0;
    char v54 = 0;
    if (v29)
    {
      id v57 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
      int v25 = 1;
      char v56 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v55 = NSStringFromClass(v10);
      char v54 = 1;
      int v26 = (__CFString *)v55;
    }
    else
    {
      int v26 = @"N/A";
    }
    id v22 = v26;
    id v23 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 112));
    id v24 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 112));
    char v52 = 0;
    char v50 = 0;
    if (v24)
    {
      id v53 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 112));
      int v20 = 1;
      char v52 = 1;
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v51 = NSStringFromClass(v11);
      char v50 = 1;
      int v21 = (__CFString *)v51;
    }
    else
    {
      int v21 = @"N/A";
    }
    uint64_t v12 = *((void *)v49 + 4);
    int v18 = &v13;
    buf = v74;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_4_0_8_64((uint64_t)v74, (uint64_t)v46, v44, v45, (uint64_t)v37, v38, v39, (uint64_t)v32, v33, v34, v35, (uint64_t)v27, (uint64_t)WeakRetained, (uint64_t)v22, (uint64_t)v23, (uint64_t)v21, v72, v12);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nAuto-update scheduled: %d, operation: %@", buf, 0xA4u);
    if (v50) {

    }
    if (v52) {
    if (v54)
    }

    if (v56) {
    if (v58)
    }

    if (v60) {
    if (v62)
    }

    if (v64) {
    if (v66)
    }

    objc_storeStrong(&v68, 0);
  }
  objc_storeStrong(&v70, 0);
  id v16 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
  int v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v15 = objc_loadWeakRetained((id *)(*((void *)v49 + 8) + 104));
    [v15 manager:*((void *)v49 + 8) autoUpdateScheduledStatusChanged:v72];
  }
  id v14 = 0;
  objc_storeStrong(&v71, 0);
  objc_storeStrong(location, v14);
}

- (void)manager:(id)a3 rollingBackStateChanged:(BOOL)a4 rollback:(id)a5
{
  char v50 = &v68;
  BOOL v48 = a4;
  id obj = a5;
  BOOL v47 = "-[SUSUISoftwareUpdateManager manager:rollingBackStateChanged:rollback:]";
  uint64_t v76 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v73 = v48;
  id v72 = 0;
  objc_storeStrong(&v72, obj);
  id v71 = _SUSUILoggingFacility();
  unsigned __int8 v70 = 0;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t log = (os_log_t)*((void *)v50 + 3);
    *(_DWORD *)os_log_type_t type = v70;
    id v44 = SUSUISoftwareUpdateStateToString(*(_DWORD *)(*((void *)v50 + 8) + 88));
    id v5 = v44;
    BOOL v6 = v50;
    uint64_t v45 = (uint64_t)v5;
    *((void *)v50 + 1) = v5;
    int v46 = *(_DWORD *)(*((void *)v6 + 8) + 88);
    LOBYTE(v6) = *(void *)(*((void *)v6 + 8) + 120) == 0;
    char v67 = 0;
    if (v6)
    {
      int v41 = @"N/A";
    }
    else
    {
      BOOL v7 = (__CFString *)(id)[*(id *)(*((void *)v50 + 8) + 120) humanReadableUpdateName];
      *(void *)char v50 = v7;
      char v67 = 1;
      int v41 = v7;
    }
    uint64_t v38 = v41;
    uint64_t v39 = *(void *)(*((void *)v50 + 8) + 120);
    uint64_t v40 = *(void *)(*((void *)v50 + 8) + 160);
    BOOL v8 = *(void *)(*((void *)v50 + 8) + 128) == 0;
    char v65 = 0;
    if (v8)
    {
      uint64_t v37 = @"N/A";
    }
    else
    {
      id v66 = (id)[*(id *)(*((void *)v50 + 8) + 128) humanReadableUpdateName];
      char v65 = 1;
      uint64_t v37 = (__CFString *)v66;
    }
    uint64_t v33 = v37;
    uint64_t v34 = *(void *)(*((void *)v50 + 8) + 128);
    uint64_t v35 = *(void *)(*((void *)v50 + 8) + 168);
    uint64_t v36 = *(void *)(*((void *)v50 + 8) + 8);
    BOOL v9 = *(void *)(*((void *)v50 + 8) + 8) == 0;
    char v63 = 0;
    char v61 = 0;
    char v59 = 0;
    if (v9
      || (id v64 = (id)[*(id *)(*((void *)v50 + 8) + 8) descriptor],
          char v63 = 1,
          !v64))
    {
      uint64_t v32 = @"N/A";
    }
    else
    {
      id v62 = (id)[*(id *)(*((void *)v50 + 8) + 8) descriptor];
      int v31 = 1;
      char v61 = 1;
      id v60 = (id)[v62 humanReadableUpdateName];
      char v59 = 1;
      uint64_t v32 = (__CFString *)v60;
    }
    id v28 = v32;
    id WeakRetained = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    id v30 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    char v57 = 0;
    char v55 = 0;
    if (v30)
    {
      id v58 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
      int v26 = 1;
      char v57 = 1;
      BOOL v10 = (objc_class *)objc_opt_class();
      id v56 = NSStringFromClass(v10);
      char v55 = 1;
      uint64_t v27 = (__CFString *)v56;
    }
    else
    {
      uint64_t v27 = @"N/A";
    }
    id v23 = v27;
    id v24 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
    id v25 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
    char v53 = 0;
    char v51 = 0;
    if (v25)
    {
      id v54 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 112));
      int v21 = 1;
      char v53 = 1;
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v52 = NSStringFromClass(v11);
      char v51 = 1;
      id v22 = (__CFString *)v52;
    }
    else
    {
      id v22 = @"N/A";
    }
    uint64_t v12 = @"NO";
    if (v73) {
      uint64_t v12 = @"YES";
    }
    uint64_t v13 = *((void *)v50 + 4);
    int v19 = &v14;
    buf = v75;
    __os_log_helper_16_2_17_8_32_8_66_4_0_8_66_8_0_8_66_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_64_8_64((uint64_t)v75, (uint64_t)v47, v45, v46, (uint64_t)v38, v39, v40, (uint64_t)v33, v34, v35, v36, (uint64_t)v28, (uint64_t)WeakRetained, (uint64_t)v23, (uint64_t)v24, (uint64_t)v22, (uint64_t)v12, v13);
    _os_log_impl(&dword_228401000, log, type[0], "%s: Update Manager Checkpoint\n\tstate: %{public}@ (%d)\n\tpreferredUpdate: %{public}@ (%p)\n\tpreferredUpdateError: %{public}@\n\talternateUpdate: %{public}@ (%p)\n\talternateUpdateError: %{public}@\n\tdownload: %p (%{public}@)\n\tdelegate: %p (%{public}@)\n\thostController: %p (%{public}@)\n\nisRollingBack: %@; rollback: %@",
      buf,
      0xA8u);
    if (v51) {

    }
    if (v53) {
    if (v55)
    }

    if (v57) {
    if (v59)
    }

    if (v61) {
    if (v63)
    }

    if (v65) {
    if (v67)
    }

    objc_storeStrong(&v69, 0);
  }
  objc_storeStrong(&v71, 0);
  id v17 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
  int v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v16 = objc_loadWeakRetained((id *)(*((void *)v50 + 8) + 104));
    [v16 manager:*((void *)v50 + 8) rollingBackStateChanged:v73 rollback:*((void *)v50 + 4)];
  }
  id v15 = 0;
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, v15);
}

- (void)manager:(id)a3 inUserInteraction:(id)a4
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 inUserInteraction:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 handleDDMDeclaration:(id)a4
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  [(SUSUISoftwareUpdateManager *)v10 setDdmDeclaration:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 handleDDMDeclaration:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (SUManagerClient)SUManager
{
  return (SUManagerClient *)objc_getProperty(self, a2, 96, 1);
}

- (int)state
{
  return self->_state;
}

- (SUSUISoftwareUpdateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUSUISoftwareUpdateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (UIViewController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (SUDescriptor)preferredUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPreferredUpdate:(id)a3
{
}

- (SUDescriptor)alternateUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAlternateUpdate:(id)a3
{
}

- (SUMutableDownloadMetadata)downloadMetadata
{
  return (SUMutableDownloadMetadata *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDownloadMetadata:(id)a3
{
}

- (RUIStyle)serverFlowStyle
{
  return (RUIStyle *)objc_getProperty(self, a2, 144, 1);
}

- (void)setServerFlowStyle:(id)a3
{
}

- (NSError)scanError
{
  return (NSError *)objc_getProperty(self, a2, 152, 1);
}

- (NSError)preferredUpdateError
{
  return (NSError *)objc_getProperty(self, a2, 160, 1);
}

- (NSError)alternateUpdateError
{
  return (NSError *)objc_getProperty(self, a2, 168, 1);
}

- (void)setProgressString:(id)a3
{
}

- (void)setActionString:(id)a3
{
}

- (BOOL)isDelayingUpdates
{
  return self->_isDelayingUpdates;
}

- (void)setIsDelayingUpdates:(BOOL)a3
{
  self->_isDelayingUpdates = a3;
}

- (BOOL)suPathsRestricted
{
  return self->_suPathsRestricted;
}

- (void)setSuPathsRestricted:(BOOL)a3
{
  self->_suPathsRestricted = a3;
}

- (BOOL)allowCellularOverride
{
  return self->_allowCellularOverride;
}

- (void)setAllowCellularOverride:(BOOL)a3
{
  self->_allowCellularOverride = a3;
}

- (BOOL)clientIsBuddy
{
  return self->_clientIsBuddy;
}

- (void)setClientIsBuddy:(BOOL)a3
{
  self->_clientIsBuddy = a3;
}

- (BOOL)bypassTermsAndConditions
{
  return self->_bypassTermsAndConditions;
}

- (void)setBypassTermsAndConditions:(BOOL)a3
{
  self->_bypassTermsAndConditions = a3;
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return (SUCoreDDMDeclaration *)objc_getProperty(self, a2, 192, 1);
}

- (void)setDdmDeclaration:(id)a3
{
}

- (void)setUpdate:(id)a3
{
}

- (SUInstallPolicy)installPolicy
{
  return (SUInstallPolicy *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInstallPolicy:(id)a3
{
}

- (SUDescriptor)hiddenPreferredUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 216, 1);
}

- (void)setHiddenPreferredUpdate:(id)a3
{
}

- (SUDescriptor)hiddenAlternateUpdate
{
  return (SUDescriptor *)objc_getProperty(self, a2, 224, 1);
}

- (void)setHiddenAlternateUpdate:(id)a3
{
}

- (NSString)preferredUpdateErrorDescription
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setPreferredUpdateErrorDescription:(id)a3
{
}

- (NSString)alternateUpdateErrorDescription
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAlternateUpdateErrorDescription:(id)a3
{
}

- (BOOL)hidingPreferredUpdate
{
  return self->_hidingPreferredUpdate;
}

- (BOOL)hidingAlternateUpdate
{
  return self->_hidingAlternateUpdate;
}

- (BOOL)didCompleteBetaProgramScan
{
  return self->_didCompleteBetaProgramScan;
}

- (void)setDidCompleteBetaProgramScan:(BOOL)a3
{
  self->_didCompleteBetaProgramScan = a3;
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
}

- (void).cxx_destruct
{
}

@end