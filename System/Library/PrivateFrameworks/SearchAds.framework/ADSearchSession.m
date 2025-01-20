@interface ADSearchSession
- (ADCapService)capService;
- (ADParameterFactory)parameterFactory;
- (ADSearchSession)initWithAppID:(id)a3 appVersion:(id)a4 appsRank:(int)a5;
- (ADSearchSession)initWithAppID:(id)a3 appVersion:(id)a4 appsRank:(int)a5 storeFront:(id)a6;
- (APOdmlSettings)odmlSettings;
- (BOOL)notificationReceivedAndWaiting;
- (BOOL)startUpdatingIDs;
- (NSObject)notificationObserver;
- (NSString)appID;
- (NSString)appVersion;
- (NSString)campaignNamespace;
- (NSString)clientRequestID;
- (OS_dispatch_queue)odmlQueue;
- (id)adParameters;
- (id)campaignNamespaceParameter;
- (id)populateStoreFrontLanguageLocale:(id)a3;
- (id)sponsoredSearchRequestForLanguageLocale:(id)a3;
- (id)userTargetingProperties;
- (int)appsRank;
- (void)_setODMLProperties:(id)a3 withSettings:(id)a4;
- (void)dealloc;
- (void)requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality:(id)a3 withCompletionHandler:(id)a4;
- (void)requestSponsoredSearchURL:(id)a3;
- (void)requestUserTargetingIdentifier:(id)a3;
- (void)searchObjectForCriteria:(id)a3 withCompletionHandler:(id)a4;
- (void)setAppID:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setAppsRank:(int)a3;
- (void)setCampaignNamespace:(id)a3;
- (void)setCapService:(id)a3;
- (void)setClientRequestID:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setNotificationReceivedAndWaiting:(BOOL)a3;
- (void)setOdmlSettings:(id)a3;
- (void)setParameterFactory:(id)a3;
@end

@implementation ADSearchSession

- (void)requestUserTargetingIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ADSearchSession requestUserTargetingIdentifier:]";
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  v9 = objc_msgSend_workQueue(MEMORY[0x263F24230], v5, v6, v7, v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_236759030;
  v14[3] = &unk_264CADE28;
  id v15 = v3;
  id v10 = v3;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v14, v12, v13);
}

- (ADSearchSession)initWithAppID:(id)a3 appVersion:(id)a4 appsRank:(int)a5 storeFront:(id)a6
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v104.receiver = self;
  v104.super_class = (Class)ADSearchSession;
  uint64_t v18 = [(ADSearchSession *)&v104 init];
  if (v18)
  {
    v19 = objc_msgSend_date(MEMORY[0x263EFF910], v14, v15, v16, v17);
    v20 = objc_alloc_init(ADCapService);
    capService = v18->_capService;
    v18->_capService = v20;

    v22 = objc_alloc_init(ADParameterFactory);
    parameterFactory = v18->_parameterFactory;
    v18->_parameterFactory = v22;

    v28 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v24, v25, v26, v27);
    uint64_t v32 = objc_msgSend_stringForKey_(v28, v29, @"ToroCampaignNamespace", v30, v31);
    campaignNamespace = v18->_campaignNamespace;
    v18->_campaignNamespace = (NSString *)v32;

    objc_storeStrong((id *)&v18->_appID, a3);
    objc_storeStrong((id *)&v18->_appVersion, a4);
    v18->_appsRank = a5;
    clientRequestID = v18->_clientRequestID;
    v18->_clientRequestID = 0;

    id v39 = (id)objc_msgSend_sharedNetworkController(MEMORY[0x263F241F8], v35, v36, v37, v38);
    v44 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v40, v41, v42, v43);
    objc_msgSend_setBundleIdentifier_(v44, v45, (uint64_t)v11, v46, v47);
    objc_msgSend_setITunesStorefront_(v44, v48, (uint64_t)v13, v49, v50);
    id v55 = (id)objc_msgSend_sharedInstance(MEMORY[0x263F241D8], v51, v52, v53, v54);
    id v60 = (id)objc_msgSend_sharedInstance(MEMORY[0x263F20B60], v56, v57, v58, v59);
    if (MGGetBoolAnswer())
    {
      v65 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v61, v62, v63, v64);
      objc_msgSend_checkDefaultsAndSetInternalSettingsOverrides(v65, v66, v67, v68, v69);
    }
    v18->_notificationReceivedAndWaiting = 0;
    dispatch_queue_t v70 = dispatch_queue_create("com.apple.ap.SearchAds.notificationQueue", 0);
    idNotificationQueue = v18->_idNotificationQueue;
    v18->_idNotificationQueue = (OS_dispatch_queue *)v70;

    objc_initWeak(&location, v18);
    v76 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], v72, v73, v74, v75);
    v81 = objc_msgSend_workQueue(MEMORY[0x263F24230], v77, v78, v79, v80);
    v101[0] = MEMORY[0x263EF8330];
    v101[1] = 3221225472;
    v101[2] = sub_236763268;
    v101[3] = &unk_264CADDD8;
    objc_copyWeak(&v102, &location);
    uint64_t v83 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v76, v82, @"kADIDManager_ChangedNotification", *MEMORY[0x263F24130], (uint64_t)v81, v101);
    notificationObserver = v18->_notificationObserver;
    v18->_notificationObserver = v83;

    dispatch_queue_t v85 = dispatch_queue_create("com.apple.ap.SearchAds.odmlQueue", 0);
    odmlQueue = v18->_odmlQueue;
    v18->_odmlQueue = (OS_dispatch_queue *)v85;

    v87 = v18->_odmlQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_236758D64;
    block[3] = &unk_264CADD88;
    v100 = v18;
    dispatch_async(v87, block);
    v88 = APLogForCategory();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v93 = objc_msgSend_date(MEMORY[0x263EFF910], v89, v90, v91, v92);
      objc_msgSend_timeIntervalSinceDate_(v93, v94, (uint64_t)v19, v95, v96);
      *(_DWORD *)buf = 138412546;
      id v106 = v11;
      __int16 v107 = 2048;
      uint64_t v108 = v97;
      _os_log_impl(&dword_236756000, v88, OS_LOG_TYPE_DEFAULT, "TORO: ADSearchSession initWithAppID:%@ initTime: %0.3lf", buf, 0x16u);
    }
    objc_destroyWeak(&v102);
    objc_destroyWeak(&location);
  }
  return v18;
}

- (void)setOdmlSettings:(id)a3
{
}

- (ADSearchSession)initWithAppID:(id)a3 appVersion:(id)a4 appsRank:(int)a5
{
  return (ADSearchSession *)MEMORY[0x270F9A6D0](self, sel_initWithAppID_appVersion_appsRank_storeFront_, a3, a4, *(void *)&a5);
}

- (void)dealloc
{
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x263F087C8], a2, v2, v3, v4);
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self->_notificationObserver, @"kADIDManager_ChangedNotification", *MEMORY[0x263F24130]);

  v8.receiver = self;
  v8.super_class = (Class)ADSearchSession;
  [(ADSearchSession *)&v8 dealloc];
}

- (BOOL)startUpdatingIDs
{
  uint64_t v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_236756000, v2, OS_LOG_TYPE_DEFAULT, "Updating to the current user.", buf, 2u);
  }

  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], v3, v4, v5, v6);
  int IDs = objc_msgSend_loadIDs(v7, v8, v9, v10, v11);

  if (IDs)
  {
    id v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_236756000, v13, OS_LOG_TYPE_DEFAULT, "We have now updated the active IDs.", v15, 2u);
    }
  }
  return IDs;
}

- (void)setCampaignNamespace:(id)a3
{
}

- (id)campaignNamespaceParameter
{
  uint64_t v6 = objc_msgSend_parameterFactory(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_campaignNamespace(self, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_campaignNamespaceParameterWithCampaignNamespace_(v6, v12, (uint64_t)v11, v13, v14);

  return v15;
}

- (id)adParameters
{
  uint64_t v6 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_capService(self, v7, v8, v9, v10);
  objc_msgSend_cleanDownloadData(v11, v12, v13, v14, v15);

  v20 = objc_msgSend_parameterFactory(self, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_frequencyCapDataParameter(v20, v21, v22, v23, v24);

  if (v25) {
    objc_msgSend_addObject_(v6, v26, (uint64_t)v25, v28, v29);
  }
  uint64_t v30 = objc_msgSend_parameterFactory(self, v26, v27, v28, v29);
  v35 = objc_msgSend_toroClickCountDataParameter(v30, v31, v32, v33, v34);

  if (v35) {
    objc_msgSend_addObject_(v6, v36, (uint64_t)v35, v38, v39);
  }
  v40 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v36, v37, v38, v39);
  int isTest = objc_msgSend_isTest(v40, v41, v42, v43, v44);

  if (isTest)
  {
    uint64_t v50 = objc_msgSend_parameterFactory(self, v46, v47, v48, v49);
    id v55 = objc_msgSend_campaignNamespace(self, v51, v52, v53, v54);
    uint64_t v59 = objc_msgSend_campaignNamespaceParameterWithCampaignNamespace_(v50, v56, (uint64_t)v55, v57, v58);

    if (v59) {
      objc_msgSend_addObject_(v6, v60, (uint64_t)v59, v62, v63);
    }
    uint64_t v64 = objc_msgSend_parameterFactory(self, v60, v61, v62, v63);
    uint64_t v69 = objc_msgSend_privacyDataKeyParameter(v64, v65, v66, v67, v68);

    if (v69) {
      objc_msgSend_addObject_(v6, v70, (uint64_t)v69, v72, v73);
    }
    uint64_t v74 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v70, v71, v72, v73);
    int isCustomTemplate = objc_msgSend_isCustomTemplate(v74, v75, v76, v77, v78);

    if (isCustomTemplate)
    {
      v84 = objc_msgSend_parameterFactory(self, v80, v81, v82, v83);
      v89 = objc_msgSend_requestedAdDataParameter(v84, v85, v86, v87, v88);

      if (v89) {
        objc_msgSend_addObject_(v6, v90, (uint64_t)v89, v92, v93);
      }
      v94 = objc_msgSend_parameterFactory(self, v90, v91, v92, v93);
      v99 = objc_msgSend_requestedTemplateTypeParameter(v94, v95, v96, v97, v98);

      if (v99) {
        objc_msgSend_addObject_(v6, v100, (uint64_t)v99, v101, v102);
      }
    }
  }

  return v6;
}

- (id)userTargetingProperties
{
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v12, v13, v14, v15);
  v21 = objc_msgSend_date(MEMORY[0x263EFF910], v17, v18, v19, v20);
  double v26 = (double)(int)objc_msgSend_AD_toServerTime(v21, v22, v23, v24, v25);

  id v27 = objc_alloc_init(MEMORY[0x263F24248]);
  objc_msgSend_setClientClockTime_(v27, v28, v29, v30, v31, v26);
  uint64_t v36 = objc_msgSend_appID(self, v32, v33, v34, v35);
  objc_msgSend_setAppID_(v27, v37, (uint64_t)v36, v38, v39);

  uint64_t v44 = objc_msgSend_deviceModel(v11, v40, v41, v42, v43);
  objc_msgSend_setDeviceModel_(v27, v45, (uint64_t)v44, v46, v47);

  objc_msgSend_timezone(v11, v48, v49, v50, v51);
  objc_msgSend_setTimezone_(v27, v52, v53, v54, v55);
  uint64_t v60 = objc_msgSend_runState(v11, v56, v57, v58, v59);
  objc_msgSend_setRunState_(v27, v61, v60, v62, v63);
  uint64_t v68 = objc_msgSend_appVersion(self, v64, v65, v66, v67);
  objc_msgSend_setAppVersion_(v27, v69, (uint64_t)v68, v70, v71);

  uint64_t v76 = objc_msgSend_osVersionAndBuild(v11, v72, v73, v74, v75);
  objc_msgSend_setOsVersionAndBuild_(v27, v77, (uint64_t)v76, v78, v79);

  v84 = objc_msgSend_iTunesStorefront(v11, v80, v81, v82, v83);
  objc_msgSend_setITunesStore_(v27, v85, (uint64_t)v84, v86, v87);

  uint64_t v92 = objc_msgSend_localeIdentifier(v11, v88, v89, v90, v91);
  objc_msgSend_setLocaleIdentifier_(v27, v93, (uint64_t)v92, v94, v95);

  v100 = objc_msgSend_userKeyboards(v16, v96, v97, v98, v99);
  v105 = objc_msgSend_mutableCopy(v100, v101, v102, v103, v104);
  objc_msgSend_setUserKeyboards_(v27, v106, (uint64_t)v105, v107, v108);

  uint64_t v113 = objc_msgSend_appsRank(self, v109, v110, v111, v112);
  objc_msgSend_setAppsRank_(v27, v114, v113, v115, v116);
  uint64_t v121 = objc_msgSend_connectionType(v11, v117, v118, v119, v120);
  objc_msgSend_setConnectionType_(v27, v122, v121, v123, v124);
  uint64_t v129 = objc_msgSend_educationModeEnabled(v11, v125, v126, v127, v128);
  objc_msgSend_addDeviceMode_(v27, v130, v129, v131, v132);
  v137 = objc_msgSend_activeDSIDRecord(v6, v133, v134, v135, v136);
  if (objc_msgSend_isPlaceholderAccount(v137, v138, v139, v140, v141))
  {
    objc_msgSend_addAccountType_(v27, v142, 0, v144, v145);
  }
  else if (objc_msgSend_accountAgeUnknown(v137, v142, v143, v144, v145))
  {
    objc_msgSend_addAccountType_(v27, v150, 6, v152, v153);
  }
  else
  {
    int isManagedAppleID = objc_msgSend_isManagedAppleID(v11, v150, v151, v152, v153);
    if (isManagedAppleID) {
      objc_msgSend_addAccountType_(v27, v154, 2, v156, v157);
    }
    if (objc_msgSend_accountIsU13(v137, v154, v155, v156, v157))
    {
      objc_msgSend_addAccountType_(v27, v159, 3, v161, v162);
      int v163 = 0;
    }
    else
    {
      int v163 = isManagedAppleID ^ 1;
    }
    objc_msgSend_accountIsT13(v137, v159, v160, v161, v162);
    if (objc_msgSend_accountIsU18(v137, v164, v165, v166, v167))
    {
      objc_msgSend_addAccountType_(v27, v146, 5, v148, v149);
    }
    else if (v163)
    {
      objc_msgSend_addAccountType_(v27, v146, 1, v148, v149);
      if (objc_msgSend_sensitiveContentEligible(v137, v168, v169, v170, v171)) {
        objc_msgSend_addAccountType_(v27, v146, 7, v148, v149);
      }
    }
  }
  v172 = objc_msgSend_iCloudDSID(v11, v146, v147, v148, v149);

  if (v172)
  {
    v177 = objc_msgSend_iCloudDSID(v11, v173, v174, v175, v176);
    v182 = objc_msgSend_iTunesAccountDSID(v11, v178, v179, v180, v181);
    int isEqualToString = objc_msgSend_isEqualToString_(v177, v183, (uint64_t)v182, v184, v185);

    if (isEqualToString) {
      objc_msgSend_addAccountState_(v27, v187, 1, v188, v189);
    }
    else {
      objc_msgSend_addAccountState_(v27, v187, 2, v188, v189);
    }
  }
  else
  {
    objc_msgSend_addAccountState_(v27, v173, 0, v175, v176);
  }
  v194 = objc_msgSend_adParameters(self, v190, v191, v192, v193);
  objc_msgSend_setTargetings_(v27, v195, (uint64_t)v194, v196, v197);

  int isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(v11, v198, v199, v200, v201);
  objc_msgSend_setLimitAdTracking_(v27, v203, isPersonalizedAdsEnabled ^ 1u, v204, v205);
  v210 = objc_msgSend_algoID(v16, v206, v207, v208, v209);
  objc_msgSend_setAlgoId_(v27, v211, (uint64_t)v210, v212, v213);

  uint64_t v218 = objc_msgSend_PersonalizedAdsMonthResetCount(v6, v214, v215, v216, v217);
  objc_msgSend_setAdvertisingIdentifierMonthResetCount_(v27, v219, v218, v220, v221);
  v226 = objc_msgSend_UUID(MEMORY[0x263F08C38], v222, v223, v224, v225);
  v231 = objc_msgSend_UUIDString(v226, v227, v228, v229, v230);
  objc_msgSend_setDeviceRequestID_(v27, v232, (uint64_t)v231, v233, v234);

  objc_msgSend_deviceRequestID(v27, v235, v236, v237, v238);
  v239 = (NSString *)objc_claimAutoreleasedReturnValue();
  clientRequestID = self->_clientRequestID;
  self->_clientRequestID = v239;

  v244 = objc_msgSend_idForClientType_(v6, v241, 4, v242, v243);
  objc_msgSend_setToroIDString_(v27, v245, (uint64_t)v244, v246, v247);

  v251 = objc_msgSend_idForClientType_(v6, v248, 0, v249, v250);
  objc_msgSend_setIAdIDString_(v27, v252, (uint64_t)v251, v253, v254);

  v258 = objc_msgSend_idForClientType_(v6, v255, 5, v256, v257);
  objc_msgSend_setDPIDString_(v27, v259, (uint64_t)v258, v260, v261);

  if ((objc_msgSend_isManagedAppleID(v11, v262, v263, v264, v265) & 1) == 0
    && (objc_msgSend_educationModeEnabled(v11, v266, v267, v268, v269) & 1) == 0)
  {
    v274 = objc_msgSend_sharedInstance(MEMORY[0x263F20B60], v270, v271, v272, v273);
    v279 = objc_msgSend_locationInfo(v274, v275, v276, v277, v278);
    v284 = v279;
    if (v279)
    {
      v285 = objc_msgSend_isoCountryCode(v279, v280, v281, v282, v283);
      objc_msgSend_setIsoCountryCode_(v27, v286, (uint64_t)v285, v287, v288);

      v293 = objc_msgSend_postalCode(v284, v289, v290, v291, v292);
      objc_msgSend_setPostalCode_(v27, v294, (uint64_t)v293, v295, v296);

      v301 = objc_msgSend_administrativeArea(v284, v297, v298, v299, v300);
      objc_msgSend_setAdministrativeArea_(v27, v302, (uint64_t)v301, v303, v304);

      v309 = objc_msgSend_locality(v284, v305, v306, v307, v308);
      objc_msgSend_setLocality_(v27, v310, (uint64_t)v309, v311, v312);

      v317 = objc_msgSend_subAdministrativeArea(v284, v313, v314, v315, v316);
      objc_msgSend_setSubAdministrativeArea_(v27, v318, (uint64_t)v317, v319, v320);
    }
  }

  return v27;
}

- (id)populateStoreFrontLanguageLocale:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v4, v5, v6, v7);
  uint64_t v13 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v9, v10, v11, v12);
  if (!objc_msgSend_isTest(v8, v14, v15, v16, v17)) {
    goto LABEL_14;
  }
  uint64_t v22 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v18, v19, v20, v21);
  double v26 = objc_msgSend_stringForKey_(v22, v23, @"StorefrontLanguageLocale", v24, v25);

  uint64_t v31 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_stringForKey_(v31, v32, @"TransparencyBundleLocale", v33, v34);

  if (!v35)
  {
    int v39 = 0;
    if (v26) {
      goto LABEL_4;
    }
LABEL_10:
    char v43 = 0;
    if ((v39 ^ 1)) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  int v39 = objc_msgSend_isEqualToString_(v35, v36, (uint64_t)&stru_26E9B2670, v37, v38) ^ 1;
  if (!v26) {
    goto LABEL_10;
  }
LABEL_4:
  int isEqualToString = objc_msgSend_isEqualToString_(v26, v36, (uint64_t)&stru_26E9B2670, v37, v38);
  if (((v39 ^ 1) & 1) == 0)
  {
    uint64_t v41 = (uint64_t)v35;
    uint64_t v42 = v26;
    if (!isEqualToString) {
      goto LABEL_12;
    }
  }
  uint64_t v41 = (uint64_t)v3;
  uint64_t v42 = v26;
  if ((v39 | isEqualToString) != 1) {
    goto LABEL_12;
  }
  char v43 = isEqualToString ^ 1;
  if ((v39 ^ 1)) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v41 = (uint64_t)v35;
  uint64_t v42 = v3;
  if ((v43 & 1) == 0)
  {
LABEL_12:
    objc_msgSend_setStorefrontLocalizationLanguage_(v13, v36, v41, v37, v38);
    id v44 = v42;

    goto LABEL_15;
  }
LABEL_13:

LABEL_14:
  objc_msgSend_setStorefrontLocalizationLanguage_(v13, v18, (uint64_t)v3, v20, v21);
  id v44 = v3;
LABEL_15:

  return v44;
}

- (void)searchObjectForCriteria:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v30 = "-[ADSearchSession searchObjectForCriteria:withCompletionHandler:]";
    _os_log_impl(&dword_236756000, v8, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  uint64_t v13 = objc_msgSend_workQueue(MEMORY[0x263F24230], v9, v10, v11, v12);
  objc_msgSend_addOperationWithBlock_(v13, v14, (uint64_t)&unk_26E9B1F30, v15, v16);

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v22 = objc_msgSend_languageLocale(v7, v18, v19, v20, v21);

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_236764050;
  v26[3] = &unk_264CADE00;
  CFAbsoluteTime v28 = Current;
  id v27 = v6;
  id v23 = v6;
  objc_msgSend_requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality_withCompletionHandler_(self, v24, (uint64_t)v22, (uint64_t)v26, v25);
}

- (void)requestSponsoredSearchURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = APLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[ADSearchSession requestSponsoredSearchURL:]";
    _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  uint64_t v9 = objc_msgSend_workQueue(MEMORY[0x263F24230], v5, v6, v7, v8);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2367645D8;
  v14[3] = &unk_264CADE28;
  id v15 = v3;
  id v10 = v3;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v14, v12, v13);
}

- (void)requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[ADSearchSession requestSponsoredSearchDataRoutingInfoAndRequestIDForLocality:withCompletionHandler:]";
    _os_log_impl(&dword_236756000, v8, OS_LOG_TYPE_DEFAULT, "API Call to %s received.", buf, 0xCu);
  }

  uint64_t v13 = objc_msgSend_workQueue(MEMORY[0x263F24230], v9, v10, v11, v12);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_236764804;
  v19[3] = &unk_264CADD38;
  v19[4] = self;
  id v20 = v6;
  id v21 = v7;
  id v14 = v7;
  id v15 = v6;
  objc_msgSend_addOperationWithBlock_(v13, v16, (uint64_t)v19, v17, v18);
}

- (id)sponsoredSearchRequestForLanguageLocale:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F24238]);
  uint64_t v10 = objc_msgSend_userTargetingProperties(self, v6, v7, v8, v9);
  objc_msgSend_setProperties_(v5, v11, (uint64_t)v10, v12, v13);

  if (MGGetBoolAnswer())
  {
    uint64_t v18 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v14, v15, v16, v17);
    int v22 = objc_msgSend_BOOLForKey_(v18, v19, @"ODMLDataRequest", v20, v21);

    if (v22)
    {
      uint64_t v24 = objc_msgSend_properties(v5, v14, v23, v16, v17);
      objc_msgSend_setOverrideType_(v24, v25, 11001, v26, v27);
    }
  }
  CFAbsoluteTime v28 = objc_msgSend_populateStoreFrontLanguageLocale_(self, v14, (uint64_t)v4, v16, v17);
  uint64_t v33 = objc_msgSend_properties(v5, v29, v30, v31, v32);
  objc_msgSend_setStoreFrontLanguageLocaleIdentifier_(v33, v34, (uint64_t)v28, v35, v36);

  uint64_t v41 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v37, v38, v39, v40);
  uint64_t isTest = objc_msgSend_isTest(v41, v42, v43, v44, v45);
  objc_msgSend_setIsTest_(v5, v47, isTest, v48, v49);
  uint64_t isBaseline = objc_msgSend_isBaseline(v41, v50, v51, v52, v53);
  objc_msgSend_setIsBaseline_(v5, v55, isBaseline, v56, v57);
  objc_msgSend_setEnableImagesForDupes_(v5, v58, 1, v59, v60);
  uint64_t v65 = objc_msgSend_odmlSettings(self, v61, v62, v63, v64);
  if (v65)
  {

LABEL_7:
    uint64_t v80 = objc_msgSend_odmlSettings(self, v70, v71, v72, v73);
    objc_msgSend__setODMLProperties_withSettings_(self, v81, (uint64_t)v5, (uint64_t)v80, v82);

    goto LABEL_9;
  }
  uint64_t v74 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v66, v67, v68, v69);
  int isRunningTests = objc_msgSend_isRunningTests(v74, v75, v76, v77, v78);

  if (isRunningTests) {
    goto LABEL_7;
  }
  objc_msgSend__setODMLProperties_withSettings_(self, v70, (uint64_t)v5, 0, v73);
LABEL_9:

  return v5;
}

- (void)_setODMLProperties:(id)a3 withSettings:(id)a4
{
  id v56 = a4;
  if (v56)
  {
    id v5 = a3;
    uint64_t v10 = objc_msgSend_odmlVersion(v56, v6, v7, v8, v9);
    objc_msgSend_setSupportedODMLVersion_(v5, v11, v10, v12, v13);
    uint64_t v18 = objc_msgSend_treatmentID(v56, v14, v15, v16, v17);
    objc_msgSend_setTreatmentID_(v5, v19, (uint64_t)v18, v20, v21);

    uint64_t v26 = objc_msgSend_experimentID(v56, v22, v23, v24, v25);
    objc_msgSend_setExperimentID_(v5, v27, (uint64_t)v26, v28, v29);

    uint64_t v30 = NSString;
    uint64_t v35 = objc_msgSend_deploymentID(v56, v31, v32, v33, v34);
    objc_msgSend_stringWithFormat_(v30, v36, @"%d", v37, v38, v35);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDeploymentID_(v5, v40, (uint64_t)v39, v41, v42);
  }
  else
  {
    uint64_t v43 = *MEMORY[0x263F61F18];
    id v39 = a3;
    objc_msgSend_setSupportedODMLVersion_(v39, v44, v43, v45, v46);
    objc_msgSend_setTreatmentID_(v39, v47, @"-1", v48, v49);
    objc_msgSend_setExperimentID_(v39, v50, @"-1", v51, v52);
    objc_msgSend_setDeploymentID_(v39, v53, @"-1", v54, v55);
  }
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (int)appsRank
{
  return self->_appsRank;
}

- (void)setAppsRank:(int)a3
{
  self->_appsRank = a3;
}

- (ADCapService)capService
{
  return self->_capService;
}

- (void)setCapService:(id)a3
{
}

- (ADParameterFactory)parameterFactory
{
  return self->_parameterFactory;
}

- (void)setParameterFactory:(id)a3
{
}

- (NSString)campaignNamespace
{
  return self->_campaignNamespace;
}

- (NSObject)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (BOOL)notificationReceivedAndWaiting
{
  return self->_notificationReceivedAndWaiting;
}

- (void)setNotificationReceivedAndWaiting:(BOOL)a3
{
  self->_notificationReceivedAndWaiting = a3;
}

- (NSString)clientRequestID
{
  return self->_clientRequestID;
}

- (void)setClientRequestID:(id)a3
{
}

- (APOdmlSettings)odmlSettings
{
  return (APOdmlSettings *)objc_getProperty(self, a2, 80, 1);
}

- (OS_dispatch_queue)odmlQueue
{
  return self->_odmlQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odmlQueue, 0);
  objc_storeStrong((id *)&self->_odmlSettings, 0);
  objc_storeStrong((id *)&self->_clientRequestID, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_campaignNamespace, 0);
  objc_storeStrong((id *)&self->_parameterFactory, 0);
  objc_storeStrong((id *)&self->_capService, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_idNotificationQueue, 0);
}

@end