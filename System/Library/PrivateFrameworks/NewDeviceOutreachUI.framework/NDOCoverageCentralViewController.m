@interface NDOCoverageCentralViewController
- (BOOL)deviceLoadCompleted;
- (BOOL)expectingLink;
- (BOOL)isFromDeeplink;
- (BOOL)isSignedIn;
- (BOOL)launchedWithUrl;
- (BOOL)openDefaultDeviceDetails;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (BOOL)shouldShowDeviceListUI;
- (NDOACController)acController;
- (NDOAppleCareAMSUIViewController)amsUIVC;
- (NDOCoverageCentralVCManager)ndoManager;
- (NDOCoverageCentralViewController)init;
- (NDOCoverageCentralViewController)initWithIsSignedIn:(BOOL)a3 deviceManager:(id)a4;
- (NDODevice)defaultDevice;
- (NSArray)deviceListAPISections;
- (NSMutableArray)allLocalDevices;
- (NSMutableArray)pairedDevices;
- (NSMutableDictionary)deviceInfoDict;
- (NSMutableDictionary)deviceSequenceDict;
- (NSString)deeplinkParams;
- (NSString)sessionID;
- (NSString)ulSalesURL;
- (id)_errorStateConfig;
- (id)_getParamsDictFromPath:(id)a3;
- (id)_localizedResourceWithString:(id)a3;
- (id)_noAccountConfig;
- (id)offerTextForDevice:(id)a3;
- (id)offerTextForDeviceInfo:(id)a3;
- (id)onViewIsAppearing;
- (id)specifiers;
- (id)updateCells;
- (void)_donateNavLinks;
- (void)_getUpdatedParamsFromPath:(id)a3 withCompletion:(id)a4;
- (void)_refresh:(id)a3;
- (void)_refreshAndForcePostFollowUp:(BOOL)a3 refreshControlToStop:(id)a4;
- (void)addFooterLabelToSpecifier:(id)a3;
- (void)completeWithStatus:(unint64_t)a3;
- (void)completeWithStatus:(unint64_t)a3 params:(id)a4;
- (void)dismissAMSUI;
- (void)fetchAllDeviceInfoUsingPolicy:(unint64_t)a3 sessionID:(id)a4 params:(id)a5 isSales:(BOOL)a6 withReply:(id)a7;
- (void)fetchAllLocalDevices;
- (void)getAllDeviceInfoUsingPolicy:(unint64_t)a3 sessionID:(id)a4 params:(id)a5 isSales:(BOOL)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8;
- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8;
- (void)handlePurchaseCompleted;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)init;
- (void)loadView;
- (void)openAMSUIWithURL:(id)a3 httpBody:(id)a4;
- (void)openURL:(id)a3;
- (void)resetAll;
- (void)setAcController:(id)a3;
- (void)setAllLocalDevices:(id)a3;
- (void)setAmsUIVC:(id)a3;
- (void)setDeeplinkParams:(id)a3;
- (void)setDefaultDevice:(id)a3;
- (void)setDeviceInfoDict:(id)a3;
- (void)setDeviceListAPISections:(id)a3;
- (void)setDeviceLoadCompleted:(BOOL)a3;
- (void)setDeviceSequenceDict:(id)a3;
- (void)setExpectingLink:(BOOL)a3;
- (void)setIsFromDeeplink:(BOOL)a3;
- (void)setIsSignedIn:(BOOL)a3;
- (void)setLaunchedWithUrl:(BOOL)a3;
- (void)setNdoManager:(id)a3;
- (void)setOnViewIsAppearing:(id)a3;
- (void)setOpenDefaultDeviceDetails:(BOOL)a3;
- (void)setPairedDevices:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setUlSalesURL:(id)a3;
- (void)showUI;
- (void)specifiers;
- (void)updateCells;
- (void)updateDefaultDeviceWithDeviceInfo:(id)a3;
- (void)updateDeviceInfoForDevice:(id)a3 usingPolicy:(unint64_t)a4 params:(id)a5 forceUpdateFollowup:(BOOL)a6 withReply:(id)a7;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation NDOCoverageCentralViewController

- (NDOCoverageCentralViewController)init
{
  v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(NDOCoverageCentralViewController *)v3 init];
  }

  v11 = objc_opt_new();
  v12 = objc_msgSend(v11, "aida_accountForPrimaryiCloudAccount");
  v13 = objc_opt_new();
  v14 = [(NDOCoverageCentralViewController *)self initWithIsSignedIn:v12 != 0 deviceManager:v13];

  return v14;
}

- (NDOCoverageCentralViewController)initWithIsSignedIn:(BOOL)a3 deviceManager:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)NDOCoverageCentralViewController;
  uint64_t v7 = [(NDOCoverageCentralViewController *)&v30 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(NDOCoverageCentralViewController *)v7 setIsSignedIn:v4];
    if ([(NDOCoverageCentralViewController *)v8 isSignedIn])
    {
      [(NDOCoverageCentralViewController *)v8 setNdoManager:v6];
      uint64_t v9 = [(NDOCoverageCentralViewController *)v8 ndoManager];
      uint64_t v10 = [v9 defaultDevice];
      [(NDOCoverageCentralViewController *)v8 setDefaultDevice:v10];

      id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(NDOCoverageCentralViewController *)v8 setPairedDevices:v11];

      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      [(NDOCoverageCentralViewController *)v8 setAllLocalDevices:v12];

      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [(NDOCoverageCentralViewController *)v8 setDeviceInfoDict:v13];

      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [(NDOCoverageCentralViewController *)v8 setDeviceSequenceDict:v14];

      v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v16 = dispatch_queue_create("com.apple.newdeviceoutreach.ndoccvc.policyqueue", v15);
      policyLookupQueue = v8->_policyLookupQueue;
      v8->_policyLookupQueue = (OS_dispatch_queue *)v16;

      dispatch_group_t v18 = dispatch_group_create();
      group = v8->_group;
      v8->_group = (OS_dispatch_group *)v18;

      v20 = [MEMORY[0x263F08C38] UUID];
      v21 = [v20 UUIDString];
      [(NDOCoverageCentralViewController *)v8 setSessionID:v21];
    }
    else
    {
      v20 = _NDOLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[NDOCoverageCentralViewController initWithIsSignedIn:deviceManager:](v20, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  return v8;
}

- (void)loadView
{
}

void __44__NDOCoverageCentralViewController_loadView__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setOnViewIsAppearing:0];
    v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __44__NDOCoverageCentralViewController_loadView__block_invoke_cold_1(v2, v3);
    }

    if (([v2 launchedWithUrl] & 1) == 0)
    {
      BOOL v4 = [v2 specifier];
      uint64_t v5 = [v4 propertyForKey:@"NDODeviceInfo"];

      id v6 = [v5 warranty];

      if (v6)
      {
        uint64_t v7 = _NDOLogSystem();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [v5 warranty];
          int v9 = 136446466;
          uint64_t v10 = "-[NDOCoverageCentralViewController loadView]_block_invoke";
          __int16 v11 = 2112;
          id v12 = v8;
          _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: Updating default device info with warranty:%@: ", (uint8_t *)&v9, 0x16u);
        }
        [v2 updateDefaultDeviceWithDeviceInfo:v5];
      }
      [v2 fetchAllDeviceInfoUsingPolicy:0 sessionID:v2[180] params:0 isSales:0 withReply:0];
    }
  }
}

- (id)_localizedResourceWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08DB0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 bundleURL];
  int v9 = (void *)[v5 initWithKey:v4 table:0 locale:v6 bundleURL:v8];

  return v9;
}

- (void)_donateNavLinks
{
  v8[2] = *MEMORY[0x263EF8340];
  v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.General/COVERAGE"];
  id v4 = [(NDOCoverageCentralViewController *)self _localizedResourceWithString:@"AppleCare & Warranty"];
  id v5 = [(NDOCoverageCentralViewController *)self _localizedResourceWithString:@"General"];
  v8[0] = v5;
  id v6 = [(NDOCoverageCentralViewController *)self _localizedResourceWithString:@"AppleCare & Warranty"];
  v8[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
  [(NDOCoverageCentralViewController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.gear" title:v4 localizedNavigationComponents:v7 deepLink:v3];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NDOCoverageCentralViewController;
  [(NDOCoverageCentralViewController *)&v6 viewIsAppearing:a3];
  [(NDOCoverageCentralViewController *)self _donateNavLinks];
  id v4 = [(NDOCoverageCentralViewController *)self onViewIsAppearing];

  if (v4)
  {
    id v5 = [(NDOCoverageCentralViewController *)self onViewIsAppearing];
    v5[2]();
  }
}

- (id)specifiers
{
  v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(NDOCoverageCentralViewController *)v3 specifiers];
  }

  uint64_t v11 = (int)*MEMORY[0x263F5FDB8];
  id v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  if (!v12)
  {
    uint64_t v13 = [(NDOCoverageCentralViewController *)self updateCells];
    id v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = v13;

    id v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  }
  return v12;
}

- (id)offerTextForDeviceInfo:(id)a3
{
  v3 = (void *)MEMORY[0x263F58738];
  uint64_t v4 = [a3 warranty];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  uint64_t v6 = [v3 ctaTextWithWarranty:v4 forDate:v5];

  return v6;
}

- (id)offerTextForDevice:(id)a3
{
  return (id)[MEMORY[0x263F58738] ctaTextWithDevice:a3];
}

- (id)updateCells
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v143 = (id)objc_opt_new();
  BOOL v3 = [(NDOCoverageCentralViewController *)self shouldShowDeviceListUI];
  uint64_t v4 = _NDOLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v5) {
      [(NDOCoverageCentralViewController *)v4 updateCells];
    }

    v49 = [(NDOCoverageCentralViewController *)self defaultDevice];

    v50 = (void *)MEMORY[0x263F5FFE0];
    v51 = (void *)MEMORY[0x263F602A8];
    v52 = (uint64_t *)MEMORY[0x263F60138];
    if (v49)
    {
      v53 = _NDOLogSystem();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
        [(NDOCoverageCentralViewController *)v53 updateCells];
      }

      v61 = [(NDOCoverageCentralViewController *)self deviceInfoDict];
      v62 = [(NDOCoverageCentralViewController *)self defaultDevice];
      v63 = [v62 serialNumber];
      v64 = [v61 objectForKeyedSubscript:v63];

      v65 = _NDOLogSystem();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
        [(NDOCoverageCentralViewController *)(uint64_t)v64 updateCells];
      }

      v66 = [v64 warranty];

      if (v66)
      {
        v67 = (void *)MEMORY[0x263F5FC40];
        v68 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
        v69 = [v68 localizedStringForKey:@"CC_DEFAULT_TITLE" value:&stru_26EB85580 table:@"Localizable"];
        uint64_t v70 = [v67 preferenceSpecifierNamed:v69 target:self set:0 get:0 detail:0 cell:0 edit:0];

        v134 = (void *)v70;
        [v143 addObject:v70];
        v163[0] = *v50;
        v164[0] = objc_opt_class();
        v163[1] = *v51;
        v71 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
        v164[1] = v71;
        v72 = [NSDictionary dictionaryWithObjects:v164 forKeys:v163 count:2];

        v73 = (void *)MEMORY[0x263F5FC40];
        v74 = [v64 device];
        v75 = [v74 name];
        v76 = [v73 preferenceSpecifierNamed:v75 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

        [v76 setProperties:v72];
        [v76 setProperty:@"DEFAULT_COVERAGE" forKey:*v52];
        v77 = _NDOLogSystem();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
        {
          [(NDOCoverageCentralViewController *)self updateCells];
          v78 = v159;
        }
        else
        {
          v78 = @"NDOHostingController";
        }

        [v76 setProperty:self forKey:v78];
        uint64_t v79 = MEMORY[0x263EFFA88];
        [v76 setProperty:MEMORY[0x263EFFA88] forKey:@"isCoverageCentralContainer"];
        v80 = [v64 warranty];
        [v76 setProperty:v80 forKey:@"NDOWarranty"];

        [v76 setProperty:v64 forKey:@"NDODeviceInfo"];
        [v76 setProperty:v79 forKey:@"isSettingsContainer"];
        v81 = [v64 warranty];
        v82 = [v81 coverageLocalizedLabel];
        [v76 setObject:v82 forKeyedSubscript:@"NDOCoverageItemCellCoverageLabelKey"];

        v83 = [(NDOCoverageCentralViewController *)self offerTextForDeviceInfo:v64];
        [v76 setObject:v83 forKeyedSubscript:@"NDOCoverageItemCellOfferLabelKey"];

        v84 = [v64 warranty];
        v85 = [v84 deviceImageUrl];
        [v76 setObject:v85 forKeyedSubscript:@"NDOCoverageItemCellImageURLKey"];

        v86 = [v64 device];
        v87 = [v86 productPlaceholderImage];
        [v76 setObject:v87 forKeyedSubscript:@"NDOCoverageItemCellFallbackImageKey"];

        v88 = [(NDOCoverageCentralViewController *)self deeplinkParams];

        if (v88)
        {
          v89 = [(NDOCoverageCentralViewController *)self deeplinkParams];
          [v76 setProperty:v89 forKey:@"NDODeeplinkParams"];
        }
        [v143 addObject:v76];
      }
      else
      {
        v134 = 0;
      }
    }
    else
    {
      v134 = 0;
    }
    v90 = [(NDOCoverageCentralViewController *)self pairedDevices];
    v91 = (void *)MEMORY[0x263F5FC40];
    v92 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    v93 = [v92 localizedStringForKey:@"CC_OTHER_TITLE" value:&stru_26EB85580 table:@"Localizable"];
    v132 = [v91 preferenceSpecifierNamed:v93 target:self set:0 get:0 detail:0 cell:0 edit:0];

    long long v146 = 0u;
    long long v147 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v94 = v90;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v144 objects:v162 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      char v97 = 0;
      uint64_t v98 = *(void *)v145;
      uint64_t v140 = *v51;
      uint64_t v142 = *v50;
      double v99 = *MEMORY[0x263F839B8];
      uint64_t v138 = *v52;
      id v136 = v94;
      do
      {
        for (uint64_t i = 0; i != v96; ++i)
        {
          if (*(void *)v145 != v98) {
            objc_enumerationMutation(v136);
          }
          v101 = *(void **)(*((void *)&v144 + 1) + 8 * i);
          v102 = [(NDOCoverageCentralViewController *)self deviceInfoDict];
          v103 = [v101 serialNumber];
          v104 = [v102 objectForKeyedSubscript:v103];

          v105 = [v104 warranty];

          if (v105)
          {
            if ((v97 & 1) == 0) {
              [v143 addObject:v132];
            }
            v160[0] = v142;
            uint64_t v106 = objc_opt_class();
            v160[1] = v140;
            v161[0] = v106;
            v107 = [NSNumber numberWithDouble:v99];
            v161[1] = v107;
            v108 = [NSDictionary dictionaryWithObjects:v161 forKeys:v160 count:2];

            v109 = (void *)MEMORY[0x263F5FC40];
            v110 = [v104 device];
            v111 = [v110 name];
            v112 = [v109 preferenceSpecifierNamed:v111 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

            [v112 setProperties:v108];
            uint64_t v113 = [v101 name];
            v114 = (void *)v113;
            if (v113) {
              v115 = (__CFString *)v113;
            }
            else {
              v115 = @"COVERAGE_ITEM1";
            }
            [v112 setProperty:v115 forKey:v138];

            [v112 setProperty:self forKey:@"NDOHostingController"];
            uint64_t v116 = MEMORY[0x263EFFA88];
            [v112 setProperty:MEMORY[0x263EFFA88] forKey:@"isCoverageCentralContainer"];
            [v112 setProperty:v116 forKey:@"isSettingsContainer"];
            v117 = [v104 warranty];
            [v112 setProperty:v117 forKey:@"NDOWarranty"];

            [v112 setProperty:v104 forKey:@"NDODeviceInfo"];
            v118 = [v104 warranty];
            v119 = [v118 coverageLocalizedLabel];
            [v112 setObject:v119 forKeyedSubscript:@"NDOCoverageItemCellCoverageLabelKey"];

            v120 = [(NDOCoverageCentralViewController *)self offerTextForDeviceInfo:v104];
            [v112 setObject:v120 forKeyedSubscript:@"NDOCoverageItemCellOfferLabelKey"];

            v121 = [v104 warranty];
            v122 = [v121 deviceImageUrl];
            [v112 setObject:v122 forKeyedSubscript:@"NDOCoverageItemCellImageURLKey"];

            v123 = [v104 device];
            v124 = [v123 productPlaceholderImage];
            [v112 setObject:v124 forKeyedSubscript:@"NDOCoverageItemCellFallbackImageKey"];

            v125 = [(NDOCoverageCentralViewController *)self deeplinkParams];

            if (v125)
            {
              v126 = [(NDOCoverageCentralViewController *)self deeplinkParams];
              [v112 setProperty:v126 forKey:@"NDODeeplinkParams"];
            }
            [v143 addObject:v112];

            char v97 = 1;
          }
        }
        id v94 = v136;
        uint64_t v96 = [v136 countByEnumeratingWithState:&v144 objects:v162 count:16];
      }
      while (v96);

      if (v97)
      {
        [(NDOCoverageCentralViewController *)self addFooterLabelToSpecifier:v132];
        uint64_t v13 = v134;
LABEL_64:

        goto LABEL_65;
      }
    }
    else
    {
    }
    uint64_t v13 = v134;
    if (v134) {
      [(NDOCoverageCentralViewController *)self addFooterLabelToSpecifier:v134];
    }
    goto LABEL_64;
  }
  if (v5) {
    [(NDOCoverageCentralViewController *)v4 updateCells];
  }

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  obuint64_t j = [(NDOCoverageCentralViewController *)self deviceListAPISections];
  uint64_t v130 = [obj countByEnumeratingWithState:&v155 objects:v168 count:16];
  uint64_t v13 = 0;
  if (v130)
  {
    uint64_t v129 = *(void *)v156;
    uint64_t v141 = *MEMORY[0x263F5FFE0];
    uint64_t v139 = *MEMORY[0x263F602A8];
    double v14 = *MEMORY[0x263F839B8];
    uint64_t v137 = *MEMORY[0x263F60138];
    uint64_t v15 = MEMORY[0x263EFFA88];
    do
    {
      uint64_t v16 = 0;
      v17 = v13;
      do
      {
        if (*(void *)v156 != v129) {
          objc_enumerationMutation(obj);
        }
        uint64_t v131 = v16;
        dispatch_group_t v18 = *(void **)(*((void *)&v155 + 1) + 8 * v16);
        v19 = (void *)MEMORY[0x263F5FC40];
        v20 = [v18 identifier];
        v21 = [v18 label];
        uint64_t v22 = [v19 groupSpecifierWithID:v20 name:v21];

        id v23 = v22;
        v133 = v23;
        [v143 addObject:v23];
        long long v153 = 0u;
        long long v154 = 0u;
        long long v151 = 0u;
        long long v152 = 0u;
        id v135 = [v18 deviceList];
        uint64_t v24 = [v135 countByEnumeratingWithState:&v151 objects:v167 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v152;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v152 != v26) {
                objc_enumerationMutation(v135);
              }
              uint64_t v28 = *(void **)(*((void *)&v151 + 1) + 8 * j);
              v29 = [(NDOCoverageCentralViewController *)self deviceInfoDict];
              objc_super v30 = [v28 serialNumber];
              v31 = [v29 objectForKeyedSubscript:v30];

              v165[0] = v141;
              v166[0] = objc_opt_class();
              v165[1] = v139;
              v32 = [NSNumber numberWithDouble:v14];
              v166[1] = v32;
              v33 = [NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:2];

              v34 = (void *)MEMORY[0x263F5FC40];
              v35 = [v28 name];
              v36 = [v34 preferenceSpecifierNamed:v35 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

              [v36 setProperties:v33];
              uint64_t v37 = [v28 name];
              v38 = (void *)v37;
              if (v37) {
                v39 = (__CFString *)v37;
              }
              else {
                v39 = @"COVERAGE_ITEM";
              }
              [v36 setProperty:v39 forKey:v137];

              [v36 setProperty:self forKey:@"NDOHostingController"];
              [v36 setProperty:v15 forKey:@"isCoverageCentralContainer"];
              [v36 setProperty:v15 forKey:@"isSettingsContainer"];
              v40 = [v28 coverageLocalizedLabel];
              [v36 setObject:v40 forKeyedSubscript:@"NDOCoverageItemCellCoverageLabelKey"];

              if (v31) {
                [(NDOCoverageCentralViewController *)self offerTextForDeviceInfo:v31];
              }
              else {
              v41 = [(NDOCoverageCentralViewController *)self offerTextForDevice:v28];
              }
              [v36 setObject:v41 forKeyedSubscript:@"NDOCoverageItemCellOfferLabelKey"];

              v42 = [v28 deviceImageUrl];
              [v36 setObject:v42 forKeyedSubscript:@"NDOCoverageItemCellImageURLKey"];

              v43 = [v28 productPlaceholderImage];
              [v36 setObject:v43 forKeyedSubscript:@"NDOCoverageItemCellFallbackImageKey"];

              [v36 setObject:v28 forKeyedSubscript:@"NDODevice"];
              v44 = [(NDOCoverageCentralViewController *)self allLocalDevices];
              v148[0] = MEMORY[0x263EF8330];
              v148[1] = 3221225472;
              v148[2] = __47__NDOCoverageCentralViewController_updateCells__block_invoke;
              v148[3] = &unk_264D49928;
              v148[4] = v28;
              id v45 = v36;
              id v149 = v45;
              id v150 = v31;
              id v46 = v31;
              [v44 enumerateObjectsUsingBlock:v148];

              v47 = [(NDOCoverageCentralViewController *)self deeplinkParams];

              if (v47)
              {
                v48 = [(NDOCoverageCentralViewController *)self deeplinkParams];
                [v45 setProperty:v48 forKey:@"NDODeeplinkParams"];
              }
              [v143 addObject:v45];
            }
            uint64_t v25 = [v135 countByEnumeratingWithState:&v151 objects:v167 count:16];
          }
          while (v25);
        }

        uint64_t v13 = v133;
        uint64_t v16 = v131 + 1;
        v17 = v133;
      }
      while (v131 + 1 != v130);
      uint64_t v130 = [obj countByEnumeratingWithState:&v155 objects:v168 count:16];
    }
    while (v130);
  }

  [(NDOCoverageCentralViewController *)self addFooterLabelToSpecifier:v13];
LABEL_65:

  return v143;
}

void __47__NDOCoverageCentralViewController_updateCells__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v3 serialNumber];
  uint64_t v6 = [v4 serialNumber];

  LODWORD(v4) = [v5 isEqualToString:v6];
  if (v4)
  {
    uint64_t v7 = [*(id *)(a1 + 48) warranty];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"NDOWarranty"];

    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    [v8 setObject:v9 forKeyedSubscript:@"NDODeviceInfo"];
  }
}

- (void)addFooterLabelToSpecifier:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v6 = [v3 bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  BOOL v5 = [v6 localizedStringForKey:@"CC_FOOTER_APPLEID" value:&stru_26EB85580 table:@"Localizable"];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263F600F8]];
}

- (void)openURL:(id)a3
{
  id v3 = a3;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[NDOCoverageCentralViewController openURL:]();
  }

  [(id)*MEMORY[0x263F83300] openURL:v3 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)fetchAllLocalDevices
{
}

uint64_t __56__NDOCoverageCentralViewController_fetchAllLocalDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isVisibleInCC];
}

- (void)fetchAllDeviceInfoUsingPolicy:(unint64_t)a3 sessionID:(id)a4 params:(id)a5 isSales:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = _NDOLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:](v11, v8, v13);
  }

  [(NDOCoverageCentralViewController *)self fetchAllLocalDevices];
  BOOL v14 = [(NDOCoverageCentralViewController *)self isSignedIn];
  uint64_t v15 = _NDOLogSystem();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    unint64_t v31 = a3;
    if (v16) {
      -[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:](v15, v17, v18, v19, v20, v21, v22, v23);
    }

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke;
    v34[3] = &unk_264D49998;
    v34[4] = self;
    id v24 = v11;
    id v35 = v24;
    uint64_t v25 = (void *)MEMORY[0x23EC93640](v34);
    uint64_t v26 = [(NDOCoverageCentralViewController *)self ndoManager];
    uint64_t v27 = [(NDOCoverageCentralViewController *)self allLocalDevices];
    uint64_t v28 = [MEMORY[0x263F08C38] UUID];
    v29 = [v28 UUIDString];
    if (v8) {
      objc_super v30 = v25;
    }
    else {
      objc_super v30 = 0;
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_73;
    v32[3] = &unk_264D499E8;
    v32[4] = self;
    id v33 = v12;
    [v26 getDeviceListForLocalDevices:v27 sessionID:v29 policy:v31 params:v24 salesReplyOnly:0 salesInfoReply:v30 deviceInfoReply:0 completionBlock:v32];
  }
  else
  {
    if (v16) {
      -[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:](v15, v17, v18, v19, v20, v21, v22, v23);
    }

    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _getParamsDictFromPath:*(void *)(a1 + 40)];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2;
  v11[3] = &unk_264D49970;
  id v12 = v6;
  id v13 = v7;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v5;
  id v8 = v5;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  if ([*(id *)(a1 + 32) count]) {
    [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"devices"];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:@"additionalInfo"];
  }
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:]_block_invoke_2";
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: amsui payload: %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 48) openAMSUIWithURL:*(void *)(a1 + 56) httpBody:v2];
}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_74;
  block[3] = &unk_264D499C0;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_74(uint64_t a1)
{
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_74_cold_1(a1, v2, v3);
  }

  if ([*(id *)(a1 + 32) count])
  {
    [*(id *)(a1 + 40) setDeviceLoadCompleted:1];
    [*(id *)(a1 + 40) setDeviceListAPISections:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) showUI];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)getAllDeviceInfoUsingPolicy:(unint64_t)a3 sessionID:(id)a4 params:(id)a5 isSales:(BOOL)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  BOOL v16 = _NDOLogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "-[NDOCoverageCentralViewController getAllDeviceInfoUsingPolicy:sessionID:params:isSa"
                                    "les:andForcePostFollowup:withReply:]";
    _os_log_impl(&dword_238845000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s:", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__2;
  v39 = __Block_byref_object_dispose__2;
  id v40 = [MEMORY[0x263EFF980] array];
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__2;
  v34[4] = __Block_byref_object_dispose__2;
  id v35 = 0;
  uint64_t v17 = [(NDOCoverageCentralViewController *)self allLocalDevices];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke;
  v27[3] = &unk_264D49A38;
  v27[4] = self;
  unint64_t v32 = a3;
  id v18 = v13;
  id v28 = v18;
  id v19 = v14;
  BOOL v33 = a7;
  id v29 = v19;
  objc_super v30 = v34;
  p_long long buf = &buf;
  [v17 enumerateObjectsUsingBlock:v27];
  group = self->_group;
  policyLookupQueue = self->_policyLookupQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_79;
  block[3] = &unk_264D49A88;
  uint64_t v25 = &buf;
  uint64_t v26 = v34;
  void block[4] = self;
  id v24 = v15;
  id v22 = v15;
  dispatch_group_notify(group, policyLookupQueue, block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&buf, 8);
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 1392));
  uint64_t v4 = *(void **)(a1 + 32);
  int v5 = [v3 serialNumber];
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 80);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2;
  v12[3] = &unk_264D49A10;
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v3;
  uint64_t v14 = v10;
  long long v15 = *(_OWORD *)(a1 + 56);
  id v11 = v3;
  [v4 getDeviceInfoForSerialNumber:v5 usingPolicy:v6 sessionID:v7 params:v8 andForcePostFollowup:v9 withReply:v12];
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_4((uint64_t)v3, a1);
  }

  int v5 = [v3 device];
  uint64_t v6 = [v5 serialNumber];
  if (v6)
  {
    id v7 = [v3 device];
  }
  else
  {
    id v7 = *(id *)(a1 + 32);
  }
  uint64_t v8 = v7;

  if (v3)
  {
    uint64_t v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_3(v8, v3);
    }

    uint64_t v10 = [v3 warranty];
    if (v10)
    {
      id v11 = v10;
    }
    else
    {
      id v11 = [*(id *)(a1 + 40) deviceInfoDict];
      id v22 = [v8 serialNumber];
      uint64_t v23 = [v11 objectForKeyedSubscript:v22];
      if (v23)
      {
        id v24 = (void *)v23;
        uint64_t v25 = [*(id *)(a1 + 40) deviceInfoDict];
        uint64_t v26 = [v8 serialNumber];
        uint64_t v27 = [v25 objectForKeyedSubscript:v26];
        id v28 = [v27 warranty];

        if (!v28)
        {
LABEL_13:
          id v13 = [v3 warranty];
          uint64_t v14 = [v13 agsULURL];
          if (v14)
          {
            uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

            if (v15)
            {
LABEL_17:
              id v19 = _NDOLogSystem();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_1(v8, v3);
              }

              uint64_t v20 = [*(id *)(a1 + 40) deviceInfoDict];
              uint64_t v21 = [v8 serialNumber];
              [v20 setObject:v3 forKeyedSubscript:v21];

              [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v3];
              goto LABEL_20;
            }
            id v13 = [v3 warranty];
            uint64_t v16 = [v13 agsULURL];
            uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
            id v18 = *(void **)(v17 + 40);
            *(void *)(v17 + 40) = v16;
          }
          goto LABEL_17;
        }
        id v29 = (void *)MEMORY[0x263F58718];
        objc_super v30 = [*(id *)(a1 + 40) deviceInfoDict];
        unint64_t v31 = [v8 serialNumber];
        unint64_t v32 = [v30 objectForKeyedSubscript:v31];
        BOOL v33 = [v32 warranty];
        id v12 = [v29 deviceInfoWithDevice:v8 warranty:v33];

        id v11 = _NDOLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_2(v12, v8, v11);
        }
LABEL_12:

        id v3 = v12;
        goto LABEL_13;
      }
    }
    id v12 = v3;
    goto LABEL_12;
  }
LABEL_20:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 1392));
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_79(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
    *(_DWORD *)long long buf = 136446466;
    id v13 = "-[NDOCoverageCentralViewController getAllDeviceInfoUsingPolicy:sessionID:params:isSales:andForcePostFollowup:w"
          "ithReply:]_block_invoke";
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    _os_log_impl(&dword_238845000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: finishing with device infos: %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_80;
  void v8[3] = &unk_264D49A60;
  uint64_t v4 = a1[7];
  int v5 = (void *)a1[5];
  v8[4] = a1[4];
  uint64_t v10 = v4;
  id v6 = v5;
  uint64_t v7 = a1[6];
  id v9 = v6;
  uint64_t v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_80(uint64_t a1)
{
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_80_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  [*(id *)(a1 + 32) setUlSalesURL:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  [*(id *)(a1 + 32) setDeviceLoadCompleted:1];
  return [*(id *)(a1 + 32) showUI];
}

- (void)getDeviceInfoForSerialNumber:(id)a3 usingPolicy:(unint64_t)a4 sessionID:(id)a5 params:(id)a6 andForcePostFollowup:(BOOL)a7 withReply:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = (void (**)(id, void))a8;
  if ([(NDOCoverageCentralViewController *)self isSignedIn])
  {
    id v18 = [(NDOCoverageCentralViewController *)self ndoManager];
    [v18 getDeviceInfoForSerialNumber:v14 usingPolicy:a4 sessionID:v15 params:v16 andForcePostFollowup:v9 withReply:v17];
  }
  else
  {
    id v19 = _NDOLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      [(NDOCoverageCentralViewController *)v19 getDeviceInfoForSerialNumber:v21 usingPolicy:v22 sessionID:v23 params:v24 andForcePostFollowup:v25 withReply:v26];
    }

    if (v17) {
      v17[2](v17, 0);
    }
  }
}

- (void)updateDefaultDeviceWithDeviceInfo:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v7 = [(NDOCoverageCentralViewController *)self deviceInfoDict];
    uint64_t v5 = [(NDOCoverageCentralViewController *)self defaultDevice];
    uint64_t v6 = [v5 serialNumber];
    [v7 setObject:v4 forKeyedSubscript:v6];
  }
}

- (void)updateDeviceInfoForDevice:(id)a3 usingPolicy:(unint64_t)a4 params:(id)a5 forceUpdateFollowup:(BOOL)a6 withReply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = _NDOLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[NDOCoverageCentralViewController updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:]();
  }

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke;
  v24[3] = &unk_264D49AD8;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = (void *)MEMORY[0x23EC93640](v24);
  id v19 = [v17 serialNumber];
  uint64_t v20 = [(NDOCoverageCentralViewController *)self sessionID];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_81;
  v22[3] = &unk_264D497C0;
  id v23 = v18;
  id v21 = v18;
  [(NDOCoverageCentralViewController *)self getDeviceInfoForSerialNumber:v19 usingPolicy:a4 sessionID:v20 params:v14 andForcePostFollowup:v8 withReply:v22];
}

void __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2;
  v7[3] = &unk_264D49AB0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) warranty];

  if (v2)
  {
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v4 = [*(id *)(v1 + 40) deviceInfoDict];
    uint64_t v5 = [*(id *)(v1 + 32) device];
    id v6 = [v5 serialNumber];
    [v4 setObject:v3 forKeyedSubscript:v6];

    id v7 = _NDOLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(v1 + 32);
      uint64_t v9 = [v8 device];
      id v10 = [v9 serialNumber];
      *(_DWORD *)long long buf = 136446722;
      objc_super v30 = "-[NDOCoverageCentralViewController updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withRepl"
            "y:]_block_invoke_2";
      __int16 v31 = 2112;
      unint64_t v32 = v8;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: updating deviceInfo: %@ for sn: %@", buf, 0x20u);
    }
  }
  if ([*(id *)(v1 + 40) shouldShowDeviceListUI])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = [*(id *)(v1 + 40) specifiers];
    uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v23 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v23) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = [v14 objectForKeyedSubscript:@"NDODevice"];
          id v16 = [v15 serialNumber];
          [*(id *)(v1 + 32) device];
          id v18 = v17 = v1;
          id v19 = [v18 serialNumber];
          int v20 = [v16 isEqualToString:v19];

          uint64_t v1 = v17;
          if (v20)
          {
            [v14 setObject:*(void *)(v17 + 48) forKeyedSubscript:@"NDODevice"];
            [v14 setObject:*(void *)(v17 + 32) forKeyedSubscript:@"NDODeviceInfo"];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }
  }
  [*(id *)(v1 + 40) reloadSpecifiers];
  return (*(uint64_t (**)(void))(*(void *)(v1 + 56) + 16))();
}

void __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_82;
  v5[3] = &unk_264D49770;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_82(uint64_t a1)
{
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_82_cold_1(a1);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446466;
    id v21 = "-[NDOCoverageCentralViewController handleURL:withCompletion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_238845000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: Handle url with dict: %@", buf, 0x16u);
  }

  if ([(NDOCoverageCentralViewController *)self isSignedIn])
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"path"];
    if ([MEMORY[0x263F58728] isNotEmptyString:v9])
    {
      [(NDOCoverageCentralViewController *)self setLaunchedWithUrl:1];
      if ([v9 hasPrefix:@"DEFAULT_COVERAGE"])
      {
        id v10 = [(NDOCoverageCentralViewController *)self specifiers];
        uint64_t v11 = [v10 specifierForID:@"DEFAULT_COVERAGE"];

        uint64_t v12 = [[NDOWarrantyInfoController alloc] initWithSpecifier:v11];
        id v13 = [(NDOCoverageCentralViewController *)self navigationController];
        [v13 pushViewController:v12 animated:1];

        v7[2](v7);
      }
      else
      {
        objc_initWeak((id *)buf, self);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke;
        v15[3] = &unk_264D49B28;
        objc_copyWeak(&v17, (id *)buf);
        id v16 = v7;
        [(NDOCoverageCentralViewController *)self _getUpdatedParamsFromPath:v9 withCompletion:v15];

        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)NDOCoverageCentralViewController;
      [(NDOCoverageCentralViewController *)&v18 handleURL:v6 withCompletion:v7];
    }
  }
  else
  {
    id v14 = _NDOLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136446210;
      id v21 = "-[NDOCoverageCentralViewController handleURL:withCompletion:]";
      _os_log_impl(&dword_238845000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: Ignoring handle as the user is not signed in to icloud.", buf, 0xCu);
    }

    v19.receiver = self;
    v19.super_class = (Class)NDOCoverageCentralViewController;
    [(NDOCoverageCentralViewController *)&v19 handleURL:v6 withCompletion:v7];
  }
}

void __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDeeplinkParams:v3];
  uint64_t v5 = [WeakRetained _getParamsDictFromPath:v3];
  id v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446466;
    id v15 = "-[NDOCoverageCentralViewController handleURL:withCompletion:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_238845000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: fetching devices with params dict: %@", buf, 0x16u);
  }

  id v7 = [v5 objectForKey:@"type"];
  id v8 = v7;
  if (v7 && [v7 length])
  {
    uint64_t v9 = [v8 lowercaseString];
    uint64_t v10 = [v9 isEqualToString:@"sales"];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [WeakRetained sessionID];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke_95;
  v12[3] = &unk_264D49B00;
  id v13 = *(id *)(a1 + 32);
  [WeakRetained fetchAllDeviceInfoUsingPolicy:2 sessionID:v11 params:v3 isSales:v10 withReply:v12];
}

uint64_t __61__NDOCoverageCentralViewController_handleURL_withCompletion___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[NDOCoverageCentralViewController shouldDeferPushForSpecifierID:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s specifierId:%@", (uint8_t *)&v6, 0x16u);
  }

  return 0;
}

- (void)handlePurchaseCompleted
{
}

- (void)_refreshAndForcePostFollowUp:(BOOL)a3 refreshControlToStop:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[NDOCoverageCentralViewController _refreshAndForcePostFollowUp:refreshControlToStop:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  id v15 = [(NDOCoverageCentralViewController *)self table];
  int v16 = [v15 isHidden];

  if (v16) {
    [(NDOCoverageCentralViewController *)self _setContentUnavailableConfiguration:self->_loadingConfig];
  }
  objc_initWeak(&location, self);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke;
  v23[3] = &unk_264D49B78;
  objc_copyWeak(&v25, &location);
  v23[4] = self;
  id v17 = v6;
  id v24 = v17;
  uint64_t v18 = MEMORY[0x23EC93640](v23);
  objc_super v19 = (void *)v18;
  if (v4)
  {
    int v20 = [(NDOCoverageCentralViewController *)self ndoManager];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_3;
    v21[3] = &unk_264D497E8;
    id v22 = v19;
    [v20 clearAllUserInitiatedFollowUpDismissalsWithReply:v21];
  }
  else
  {
    (*(void (**)(uint64_t))(v18 + 16))(v18);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = [a1[4] sessionID];
  BOOL v4 = [a1[4] deeplinkParams];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_2;
  v5[3] = &unk_264D49B50;
  id v6 = a1[5];
  [WeakRetained fetchAllDeviceInfoUsingPolicy:2 sessionID:v3 params:v4 isSales:0 withReply:v5];
}

uint64_t __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endRefreshing];
}

uint64_t __86__NDOCoverageCentralViewController__refreshAndForcePostFollowUp_refreshControlToStop___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_refresh:(id)a3
{
  [(NDOCoverageCentralViewController *)self _refreshAndForcePostFollowUp:a3 != 0 refreshControlToStop:a3];
}

- (void)resetAll
{
  v2 = [(NDOCoverageCentralViewController *)self deviceInfoDict];
  [v2 removeAllObjects];

  id v3 = +[NDOImageManager sharedManager];
  [v3 resetCache];
}

- (BOOL)shouldShowDeviceListUI
{
  v2 = [(NDOCoverageCentralViewController *)self deviceListAPISections];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)showUI
{
}

- (void)_getUpdatedParamsFromPath:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  ndoManager = self->_ndoManager;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__NDOCoverageCentralViewController__getUpdatedParamsFromPath_withCompletion___block_invoke;
  v9[3] = &unk_264D49BA0;
  id v10 = v6;
  id v8 = v6;
  [(NDOCoverageCentralVCManager *)ndoManager getDecodedParamsForPath:a3 withReply:v9];
}

void __77__NDOCoverageCentralViewController__getUpdatedParamsFromPath_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  uint64_t v14 = v3;
  if (v3) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = &stru_26EB85580;
  }
  uint64_t v5 = [MEMORY[0x263F089D8] stringWithString:v4];
  id v6 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 6)
  {
    id v8 = @"VisionPro";
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    id v8 = @"iPhone";
    if (v10 == 1) {
      id v8 = @"iPad";
    }
  }
  uint64_t v11 = [NSString stringWithFormat:@"lobType=%@", v8];
  if (v14 && ([(__CFString *)v14 isEqualToString:&stru_26EB85580] & 1) == 0) {
    [v5 appendString:@"&"];
  }
  [v5 appendString:v11];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = (void *)[v5 copy];
  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
}

- (id)_getParamsDictFromPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263EFF9A0] dictionary];
  int v16 = v3;
  uint64_t v5 = [v3 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v10 count] == 2)
        {
          uint64_t v11 = [v10 firstObject];
          uint64_t v12 = [v11 stringByRemovingPercentEncoding];

          uint64_t v13 = [v10 lastObject];
          uint64_t v14 = [v13 stringByRemovingPercentEncoding];

          [v4 setObject:v14 forKey:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)openAMSUIWithURL:(id)a3 httpBody:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v34 = [(NDOCoverageCentralViewController *)self deeplinkParams];
    *(_DWORD *)long long buf = 136446978;
    v36 = "-[NDOCoverageCentralViewController openAMSUIWithURL:httpBody:]";
    __int16 v37 = 2112;
    id v38 = v6;
    __int16 v39 = 2112;
    id v40 = v7;
    __int16 v41 = 2112;
    v42 = v34;
    _os_log_debug_impl(&dword_238845000, v8, OS_LOG_TYPE_DEBUG, "%{public}s: url: %@, httpBody: %@, deeplinkParams: %@", buf, 0x2Au);
  }
  uint64_t v9 = [(NDOCoverageCentralViewController *)self deviceInfoDict];
  uint64_t v10 = [(NDOCoverageCentralViewController *)self defaultDevice];
  uint64_t v11 = [v10 serialNumber];
  uint64_t v12 = [v9 objectForKeyedSubscript:v11];

  uint64_t v13 = [NDOAppleCareAMSUIViewController alloc];
  uint64_t v14 = [v12 warranty];
  id v15 = [(NDOCoverageCentralViewController *)self defaultDevice];
  int v16 = [v15 serialNumber];
  long long v17 = [NSString stringWithFormat:@"%@%@", @"LINK", @"_COVERAGE_CENTRAL"];
  long long v18 = [(NDOCoverageCentralViewController *)self deeplinkParams];
  long long v19 = [(NDOAppleCareAMSUIViewController *)v13 initWithWarranty:v14 serialNumber:v16 source:v17 url:v6 purchaseBody:v7 deeplinkParams:v18];
  [(NDOCoverageCentralViewController *)self setAmsUIVC:v19];

  long long v20 = [(NDOCoverageCentralViewController *)self amsUIVC];
  [v20 setPresenter:self];

  id v21 = [MEMORY[0x263F82670] currentDevice];
  if ([v21 userInterfaceIdiom] == 6)
  {

LABEL_6:
    id v24 = [(NDOCoverageCentralViewController *)self amsUIVC];
    id v25 = v24;
    uint64_t v26 = 2;
    goto LABEL_8;
  }
  uint64_t v22 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if (v23 == 1) {
    goto LABEL_6;
  }
  id v24 = [(NDOCoverageCentralViewController *)self amsUIVC];
  id v25 = v24;
  uint64_t v26 = 0;
LABEL_8:
  [v24 setModalPresentationStyle:v26];

  long long v27 = [(NDOCoverageCentralViewController *)self amsUIVC];
  [v27 setModalInPresentation:1];

  id v28 = objc_alloc(MEMORY[0x263F829B8]);
  id v29 = [(NDOCoverageCentralViewController *)self amsUIVC];
  objc_super v30 = (void *)[v28 initWithRootViewController:v29];

  __int16 v31 = [MEMORY[0x263F82670] currentDevice];
  if ([v31 userInterfaceIdiom] == 6)
  {

LABEL_11:
    [v30 setModalPresentationStyle:2];
    goto LABEL_12;
  }
  unint64_t v32 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v33 = [v32 userInterfaceIdiom];

  if (v33 == 1) {
    goto LABEL_11;
  }
LABEL_12:
  [v30 setModalInPresentation:1];
  [(NDOCoverageCentralViewController *)self presentViewController:v30 animated:1 completion:0];
}

- (id)_noAccountConfig
{
  v2 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  id v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  BOOL v4 = [v3 localizedStringForKey:@"CC_NO_ACCOUNT_ERROR_TITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v2 setText:v4];

  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  id v6 = [v5 localizedStringForKey:@"CC_NO_ACCOUNT_ERROR_SUBTITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v2 setSecondaryText:v6];

  id v7 = [MEMORY[0x263F827E8] systemImageNamed:@"person.crop.circle"];
  [v2 setImage:v7];

  return v2;
}

- (id)_errorStateConfig
{
  id v3 = [MEMORY[0x263F82600] emptyProminentConfiguration];
  BOOL v4 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  uint64_t v5 = [v4 localizedStringForKey:@"CC_ISSUE_ERROR_TITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v3 setText:v5];

  id v6 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  id v7 = [v6 localizedStringForKey:@"CC_ISSUE_ERROR_SUBTITLE" value:&stru_26EB85580 table:@"Localizable"];
  [v3 setSecondaryText:v7];

  uint64_t v8 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill"];
  [v3 setImage:v8];

  uint64_t v9 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  uint64_t v10 = [v3 buttonProperties];
  [v10 setConfiguration:v9];

  uint64_t v11 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
  uint64_t v12 = [v11 localizedStringForKey:@"CC_RETRY" value:&stru_26EB85580 table:@"Localizable"];
  uint64_t v13 = [v3 buttonProperties];
  uint64_t v14 = [v13 configuration];
  [v14 setTitle:v12];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__NDOCoverageCentralViewController__errorStateConfig__block_invoke;
  v18[3] = &unk_264D49900;
  v18[4] = self;
  id v15 = [MEMORY[0x263F823D0] actionWithHandler:v18];
  int v16 = [v3 buttonProperties];
  [v16 setPrimaryAction:v15];

  return v3;
}

uint64_t __53__NDOCoverageCentralViewController__errorStateConfig__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refresh:0];
}

- (void)completeWithStatus:(unint64_t)a3
{
}

- (void)dismissAMSUI
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__NDOCoverageCentralViewController_dismissAMSUI__block_invoke;
  v2[3] = &unk_264D495D0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__NDOCoverageCentralViewController_dismissAMSUI__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    uint64_t v5 = "-[NDOCoverageCentralViewController dismissAMSUI]_block_invoke";
    _os_log_impl(&dword_238845000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [WeakRetained amsUIVC];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [WeakRetained setAmsUIVC:0];
}

- (void)completeWithStatus:(unint64_t)a3 params:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446722;
    long long v27 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
    __int16 v28 = 2048;
    unint64_t v29 = a3;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_238845000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: status: %lu, params: %@", buf, 0x20u);
  }

  char v8 = 0;
  if (a3 <= 5 && ((1 << a3) & 0x2C) != 0)
  {
    uint64_t v9 = _NDOLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v27 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
      _os_log_impl(&dword_238845000, v9, OS_LOG_TYPE_DEFAULT, "%s: refreshing summary api", buf, 0xCu);
    }

    uint64_t v10 = [v6 objectForKey:@"deviceSeq"];
    if (v10
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (unsigned int v11 = [v10 intValue], (v11 & 0x80000000) == 0)
      && ([(NDOCoverageCentralViewController *)self allLocalDevices],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          BOOL v13 = [v12 count] > (unint64_t)v11,
          v12,
          v13))
    {
      uint64_t v14 = [(NDOCoverageCentralViewController *)self allLocalDevices];
      id v15 = [v14 objectAtIndexedSubscript:v11];

      ndoManager = self->_ndoManager;
      long long v17 = [v15 serialNumber];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke;
      v24[3] = &unk_264D49538;
      id v18 = v15;
      id v25 = v18;
      [(NDOCoverageCentralVCManager *)ndoManager dismissFollowUpForSerialNumber:v17 completion:v24];

      objc_initWeak((id *)buf, self);
      long long v19 = [(NDOCoverageCentralViewController *)self deeplinkParams];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke_165;
      v22[3] = &unk_264D49BC8;
      objc_copyWeak(&v23, (id *)buf);
      [(NDOCoverageCentralViewController *)self updateDeviceInfoForDevice:v18 usingPolicy:2 params:v19 forceUpdateFollowup:1 withReply:v22];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);

      char v8 = 1;
    }
    else
    {
      char v8 = 0;
    }
  }
  if (a3 != 5 || (v8 & 1) != 0)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      [(NDOCoverageCentralViewController *)self dismissAMSUI];
      id v21 = _NDOLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v27 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
        _os_log_impl(&dword_238845000, v21, OS_LOG_TYPE_DEFAULT, "%s: dismissing amsui", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v20 = _NDOLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v27 = "-[NDOCoverageCentralViewController completeWithStatus:params:]";
      _os_log_impl(&dword_238845000, v20, OS_LOG_TYPE_DEFAULT, "%s: refreshing device list", buf, 0xCu);
    }

    [(NDOCoverageCentralViewController *)self _refreshAndForcePostFollowUp:0 refreshControlToStop:0];
  }
}

void __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      uint64_t v5 = @"Dismissed";
    }
    else {
      uint64_t v5 = @"Failed to dismiss";
    }
    id v6 = [*(id *)(a1 + 32) serialNumber];
    int v7 = 138543618;
    char v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_238845000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ followup up for %@", (uint8_t *)&v7, 0x16u);
  }
}

void __62__NDOCoverageCentralViewController_completeWithStatus_params___block_invoke_165(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

- (NDOACController)acController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_acController);
  return (NDOACController *)WeakRetained;
}

- (void)setAcController:(id)a3
{
}

- (BOOL)openDefaultDeviceDetails
{
  return self->_openDefaultDeviceDetails;
}

- (void)setOpenDefaultDeviceDetails:(BOOL)a3
{
  self->_openDefaultDeviceDetails = a3;
}

- (BOOL)isFromDeeplink
{
  return self->_isFromDeeplink;
}

- (void)setIsFromDeeplink:(BOOL)a3
{
  self->_isFromDeeplink = a3;
}

- (BOOL)expectingLink
{
  return self->_expectingLink;
}

- (void)setExpectingLink:(BOOL)a3
{
  self->_expectingLink = a3;
}

- (NSString)deeplinkParams
{
  return (NSString *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setDeeplinkParams:(id)a3
{
}

- (NSString)ulSalesURL
{
  return (NSString *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setUlSalesURL:(id)a3
{
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setSessionID:(id)a3
{
}

- (NDOCoverageCentralVCManager)ndoManager
{
  return self->_ndoManager;
}

- (void)setNdoManager:(id)a3
{
}

- (NDODevice)defaultDevice
{
  return self->_defaultDevice;
}

- (void)setDefaultDevice:(id)a3
{
}

- (NSMutableArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
}

- (NSMutableArray)allLocalDevices
{
  return self->_allLocalDevices;
}

- (void)setAllLocalDevices:(id)a3
{
}

- (NSArray)deviceListAPISections
{
  return self->_deviceListAPISections;
}

- (void)setDeviceListAPISections:(id)a3
{
}

- (BOOL)deviceLoadCompleted
{
  return self->_deviceLoadCompleted;
}

- (void)setDeviceLoadCompleted:(BOOL)a3
{
  self->_deviceLoadCompleted = a3;
}

- (NSMutableDictionary)deviceInfoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setDeviceInfoDict:(id)a3
{
}

- (NSMutableDictionary)deviceSequenceDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 1496, 1);
}

- (void)setDeviceSequenceDict:(id)a3
{
}

- (NDOAppleCareAMSUIViewController)amsUIVC
{
  return self->_amsUIVC;
}

- (void)setAmsUIVC:(id)a3
{
}

- (BOOL)isSignedIn
{
  return self->_isSignedIn;
}

- (void)setIsSignedIn:(BOOL)a3
{
  self->_isSignedIn = a3;
}

- (id)onViewIsAppearing
{
  return self->_onViewIsAppearing;
}

- (void)setOnViewIsAppearing:(id)a3
{
}

- (BOOL)launchedWithUrl
{
  return self->_launchedWithUrl;
}

- (void)setLaunchedWithUrl:(BOOL)a3
{
  self->_launchedWithUrl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onViewIsAppearing, 0);
  objc_storeStrong((id *)&self->_amsUIVC, 0);
  objc_storeStrong((id *)&self->_deviceSequenceDict, 0);
  objc_storeStrong((id *)&self->_deviceInfoDict, 0);
  objc_storeStrong((id *)&self->_deviceListAPISections, 0);
  objc_storeStrong((id *)&self->_allLocalDevices, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_defaultDevice, 0);
  objc_storeStrong((id *)&self->_ndoManager, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_ulSalesURL, 0);
  objc_storeStrong((id *)&self->_deeplinkParams, 0);
  objc_destroyWeak((id *)&self->_acController);
  objc_storeStrong((id *)&self->_loadingConfig, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_policyLookupQueue, 0);
}

- (void)init
{
}

- (void)initWithIsSignedIn:(uint64_t)a3 deviceManager:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __44__NDOCoverageCentralViewController_loadView__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "launchedWithUrl"));
  v5[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_238845000, a2, v4, "%{public}s: On appear block. Launch url:%@ ", (uint8_t *)v5);
}

- (void)specifiers
{
}

- (void)updateCells
{
}

- (void)openURL:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_238845000, v0, v1, "%{public}s: Opening url: %@", (uint8_t *)v2);
}

- (void)fetchAllDeviceInfoUsingPolicy:(uint64_t)a3 sessionID:(uint64_t)a4 params:(uint64_t)a5 isSales:(uint64_t)a6 withReply:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchAllDeviceInfoUsingPolicy:(uint64_t)a3 sessionID:(uint64_t)a4 params:(uint64_t)a5 isSales:(uint64_t)a6 withReply:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchAllDeviceInfoUsingPolicy:(NSObject *)a3 sessionID:params:isSales:withReply:.cold.3(void *a1, char a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 136446722;
  uint64_t v6 = "-[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:]";
  __int16 v7 = 2082;
  uint64_t v8 = [a1 UTF8String];
  __int16 v9 = 1026;
  int v10 = a2 & 1;
  _os_log_debug_impl(&dword_238845000, a3, OS_LOG_TYPE_DEBUG, "%{public}s: params:%{public}s isSales:%{public}d", (uint8_t *)&v5, 0x1Cu);
}

void __101__NDOCoverageCentralViewController_fetchAllDeviceInfoUsingPolicy_sessionID_params_isSales_withReply___block_invoke_2_74_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136446466;
  int v5 = "-[NDOCoverageCentralViewController fetchAllDeviceInfoUsingPolicy:sessionID:params:isSales:withReply:]_block_invoke_2";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  OUTLINED_FUNCTION_4(&dword_238845000, a2, a3, "%{public}s: getDeviceListForLocalDevices reply: %@", (uint8_t *)&v4);
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v3 = [a1 serialNumber];
  int v4 = [a2 warranty];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_238845000, v5, v6, "%{public}s: updated sn: %@ with warranty: %@", v7, v8, v9, v10, 2u);
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_2(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 serialNumber];
  uint64_t v6 = [a1 warranty];
  int v7 = 136446978;
  uint64_t v8 = "-[NDOCoverageCentralViewController getAllDeviceInfoUsingPolicy:sessionID:params:isSales:andForcePostFollowup:with"
       "Reply:]_block_invoke";
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v5;
  __int16 v13 = 2112;
  uint64_t v14 = v6;
  _os_log_debug_impl(&dword_238845000, a3, OS_LOG_TYPE_DEBUG, "%{public}s: updated: %@ for sn: %@ with warranty: %@", (uint8_t *)&v7, 0x2Au);
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_3(void *a1, void *a2)
{
  uint64_t v3 = [a1 serialNumber];
  int v4 = [a2 warranty];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_238845000, v5, v6, "%{public}s: sn: %@ with warranty: %@", v7, v8, v9, v10, 2u);
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_2_cold_4(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a2 + 32) serialNumber];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_238845000, v3, v4, "%{public}s: updating deviceInfo: %@ for sn: %@", v5, v6, v7, v8, 2u);
}

void __120__NDOCoverageCentralViewController_getAllDeviceInfoUsingPolicy_sessionID_params_isSales_andForcePostFollowup_withReply___block_invoke_80_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getDeviceInfoForSerialNumber:(uint64_t)a3 usingPolicy:(uint64_t)a4 sessionID:(uint64_t)a5 params:(uint64_t)a6 andForcePostFollowup:(uint64_t)a7 withReply:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateDeviceInfoForDevice:usingPolicy:params:forceUpdateFollowup:withReply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4(&dword_238845000, v0, v1, "%{public}s: for device: %@", (uint8_t *)v2);
}

void __111__NDOCoverageCentralViewController_updateDeviceInfoForDevice_usingPolicy_params_forceUpdateFollowup_withReply___block_invoke_2_82_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) device];
  v2 = [v1 serialNumber];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_2(&dword_238845000, v3, v4, "%{public}s: updating deviceInfo: %@ for sn: %@", v5, v6, v7, v8, 2u);
}

- (void)_refreshAndForcePostFollowUp:(uint64_t)a3 refreshControlToStop:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end