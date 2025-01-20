@interface STRootViewModelCoordinator
+ (id)keyPathsForValuesAffectingPasscodeEnabled;
+ (id)keyPathsForValuesAffectingUsageDetailsCoordinator;
+ (id)loadViewModelFromManagedObjectContext:(id)a3 isLocalUser:(BOOL)a4 userDSID:(id)a5 error:(id *)a6;
- (BOOL)hasAlreadyEnteredPINForSession;
- (BOOL)hasShownMiniBuddy;
- (BOOL)isLocalUser;
- (BOOL)isPasscodeEnabled;
- (BOOL)validatePIN:(id)a3;
- (NSMutableDictionary)coordinatorsByChildDSID;
- (NSNumber)usageReportType;
- (NSNumber)userDSID;
- (NSString)deviceIdentifier;
- (NSString)userName;
- (STAdminPersistenceController)persistenceController;
- (STCommunicationSafetyViewModelCoordinator)communicationSafetyCoordinator;
- (STContentPrivacyViewModelCoordinator)contentPrivacyCoordinator;
- (STEyeReliefViewModelCoordinator)eyeReliefCoordinator;
- (STGroupFetchedResultsController)fetchedResultsController;
- (STRootViewModel)viewModel;
- (STRootViewModelCoordinator)init;
- (STRootViewModelCoordinator)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4 usageReportType:(id)a5 usageContext:(int64_t)a6;
- (STTimeAllowancesViewModelCoordinator)timeAllowancesCoordinator;
- (STUsageDetailsViewModelCoordinator)usageDetailsCoordinator;
- (id)coordinatorForChild:(id)a3 deviceIdentifier:(id)a4 usageReportType:(id)a5;
- (id)defaultValueForRestrictionIdentifier:(id)a3;
- (id)organizationIdentifierForManagement;
- (id)organizationIdentifierForUsage;
- (int64_t)usageContext;
- (void)_passcodeSessionHasEnded:(id)a3;
- (void)_registerForPersistentStoreNotifications;
- (void)_registerForWillResignActiveNotifications;
- (void)_reportCoreAnalyticsEventScreenTimeEnabled:(BOOL)a3 user:(id)a4 userType:(unint64_t)a5 userIsRemote:(BOOL)a6;
- (void)_setPIN:(id)a3 recoveryAltDSID:(id)a4 shouldSetRecoveryAppleID:(BOOL)a5 completionHandler:(id)a6;
- (void)_validateDeviceIdentifier;
- (void)_willRefreshUsage:(id)a3;
- (void)applyIntroductionViewModel:(id)a3 withCompletionHandler:(id)a4;
- (void)enableManagementWithPIN:(id)a3 recoveryAltDSID:(id)a4 completionHandler:(id)a5;
- (void)groupResultsControllerDidChangeContents:(id)a3;
- (void)loadValuesByRestrictionWithCompletionHandler:(id)a3;
- (void)loadViewModelRightNow;
- (void)loadViewModelWithCompletionHandler:(id)a3;
- (void)saveViewModel:(id)a3;
- (void)setCoordinatorsByChildDSID:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFetchedResultsController:(id)a3;
- (void)setHasAlreadyEnteredPINForSession:(BOOL)a3;
- (void)setHasShownMiniBuddy:(BOOL)a3;
- (void)setIsLocalUser:(BOOL)a3;
- (void)setManagementEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setPIN:(id)a3 completionHandler:(id)a4;
- (void)setPIN:(id)a3 recoveryAltDSID:(id)a4 completionHandler:(id)a5;
- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setShareWebUsageEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)setUserDSID:(id)a3;
- (void)setUserName:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation STRootViewModelCoordinator

- (STRootViewModelCoordinator)initWithUserDSID:(id)a3 deviceIdentifier:(id)a4 usageReportType:(id)a5 usageContext:(int64_t)a6
{
  v31.receiver = self;
  v31.super_class = (Class)STRootViewModelCoordinator;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(STRootViewModelCoordinator *)&v31 init];
  uint64_t v13 = objc_msgSend(v11, "copy", v31.receiver, v31.super_class);
  userDSID = v12->_userDSID;
  v12->_userDSID = (NSNumber *)v13;

  uint64_t v15 = [v10 copy];
  deviceIdentifier = v12->_deviceIdentifier;
  v12->_deviceIdentifier = (NSString *)v15;

  uint64_t v17 = [v9 copy];
  usageReportType = v12->_usageReportType;
  v12->_usageReportType = (NSNumber *)v17;

  v12->_usageContext = a6;
  uint64_t v19 = [MEMORY[0x263F67088] sharedController];
  persistenceController = v12->_persistenceController;
  v12->_persistenceController = (STAdminPersistenceController *)v19;

  uint64_t v21 = [v11 unsignedIntegerValue];
  if (!v21) {
    v12->_isLocalUser = 1;
  }
  v22 = [(STAdminPersistenceController *)v12->_persistenceController persistentContainer];
  v23 = [MEMORY[0x263F670A8] sharedCache];
  [v23 setPersistentContainer:v22];

  userName = v12->_userName;
  v12->_userName = 0;

  uint64_t v25 = objc_opt_new();
  viewModel = v12->_viewModel;
  v12->_viewModel = (STRootViewModel *)v25;

  uint64_t v27 = objc_opt_new();
  coordinatorsByChildDSID = v12->_coordinatorsByChildDSID;
  v12->_coordinatorsByChildDSID = (NSMutableDictionary *)v27;

  [(STRootViewModelCoordinator *)v12 loadViewModelRightNow];
  [(STRootViewModelCoordinator *)v12 _registerForPersistentStoreNotifications];
  [(STRootViewModelCoordinator *)v12 _registerForWillResignActiveNotifications];
  v29 = [MEMORY[0x263F08A00] defaultCenter];
  [v29 addObserver:v12 selector:sel__willRefreshUsage_ name:0x26D942428 object:0];

  return v12;
}

- (STRootViewModelCoordinator)init
{
  return [(STRootViewModelCoordinator *)self initWithUserDSID:0 deviceIdentifier:0 usageReportType:0 usageContext:0];
}

- (void)_registerForPersistentStoreNotifications
{
  v24[5] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F671A0];
  v4 = [MEMORY[0x263F67168] fetchRequest];
  v5 = [v3 requestWithFetchRequest:v4];

  v6 = (void *)MEMORY[0x263F671A0];
  v7 = [MEMORY[0x263F67160] fetchRequest];
  v8 = [v6 requestWithFetchRequest:v7];

  id v9 = (void *)MEMORY[0x263F671A0];
  id v10 = [MEMORY[0x263F67238] fetchRequest];
  id v11 = [v9 requestWithFetchRequest:v10];

  v12 = (void *)MEMORY[0x263F671A0];
  uint64_t v13 = [MEMORY[0x263F671B0] fetchRequest];
  v14 = [v12 requestWithFetchRequest:v13];

  uint64_t v15 = (void *)MEMORY[0x263F671A0];
  v16 = [MEMORY[0x263F67280] fetchRequest];
  uint64_t v17 = [v15 requestWithFetchRequest:v16];

  id v18 = objc_alloc(MEMORY[0x263F671A8]);
  uint64_t v19 = [(STRootViewModelCoordinator *)self persistenceController];
  v20 = [v19 viewContext];
  v24[0] = v5;
  v24[1] = v8;
  v24[2] = v11;
  v24[3] = v14;
  v24[4] = v17;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:5];
  v22 = (void *)[v18 initWithContext:v20 resultsRequests:v21];

  [v22 setDelegate:self];
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = (STGroupFetchedResultsController *)v22;
}

- (void)groupResultsControllerDidChangeContents:(id)a3
{
}

- (void)_registerForWillResignActiveNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__passcodeSessionHasEnded_ name:*MEMORY[0x263F833C0] object:0];
}

- (void)_passcodeSessionHasEnded:(id)a3
{
}

- (id)coordinatorForChild:(id)a3 deviceIdentifier:(id)a4 usageReportType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(STRootViewModelCoordinator *)self coordinatorsByChildDSID];
  v12 = [v8 dsid];
  uint64_t v13 = [v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    v14 = [STRootViewModelCoordinator alloc];
    uint64_t v15 = [v8 dsid];
    uint64_t v13 = [(STRootViewModelCoordinator *)v14 initWithUserDSID:v15 deviceIdentifier:v9 usageReportType:v10 usageContext:[(STRootViewModelCoordinator *)self usageContext]];

    v16 = [(STRootViewModelCoordinator *)self coordinatorsByChildDSID];
    uint64_t v17 = [v8 dsid];
    [v16 setObject:v13 forKeyedSubscript:v17];
  }

  return v13;
}

+ (id)keyPathsForValuesAffectingUsageDetailsCoordinator
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"viewModel.screenTimeEnabled";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (STUsageDetailsViewModelCoordinator)usageDetailsCoordinator
{
  if (!self->_usageDetailsCoordinator)
  {
    id v3 = [(STRootViewModelCoordinator *)self viewModel];
    int v4 = [v3 isScreenTimeEnabled];

    if (v4)
    {
      v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"NOT (%K == %hd OR %K == %hd)", @"platform", 4, @"platform", 5);
      v6 = [(STRootViewModelCoordinator *)self viewModel];
      v7 = [v6 devices];
      id v8 = [v7 filteredArrayUsingPredicate:v5];

      [(STRootViewModelCoordinator *)self _validateDeviceIdentifier];
      id v9 = [STUsageDetailsViewModelCoordinator alloc];
      id v10 = [(STRootViewModelCoordinator *)self persistenceController];
      id v11 = [(STRootViewModelCoordinator *)self organizationIdentifierForUsage];
      v12 = [(STRootViewModelCoordinator *)self userDSID];
      uint64_t v13 = [(STRootViewModelCoordinator *)self deviceIdentifier];
      v14 = [(STRootViewModelCoordinator *)self usageReportType];
      uint64_t v15 = [(STUsageDetailsViewModelCoordinator *)v9 initWithPersistenceController:v10 organizationIdentifier:v11 userDSID:v12 devices:v8 selectedDeviceIdentifier:v13 selectedUsageReportType:v14 usageContext:[(STRootViewModelCoordinator *)self usageContext]];
      usageDetailsCoordinator = self->_usageDetailsCoordinator;
      self->_usageDetailsCoordinator = v15;
    }
  }
  uint64_t v17 = self->_usageDetailsCoordinator;

  return v17;
}

- (void)_validateDeviceIdentifier
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(STRootViewModelCoordinator *)self viewModel];
  int v4 = [v3 devices];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__STRootViewModelCoordinator__validateDeviceIdentifier__block_invoke;
  v14[3] = &unk_264768210;
  v14[4] = self;
  uint64_t v5 = [v4 indexOfObjectPassingTest:v14];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(STRootViewModelCoordinator *)self isLocalUser])
    {
      v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == YES", @"isLocalDevice");
      v7 = [(STRootViewModelCoordinator *)self viewModel];
      id v8 = [v7 devices];
      id v9 = [v8 filteredArrayUsingPredicate:v6];
    }
    else
    {
      v6 = [(STRootViewModelCoordinator *)self viewModel];
      id v9 = [v6 devices];
    }
    id v10 = [v9 firstObject];
    id v11 = [v10 identifier];

    v12 = +[STUILog usage];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(STRootViewModelCoordinator *)self deviceIdentifier];
      *(_DWORD *)buf = 138543618;
      v16 = v13;
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_impl(&dword_225B06000, v12, OS_LOG_TYPE_DEFAULT, "_validateDeviceIdentifier: deviceIdentifier %{public}@ not found. Switching to %{public}@", buf, 0x16u);
    }
    [(STRootViewModelCoordinator *)self setDeviceIdentifier:v11];
  }
}

uint64_t __55__STRootViewModelCoordinator__validateDeviceIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) deviceIdentifier];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) deviceIdentifier];
    v6 = [v3 identifier];
    uint64_t v7 = [v5 isEqual:v6];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (STTimeAllowancesViewModelCoordinator)timeAllowancesCoordinator
{
  timeAllowancesCoordinator = self->_timeAllowancesCoordinator;
  if (!timeAllowancesCoordinator)
  {
    int v4 = [STTimeAllowancesViewModelCoordinator alloc];
    uint64_t v5 = [(STRootViewModelCoordinator *)self persistenceController];
    v6 = [(STRootViewModelCoordinator *)self userDSID];
    uint64_t v7 = [(STTimeAllowancesViewModelCoordinator *)v4 initWithPersistenceController:v5 userDSID:v6];
    id v8 = self->_timeAllowancesCoordinator;
    self->_timeAllowancesCoordinator = v7;

    timeAllowancesCoordinator = self->_timeAllowancesCoordinator;
  }

  return timeAllowancesCoordinator;
}

- (STContentPrivacyViewModelCoordinator)contentPrivacyCoordinator
{
  contentPrivacyCoordinator = self->_contentPrivacyCoordinator;
  if (!contentPrivacyCoordinator)
  {
    int v4 = [STContentPrivacyViewModelCoordinator alloc];
    uint64_t v5 = [(STRootViewModelCoordinator *)self persistenceController];
    v6 = [(STRootViewModelCoordinator *)self userDSID];
    uint64_t v7 = [(STRootViewModelCoordinator *)self userName];
    id v8 = [(STContentPrivacyViewModelCoordinator *)v4 initWithPersistenceController:v5 userDSID:v6 userName:v7];
    id v9 = self->_contentPrivacyCoordinator;
    self->_contentPrivacyCoordinator = v8;

    contentPrivacyCoordinator = self->_contentPrivacyCoordinator;
  }

  return contentPrivacyCoordinator;
}

- (STCommunicationSafetyViewModelCoordinator)communicationSafetyCoordinator
{
  communicationSafetyCoordinator = self->_communicationSafetyCoordinator;
  if (!communicationSafetyCoordinator)
  {
    int v4 = [STCommunicationSafetyViewModelCoordinator alloc];
    uint64_t v5 = [(STRootViewModelCoordinator *)self persistenceController];
    v6 = [(STRootViewModelCoordinator *)self userDSID];
    uint64_t v7 = [(STCommunicationSafetyViewModelCoordinator *)v4 initWithPersistenceController:v5 userDSID:v6];
    id v8 = self->_communicationSafetyCoordinator;
    self->_communicationSafetyCoordinator = v7;

    communicationSafetyCoordinator = self->_communicationSafetyCoordinator;
  }

  return communicationSafetyCoordinator;
}

- (STEyeReliefViewModelCoordinator)eyeReliefCoordinator
{
  eyeReliefCoordinator = self->_eyeReliefCoordinator;
  if (!eyeReliefCoordinator)
  {
    int v4 = [STEyeReliefViewModelCoordinator alloc];
    uint64_t v5 = [(STRootViewModelCoordinator *)self persistenceController];
    v6 = [(STRootViewModelCoordinator *)self userDSID];
    uint64_t v7 = [(STEyeReliefViewModelCoordinator *)v4 initWithPersistenceController:v5 userDSID:v6];
    id v8 = self->_eyeReliefCoordinator;
    self->_eyeReliefCoordinator = v7;

    eyeReliefCoordinator = self->_eyeReliefCoordinator;
  }

  return eyeReliefCoordinator;
}

- (BOOL)hasShownMiniBuddy
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"RMSetupShown"];

  return v3;
}

- (void)setHasShownMiniBuddy:(BOOL)a3
{
  if (a3)
  {
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v3 setBool:1 forKey:@"RMSetupShown"];
  }
}

+ (id)keyPathsForValuesAffectingPasscodeEnabled
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"viewModel.me.hasPasscode", 0);
}

- (BOOL)isPasscodeEnabled
{
  v2 = [(STRootViewModelCoordinator *)self viewModel];
  id v3 = [v2 me];
  char v4 = [v3 hasPasscode];

  return v4;
}

- (BOOL)validatePIN:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STRootViewModelCoordinator *)self viewModel];
  v6 = [v5 me];
  uint64_t v7 = [v6 passcode];
  char v8 = [v7 isEqualToString:v4];

  return v8;
}

- (void)setPIN:(id)a3 completionHandler:(id)a4
{
}

- (void)setPIN:(id)a3 recoveryAltDSID:(id)a4 completionHandler:(id)a5
{
}

- (void)_setPIN:(id)a3 recoveryAltDSID:(id)a4 shouldSetRecoveryAppleID:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(STRootViewModelCoordinator *)self viewModel];
  v14 = [v13 me];

  uint64_t v15 = [(STRootViewModelCoordinator *)self timeAllowancesCoordinator];
  v16 = [v15 viewModel];
  __int16 v17 = [v16 allowancesByIdentifier];

  id v18 = [(STRootViewModelCoordinator *)self persistenceController];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke;
  v24[3] = &unk_264768260;
  id v25 = v14;
  id v26 = v10;
  BOOL v31 = a5;
  id v27 = v11;
  id v28 = v17;
  v29 = self;
  id v30 = v12;
  id v19 = v12;
  id v20 = v17;
  id v21 = v11;
  id v22 = v10;
  id v23 = v14;
  [v18 performBackgroundTask:v24];
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userObjectID];
  uint64_t v5 = [v3 objectWithID:v4];

  [v5 setEffectivePasscode:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 80)) {
    [v5 setEffectiveRecoveryAltDSID:*(void *)(a1 + 48)];
  }
  if (*(void *)(a1 + 40))
  {
    id v23 = 0;
    char v6 = [MEMORY[0x263F67108] saveManagedUserBlueprintForUser:v5 error:&v23];
    id v7 = v23;
    if (v6) {
      goto LABEL_13;
    }
    char v8 = +[STUILog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    id v22 = 0;
    char v9 = [MEMORY[0x263F67108] deleteManagedUserBlueprintForUser:v5 error:&v22];
    id v7 = v22;
    if ((v9 & 1) == 0)
    {
      id v10 = +[STUILog persistence];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_1();
      }
    }
    [v5 setContactsEditable:1];
    [v5 setIsCommunicationSafetySendingRestricted:0];
    [v5 setIsCommunicationSafetyReceivingRestricted:0];
    [v5 setIsCommunicationSafetyNotificationEnabled:0];
    [v5 setIsCommunicationSafetyAnalyticsEnabled:0];
    id v11 = *(void **)(a1 + 56);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_378;
    v20[3] = &unk_264768238;
    id v21 = v5;
    [v11 enumerateKeysAndObjectsUsingBlock:v20];
    char v8 = v21;
  }

LABEL_13:
  id v12 = [*(id *)(a1 + 64) persistenceController];
  id v19 = v7;
  char v13 = [v12 saveContext:v3 error:&v19];
  id v14 = v19;

  uint64_t v15 = *(void **)(a1 + 72);
  if (v13)
  {
    v16 = v15;
    if (v16)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v16[2](v16, 0);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        id v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v27 = &unk_264767628;
        id v18 = v16;
        id v28 = 0;
        v29 = v18;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
  else
  {
    v16 = v15;
    id v17 = v14;
    if (v16)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v16)[2](v16, v17);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        id v26 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v27 = &unk_264767628;
        v29 = v16;
        id v28 = v17;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_378(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 behaviorType] == 1)
  {
    [v4 setBehaviorType:0];
    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = 0;
    BOOL v6 = +[STTimeAllowancesViewModelCoordinator saveAllowance:v4 forUser:v5 error:&v9];
    id v7 = v9;
    if (!v6)
    {
      char v8 = +[STUILog persistence];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_378_cold_1();
      }
    }
  }
}

- (void)setScreenTimeEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(STRootViewModelCoordinator *)self viewModel];
  char v8 = [v7 me];

  id v9 = [(STRootViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke;
  v12[3] = &unk_264768288;
  BOOL v16 = a3;
  id v13 = v8;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 performBackgroundTask:v12];
}

void __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userObjectID];
  uint64_t v5 = [v3 objectWithID:v4];

  int v6 = [v5 isManaged];
  [v5 setScreenTimeEnabled:*(unsigned __int8 *)(a1 + 56)];
  if (_os_feature_enabled_impl())
  {
    id v7 = 0;
    goto LABEL_4;
  }
  char v8 = [*(id *)(a1 + 40) persistenceController];
  id v19 = 0;
  char v9 = [v8 saveContext:v3 error:&v19];
  id v7 = v19;

  if (v9)
  {
LABEL_4:
    if (([v5 isManaged] | v6) == 1 && (_os_feature_enabled_impl() & 1) == 0) {
      [v5 notifyServerOfScreenTimeEnabled:*(unsigned __int8 *)(a1 + 56)];
    }
    if (*(unsigned char *)(a1 + 56) && (_os_feature_enabled_impl() & 1) == 0)
    {
      id v12 = [*(id *)(a1 + 40) timeAllowancesCoordinator];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      BOOL v16 = __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke_2;
      id v17 = &unk_264767AC0;
      id v18 = *(id *)(a1 + 48);
      [v12 saveDefaultAlwaysAllowListWithCompletionHandler:&v14];
    }
    else
    {
      id v10 = (void (**)(id, void))*(id *)(a1 + 48);
      if (v10)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v10[2](v10, 0);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v21 = 3221225472;
          id v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
          id v23 = &unk_264767628;
          id v13 = v10;
          id v24 = 0;
          uint64_t v25 = v13;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_reportCoreAnalyticsEventScreenTimeEnabled:user:userType:userIsRemote:", *(unsigned __int8 *)(a1 + 56), v5, objc_msgSend(*(id *)(a1 + 32), "type", v14, v15, v16, v17), objc_msgSend(*(id *)(a1 + 32), "isRemoteUser"));
    goto LABEL_21;
  }
  id v11 = (void (**)(id, id))*(id *)(a1 + 48);
  id v7 = v7;
  if (v11)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v11[2](v11, v7);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      id v22 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      id v23 = &unk_264767628;
      uint64_t v25 = v11;
      id v24 = v7;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_21:
}

void __69__STRootViewModelCoordinator_setScreenTimeEnabled_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void (**)(id, id))*(id *)(a1 + 32);
  id v5 = v3;
  if (v4)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v4[2](v4, v5);
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      void v6[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v6[3] = &unk_264767628;
      char v8 = v4;
      id v7 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v6);
    }
  }
}

- (void)setManagementEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(STRootViewModelCoordinator *)self viewModel];
  char v8 = [v7 me];

  char v9 = [(STRootViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__STRootViewModelCoordinator_setManagementEnabled_completionHandler___block_invoke;
  v12[3] = &unk_264768288;
  BOOL v16 = a3;
  id v13 = v8;
  uint64_t v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 performBackgroundTask:v12];
}

void __69__STRootViewModelCoordinator_setManagementEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 userObjectID];
  id v6 = [v4 objectWithID:v5];

  int v7 = [v6 isManaged];
  [v6 setManaged:*(unsigned __int8 *)(a1 + 56)];
  char v8 = [*(id *)(a1 + 40) persistenceController];
  id v14 = 0;
  char v9 = [v8 saveContext:v4 error:&v14];

  id v10 = v14;
  if (v9)
  {
    if (([v6 isManaged] | v7) == 1) {
      [v6 notifyServerOfScreenTimeEnabled:*(unsigned __int8 *)(a1 + 56)];
    }
    id v11 = (void (**)(id, void))*(id *)(a1 + 48);
    if (v11)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v11[2](v11, 0);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        id v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v18 = &unk_264767628;
        id v13 = v11;
        id v19 = 0;
        id v20 = v13;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
  else
  {
    id v11 = (void (**)(id, void))*(id *)(a1 + 48);
    id v12 = v10;
    if (v11)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v11)[2](v11, v12);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        id v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v18 = &unk_264767628;
        id v20 = v11;
        id v19 = v12;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

- (void)setScreenTimeSyncingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(STRootViewModelCoordinator *)self viewModel];
  char v8 = [v7 me];

  char v9 = [(STRootViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__STRootViewModelCoordinator_setScreenTimeSyncingEnabled_completionHandler___block_invoke;
  v12[3] = &unk_264768288;
  BOOL v16 = a3;
  id v13 = v8;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 performBackgroundTask:v12];
}

void __76__STRootViewModelCoordinator_setScreenTimeSyncingEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 userObjectID];
  id v6 = [v4 objectWithID:v5];

  [v6 setSyncingEnabled:*(unsigned __int8 *)(a1 + 56)];
  int v7 = [*(id *)(a1 + 40) persistenceController];
  id v14 = 0;
  char v8 = [v7 saveContext:v4 error:&v14];

  id v9 = v14;
  id v10 = *(void **)(a1 + 48);
  if (v8)
  {
    id v11 = v10;
    if (v11)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v11[2](v11, 0);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        id v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v18 = &unk_264767628;
        id v13 = v11;
        id v19 = 0;
        id v20 = v13;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
  else
  {
    id v11 = v10;
    id v12 = v9;
    if (v11)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v11)[2](v11, v12);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        id v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v18 = &unk_264767628;
        id v20 = v11;
        id v19 = v12;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

- (void)setShareWebUsageEnabled:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  int v7 = [(STRootViewModelCoordinator *)self viewModel];
  char v8 = [v7 me];

  id v9 = [(STRootViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__STRootViewModelCoordinator_setShareWebUsageEnabled_completionHandler___block_invoke;
  v12[3] = &unk_264768288;
  BOOL v16 = a3;
  id v13 = v8;
  id v14 = self;
  id v15 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 performBackgroundTask:v12];
}

void __72__STRootViewModelCoordinator_setShareWebUsageEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 userObjectID];
  id v6 = [v4 objectWithID:v5];

  [v6 setShareWebUsage:*(unsigned __int8 *)(a1 + 56)];
  int v7 = [*(id *)(a1 + 40) persistenceController];
  id v14 = 0;
  char v8 = [v7 saveContext:v4 error:&v14];

  id v9 = v14;
  id v10 = *(void **)(a1 + 48);
  if (v8)
  {
    id v11 = v10;
    if (v11)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v11[2](v11, 0);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        id v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v18 = &unk_264767628;
        id v13 = v11;
        id v19 = 0;
        id v20 = v13;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
  else
  {
    id v11 = v10;
    id v12 = v9;
    if (v11)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (**)(id, id))v11)[2](v11, v12);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v16 = 3221225472;
        id v17 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        id v18 = &unk_264767628;
        id v20 = v11;
        id v19 = v12;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

- (void)enableManagementWithPIN:(id)a3 recoveryAltDSID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(STRootViewModelCoordinator *)self viewModel];
  id v12 = [v11 me];

  id v13 = [(STRootViewModelCoordinator *)self persistenceController];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke;
  v18[3] = &unk_2647682B0;
  id v19 = v12;
  id v20 = v8;
  id v21 = v9;
  id v22 = self;
  id v23 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  id v17 = v12;
  [v13 performBackgroundTask:v18];
}

void __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userObjectID];
  id v5 = [v3 objectWithID:v4];

  if (_os_feature_enabled_impl()) {
    [v5 setManaged:1];
  }
  else {
    [v5 setScreenTimeEnabled:1];
  }
  [v5 setEffectivePasscode:*(void *)(a1 + 40)];
  [v5 setEffectiveRecoveryAltDSID:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 40))
  {
    id v27 = 0;
    char v6 = [MEMORY[0x263F67108] saveManagedUserBlueprintForUser:v5 error:&v27];
    id v7 = v27;
    if ((v6 & 1) == 0)
    {
      id v8 = +[STUILog persistence];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_2();
      }
    }
  }
  else
  {
    id v26 = 0;
    char v9 = [MEMORY[0x263F67108] deleteManagedUserBlueprintForUser:v5 error:&v26];
    id v7 = v26;
    if ((v9 & 1) == 0)
    {
      id v10 = +[STUILog persistence];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_1();
      }
    }
    [v5 setContactsEditable:1];
    [v5 setIsCommunicationSafetySendingRestricted:0];
    [v5 setIsCommunicationSafetyReceivingRestricted:0];
    [v5 setIsCommunicationSafetyNotificationEnabled:0];
    [v5 setIsCommunicationSafetyAnalyticsEnabled:0];
  }
  if (_os_feature_enabled_impl())
  {
LABEL_17:
    if ([v5 isManaged]) {
      [v5 notifyServerOfScreenTimeEnabled:1];
    }
    if (_os_feature_enabled_impl())
    {
      id v14 = (void (**)(id, void))*(id *)(a1 + 64);
      if (v14)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v14[2](v14, 0);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v29 = 3221225472;
          id v30 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
          BOOL v31 = &unk_264767628;
          id v19 = v14;
          id v32 = 0;
          v33 = v19;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }

      id v20 = [*(id *)(a1 + 56) persistenceController];
      id v22 = v7;
      char v21 = [v20 saveContext:v3 error:&v22];
      id v18 = v22;

      if (v21) {
        goto LABEL_33;
      }
      id v16 = +[STUILog persistence];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_cold_1();
      }
      id v7 = v18;
    }
    else
    {
      id v15 = [*(id *)(a1 + 56) timeAllowancesCoordinator];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_383;
      v23[3] = &unk_264767AC0;
      id v24 = *(id *)(a1 + 64);
      [v15 saveDefaultAlwaysAllowListWithCompletionHandler:v23];

      id v16 = v24;
    }

    id v18 = v7;
LABEL_33:
    objc_msgSend(*(id *)(a1 + 56), "_reportCoreAnalyticsEventScreenTimeEnabled:user:userType:userIsRemote:", 1, v5, objc_msgSend(*(id *)(a1 + 32), "type"), objc_msgSend(*(id *)(a1 + 32), "isRemoteUser"));
    goto LABEL_36;
  }
  id v11 = [*(id *)(a1 + 56) persistenceController];
  id v25 = v7;
  char v12 = [v11 saveContext:v3 error:&v25];
  id v13 = v25;

  if (v12)
  {
    id v7 = v13;
    goto LABEL_17;
  }
  id v17 = (void (**)(id, id))*(id *)(a1 + 64);
  id v18 = v13;
  if (v17)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v17[2](v17, v18);
    }
    else
    {
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v29 = 3221225472;
      id v30 = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      BOOL v31 = &unk_264767628;
      v33 = v17;
      id v32 = v18;
      dispatch_async(MEMORY[0x263EF83A0], &block);
    }
  }

LABEL_36:
}

void __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_383(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void (**)(id, id))*(id *)(a1 + 32);
  id v5 = v3;
  if (v4)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v4[2](v4, v5);
    }
    else
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      void v6[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v6[3] = &unk_264767628;
      id v8 = v4;
      id v7 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v6);
    }
  }
}

- (void)applyIntroductionViewModel:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v30 = [(STRootViewModelCoordinator *)self timeAllowancesCoordinator];
  uint64_t v29 = [(STRootViewModelCoordinator *)self communicationSafetyCoordinator];
  id v8 = [(STRootViewModelCoordinator *)self contentPrivacyCoordinator];
  char v9 = [(STRootViewModelCoordinator *)self eyeReliefCoordinator];
  if (v7) {
    id v10 = dispatch_group_create();
  }
  else {
    id v10 = 0;
  }
  id v11 = [v6 communicationSafetyEnabled];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    if (v7) {
      dispatch_group_enter(v10);
    }
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke;
    v53[3] = &unk_264767588;
    BOOL v55 = v7 != 0;
    v54 = v10;
    [v29 saveCommunicationSafetyReceivingRestricted:1 communicationSafetySendingRestricted:1 completionHandler:v53];
  }
  if (_os_feature_enabled_impl())
  {
    id v13 = [v6 appAndWebsiteActivityEnabled];

    if (v13)
    {
      id v14 = [v6 appAndWebsiteActivityEnabled];
      uint64_t v15 = [v14 BOOLValue];
      v51[0] = MEMORY[0x263EF8330];
      v51[1] = 3221225472;
      v51[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_384;
      v51[3] = &unk_2647671B0;
      id v52 = v6;
      [(STRootViewModelCoordinator *)self setScreenTimeEnabled:v15 completionHandler:v51];
    }
  }
  id v16 = [v6 bedtime];

  if (v16)
  {
    if (v7) {
      dispatch_group_enter(v10);
    }
    id v17 = [v6 bedtime];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_391;
    v48[3] = &unk_264767588;
    BOOL v50 = v7 != 0;
    v49 = v10;
    [v30 saveDeviceBedtime:v17 completionHandler:v48];
  }
  id v18 = [v6 allowance];

  if (v18)
  {
    if (v7) {
      dispatch_group_enter(v10);
    }
    id v19 = [v6 allowance];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_392;
    v45[3] = &unk_264767588;
    BOOL v47 = v7 != 0;
    v46 = v10;
    [v30 saveAllowance:v19 completionHandler:v45];
  }
  id v20 = [v6 restrictions];
  uint64_t v21 = [v20 count];

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    if (!v21 && ![v6 imageGenerationRestriction]) {
      goto LABEL_23;
    }
  }
  else if (!v21)
  {
LABEL_23:
    [v8 saveContentPrivacyEnabled:0 completionHandler:&__block_literal_global_401];
    goto LABEL_32;
  }
  [v8 saveContentPrivacyEnabled:1 completionHandler:&__block_literal_global_15];
  id v22 = [v6 restrictions];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_396;
  v41[3] = &unk_2647682D8;
  BOOL v44 = v7 != 0;
  id v23 = v10;
  v42 = v23;
  id v24 = v8;
  id v43 = v24;
  [v22 enumerateKeysAndObjectsUsingBlock:v41];

  if (_os_feature_enabled_impl()
    && _os_feature_enabled_impl()
    && (unint64_t)([v6 imageGenerationRestriction] - 1) <= 1)
  {
    uint64_t v25 = [v6 imageGenerationRestriction];
    if (v7) {
      dispatch_group_enter(v23);
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_398;
    v37[3] = &unk_264768300;
    BOOL v39 = v7 != 0;
    v38 = v23;
    BOOL v40 = v25 == 1;
    [v24 saveSiriImageGenerationIsAllowed:v25 == 1 completionHandler:v37];
  }
LABEL_32:
  id v26 = [v6 screenDistanceEnabled];

  if (v26)
  {
    id v27 = [v6 screenDistanceEnabled];
    uint64_t v28 = [v27 BOOLValue];

    if (v7) {
      dispatch_group_enter(v10);
    }
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_402;
    v33[3] = &unk_2647672A0;
    BOOL v36 = v7 != 0;
    v34 = v10;
    id v35 = v6;
    [v9 persistEyeReliefState:v28 withCompletionHandler:v33];
  }
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_403;
    block[3] = &unk_264767768;
    id v32 = v7;
    dispatch_group_notify(v10, MEMORY[0x263EF83A0], block);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Communication Safety setup during onboarding.", v6, 2u);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_384(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_384_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) appAndWebsiteActivityEnabled];
    int v7 = [v6 BOOLValue];
    id v8 = @"disabled";
    if (v7) {
      id v8 = @"enabled";
    }
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set App & Website Activity state during onboarding: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_391(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_391_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Downtime during onboarding.", v6, 2u);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_392(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_392_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved App Limit during onboarding.", v6, 2u);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_395(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[STUILog childSetup];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_395_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_DEFAULT, "Successfully enabled Content & Privacy during onboarding.", v5, 2u);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_396(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (STRestrictionTypeWithString_onceToken != -1) {
    dispatch_once(&STRestrictionTypeWithString_onceToken, &__block_literal_global_649);
  }
  id v8 = [(id)STRestrictionTypeWithString_restrictionItemTypes objectForKeyedSubscript:v7];
  if (v8)
  {
    int v9 = [v7 componentsSeparatedByString:@"."];
    id v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [v10 lastObject];
    [v10 removeLastObject];
    int v12 = [v10 componentsJoinedByString:@"."];
    id v13 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", v12, v11, &stru_26D9391A8, [v8 unsignedIntegerValue], 0);
  }
  else
  {
    id v13 = 0;
  }

  if (v13)
  {
    char v14 = *(unsigned char *)(a1 + 48);
    if (v14)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
      char v14 = *(unsigned char *)(a1 + 48);
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2;
    v16[3] = &unk_2647672A0;
    char v19 = v14;
    uint64_t v15 = *(void **)(a1 + 40);
    id v17 = *(id *)(a1 + 32);
    id v18 = v13;
    [v15 saveRestrictionValue:v6 forItem:v18 completionHandler:v16];
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2_cold_1(a1, v3);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved content restriction for item %{public}@ during onboarding.", (uint8_t *)&v7, 0xCu);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_398(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_398_cold_1(a1, v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(unsigned __int8 *)(a1 + 41);
    v7[0] = 67240192;
    v7[1] = v6;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Image Creation value %{public}d during onboarding", (uint8_t *)v7, 8u);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_399(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[STUILog childSetup];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_399_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_DEFAULT, "Successfully disabled Content & Privacy during onboarding.", v5, 2u);
  }
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_402(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  id v4 = +[STUILog childSetup];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_402_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [*(id *)(a1 + 40) screenDistanceEnabled];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_225B06000, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved Screen Distance state: %@", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_403(uint64_t a1)
{
  id v2 = +[STUILog childSetup];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_225B06000, v2, OS_LOG_TYPE_DEFAULT, "Calling onboarding completion handler. Finished saving values for model.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reportCoreAnalyticsEventScreenTimeEnabled:(BOOL)a3 user:(id)a4 userType:(unint64_t)a5 userIsRemote:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  uint64_t v9 = [a4 effectivePasscode];

  if (a5 > 7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_225C13A80[a5];
  }
  id v16 = [MEMORY[0x263F67168] fetchRequest];
  uint64_t v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != NULL AND %K == YES", @"familySettings", @"isParent");
  [v16 setPredicate:v11];

  int v12 = [v16 execute:0];
  id v13 = v12;
  if (v12) {
    uint64_t v14 = [v12 count];
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F67230]) initWithScreenTimeEnabled:v8 numberOfGuardians:v14 pinSet:v9 != 0 userAgeGroup:v10 userIsRemote:v6];
  [MEMORY[0x263F67150] reportEvent:v15];
}

+ (id)loadViewModelFromManagedObjectContext:(id)a3 isLocalUser:(BOOL)a4 userDSID:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v286 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  v213 = objc_opt_new();
  BOOL v212 = v8;
  if (!v8)
  {
    id v249 = 0;
    id v207 = v10;
    uint64_t v99 = [MEMORY[0x263F67168] fetchUserWithDSID:v10 inContext:v9 error:&v249];
    id v224 = v249;
    if (v99)
    {
      id v17 = [[STUIUser alloc] initWithUser:v99];
      [v213 setMe:v17];
      uint64_t v15 = (void *)v99;
      goto LABEL_92;
    }
    v104 = +[STUILog persistence];
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:]();
    }

    if (a6)
    {
      id v102 = v224;
      id v103 = 0;
      *a6 = v102;
      v100 = v207;
      goto LABEL_83;
    }
    id v103 = 0;
    v100 = v207;
LABEL_173:
    v105 = v213;
    id v102 = v224;
    goto LABEL_179;
  }
  id v256 = 0;
  uint64_t v11 = [MEMORY[0x263F67168] fetchLocalUserInContext:v9 error:&v256];
  id v224 = v256;
  if (!v11)
  {
    v100 = v10;
    v101 = +[STUILog persistence];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:]();
    }

    if (a6)
    {
      id v102 = v224;
      id v103 = 0;
      *a6 = v102;
LABEL_83:
      v105 = v213;
      goto LABEL_179;
    }
    id v103 = 0;
    goto LABEL_173;
  }
  id v207 = v10;
  int v12 = [[STUIUser alloc] initWithUser:v11];
  id v13 = v213;
  [v213 setMe:v12];
  v218 = v12;
  BOOL v14 = [(STUIUser *)v12 isParent];
  uint64_t v15 = (void *)v11;
  if (!v14)
  {
    id v17 = v218;
    goto LABEL_85;
  }
  id v208 = v9;
  v210 = (void *)v11;
  id v255 = v224;
  id v16 = [MEMORY[0x263F67198] fetchWithContext:v9 error:&v255];
  id v205 = v255;

  v215 = objc_opt_new();
  long long v251 = 0u;
  long long v252 = 0u;
  long long v253 = 0u;
  long long v254 = 0u;
  v206 = v16;
  obuint64_t j = [v16 settings];
  id v17 = v218;
  uint64_t v219 = [obj countByEnumeratingWithState:&v251 objects:v274 count:16];
  if (!v219) {
    goto LABEL_72;
  }
  id v18 = &off_264766000;
  uint64_t v217 = *(void *)v252;
  do
  {
    char v19 = 0;
    do
    {
      if (*(void *)v252 != v217) {
        objc_enumerationMutation(obj);
      }
      v225 = v19;
      id v20 = *(void **)(*((void *)&v251 + 1) + 8 * (void)v19);
      uint64_t v21 = [STUIUser alloc];
      id v22 = [v20 user];
      id v23 = [(STUIUser *)v21 initWithUser:v22];

      if ([(STUIUser *)v23 isChild]) {
        [v215 addObject:v23];
      }
      v221 = [v20 user];
      id v24 = [v221 userDeviceStates];
      v222 = v23;
      uint64_t v25 = [(STUIUser *)v23 altDSID];
      id v26 = v24;
      id v27 = v25;
      v245 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v26, "count"));
      uint64_t v28 = [v18[280] usage];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v279 = v27;
        _os_log_impl(&dword_225B06000, v28, OS_LOG_TYPE_DEFAULT, "Finding devices for user: %{public}@", buf, 0xCu);
      }

      uint64_t v29 = [MEMORY[0x263EFFA40] standardUserDefaults];
      char v30 = [v29 BOOLForKey:0x26D942408];

      v220 = v27;
      if (_os_feature_enabled_impl() && (v30 & 1) == 0)
      {
        id v270 = 0;
        BOOL v31 = +[DeviceDetails detailsForUserWithAltDSID:v27 error:&v270];
        id v32 = v270;
        if (v31)
        {
          long long v268 = 0u;
          long long v269 = 0u;
          long long v266 = 0u;
          long long v267 = 0u;
          v235 = v31;
          uint64_t v33 = [v235 countByEnumeratingWithState:&v266 objects:buf count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            id v214 = v32;
            v226 = v31;
            id v232 = v26;
            uint64_t v241 = *(void *)v267;
            do
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v267 != v241) {
                  objc_enumerationMutation(v235);
                }
                BOOL v36 = *(void **)(*((void *)&v266 + 1) + 8 * i);
                v37 = [v36 coreDuetIdentifier];
                v38 = [v18[280] usage];
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  BOOL v39 = [v36 identifier];
                  BOOL v40 = [v36 name];
                  *(_DWORD *)v275 = 138543874;
                  *(void *)&v275[4] = v37;
                  *(_WORD *)&v275[12] = 2114;
                  *(void *)&v275[14] = v39;
                  *(_WORD *)&v275[22] = 2114;
                  *(void *)&v275[24] = v40;
                  _os_log_impl(&dword_225B06000, v38, OS_LOG_TYPE_DEFAULT, "Device Activity Device Found:  %{public}@ %{public}@ %{public}@", v275, 0x20u);
                }
                v41 = [STUIDevice alloc];
                v42 = [v36 name];
                id v43 = [v36 identifier];
                uint64_t v44 = [v36 platform];
                uint64_t v45 = [v36 isLocalDevice];
                v46 = [v36 lastUpdatedDate];
                BOOL v47 = [(STUIDevice *)v41 initWithName:v42 identifier:v43 coreDuetIdentifier:v37 platform:v44 hasDeviceActivity:1 isLocalDevice:v45 lastFamilyCheckinDate:v46];

                [v245 addObject:v47];
                id v18 = &off_264766000;
                v48 = +[STUILog usage];
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = [v36 identifier];
                  *(_DWORD *)v275 = 138543618;
                  *(void *)&v275[4] = v37;
                  *(_WORD *)&v275[12] = 2114;
                  *(void *)&v275[14] = v49;
                  _os_log_impl(&dword_225B06000, v48, OS_LOG_TYPE_DEFAULT, "Device Activity Device added: %{public}@, %{public}@", v275, 0x16u);
                }
              }
              uint64_t v34 = [v235 countByEnumeratingWithState:&v266 objects:buf count:16];
            }
            while (v34);
            BOOL v31 = v226;
            id v26 = v232;
            id v32 = v214;
          }
        }
        else
        {
          v235 = [v18[280] usage];
          if (os_log_type_enabled(v235, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v279 = v32;
            _os_log_error_impl(&dword_225B06000, v235, OS_LOG_TYPE_ERROR, "Failed to fetch device details from DeviceActivity: %{public}@", buf, 0xCu);
          }
        }
      }
      long long v264 = 0u;
      long long v265 = 0u;
      long long v262 = 0u;
      long long v263 = 0u;
      id v50 = v26;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v262 objects:v275 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v263;
        id v236 = v50;
        uint64_t v233 = *(void *)v263;
        do
        {
          uint64_t v54 = 0;
          uint64_t v242 = v52;
          do
          {
            if (*(void *)v263 != v53) {
              objc_enumerationMutation(v50);
            }
            BOOL v55 = *(void **)(*((void *)&v262 + 1) + 8 * v54);
            v56 = [v55 device];
            v57 = v56;
            if (!v56)
            {
              v62 = [v18[280] usage];
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v280 = 138543618;
                v281 = 0;
                __int16 v282 = 2114;
                uint64_t v283 = (uint64_t)v55;
                _os_log_error_impl(&dword_225B06000, v62, OS_LOG_TYPE_ERROR, "Could not create an STUIDevice from source device %{public}@ for user and device: %{public}@", v280, 0x16u);
              }
              goto LABEL_57;
            }
            if ([v56 platform] == 1 || objc_msgSend(v57, "platform") == 2)
            {
              v58 = [v55 coreDuetIdentifier];
              v59 = [v18[280] usage];
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                v60 = [v57 identifier];
                v61 = [v57 name];
                *(_DWORD *)v280 = 138543874;
                v281 = v58;
                __int16 v282 = 2114;
                uint64_t v283 = (uint64_t)v60;
                __int16 v284 = 2114;
                id v285 = v61;
                _os_log_impl(&dword_225B06000, v59, OS_LOG_TYPE_DEFAULT, "Screen Time Device Found: coreDuetIdentifier: %{public}@ %{public}@ %{public}@", v280, 0x20u);

                uint64_t v52 = v242;
              }

              uint64_t v257 = MEMORY[0x263EF8330];
              uint64_t v258 = 3221225472;
              v259 = __createDevices_block_invoke;
              v260 = &unk_264768210;
              v62 = v58;
              v261 = v62;
              if ([v245 indexOfObjectPassingTest:&v257] == 0x7FFFFFFFFFFFFFFFLL)
              {
                id v63 = [v55 user];
                id v64 = v57;
                v65 = [MEMORY[0x263F67260] fetchRequestMatchingUser:v63 device:v64];
                id v271 = 0;
                v66 = [v65 execute:&v271];
                id v67 = v271;
                if (v67)
                {
                  v68 = [v18[280] usage];
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    v69 = [v63 altDSID];
                    v227 = [v64 name];
                    *(_DWORD *)v280 = 138543874;
                    v281 = v69;
                    __int16 v282 = 2114;
                    uint64_t v283 = (uint64_t)v227;
                    __int16 v284 = 2114;
                    id v285 = v67;
                    _os_log_fault_impl(&dword_225B06000, v68, OS_LOG_TYPE_FAULT, "fetchLastUpdatedDate Request failed for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);
                  }
                  goto LABEL_52;
                }
                if (!v66
                  || ![v66 count]
                  || ([v66 objectAtIndexedSubscript:0],
                      v70 = objc_claimAutoreleasedReturnValue(),
                      [v70 lastUpdatedDate],
                      id v71 = (id)objc_claimAutoreleasedReturnValue(),
                      v71,
                      v70,
                      !v71))
                {
                  v68 = +[STUILog usage];
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                  {
                    v228 = [v63 altDSID];
                    uint64_t v81 = [v64 name];
                    *(_DWORD *)v280 = 138543874;
                    v281 = v228;
                    __int16 v282 = 2114;
                    uint64_t v283 = v81;
                    v82 = (void *)v81;
                    __int16 v284 = 2114;
                    id v285 = v66;
                    _os_log_error_impl(&dword_225B06000, v68, OS_LOG_TYPE_ERROR, "fetchLastUpdatedDate no usage for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);
                  }
LABEL_52:

                  id v71 = 0;
                }
                id v72 = v71;

                v73 = [STUIDevice alloc];
                v74 = [v64 name];
                v75 = [v64 identifier];
                uint64_t v76 = [v64 platform];
                v77 = [v64 localUserDeviceState];
                v78 = [(STUIDevice *)v73 initWithName:v74 identifier:v75 coreDuetIdentifier:v62 platform:v76 hasDeviceActivity:0 isLocalDevice:v77 != 0 lastFamilyCheckinDate:v72];

                [v245 addObject:v78];
                v79 = +[STUILog usage];
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  v80 = [(STUIDevice *)v78 identifier];
                  *(_DWORD *)v280 = 138543618;
                  v281 = v62;
                  __int16 v282 = 2114;
                  uint64_t v283 = (uint64_t)v80;
                  _os_log_impl(&dword_225B06000, v79, OS_LOG_TYPE_DEFAULT, "Screen Time Device added: %{public}@, %{public}@", v280, 0x16u);
                }
                id v18 = &off_264766000;
                id v50 = v236;
                uint64_t v53 = v233;
                uint64_t v52 = v242;
              }

LABEL_57:
            }

            ++v54;
          }
          while (v52 != v54);
          uint64_t v52 = [v50 countByEnumeratingWithState:&v262 objects:v275 count:16];
        }
        while (v52);
      }

      id v83 = v245;
      id v84 = v83;
      v85 = [MEMORY[0x263EFF8F0] currentCalendar];
      v86 = [MEMORY[0x263EFF910] now];
      v87 = [v85 startOfDayForDate:v86];
      v88 = [v85 dateByAddingUnit:0x2000 value:-1 toDate:v87 options:0];

      long long v276 = 0u;
      long long v277 = 0u;
      memset(v275, 0, sizeof(v275));
      id v89 = v84;
      uint64_t v90 = [v89 countByEnumeratingWithState:v275 objects:buf count:16];
      if (v90)
      {
        uint64_t v91 = **(void **)&v275[16];
        while (2)
        {
          for (uint64_t j = 0; j != v90; ++j)
          {
            if (**(void **)&v275[16] != v91) {
              objc_enumerationMutation(v89);
            }
            v93 = [*(id *)(*(void *)&v275[8] + 8 * j) lastFamilyCheckinDate];
            uint64_t v94 = [v88 compare:v93];

            if (v94 == 1)
            {
              uint64_t v90 = 1;
              goto LABEL_70;
            }
          }
          uint64_t v90 = [v89 countByEnumeratingWithState:v275 objects:buf count:16];
          if (v90) {
            continue;
          }
          break;
        }
      }
LABEL_70:

      [(STUIUser *)v222 setHasDeviceWithoutUsageReported:v90];
      char v19 = v225 + 1;
      id v17 = v218;
    }
    while (v225 + 1 != (char *)v219);
    uint64_t v219 = [obj countByEnumeratingWithState:&v251 objects:v274 count:16];
  }
  while (v219);
LABEL_72:

  v95 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  v273[0] = v95;
  v96 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"dsid" ascending:1];
  v273[1] = v96;
  v97 = [MEMORY[0x263EFF8C0] arrayWithObjects:v273 count:2];

  v98 = [v215 sortedArrayUsingDescriptors:v97];
  id v13 = v213;
  [v213 setChildren:v98];

  id v224 = v205;
  id v9 = v208;
  uint64_t v15 = v210;
LABEL_85:
  if (_os_feature_enabled_impl())
  {
    v106 = v15;
    id v107 = v9;
    v108 = objc_opt_new();
    id v250 = 0;
    uint64_t v109 = [v108 isCloudSyncEnabled:&v250];
    id v110 = v250;
    v111 = v13;
    id v112 = v110;
    [v111 setIsCloudSyncEnabled:v109];
    if (v112)
    {
      v113 = +[STUILog persistence];
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
        +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.5();
      }
    }
    id v9 = v107;
    uint64_t v15 = v106;
    id v17 = v218;
  }
  else
  {
    objc_msgSend(v13, "setIsCloudSyncEnabled:", objc_msgSend(v15, "syncingEnabled"));
  }
LABEL_92:
  id v209 = v9;

  uint64_t v114 = [v15 userDeviceStates];
  v115 = v15;
  v116 = (void *)v114;
  v211 = v115;
  v117 = [v115 altDSID];
  id v118 = v116;
  id v119 = v117;
  v246 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v118, "count"));
  v120 = +[STUILog usage];
  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v279 = v119;
    _os_log_impl(&dword_225B06000, v120, OS_LOG_TYPE_DEFAULT, "Finding devices for user: %{public}@", buf, 0xCu);
  }

  v121 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v122 = [v121 BOOLForKey:0x26D942408];

  v223 = v119;
  if (_os_feature_enabled_impl() && (v122 & 1) == 0)
  {
    id v270 = 0;
    v123 = +[DeviceDetails detailsForUserWithAltDSID:v119 error:&v270];
    id v124 = v270;
    if (v123)
    {
      long long v268 = 0u;
      long long v269 = 0u;
      long long v266 = 0u;
      long long v267 = 0u;
      v240 = v123;
      uint64_t v125 = [v240 countByEnumeratingWithState:&v266 objects:buf count:16];
      if (v125)
      {
        uint64_t v126 = v125;
        id v229 = v124;
        v234 = v123;
        id v237 = v118;
        uint64_t v243 = *(void *)v267;
        do
        {
          for (uint64_t k = 0; k != v126; ++k)
          {
            if (*(void *)v267 != v243) {
              objc_enumerationMutation(v240);
            }
            v128 = *(void **)(*((void *)&v266 + 1) + 8 * k);
            v129 = [v128 coreDuetIdentifier];
            v130 = +[STUILog usage];
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
            {
              v131 = [v128 identifier];
              v132 = [v128 name];
              *(_DWORD *)v275 = 138543874;
              *(void *)&v275[4] = v129;
              *(_WORD *)&v275[12] = 2114;
              *(void *)&v275[14] = v131;
              *(_WORD *)&v275[22] = 2114;
              *(void *)&v275[24] = v132;
              _os_log_impl(&dword_225B06000, v130, OS_LOG_TYPE_DEFAULT, "Device Activity Device Found:  %{public}@ %{public}@ %{public}@", v275, 0x20u);
            }
            v133 = [STUIDevice alloc];
            v134 = [v128 name];
            v135 = [v128 identifier];
            uint64_t v136 = [v128 platform];
            uint64_t v137 = [v128 isLocalDevice];
            v138 = [v128 lastUpdatedDate];
            v139 = [(STUIDevice *)v133 initWithName:v134 identifier:v135 coreDuetIdentifier:v129 platform:v136 hasDeviceActivity:1 isLocalDevice:v137 lastFamilyCheckinDate:v138];

            [v246 addObject:v139];
            v140 = +[STUILog usage];
            if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
            {
              v141 = [v128 identifier];
              *(_DWORD *)v275 = 138543618;
              *(void *)&v275[4] = v129;
              *(_WORD *)&v275[12] = 2114;
              *(void *)&v275[14] = v141;
              _os_log_impl(&dword_225B06000, v140, OS_LOG_TYPE_DEFAULT, "Device Activity Device added: %{public}@, %{public}@", v275, 0x16u);
            }
          }
          uint64_t v126 = [v240 countByEnumeratingWithState:&v266 objects:buf count:16];
        }
        while (v126);
        id v118 = v237;
        id v124 = v229;
        v123 = v234;
      }
    }
    else
    {
      v240 = +[STUILog usage];
      if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR)) {
        +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.4();
      }
    }
  }
  long long v264 = 0u;
  long long v265 = 0u;
  long long v262 = 0u;
  long long v263 = 0u;
  id v142 = v118;
  uint64_t v143 = [v142 countByEnumeratingWithState:&v262 objects:v275 count:16];
  if (v143)
  {
    uint64_t v144 = v143;
    id v145 = *(id *)v263;
    id v238 = *(id *)v263;
    id v239 = v142;
    do
    {
      uint64_t v146 = 0;
      uint64_t v244 = v144;
      do
      {
        if (*(id *)v263 != v145) {
          objc_enumerationMutation(v142);
        }
        v147 = *(void **)(*((void *)&v262 + 1) + 8 * v146);
        v148 = [v147 device];
        v149 = v148;
        if (!v148)
        {
          v154 = +[STUILog usage];
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v280 = 138543618;
            v281 = 0;
            __int16 v282 = 2114;
            uint64_t v283 = (uint64_t)v147;
            _os_log_error_impl(&dword_225B06000, v154, OS_LOG_TYPE_ERROR, "Could not create an STUIDevice from source device %{public}@ for user and device: %{public}@", v280, 0x16u);
          }
          goto LABEL_138;
        }
        if ([v148 platform] == 1 || objc_msgSend(v149, "platform") == 2)
        {
          v150 = [v147 coreDuetIdentifier];
          v151 = +[STUILog usage];
          if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
          {
            v152 = [v149 identifier];
            v153 = [v149 name];
            *(_DWORD *)v280 = 138543874;
            v281 = v150;
            __int16 v282 = 2114;
            uint64_t v283 = (uint64_t)v152;
            __int16 v284 = 2114;
            id v285 = v153;
            _os_log_impl(&dword_225B06000, v151, OS_LOG_TYPE_DEFAULT, "Screen Time Device Found: coreDuetIdentifier: %{public}@ %{public}@ %{public}@", v280, 0x20u);

            uint64_t v144 = v244;
          }

          uint64_t v257 = MEMORY[0x263EF8330];
          uint64_t v258 = 3221225472;
          v259 = __createDevices_block_invoke;
          v260 = &unk_264768210;
          v154 = v150;
          v261 = v154;
          if ([v246 indexOfObjectPassingTest:&v257] == 0x7FFFFFFFFFFFFFFFLL)
          {
            id v155 = [v147 user];
            id v156 = v149;
            v157 = [MEMORY[0x263F67260] fetchRequestMatchingUser:v155 device:v156];
            id v271 = 0;
            v158 = [v157 execute:&v271];
            id v159 = v271;
            if (v159)
            {
              v160 = +[STUILog usage];
              if (os_log_type_enabled(v160, OS_LOG_TYPE_FAULT))
              {
                v161 = [v155 altDSID];
                v230 = [v156 name];
                *(_DWORD *)v280 = 138543874;
                v281 = v161;
                __int16 v282 = 2114;
                uint64_t v283 = (uint64_t)v230;
                __int16 v284 = 2114;
                id v285 = v159;
                _os_log_fault_impl(&dword_225B06000, v160, OS_LOG_TYPE_FAULT, "fetchLastUpdatedDate Request failed for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);
              }
              goto LABEL_133;
            }
            if (!v158
              || ![v158 count]
              || ([v158 objectAtIndexedSubscript:0],
                  v162 = objc_claimAutoreleasedReturnValue(),
                  [v162 lastUpdatedDate],
                  id v163 = (id)objc_claimAutoreleasedReturnValue(),
                  v163,
                  v162,
                  !v163))
            {
              v160 = +[STUILog usage];
              if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
              {
                v231 = [v155 altDSID];
                uint64_t v173 = [v156 name];
                *(_DWORD *)v280 = 138543874;
                v281 = v231;
                __int16 v282 = 2114;
                uint64_t v283 = v173;
                v174 = (void *)v173;
                __int16 v284 = 2114;
                id v285 = v158;
                _os_log_error_impl(&dword_225B06000, v160, OS_LOG_TYPE_ERROR, "fetchLastUpdatedDate no usage for user %{public}@ and device %{public}@: %{public}@", v280, 0x20u);
              }
LABEL_133:

              id v163 = 0;
            }
            id v164 = v163;

            v165 = [STUIDevice alloc];
            v166 = [v156 name];
            v167 = [v156 identifier];
            uint64_t v168 = [v156 platform];
            v169 = [v156 localUserDeviceState];
            v170 = [(STUIDevice *)v165 initWithName:v166 identifier:v167 coreDuetIdentifier:v154 platform:v168 hasDeviceActivity:0 isLocalDevice:v169 != 0 lastFamilyCheckinDate:v164];

            [v246 addObject:v170];
            v171 = +[STUILog usage];
            if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
            {
              v172 = [(STUIDevice *)v170 identifier];
              *(_DWORD *)v280 = 138543618;
              v281 = v154;
              __int16 v282 = 2114;
              uint64_t v283 = (uint64_t)v172;
              _os_log_impl(&dword_225B06000, v171, OS_LOG_TYPE_DEFAULT, "Screen Time Device added: %{public}@, %{public}@", v280, 0x16u);
            }
            id v145 = v238;
            id v142 = v239;
            uint64_t v144 = v244;
          }

LABEL_138:
        }

        ++v146;
      }
      while (v144 != v146);
      uint64_t v144 = [v142 countByEnumeratingWithState:&v262 objects:v275 count:16];
    }
    while (v144);
  }

  id v175 = v246;
  v176 = [v211 userDeviceStates];
  v177 = [v211 altDSID];
  id v178 = v176;
  id v179 = v177;
  memset(v275, 0, sizeof(v275));
  long long v276 = 0u;
  long long v277 = 0u;
  id v180 = v178;
  uint64_t v181 = [v180 countByEnumeratingWithState:v275 objects:buf count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = 0;
    uint64_t v184 = **(void **)&v275[16];
    do
    {
      for (uint64_t m = 0; m != v182; ++m)
      {
        if (**(void **)&v275[16] != v184) {
          objc_enumerationMutation(v180);
        }
        v186 = [*(id *)(*(void *)&v275[8] + 8 * m) device];
        v187 = v186;
        if (v186 && [v186 platform] == 4) {
          ++v183;
        }
      }
      uint64_t v182 = [v180 countByEnumeratingWithState:v275 objects:buf count:16];
    }
    while (v182);
  }
  else
  {
    uint64_t v183 = 0;
  }

  [v213 setHasWatchOSDevicesInternal:v183 != 0];
  if (v183) {
    BOOL v188 = [v175 count] == 0;
  }
  else {
    BOOL v188 = 0;
  }
  [v213 setHasWatchOSDevicesOnlyInternal:v188];
  v189 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  v272[0] = v189;
  v190 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"identifier" ascending:1];
  v272[1] = v190;
  v191 = [MEMORY[0x263EFF8C0] arrayWithObjects:v272 count:2];

  v192 = [v175 sortedArrayUsingDescriptors:v191];
  [v213 setDevices:v192];

  v193 = (void *)MEMORY[0x263F671B0];
  if (v212)
  {
    v194 = &unk_26D9671B0;
  }
  else
  {
    v194 = [v211 dsid];
  }
  id v248 = v224;
  v195 = [v193 bundleIdentifiersInstalledForDSID:v194 inContext:v209 error:&v248];
  id v196 = v248;

  if (!v212) {
  if (v195)
  }
  {
    [v213 setInstalledBundleIDs:v195];
  }
  else
  {
    v197 = +[STUILog persistence];
    if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR)) {
      +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:]();
    }
  }
  if (v212 && ([v213 isCloudSyncEnabled] & 1) == 0)
  {
    v198 = [MEMORY[0x263F67108] fetchRequest];
    v199 = (void *)MEMORY[0x263F08A98];
    v200 = [v211 managingOrganization];
    v201 = [v199 predicateWithFormat:@"(%K == NO) AND (%@ IN %K) AND (%K == %@) AND (%K != %@) AND (%K != %@)", @"isTombstoned", v211, @"users", @"organization", v200, @"type", *MEMORY[0x263F672B0], @"type", *MEMORY[0x263F672C0]];
    [v198 setPredicate:v201];

    id v247 = v196;
    v202 = [v198 execute:&v247];
    id v102 = v247;

    if (v202)
    {
      objc_msgSend(v213, "setCanStopScreenTimeWithoutPasscode:", objc_msgSend(v202, "count") == 0);
    }
    else
    {
      v203 = +[STUILog persistence];
      if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR)) {
        +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:]();
      }
    }
  }
  else
  {
    id v102 = v196;
  }
  id v103 = v213;

  v105 = v213;
  v100 = v207;
  id v9 = v209;
LABEL_179:

  return v103;
}

- (void)saveViewModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 me];
  BOOL v6 = [v5 dsid];
  [(STRootViewModelCoordinator *)self setUserDSID:v6];

  int v7 = [v4 me];
  BOOL v8 = [v7 name];
  [(STRootViewModelCoordinator *)self setUserName:v8];

  [(STRootViewModelCoordinator *)self setViewModel:v4];
  id v9 = [MEMORY[0x263F318B0] sharedCategories];
  id v10 = [v4 installedBundleIDs];

  uint64_t v11 = [v10 allObjects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__STRootViewModelCoordinator_saveViewModel___block_invoke;
  v12[3] = &unk_2647670A0;
  void v12[4] = self;
  [v9 categoriesForBundleIDs:v11 completionHandler:v12];
}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = objc_opt_new();
    BOOL v8 = objc_opt_new();
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __44__STRootViewModelCoordinator_saveViewModel___block_invoke_443;
    v17[3] = &unk_264768328;
    id v9 = v7;
    id v18 = v9;
    id v10 = v8;
    id v19 = v10;
    [v5 enumerateKeysAndObjectsUsingBlock:v17];
    uint64_t v11 = [MEMORY[0x263F08A48] mainQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __44__STRootViewModelCoordinator_saveViewModel___block_invoke_2;
    v14[3] = &unk_264767B88;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v10;
    id v16 = v9;
    id v12 = v9;
    id v13 = v10;
    [v11 addOperationWithBlock:v14];
  }
  else
  {
    id v13 = +[STUILog persistence];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __44__STRootViewModelCoordinator_saveViewModel___block_invoke_cold_1();
    }
  }
}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke_443(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v5 canonicalBundleIdentifier];
  if (v6) {
    int v7 = v6;
  }
  else {
    int v7 = v12;
  }
  id v8 = v7;

  [*(id *)(a1 + 32) addObject:v8];
  id v9 = [v5 identifier];

  id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 addObject:v8];
  }
  else
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithObjects:", v8, 0);
    [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v9];
  }
}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewModel];
  [v2 setInstalledBundleIDsByCategoryIdentifier:*(void *)(a1 + 40)];
  [v2 setInstalledBundleIDs:*(void *)(a1 + 48)];
}

- (void)loadViewModelRightNow
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "Unable to load view model: %{public}@", (uint8_t *)&v3, 0xCu);
}

void __51__STRootViewModelCoordinator_loadViewModelRightNow__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = [v4 loadViewModelFromManagedObjectContext:v3 isLocalUser:v5 userDSID:v6 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STRootViewModelCoordinator *)self userDSID];
  BOOL v6 = [(STRootViewModelCoordinator *)self isLocalUser];
  uint64_t v7 = [(STRootViewModelCoordinator *)self persistenceController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v10[3] = &unk_264768288;
  BOOL v13 = v6;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v8 = v4;
  id v9 = v5;
  [v7 performBackgroundTask:v10];
}

void __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v14 = 0;
  uint64_t v7 = [v4 loadViewModelFromManagedObjectContext:v3 isLocalUser:v5 userDSID:v6 error:&v14];

  id v8 = v14;
  if (v7)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_264768378;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    id v13 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x263EF83A0], v11);
  }
  else
  {
    id v9 = (void (**)(id, id))*(id *)(a1 + 48);
    id v10 = v8;
    if (v9)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v9[2](v9, v10);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
        block[3] = &unk_264767628;
        id v17 = v9;
        id v16 = v10;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
}

void __65__STRootViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) saveViewModel:*(void *)(a1 + 40)];
  uint64_t v2 = (void (**)(id, void))*(id *)(a1 + 48);
  if (v2)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v2[2](v2, 0);
    }
    else
    {
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_1;
      v3[3] = &unk_264767628;
      id v4 = 0;
      uint64_t v5 = v2;
      dispatch_async(MEMORY[0x263EF83A0], v3);
    }
  }
}

- (id)organizationIdentifierForUsage
{
  BOOL v2 = [(STRootViewModelCoordinator *)self isLocalUser];
  id v3 = (void **)MEMORY[0x263F67370];
  if (!v2) {
    id v3 = (void **)MEMORY[0x263F67368];
  }
  id v4 = *v3;

  return v4;
}

- (id)organizationIdentifierForManagement
{
  BOOL v2 = [(STRootViewModelCoordinator *)self viewModel];
  id v3 = [v2 me];
  uint64_t v4 = [v3 source];
  uint64_t v5 = (id *)MEMORY[0x263F67370];
  if (v4) {
    uint64_t v5 = (id *)MEMORY[0x263F67368];
  }
  id v6 = *v5;

  return v6;
}

- (void)_willRefreshUsage:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  id v26 = 0;
  uint64_t v5 = [(STRootViewModelCoordinator *)self persistenceController];
  id v6 = [v5 viewContext];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke;
  v18[3] = &unk_2647683A0;
  void v18[4] = self;
  id v7 = v6;
  id v19 = v7;
  id v20 = &v21;
  [v7 performBlockAndWait:v18];
  if (v22[5])
  {
    id v8 = +[STUILog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(STRootViewModelCoordinator *)self viewModel];
      id v10 = [v9 devices];
      id v11 = [v10 valueForKeyPath:@"name"];
      id v12 = [(id)v22[5] valueForKeyPath:@"name"];
      *(_DWORD *)buf = 138543618;
      id v28 = v11;
      __int16 v29 = 2114;
      char v30 = v12;
      _os_log_impl(&dword_225B06000, v8, OS_LOG_TYPE_DEFAULT, "Updating devices from: %{public}@\n to: %{public}@", buf, 0x16u);
    }
    uint64_t v13 = v22[5];
    id v14 = [(STRootViewModelCoordinator *)self viewModel];
    [v14 setDevices:v13];

    id v15 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"NOT (%K == %hd OR %K == %hd)", @"platform", 4, @"platform", 5);
    id v16 = [(id)v22[5] filteredArrayUsingPredicate:v15];
    id v17 = [(STRootViewModelCoordinator *)self usageDetailsCoordinator];
    [v17 setDevices:v16];
  }
  _Block_object_dispose(&v21, 8);
}

void __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  BOOL v2 = [*(id *)(a1 + 32) viewModel];
  id v3 = [v2 me];

  int v4 = [v3 isRemoteUser];
  uint64_t v5 = (void *)MEMORY[0x263F67168];
  if (v4)
  {
    id v6 = [v3 dsid];
    uint64_t v7 = *(void *)(a1 + 40);
    id v93 = 0;
    id v8 = [v5 fetchUserWithDSID:v6 inContext:v7 error:&v93];
    id v9 = v93;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v92 = 0;
    id v8 = [MEMORY[0x263F67168] fetchLocalUserInContext:v10 error:&v92];
    id v9 = v92;
  }
  if (v8)
  {
    id v76 = v9;
    uint64_t v77 = a1;
    v79 = v3;
    uint64_t v11 = [v8 userDeviceStates];
    id v12 = v8;
    uint64_t v13 = (void *)v11;
    v78 = v12;
    id v14 = [v12 altDSID];
    id v15 = v13;
    id v80 = v14;
    uint64_t v91 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    id v16 = +[STUILog usage];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v114 = v80;
      _os_log_impl(&dword_225B06000, v16, OS_LOG_TYPE_DEFAULT, "Finding devices for user: %{public}@", buf, 0xCu);
    }

    id v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v18 = [v17 BOOLForKey:0x26D942408];

    if (_os_feature_enabled_impl() && (v18 & 1) == 0)
    {
      id v104 = 0;
      id v19 = +[DeviceDetails detailsForUserWithAltDSID:v80 error:&v104];
      id v20 = v104;
      if (v19)
      {
        long long v102 = 0u;
        long long v103 = 0u;
        long long v101 = 0u;
        long long v100 = 0u;
        obuint64_t j = v19;
        uint64_t v21 = [obj countByEnumeratingWithState:&v100 objects:buf count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          id v81 = v20;
          id v84 = v19;
          id v85 = v15;
          uint64_t v89 = *(void *)v101;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v101 != v89) {
                objc_enumerationMutation(obj);
              }
              id v24 = *(void **)(*((void *)&v100 + 1) + 8 * i);
              uint64_t v25 = [v24 coreDuetIdentifier];
              id v26 = +[STUILog usage];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                id v27 = [v24 identifier];
                id v28 = [v24 name];
                *(_DWORD *)id v107 = 138543874;
                v108 = v25;
                __int16 v109 = 2114;
                id v110 = v27;
                __int16 v111 = 2114;
                id v112 = v28;
                _os_log_impl(&dword_225B06000, v26, OS_LOG_TYPE_DEFAULT, "Device Activity Device Found:  %{public}@ %{public}@ %{public}@", v107, 0x20u);
              }
              __int16 v29 = [STUIDevice alloc];
              char v30 = [v24 name];
              uint64_t v31 = [v24 identifier];
              uint64_t v32 = [v24 platform];
              uint64_t v33 = [v24 isLocalDevice];
              uint64_t v34 = [v24 lastUpdatedDate];
              id v35 = [(STUIDevice *)v29 initWithName:v30 identifier:v31 coreDuetIdentifier:v25 platform:v32 hasDeviceActivity:1 isLocalDevice:v33 lastFamilyCheckinDate:v34];

              [v91 addObject:v35];
              BOOL v36 = +[STUILog usage];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                v37 = [v24 identifier];
                *(_DWORD *)id v107 = 138543618;
                v108 = v25;
                __int16 v109 = 2114;
                id v110 = v37;
                _os_log_impl(&dword_225B06000, v36, OS_LOG_TYPE_DEFAULT, "Device Activity Device added: %{public}@, %{public}@", v107, 0x16u);
              }
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v100 objects:buf count:16];
          }
          while (v22);
          id v15 = v85;
          id v20 = v81;
          id v19 = v84;
        }
      }
      else
      {
        obuint64_t j = +[STUILog usage];
        if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
          +[STRootViewModelCoordinator loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:].cold.4();
        }
      }
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v38 = v15;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v96 objects:v107 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v97;
      uint64_t v87 = *(void *)v97;
      v86 = v38;
      do
      {
        uint64_t v42 = 0;
        uint64_t v90 = v40;
        do
        {
          if (*(void *)v97 != v41) {
            objc_enumerationMutation(v38);
          }
          id v43 = *(void **)(*((void *)&v96 + 1) + 8 * v42);
          uint64_t v44 = [v43 device];
          uint64_t v45 = v44;
          if (!v44)
          {
            id v50 = +[STUILog usage];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v115 = 138543618;
              v116 = 0;
              __int16 v117 = 2114;
              uint64_t v118 = (uint64_t)v43;
              _os_log_error_impl(&dword_225B06000, v50, OS_LOG_TYPE_ERROR, "Could not create an STUIDevice from source device %{public}@ for user and device: %{public}@", v115, 0x16u);
            }
            goto LABEL_53;
          }
          if ([v44 platform] == 1 || objc_msgSend(v45, "platform") == 2)
          {
            v46 = [v43 coreDuetIdentifier];
            BOOL v47 = +[STUILog usage];
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              v48 = [v45 identifier];
              v49 = [v45 name];
              *(_DWORD *)v115 = 138543874;
              v116 = v46;
              __int16 v117 = 2114;
              uint64_t v118 = (uint64_t)v48;
              __int16 v119 = 2114;
              id v120 = v49;
              _os_log_impl(&dword_225B06000, v47, OS_LOG_TYPE_DEFAULT, "Screen Time Device Found: coreDuetIdentifier: %{public}@ %{public}@ %{public}@", v115, 0x20u);

              uint64_t v41 = v87;
              uint64_t v40 = v90;
            }

            v94[0] = MEMORY[0x263EF8330];
            v94[1] = 3221225472;
            v94[2] = __createDevices_block_invoke;
            v94[3] = &unk_264768210;
            id v50 = v46;
            v95 = v50;
            if ([v91 indexOfObjectPassingTest:v94] == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v51 = [v43 user];
              id v52 = v45;
              uint64_t v53 = [MEMORY[0x263F67260] fetchRequestMatchingUser:v51 device:v52];
              id v105 = 0;
              uint64_t v54 = [v53 execute:&v105];
              id v55 = v105;
              if (v55)
              {
                v56 = +[STUILog usage];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
                {
                  v57 = [v51 altDSID];
                  v82 = [v52 name];
                  *(_DWORD *)v115 = 138543874;
                  v116 = v57;
                  __int16 v117 = 2114;
                  uint64_t v118 = (uint64_t)v82;
                  __int16 v119 = 2114;
                  id v120 = v55;
                  _os_log_fault_impl(&dword_225B06000, v56, OS_LOG_TYPE_FAULT, "fetchLastUpdatedDate Request failed for user %{public}@ and device %{public}@: %{public}@", v115, 0x20u);
                }
                goto LABEL_48;
              }
              if (!v54
                || ![v54 count]
                || ([v54 objectAtIndexedSubscript:0],
                    v58 = objc_claimAutoreleasedReturnValue(),
                    [v58 lastUpdatedDate],
                    v59 = objc_claimAutoreleasedReturnValue(),
                    v58,
                    !v59))
              {
                v56 = +[STUILog usage];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  id v83 = [v51 altDSID];
                  uint64_t v68 = [v52 name];
                  *(_DWORD *)v115 = 138543874;
                  v116 = v83;
                  __int16 v117 = 2114;
                  uint64_t v118 = v68;
                  v69 = (void *)v68;
                  __int16 v119 = 2114;
                  id v120 = v54;
                  _os_log_error_impl(&dword_225B06000, v56, OS_LOG_TYPE_ERROR, "fetchLastUpdatedDate no usage for user %{public}@ and device %{public}@: %{public}@", v115, 0x20u);
                }
LABEL_48:

                v59 = 0;
              }

              v60 = [STUIDevice alloc];
              v61 = [v52 name];
              v62 = [v52 identifier];
              uint64_t v63 = [v52 platform];
              id v64 = [v52 localUserDeviceState];
              v65 = [(STUIDevice *)v60 initWithName:v61 identifier:v62 coreDuetIdentifier:v50 platform:v63 hasDeviceActivity:0 isLocalDevice:v64 != 0 lastFamilyCheckinDate:v59];

              [v91 addObject:v65];
              v66 = +[STUILog usage];
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                id v67 = [(STUIDevice *)v65 identifier];
                *(_DWORD *)v115 = 138543618;
                v116 = v50;
                __int16 v117 = 2114;
                uint64_t v118 = (uint64_t)v67;
                _os_log_impl(&dword_225B06000, v66, OS_LOG_TYPE_DEFAULT, "Screen Time Device added: %{public}@, %{public}@", v115, 0x16u);
              }
              v38 = v86;
              uint64_t v40 = v90;
              uint64_t v41 = v87;
            }

LABEL_53:
          }

          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = [v38 countByEnumeratingWithState:&v96 objects:v107 count:16];
      }
      while (v40);
    }

    v70 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
    v106[0] = v70;
    id v71 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"identifier" ascending:1];
    v106[1] = v71;
    id v72 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:2];
    uint64_t v73 = [v91 sortedArrayUsingDescriptors:v72];
    uint64_t v74 = *(void *)(*(void *)(v77 + 48) + 8);
    v75 = *(void **)(v74 + 40);
    *(void *)(v74 + 40) = v73;

    id v8 = v78;
    id v3 = v79;
    id v9 = v76;
  }
  else
  {
    v38 = +[STUILog persistence];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke_cold_1();
    }
  }
}

- (BOOL)hasAlreadyEnteredPINForSession
{
  return self->_hasAlreadyEnteredPINForSession;
}

- (void)setHasAlreadyEnteredPINForSession:(BOOL)a3
{
  self->_hasAlreadyEnteredPINForSession = a3;
}

- (STAdminPersistenceController)persistenceController
{
  return (STAdminPersistenceController *)objc_getProperty(self, a2, 56, 1);
}

- (STRootViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (STGroupFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
}

- (NSMutableDictionary)coordinatorsByChildDSID
{
  return self->_coordinatorsByChildDSID;
}

- (void)setCoordinatorsByChildDSID:(id)a3
{
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSNumber)usageReportType
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)usageContext
{
  return self->_usageContext;
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (BOOL)isLocalUser
{
  return self->_isLocalUser;
}

- (void)setIsLocalUser:(BOOL)a3
{
  self->_isLocalUser = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_usageReportType, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_coordinatorsByChildDSID, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_eyeReliefCoordinator, 0);
  objc_storeStrong((id *)&self->_communicationSafetyCoordinator, 0);
  objc_storeStrong((id *)&self->_contentPrivacyCoordinator, 0);
  objc_storeStrong((id *)&self->_timeAllowancesCoordinator, 0);

  objc_storeStrong((id *)&self->_usageDetailsCoordinator, 0);
}

- (id)defaultValueForRestrictionIdentifier:(id)a3
{
  id v4 = a3;
  if (STRestrictionTypeWithString_onceToken_0 != -1) {
    dispatch_once(&STRestrictionTypeWithString_onceToken_0, &__block_literal_global_16);
  }
  uint64_t v5 = [(id)STRestrictionTypeWithString_restrictionItemTypes_0 objectForKeyedSubscript:v4];
  if (v5)
  {
    id v6 = [v4 componentsSeparatedByString:@"."];
    uint64_t v7 = (void *)[v6 mutableCopy];

    id v8 = [v7 lastObject];
    [v7 removeLastObject];
    id v9 = [v7 componentsJoinedByString:@"."];
    uint64_t v10 = -[STRestrictionItem initWithConfiguration:restrictionKey:labelName:type:restrictionValue:]([STRestrictionItem alloc], "initWithConfiguration:restrictionKey:labelName:type:restrictionValue:", v9, v8, &stru_26D9391A8, [v5 unsignedIntegerValue], 0);
  }
  else
  {
    uint64_t v10 = 0;
  }

  if (!v10) {
    goto LABEL_9;
  }
  uint64_t v11 = [(STRootViewModelCoordinator *)self contentPrivacyCoordinator];
  id v12 = [v11 viewModel];
  uint64_t v13 = [(STRestrictionItem *)v10 rmConfiguration];
  id v14 = [(STRestrictionItem *)v10 payloadKey];
  id v15 = [v12 visibleRestrictionWithConfiguration:v13 key:v14];

  if (v15)
  {
    id v16 = [(STRootViewModelCoordinator *)self contentPrivacyCoordinator];
    id v17 = [v16 viewModel];
    char v18 = [v17 defaultValueForRestriction:v15];
  }
  else
  {
LABEL_9:
    char v18 = 0;
  }

  return v18;
}

- (void)loadValuesByRestrictionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STRootViewModelCoordinator *)self contentPrivacyCoordinator];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __101__STRootViewModelCoordinator_STRestrictionsDataSource__loadValuesByRestrictionWithCompletionHandler___block_invoke;
  v7[3] = &unk_264768440;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 loadValuesByRestrictionWithCompletionHandler:v7];
}

void __101__STRootViewModelCoordinator_STRestrictionsDataSource__loadValuesByRestrictionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v22 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = NSString;
        uint64_t v13 = [v11 rmConfiguration];
        id v14 = [v11 payloadKey];
        id v15 = [v12 stringWithFormat:@"%@.%@", v13, v14];

        id v16 = [v6 objectForKeyedSubscript:v11];
        [v5 setObject:v16 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    id v17 = NSNumber;
    char v18 = [*(id *)(a1 + 32) contentPrivacyCoordinator];
    id v19 = [v18 viewModel];
    id v20 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v19, "isSiriImageGenerationAllowed"));
    [v5 setObject:v20 forKeyedSubscript:@"STCustomRestrictionConfiguration.STCustomRestrictionImageGeneration"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to delete managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to save managed user blueprint: %{public}@", v2, v3, v4, v5, v6);
}

void __97__STRootViewModelCoordinator__setPIN_recoveryAltDSID_shouldSetRecoveryAppleID_completionHandler___block_invoke_378_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to save allowance: %{public}@", v2, v3, v4, v5, v6);
}

void __88__STRootViewModelCoordinator_enableManagementWithPIN_recoveryAltDSID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to enable remote management: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not save Communication Safety setup during onboarding: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_384_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) appAndWebsiteActivityEnabled];
  [v1 BOOLValue];
  OUTLINED_FUNCTION_2_1(&dword_225B06000, v2, v3, "Failed to set App & Website Activity state during onboarding to %@: %{public}@", v4, v5, v6, v7, 2u);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_391_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not save Downtime during onboarding: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_392_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not save App Limit during onboarding: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_395_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not enable Content & Privacy during onboarding: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 localizedDescription];
  OUTLINED_FUNCTION_2_1(&dword_225B06000, v2, v3, "Failed to save content restriction for item %{public}@ during onboarding: %@", v4, v5, v6, v7, 2u);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_398_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = *(unsigned __int8 *)(a1 + 41);
  uint64_t v5 = [a2 localizedDescription];
  v6[0] = 67240450;
  v6[1] = v4;
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_225B06000, a3, OS_LOG_TYPE_ERROR, "Failed to save Image Creation value %{public}d during onboarding: %@", (uint8_t *)v6, 0x12u);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_399_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not disable Content & Privacy during onboarding: %{public}@", v2, v3, v4, v5, v6);
}

void __79__STRootViewModelCoordinator_applyIntroductionViewModel_withCompletionHandler___block_invoke_402_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Could not save Screen Distance state: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Error fetching blueprints: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Error fetching installed bundle IDs: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch device details from DeviceActivity: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)loadViewModelFromManagedObjectContext:isLocalUser:userDSID:error:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "failed to get cloud sync status: %{public}@", v2, v3, v4, v5, v6);
}

void __44__STRootViewModelCoordinator_saveViewModel___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch categories for installed bundle identifiers: %{public}@", v2, v3, v4, v5, v6);
}

void __48__STRootViewModelCoordinator__willRefreshUsage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch local user: %{public}@", v2, v3, v4, v5, v6);
}

@end