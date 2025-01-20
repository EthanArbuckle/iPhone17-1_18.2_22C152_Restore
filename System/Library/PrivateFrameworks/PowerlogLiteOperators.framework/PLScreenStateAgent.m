@interface PLScreenStateAgent
+ (id)entryAggregateDefinitionForeground;
+ (id)entryAggregateDefinitionWidgetAdditionAnimation;
+ (id)entryAggregateDefinitionWidgetFlipAnimation;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionAlwaysOnEnableState;
+ (id)entryEventBackwardDefinitionBacklightStateChange;
+ (id)entryEventBackwardDefinitionFlipbookStatistics;
+ (id)entryEventBackwardDefinitionIconDragging;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardScreenState;
+ (id)entryEventForwardWindowMode;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointBacklightEvent;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)lastDisplayLayoutContainsLockScreen;
- (FBSDisplayLayout)lastDisplayLayout;
- (FBSDisplayLayoutMonitor)airPlayDisplayMonitor;
- (FBSDisplayLayoutMonitor)carPlayDisplayMonitor;
- (FBSDisplayLayoutMonitor)mainDisplayMonitor;
- (NSMutableDictionary)lastLayoutMonitorEntries;
- (NSMutableDictionary)lastScreenStateEntries;
- (PLEntryNotificationOperatorComposition)displayCallback;
- (PLScreenStateAgent)init;
- (PLXPCListenerOperatorComposition)iconDraggingListner;
- (PLXPCListenerOperatorComposition)springBoardAlwaysOnEnableStateListener;
- (PLXPCListenerOperatorComposition)springBoardBacklightStateChangeListener;
- (PLXPCListenerOperatorComposition)springBoardFlipbookStatisticsListener;
- (PLXPCListenerOperatorComposition)widgetAdditionAnimationListener;
- (PLXPCListenerOperatorComposition)widgetFlipAnimationListener;
- (PLXPCListenerOperatorComposition)windowModeListener;
- (PLXPCResponderOperatorComposition)springBoardAlwaysOnEnableStateResponder;
- (PLXPCResponderOperatorComposition)springBoardBacklightStateChangeResponder;
- (PLXPCResponderOperatorComposition)springBoardFlipbookStatisticsResponder;
- (id)processQuery:(id)a3 withEntryKey:(id)a4;
- (int)GetBacklightState:(id)a3;
- (int)displayState;
- (unint64_t)convertWindowingMode:(id)a3;
- (unint64_t)convertZoomLevel:(id)a3;
- (void)accountWithLayoutEntries:(id)a3;
- (void)createAirPlayWiFiAccountingEvent:(id)a3;
- (void)createCarPlayAccountingEvents:(id)a3;
- (void)dealloc;
- (void)handleDisplayCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)log;
- (void)logAggregateWidgetAdditionAnimation:(id)a3;
- (void)logAggregateWidgetFlipAnimation:(id)a3;
- (void)logEventBackwardAlwaysOnEnableState:(id)a3;
- (void)logEventBackwardBacklightStateChange:(id)a3;
- (void)logEventBackwardFlipbookStatistics:(id)a3;
- (void)logEventBackwardIconDragging:(id)a3;
- (void)logEventForwardAirPlayScreenState:(id)a3;
- (void)logEventForwardCarScreenState:(id)a3;
- (void)logEventForwardMainScreenState:(id)a3;
- (void)logEventForwardWindowMode:(id)a3;
- (void)logEventPointMainBacklightEvent:(id)a3 withContext:(id)a4;
- (void)postEnhancedScreenStateNotification:(id)a3 currentLayout:(id)a4;
- (void)setAirPlayDisplayMonitor:(id)a3;
- (void)setCarPlayDisplayMonitor:(id)a3;
- (void)setDisplayCallback:(id)a3;
- (void)setDisplayState:(int)a3;
- (void)setIconDraggingListner:(id)a3;
- (void)setLastDisplayLayout:(id)a3;
- (void)setLastDisplayLayoutContainsLockScreen:(BOOL)a3;
- (void)setLastLayoutMonitorEntries:(id)a3;
- (void)setLastScreenStateEntries:(id)a3;
- (void)setMainDisplayMonitor:(id)a3;
- (void)setSpringBoardAlwaysOnEnableStateListener:(id)a3;
- (void)setSpringBoardAlwaysOnEnableStateResponder:(id)a3;
- (void)setSpringBoardBacklightStateChangeListener:(id)a3;
- (void)setSpringBoardBacklightStateChangeResponder:(id)a3;
- (void)setSpringBoardFlipbookStatisticsListener:(id)a3;
- (void)setSpringBoardFlipbookStatisticsResponder:(id)a3;
- (void)setWidgetAdditionAnimationListener:(id)a3;
- (void)setWidgetFlipAnimationListener:(id)a3;
- (void)setWindowModeListener:(id)a3;
@end

@implementation PLScreenStateAgent

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke(uint64_t a1)
{
  v129[2] = *MEMORY[0x1E4F143B8];
  v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v94 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    *(void *)v122 = v94;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "calling logEventForwardMainScreenState with displayLayout=%@", buf, 0xCu);
  }

  if (!*(void *)(a1 + 32)) {
    return;
  }
  v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v95 = [MEMORY[0x1E4F92A38] hasAOD];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v122 = v95;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "screenState - hasAOD=%d", buf, 8u);
  }

  if ((!_os_feature_enabled_impl() || ([MEMORY[0x1E4F92A38] hasAOD] & 1) == 0)
    && [*(id *)(a1 + 32) displayBacklightLevel] < 1)
  {
    return;
  }
  v108 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  v107 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) bounds];
  double v5 = v4;
  [*(id *)(a1 + 32) bounds];
  double v7 = v6;
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"level" ascending:0];
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"layoutRole" ascending:0];
  v10 = [*(id *)(a1 + 32) elements];
  v98 = (void *)v9;
  v99 = (void *)v8;
  v129[0] = v8;
  v129[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:2];
  v12 = [v10 sortedArrayUsingDescriptors:v11];

  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  v104 = [MEMORY[0x1E4F1CA60] dictionary];
  v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v96 = _os_feature_enabled_impl();
    int v97 = [MEMORY[0x1E4F92A38] hasAOD];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v122 = v96;
    *(_WORD *)&v122[4] = 1024;
    *(_DWORD *)&v122[6] = v97;
    _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "dts runtime ff enabled=%d, [PLPlatform hasAOD]=%d]", buf, 0xEu);
  }
  v102 = (void *)v13;

  if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD]) {
    [*(id *)(a1 + 40) setLastDisplayLayoutContainsLockScreen:0];
  }
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id obj = v12;
  uint64_t v106 = [obj countByEnumeratingWithState:&v109 objects:v128 count:16];
  if (!v106) {
    goto LABEL_62;
  }
  double v15 = v5 * v7;
  uint64_t v105 = *(void *)v110;
  uint64_t v100 = *MEMORY[0x1E4F625B0];
  double v16 = -1.0;
  double v17 = 0.0;
  uint64_t v103 = a1;
  while (2)
  {
    for (uint64_t i = 0; i != v106; ++i)
    {
      if (*(void *)v110 != v105) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v109 + 1) + 8 * i);
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v108 withDate:v107];
      v21 = [v19 bundleIdentifier];
      if (v21) {
        [v19 bundleIdentifier];
      }
      else {
      v22 = [v19 identifier];
      }
      [v20 setObject:v22 forKeyedSubscript:@"bundleID"];

      v23 = [v20 objectForKeyedSubscript:@"bundleID"];

      if (!v23)
      {
        v48 = PLLogCommon();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D2690000, v48, OS_LOG_TYPE_ERROR, "Screen State element's bundleID/identifier is nil", buf, 2u);
        }
        goto LABEL_45;
      }
      if (_os_feature_enabled_impl())
      {
        if ([MEMORY[0x1E4F92A38] hasAOD])
        {
          v24 = [v20 objectForKeyedSubscript:@"bundleID"];
          int v25 = [v24 isEqualToString:v100];

          if (v25)
          {
            [*(id *)(a1 + 40) setLastDisplayLayoutContainsLockScreen:1];
            v26 = PLLogCommon();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              v75 = [v20 objectForKeyedSubscript:@"bundleID"];
              int v76 = [*(id *)(a1 + 40) displayState];
              *(_DWORD *)buf = 138412802;
              *(void *)v122 = v75;
              *(_WORD *)&v122[8] = 2112;
              v123 = v20;
              __int16 v124 = 1024;
              LODWORD(v125) = v76;
              _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "element bundleID=%@, entry=%@, displayState=%d", buf, 0x1Cu);
            }
            if ([*(id *)(a1 + 40) displayState] == 2)
            {
              v27 = [NSString stringWithFormat:@"%@.%@", v100, @"aod"];
              [v20 setObject:v27 forKeyedSubscript:@"bundleID"];

              v28 = PLLogCommon();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v122 = v20;
                _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "entry after transformation = %@", buf, 0xCu);
              }
            }
          }
        }
      }
      v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "layoutRole"));
      [v20 setObject:v29 forKeyedSubscript:@"AppRole"];

      v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "displayType"));
      [v20 setObject:v30 forKeyedSubscript:@"Display"];

      v31 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
      [v20 setObject:v31 forKeyedSubscript:@"Orientation"];

      v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "level"));
      [v20 setObject:v32 forKeyedSubscript:@"Level"];

      [v19 frame];
      double v34 = v33;
      [v19 frame];
      double v36 = v34 * v35 / v15;
      v37 = [NSNumber numberWithDouble:v36];
      [v20 setObject:v37 forKeyedSubscript:@"ScreenWeight"];

      if (_os_feature_enabled_impl())
      {
        v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v70 = [v20 objectForKeyedSubscript:@"bundleID"];
          *(_DWORD *)buf = 138412290;
          *(void *)v122 = v70;
          _os_log_debug_impl(&dword_1D2690000, v38, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement currentEntry bundleID: %@", buf, 0xCu);
        }
        if ([*(id *)(*(void *)(a1 + 40) + 88) count])
        {
          v39 = PLLogCommon();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v74 = [v20 objectForKeyedSubscript:@"bundleID"];
            *(_DWORD *)buf = 138412290;
            *(void *)v122 = v74;
            _os_log_debug_impl(&dword_1D2690000, v39, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement searching for currentEntry bundleID in last Dictionary: %@", buf, 0xCu);
          }
          v40 = *(void **)(*(void *)(a1 + 40) + 88);
          v41 = [v20 objectForKeyedSubscript:@"bundleID"];
          v42 = [v40 objectForKey:v41];

          if (v42)
          {
            v126[0] = @"AppRole";
            v43 = objc_msgSend(v20, "objectForKeyedSubscript:");
            v127[0] = v43;
            v126[1] = @"Display";
            v44 = objc_msgSend(v20, "objectForKeyedSubscript:");
            v127[1] = v44;
            v126[2] = @"Orientation";
            v45 = objc_msgSend(v20, "objectForKeyedSubscript:");
            v127[2] = v45;
            v126[3] = @"Level";
            v46 = objc_msgSend(v20, "objectForKeyedSubscript:");
            v127[3] = v46;
            v126[4] = @"ScreenWeight";
            v47 = objc_msgSend(v20, "objectForKeyedSubscript:");
            v127[4] = v47;
            v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:5];

            a1 = v103;
            v49 = *(void **)(*(void *)(v103 + 40) + 88);
            v50 = [v20 objectForKeyedSubscript:@"bundleID"];
            v51 = [v49 objectForKey:v50];
            LODWORD(v45) = [v51 isEqualToDictionary:v48];

            if (v45)
            {
              v52 = PLLogCommon();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              {
                v77 = [v20 objectForKeyedSubscript:@"bundleID"];
                v78 = [v20 objectForKeyedSubscript:@"ScreenWeight"];
                v79 = [v20 objectForKeyedSubscript:@"Level"];
                *(_DWORD *)buf = 138412802;
                *(void *)v122 = v77;
                *(_WORD *)&v122[8] = 2112;
                v123 = v78;
                __int16 v124 = 2112;
                v125 = v79;
                _os_log_debug_impl(&dword_1D2690000, v52, OS_LOG_TYPE_DEBUG, "current FBSDisplayLayoutElement entry was already logged, skipping logging for  %@ with screenWeight %@ and Level: %@", buf, 0x20u);
              }
              v53 = [v20 objectForKeyedSubscript:@"bundleID"];
              [v104 setObject:v48 forKeyedSubscript:v53];

LABEL_45:
              goto LABEL_58;
            }
          }
        }
        v54 = PLLogCommon();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          v71 = [v20 objectForKeyedSubscript:@"bundleID"];
          v72 = [v20 objectForKeyedSubscript:@"ScreenWeight"];
          v73 = [v20 objectForKeyedSubscript:@"Level"];
          *(_DWORD *)buf = 138412802;
          *(void *)v122 = v71;
          *(_WORD *)&v122[8] = 2112;
          v123 = v72;
          __int16 v124 = 2112;
          v125 = v73;
          _os_log_debug_impl(&dword_1D2690000, v54, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement entries was not logged, logging %@ with screenWeight %@ and Level: %@", buf, 0x20u);
        }
        v119[0] = @"AppRole";
        v55 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v120[0] = v55;
        v119[1] = @"Display";
        v56 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v120[1] = v56;
        v119[2] = @"Orientation";
        v57 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v120[2] = v57;
        v119[3] = @"Level";
        v58 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v120[3] = v58;
        v119[4] = @"ScreenWeight";
        v59 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v120[4] = v59;
        v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:5];
        v61 = [v20 objectForKeyedSubscript:@"bundleID"];
        [v104 setObject:v60 forKeyedSubscript:v61];

        a1 = v103;
      }
      if ([MEMORY[0x1E4F929C0] taskMode])
      {
        v117[0] = @"AppRole";
        v62 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v118[0] = v62;
        v117[1] = @"Display";
        v63 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v118[1] = v63;
        v117[2] = @"Orientation";
        v64 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v118[2] = v64;
        v117[3] = @"Level";
        v65 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v118[3] = v65;
        v117[4] = @"ScreenWeight";
        v66 = objc_msgSend(v20, "objectForKeyedSubscript:");
        v118[4] = v66;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:5];
        v68 = [v20 objectForKeyedSubscript:@"bundleID"];
        [v104 setObject:v67 forKeyedSubscript:v68];

        a1 = v103;
      }
      [v102 addObject:v20];
      ++displaySync_block_invoke_screenStateEntriesCounter;
      v69 = PLLogCommon();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v122 = displaySync_block_invoke_screenStateEntriesCounter;
        _os_log_debug_impl(&dword_1D2690000, v69, OS_LOG_TYPE_DEBUG, "Logged %d FBSDisplayLayoutElement entries", buf, 8u);
      }

      if (v16 == (double)[v19 level]) {
        double v36 = v17 + v36;
      }
      else {
        double v16 = (double)[v19 level];
      }
      double v17 = v36;
      if (v36 >= 1.0)
      {

        goto LABEL_62;
      }
LABEL_58:
    }
    uint64_t v106 = [obj countByEnumeratingWithState:&v109 objects:v128 count:16];
    if (v106) {
      continue;
    }
    break;
  }
LABEL_62:

  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    [*(id *)(a1 + 40) postEnhancedScreenStateNotification:*(void *)(*(void *)(a1 + 40) + 96) currentLayout:v104];
    [*(id *)(*(void *)(a1 + 40) + 96) removeAllObjects];
    uint64_t v80 = [v104 mutableCopy];
    uint64_t v81 = *(void *)(a1 + 40);
    v82 = *(void **)(v81 + 96);
    *(void *)(v81 + 96) = v80;
  }
  int v83 = _os_feature_enabled_impl();
  v84 = *(id **)(a1 + 40);
  if (v83)
  {
    [v84[11] removeAllObjects];
    uint64_t v85 = [v104 mutableCopy];
    uint64_t v86 = *(void *)(a1 + 40);
    v87 = *(void **)(v86 + 88);
    *(void *)(v86 + 88) = v85;

    if ([v102 count])
    {
      v88 = *(void **)(a1 + 40);
      v115 = v108;
      v116 = v102;
      v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      [v88 logEntries:v89 withGroupID:v108];

      v90 = PLLogCommon();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v122 = v102;
        goto LABEL_78;
      }
      goto LABEL_69;
    }
    v90 = PLLogCommon();
    v93 = v98;
    v92 = v99;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v90, OS_LOG_TYPE_DEBUG, "LayoutEntries is empty", buf, 2u);
    }
  }
  else
  {
    v113 = v108;
    v114 = v102;
    v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    [v84 logEntries:v91 withGroupID:v108];

    v90 = PLLogCommon();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v122 = v102;
LABEL_78:
      _os_log_debug_impl(&dword_1D2690000, v90, OS_LOG_TYPE_DEBUG, "LayoutEntries: %@", buf, 0xCu);
    }
LABEL_69:
    v93 = v98;
    v92 = v99;
  }

  [*(id *)(a1 + 40) accountWithLayoutEntries:v102];
  if (_os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F92A38] hasAOD]) {
      [*(id *)(a1 + 40) setLastDisplayLayout:*(void *)(a1 + 32)];
    }
  }
}

- (void)setLastDisplayLayoutContainsLockScreen:(BOOL)a3
{
  self->_lastDisplayLayoutContainsLockScreen = a3;
}

- (void)setLastDisplayLayout:(id)a3
{
}

- (void)accountWithLayoutEntries:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = [MEMORY[0x1E4F1CA60] dictionary];
  double v5 = [v3 firstObject];
  double v6 = [v5 entryDate];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  uint64_t v9 = v7;
  if (!v8)
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v10 = v8;
  v31 = v6;
  uint64_t v11 = *(void *)v37;
  double v12 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      double v15 = [v14 objectForKeyedSubscript:@"bundleID"];
      if (v15)
      {
        double v16 = [v14 objectForKeyedSubscript:@"ScreenWeight"];
        [v4 setObject:v16 forKeyedSubscript:v15];

        double v17 = [v14 objectForKeyedSubscript:@"ScreenWeight"];
        [v17 doubleValue];
        double v12 = v12 + v18;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v10);

  if (v12 > 0.0 && v12 != 1.0)
  {
    uint64_t v9 = [v4 allKeys];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v19 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v9);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          v24 = NSNumber;
          int v25 = [v4 objectForKeyedSubscript:v23];
          [v25 doubleValue];
          v27 = [v24 numberWithDouble:v26 / v12];
          [v4 setObject:v27 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v20);
      double v6 = v31;
    }
    goto LABEL_20;
  }
LABEL_21:
  v28 = [MEMORY[0x1E4F92900] sharedInstance];
  [v28 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:v4 withStartDate:v6];

  v29 = [MEMORY[0x1E4F92900] sharedInstance];
  v30 = [v4 allKeys];
  [v29 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:v30 withStartDate:v6];
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v12 = [v8 transitionReason];
    uint64_t v13 = [v8 transitionReasons];
    int v14 = 138413058;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "calling didUpdateDisplayLayout=%@ with context=%@, transitionReason=%@, transitionReasons=%@", (uint8_t *)&v14, 0x2Au);
  }
  uint64_t v10 = [v8 transitionReason];
  unint64_t v11 = SBSBacklightChangeSourceForDisplayLayoutTransitionReason();

  if (!v11
    || ([(PLScreenStateAgent *)self logEventPointMainBacklightEvent:v7 withContext:v8], v11 > 0x1C)|| ((1 << v11) & 0x1A000050) == 0)
  {
    [(PLScreenStateAgent *)self logEventForwardMainScreenState:v7];
  }
}

- (void)logEventForwardMainScreenState:(id)a3
{
  id v4 = a3;
  double v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke;
  v7[3] = &unk_1E692B128;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLScreenStateAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  double v5 = @"BacklightEvent";
  objc_super v2 = [a1 entryEventPointBacklightEvent];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointBacklightEvent
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  uint64_t v13 = &unk_1F29F03D0;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"TransitionReason";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"BacklightLevel";
  v11[0] = v4;
  double v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ScreenState";
  id v3 = [a1 entryEventForwardScreenState];
  v7[1] = @"WindowMode";
  v8[0] = v3;
  id v4 = [a1 entryEventForwardWindowMode];
  v8[1] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventForwardScreenState
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F03E0;
  v22[1] = MEMORY[0x1E4F1CC38];
  v21[2] = *MEMORY[0x1E4F92C08];
  v22[2] = MEMORY[0x1E4F1CC38];
  __int16 v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"bundleID";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  __int16 v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v20[0] = v16;
  v19[1] = @"ScreenWeight";
  id v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v20[1] = v14;
  v19[2] = @"AppRole";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[2] = v4;
  v19[3] = @"Display";
  double v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v20[3] = v6;
  v19[4] = @"Level";
  id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v20[4] = v8;
  v19[5] = @"Orientation";
  uint64_t v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventForwardWindowMode
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    id v17 = &unk_1F29F03D0;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"displayType";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
    v15[0] = v3;
    v14[1] = @"zoomLevel";
    id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v15[1] = v5;
    void v14[2] = @"windowingMode";
    id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v15[2] = v7;
    v14[3] = @"canvasRatio";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    void v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IconDragging";
  id v3 = [a1 entryEventBackwardDefinitionIconDragging];
  v10[0] = v3;
  v9[1] = @"AlwaysOnEnableState";
  id v4 = [a1 entryEventBackwardDefinitionAlwaysOnEnableState];
  v10[1] = v4;
  v9[2] = @"BacklightStateChange";
  double v5 = [a1 entryEventBackwardDefinitionBacklightStateChange];
  void v10[2] = v5;
  v9[3] = @"FlipbookStatistics";
  id v6 = [a1 entryEventBackwardDefinitionFlipbookStatistics];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (int)GetBacklightState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"suppressed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"inactiveOnFlipbook"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"inactiveOnLiveFlipbook"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"inactiveOnLive"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"activeDimmed"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"active"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 7;
  }

  return v4;
}

+ (id)entryEventBackwardDefinitionIconDragging
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  unint64_t v11 = &unk_1F29F03D0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  id v8 = @"Duration";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  uint64_t v9 = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitionAlwaysOnEnableState
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CF8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F29F03F0;
    v18[1] = &unk_1F29E4D08;
    v17[2] = *MEMORY[0x1E4F92CF0];
    void v18[2] = &unk_1F29F0400;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"alwaysOnResolvedEnabled";
    id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v16[0] = v4;
    v15[1] = @"alwaysOnEnabledSetting";
    double v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v16[1] = v6;
    v15[2] = @"lowPowerMode";
    id v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
    v16[2] = v8;
    void v15[3] = @"focusMode";
    uint64_t v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
    v16[3] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionBacklightStateChange
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] hasAOD] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isDeviceClass:102040] & 1) != 0
    || [MEMORY[0x1E4F92A38] isDeviceClass:102041])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    id v17 = &unk_1F29F03F0;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"state";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v15[0] = v3;
    v14[1] = @"explanation";
    int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v15[1] = v5;
    void v14[2] = @"suppressionChangeType";
    id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v15[2] = v7;
    v14[3] = @"suppressionReasons";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
    void v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionFlipbookStatistics
{
  v59[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v58[0] = *MEMORY[0x1E4F92C50];
    uint64_t v56 = *MEMORY[0x1E4F92CD0];
    v57 = &unk_1F29F03D0;
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    v59[0] = v53;
    v58[1] = *MEMORY[0x1E4F92CA8];
    v54[0] = @"invalidatedFramesUpTo2mStale";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v55[0] = v51;
    v54[1] = @"invalidatedFramesUpTo3mStale";
    v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v55[1] = v49;
    v54[2] = @"invalidatedFramesUpTo4mStale";
    v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v55[2] = v47;
    v54[3] = @"invalidatedFramesUpTo5mStale";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v55[3] = v45;
    v54[4] = @"invalidatedFramesUpTo6mStale";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v55[4] = v43;
    v54[5] = @"discardedFramesUpTo2mStale";
    uint64_t v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v55[5] = v41;
    v54[6] = @"discardedFramesUpTo3mStale";
    v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v55[6] = v39;
    v54[7] = @"discardedFramesUpTo4mStale";
    long long v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v55[7] = v37;
    v54[8] = @"discardedFramesUpTo5mStale";
    long long v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v55[8] = v35;
    v54[9] = @"discardedFramesUpTo6mStale";
    long long v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    long long v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v55[9] = v33;
    v54[10] = @"renderedFramesLessThan1Min";
    long long v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v55[10] = v31;
    v54[11] = @"renderedFrames1to2Min";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v55[11] = v29;
    v54[12] = @"renderedFrames2to3Min";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v55[12] = v27;
    v54[13] = @"renderedFrames3to4Min";
    double v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v55[13] = v25;
    v54[14] = @"renderedFrames4to5Min";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v55[14] = v23;
    v54[15] = @"renderedFrames5to6Min";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v55[15] = v21;
    v54[16] = @"renderedFramesMoreThan6Min";
    __int16 v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v55[16] = v19;
    v54[17] = @"renderedFrameCount";
    __int16 v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v55[17] = v17;
    v54[18] = @"renderedPartialMinuteCount";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v55[18] = v15;
    v54[19] = @"millisecondsDisplayOff";
    int v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v55[19] = v13;
    v54[20] = @"millisecondsDisplayOn";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v55[20] = v3;
    v54[21] = @"millisecondsDisplayDimmed";
    int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    double v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v55[21] = v5;
    v54[22] = @"millisecondsShowingAOT";
    id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v55[22] = v7;
    v54[23] = @"millisecondsSuppressed";
    id v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v55[23] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:24];
    v59[1] = v10;
    unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  }
  else
  {
    unint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"WidgetAdditionAnimation";
  id v3 = [a1 entryAggregateDefinitionWidgetAdditionAnimation];
  v7[1] = @"WidgetFlipAnimation";
  v8[0] = v3;
  int v4 = [a1 entryAggregateDefinitionWidgetFlipAnimation];
  v8[1] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryAggregateDefinitionWidgetAdditionAnimation
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F03D0;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E4F92CA8];
  id v15 = @"Count";
  int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  uint64_t v16 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v20[1] = v6;
  void v19[2] = *MEMORY[0x1E4F92BE0];
  uint64_t v13 = &unk_1F29F0410;
  uint64_t v11 = *MEMORY[0x1E4F92BD8];
  uint64_t v12 = &unk_1F29F0400;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  int v14 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  void v19[3] = *MEMORY[0x1E4F92BF0];
  v20[2] = v8;
  v20[3] = &unk_1F29ED730;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v9;
}

+ (id)entryAggregateDefinitionWidgetFlipAnimation
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F03D0;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E4F92CA8];
  id v15 = @"Count";
  int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  uint64_t v16 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v20[1] = v6;
  void v19[2] = *MEMORY[0x1E4F92BE0];
  uint64_t v13 = &unk_1F29F0410;
  uint64_t v11 = *MEMORY[0x1E4F92BD8];
  uint64_t v12 = &unk_1F29F0400;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  int v14 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  void v19[3] = *MEMORY[0x1E4F92BF0];
  v20[2] = v8;
  v20[3] = &unk_1F29ED748;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v9;
}

+ (id)entryAggregateDefinitionForeground
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLScreenStateAgent)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) != 0)
  {
    id v3 = 0;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)PLScreenStateAgent;
    int v4 = [(PLAgent *)&v25 init];
    double v5 = v4;
    if (v4)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __26__PLScreenStateAgent_init__block_invoke_2;
      aBlock[3] = &unk_1E692B150;
      id v6 = v4;
      v24 = v6;
      id v7 = _Block_copy(aBlock);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      __int16 v20 = __26__PLScreenStateAgent_init__block_invoke_4;
      uint64_t v21 = &unk_1E692B150;
      id v8 = v6;
      uint64_t v22 = v8;
      uint64_t v9 = _Block_copy(&v18);
      id v10 = objc_alloc(MEMORY[0x1E4F62940]);
      uint64_t v11 = objc_msgSend(v10, "initWithDisplayType:qualityOfService:handler:", 0, 17, &__block_literal_global_219, v18, v19, v20, v21);
      id v12 = v8[7];
      v8[7] = (id)v11;

      [v8[7] addObserver:v8];
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F62940]) initWithDisplayType:3 qualityOfService:17 handler:v7];
      id v14 = v8[9];
      v8[9] = (id)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F62940]) initWithDisplayType:1 qualityOfService:17 handler:v9];
      id v16 = v8[8];
      v8[8] = (id)v15;
    }
    self = v5;
    id v3 = self;
  }

  return v3;
}

void __26__PLScreenStateAgent_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) workQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_3;
    v5[3] = &unk_1E692B128;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventForwardCarScreenState:*(void *)(a1 + 40)];
}

void __26__PLScreenStateAgent_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) workQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_5;
    v5[3] = &unk_1E692B128;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventForwardAirPlayScreenState:*(void *)(a1 + 40)];
}

- (void)initOperatorDependancies
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    id v3 = [MEMORY[0x1E4F929C0] objectForKey:@"SBEnableAlwaysOn" forApplicationID:@"com.apple.springboard" synchronize:1];
    uint64_t v4 = [v3 BOOLValue];

    double v5 = PLLogScreenState();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v53 = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "initial state for EnableAlwaysOn is %d", buf, 8u);
    }

    v50 = @"alwaysOnEnabledSetting";
    id v6 = [NSNumber numberWithBool:v4];
    v51 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];

    [(PLScreenStateAgent *)self logEventBackwardAlwaysOnEnableState:v7];
  }
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
  {
    if ([MEMORY[0x1E4F92A38] isiPad])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke;
      v49[3] = &unk_1E692A6F8;
      v49[4] = self;
      uint64_t v9 = (void *)[v8 initWithOperator:self withRegistration:&unk_1F29E8CD0 withBlock:v49];
      [(PLScreenStateAgent *)self setWindowModeListener:v9];
    }
    if (([MEMORY[0x1E4F929C0] fullMode] & 1) != 0
      || [MEMORY[0x1E4F929C0] taskMode])
    {
      id v10 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_245;
      v48[3] = &unk_1E692A6F8;
      v48[4] = self;
      uint64_t v11 = (void *)[v10 initWithOperator:self withRegistration:&unk_1F29E8CF8 withBlock:v48];
      [(PLScreenStateAgent *)self setIconDraggingListner:v11];

      id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_250;
      v47[3] = &unk_1E692A6F8;
      v47[4] = self;
      uint64_t v13 = (void *)[v12 initWithOperator:self withRegistration:&unk_1F29E8D20 withBlock:v47];
      [(PLScreenStateAgent *)self setWidgetAdditionAnimationListener:v13];

      id v14 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_255;
      v46[3] = &unk_1E692A6F8;
      v46[4] = self;
      uint64_t v15 = (void *)[v14 initWithOperator:self withRegistration:&unk_1F29E8D48 withBlock:v46];
      [(PLScreenStateAgent *)self setWidgetFlipAnimationListener:v15];
    }
    id v16 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_260;
    v45[3] = &unk_1E692A6F8;
    v45[4] = self;
    id v17 = (void *)[v16 initWithOperator:self withRegistration:&unk_1F29E8D70 withBlock:v45];
    [(PLScreenStateAgent *)self setSpringBoardAlwaysOnEnableStateListener:v17];

    id v18 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_265;
    v44[3] = &unk_1E692A6F8;
    v44[4] = self;
    uint64_t v19 = (void *)[v18 initWithOperator:self withRegistration:&unk_1F29E8D98 withBlock:v44];
    [(PLScreenStateAgent *)self setSpringBoardBacklightStateChangeListener:v19];

    id v20 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_270;
    v43[3] = &unk_1E692A6F8;
    v43[4] = self;
    uint64_t v21 = (void *)[v20 initWithOperator:self withRegistration:&unk_1F29E8DC0 withBlock:v43];
    [(PLScreenStateAgent *)self setSpringBoardFlipbookStatisticsListener:v21];

    if ([MEMORY[0x1E4F92A38] internalBuild])
    {
      id v22 = objc_alloc(MEMORY[0x1E4F92AA8]);
      uint64_t v23 = [(PLOperator *)self workQueue];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276;
      v42[3] = &unk_1E692A118;
      v42[4] = self;
      v24 = (void *)[v22 initWithWorkQueue:v23 withRegistration:&unk_1F29E8DE8 withBlock:v42];
      [(PLScreenStateAgent *)self setSpringBoardAlwaysOnEnableStateResponder:v24];

      id v25 = objc_alloc(MEMORY[0x1E4F92AA8]);
      double v26 = [(PLOperator *)self workQueue];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286;
      v41[3] = &unk_1E692A118;
      v41[4] = self;
      v27 = (void *)[v25 initWithWorkQueue:v26 withRegistration:&unk_1F29E8E10 withBlock:v41];
      [(PLScreenStateAgent *)self setSpringBoardBacklightStateChangeResponder:v27];

      id v28 = objc_alloc(MEMORY[0x1E4F92AA8]);
      v29 = [(PLOperator *)self workQueue];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294;
      v40[3] = &unk_1E692A118;
      v40[4] = self;
      v30 = (void *)[v28 initWithWorkQueue:v29 withRegistration:&unk_1F29E8E38 withBlock:v40];
      [(PLScreenStateAgent *)self setSpringBoardFlipbookStatisticsResponder:v30];
    }
    if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD])
    {
      [(PLScreenStateAgent *)self setLastDisplayLayoutContainsLockScreen:0];
      [(PLScreenStateAgent *)self setLastDisplayLayout:0];
      uint64_t v31 = *MEMORY[0x1E4F92D48];
      long long v32 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Display"];
      long long v33 = [(PLOperator *)self storage];
      long long v34 = [v33 lastEntryForKey:v32 withFilters:&unk_1F29ED760];

      if (v34)
      {
        long long v35 = [v34 objectForKeyedSubscript:@"Active"];
        -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", [v35 intValue]);
      }
      else
      {
        [(PLScreenStateAgent *)self setDisplayState:0];
      }
      long long v36 = +[PLOperator entryKeyForType:v31 andName:@"Display"];
      id v37 = objc_alloc(MEMORY[0x1E4F929E8]);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_311;
      v39[3] = &unk_1E692A0F0;
      v39[4] = self;
      long long v38 = (void *)[v37 initWithOperator:self forEntryKey:v36 withBlock:v39];
      [(PLScreenStateAgent *)self setDisplayCallback:v38];
    }
  }
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventForward_WindowMode: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardWindowMode:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_245(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_IconDragging: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardIconDragging:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_Aggregate_WidgetAdditionAnimation: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logAggregateWidgetAdditionAnimation:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_255(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_Aggregate_WidgetFlipAnimation: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logAggregateWidgetFlipAnimation:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_AlwaysOnEnableState: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardAlwaysOnEnableState:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_265(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_BacklightStateChange: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardBacklightStateChange:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLScreenStateAgent_EventBackward_FlipbookStatistics: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardFlipbookStatistics:v6];
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AlwaysOnEnableState query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  int v8 = [*(id *)(a1 + 32) processQuery:v6 withEntryKey:@"PLScreenStateAgent_EventBackward_AlwaysOnEnableState"];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"AlwaysOnEnableState"];
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "AlwaysOnEnableState query received with info: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "AlwaysOnEnableState query did not succeed", (uint8_t *)&v13, 2u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "BacklightStateChange query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  int v8 = [*(id *)(a1 + 32) processQuery:v6 withEntryKey:@"PLScreenStateAgent_EventBackward_BacklightStateChange"];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"BacklightStateChange"];
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "BacklightStateChange query received with info: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "BacklightStateChange query did not succeed", (uint8_t *)&v13, 2u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "FlipbookStatistics query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  int v8 = [*(id *)(a1 + 32) processQuery:v6 withEntryKey:@"PLScreenStateAgent_EventBackward_FlipbookStatistics"];
  id v9 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"FlipbookStatistics"];
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "FlipbookStatistics query received with info: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1D2690000, v11, OS_LOG_TYPE_ERROR, "FlipbookStatistics query did not succeed", (uint8_t *)&v13, 2u);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_311(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "userInfo=%@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) handleDisplayCallback:v3];
  }
}

- (void)dealloc
{
  carPlayDisplayMonitor = self->_carPlayDisplayMonitor;
  if (carPlayDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)carPlayDisplayMonitor invalidate];
  }
  airPlayDisplayMonitor = self->_airPlayDisplayMonitor;
  if (airPlayDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)airPlayDisplayMonitor invalidate];
  }
  mainDisplayMonitor = self->_mainDisplayMonitor;
  if (mainDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)mainDisplayMonitor invalidate];
  }
  v6.receiver = self;
  v6.super_class = (Class)PLScreenStateAgent;
  [(PLAgent *)&v6 dealloc];
}

- (void)log
{
  id v4 = [(PLScreenStateAgent *)self mainDisplayMonitor];
  id v3 = [v4 currentLayout];
  [(PLScreenStateAgent *)self logEventForwardMainScreenState:v3];
}

- (void)logEventPointMainBacklightEvent:(id)a3 withContext:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F92D48];
  id v7 = a4;
  id v8 = a3;
  id v9 = +[PLOperator entryKeyForType:v6 andName:@"BacklightEvent"];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
  uint64_t v11 = NSNumber;
  id v12 = [v7 transitionReason];

  int v13 = [v11 numberWithInteger:SBSBacklightChangeSourceForDisplayLayoutTransitionReason()];
  [v10 setObject:v13 forKeyedSubscript:@"TransitionReason"];

  id v14 = NSNumber;
  uint64_t v15 = [v8 displayBacklightLevel];

  id v16 = [v14 numberWithInteger:v15];
  [v10 setObject:v16 forKeyedSubscript:@"BacklightLevel"];

  [(PLOperator *)self logEntry:v10];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v28 = v17;
    if (qword_1EBD57A78 != -1) {
      dispatch_once(&qword_1EBD57A78, &block);
    }
    if (_MergedGlobals_1_9)
    {
      id v18 = [NSString stringWithFormat:@"BacklightEvent: %@", v10, block, v25, v26, v27, v28];
      uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
      id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScreenStateAgent.m"];
      uint64_t v21 = [v20 lastPathComponent];
      id v22 = [NSString stringWithUTF8String:"-[PLScreenStateAgent logEventPointMainBacklightEvent:withContext:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:557];

      uint64_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_9 = result;
  return result;
}

- (void)postEnhancedScreenStateNotification:(id)a3 currentLayout:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v5 = [a3 isEqualToDictionary:a4];
  uint64_t v6 = PLLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v13[0]) = 0;
      id v8 = "current FBSDisplayLayoutElement dictionary is the same than the last, not sending a EnhancedScreenState notification";
      id v9 = v6;
      uint32_t v10 = 2;
LABEL_9:
      _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)v13, v10);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v13[0]) = 0;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "current FBSDisplayLayoutElement dictionary is different than the last, notifying EnhancedScreenState Listener", (uint8_t *)v13, 2u);
    }

    ++postEnhancedScreenStateNotification_currentLayout__enhancedScreenStateCounter;
    uint64_t v11 = (void *)MEMORY[0x1E4F92A88];
    id v12 = [NSString stringWithFormat:@"com.apple.powerlog.EnhancedScreenState"];
    [v11 postNotificationName:v12 object:self userInfo:0];

    uint64_t v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v13[0] = 67109120;
      v13[1] = postEnhancedScreenStateNotification_currentLayout__enhancedScreenStateCounter;
      id v8 = "FBSDisplayLayoutElement notification notified, count is now %d";
      id v9 = v6;
      uint32_t v10 = 8;
      goto LABEL_9;
    }
  }
}

- (void)logEventForwardCarScreenState:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  BOOL v7 = [v4 elements];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v4 bounds];
    double v10 = v9;
    [v4 bounds];
    double v12 = v11;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v4 elements];
    uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v32)
    {
      double v13 = v10 * v12;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v16 = v5;
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
          id v18 = v6;
          [v17 setEntryDate:v6];
          uint64_t v19 = [v15 bundleIdentifier];
          if (v19) {
            [v15 bundleIdentifier];
          }
          else {
          id v20 = [v15 identifier];
          }
          [v17 setObject:v20 forKeyedSubscript:@"bundleID"];

          uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "layoutRole"));
          [v17 setObject:v21 forKeyedSubscript:@"AppRole"];

          id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "displayType"));
          [v17 setObject:v22 forKeyedSubscript:@"Display"];

          uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "level"));
          [v17 setObject:v23 forKeyedSubscript:@"Level"];

          [v15 frame];
          double v25 = v24;
          [v15 frame];
          v27 = [NSNumber numberWithDouble:v25 * v26 / v13];
          [v17 setObject:v27 forKeyedSubscript:@"ScreenWeight"];

          [(PLOperator *)self logEntry:v17];
          [(PLScreenStateAgent *)self createCarPlayAccountingEvents:v17];

          char v5 = v16;
          uint64_t v6 = v18;
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v32);
    }
  }
  else
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    [v28 setEntryDate:v6];
    [v28 setObject:0 forKeyedSubscript:@"bundleID"];
    [v28 setObject:&unk_1F29E4D38 forKeyedSubscript:@"AppRole"];
    v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "displayType"));
    [v28 setObject:v29 forKeyedSubscript:@"Display"];

    [v28 setObject:&unk_1F29F03D0 forKeyedSubscript:@"ScreenWeight"];
    [v28 setObject:&unk_1F29E4D50 forKeyedSubscript:@"Level"];
    [(PLOperator *)self logEntry:v28];
    [(PLScreenStateAgent *)self createCarPlayAccountingEvents:v28];
  }
}

- (void)logEventForwardAirPlayScreenState:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  BOOL v7 = [v4 elements];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v4 bounds];
    double v10 = v9;
    [v4 bounds];
    double v12 = v11;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [v4 elements];
    uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v33)
    {
      double v13 = v10 * v12;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = v4;
          id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v17 = v5;
          id v18 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
          uint64_t v19 = v6;
          [v18 setEntryDate:v6];
          id v20 = [v16 bundleIdentifier];
          if (v20) {
            [v16 bundleIdentifier];
          }
          else {
          uint64_t v21 = [v16 identifier];
          }
          [v18 setObject:v21 forKeyedSubscript:@"bundleID"];

          id v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "layoutRole"));
          [v18 setObject:v22 forKeyedSubscript:@"AppRole"];

          id v4 = v15;
          uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "displayType"));
          [v18 setObject:v23 forKeyedSubscript:@"Display"];

          double v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "level"));
          [v18 setObject:v24 forKeyedSubscript:@"Level"];

          [v16 frame];
          double v26 = v25;
          [v16 frame];
          uint64_t v28 = [NSNumber numberWithDouble:v26 * v27 / v13];
          [v18 setObject:v28 forKeyedSubscript:@"ScreenWeight"];

          [(PLScreenStateAgent *)self createAirPlayWiFiAccountingEvent:v18];
          char v5 = v17;
          uint64_t v6 = v19;
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v33);
    }
  }
  else
  {
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    [v29 setEntryDate:v6];
    [v29 setObject:0 forKeyedSubscript:@"bundleID"];
    [v29 setObject:&unk_1F29E4D38 forKeyedSubscript:@"AppRole"];
    v30 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "displayType"));
    [v29 setObject:v30 forKeyedSubscript:@"Display"];

    [v29 setObject:&unk_1F29F03D0 forKeyedSubscript:@"ScreenWeight"];
    [v29 setObject:&unk_1F29E4D50 forKeyedSubscript:@"Level"];
    [(PLScreenStateAgent *)self createAirPlayWiFiAccountingEvent:v29];
  }
}

- (unint64_t)convertWindowingMode:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Mirroring"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Medusa"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Chamois"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"NonInteractive"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    char v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, " Unknown windowingMode %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 5;
  }

  return v4;
}

- (unint64_t)convertZoomLevel:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"LargerText"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Standard"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Dense"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Denser"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    char v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, " Unknown zoomLevel %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 5;
  }

  return v4;
}

- (void)logEventForwardWindowMode:(id)a3
{
  id v22 = a3;
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    unint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"WindowMode"];
    char v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v22];
    uint64_t v6 = [v22 objectForKeyedSubscript:@"displayName"];
    [v5 setObject:v6 forKeyedSubscript:@"displayType"];

    int v7 = NSNumber;
    id v8 = [v22 objectForKeyedSubscript:@"windowingMode"];
    uint64_t v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertWindowingMode:](self, "convertWindowingMode:", v8));
    [v5 setObject:v9 forKeyedSubscript:@"windowingMode"];

    double v10 = NSNumber;
    double v11 = [v22 objectForKeyedSubscript:@"zoomLevel"];
    double v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertZoomLevel:](self, "convertZoomLevel:", v11));
    [v5 setObject:v12 forKeyedSubscript:@"zoomLevel"];

    double v13 = [v22 objectForKeyedSubscript:@"canvasSizeHeight"];
    int v14 = [v13 intValue];
    uint64_t v15 = [v22 objectForKeyedSubscript:@"canvasSizeWidth"];
    int v16 = [v15 intValue] * v14;

    uint64_t v17 = [v22 objectForKeyedSubscript:@"nativeSizeHeight"];
    int v18 = [v17 intValue];
    uint64_t v19 = [v22 objectForKeyedSubscript:@"nativeSizeWidth"];
    int v20 = [v19 intValue];

    if (v16 >= 1 && v20 * v18 >= 1)
    {
      uint64_t v21 = [NSNumber numberWithDouble:(double)v16 / (double)(v20 * v18)];
      [v5 setObject:v21 forKeyedSubscript:@"canvasRatio"];
    }
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardIconDragging:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = [v4 now];
  int v7 = [v6 convertFromSystemToMonotonic];

  id v8 = [v5 objectForKeyedSubscript:@"Durations"];

  uint64_t v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"IconDragging"];
  double v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke;
  int v18 = &unk_1E692B178;
  id v11 = v9;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [v8 enumerateObjectsUsingBlock:&v15];
  if (objc_msgSend(v13, "count", v15, v16, v17, v18))
  {
    id v22 = v11;
    v23[0] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(PLOperator *)self logEntries:v14 withGroupID:v11];
  }
}

void __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
  [v5 setObject:v4 forKeyedSubscript:@"Duration"];

  [*(id *)(a1 + 48) addObject:v5];
}

- (void)logEventBackwardAlwaysOnEnableState:(id)a3
{
  id v8 = a3;
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AlwaysOnEnableState"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v8];
    uint64_t v6 = [v8 objectForKeyedSubscript:@"focusMode"];
    uint64_t v7 = [v6 length];

    if (v7) {
      [v5 setObject:&unk_1F29E4D68 forKeyedSubscript:@"focusMode"];
    }
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardBacklightStateChange:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x1E4F92A38] hasAOD] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isDeviceClass:102040] & 1) != 0
    || [MEMORY[0x1E4F92A38] isDeviceClass:102041])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BacklightStateChange"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v9];
    uint64_t v6 = NSNumber;
    uint64_t v7 = [v9 objectForKeyedSubscript:@"state"];
    id v8 = objc_msgSend(v6, "numberWithUnsignedInt:", -[PLScreenStateAgent GetBacklightState:](self, "GetBacklightState:", v7));
    [v5 setObject:v8 forKeyedSubscript:@"state"];

    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardFlipbookStatistics:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"FlipbookStatistics"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v6];
    [(PLOperator *)self logEntry:v5];
  }
}

- (id)processQuery:(id)a3 withEntryKey:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v7 = (void *)MEMORY[0x1D942A350]();
    id v8 = PLLogScreenState();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "process for %@ Received query with payload=%@.", buf, 0x16u);
    }

    if (!v5
      || ([v5 objectForKeyedSubscript:@"StartEpochTime"],
          id v9 = objc_claimAutoreleasedReturnValue(),
          BOOL v10 = v9 == 0,
          v9,
          v10))
    {
      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_error_impl(&dword_1D2690000, v13, OS_LOG_TYPE_ERROR, "process for %@ Invalid payload!", buf, 0xCu);
      }
      id v27 = 0;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1C9C8];
      id v12 = [v5 objectForKeyedSubscript:@"StartEpochTime"];
      [v12 doubleValue];
      id v13 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");

      int v14 = [v13 convertFromSystemToMonotonic];
      uint64_t v15 = PLLogScreenState();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "process for %@ queryStartDate is =%@.", buf, 0x16u);
      }

      id v16 = objc_alloc(MEMORY[0x1E4F92A90]);
      uint64_t v17 = NSNumber;
      [v14 timeIntervalSince1970];
      int v18 = objc_msgSend(v17, "numberWithDouble:");
      id v19 = (void *)[v16 initWithKey:@"timestamp" withValue:v18 withComparisonOperation:3];

      id v20 = [MEMORY[0x1E4F92AD0] sharedCore];
      id v21 = [v20 storage];
      v41[0] = v19;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      uint64_t v23 = [v21 entriesForKey:v6 withComparisons:v22];

      double v24 = PLLogScreenState();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v23;
        _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "selected query entries for %@ are selectedEntries =%@.", buf, 0x16u);
      }

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v38 = __Block_byref_object_copy__0;
      uint64_t v39 = __Block_byref_object_dispose__0;
      id v40 = (id)objc_opt_new();
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke;
      v30[3] = &unk_1E692B1A0;
      id v25 = v6;
      id v31 = v25;
      uint64_t v32 = buf;
      [v23 enumerateObjectsUsingBlock:v30];
      double v26 = PLLogScreenState();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v29 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)uint64_t v33 = 138412546;
        id v34 = v25;
        __int16 v35 = 2112;
        uint64_t v36 = v29;
        _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "process for %@ output response is =%@.", v33, 0x16u);
      }

      id v27 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

void __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 dictionary];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "entryID"));
  [v5 setObject:v6 forKeyedSubscript:@"ID"];

  uint64_t v7 = [v3 entryDate];
  id v8 = [v7 convertFromMonotonicToSystem];

  id v9 = NSNumber;
  [v8 timeIntervalSince1970];
  BOOL v10 = objc_msgSend(v9, "numberWithDouble:");
  [v5 setObject:v10 forKeyedSubscript:@"timestamp"];

  id v11 = PLLogScreenState();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v3 entryDate];
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "process for query related to %@ is NSDates=%@ and correctedTimeStamp=%@", (uint8_t *)&v14, 0x20u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

- (void)logAggregateWidgetAdditionAnimation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WidgetAdditionAnimation"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logAggregateWidgetFlipAnimation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WidgetFlipAnimation"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)createCarPlayAccountingEvents:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"bundleID"];

  id v14 = [MEMORY[0x1E4F92900] sharedInstance];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"bundleID"];
    uint64_t v17 = v5;
    v18[0] = &unk_1F29F03D0;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v7 = [v3 entryDate];
    [v14 createDistributionEventForwardWithDistributionID:27 withChildNodeNameToWeight:v6 withStartDate:v7];

    id v8 = [MEMORY[0x1E4F92900] sharedInstance];
    id v9 = [v3 objectForKeyedSubscript:@"bundleID"];
    uint64_t v15 = v9;
    BOOL v10 = [v3 objectForKeyedSubscript:@"ScreenWeight"];
    __int16 v16 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v12 = [v3 entryDate];

    [v8 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:v11 withStartDate:v12];
  }
  else
  {
    id v13 = [v3 entryDate];

    [v14 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v13];
  }
}

- (void)createAirPlayWiFiAccountingEvent:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"bundleID"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F92900] sharedInstance];
    id v6 = [v3 objectForKeyedSubscript:@"bundleID"];
    id v9 = v6;
    v10[0] = &unk_1F29F03D0;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v3 entryDate];
    [v5 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:v7 withStartDate:v8];
  }
}

- (void)handleDisplayCallback:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    *(void *)uint64_t v17 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "userInfo=%@", (uint8_t *)&v16, 0xCu);
  }

  id v6 = [v4 objectForKey:@"entry"];
  id v7 = [v6 objectForKeyedSubscript:@"Active"];
  -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", [v7 intValue]);

  id v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [(PLScreenStateAgent *)self displayState];
    BOOL v12 = [(PLScreenStateAgent *)self lastDisplayLayoutContainsLockScreen];
    id v13 = [(PLScreenStateAgent *)self lastDisplayLayout];
    int v16 = 67109634;
    *(_DWORD *)uint64_t v17 = v11;
    *(_WORD *)&v17[4] = 1024;
    *(_DWORD *)&v17[6] = v12;
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d,  self.lastDisplayLayout=%@", (uint8_t *)&v16, 0x18u);
  }
  if (([(PLScreenStateAgent *)self displayState] == 2
     || [(PLScreenStateAgent *)self displayState] == 1)
    && [(PLScreenStateAgent *)self lastDisplayLayoutContainsLockScreen])
  {
    id v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v14 = [(PLScreenStateAgent *)self displayState];
      BOOL v15 = [(PLScreenStateAgent *)self lastDisplayLayoutContainsLockScreen];
      int v16 = 67109376;
      *(_DWORD *)uint64_t v17 = v14;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = v15;
      _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d", (uint8_t *)&v16, 0xEu);
    }

    BOOL v10 = [(PLScreenStateAgent *)self lastDisplayLayout];
    [(PLScreenStateAgent *)self logEventForwardMainScreenState:v10];
  }
}

- (FBSDisplayLayoutMonitor)mainDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainDisplayMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)airPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAirPlayDisplayMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)carPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCarPlayDisplayMonitor:(id)a3
{
}

- (PLXPCListenerOperatorComposition)windowModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWindowModeListener:(id)a3
{
}

- (NSMutableDictionary)lastScreenStateEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastScreenStateEntries:(id)a3
{
}

- (NSMutableDictionary)lastLayoutMonitorEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastLayoutMonitorEntries:(id)a3
{
}

- (PLXPCListenerOperatorComposition)iconDraggingListner
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIconDraggingListner:(id)a3
{
}

- (PLXPCListenerOperatorComposition)widgetAdditionAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWidgetAdditionAnimationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)widgetFlipAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWidgetFlipAnimationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)springBoardAlwaysOnEnableStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)springBoardBacklightStateChangeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSpringBoardBacklightStateChangeListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)springBoardFlipbookStatisticsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSpringBoardFlipbookStatisticsListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)springBoardAlwaysOnEnableStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)springBoardBacklightStateChangeResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSpringBoardBacklightStateChangeResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)springBoardFlipbookStatisticsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSpringBoardFlipbookStatisticsResponder:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDisplayCallback:(id)a3
{
}

- (int)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int)a3
{
  self->_displayState = a3;
}

- (FBSDisplayLayout)lastDisplayLayout
{
  return (FBSDisplayLayout *)objc_getProperty(self, a2, 184, 1);
}

- (BOOL)lastDisplayLayoutContainsLockScreen
{
  return self->_lastDisplayLayoutContainsLockScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayLayout, 0);
  objc_storeStrong((id *)&self->_displayCallback, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsResponder, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeResponder, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateResponder, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsListener, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeListener, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateListener, 0);
  objc_storeStrong((id *)&self->_widgetFlipAnimationListener, 0);
  objc_storeStrong((id *)&self->_widgetAdditionAnimationListener, 0);
  objc_storeStrong((id *)&self->_iconDraggingListner, 0);
  objc_storeStrong((id *)&self->_lastLayoutMonitorEntries, 0);
  objc_storeStrong((id *)&self->_lastScreenStateEntries, 0);
  objc_storeStrong((id *)&self->_windowModeListener, 0);
  objc_storeStrong((id *)&self->_carPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_airPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayMonitor, 0);
}

@end