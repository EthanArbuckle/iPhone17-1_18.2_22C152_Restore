@interface PLConfigAgent
+ (id)accountingGroupDefinitions;
+ (id)defaults;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionAmbientMode;
+ (id)entryEventForwardDefinitionContinuityCamera;
+ (id)entryEventForwardDefinitionFeatureFlag;
+ (id)entryEventForwardDefinitionKeyboardClicks;
+ (id)entryEventForwardDefinitionKeyboardHaptics;
+ (id)entryEventForwardDefinitionPhotoSharing;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardDefintionRinger;
+ (id)entryEventNoneDefinitionAdapterInformation;
+ (id)entryEventNoneDefinitionConfig;
+ (id)entryEventNoneDefinitionPairedDeviceConfig;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)getVersionDirectory:(int64_t)a3;
+ (id)railDefinitions;
+ (int64_t)getOSVersionNumber;
+ (void)load;
+ (void)removeFilesFromPath:(id)a3 withMaxFiles:(int64_t)a4;
+ (void)resetRAPIDTaskingConfig;
- (BOOL)disableCABlanking;
- (BOOL)getMDMStatus;
- (BOOL)noWatchdogs;
- (PLCFNotificationOperatorComposition)consoleModeListener;
- (PLCFNotificationOperatorComposition)notificationKeyboardClicks;
- (PLCFNotificationOperatorComposition)notificationKeyboardHaptics;
- (PLCFNotificationOperatorComposition)sysdiagnoseStartListener;
- (PLCFNotificationOperatorComposition)sysdiagnoseStopListener;
- (PLConfigAgent)init;
- (PLIOKitOperatorComposition)iokitExpertDevice;
- (PLXPCListenerOperatorComposition)ambientModeListener;
- (PLXPCListenerOperatorComposition)buddyDataListener;
- (PLXPCListenerOperatorComposition)continuityCameraNotification;
- (PLXPCListenerOperatorComposition)photoSharingListener;
- (double)logDeviceDiskSize;
- (id)baseband;
- (id)basebandFirmware;
- (id)deviceName;
- (id)deviceShutdownReasons;
- (id)getCoverGlass;
- (id)getDeviceSerialNumber;
- (id)getShutdownBootReason:(BOOL)a3;
- (id)getSplatVersionString;
- (id)hwBoardRevision;
- (id)hwConfig;
- (id)logAndUpdateLastBuild:(id)a3;
- (id)logAndUpdateLastUpgradeTime:(id)a3;
- (id)logIcloudAccountType;
- (id)logLastBackupTime;
- (id)logLastUpgradeSystemTimestamp;
- (id)seedGroup;
- (int)getCoreCount:(int)a3;
- (int)getDeviceType;
- (int)getOSVariant;
- (int)getPerfLevelsCount;
- (int64_t)autolockTime;
- (int64_t)checkAndUpdateOSVersion:(id)a3;
- (unint64_t)getEnclosureMaterial;
- (unint64_t)getUpgradeType;
- (unint64_t)logInstallType:(id)a3;
- (unint64_t)rootInstalled;
- (unint64_t)volumeFreespace:(id)a3;
- (void)cleanupOldPowerlogs;
- (void)copyPowerlogsForPreUpgradeOSVersion:(int64_t)a3;
- (void)dealloc;
- (void)fileSizeSafeguards;
- (void)initOperatorDependancies;
- (void)log;
- (void)logCPUCoreConfig;
- (void)logConfigEntry:(id)a3;
- (void)logConfigEntryToCA:(id)a3;
- (void)logConfigToBGSQL:(id)a3;
- (void)logDeviceCapability;
- (void)logEntryToCA:(id)a3;
- (void)logEventForwardAmbientModeEnabled:(id)a3;
- (void)logEventForwardConsoleMode;
- (void)logEventForwardContinuityCamera:(id)a3;
- (void)logEventForwardKeyboardClicks;
- (void)logEventForwardKeyboardHaptics;
- (void)logEventForwardPhotoSharing:(id)a3;
- (void)logEventForwardRingerState;
- (void)logEventForwardSysdiagnoseEvent:(BOOL)a3;
- (void)logEventNoneBuddyData:(id)a3;
- (void)logEventNoneConfig;
- (void)logEventNonePairedDeviceConfig;
- (void)logEventPointFeatureFlags:(id)a3;
- (void)logToPPSBuild:(id)a3 atDate:(id)a4;
- (void)maintainPreUpgradePowerlogs:(int64_t)a3;
- (void)pairStatusDidChange:(id)a3;
- (void)setConsoleModeListener:(id)a3;
- (void)setPhotoSharingListener:(id)a3;
- (void)setSysdiagnoseStartListener:(id)a3;
- (void)setSysdiagnoseStopListener:(id)a3;
@end

@implementation PLConfigAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLConfigAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = @"KeyboardClicks";
  objc_super v2 = [(id)objc_opt_class() entryEventForwardDefinitionKeyboardClicks];
  v12[0] = v2;
  v11[1] = @"KeyboardHaptics";
  v3 = [(id)objc_opt_class() entryEventForwardDefinitionKeyboardHaptics];
  v12[1] = v3;
  v11[2] = @"Ringer";
  v4 = [(id)objc_opt_class() entryEventForwardDefintionRinger];
  v12[2] = v4;
  v11[3] = @"PhotoSharing";
  v5 = [(id)objc_opt_class() entryEventForwardDefinitionPhotoSharing];
  v12[3] = v5;
  v11[4] = @"ContinuityCamera";
  v6 = [(id)objc_opt_class() entryEventForwardDefinitionContinuityCamera];
  v12[4] = v6;
  v11[5] = @"AmbientModeEnabled";
  v7 = [(id)objc_opt_class() entryEventForwardDefinitionAmbientMode];
  v12[5] = v7;
  v11[6] = @"FeatureFlags";
  v8 = [(id)objc_opt_class() entryEventForwardDefinitionFeatureFlag];
  v12[6] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

+ (id)entryEventForwardDefinitionFeatureFlag
{
  v25[3] = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F92A38] internalBuild];
  v3 = (void *)MEMORY[0x1E4F1CC08];
  if (v2)
  {
    v24[0] = *MEMORY[0x1E4F92C50];
    uint64_t v4 = *MEMORY[0x1E4F92C60];
    v22[0] = *MEMORY[0x1E4F92CD0];
    v22[1] = v4;
    v23[0] = &unk_1F29F0590;
    v23[1] = MEMORY[0x1E4F1CC38];
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    v25[0] = v17;
    v25[1] = v3;
    uint64_t v5 = *MEMORY[0x1E4F92C68];
    v24[1] = *MEMORY[0x1E4F92CA8];
    v24[2] = v5;
    v20[0] = @"key";
    v18[0] = @"Domain";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v16, "commonTypeDict_StringFormat");
    v19[0] = v6;
    v18[1] = @"FeatureName";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
    v19[1] = v8;
    v18[2] = @"TargetRelease";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
    v19[2] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    v20[1] = @"value";
    v21[0] = v11;
    v12 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v12, "commonTypeDict_IntegerFormat");
    v21[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v25[2] = v14;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  }
  return v3;
}

+ (id)entryEventForwardDefinitionKeyboardClicks
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F05A0;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Enabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionKeyboardHaptics
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F05A0;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Enabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefintionRinger
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F05A0;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Enabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionPhotoSharing
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F05A0;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"PhotoSharingEnabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionContinuityCamera
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F05A0;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Enabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionAmbientMode
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F05A0;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Enabled";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"Config";
  v3 = [(id)objc_opt_class() entryEventNoneDefinitionConfig];
  v9[0] = v3;
  v8[1] = @"PairedDeviceConfig";
  uint64_t v4 = [(id)objc_opt_class() entryEventNoneDefinitionPairedDeviceConfig];
  v9[1] = v4;
  v8[2] = @"AdapterInformation";
  uint64_t v5 = [a1 entryEventNoneDefinitionAdapterInformation];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventNoneDefinitionAdapterInformation
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitionConfig
{
  v84[2] = *MEMORY[0x1E4F143B8];
  v83[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CF8];
  v81[0] = *MEMORY[0x1E4F92CD0];
  v81[1] = v2;
  v82[0] = &unk_1F29F05B0;
  v82[1] = &unk_1F29E5398;
  v81[2] = *MEMORY[0x1E4F92CF0];
  v82[2] = &unk_1F29F05C0;
  v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:3];
  v84[0] = v78;
  v83[1] = *MEMORY[0x1E4F92CA8];
  v79[0] = @"Build";
  v77 = [MEMORY[0x1E4F929D8] sharedInstance];
  v76 = objc_msgSend(v77, "commonTypeDict_StringFormat");
  v80[0] = v76;
  v79[1] = @"SupplementalBuild";
  v75 = [MEMORY[0x1E4F929D8] sharedInstance];
  v74 = objc_msgSend(v75, "commonTypeDict_StringFormat");
  v80[1] = v74;
  v79[2] = @"CustomerOS";
  v73 = [MEMORY[0x1E4F929D8] sharedInstance];
  v72 = objc_msgSend(v73, "commonTypeDict_BoolFormat");
  v80[2] = v72;
  v79[3] = @"Device";
  v71 = [MEMORY[0x1E4F929D8] sharedInstance];
  v70 = objc_msgSend(v71, "commonTypeDict_StringFormat");
  v80[3] = v70;
  v79[4] = @"DevBoard";
  v69 = [MEMORY[0x1E4F929D8] sharedInstance];
  v68 = objc_msgSend(v69, "commonTypeDict_BoolFormat");
  v80[4] = v68;
  v79[5] = @"CRKey";
  v67 = [MEMORY[0x1E4F929D8] sharedInstance];
  v66 = objc_msgSend(v67, "commonTypeDict_StringFormat");
  v80[5] = v66;
  v79[6] = @"CRKey2";
  v65 = [MEMORY[0x1E4F929D8] sharedInstance];
  v64 = objc_msgSend(v65, "commonTypeDict_StringFormat");
  v80[6] = v64;
  v79[7] = @"DeviceName";
  v63 = [MEMORY[0x1E4F929D8] sharedInstance];
  v62 = objc_msgSend(v63, "commonTypeDict_StringFormat");
  v80[7] = v62;
  v79[8] = @"BootArgs";
  v61 = [MEMORY[0x1E4F929D8] sharedInstance];
  v60 = objc_msgSend(v61, "commonTypeDict_StringFormat");
  v80[8] = v60;
  v79[9] = @"DeviceType";
  v59 = [MEMORY[0x1E4F929D8] sharedInstance];
  v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v80[9] = v58;
  v79[10] = @"DeviceBootTime";
  v57 = [MEMORY[0x1E4F929D8] sharedInstance];
  v56 = objc_msgSend(v57, "commonTypeDict_DateFormat");
  v80[10] = v56;
  v79[11] = @"LastBuild";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  v54 = objc_msgSend(v55, "commonTypeDict_StringFormat");
  v80[11] = v54;
  v79[12] = @"LastUpgradeTimestamp";
  v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  v52 = objc_msgSend(v53, "commonTypeDict_RealFormat");
  v80[12] = v52;
  v79[13] = @"DeviceDiskSize";
  v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v80[13] = v50;
  v79[14] = @"MachTimeBaseRatio";
  v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  v48 = objc_msgSend(v49, "commonTypeDict_RealFormat");
  v80[14] = v48;
  v79[15] = @"AutoLockTime";
  v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v80[15] = v46;
  v79[16] = @"Baseband";
  v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v80[16] = v44;
  v79[17] = @"BasebandFirmware";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  v42 = objc_msgSend(v43, "commonTypeDict_StringFormat");
  v80[17] = v42;
  v79[18] = @"BKNoWatchdogs";
  v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_BoolFormat");
  v80[18] = v40;
  v79[19] = @"SBDisableCABlanking";
  v39 = [MEMORY[0x1E4F929D8] sharedInstance];
  v38 = objc_msgSend(v39, "commonTypeDict_BoolFormat");
  v80[19] = v38;
  v79[20] = @"AutomatedDeviceGroup";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_StringFormat");
  v80[20] = v36;
  v79[21] = @"SeedGroup";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_StringFormat");
  v80[21] = v34;
  v79[22] = @"ConfigNumber";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_StringFormat");
  v80[22] = v32;
  v79[23] = @"DebugBoardRevision";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_StringFormat");
  v80[23] = v30;
  v79[24] = @"LastBackupTimestamp";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_DateFormat");
  v80[24] = v28;
  v79[25] = @"DeviceBootReasons";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat");
  v80[25] = v26;
  v79[26] = @"IcloudAccountType";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_StringFormat");
  v80[26] = v24;
  v79[27] = @"OSVariant";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v80[27] = v22;
  v79[28] = @"RemainingDiskSpace";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v80[28] = v20;
  v79[29] = @"DeviceSerialNumber";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v80[29] = v18;
  v79[30] = @"MDMStatus";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_BoolFormat");
  v80[30] = v16;
  v79[31] = @"InstalledSplat";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v80[31] = v14;
  v79[32] = @"Device_SoC";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v80[32] = v4;
  v79[33] = @"RootInstalled";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v80[33] = v6;
  v79[34] = @"LastUpgradeSystemTimestamp";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v80[34] = v8;
  v79[35] = @"InstallType";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v80[35] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:36];
  v84[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:2];

  return v12;
}

+ (id)entryEventNoneDefinitionPairedDeviceConfig
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWatch])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CF8];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F29F0590;
    v20[1] = &unk_1F29E5398;
    v19[2] = *MEMORY[0x1E4F92CF0];
    void v20[2] = &unk_1F29F05D0;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"Build";
    v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
    v18[0] = v14;
    v17[1] = @"Device";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
    v18[1] = v4;
    v17[2] = @"HWModel";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    v18[2] = v6;
    v17[3] = @"PairingID";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
    void v18[3] = v8;
    v17[4] = @"PMode";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v18[4] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)defaults
{
  return &unk_1F29E9180;
}

- (PLConfigAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLConfigAgent;
  uint64_t v2 = [(PLAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F92A00]) initWithOperator:v2 forService:@"IOPlatformExpertDevice"];
    iokitExpertDevice = v2->_iokitExpertDevice;
    v2->_iokitExpertDevice = (PLIOKitOperatorComposition *)v3;
  }
  return v2;
}

- (unint64_t)volumeFreespace:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(&v18, 0, 512);
  id v3 = a3;
  if (statfs((const char *)[v3 fileSystemRepresentation], &v18))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLConfigAgent_volumeFreespace___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD57E88 != -1) {
        dispatch_once(&qword_1EBD57E88, block);
      }
      if (_MergedGlobals_1_19)
      {
        uint64_t v5 = NSString;
        objc_super v6 = __error();
        v7 = [v5 stringWithFormat:@"statfs failed for %@ : %s", v3, strerror(*v6)];
        v8 = (void *)MEMORY[0x1E4F929B8];
        v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m"];
        v10 = [v9 lastPathComponent];
        v11 = [NSString stringWithUTF8String:"-[PLConfigAgent volumeFreespace:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:564];

        v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v7;
          _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    unint64_t v13 = -1;
  }
  else
  {
    unint64_t v13 = (unint64_t)((double)(v18.f_bavail * v18.f_bsize) / 1000000000.0);
  }

  return v13;
}

uint64_t __33__PLConfigAgent_volumeFreespace___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_19 = result;
  return result;
}

- (unint64_t)rootInstalled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  size_t v7 = 8;
  uint64_t v8 = 0;
  int v2 = sysctlbyname("kern.roots_installed", &v8, &v7, 0, 0);
  id v3 = PLLogCommon();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v6;
      _os_log_error_impl(&dword_1D2690000, v4, OS_LOG_TYPE_ERROR, "Unable to get Installed root info kern.roots_installed: %{errno}d", buf, 8u);
    }

    return -1;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v8;
      _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Installed root info kern.roots_installed: %llu", buf, 0xCu);
    }

    return v8 != 0;
  }
}

- (int)getDeviceType
{
  if ([MEMORY[0x1E4F92A38] isiPad]) {
    return 1;
  }
  if ([MEMORY[0x1E4F92A38] isiPhone]) {
    return 0;
  }
  if ([MEMORY[0x1E4F92A38] isiPod]) {
    return 2;
  }
  if ([MEMORY[0x1E4F92A38] isWatch]) {
    return 3;
  }
  if ([MEMORY[0x1E4F92A38] isMac]) {
    return 4;
  }
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    return 5;
  }
  if ([MEMORY[0x1E4F92A38] isAppleTV]) {
    return 6;
  }
  if ([MEMORY[0x1E4F92A38] isAppleVision]) {
    return 86;
  }
  return 1000;
}

- (BOOL)noWatchdogs
{
  int v2 = [MEMORY[0x1E4F929C0] objectForKey:@"BKNoWatchdogs" forApplicationID:@"com.apple.backboardd" synchronize:0];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)disableCABlanking
{
  int v2 = [MEMORY[0x1E4F929C0] objectForKey:@"SBDisableCABlanking" forApplicationID:@"com.apple.springboard" synchronize:0];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (int64_t)autolockTime
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  id v3 = [v2 effectiveValueForSetting:*MEMORY[0x1E4F73F60]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

+ (void)resetRAPIDTaskingConfig
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F92DA8];
  id v3 = [MEMORY[0x1E4F929C0] objectForKey:*MEMORY[0x1E4F92DA8]];
  if (v3)
  {
    int64_t v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      int v6 = v3;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "Resetting RAPID Tasking config: %@", (uint8_t *)&v5, 0xCu);
    }

    [MEMORY[0x1E4F929C0] setObject:0 forKey:v2 saveToDisk:1];
    [MEMORY[0x1E4F929C0] setObject:0 forKey:*MEMORY[0x1E4F92DA0] saveToDisk:1];
    [MEMORY[0x1E4F929C0] setObject:0 forKey:*MEMORY[0x1E4F92DB8] saveToDisk:1];
  }
}

+ (int64_t)getOSVersionNumber
{
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  return 0;
}

- (int64_t)checkAndUpdateOSVersion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F929C0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PLConfigAgent_checkAndUpdateOSVersion___block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD57E90 != -1) {
    dispatch_once(&qword_1EBD57E90, block);
  }
  int64_t v6 = [v5 longForKey:@"LastOSVersion" ifNotSet:qword_1EBD57E98];
  uint64_t v7 = +[PLConfigAgent getOSVersionNumber];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLConfigAgent logInstallType:](self, "logInstallType:", v4));
  [MEMORY[0x1E4F929C0] setObject:v8 forKey:@"InstallType" saveToDisk:1];
  v9 = PLLogCommon();
  uint64_t v10 = v9;
  if (v7 < 1 || v7 == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "OS version did not change", buf, 2u);
    }
    int64_t v6 = -1;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      int64_t v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_INFO, "OS version changed from: %ld to: %ld", buf, 0x16u);
    }

    uint64_t v11 = (void *)MEMORY[0x1E4F929C0];
    uint64_t v10 = [NSNumber numberWithLong:v7];
    [v11 setObject:v10 forKey:@"LastOSVersion" saveToDisk:1];
  }

  return v6;
}

uint64_t __41__PLConfigAgent_checkAndUpdateOSVersion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"DefaultOSVersion"];
  qword_1EBD57E98 = result;
  return result;
}

+ (id)getVersionDirectory:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v4 = +[PLConfigAgent getOSVersionNumber];
  int v5 = PLLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a3 / 10000 == v4 / 10000)
  {
    if (v6)
    {
      int v12 = 134218240;
      int64_t v13 = a3;
      __int16 v14 = 2048;
      int64_t v15 = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Minor OS upgrade: %ld -> %ld", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v7 = [MEMORY[0x1E4F92A88] containerPath];
    uint64_t v8 = v7;
    v9 = @"/Library/BatteryLife/UpgradeLogs/MinorVersion";
  }
  else
  {
    if (v6)
    {
      int v12 = 134218240;
      int64_t v13 = a3;
      __int16 v14 = 2048;
      int64_t v15 = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Major OS upgrade: %ld -> %ld", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v7 = [MEMORY[0x1E4F92A88] containerPath];
    uint64_t v8 = v7;
    v9 = @"/Library/BatteryLife/UpgradeLogs/MajorVersion";
  }
  uint64_t v10 = [v7 stringByAppendingString:v9];

  return v10;
}

- (void)copyPowerlogsForPreUpgradeOSVersion:(int64_t)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  int64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  int v5 = +[PLConfigAgent getVersionDirectory:a3];
  BOOL v6 = [v5 stringByAppendingPathComponent:v4];
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Copy logs to dir: %@", buf, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v58 = 0;
  int v9 = [v8 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v58];
  id v10 = v58;
  if (v9)
  {
    v35 = v5;
    v36 = v4;
    unint64_t v11 = 0x1E4F92000uLL;
    int v12 = [MEMORY[0x1E4F92A88] containerPath];
    int64_t v13 = [v12 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
    os_log_t log = [v8 contentsOfDirectoryAtPath:v13 error:0];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = [MEMORY[0x1E4F92998] archiveEntriesFinished];
    uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (!v40) {
      goto LABEL_29;
    }
    uint64_t v38 = *(void *)v55;
    uint64_t v44 = *MEMORY[0x1E4F28370];
    uint64_t v43 = *MEMORY[0x1E4F28348];
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v14;
        int64_t v15 = *(void **)(*((void *)&v54 + 1) + 8 * v14);
        uint64_t v16 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v17 = [v15 uuid];
        uint64_t v18 = [v16 predicateWithFormat:@"SELF CONTAINS %@", v17];

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v41 = (void *)v18;
        id v46 = [log filteredArrayUsingPredicate:v18];
        uint64_t v47 = [v46 countByEnumeratingWithState:&v50 objects:v67 count:16];
        if (v47)
        {
          uint64_t v19 = *(void *)v51;
          uint64_t v45 = *(void *)v51;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v51 != v19) {
                objc_enumerationMutation(v46);
              }
              uint64_t v21 = *(void *)(*((void *)&v50 + 1) + 8 * v20);
              v22 = [*(id *)(v11 + 2696) containerPath];
              v23 = [v22 stringByAppendingString:@"/Library/BatteryLife/Archives/"];
              v24 = [v23 stringByAppendingPathComponent:v21];

              v25 = [v6 stringByAppendingPathComponent:v21];
              v26 = PLLogCommon();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v62 = v24;
                __int16 v63 = 2112;
                id v64 = v25;
                _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "Copying log at path: %@ to path: %@", buf, 0x16u);
              }

              id v49 = v10;
              char v27 = [v8 copyItemAtPath:v24 toPath:v25 error:&v49];
              id v28 = v49;

              if (v27)
              {
                v29 = v8;
                v30 = v6;
                v31 = [MEMORY[0x1E4F28CB8] defaultManager];
                uint64_t v59 = v44;
                uint64_t v60 = v43;
                v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
                id v48 = v28;
                char v33 = [v31 setAttributes:v32 ofItemAtPath:v25 error:&v48];
                id v10 = v48;

                if (v33)
                {
                  BOOL v6 = v30;
                  uint64_t v8 = v29;
                  unint64_t v11 = 0x1E4F92000;
                  uint64_t v19 = v45;
                  goto LABEL_25;
                }
                v34 = PLLogCommon();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v62 = v25;
                  __int16 v63 = 2112;
                  id v64 = v10;
                  _os_log_error_impl(&dword_1D2690000, v34, OS_LOG_TYPE_ERROR, "Failed to set file protection key for file at path: %@ with error: %@", buf, 0x16u);
                }
                id v28 = v10;
                BOOL v6 = v30;
                uint64_t v8 = v29;
                unint64_t v11 = 0x1E4F92000;
                uint64_t v19 = v45;
              }
              else
              {
                v34 = PLLogCommon();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v62 = v24;
                  __int16 v63 = 2112;
                  id v64 = v25;
                  __int16 v65 = 2112;
                  id v66 = v28;
                  _os_log_error_impl(&dword_1D2690000, v34, OS_LOG_TYPE_ERROR, "Failed to copy file at path: %@ to path: %@ with error: %@", buf, 0x20u);
                }
              }

              id v10 = v28;
LABEL_25:

              ++v20;
            }
            while (v47 != v20);
            uint64_t v47 = [v46 countByEnumeratingWithState:&v50 objects:v67 count:16];
          }
          while (v47);
        }

        uint64_t v14 = v42 + 1;
      }
      while (v42 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v68 count:16];
      if (!v40)
      {
LABEL_29:

        int v5 = v35;
        int64_t v4 = v36;
        goto LABEL_32;
      }
    }
  }
  PLLogCommon();
  os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v62 = v6;
    __int16 v63 = 2112;
    id v64 = v10;
    _os_log_error_impl(&dword_1D2690000, log, OS_LOG_TYPE_ERROR, "Failed to create directory at path: %@ with error: %@", buf, 0x16u);
  }
LABEL_32:
}

+ (void)removeFilesFromPath:(id)a3 withMaxFiles:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];
  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v5;
    __int16 v17 = 2048;
    uint64_t v18 = [v7 count];
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Remove files from path: %@ currFiles: %ld maxFiles:%ld", buf, 0x20u);
  }

  if ([v7 count] > (unint64_t)a4)
  {
    int v9 = [v7 sortedArrayUsingSelector:sel_compareInt_];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PLConfigAgent_removeFilesFromPath_withMaxFiles___block_invoke;
    v10[3] = &unk_1E692BA68;
    id v11 = v7;
    int64_t v14 = a4;
    id v12 = v6;
    id v13 = v5;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

void __50__PLConfigAgent_removeFilesFromPath_withMaxFiles___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if ([*(id *)(a1 + 32) count] - a3 == *(void *)(a1 + 56))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 40);
    int v9 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v7];
    id v14 = 0;
    char v10 = [v8 removeItemAtPath:v9 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v7];
        *(_DWORD *)buf = 138412546;
        id v16 = v13;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_error_impl(&dword_1D2690000, v12, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@ with error: %@", buf, 0x16u);
      }
    }
  }
}

- (void)cleanupOldPowerlogs
{
  int64_t v3 = [(PLOperator *)self defaultLongForKey:@"MaxMajorVersionDirectories"];
  int64_t v4 = [(PLOperator *)self defaultLongForKey:@"MaxMinorVersionDirectories"];
  id v5 = [MEMORY[0x1E4F92A88] containerPath];
  BOOL v6 = [v5 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
  +[PLConfigAgent removeFilesFromPath:v6 withMaxFiles:v3];

  id v8 = [MEMORY[0x1E4F92A88] containerPath];
  id v7 = [v8 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
  +[PLConfigAgent removeFilesFromPath:v7 withMaxFiles:v4];
}

- (void)fileSizeSafeguards
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)MEMORY[0x1E4F92A88];
  int64_t v4 = [MEMORY[0x1E4F92A88] containerPath];
  id v5 = [v4 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
  unint64_t v6 = [v3 directorySize:v5];

  if (v6 > [(PLOperator *)self defaultLongForKey:@"MaxUpgradeFolderSize"])
  {
    id v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = v6;
      _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Total folder size: %ld exceeds max limit", buf, 0xCu);
    }

    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v9 = [MEMORY[0x1E4F92A88] containerPath];
    char v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
    id v16 = 0;
    char v11 = [v8 removeItemAtPath:v10 error:&v16];
    id v12 = v16;

    if ((v11 & 1) == 0)
    {
      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = [MEMORY[0x1E4F92A88] containerPath];
        int64_t v15 = [v14 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
        *(_DWORD *)buf = 138412546;
        unint64_t v18 = (unint64_t)v15;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_error_impl(&dword_1D2690000, v13, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@ with error: %@", buf, 0x16u);
      }
    }
  }
}

- (void)maintainPreUpgradePowerlogs:(int64_t)a3
{
  if ([MEMORY[0x1E4F929C0] liteMode])
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Maintain pre-upgrade logs", buf, 2u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLConfigAgent_maintainPreUpgradePowerlogs___block_invoke;
    block[3] = &unk_1E692A250;
    block[4] = self;
    if (qword_1EBD57EA0 != -1) {
      dispatch_once(&qword_1EBD57EA0, block);
    }
    if (qword_1EBD57EA8 <= a3)
    {
      [(PLConfigAgent *)self copyPowerlogsForPreUpgradeOSVersion:a3];
      [(PLConfigAgent *)self cleanupOldPowerlogs];
      [(PLConfigAgent *)self fileSizeSafeguards];
    }
  }
}

uint64_t __45__PLConfigAgent_maintainPreUpgradePowerlogs___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"DefaultOSVersion"];
  qword_1EBD57EA8 = result;
  return result;
}

- (unint64_t)getUpgradeType
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F929C0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__PLConfigAgent_getUpgradeType__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  if (qword_1EBD57EB0 != -1) {
    dispatch_once(&qword_1EBD57EB0, block);
  }
  uint64_t v3 = [v2 longForKey:@"LastOSVersion" ifNotSet:qword_1EBD57EB8];
  int64_t v4 = +[PLConfigAgent getOSVersionNumber];
  id v5 = PLLogCommon();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v3 / 10000 == v4 / 10000)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v11 = v3;
      __int16 v12 = 2048;
      int64_t v13 = v4;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Minor OS upgrade: %ld -> %ld", buf, 0x16u);
    }
    unint64_t v7 = 1;
  }
  else if (v6)
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    int64_t v13 = v4;
    unint64_t v7 = 2;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Major OS upgrade: %ld -> %ld", buf, 0x16u);
  }
  else
  {
    unint64_t v7 = 2;
  }

  return v7;
}

uint64_t __31__PLConfigAgent_getUpgradeType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultLongForKey:@"DefaultOSVersion"];
  qword_1EBD57EB8 = result;
  return result;
}

- (id)logAndUpdateLastBuild:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F929C0] objectForKey:@"LastBuild" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  if (v4 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    unint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v5;
      _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "Update detected - Current Build %@ -> Last Build %@", buf, 0x16u);
    }

    [MEMORY[0x1E4F929C0] setObject:v4 forKey:@"LastBuild" saveToDisk:1];
    +[PLConfigAgent resetRAPIDTaskingConfig];
    [(PLConfigAgent *)self maintainPreUpgradePowerlogs:[(PLConfigAgent *)self checkAndUpdateOSVersion:v5]];
    if (v5)
    {
      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v5;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D2690000, v8, OS_LOG_TYPE_INFO, "The device has been updated from build version %@ to build version %@", buf, 0x16u);
      }

      dispatch_time_t v9 = dispatch_time(0, 60000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__PLConfigAgent_logAndUpdateLastBuild___block_invoke;
      block[3] = &unk_1E692B128;
      id v10 = v5;
      id v19 = v10;
      id v20 = v4;
      dispatch_after(v9, MEMORY[0x1E4F14428], block);
      [MEMORY[0x1E4F929C0] setObject:v10 forKey:@"PreviousUpdateBuild" saveToDisk:1];
      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2690000, v11, OS_LOG_TYPE_INFO, "Set the previous update build to last build", buf, 2u);
      }
    }
    __int16 v12 = [MEMORY[0x1E4F929C0] objectForKey:@"InstallType" ifNotSet:&unk_1F29E53F8];
    [v12 unsignedLongLongValue];

    id v16 = v5;
    id v17 = v4;
    AnalyticsSendEventLazy();

    BOOL v6 = v16;
  }
  else
  {
    BOOL v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "Not an update case - logging at powerlog init", buf, 2u);
    }
  }

  int64_t v13 = [MEMORY[0x1E4F929C0] objectForKey:@"PreviousUpdateBuild" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  uint64_t v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "Sending lastBuild value - prev update build %@ and last %@", buf, 0x16u);
  }

  return v13;
}

void __39__PLConfigAgent_logAndUpdateLastBuild___block_invoke(uint64_t a1)
{
  v1 = [NSString stringWithFormat:@"%@_%@_%@", @"Upgrade", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  char v2 = PLGenerateBatteryUIPlist();

  if ((v2 & 1) == 0)
  {
    uint64_t v3 = PLLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v3, OS_LOG_TYPE_ERROR, "Failed to generate a new BUI upgrade plist", buf, 2u);
    }
  }
}

id __39__PLConfigAgent_logAndUpdateLastBuild___block_invoke_290(void *a1)
{
  char v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = v2;
  if (a1[4]) {
    id v4 = (__CFString *)a1[4];
  }
  else {
    id v4 = @"None";
  }
  [v2 setObject:v4 forKeyedSubscript:@"LastBuild"];
  [v3 setObject:a1[5] forKeyedSubscript:@"Build"];
  if (a1[4])
  {
    id v5 = [NSNumber numberWithUnsignedLongLong:a1[6]];
    [v3 setObject:v5 forKeyedSubscript:@"Type"];
  }
  else
  {
    [v3 setObject:&unk_1F29E53B0 forKeyedSubscript:@"Type"];
  }
  return v3;
}

- (id)logAndUpdateLastUpgradeTime:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F929C0] objectForKey:@"LastBuild" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  BOOL v6 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  unint64_t v7 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeSystemTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  if (v4 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    dispatch_time_t v9 = [v8 convertFromSystemToMonotonic];
    id v10 = NSNumber;
    [v8 timeIntervalSince1970];
    uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");

    __int16 v12 = (void *)MEMORY[0x1E4F929C0];
    int64_t v13 = NSNumber;
    [v9 timeIntervalSince1970];
    uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
    [v12 setObject:v14 forKey:@"LastUpgradeTimestamp" saveToDisk:1];

    [MEMORY[0x1E4F929C0] setObject:v11 forKey:@"LastUpgradeSystemTimestamp" saveToDisk:1];
    int64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v21 = v4;
      __int16 v22 = 2112;
      __int16 v23 = v5;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_impl(&dword_1D2690000, v15, OS_LOG_TYPE_INFO, "Update detected - Current Build %@ -> Last Build %@ and timestamp %@", buf, 0x20u);
    }

    [(PLConfigAgent *)self logToPPSBuild:v4 atDate:v9];
    unint64_t v7 = (void *)v11;
  }
  else
  {
    id v8 = PLLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Not an update case - logging upgrade timestamp at powerlog init", buf, 2u);
    }
  }

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v7 doubleValue];
      ADClientSetValueForScalarKey();
      id v19 = v7;
      AnalyticsSendEventLazy();
    }
  }
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = v6;
  }
  else
  {
    id v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2690000, v17, OS_LOG_TYPE_INFO, "Returning lastUpgradeTimestamp as nil", buf, 2u);
    }

    id v16 = 0;
  }

  return v16;
}

id __45__PLConfigAgent_logAndUpdateLastUpgradeTime___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"lastUpgradeSystemTimestamp";
  v5[0] = v1;
  char v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)logLastUpgradeSystemTimestamp
{
  char v2 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeSystemTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  uint64_t v3 = NSNumber;
  [v2 doubleValue];
  id v5 = [v3 numberWithDouble:floor(v4 / 3600.0) * 3600.0];

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
  }
  else
  {
    unint64_t v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)dispatch_time_t v9 = 0;
      _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "Returning lastUpgradeSystemTimestamp as nil", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

- (unint64_t)logInstallType:(id)a3
{
  if (a3) {
    return [(PLConfigAgent *)self getUpgradeType];
  }
  else {
    return 0;
  }
}

- (void)logToPPSBuild:(id)a3 atDate:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = @"build";
  v12[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  dispatch_time_t v9 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = [MEMORY[0x1E4F1C9C8] nearestMidnightBeforeDate:v7];

  [(PLOperator *)self logForSubsystem:@"PPTStorageOperator" category:@"Config" data:v9 date:v10];
}

- (double)logDeviceDiskSize
{
  char v2 = (void *)MGCopyAnswer();
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x1E4FBA0F8]];
  [v3 doubleValue];
  double v5 = (double)(int)(v4 / 1000000000.0);

  return v5;
}

- (id)logLastBackupTime
{
  char v2 = [MEMORY[0x1E4F929C0] objectForKey:@"LastBackupTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
    [v2 doubleValue];
    double v4 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)logIcloudAccountType
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  uint64_t v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  double v4 = objc_msgSend(v3, "aa_lastKnownQuota");
  double v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28B68], "stringFromByteCount:countStyle:", objc_msgSend(v4, "longLongValue"), 3);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)seedGroup
{
  id v2 = [MEMORY[0x1E4F929C0] sharedDefaults];
  uint64_t v3 = [v2 managedPrefsObjectForKey:@"SeedGroup" forApplicationID:@".GlobalPreferences" synchronize:1];

  return v3;
}

- (id)deviceShutdownReasons
{
  CFMutableDictionaryRef v2 = IOServiceMatching("IOService");
  if (!v2)
  {
LABEL_9:
    id v10 = 0;
    goto LABEL_20;
  }
  CFMutableDictionaryRef v3 = v2;
  int valuePtr = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFTypeRef cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryRef v5 = CFDictionaryCreate(v4, (const void **)&deviceShutdownReasons_tmp, &cf, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v5)
  {
    CFRelease(v3);
    if (deviceShutdownReasons_tmp) {
      CFRelease((CFTypeRef)deviceShutdownReasons_tmp);
    }
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_9;
  }
  CFDictionaryRef v6 = v5;
  CFDictionarySetValue(v3, @"IOPropertyMatch", v5);
  uint64_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E4F2EF00], v3);
  if (MatchingService)
  {
    io_object_t v8 = MatchingService;
    dispatch_time_t v9 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:MatchingService];
    IOObjectRelease(v8);
  }
  else
  {
    dispatch_time_t v9 = 0;
  }
  CFRelease(v6);
  if (deviceShutdownReasons_tmp) {
    CFRelease((CFTypeRef)deviceShutdownReasons_tmp);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v9)
  {
    id v10 = [v9 objectForKeyedSubscript:@"IOPMUBootErrorFaults"];

    if (v10)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"IOPMUBootErrorFaults"];
      __int16 v12 = [v11 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

      id v10 = [v12 componentsJoinedByString:@","];
    }
  }
  else
  {
    id v10 = 0;
  }

LABEL_20:
  return v10;
}

- (BOOL)getMDMStatus
{
  CFMutableDictionaryRef v2 = [MEMORY[0x1E4F74230] sharedConnection];
  CFMutableDictionaryRef v3 = [v2 installedMDMProfileIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getSplatVersionString
{
  if (qword_1EBD57EC8 != -1) {
    dispatch_once(&qword_1EBD57EC8, &__block_literal_global_17);
  }
  CFMutableDictionaryRef v2 = (void *)qword_1EBD57EC0;
  return v2;
}

uint64_t __38__PLConfigAgent_getSplatVersionString__block_invoke()
{
  qword_1EBD57EC0 = CFCopySystemVersionString();
  return MEMORY[0x1F41817F8]();
}

- (id)deviceName
{
  if ([MEMORY[0x1E4F929C0] fullMode]) {
    CFMutableDictionaryRef v2 = (void *)MGCopyAnswer();
  }
  else {
    CFMutableDictionaryRef v2 = 0;
  }
  return v2;
}

- (int)getOSVariant
{
  if (os_variant_has_internal_diagnostics()) {
    int v2 = 2;
  }
  else {
    int v2 = 0;
  }
  if (os_variant_has_internal_content()) {
    v2 |= 4u;
  }
  if (os_variant_has_internal_ui()) {
    return v2 | 8;
  }
  else {
    return v2;
  }
}

- (id)baseband
{
  int v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F92A38] kPLBasebandClassOfDevice];
  return (id)[v2 numberWithInt:v3];
}

- (id)basebandFirmware
{
  int v2 = (void *)MGCopyAnswer();
  return v2;
}

- (id)getCoverGlass
{
  int v2 = (void *)MGCopyAnswer();
  return v2;
}

- (int)getPerfLevelsCount
{
  int v6 = 0;
  size_t v5 = 4;
  if (!sysctlbyname("hw.nperflevels", &v6, &v5, 0, 0)) {
    return v6;
  }
  int v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_error_impl(&dword_1D2690000, v2, OS_LOG_TYPE_ERROR, "Unable to retrieve hw.nperflevels", v4, 2u);
  }

  return 0;
}

- (int)getCoreCount:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3) {
    BOOL v4 = "hw.perflevel1.physicalcpu";
  }
  else {
    BOOL v4 = "hw.perflevel0.physicalcpu";
  }
  int v8 = 0;
  size_t v7 = 4;
  if (!sysctlbyname(v4, &v8, &v7, 0, 0)) {
    return v8;
  }
  size_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a3;
    _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "Unable to retrieve hw.perflevel%d.physicalcpu", buf, 8u);
  }

  return 0;
}

- (id)getShutdownBootReason:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v3 = "kern.shutdownreason";
  }
  else {
    uint64_t v3 = "kern.bootreason";
  }
  size_t v10 = 0;
  sysctlbyname(v3, 0, &v10, 0, 0);
  if (v10)
  {
    BOOL v4 = (char *)&v9 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v4, v10);
    if (sysctlbyname(v3, v4, &v10, 0, 0))
    {
      size_t v5 = PLLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = [NSString stringWithUTF8String:v3];
        *(_DWORD *)buf = 138412290;
        __int16 v12 = v8;
        _os_log_error_impl(&dword_1D2690000, v5, OS_LOG_TYPE_ERROR, "Unable to retrieve %@", buf, 0xCu);
      }
      int v6 = 0;
    }
    else
    {
      int v6 = [NSString stringWithUTF8String:v4];
    }
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)hwConfig
{
  if (hwConfig_onceToken != -1) {
    dispatch_once(&hwConfig_onceToken, &__block_literal_global_358);
  }
  int v2 = (void *)hwConfig___config;
  return v2;
}

void __25__PLConfigAgent_hwConfig__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v1);
        size_t Length = CFDataGetLength((CFDataRef)v1);
        int v6 = malloc_type_malloc(Length + 1, 0x3EEA88C6uLL);
        bzero(v6, Length + 1);
        memcpy(v6, BytePtr, Length);
        uint64_t v7 = [NSString stringWithUTF8String:v6];
        free(v6);
      }
      else
      {
        uint64_t v7 = 0;
      }
      int v8 = (void *)hwConfig___config;
      hwConfig___config = v7;
    }
  }
}

- (id)hwBoardRevision
{
  if (hwBoardRevision_onceToken != -1) {
    dispatch_once(&hwBoardRevision_onceToken, &__block_literal_global_360);
  }
  CFTypeID v2 = (void *)hwBoardRevision___revision;
  return v2;
}

void __32__PLConfigAgent_hwBoardRevision__block_invoke()
{
  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr((CFDataRef)v1);
        CFIndex Length = CFDataGetLength((CFDataRef)v1);
        int v6 = malloc_type_malloc(2 * Length + 3, 0x865DAB99uLL);
        bzero(v6, 2 * Length + 3);
        strcpy((char *)v6, "0x");
        if (Length >= 1)
        {
          int v7 = 2;
          do
          {
            int v8 = *BytePtr++;
            v7 += snprintf((char *)v6 + v7, 3uLL, "%02x", v8);
            --Length;
          }
          while (Length);
        }
        uint64_t v9 = [NSString stringWithUTF8String:v6];
        free(v6);
      }
      else
      {
        uint64_t v9 = 0;
      }
      size_t v10 = (void *)hwBoardRevision___revision;
      hwBoardRevision___revision = v9;
    }
  }
}

- (id)getDeviceSerialNumber
{
  CFTypeID v2 = (void *)MEMORY[0x1E4F92A00];
  CFTypeID v3 = [(PLConfigAgent *)self iokitExpertDevice];
  BOOL v4 = objc_msgSend(v2, "snapshotFromIOEntry:forKey:", objc_msgSend(v3, "service"), @"IOPlatformSerialNumber");

  return v4;
}

- (void)initOperatorDependancies
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F929A0]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke;
  v49[3] = &unk_1E692A0F0;
  v49[4] = self;
  BOOL v4 = (PLCFNotificationOperatorComposition *)[v3 initWithOperator:self forNotification:@"com.apple.sysdiagnose.sysdiagnoseStarted" requireState:0 withBlock:v49];
  sysdiagnoseStartListener = self->_sysdiagnoseStartListener;
  self->_sysdiagnoseStartListener = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F929A0]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_366;
  v48[3] = &unk_1E692A0F0;
  v48[4] = self;
  int v7 = (PLCFNotificationOperatorComposition *)[v6 initWithOperator:self forNotification:@"com.apple.sysdiagnose.sysdiagnoseStopped" requireState:0 withBlock:v48];
  sysdiagnoseStopListener = self->_sysdiagnoseStopListener;
  self->_sysdiagnoseStopListener = v7;

  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel_pairStatusDidChange_ name:*MEMORY[0x1E4F79EA0] object:0];

  size_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel_pairStatusDidChange_ name:*MEMORY[0x1E4F79EB8] object:0];

  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_pairStatusDidChange_ name:*MEMORY[0x1E4F79EC8] object:0];

  id v12 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v13 = [(PLOperator *)self workQueue];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_373;
  v47[3] = &unk_1E692A0F0;
  v47[4] = self;
  uint64_t v14 = (void *)[v12 initWithWorkQueue:v13 forNotification:@"com.apple.system.console_mode_changed" requireState:1 withBlock:v47];
  [(PLConfigAgent *)self setConsoleModeListener:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F929A0]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_377;
  v46[3] = &unk_1E692A0F0;
  v46[4] = self;
  id v16 = (PLCFNotificationOperatorComposition *)[v15 initWithOperator:self forNotification:@"com.apple.keyboard.preferences.haptic-feedback.changed" requireState:0 withBlock:v46];
  notificationKeyboardHaptics = self->_notificationKeyboardHaptics;
  self->_notificationKeyboardHaptics = v16;

  id v18 = objc_alloc(MEMORY[0x1E4F929A0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_381;
  v45[3] = &unk_1E692A0F0;
  v45[4] = self;
  id v19 = (PLCFNotificationOperatorComposition *)[v18 initWithOperator:self forNotification:@"com.apple.preferences.sounds.keyboard-audio.changed" requireState:0 withBlock:v45];
  notificationKeyboardClicks = self->_notificationKeyboardClicks;
  self->_notificationKeyboardClicks = v19;

  _ringerStateNotifyToken = -1;
  objc_initWeak(&location, self);
  id v21 = MEMORY[0x1E4F14428];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_383;
  handler[3] = &unk_1E692BAB8;
  objc_copyWeak(&v43, &location);
  notify_register_dispatch("com.apple.springboard.ringerstate", &_ringerStateNotifyToken, MEMORY[0x1E4F14428], handler);

  if (_ringerStateNotifyToken != -1) {
    [(PLConfigAgent *)self logEventForwardRingerState];
  }
  id v22 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_398;
  v41[3] = &unk_1E692A6F8;
  v41[4] = self;
  __int16 v23 = (void *)[v22 initWithOperator:self withRegistration:&unk_1F29E91A8 withBlock:v41];
  [(PLConfigAgent *)self setPhotoSharingListener:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v50[0] = @"clientID";
  v50[1] = @"event";
  v51[0] = &unk_1F29E5428;
  v51[1] = @"ContinuityCamera";
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_402;
  v40[3] = &unk_1E692A6F8;
  v40[4] = self;
  uint64_t v26 = (PLXPCListenerOperatorComposition *)[v24 initWithOperator:self withRegistration:v25 withBlock:v40];
  continuityCameraNotification = self->_continuityCameraNotification;
  self->_continuityCameraNotification = v26;

  id v28 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_409;
  v39[3] = &unk_1E692A6F8;
  v39[4] = self;
  v29 = (PLXPCListenerOperatorComposition *)[v28 initWithOperator:self withRegistration:&unk_1F29E91D0 withBlock:v39];
  ambientModeListener = self->_ambientModeListener;
  self->_ambientModeListener = v29;

  id v31 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __41__PLConfigAgent_initOperatorDependancies__block_invoke_419;
  v38[3] = &unk_1E692A6F8;
  v38[4] = self;
  v32 = (PLXPCListenerOperatorComposition *)[v31 initWithOperator:self withRegistration:&unk_1F29E91F8 withBlock:v38];
  buddyDataListener = self->_buddyDataListener;
  self->_buddyDataListener = v32;

  if ([MEMORY[0x1E4F92A88] deviceRebooted]
    && [MEMORY[0x1E4F92A38] internalBuild])
  {
    v34 = PLLogCommon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v37 = 0;
      _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "Device rebooted, spinning up PPSFeatureFlagReaderHelper", v37, 2u);
    }

    v35 = objc_alloc_init(PPSFeatureFlagReaderHelper);
    v36 = [(PPSFeatureFlagReaderHelper *)v35 getFeatureFlags];
    [(PLConfigAgent *)self logEventPointFeatureFlags:v36];
  }
  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

uint64_t __41__PLConfigAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  CFTypeID v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Sysdiagnose started", v4, 2u);
  }

  return [*(id *)(a1 + 32) logEventForwardSysdiagnoseEvent:1];
}

uint64_t __41__PLConfigAgent_initOperatorDependancies__block_invoke_366(uint64_t a1)
{
  CFTypeID v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Sysdiagnose stopped", v4, 2u);
  }

  return [*(id *)(a1 + 32) logEventForwardSysdiagnoseEvent:0];
}

uint64_t __41__PLConfigAgent_initOperatorDependancies__block_invoke_373(uint64_t a1)
{
  CFTypeID v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_debug_impl(&dword_1D2690000, v2, OS_LOG_TYPE_DEBUG, "Console Mode changed", v4, 2u);
  }

  return [*(id *)(a1 + 32) logEventForwardConsoleMode];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_377(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Keyboard Haptics Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardKeyboardHaptics];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_381(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Keyboard Clicks Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardKeyboardClicks];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_383(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained logEventForwardRingerState];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Photo Sharing Changed: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardPhotoSharing:v6];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_402(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Continuity Camera payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardContinuityCamera:v6];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_409(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "AmbientModeEnabled Changed: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardAmbientModeEnabled:v6];
}

void __41__PLConfigAgent_initOperatorDependancies__block_invoke_419(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Buddy data payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventNoneBuddyData:v6];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F79EA0] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F79EB8] object:0];

  size_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F79EC8] object:0];

  v6.receiver = self;
  v6.super_class = (Class)PLConfigAgent;
  [(PLAgent *)&v6 dealloc];
}

- (void)log
{
  [(PLConfigAgent *)self logEventNoneConfig];
  [(PLConfigAgent *)self logEventNonePairedDeviceConfig];
  [(PLConfigAgent *)self logEventForwardKeyboardHaptics];
  [(PLConfigAgent *)self logEventForwardKeyboardClicks];
  [(PLConfigAgent *)self logEventForwardRingerState];
  [(PLConfigAgent *)self logEventForwardConsoleMode];
  [(PLConfigAgent *)self logDeviceCapability];
  [(PLConfigAgent *)self logCPUCoreConfig];
}

- (void)logEventPointFeatureFlags:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"FeatureFlags"];
  objc_super v6 = [MEMORY[0x1E4F92A88] deviceBootTime];
  id v7 = objc_opt_new();
  int v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v4;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "PPSFeatureFlagReader currFeatureFlags set : %@", buf, 0xCu);
  }

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withDate:v6];
  if ([v4 count])
  {
    id v31 = v9;
    v32 = v7;
    uint64_t v26 = self;
    char v27 = v6;
    id v28 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v4;
    uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    uint64_t v10 = 0;
    if (v33)
    {
      uint64_t v30 = *(void *)v35;
      do
      {
        uint64_t v11 = 0;
        id v12 = v10;
        do
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
          v42[0] = @"Domain";
          uint64_t v14 = [v13 objectForKeyedSubscript:@"Domain"];
          v43[0] = v14;
          v42[1] = @"FeatureName";
          id v15 = [v13 objectForKeyedSubscript:@"FeatureName"];
          v43[1] = v15;
          v42[2] = @"TargetRelease";
          id v16 = [v13 objectForKeyedSubscript:@"TargetRelease"];
          v43[2] = v16;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];

          id v17 = [v13 objectForKeyedSubscript:@"State"];
          [v31 setObject:v17 forKeyedSubscript:v10];

          v40[0] = @"Domain";
          id v18 = [v13 objectForKeyedSubscript:@"Domain"];
          v41[0] = v18;
          v40[1] = @"FeatureName";
          id v19 = [v13 objectForKeyedSubscript:@"FeatureName"];
          v41[1] = v19;
          v40[2] = @"TargetRelease";
          id v20 = [v13 objectForKeyedSubscript:@"TargetRelease"];
          v41[2] = v20;
          v40[3] = @"State";
          id v21 = [v13 objectForKeyedSubscript:@"State"];
          v41[3] = v21;
          id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];
          [v32 addObject:v22];

          ++v11;
          id v12 = v10;
        }
        while (v33 != v11);
        uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v33);
    }

    id v9 = v31;
    [(PLOperator *)v26 logEntry:v31];
    id v7 = v32;
    uint64_t v38 = @"__PPSKVPairs__";
    v39 = v32;
    __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v24 = [v31 entryDate];
    [(PLOperator *)v26 logForSubsystem:@"BackgroundProcessing" category:@"FeatureFlag" data:v23 date:v24];
    size_t v5 = v28;
    objc_super v6 = v27;
  }
  else
  {
    uint64_t v25 = PLLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "PPSFeatureFlagReader currFeatureFlags set is empty, all Feature Flags are in Default State", buf, 2u);
    }

    uint64_t v10 = &unk_1F29E9220;
    [v9 setObject:&unk_1F29E5470 forKeyedSubscript:&unk_1F29E9220];
    [(PLOperator *)self logEntry:v9];
    [v7 addObject:&unk_1F29E9248];
    uint64_t v45 = @"__PPSKVPairs__";
    id v46 = v7;
    __int16 v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v24 = [v9 entryDate];
    [(PLOperator *)self logForSubsystem:@"BackgroundProcessing" category:@"FeatureFlag" data:v23 date:v24];
  }
}

- (void)logEventForwardSysdiagnoseEvent:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_super v6 = @"Start";
  id v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  size_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [(PLOperator *)self logForSubsystem:@"ConfigMetrics" category:@"SysdiagnoseEvent" data:v5];
}

- (void)logEventForwardKeyboardHaptics
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"KeyboardHaptics"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  size_t v5 = [MEMORY[0x1E4F929C0] objectForKey:@"KeyboardVisceral" forApplicationID:@"com.apple.keyboard.preferences" synchronize:1];
  objc_super v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 BOOLValue];
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Keyboard Haptics state: %d", (uint8_t *)v10, 8u);
  }

  id v9 = [NSNumber numberWithBool:v7];
  [v4 setObject:v9 forKeyedSubscript:@"Enabled"];

  [(PLOperator *)self logEntry:v4];
}

- (void)logEventForwardKeyboardClicks
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"KeyboardClicks"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  uint64_t v5 = 1;
  objc_super v6 = [MEMORY[0x1E4F929C0] objectForKey:@"keyboard-audio" forApplicationID:@"com.apple.preferences.sounds" synchronize:1];
  uint64_t v7 = v6;
  if (v6) {
    uint64_t v5 = [v6 BOOLValue];
  }
  int v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109120;
    v10[1] = v5;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Keyboard Clicks state: %d", (uint8_t *)v10, 8u);
  }

  id v9 = [NSNumber numberWithBool:v5];
  [v4 setObject:v9 forKeyedSubscript:@"Enabled"];

  [(PLOperator *)self logEntry:v4];
}

- (void)logEventForwardRingerState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11[0]) = 0;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Ringer State changed", (uint8_t *)v11, 2u);
  }

  int v4 = _ringerStateNotifyToken;
  if (_ringerStateNotifyToken == -1)
  {
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11[0]) = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Ringer NOTIFY_TOKEN_INVALID", (uint8_t *)v11, 2u);
    }

    int v4 = _ringerStateNotifyToken;
  }
  v11[0] = 0;
  notify_get_state(v4, v11);
  uint64_t v6 = v11[0];
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v6 != 0;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Ringer state: %d", buf, 8u);
  }

  int v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Ringer"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  uint64_t v10 = [NSNumber numberWithBool:v6 != 0];
  [v9 setObject:v10 forKeyedSubscript:@"Enabled"];

  [(PLOperator *)self logEntry:v9];
}

- (void)logEventForwardAmbientModeEnabled:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"AmbientModeEnabled"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardPhotoSharing:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PhotoSharing"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardContinuityCamera:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ContinuityCamera"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v4];

  [(PLOperator *)self logEntry:v5];
}

- (void)logEventNoneBuddyData:(id)a3
{
  id v4 = a3;
  [(PLOperator *)self logForSubsystem:@"ConfigMetrics" category:@"BuddyData" data:v4];
  [(PLOperator *)self logForSubsystem:@"BackgroundProcessing" category:@"BuddyData" data:v4];

  id v5 = [(PLOperator *)self storage];
  [v5 flushCachesWithReason:@"BuddyData"];
}

- (void)logEventForwardConsoleMode
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  id v3 = [(PLConfigAgent *)self consoleModeListener];
  uint32_t state = notify_get_state([v3 stateToken], &state64);

  if (state)
  {
    id v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Console Mode state Unavailable", buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = state64;
    id v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v13 = v6 != 0;
      _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Console Mode state: %d", buf, 8u);
    }

    uint64_t v10 = @"Enabled";
    int v8 = [NSNumber numberWithBool:v6 != 0];
    uint64_t v11 = v8;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    [(PLOperator *)self logForSubsystem:@"ConfigMetrics" category:@"ConsoleModeEnabled" data:v5];
  }
}

- (void)logDeviceCapability
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F92AB8] deviceCapabilityMapping];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PLConfigAgent_logDeviceCapability__block_invoke;
  v6[3] = &unk_1E692BAE0;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
  [(PLOperator *)self logForSubsystem:@"ConfigMetrics" category:@"DeviceCapability" data:v5];
}

void __36__PLConfigAgent_logDeviceCapability__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v8 = [v5 numberWithInteger:a3];
  id v7 = [NSString stringWithFormat:@"Capability%@", v8];
  [*(id *)(a1 + 32) setObject:v6 forKey:v7];
}

- (void)logCPUCoreConfig
{
  id v10 = (id)objc_opt_new();
  uint64_t v3 = [(PLConfigAgent *)self getPerfLevelsCount];
  id v4 = [NSNumber numberWithInt:v3];
  [v10 setObject:v4 forKeyedSubscript:@"numCoreTypes"];

  if ((int)v3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if (v5) {
        id v6 = @"numEcpuCores";
      }
      else {
        id v6 = @"numPcpuCores";
      }
      id v7 = NSNumber;
      id v8 = v6;
      id v9 = objc_msgSend(v7, "numberWithInt:", -[PLConfigAgent getCoreCount:](self, "getCoreCount:", v5));
      [v10 setObject:v9 forKeyedSubscript:v8];

      uint64_t v5 = (v5 + 1);
    }
    while (v3 != v5);
  }
  [(PLOperator *)self logForSubsystem:@"ConfigMetrics" category:@"CPUCoreConfig" data:v10];
}

- (void)logConfigToBGSQL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F929C0] objectForKey:@"LastUpgradeSystemTimestamp" forApplicationID:@"com.apple.powerlogd" synchronize:0];
  id v6 = NSNumber;
  id v7 = [v4 objectForKeyedSubscript:@"DeviceBootTime"];
  id v8 = [v7 convertFromMonotonicToSystem];
  [v8 timeIntervalSince1970];
  id v9 = objc_msgSend(v6, "numberWithDouble:");

  id v10 = PLLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "Config - Device upgrade timestamp is %@ and system boot time is %@", (uint8_t *)&v15, 0x16u);
  }

  if (v5 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v5;
  }
  id v12 = v11;
  [v4 setObject:v12 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

  BOOL v13 = [v4 dictionary];
  uint64_t v14 = [v4 entryDate];
  [(PLOperator *)self logForSubsystem:@"BackgroundProcessing" category:@"Config" data:v13 date:v14];
}

- (void)logConfigEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v14 = [v4 dictionary];

  id v6 = [(PLConfigAgent *)self getCoverGlass];
  [v14 setObject:v6 forKeyedSubscript:@"DeviceCoverGlassCoating"];

  id v7 = [(PLConfigAgent *)self getShutdownBootReason:1];
  [v14 setObject:v7 forKeyedSubscript:@"ShutdownReason"];

  id v8 = [(PLConfigAgent *)self getShutdownBootReason:0];
  [v14 setObject:v8 forKeyedSubscript:@"BootReason"];

  id v9 = [v4 entryDate];

  [(PLOperator *)self logForSubsystem:@"ConfigMetrics" category:@"DeviceConfig" data:v14 date:v9];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    id v10 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v11 = [v14 objectForKeyedSubscript:@"DeviceSerialNumber"];
    uint64_t v12 = [v10 dictionaryWithObject:v11 forKey:@"DeviceSerialNumber"];

    [(PLOperator *)self logForSubsystem:@"XcodeMetrics" category:@"DeviceConfig" data:v12];
    id v13 = (id)v12;
  }
  else
  {
    id v13 = v14;
  }
  id v15 = v13;
  [(PLConfigAgent *)self logConfigEntryToCA:v13];
}

- (void)logEventNoneConfig
{
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"Config"];
  id v4 = objc_alloc(MEMORY[0x1E4F929D0]);
  uint64_t v5 = [MEMORY[0x1E4F92AD0] sharedCore];
  id v6 = [v5 launchDate];
  id v7 = (void *)[v4 initWithEntryKey:v3 withDate:v6];

  id v8 = [MEMORY[0x1E4F92A88] buildVersion];
  [v7 setObject:v8 forKeyedSubscript:@"Build"];

  id v9 = [MEMORY[0x1E4F92A88] supplementalBuildVersion];
  [v7 setObject:v9 forKeyedSubscript:@"SupplementalBuild"];

  id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F92A38], "internalBuild") ^ 1);
  [v7 setObject:v10 forKeyedSubscript:@"CustomerOS"];

  uint64_t v11 = [MEMORY[0x1E4F92A88] hardwareModel];
  [v7 setObject:v11 forKeyedSubscript:@"Device"];

  uint64_t v12 = [MEMORY[0x1E4F92A88] crashReporterKey];
  [v7 setObject:v12 forKeyedSubscript:@"CRKey"];

  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    id v13 = [MEMORY[0x1E4F92A88] crashReporterKey];
    [v7 setObject:v13 forKeyedSubscript:@"CRKey2"];

    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLConfigAgent rootInstalled](self, "rootInstalled"));
    [v7 setObject:v14 forKeyedSubscript:@"RootInstalled"];
  }
  id v15 = [(PLConfigAgent *)self deviceName];
  [v7 setObject:v15 forKeyedSubscript:@"DeviceName"];

  id v16 = [MEMORY[0x1E4F92A88] deviceBootArgs];
  [v7 setObject:v16 forKeyedSubscript:@"BootArgs"];

  __int16 v17 = [MEMORY[0x1E4F92A88] deviceBootTime];
  [v7 setObject:v17 forKeyedSubscript:@"DeviceBootTime"];

  id v18 = objc_msgSend(NSNumber, "numberWithInt:", -[PLConfigAgent getDeviceType](self, "getDeviceType"));
  [v7 setObject:v18 forKeyedSubscript:@"DeviceType"];

  uint64_t v19 = [v7 objectForKeyedSubscript:@"Build"];
  id v20 = [(PLConfigAgent *)self logAndUpdateLastUpgradeTime:v19];
  [v7 setObject:v20 forKeyedSubscript:@"LastUpgradeTimestamp"];

  id v21 = [v7 objectForKeyedSubscript:@"Build"];
  id v22 = [(PLConfigAgent *)self logAndUpdateLastBuild:v21];
  [v7 setObject:v22 forKeyedSubscript:@"LastBuild"];

  __int16 v23 = NSNumber;
  [MEMORY[0x1E4F92A88] getMachbaseTimeRatio];
  id v24 = objc_msgSend(v23, "numberWithDouble:");
  [v7 setObject:v24 forKeyedSubscript:@"MachTimeBaseRatio"];

  uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[PLConfigAgent autolockTime](self, "autolockTime"));
  [v7 setObject:v25 forKeyedSubscript:@"AutoLockTime"];

  uint64_t v26 = [(PLConfigAgent *)self baseband];
  [v7 setObject:v26 forKeyedSubscript:@"Baseband"];

  char v27 = [(PLConfigAgent *)self basebandFirmware];
  [v7 setObject:v27 forKeyedSubscript:@"BasebandFirmware"];

  id v28 = objc_msgSend(NSNumber, "numberWithBool:", -[PLConfigAgent noWatchdogs](self, "noWatchdogs"));
  [v7 setObject:v28 forKeyedSubscript:@"BKNoWatchdogs"];

  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[PLConfigAgent disableCABlanking](self, "disableCABlanking"));
  [v7 setObject:v29 forKeyedSubscript:@"SBDisableCABlanking"];

  uint64_t v30 = [MEMORY[0x1E4F92A88] automatedDeviceGroup];
  [v7 setObject:v30 forKeyedSubscript:@"AutomatedDeviceGroup"];

  id v31 = [(PLConfigAgent *)self seedGroup];
  [v7 setObject:v31 forKeyedSubscript:@"SeedGroup"];

  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    v32 = [(PLConfigAgent *)self hwConfig];
    [v7 setObject:v32 forKeyedSubscript:@"ConfigNumber"];

    uint64_t v33 = [(PLConfigAgent *)self hwBoardRevision];
    [v7 setObject:v33 forKeyedSubscript:@"DebugBoardRevision"];

    long long v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4F92A88], "devBoardDevice"));
    [v7 setObject:v34 forKeyedSubscript:@"DevBoard"];
  }
  long long v35 = [(PLConfigAgent *)self logLastBackupTime];
  [v7 setObject:v35 forKeyedSubscript:@"LastBackupTimestamp"];

  long long v36 = [(PLConfigAgent *)self deviceShutdownReasons];
  [v7 setObject:v36 forKeyedSubscript:@"DeviceBootReasons"];

  long long v37 = [(PLConfigAgent *)self logIcloudAccountType];
  [v7 setObject:v37 forKeyedSubscript:@"IcloudAccountType"];

  uint64_t v38 = objc_msgSend(NSNumber, "numberWithInt:", -[PLConfigAgent getOSVariant](self, "getOSVariant"));
  [v7 setObject:v38 forKeyedSubscript:@"OSVariant"];

  v39 = NSNumber;
  [(PLConfigAgent *)self logDeviceDiskSize];
  uint64_t v40 = objc_msgSend(v39, "numberWithDouble:");
  [v7 setObject:v40 forKeyedSubscript:@"DeviceDiskSize"];

  v41 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLConfigAgent volumeFreespace:](self, "volumeFreespace:", @"/"));
  [v7 setObject:v41 forKeyedSubscript:@"RemainingDiskSpace"];

  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v42 = [(PLConfigAgent *)self getDeviceSerialNumber];
    [v7 setObject:v42 forKeyedSubscript:@"DeviceSerialNumber"];
  }
  BOOL v43 = [(PLConfigAgent *)self getMDMStatus];
  uint64_t v44 = [NSNumber numberWithBool:v43];
  [v7 setObject:v44 forKeyedSubscript:@"MDMStatus"];

  if (([MEMORY[0x1E4F92A38] isiOS] & 1) != 0 || objc_msgSend(MEMORY[0x1E4F92A38], "isMac")) {
    AnalyticsSendEventLazy();
  }
  uint64_t v45 = [(PLConfigAgent *)self getSplatVersionString];
  [v7 setObject:v45 forKeyedSubscript:@"InstalledSplat"];

  id v46 = [(PLConfigAgent *)self logLastUpgradeSystemTimestamp];
  [v7 setObject:v46 forKeyedSubscript:@"LastUpgradeSystemTimestamp"];

  uint64_t v47 = [MEMORY[0x1E4F929C0] objectForKey:@"InstallType" ifNotSet:&unk_1F29E5488];
  [v7 setObject:v47 forKeyedSubscript:@"InstallType"];

  id v48 = [MEMORY[0x1E4F92A88] getDeviceSoC];
  [v7 setObject:v48 forKeyedSubscript:@"Device_SoC"];

  [(PLOperator *)self logEntry:v7];
  [(PLConfigAgent *)self logConfigEntry:v7];
  [(PLConfigAgent *)self logEntryToCA:v7];
  [(PLConfigAgent *)self logConfigToBGSQL:v7];
  uint64_t v49 = [(PLOperator *)self storage];
  [v49 flushCachesWithReason:@"DeviceConfig"];
}

id __35__PLConfigAgent_logEventNoneConfig__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"MDMStatus";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  CFTypeID v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)pairStatusDidChange:(id)a3
{
  id v4 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__PLConfigAgent_pairStatusDidChange___block_invoke;
  block[3] = &unk_1E692A250;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __37__PLConfigAgent_pairStatusDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLConfigAgent_pairStatusDidChange___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v2;
    if (qword_1EBD57ED0 != -1) {
      dispatch_once(&qword_1EBD57ED0, block);
    }
    if (byte_1EBD57E81)
    {
      uint64_t v3 = [NSString stringWithFormat:@"Gizmo pairStatusDidChange:"];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m"];
      id v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLConfigAgent pairStatusDidChange:]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1782];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return [*(id *)(a1 + 32) logEventNonePairedDeviceConfig];
}

uint64_t __37__PLConfigAgent_pairStatusDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57E81 = result;
  return result;
}

- (void)logEventNonePairedDeviceConfig
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F79EF0] sharedInstance];
  uint64_t v5 = [v4 getActivePairedDevice];

  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PairedDeviceConfig"];
  long long v51 = self;
  id v7 = [(PLOperator *)self storage];
  id v8 = [v7 lastEntryForKey:v6];

  uint64_t v9 = *MEMORY[0x1E4F79E40];
  uint64_t v10 = [v5 valueForProperty:*MEMORY[0x1E4F79E40]];
  uint64_t v11 = v10;
  long long v50 = (void *)v10;
  if (v8)
  {
    uint64_t v2 = [v8 objectForKeyedSubscript:@"Build"];
    if (!(v2 | v11))
    {
      uint64_t v2 = 0;
      int v49 = 1;
LABEL_6:

      goto LABEL_7;
    }
LABEL_5:
    uint64_t v12 = [v8 objectForKeyedSubscript:@"Build"];
    int v49 = [(id)v11 isEqualToString:v12];

    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10) {
    goto LABEL_5;
  }
  int v49 = 1;
LABEL_7:
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v13;
    if (qword_1EBD57ED8 != -1) {
      dispatch_once(&qword_1EBD57ED8, block);
    }
    if (byte_1EBD57E82)
    {
      id v14 = [NSString stringWithFormat:@"PairedDeviceConfig: build changed = %d\n"], v49 ^ 1u);
      id v15 = (void *)MEMORY[0x1E4F929B8];
      id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m"];
      __int16 v17 = [v16 lastPathComponent];
      id v18 = [NSString stringWithUTF8String:"-[PLConfigAgent logEventNonePairedDeviceConfig]"];
      [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:1818];

      uint64_t v19 = PLLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v55 = v14;
        _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  if (v5)
  {
    if ([MEMORY[0x1E4F92A38] internalBuild])
    {
      id v21 = [v5 valueForProperty:*MEMORY[0x1E4F79E10]];
      id v22 = [v21 UUIDString];
      [v20 setObject:v22 forKeyedSubscript:@"PairingID"];
    }
    __int16 v23 = [v5 valueForProperty:v9];
    [v20 setObject:v23 forKeyedSubscript:@"Build"];

    id v24 = [v5 valueForProperty:*MEMORY[0x1E4F79E18]];
    [v20 setObject:v24 forKeyedSubscript:@"Device"];

    uint64_t v25 = [v5 valueForProperty:*MEMORY[0x1E4F79D80]];
    [v20 setObject:v25 forKeyedSubscript:@"HWModel"];

    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C5DDE5DD-2FF7-4735-80A3-0108488556DE"];
    unsigned int v27 = [v5 supportsCapability:v26];

    uint64_t v28 = v27;
  }
  else
  {
    uint64_t v28 = 0;
  }
  v29 = [MEMORY[0x1E4F79EF0] sharedInstance];
  uint64_t v30 = [MEMORY[0x1E4F79EF0] activePairedDeviceSelectorBlock];
  id v31 = [v29 getAllDevicesWithArchivedAltAccountDevicesMatching:v30];
  v32 = [v31 firstObject];

  if (v32)
  {
    uint64_t v33 = [v32 valueForProperty:*MEMORY[0x1E4F79DA0]];
    int v34 = [v33 BOOLValue];

    if (v34) {
      v28 |= 2uLL;
    }
  }
  long long v35 = [NSNumber numberWithUnsignedInteger:v28];
  [v20 setObject:v35 forKeyedSubscript:@"PMode"];

  if ([MEMORY[0x1E4F92A38] isWatch])
  {
    ADClientSetValueForScalarKey();
    v52[5] = MEMORY[0x1E4F143A8];
    v52[6] = 3221225472;
    v52[7] = __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_521;
    v52[8] = &__block_descriptor_40_e19___NSDictionary_8__0l;
    v52[9] = v28;
    AnalyticsSendEventLazy();
  }
  if (!v8) {
    goto LABEL_41;
  }
  uint64_t v36 = [v8 objectForKeyedSubscript:@"PMode"];
  if (!v36) {
    goto LABEL_41;
  }
  long long v37 = (void *)v36;
  uint64_t v38 = [v8 objectForKeyedSubscript:@"PMode"];
  uint64_t v39 = [v38 unsignedIntegerValue];

  if (v39 == v28)
  {
    if (v49) {
      goto LABEL_37;
    }
  }
  else
  {
LABEL_41:
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v40 = objc_opt_class();
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_2;
      v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v52[4] = v40;
      if (qword_1EBD57EE0 != -1) {
        dispatch_once(&qword_1EBD57EE0, v52);
      }
      if (byte_1EBD57E83)
      {
        v41 = NSString;
        uint64_t v42 = [v8 objectForKeyedSubscript:@"PMode"];
        BOOL v43 = objc_msgSend(v41, "stringWithFormat:", @"PairedDeviceConfig: mode changed = %d (0x%x -> 0x%x)\n", 1, objc_msgSend(v42, "unsignedIntegerValue"), v28);

        uint64_t v44 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLConfigAgent.m"];
        id v46 = [v45 lastPathComponent];
        uint64_t v47 = [NSString stringWithUTF8String:"-[PLConfigAgent logEventNonePairedDeviceConfig]"];
        [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:1858];

        id v48 = PLLogCommon();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v55 = v43;
          _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  [(PLOperator *)v51 logEntry:v20];
LABEL_37:
}

uint64_t __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57E82 = result;
  return result;
}

id __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_521(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"mode";
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

uint64_t __47__PLConfigAgent_logEventNonePairedDeviceConfig__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57E83 = result;
  return result;
}

- (unint64_t)getEnclosureMaterial
{
  return 0;
}

- (void)logEntryToCA:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F92A88] deviceRebooted])
  {
    id v4 = [v3 objectForKeyedSubscript:@"DeviceBootReasons"];
    uint64_t v5 = v4;
    if (v4)
    {
      if ([v4 rangeOfString:@"vdd_under"] != 0x7FFFFFFFFFFFFFFFLL)
      {
        MEMORY[0x1D94294C0](@"com.apple.power.boot.vdd_under", 1);
        AnalyticsSendEventLazy();
      }
      id v6 = v5;
      AnalyticsSendEventLazy();
    }
  }
}

void *__30__PLConfigAgent_logEntryToCA___block_invoke()
{
  return &unk_1F29E9270;
}

id __30__PLConfigAgent_logEntryToCA___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"deviceBootReasons";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)logConfigEntryToCA:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F92A88] deviceRebooted])
  {
    id v4 = [v3 objectForKeyedSubscript:@"ShutdownReason"];
    uint64_t v5 = [v3 objectForKeyedSubscript:@"BootReason"];
    id v6 = (void *)v5;
    if (v4 && v5)
    {
      id v7 = v4;
      id v8 = v6;
      AnalyticsSendEventLazy();
    }
  }
}

id __36__PLConfigAgent_logConfigEntryToCA___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"ShutdownReason"];
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"BootReason"];
  return v2;
}

- (PLCFNotificationOperatorComposition)notificationKeyboardClicks
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLCFNotificationOperatorComposition)notificationKeyboardHaptics
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (PLXPCListenerOperatorComposition)photoSharingListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPhotoSharingListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)continuityCameraNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLXPCListenerOperatorComposition)ambientModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLXPCListenerOperatorComposition)buddyDataListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLCFNotificationOperatorComposition)consoleModeListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConsoleModeListener:(id)a3
{
}

- (PLIOKitOperatorComposition)iokitExpertDevice
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (PLCFNotificationOperatorComposition)sysdiagnoseStartListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSysdiagnoseStartListener:(id)a3
{
}

- (PLCFNotificationOperatorComposition)sysdiagnoseStopListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSysdiagnoseStopListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sysdiagnoseStopListener, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseStartListener, 0);
  objc_storeStrong((id *)&self->_iokitExpertDevice, 0);
  objc_storeStrong((id *)&self->_consoleModeListener, 0);
  objc_storeStrong((id *)&self->_buddyDataListener, 0);
  objc_storeStrong((id *)&self->_ambientModeListener, 0);
  objc_storeStrong((id *)&self->_continuityCameraNotification, 0);
  objc_storeStrong((id *)&self->_photoSharingListener, 0);
  objc_storeStrong((id *)&self->_notificationKeyboardHaptics, 0);
  objc_storeStrong((id *)&self->_notificationKeyboardClicks, 0);
}

@end