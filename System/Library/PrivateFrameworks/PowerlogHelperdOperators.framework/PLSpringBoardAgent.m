@interface PLSpringBoardAgent
+ (id)defaults;
+ (id)entryAggregateDefinitionBulletins;
+ (id)entryAggregateDefinitionNotifications;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionBlank;
+ (id)entryEventForwardDefinitionLock;
+ (id)entryEventForwardDefinitionScreen;
+ (id)entryEventForwardDefinitionWallpaper;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventPointAutoLock;
+ (id)entryEventPointBulletins;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointLocalRemoteNotifications;
+ (void)load;
- (BOOL)autoLockIsNil;
- (BOOL)deviceIsCharging;
- (NSDate)lastEligibleAutolockEnergyComputationDate;
- (NSDictionary)screenNumberToName;
- (PLCFNotificationOperatorComposition)notificationSBBlankTrackingChanged;
- (PLCFNotificationOperatorComposition)notificationSBLockTrackingChanged;
- (PLEntry)lastReceivedPushEntry;
- (PLEntry)lastSBEntry;
- (PLEntryNotificationOperatorComposition)deviceChargingStateNotification;
- (PLEntryNotificationOperatorComposition)displayOffNotification;
- (PLEntryNotificationOperatorComposition)displayOnNotification;
- (PLEntryNotificationOperatorComposition)receivedPushNotification;
- (PLMonotonicTimer)autolockEnergyPeriodicTimer;
- (PLNSNotificationOperatorComposition)notificationSBAutoLockTimerFiredNotification;
- (PLNSNotificationOperatorComposition)notificationSBScreenTimeTrackingChanged;
- (PLNSNotificationOperatorComposition)notificationSBWallpaperTrackingChanged;
- (PLSpringBoardAgent)init;
- (PLTimer)dailyWallpaperPoll;
- (PLXPCListenerOperatorComposition)bulletinBoardNotificationPublishEvent;
- (PLXPCListenerOperatorComposition)userNotificationRequestEvent;
- (PLXPCListenerOperatorComposition)userNotificationTriggerEvent;
- (double)currentMediaTime;
- (id)addCountsAndDurationsFor:(id)a3 toEntry:(id)a4;
- (id)fetchSBWallpaperForType:(int)a3;
- (id)screenLock:(id)a3;
- (void)addAccountingEvent:(id)a3;
- (void)closeLastOpenEventsWithStopDate:(id)a3;
- (void)computeAutolockEnergyWithNow:(id)a3;
- (void)dealloc;
- (void)handleChargingStateChange:(id)a3;
- (void)initOperatorDependancies;
- (void)logBulletinAggregate:(id)a3;
- (void)logBulletinPerEvent:(id)a3;
- (void)logMailNotification:(id)a3;
- (void)logNotification:(id)a3;
- (void)resetAutoLockIsNil;
- (void)setAutoLockIsNil:(BOOL)a3;
- (void)setAutolockEnergyPeriodicTimer:(id)a3;
- (void)setDailyWallpaperPoll:(id)a3;
- (void)setDeviceChargingStateNotification:(id)a3;
- (void)setDeviceIsCharging:(BOOL)a3;
- (void)setDisplayOffNotification:(id)a3;
- (void)setDisplayOnNotification:(id)a3;
- (void)setLastEligibleAutolockEnergyComputationDate:(id)a3;
- (void)setLastReceivedPushEntry:(id)a3;
- (void)setLastSBEntry:(id)a3;
- (void)setReceivedPushNotification:(id)a3;
- (void)setScreenNumberToName:(id)a3;
- (void)setUpScreenNumberDictionary;
- (void)startAutolockEnergyPeriodicTimer;
- (void)stopAutolockEnergyPeriodicTimer;
@end

@implementation PLSpringBoardAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSpringBoardAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"SBAutoLock";
  v3 = [a1 entryEventPointAutoLock];
  v9[0] = v3;
  v8[1] = @"SBNotifications";
  v4 = [a1 entryEventPointLocalRemoteNotifications];
  v9[1] = v4;
  v8[2] = @"SBBulletins";
  v5 = [a1 entryEventPointBulletins];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventPointLocalRemoteNotifications
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4011D58;
  v22[1] = MEMORY[0x1E4F1CC28];
  v21[2] = *MEMORY[0x1E4F92C08];
  v22[2] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"NotificationType";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v20[0] = v16;
  v19[1] = @"NotificationBundleID";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat_withBundleID");
  v20[1] = v14;
  v19[2] = @"Waking";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[2] = v4;
  v19[3] = @"NSEStartTime";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_DateFormat");
  v20[3] = v6;
  v19[4] = @"NSEEndTime";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_DateFormat");
  v20[4] = v8;
  v19[5] = @"UIShown";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventPointBulletins
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4011D68;
  v14[1] = MEMORY[0x1E4F1CC28];
  v13[2] = *MEMORY[0x1E4F92C08];
  v14[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"PostType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"BulletinBundleID";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointAutoLock
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4011D68;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"AutoLockType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitions
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"SBBlank";
  uint64_t v2 = +[PLSpringBoardAgent entryEventForwardDefinitionBlank];
  v9[0] = v2;
  v8[1] = @"SBLock";
  v3 = +[PLSpringBoardAgent entryEventForwardDefinitionLock];
  v9[1] = v3;
  v8[2] = @"SBScreen";
  v4 = +[PLSpringBoardAgent entryEventForwardDefinitionScreen];
  v9[2] = v4;
  void v8[3] = @"SBWallpaper";
  v5 = +[PLSpringBoardAgent entryEventForwardDefinitionWallpaper];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)entryEventForwardDefinitionBlank
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4011D68;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Blanked";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionLock
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4011D68;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Locked";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionScreen
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F4011D68;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Screen";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardDefinitionWallpaper
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F4011D68;
  v14[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"HomeScreen";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v11[1] = @"LockScreen";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"SBNotifications_Aggregate";
  v3 = [a1 entryAggregateDefinitionNotifications];
  v7[1] = @"SBBulletins_Aggregate";
  v8[0] = v3;
  v4 = [a1 entryAggregateDefinitionBulletins];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryAggregateDefinitionNotifications
{
  v48[4] = *MEMORY[0x1E4F143B8];
  v47[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v45[0] = *MEMORY[0x1E4F92CD0];
  v45[1] = v2;
  v46[0] = &unk_1F4011D78;
  v46[1] = MEMORY[0x1E4F1CC38];
  v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v48[0] = v38;
  v47[1] = *MEMORY[0x1E4F92CA8];
  v43[0] = @"NotificationType";
  v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v44[0] = v36;
  v43[1] = @"NotificationBundleID";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_StringFormat_withBundleID");
  v44[1] = v34;
  v43[2] = @"Count";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v44[2] = v32;
  v43[3] = @"FgWakingCount";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v44[3] = v30;
  v43[4] = @"FgWakingPluggedInCount";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v44[4] = v28;
  v43[5] = @"BgWakingCount";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v44[5] = v26;
  v43[6] = @"BgWakingPluggedInCount";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v44[6] = v24;
  v43[7] = @"NonWakingCount";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v44[7] = v22;
  v43[8] = @"NonWakingPluggedInCount";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v44[8] = v20;
  v43[9] = @"BgWakingNSEDuration";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v44[9] = v18;
  v43[10] = @"BgWakingPluggedInNSEDuration";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v44[10] = v16;
  v43[11] = @"NonWakingNSEDuration";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v44[11] = v14;
  v43[12] = @"NonWakingPluggedInNSEDuration";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v44[12] = v4;
  v43[13] = @"FgWakingNSEDuration";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v44[13] = v6;
  v43[14] = @"FgWakingPluggedInNSEDuration";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v44[14] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:15];
  v48[1] = v9;
  v47[2] = *MEMORY[0x1E4F92BE0];
  v41 = &unk_1F4011D88;
  uint64_t v39 = *MEMORY[0x1E4F92BD8];
  v40 = &unk_1F4011D98;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  v42 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
  v47[3] = *MEMORY[0x1E4F92BF0];
  v48[2] = v11;
  v48[3] = &unk_1F4013270;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:4];

  return v12;
}

+ (id)entryAggregateDefinitionBulletins
{
  void v24[4] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4011D68;
  v22[1] = MEMORY[0x1E4F1CC38];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v14;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"PostType";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[0] = v4;
  v19[1] = @"BulletinBundleID";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v20[1] = v6;
  v19[2] = @"Count";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v20[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v24[1] = v9;
  void v23[2] = *MEMORY[0x1E4F92BE0];
  v17 = &unk_1F4011D88;
  uint64_t v15 = *MEMORY[0x1E4F92BD8];
  v16 = &unk_1F4011DA8;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v18 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v23[3] = *MEMORY[0x1E4F92BF0];
  v24[2] = v11;
  v24[3] = &unk_1F4013288;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];

  return v12;
}

+ (id)defaults
{
  return &unk_1F400EFE8;
}

- (PLSpringBoardAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)PLSpringBoardAgent;
    v4 = [(PLAgent *)&v49 init];
    v5 = v4;
    if (v4)
    {
      [(PLSpringBoardAgent *)v4 setUpScreenNumberDictionary];
      [(PLSpringBoardAgent *)v5 resetAutoLockIsNil];
      v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v5 selector:sel_settingsChangedNotification_ name:*MEMORY[0x1E4F73EC0] object:0];
      id v7 = objc_alloc(MEMORY[0x1E4F92A28]);
      uint64_t v8 = *MEMORY[0x1E4FA7268];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __26__PLSpringBoardAgent_init__block_invoke;
      v47[3] = &unk_1E6E47908;
      v9 = v5;
      v48 = v9;
      uint64_t v10 = [v7 initWithOperator:v9 forNotification:v8 withBlock:v47];
      notificationSBScreenTimeTrackingChanged = v9->_notificationSBScreenTimeTrackingChanged;
      v9->_notificationSBScreenTimeTrackingChanged = (PLNSNotificationOperatorComposition *)v10;

      _SBFScreenTimeRegisterForExternalChangeNotification();
      id v12 = objc_alloc(MEMORY[0x1E4F92A28]);
      uint64_t v13 = *MEMORY[0x1E4FA6D08];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      void v45[2] = __26__PLSpringBoardAgent_init__block_invoke_164;
      v45[3] = &unk_1E6E47908;
      v14 = v9;
      v46 = v14;
      uint64_t v15 = [v12 initWithOperator:v14 forNotification:v13 withBlock:v45];
      notificationSBAutoLockTimerFiredNotification = v14->_notificationSBAutoLockTimerFiredNotification;
      v14->_notificationSBAutoLockTimerFiredNotification = (PLNSNotificationOperatorComposition *)v15;

      _SBSAutolockTimerRegisterForExternalChangeNotification();
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v17 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __26__PLSpringBoardAgent_init__block_invoke_172;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v17;
        if (init_defaultOnce != -1) {
          dispatch_once(&init_defaultOnce, block);
        }
        if (init_classDebugEnabled)
        {
          v18 = [NSString stringWithFormat:@"Initing SB Wallpaper poll"];
          v19 = (void *)MEMORY[0x1E4F929B8];
          v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
          v21 = [v20 lastPathComponent];
          v22 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent init]"];
          [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:344];

          v23 = PLLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      id v24 = objc_alloc(MEMORY[0x1E4F92A80]);
      v25 = [MEMORY[0x1E4F1C9C8] date];
      v26 = [(PLOperator *)v14 workQueue];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __26__PLSpringBoardAgent_init__block_invoke_178;
      v42[3] = &unk_1E6E489A8;
      v27 = v14;
      v43 = v27;
      v28 = (void *)[v24 initWithFireDate:v25 withInterval:1 withTolerance:0 repeats:v26 withUserInfo:v42 withQueue:86400.0 withBlock:0.0];

      [(PLSpringBoardAgent *)v27 setDailyWallpaperPoll:v28];
      id v29 = objc_alloc(MEMORY[0x1E4F929A0]);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __26__PLSpringBoardAgent_init__block_invoke_185;
      v40[3] = &unk_1E6E47908;
      v30 = v27;
      v41 = v30;
      uint64_t v31 = [v29 initWithOperator:v30 forNotification:@"com.apple.springboard.lockstate" requireState:1 withBlock:v40];
      notificationSBLockTrackingChanged = v30->_notificationSBLockTrackingChanged;
      v30->_notificationSBLockTrackingChanged = (PLCFNotificationOperatorComposition *)v31;

      id v33 = objc_alloc(MEMORY[0x1E4F929A0]);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __26__PLSpringBoardAgent_init__block_invoke_190;
      v38[3] = &unk_1E6E47908;
      v34 = v30;
      uint64_t v39 = v34;
      uint64_t v35 = [v33 initWithOperator:v34 forNotification:@"com.apple.springboard.hasBlankedScreen" requireState:1 withBlock:v38];
      notificationSBBlankTrackingChanged = v34->_notificationSBBlankTrackingChanged;
      v34->_notificationSBBlankTrackingChanged = (PLCFNotificationOperatorComposition *)v35;
    }
    self = v5;
    v3 = self;
  }

  return v3;
}

void __26__PLSpringBoardAgent_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*MEMORY[0x1E4FA7260]];
  if (v3)
  {
    v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SBScreen"];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
    [v5 setObject:v3 forKeyedSubscript:@"Screen"];
    [*(id *)(a1 + 32) logEntry:v5];
    [*(id *)(a1 + 32) addAccountingEvent:v5];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (kPLAutoLockAccountingEvent_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_defaultOnce, block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_classDebugEnabled)
    {
      id v7 = [NSString stringWithFormat:@"WARNING: screenNumber is null; this implies the notification payload was not delivered via NSNotificationOperatorComposition"];
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent init]_block_invoke"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:328];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_164(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2_165;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_2_defaultOnce, block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_2_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Autolock Fired %@: userInfo=%@", v6, v5];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent init]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:336];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SBAutoLock"];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
  v16 = [v5 objectForKeyedSubscript:@"SBAutoLockTimerCategoryKey"];
  [v15 setObject:v16 forKeyedSubscript:@"AutoLockType"];

  [*(id *)(a1 + 32) logEntry:v15];
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2_165(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_172(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_178(uint64_t a1)
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2_179;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLAutoLockAccountingEvent_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_3_defaultOnce, block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_3_classDebugEnabled)
    {
      v3 = [NSString stringWithFormat:@"SB Wallpaper poll"];
      v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      id v6 = [v5 lastPathComponent];
      uint64_t v7 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent init]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:356];

      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SBWallpaper"];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
  v11 = [*(id *)(a1 + 32) fetchSBWallpaperForType:0];
  [v10 setObject:v11 forKeyedSubscript:@"HomeScreen"];

  id v12 = [*(id *)(a1 + 32) fetchSBWallpaperForType:1];
  [v10 setObject:v12 forKeyedSubscript:@"LockScreen"];

  [*(id *)(a1 + 32) logEntry:v10];
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2_179(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_3_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_185(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"com.apple.springboard.lockstate"];
  v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SBLock"];
  if (v3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
    if ([v3 longLongValue]) {
      uint64_t v6 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    [v5 setObject:v6 forKeyedSubscript:@"Locked"];
    [*(id *)(a1 + 32) logEntry:v5];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_2_186;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_4_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_4_defaultOnce, block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_4_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"WARNING: lockState is null; this implies the notification payload was not or could not be populated by the CFNotificationOperatorComposition"];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent init]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:382];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_2_186(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_4_classDebugEnabled = result;
  return result;
}

void __26__PLSpringBoardAgent_init__block_invoke_190(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:@"com.apple.springboard.hasBlankedScreen"];
  v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SBBlank"];
  if (v3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
    if ([v3 longLongValue])
    {
      [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Blanked"];
      dispatch_time_t v6 = dispatch_time(0, 1000000000);
      uint64_t v7 = [*(id *)(a1 + 32) workQueue];
      dispatch_after(v6, v7, &__block_literal_global_12);
    }
    else
    {
      [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Blanked"];
    }
    [*(id *)(a1 + 32) logEntry:v5];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PLSpringBoardAgent_init__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (kPLAutoLockAccountingEvent_block_invoke_5_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_5_defaultOnce, block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_5_classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"WARNING: blankState is null; this implies the notification payload was not or could not be populated by the CFNotificationOperatorComposition"];
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      id v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent init]_block_invoke"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:420];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void __26__PLSpringBoardAgent_init__block_invoke_2_191()
{
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  if (!_os_feature_enabled_impl() || ([MEMORY[0x1E4F92A38] hasAOD] & 1) == 0)
  {
    v0 = [MEMORY[0x1E4F92900] sharedInstance];
    [v0 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v2];

    v1 = [MEMORY[0x1E4F92900] sharedInstance];
    [v1 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v2];
  }
}

uint64_t __26__PLSpringBoardAgent_init__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_5_classDebugEnabled = result;
  return result;
}

- (void)initOperatorDependancies
{
  v59[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PLOperator *)self storage];
  v4 = [v3 lastEntryForKey:@"PLBatteryAgent_EventBackward_Battery"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (initOperatorDependancies_defaultOnce != -1) {
      dispatch_once(&initOperatorDependancies_defaultOnce, block);
    }
    if (initOperatorDependancies_classDebugEnabled)
    {
      dispatch_time_t v6 = [NSString stringWithFormat:@"The last entry from BatteryU table: %@", v4];
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent initOperatorDependancies]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:433];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if (v4) {
    [(PLSpringBoardAgent *)self handleChargingStateChange:v4];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_206;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v12;
    if (initOperatorDependancies_defaultOnce_204 != -1) {
      dispatch_once(&initOperatorDependancies_defaultOnce_204, v54);
    }
    if (initOperatorDependancies_classDebugEnabled_205)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Initial device Charging State: %d", -[PLSpringBoardAgent deviceIsCharging](self, "deviceIsCharging"));
      v14 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v16 = [v15 lastPathComponent];
      uint64_t v17 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent initOperatorDependancies]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:438];

      v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  id v19 = objc_alloc(MEMORY[0x1E4F929E8]);
  v58 = @"ExternalConnected";
  v56 = &unk_1F400C718;
  v20 = [MEMORY[0x1E4F1CA98] null];
  v57 = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v59[0] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_216;
  v53[3] = &unk_1E6E47908;
  v53[4] = self;
  v23 = (void *)[v19 initWithOperator:self forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v22 withBlock:v53];
  [(PLSpringBoardAgent *)self setDeviceChargingStateNotification:v23];

  id v24 = [(PLOperator *)self storage];
  v25 = [v24 lastEntryForKey:@"PLDisplayAgent_EventPoint_Display"];

  if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD])
  {
    if (v25)
    {
      v26 = [v25 objectForKeyedSubscript:@"Block"];
      if ([v26 isEqualToString:@"Backlight"])
      {
        v27 = [v25 objectForKeyedSubscript:@"Active"];
        int v28 = [v27 intValue];

        if (v28 != 1) {
          goto LABEL_28;
        }
        goto LABEL_26;
      }
LABEL_27:
    }
  }
  else if (v25)
  {
    v26 = [v25 objectForKeyedSubscript:@"Block"];
    if (([v26 isEqualToString:@"Backlight"] & 1) == 0) {
      goto LABEL_27;
    }
    id v29 = [v25 objectForKeyedSubscript:@"Active"];
    int v30 = [v29 BOOLValue];

    if (v30) {
LABEL_26:
    }
      [(PLSpringBoardAgent *)self startAutolockEnergyPeriodicTimer];
  }
LABEL_28:
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2;
  v52[3] = &unk_1E6E47908;
  v52[4] = self;
  uint64_t v31 = [MEMORY[0x1E4F929E8] displayOnNotificationWithOperator:self withBlock:v52];
  [(PLSpringBoardAgent *)self setDisplayOnNotification:v31];

  if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD])
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_3;
    v51[3] = &unk_1E6E47908;
    v51[4] = self;
    uint64_t v32 = [MEMORY[0x1E4F929E8] displayOffOrAODNotificationWithOperator:self withBlock:v51];
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_4;
    v50[3] = &unk_1E6E47908;
    v50[4] = self;
    uint64_t v32 = [MEMORY[0x1E4F929E8] displayOffNotificationWithOperator:self withBlock:v50];
  }
  id v33 = (void *)v32;
  [(PLSpringBoardAgent *)self setDisplayOffNotification:v32];

  v34 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ReceivedPush"];
  id v35 = objc_alloc(MEMORY[0x1E4F929E8]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_5;
  v49[3] = &unk_1E6E47908;
  v49[4] = self;
  v36 = (void *)[v35 initWithOperator:self forEntryKey:v34 withBlock:v49];
  [(PLSpringBoardAgent *)self setReceivedPushNotification:v36];

  id v37 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_250;
  v48[3] = &unk_1E6E47740;
  v48[4] = self;
  v38 = (PLXPCListenerOperatorComposition *)[v37 initWithOperator:self withRegistration:&unk_1F400F010 withBlock:v48];
  userNotificationRequestEvent = self->_userNotificationRequestEvent;
  self->_userNotificationRequestEvent = v38;

  id v40 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_259;
  v47[3] = &unk_1E6E47740;
  void v47[4] = self;
  v41 = (PLXPCListenerOperatorComposition *)[v40 initWithOperator:self withRegistration:&unk_1F400F038 withBlock:v47];
  userNotificationTriggerEvent = self->_userNotificationTriggerEvent;
  self->_userNotificationTriggerEvent = v41;

  id v43 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  void v46[2] = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_273;
  v46[3] = &unk_1E6E47740;
  v46[4] = self;
  v44 = (PLXPCListenerOperatorComposition *)[v43 initWithOperator:self withRegistration:&unk_1F400F060 withBlock:v46];
  bulletinBoardNotificationPublishEvent = self->_bulletinBoardNotificationPublishEvent;
  self->_bulletinBoardNotificationPublishEvent = v44;
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled = result;
  return result;
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_206(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_205 = result;
  return result;
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_216(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 objectForKey:@"entry"];
  [v2 handleChargingStateChange:v3];
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAutolockEnergyPeriodicTimer];
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAutolockEnergyPeriodicTimer];
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAutolockEnergyPeriodicTimer];
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"entry"];
  [*(id *)(a1 + 32) setLastReceivedPushEntry:v3];
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_250_cold_1();
  }

  if (([MEMORY[0x1E4F929C0] fullMode] & 1) != 0
    || [MEMORY[0x1E4F92A38] internalBuild])
  {
    [*(id *)(a1 + 32) logBulletinPerEvent:v6];
  }
  if (([MEMORY[0x1E4F929C0] liteMode] & 1) != 0
    || [MEMORY[0x1E4F929C0] taskMode])
  {
    [*(id *)(a1 + 32) logBulletinAggregate:v6];
  }
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_259(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_260;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_6_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_6_defaultOnce, &block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_6_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"payload=%@", v6, block, v15, v16, v17, v18];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:508];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logNotification:v6];
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_260(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_273(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_274;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (kPLAutoLockAccountingEvent_block_invoke_7_defaultOnce != -1) {
      dispatch_once(&kPLAutoLockAccountingEvent_block_invoke_7_defaultOnce, &block);
    }
    if (kPLAutoLockAccountingEvent_block_invoke_7_classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Received BulletinBoard payload: %@", v6, block, v15, v16, v17, v18];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:516];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logMailNotification:v6];
}

uint64_t __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_2_274(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLAutoLockAccountingEvent_block_invoke_7_classDebugEnabled = result;
  return result;
}

- (void)handleChargingStateChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:@"ExternalConnected"];
    -[PLSpringBoardAgent setDeviceIsCharging:](self, "setDeviceIsCharging:", [v6 BOOLValue]);
  }
  else
  {
    [(PLSpringBoardAgent *)self setDeviceIsCharging:0];
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PLSpringBoardAgent_handleChargingStateChange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (handleChargingStateChange__defaultOnce != -1) {
      dispatch_once(&handleChargingStateChange__defaultOnce, block);
    }
    if (handleChargingStateChange__classDebugEnabled)
    {
      uint64_t v8 = [NSString stringWithFormat:@"ChargingState: %d for the entry: %@", -[PLSpringBoardAgent deviceIsCharging](self, "deviceIsCharging"), v5];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent handleChargingStateChange:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:529];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __48__PLSpringBoardAgent_handleChargingStateChange___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleChargingStateChange__classDebugEnabled = result;
  return result;
}

- (void)startAutolockEnergyPeriodicTimer
{
  if ([(PLSpringBoardAgent *)self autoLockIsNil])
  {
    id v3 = [(PLSpringBoardAgent *)self autolockEnergyPeriodicTimer];

    if (!v3)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v4 = objc_opt_class();
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke;
        v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v28[4] = v4;
        if (startAutolockEnergyPeriodicTimer_defaultOnce != -1) {
          dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce, v28);
        }
        if (startAutolockEnergyPeriodicTimer_classDebugEnabled)
        {
          uint64_t v5 = [NSString stringWithFormat:@"begin"];
          id v6 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
          uint64_t v8 = [v7 lastPathComponent];
          v9 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent startAutolockEnergyPeriodicTimer]"];
          [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:534];

          uint64_t v10 = PLLogCommon();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [(PLSpringBoardAgent *)self setLastEligibleAutolockEnergyComputationDate:v11];
      uint64_t v12 = (void *)MEMORY[0x1E4F92A18];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_286;
      block[3] = &unk_1E6E47848;
      block[4] = self;
      if (startAutolockEnergyPeriodicTimer_defaultOnce_285 != -1) {
        dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce_285, block);
      }
      uint64_t v13 = [v11 dateByAddingTimeInterval:*(double *)&startAutolockEnergyPeriodicTimer_objectForKey];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_2;
      v26[3] = &unk_1E6E47848;
      v26[4] = self;
      if (startAutolockEnergyPeriodicTimer_defaultOnce_287 != -1) {
        dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce_287, v26);
      }
      double v14 = *(double *)&startAutolockEnergyPeriodicTimer_objectForKey_288;
      uint64_t v15 = [(PLOperator *)self workQueue];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_3;
      v25[3] = &unk_1E6E48B20;
      v25[4] = self;
      v16 = [v12 scheduledTimerWithMonotonicFireDate:v13 withInterval:v15 withQueue:v25 withBlock:v14];
      [(PLSpringBoardAgent *)self setAutolockEnergyPeriodicTimer:v16];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v17 = objc_opt_class();
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_4;
        v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void v24[4] = v17;
        if (startAutolockEnergyPeriodicTimer_defaultOnce_290 != -1) {
          dispatch_once(&startAutolockEnergyPeriodicTimer_defaultOnce_290, v24);
        }
        if (startAutolockEnergyPeriodicTimer_classDebugEnabled_291)
        {
          uint64_t v18 = [NSString stringWithFormat:@"end"];
          id v19 = (void *)MEMORY[0x1E4F929B8];
          v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
          v21 = [v20 lastPathComponent];
          v22 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent startAutolockEnergyPeriodicTimer]"];
          [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:545];

          v23 = PLLogCommon();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
    }
  }
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  startAutolockEnergyPeriodicTimer_classDebugEnabled = result;
  return result;
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_286(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"AutolockEnergyPeriodicTimerInterval"];
  startAutolockEnergyPeriodicTimer_objectForKey = v2;
  return result;
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) defaultDoubleForKey:@"AutolockEnergyPeriodicTimerInterval"];
  startAutolockEnergyPeriodicTimer_objectForKey_288 = v2;
  return result;
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) computeAutolockEnergyWithNow:a2];
}

uint64_t __54__PLSpringBoardAgent_startAutolockEnergyPeriodicTimer__block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  startAutolockEnergyPeriodicTimer_classDebugEnabled_291 = result;
  return result;
}

- (void)stopAutolockEnergyPeriodicTimer
{
  id v3 = [(PLSpringBoardAgent *)self autolockEnergyPeriodicTimer];

  if (v3)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (stopAutolockEnergyPeriodicTimer_defaultOnce != -1) {
        dispatch_once(&stopAutolockEnergyPeriodicTimer_defaultOnce, block);
      }
      if (stopAutolockEnergyPeriodicTimer_classDebugEnabled)
      {
        uint64_t v5 = [NSString stringWithFormat:@"begin"];
        id v6 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        uint64_t v8 = [v7 lastPathComponent];
        v9 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent stopAutolockEnergyPeriodicTimer]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:550];

        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    [(PLSpringBoardAgent *)self setLastEligibleAutolockEnergyComputationDate:0];
    [(PLSpringBoardAgent *)self setAutolockEnergyPeriodicTimer:0];
    v11 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v11 createQualificationEventForwardWithQualificationID:9 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v12];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke_297;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v24 = v13;
      if (stopAutolockEnergyPeriodicTimer_defaultOnce_295 != -1) {
        dispatch_once(&stopAutolockEnergyPeriodicTimer_defaultOnce_295, &v20);
      }
      if (stopAutolockEnergyPeriodicTimer_classDebugEnabled_296)
      {
        double v14 = objc_msgSend(NSString, "stringWithFormat:", @"end", v20, v21, v22, v23, v24);
        uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        uint64_t v17 = [v16 lastPathComponent];
        uint64_t v18 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent stopAutolockEnergyPeriodicTimer]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:557];

        id v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopAutolockEnergyPeriodicTimer_classDebugEnabled = result;
  return result;
}

uint64_t __53__PLSpringBoardAgent_stopAutolockEnergyPeriodicTimer__block_invoke_297(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  stopAutolockEnergyPeriodicTimer_classDebugEnabled_296 = result;
  return result;
}

- (double)currentMediaTime
{
  kern_return_t v2;
  unint64_t v3;
  double result;
  mach_timebase_info info;

  info = 0;
  uint64_t v2 = mach_timebase_info(&info);
  uint64_t result = -1.0;
  if (!v2)
  {
    LODWORD(result) = info.numer;
    LODWORD(v3) = info.denom;
    return (double)*(unint64_t *)&result / (double)v3 * 0.000000001 * (double)mach_absolute_time();
  }
  return result;
}

- (void)computeAutolockEnergyWithNow:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (computeAutolockEnergyWithNow__defaultOnce != -1) {
      dispatch_once(&computeAutolockEnergyWithNow__defaultOnce, block);
    }
    if (computeAutolockEnergyWithNow__classDebugEnabled)
    {
      id v6 = NSString;
      uint64_t v7 = [(PLSpringBoardAgent *)self lastEligibleAutolockEnergyComputationDate];
      uint64_t v8 = [v6 stringWithFormat:@"now=%@, self.lastEligibleAutolockEnergyComputationDate=%@", v4, v7];

      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent computeAutolockEnergyWithNow:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:576];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [(PLSpringBoardAgent *)self currentMediaTime];
  double v15 = v14;
  if (v14 != -1.0)
  {
    BKSHIDServicesLastUserEventTime();
    uint64_t v17 = [v4 dateByAddingTimeInterval:v16 - v15];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v18 = objc_opt_class();
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      void v45[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_303;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void v45[4] = v18;
      if (computeAutolockEnergyWithNow__defaultOnce_301 != -1) {
        dispatch_once(&computeAutolockEnergyWithNow__defaultOnce_301, v45);
      }
      if (computeAutolockEnergyWithNow__classDebugEnabled_302)
      {
        id v19 = [NSString stringWithFormat:@"lastUserEventDate=%@", v17];
        uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        v22 = [v21 lastPathComponent];
        v23 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent computeAutolockEnergyWithNow:]"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:582];

        uint64_t v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v25 = [(PLSpringBoardAgent *)self lastEligibleAutolockEnergyComputationDate];
    v26 = [v17 laterDate:v25];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v27 = objc_opt_class();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_309;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v27;
      if (computeAutolockEnergyWithNow__defaultOnce_307 != -1) {
        dispatch_once(&computeAutolockEnergyWithNow__defaultOnce_307, v44);
      }
      if (computeAutolockEnergyWithNow__classDebugEnabled_308)
      {
        int v28 = [NSString stringWithFormat:@"eligibleAutolockEnergyComputationDate=%@", v26];
        id v29 = (void *)MEMORY[0x1E4F929B8];
        int v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        uint64_t v31 = [v30 lastPathComponent];
        uint64_t v32 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent computeAutolockEnergyWithNow:]"];
        [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:586];

        id v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    [v4 timeIntervalSinceDate:v26];
    if (v34 > 60.0)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v35 = objc_opt_class();
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_315;
        v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v43[4] = v35;
        if (computeAutolockEnergyWithNow__defaultOnce_313 != -1) {
          dispatch_once(&computeAutolockEnergyWithNow__defaultOnce_313, v43);
        }
        if (computeAutolockEnergyWithNow__classDebugEnabled_314)
        {
          v36 = [NSString stringWithFormat:@"computing autolock energy"];
          id v37 = (void *)MEMORY[0x1E4F929B8];
          v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
          uint64_t v39 = [v38 lastPathComponent];
          id v40 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent computeAutolockEnergyWithNow:]"];
          [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:590];

          v41 = PLLogCommon();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v42 = [MEMORY[0x1E4F92900] sharedInstance];
      [v42 createQualificationEventForwardWithQualificationID:9 withChildNodeNames:&unk_1F40132A0 withStartDate:v26];
    }
    [(PLSpringBoardAgent *)self setLastEligibleAutolockEnergyComputationDate:v4];
  }
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  computeAutolockEnergyWithNow__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_303(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  computeAutolockEnergyWithNow__classDebugEnabled_302 = result;
  return result;
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_309(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  computeAutolockEnergyWithNow__classDebugEnabled_308 = result;
  return result;
}

uint64_t __51__PLSpringBoardAgent_computeAutolockEnergyWithNow___block_invoke_315(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  computeAutolockEnergyWithNow__classDebugEnabled_314 = result;
  return result;
}

- (void)setLastReceivedPushEntry:(id)a3
{
  id v5 = a3;
  p_lastReceivedPushEntry = (id *)&self->_lastReceivedPushEntry;
  id v11 = v5;
  if (!v5) {
    goto LABEL_11;
  }
  if (!*p_lastReceivedPushEntry) {
    goto LABEL_11;
  }
  uint64_t v7 = [v5 entryDate];
  uint64_t v8 = [*p_lastReceivedPushEntry entryDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 > 0.0)
  {
LABEL_11:
    if (+[PLPushAgent isHighPriorityPushEntry:v11]) {
      objc_storeStrong(p_lastReceivedPushEntry, a3);
    }
  }
  MEMORY[0x1F41817F8]();
}

- (id)screenLock:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F74230], "sharedConnection", a3);
  id v4 = [v3 effectiveValueForSetting:*MEMORY[0x1E4F73F60]];

  if ([v4 intValue] == 0x7FFFFFFF)
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithInt:0xFFFFFFFFLL];
  }
  else
  {
    id v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (void)resetAutoLockIsNil
{
  id v3 = [(PLSpringBoardAgent *)self screenLock:0];
  BOOL v4 = [v3 intValue] == -1;

  [(PLSpringBoardAgent *)self setAutoLockIsNil:v4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __40__PLSpringBoardAgent_resetAutoLockIsNil__block_invoke;
    uint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v5;
    if (resetAutoLockIsNil_defaultOnce != -1) {
      dispatch_once(&resetAutoLockIsNil_defaultOnce, &block);
    }
    if (resetAutoLockIsNil_classDebugEnabled)
    {
      id v6 = NSString;
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PLSpringBoardAgent autoLockIsNil](self, "autoLockIsNil"));
      uint64_t v8 = [v6 stringWithFormat:@"Value of autolock %@", v7, block, v15, v16, v17, v18];

      double v9 = (void *)MEMORY[0x1E4F929B8];
      double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent resetAutoLockIsNil]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:617];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __40__PLSpringBoardAgent_resetAutoLockIsNil__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  resetAutoLockIsNil_classDebugEnabled = result;
  return result;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F73EC0] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PLSpringBoardAgent;
  [(PLAgent *)&v4 dealloc];
}

- (id)fetchSBWallpaperForType:(int)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      uint64_t v8 = @"unknown";
      goto LABEL_16;
    }
    objc_super v4 = @"kSBProceduralWallpaperLockDefaultKey";
    uint64_t v5 = @"SBWallpaperParallaxFactorLockScreen";
  }
  else
  {
    objc_super v4 = @"kSBProceduralWallpaperHomeDefaultKey";
    uint64_t v5 = @"SBWallpaperParallaxFactorHomeScreen";
  }
  [MEMORY[0x1E4F929C0] resetUserDefaultCacheForKey:v4 forApplicationID:@"com.apple.springboard"];
  [MEMORY[0x1E4F929C0] resetUserDefaultCacheForKey:v5 forApplicationID:@"com.apple.springboard"];
  id v6 = [MEMORY[0x1E4F929C0] objectForKey:v4 forApplicationID:@"com.apple.springboard" synchronize:1];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = v6;
  }
  else if (a3 == 1 {
         && ([MEMORY[0x1E4F929C0] resetUserDefaultCacheForKey:@"SBWallpaperHasVideoKey" forApplicationID:@"com.apple.springboard"], objc_msgSend(MEMORY[0x1E4F929C0], "objectForKey:forApplicationID:synchronize:", @"SBWallpaperHasVideoKey", @"com.apple.springboard", 1), v9 = objc_claimAutoreleasedReturnValue(), char v10 = objc_msgSend(v9, "BOOLValue"), v9, (v10 & 1) != 0))
  }
  {
    uint64_t v8 = @"motion";
  }
  else
  {
    id v11 = [MEMORY[0x1E4F929C0] objectForKey:v5 forApplicationID:@"com.apple.springboard" synchronize:1];
    [v11 doubleValue];
    if (v12 <= 0.0) {
      uint64_t v8 = @"still";
    }
    else {
      uint64_t v8 = @"perspective";
    }
  }
LABEL_16:
  return v8;
}

- (id)addCountsAndDurationsFor:(id)a3 toEntry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"NSEStartTime"];
  double v9 = [v7 objectForKeyedSubscript:@"NSEEndTime"];
  char v10 = [v7 objectForKeyedSubscript:@"Waking"];
  int v11 = [v10 BOOLValue];

  double v12 = [v7 objectForKeyedSubscript:@"UIShown"];

  int v13 = [v12 BOOLValue];
  double v14 = 0.0;
  if (v8 && v9)
  {
    [v9 doubleValue];
    double v16 = v15;
    [v8 doubleValue];
    double v18 = v16 - v17;
    if (v18 >= 0.0) {
      double v14 = v18;
    }
    else {
      double v14 = 0.0;
    }
  }
  BOOL v19 = [(PLSpringBoardAgent *)self deviceIsCharging];
  if (v11)
  {
    if (v13)
    {
      if (v19)
      {
        [v6 setObject:&unk_1F400C760 forKeyedSubscript:@"FgWakingPluggedInCount"];
        uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
        [v6 setObject:v20 forKeyedSubscript:@"FgWakingPluggedInNSEDuration"];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v21 = objc_opt_class();
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v21;
          if (addCountsAndDurationsFor_toEntry__defaultOnce != -1) {
            dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce, v86);
          }
          if (addCountsAndDurationsFor_toEntry__classDebugEnabled)
          {
            v22 = NSString;
            v23 = [v6 objectForKeyedSubscript:@"FgWakingPluggedInCount"];
            uint64_t v24 = [v6 objectForKeyedSubscript:@"FgWakingPluggedInNSEDuration"];
            v25 = [v22 stringWithFormat:@"Waking Fg plugged in count: %@, Waking Fg NSE duration: %@", v23, v24];

            v26 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
            int v28 = [v27 lastPathComponent];
            id v29 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]"];
            [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:724];

            int v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
LABEL_47:
          }
        }
      }
      else
      {
        [v6 setObject:&unk_1F400C760 forKeyedSubscript:@"FgWakingCount"];
        v58 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
        [v6 setObject:v58 forKeyedSubscript:@"FgWakingNSEDuration"];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v59 = objc_opt_class();
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_370;
          v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v85[4] = v59;
          if (addCountsAndDurationsFor_toEntry__defaultOnce_368 != -1) {
            dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_368, v85);
          }
          if (addCountsAndDurationsFor_toEntry__classDebugEnabled_369)
          {
            v60 = NSString;
            v61 = [v6 objectForKeyedSubscript:@"FgWakingCount"];
            v62 = [v6 objectForKeyedSubscript:@"FgWakingNSEDuration"];
            v25 = [v60 stringWithFormat:@"Waking Fg un-plugged count: %@, Waking Fg NSE duration: %@", v61, v62];

            v63 = (void *)MEMORY[0x1E4F929B8];
            v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
            v65 = [v64 lastPathComponent];
            v66 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]"];
            [v63 logMessage:v25 fromFile:v65 fromFunction:v66 fromLineNumber:728];

            int v30 = PLLogCommon();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
            goto LABEL_47;
          }
        }
      }
    }
    else if (v19)
    {
      [v6 setObject:&unk_1F400C760 forKeyedSubscript:@"BgWakingPluggedInCount"];
      id v40 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
      [v6 setObject:v40 forKeyedSubscript:@"BgWakingPluggedInNSEDuration"];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v41 = objc_opt_class();
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_376;
        v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v84[4] = v41;
        if (addCountsAndDurationsFor_toEntry__defaultOnce_374 != -1) {
          dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_374, v84);
        }
        if (addCountsAndDurationsFor_toEntry__classDebugEnabled_375)
        {
          v42 = NSString;
          id v43 = [v6 objectForKeyedSubscript:@"BgWakingPluggedInCount"];
          v44 = [v6 objectForKeyedSubscript:@"BgWakingPluggedInNSEDuration"];
          v25 = [v42 stringWithFormat:@"Waking Bg plugged in count: %@, Waking Bg NSE duration: %@", v43, v44];

          v45 = (void *)MEMORY[0x1E4F929B8];
          v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
          v47 = [v46 lastPathComponent];
          v48 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]"];
          [v45 logMessage:v25 fromFile:v47 fromFunction:v48 fromLineNumber:734];

          int v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
          goto LABEL_47;
        }
      }
    }
    else
    {
      [v6 setObject:&unk_1F400C760 forKeyedSubscript:@"BgWakingCount"];
      v67 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
      [v6 setObject:v67 forKeyedSubscript:@"BgWakingNSEDuration"];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v68 = objc_opt_class();
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_382;
        v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v83[4] = v68;
        if (addCountsAndDurationsFor_toEntry__defaultOnce_380 != -1) {
          dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_380, v83);
        }
        if (addCountsAndDurationsFor_toEntry__classDebugEnabled_381)
        {
          v69 = NSString;
          v70 = [v6 objectForKeyedSubscript:@"BgWakingCount"];
          v71 = [v6 objectForKeyedSubscript:@"BgWakingNSEDuration"];
          v25 = [v69 stringWithFormat:@"Waking Bg count: %@, Waking Bg NSE duration: %@", v70, v71];

          v72 = (void *)MEMORY[0x1E4F929B8];
          v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
          v74 = [v73 lastPathComponent];
          v75 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]"];
          [v72 logMessage:v25 fromFile:v74 fromFunction:v75 fromLineNumber:738];

          int v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
          goto LABEL_47;
        }
      }
    }
  }
  else if (v19)
  {
    [v6 setObject:&unk_1F400C760 forKeyedSubscript:@"NonWakingPluggedInCount"];
    uint64_t v31 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
    [v6 setObject:v31 forKeyedSubscript:@"NonWakingPluggedInNSEDuration"];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v32 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_388;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v32;
      if (addCountsAndDurationsFor_toEntry__defaultOnce_386 != -1) {
        dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_386, block);
      }
      if (addCountsAndDurationsFor_toEntry__classDebugEnabled_387)
      {
        id v33 = NSString;
        double v34 = [v6 objectForKeyedSubscript:@"NonWakingPluggedInCount"];
        uint64_t v35 = [v6 objectForKeyedSubscript:@"NonWakingNSEDuration"];
        v25 = [v33 stringWithFormat:@"Non-Waking plugged in count: %@, Non Waking NSE duration: %@", v34, v35];

        v36 = (void *)MEMORY[0x1E4F929B8];
        id v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        v38 = [v37 lastPathComponent];
        uint64_t v39 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]"];
        [v36 logMessage:v25 fromFile:v38 fromFunction:v39 fromLineNumber:746];

        int v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_47;
      }
    }
  }
  else
  {
    [v6 setObject:&unk_1F400C760 forKeyedSubscript:@"NonWakingCount"];
    objc_super v49 = [MEMORY[0x1E4F28ED0] numberWithDouble:v14];
    [v6 setObject:v49 forKeyedSubscript:@"NonWakingNSEDuration"];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v50 = objc_opt_class();
      uint64_t v77 = MEMORY[0x1E4F143A8];
      uint64_t v78 = 3221225472;
      v79 = __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_394;
      v80 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v81 = v50;
      if (addCountsAndDurationsFor_toEntry__defaultOnce_392 != -1) {
        dispatch_once(&addCountsAndDurationsFor_toEntry__defaultOnce_392, &v77);
      }
      if (addCountsAndDurationsFor_toEntry__classDebugEnabled_393)
      {
        v51 = NSString;
        v52 = [v6 objectForKeyedSubscript:@"NonWakingCount"];
        v53 = [v6 objectForKeyedSubscript:@"NonWakingNSEDuration"];
        v25 = [v51 stringWithFormat:@"Non-Waking count: %@, Non Waking NSE duration: %@", v52, v53, v77, v78, v79, v80, v81];

        v54 = (void *)MEMORY[0x1E4F929B8];
        v55 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        v56 = [v55 lastPathComponent];
        v57 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addCountsAndDurationsFor:toEntry:]"];
        [v54 logMessage:v25 fromFile:v56 fromFunction:v57 fromLineNumber:751];

        int v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
        goto LABEL_47;
      }
    }
  }

  return v6;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addCountsAndDurationsFor_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_370(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addCountsAndDurationsFor_toEntry__classDebugEnabled_369 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_376(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addCountsAndDurationsFor_toEntry__classDebugEnabled_375 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_382(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addCountsAndDurationsFor_toEntry__classDebugEnabled_381 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_388(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addCountsAndDurationsFor_toEntry__classDebugEnabled_387 = result;
  return result;
}

uint64_t __55__PLSpringBoardAgent_addCountsAndDurationsFor_toEntry___block_invoke_394(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addCountsAndDurationsFor_toEntry__classDebugEnabled_393 = result;
  return result;
}

- (void)logNotification:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLSpringBoardAgent_logNotification___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (logNotification__defaultOnce != -1) {
      dispatch_once(&logNotification__defaultOnce, block);
    }
    if (logNotification__classDebugEnabled)
    {
      id v6 = [NSString stringWithFormat:@"Notification: %@", v4];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      double v9 = [v8 lastPathComponent];
      char v10 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent logNotification:]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:759];

      int v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    double v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SBNotifications"];
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
    double v14 = [v4 objectForKeyedSubscript:@"TriggerType"];
    [v13 setObject:v14 forKeyedSubscript:@"NotificationType"];

    double v15 = [v4 objectForKeyedSubscript:@"BundleIdentifier"];
    [v13 setObject:v15 forKeyedSubscript:@"NotificationBundleID"];

    double v16 = [v4 objectForKeyedSubscript:@"Waking"];
    [v13 setObject:v16 forKeyedSubscript:@"Waking"];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"NSEStartTime"];
    if (v17)
    {
      double v18 = (void *)v17;
      BOOL v19 = [v4 objectForKeyedSubscript:@"NSEEndTime"];

      if (v19)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t v21 = [v4 objectForKeyedSubscript:@"NSEStartTime"];
        [v21 doubleValue];
        v22 = objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
        v23 = [v22 convertFromSystemToMonotonic];
        [v13 setObject:v23 forKeyedSubscript:@"NSEStartTime"];

        uint64_t v24 = (void *)MEMORY[0x1E4F1C9C8];
        v25 = [v4 objectForKeyedSubscript:@"NSEEndTime"];
        [v25 doubleValue];
        v26 = objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
        uint64_t v27 = [v26 convertFromSystemToMonotonic];
        [v13 setObject:v27 forKeyedSubscript:@"NSEEndTime"];
      }
    }
    int v28 = [v4 objectForKeyedSubscript:@"UIShown"];
    [v13 setObject:v28 forKeyedSubscript:@"UIShown"];

    [(PLOperator *)self logEntry:v13];
  }
  id v29 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"SBNotifications_Aggregate"];
  int v30 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v29];
  uint64_t v31 = [v4 objectForKeyedSubscript:@"TriggerType"];
  [v30 setObject:v31 forKeyedSubscript:@"NotificationType"];
  uint64_t v32 = [v4 objectForKeyedSubscript:@"BundleIdentifier"];
  [v30 setObject:v32 forKeyedSubscript:@"NotificationBundleID"];

  [v30 setObject:&unk_1F400C760 forKeyedSubscript:@"Count"];
  if ([v31 intValue] == 3 || !objc_msgSend(v31, "intValue"))
  {
    id v33 = [(PLSpringBoardAgent *)self addCountsAndDurationsFor:v4 toEntry:v30];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v34 = objc_opt_class();
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __38__PLSpringBoardAgent_logNotification___block_invoke_409;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v34;
      if (logNotification__defaultOnce_407 != -1) {
        dispatch_once(&logNotification__defaultOnce_407, v41);
      }
      if (logNotification__classDebugEnabled_408)
      {
        uint64_t v35 = [NSString stringWithFormat:@"Notification Entry: %@", v33];
        v36 = (void *)MEMORY[0x1E4F929B8];
        id v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        v38 = [v37 lastPathComponent];
        uint64_t v39 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent logNotification:]"];
        [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:791];

        id v40 = PLLogCommon();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
    id v33 = v30;
  }
  [(PLOperator *)self logEntry:v33];
}

uint64_t __38__PLSpringBoardAgent_logNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logNotification__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLSpringBoardAgent_logNotification___block_invoke_409(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logNotification__classDebugEnabled_408 = result;
  return result;
}

- (void)logMailNotification:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"SectionIdentifier"];
  int v5 = [v4 isEqualToString:@"com.apple.mobilemail"];

  if (v5)
  {
    id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"SBNotifications_Aggregate"];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
    [v7 setObject:&unk_1F400C778 forKeyedSubscript:@"NotificationType"];
    [v7 setObject:@"com.apple.mobilemail" forKeyedSubscript:@"NotificationBundleID"];
    [v7 setObject:&unk_1F400C760 forKeyedSubscript:@"Count"];
    if ([(PLSpringBoardAgent *)self deviceIsCharging])
    {
      [v7 setObject:&unk_1F400C760 forKeyedSubscript:@"NonWakingPluggedInCount"];
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_16;
      }
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLSpringBoardAgent_logMailNotification___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (logMailNotification__defaultOnce != -1) {
        dispatch_once(&logMailNotification__defaultOnce, block);
      }
      if (!logMailNotification__classDebugEnabled) {
        goto LABEL_16;
      }
      double v9 = NSString;
      char v10 = [v7 objectForKeyedSubscript:@"NonWakingPluggedInCount"];
      int v11 = [v9 stringWithFormat:@"Non-Waking plugged in count: %@", v10];

      double v12 = (void *)MEMORY[0x1E4F929B8];
      int v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      double v14 = [v13 lastPathComponent];
      double v15 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent logMailNotification:]"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:813];

      double v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
    else
    {
      [v7 setObject:&unk_1F400C760 forKeyedSubscript:@"NonWakingCount"];
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_16;
      }
      uint64_t v17 = objc_opt_class();
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __42__PLSpringBoardAgent_logMailNotification___block_invoke_426;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void v24[4] = v17;
      if (logMailNotification__defaultOnce_424 != -1) {
        dispatch_once(&logMailNotification__defaultOnce_424, v24);
      }
      if (!logMailNotification__classDebugEnabled_425) {
        goto LABEL_16;
      }
      double v18 = NSString;
      BOOL v19 = [v7 objectForKeyedSubscript:@"NonWakingCount"];
      int v11 = [v18 stringWithFormat:@"Non-Waking count: %@", v19];

      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
      v22 = [v21 lastPathComponent];
      v23 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent logMailNotification:]"];
      [v20 logMessage:v11 fromFile:v22 fromFunction:v23 fromLineNumber:816];

      double v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }

LABEL_16:
    [(PLOperator *)self logEntry:v7];
  }
}

uint64_t __42__PLSpringBoardAgent_logMailNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logMailNotification__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLSpringBoardAgent_logMailNotification___block_invoke_426(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logMailNotification__classDebugEnabled_425 = result;
  return result;
}

- (void)logBulletinPerEvent:(id)a3
{
  id v4 = a3;
  int v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLSpringBoardAgent logBulletinPerEvent:](v5);
  }

  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SBBulletins"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"PostType"];
  [v7 setObject:v8 forKeyedSubscript:@"PostType"];

  double v9 = [v4 objectForKeyedSubscript:@"BundleIdentifier"];

  [v7 setObject:v9 forKeyedSubscript:@"BulletinBundleID"];
  [(PLOperator *)self logEntry:v7];
}

- (void)logBulletinAggregate:(id)a3
{
  id v4 = a3;
  int v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLSpringBoardAgent logBulletinAggregate:](v5);
  }

  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"SBBulletins_Aggregate"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"PostType"];
  [v7 setObject:v8 forKeyedSubscript:@"PostType"];

  double v9 = [v4 objectForKeyedSubscript:@"BundleIdentifier"];

  [v7 setObject:v9 forKeyedSubscript:@"BulletinBundleID"];
  [v7 setObject:&unk_1F400C760 forKeyedSubscript:@"Count"];
  [(PLOperator *)self logEntry:v7];
}

- (void)setUpScreenNumberDictionary
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = &unk_1F400C790;
  v5[0] = @"com.apple.Maps";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [(PLSpringBoardAgent *)self setScreenNumberToName:v3];
}

- (void)addAccountingEvent:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"Screen"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [(PLSpringBoardAgent *)self lastSBEntry];
  if (v8)
  {
    double v9 = [(PLSpringBoardAgent *)self lastSBEntry];
    char v10 = [v9 objectForKeyedSubscript:@"Screen"];
    [v10 doubleValue];
    unsigned int v12 = v11;
  }
  else
  {
    unsigned int v12 = 0;
  }
  unsigned int v13 = v7;

  double v14 = [(PLSpringBoardAgent *)self lastSBEntry];

  if (!v14 || v12 != v13)
  {
    double v15 = [v4 entryDate];
    [(PLSpringBoardAgent *)self closeLastOpenEventsWithStopDate:v15];

    double v16 = [(PLSpringBoardAgent *)self screenNumberToName];
    uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v7];
    double v18 = [v16 objectForKeyedSubscript:v17];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__PLSpringBoardAgent_addAccountingEvent___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v19;
      if (addAccountingEvent__defaultOnce != -1) {
        dispatch_once(&addAccountingEvent__defaultOnce, block);
      }
      if (addAccountingEvent__classDebugEnabled)
      {
        uint64_t v20 = NSString;
        uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v7];
        v22 = [v20 stringWithFormat:@"screenNumber unfiltered : %@", v21];

        v23 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSpringBoardAgent.m"];
        v25 = [v24 lastPathComponent];
        v26 = [NSString stringWithUTF8String:"-[PLSpringBoardAgent addAccountingEvent:]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:889];

        uint64_t v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    if (v18)
    {
      int v28 = [MEMORY[0x1E4F92900] sharedInstance];
      v56 = v18;
      v57[0] = &unk_1F4011D68;
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
      int v30 = [v4 entryDate];
      [v28 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:v29 withStartDate:v30];

      uint64_t v31 = [MEMORY[0x1E4F92900] sharedInstance];
      v55 = v18;
      uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
      id v33 = [v4 entryDate];
      [v31 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:v32 withStartDate:v33];
    }
    if (!v12 && v13 == 9)
    {
      uint64_t v34 = [(PLSpringBoardAgent *)self lastReceivedPushEntry];
      if (v34)
      {
        uint64_t v35 = (void *)v34;
        v36 = [v4 entryDate];
        id v37 = [(PLSpringBoardAgent *)self lastReceivedPushEntry];
        v38 = [v37 entryDate];
        [v36 timeIntervalSinceDate:v38];
        double v40 = v39;

        if (v40 < 3.0)
        {
          uint64_t v41 = [MEMORY[0x1E4F92900] sharedInstance];
          v42 = [(PLSpringBoardAgent *)self lastReceivedPushEntry];
          id v43 = [v42 objectForKeyedSubscript:@"BundleID"];
          v53 = v43;
          v54 = &unk_1F4011D68;
          v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          v45 = [v4 entryDate];
          [v41 createDistributionEventPointWithDistributionID:28 withChildNodeNameToWeight:v44 withStartDate:v45];

          v46 = [MEMORY[0x1E4F92900] sharedInstance];
          v47 = [(PLSpringBoardAgent *)self lastReceivedPushEntry];
          v48 = [v47 objectForKeyedSubscript:@"BundleID"];
          v52 = v48;
          objc_super v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
          uint64_t v50 = [v4 entryDate];
          [v46 createQualificationEventForwardWithQualificationID:10 withChildNodeNames:v49 withStartDate:v50];
        }
      }
    }
    [(PLSpringBoardAgent *)self setLastSBEntry:v4];
  }
}

uint64_t __41__PLSpringBoardAgent_addAccountingEvent___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  addAccountingEvent__classDebugEnabled = result;
  return result;
}

- (void)closeLastOpenEventsWithStopDate:(id)a3
{
  id v12 = a3;
  id v4 = [(PLSpringBoardAgent *)self lastSBEntry];

  if (v4)
  {
    int v5 = [(PLSpringBoardAgent *)self lastSBEntry];
    double v6 = [v5 objectForKeyedSubscript:@"Screen"];
    [v6 doubleValue];
    double v8 = v7;

    double v9 = [(PLSpringBoardAgent *)self lastReceivedPushEntry];

    if (v9)
    {
      if (v8 == 9)
      {
        char v10 = [MEMORY[0x1E4F92900] sharedInstance];
        [v10 createDistributionEventPointWithDistributionID:28 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v12];

        double v11 = [MEMORY[0x1E4F92900] sharedInstance];
        [v11 createQualificationEventForwardWithQualificationID:10 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v12];

        [(PLSpringBoardAgent *)self setLastReceivedPushEntry:0];
      }
    }
  }
}

- (PLNSNotificationOperatorComposition)notificationSBScreenTimeTrackingChanged
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (PLCFNotificationOperatorComposition)notificationSBLockTrackingChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (PLCFNotificationOperatorComposition)notificationSBBlankTrackingChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLNSNotificationOperatorComposition)notificationSBWallpaperTrackingChanged
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLNSNotificationOperatorComposition)notificationSBAutoLockTimerFiredNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLTimer)dailyWallpaperPoll
{
  return (PLTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDailyWallpaperPoll:(id)a3
{
}

- (BOOL)autoLockIsNil
{
  return self->_autoLockIsNil;
}

- (void)setAutoLockIsNil:(BOOL)a3
{
  self->_autoLockIsNil = a3;
}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)receivedPushNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setReceivedPushNotification:(id)a3
{
}

- (PLXPCListenerOperatorComposition)userNotificationRequestEvent
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (PLXPCListenerOperatorComposition)userNotificationTriggerEvent
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (PLXPCListenerOperatorComposition)bulletinBoardNotificationPublishEvent
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (PLMonotonicTimer)autolockEnergyPeriodicTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAutolockEnergyPeriodicTimer:(id)a3
{
}

- (NSDate)lastEligibleAutolockEnergyComputationDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastEligibleAutolockEnergyComputationDate:(id)a3
{
}

- (NSDictionary)screenNumberToName
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setScreenNumberToName:(id)a3
{
}

- (BOOL)deviceIsCharging
{
  return self->_deviceIsCharging;
}

- (void)setDeviceIsCharging:(BOOL)a3
{
  self->_deviceIsCharging = a3;
}

- (PLEntryNotificationOperatorComposition)deviceChargingStateNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceChargingStateNotification:(id)a3
{
}

- (PLEntry)lastSBEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastSBEntry:(id)a3
{
}

- (PLEntry)lastReceivedPushEntry
{
  return self->_lastReceivedPushEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedPushEntry, 0);
  objc_storeStrong((id *)&self->_lastSBEntry, 0);
  objc_storeStrong((id *)&self->_deviceChargingStateNotification, 0);
  objc_storeStrong((id *)&self->_screenNumberToName, 0);
  objc_storeStrong((id *)&self->_lastEligibleAutolockEnergyComputationDate, 0);
  objc_storeStrong((id *)&self->_autolockEnergyPeriodicTimer, 0);
  objc_storeStrong((id *)&self->_bulletinBoardNotificationPublishEvent, 0);
  objc_storeStrong((id *)&self->_userNotificationTriggerEvent, 0);
  objc_storeStrong((id *)&self->_userNotificationRequestEvent, 0);
  objc_storeStrong((id *)&self->_receivedPushNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
  objc_storeStrong((id *)&self->_dailyWallpaperPoll, 0);
  objc_storeStrong((id *)&self->_notificationSBAutoLockTimerFiredNotification, 0);
  objc_storeStrong((id *)&self->_notificationSBWallpaperTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationSBBlankTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationSBLockTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationSBScreenTimeTrackingChanged, 0);
}

void __46__PLSpringBoardAgent_initOperatorDependancies__block_invoke_250_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "PLSpringBoardAgent:Request payload =%@", v2, v3, v4, v5, v6);
}

- (void)logBulletinPerEvent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "PLSpringBoardAgent:Request logging in Event Point table", v1, 2u);
}

- (void)logBulletinAggregate:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "PLSpringBoardAgent:Request logging in Aggregate table", v1, 2u);
}

@end