@interface ADSearchAdsSettings
+ (id)sharedInstance;
- (ADClientSettingsResponse)clientSettings;
- (ADFCapSettings)floraSettings;
- (ADFCapSettings)iris1Settings;
- (ADFCapSettings)iris2Settings;
- (ADFCapSettings)landingPageSettings;
- (ADFCapSettings)metisSettings;
- (ADFCapSettings)searchSettings;
- (ADSearchAdsSettings)init;
- (BOOL)isBaseline;
- (BOOL)isCustomTemplate;
- (BOOL)isRequestedImage;
- (BOOL)isRequestedRating;
- (BOOL)isTest;
- (NSArray)userKeyboards;
- (NSString)algoID;
- (NSString)requestedIcon;
- (NSString)requestedText;
- (NSString)templateType;
- (NSURL)defaultAdTargetingServerURL;
- (NSURL)defaultToroServerURL;
- (double)clientSettingsExpirationDate;
- (double)locationGridSpacing;
- (double)requestedLocationAccuracy;
- (id)_fCapParametersFromType:(int64_t)a3;
- (id)_fCapSettingsFromType:(int64_t)a3;
- (id)_getParametersForName:(id)a3;
- (void)applyClientSettings;
- (void)checkDefaultsAndSetInternalSettingsOverrides;
- (void)expireClientSettings;
- (void)refresh;
- (void)refreshClientSettings:(id)a3;
- (void)restoreClientSettings;
- (void)setAlgoID:(id)a3;
- (void)setClientSettings:(id)a3;
- (void)setDefaultAdTargetingServerURL:(id)a3;
- (void)setDefaultToroServerURL:(id)a3;
- (void)setFloraSettings:(id)a3;
- (void)setIris1Settings:(id)a3;
- (void)setIris2Settings:(id)a3;
- (void)setIsBaseline:(BOOL)a3;
- (void)setIsCustomTemplate:(BOOL)a3;
- (void)setIsRequestedImage:(BOOL)a3;
- (void)setIsRequestedRating:(BOOL)a3;
- (void)setIsTest:(BOOL)a3;
- (void)setLandingPageSettings:(id)a3;
- (void)setLocationGridSpacing:(double)a3;
- (void)setMetisSettings:(id)a3;
- (void)setRequestedIcon:(id)a3;
- (void)setRequestedLocationAccuracy:(double)a3;
- (void)setRequestedText:(id)a3;
- (void)setSearchSettings:(id)a3;
- (void)setTemplateType:(id)a3;
- (void)setUserKeyboards:(id)a3;
@end

@implementation ADSearchAdsSettings

- (void)refresh
{
  if (objc_msgSend_isMainThread(MEMORY[0x263F08B88], a2, v2, v3, v4))
  {
    objc_msgSend_sharedInputModeController(MEMORY[0x263F828C0], v6, v7, v8, v9);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_normalizedEnabledInputModeIdentifiers(v18, v10, v11, v12, v13);
    objc_msgSend_setUserKeyboards_(self, v15, (uint64_t)v14, v16, v17);
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2367607A0;
    block[3] = &unk_264CADCE8;
    objc_copyWeak(&v20, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)restoreClientSettings
{
  v6 = ADCopyDataFromKeychain();
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F241A0]);
    uint64_t v11 = objc_msgSend_initWithData_(v7, v8, (uint64_t)v6, v9, v10);
    objc_msgSend_setClientSettings_(self, v12, (uint64_t)v11, v13, v14);

    objc_msgSend_applyClientSettings(self, v15, v16, v17, v18);
  }
  objc_msgSend_refreshClientSettings_(self, v3, 0, v4, v5);
}

- (ADSearchAdsSettings)init
{
  v55.receiver = self;
  v55.super_class = (Class)ADSearchAdsSettings;
  v6 = [(ADSearchAdsSettings *)&v55 init];
  if (v6)
  {
    id v7 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v2, v3, v4, v5);
    uint64_t v11 = objc_msgSend_stringForKey_(v7, v8, @"ToroAlgoID", v9, v10);
    algoID = v6->_algoID;
    v6->_algoID = (NSString *)v11;

    if (objc_msgSend_isEqualToString_(v6->_algoID, v13, (uint64_t)&stru_26E9B2670, v14, v15))
    {
      uint64_t v16 = v6->_algoID;
      v6->_algoID = 0;
    }
    uint64_t v17 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    userKeyboards = v6->_userKeyboards;
    v6->_userKeyboards = v17;

    v6->_requestedLocationAccuracy = *(double *)MEMORY[0x263F00B30];
    v6->_locationGridSpacing = 250.0;
    v19 = [ADFCapSettings alloc];
    uint64_t v21 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v19, v20, 0, 1000, 1000, 1000.0, 604800.0, 604800.0);
    searchSettings = v6->_searchSettings;
    v6->_searchSettings = (ADFCapSettings *)v21;

    v23 = [ADFCapSettings alloc];
    uint64_t v25 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v23, v24, 1, 1000, 1000, 1000.0, 604800.0, 604800.0);
    landingPageSettings = v6->_landingPageSettings;
    v6->_landingPageSettings = (ADFCapSettings *)v25;

    v27 = [ADFCapSettings alloc];
    uint64_t v29 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v27, v28, 2, 1000, 1000, 1000.0, 604800.0, 604800.0);
    iris1Settings = v6->_iris1Settings;
    v6->_iris1Settings = (ADFCapSettings *)v29;

    v31 = [ADFCapSettings alloc];
    uint64_t v33 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v31, v32, 3, 1000, 1000, 1000.0, 604800.0, 604800.0);
    iris2Settings = v6->_iris2Settings;
    v6->_iris2Settings = (ADFCapSettings *)v33;

    v35 = [ADFCapSettings alloc];
    uint64_t v37 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v35, v36, 4, 1000, 1000, 1000.0, 604800.0, 604800.0);
    metisSettings = v6->_metisSettings;
    v6->_metisSettings = (ADFCapSettings *)v37;

    v39 = [ADFCapSettings alloc];
    uint64_t v41 = objc_msgSend_initWithType_location_clickExpiration_fCapExpiration_maxFCapElements_maxClickCapElements_(v39, v40, 5, 1000, 1000, 1000.0, 604800.0, 604800.0);
    floraSettings = v6->_floraSettings;
    v6->_floraSettings = (ADFCapSettings *)v41;

    v6->_isTest = 0;
    v6->_isBaseline = 0;
    v6->_isCustomTemplate = 0;
    v6->_isRequestedImage = 0;
    v6->_isRequestedRating = 0;
    requestedText = v6->_requestedText;
    v6->_requestedText = (NSString *)@"none";

    requestedIcon = v6->_requestedIcon;
    v6->_requestedIcon = (NSString *)@"regular";

    templateType = v6->_templateType;
    v6->_templateType = (NSString *)@"regular";

    objc_msgSend_refresh(v6, v46, v47, v48, v49);
    objc_msgSend_restoreClientSettings(v6, v50, v51, v52, v53);
  }
  return v6;
}

- (void)refreshClientSettings:(id)a3
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v5, v6, v7, v8);
  int v13 = objc_msgSend_BOOLForKey_(v9, v10, @"ClientSettingsForceExpire", v11, v12);

  if (v13)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v14, v15, v16, v17);
    objc_msgSend_setBool_forKey_(v18, v19, 0, @"ClientSettingsForceExpire", v20);

    uint64_t v21 = APLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236756000, v21, OS_LOG_TYPE_DEFAULT, "Client Settings is being forced to expire", buf, 2u);
    }
  }
  v22 = objc_msgSend_clientSettings(self, v14, v15, v16, v17);
  int hasExpirationDate = objc_msgSend_hasExpirationDate(v22, v23, v24, v25, v26);

  if ((hasExpirationDate ^ 1 | v13)) {
    goto LABEL_7;
  }
  v32 = objc_msgSend_date(MEMORY[0x263EFF910], v28, v29, v30, v31);
  double v37 = (double)(int)objc_msgSend_AD_toServerTime(v32, v33, v34, v35, v36);

  v42 = objc_msgSend_clientSettings(self, v38, v39, v40, v41);
  objc_msgSend_expirationDate(v42, v43, v44, v45, v46);
  double v48 = v47;

  if (v48 <= v37)
  {
LABEL_7:
    uint64_t v49 = objc_msgSend_sharedInstance(MEMORY[0x263F24230], v28, v29, v30, v31);
    v54 = objc_msgSend_workQueue(MEMORY[0x263F24230], v50, v51, v52, v53);
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = sub_236760818;
    v81[3] = &unk_264CADD38;
    v81[4] = self;
    id v82 = v49;
    id v83 = v4;
    id v55 = v49;
    objc_msgSend_addOperationWithBlock_(v54, v56, (uint64_t)v81, v57, v58);
  }
  else
  {
    v59 = APLogForCategory();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v64 = objc_msgSend_clientSettings(self, v60, v61, v62, v63);
      objc_msgSend_expirationDate(v64, v65, v66, v67, v68);
      *(_DWORD *)buf = 134218240;
      double v85 = v37;
      __int16 v86 = 2048;
      uint64_t v87 = v69;
      _os_log_impl(&dword_236756000, v59, OS_LOG_TYPE_DEFAULT, "Client Settings has not expired. (%f < %f)", buf, 0x16u);
    }
    v70 = APLogForCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v75 = objc_msgSend_clientSettings(self, v71, v72, v73, v74);
      v80 = objc_msgSend_AD_jsonString(v75, v76, v77, v78, v79);
      *(_DWORD *)buf = 138412290;
      double v85 = *(double *)&v80;
      _os_log_impl(&dword_236756000, v70, OS_LOG_TYPE_DEFAULT, "Current Client Settings: %@", buf, 0xCu);
    }
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (void)checkDefaultsAndSetInternalSettingsOverrides
{
  uint64_t v1063 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], a2, v2, v3, v4);
  self->_isBaseline = objc_msgSend_BOOLForKey_(v6, v7, @"IsBaselineRequest", v8, v9);

  uint64_t v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isBaseline) {
      uint64_t v11 = @"enabled.";
    }
    else {
      uint64_t v11 = @"disabled.";
    }
    int v1061 = 138412290;
    v1062 = v11;
    _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_DEFAULT, "Is Baseline Request has been %@", (uint8_t *)&v1061, 0xCu);
  }

  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v12, v13, v14, v15);
  self->_isCustomTemplate = objc_msgSend_BOOLForKey_(v16, v17, @"EnableRequestedTemplate", v18, v19);

  uint64_t v20 = APLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isCustomTemplate) {
      uint64_t v21 = @"enabled.";
    }
    else {
      uint64_t v21 = @"disabled.";
    }
    int v1061 = 138412290;
    v1062 = v21;
    _os_log_impl(&dword_236756000, v20, OS_LOG_TYPE_DEFAULT, "RequestedTemplate has been %@", (uint8_t *)&v1061, 0xCu);
  }

  if (self->_isCustomTemplate)
  {
    uint64_t v26 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v22, v23, v24, v25);
    objc_msgSend_setBool_forKey_(v26, v27, 1, @"ToroTestClient", v28);
  }
  uint64_t v29 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v22, v23, v24, v25);
  self->_isTest = objc_msgSend_BOOLForKey_(v29, v30, @"ToroTestClient", v31, v32);

  uint64_t v33 = APLogForCategory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isTest) {
      uint64_t v34 = @"enabled.";
    }
    else {
      uint64_t v34 = @"disabled.";
    }
    int v1061 = 138412290;
    v1062 = v34;
    _os_log_impl(&dword_236756000, v33, OS_LOG_TYPE_DEFAULT, "Toro Is Test Search Request has been %@", (uint8_t *)&v1061, 0xCu);
  }

  uint64_t v39 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v35, v36, v37, v38);
  self->_isRequestedImage = objc_msgSend_BOOLForKey_(v39, v40, @"ToroRequestedImage", v41, v42);

  v43 = APLogForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isRequestedImage) {
      uint64_t v44 = @"enabled.";
    }
    else {
      uint64_t v44 = @"disabled.";
    }
    int v1061 = 138412290;
    v1062 = v44;
    _os_log_impl(&dword_236756000, v43, OS_LOG_TYPE_DEFAULT, "Toro requested image ad template has been %@", (uint8_t *)&v1061, 0xCu);
  }

  uint64_t v49 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v45, v46, v47, v48);
  self->_isRequestedRating = objc_msgSend_BOOLForKey_(v49, v50, @"ToroRequestedRating", v51, v52);

  uint64_t v53 = APLogForCategory();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isRequestedRating) {
      v54 = @"enabled.";
    }
    else {
      v54 = @"disabled.";
    }
    int v1061 = 138412290;
    v1062 = v54;
    _os_log_impl(&dword_236756000, v53, OS_LOG_TYPE_DEFAULT, "Toro requested rating ad template has been %@", (uint8_t *)&v1061, 0xCu);
  }

  v59 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v55, v56, v57, v58);
  objc_msgSend_stringForKey_(v59, v60, @"ToroRequestedText", v61, v62);
  uint64_t v63 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestedText = self->_requestedText;
  self->_requestedText = v63;

  uint64_t v69 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v65, v66, v67, v68);
  objc_msgSend_stringForKey_(v69, v70, @"ToroRequestedIcon", v71, v72);
  uint64_t v73 = (NSString *)objc_claimAutoreleasedReturnValue();
  requestedIcon = self->_requestedIcon;
  self->_requestedIcon = v73;

  uint64_t v79 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v75, v76, v77, v78);
  objc_msgSend_stringForKey_(v79, v80, @"ToroTemplateType", v81, v82);
  id v83 = (NSString *)objc_claimAutoreleasedReturnValue();
  templateType = self->_templateType;
  self->_templateType = v83;

  if (MGGetBoolAnswer())
  {
    v89 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v85, v86, v87, v88);
    v93 = objc_msgSend_stringForKey_(v89, v90, @"MaxFrequencyCapElementsOverride", v91, v92);
    uint64_t v98 = objc_msgSend_length(v93, v94, v95, v96, v97);

    if (v98)
    {
      v103 = objc_msgSend_searchSettings(self, v99, v100, v101, v102);
      v108 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v104, v105, v106, v107);
      v112 = objc_msgSend_stringForKey_(v108, v109, @"MaxFrequencyCapElementsOverride", v110, v111);
      uint64_t v117 = objc_msgSend_integerValue(v112, v113, v114, v115, v116);
      objc_msgSend_overrideMaxFrequencyCapElements_(v103, v118, v117, v119, v120);
    }
    v121 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v99, v100, v101, v102);
    v125 = objc_msgSend_stringForKey_(v121, v122, @"FrequencyCapExpirationOverride", v123, v124);
    uint64_t v130 = objc_msgSend_length(v125, v126, v127, v128, v129);

    if (v130)
    {
      v135 = objc_msgSend_searchSettings(self, v131, v132, v133, v134);
      v140 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v136, v137, v138, v139);
      v144 = objc_msgSend_stringForKey_(v140, v141, @"FrequencyCapExpirationOverride", v142, v143);
      uint64_t v149 = objc_msgSend_integerValue(v144, v145, v146, v147, v148);
      objc_msgSend_overrideFrequencyCapExpiration_(v135, v150, v151, v152, v153, (double)v149);
    }
    v154 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v131, v132, v133, v134);
    v158 = objc_msgSend_stringForKey_(v154, v155, @"MaxClickElementsOverride", v156, v157);
    uint64_t v163 = objc_msgSend_length(v158, v159, v160, v161, v162);

    if (v163)
    {
      v168 = objc_msgSend_searchSettings(self, v164, v165, v166, v167);
      v173 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v169, v170, v171, v172);
      v177 = objc_msgSend_stringForKey_(v173, v174, @"MaxClickElementsOverride", v175, v176);
      uint64_t v182 = objc_msgSend_integerValue(v177, v178, v179, v180, v181);
      objc_msgSend_overrideMaxClickElements_(v168, v183, v182, v184, v185);
    }
    v186 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v164, v165, v166, v167);
    v190 = objc_msgSend_stringForKey_(v186, v187, @"ClickExpirationOverride", v188, v189);
    uint64_t v195 = objc_msgSend_length(v190, v191, v192, v193, v194);

    if (v195)
    {
      v200 = objc_msgSend_searchSettings(self, v196, v197, v198, v199);
      v205 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v201, v202, v203, v204);
      v209 = objc_msgSend_stringForKey_(v205, v206, @"ClickExpirationOverride", v207, v208);
      uint64_t v214 = objc_msgSend_integerValue(v209, v210, v211, v212, v213);
      objc_msgSend_overrideClickExpiration_(v200, v215, v216, v217, v218, (double)v214);
    }
    v219 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v196, v197, v198, v199);
    v223 = objc_msgSend_stringForKey_(v219, v220, @"ReverseGeolocationThresholdOverride", v221, v222);
    uint64_t v228 = objc_msgSend_length(v223, v224, v225, v226, v227);

    if (v228)
    {
      v233 = objc_msgSend_searchSettings(self, v229, v230, v231, v232);
      v238 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v234, v235, v236, v237);
      v242 = objc_msgSend_stringForKey_(v238, v239, @"ReverseGeolocationThresholdOverride", v240, v241);
      objc_msgSend_doubleValue(v242, v243, v244, v245, v246);
      objc_msgSend_overrideRevGeoThreshold_(v233, v247, v248, v249, v250);
    }
    v251 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v229, v230, v231, v232);
    v255 = objc_msgSend_stringForKey_(v251, v252, @"SLPMaxFrequencyCapElementsOverride", v253, v254);
    uint64_t v260 = objc_msgSend_length(v255, v256, v257, v258, v259);

    if (v260)
    {
      v265 = objc_msgSend_landingPageSettings(self, v261, v262, v263, v264);
      v270 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v266, v267, v268, v269);
      v274 = objc_msgSend_stringForKey_(v270, v271, @"SLPMaxFrequencyCapElementsOverride", v272, v273);
      uint64_t v279 = objc_msgSend_integerValue(v274, v275, v276, v277, v278);
      objc_msgSend_overrideMaxFrequencyCapElements_(v265, v280, v279, v281, v282);
    }
    v283 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v261, v262, v263, v264);
    v287 = objc_msgSend_stringForKey_(v283, v284, @"SLPFrequencyCapExpirationOverride", v285, v286);
    uint64_t v292 = objc_msgSend_length(v287, v288, v289, v290, v291);

    if (v292)
    {
      v297 = objc_msgSend_landingPageSettings(self, v293, v294, v295, v296);
      v302 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v298, v299, v300, v301);
      v306 = objc_msgSend_stringForKey_(v302, v303, @"SLPFrequencyCapExpirationOverride", v304, v305);
      uint64_t v311 = objc_msgSend_integerValue(v306, v307, v308, v309, v310);
      objc_msgSend_overrideFrequencyCapExpiration_(v297, v312, v313, v314, v315, (double)v311);
    }
    v316 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v293, v294, v295, v296);
    v320 = objc_msgSend_stringForKey_(v316, v317, @"SLPMaxClickElementsOverride", v318, v319);
    uint64_t v325 = objc_msgSend_length(v320, v321, v322, v323, v324);

    if (v325)
    {
      v330 = objc_msgSend_landingPageSettings(self, v326, v327, v328, v329);
      v335 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v331, v332, v333, v334);
      v339 = objc_msgSend_stringForKey_(v335, v336, @"SLPMaxClickElementsOverride", v337, v338);
      uint64_t v344 = objc_msgSend_integerValue(v339, v340, v341, v342, v343);
      objc_msgSend_overrideMaxClickElements_(v330, v345, v344, v346, v347);
    }
    v348 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v326, v327, v328, v329);
    v352 = objc_msgSend_stringForKey_(v348, v349, @"SLPClickExpirationOverride", v350, v351);
    uint64_t v357 = objc_msgSend_length(v352, v353, v354, v355, v356);

    if (v357)
    {
      v362 = objc_msgSend_landingPageSettings(self, v358, v359, v360, v361);
      v367 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v363, v364, v365, v366);
      v371 = objc_msgSend_stringForKey_(v367, v368, @"SLPClickExpirationOverride", v369, v370);
      uint64_t v376 = objc_msgSend_integerValue(v371, v372, v373, v374, v375);
      objc_msgSend_overrideClickExpiration_(v362, v377, v378, v379, v380, (double)v376);
    }
    v381 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v358, v359, v360, v361);
    v385 = objc_msgSend_stringForKey_(v381, v382, @"SLPReverseGeolocationThresholdOverride", v383, v384);
    uint64_t v390 = objc_msgSend_length(v385, v386, v387, v388, v389);

    if (v390)
    {
      v395 = objc_msgSend_landingPageSettings(self, v391, v392, v393, v394);
      v400 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v396, v397, v398, v399);
      v404 = objc_msgSend_stringForKey_(v400, v401, @"SLPReverseGeolocationThresholdOverride", v402, v403);
      objc_msgSend_doubleValue(v404, v405, v406, v407, v408);
      objc_msgSend_overrideRevGeoThreshold_(v395, v409, v410, v411, v412);
    }
    v413 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v391, v392, v393, v394);
    v417 = objc_msgSend_stringForKey_(v413, v414, @"Iris1MaxFrequencyCapElementsOverride", v415, v416);
    uint64_t v422 = objc_msgSend_length(v417, v418, v419, v420, v421);

    if (v422)
    {
      v427 = objc_msgSend_iris1Settings(self, v423, v424, v425, v426);
      v432 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v428, v429, v430, v431);
      v436 = objc_msgSend_stringForKey_(v432, v433, @"Iris1MaxFrequencyCapElementsOverride", v434, v435);
      uint64_t v441 = objc_msgSend_integerValue(v436, v437, v438, v439, v440);
      objc_msgSend_overrideMaxFrequencyCapElements_(v427, v442, v441, v443, v444);
    }
    v445 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v423, v424, v425, v426);
    v449 = objc_msgSend_stringForKey_(v445, v446, @"Iris1FrequencyCapExpirationOverride", v447, v448);
    uint64_t v454 = objc_msgSend_length(v449, v450, v451, v452, v453);

    if (v454)
    {
      v459 = objc_msgSend_iris1Settings(self, v455, v456, v457, v458);
      v464 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v460, v461, v462, v463);
      v468 = objc_msgSend_stringForKey_(v464, v465, @"Iris1FrequencyCapExpirationOverride", v466, v467);
      uint64_t v473 = objc_msgSend_integerValue(v468, v469, v470, v471, v472);
      objc_msgSend_overrideFrequencyCapExpiration_(v459, v474, v475, v476, v477, (double)v473);
    }
    v478 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v455, v456, v457, v458);
    v482 = objc_msgSend_stringForKey_(v478, v479, @"Iris1MaxClickElementsOverride", v480, v481);
    uint64_t v487 = objc_msgSend_length(v482, v483, v484, v485, v486);

    if (v487)
    {
      v492 = objc_msgSend_iris1Settings(self, v488, v489, v490, v491);
      v497 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v493, v494, v495, v496);
      v501 = objc_msgSend_stringForKey_(v497, v498, @"Iris1MaxClickElementsOverride", v499, v500);
      uint64_t v506 = objc_msgSend_integerValue(v501, v502, v503, v504, v505);
      objc_msgSend_overrideMaxClickElements_(v492, v507, v506, v508, v509);
    }
    v510 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v488, v489, v490, v491);
    v514 = objc_msgSend_stringForKey_(v510, v511, @"Iris1ClickExpirationOverride", v512, v513);
    uint64_t v519 = objc_msgSend_length(v514, v515, v516, v517, v518);

    if (v519)
    {
      v524 = objc_msgSend_iris1Settings(self, v520, v521, v522, v523);
      v529 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v525, v526, v527, v528);
      v533 = objc_msgSend_stringForKey_(v529, v530, @"Iris1ClickExpirationOverride", v531, v532);
      uint64_t v538 = objc_msgSend_integerValue(v533, v534, v535, v536, v537);
      objc_msgSend_overrideClickExpiration_(v524, v539, v540, v541, v542, (double)v538);
    }
    v543 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v520, v521, v522, v523);
    v547 = objc_msgSend_stringForKey_(v543, v544, @"Iris1ReverseGeolocationThresholdOverride", v545, v546);
    uint64_t v552 = objc_msgSend_length(v547, v548, v549, v550, v551);

    if (v552)
    {
      v557 = objc_msgSend_iris1Settings(self, v553, v554, v555, v556);
      v562 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v558, v559, v560, v561);
      v566 = objc_msgSend_stringForKey_(v562, v563, @"Iris1ReverseGeolocationThresholdOverride", v564, v565);
      objc_msgSend_doubleValue(v566, v567, v568, v569, v570);
      objc_msgSend_overrideRevGeoThreshold_(v557, v571, v572, v573, v574);
    }
    v575 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v553, v554, v555, v556);
    v579 = objc_msgSend_stringForKey_(v575, v576, @"Iris2MaxFrequencyCapElementsOverride", v577, v578);
    uint64_t v584 = objc_msgSend_length(v579, v580, v581, v582, v583);

    if (v584)
    {
      v589 = objc_msgSend_iris2Settings(self, v585, v586, v587, v588);
      v594 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v590, v591, v592, v593);
      v598 = objc_msgSend_stringForKey_(v594, v595, @"Iris2MaxFrequencyCapElementsOverride", v596, v597);
      uint64_t v603 = objc_msgSend_integerValue(v598, v599, v600, v601, v602);
      objc_msgSend_overrideMaxFrequencyCapElements_(v589, v604, v603, v605, v606);
    }
    v607 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v585, v586, v587, v588);
    v611 = objc_msgSend_stringForKey_(v607, v608, @"Iris2FrequencyCapExpirationOverride", v609, v610);
    uint64_t v616 = objc_msgSend_length(v611, v612, v613, v614, v615);

    if (v616)
    {
      v621 = objc_msgSend_iris2Settings(self, v617, v618, v619, v620);
      v626 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v622, v623, v624, v625);
      v630 = objc_msgSend_stringForKey_(v626, v627, @"Iris2FrequencyCapExpirationOverride", v628, v629);
      uint64_t v635 = objc_msgSend_integerValue(v630, v631, v632, v633, v634);
      objc_msgSend_overrideFrequencyCapExpiration_(v621, v636, v637, v638, v639, (double)v635);
    }
    v640 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v617, v618, v619, v620);
    v644 = objc_msgSend_stringForKey_(v640, v641, @"Iris2MaxClickElementsOverride", v642, v643);
    uint64_t v649 = objc_msgSend_length(v644, v645, v646, v647, v648);

    if (v649)
    {
      v654 = objc_msgSend_iris2Settings(self, v650, v651, v652, v653);
      v659 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v655, v656, v657, v658);
      v663 = objc_msgSend_stringForKey_(v659, v660, @"Iris2MaxClickElementsOverride", v661, v662);
      uint64_t v668 = objc_msgSend_integerValue(v663, v664, v665, v666, v667);
      objc_msgSend_overrideMaxClickElements_(v654, v669, v668, v670, v671);
    }
    v672 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v650, v651, v652, v653);
    v676 = objc_msgSend_stringForKey_(v672, v673, @"Iris2ClickExpirationOverride", v674, v675);
    uint64_t v681 = objc_msgSend_length(v676, v677, v678, v679, v680);

    if (v681)
    {
      v686 = objc_msgSend_iris2Settings(self, v682, v683, v684, v685);
      v691 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v687, v688, v689, v690);
      v695 = objc_msgSend_stringForKey_(v691, v692, @"Iris2ClickExpirationOverride", v693, v694);
      uint64_t v700 = objc_msgSend_integerValue(v695, v696, v697, v698, v699);
      objc_msgSend_overrideClickExpiration_(v686, v701, v702, v703, v704, (double)v700);
    }
    v705 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v682, v683, v684, v685);
    v709 = objc_msgSend_stringForKey_(v705, v706, @"Iris2ReverseGeolocationThresholdOverride", v707, v708);
    uint64_t v714 = objc_msgSend_length(v709, v710, v711, v712, v713);

    if (v714)
    {
      v719 = objc_msgSend_iris2Settings(self, v715, v716, v717, v718);
      v724 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v720, v721, v722, v723);
      v728 = objc_msgSend_stringForKey_(v724, v725, @"Iris2ReverseGeolocationThresholdOverride", v726, v727);
      objc_msgSend_doubleValue(v728, v729, v730, v731, v732);
      objc_msgSend_overrideRevGeoThreshold_(v719, v733, v734, v735, v736);
    }
    v737 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v715, v716, v717, v718);
    v741 = objc_msgSend_stringForKey_(v737, v738, @"MetisMaxFrequencyCapElementsOverride", v739, v740);
    uint64_t v746 = objc_msgSend_length(v741, v742, v743, v744, v745);

    if (v746)
    {
      v751 = objc_msgSend_metisSettings(self, v747, v748, v749, v750);
      v756 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v752, v753, v754, v755);
      v760 = objc_msgSend_stringForKey_(v756, v757, @"MetisMaxFrequencyCapElementsOverride", v758, v759);
      uint64_t v765 = objc_msgSend_integerValue(v760, v761, v762, v763, v764);
      objc_msgSend_overrideMaxFrequencyCapElements_(v751, v766, v765, v767, v768);
    }
    v769 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v747, v748, v749, v750);
    v773 = objc_msgSend_stringForKey_(v769, v770, @"MetisFrequencyCapExpirationOverride", v771, v772);
    uint64_t v778 = objc_msgSend_length(v773, v774, v775, v776, v777);

    if (v778)
    {
      v783 = objc_msgSend_metisSettings(self, v779, v780, v781, v782);
      v788 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v784, v785, v786, v787);
      v792 = objc_msgSend_stringForKey_(v788, v789, @"MetisFrequencyCapExpirationOverride", v790, v791);
      uint64_t v797 = objc_msgSend_integerValue(v792, v793, v794, v795, v796);
      objc_msgSend_overrideFrequencyCapExpiration_(v783, v798, v799, v800, v801, (double)v797);
    }
    v802 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v779, v780, v781, v782);
    v806 = objc_msgSend_stringForKey_(v802, v803, @"MetisMaxClickElementsOverride", v804, v805);
    uint64_t v811 = objc_msgSend_length(v806, v807, v808, v809, v810);

    if (v811)
    {
      v816 = objc_msgSend_metisSettings(self, v812, v813, v814, v815);
      v821 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v817, v818, v819, v820);
      v825 = objc_msgSend_stringForKey_(v821, v822, @"MetisMaxClickElementsOverride", v823, v824);
      uint64_t v830 = objc_msgSend_integerValue(v825, v826, v827, v828, v829);
      objc_msgSend_overrideMaxClickElements_(v816, v831, v830, v832, v833);
    }
    v834 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v812, v813, v814, v815);
    v838 = objc_msgSend_stringForKey_(v834, v835, @"MetisClickExpirationOverride", v836, v837);
    uint64_t v843 = objc_msgSend_length(v838, v839, v840, v841, v842);

    if (v843)
    {
      v848 = objc_msgSend_metisSettings(self, v844, v845, v846, v847);
      v853 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v849, v850, v851, v852);
      v857 = objc_msgSend_stringForKey_(v853, v854, @"MetisClickExpirationOverride", v855, v856);
      uint64_t v862 = objc_msgSend_integerValue(v857, v858, v859, v860, v861);
      objc_msgSend_overrideClickExpiration_(v848, v863, v864, v865, v866, (double)v862);
    }
    v867 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v844, v845, v846, v847);
    v871 = objc_msgSend_stringForKey_(v867, v868, @"MetisReverseGeolocationThresholdOverride", v869, v870);
    uint64_t v876 = objc_msgSend_length(v871, v872, v873, v874, v875);

    if (v876)
    {
      v881 = objc_msgSend_metisSettings(self, v877, v878, v879, v880);
      v886 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v882, v883, v884, v885);
      v890 = objc_msgSend_stringForKey_(v886, v887, @"MetisReverseGeolocationThresholdOverride", v888, v889);
      objc_msgSend_doubleValue(v890, v891, v892, v893, v894);
      objc_msgSend_overrideRevGeoThreshold_(v881, v895, v896, v897, v898);
    }
    v899 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v877, v878, v879, v880);
    v903 = objc_msgSend_stringForKey_(v899, v900, @"FloraMaxFrequencyCapElementsOverride", v901, v902);
    uint64_t v908 = objc_msgSend_length(v903, v904, v905, v906, v907);

    if (v908)
    {
      v913 = objc_msgSend_floraSettings(self, v909, v910, v911, v912);
      v918 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v914, v915, v916, v917);
      v922 = objc_msgSend_stringForKey_(v918, v919, @"FloraMaxFrequencyCapElementsOverride", v920, v921);
      uint64_t v927 = objc_msgSend_integerValue(v922, v923, v924, v925, v926);
      objc_msgSend_overrideMaxFrequencyCapElements_(v913, v928, v927, v929, v930);
    }
    v931 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v909, v910, v911, v912);
    v935 = objc_msgSend_stringForKey_(v931, v932, @"FloraFrequencyCapExpirationOverride", v933, v934);
    uint64_t v940 = objc_msgSend_length(v935, v936, v937, v938, v939);

    if (v940)
    {
      v945 = objc_msgSend_floraSettings(self, v941, v942, v943, v944);
      v950 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v946, v947, v948, v949);
      v954 = objc_msgSend_stringForKey_(v950, v951, @"FloraFrequencyCapExpirationOverride", v952, v953);
      uint64_t v959 = objc_msgSend_integerValue(v954, v955, v956, v957, v958);
      objc_msgSend_overrideFrequencyCapExpiration_(v945, v960, v961, v962, v963, (double)v959);
    }
    v964 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v941, v942, v943, v944);
    v968 = objc_msgSend_stringForKey_(v964, v965, @"FloraMaxClickElementsOverride", v966, v967);
    uint64_t v973 = objc_msgSend_length(v968, v969, v970, v971, v972);

    if (v973)
    {
      v978 = objc_msgSend_floraSettings(self, v974, v975, v976, v977);
      v983 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v979, v980, v981, v982);
      v987 = objc_msgSend_stringForKey_(v983, v984, @"FloraMaxClickElementsOverride", v985, v986);
      uint64_t v992 = objc_msgSend_integerValue(v987, v988, v989, v990, v991);
      objc_msgSend_overrideMaxClickElements_(v978, v993, v992, v994, v995);
    }
    v996 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v974, v975, v976, v977);
    v1000 = objc_msgSend_stringForKey_(v996, v997, @"FloraClickExpirationOverride", v998, v999);
    uint64_t v1005 = objc_msgSend_length(v1000, v1001, v1002, v1003, v1004);

    if (v1005)
    {
      v1010 = objc_msgSend_floraSettings(self, v1006, v1007, v1008, v1009);
      v1015 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v1011, v1012, v1013, v1014);
      v1019 = objc_msgSend_stringForKey_(v1015, v1016, @"FloraClickExpirationOverride", v1017, v1018);
      uint64_t v1024 = objc_msgSend_integerValue(v1019, v1020, v1021, v1022, v1023);
      objc_msgSend_overrideClickExpiration_(v1010, v1025, v1026, v1027, v1028, (double)v1024);
    }
    v1029 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v1006, v1007, v1008, v1009);
    v1033 = objc_msgSend_stringForKey_(v1029, v1030, @"FloraReverseGeolocationThresholdOverride", v1031, v1032);
    uint64_t v1038 = objc_msgSend_length(v1033, v1034, v1035, v1036, v1037);

    if (v1038)
    {
      v1043 = objc_msgSend_floraSettings(self, v1039, v1040, v1041, v1042);
      v1048 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v1044, v1045, v1046, v1047);
      v1052 = objc_msgSend_stringForKey_(v1048, v1049, @"FloraReverseGeolocationThresholdOverride", v1050, v1051);
      objc_msgSend_doubleValue(v1052, v1053, v1054, v1055, v1056);
      objc_msgSend_overrideRevGeoThreshold_(v1043, v1057, v1058, v1059, v1060);
    }
  }
}

- (void)applyClientSettings
{
  uint64_t v111 = self;
  uint64_t v4 = 0;
  uint64_t v118 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v5 = v111;
    uint64_t v6 = objc_msgSend__fCapParametersFromType_(v111, a2, v4, v2, v3, v111);
    uint64_t v112 = v4;
    uint64_t v10 = objc_msgSend__fCapSettingsFromType_(v5, v7, v4, v8, v9);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v11 = v6;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v113, (uint64_t)v117, 16);
    if (v13)
    {
      uint64_t v18 = v13;
      uint64_t v19 = *(void *)v114;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v114 != v19) {
            objc_enumerationMutation(v11);
          }
          uint64_t v21 = *(void **)(*((void *)&v113 + 1) + 8 * i);
          v22 = objc_msgSend_key(v21, v14, v15, v16, v17);
          int isEqualToString = objc_msgSend_isEqualToString_(v22, v23, @"frequencyCapExpirationInSeconds", v24, v25);

          if (isEqualToString)
          {
            uint64_t v31 = objc_msgSend_value(v21, v27, v28, v29, v30);
            objc_msgSend_floatValue(v31, v32, v33, v34, v35);
            objc_msgSend_setFrequencyCapExpirationInSeconds_(v10, v37, v38, v39, v40, v36);
          }
          uint64_t v41 = objc_msgSend_key(v21, v27, v28, v29, v30);
          int v45 = objc_msgSend_isEqualToString_(v41, v42, @"reverseGeolocationRefreshThresholdInMeters", v43, v44);

          if (v45)
          {
            v50 = objc_msgSend_value(v21, v46, v47, v48, v49);
            objc_msgSend_doubleValue(v50, v51, v52, v53, v54);
            objc_msgSend_setReverseGeolocationRefreshThresholdInMeters_(v10, v55, v56, v57, v58);
          }
          v59 = objc_msgSend_key(v21, v46, v47, v48, v49);
          int v63 = objc_msgSend_isEqualToString_(v59, v60, @"maxFrequencyCapElements", v61, v62);

          if (v63)
          {
            uint64_t v68 = objc_msgSend_value(v21, v64, v65, v66, v67);
            uint64_t v73 = objc_msgSend_integerValue(v68, v69, v70, v71, v72);
            objc_msgSend_setMaxFrequencyCapElements_(v10, v74, v73, v75, v76);
          }
          uint64_t v77 = objc_msgSend_key(v21, v64, v65, v66, v67);
          int v81 = objc_msgSend_isEqualToString_(v77, v78, @"maxClickCapElements", v79, v80);

          if (v81)
          {
            uint64_t v86 = objc_msgSend_value(v21, v82, v83, v84, v85);
            uint64_t v91 = objc_msgSend_integerValue(v86, v87, v88, v89, v90);
            objc_msgSend_setMaxClickCapElements_(v10, v92, v91, v93, v94);
          }
          uint64_t v95 = objc_msgSend_key(v21, v82, v83, v84, v85);
          int v99 = objc_msgSend_isEqualToString_(v95, v96, @"clickExpirationThresholdInSeconds", v97, v98);

          if (v99)
          {
            uint64_t v100 = objc_msgSend_value(v21, v14, v15, v16, v17);
            objc_msgSend_floatValue(v100, v101, v102, v103, v104);
            objc_msgSend_setClickExpirationThresholdInSeconds_(v10, v106, v107, v108, v109, v105);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v113, (uint64_t)v117, 16);
      }
      while (v18);
    }

    uint64_t v4 = v112 + 1;
  }
  while (v112 != 5);
  objc_msgSend_checkDefaultsAndSetInternalSettingsOverrides(v111, a2, v110, v2, v3);
}

- (id)_fCapSettingsFromType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v6 = objc_msgSend_searchSettings(self, a2, a3, v3, v4);
      goto LABEL_11;
    case 1:
      uint64_t v6 = objc_msgSend_landingPageSettings(self, a2, a3, v3, v4);
      goto LABEL_11;
    case 2:
      uint64_t v6 = objc_msgSend_iris1Settings(self, a2, a3, v3, v4);
      goto LABEL_11;
    case 3:
      uint64_t v6 = objc_msgSend_iris2Settings(self, a2, a3, v3, v4);
      goto LABEL_11;
    case 4:
      uint64_t v6 = objc_msgSend_metisSettings(self, a2, a3, v3, v4);
      goto LABEL_11;
    case 5:
      uint64_t v6 = objc_msgSend_floraSettings(self, a2, a3, v3, v4);
LABEL_11:
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

- (id)_fCapParametersFromType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = objc_msgSend_clientSettings(self, a2, a3, v3, v4);
      uint64_t v10 = objc_msgSend_searchAdsSettingsParams(v5, v6, v7, v8, v9);
      goto LABEL_5;
    case 1:
      uint64_t v5 = objc_msgSend_clientSettings(self, a2, a3, v3, v4);
      uint64_t v10 = objc_msgSend_searchLandingAdsSettingsParams(v5, v12, v13, v14, v15);
LABEL_5:
      id v11 = (void *)v10;

      break;
    case 2:
      objc_msgSend__getParametersForName_(self, a2, @"iris1", v3, v4);
      goto LABEL_10;
    case 3:
      objc_msgSend__getParametersForName_(self, a2, @"iris2", v3, v4);
      goto LABEL_10;
    case 4:
      objc_msgSend__getParametersForName_(self, a2, @"metis", v3, v4);
      goto LABEL_10;
    case 5:
      objc_msgSend__getParametersForName_(self, a2, @"flora", v3, v4);
      id v11 = LABEL_10:;
      break;
    default:
      id v11 = 0;
      break;
  }
  return v11;
}

- (id)_getParametersForName:(id)a3
{
  uint64_t v5 = objc_msgSend_clientSettings(self, a2, (uint64_t)a3, v3, v4);
  uint64_t v10 = objc_msgSend_searchLandingAdsSettingsParams(v5, v6, v7, v8, v9);

  return v10;
}

- (ADClientSettingsResponse)clientSettings
{
  return self->_clientSettings;
}

- (void)setUserKeyboards:(id)a3
{
}

- (void)setClientSettings:(id)a3
{
}

- (ADFCapSettings)searchSettings
{
  return self->_searchSettings;
}

- (ADFCapSettings)metisSettings
{
  return self->_metisSettings;
}

- (ADFCapSettings)landingPageSettings
{
  return self->_landingPageSettings;
}

- (ADFCapSettings)iris2Settings
{
  return self->_iris2Settings;
}

- (ADFCapSettings)iris1Settings
{
  return self->_iris1Settings;
}

- (ADFCapSettings)floraSettings
{
  return self->_floraSettings;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_236758CD4;
  block[3] = &unk_264CADCC0;
  void block[4] = a1;
  if (qword_26AC299D8 != -1) {
    dispatch_once(&qword_26AC299D8, block);
  }
  uint64_t v2 = (void *)qword_26AC299D0;
  return v2;
}

- (void)expireClientSettings
{
  objc_msgSend_clientSettings(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setExpirationDate_(v9, v5, v6, v7, v8, 0.0);
}

- (NSURL)defaultToroServerURL
{
  uint64_t v5 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], a2, v2, v3, v4);
  uint64_t v9 = objc_msgSend_stringForKey_(v5, v6, @"ToroAdServerURL", v7, v8);

  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = @"https://tr.iadsdk.apple.com/adserver";
  }
  id v11 = objc_alloc(NSURL);
  uint64_t v15 = objc_msgSend_initWithString_(v11, v12, (uint64_t)v10, v13, v14);

  return (NSURL *)v15;
}

- (NSURL)defaultAdTargetingServerURL
{
  id v2 = objc_alloc(NSURL);
  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v3, v4, v5, v6);
  id v11 = objc_msgSend_stringForKey_(v7, v8, @"TargetingAdServerURL", v9, v10);
  uint64_t v15 = objc_msgSend_initWithString_(v2, v12, (uint64_t)v11, v13, v14);

  return (NSURL *)v15;
}

- (double)clientSettingsExpirationDate
{
  uint64_t v5 = objc_msgSend_clientSettings(self, a2, v2, v3, v4);
  objc_msgSend_expirationDate(v5, v6, v7, v8, v9);
  double v11 = v10;

  return v11;
}

- (void)setDefaultToroServerURL:(id)a3
{
}

- (void)setDefaultAdTargetingServerURL:(id)a3
{
}

- (NSString)algoID
{
  return self->_algoID;
}

- (void)setAlgoID:(id)a3
{
}

- (NSArray)userKeyboards
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (double)requestedLocationAccuracy
{
  return self->_requestedLocationAccuracy;
}

- (void)setRequestedLocationAccuracy:(double)a3
{
  self->_requestedLocationAccuracy = a3;
}

- (double)locationGridSpacing
{
  return self->_locationGridSpacing;
}

- (void)setLocationGridSpacing:(double)a3
{
  self->_locationGridSpacing = a3;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (void)setIsTest:(BOOL)a3
{
  self->_isTest = a3;
}

- (BOOL)isBaseline
{
  return self->_isBaseline;
}

- (void)setIsBaseline:(BOOL)a3
{
  self->_isBaseline = a3;
}

- (BOOL)isCustomTemplate
{
  return self->_isCustomTemplate;
}

- (void)setIsCustomTemplate:(BOOL)a3
{
  self->_isCustomTemplate = a3;
}

- (BOOL)isRequestedImage
{
  return self->_isRequestedImage;
}

- (void)setIsRequestedImage:(BOOL)a3
{
  self->_isRequestedImage = a3;
}

- (BOOL)isRequestedRating
{
  return self->_isRequestedRating;
}

- (void)setIsRequestedRating:(BOOL)a3
{
  self->_isRequestedRating = a3;
}

- (NSString)requestedText
{
  return self->_requestedText;
}

- (void)setRequestedText:(id)a3
{
}

- (NSString)requestedIcon
{
  return self->_requestedIcon;
}

- (void)setRequestedIcon:(id)a3
{
}

- (NSString)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(id)a3
{
}

- (void)setSearchSettings:(id)a3
{
}

- (void)setLandingPageSettings:(id)a3
{
}

- (void)setIris1Settings:(id)a3
{
}

- (void)setIris2Settings:(id)a3
{
}

- (void)setMetisSettings:(id)a3
{
}

- (void)setFloraSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSettings, 0);
  objc_storeStrong((id *)&self->_floraSettings, 0);
  objc_storeStrong((id *)&self->_metisSettings, 0);
  objc_storeStrong((id *)&self->_iris2Settings, 0);
  objc_storeStrong((id *)&self->_iris1Settings, 0);
  objc_storeStrong((id *)&self->_landingPageSettings, 0);
  objc_storeStrong((id *)&self->_searchSettings, 0);
  objc_storeStrong((id *)&self->_templateType, 0);
  objc_storeStrong((id *)&self->_requestedIcon, 0);
  objc_storeStrong((id *)&self->_requestedText, 0);
  objc_storeStrong((id *)&self->_userKeyboards, 0);
  objc_storeStrong((id *)&self->_algoID, 0);
  objc_storeStrong((id *)&self->_defaultAdTargetingServerURL, 0);
  objc_storeStrong((id *)&self->_defaultToroServerURL, 0);
}

@end