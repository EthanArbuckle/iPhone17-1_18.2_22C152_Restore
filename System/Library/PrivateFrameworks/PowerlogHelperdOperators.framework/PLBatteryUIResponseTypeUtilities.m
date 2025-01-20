@interface PLBatteryUIResponseTypeUtilities
+ (BOOL)energyEntryHasNegligibleEnergyDrain:(id)a3 filterArray:(id)a4;
+ (id)getBundleIDToDisplayNameMapWithResponderService:(id)a3;
+ (id)getBundleIDToReplacementBundleIDMap;
+ (id)getDeletedAppBundleIDsWithResponderService:(id)a3;
+ (id)getDeletedAppClipBundleIDsWithResponderService:(id)a3;
+ (id)getEnergyEntry:(id)a3 forBundleID:(id)a4;
+ (id)getInstalledPluginEntries;
+ (id)getNonAppBundleIDs;
+ (id)getPluginBundleIDToEntryMapWithResponderService:(id)a3;
+ (id)getRootNodeBundleIDs;
+ (id)getWebAppBundleIDsWithResponderService:(id)a3;
+ (void)addEntryTypesToEnergyEntriesInBucket:(id)a3 withResponderService:(id)a4;
+ (void)applyDynamicNameTransformation:(id)a3 withResponderService:(id)a4;
+ (void)applyStaticNameTransformation:(id)a3 withResponderService:(id)a4;
+ (void)collapseEnergyEntries:(id)a3;
+ (void)filterEnergyEntriesByAppTypeFromBucket:(id)a3;
+ (void)filterEnergyEntriesWithRuntimes:(id)a3;
+ (void)reaccountBackupRestore:(id)a3;
+ (void)reaccountExchangeEntries:(id)a3 withExchangeBundleIDs:(id)a4;
+ (void)replaceBundleIDsWithDisplayNamesForEnergyEntryInBucket:(id)a3 withResponderService:(id)a4;
+ (void)transformDeletedApps:(id)a3 withResponderService:(id)a4;
+ (void)transformPlugins:(id)a3 withResponderService:(id)a4;
@end

@implementation PLBatteryUIResponseTypeUtilities

+ (void)applyStaticNameTransformation:(id)a3 withResponderService:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[PLBatteryUIResponseTypeUtilities getBundleIDToReplacementBundleIDMap];
  uint64_t v8 = +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:v6];
  v9 = (void *)v8;
  if (!v7)
  {
    v59 = PLLogCommon();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:]();
    }
    goto LABEL_43;
  }
  if (!v8)
  {
    v59 = PLLogCommon();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:]();
    }
LABEL_43:

    goto LABEL_44;
  }
  v60 = (void *)v8;
  id v61 = v6;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v62 = v5;
  v10 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (!v11) {
    goto LABEL_38;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v66;
  uint64_t v64 = *MEMORY[0x1E4F625B0];
  unint64_t v14 = 0x1E4F28000uLL;
  v63 = v10;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v66 != v13) {
        objc_enumerationMutation(v10);
      }
      v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      if ([v17 isEqualToString:@"com.apple.springboard.lockscreen.navigation"])
      {
        v18 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        v19 = *(void **)(v14 + 3792);
        [v18 doubleValue];
        v21 = [v19 numberWithDouble:-v20];
        [v16 setObject:v21 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];

LABEL_10:
        goto LABEL_34;
      }
      if ([v17 isEqualToString:@"com.apple.PassbookUIService"])
      {
        [v16 setObject:&unk_1F4011AF8 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
      }
      else if (_os_feature_enabled_impl())
      {
        v22 = [NSString stringWithFormat:@"%@.%@", v64, @"aod"];
        int v23 = [v17 isEqualToString:v22];

        if (v23)
        {
          v24 = PLLogCommon();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            double v70 = *(double *)&v17;
            __int16 v71 = 2112;
            double v72 = *(double *)&v16;
            _os_log_debug_impl(&dword_1E4220000, v24, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: processing aod entry with bundleID=%@, energyEntry=%@", buf, 0x16u);
          }

          v25 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          [v16 setObject:v25 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];

          v26 = (void *)MEMORY[0x1E4F28ED0];
          v27 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v27 doubleValue];
          v28 = objc_msgSend(v26, "numberWithDouble:");
          [v16 setObject:v28 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeOriginalKey"];

          v29 = (void *)MEMORY[0x1E4F28ED0];
          v30 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v30 doubleValue];
          v31 = objc_msgSend(v29, "numberWithDouble:");
          [v16 setObject:v31 forKeyedSubscript:@"AlwaysOnEnergyBeforeClamp"];

          [v16 setObject:&unk_1F4011AF8 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          v32 = PLLogCommon();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v55 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
            v56 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
            *(_DWORD *)buf = 138412802;
            double v70 = *(double *)&v55;
            __int16 v71 = 2112;
            double v72 = *(double *)&v56;
            __int16 v73 = 2112;
            uint64_t v74 = (uint64_t)v17;
            _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: Subtracting foregroundPluggedInTime=%@ from alwaysOnRuntime=%@ for bundleID=%@", buf, 0x20u);
          }
          v33 = (void *)MEMORY[0x1E4F28ED0];
          v34 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v34 doubleValue];
          double v36 = v35;
          v37 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
          [v37 doubleValue];
          double v39 = v36 - v38;

          if (v39 >= 0.0) {
            double v40 = v39;
          }
          else {
            double v40 = 0.0;
          }
          v41 = [v33 numberWithDouble:v40];
          [v16 setObject:v41 forKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];

          v42 = PLLogCommon();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v57 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
            v58 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeOriginalKey"];
            *(_DWORD *)buf = 138412546;
            double v70 = *(double *)&v57;
            __int16 v71 = 2112;
            double v72 = *(double *)&v58;
            _os_log_debug_impl(&dword_1E4220000, v42, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: After subtracting plugged in time, alwaysOnRuntime=%@, alwaysOnRuntimeOriginal=%@", buf, 0x16u);
          }
          v43 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
          [v43 doubleValue];
          double v45 = v44;

          v46 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v46 doubleValue];
          double v48 = v47 / 3600.0;

          v49 = PLLogCommon();
          v10 = v63;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            double v70 = v45;
            __int16 v71 = 2048;
            double v72 = v48;
            __int16 v73 = 2048;
            uint64_t v74 = 0x4075E00000000000;
            _os_log_debug_impl(&dword_1E4220000, v49, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: AODEnergy=%f, AODUnpluggedTime=%f, kAODModeledPowerUpperBound=%f", buf, 0x20u);
          }

          if (v48 > 0.0)
          {
            double v50 = v45 / v48;
            if (v45 / v48 > 350.0)
            {
              v51 = PLLogCommon();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
                +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:].cold.4();
              }

              v52 = [MEMORY[0x1E4F28ED0] numberWithDouble:v48 * 350.0];
              [v16 setObject:v52 forKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];

              v53 = PLLogCommon();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
                +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:]();
              }
            }
          }
          v18 = objc_msgSend(v16, "objectForKeyedSubscript:", @"PLBatteryUIAppEnergyValueKey", v50);
          [v16 setObject:v18 forKeyedSubscript:@"AlwaysOnEnergy"];
          goto LABEL_10;
        }
      }
LABEL_34:
      v54 = [v7 objectForKeyedSubscript:v17];
      if (v54) {
        [v16 setObject:v54 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      }

      unint64_t v14 = 0x1E4F28000;
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v65 objects:v75 count:16];
  }
  while (v12);
LABEL_38:

  id v5 = v62;
  +[PLBatteryUIResponseTypeUtilities collapseEnergyEntries:v62];
  v9 = v60;
  id v6 = v61;
LABEL_44:
}

+ (void)applyDynamicNameTransformation:(id)a3 withResponderService:(id)a4
{
  id v5 = a4;
  id v9 = a3;
  id v6 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  +[PLBatteryUIResponseTypeUtilities transformDeletedApps:v6 withResponderService:v5];

  v7 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  +[PLBatteryUIResponseTypeUtilities transformPlugins:v7 withResponderService:v5];

  uint64_t v8 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  +[PLBatteryUIResponseTypeUtilities reaccountBackupRestore:v8];

  +[PLBatteryUIResponseTypeUtilities collapseEnergyEntries:v9];
}

+ (void)transformDeletedApps:(id)a3 withResponderService:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[PLBatteryUIResponseTypeUtilities getDeletedAppBundleIDsWithResponderService:v6];
  uint64_t v8 = +[PLBatteryUIResponseTypeUtilities getDeletedAppClipBundleIDsWithResponderService:v6];
  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    id v23 = v6;
    v25 = v8;
    if ([v8 count] && objc_msgSend(v7, "count"))
    {
      id v9 = @"DeletedAppAndAppClip";
    }
    else if ([v7 count])
    {
      id v9 = @"DeletedApp";
    }
    else
    {
      uint64_t v10 = [v8 count];
      id v9 = @"DeletedAppClip";
      if (!v10) {
        id v9 = 0;
      }
    }
    v27 = v9;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v24 = v5;
    id obj = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      unint64_t v14 = @"Unspecified";
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v17 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          if ([v7 containsObject:v17])
          {
          }
          else
          {
            [v16 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            v19 = v18 = v14;
            int v20 = [v25 containsObject:v19];

            unint64_t v14 = v18;
            if (!v20) {
              goto LABEL_19;
            }
          }
          [v16 setObject:v27 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
LABEL_19:
          v21 = [v16 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          int v22 = [v21 containsString:v14];

          if (v22) {
            [v16 setObject:@"DeletedApp" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    id v6 = v23;
    id v5 = v24;
    uint64_t v8 = v25;
  }
}

+ (void)transformPlugins:(id)a3 withResponderService:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:a4];
  id v62 = +[PLBatteryUIResponseTypeUtilities getBundleIDToReplacementBundleIDMap];
  long long v65 = (void *)v6;
  if (v6)
  {
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v58 = v5;
      uint64_t v64 = *(void *)v69;
      uint64_t v61 = *MEMORY[0x1E4F625B0];
      while (1)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v69 != v64) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v68 + 1) + 8 * v9);
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v11 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v11;
            if (transformPlugins_withResponderService__defaultOnce != -1) {
              dispatch_once(&transformPlugins_withResponderService__defaultOnce, block);
            }
            if (transformPlugins_withResponderService__classDebugEnabled)
            {
              uint64_t v12 = [NSString stringWithFormat:@"energyEntry=%@", v10];
              uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
              unint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
              v15 = [v14 lastPathComponent];
              v16 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:]"];
              [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:184];

              v17 = PLLogCommon();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                __int16 v73 = v12;
                _os_log_debug_impl(&dword_1E4220000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }
          v18 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          v19 = [v65 objectForKeyedSubscript:v18];

          if (v19)
          {
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v20 = objc_opt_class();
              v66[0] = MEMORY[0x1E4F143A8];
              v66[1] = 3221225472;
              v66[2] = __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke_74;
              v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v66[4] = v20;
              if (transformPlugins_withResponderService__defaultOnce_72 != -1) {
                dispatch_once(&transformPlugins_withResponderService__defaultOnce_72, v66);
              }
              if (transformPlugins_withResponderService__classDebugEnabled_73)
              {
                v21 = [NSString stringWithFormat:@"this is a plugin"];
                int v22 = (void *)MEMORY[0x1E4F929B8];
                id v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
                id v24 = [v23 lastPathComponent];
                v25 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:]"];
                [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:189];

                v26 = PLLogCommon();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  __int16 v73 = v21;
                  _os_log_debug_impl(&dword_1E4220000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            v27 = [v19 objectForKeyedSubscript:@"PluginId"];
            char v28 = [v27 isEqualToString:@"com.apple.AppStore.ProductPageExtension"];

            if ((v28 & 1) == 0)
            {
              long long v29 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              long long v30 = [v19 objectForKeyedSubscript:@"PluginParentApp"];
              if ([v29 isEqualToString:@"com.apple.sidecar.extension.capture"])
              {
                long long v31 = +[PLBatteryUIResponseTypeUtilities getEnergyEntry:obj forBundleID:v30];
              }
              else
              {
                long long v31 = 0;
              }
              [v10 setObject:v30 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              v32 = [v19 objectForKeyedSubscript:@"PluginType"];
              int v33 = [v32 isEqualToString:@"com.apple.watchkit"];

              if (v33)
              {
                v34 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [v10 setObject:v34 forKeyedSubscript:@"WatchEnergy"];
                goto LABEL_39;
              }
              double v35 = [v19 objectForKeyedSubscript:@"PluginType"];
              int v36 = [v35 isEqualToString:@"com.apple.widgetkit-extension"];

              if (v36)
              {
                v37 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [v10 setObject:v37 forKeyedSubscript:@"ChronoWidgetEnergy"];

                v34 = PLLogCommon();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  double v38 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                  double v39 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                  [v39 doubleValue];
                  *(_DWORD *)buf = 138412546;
                  __int16 v73 = v38;
                  __int16 v74 = 2048;
                  v75 = v40;
                  _os_log_debug_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: Widget Energy for %@ : %f", buf, 0x16u);

                  goto LABEL_53;
                }
                goto LABEL_39;
              }
              v41 = [v19 objectForKeyedSubscript:@"PluginType"];
              int v42 = [v41 isEqualToString:@"com.apple.posterkit.provider"];

              if (v42)
              {
                if (!v30)
                {
                  v43 = [v62 objectForKeyedSubscript:v61];
                  [v10 setObject:v43 forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                }
                int v44 = [v29 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
                double v45 = PLLogCommon();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v73) = v44;
                  _os_log_debug_impl(&dword_1E4220000, v45, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: isPhotosPoster=%d", buf, 8u);
                }

                if (v44) {
                  [v10 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                }
                v34 = PLLogCommon();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  double v38 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                  v60 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                  [v60 doubleValue];
                  uint64_t v52 = v51;
                  v59 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
                  [v59 doubleValue];
                  uint64_t v54 = v53;
                  v55 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
                  [v55 doubleValue];
                  *(_DWORD *)buf = 138413314;
                  __int16 v73 = v29;
                  __int16 v74 = 2112;
                  v75 = v38;
                  __int16 v76 = 2048;
                  uint64_t v77 = v52;
                  __int16 v78 = 2048;
                  uint64_t v79 = v54;
                  __int16 v80 = 2048;
                  uint64_t v81 = v56;
                  _os_log_debug_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: Mapping Poster %@ to %@ – energy:%f, foregroundRunTime:%f, bgRunTime:%f", buf, 0x34u);

LABEL_53:
                }
LABEL_39:
              }
              if ([v29 isEqualToString:@"com.apple.sidecar.extension.capture"])
              {
                [v10 setObject:@"ContinuityCamera" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                v46 = PLLogCommon();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  __int16 v73 = v31;
                  __int16 v74 = 2112;
                  v75 = v10;
                  _os_log_debug_impl(&dword_1E4220000, v46, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: continuityParentAppEnergyEntry=%@, energyEntry=%@", buf, 0x16u);
                }

                if (v31)
                {
                  double v47 = [v31 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
                  [v47 doubleValue];
                  double v49 = v48;

                  if (v49 > 0.0)
                  {
                    [v31 setObject:@"ContinuityCamera" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
                    [v31 setObject:&unk_1F400C088 forKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
                  }
                }
                double v50 = PLLogCommon();
                if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  __int16 v73 = v10;
                  _os_log_debug_impl(&dword_1E4220000, v50, OS_LOG_TYPE_DEBUG, "Battery UI Response Type Utilities: After adjusting Continuity Camera extension energyEntry=%@", buf, 0xCu);
                }
              }
            }
          }

          ++v9;
        }
        while (v8 != v9);
        uint64_t v57 = [obj countByEnumeratingWithState:&v68 objects:v82 count:16];
        uint64_t v8 = v57;
        if (!v57)
        {
          id v5 = v58;
          break;
        }
      }
    }
  }
  else
  {
    id obj = PLLogCommon();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      +[PLBatteryUIResponseTypeUtilities transformPlugins:withResponderService:]();
    }
  }
}

uint64_t __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  transformPlugins_withResponderService__classDebugEnabled = result;
  return result;
}

uint64_t __74__PLBatteryUIResponseTypeUtilities_transformPlugins_withResponderService___block_invoke_74(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  transformPlugins_withResponderService__classDebugEnabled_73 = result;
  return result;
}

+ (void)reaccountExchangeEntries:(id)a3 withExchangeBundleIDs:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v43 = v6;
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v57 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v15 = [v14 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          if (v15)
          {
            v16 = [v14 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            [v8 setObject:v14 forKeyedSubscript:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v11);
    }

    v17 = [v8 objectForKeyedSubscript:@"com.apple.activesync"];
    v18 = v17;
    if (v17)
    {
      v19 = [v17 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
      [v19 doubleValue];
      double v21 = v20;

      if (v21 != 0.0)
      {
        v41 = v18;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v53 = 0u;
        long long v52 = 0u;
        id v22 = v43;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v52 objects:v61 count:16];
        id v42 = v5;
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v53;
          double v26 = 0.0;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v53 != v25) {
                objc_enumerationMutation(v22);
              }
              char v28 = -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v52 + 1) + 8 * j), v41);
              long long v29 = v28;
              if (v28)
              {
                long long v30 = [v28 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
                [v30 doubleValue];
                double v32 = v31;

                if (v32 >= 0.0) {
                  double v33 = v32;
                }
                else {
                  double v33 = 0.0;
                }
                double v26 = v26 + v33;
              }
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v52 objects:v61 count:16];
          }
          while (v24);
        }
        else
        {
          double v26 = 0.0;
        }

        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v34 = v22;
        uint64_t v35 = [v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v49 != v37) {
                objc_enumerationMutation(v34);
              }
              double v39 = -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v48 + 1) + 8 * k), v41);
              double v40 = v39;
              if (v39)
              {
                v44[0] = MEMORY[0x1E4F143A8];
                v44[1] = 3221225472;
                v44[2] = __83__PLBatteryUIResponseTypeUtilities_reaccountExchangeEntries_withExchangeBundleIDs___block_invoke;
                v44[3] = &unk_1E6E47B80;
                id v45 = v39;
                double v46 = v21;
                double v47 = v26;
                [v45 enumerateKeysAndObjectsUsingBlock:v44];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v36);
        }

        v18 = v41;
        [v9 removeObject:v41];
        id v5 = v42;
      }
    }

    uint64_t v7 = v43;
  }
  else
  {
    uint64_t v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:]();
    }
  }
}

void __83__PLBatteryUIResponseTypeUtilities_reaccountExchangeEntries_withExchangeBundleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v9 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL
    && [v9 rangeOfString:@"time"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)MEMORY[0x1E4F28ED0];
    [v5 doubleValue];
    uint64_t v8 = [v6 numberWithDouble:v7 * (*(double *)(a1 + 40) / *(double *)(a1 + 48) + 1.0)];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

+ (void)reaccountBackupRestore:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];

          if (v12)
          {
            uint64_t v13 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            [v5 setObject:v11 forKeyedSubscript:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    unint64_t v14 = [v5 objectForKeyedSubscript:@"Backup"];
    uint64_t v15 = [v5 objectForKeyedSubscript:@"Restore"];
    v16 = (void *)v15;
    if (v14 && v15)
    {
      [v14 setObject:@"Backup & Restore" forKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
      [v14 setObject:@"Backup & Restore" forKeyedSubscript:@"PLBatteryUIAppNameKey"];
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      double v20 = __59__PLBatteryUIResponseTypeUtilities_reaccountBackupRestore___block_invoke;
      double v21 = &unk_1E6E47BA8;
      id v22 = v14;
      id v17 = v16;
      id v23 = v17;
      [v22 enumerateKeysAndObjectsUsingBlock:&v18];
      objc_msgSend(v6, "removeObject:", v17, v18, v19, v20, v21);
    }
  }
}

void __59__PLBatteryUIResponseTypeUtilities_reaccountBackupRestore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v12 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL
    && [v12 rangeOfString:@"time"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (void *)MEMORY[0x1E4F28ED0];
    [v5 doubleValue];
    double v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
    [v9 doubleValue];
    uint64_t v11 = [v6 numberWithDouble:v8 + v10];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
  }
}

+ (void)collapseEnergyEntries:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        if (v11)
        {
          id v12 = [v4 objectForKeyedSubscript:v11];

          if (v12)
          {
            v15[0] = MEMORY[0x1E4F143A8];
            v15[1] = 3221225472;
            v15[2] = __58__PLBatteryUIResponseTypeUtilities_collapseEnergyEntries___block_invoke;
            v15[3] = &unk_1E6E47BD0;
            id v16 = v4;
            id v17 = v11;
            [v10 enumerateKeysAndObjectsUsingBlock:v15];
          }
          else
          {
            [v4 setObject:v10 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v4 allValues];
  unint64_t v14 = (void *)[v13 mutableCopy];
  [v3 setObject:v14 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

void __58__PLBatteryUIResponseTypeUtilities_collapseEnergyEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if ([v16 isEqualToString:@"NotificationInfo"])
  {
    uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"NotificationInfo"];

    id v8 = v5;
    if (!v8 || v7)
    {
      [v7 combineWith:v8];
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
      [v9 setObject:v8 forKeyedSubscript:@"NotificationInfo"];
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v16 rangeOfString:@"AppTypeKey"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = (void *)MEMORY[0x1E4F28ED0];
    [v5 doubleValue];
    double v12 = v11;
    uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v8 = [v7 objectForKeyedSubscript:v16];
    [v8 doubleValue];
    unint64_t v14 = [v10 numberWithDouble:v12 + v13];
    uint64_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v15 setObject:v14 forKeyedSubscript:v16];

LABEL_9:
  }
}

+ (id)getEnergyEntry:(id)a3 forBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3;
  id v17 = __Block_byref_object_dispose__3;
  id v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PLBatteryUIResponseTypeUtilities_getEnergyEntry_forBundleID___block_invoke;
  v10[3] = &unk_1E6E47BF8;
  id v7 = v6;
  id v11 = v7;
  double v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __63__PLBatteryUIResponseTypeUtilities_getEnergyEntry_forBundleID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

+ (void)replaceBundleIDsWithDisplayNamesForEnergyEntryInBucket:(id)a3 withResponderService:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v15 = v5;
  id obj = [v5 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v12 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        uint64_t v13 = [v6 objectForKeyedSubscript:v12];
        if (v13)
        {
          unint64_t v14 = [v6 objectForKeyedSubscript:v12];
          [v11 setObject:v14 forKeyedSubscript:@"PLBatteryUIAppNameKey"];
        }
        else
        {
          [v11 setObject:v12 forKeyedSubscript:@"PLBatteryUIAppNameKey"];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

+ (void)addEntryTypesToEnergyEntriesInBucket:(id)a3 withResponderService:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v32 = +[PLBatteryUIResponseTypeUtilities getRootNodeBundleIDs];
  long long v30 = +[PLBatteryUIResponseTypeUtilities getNonAppBundleIDs];
  uint64_t v29 = +[PLBatteryUIResponseTypeUtilities getWebAppBundleIDsWithResponderService:v6];
  long long v27 = v6;
  char v28 = +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:v6];
  [v5 setObject:&unk_1F400C088 forKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [v5 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        double v12 = (void *)MEMORY[0x1E4F28ED0];
        uint64_t v13 = [v5 objectForKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];
        [v13 doubleValue];
        double v15 = v14;
        id v16 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
        [v16 doubleValue];
        uint64_t v18 = [v12 numberWithDouble:v15 + v17];
        [v5 setObject:v18 forKeyedSubscript:@"PLBatteryUITotalAccountedEnergyKey"];

        long long v19 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        LOBYTE(v18) = [v32 containsObject:v19];

        long long v20 = &unk_1F400C0A0;
        if ((v18 & 1) == 0)
        {
          long long v21 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
          char v22 = [v30 containsObject:v21];

          long long v20 = &unk_1F400C0B8;
          if ((v22 & 1) == 0)
          {
            uint64_t v23 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
            char v24 = [v29 containsObject:v23];

            long long v20 = &unk_1F400C0D0;
            if ((v24 & 1) == 0)
            {
              long long v25 = [v11 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
              long long v26 = [v28 objectForKeyedSubscript:v25];

              if (v26) {
                long long v20 = &unk_1F400C088;
              }
              else {
                long long v20 = &unk_1F400C0E8;
              }
            }
          }
        }
        [v11 setObject:v20 forKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v8);
  }
}

+ (id)getRootNodeBundleIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F40125B0];
}

+ (id)getNonAppBundleIDs
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F40125C8];
}

+ (void)filterEnergyEntriesByAppTypeFromBucket:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"PLBatteryUIAppArrayKey", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        int v12 = [v11 intValue];

        if (v12 != 2 && v12 != 5) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

+ (void)filterEnergyEntriesWithRuntimes:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v40 = v3;
  id obj = [v3 objectForKeyedSubscript:@"PLBatteryUIAppArrayKey"];
  uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v43;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v43 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v42 + 1) + 8 * v8);
        uint64_t v10 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
        id v11 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppTypeKey"];
        if ([v11 intValue] == 1)
        {

LABEL_9:
          if (([v10 isEqualToString:@"HLS"] & 1) != 0
            || ([v10 isEqualToString:@"Siri"] & 1) != 0
            || ([v10 isEqualToString:@"DeletedApp"] & 1) != 0
            || ([v10 isEqualToString:@"DeletedAppClip"] & 1) != 0
            || [v10 isEqualToString:@"DeletedAppAndAppClip"])
          {
            uint64_t v13 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
            [v13 doubleValue];
            double v15 = v14;

            if (v15 < 60.0)
            {
              long long v16 = @"PLBatteryUIAppForegroundRuntimeKey";
              if (v15 > 0.0) {
                goto LABEL_16;
              }
            }
          }
          else
          {
            if ([v10 isEqualToString:@"Flashlight"])
            {
              uint64_t v29 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
              [v29 doubleValue];
              double v31 = v30;

              if (v31 >= 60.0) {
                goto LABEL_17;
              }
              BOOL v32 = v31 <= 0.0;
            }
            else
            {
              if (![v10 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"]) {
                goto LABEL_17;
              }
              long long v33 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
              [v33 doubleValue];
              double v35 = v34;

              long long v36 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
              [v36 doubleValue];
              double v38 = v37;

              if (v35 >= 60.0) {
                goto LABEL_17;
              }
              BOOL v32 = v38 <= 2.0;
            }
            long long v16 = @"PLBatteryUIAppBackgroundRuntimeKey";
            if (!v32) {
              goto LABEL_16;
            }
          }
LABEL_17:
          objc_msgSend(v4, "addObject:", v9, v16);
          goto LABEL_18;
        }
        char v12 = [v10 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"];

        if (v12) {
          goto LABEL_9;
        }
        long long v17 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
        [v17 doubleValue];
        double v19 = v18;

        if (!+[PLBatteryUIResponseTypeUtilities energyEntryHasNegligibleEnergyDrain:v9 filterArray:v4])
        {
          if (v19 > 0.0 && v19 < 60.0)
          {
            long long v21 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];
            [v21 doubleValue];
            double v23 = v22;

            char v24 = [MEMORY[0x1E4F28ED0] numberWithDouble:60.0 / v19 * v23];
            [v9 setObject:v24 forKeyedSubscript:@"PLBatteryUIAppForegroundPluggedInRuntimeKey"];

            [v9 setObject:&unk_1F400C100 forKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
          }
          long long v25 = [v9 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
          [v25 doubleValue];
          double v27 = v26;

          BOOL v28 = v27 > 0.0 && v27 < 60.0;
          long long v16 = @"PLBatteryUIAppAlwaysOnRuntimeKey";
          if (!v28) {
            goto LABEL_17;
          }
LABEL_16:
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1F400C100);
          goto LABEL_17;
        }
LABEL_18:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v39 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v6 = v39;
    }
    while (v39);
  }

  [v40 setObject:v4 forKeyedSubscript:@"PLBatteryUIAppArrayKey"];
}

+ (BOOL)energyEntryHasNegligibleEnergyDrain:(id)a3 filterArray:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppBundleIDKey"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppForegroundRuntimeKey"];
  [v8 doubleValue];
  double v10 = v9;

  id v11 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppBackgroundRuntimeKey"];
  [v11 doubleValue];
  double v13 = v12;

  double v14 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppAlwaysOnRuntimeKey"];
  [v14 doubleValue];
  double v16 = v15;

  if (v16 <= 0.0)
  {
    if (v10 == 0.0 && v13 < 60.0)
    {
      if ([v7 isEqualToString:@"com.apple.findmy"])
      {
        long long v17 = [&unk_1F40125E0 objectAtIndexedSubscript:59];
        double v18 = [v5 objectForKeyedSubscript:v17];
        [v18 doubleValue];
        double v20 = v19;

        if (v20 > 0.0)
        {
          long long v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            +[PLBatteryUIResponseTypeUtilities energyEntryHasNegligibleEnergyDrain:filterArray:](v21, v22, v23, v24, v25, v26, v27, v28);
          }

          [v6 addObject:v5];
        }
      }
LABEL_15:
      BOOL v32 = 1;
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"PowerOutAccessories"])
    {
      uint64_t v29 = [v5 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
      [v29 doubleValue];
      double v31 = v30;

      if (v31 < 33.3)
      {
        long long v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = 138412546;
          long long v36 = v7;
          __int16 v37 = 2048;
          double v38 = v31;
          _os_log_impl(&dword_1E4220000, v33, OS_LOG_TYPE_DEFAULT, "removing %@ due to energy: %.2f", (uint8_t *)&v35, 0x16u);
        }

        goto LABEL_15;
      }
    }
  }
  BOOL v32 = 0;
LABEL_16:

  return v32;
}

+ (id)getDeletedAppBundleIDsWithResponderService:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 sharedUtilityCache];
  id v5 = [v4 objectForKeyedSubscript:@"BatteryBreakdown"];
  id v6 = [v5 objectForKey:@"DeletedAppBundleIDs"];

  uint64_t v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getDeletedAppBundleIDsWithResponderService:]();
    }

    double v9 = [v3 sharedUtilityCache];
    double v10 = [v9 objectForKeyedSubscript:@"BatteryBreakdown"];
    id v11 = [v10 objectForKey:@"DeletedAppBundleIDs"];
  }
  else
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getDeletedAppBundleIDsWithResponderService:]();
    }

    double v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_DEFAULT, "Searching for deleted app names", buf, 2u);
    }

    uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F400C088 withComparisonOperation:1];
    int v35 = v3;
    double v15 = [v3 storage];
    long long v33 = (void *)v14;
    v46[0] = v14;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    double v34 = (void *)v13;
    long long v17 = [v15 entriesForKey:v13 withComparisons:v16];

    double v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v42 = v17;
      _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
    }

    long long v36 = [MEMORY[0x1E4F1CA80] set];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v25 = [v24 objectForKeyedSubscript:@"AppBundleId"];
          uint64_t v26 = [v24 objectForKeyedSubscript:@"AppIsClip"];
          uint64_t v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = [v26 intValue];
            *(_DWORD *)buf = 138412546;
            long long v42 = v25;
            __int16 v43 = 1024;
            int v44 = v28;
            _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v25 && ([v26 BOOLValue] & 1) == 0) {
            [v36 addObject:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v21);
    }

    uint64_t v29 = PLLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v42 = v36;
      _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
    }

    id v3 = v35;
    double v30 = [v35 sharedUtilityCache];
    double v31 = [v30 objectForKeyedSubscript:@"BatteryBreakdown"];
    [v31 setObject:v36 forKeyedSubscript:@"DeletedAppBundleIDs"];

    id v11 = (void *)[v36 copy];
    double v10 = v33;
    double v9 = v34;
  }

  return v11;
}

+ (id)getDeletedAppClipBundleIDsWithResponderService:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 sharedUtilityCache];
  id v5 = [v4 objectForKeyedSubscript:@"BatteryBreakdown"];
  id v6 = [v5 objectForKey:@"DeletedAppClipBundleIDs"];

  uint64_t v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getDeletedAppClipBundleIDsWithResponderService:]();
    }

    double v9 = [v3 sharedUtilityCache];
    double v10 = [v9 objectForKeyedSubscript:@"BatteryBreakdown"];
    id v11 = [v10 objectForKey:@"DeletedAppClipBundleIDs"];
  }
  else
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getDeletedAppClipBundleIDsWithResponderService:]();
    }

    double v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: Searching for deleted app clip names", buf, 2u);
    }

    uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F400C088 withComparisonOperation:1];
    int v35 = v3;
    double v15 = [v3 storage];
    long long v33 = (void *)v14;
    v46[0] = v14;
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    double v34 = (void *)v13;
    long long v17 = [v15 entriesForKey:v13 withComparisons:v16];

    double v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v42 = v17;
      _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: DeletedAppEntries = %@", buf, 0xCu);
    }

    long long v36 = [MEMORY[0x1E4F1CA80] set];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v25 = [v24 objectForKeyedSubscript:@"AppBundleId"];
          uint64_t v26 = [v24 objectForKeyedSubscript:@"AppIsClip"];
          uint64_t v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            int v28 = [v26 intValue];
            *(_DWORD *)buf = 138412546;
            long long v42 = v25;
            __int16 v43 = 1024;
            int v44 = v28;
            _os_log_impl(&dword_1E4220000, v27, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: bundleID=%@, appIsClip=%d", buf, 0x12u);
          }

          if (v25 && [v26 BOOLValue]) {
            [v36 addObject:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v21);
    }

    uint64_t v29 = PLLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v42 = v36;
      _os_log_impl(&dword_1E4220000, v29, OS_LOG_TYPE_DEFAULT, "Battery UI Response Type Utilities: DeletedAppNames = %@", buf, 0xCu);
    }

    id v3 = v35;
    double v30 = [v35 sharedUtilityCache];
    double v31 = [v30 objectForKeyedSubscript:@"BatteryBreakdown"];
    [v31 setObject:v36 forKeyedSubscript:@"DeletedAppClipBundleIDs"];

    id v11 = (void *)[v36 copy];
    double v10 = v33;
    double v9 = v34;
  }

  return v11;
}

+ (id)getWebAppBundleIDsWithResponderService:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 sharedUtilityCache];
  id v5 = [v4 objectForKeyedSubscript:@"BatteryBreakdown"];
  id v6 = [v5 objectForKey:@"WebAppBundleIDs"];

  uint64_t v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getWebAppBundleIDsWithResponderService:]();
    }

    double v9 = [v3 sharedUtilityCache];
    double v10 = [v9 objectForKeyedSubscript:@"BatteryBreakdown"];
    uint64_t v11 = [v10 objectForKey:@"WebAppBundleIDs"];
  }
  else
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getWebAppBundleIDsWithResponderService:]();
    }

    double v9 = [MEMORY[0x1E4F929E0] entryKeyForOperatorName:@"PLXPCAgent" withType:*MEMORY[0x1E4F92D30] withName:@"WebApp"];
    double v10 = [MEMORY[0x1E4F1CA80] set];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v12 = objc_msgSend(v3, "storage", 0);
    uint64_t v13 = [v12 entriesForKey:v9];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v19 = [v18 objectForKeyedSubscript:@"identifier"];

          if (v19)
          {
            uint64_t v20 = [v18 objectForKeyedSubscript:@"identifier"];
            [v10 addObject:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    uint64_t v21 = [v3 sharedUtilityCache];
    uint64_t v22 = [v21 objectForKeyedSubscript:@"BatteryBreakdown"];
    [v22 setObject:v10 forKeyedSubscript:@"WebAppBundleIDs"];

    uint64_t v11 = [v10 copy];
  }
  uint64_t v23 = (void *)v11;

  return v23;
}

+ (id)getPluginBundleIDToEntryMapWithResponderService:(id)a3
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 sharedUtilityCache];
  id v5 = [v4 objectForKeyedSubscript:@"BatteryBreakdown"];
  id v6 = [v5 objectForKey:@"PluginBundleIDs"];

  uint64_t v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]();
    }

    double v9 = [v3 sharedUtilityCache];
    double v10 = [v9 objectForKeyedSubscript:@"BatteryBreakdown"];
    uint64_t v11 = [v10 objectForKey:@"PluginBundleIDs"];
  }
  else
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]();
    }

    uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllPlugins"];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"PluginDeletedDate" withValue:&unk_1F400C088 withComparisonOperation:0];
    uint64_t v14 = [v3 storage];
    long long v66 = (void *)v13;
    v89[0] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:1];
    long long v67 = (void *)v12;
    uint64_t v16 = [v14 entriesForKey:v12 withComparisons:v15];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v17 = objc_opt_class();
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke;
      v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v84[4] = v17;
      if (getPluginBundleIDToEntryMapWithResponderService__defaultOnce != -1) {
        dispatch_once(&getPluginBundleIDToEntryMapWithResponderService__defaultOnce, v84);
      }
      if (getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled)
      {
        double v18 = [NSString stringWithFormat:@"installedPluginEntries=%@", v16];
        id v19 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
        uint64_t v21 = [v20 lastPathComponent];
        uint64_t v22 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]"];
        [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:683];

        uint64_t v23 = PLLogCommon();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          +[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]((uint64_t)v18, v23, v24, v25, v26, v27, v28, v29);
        }
      }
    }
    long long v68 = v3;
    __int16 v73 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = v16;
    uint64_t v30 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
    unint64_t v31 = 0x1E4F92000uLL;
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = *(void *)v81;
      do
      {
        uint64_t v34 = 0;
        uint64_t v70 = v32;
        do
        {
          if (*(void *)v81 != v33) {
            objc_enumerationMutation(obj);
          }
          int v35 = *(void **)(*((void *)&v80 + 1) + 8 * v34);
          long long v36 = [v35 objectForKeyedSubscript:@"PluginId"];
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v37 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_441;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v37;
            if (getPluginBundleIDToEntryMapWithResponderService__defaultOnce_439 != -1) {
              dispatch_once(&getPluginBundleIDToEntryMapWithResponderService__defaultOnce_439, block);
            }
            if (getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_440)
            {
              uint64_t v38 = v33;
              long long v39 = [NSString stringWithFormat:@"pluginBundleID=%@", v36];
              long long v40 = (void *)MEMORY[0x1E4F929B8];
              v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
              long long v42 = [v41 lastPathComponent];
              __int16 v43 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]"];
              [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:688];

              int v44 = PLLogCommon();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v87 = v39;
                _os_log_debug_impl(&dword_1E4220000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v31 = 0x1E4F92000uLL;
              uint64_t v33 = v38;
              uint64_t v32 = v70;
            }
          }
          [v73 setObject:v35 forKeyedSubscript:v36];

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
      }
      while (v32);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v45 = +[PLBatteryUIResponseTypeUtilities getInstalledPluginEntries];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v75 objects:v85 count:16];
    uint64_t v11 = v73;
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v72 = *(void *)v76;
      long long v69 = v45;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v76 != v72) {
            objc_enumerationMutation(v45);
          }
          long long v49 = *(void **)(*((void *)&v75 + 1) + 8 * v48);
          long long v50 = [v49 objectForKeyedSubscript:@"PluginId"];
          long long v51 = [v49 objectForKeyedSubscript:@"PluginParentApp"];
          long long v52 = [v11 objectForKeyedSubscript:v50];

          if (!v52)
          {
            if ([*(id *)(v31 + 2496) debugEnabled])
            {
              uint64_t v53 = objc_opt_class();
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_447;
              v74[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v74[4] = v53;
              if (getPluginBundleIDToEntryMapWithResponderService__defaultOnce_445 != -1) {
                dispatch_once(&getPluginBundleIDToEntryMapWithResponderService__defaultOnce_445, v74);
              }
              if (getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_446)
              {
                long long v54 = NSString;
                long long v55 = [v49 objectForKeyedSubscript:@"PluginExecutableName"];
                long long v56 = [v49 objectForKeyedSubscript:@"PluginType"];
                long long v57 = [v54 stringWithFormat:@"pluginExecutableName=%@, pluginBundleID=%@, pluginParentApp=%@, pluginType=%@", v55, v50, v51, v56];

                long long v58 = (void *)MEMORY[0x1E4F929B8];
                long long v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
                v60 = [v59 lastPathComponent];
                uint64_t v61 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities getPluginBundleIDToEntryMapWithResponderService:]"];
                [v58 logMessage:v57 fromFile:v60 fromFunction:v61 fromLineNumber:699];

                id v62 = PLLogCommon();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v87 = v57;
                  _os_log_debug_impl(&dword_1E4220000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                unint64_t v31 = 0x1E4F92000;
                uint64_t v11 = v73;
                long long v45 = v69;
              }
            }
            [v11 setObject:v49 forKeyedSubscript:v50];
          }

          ++v48;
        }
        while (v47 != v48);
        uint64_t v47 = [v45 countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v47);
    }

    id v3 = v68;
    uint64_t v63 = [v68 sharedUtilityCache];
    uint64_t v64 = [v63 objectForKeyedSubscript:@"BatteryBreakdown"];
    [v64 setObject:v11 forKeyedSubscript:@"PluginBundleIDs"];

    double v10 = v66;
    double v9 = v67;
  }

  return v11;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled = result;
  return result;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_441(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_440 = result;
  return result;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getPluginBundleIDToEntryMapWithResponderService___block_invoke_447(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getPluginBundleIDToEntryMapWithResponderService__classDebugEnabled_446 = result;
  return result;
}

+ (id)getBundleIDToDisplayNameMapWithResponderService:(id)a3
{
  v86[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 sharedUtilityCache];
  id v5 = [v4 objectForKeyedSubscript:@"BatteryBreakdown"];
  id v6 = [v5 objectForKey:@"BundleIDs"];

  uint64_t v7 = PLLogCommon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (v8) {
      +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.4();
    }

    uint64_t v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"AllApps"];
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"AppDeletedDate" withValue:&unk_1F400C088 withComparisonOperation:0];
    id v68 = v3;
    uint64_t v14 = [v3 storage];
    long long v66 = (void *)v13;
    v86[0] = v13;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:1];
    long long v67 = (void *)v12;
    uint64_t v16 = [v14 entriesForKey:v12 withComparisons:v15];

    long long v71 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v24 = v16;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v78 objects:v85 count:16];
    unint64_t v26 = 0x1E4F92000uLL;
    uint64_t v70 = v24;
    if (v25)
    {
      uint64_t v27 = v25;
      uint64_t v28 = *(void *)v79;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v79 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void **)(*((void *)&v78 + 1) + 8 * v29);
          unint64_t v31 = [v30 objectForKeyedSubscript:@"AppType"];
          int v32 = [v31 intValue];

          if (v32 == 101
            || ([v30 objectForKeyedSubscript:@"AppBundleId"],
                uint64_t v33 = objc_claimAutoreleasedReturnValue(),
                int v34 = [v33 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"],
                v33,
                v34))
          {
            int v35 = [v30 objectForKeyedSubscript:@"AppBundleId"];
            long long v36 = [v30 objectForKeyedSubscript:@"AppName"];
            if ([*(id *)(v26 + 2496) debugEnabled])
            {
              uint64_t v37 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v37;
              if (getBundleIDToDisplayNameMapWithResponderService__defaultOnce != -1) {
                dispatch_once(&getBundleIDToDisplayNameMapWithResponderService__defaultOnce, block);
              }
              if (getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled)
              {
                uint64_t v38 = [NSString stringWithFormat:@"bundleID=%@, displayName=%@", v35, v36];
                long long v39 = (void *)MEMORY[0x1E4F929B8];
                long long v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
                v41 = [v40 lastPathComponent];
                long long v42 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]"];
                [v39 logMessage:v38 fromFile:v41 fromFunction:v42 fromLineNumber:733];

                __int16 v43 = PLLogCommon();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v38;
                  _os_log_debug_impl(&dword_1E4220000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                id v24 = v70;
                unint64_t v26 = 0x1E4F92000;
              }
            }
            [v71 setObject:v36 forKeyedSubscript:v35];
          }
          else
          {
            int v35 = PLLogCommon();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
              +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]();
            }
          }

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v24 countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v27);
    }

    int v44 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v73 objects:v82 count:16];
    unint64_t v46 = 0x1E6E46000uLL;
    if (!v45)
    {
LABEL_51:
      [v71 setObject:@"Apple Watch" forKeyedSubscript:@"com.apple.Bridge"];
      uint64_t v11 = (void *)[v71 copy];

      double v9 = v67;
      id v3 = v68;
      double v10 = v66;
      goto LABEL_52;
    }
    uint64_t v47 = v45;
    uint64_t v48 = *(void *)v74;
    long long v69 = v44;
LABEL_30:
    uint64_t v49 = 0;
    while (1)
    {
      if (*(void *)v74 != v48) {
        objc_enumerationMutation(v44);
      }
      long long v50 = *(void **)(*((void *)&v73 + 1) + 8 * v49);
      if (([v50 mayBeBUIVisible] & 1) != 0
        || ([v50 bundleIdentifier],
            long long v51 = objc_claimAutoreleasedReturnValue(),
            int v52 = [v51 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"],
            v51,
            v52))
      {
        if (([*(id *)(v46 + 2984) hasScreenPresence:v50] & 1) == 0)
        {
          uint64_t v53 = [v50 bundleIdentifier];
          int v54 = [v53 isEqualToString:@"com.apple.NanoUniverse.AegirProxyApp"];

          if (!v54) {
            goto LABEL_49;
          }
        }
        long long v55 = [v50 bundleIdentifier];
        long long v56 = [v71 objectForKeyedSubscript:v55];

        if (!v56)
        {
          long long v57 = [v50 localizedName];
          if ([MEMORY[0x1E4F929C0] debugEnabled])
          {
            uint64_t v58 = objc_opt_class();
            v72[0] = MEMORY[0x1E4F143A8];
            v72[1] = 3221225472;
            v72[2] = __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke_469;
            v72[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v72[4] = v58;
            if (getBundleIDToDisplayNameMapWithResponderService__defaultOnce_467 != -1) {
              dispatch_once(&getBundleIDToDisplayNameMapWithResponderService__defaultOnce_467, v72);
            }
            if (getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled_468)
            {
              long long v59 = [NSString stringWithFormat:@"bundleID=%@, displayName=%@", v55, v57];
              v60 = (void *)MEMORY[0x1E4F929B8];
              uint64_t v61 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeUtilities.m"];
              id v62 = [v61 lastPathComponent];
              uint64_t v63 = [NSString stringWithUTF8String:"+[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]"];
              [v60 logMessage:v59 fromFile:v62 fromFunction:v63 fromLineNumber:751];

              uint64_t v64 = PLLogCommon();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v84 = v59;
                _os_log_debug_impl(&dword_1E4220000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              unint64_t v46 = 0x1E6E46000;
              int v44 = v69;
            }
          }
          [v71 setObject:v57 forKeyedSubscript:v55];
        }
      }
      else
      {
        long long v55 = PLLogCommon();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
          +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:]();
        }
      }

LABEL_49:
      if (v47 == ++v49)
      {
        uint64_t v47 = [v44 countByEnumeratingWithState:&v73 objects:v82 count:16];
        if (!v47) {
          goto LABEL_51;
        }
        goto LABEL_30;
      }
    }
  }
  if (v8) {
    +[PLBatteryUIResponseTypeUtilities getBundleIDToDisplayNameMapWithResponderService:].cold.5();
  }

  double v9 = [v3 sharedUtilityCache];
  double v10 = [v9 objectForKeyedSubscript:@"BatteryBreakdown"];
  uint64_t v11 = [v10 objectForKey:@"BundleIDs"];
LABEL_52:

  return v11;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled = result;
  return result;
}

uint64_t __84__PLBatteryUIResponseTypeUtilities_getBundleIDToDisplayNameMapWithResponderService___block_invoke_469(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  getBundleIDToDisplayNameMapWithResponderService__classDebugEnabled_468 = result;
  return result;
}

+ (id)getInstalledPluginEntries
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v29 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v2 = [MEMORY[0x1E4F223A0] enumeratorWithOptions:0];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v35;
    uint64_t v30 = *MEMORY[0x1E4F92D40];
    do
    {
      uint64_t v6 = 0;
      uint64_t v31 = v4;
      do
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
        uint64_t v8 = [v7 bundleIdentifier];
        if (!v8) {
          goto LABEL_20;
        }
        double v9 = (void *)v8;
        uint64_t v10 = [v7 executableURL];
        if (!v10) {
          goto LABEL_19;
        }
        uint64_t v11 = (void *)v10;
        uint64_t v12 = [v7 containingBundleRecord];
        if (!v12) {
          goto LABEL_12;
        }
        uint64_t v33 = [v7 containingBundleRecord];
        uint64_t v13 = [v33 bundleIdentifier];
        if (!v13)
        {
          int v32 = 0;
LABEL_12:
          uint64_t v15 = v5;
          uint64_t v16 = v2;
          uint64_t v17 = [v7 extensionPointRecord];
          uint64_t v18 = [v17 identifier];
          int v14 = [v18 isEqualToString:@"com.apple.posterkit.provider"];

          if (!v12)
          {

            v2 = v16;
            uint64_t v5 = v15;
            uint64_t v4 = v31;
            if (!v14) {
              goto LABEL_20;
            }
LABEL_17:
            id v19 = objc_alloc(MEMORY[0x1E4F929D0]);
            uint64_t v20 = +[PLOperator entryKeyForType:v30 andName:@"AllPlugins"];
            double v9 = (void *)[v19 initWithEntryKey:v20];

            uint64_t v21 = [v7 bundleIdentifier];
            [v9 setObject:v21 forKeyedSubscript:@"PluginId"];

            uint64_t v22 = [v7 containingBundleRecord];
            uint64_t v23 = [v22 bundleIdentifier];
            [v9 setObject:v23 forKeyedSubscript:@"PluginParentApp"];

            id v24 = [v7 extensionPointRecord];
            uint64_t v25 = [v24 identifier];
            [v9 setObject:v25 forKeyedSubscript:@"PluginType"];

            unint64_t v26 = [v7 executableURL];
            uint64_t v27 = [v26 path];
            [v9 setObject:v27 forKeyedSubscript:@"PluginExecutableName"];

            [v9 setObject:&unk_1F400C088 forKeyedSubscript:@"PluginDeletedDate"];
            if (!v9) {
              goto LABEL_20;
            }
            [v29 addObject:v9];
LABEL_19:

            goto LABEL_20;
          }
          v2 = v16;
          uint64_t v5 = v15;
          uint64_t v4 = v31;
          uint64_t v13 = v32;
          goto LABEL_14;
        }
        LOBYTE(v14) = 1;
LABEL_14:
        int v32 = v13;

        if (v14) {
          goto LABEL_17;
        }
LABEL_20:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v4);
  }

  return v29;
}

+ (id)getBundleIDToReplacementBundleIDMap
{
  v150[169] = *MEMORY[0x1E4F143B8];
  v10[0] = @"IMRemoteURLConn";
  v10[1] = @"IMRemoteURLConne";
  v150[0] = @"com.apple.MobileSMS";
  v150[1] = @"com.apple.MobileSMS";
  v10[2] = @"com.apple.mobilesms.notification";
  v10[3] = @"GenerativePlaygroundApp.MessagesExtension";
  v150[2] = @"com.apple.MobileSMS";
  v150[3] = @"com.apple.MobileSMS";
  void v10[4] = @"com.apple.GenerativePlaygroundApp.MessagesExtension";
  v10[5] = @"mstreamd";
  v150[4] = @"com.apple.MobileSMS";
  v150[5] = @"com.apple.mobileslideshow";
  v10[6] = @"mediastream.mstreamd";
  v10[7] = @"assetsd";
  v150[6] = @"com.apple.mobileslideshow";
  v150[7] = @"com.apple.mobileslideshow";
  v10[8] = @"cloudphotod";
  v10[9] = @"com.apple.mobileslideshow.Discretionary";
  v150[8] = @"com.apple.mobileslideshow";
  v150[9] = @"com.apple.mobileslideshow";
  v10[10] = @"com.apple.icloud-container.com.apple.photos.cloud";
  v10[11] = @"com.apple.photoanalysisd";
  v150[10] = @"com.apple.mobileslideshow";
  v150[11] = @"com.apple.mobileslideshow";
  v10[12] = @"com.apple.photoanalysisd.backgroundanalysis";
  v10[13] = @"com.apple.photos.cloud";
  v150[12] = @"com.apple.mobileslideshow";
  v150[13] = @"com.apple.mobileslideshow";
  v10[14] = @"WirelessRadioManager";
  v10[15] = @"WirelessRadioManagerd";
  v150[14] = @"com.apple.mobilephone";
  v150[15] = @"com.apple.mobilephone";
  v10[16] = @"WirelessRadioMa";
  v10[17] = @"vmd";
  v150[16] = @"com.apple.mobilephone";
  v150[17] = @"com.apple.mobilephone";
  v10[18] = @"ipTelephony";
  v10[19] = @"ContactsUI.MonogramPosterExtension";
  v150[18] = @"com.apple.mobilephone";
  v150[19] = @"com.apple.mobilephone";
  v10[20] = @"com.apple.ContactsUI.MonogramPosterExtension";
  v10[21] = @"com.apple.MailCompositionService";
  v150[20] = @"com.apple.mobilephone";
  v150[21] = @"com.apple.mobilemail";
  v10[22] = @"MailCompositionService";
  v10[23] = @"suggestd";
  v150[22] = @"com.apple.mobilemail";
  v150[23] = @"com.apple.mobilemail";
  v10[24] = @"email.maild";
  v10[25] = @"com.apple.email.maild";
  v150[24] = @"com.apple.mobilemail";
  v150[25] = @"com.apple.mobilemail";
  v10[26] = @"maild";
  v10[27] = @"com.apple.springboard.lockscreen.navigation";
  v150[26] = @"com.apple.mobilemail";
  v150[27] = @"com.apple.Maps";
  uint64_t v2 = *MEMORY[0x1E4F625C0];
  v10[28] = @"com.apple.Siri";
  uint64_t v11 = v2;
  v150[28] = @"Siri";
  v150[29] = @"Siri";
  uint64_t v12 = @"assistantd";
  uint64_t v13 = @"com.apple.WebKit.Networking";
  v150[30] = @"Siri";
  v150[31] = @"com.apple.mobilesafari";
  int v14 = @"com.apple.WebKit.WebContent";
  uint64_t v15 = @"com.apple.WebKit";
  v150[32] = @"com.apple.mobilesafari";
  v150[33] = @"com.apple.mobilesafari";
  uint64_t v16 = @"com.apple.WebKi";
  uint64_t v17 = @"com.apple.SafariViewService";
  v150[34] = @"com.apple.mobilesafari";
  v150[35] = @"com.apple.mobilesafari";
  uint64_t v18 = @"safarifetcherd";
  id v19 = @"com.apple.WebKit.WebContent.CaptivePortal";
  v150[36] = @"com.apple.mobilesafari";
  v150[37] = @"com.apple.mobilesafari";
  uint64_t v20 = @"com.apple.WebKit.WebContent.Development";
  uint64_t v21 = @"com.apple.WebKit.GPU";
  v150[38] = @"com.apple.mobilesafari";
  v150[39] = @"com.apple.mobilesafari";
  uint64_t v22 = @"com.apple.WebKit.GPU.Development";
  uint64_t v23 = @"com.apple.PassKitCore";
  v150[40] = @"com.apple.mobilesafari";
  v150[41] = @"com.apple.Passbook";
  id v24 = @"passd";
  uint64_t v25 = @"PassbookUIService";
  v150[42] = @"com.apple.Passbook";
  v150[43] = @"com.apple.Passbook";
  unint64_t v26 = @"com.apple.PassbookUIService";
  uint64_t v27 = @"com.apple.calendar";
  v150[44] = @"com.apple.Passbook";
  v150[45] = @"com.apple.mobilecal";
  uint64_t v3 = *MEMORY[0x1E4FA6F40];
  uint64_t v28 = @"calaccessd";
  uint64_t v29 = v3;
  v150[46] = @"com.apple.mobilecal";
  v150[47] = @"HLS";
  uint64_t v4 = *MEMORY[0x1E4FA6F30];
  uint64_t v30 = *MEMORY[0x1E4FA6F68];
  uint64_t v31 = v4;
  v150[48] = @"HLS";
  v150[49] = @"HLS";
  uint64_t v5 = *MEMORY[0x1E4F625B0];
  uint64_t v32 = *MEMORY[0x1E4FA6F78];
  v150[50] = @"HLS";
  v150[51] = @"HLS";
  objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", v5, @"aod", @"IMRemoteURLConn", @"IMRemoteURLConne", @"com.apple.mobilesms.notification", @"GenerativePlaygroundApp.MessagesExtension", @"com.apple.GenerativePlaygroundApp.MessagesExtension", @"mstreamd", @"mediastream.mstreamd", @"assetsd", @"cloudphotod", @"com.apple.mobileslideshow.Discretionary", @"com.apple.icloud-container.com.apple.photos.cloud", @"com.apple.photoanalysisd", @"com.apple.photoanalysisd.backgroundanalysis", @"com.apple.photos.cloud",
    @"WirelessRadioManager",
    @"WirelessRadioManagerd",
    @"WirelessRadioMa",
    @"vmd",
    @"ipTelephony",
    @"ContactsUI.MonogramPosterExtension",
    @"com.apple.ContactsUI.MonogramPosterExtension",
    @"com.apple.MailCompositionService",
    @"MailCompositionService",
    @"suggestd",
    @"email.maild",
    @"com.apple.email.maild",
    @"maild",
    @"com.apple.springboard.lockscreen.navigation",
    @"com.apple.Siri",
    v11,
    @"assistantd",
    @"com.apple.WebKit.Networking",
    @"com.apple.WebKit.WebContent",
    @"com.apple.WebKit",
    @"com.apple.WebKi",
    @"com.apple.SafariViewService",
    @"safarifetcherd",
    @"com.apple.WebKit.WebContent.CaptivePortal",
    @"com.apple.WebKit.WebContent.Development",
    @"com.apple.WebKit.GPU",
    @"com.apple.WebKit.GPU.Development",
    @"com.apple.PassKitCore",
    @"passd",
    @"PassbookUIService",
    @"com.apple.PassbookUIService",
    @"com.apple.calendar",
    @"calaccessd",
    v29,
    v30,
    v31,
    v32,
  uint64_t v6 = v5);
  uint64_t v7 = *MEMORY[0x1E4F625A8];
  uint64_t v33 = v6;
  uint64_t v34 = v7;
  v150[52] = @"HLS";
  v150[53] = @"HLS";
  uint64_t v35 = *MEMORY[0x1E4F625B8];
  long long v36 = @"LockScreen";
  v150[54] = @"HLS";
  v150[55] = @"HLS";
  long long v37 = @"com.apple.PosterBoard";
  uint64_t v38 = @"PosterBoard";
  v150[56] = @"HLS";
  v150[57] = @"HLS";
  uint64_t v39 = @"com.apple.MobileBackup.framework";
  long long v40 = @"backupd";
  v150[58] = @"Backup";
  v150[59] = @"Backup";
  v41 = @"com.apple.backupd";
  long long v42 = @"softwareupdateservicesd";
  v150[60] = @"Backup";
  v150[61] = @"Backup";
  __int16 v43 = @"mobile.softwareupdated";
  int v44 = @"com.apple.Restore";
  v150[62] = @"Backup";
  v150[63] = @"com.apple.AppStore";
  uint64_t v45 = @"com.apple.atc";
  v150[64] = @"com.apple.AppStore";
  unint64_t v46 = @"installd";
  v150[65] = @"com.apple.AppStore";
  uint64_t v47 = @"com.apple.StreamingUnzipService";
  v150[66] = @"com.apple.AppStore";
  uint64_t v48 = @"containermanagerd";
  v150[67] = @"com.apple.AppStore";
  uint64_t v49 = @"appstored";
  v150[68] = @"com.apple.AppStore";
  long long v50 = @"OOS";
  v150[69] = @"PoorCellCondition";
  long long v51 = @"healthd";
  v150[70] = @"com.apple.Health";
  int v52 = @"com.apple.healthappd";
  v150[71] = @"com.apple.Health";
  uint64_t v53 = @"misd";
  v150[72] = @"Hotspot";
  int v54 = @"RadarComposeUIService";
  v150[73] = @"com.apple.ist.radar";
  long long v55 = @"remindd";
  v150[74] = @"com.apple.reminders";
  long long v56 = @"homed";
  v150[75] = @"HomeKit";
  long long v57 = @"com.apple.private.alloy.willow";
  v150[76] = @"HomeKit";
  uint64_t v58 = @"atc";
  v150[77] = @"com.apple.Music";
  long long v59 = @"siriactionsd";
  v150[78] = @"com.apple.shortcuts";
  v60 = @"com.apple.WorkflowKit.BackgroundShortcutRunner";
  v150[79] = @"com.apple.shortcuts";
  uint64_t v61 = @"weatherd";
  v150[80] = @"com.apple.weather";
  id v62 = @"synapse.contentlinkingd";
  v150[81] = @"com.apple.mobilenotes";
  uint64_t v63 = @"com.apple.sportsd";
  v150[82] = @"com.apple.tv";
  uint64_t v64 = @"sportsd";
  v150[83] = @"com.apple.tv";
  long long v65 = @"com.apple.continuitycaptured";
  v150[84] = @"com.apple.sidecar.extension.capture";
  long long v66 = @"com.apple.ContinuityCaptureShieldUI";
  v150[85] = @"com.apple.sidecar.extension.capture";
  long long v67 = @"GenerativePlaygroundApp";
  v150[86] = @"com.apple.GenerativePlaygroundApp";
  id v68 = @"eventkitsyncd";
  v150[87] = @"com.apple.mobilecal";
  long long v69 = @"companioncamerad";
  v150[88] = @"com.apple.camera";
  uint64_t v70 = @"nanomailbootstrapd";
  v150[89] = @"com.apple.mobilemail";
  long long v71 = @"nanomapscd";
  v150[90] = @"com.apple.Maps";
  uint64_t v72 = @"companionmessagesd";
  v150[91] = @"com.apple.MobileSMS";
  long long v73 = @"NPKCompanionAgent";
  v150[92] = @"com.apple.Passbook";
  long long v74 = @"tursd";
  v150[93] = @"com.apple.mobilephone";
  long long v75 = @"nptocompaniond";
  v150[94] = @"com.apple.mobileslideshow";
  long long v76 = @"remotemediaservicesd";
  v150[95] = @"com.apple.RemoteMediaServices";
  long long v77 = @"companionfindlocallyd";
  v150[96] = @"com.apple.companionfindlocallyd";
  long long v78 = @"pairedunlockd";
  v150[97] = @"com.apple.pairedunlockd";
  long long v79 = @"nanoweatherprefsd";
  v150[98] = @"com.apple.weather";
  long long v80 = @"com.apple.ess";
  v150[99] = @"com.apple.mobilephone";
  long long v81 = @"com.apple.madrid";
  v150[100] = @"com.apple.MobileSMS";
  long long v82 = @"com.apple.private.alloy.accountssync";
  v150[101] = @"accountsd";
  long long v83 = @"com.apple.private.alloy.addressbooksync";
  v150[102] = @"addressbooksyncd";
  v84 = @"com.apple.private.alloy.appregistrysync";
  v150[103] = @"nanoappregistryd";
  v85 = @"com.apple.private.alloy.audiocontrol.bridge";
  v150[104] = @"com.apple.Bridge";
  v86 = @"com.apple.private.alloy.audiocontrol.music";
  v150[105] = @"com.apple.Music";
  v87 = @"com.apple.private.alloy.bluetoothregistry";
  v150[106] = @"nanoregistryd";
  v88 = @"com.apple.private.alloy.bulletindistributor.settings";
  v150[107] = @"bulletindistributord";
  v89 = @"com.apple.private.alloy.bulletindistributor";
  v150[108] = @"bulletindistributord";
  v90 = @"com.apple.private.alloy.callhistorysync";
  v150[109] = @"CallHistorySyncHelper";
  v91 = @"com.apple.private.alloy.camera.proxy";
  v150[110] = @"com.apple.camera";
  v92 = @"com.apple.private.alloy.continuity.activity";
  v150[111] = @"sharingd";
  v93 = @"com.apple.private.alloy.continuity.auth";
  v150[112] = @"sharingd";
  v94 = @"com.apple.private.alloy.continuity.encryption";
  v150[113] = @"sharingd";
  v95 = @"com.apple.private.alloy.continuity.tethering";
  v150[114] = @"sharingd";
  v96 = @"com.apple.private.alloy.coreduet";
  v150[115] = @"coreduetd";
  v97 = @"com.apple.private.alloy.eventkitsync";
  v150[116] = @"com.apple.mobilecal";
  v98 = @"com.apple.private.alloy.fignero";
  v150[117] = @"mediaserverd";
  v99 = @"com.apple.private.alloy.findmylocaldevice";
  v150[118] = @"com.apple.companionfindlocallyd";
  v100 = @"com.apple.private.alloy.fmf";
  v150[119] = @"fmfd";
  v101 = @"com.apple.private.alloy.health.general";
  v150[120] = @"com.apple.Health";
  v102 = @"com.apple.private.alloy.health.sync";
  v150[121] = @"com.apple.Health";
  v103 = @"com.apple.private.alloy.icloudpairing";
  v150[122] = @"bluetoothd";
  v104 = @"com.apple.private.alloy.idscredentials";
  v150[123] = @"IDSCredentialsAgent";
  v105 = @"com.apple.private.alloy.idsremoteurlconnection";
  v150[124] = @"IDSRemoteURLConnectionAgent";
  v106 = @"com.apple.private.alloy.idstransfers";
  v150[125] = @"IMTransferAgent";
  v107 = @"com.apple.private.alloy.iosdiagnostics";
  v150[126] = @"Diagnostics";
  v108 = @"com.apple.private.alloy.location.auth";
  v150[127] = @"locationd";
  v109 = @"com.apple.private.alloy.location.motion";
  v150[128] = @"locationd";
  v110 = @"com.apple.private.alloy.location.usage";
  v150[129] = @"locationd";
  v111 = @"com.apple.private.alloy.location.wifitilesync";
  v150[130] = @"locationd";
  v112 = @"com.apple.private.alloy.mail.fetches";
  v150[131] = @"com.apple.mobilemail";
  v113 = @"com.apple.private.alloy.mail.sync.accounts";
  v150[132] = @"com.apple.mobilemail";
  v114 = @"com.apple.private.alloy.mail.sync.content";
  v150[133] = @"com.apple.mobilemail";
  v115 = @"com.apple.private.alloy.mail.sync.messages";
  v150[134] = @"com.apple.mobilemail";
  v116 = @"com.apple.private.alloy.maps.proxy";
  v150[135] = @"com.apple.Maps";
  v117 = @"com.apple.private.alloy.maps.sync";
  v150[136] = @"com.apple.Maps";
  v118 = @"com.apple.private.alloy.maps";
  v150[137] = @"com.apple.Maps";
  v119 = @"com.apple.private.alloy.messages";
  v150[138] = @"com.apple.MobileSMS";
  v120 = @"com.apple.private.alloy.nsurlsessionproxy";
  v150[139] = @"sharingd";
  v121 = @"com.apple.private.alloy.otaupdate";
  v150[140] = @"Restore";
  v122 = @"com.apple.private.alloy.pairedunlock";
  v150[141] = @"com.apple.pairedunlockd";
  v123 = @"com.apple.private.alloy.passbook.general";
  v150[142] = @"com.apple.Passbook";
  v124 = @"com.apple.private.alloy.passbook.maintenance";
  v150[143] = @"com.apple.Passbook";
  v125 = @"com.apple.private.alloy.passbook.provisioning";
  v150[144] = @"com.apple.Passbook";
  v126 = @"com.apple.private.alloy.passbook.relevancy";
  v150[145] = @"com.apple.Passbook";
  v127 = @"com.apple.private.alloy.passbook.remoteadmin";
  v150[146] = @"com.apple.Passbook";
  v128 = @"com.apple.private.alloy.pbbridge";
  v150[147] = @"com.apple.Bridge";
  v129 = @"com.apple.private.alloy.phonecontinuity";
  v150[148] = @"com.apple.mobilephone";
  v130 = @"com.apple.private.alloy.photos.proxy";
  v150[149] = @"com.apple.mobileslideshow";
  v131 = @"com.apple.private.alloy.photostream";
  v150[150] = @"com.apple.mobileslideshow";
  v132 = @"com.apple.private.alloy.preferencessync";
  v150[151] = @"nanoprefsyncd";
  v133 = @"com.apple.private.alloy.proxiedcrashcopier";
  v150[152] = @"ProxiedCrashCopier";
  v134 = @"com.apple.private.alloy.pushproxy";
  v150[153] = @"apsd";
  v135 = @"com.apple.private.alloy.remotemediaservices";
  v150[154] = @"com.apple.RemoteMediaServices";
  v136 = @"com.apple.private.alloy.resourcegrabber";
  v150[155] = @"resourcegrabberd";
  v137 = @"com.apple.private.alloy.screenshotter";
  v150[156] = @"screenshotsyncd";
  v138 = @"com.apple.private.alloy.siri.device";
  v150[157] = @"Siri";
  v139 = @"com.apple.private.alloy.siri.location";
  v150[158] = @"Siri";
  v140 = @"com.apple.private.alloy.siri.proxy";
  v150[159] = @"Siri";
  v141 = @"com.apple.private.alloy.sms";
  v150[160] = @"com.apple.MobileSMS";
  v142 = @"com.apple.private.alloy.sockpuppet";
  v150[161] = @"companionappd";
  v143 = @"com.apple.private.alloy.systemsettings";
  v150[162] = @"nanosystemsettingsd";
  v144 = @"com.apple.private.alloy.telephonyutilitiestemporary";
  v150[163] = @"com.apple.mobilephone";
  v145 = @"com.apple.private.alloy.timesync";
  v150[164] = @"timed";
  v146 = @"com.apple.private.alloy.timezonesync";
  v150[165] = @"tzd";
  v147 = @"com.apple.private.alloy.utilitybelt";
  v150[166] = @"com.apple.Bridge";
  v148 = @"com.apple.private.alloy.voicemailsync";
  v150[167] = @"com.apple.mobilephone";
  v149 = @"com.apple.private.alloy.wifi.networksync";
  v150[168] = @"wifid";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:v10 count:169];

  return v8;
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery UI Response Type Utilities: bundleIDsToReplacementBundleIDs is nil", v2, v3, v4, v5, v6);
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery UI Response Type Utilities: bundleIDsToDisplayNames is nil", v2, v3, v4, v5, v6);
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  [v3 doubleValue];
  *uint64_t v1 = 134217984;
  void *v0 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "Battery UI Response Type Utilities: After clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f");
}

+ (void)applyStaticNameTransformation:withResponderService:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"PLBatteryUIAppEnergyValueKey"];
  [v3 doubleValue];
  *uint64_t v1 = 134217984;
  void *v0 = v4;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v5, v6, "Battery UI Response Type Utilities: Before clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f");
}

+ (void)transformPlugins:withResponderService:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Battery UI Response Type Utilities: pluginBundleIDsToEntries is nil", v2, v3, v4, v5, v6);
}

+ (void)energyEntryHasNegligibleEnergyDrain:(uint64_t)a3 filterArray:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getDeletedAppBundleIDsWithResponderService:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for DeletedAppBundleIDs", v2, v3, v4, v5, v6);
}

+ (void)getDeletedAppBundleIDsWithResponderService:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for DeletedAppBundleIDs", v2, v3, v4, v5, v6);
}

+ (void)getDeletedAppClipBundleIDsWithResponderService:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for DeletedAppClipBundleID", v2, v3, v4, v5, v6);
}

+ (void)getDeletedAppClipBundleIDsWithResponderService:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for DeletedAppClipBundleID", v2, v3, v4, v5, v6);
}

+ (void)getWebAppBundleIDsWithResponderService:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for WebAppBundleIDs", v2, v3, v4, v5, v6);
}

+ (void)getWebAppBundleIDsWithResponderService:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for WebAppBundleIDs", v2, v3, v4, v5, v6);
}

+ (void)getPluginBundleIDToEntryMapWithResponderService:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getPluginBundleIDToEntryMapWithResponderService:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for PluginBundleIDToEntryMap", v2, v3, v4, v5, v6);
}

+ (void)getPluginBundleIDToEntryMapWithResponderService:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for PluginBundleIDToEntryMap", v2, v3, v4, v5, v6);
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 bundleIdentifier];
  *uint64_t v1 = 138412290;
  void *v0 = v3;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v4, v5, "Battery UI Response Type Utilities: LSApplicationRecord Skipping non system / non user bundleID=%@");
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  uint64_t v3 = [v2 objectForKeyedSubscript:@"AppBundleId"];
  *uint64_t v1 = 138412290;
  void *v0 = v3;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v4, v5, "Battery UI Response Type Utilities: Skipping non system / non user bundleID=%@");
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1E4220000, a2, a3, "installedAppEntries=%@", a5, a6, a7, a8, 2u);
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache miss for BundleIDToDisplayNameMap", v2, v3, v4, v5, v6);
}

+ (void)getBundleIDToDisplayNameMapWithResponderService:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "PLBatteryUIResponseTypeUtilities: Cache hit for BundleIDToDisplayNameMap", v2, v3, v4, v5, v6);
}

@end