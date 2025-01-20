@interface STContentPrivacyViewModelCoordinator
+ (NSSet)_remoteDeviceRestrictions;
+ (id)_coreAnalyticsEventWithRestrictionsEnabled:(BOOL)a3 valuesByRestriction:(id)a4 userType:(unint64_t)a5 userIsManaged:(BOOL)a6;
+ (id)_localDeviceRestrictions;
+ (id)appRatingsRestrictionItem;
+ (void)_remoteDeviceRestrictions;
- (BOOL)isLocalDevice;
- (NSArray)fetchedResultsControllers;
- (NSManagedObjectID)userObjectID;
- (NSMutableDictionary)configurationPayloadsByType;
- (NSNumber)isRestrictAdultContentEnabledValue;
- (NSNumber)userDSID;
- (NSString)userName;
- (STContentPrivacyViewModel)viewModel;
- (STContentPrivacyViewModelCoordinator)initWithPersistenceController:(id)a3 organizationSettingsRestrictionUtility:(id)a4 userDSID:(id)a5 userName:(id)a6;
- (STContentPrivacyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4 userName:(id)a5;
- (STOrganizationSettingsRestrictionUtilityProtocol)organizationSettingsRestrictionUtility;
- (STPersistenceControllerProtocol)persistenceController;
- (id)_createUnrestrictedConfigurationForUser:(id)a3 withType:(id)a4;
- (id)_restrictionsForWebFilterState:(unint64_t)a3;
- (id)_valueForMCFeature:(id)a3;
- (id)_valueForSBCapability:(id)a3;
- (id)_valueForWebFilterState;
- (id)_valueInConfiguration:(id)a3 keyPath:(id)a4;
- (id)_valuesByRestriction;
- (id)_visibleRestrictions;
- (id)createValuesForRestrictions:(id)a3 multiplayerRestriction:(id)a4;
- (id)valueForRestriction:(id)a3;
- (unint64_t)numExpectedChanges;
- (void)_registerForPersistentStoreNotifications;
- (void)_reportCoreAnalyticsEventForChangedCommunicationLimits:(id)a3 userType:(unint64_t)a4 userIsRemote:(BOOL)a5;
- (void)_reportCoreAnalyticsEventWithRestrictionsEnabled:(BOOL)a3 valuesByRestriction:(id)a4 userType:(unint64_t)a5 userIsManaged:(BOOL)a6;
- (void)_setValue:(id)a3 forMCFeature:(id)a4;
- (void)_setValue:(id)a3 forSBCapability:(id)a4;
- (void)_updateConfiguration:(id)a3 keyPath:(id)a4 value:(id)a5;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)loadValuesByRestrictionWithCompletionHandler:(id)a3;
- (void)loadViewModelWithCompletionHandler:(id)a3;
- (void)reloadViewModelForRemoteChanges;
- (void)saveCommunicationLimits:(id)a3 completionHandler:(id)a4;
- (void)saveContentPrivacyEnabled:(BOOL)a3 completionHandler:(id)a4;
- (void)saveRestrictionValue:(id)a3 forItem:(id)a4 completionHandler:(id)a5;
- (void)saveSiriImageGenerationIsAllowed:(BOOL)a3 completionHandler:(id)a4;
- (void)saveValuesForRestrictions:(id)a3 completionHandler:(id)a4;
- (void)setConfigurationPayloadsByType:(id)a3;
- (void)setFetchedResultsControllers:(id)a3;
- (void)setIsLocalDevice:(BOOL)a3;
- (void)setIsRestrictAdultContentEnabledValue:(id)a3;
- (void)setNumExpectedChanges:(unint64_t)a3;
- (void)setUserDSID:(id)a3;
- (void)setUserName:(id)a3;
- (void)setUserObjectID:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation STContentPrivacyViewModelCoordinator

- (STContentPrivacyViewModelCoordinator)initWithPersistenceController:(id)a3 userDSID:(id)a4 userName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = (void *)[objc_alloc(MEMORY[0x263F671E8]) initWithPersistenceController:v10 restrictionPayloadUtility:v11];
  v13 = [(STContentPrivacyViewModelCoordinator *)self initWithPersistenceController:v10 organizationSettingsRestrictionUtility:v12 userDSID:v9 userName:v8];

  return v13;
}

- (STContentPrivacyViewModelCoordinator)initWithPersistenceController:(id)a3 organizationSettingsRestrictionUtility:(id)a4 userDSID:(id)a5 userName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)STContentPrivacyViewModelCoordinator;
  v15 = [(STContentPrivacyViewModelCoordinator *)&v32 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_persistenceController, a3);
    objc_storeStrong((id *)&v16->_organizationSettingsRestrictionUtility, a4);
    uint64_t v17 = [v13 copy];
    userDSID = v16->_userDSID;
    v16->_userDSID = (NSNumber *)v17;

    uint64_t v19 = [v14 copy];
    userName = v16->_userName;
    v16->_userName = (NSString *)v19;

    v16->_isLocalDevice = 0;
    uint64_t v21 = objc_opt_new();
    viewModel = v16->_viewModel;
    v16->_viewModel = (STContentPrivacyViewModel *)v21;

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __127__STContentPrivacyViewModelCoordinator_initWithPersistenceController_organizationSettingsRestrictionUtility_userDSID_userName___block_invoke;
    v29 = &unk_264767160;
    id v30 = v13;
    v23 = v16;
    v31 = v23;
    [(STContentPrivacyViewModelCoordinator *)v23 loadViewModelWithCompletionHandler:&v26];
    [(STContentPrivacyViewModelCoordinator *)v23 _registerForPersistentStoreNotifications];
    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v23 selector:sel__contactStoreDidChange_ name:*MEMORY[0x263EFE118] object:0];
  }
  return v16;
}

void __127__STContentPrivacyViewModelCoordinator_initWithPersistenceController_organizationSettingsRestrictionUtility_userDSID_userName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = +[STUILog persistence];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __127__STContentPrivacyViewModelCoordinator_initWithPersistenceController_organizationSettingsRestrictionUtility_userDSID_userName___block_invoke_cold_1();
    }
  }
  else
  {
    v4 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = [*(id *)(a1 + 40) userName];
      int v7 = [*(id *)(a1 + 40) isLocalDevice];
      int v8 = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 1026;
      int v13 = v7;
      _os_log_impl(&dword_225B06000, v4, OS_LOG_TYPE_DEFAULT, "Editing Content & Privacy for user %@ name %@ on local device %{public}d", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

+ (id)appRatingsRestrictionItem
{
  v2 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"ratingApps" labelName:@"AppsSpecifierName" type:3 restrictionValue:0];

  return v2;
}

+ (NSSet)_remoteDeviceRestrictions
{
  v82[64] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF960] autoupdatingCurrentLocale];
  id v3 = [v2 countryCode];
  if (!v3)
  {
    v4 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[STContentPrivacyViewModelCoordinator _remoteDeviceRestrictions](v4);
    }
  }
  int v5 = [v3 isEqual:@"CN"];
  v6 = @"MusicPodcastsNewsWorkoutsSpecifierName";
  if (v5) {
    v6 = @"MusicPodcastsWorkoutsSpecifierName";
  }
  int v7 = v6;

  int v8 = [MEMORY[0x263F82670] currentDevice];
  int v9 = objc_msgSend(v8, "sf_isChinaRegionCellularDevice");

  if (v9) {
    __int16 v10 = @"AADC_WirelessChangesSpecifierName";
  }
  else {
    __int16 v10 = @"AADC_CellularChangesSpecifierName";
  }
  id v69 = (id)MEMORY[0x263EFFA08];
  v81 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowAppInstallation" labelName:@"InstallingAppsSpecifierName" type:0 restrictionValue:0];
  v82[0] = v81;
  v80 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowUIAppInstallation" labelName:@"InstallingUIAppsSpecifierName" type:0 restrictionValue:0];
  v82[1] = v80;
  v79 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowMarketplaceAppInstallation" labelName:@"InstallingMarketplaceAppsSpecifierName" type:0 restrictionValue:0];
  v82[2] = v79;
  v78 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowWebDistributionAppInstallation" labelName:@"InstallingWebDistributionAppsSpecifierName" type:0 restrictionValue:0];
  v82[3] = v78;
  v77 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowAppRemoval" labelName:@"DeletingAppsSpecifierName" type:0 restrictionValue:0];
  v82[4] = v77;
  v76 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowInAppPurchases" labelName:@"IAPSpecifierName" type:0 restrictionValue:0];
  v82[5] = v76;
  v75 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"forceITunesStorePasswordEntry" labelName:@"RequirePasswordLabel" type:1 restrictionValue:0];
  v82[6] = v75;
  v74 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"blacklistedAppBundleIDs" labelName:&stru_26D9391A8 type:2 restrictionValue:0];
  v82[7] = v74;
  v73 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"allowiTunes" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[8] = v73;
  v72 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"allowNews" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[9] = v72;
  v71 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"allowSafari" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[10] = v71;
  v68 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"allowPodcasts" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[11] = v68;
  v67 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"allowVideoConferencing" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[12] = v67;
  v66 = [[STRestrictionItem alloc] initWithConfiguration:@"legacy.restrictions.apps" restrictionKey:@"allowGroupActivity" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[13] = v66;
  v65 = [[STRestrictionItem alloc] initWithConfiguration:@"media.settings" restrictionKey:@"allowBookstore" labelName:@"iBookstoreSpecifierName" type:0 restrictionValue:0];
  v82[14] = v65;
  v64 = [[STRestrictionItem alloc] initWithConfiguration:@"system.camera" restrictionKey:@"allowCamera" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[15] = v64;
  v63 = [[STRestrictionItem alloc] initWithConfiguration:@"system.airdrop" restrictionKey:@"allowAirDrop" labelName:@"AirDropSpecifierName" type:0 restrictionValue:0];
  v82[16] = v63;
  v62 = [[STRestrictionItem alloc] initWithConfiguration:@"system.carplay" restrictionKey:@"allowVehicleUI" labelName:@"CarPlaySpecifierName" type:0 restrictionValue:0];
  v82[17] = v62;
  id v11 = [STRestrictionItem alloc];
  v61 = +[STRegionRatings sharedRatings];
  v60 = [v61 preferredRegion];
  v59 = [(STRestrictionItem *)v11 initWithConfiguration:@"system.ratings" restrictionKey:@"ratingRegion" labelName:@"RatingForSpecifierName" type:3 restrictionValue:v60];
  v82[18] = v59;
  v58 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"allowExplicitContent" labelName:v7 type:0 restrictionValue:0];

  v82[19] = v58;
  v57 = [[STRestrictionItem alloc] initWithConfiguration:@"system.music" restrictionKey:@"allowMusicVideos" labelName:@"MusicVideosSpecifierName" type:0 restrictionValue:0];
  v82[20] = v57;
  v56 = [[STRestrictionItem alloc] initWithConfiguration:@"system.music" restrictionKey:@"allowMusicArtistActivity" labelName:@"MusicProfilesSpecifierName" type:0 restrictionValue:0];
  v82[21] = v56;
  v55 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"ratingMovies" labelName:@"MoviesSpecifierName" type:3 restrictionValue:&unk_26D966FD0];
  v82[22] = v55;
  v54 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"allowShowingUndownloadedMovies" labelName:@"UndownloadedMoviesSpecifierName" type:0 restrictionValue:0];
  v82[23] = v54;
  v53 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"ratingTVShows" labelName:@"TVSpecifierName" type:3 restrictionValue:&unk_26D966FD0];
  v82[24] = v53;
  v52 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"allowShowingUndownloadedTV" labelName:@"UndownloadedTVSpecifierName" type:0 restrictionValue:0];
  v82[25] = v52;
  v51 = [[STRestrictionItem alloc] initWithConfiguration:@"media.settings" restrictionKey:@"allowBookstoreErotica" labelName:@"BooksSpecifierName" type:0 restrictionValue:0];
  v82[26] = v51;
  v50 = [[STRestrictionItem alloc] initWithConfiguration:@"system.ratings" restrictionKey:@"ratingApps" labelName:@"AppsSpecifierName" type:3 restrictionValue:&unk_26D966FD0];
  v82[27] = v50;
  v49 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowAppClips" labelName:@"AppClipsSpecifierName" type:0 restrictionValue:0];
  v82[28] = v49;
  v48 = [[STRestrictionItem alloc] initWithConfiguration:@"STCustomRestrictionConfiguration" restrictionKey:@"STCustomRestrictionWebFilterState" labelName:@"WebContentSpecifierName" type:3 restrictionValue:&unk_26D966FE8];
  v82[29] = v48;
  v47 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"useContentFilter" labelName:@"LimitAdultWebsitesSpecifierName" type:1 restrictionValue:0];
  v82[30] = v47;
  v46 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"whiteListEnabled" labelName:@"AllowedWebsitesSpecifierName" type:1 restrictionValue:0];
  v82[31] = v46;
  v45 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"siteWhiteList" labelName:@"AADC_OnlyAllowLabel" type:2 restrictionValue:0];
  v82[32] = v45;
  v44 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"filterWhiteList" labelName:@"AlwaysAllowLabel" type:2 restrictionValue:0];
  v82[33] = v44;
  v43 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"filterBlackList" labelName:@"NeverAllowLabel" type:2 restrictionValue:0];
  v82[34] = v43;
  v42 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowMultiplayerGaming" labelName:@"MultiplayerGamesSpecifierName" type:0 restrictionValue:0];
  v82[35] = v42;
  v41 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowedGameCenterOtherPlayerTypes" labelName:@"MultiplayerGamesSpecifierName" type:3 restrictionValue:&unk_26D967000];
  v82[36] = v41;
  v40 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowAddingGameCenterFriends" labelName:@"AddingFriendsSpecifierName" type:0 restrictionValue:0];
  v82[37] = v40;
  v39 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterFriendsSharingModification" labelName:@"ConnectWithFriendsSpecifierName" type:0 restrictionValue:0];
  v82[38] = v39;
  v38 = [[STRestrictionItem alloc] initWithConfiguration:@"system.camera" restrictionKey:@"allowScreenRecording" labelName:@"ScreenRecordingSpecifierName" type:0 restrictionValue:0];
  v82[39] = v38;
  v37 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterNearbyMultiplayer" labelName:@"NearbyMultiplayerSpecifierName" type:0 restrictionValue:0];
  v82[40] = v37;
  v36 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterPrivateMessaging" labelName:@"PrivateMessagingSpecifierName" type:0 restrictionValue:0];
  v82[41] = v36;
  v35 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterProfilePrivacyModification" labelName:@"ProfilePrivacyChangesSpecifierName" type:0 restrictionValue:0];
  v82[42] = v35;
  v34 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterProfileModification" labelName:@"AvatarNicknameChangesSpecifierName" type:0 restrictionValue:0];
  v82[43] = v34;
  v33 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowAssistant" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[44] = v33;
  objc_super v32 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowDictation" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[45] = v32;
  v31 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowAssistantUserGeneratedContent" labelName:@"WebSearchContentSpecifierName" type:0 restrictionValue:0];
  v82[46] = v31;
  id v30 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"forceAssistantProfanityFilter" labelName:@"ExplicitLanguageSpecifierName" type:1 restrictionValue:0];
  v82[47] = v30;
  v29 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowMathPaperSolving" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[48] = v29;
  v28 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowKeyboardMathSolving" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[49] = v28;
  uint64_t v27 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowWritingTools" labelName:@"WritingToolsSpecifierName" type:0 restrictionValue:0];
  v82[50] = v27;
  uint64_t v26 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowExternalIntelligenceIntegrations" labelName:@"ChatGPTSpecifierName" type:0 restrictionValue:0];
  v82[51] = v26;
  v25 = [[STRestrictionItem alloc] initWithConfiguration:@"STCustomRestrictionConfiguration" restrictionKey:@"STCustomRestrictionSiriDictation" labelName:@"SiriDictationSpecifierName" type:0 restrictionValue:0];
  v82[52] = v25;
  v24 = [[STRestrictionItem alloc] initWithConfiguration:@"STCustomRestrictionConfiguration" restrictionKey:@"STCustomRestrictionMathResults" labelName:@"MathResultsSpecifierName" type:0 restrictionValue:0];
  v82[53] = v24;
  v23 = [[STRestrictionItem alloc] initWithConfiguration:@"system.icloud" restrictionKey:@"allowFindMyFriendsModification" labelName:@"ShareLocationSpecifierName" type:0 restrictionValue:0];
  v82[54] = v23;
  __int16 v12 = [[STRestrictionItem alloc] initWithConfiguration:@"passcode.settings" restrictionKey:@"allowPasscodeModification" labelName:@"AADC_PasscodeAndFaceIDSpecifierName" type:0 restrictionValue:0];
  v82[55] = v12;
  int v13 = [[STRestrictionItem alloc] initWithConfiguration:@"account.settings" restrictionKey:@"allowAccountModification" labelName:@"AADC_AccountChangesSpecifierName" type:0 restrictionValue:0];
  v82[56] = v13;
  uint64_t v14 = [[STRestrictionItem alloc] initWithConfiguration:@"system.music" restrictionKey:@"allowSpeakerVolumeLimitModification" labelName:@"SpeakerVolumeLimitModificationSpecifier" type:0 restrictionValue:0];
  v82[57] = v14;
  v15 = [[STRestrictionItem alloc] initWithConfiguration:@"STCustomRestrictionConfiguration" restrictionKey:@"STCustomRestrictionCellularData" labelName:v10 type:0 restrictionValue:0];
  v82[58] = v15;
  v16 = [[STRestrictionItem alloc] initWithConfiguration:@"network.cellular.settings" restrictionKey:@"allowAppCellularDataModification" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[59] = v16;
  uint64_t v17 = [[STRestrictionItem alloc] initWithConfiguration:@"network.cellular.settings" restrictionKey:@"allowCellularPlanModification" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  v82[60] = v17;
  v18 = [[STRestrictionItem alloc] initWithConfiguration:@"system.donotdisturb" restrictionKey:@"allowDriverDoNotDisturbModifications" labelName:@"DrivingFocusSpecifierName" type:0 restrictionValue:0];
  v82[61] = v18;
  uint64_t v19 = [[STRestrictionItem alloc] initWithConfiguration:@"system.tvprovider" restrictionKey:@"allowTVProviderModification" labelName:@"TVProviderSpecifierName" type:0 restrictionValue:0];
  v82[62] = v19;
  v20 = [[STRestrictionItem alloc] initWithConfiguration:@"application.settings" restrictionKey:@"allowAutomaticAppUpdatesModification" labelName:@"AADC_BackgroundAppActivitiesSpecifierName" type:0 restrictionValue:0];
  v82[63] = v20;
  uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:64];
  id v70 = [v69 setWithArray:v21];

  return (NSSet *)v70;
}

+ (id)_localDeviceRestrictions
{
  v18[12] = *MEMORY[0x263EF8340];
  v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"location" labelName:@"LocationServicesSpecifierName" type:0 restrictionValue:0];
  v18[0] = v17;
  v16 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceAddressBook" labelName:@"ContactsSpecifierName" type:0 restrictionValue:0];
  v18[1] = v16;
  uint64_t v14 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceCalendar" labelName:@"CalendarsSpecifierName" type:0 restrictionValue:0];
  v18[2] = v14;
  int v13 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceReminders" labelName:@"RemindersSpecifierName" type:0 restrictionValue:0];
  v18[3] = v13;
  v2 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServicePhotos" labelName:@"PhotosSpecifierName" type:0 restrictionValue:0];
  v18[4] = v2;
  id v3 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceBluetoothAlways" labelName:@"BluetoothSharingSpecifierName" type:0 restrictionValue:0];
  v18[5] = v3;
  v4 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceMicrophone" labelName:@"MicrophoneSpecifierName" type:0 restrictionValue:0];
  v18[6] = v4;
  int v5 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceSpeechRecognition" labelName:@"SpeechRecognitionSpecifierName" type:0 restrictionValue:0];
  v18[7] = v5;
  v6 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"advertising" labelName:@"AdvertisingSpecifierName" type:0 restrictionValue:0];
  v18[8] = v6;
  int v7 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceMediaLibrary" labelName:@"MediaAppleMusicSpecifierName" type:0 restrictionValue:0];
  v18[9] = v7;
  int v8 = [[STRestrictionItem alloc] initWithConfiguration:@"system.web.tracking" restrictionKey:@"forceLimitAdTracking" labelName:@"UserTrackingSpecifierName" type:1 restrictionValue:0];
  v18[10] = v8;
  int v9 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"volumeLimit" labelName:@"ReduceLoudAudioSpecifierName" type:0 restrictionValue:0];
  v18[11] = v9;
  __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:12];
  id v11 = [v15 setWithArray:v10];

  return v11;
}

- (id)_visibleRestrictions
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = +[STContentPrivacyViewModelCoordinator _remoteDeviceRestrictions];
  int v5 = [v3 setWithSet:v4];

  if ([(STContentPrivacyViewModelCoordinator *)self isLocalDevice])
  {
    v6 = +[STContentPrivacyViewModelCoordinator _localDeviceRestrictions];
    [v5 unionSet:v6];
  }

  return v5;
}

- (id)_valueForMCFeature:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F53C50] sharedConnection];
  int v5 = [v4 effectiveValueForSetting:v3];

  v6 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[STContentPrivacyViewModelCoordinator _valueForMCFeature:]();
  }

  return v5;
}

- (void)_setValue:(id)a3 forMCFeature:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[STContentPrivacyViewModelCoordinator _setValue:forMCFeature:]();
  }

  int v8 = [MEMORY[0x263F53C50] sharedConnection];
  objc_msgSend(v8, "setBoolValue:forSetting:", objc_msgSend(v5, "BOOLValue"), v6);
}

- (id)_valueForSBCapability:(id)a3
{
  id v3 = a3;
  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F67398], (CFStringRef)*MEMORY[0x263F673A0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  int v5 = [v4 containsObject:v3];
  id v6 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[STContentPrivacyViewModelCoordinator _valueForSBCapability:]();
  }

  if (v5) {
    int v7 = (void *)MEMORY[0x263EFFA80];
  }
  else {
    int v7 = (void *)MEMORY[0x263EFFA88];
  }
  id v8 = v7;

  return v8;
}

- (void)_setValue:(id)a3 forSBCapability:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[STContentPrivacyViewModelCoordinator _setValue:forSBCapability:]();
  }

  CFStringRef v9 = (const __CFString *)*MEMORY[0x263F67398];
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263F673A0];
  id v11 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F67398], (CFStringRef)*MEMORY[0x263F673A0]);
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v11 = (void *)MEMORY[0x263EFFA68];
  }
  __int16 v12 = [MEMORY[0x263EFF9C0] setWithArray:v11];
  if ([v6 BOOLValue]) {
    [v12 removeObject:v7];
  }
  else {
    [v12 addObject:v7];
  }
  if ([v12 count]) {
    int v13 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    int v13 = 0;
  }
  uint64_t v14 = [v12 allObjects];

  CFPreferencesSetAppValue(v9, v14, v10);
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x263F673A8], v13, v10);
  CFPreferencesAppSynchronize(v10);
  notify_post("com.apple.locationd/Restrictions");
  notify_post("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification");
  int v15 = [v11 containsObject:v7];
  v16 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  if (![v16 hasPasscode]
    || ![v7 isEqualToString:@"location"])
  {
    goto LABEL_16;
  }
  int v17 = [v6 BOOLValue];

  if (v15 == v17)
  {
    [v6 BOOLValue];
    v16 = objc_opt_new();
    v18 = objc_opt_new();
    [v16 postNotificationForContext:v18];

LABEL_16:
  }
}

- (id)_valueForWebFilterState
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [(STContentPrivacyViewModelCoordinator *)self isRestrictAdultContentEnabledValue];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    int v5 = [(STContentPrivacyViewModelCoordinator *)self isRestrictAdultContentEnabledValue];
    id v6 = [(STContentPrivacyViewModelCoordinator *)self isRestrictAdultContentEnabledValue];
  }
  else
  {
    id v7 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"restrictWeb" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    int v5 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v7];

    id v8 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"useContentFilter" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    id v6 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v8];
  }
  CFStringRef v9 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"whiteListEnabled" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  CFStringRef v10 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v9];

  if ([v5 BOOLValue])
  {
    if ([v6 BOOLValue] && !objc_msgSend(v10, "BOOLValue"))
    {
      int v15 = &unk_26D967018;
    }
    else
    {
      if (([v6 BOOLValue] & 1) != 0 || (objc_msgSend(v10, "BOOLValue") & 1) == 0)
      {
        id v11 = [(STContentPrivacyViewModelCoordinator *)self configurationPayloadsByType];
        __int16 v12 = [v11 objectForKeyedSubscript:@"system.webcontentfilter.basic"];

        int v13 = [v12 serialize];
        uint64_t v14 = +[STUILog contentPrivacy];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          int v17 = 138544130;
          v18 = v5;
          __int16 v19 = 2114;
          v20 = v6;
          __int16 v21 = 2114;
          v22 = v10;
          __int16 v23 = 2112;
          v24 = v13;
          _os_log_fault_impl(&dword_225B06000, v14, OS_LOG_TYPE_FAULT, "Unknown web filter state\n%{public}@ %{public}@ %{public}@ %@", (uint8_t *)&v17, 0x2Au);
        }
      }
      int v15 = &unk_26D967030;
    }
  }
  else
  {
    int v15 = &unk_26D966FE8;
  }

  return v15;
}

- (id)_restrictionsForWebFilterState:(unint64_t)a3
{
  v51[3] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 2uLL:
      __int16 v12 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"restrictWeb" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v46[0] = v12;
      uint64_t v13 = MEMORY[0x263EFFA88];
      v47[0] = MEMORY[0x263EFFA88];
      uint64_t v14 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"useContentFilter" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v46[1] = v14;
      v47[1] = MEMORY[0x263EFFA80];
      int v15 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"whiteListEnabled" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v46[2] = v15;
      v47[2] = v13;
      v16 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
      int v5 = (STRestrictionItem *)[v16 mutableCopy];

      int v17 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"siteWhiteList" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v18 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v17];

      if (!v18)
      {
        v40 = v5;
        __int16 v19 = [MEMORY[0x263F53C50] sharedConnection];
        v20 = [v19 defaultUserBookmarks];

        __int16 v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v20, "count"));
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              v28 = (void *)MEMORY[0x263F33398];
              v29 = [v27 URL];
              id v30 = [v29 absoluteString];
              v31 = [v27 title];
              objc_super v32 = [v28 buildWithAddress:v30 withPageTitle:v31];

              [v21 addObject:v32];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
          }
          while (v24);
        }

        v33 = (void *)[v21 copy];
        v34 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"siteWhiteList" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
        int v5 = v40;
        [(STRestrictionItem *)v40 setObject:v33 forKeyedSubscript:v34];
      }
      v35 = (void *)[(STRestrictionItem *)v5 copy];
      goto LABEL_17;
    case 1uLL:
      int v5 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"restrictWeb" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v48[0] = v5;
      uint64_t v36 = MEMORY[0x263EFFA88];
      v49[0] = MEMORY[0x263EFFA88];
      id v7 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"useContentFilter" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v48[1] = v7;
      v49[1] = v36;
      id v8 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"whiteListEnabled" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v48[2] = v8;
      v49[2] = MEMORY[0x263EFFA80];
      CFStringRef v9 = NSDictionary;
      CFStringRef v10 = v49;
      id v11 = v48;
      goto LABEL_16;
    case 0uLL:
      int v5 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"restrictWeb" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v50[0] = v5;
      uint64_t v6 = MEMORY[0x263EFFA80];
      v51[0] = MEMORY[0x263EFFA80];
      id v7 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"useContentFilter" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v50[1] = v7;
      v51[1] = v6;
      id v8 = [[STRestrictionItem alloc] initWithConfiguration:@"system.webcontentfilter.basic" restrictionKey:@"whiteListEnabled" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v50[2] = v8;
      v51[2] = v6;
      CFStringRef v9 = NSDictionary;
      CFStringRef v10 = v51;
      id v11 = v50;
LABEL_16:
      v35 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:3];

LABEL_17:
      goto LABEL_19;
  }
  v38 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STContentPrivacyViewModel.m", 661, @"Unimplemented web filter state %d", a3);

  v35 = (void *)MEMORY[0x263EFFA78];
LABEL_19:

  return v35;
}

- (id)valueForRestriction:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 rmConfiguration];
  id v7 = [v5 payloadKey];

  if (![v6 isEqualToString:@"STCustomRestrictionConfiguration"])
  {
    if ([v6 isEqualToString:@"STMCFeatureConfiguration"])
    {
      uint64_t v15 = [(STContentPrivacyViewModelCoordinator *)self _valueForMCFeature:v7];
    }
    else
    {
      if (![v6 isEqualToString:@"STSBCapabilityConfiguration"])
      {
        uint64_t v26 = STSupportedConfigurations();
        uint64_t v27 = [v26 objectForKeyedSubscript:v6];

        if (!v27)
        {
          v31 = [MEMORY[0x263F08690] currentHandler];
          [v31 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 718, @"Unimplemented configuration %@", v6 object file lineNumber description];
        }
        v28 = [(STContentPrivacyViewModelCoordinator *)self configurationPayloadsByType];
        __int16 v12 = [v28 objectForKeyedSubscript:v6];

        if (v12)
        {
          id v25 = [(STContentPrivacyViewModelCoordinator *)self _valueInConfiguration:v12 keyPath:v7];
LABEL_28:

          goto LABEL_36;
        }
        goto LABEL_40;
      }
      uint64_t v15 = [(STContentPrivacyViewModelCoordinator *)self _valueForSBCapability:v7];
    }
LABEL_35:
    id v25 = (id)v15;
    goto LABEL_36;
  }
  if ([v7 isEqualToString:@"STCustomRestrictionCellularData"])
  {
    id v8 = @"network.cellular.settings";
    CFStringRef v9 = [[STRestrictionItem alloc] initWithConfiguration:@"network.cellular.settings" restrictionKey:@"allowAppCellularDataModification" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    uint64_t v10 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v9];

    id v11 = (void *)MEMORY[0x263EFFA88];
    if (v10) {
      __int16 v12 = (void *)v10;
    }
    else {
      __int16 v12 = (void *)MEMORY[0x263EFFA88];
    }
    uint64_t v13 = [STRestrictionItem alloc];
    uint64_t v14 = @"allowCellularPlanModification";
LABEL_21:
    v20 = [(STRestrictionItem *)v13 initWithConfiguration:v8 restrictionKey:v14 labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    uint64_t v21 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v20];

    if (v21) {
      id v22 = (void *)v21;
    }
    else {
      id v22 = v11;
    }
    int v23 = [v12 BOOLValue];
    uint64_t v24 = (void *)MEMORY[0x263EFFA80];
    if (v23 && [v22 BOOLValue]) {
      uint64_t v24 = v11;
    }
    id v25 = v24;

    goto LABEL_28;
  }
  if ([v7 isEqualToString:@"STCustomRestrictionSiriDictation"])
  {
    id v8 = @"system.siri";
    v16 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowAssistant" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    uint64_t v17 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v16];

    id v11 = (void *)MEMORY[0x263EFFA88];
    if (v17) {
      __int16 v12 = (void *)v17;
    }
    else {
      __int16 v12 = (void *)MEMORY[0x263EFFA88];
    }
    uint64_t v13 = [STRestrictionItem alloc];
    uint64_t v14 = @"allowDictation";
    goto LABEL_21;
  }
  if ([v7 isEqualToString:@"STCustomRestrictionMathResults"])
  {
    id v8 = @"system.siri";
    v18 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowMathPaperSolving" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    uint64_t v19 = [(STContentPrivacyViewModelCoordinator *)self valueForRestriction:v18];

    id v11 = (void *)MEMORY[0x263EFFA88];
    if (v19) {
      __int16 v12 = (void *)v19;
    }
    else {
      __int16 v12 = (void *)MEMORY[0x263EFFA88];
    }
    uint64_t v13 = [STRestrictionItem alloc];
    uint64_t v14 = @"allowKeyboardMathSolving";
    goto LABEL_21;
  }
  if ([v7 isEqualToString:@"STCustomRestrictionWebFilterState"])
  {
    uint64_t v15 = [(STContentPrivacyViewModelCoordinator *)self _valueForWebFilterState];
    goto LABEL_35;
  }
  id v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 711, @"Unimplemented key %@", v7 object file lineNumber description];

LABEL_40:
  id v25 = 0;
LABEL_36:

  return v25;
}

- (id)_valuesByRestriction
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  int v4 = [v3 visibleRestrictions];

  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        __int16 v12 = -[STContentPrivacyViewModelCoordinator valueForRestriction:](self, "valueForRestriction:", v11, (void)v14);
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_registerForPersistentStoreNotifications
{
  id v3 = [(STContentPrivacyViewModelCoordinator *)self persistenceController];
  int v4 = [v3 viewContext];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__STContentPrivacyViewModelCoordinator__registerForPersistentStoreNotifications__block_invoke;
  v6[3] = &unk_264767078;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [v5 performBlockAndWait:v6];
}

void __80__STContentPrivacyViewModelCoordinator__registerForPersistentStoreNotifications__block_invoke(uint64_t a1)
{
  v26[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) userDSID];
  uint64_t v3 = *MEMORY[0x263F672C8];
  int v4 = [MEMORY[0x263F67108] fetchRequestMatchingBlueprintsForUserWithDSID:v2 ofType:*MEMORY[0x263F672C8]];
  uint64_t v5 = MEMORY[0x263EFFA68];
  [v4 setSortDescriptors:MEMORY[0x263EFFA68]];
  uint64_t v19 = v4;
  uint64_t v6 = [objc_alloc(MEMORY[0x263EFF270]) initWithFetchRequest:v4 managedObjectContext:*(void *)(a1 + 40) sectionNameKeyPath:0 cacheName:0];
  v20 = (void *)v2;
  id v7 = [MEMORY[0x263F67110] fetchRequestMatchingBlueprintsForUserWithDSID:v2 ofType:v3];
  [v7 setSortDescriptors:v5];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF270]) initWithFetchRequest:v7 managedObjectContext:*(void *)(a1 + 40) sectionNameKeyPath:0 cacheName:0];
  uint64_t v9 = [MEMORY[0x263F67160] fetchRequest];
  [v9 setSortDescriptors:v5];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF270]) initWithFetchRequest:v9 managedObjectContext:*(void *)(a1 + 40) sectionNameKeyPath:0 cacheName:0];
  v18 = (void *)v6;
  v26[0] = v6;
  v26[1] = v8;
  v26[2] = v10;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:3];
  [*(id *)(a1 + 32) setFetchedResultsControllers:v11];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  __int16 v12 = [*(id *)(a1 + 32) fetchedResultsControllers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v17 performFetch:0];
        [v17 setDelegate:*(void *)(a1 + 32)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  if ([(STContentPrivacyViewModelCoordinator *)self numExpectedChanges])
  {
    [(STContentPrivacyViewModelCoordinator *)self setNumExpectedChanges:[(STContentPrivacyViewModelCoordinator *)self numExpectedChanges] - 1];
    uint64_t v8 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[STContentPrivacyViewModelCoordinator controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:](self);
    }
  }
  else
  {
    uint64_t v9 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[STContentPrivacyViewModelCoordinator controller:didChangeObject:atIndexPath:forChangeType:newIndexPath:](v9);
    }

    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_reloadViewModelForRemoteChanges object:0];
    [(STContentPrivacyViewModelCoordinator *)self performSelector:sel_reloadViewModelForRemoteChanges withObject:0 afterDelay:0.0];
  }
}

- (void)reloadViewModelForRemoteChanges
{
  uint64_t v3 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  [v3 setIsLoaded:0];

  [(STContentPrivacyViewModelCoordinator *)self loadViewModelWithCompletionHandler:&__block_literal_global_7];
}

void __71__STContentPrivacyViewModelCoordinator_reloadViewModelForRemoteChanges__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __71__STContentPrivacyViewModelCoordinator_reloadViewModelForRemoteChanges__block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v3 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_225B06000, v3, OS_LOG_TYPE_DEFAULT, "Content & Privacy reloading because of remote change", v4, 2u);
    }
  }
}

- (id)_createUnrestrictedConfigurationForUser:(id)a3 withType:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl(&dword_225B06000, v9, OS_LOG_TYPE_DEFAULT, "Creating new restriction configuration %{public}@", buf, 0xCu);
  }

  uint64_t v10 = [v8 contentPrivacyConfigurationIdentifierForType:v7];

  if ([v7 isEqualToString:@"account.settings"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33328];
LABEL_41:
    uint64_t v13 = [v11 buildRequiredOnlyWithIdentifier:v10];
    goto LABEL_42;
  }
  if ([v7 isEqualToString:@"application.settings"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33338];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"application.store"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33340];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"legacy.restrictions.apps"])
  {
    __int16 v12 = [MEMORY[0x263F33350] buildRequiredOnlyWithIdentifier:v10];
    [v12 setPayloadBlacklistedAppBundleIDs:MEMORY[0x263EFFA68]];
    goto LABEL_43;
  }
  if ([v7 isEqualToString:@"media.settings"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33358];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"network.cellular.settings"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33360];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"passcode.settings"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33368];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.airdrop"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F33388];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.camera"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333A0];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.carplay"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333A8];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.donotdisturb"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333B0];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.gamecenter"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333B8];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.icloud"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333E8];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.music"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333C0];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.ratings"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333C8];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.siri"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333D0];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.tvprovider"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333D8];
    goto LABEL_41;
  }
  if ([v7 isEqualToString:@"system.webcontentfilter.basic"])
  {
    uint64_t v13 = [MEMORY[0x263F33390] buildRequiredOnlyWithIdentifier:v10 withRestrictWeb:MEMORY[0x263EFFA80]];
LABEL_42:
    __int16 v12 = (void *)v13;
    goto LABEL_43;
  }
  if ([v7 isEqualToString:@"system.web.tracking"])
  {
    uint64_t v11 = (void *)MEMORY[0x263F333E0];
    goto LABEL_41;
  }
  uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 848, @"Unimplemented for type %@", v7 object file lineNumber description];

  __int16 v12 = 0;
LABEL_43:

  return v12;
}

- (id)_valueInConfiguration:(id)a3 keyPath:(id)a4
{
  v14[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 substringToIndex:1];
  id v8 = objc_msgSend(v5, "substringWithRange:", 1, objc_msgSend(v5, "length") - 1);

  uint64_t v9 = objc_msgSend(v7, "capitalizedString", @"payload");
  v14[1] = v9;
  v14[2] = v8;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  uint64_t v11 = [v10 componentsJoinedByString:&stru_26D9391A8];

  __int16 v12 = [v6 valueForKeyPath:v11];

  return v12;
}

- (void)_updateConfiguration:(id)a3 keyPath:(id)a4 value:(id)a5
{
  v22[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v9 substringToIndex:1];
  uint64_t v11 = objc_msgSend(v9, "substringWithRange:", 1, objc_msgSend(v9, "length") - 1);

  v22[0] = @"payload";
  __int16 v12 = [v10 capitalizedString];
  v22[1] = v12;
  v22[2] = v11;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
  uint64_t v14 = [v13 componentsJoinedByString:&stru_26D9391A8];

  uint64_t v15 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    uint64_t v17 = objc_opt_class();
    __int16 v18 = 2112;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_225B06000, v15, OS_LOG_TYPE_DEFAULT, "Setting CEM key %@.%@ to %@", (uint8_t *)&v16, 0x20u);
  }

  [v7 setValue:v8 forKeyPath:v14];
  [v7 updateServerHash];
}

- (void)loadViewModelWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  id v6 = [(STContentPrivacyViewModelCoordinator *)self persistenceController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke;
  v9[3] = &unk_2647679A8;
  id v10 = v5;
  id v11 = v4;
  v9[4] = self;
  id v7 = v5;
  id v8 = v4;
  [v6 performBackgroundTask:v9];
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v106 = a1;
  id v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  id v6 = [v5 userObjectID];

  if (v6)
  {
    id v7 = [*v4 userObjectID];
    id v8 = [v3 objectWithID:v7];

    id v9 = 0;
LABEL_5:
    __int16 v18 = [v8 localUserDeviceState];
    [*v4 setIsLocalDevice:v18 != 0];

    uint64_t v19 = objc_opt_new();
    uint64_t v20 = [v8 communicationPolicy];
    [v19 setScreenTimeCommunicationLimit:v20];
    uint64_t v21 = [v8 communicationWhileLimitedPolicy];
    [v19 setDowntimeCommunicationLimit:v21];
    uint64_t v22 = [v8 contactManagementState];
    [v19 setContactManagementState:v22];
    uint64_t v23 = [v8 contactsEditable];
    v104 = v19;
    [v19 setContactsEditable:v23];
    if (v21 | v20 | v22) {
      goto LABEL_9;
    }
    long long v24 = [v8 effectivePasscode];
    if (!v24) {
      LOBYTE(v23) = 1;
    }

    if ((v23 & 1) == 0)
    {
LABEL_9:
      id v25 = [v8 dsid];
      uint64_t v26 = [v25 stringValue];
      +[STCommunicationLimits setHasShownCompatibilityAlert:1 forDSID:v26];
    }
    uint64_t v27 = [v8 managingOrganization];
    v28 = (void *)MEMORY[0x263F67108];
    v105 = v4;
    v29 = [*v4 userDSID];
    id v30 = [v28 fetchRequestMatchingBlueprintsForUserWithDSID:v29 ofType:*MEMORY[0x263F672C8] fromOrganization:v27];

    id v149 = v9;
    v31 = [v30 execute:&v149];
    id v32 = v149;

    v103 = v31;
    if (!v31)
    {
      long long v42 = +[STUILog persistence];
      long long v43 = v19;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2();
      }

      long long v44 = (void (**)(id, id))*(id *)(v106 + 48);
      id v45 = v32;
      if (v44)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v44[2](v44, v45);
        }
        else
        {
          *(void *)&long long buf = MEMORY[0x263EF8330];
          *((void *)&buf + 1) = 3221225472;
          v156 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
          v157 = &unk_264767628;
          v159 = v44;
          id v158 = v45;
          dispatch_async(MEMORY[0x263EF83A0], &buf);
        }
      }

LABEL_80:
      goto LABEL_81;
    }
    v99 = v30;
    v33 = [v31 firstObject];
    v34 = [v8 organizationIdentifier];
    v107 = v33;
    if ([v34 isEqualToString:*MEMORY[0x263F67368]])
    {
      v35 = [v33 identifier];
      int v36 = [v35 isEqualToString:*MEMORY[0x263F67390]];

      if (!v36)
      {
LABEL_26:
        v100 = v27;
        id v101 = v3;
        v102 = v8;
        v46 = (void *)MEMORY[0x263EFF9A0];
        v47 = [v107 configurations];
        v48 = objc_msgSend(v46, "dictionaryWithCapacity:", objc_msgSend(v47, "count"));

        v49 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"objectID.URIRepresentation.absoluteString" ascending:1];
        v154 = v49;
        uint64_t v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v154 count:1];

        long long v146 = 0u;
        long long v147 = 0u;
        long long v144 = 0u;
        long long v145 = 0u;
        v51 = [v107 configurations];
        v98 = (void *)v50;
        v52 = [v51 sortedArrayUsingDescriptors:v50];

        obuint64_t j = v52;
        v109 = v48;
        uint64_t v116 = [v52 countByEnumeratingWithState:&v144 objects:v153 count:16];
        BOOL v53 = 0;
        if (v116)
        {
          uint64_t v114 = *(void *)v145;
          do
          {
            for (uint64_t i = 0; i != v116; ++i)
            {
              v55 = v32;
              if (*(void *)v145 != v114) {
                objc_enumerationMutation(obj);
              }
              v56 = (void *)MEMORY[0x263F33348];
              v57 = [*(id *)(*((void *)&v144 + 1) + 8 * i) payloadPlist];
              id v143 = v32;
              v58 = [v56 declarationForData:v57 error:&v143];
              id v32 = v143;

              if (v58)
              {
                if (v53)
                {
                  BOOL v53 = 1;
                }
                else
                {
                  v60 = [v58 unknownPayloadKeys];
                  BOOL v53 = [v60 count] != 0;
                }
                v59 = [v58 declarationType];
                v61 = [v48 objectForKeyedSubscript:v59];

                if (v61)
                {
                  v62 = +[STUILog contentPrivacy];
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                  {
                    LODWORD(buf) = 138543362;
                    *(void *)((char *)&buf + 4) = v59;
                    _os_log_fault_impl(&dword_225B06000, v62, OS_LOG_TYPE_FAULT, "Duplicate configurations of type %{public}@ found, skipping", (uint8_t *)&buf, 0xCu);
                  }
                }
                else
                {
                  BOOL v110 = v53;
                  id v63 = v32;
                  v64 = STSupportedConfigurations();
                  long long v139 = 0u;
                  long long v140 = 0u;
                  long long v141 = 0u;
                  long long v142 = 0u;
                  v62 = v64;
                  uint64_t v65 = [v62 countByEnumeratingWithState:&v139 objects:v152 count:16];
                  if (v65)
                  {
                    uint64_t v66 = v65;
                    uint64_t v67 = *(void *)v140;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v66; ++j)
                      {
                        if (*(void *)v140 != v67) {
                          objc_enumerationMutation(v62);
                        }
                        uint64_t v69 = *(void *)(*((void *)&v139 + 1) + 8 * j);
                        id v70 = (id)[v62 objectForKeyedSubscript:v69];
                        if (v70 == (id)objc_opt_class())
                        {
                          v48 = v109;
                          [v109 setObject:v58 forKeyedSubscript:v69];
                          v71 = v62;
                          goto LABEL_53;
                        }
                      }
                      uint64_t v66 = [v62 countByEnumeratingWithState:&v139 objects:v152 count:16];
                      if (v66) {
                        continue;
                      }
                      break;
                    }
                  }

                  v71 = +[STUILog contentPrivacy];
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = 138412290;
                    *(void *)((char *)&buf + 4) = v59;
                    _os_log_error_impl(&dword_225B06000, v71, OS_LOG_TYPE_ERROR, "Unknown future configuration, preserving: %@", (uint8_t *)&buf, 0xCu);
                  }
                  v48 = v109;
LABEL_53:

                  id v32 = v63;
                  BOOL v53 = v110;
                }
              }
              else
              {
                v59 = +[STUILog contentPrivacy];
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v32;
                  _os_log_error_impl(&dword_225B06000, v59, OS_LOG_TYPE_ERROR, "Error deserializing configuration from DB: %{public}@", (uint8_t *)&buf, 0xCu);
                }
                BOOL v53 = 1;
              }
            }
            uint64_t v116 = [obj countByEnumeratingWithState:&v144 objects:v153 count:16];
          }
          while (v116);
        }
        BOOL v111 = v53;

        if (_os_feature_enabled_impl())
        {
          v72 = objc_opt_new();
          id v138 = 0;
          uint64_t v73 = [v72 isRestrictAdultContentEnabled:&v138];
          id v74 = v138;

          [*v105 setIsRestrictAdultContentEnabledValue:0];
          v75 = +[STUILog contentPrivacy];
          v76 = v75;
          if (v74)
          {
            if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
              __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3();
            }
          }
          else
          {
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              v79 = [NSNumber numberWithBool:v73];
              LODWORD(buf) = 138543362;
              *(void *)((char *)&buf + 4) = v79;
              _os_log_impl(&dword_225B06000, v76, OS_LOG_TYPE_DEFAULT, "Using isRestrictAdultContentEnabled state: %{public}@", (uint8_t *)&buf, 0xCu);
            }
            v76 = [NSNumber numberWithBool:v73];
            [*v105 setIsRestrictAdultContentEnabledValue:v76];
          }
        }
        v80 = [v102 effectivePasscode];
        BOOL v115 = [v80 length] != 0;

        v81 = [*v105 isRestrictAdultContentEnabledValue];
        if ([v81 BOOLValue]) {
          char v82 = 1;
        }
        else {
          char v82 = [v107 enabled];
        }
        id v117 = v32;

        char v83 = [v102 isManaged];
        v84 = [v102 localUserDeviceState];
        BOOL v85 = v84 == 0;

        unint64_t v86 = +[STUIUser userTypeFromUser:v102];
        if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
        {
          id obja = [*(id *)(v106 + 32) organizationSettingsRestrictionUtility];
          v108 = [*(id *)(v106 + 32) userDSID];
          v128[0] = MEMORY[0x263EF8330];
          v128[1] = 3221225472;
          v128[2] = __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_793;
          v128[3] = &unk_264767958;
          v87 = &v129;
          v88 = *(void **)(v106 + 40);
          v89 = v109;
          v128[4] = *(void *)(v106 + 32);
          v129 = v109;
          v90 = &v130;
          id v130 = v88;
          BOOL v133 = v115;
          char v134 = v82;
          v91 = &v131;
          long long v43 = v104;
          id v92 = v104;
          char v135 = v83;
          BOOL v136 = v85;
          id v131 = v92;
          v132[1] = v86;
          BOOL v137 = v111;
          v93 = (id *)v132;
          v132[0] = *(id *)(v106 + 48);
          id v94 = v109;
          [obja isImageGenerationAllowedForUserDSID:v108 completionHandler:v128];
        }
        else
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2;
          block[3] = &unk_264767980;
          v87 = &v119;
          v95 = *(void **)(v106 + 40);
          v89 = v109;
          block[4] = *(void *)(v106 + 32);
          v119 = v109;
          v90 = &v120;
          id v120 = v95;
          BOOL v123 = v115;
          char v124 = v82;
          v91 = &v121;
          long long v43 = v104;
          id v96 = v104;
          char v125 = v83;
          BOOL v126 = v85;
          id v121 = v96;
          v122[1] = v86;
          BOOL v127 = v111;
          v93 = (id *)v122;
          v122[0] = *(id *)(v106 + 48);
          id v97 = v109;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }

        id v3 = v101;
        id v8 = v102;
        id v30 = v99;
        uint64_t v27 = v100;
        id v45 = v117;
        goto LABEL_80;
      }
      v37 = +[STUILog persistence];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5(v107, v37);
      }

      [v107 tombstone];
      v38 = [*v105 persistenceController];
      id v148 = v32;
      char v39 = [v38 saveContext:v3 error:&v148];
      id v40 = v148;

      long long v41 = +[STUILog persistence];
      v34 = v41;
      if (v39)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_225B06000, v34, OS_LOG_TYPE_DEFAULT, "Saved database after deleting Family Restrictions blueprint with Personal organization identifier.", (uint8_t *)&buf, 2u);
        }

        v34 = v107;
        v107 = 0;
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4();
      }
    }
    else
    {
      id v40 = v32;
    }

    id v32 = v40;
    goto LABEL_26;
  }
  id v10 = (void *)MEMORY[0x263F67168];
  id v11 = [*v4 userDSID];
  id v8 = [v10 fetchRequestForUsersWithDSID:v11];

  id v151 = 0;
  __int16 v12 = [v8 execute:&v151];
  id v13 = v151;
  if (v12)
  {
    uint64_t v14 = (void *)MEMORY[0x263F67168];
    uint64_t v15 = [*v4 userDSID];
    id v150 = v13;
    int v16 = [v14 fetchUserWithDSID:v15 inContext:v3 error:&v150];
    id v9 = v150;

    uint64_t v17 = [v16 objectID];
    [*v4 setUserObjectID:v17];

    id v8 = v16;
    goto LABEL_5;
  }
  v77 = +[STUILog persistence];
  if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
    __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(v4, (uint64_t)v13, v77);
  }

  v78 = (void (**)(id, id))*(id *)(v106 + 48);
  id v45 = v13;
  if (v78)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v78[2](v78, v45);
    }
    else
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v156 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      v157 = &unk_264767628;
      v159 = v78;
      id v158 = v45;
      dispatch_async(MEMORY[0x263EF83A0], &buf);
    }
  }

LABEL_81:
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_793(uint64_t a1, int a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    id v6 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_793_cold_1();
    }
  }
  id v7 = [MEMORY[0x263F671D8] payload];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    int v26 = a2;
    _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Image Creation: STContentPrivacyViewModelCoordinator fetched isAllowed = %d", buf, 8u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_795;
  v14[3] = &unk_264767930;
  id v8 = *(void **)(a1 + 40);
  void v14[4] = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = *(id *)(a1 + 48);
  __int16 v21 = *(_WORD *)(a1 + 80);
  id v16 = v9;
  id v17 = v5;
  char v22 = a2;
  id v10 = *(id *)(a1 + 56);
  char v23 = *(unsigned char *)(a1 + 82);
  __int16 v24 = *(_WORD *)(a1 + 83);
  __int16 v12 = *(void **)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  id v18 = v10;
  uint64_t v20 = v11;
  id v19 = v12;
  id v13 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_795(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfigurationPayloadsByType:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "setIsLocalDevice:", objc_msgSend(*(id *)(a1 + 32), "isLocalDevice"));
  [*(id *)(a1 + 48) setHasPasscode:*(unsigned __int8 *)(a1 + 88)];
  [*(id *)(a1 + 48) setRestrictionsEnabled:*(unsigned __int8 *)(a1 + 89)];
  id v2 = [*(id *)(a1 + 32) userName];
  [*(id *)(a1 + 48) setUserName:v2];

  id v3 = [*(id *)(a1 + 32) userDSID];
  [*(id *)(a1 + 48) setUserDSID:v3];

  if (!*(void *)(a1 + 56)) {
    [*(id *)(a1 + 48) setIsSiriImageGenerationAllowed:*(unsigned __int8 *)(a1 + 90)];
  }
  [*(id *)(a1 + 48) setCommunicationLimits:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) setUserIsManaged:*(unsigned __int8 *)(a1 + 91)];
  [*(id *)(a1 + 48) setUserIsRemote:*(unsigned __int8 *)(a1 + 92)];
  [*(id *)(a1 + 48) setUserType:*(void *)(a1 + 80)];
  id v4 = [*(id *)(a1 + 32) _visibleRestrictions];
  [*(id *)(a1 + 48) setVisibleRestrictions:v4];

  id v5 = [*(id *)(a1 + 32) _valuesByRestriction];
  [*(id *)(a1 + 48) setValuesByRestriction:v5];

  [*(id *)(a1 + 48) setShouldAllowEditing:*(unsigned char *)(a1 + 93) == 0];
  [*(id *)(a1 + 48) setIsLoaded:1];
  id v6 = *(void **)(a1 + 56);
  id v7 = (void (**)(id, id))*(id *)(a1 + 72);
  id v8 = v6;
  if (v7)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v7[2](v7, v8);
    }
    else
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      v9[3] = &unk_264767628;
      uint64_t v11 = v7;
      id v10 = v8;
      dispatch_async(MEMORY[0x263EF83A0], v9);
    }
  }
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setConfigurationPayloadsByType:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "setIsLocalDevice:", objc_msgSend(*(id *)(a1 + 32), "isLocalDevice"));
  [*(id *)(a1 + 48) setHasPasscode:*(unsigned __int8 *)(a1 + 80)];
  [*(id *)(a1 + 48) setRestrictionsEnabled:*(unsigned __int8 *)(a1 + 81)];
  id v2 = [*(id *)(a1 + 32) userName];
  [*(id *)(a1 + 48) setUserName:v2];

  id v3 = [*(id *)(a1 + 32) userDSID];
  [*(id *)(a1 + 48) setUserDSID:v3];

  [*(id *)(a1 + 48) setCommunicationLimits:*(void *)(a1 + 56)];
  [*(id *)(a1 + 48) setUserIsManaged:*(unsigned __int8 *)(a1 + 82)];
  [*(id *)(a1 + 48) setUserIsRemote:*(unsigned __int8 *)(a1 + 83)];
  [*(id *)(a1 + 48) setUserType:*(void *)(a1 + 72)];
  id v4 = [*(id *)(a1 + 32) _visibleRestrictions];
  [*(id *)(a1 + 48) setVisibleRestrictions:v4];

  id v5 = [*(id *)(a1 + 32) _valuesByRestriction];
  [*(id *)(a1 + 48) setValuesByRestriction:v5];

  [*(id *)(a1 + 48) setShouldAllowEditing:*(unsigned char *)(a1 + 84) == 0];
  [*(id *)(a1 + 48) setIsLoaded:1];
  id v6 = (void (**)(id, void))*(id *)(a1 + 64);
  if (v6)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v6[2](v6, 0);
    }
    else
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      v7[3] = &unk_264767628;
      id v8 = 0;
      id v9 = v6;
      dispatch_async(MEMORY[0x263EF83A0], v7);
    }
  }
}

- (void)loadValuesByRestrictionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__STContentPrivacyViewModelCoordinator_loadValuesByRestrictionWithCompletionHandler___block_invoke;
  v6[3] = &unk_2647679D0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(STContentPrivacyViewModelCoordinator *)self loadViewModelWithCompletionHandler:v6];
}

void __85__STContentPrivacyViewModelCoordinator_loadValuesByRestrictionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 viewModel];
  id v5 = [v6 valuesByRestriction];
  (*(void (**)(uint64_t, void *, id))(v2 + 16))(v2, v5, v4);
}

- (void)saveContentPrivacyEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = +[STUILog contentPrivacy];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(STContentPrivacyViewModelCoordinator *)self userDSID];
    *(_DWORD *)long long buf = 67240450;
    v21[0] = v4;
    LOWORD(v21[1]) = 2112;
    *(void *)((char *)&v21[1] + 2) = v8;
    _os_log_impl(&dword_225B06000, v7, OS_LOG_TYPE_DEFAULT, "Asked to change restriction enabled/disabled to %{public}d for %@", buf, 0x12u);
  }
  if (!v4 && [(STContentPrivacyViewModelCoordinator *)self isLocalDevice])
  {
    CFStringRef v9 = (const __CFString *)*MEMORY[0x263F67398];
    CFStringRef v10 = (const __CFString *)*MEMORY[0x263F673A0];
    uint64_t v11 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x263F67398], (CFStringRef)*MEMORY[0x263F673A0]);
    __int16 v12 = +[STUILog contentPrivacy];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)__int16 v21 = v11;
      _os_log_impl(&dword_225B06000, v12, OS_LOG_TYPE_DEFAULT, "Deleting SpringBoard restrictions. Were: %{public}@", buf, 0xCu);
    }

    CFPreferencesSetAppValue(v9, 0, v10);
    CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x263F673A8], 0, v10);
    CFPreferencesAppSynchronize(v10);
    notify_post("com.apple.locationd/Restrictions");
    notify_post("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification");
    id v13 = [(STContentPrivacyViewModelCoordinator *)self _valuesByRestriction];
    uint64_t v14 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
    [v14 setValuesByRestriction:v13];
  }
  id v15 = [(STContentPrivacyViewModelCoordinator *)self persistenceController];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke;
  v17[3] = &unk_264767A20;
  v17[4] = self;
  id v18 = v6;
  BOOL v19 = v4;
  id v16 = v6;
  [v15 performBackgroundTask:v17];
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v51[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = (id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) userObjectID];
  if (v5 && ([v3 objectWithID:v5], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    uint64_t v8 = [v6 managingOrganization];
    CFStringRef v9 = (void *)MEMORY[0x263F67108];
    CFStringRef v10 = [*v4 userDSID];
    uint64_t v11 = *MEMORY[0x263F672C8];
    v35 = (void *)v8;
    __int16 v12 = [v9 fetchRequestMatchingBlueprintsForUserWithDSID:v10 ofType:*MEMORY[0x263F672C8] fromOrganization:v8];

    id v43 = 0;
    v34 = v12;
    id v13 = [v12 execute:&v43];
    id v14 = v43;
    if (v13)
    {
      id v15 = [v13 firstObject];
      if (!v15)
      {
        id v15 = (id)[objc_alloc(MEMORY[0x263F67108]) initWithContext:v3];
        [v15 setType:v11];
        id v16 = [v7 contentPrivacyActivationIdentifier];
        [v15 setIdentifier:v16];

        id v17 = (void *)MEMORY[0x263EFFA08];
        id v18 = [v3 objectWithID:v5];
        BOOL v19 = [v17 setWithObject:v18];
        [v15 setUsers:v19];

        [v15 setOrganization:v35];
      }
      [v15 setIsDirty:1];
      objc_msgSend(*(id *)(a1 + 32), "setNumExpectedChanges:", objc_msgSend(*(id *)(a1 + 32), "numExpectedChanges") + 1);
      [v15 setEnabled:*(unsigned __int8 *)(a1 + 48)];
      if (_os_feature_enabled_impl())
      {
        id v20 = v14;
      }
      else
      {
        v28 = +[STUILog contentPrivacy];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_4((id *)(a1 + 32));
        }

        v29 = [*v4 persistenceController];
        id v42 = v14;
        char v30 = [v29 saveContext:v3 error:&v42];
        id v20 = v42;

        if ((v30 & 1) == 0)
        {
          v31 = +[STUILog persistence];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_3();
          }
        }
      }
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v37 = __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_802;
      v38 = &unk_2647679F8;
      id v32 = *(void **)(a1 + 40);
      uint64_t v39 = *(void *)(a1 + 32);
      char v41 = *(unsigned char *)(a1 + 48);
      id v40 = v32;
      v33 = v36;
      id v26 = v20;
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v37((uint64_t)v33, v26);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v45 = 3221225472;
        v46 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v47 = &unk_264767628;
        v49 = v33;
        id v48 = v26;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
    else
    {
      uint64_t v27 = +[STUILog persistence];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_2();
      }

      id v15 = *(id *)(a1 + 40);
      id v26 = v14;
      if (v15)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          (*((void (**)(id, id))v15 + 2))(v15, v26);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v45 = 3221225472;
          v46 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
          v47 = &unk_264767628;
          v49 = v15;
          id v48 = v26;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
    }
  }
  else
  {
    __int16 v21 = +[STUILog persistence];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();
    }

    char v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F67300];
    uint64_t v50 = *MEMORY[0x263F08320];
    v51[0] = @"user could not be found";
    __int16 v24 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
    id v25 = [v22 errorWithDomain:v23 code:11 userInfo:v24];

    id v7 = *(id *)(a1 + 40);
    id v26 = v25;
    if (v7)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*((void (**)(id, id))v7 + 2))(v7, v26);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v45 = 3221225472;
        v46 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        v47 = &unk_264767628;
        v49 = v7;
        id v48 = v26;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_802(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) viewModel];
  [v3 setRestrictionsEnabled:*(unsigned __int8 *)(a1 + 48)];
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  id v6 = [v3 valuesByRestriction];
  objc_msgSend(v4, "_reportCoreAnalyticsEventWithRestrictionsEnabled:valuesByRestriction:userType:userIsManaged:", v5, v6, objc_msgSend(v3, "userType"), objc_msgSend(v3, "userIsManaged"));

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
  }
}

- (void)saveSiriImageGenerationIsAllowed:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  char v8 = [v7 isSiriImageGenerationAllowed];

  CFStringRef v9 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  [v9 setIsSiriImageGenerationAllowed:v4];

  objc_initWeak(&location, self);
  CFStringRef v10 = [(STContentPrivacyViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__STContentPrivacyViewModelCoordinator_saveSiriImageGenerationIsAllowed_completionHandler___block_invoke;
  v12[3] = &unk_264767A48;
  objc_copyWeak(&v14, &location);
  BOOL v15 = v4;
  char v16 = v8;
  id v11 = v6;
  id v13 = v11;
  [v10 performBackgroundTask:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __91__STContentPrivacyViewModelCoordinator_saveSiriImageGenerationIsAllowed_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x263F67168];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained userDSID];
  id v19 = 0;
  uint64_t v7 = [v4 fetchUserWithDSID:v6 inContext:v3 error:&v19];
  id v8 = v19;

  if (v7)
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    [v7 setContentPrivacySiriImageGenerationRestriction:v9];
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = [v10 persistenceController];
    id v18 = v8;
    [v11 saveContext:v3 error:&v18];
    id v12 = v18;

    id v8 = v12;
  }
  if (v8)
  {
    uint64_t v13 = *(unsigned __int8 *)(a1 + 49);
    id v14 = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v15 = [v14 viewModel];
    [v15 setIsSiriImageGenerationAllowed:v13];
  }
  char v16 = (void (**)(id, id))*(id *)(a1 + 32);
  id v17 = v8;
  if (v16)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v16[2](v16, v17);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      block[3] = &unk_264767628;
      char v22 = v16;
      id v21 = v17;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

- (void)saveCommunicationLimits:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(STContentPrivacyViewModelCoordinator *)self userObjectID];
  uint64_t v9 = [(STContentPrivacyViewModelCoordinator *)self persistenceController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke;
  v13[3] = &unk_264767A98;
  id v14 = v8;
  id v15 = v6;
  char v16 = self;
  id v17 = v7;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  [v9 performBackgroundTask:v13];
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v40[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = v3;
  if (*(void *)(a1 + 32)
    && (objc_msgSend(v3, "objectWithID:"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    objc_msgSend(v5, "setCommunicationPolicy:", objc_msgSend(*(id *)(a1 + 40), "screenTimeCommunicationLimit"));
    objc_msgSend(v6, "setCommunicationWhileLimitedPolicy:", objc_msgSend(*(id *)(a1 + 40), "downtimeCommunicationLimit"));
    objc_msgSend(v6, "setContactManagementState:", objc_msgSend(*(id *)(a1 + 40), "contactManagementState"));
    objc_msgSend(v6, "setContactsEditable:", objc_msgSend(*(id *)(a1 + 40), "contactsEditable"));
    id v7 = [*(id *)(a1 + 48) persistenceController];
    id v32 = 0;
    char v8 = [v7 saveContext:v4 error:&v32];
    id v9 = v32;

    if (v8)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v28 = __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_803;
      v29 = &unk_264767A70;
      int8x16_t v26 = *(int8x16_t *)(a1 + 40);
      id v10 = (id)v26.i64[0];
      int8x16_t v30 = vextq_s8(v26, v26, 8uLL);
      id v31 = *(id *)(a1 + 56);
      id v11 = v27;
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        v28((uint64_t)v11, 0);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v34 = 3221225472;
        v35 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        int v36 = &unk_264767628;
        id v25 = v11;
        id v37 = 0;
        v38 = v25;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
    else
    {
      uint64_t v23 = +[STUILog persistence];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_2();
      }

      __int16 v24 = (void (**)(id, id))*(id *)(a1 + 56);
      id v9 = v9;
      if (v24)
      {
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          v24[2](v24, v9);
        }
        else
        {
          uint64_t block = MEMORY[0x263EF8330];
          uint64_t v34 = 3221225472;
          v35 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
          int v36 = &unk_264767628;
          v38 = v24;
          id v37 = v9;
          dispatch_async(MEMORY[0x263EF83A0], &block);
        }
      }
    }
  }
  else
  {
    id v12 = +[STUILog persistence];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_1(a1 + 32, v12, v13, v14, v15, v16, v17, v18);
    }

    id v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F67300];
    uint64_t v39 = *MEMORY[0x263F08320];
    v40[0] = @"user could not be found";
    id v21 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    char v22 = [v19 errorWithDomain:v20 code:11 userInfo:v21];

    id v6 = *(id *)(a1 + 56);
    id v9 = v22;
    if (v6)
    {
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        (*((void (**)(id, id))v6 + 2))(v6, v9);
      }
      else
      {
        uint64_t block = MEMORY[0x263EF8330];
        uint64_t v34 = 3221225472;
        v35 = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        int v36 = &unk_264767628;
        v38 = (void (**)(id, id))v6;
        id v37 = v9;
        dispatch_async(MEMORY[0x263EF83A0], &block);
      }
    }
  }
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_803(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) viewModel];
  objc_msgSend(*(id *)(a1 + 32), "_reportCoreAnalyticsEventForChangedCommunicationLimits:userType:userIsRemote:", *(void *)(a1 + 40), objc_msgSend(v3, "userType"), objc_msgSend(v3, "userIsRemote"));
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)saveValuesForRestrictions:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(STContentPrivacyViewModelCoordinator *)self persistenceController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke;
  v12[3] = &unk_264767AE8;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v7;
  id v11 = v8;
  [v9 performBackgroundTask:v12];
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = [*(id *)(a1 + 32) userObjectID];
  uint64_t v92 = a1;
  if (v5)
  {
    v90 = [v3 objectWithID:v5];
    if (v90)
    {
      v88 = v5;
      v89 = v3;
      v91 = objc_opt_new();
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      obuint64_t j = *(id *)(a1 + 40);
      uint64_t v6 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
      id v96 = (id *)(a1 + 32);
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v110 != v8) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            id v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
            id v12 = [MEMORY[0x263EFF9D0] null];

            if (v11 == v12)
            {

              id v11 = 0;
            }
            id v13 = [v10 rmConfiguration];
            id v14 = [v10 payloadKey];
            SEL v15 = +[STUILog contentPrivacy];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = [*v4 userDSID];
              *(_DWORD *)long long buf = 138543874;
              *(void *)&uint8_t buf[4] = v10;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v11;
              *(_WORD *)&buf[22] = 2112;
              id v120 = v16;
              _os_log_impl(&dword_225B06000, v15, OS_LOG_TYPE_DEFAULT, "Asked to change restriction %{public}@ value to %{public}@ for %@", buf, 0x20u);

              uint64_t v4 = v96;
            }

            if ([v13 isEqualToString:@"STCustomRestrictionConfiguration"])
            {
              uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
              [v17 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"STContentPrivacyViewModel.m", 1227, @"Unimplemented restriction %@ %@", v13, v14 object file lineNumber description];
            }
            else if ([v13 isEqualToString:@"STSBCapabilityConfiguration"])
            {
              uint64_t v18 = [*v4 viewModel];
              id v19 = [v18 valuesByRestriction];
              [v19 setObject:v11 forKeyedSubscript:v10];

              uint64_t v4 = v96;
              [*v96 _setValue:v11 forSBCapability:v14];
            }
            else
            {
              int v20 = [v13 isEqualToString:@"STMCFeatureConfiguration"];
              id v21 = [*v4 viewModel];
              char v22 = [v21 valuesByRestriction];
              [v22 setObject:v11 forKeyedSubscript:v10];

              uint64_t v4 = v96;
              id v23 = *v96;
              if (v20)
              {
                [v23 _setValue:v11 forMCFeature:v14];
              }
              else
              {
                __int16 v24 = [v23 configurationPayloadsByType];
                id v25 = [v24 objectForKeyedSubscript:v13];

                if (!v25)
                {
                  id v25 = [*v96 _createUnrestrictedConfigurationForUser:v90 withType:v13];
                }
                [*v96 _updateConfiguration:v25 keyPath:v14 value:v11];
                int8x16_t v26 = [*v96 configurationPayloadsByType];

                if (!v26)
                {
                  uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
                  [*v96 setConfigurationPayloadsByType:v27];
                }
                v28 = [*v96 configurationPayloadsByType];
                [v28 setObject:v25 forKeyedSubscript:v13];

                [v91 addObject:v13];
              }
              a1 = v92;
            }
          }
          uint64_t v7 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
        }
        while (v7);
      }

      if (![v91 count])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v35 = 0;
        id v5 = v88;
        id v3 = v89;
LABEL_83:

        goto LABEL_84;
      }
      v29 = [v90 managingOrganization];
      int8x16_t v30 = (void *)MEMORY[0x263F67108];
      id v31 = [*v4 userDSID];
      uint64_t v32 = *MEMORY[0x263F672C8];
      v33 = [v30 fetchRequestMatchingBlueprintsForUserWithDSID:v31 ofType:*MEMORY[0x263F672C8] fromOrganization:v29];

      id v108 = 0;
      uint64_t v34 = [v33 execute:&v108];
      id v35 = v108;
      id v5 = v88;
      id v3 = v89;
      if (!v34)
      {
        v71 = +[STUILog persistence];
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
          __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_2();
        }

        (*(void (**)(void))(*(void *)(v92 + 48) + 16))();
LABEL_82:

        goto LABEL_83;
      }
      v87 = v33;
      int v36 = [v34 firstObject];
      if (!v36)
      {
        id v37 = +[STUILog persistence];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_225B06000, v37, OS_LOG_TYPE_DEFAULT, "Restrictions blueprint is missing, will create one", buf, 2u);
        }

        int v36 = (void *)[objc_alloc(MEMORY[0x263F67108]) initWithContext:v89];
        [v36 setType:v32];
        v38 = [v90 contentPrivacyActivationIdentifier];
        [v36 setIdentifier:v38];

        uint64_t v39 = (void *)MEMORY[0x263EFFA08];
        id v40 = [v89 objectWithID:v88];
        char v41 = [v39 setWithObject:v40];
        [v36 setUsers:v41];

        [v36 setOrganization:v29];
      }
      v93 = v34;
      [v36 setIsDirty:1];
      objc_msgSend(*v4, "setNumExpectedChanges:", objc_msgSend(*v4, "numExpectedChanges") + 1);
      id obja = v36;
      id v42 = [v36 configurations];
      id v43 = [v42 allObjects];

      long long v44 = NSDictionary;
      uint64_t v45 = [v43 valueForKey:@"type"];
      unint64_t v86 = v43;
      v46 = [v44 dictionaryWithObjects:v43 forKeys:v45];

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      id v47 = v91;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v104 objects:v115 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v105;
        BOOL v85 = v29;
        while (2)
        {
          uint64_t v51 = 0;
          v52 = v35;
          do
          {
            if (*(void *)v105 != v50) {
              objc_enumerationMutation(v47);
            }
            uint64_t v53 = *(void *)(*((void *)&v104 + 1) + 8 * v51);
            v54 = [*v96 configurationPayloadsByType];
            v55 = [v54 objectForKeyedSubscript:v53];

            if (!v55)
            {
              v72 = +[STUILog persistence];
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_6();
              }

              uint64_t v73 = (void *)MEMORY[0x263F087E8];
              uint64_t v74 = *MEMORY[0x263F67300];
              uint64_t v113 = *MEMORY[0x263F08320];
              uint64_t v114 = @"restrictions blueprint configuration payload not found";
              v75 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
              v76 = [v73 errorWithDomain:v74 code:58 userInfo:v75];

              v77 = (void (**)(id, id))*(id *)(v92 + 48);
              id v35 = v76;
              id v5 = v88;
              id v3 = v89;
              v29 = v85;
              v78 = v86;
              v33 = v87;
              if (v77)
              {
                if ([MEMORY[0x263F08B88] isMainThread])
                {
                  v77[2](v77, v35);
                }
                else
                {
                  *(void *)long long buf = MEMORY[0x263EF8330];
                  *(void *)&buf[8] = 3221225472;
                  *(void *)&buf[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
                  id v120 = &unk_264767628;
                  v122 = v77;
                  id v121 = v35;
                  dispatch_async(MEMORY[0x263EF83A0], buf);
                }
              }

              goto LABEL_81;
            }
            v56 = [v46 objectForKeyedSubscript:v53];
            if (!v56)
            {
              v56 = (void *)[objc_alloc(MEMORY[0x263F67110]) initWithContext:v89];
              v57 = [v55 declarationIdentifier];
              [v56 setIdentifier:v57];

              [v56 setType:v53];
              [v56 setBlueprint:obja];
            }
            [v55 updateServerHash];
            id v103 = v52;
            v58 = [v55 serializeAsDataWithError:&v103];
            id v35 = v103;

            if (!v58)
            {
              v79 = +[STUILog persistence];
              if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)long long buf = 138543362;
                *(void *)&uint8_t buf[4] = v35;
                _os_log_fault_impl(&dword_225B06000, v79, OS_LOG_TYPE_FAULT, "failed to serialize restrictions during save: %{public}@", buf, 0xCu);
              }

              (*(void (**)(void))(*(void *)(v92 + 48) + 16))();
              id v5 = v88;
              id v3 = v89;
              v29 = v85;
              v78 = v86;
              v33 = v87;
              goto LABEL_81;
            }
            [v56 setPayloadPlist:v58];
            objc_msgSend(*v96, "setNumExpectedChanges:", objc_msgSend(*v96, "numExpectedChanges") + 1);

            ++v51;
            v52 = v35;
          }
          while (v49 != v51);
          uint64_t v49 = [v47 countByEnumeratingWithState:&v104 objects:v115 count:16];
          id v3 = v89;
          v29 = v85;
          if (v49) {
            continue;
          }
          break;
        }
      }

      if (_os_feature_enabled_impl())
      {
        v59 = [MEMORY[0x263F67088] sharedController];
        v60 = [MEMORY[0x263F67088] sharedController];
        v61 = [v60 viewContext];
        id v101 = 0;
        char v62 = [v59 saveContext:v61 error:&v101];
        id v63 = v101;

        id v5 = v88;
        if ((v62 & 1) == 0)
        {
          v64 = +[STUILog persistence];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
            __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_3();
          }
        }
      }
      else
      {
        v80 = +[STUILog contentPrivacy];
        id v5 = v88;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
          __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_5(v96);
        }

        v81 = [*v96 persistenceController];
        id v102 = v35;
        char v82 = [v81 saveContext:v3 error:&v102];
        id v83 = v102;

        if (v82)
        {
          v78 = v86;
          goto LABEL_77;
        }
        id v63 = +[STUILog persistence];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
          __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_3();
        }
        id v35 = v83;
      }
      v78 = v86;

      id v83 = v35;
LABEL_77:
      v97[0] = MEMORY[0x263EF8330];
      v97[1] = 3221225472;
      v98 = __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_815;
      v99 = &unk_264767AC0;
      id v100 = *(id *)(v92 + 48);
      v84 = v97;
      id v35 = v83;
      if ([MEMORY[0x263F08B88] isMainThread])
      {
        ((void (*)(void *, id))v98)(v84, v35);
      }
      else
      {
        *(void *)long long buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
        id v120 = &unk_264767628;
        v122 = v84;
        id v121 = v35;
        dispatch_async(MEMORY[0x263EF83A0], buf);
      }
      v33 = v87;

      id v47 = v100;
LABEL_81:

      uint64_t v34 = v93;
      goto LABEL_82;
    }
  }
  uint64_t v65 = +[STUILog persistence];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
    __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1();
  }

  uint64_t v66 = (void *)MEMORY[0x263F087E8];
  uint64_t v67 = *MEMORY[0x263F67300];
  uint64_t v117 = *MEMORY[0x263F08320];
  v118 = @"user could not be found";
  v68 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
  uint64_t v69 = [v66 errorWithDomain:v67 code:11 userInfo:v68];

  id v70 = (void (**)(id, id))*(id *)(v92 + 48);
  id v35 = v69;
  if (v70)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v70[2](v70, v35);
    }
    else
    {
      *(void *)long long buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __STUICallCompletionHandlerOnMainThread_block_invoke_0;
      id v120 = &unk_264767628;
      v122 = v70;
      id v121 = v35;
      dispatch_async(MEMORY[0x263EF83A0], buf);
    }
  }

LABEL_84:
}

uint64_t __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_815(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveRestrictionValue:(id)a3 forItem:(id)a4 completionHandler:(id)a5
{
  v44[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v10 rmConfiguration];
  id v13 = [v10 payloadKey];
  if (!v9)
  {
    id v9 = [MEMORY[0x263EFF9D0] null];
  }
  if ([v12 isEqualToString:@"STCustomRestrictionConfiguration"])
  {
    if ([v13 isEqualToString:@"STCustomRestrictionCellularData"])
    {
      id v14 = [[STRestrictionItem alloc] initWithConfiguration:@"network.cellular.settings" restrictionKey:@"allowAppCellularDataModification" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v43[0] = v14;
      v44[0] = v9;
      SEL v15 = [[STRestrictionItem alloc] initWithConfiguration:@"network.cellular.settings" restrictionKey:@"allowCellularPlanModification" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v43[1] = v15;
      v44[1] = v9;
      uint64_t v16 = NSDictionary;
      uint64_t v17 = v44;
      uint64_t v18 = v43;
    }
    else if ([v13 isEqualToString:@"STCustomRestrictionSiriDictation"])
    {
      id v14 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowAssistant" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v41[0] = v14;
      v42[0] = v9;
      SEL v15 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowDictation" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v41[1] = v15;
      v42[1] = v9;
      uint64_t v16 = NSDictionary;
      uint64_t v17 = v42;
      uint64_t v18 = v41;
    }
    else
    {
      if (![v13 isEqualToString:@"STCustomRestrictionMathResults"])
      {
        if ([v13 isEqualToString:@"STCustomRestrictionWebFilterState"])
        {
          int v20 = -[STContentPrivacyViewModelCoordinator _restrictionsForWebFilterState:](self, "_restrictionsForWebFilterState:", [v9 unsignedIntegerValue]);
        }
        else
        {
          int8x16_t v30 = [MEMORY[0x263F08690] currentHandler];
          [v30 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 1364, @"Unimplemented restriction %@ %@", v12, v13 object file lineNumber description];

          int v20 = 0;
        }
        goto LABEL_23;
      }
      id v14 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowMathPaperSolving" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v39[0] = v14;
      v40[0] = v9;
      SEL v15 = [[STRestrictionItem alloc] initWithConfiguration:@"system.siri" restrictionKey:@"allowKeyboardMathSolving" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v39[1] = v15;
      v40[1] = v9;
      uint64_t v16 = NSDictionary;
      uint64_t v17 = v40;
      uint64_t v18 = v39;
    }
    int v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];

LABEL_23:
    id v19 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
    id v21 = [(STRestrictionItem *)v19 valuesByRestriction];
    [(STRestrictionItem *)v21 setObject:v9 forKeyedSubscript:v10];
    goto LABEL_24;
  }
  id v19 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowedGameCenterOtherPlayerTypes" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  int v20 = 0;
  if ([v10 isEqual:v19])
  {
    int v20 = [(STContentPrivacyViewModelCoordinator *)self createValuesForRestrictions:v9 multiplayerRestriction:v10];
  }
  id v21 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowAppInstallation" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  if ([v10 isEqual:v21])
  {
    id v31 = v13;
    uint64_t v32 = v12;
    char v22 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
    char v23 = [v22 isEligibleForAppDistribution];

    if ((v23 & 1) == 0)
    {
      __int16 v24 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowAppInstallation" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v37[0] = v24;
      v38[0] = v9;
      id v25 = [[STRestrictionItem alloc] initWithConfiguration:@"application.store" restrictionKey:@"allowUIAppInstallation" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
      v37[1] = v25;
      v38[1] = v9;
      uint64_t v26 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

      int v20 = (void *)v26;
    }
    id v13 = v31;
    id v12 = v32;
  }
  if (!v20)
  {
    uint64_t v27 = v13;
    id v35 = v10;
    v28 = v9;
    if (!v9)
    {
      v28 = [MEMORY[0x263EFF9D0] null];
    }
    int v36 = v28;
    int v20 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    if (!v9) {

    }
    id v13 = v27;
  }
LABEL_24:

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __87__STContentPrivacyViewModelCoordinator_saveRestrictionValue_forItem_completionHandler___block_invoke;
  v33[3] = &unk_264767B10;
  v33[4] = self;
  id v34 = v11;
  id v29 = v11;
  [(STContentPrivacyViewModelCoordinator *)self saveValuesForRestrictions:v20 completionHandler:v33];
}

void __87__STContentPrivacyViewModelCoordinator_saveRestrictionValue_forItem_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v8 = [v3 viewModel];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v8 restrictionsEnabled];
  uint64_t v7 = [v8 valuesByRestriction];
  objc_msgSend(v5, "_reportCoreAnalyticsEventWithRestrictionsEnabled:valuesByRestriction:userType:userIsManaged:", v6, v7, objc_msgSend(v8, "userType"), objc_msgSend(v8, "userIsManaged"));

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)createValuesForRestrictions:(id)a3 multiplayerRestriction:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v25 = a4;
  uint64_t v7 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterNearbyMultiplayer" labelName:&stru_26D9391A8 type:0 restrictionValue:0];
  id v8 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  id v9 = [v8 valuesByRestriction];
  id v10 = [v9 objectForKeyedSubscript:v7];
  int v11 = [v10 BOOLValue];

  int v12 = [v6 isEqual:&unk_26D966FA0];
  id v13 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowedGameCenterOtherPlayerTypes" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  id v14 = [(STContentPrivacyViewModelCoordinator *)self viewModel];
  SEL v15 = [v14 valuesByRestriction];
  uint64_t v16 = [v15 objectForKeyedSubscript:v13];
  int v17 = [v16 isEqual:&unk_26D966FA0];

  if (v12 && (v17 & 1) == 0 && v11)
  {
    uint64_t v18 = v25;
    id v30 = v25;
    id v19 = v6;
    if (!v6)
    {
      id v19 = [MEMORY[0x263EFF9D0] null];
    }
    id v31 = v7;
    uint64_t v32 = v19;
    uint64_t v33 = MEMORY[0x263EFFA80];
    int v20 = NSDictionary;
    id v21 = &v32;
    char v22 = &v30;
  }
  else
  {
    if ((v12 | v11 | v17 ^ 1))
    {
      char v23 = 0;
      uint64_t v18 = v25;
      goto LABEL_14;
    }
    uint64_t v18 = v25;
    id v26 = v25;
    id v19 = v6;
    if (!v6)
    {
      id v19 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v27 = v7;
    v28 = v19;
    uint64_t v29 = MEMORY[0x263EFFA88];
    int v20 = NSDictionary;
    id v21 = &v28;
    char v22 = &v26;
  }
  char v23 = objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 2, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34);
  if (!v6) {

  }
LABEL_14:

  return v23;
}

+ (id)_coreAnalyticsEventWithRestrictionsEnabled:(BOOL)a3 valuesByRestriction:(id)a4 userType:(unint64_t)a5 userIsManaged:(BOOL)a6
{
  BOOL v40 = a3;
  id v6 = a4;
  uint64_t v7 = [[STRestrictionItem alloc] initWithConfiguration:@"STSBCapabilityConfiguration" restrictionKey:@"kTCCServiceMediaLibrary" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8) {
    unsigned int v37 = [v8 BOOLValue] ^ 1;
  }
  else {
    unsigned int v37 = 0;
  }
  id v9 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowedGameCenterOtherPlayerTypes" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  id v10 = [v6 objectForKeyedSubscript:v9];

  if (v10) {
    BOOL v36 = [v10 integerValue] != 2;
  }
  else {
    BOOL v36 = 0;
  }
  int v11 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowAddingGameCenterFriends" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  int v12 = [v6 objectForKeyedSubscript:v11];

  if (v12) {
    HIDWORD(v35) = [v12 BOOLValue] ^ 1;
  }
  else {
    HIDWORD(v35) = 0;
  }
  id v13 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterFriendsSharingModification" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  id v14 = [v6 objectForKeyedSubscript:v13];

  if (v14) {
    uint64_t v15 = [v14 BOOLValue] ^ 1;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [[STRestrictionItem alloc] initWithConfiguration:@"system.camera" restrictionKey:@"allowScreenRecording" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  int v17 = [v6 objectForKeyedSubscript:v16];

  if (v17) {
    uint64_t v18 = [v17 BOOLValue] ^ 1;
  }
  else {
    uint64_t v18 = 0;
  }
  id v19 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterNearbyMultiplayer" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  int v20 = [v6 objectForKeyedSubscript:v19];

  if (v20) {
    char v21 = [v20 BOOLValue] ^ 1;
  }
  else {
    char v21 = 0;
  }
  char v22 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterPrivateMessaging" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  char v23 = [v6 objectForKeyedSubscript:v22];

  if (v23) {
    char v24 = [v23 BOOLValue] ^ 1;
  }
  else {
    char v24 = 0;
  }
  id v25 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterProfilePrivacyModification" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  id v26 = [v6 objectForKeyedSubscript:v25];

  if (v26) {
    char v27 = [v26 BOOLValue] ^ 1;
  }
  else {
    char v27 = 0;
  }
  v28 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowGameCenterProfileModification" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
  uint64_t v29 = [v6 objectForKeyedSubscript:v28];

  if (v29) {
    char v30 = [v29 BOOLValue] ^ 1;
  }
  else {
    char v30 = 0;
  }
  if (a5 > 7) {
    uint64_t v31 = 0;
  }
  else {
    uint64_t v31 = qword_225C139E8[a5];
  }
  LOBYTE(v35) = a6;
  BYTE3(v34) = v30;
  BYTE2(v34) = v27;
  BYTE1(v34) = v24;
  LOBYTE(v34) = v21;
  uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x263F67218]), "initWithContentAndPrivacyRestrictionsEnabled:mediaAndAppleMusicIsRestricted:gameCenterMultiplayerGamesIsRestricted:gameCenterAddingFriendsIsRestricted:gameCenterConnectWithFriendsIsRestricted:gameCenterScreenRecordingIsRestricted:gameCenterNearbyMultiplayerIsRestricted:gameCenterPrivateMessagingIsRestricted:gameCenterProfilePrivacyChangesIsRestricted:gameCenterAvatarAndNicknameChangesIsRestricted:userAgeGroup:userIsManaged:", v40, v37, v36, HIDWORD(v35), v15, v18, v34, v31, v35);

  return v32;
}

- (void)_reportCoreAnalyticsEventWithRestrictionsEnabled:(BOOL)a3 valuesByRestriction:(id)a4 userType:(unint64_t)a5 userIsManaged:(BOOL)a6
{
  id v6 = +[STContentPrivacyViewModelCoordinator _coreAnalyticsEventWithRestrictionsEnabled:a3 valuesByRestriction:a4 userType:a5 userIsManaged:a6];
  [MEMORY[0x263F67150] reportEvent:v6];
}

- (void)_reportCoreAnalyticsEventForChangedCommunicationLimits:(id)a3 userType:(unint64_t)a4 userIsRemote:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  BOOL v7 = [v11 screenTimeCommunicationLimit] || objc_msgSend(v11, "downtimeCommunicationLimit");
  uint64_t v8 = [v11 contactManagementState];
  if (a4 > 7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_225C139E8[a4];
  }
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263F67128]), "initWithCommunicationLimited:contactManagementEnabled:contactEditingAllowed:userAgeGroup:userIsRemote:", v7, v8 == 2, objc_msgSend(v11, "contactsEditable"), v9, v5);
  [MEMORY[0x263F67150] reportEvent:v10];
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (STOrganizationSettingsRestrictionUtilityProtocol)organizationSettingsRestrictionUtility
{
  return self->_organizationSettingsRestrictionUtility;
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSManagedObjectID)userObjectID
{
  return self->_userObjectID;
}

- (void)setUserObjectID:(id)a3
{
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (void)setIsLocalDevice:(BOOL)a3
{
  self->_isLocalDevice = a3;
}

- (NSMutableDictionary)configurationPayloadsByType
{
  return self->_configurationPayloadsByType;
}

- (void)setConfigurationPayloadsByType:(id)a3
{
}

- (NSArray)fetchedResultsControllers
{
  return self->_fetchedResultsControllers;
}

- (void)setFetchedResultsControllers:(id)a3
{
}

- (unint64_t)numExpectedChanges
{
  return self->_numExpectedChanges;
}

- (void)setNumExpectedChanges:(unint64_t)a3
{
  self->_numExpectedChanges = a3;
}

- (NSNumber)isRestrictAdultContentEnabledValue
{
  return self->_isRestrictAdultContentEnabledValue;
}

- (void)setIsRestrictAdultContentEnabledValue:(id)a3
{
}

- (STContentPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_isRestrictAdultContentEnabledValue, 0);
  objc_storeStrong((id *)&self->_fetchedResultsControllers, 0);
  objc_storeStrong((id *)&self->_configurationPayloadsByType, 0);
  objc_storeStrong((id *)&self->_userObjectID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_organizationSettingsRestrictionUtility, 0);

  objc_storeStrong((id *)&self->_persistenceController, 0);
}

void __127__STContentPrivacyViewModelCoordinator_initWithPersistenceController_organizationSettingsRestrictionUtility_userDSID_userName___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to load Content&Privacy: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)_remoteDeviceRestrictions
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_225B06000, log, OS_LOG_TYPE_ERROR, "Failed to provide region code for explicit content restriction key. Returning least restrictive string key.", v1, 2u);
}

- (void)_valueForMCFeature:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_225B06000, v0, v1, "MCFeature value for %@ is %@");
}

- (void)_setValue:forMCFeature:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_225B06000, v0, v1, "Setting MCFeature %@ to %@");
}

- (void)_valueForSBCapability:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_225B06000, v1, OS_LOG_TYPE_DEBUG, "SB capability %@ is present %d", v2, 0x12u);
}

- (void)_setValue:forSBCapability:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_225B06000, v0, v1, "Setting SB capability %@ to %@");
}

- (void)controller:(os_log_t)log didChangeObject:atIndexPath:forChangeType:newIndexPath:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_225B06000, log, OS_LOG_TYPE_DEBUG, "Observed a change which was not expected, so refreshing", v1, 2u);
}

- (void)controller:(void *)a1 didChangeObject:atIndexPath:forChangeType:newIndexPath:.cold.2(void *a1)
{
  [a1 numExpectedChanges];
  OUTLINED_FUNCTION_3(&dword_225B06000, v1, v2, "Observed a change, %d more are expected", v3, v4, v5, v6, 0);
}

void __71__STContentPrivacyViewModelCoordinator_reloadViewModelForRemoteChanges__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to reload Content&Privacy: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 userDSID];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_225B06000, a3, OS_LOG_TYPE_FAULT, "failed to fetch user for restrictions %{public}@: %{public}@", v6, 0x16u);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to fetch restrictions blueprints: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "Failed to check isRestrictAdultContentEnabled from settings service: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to save database changes: %{public}@", v2, v3, v4, v5, v6);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_cold_5(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "Deleting Family Restrictions blueprint with Personal organization identifier: %{public}@", v4, 0xCu);
}

void __75__STContentPrivacyViewModelCoordinator_loadViewModelWithCompletionHandler___block_invoke_793_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Failed to fetch Siri Image Creation restriction: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "user with objectID could not be found: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to fetch restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to save restrictions enabled state: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveContentPrivacyEnabled_completionHandler___block_invoke_cold_4(id *a1)
{
  [*a1 numExpectedChanges];
  OUTLINED_FUNCTION_3(&dword_225B06000, v1, v2, "Saving restrictions enabled, %d changes expected", v3, v4, v5, v6, 0);
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__STContentPrivacyViewModelCoordinator_saveCommunicationLimits_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to save: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to fetch restricitons blueprint: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_225B06000, v0, v1, "failed to save restrictions blueprint: %{public}@", v2, v3, v4, v5, v6);
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_5(id *a1)
{
  [*a1 numExpectedChanges];
  OUTLINED_FUNCTION_3(&dword_225B06000, v1, v2, "Saving restrictions, %d changes expected", v3, v4, v5, v6, 0);
}

void __84__STContentPrivacyViewModelCoordinator_saveValuesForRestrictions_completionHandler___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_225B06000, v0, v1, "Restrictions blueprint configuration payload not found for type %@", v2, v3, v4, v5, v6);
}

@end