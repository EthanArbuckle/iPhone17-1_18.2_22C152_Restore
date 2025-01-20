@interface PSSystemPolicyForApp
+ (BOOL)isServiceRestricted:(id)a3;
+ (OS_dispatch_queue)_bbObserverQueue;
- (BBObserver)_bbObserver;
- (BOOL)_accountModificationDisabledByRestrictions;
- (BOOL)_isAppClip;
- (BOOL)_isBackgroundAppRefreshAllowed;
- (BOOL)_isLocationServicesRestricted;
- (BOOL)_isWirelessDataRestricted;
- (BOOL)_supportsBackgroundAppRefresh;
- (BOOL)_supportsJournalingSuggestions;
- (BOOL)_supportsLiveActivities;
- (BOOL)_supportsLiveActivitiesFrequentUpdates;
- (BOOL)enServiceMatched;
- (BOOL)getMulticastAllowed:(BOOL *)a3;
- (BOOL)shouldShowPasteboardSpecifier;
- (NSString)bundleIdentifier;
- (NSString)containerPathForCurrentApp;
- (NSString)matchingBundleIdentifier;
- (NSUserDefaults)appUserDefaults;
- (PSDriverPolicyForApp)driverPolicy;
- (PSSpecifier)cinematicFramingSpecifier;
- (PSSystemPolicyForApp)initWithBundleIdentifier:(id)a3;
- (PSSystemPolicyForAppDelegate)delegate;
- (SESNFCAppSettingsContext)nfcContext;
- (id)_journalingSuggestionsSpecifiers;
- (id)accessoriesSpecifier;
- (id)accountsSpecifier;
- (id)assistantSpecifiers;
- (id)authLevelStringForStatus:(unint64_t)a3;
- (id)backgroundAppRefreshSpecifier;
- (id)calendarSpecifiers;
- (id)contactlessNFCSideButtonSpecifiers;
- (id)contactlessNFCSpecifiers;
- (id)contactsServicesSpecifier;
- (id)dataUsageWorkspaceInfo;
- (id)defaultAppSpecifierWithAppRecordsMatchingBlock:(id)a3 getter:(SEL)a4 setter:(SEL)a5 title:(id)a6;
- (id)defaultBrowser:(id)a3;
- (id)defaultBrowserSpecifier;
- (id)defaultMailApp:(id)a3;
- (id)defaultMailAppSpecifier;
- (id)documentSource:(id)a3;
- (id)documentsSpecifier;
- (id)driverKitSpecifiers;
- (id)exposureSpecifiersWithTCCServiceLookup:(id)a3;
- (id)familyControlsSpecifier;
- (id)getDoubleClickForNFC:(id)a3;
- (id)getNudityDetectionEnabledValue;
- (id)isBackgroundRefreshEnabled:(id)a3;
- (id)isFamilyControlsEnabled:(id)a3;
- (id)isLiveActivitiesEnabled:(id)a3;
- (id)isLocalNetworkEnabled:(id)a3;
- (id)isTapToPayAlwaysPlaySoundEnabled:(id)a3;
- (id)isTapToPayScreenLockEnabled:(id)a3;
- (id)liveActivitiesSpecifier;
- (id)locationServicesSpecifier;
- (id)locationStatus:(id)a3;
- (id)networkServicesSpecifier;
- (id)notificationSpecifier;
- (id)nudityDetectionSpeicier;
- (id)pasteboardAccessForSpecifier:(id)a3;
- (id)pasteboardSpecifier;
- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4;
- (id)photosServicesSpecifier;
- (id)preferredLanguage:(id)a3;
- (id)preferredLanguageSpecifier;
- (id)privacyAccessForSpecifier:(id)a3;
- (id)privacySpecifierForService:(__CFString *)a3 tccServiceLookup:(id)a4 tccServiceOverrides:(id)a5;
- (id)privacySpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4;
- (id)searchSpecifiers;
- (id)specifiers;
- (id)specifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4;
- (id)tapToPayAlwaysPlaySoundSpecifiers;
- (id)tapToPayScreenLockSpecifiers;
- (id)trackingSpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4;
- (id)walletSpecifier;
- (id)wirelessDataSpecifierWithAppName:(id)a3;
- (int64_t)_getAuthorizationRecordsStatus;
- (void)_handleAddAccountButtonAction:(id)a3;
- (void)headerLinkWasTapped;
- (void)loadNetworkConfigurationsForceRefresh:(BOOL)a3;
- (void)monitoredStoreDidChange:(id)a3;
- (void)observer:(id)a3 updateSectionInfo:(id)a4;
- (void)reloadSpecifiers;
- (void)saveNetworkConfiguration;
- (void)setAppUserDefaults:(id)a3;
- (void)setBackgroundRefreshEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setCinematicFramingSpecifier:(id)a3;
- (void)setContainerPathForCurrentApp:(id)a3;
- (void)setDefaultBrowser:(id)a3 specifier:(id)a4;
- (void)setDefaultMailApp:(id)a3 specifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDoubleClickForNFC:(id)a3 specifier:(id)a4;
- (void)setDriverPolicy:(id)a3;
- (void)setEnServiceMatched:(BOOL)a3;
- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setLiveActivitiesEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4;
- (void)setMatchingBundleIdentifier:(id)a3;
- (void)setNfcContext:(id)a3;
- (void)setPasteboardAccess:(id)a3 forSpecifier:(id)a4;
- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4;
- (void)setTapToPayAlwaysPlaySoundEnabled:(id)a3 specifier:(id)a4;
- (void)setTapToPayScreenLockEnabled:(id)a3 specifier:(id)a4;
- (void)set_bbObserver:(id)a3;
- (void)setupNetworkConfiguration;
- (void)showController:(id)a3 animate:(BOOL)a4;
@end

@implementation PSSystemPolicyForApp

- (PSSystemPolicyForApp)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PSSystemPolicyForApp;
  v5 = [(PSSystemPolicyForApp *)&v18 init];
  v6 = v5;
  if (v5)
  {
    [(PSSystemPolicyForApp *)v5 setBundleIdentifier:v4];
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2050000000;
    v7 = (void *)getBBObserverClass_softClass;
    uint64_t v23 = getBBObserverClass_softClass;
    if (!getBBObserverClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __getBBObserverClass_block_invoke;
      v19[3] = &unk_1E5C5D4D8;
      v19[4] = &v20;
      __getBBObserverClass_block_invoke((uint64_t)v19);
      v7 = (void *)v21[3];
    }
    v8 = v7;
    _Block_object_dispose(&v20, 8);
    id v9 = [v8 alloc];
    v10 = [(id)objc_opt_class() _bbObserverQueue];
    uint64_t v11 = [v9 initWithQueue:v10];
    bbObserver = v6->__bbObserver;
    v6->__bbObserver = (BBObserver *)v11;

    [(BBObserver *)v6->__bbObserver setObserverFeed:512];
    [(BBObserver *)v6->__bbObserver setDelegate:v6];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = *MEMORY[0x1E4F17928];
    v15 = +[PSAccountEnumerator sharedEnumerator];
    v16 = [v15 monitoredAccountStore];
    [v13 addObserver:v6 selector:sel_monitoredStoreDidChange_ name:v14 object:v16];

    if (initWithBundleIdentifier__onceToken != -1) {
      dispatch_once(&initWithBundleIdentifier__onceToken, &__block_literal_global_6);
    }
  }

  return v6;
}

void __49__PSSystemPolicyForApp_initWithBundleIdentifier___block_invoke()
{
  v90[24] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FA9A10];
  uint64_t v1 = *MEMORY[0x1E4FA9A30];
  v2 = (void *)MEMORY[0x1E4FA9A30];
  v89[0] = *MEMORY[0x1E4FA9A10];
  v89[1] = v1;
  v90[0] = &unk_1EFB73F58;
  v90[1] = &unk_1EFB73F70;
  v3 = (void *)MEMORY[0x1E4FA9AF0];
  id v4 = (void *)MEMORY[0x1E4FA9AE0];
  uint64_t v5 = *MEMORY[0x1E4FA9AE0];
  v89[2] = *MEMORY[0x1E4FA9AF0];
  v89[3] = v5;
  v90[2] = &unk_1EFB73F88;
  v90[3] = &unk_1EFB73FA0;
  v6 = (void *)MEMORY[0x1E4FA9A28];
  v7 = (void *)MEMORY[0x1E4FA9AA8];
  uint64_t v8 = *MEMORY[0x1E4FA9AA8];
  v89[4] = *MEMORY[0x1E4FA9A28];
  v89[5] = v8;
  v90[4] = &unk_1EFB73FB8;
  v90[5] = &unk_1EFB73FD0;
  uint64_t v9 = *MEMORY[0x1E4FA9A38];
  v89[6] = *MEMORY[0x1E4FA9B10];
  v89[7] = v9;
  v90[6] = &unk_1EFB73FE8;
  v90[7] = &unk_1EFB74000;
  uint64_t v10 = *MEMORY[0x1E4FA9AC8];
  v89[8] = *MEMORY[0x1E4FA9A70];
  v89[9] = v10;
  v90[8] = &unk_1EFB74018;
  v90[9] = &unk_1EFB74030;
  uint64_t v11 = *MEMORY[0x1E4FA9B30];
  v89[10] = *MEMORY[0x1E4FA9B40];
  v89[11] = v11;
  v90[10] = &unk_1EFB74048;
  v90[11] = &unk_1EFB74060;
  uint64_t v12 = *MEMORY[0x1E4FA9A88];
  v89[12] = *MEMORY[0x1E4FA9A78];
  v89[13] = v12;
  v90[12] = &unk_1EFB74078;
  v90[13] = &unk_1EFB74090;
  uint64_t v13 = *MEMORY[0x1E4FA9A98];
  v89[14] = *MEMORY[0x1E4FA9AA0];
  v89[15] = v13;
  v90[14] = &unk_1EFB740A8;
  v90[15] = &unk_1EFB740C0;
  uint64_t v14 = *MEMORY[0x1E4FA9B20];
  v89[16] = *MEMORY[0x1E4FA9B38];
  v89[17] = v14;
  v90[16] = &unk_1EFB740D8;
  v90[17] = &unk_1EFB740F0;
  uint64_t v15 = *MEMORY[0x1E4FA9A80];
  v89[18] = *MEMORY[0x1E4FA9AD8];
  v89[19] = v15;
  v90[18] = &unk_1EFB74108;
  v90[19] = &unk_1EFB74120;
  uint64_t v16 = *MEMORY[0x1E4FA9A60];
  v89[20] = *MEMORY[0x1E4FA9AD0];
  v89[21] = v16;
  v90[20] = &unk_1EFB74138;
  v90[21] = &unk_1EFB74150;
  uint64_t v17 = *MEMORY[0x1E4FA9A40];
  v89[22] = *MEMORY[0x1E4FA9AF8];
  v89[23] = v17;
  v90[22] = &unk_1EFB74168;
  v90[23] = &unk_1EFB74180;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:24];
  v19 = (void *)_PSServicePolicyOptions;
  _PSServicePolicyOptions = v18;

  v87[0] = *v0;
  v82 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v81 = [v82 localizedStringForKey:@"CONTACTS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[0] = v81;
  v87[1] = *v2;
  v80 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v79 = [v80 localizedStringForKey:@"CALENDARS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[1] = v79;
  v87[2] = *v3;
  v78 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v77 = [v78 localizedStringForKey:@"REMINDERS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[2] = v77;
  v87[3] = *MEMORY[0x1E4FA9B18];
  v76 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v75 = [v76 localizedStringForKey:@"UBIQUITY" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[3] = v75;
  v87[4] = *v4;
  v74 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v73 = [v74 localizedStringForKey:@"PHOTOS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[4] = v73;
  v87[5] = *v6;
  v72 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v71 = [v72 localizedStringForKey:@"BT_PERIPHERAL" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[5] = v71;
  v87[6] = *v7;
  v70 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v69 = [v70 localizedStringForKey:@"MICROPHONE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[6] = v69;
  v87[7] = *MEMORY[0x1E4FA9B10];
  v68 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v67 = [v68 localizedStringForKey:@"SPEECH_RECOGNITION" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[7] = v67;
  v87[8] = *MEMORY[0x1E4FA9A70];
  v66 = PSLocalizablePearlStringForKey(@"FACE_ID");
  v88[8] = v66;
  v87[9] = *MEMORY[0x1E4FA9AC8];
  v65 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v64 = [v65 localizedStringForKey:@"MOTION" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[9] = v64;
  v87[10] = *MEMORY[0x1E4FA9B40];
  v63 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v62 = [v63 localizedStringForKey:@"WILLOW" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[10] = v62;
  v87[11] = *MEMORY[0x1E4FA9B30];
  v61 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v60 = [v61 localizedStringForKey:@"PASSKEYS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[11] = v60;
  v87[12] = *MEMORY[0x1E4FA9A88];
  v59 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v58 = [v59 localizedStringForKey:@"KEYBOARD_NETWORKING" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[12] = v58;
  v87[13] = *MEMORY[0x1E4FA9AA0];
  v57 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v56 = [v57 localizedStringForKey:@"MEDIALIBRARY" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[13] = v56;
  v87[14] = *MEMORY[0x1E4FA9A98];
  v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v54 = [v55 localizedStringForKey:@"TV_PROVIDER" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[14] = v54;
  v87[15] = *MEMORY[0x1E4FA9B38];
  v53 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v52 = [v53 localizedStringForKey:@"WEBKIT_INTELLIGENT_TRACKING_PREVENTION" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[15] = v52;
  v87[16] = *MEMORY[0x1E4FA9B20];
  v51 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v50 = [v51 localizedStringForKey:@"CROSS_APP_TRACKING" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[16] = v50;
  v87[17] = *MEMORY[0x1E4FA9AD8];
  v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v48 = [v49 localizedStringForKey:@"PASTE_BETWEEN_APPS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[17] = v48;
  v87[18] = *MEMORY[0x1E4FA9A80];
  v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v46 = [v47 localizedStringForKey:@"FOCUS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[18] = v46;
  v87[19] = *MEMORY[0x1E4FA9AD0];
  v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v44 = [v45 localizedStringForKey:@"NEARBY_INTERACTIONS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[19] = v44;
  v87[20] = *MEMORY[0x1E4FA9A60];
  uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"EXPOSURE_NOTIFICATION" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[20] = v21;
  v87[21] = *MEMORY[0x1E4FA9A38];
  uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v23 = [v22 localizedStringForKey:@"CAMERA" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[21] = v23;
  v87[22] = *MEMORY[0x1E4FA9AF8];
  v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v25 = [v24 localizedStringForKey:@"SECURE_ELEMENT" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[22] = v25;
  v87[23] = *MEMORY[0x1E4FA9A40];
  v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"CONTACTLESS_NFC" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  v88[23] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:24];
  v29 = (void *)_PSLocalizedServiceNames;
  _PSLocalizedServiceNames = v28;

  v30 = (void *)_PSServiceIconNames;
  _PSServiceIconNames = MEMORY[0x1E4F1CC08];

  uint64_t v31 = *MEMORY[0x1E4FA9A40];
  v85[0] = *MEMORY[0x1E4FA9B30];
  v85[1] = v31;
  v86[0] = @"com.apple.graphic-icon.person-passkey";
  v86[1] = @"com.apple.graphic-icon.contactless-and-nfc";
  uint64_t v32 = *MEMORY[0x1E4FA9A88];
  v85[2] = *MEMORY[0x1E4FA9AF8];
  v85[3] = v32;
  v86[2] = @"com.apple.graphic-icon.secure-element";
  v86[3] = @"com.apple.graphic-icon.keyboard";
  uint64_t v33 = *MEMORY[0x1E4FA9AA8];
  v85[4] = *MEMORY[0x1E4FA9A28];
  v85[5] = v33;
  v86[4] = @"com.apple.graphic-icon.bluetooth";
  v86[5] = @"com.apple.graphic-icon.microphone-access";
  uint64_t v34 = *MEMORY[0x1E4FA9A70];
  v85[6] = *MEMORY[0x1E4FA9B10];
  v85[7] = v34;
  v86[6] = @"com.apple.graphic-icon.waveform";
  v86[7] = @"com.apple.graphic-icon.face-id";
  uint64_t v35 = *MEMORY[0x1E4FA9A98];
  v85[8] = *MEMORY[0x1E4FA9AC8];
  v85[9] = v35;
  v86[8] = @"com.apple.graphic-icon.motion-and-fitness";
  v86[9] = @"com.apple.graphic-icon.tv-provider";
  uint64_t v36 = *MEMORY[0x1E4FA9AD0];
  v85[10] = *MEMORY[0x1E4FA9A80];
  v85[11] = v36;
  v86[10] = @"com.apple.graphic-icon.focus";
  v86[11] = @"com.apple.graphic-icon.nearby-interactions";
  v85[12] = *MEMORY[0x1E4FA9A38];
  v86[12] = @"com.apple.graphic-icon.camera";
  uint64_t v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:13];
  v38 = (void *)_PSServiceIconTypeIDs;
  _PSServiceIconTypeIDs = v37;

  uint64_t v39 = *MEMORY[0x1E4FA9A30];
  v83[0] = *MEMORY[0x1E4FA9A10];
  v83[1] = v39;
  v84[0] = @"com.apple.MobileAddressBook";
  v84[1] = @"com.apple.mobilecal";
  uint64_t v40 = *MEMORY[0x1E4FA9AE0];
  v83[2] = *MEMORY[0x1E4FA9AF0];
  v83[3] = v40;
  v84[2] = @"com.apple.reminders";
  v84[3] = @"com.apple.mobileslideshow";
  uint64_t v41 = *MEMORY[0x1E4FA9AA0];
  v83[4] = *MEMORY[0x1E4FA9B40];
  v83[5] = v41;
  v84[4] = @"com.apple.Home";
  v84[5] = @"com.apple.Music";
  uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:6];
  v43 = (void *)_PSServiceIconApplicationBundleIdentifiers;
  _PSServiceIconApplicationBundleIdentifiers = v42;
}

+ (OS_dispatch_queue)_bbObserverQueue
{
  if (_bbObserverQueue_onceToken != -1) {
    dispatch_once(&_bbObserverQueue_onceToken, &__block_literal_global_204);
  }
  v2 = (void *)_bbObserverQueue__bbObserverQueue;
  return (OS_dispatch_queue *)v2;
}

void __40__PSSystemPolicyForApp__bbObserverQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.preferencesframework.gateway", v2);
  uint64_t v1 = (void *)_bbObserverQueue__bbObserverQueue;
  _bbObserverQueue__bbObserverQueue = (uint64_t)v0;
}

- (id)specifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = PKLogForCategory(6);
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, "PSSystemPolicyForApp.specifiers");

  uint64_t v5 = PKLogForCategory(6);
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[PSSystemPolicyForApp specifiers]";
    __int16 v14 = 2114;
    uint64_t v15 = v7;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PSSystemPolicyForApp.specifiers", "%s: %{public}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __34__PSSystemPolicyForApp_specifiers__block_invoke;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = v4;
  uint64_t v8 = (void (**)(void))MEMORY[0x1AD0BE2A0](v11);
  uint64_t v9 = [(PSSystemPolicyForApp *)self specifiersForPolicyOptions:-134348801 force:0];
  if (v8) {
    v8[2](v8);
  }

  return v9;
}

void __34__PSSystemPolicyForApp_specifiers__block_invoke(uint64_t a1)
{
  v2 = PKLogForCategory(6);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6597000, v3, OS_SIGNPOST_INTERVAL_END, v4, "PSSystemPolicyForApp.specifiers", (const char *)&unk_1A6690B76, v5, 2u);
  }
}

- (id)specifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  self->_policyOptions = a3;
  self->_forcePolicyOptions = a4;
  id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
  v6 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  v83 = (void *)[v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];

  v7 = [MEMORY[0x1E4F1CA48] array];
  if (PSIsWebAppPlaceholder(v83))
  {
    uint64_t v8 = NSString;
    BOOL v9 = [(PSSystemPolicyForApp *)self _isAppClip];
    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = v10;
    if (v9) {
      uint64_t v12 = @"ALLOW_APP_CLIP_ACCESS_FORMAT";
    }
    else {
      uint64_t v12 = @"ALLOW_ACCESS_FORMAT";
    }
    uint64_t v13 = [v10 localizedStringForKey:v12 value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    __int16 v14 = [v83 localizedName];
    uint64_t v15 = objc_msgSend(v8, "stringWithFormat:", v13, v14);
    uint64_t v16 = +[PSSpecifier groupSpecifierWithName:v15];

    objc_msgSend(v7, "ps_addPossibleObject:", v16);
    uint64_t v17 = [(PSSystemPolicyForApp *)self notificationSpecifier];
    objc_msgSend(v7, "ps_addPossibleObject:", v17);
  }
  else
  {
    if (v83)
    {
      CFURLRef v18 = [v83 URL];
      v19 = CFBundleCreate(0, v18);

      if (v19)
      {
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __57__PSSystemPolicyForApp_specifiersForPolicyOptions_force___block_invoke;
        v88[3] = &__block_descriptor_40_e5_v8__0l;
        v88[4] = v19;
        id v81 = (id)MEMORY[0x1AD0BE2A0](v88);
        uint64_t v20 = (void *)TCCAccessCopyInformationForBundle();
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v84 objects:v89 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v85;
          v24 = (void *)MEMORY[0x1E4FA9A00];
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v85 != v23) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v84 + 1) + 8 * i);
              v27 = [v26 objectForKeyedSubscript:*v24];
              objc_msgSend(v19, "na_safeSetObject:forKey:", v26, v27);
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v84 objects:v89 count:16];
          }
          while (v22);
        }

        uint64_t v28 = v81;
        if (v81)
        {
          (*((void (**)(void))v81 + 2))();
          uint64_t v28 = v81;
        }
      }
    }
    else
    {
      v19 = 0;
    }
    v29 = MEMORY[0x1AD0BD960]();
    v30 = [(PSSystemPolicyForApp *)self privacySpecifiersWithTCCServiceLookup:v19 tccServiceOverrides:v29];
    [v7 addObjectsFromArray:v30];

    uint64_t v31 = [(PSSystemPolicyForApp *)self calendarSpecifiers];
    objc_msgSend(v7, "ps_addPossibleObject:", v31);

    uint64_t v32 = [(PSSystemPolicyForApp *)self assistantSpecifiers];
    objc_msgSend(v7, "ps_addPossibleObject:", v32);

    uint64_t v33 = [(PSSystemPolicyForApp *)self searchSpecifiers];
    objc_msgSend(v7, "ps_addPossibleObject:", v33);

    uint64_t v34 = [(PSSystemPolicyForApp *)self notificationSpecifier];
    objc_msgSend(v7, "ps_addPossibleObject:", v34);

    uint64_t v35 = [(PSSystemPolicyForApp *)self nudityDetectionSpeicier];
    objc_msgSend(v7, "ps_addPossibleObject:", v35);

    uint64_t v36 = [(PSSystemPolicyForApp *)self liveActivitiesSpecifier];
    objc_msgSend(v7, "ps_addPossibleObject:", v36);

    uint64_t v37 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A88] tccServiceLookup:v19 tccServiceOverrides:v29];
    objc_msgSend(v7, "ps_addPossibleObject:", v37);

    v38 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9B18] tccServiceLookup:v19 tccServiceOverrides:v29];
    objc_msgSend(v7, "ps_addPossibleObject:", v38);

    id v82 = [(PSSystemPolicyForApp *)self backgroundAppRefreshSpecifier];
    objc_msgSend(v7, "ps_addPossibleObject:", v82);
    uint64_t v39 = [v83 localizedName];
    if (!v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v41 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      uint64_t v42 = [v40 localizedStringForKey:v41 value:&stru_1EFB51FD0 table:@"RemovableApplications"];

      uint64_t v39 = v42;
    }
    v78 = (void *)v39;
    v43 = -[PSSystemPolicyForApp wirelessDataSpecifierWithAppName:](self, "wirelessDataSpecifierWithAppName:");
    objc_msgSend(v7, "ps_addPossibleObject:", v43);

    v44 = [(PSSystemPolicyForApp *)self documentsSpecifier];
    objc_msgSend(v7, "ps_addPossibleObject:", v44);

    v45 = [(PSSystemPolicyForApp *)self exposureSpecifiersWithTCCServiceLookup:v19];
    [v7 addObjectsFromArray:v45];

    v46 = [(PSSystemPolicyForApp *)self _journalingSuggestionsSpecifiers];
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v46);

    v47 = [(PSSystemPolicyForApp *)self contactlessNFCSpecifiers];
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v47);

    v48 = [(PSSystemPolicyForApp *)self contactlessNFCSideButtonSpecifiers];
    objc_msgSend(v7, "na_safeAddObjectsFromArray:", v48);

    if ([v83 isEligibleWebBrowser])
    {
      uint64_t v79 = [(PSSystemPolicyForApp *)self defaultBrowserSpecifier];
    }
    else
    {
      uint64_t v79 = 0;
    }
    if ([v83 isEligibleMailClient])
    {
      uint64_t v49 = [(PSSystemPolicyForApp *)self defaultMailAppSpecifier];
    }
    else
    {
      uint64_t v49 = 0;
    }
    v77 = (void *)v49;
    if (v79 | v49)
    {
      v50 = +[PSSpecifier groupSpecifierWithID:@"DEFAULT_APP"];
      [v7 addObject:v50];
      objc_msgSend(v7, "ps_addPossibleObject:", v79);
      objc_msgSend(v7, "ps_addPossibleObject:", v77);
    }
    v80 = [(PSSystemPolicyForApp *)self trackingSpecifiersWithTCCServiceLookup:v19 tccServiceOverrides:v29];
    if ([v80 count]) {
      [v7 addObjectsFromArray:v80];
    }
    v51 = [(PSSystemPolicyForApp *)self pasteboardSpecifier];
    if (v51)
    {
      v52 = +[PSSpecifier groupSpecifierWithID:@"PASTEBOARD_GROUP"];
      [v7 addObject:v52];

      [v7 addObject:v51];
    }
    if ([v7 count])
    {
      v53 = NSString;
      BOOL v54 = [(PSSystemPolicyForApp *)self _isAppClip];
      v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v56 = v55;
      if (v54) {
        v57 = @"ALLOW_APP_CLIP_ACCESS_FORMAT";
      }
      else {
        v57 = @"ALLOW_ACCESS_FORMAT";
      }
      v58 = [v55 localizedStringForKey:v57 value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v59 = objc_msgSend(v53, "stringWithFormat:", v58, v78);
      v60 = +[PSSpecifier groupSpecifierWithName:v59];

      [v7 insertObject:v60 atIndex:0];
      if (v82
        && ([MEMORY[0x1E4F28F80] processInfo],
            v61 = objc_claimAutoreleasedReturnValue(),
            int v62 = [v61 isLowPowerModeEnabled],
            v61,
            v62))
      {
        v63 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v64 = [v63 localizedStringForKey:@"ALLOW_APP_REFRESH_LPM" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      }
      else
      {
        v64 = 0;
      }
      if ([v64 length]) {
        [v60 setProperty:v64 forKey:@"footerText"];
      }
      else {
        [v60 removePropertyForKey:@"footerText"];
      }
    }
    v65 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v66 = [v65 localizedStringForKey:@"PREFERRED_LANGUAGE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    v67 = +[PSSpecifier groupSpecifierWithName:v66];

    v68 = [(PSSystemPolicyForApp *)self preferredLanguageSpecifier];
    if (v68)
    {
      [v7 addObject:v67];
      v69 = [(PSSystemPolicyForApp *)self preferredLanguageSpecifier];
      objc_msgSend(v7, "ps_addPossibleObject:", v69);
    }
    v70 = [(PSSystemPolicyForApp *)self accountsSpecifier];
    if (v70)
    {
      v71 = +[PSSpecifier groupSpecifierWithID:@"ACCOUNTS_GROUP" name:0];
      [v7 addObject:v71];

      [v7 addObject:v70];
    }
    v72 = [(PSSystemPolicyForApp *)self familyControlsSpecifier];
    if (v72) {
      objc_msgSend(v7, "ps_addPossibleObject:", v72);
    }
    v73 = [(PSSystemPolicyForApp *)self tapToPayScreenLockSpecifiers];
    [v7 addObjectsFromArray:v73];

    v74 = [(PSSystemPolicyForApp *)self tapToPayAlwaysPlaySoundSpecifiers];
    [v7 addObjectsFromArray:v74];

    v75 = [(PSSystemPolicyForApp *)self driverKitSpecifiers];
    [v7 addObjectsFromArray:v75];
  }
  return v7;
}

void __57__PSSystemPolicyForApp_specifiersForPolicyOptions_force___block_invoke(uint64_t a1)
{
}

- (BOOL)_isAppClip
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  os_signpost_id_t v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  uint64_t v8 = 0;
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v8];

  v6 = [v5 appClipMetadata];
  LOBYTE(v4) = v6 != 0;

  return (char)v4;
}

- (id)notificationSpecifier
{
  if (self->_policyOptions)
  {
    os_signpost_id_t v4 = +[PSNotificationSettingsController sharedInstance];
    id v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    v6 = [v4 sectionInfoForIdentifier:v5];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v8 = PSBundlePathForPreferenceBundle(@"NotificationsSettings");
      BOOL v9 = SFRuntimeAbsoluteFilePathForPath();
      uint64_t v10 = [v7 bundleWithPath:v9];

      v2 = PSApplicationSpecifierForBBSection(v6, 0, (void *)[v10 classNamed:@"NotificationCell"], objc_msgSend(v10, "classNamed:", @"BulletinBoardAppDetailController"));
      uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:@"NOTIFICATIONS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      [v2 setName:v12];

      [v2 setIdentifier:@"NOTIFICATIONS"];
      [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      [v2 setObject:@"com.apple.graphic-icon.notifications" forKeyedSubscript:@"iconUTTypeIdentifier"];
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)nudityDetectionSpeicier
{
  if ((self->_policyOptions & 0x80000000000) == 0
    || ![getNudityDetectionPreferencesHelperClass() nudityDetectionFeatureEnabled])
  {
    goto LABEL_5;
  }
  id NudityDetectionPreferencesHelperClass = getNudityDetectionPreferencesHelperClass();
  os_signpost_id_t v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  if ([NudityDetectionPreferencesHelperClass nudityDetectionAvailableForBundleID:v4])
  {
    id v5 = [MEMORY[0x1E4F42948] currentDevice];
    char v6 = objc_msgSend(v5, "sf_inRetailKioskMode");

    if (v6)
    {
LABEL_5:
      v7 = 0;
      goto LABEL_6;
    }
    BOOL v9 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v10 = PSBundlePathForPreferenceBundle(@"CommunicationSafetySettings");
    uint64_t v11 = SFRuntimeAbsoluteFilePathForPath();
    os_signpost_id_t v4 = [v9 bundleWithPath:v11];

    uint64_t v12 = [getNudityDetectionPreferencesHelperClass() nudityDetectionRowLabel];
    uint64_t v13 = [getNudityDetectionPreferencesHelperClass() classForNudityAppDetectionSettings];
    v7 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel_getNudityDetectionEnabledValue, [v4 classNamed:v13], 2, 0);

    __int16 v14 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    [v7 setProperty:v14 forKey:@"BUNDLE_ID"];

    [v7 setIdentifier:@"NUDITY_DETECTION"];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(getNudityDetectionPreferencesHelperClass(), "nudityDetectionRowEnabled"));
    [v7 setObject:v15 forKeyedSubscript:@"enabled"];

    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    uint64_t v16 = [getNudityDetectionPreferencesHelperClass() nudityDetectionRowIconID];
    [v7 setObject:v16 forKeyedSubscript:@"iconUTTypeIdentifier"];
  }
  else
  {
    v7 = 0;
  }

LABEL_6:
  return v7;
}

- (id)getNudityDetectionEnabledValue
{
  id NudityDetectionPreferencesHelperClass = getNudityDetectionPreferencesHelperClass();
  os_signpost_id_t v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v5 = [NudityDetectionPreferencesHelperClass nudityDetectionOnOffLabelForBundleID:v4];

  return v5;
}

- (id)liveActivitiesSpecifier
{
  if ((self->_policyOptions & 0x10000000000) != 0
    && [(PSSystemPolicyForApp *)self _supportsLiveActivities])
  {
    if ([(PSSystemPolicyForApp *)self _supportsLiveActivitiesFrequentUpdates])
    {
      id v3 = (void *)MEMORY[0x1E4F28B50];
      os_signpost_id_t v4 = PSBundlePathForPreferenceBundle(@"ActivitySettings");
      id v5 = SFRuntimeAbsoluteFilePathForPath();
      char v6 = [v3 bundleWithPath:v5];

      v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"LIVE_ACTIVITIES" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      BOOL v9 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, 0, 0, 0, [v6 classNamed:@"ActivitySettingsDetailController"], 1, 0);

      uint64_t v10 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      [v9 setProperty:v10 forKey:@"BUNDLE_ID"];

      objc_msgSend(v9, "setProperty:forKey:", objc_msgSend(v6, "classNamed:", @"ActivitySettingsCell"), @"cellClass");
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v12 = [v11 localizedStringForKey:@"LIVE_ACTIVITIES" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      BOOL v9 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:sel_setLiveActivitiesEnabled_forSpecifier_ get:sel_isLiveActivitiesEnabled_ detail:0 cell:6 edit:0];

      [v9 setObject:objc_opt_class() forKeyedSubscript:@"cellClass"];
    }
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    [v9 setObject:@"com.apple.graphic-icon.live-activities" forKeyedSubscript:@"iconUTTypeIdentifier"];
  }
  else
  {
    BOOL v9 = 0;
  }
  return v9;
}

- (BOOL)_supportsLiveActivities
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  os_signpost_id_t v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  char v6 = (void *)getACActivityCenterClass_softClass;
  uint64_t v15 = getACActivityCenterClass_softClass;
  if (!getACActivityCenterClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getACActivityCenterClass_block_invoke;
    v11[3] = &unk_1E5C5D4D8;
    v11[4] = &v12;
    __getACActivityCenterClass_block_invoke((uint64_t)v11);
    char v6 = (void *)v13[3];
  }
  v7 = v6;
  _Block_object_dispose(&v12, 8);
  id v8 = objc_alloc_init(v7);
  if ([v5 supportsLiveActivities]) {
    char v9 = [v8 areActivitiesEnabled];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_supportsLiveActivitiesFrequentUpdates
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    char v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

    LOBYTE(v5) = [v6 supportsLiveActivitiesFrequentUpdates];
    LOBYTE(v3) = (_BYTE)v5;
  }
  return v3;
}

- (void)setLiveActivitiesEnabled:(id)a3 forSpecifier:(id)a4
{
  id v10 = a3;
  id v5 = objc_alloc_init((Class)getACActivityAuthorizationClass());
  uint64_t v6 = [v10 BOOLValue];
  uint64_t v7 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  [v5 setActivitiesEnabled:v6 forBundleId:v7];

  id v8 = [(PSSystemPolicyForApp *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    char v9 = [(PSSystemPolicyForApp *)self delegate];
    [v9 systemPolicyForApp:self didUpdateForSystemPolicyOptions:0x10000000000 withValue:v10];
  }
}

- (id)isLiveActivitiesEnabled:(id)a3
{
  id v4 = objc_alloc_init((Class)getACActivityAuthorizationClass());
  id v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  uint64_t v6 = [v4 areActivitiesEnabledForBundleId:v5];

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];

  return v7;
}

- (BOOL)_supportsJournalingSuggestions
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  LOBYTE(v4) = [v5 supportsJournalingSuggestions];
  return (char)v4;
}

- (id)_journalingSuggestionsSpecifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ((self->_policyOptions & 0x100000000000) != 0
    && [(PSSystemPolicyForApp *)self _supportsJournalingSuggestions]
    && MomentsOnboardingAndSettingsLibraryCore_0())
  {
    if (!MomentsOnboardingAndSettingsLibraryCore_0())
    {
      uint64_t v12 = 0;
      uint64_t v11 = (void *)abort_report_np();
      free(v11);
    }
    id v4 = +[PSSpecifier groupSpecifierWithID:@"JOURNALING_SUGGESTIONS_GROUP", v12];
    [v3 addObject:v4];
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"JOURNALING_SUGGESTIONS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    uint64_t v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:NSClassFromString(&cfstr_Mosuggestionsh.isa) cell:2 edit:0];

    uint64_t v8 = MEMORY[0x1E4F1CC38];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"allowMultilineTitleKey"];
    char v9 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    [v7 setObject:v9 forKeyedSubscript:@"AppBundleID"];

    [v7 setObject:v8 forKeyedSubscript:@"useLazyIcons"];
    [v7 setObject:@"com.apple.graphic-icon.journaling-suggestions" forKeyedSubscript:@"iconUTTypeIdentifier"];
    [v3 addObject:v7];
  }
  return v3;
}

- (id)accessoriesSpecifier
{
  accessoriesPrivacyController = self->_accessoriesPrivacyController;
  if (!accessoriesPrivacyController)
  {
    id v4 = [[PSAccessoriesPolicyController alloc] initWithAppBundleID:self->_bundleIdentifier];
    id v5 = self->_accessoriesPrivacyController;
    self->_accessoriesPrivacyController = v4;

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__PSSystemPolicyForApp_accessoriesSpecifier__block_invoke;
    v10[3] = &unk_1E5C5D9D0;
    objc_copyWeak(&v11, &location);
    [(PSAccessoriesPolicyController *)self->_accessoriesPrivacyController setAccessChangedHandler:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    accessoriesPrivacyController = self->_accessoriesPrivacyController;
  }
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"ACCESSORIES" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
  uint64_t v8 = [(PSAccessoriesPolicyController *)accessoriesPrivacyController appSpecifierWithName:v7 bundleID:self->_bundleIdentifier];

  if (v8) {
    [v8 setIdentifier:@"ACCESSORIES"];
  }
  return v8;
}

void __44__PSSystemPolicyForApp_accessoriesSpecifier__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained delegate];
  [v1 reloadSpecifiers];
}

- (id)accountsSpecifier
{
  if (_os_feature_enabled_impl() && (self->_policyOptions & 0x8000000) != 0)
  {
    id v4 = +[PSAccountEnumerator sharedEnumerator];
    uint64_t v5 = [v4 visibleAccountCount];

    if (v5 < 1)
    {
      id v3 = PSApplicationSpecifierForAddAccountButton();
      [v3 setTarget:self];
      [v3 setButtonAction:sel__handleAddAccountButtonAction_];
      uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PSSystemPolicyForApp _accountModificationDisabledByRestrictions](self, "_accountModificationDisabledByRestrictions") ^ 1);
      [v3 setProperty:v6 forKey:@"enabled"];
    }
    else
    {
      id v3 = PSApplicationSpecifierForAccountsSection();
    }
    uint64_t v7 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"AppBundleID"];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_handleAddAccountButtonAction:(id)a3
{
  id v9 = a3;
  id v4 = [(PSSystemPolicyForApp *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  uint64_t v6 = v9;
  if (v5)
  {
    id v7 = objc_alloc_init((Class)[v9 detailControllerClass]);
    if (v7)
    {
      uint64_t v8 = [(PSSystemPolicyForApp *)self delegate];
      [v8 showController:v7 animate:1];
    }
    uint64_t v6 = v9;
  }
}

- (BOOL)_accountModificationDisabledByRestrictions
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;

  return v3;
}

- (void)monitoredStoreDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PSSystemPolicyForApp_monitoredStoreDidChange___block_invoke;
  block[3] = &unk_1E5C5D680;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__PSSystemPolicyForApp_monitoredStoreDidChange___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 reloadSpecifiers];
}

- (id)calendarSpecifiers
{
  if ((self->_policyOptions & 8) != 0)
  {
    if (!self->_calendarPrivacyController)
    {
      id v4 = (PSCalendarPolicyController *)objc_opt_new();
      calendarPrivacyController = self->_calendarPrivacyController;
      self->_calendarPrivacyController = v4;
    }
    if (calendarSpecifiers_onceToken != -1) {
      dispatch_once(&calendarSpecifiers_onceToken, &__block_literal_global_318);
    }
    uint64_t v6 = self->_calendarPrivacyController;
    uint64_t v7 = calendarSpecifiers_specifierName;
    uint64_t v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    v2 = [(PSCalendarPolicyController *)v6 appSpecifierWithName:v7 bundleID:v8];

    if (v2) {
      [v2 setIdentifier:@"CALENDAR"];
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __42__PSSystemPolicyForApp_calendarSpecifiers__block_invoke()
{
  id v2 = +[PSCalendarPolicyController loadPrivacySettingsBundle];
  uint64_t v0 = [v2 localizedStringForKey:@"CALENDARS" value:&stru_1EFB51FD0 table:@"Privacy"];
  id v1 = (void *)calendarSpecifiers_specifierName;
  calendarSpecifiers_specifierName = v0;
}

- (id)assistantSpecifiers
{
  if ((self->_policyOptions & 0x800000) != 0
    && ([MEMORY[0x1E4F223E0] defaultWorkspace],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 applicationIsInstalled:self->_bundleIdentifier],
        v3,
        v4))
  {
    char v5 = PSApplicationSpecifierForAssistantSectionForBundleId((uint64_t)self->_bundleIdentifier, 1, 0, 0);
    [v5 setIdentifier:@"SIRI"];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)searchSpecifiers
{
  if ((self->_policyOptions & 0x800000) != 0)
  {
    id v2 = PSApplicationSpecifierForSearchSectionForBundleId(self->_bundleIdentifier, 1, 0, 0);
    [v2 setIdentifier:@"SEARCH"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)dataUsageWorkspaceInfo
{
  uint64_t v12 = 0;
  uint64_t v8 = 0;
  long long v10 = 0u;
  uint64_t v11 = 0;
  id v9 = self;
  uint64_t v2 = _CTServerConnectionCreate();
  if (v2)
  {
    BOOL v3 = (const void *)v2;
    _CTServerConnectionCopyCellularUsageWorkspaceInfo();
    CFRelease(v3);
  }
  int v4 = _PSLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1A6597000, v4, OS_LOG_TYPE_DEFAULT, "Failed to get the data usage workspace information", v7, 2u);
  }

  char v5 = v12;
  return v5;
}

- (BOOL)_isWirelessDataRestricted
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73EF8]];

  int v4 = [MEMORY[0x1E4F42948] currentDevice];
  char v5 = objc_msgSend(v4, "sf_isChinaRegionCellularDevice");

  BOOL v6 = (v5 & 1) == 0 && CTCellularDataPlanGetIsEnabled() == 0;
  return v3 == 2 || v6;
}

- (id)wirelessDataSpecifierWithAppName:(id)a3
{
  id v4 = a3;
  if ((self->_policyOptions & 0x8000) == 0 || !MGGetBoolAnswer()) {
    goto LABEL_5;
  }
  BOOL v5 = [(PSSystemPolicyForApp *)self _isWirelessDataRestricted];
  [0 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"enabled"];
  if (v5)
  {
    [0 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"enabled"];
LABEL_5:
    BOOL v6 = 0;
    goto LABEL_6;
  }
  uint64_t v17 = 0;
  CFURLRef v18 = &v17;
  uint64_t v19 = 0x2050000000;
  uint64_t v8 = (void *)getPSAppCellularUsageSpecifierClass_softClass;
  uint64_t v20 = getPSAppCellularUsageSpecifierClass_softClass;
  if (!getPSAppCellularUsageSpecifierClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getPSAppCellularUsageSpecifierClass_block_invoke;
    v16[3] = &unk_1E5C5D4D8;
    v16[4] = &v17;
    __getPSAppCellularUsageSpecifierClass_block_invoke((uint64_t)v16);
    uint64_t v8 = (void *)v18[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v17, 8);
  long long v10 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  uint64_t v11 = objc_opt_new();
  BOOL v6 = objc_msgSend(v9, "systemPolicySpecifierForAppName:bundleID:icon:enabled:", v4, v10, v11, -[PSSystemPolicyForApp _isWirelessDataRestricted](self, "_isWirelessDataRestricted") ^ 1);

  uint64_t v12 = NSString;
  uint64_t v13 = [v6 identifier];
  uint64_t v14 = [v12 stringWithFormat:@"%@.wireless", v13];
  [v6 setIdentifier:v14];

  [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
  [v6 setObject:@"com.apple.graphic-icon.cellular-settings" forKeyedSubscript:@"iconUTTypeIdentifier"];
  id v15 = (id)[v6 performGetter];
  [v6 removePropertyForKey:@"iconImage"];
LABEL_6:

  return v6;
}

- (id)familyControlsSpecifier
{
  if ((self->_policyOptions & 0x1000000000) != 0
    && [(PSSystemPolicyForApp *)self _getAuthorizationRecordsStatus] != 1)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v5 = [v4 localizedStringForKey:@"FAMILY_CONTROLS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    int v3 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:sel_setFamilyControlsEnabled_forSpecifier_ get:sel_isFamilyControlsEnabled_ detail:0 cell:6 edit:0];

    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    [v3 setObject:@"com.apple.graphic-icon.screen-time" forKeyedSubscript:@"iconUTTypeIdentifier"];
  }
  else
  {
    int v3 = 0;
  }
  return v3;
}

- (int64_t)_getAuthorizationRecordsStatus
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v3 = objc_msgSend(getFOAuthorizationCenterClass(), "sharedCenter", 0);
  id v4 = [v3 authorizationRecords];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    int64_t v8 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 bundleIdentifier];
        uint64_t v12 = [(PSSystemPolicyForApp *)self bundleIdentifier];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          int64_t v8 = [v10 status];
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v8 = 1;
  }
LABEL_12:

  return v8;
}

- (void)setFamilyControlsEnabled:(id)a3 forSpecifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__0;
  v26[4] = __Block_byref_object_dispose__0;
  id v7 = v6;
  id v27 = v7;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int64_t v8 = [getFOAuthorizationCenterClass() sharedCenter];
  id v9 = [v8 authorizationRecords];

  long long v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      uint64_t v14 = v10;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        long long v16 = [v15 bundleIdentifier];
        long long v17 = [(PSSystemPolicyForApp *)self bundleIdentifier];
        if ([v16 isEqualToString:v17])
        {
          long long v10 = [v15 recordIdentifier];
        }
        else
        {
          long long v10 = 0;
        }

        ++v13;
        uint64_t v14 = v10;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }

  if ([(PSSystemPolicyForApp *)self _getAuthorizationRecordsStatus] == 2)
  {
    long long v18 = [getFOAuthorizationCenterClass() sharedCenter];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke;
    v21[3] = &unk_1E5C5D9F8;
    v21[4] = v26;
    [v18 resetAuthorizationForRecordIdentifier:v10 completionHandler:v21];
  }
  else
  {
    long long v18 = [getFOAuthorizationCenterClass() sharedCenter];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke_2;
    v20[3] = &unk_1E5C5D9F8;
    v20[4] = v26;
    [v18 requestAuthorizationForRecordIdentifier:v10 completionHandler:v20];
  }

  _Block_object_dispose(v26, 8);
}

void __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC38];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v2);
}

void __62__PSSystemPolicyForApp_setFamilyControlsEnabled_forSpecifier___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC28];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v2);
}

- (id)isFamilyControlsEnabled:(id)a3
{
  if ([(PSSystemPolicyForApp *)self _getAuthorizationRecordsStatus] == 2) {
    int v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    int v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  return v3;
}

- (id)backgroundAppRefreshSpecifier
{
  if ((self->_policyOptions & 2) != 0
    && [(PSSystemPolicyForApp *)self _supportsBackgroundAppRefresh])
  {
    int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"BACKGROUND_APP_REFRESH" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    uint64_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:sel_setBackgroundRefreshEnabled_forSpecifier_ get:sel_isBackgroundRefreshEnabled_ detail:0 cell:6 edit:0];

    [v5 setObject:objc_opt_class() forKeyedSubscript:@"cellClass"];
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PSSystemPolicyForApp _isBackgroundAppRefreshAllowed](self, "_isBackgroundAppRefreshAllowed") ^ 1);
    [v5 setProperty:v6 forKey:@"enabled"];

    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    [v5 setObject:@"com.apple.graphic-icon.background-app-refresh" forKeyedSubscript:@"iconUTTypeIdentifier"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (BOOL)_supportsBackgroundAppRefresh
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  uint64_t v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:1 error:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v5, "UIBackgroundModes", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v11 isEqualToString:@"remote-notification"] & 1) != 0
          || ([v11 isEqualToString:@"newsstand-content"] & 1) != 0
          || ([v11 isEqualToString:@"fetch"] & 1) != 0
          || ([v11 isEqualToString:@"processing"] & 1) != 0)
        {
          BOOL v12 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_15:

  return v12;
}

- (BOOL)_isBackgroundAppRefreshAllowed
{
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  char v3 = [v2 isLowPowerModeEnabled];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F74230] sharedConnection];
    int v6 = [v5 isAutomaticAppUpdatesAllowed];
    int v7 = [v5 isAutomaticAppUpdatesModificationAllowed];
    int v4 = v6 & v7 ^ 1 | [v5 isBoolSettingLockedDownByRestrictions:*MEMORY[0x1E4F73F68]];
  }
  return v4;
}

- (void)setBackgroundRefreshEnabled:(id)a3 forSpecifier:(id)a4
{
  id v12 = a3;
  uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
  int v6 = (void *)[v5 mutableCopy];

  if (!v6) {
    int v6 = objc_opt_new();
  }
  int v7 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  [v6 setObject:v12 forKey:v7];

  CFPreferencesSetAppValue(@"KeepAppsUpToDateAppList", v6, @"com.apple.mt");
  CFPreferencesAppSynchronize(@"com.apple.mt");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kKeepAppsUpToDateEnabledChangedNotification", 0, 0, 1u);
  uint64_t v9 = [(PSSystemPolicyForApp *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(PSSystemPolicyForApp *)self delegate];
    [v11 systemPolicyForApp:self didUpdateForSystemPolicyOptions:2 withValue:v12];
  }
}

- (id)isBackgroundRefreshEnabled:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4F28F80], "processInfo", a3);
  char v5 = [v4 isLowPowerModeEnabled];

  if (v5)
  {
    int v6 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    int v7 = (void *)CFPreferencesCopyAppValue(@"KeepAppsUpToDateAppList", @"com.apple.mt");
    uint64_t v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9) {
      int v6 = (void *)v9;
    }
    else {
      int v6 = (void *)MEMORY[0x1E4F1CC38];
    }
  }
  return v6;
}

- (id)photosServicesSpecifier
{
  if ((self->_policyOptions & 0x20) != 0)
  {
    photosPrivacyController = self->_photosPrivacyController;
    if (!photosPrivacyController)
    {
      char v5 = (PSPhotosPolicyController *)objc_opt_new();
      int v6 = self->_photosPrivacyController;
      self->_photosPrivacyController = v5;

      photosPrivacyController = self->_photosPrivacyController;
    }
    int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"PHOTOS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    uint64_t v9 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    uint64_t v2 = [(PSPhotosPolicyController *)photosPrivacyController appSpecifierWithName:v8 bundleID:v9];

    if (v2)
    {
      [v2 setIdentifier:@"PHOTOS"];
      [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      [v2 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:@"appIDForLazyIcon"];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)walletSpecifier
{
  if ((self->_policyOptions & 0x800000000000) != 0)
  {
    int v4 = [PSWalletPolicyController alloc];
    char v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    int v6 = [(PSWalletPolicyController *)v4 initWithBundleIdentifier:v5];
    walletPrivacyController = self->_walletPrivacyController;
    self->_walletPrivacyController = v6;

    uint64_t v2 = [(PSWalletPolicyController *)self->_walletPrivacyController specifier];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)contactsServicesSpecifier
{
  if ((self->_policyOptions & 4) != 0)
  {
    contactsPrivacyController = self->_contactsPrivacyController;
    if (!contactsPrivacyController)
    {
      char v5 = (PSContactsPolicyController *)objc_opt_new();
      int v6 = self->_contactsPrivacyController;
      self->_contactsPrivacyController = v5;

      contactsPrivacyController = self->_contactsPrivacyController;
    }
    int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"CONTACTS" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    uint64_t v9 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    uint64_t v2 = [(PSContactsPolicyController *)contactsPrivacyController appSpecifierWithName:v8 bundleID:v9];

    if (v2)
    {
      [v2 setIdentifier:@"CONTACTS"];
      [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      [v2 setObject:@"com.apple.MobileAddressBook" forKeyedSubscript:@"appIDForLazyIcon"];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (BOOL)getMulticastAllowed:(BOOL *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)[MEMORY[0x1E4F38D08] copyAggregatePathRules];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "matchSigningIdentifier", (void)v16);
        id v12 = [(PSSystemPolicyForApp *)self bundleIdentifier];
        if ([v11 isEqualToString:v12])
        {
          int v13 = [v10 multicastPreferenceSet];

          if (v13)
          {
            if (a3) {
              *a3 = 1;
            }
            int v14 = [v10 denyMulticast] ^ 1;
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v14) = 0;
LABEL_16:

  return v14;
}

- (void)setupNetworkConfiguration
{
  char v9 = 0;
  [(PSSystemPolicyForApp *)self getMulticastAllowed:&v9];
  if (v9)
  {
    objc_initWeak(&location, self);
    char v3 = [MEMORY[0x1E4F38CD0] sharedManagerForAllUsers];
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__PSSystemPolicyForApp_setupNetworkConfiguration__block_invoke;
    v6[3] = &unk_1E5C5DA20;
    objc_copyWeak(&v7, &location);
    [v3 setChangedQueue:v4 andHandler:v6];

    [(PSSystemPolicyForApp *)self loadNetworkConfigurationsForceRefresh:0];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __49__PSSystemPolicyForApp_setupNetworkConfiguration__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained loadNetworkConfigurationsForceRefresh:1];
}

- (void)loadNetworkConfigurationsForceRefresh:(BOOL)a3
{
  if (self->_pathControllerConfiguration) {
    BOOL v3 = !a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F38CD0], "sharedManagerForAllUsers", a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke;
    v6[3] = &unk_1E5C5D570;
    void v6[4] = self;
    [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v6];
  }
}

void __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _PSLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "name", (void)v18);
        if ([v14 isEqualToString:@"com.apple.preferences.networkprivacy"])
        {
          long long v15 = [v13 pathController];

          if (!v15) {
            continue;
          }
          uint64_t v16 = *(void *)(a1 + 32);
          id v17 = v13;
          int v14 = *(void **)(v16 + 72);
          *(void *)(v16 + 72) = v17;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)saveNetworkConfiguration
{
  uint64_t v2 = self->_pathControllerConfiguration;
  BOOL v3 = [MEMORY[0x1E4F38CD0] sharedManagerForAllUsers];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke;
  v5[3] = &unk_1E5C5DA48;
  id v6 = v2;
  uint64_t v4 = v2;
  [v3 saveConfiguration:v4 withCompletionQueue:MEMORY[0x1E4F14428] handler:v5];
}

void __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _PSLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke_cold_1((uint64_t)v3, a1, v4);
    }
  }
}

- (id)pathRuleForBundleID:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NEConfiguration *)self->_pathControllerConfiguration pathController];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend(v7, "pathRules", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v14 = [v13 matchSigningIdentifier];
        int v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          id v16 = v13;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F38D18]) initWithSigningIdentifier:v6];
    id v17 = [v7 pathRules];

    if (v17)
    {
      id v8 = [v7 pathRules];
      long long v18 = [v8 arrayByAddingObject:v16];
      [v7 setPathRules:v18];
    }
    else
    {
      id v24 = v16;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      [v7 setPathRules:v8];
    }
LABEL_13:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)setLocalNetworkEnabled:(id)a3 specifier:(id)a4
{
  id v10 = a3;
  id v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v6 = [(PSSystemPolicyForApp *)self pathRuleForBundleID:v5 create:1];

  objc_msgSend(v6, "setDenyMulticast:", objc_msgSend(v10, "BOOLValue") ^ 1);
  [v6 setMulticastPreferenceSet:1];
  [(PSSystemPolicyForApp *)self saveNetworkConfiguration];
  id v7 = [(PSSystemPolicyForApp *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(PSSystemPolicyForApp *)self delegate];
    [v9 systemPolicyForApp:self didUpdateForSystemPolicyOptions:0x4000000 withValue:v10];
  }
}

- (id)isLocalNetworkEnabled:(id)a3
{
  if (self->_pathControllerConfiguration)
  {
    BOOL v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    id v5 = [(PSSystemPolicyForApp *)self pathRuleForBundleID:v4 create:0];

    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28ED0]), "initWithBool:", objc_msgSend(v5, "denyMulticast") ^ 1);
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PSSystemPolicyForApp getMulticastAllowed:](self, "getMulticastAllowed:", 0));
  }
  return v6;
}

- (id)networkServicesSpecifier
{
  if ((self->_policyOptions & 0x4000000) != 0
    && _os_feature_enabled_impl()
    && (char v8 = 0, [(PSSystemPolicyForApp *)self getMulticastAllowed:&v8], v8))
  {
    [(PSSystemPolicyForApp *)self setupNetworkConfiguration];
    id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v4 = [v3 localizedStringForKey:@"LOCAL_NETWORK_PRIVACY" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:sel_setLocalNetworkEnabled_specifier_ get:sel_isLocalNetworkEnabled_ detail:0 cell:6 edit:0];

    id v6 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    [v5 setProperty:v6 forKey:@"PUINetworkApplicationKey"];

    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    [v5 setObject:@"com.apple.graphic-icon.local-network" forKeyedSubscript:@"iconUTTypeIdentifier"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)locationServicesSpecifier
{
  if ((self->_policyOptions & 0x10000) != 0)
  {
    BOOL v4 = (void *)CLCopyAppsUsingLocation();
    id v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    id v6 = [v4 objectForKey:v5];

    if (v6 && [MEMORY[0x1E4F1E600] primaryEntityClassForLocationDictionary:v6] == 1)
    {
      id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v8 = [v7 localizedStringForKey:@"LOCATION_SERVICES" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      uint64_t v2 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:sel_locationStatus_ detail:NSClassFromString(&cfstr_Puilocationser.isa) cell:2 edit:0];

      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[PSSystemPolicyForApp _isLocationServicesRestricted](self, "_isLocationServicesRestricted") ^ 1);
      [v2 setProperty:v9 forKey:@"enabled"];

      id v10 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      [v2 setProperty:v10 forKey:@"id"];

      [v2 setProperty:NSClassFromString(&cfstr_Psuilocationse.isa) forKey:@"cellClass"];
      [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      [v2 setObject:@"com.apple.graphic-icon.location" forKeyedSubscript:@"iconUTTypeIdentifier"];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (BOOL)_isLocationServicesRestricted
{
  BOOL v2 = +[PSSystemPolicyForApp isServiceRestricted:@"location"];
  return [MEMORY[0x1E4F1E600] locationServicesEnabled] ^ 1 | v2;
}

- (id)locationStatus:(id)a3
{
  BOOL v4 = (void *)CLCopyAppsUsingLocation();
  id v5 = (void *)MEMORY[0x1E4F1E600];
  id v6 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v7 = [v4 objectForKey:v6];
  uint64_t v8 = [v5 entityAuthorizationForLocationDictionary:v7];

  uint64_t v9 = [(PSSystemPolicyForApp *)self authLevelStringForStatus:v8];

  return v9;
}

- (id)authLevelStringForStatus:(unint64_t)a3
{
  if (a3)
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    id v6 = @"NEVER_AUTHORIZATION";
  }
  else if (a3)
  {
    if ((a3 & 4) != 0)
    {
      BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v5 = v4;
      id v6 = @"ALWAYS_AUTHORIZATION";
    }
    else
    {
      if ((a3 & 2) == 0)
      {
        id v3 = 0;
        goto LABEL_11;
      }
      BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v5 = v4;
      id v6 = @"WHEN_IN_USE_AUTHORIZATION_SHORT";
    }
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = v4;
    id v6 = @"NOT_DETERMINED_AUTHORIZATION_SHORT";
  }
  id v3 = [v4 localizedStringForKey:v6 value:&stru_1EFB51FD0 table:@"LocationServicesPrivacy"];

LABEL_11:
  return v3;
}

- (id)privacySpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [(PSSystemPolicyForApp *)self locationServicesSpecifier];
  objc_msgSend(v8, "ps_addPossibleObject:", v9);

  if (_os_feature_enabled_impl()) {
    [(PSSystemPolicyForApp *)self contactsServicesSpecifier];
  }
  else {
  id v10 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A10] tccServiceLookup:v6 tccServiceOverrides:v7];
  }
  objc_msgSend(v8, "ps_addPossibleObject:", v10);

  uint64_t v11 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9AF0] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v11);

  id v12 = [(PSSystemPolicyForApp *)self photosServicesSpecifier];
  objc_msgSend(v8, "ps_addPossibleObject:", v12);

  int v13 = [(PSSystemPolicyForApp *)self accessoriesSpecifier];
  objc_msgSend(v8, "ps_addPossibleObject:", v13);

  int v14 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A28] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v14);

  int v15 = [(PSSystemPolicyForApp *)self networkServicesSpecifier];
  objc_msgSend(v8, "ps_addPossibleObject:", v15);

  id v16 = +[PSCapabilityManager sharedManager];
  int v17 = [v16 capabilityBoolAnswer:@"9RryeqF6OCWlbaXP2Qsoag"];

  if (v17)
  {
    long long v18 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9AD0] tccServiceLookup:v6 tccServiceOverrides:v7];
    objc_msgSend(v8, "ps_addPossibleObject:", v18);
  }
  long long v19 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9AA8] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v19);

  long long v20 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9B10] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v20);

  long long v21 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9AC8] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v21);

  long long v22 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A38] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v22);

  long long v23 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A70] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v23);

  id v24 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A40] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v24);

  long long v25 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9AF8] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v25);

  uint64_t v26 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9B40] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v26);

  id v27 = [(PSSystemPolicyForApp *)self walletSpecifier];
  objc_msgSend(v8, "ps_addPossibleObject:", v27);

  uint64_t v28 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9AA0] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v28);

  uint64_t v29 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A98] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v29);

  if (_os_feature_enabled_impl())
  {
    v30 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9A80] tccServiceLookup:v6 tccServiceOverrides:v7];
    objc_msgSend(v8, "ps_addPossibleObject:", v30);
  }
  uint64_t v31 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9B30] tccServiceLookup:v6 tccServiceOverrides:v7];
  objc_msgSend(v8, "ps_addPossibleObject:", v31);

  return v8;
}

- (id)privacySpecifierForService:(__CFString *)a3 tccServiceLookup:(id)a4 tccServiceOverrides:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t policyOptions = self->_policyOptions;
  uint64_t v11 = [(id)_PSServicePolicyOptions objectForKey:a3];
  uint64_t v12 = [v11 unsignedIntegerValue] & policyOptions;

  if (!v12)
  {
    long long v20 = 0;
    goto LABEL_46;
  }
  int v13 = [v9 containsObject:a3];
  objc_opt_class();
  int v14 = [v8 objectForKeyedSubscript:a3];
  if (objc_opt_isKindOfClass()) {
    int v15 = v14;
  }
  else {
    int v15 = 0;
  }
  id v16 = v15;

  objc_opt_class();
  int v17 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4FA99E8]];
  if (objc_opt_isKindOfClass()) {
    long long v18 = v17;
  }
  else {
    long long v18 = 0;
  }
  id v19 = v18;

  if (!v19)
  {
    if (!self->_forcePolicyOptions)
    {
      id v22 = 0;
      int v17 = 0;
LABEL_44:
      id v22 = v22;
      long long v20 = v22;
      goto LABEL_45;
    }
    goto LABEL_13;
  }
  if (v13)
  {
LABEL_13:

    int v17 = (void *)MEMORY[0x1E4F1CC28];
  }
  long long v21 = [(id)_PSLocalizedServiceNames objectForKey:a3];
  id v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:sel_setPrivacyAccess_forSpecifier_ get:sel_privacyAccessForSpecifier_ detail:0 cell:6 edit:0];

  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9A98])) {
    [v22 setProperty:objc_opt_class() forKey:@"cellClass"];
  }
  if ((!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9AF8])
     || objc_opt_class() && [MEMORY[0x1E4F97A38] isSecureElementTCCServiceEligible])
    && (!CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9A40])
     || objc_opt_class() && [MEMORY[0x1E4F97A38] isContactlessTCCServiceEligible]))
  {
    int v43 = v13;
    [v22 setProperty:a3 forKey:@"service"];
    long long v23 = +[PKIconImageCache settingsIconCache];
    id v24 = [(id)_PSServiceIconNames objectForKey:a3];
    long long v25 = [v23 imageForKey:v24];

    if (v25) {
      goto LABEL_24;
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F42A80];
    id v27 = [(id)_PSServiceIconNames objectForKey:a3];
    uint64_t v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v25 = [v26 imageNamed:v27 inBundle:v28 compatibleWithTraitCollection:0];

    if (v25)
    {
LABEL_24:
      [v22 setProperty:v25 forKey:@"iconImage"];
      int v29 = 0;
    }
    else
    {
      int v29 = 1;
    }
    uint64_t v30 = [(id)_PSServiceIconTypeIDs objectForKeyedSubscript:a3];
    uint64_t v31 = (void *)v30;
    if (v29 && v30)
    {
      [v22 setObject:v30 forKeyedSubscript:@"iconUTTypeIdentifier"];
      [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    }
    uint64_t v42 = v31;
    uint64_t v32 = [(id)_PSServiceIconApplicationBundleIdentifiers objectForKeyedSubscript:a3];
    if (v32) {
      int v33 = v29;
    }
    else {
      int v33 = 0;
    }
    if (v33 == 1)
    {
      [v22 setObject:v32 forKeyedSubscript:@"appIDForLazyIcon"];
      [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
    }
    BOOL v34 = +[PSSystemPolicyForApp isServiceRestricted:a3];
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9B20]))
    {
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2050000000;
      uint64_t v35 = (void *)getADTrackingTransparencyClass_softClass;
      uint64_t v48 = getADTrackingTransparencyClass_softClass;
      if (!getADTrackingTransparencyClass_softClass)
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __getADTrackingTransparencyClass_block_invoke;
        v44[3] = &unk_1E5C5D4D8;
        v44[4] = &v45;
        __getADTrackingTransparencyClass_block_invoke((uint64_t)v44);
        uint64_t v35 = (void *)v46[3];
      }
      id v36 = v35;
      _Block_object_dispose(&v45, 8);
      uint64_t v37 = objc_opt_new();
      if (([v37 crossAppTrackingAllowedSwitchEnabled] & 1) == 0)
      {

        BOOL v34 = 1;
        int v17 = (void *)MEMORY[0x1E4F1CC28];
      }
    }
    if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E4FA9B38]))
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v17, "BOOLValue") ^ 1);

      int v17 = (void *)v38;
    }
    uint64_t v39 = [MEMORY[0x1E4F28ED0] numberWithBool:(v34 | v43) ^ 1u];
    [v22 setProperty:v39 forKey:@"enabled"];
    uint64_t v40 = [v22 propertyForKey:@"cellObject"];
    objc_msgSend(v40, "setCellEnabled:", objc_msgSend(v39, "BOOLValue"));

    [v22 setProperty:v17 forKey:@"value"];
    goto LABEL_44;
  }
  long long v20 = 0;
LABEL_45:

LABEL_46:
  return v20;
}

- (void)setPrivacyAccess:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F223C8]);
  id v9 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v10 = (void *)[v8 initWithBundleIdentifier:v9 allowPlaceholder:1 error:0];

  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke;
  v74[3] = &unk_1E5C5DA98;
  objc_copyWeak(&v77, location);
  id v11 = v10;
  id v75 = v11;
  id v12 = v6;
  id v76 = v12;
  int v13 = (void (**)(void, void, void, void))MEMORY[0x1AD0BE2A0](v74);
  int v14 = [v7 propertyForKey:@"value"];
  char v15 = [v12 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    CFStringRef v16 = (const __CFString *)[v7 propertyForKey:@"service"];
    if (CFEqual(v16, (CFStringRef)*MEMORY[0x1E4FA9B38]))
    {
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v12, "BOOLValue") ^ 1);

      id v12 = (id)v17;
    }
    if ([v12 BOOLValue]
      && CFEqual(v16, (CFStringRef)*MEMORY[0x1E4FA9B20]))
    {
      v56 = (void *)MEMORY[0x1E4F42728];
      BOOL v54 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v18 = [v54 localizedStringForKey:@"CROSS_APP_TRACKING" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      id v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v20 = [v19 localizedStringForKey:@"CROSS_APP_TRACKING_PROMPT" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v57 = [v56 alertControllerWithTitle:v18 message:v20 preferredStyle:1];

      long long v21 = (void *)MEMORY[0x1E4F42720];
      id v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v23 = [v22 localizedStringForKey:@"ALLOW" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_476;
      v68[3] = &unk_1E5C5DAC0;
      v72 = v13;
      id v69 = v12;
      CFStringRef v73 = v16;
      id v70 = v7;
      v71 = self;
      uint64_t v24 = [v21 actionWithTitle:v23 style:0 handler:v68];

      [v57 addAction:v24];
      v55 = (void *)v24;
      long long v25 = (void *)MEMORY[0x1E4F42720];
      uint64_t v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v27 = [v26 localizedStringForKey:@"CANCEL" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2_481;
      v67[3] = &unk_1E5C5DAE8;
      v67[4] = self;
      uint64_t v28 = [v25 actionWithTitle:v27 style:0 handler:v67];

      [v57 addAction:v28];
      int v29 = (void *)MEMORY[0x1E4F42720];
      uint64_t v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v31 = [v30 localizedStringForKey:@"LEARN_MORE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_3;
      v66[3] = &unk_1E5C5DAE8;
      v66[4] = self;
      uint64_t v32 = [v29 actionWithTitle:v31 style:0 handler:v66];

      [v57 addAction:v32];
      int v33 = [(PSSystemPolicyForApp *)self delegate];
      [v33 showController:v57 animate:1];

      BOOL v34 = v72;
    }
    else
    {
      if (([v12 BOOLValue] & 1) != 0 || CFStringCompare(v16, (CFStringRef)*MEMORY[0x1E4FA9AF8], 0))
      {
        ((void (**)(void, id, const __CFString *, id))v13)[2](v13, v12, v16, v7);
        goto LABEL_12;
      }
      v58 = NSString;
      uint64_t v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v36 = [v35 localizedStringForKey:@"SECURE_ELEMENT_PROMPT_TITLE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      uint64_t v37 = [v11 localizedName];
      v57 = objc_msgSend(v58, "stringWithFormat:", v36, v37);

      uint64_t v38 = NSString;
      uint64_t v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v40 = [v39 localizedStringForKey:@"SECURE_ELEMENT_PROMPT_DETAIL" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      uint64_t v41 = [v11 localizedName];
      uint64_t v42 = objc_msgSend(v38, "stringWithFormat:", v40, v41);

      v53 = (void *)v42;
      int v43 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v57 message:v42 preferredStyle:1];
      v44 = (void *)MEMORY[0x1E4F42720];
      uint64_t v45 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v46 = [v45 localizedStringForKey:@"TCC_ALERT_TURN_OFF" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_4;
      v60[3] = &unk_1E5C5DAC0;
      v64 = v13;
      id v61 = v12;
      CFStringRef v65 = v16;
      id v62 = v7;
      v63 = self;
      uint64_t v47 = [v44 actionWithTitle:v46 style:2 handler:v60];
      [v43 addAction:v47];

      uint64_t v48 = (void *)MEMORY[0x1E4F42720];
      uint64_t v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v50 = [v49 localizedStringForKey:@"TCC_ALERT_CANCEL" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_5;
      v59[3] = &unk_1E5C5DAE8;
      v59[4] = self;
      v51 = [v48 actionWithTitle:v50 style:1 handler:v59];
      [v43 addAction:v51];

      v52 = [(PSSystemPolicyForApp *)self delegate];
      [v52 showController:v43 animate:1];

      BOOL v34 = v53;
    }
  }
LABEL_12:

  objc_destroyWeak(&v77);
  objc_destroyWeak(location);
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke(uint64_t a1, void *a2, const __CFString *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    CFURLRef v11 = [v10 URL];
    CFBundleRef v12 = CFBundleCreate(0, v11);

    if (v12)
    {
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      long long v23 = __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2;
      uint64_t v24 = &unk_1E5C5DA70;
      CFBundleRef v27 = v12;
      CFStringRef v28 = a3;
      id v25 = WeakRetained;
      id v26 = *(id *)(a1 + 40);
      int v13 = (void (**)(void))MEMORY[0x1AD0BE2A0](&v21);
      objc_msgSend(v7, "BOOLValue", v21, v22, v23, v24, v25);
      if (TCCAccessSetForBundle())
      {
        if (CFEqual(a3, (CFStringRef)*MEMORY[0x1E4FA9B38]))
        {
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v7, "BOOLValue") ^ 1);

          id v7 = (id)v14;
        }
        [v8 setProperty:v7 forKey:@"value"];
      }
      if (v13) {
        v13[2](v13);
      }
    }
  }
  char v15 = (void *)TCCAccessCopyBundleIdentifiersForService();
  if (![v15 count])
  {
    CFStringRef v16 = _PSLoggingFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v30 = "-[PSSystemPolicyForApp setPrivacyAccess:forSpecifier:]_block_invoke";
      _os_log_impl(&dword_1A6597000, v16, OS_LOG_TYPE_DEFAULT, "%s: all apps were disabled for kTCCServiceUserTracking. Resetting ad identifier.", buf, 0xCu);
    }

    uint64_t v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v17 clearAdvertisingIdentifier];
  }
  if ([*(id *)(a1 + 40) BOOLValue]) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 2;
  }
  [MEMORY[0x1E4F9AA08] trackingStateOfRequestForSpecificApp:v18 view:@"AppSettings"];
  id v19 = _PSLoggingFacility();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = [WeakRetained bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = v20;
    _os_log_impl(&dword_1A6597000, v19, OS_LOG_TYPE_DEFAULT, "########### Quitting application (%@) in response to privacy settings change.", buf, 0xCu);
  }
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 48));
  BOOL v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = [(id)_PSServicePolicyOptions objectForKeyedSubscript:*(void *)(a1 + 56)];
    BOOL v4 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v4, "systemPolicyForApp:didUpdateForSystemPolicyOptions:withValue:", *(void *)(a1 + 32), objc_msgSend(v5, "unsignedLongLongValue"), *(void *)(a1 + 40));
  }
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_476(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = [*(id *)(a1 + 48) delegate];
  [v2 reloadSpecifiers];
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_2_481(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 reloadSpecifiers];
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 reloadSpecifiers];

  id v4 = (id)objc_opt_new();
  char v3 = [*(id *)(a1 + 32) delegate];
  [v3 showController:v4 animate:1];
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = [*(id *)(a1 + 48) delegate];
  [v2 reloadSpecifiers];
}

void __54__PSSystemPolicyForApp_setPrivacyAccess_forSpecifier___block_invoke_5(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 reloadSpecifiers];
}

- (id)privacyAccessForSpecifier:(id)a3
{
  char v3 = [a3 propertyForKey:@"value"];
  id v4 = v3;
  if (!v3) {
    char v3 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v5 = v3;

  return v5;
}

- (id)pasteboardSpecifier
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if ((self->_policyOptions & 0x20000000000) != 0
    && [(PSSystemPolicyForApp *)self shouldShowPasteboardSpecifier])
  {
    char v3 = [(id)_PSLocalizedServiceNames objectForKey:*MEMORY[0x1E4FA9AD8]];
    id v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:sel_setPasteboardAccess_forSpecifier_ get:sel_pasteboardAccessForSpecifier_ detail:objc_opt_class() cell:2 edit:0];

    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"PASTE_BETWEEN_APPS_ASK" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    v13[0] = v6;
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"PASTE_BETWEEN_APPS_DENY" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    v13[1] = v8;
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"PASTE_BETWEEN_APPS_ALLOW" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    v13[2] = v10;
    CFURLRef v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    [v4 setValues:&unk_1EFB742E8 titles:v11];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)shouldShowPasteboardSpecifier
{
  uint64_t v3 = *MEMORY[0x1E4FA9AD8];
  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  PSGetAuthorizationStatesForService(v3, &v14, &v13, &v12);
  id v4 = v14;
  id v5 = v13;
  id v6 = v12;
  id v7 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  if ([v4 containsObject:v7])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    if ([v5 containsObject:v9])
    {
      char v8 = 1;
    }
    else
    {
      id v10 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      char v8 = [v6 containsObject:v10];
    }
  }

  return v8;
}

- (id)pasteboardAccessForSpecifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FA9AD8];
  id v19 = 0;
  id v20 = 0;
  id v18 = 0;
  PSGetAuthorizationStatesForService(v4, &v20, &v19, &v18);
  id v5 = v20;
  id v6 = v19;
  id v7 = v18;
  char v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  char v9 = [v5 containsObject:v8];

  if (v9)
  {
    id v10 = &unk_1EFB741C8;
  }
  else
  {
    CFURLRef v11 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    char v12 = [v6 containsObject:v11];

    if (v12)
    {
      id v10 = &unk_1EFB74198;
    }
    else
    {
      id v13 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      char v14 = [v7 containsObject:v13];

      if (v14)
      {
        id v10 = &unk_1EFB741B0;
      }
      else
      {
        char v15 = _PSLoggingFacility();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v16 = [(PSSystemPolicyForApp *)self bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v22 = "-[PSSystemPolicyForApp pasteboardAccessForSpecifier:]";
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          _os_log_impl(&dword_1A6597000, v15, OS_LOG_TYPE_DEFAULT, "%s: couldn't find auth state for %@", buf, 0x16u);
        }
        id v10 = &unk_1EFB741E0;
      }
    }
  }

  return v10;
}

- (void)setPasteboardAccess:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4FA9AD8];
  id v6 = a3;
  id v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  uint64_t v7 = [v6 integerValue];

  PSSetTCCLevelForService(v5, v8, v7);
}

+ (BOOL)isServiceRestricted:(id)a3
{
  id v3 = a3;
  CFPreferencesAppSynchronize(@"com.apple.springboard");
  uint64_t v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  uint64_t v5 = v4;
  if (v4) {
    char v6 = [v4 containsObject:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)trackingSpecifiersWithTCCServiceLookup:(id)a3 tccServiceOverrides:(id)a4
{
  char v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 array];
  id v10 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9B38] tccServiceLookup:v8 tccServiceOverrides:v7];
  objc_msgSend(v9, "ps_addPossibleObject:", v10);

  CFURLRef v11 = [(PSSystemPolicyForApp *)self privacySpecifierForService:*MEMORY[0x1E4FA9B20] tccServiceLookup:v8 tccServiceOverrides:v7];

  objc_msgSend(v9, "ps_addPossibleObject:", v11);
  if ([v9 count])
  {
    char v12 = [MEMORY[0x1E4F1CA48] array];
    id v13 = +[PSSpecifier groupSpecifierWithID:@"TRACKING_GROUP"];
    [v12 addObject:v13];
    [v12 addObjectsFromArray:v9];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)headerLinkWasTapped
{
  id v3 = [MEMORY[0x1E4F42738] sharedApplication];
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://www.apple.com/privacy"];
  [v3 openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (id)documentsSpecifier
{
  if ((self->_policyOptions & 0x400000) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    char v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

    id v7 = [v6 URL];
    id v8 = v7;
    if (v7 && [v7 isFileURL])
    {
      char v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v8];
      id v10 = [v9 infoDictionary];

      CFURLRef v11 = [v10 objectForKeyedSubscript:@"UISupportsDocumentBrowser"];
      int v12 = [v11 BOOLValue];

      if (v12)
      {
        id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        char v14 = [v13 localizedStringForKey:@"DOCUMENT_STORAGE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
        id v2 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:sel_documentSource_ detail:objc_opt_class() cell:2 edit:0];

        [v2 setIdentifier:@"DOCUMENT_STORAGE"];
        [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
        [v2 setObject:@"com.apple.DocumentsApp" forKeyedSubscript:@"appIDForLazyIcon"];
        char v15 = [(PSSystemPolicyForApp *)self bundleIdentifier];
        [v2 setProperty:v15 forKey:PSDocumentBundleIdentifierKey];
      }
      else
      {
        id v2 = 0;
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)documentSource:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  CFStringRef v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__0;
  id v19 = __Block_byref_object_dispose__0;
  id v20 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2050000000;
  char v6 = (void *)getDOCDocumentSourceClass_softClass;
  uint64_t v25 = getDOCDocumentSourceClass_softClass;
  if (!getDOCDocumentSourceClass_softClass)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getDOCDocumentSourceClass_block_invoke;
    v21[3] = &unk_1E5C5D4D8;
    v21[4] = &v22;
    __getDOCDocumentSourceClass_block_invoke((uint64_t)v21);
    char v6 = (void *)v23[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v22, 8);
  id v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__PSSystemPolicyForApp_documentSource___block_invoke;
  v12[3] = &unk_1E5C5D838;
  char v14 = &v15;
  char v9 = v5;
  id v13 = v9;
  [v7 defaultSourceForBundleIdentifier:v8 completionBlock:v12];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

intptr_t __39__PSSystemPolicyForApp_documentSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 displayName];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  char v6 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v6);
}

- (id)contactlessNFCSpecifiers
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if ((self->_policyOptions & 0x8000000000000) != 0)
  {
    uint64_t v4 = [PSNFCDefaultAppSpecifier alloc];
    dispatch_semaphore_t v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    char v6 = [(PSSystemPolicyForApp *)self delegate];
    id v7 = [(PSNFCDefaultAppSpecifier *)v4 initWithBundleID:v5 delegate:v6 onChange:&__block_literal_global_546];

    id v8 = [(PSNFCDefaultAppSpecifier *)v7 context];
    LODWORD(v5) = [v8 shouldShowDefaultNFCAppPicker];

    if (v5)
    {
      char v9 = +[PSSpecifier groupSpecifierWithID:@"NFC_DEFAULT_APP_GROUP"];
      v11[0] = v9;
      v11[1] = v7;
      id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)contactlessNFCSideButtonSpecifiers
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if ((self->_policyOptions & 0x10000000000000) == 0) {
    goto LABEL_5;
  }
  uint64_t v3 = [(PSSystemPolicyForApp *)self nfcContext];

  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F97A20];
    dispatch_semaphore_t v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__PSSystemPolicyForApp_contactlessNFCSideButtonSpecifiers__block_invoke;
    v23[3] = &unk_1E5C5D680;
    v23[4] = self;
    char v6 = [v4 contextWithBundleId:v5 onChange:v23];
    [(PSSystemPolicyForApp *)self setNfcContext:v6];
  }
  id v7 = [(PSSystemPolicyForApp *)self nfcContext];
  uint64_t v8 = [v7 doubleClickToggleVisibilityType];

  if (v8 != 2)
  {
    int v10 = MGGetSInt32Answer();
    CFURLRef v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v12 = v11;
    if (v10 == 2)
    {
      id v13 = [v11 localizedStringForKey:@"DOUBLE_CLICK_SIDE_BUTTON" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];

      char v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v15 = v14;
      CFStringRef v16 = @"DOUBLE_CLICK_SIDE_BUTTON_FOOTER";
    }
    else
    {
      id v13 = [v11 localizedStringForKey:@"DOUBLE_CLICK_HOME_BUTTON" value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];

      char v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v15 = v14;
      CFStringRef v16 = @"DOUBLE_CLICK_HOME_BUTTON_FOOTER";
    }
    uint64_t v17 = [v14 localizedStringForKey:v16 value:&stru_1EFB51FD0 table:@"ContactlessAndCredentialSettings_Localizable"];

    id v18 = +[PSSpecifier groupSpecifierWithID:@"DOUBLE_CLICK_FOR_NFC_GROUP"];
    [v18 setObject:v17 forKeyedSubscript:@"footerText"];
    id v19 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:sel_setDoubleClickForNFC_specifier_ get:sel_getDoubleClickForNFC_ detail:0 cell:6 edit:0];
    [v19 setIdentifier:@"DOUBLE_CLICK_FOR_NFC"];
    id v20 = [(PSSystemPolicyForApp *)self nfcContext];
    uint64_t v21 = [v20 doubleClickToggleVisibilityType];

    if (v21 == 1) {
      [v19 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"enabled"];
    }
    v24[0] = v18;
    v24[1] = v19;
    char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  }
  else
  {
LABEL_5:
    char v9 = 0;
  }
  return v9;
}

void __58__PSSystemPolicyForApp_contactlessNFCSideButtonSpecifiers__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 reloadSpecifiers];
}

- (id)getDoubleClickForNFC:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = [(PSSystemPolicyForApp *)self nfcContext];
  dispatch_semaphore_t v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isDoubleClickEnabled"));

  return v5;
}

- (void)setDoubleClickForNFC:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(PSSystemPolicyForApp *)self nfcContext];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setDoubleClickEnabled:v6];
}

- (id)exposureSpecifiersWithTCCServiceLookup:(id)a3
{
  id v4 = a3;
  if ((self->_policyOptions & 0x100000000) == 0)
  {
    id v5 = 0;
    goto LABEL_14;
  }
  if (![(PSSystemPolicyForApp *)self enServiceMatched])
  {
    [(PSSystemPolicyForApp *)self setEnServiceMatched:1];
    uint64_t v6 = [(PSSystemPolicyForApp *)self matchingBundleIdentifier];
    if (v6)
    {
LABEL_7:

      goto LABEL_8;
    }
    id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA9A60]];

    if (v7)
    {
      uint64_t v6 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      [(PSSystemPolicyForApp *)self setMatchingBundleIdentifier:v6];
      goto LABEL_7;
    }
  }
LABEL_8:
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v9 = [(PSSystemPolicyForApp *)self matchingBundleIdentifier];

  if (v9)
  {
    int v10 = PSBundlePathForPreferenceBundle(@"ExposureNotificationSettingsUI");
    CFURLRef v11 = [MEMORY[0x1E4F28B50] bundleWithPath:v10];
    Class v12 = NSClassFromString(&cfstr_Enuiregiondeta.isa);
    if (v12 || ([v11 load], (Class v12 = NSClassFromString(&cfstr_Enuiregiondeta.isa)) != 0))
    {
      id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v14 = [v13 localizedStringForKey:@"EXPOSURE_NOTIFICATION" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      uint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:v12 cell:1 edit:0];

      CFStringRef v16 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      [v15 setUserInfo:v16];

      [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
      [v15 setObject:@"com.apple.graphic-icon.exposure-notifications" forKeyedSubscript:@"iconUTTypeIdentifier"];
      [v8 addObject:v15];
    }
  }
  id v5 = (void *)[v8 copy];

LABEL_14:
  return v5;
}

- (id)preferredLanguageSpecifier
{
  if ((self->_policyOptions & 0x2000000) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F223C8]);
    id v5 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    uint64_t v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

    id v7 = [v6 URL];
    id v8 = v7;
    if (v7 && [v7 isFileURL])
    {
      char v9 = [MEMORY[0x1E4F28B50] bundleWithURL:v8];
      int v10 = [v9 normalizedLocalizations];
      unint64_t v11 = [v10 count];
      Class v12 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      unint64_t v13 = [v12 count];

      char v14 = (void *)MEMORY[0x1E4F28B50];
      uint64_t v15 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      BOOL v34 = v10;
      CFStringRef v16 = [v14 preferredLocalizationsFromArray:v10 forPreferences:v15];
      uint64_t v17 = [v16 firstObject];

      id v18 = (void *)MEMORY[0x1E4F70FE8];
      id v19 = [(PSSystemPolicyForApp *)self bundleIdentifier];
      id v20 = [v18 preferredLanguageForBundleID:v19];

      int v21 = [v20 isEqualToString:v17];
      if (v13 > 1)
      {
        int v24 = 0;
      }
      else
      {
        uint64_t v22 = [v9 objectForInfoDictionaryKey:@"UIPrefersShowingLanguageSettings"];
        int v23 = [v22 BOOLValue];

        int v24 = v23 ^ 1;
      }
      if (v11 < 2) {
        int v24 = 1;
      }
      if (v21 & v24)
      {
        id v2 = 0;
      }
      else
      {
        uint64_t v25 = (void *)MEMORY[0x1E4F28B50];
        id v26 = PSBundlePathForPreferenceBundle(@"InternationalSettings");
        CFBundleRef v27 = SFRuntimeAbsoluteFilePathForPath();
        [v25 bundleWithPath:v27];
        CFStringRef v28 = v33 = v17;

        int v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v30 = [v29 localizedStringForKey:@"LANGUAGE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
        id v2 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, self, 0, sel_preferredLanguage_, [v28 classNamed:@"ISApplicationLanguageController"], 2, 0);

        [v2 setIdentifier:@"PREFERRED_LANGUAGE"];
        [v2 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"useLazyIcons"];
        [v2 setObject:@"com.apple.graphic-icon.language" forKeyedSubscript:@"iconUTTypeIdentifier"];
        uint64_t v31 = [(PSSystemPolicyForApp *)self bundleIdentifier];
        [v2 setProperty:v31 forKey:@"bundleID"];

        uint64_t v17 = v33;
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)preferredLanguage:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F70FE8];
  id v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v5 = [v3 preferredLanguageForBundleID:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  id v8 = [v6 localeWithLocaleIdentifier:v7];
  char v9 = [v8 localizedStringForLanguage:v5 context:3];

  return v9;
}

- (id)defaultAppSpecifierWithAppRecordsMatchingBlock:(id)a3 getter:(SEL)a4 setter:(SEL)a5 title:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    BOOL v34 = objc_opt_new();
    int v33 = objc_opt_new();
    Class v12 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    unint64_t v13 = (void *)MEMORY[0x1E4F28F60];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __91__PSSystemPolicyForApp_defaultAppSpecifierWithAppRecordsMatchingBlock_getter_setter_title___block_invoke;
    v39[3] = &unk_1E5C5DB10;
    id v40 = v10;
    char v14 = [v13 predicateWithBlock:v39];
    [v12 setPredicate:v14];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v12;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      SEL v29 = a5;
      SEL v30 = a4;
      id v31 = v11;
      id v32 = v10;
      char v18 = 0;
      uint64_t v19 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v19) {
            objc_enumerationMutation(v15);
          }
          int v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          uint64_t v22 = [v21 bundleIdentifier];
          int v23 = [(PSSystemPolicyForApp *)self bundleIdentifier];
          char v24 = [v22 isEqualToString:v23];

          v18 |= v24;
          uint64_t v25 = [v21 bundleIdentifier];
          [v33 addObject:v25];

          id v26 = [v21 localizedName];
          [v34 addObject:v26];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v17);

      if (v18)
      {
        id v11 = v31;
        CFBundleRef v27 = +[PSSpecifier preferenceSpecifierNamed:v31 target:self set:v29 get:v30 detail:objc_opt_class() cell:2 edit:0];
        [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PSListItemsValuesAreAppIDsKey"];
        [v27 setValues:v33 titles:v34];
      }
      else
      {
        CFBundleRef v27 = 0;
        id v11 = v31;
      }
      id v10 = v32;
    }
    else
    {

      CFBundleRef v27 = 0;
    }
  }
  else
  {
    CFBundleRef v27 = 0;
  }

  return v27;
}

uint64_t __91__PSSystemPolicyForApp_defaultAppSpecifierWithAppRecordsMatchingBlock_getter_setter_title___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)defaultBrowserSpecifier
{
  if ((self->_policyOptions & 0x20000000) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"DEFAULT_BROWSER_APP" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    id v2 = [(PSSystemPolicyForApp *)self defaultAppSpecifierWithAppRecordsMatchingBlock:&__block_literal_global_614 getter:sel_defaultBrowser_ setter:sel_setDefaultBrowser_specifier_ title:v5];

    [v2 setIdentifier:@"DEFAULT_BROWSER_APP"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __47__PSSystemPolicyForApp_defaultBrowserSpecifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEligibleWebBrowser];
}

- (id)defaultBrowser:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F22408]);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://"];
  id v13 = 0;
  id v5 = (void *)[v3 initWithURL:v4 error:&v13];
  id v6 = v13;

  id v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 bundleRecord];
    char v9 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    id v15 = v9;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Default browser app is %{public}@", buf, 0xCu);
  }
  id v10 = [v5 bundleRecord];
  id v11 = [v10 bundleIdentifier];

  return v11;
}

- (void)setDefaultBrowser:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v16];
  id v9 = v16;
  objc_initWeak(&location, self);
  id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PSSystemPolicyForApp_setDefaultBrowser_specifier___block_invoke;
  v12[3] = &unk_1E5C5DB58;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v10 setDefaultWebBrowserToApplicationRecord:v8 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__PSSystemPolicyForApp_setDefaultBrowser_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = _PSLoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) == 0)
  {
    if (v8)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Error setting default browser app to %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138543362;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Set default browser app to %{public}@", (uint8_t *)&v13, 0xCu);
  }

  id v10 = [WeakRetained delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v7 = [WeakRetained delegate];
    [v7 systemPolicyForApp:WeakRetained didUpdateForSystemPolicyOptions:0x20000000 withValue:*(void *)(a1 + 32)];
LABEL_8:
  }
}

- (id)defaultMailAppSpecifier
{
  if ((self->_policyOptions & 0x40000000) != 0)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"DEFAULT_MAIL_APP" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    id v2 = [(PSSystemPolicyForApp *)self defaultAppSpecifierWithAppRecordsMatchingBlock:&__block_literal_global_630 getter:sel_defaultMailApp_ setter:sel_setDefaultMailApp_specifier_ title:v5];

    [v2 setIdentifier:@"DEFAULT_MAIL_APP"];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

uint64_t __47__PSSystemPolicyForApp_defaultMailAppSpecifier__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEligibleMailClient];
}

- (id)defaultMailApp:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F22408]);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"mailto://"];
  id v13 = 0;
  id v5 = (void *)[v3 initWithURL:v4 error:&v13];
  id v6 = v13;

  id v7 = _PSLoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v5 bundleRecord];
    uint64_t v9 = [v8 bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    __int16 v15 = v9;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Default mail app is %{public}@", buf, 0xCu);
  }
  id v10 = [v5 bundleRecord];
  char v11 = [v10 bundleIdentifier];

  return v11;
}

- (void)setDefaultMailApp:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v16];
  id v9 = v16;
  objc_initWeak(&location, self);
  id v10 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PSSystemPolicyForApp_setDefaultMailApp_specifier___block_invoke;
  v12[3] = &unk_1E5C5DB58;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v10 setDefaultMailClientToApplicationRecord:v8 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__PSSystemPolicyForApp_setDefaultMailApp_specifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = _PSLoggingFacility();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) == 0)
  {
    if (v8)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Error setting default mail app to %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }
    goto LABEL_8;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138543362;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1A6597000, v7, OS_LOG_TYPE_DEFAULT, "Set default mail app to %{public}@", (uint8_t *)&v13, 0xCu);
  }

  id v10 = [WeakRetained delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v7 = [WeakRetained delegate];
    [v7 systemPolicyForApp:WeakRetained didUpdateForSystemPolicyOptions:0x40000000 withValue:*(void *)(a1 + 32)];
LABEL_8:
  }
}

- (id)tapToPayScreenLockSpecifiers
{
  v34[2] = *MEMORY[0x1E4F143B8];
  if ((self->_policyOptions & 0x8000000000) != 0
    && (id v3 = getPRSettingsProviderClass(),
        [(PSSystemPolicyForApp *)self bundleIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v3) = [v3 isProximityReaderSupported:v4],
        v4,
        v3))
  {
    id v5 = +[PSSpecifier groupSpecifierWithID:@"TAP_TO_PAY_SCREEN_LOCK_GROUP"];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"TAP_TO_PAY_ON_IPHONE" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    BOOL v8 = +[PSSpecifier groupSpecifierWithName:v7];

    id PRSettingsProviderClass = getPRSettingsProviderClass();
    id v10 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    int v11 = [PRSettingsProviderClass shouldDisablePINPrivacyLockForBundleID:v10];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F74230] sharedConnection];
      int v13 = [v12 managingOrganizationInformation];

      uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F74270]];
      if ([v14 length] && (objc_msgSend(v14, "isEqualToString:", @"unknown") & 1) == 0)
      {
        int v24 = PSIsPearlAvailable();
        uint64_t v25 = NSString;
        id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v17 = v26;
        if (v24) {
          CFBundleRef v27 = @"TAP_TO_PAY_SCREEN_LOCK_FACEID_DISABLED_KNOWN_ORGANIZATION_FOOTER";
        }
        else {
          CFBundleRef v27 = @"TAP_TO_PAY_SCREEN_LOCK_TOUCHID_DISABLED_KNOWN_ORGANIZATION_FOOTER";
        }
        int v23 = [v26 localizedStringForKey:v27 value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
        CFStringRef v28 = objc_msgSend(v25, "localizedStringWithFormat:", v23, v14);
        [v8 setObject:v28 forKeyedSubscript:@"footerText"];
      }
      else
      {
        int v15 = PSIsPearlAvailable();
        id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v17 = v16;
        if (v15) {
          char v18 = @"TAP_TO_PAY_SCREEN_LOCK_FACEID_DISABLED_UNKNOWN_ORGANIZATION_FOOTER";
        }
        else {
          char v18 = @"TAP_TO_PAY_SCREEN_LOCK_TOUCHID_DISABLED_UNKNOWN_ORGANIZATION_FOOTER";
        }
        int v23 = [v16 localizedStringForKey:v18 value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
        [v8 setObject:v23 forKeyedSubscript:@"footerText"];
      }
    }
    else
    {
      int v20 = PSIsPearlAvailable();
      int v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v13 = v21;
      if (v20) {
        uint64_t v22 = @"TAP_TO_PAY_SCREEN_LOCK_FACEID_FOOTER";
      }
      else {
        uint64_t v22 = @"TAP_TO_PAY_SCREEN_LOCK_TOUCHID_FOOTER";
      }
      uint64_t v14 = [v21 localizedStringForKey:v22 value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
      [v8 setObject:v14 forKeyedSubscript:@"footerText"];
    }

    SEL v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    SEL v30 = [v29 localizedStringForKey:@"TAP_TO_PAY_SCREEN_LOCK" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    id v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:sel_setTapToPayScreenLockEnabled_specifier_ get:sel_isTapToPayScreenLockEnabled_ detail:0 cell:6 edit:0];

    [v31 setIdentifier:@"TAP_TO_PAY_SCREEN_LOCK"];
    id v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v11 ^ 1u];
    [v31 setObject:v32 forKeyedSubscript:@"enabled"];

    v34[0] = v8;
    v34[1] = v31;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v19;
}

- (id)isTapToPayScreenLockEnabled:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id PRSettingsProviderClass = getPRSettingsProviderClass();
  id v6 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(PRSettingsProviderClass, "getPINPrivacyLockForBundleID:", v6));

  return v7;
}

- (void)setTapToPayScreenLockEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id PRSettingsProviderClass = getPRSettingsProviderClass();
  uint64_t v7 = [v5 BOOLValue];

  id v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  [PRSettingsProviderClass setPINPrivacyLock:v7 forBundleID:v8];
}

- (id)tapToPayAlwaysPlaySoundSpecifiers
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ((self->_policyOptions & 0x40000000000) != 0
    && (id PRSettingsProviderClass = getPRSettingsProviderClass(),
        [(PSSystemPolicyForApp *)self bundleIdentifier],
        id v4 = objc_claimAutoreleasedReturnValue(),
        LODWORD(PRSettingsProviderClass) = [PRSettingsProviderClass isProximityReaderSupported:v4],
        v4,
        PRSettingsProviderClass))
  {
    id v5 = +[PSSpecifier groupSpecifierWithID:@"TAP_TO_PAY_ALWAYS_PLAY_SOUND_GROUP"];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"TAP_TO_PAY_ALWAYS_PLAY_SOUND_FOOTER" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    [v5 setObject:v7 forKeyedSubscript:@"footerText"];

    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"TAP_TO_PAY_ALWAYS_PLAY_SOUND" value:&stru_1EFB51FD0 table:@"PSSystemPolicy"];
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:sel_setTapToPayAlwaysPlaySoundEnabled_specifier_ get:sel_isTapToPayAlwaysPlaySoundEnabled_ detail:0 cell:6 edit:0];

    [v10 setIdentifier:@"TAP_TO_PAY_ALWAYS_PLAY_SOUND"];
    v13[0] = v5;
    v13[1] = v10;
    int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    int v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

- (id)isTapToPayAlwaysPlaySoundEnabled:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id PRSettingsProviderClass = getPRSettingsProviderClass();
  id v6 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  uint64_t v7 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(PRSettingsProviderClass, "getAlwaysPlaySoundForBundleID:", v6));

  return v7;
}

- (void)setTapToPayAlwaysPlaySoundEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id PRSettingsProviderClass = getPRSettingsProviderClass();
  uint64_t v7 = [v5 BOOLValue];

  id v8 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  [PRSettingsProviderClass setAlwaysPlaySound:v7 forBundleID:v8];
}

- (id)driverKitSpecifiers
{
  id v3 = [PSDriverPolicyForApp alloc];
  id v4 = [(PSSystemPolicyForApp *)self bundleIdentifier];
  id v5 = [(PSDriverPolicyForApp *)v3 initWithBundleIdentifier:v4];
  driverPolicy = self->_driverPolicy;
  self->_driverPolicy = v5;

  [(PSDriverPolicyForApp *)self->_driverPolicy setDelegate:self];
  uint64_t v7 = self->_driverPolicy;
  return [(PSDriverPolicyForApp *)v7 specifiers];
}

- (void)observer:(id)a3 updateSectionInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v8 = [v7 sectionID];
    uint64_t v9 = [(PSSystemPolicyForApp *)self bundleIdentifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      int v11 = [(PSSystemPolicyForApp *)self delegate];
      [v11 reloadSpecifiers];
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PSSystemPolicyForApp_observer_updateSectionInfo___block_invoke;
    block[3] = &unk_1E5C5D548;
    block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__PSSystemPolicyForApp_observer_updateSectionInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observer:*(void *)(a1 + 40) updateSectionInfo:*(void *)(a1 + 48)];
}

- (void)reloadSpecifiers
{
  id v2 = [(PSSystemPolicyForApp *)self delegate];
  [v2 reloadSpecifiers];
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PSSystemPolicyForApp *)self delegate];
  [v7 showController:v6 animate:v4];
}

- (PSSystemPolicyForAppDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSystemPolicyForAppDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BBObserver)_bbObserver
{
  return self->__bbObserver;
}

- (void)set_bbObserver:(id)a3
{
}

- (BOOL)enServiceMatched
{
  return self->_enServiceMatched;
}

- (void)setEnServiceMatched:(BOOL)a3
{
  self->_enServiceMatched = a3;
}

- (NSString)matchingBundleIdentifier
{
  return self->_matchingBundleIdentifier;
}

- (void)setMatchingBundleIdentifier:(id)a3
{
}

- (NSString)containerPathForCurrentApp
{
  return self->_containerPathForCurrentApp;
}

- (void)setContainerPathForCurrentApp:(id)a3
{
}

- (NSUserDefaults)appUserDefaults
{
  return self->_appUserDefaults;
}

- (void)setAppUserDefaults:(id)a3
{
}

- (PSSpecifier)cinematicFramingSpecifier
{
  return self->_cinematicFramingSpecifier;
}

- (void)setCinematicFramingSpecifier:(id)a3
{
}

- (PSDriverPolicyForApp)driverPolicy
{
  return self->_driverPolicy;
}

- (void)setDriverPolicy:(id)a3
{
}

- (SESNFCAppSettingsContext)nfcContext
{
  return self->_nfcContext;
}

- (void)setNfcContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcContext, 0);
  objc_storeStrong((id *)&self->_driverPolicy, 0);
  objc_storeStrong((id *)&self->_cinematicFramingSpecifier, 0);
  objc_storeStrong((id *)&self->_appUserDefaults, 0);
  objc_storeStrong((id *)&self->_containerPathForCurrentApp, 0);
  objc_storeStrong((id *)&self->_matchingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->__bbObserver, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pathControllerConfiguration, 0);
  objc_storeStrong((id *)&self->_accountEnumerator, 0);
  objc_storeStrong((id *)&self->_walletPrivacyController, 0);
  objc_storeStrong((id *)&self->_contactsPrivacyController, 0);
  objc_storeStrong((id *)&self->_calendarPrivacyController, 0);
  objc_storeStrong((id *)&self->_photosPrivacyController, 0);
  objc_storeStrong((id *)&self->_accessoriesPrivacyController, 0);
}

void __62__PSSystemPolicyForApp_loadNetworkConfigurationsForceRefresh___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  id v3 = "-[PSSystemPolicyForApp loadNetworkConfigurationsForceRefresh:]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1A6597000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to load with error %{public}@", (uint8_t *)&v2, 0x16u);
}

void __48__PSSystemPolicyForApp_saveNetworkConfiguration__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 136446722;
  uint64_t v5 = "-[PSSystemPolicyForApp saveNetworkConfiguration]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_1A6597000, log, OS_LOG_TYPE_ERROR, "%{public}s: Save error %{public}@ for %{public}@", (uint8_t *)&v4, 0x20u);
}

@end