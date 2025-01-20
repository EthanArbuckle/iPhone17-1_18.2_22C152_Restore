@interface FCCKPrivateDatabase
+ (id)privateDatabaseSchema;
+ (id)recordSchemas;
+ (id)testingDatabase;
- (char)_queueForOperation:(char *)a1;
- (id)_clientRecordID:(id)a1;
- (id)_clientToServerRecord:(uint64_t)a1;
- (id)_clientToServerRecordZoneID:(id)a1;
- (id)_mapObjects:(char)a3 toClient:(void *)a4 withBlock:;
- (id)_mapRecordIDs:(char)a3 toClient:;
- (id)_mapRecordZoneIDs:(char)a3 toClient:;
- (id)_mapRecordZoneIDs:(char)a3 toClient:(char)a4 expectUnknownZones:;
- (id)_mapRecords:(char)a3 toClient:;
- (id)_mapZones:(char)a3 toClient:;
- (id)_serverToClientError:(uint64_t)a1;
- (id)_serverToClientRecord:(uint64_t)a1;
- (id)_serverToClientRecordZoneID:(id)a1;
- (id)_serverToClientRecordZoneID:(id)a1 expectUnknownZones:(void *)a2;
- (id)databaseWithZoneWidePCS;
- (id)initWithCKProperties:(void *)a3 schema:(void *)a4 middleware:(void *)a5 encryptionDelegate:(void *)a6 networkBehaviorMonitor:;
- (id)initWithContainerIdentifier:(void *)a3 secureContainerIdentifier:(char)a4 productionEnvironment:(void *)a5 encryptionDelegate:(void *)a6 networkBehaviorMonitor:(char)a7 privateDataSyncingEnabled:;
- (id)pruningAssistantForZoneName:(id *)a1;
- (id)secureDatabase;
- (id)t_initWithContainers:(void *)a3 database:(void *)a4 databaseWithZoneWidePCS:(void *)a5 secureDatabase:(void *)a6 schema:(void *)a7 middleware:(void *)a8 encryptionDelegate:(void *)a9 networkBehaviorMonitor:;
- (void)_addCKOperation:(uint64_t)a3 destination:;
- (void)_beginInitialStartUpIfNeeded;
- (void)_continueStartUp;
- (void)_finishStartUpWithError:(uint64_t)a1;
- (void)_possiblyRetryStartUp;
- (void)_possiblySimulateCrashForError:(void *)a1 message:(void *)a2;
- (void)_preflightOperation:(void *)a1;
- (void)_preflightRecordsInDatabaseChangesOperation:(uint64_t)a1;
- (void)addCKOperation:(uint64_t)a3 destination:;
- (void)addOperation:(uint64_t)a1;
- (void)enumerateActiveDestinationsWithOptions:(void *)a3 handler:;
- (void)enumeratePayloadsWithRecordIDs:(void *)a3 records:(void *)a4 zoneIDs:(void *)a5 zones:(uint64_t)a6 options:(void *)a7 payloadHandler:;
- (void)fetchAllDatabaseChangesWithServerChangeToken:(id)a3 qualityOfService:(int64_t)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)fetchChangesForRecordZoneID:(id)a3 changeToken:(id)a4 desiredKeys:(id)a5 fetchAllChanges:(BOOL)a6 qualityOfService:(int64_t)a7 completionHandler:(id)a8;
- (void)fetchSecureDatabaseSupportedWithCompletionHandler:(uint64_t)a1;
- (void)registerZonePruningAssistants:(uint64_t)a1;
- (void)registerZoneRestorationSources:(uint64_t)a1;
- (void)reportEncryptionMigrationError:(uint64_t)a1;
- (void)reportPostMigrationCleanupError:(uint64_t)a1;
- (void)reportRecoverableStartUpError:(uint64_t)a1;
- (void)t_performStartUpWithCompletion:(uint64_t)a1;
- (void)takeDatabaseOfflineDueToError:(uint64_t)a1;
- (void)zoneIDsUsingSecureContainer;
@end

@implementation FCCKPrivateDatabase

+ (id)privateDatabaseSchema
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  self;
  self;
  v179 = @"static_sentinel";
  v180 = @"SharedPersonalizationProfile";
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v179 count:2];
  v114 = +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v124, 0);
  v130 = v114;
  v166 = @"static_sentinel_secure";
  v167 = @"SharedPersonalizationProfileSecure";
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v166 count:2];
  v111 = +[FCCKZoneSchema defaultZoneWithStaticRecordNames:shouldUseSecureContainer:]((uint64_t)FCCKZoneSchema, v113, 1);
  v131 = v111;
  v109 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"AudioPlaylist");
  v132 = v109;
  v107 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"AudioPlaylistSecure", 7, 0);
  v133 = v107;
  v104 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"AudioPlaylistSecure2", 7, 0);
  v134 = v104;
  v100 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"IssueReadingHistory");
  v135 = v100;
  v96 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"IssueReadingHistorySecure", 7, 0);
  v136 = v96;
  v92 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"IssueReadingHistorySecure2", 7, 0);
  v137 = v92;
  v90 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"PuzzleHistory");
  v138 = v90;
  v88 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"PuzzleHistorySecure", 7, 0);
  v139 = v88;
  v86 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"PuzzleHistorySecure2", 7, 0);
  v140 = v86;
  v84 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"ReadingHistory");
  v141 = v84;
  v82 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ReadingHistorySecure", 7, 0);
  v142 = v82;
  v80 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ReadingHistorySecure2", 7, 0);
  v143 = v80;
  v77 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"ReadingList");
  v144 = v77;
  v75 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ReadingListSecure", 7, 0);
  v145 = v75;
  v73 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ReadingListSecure2", 7, 0);
  v146 = v73;
  v71 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"ChannelMemberships");
  v147 = v71;
  v69 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"SensitiveSubscriptions");
  v148 = v69;
  v67 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"Shortcuts");
  v149 = v67;
  v65 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ShortcutsSecure", 7, 0);
  v150 = v65;
  v63 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"ShortcutsSecure2", 7, 0);
  v151 = v63;
  v61 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"Subscriptions");
  v152 = v61;
  v57 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"Subscriptions_CK", 3, 0);
  v153 = v57;
  v55 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"SensitiveSubscriptionsSecure", 7, 0);
  v154 = v55;
  v53 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"SensitiveSubscriptionsSecure2", 7, 0);
  v155 = v53;
  v50 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"UserEventHistory");
  v156 = v50;
  v0 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"UserEventHistorySecure", 7, 0);
  v157 = v0;
  v1 = +[FCCKZoneSchema zoneWithName:]((uint64_t)FCCKZoneSchema, @"UserInfo");
  v158 = v1;
  v163[0] = @"user_info_static_record_name_secure";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:1];
  v3 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"UserInfoSecure", 7, v2);
  v159 = v3;
  v162[0] = @"user_info_static_record_name_secure2";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v162 count:1];
  v5 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"UserInfoSecure2", 7, v4);
  v160 = v5;
  v165 = @"static_user_privacy_exporter_record";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:1];
  v7 = +[FCCKZoneSchema zoneWithName:options:staticRecordNames:]((uint64_t)FCCKZoneSchema, @"UserPrivacyExporter", 2, v6);
  v161 = v7;
  v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:32];

  v101 = +[FCCKPrivateDatabase recordSchemas]();
  self;
  uint64_t v8 = *MEMORY[0x1E4F19D88];
  v97 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", *MEMORY[0x1E4F19D88]);
  v130 = v97;
  v93 = +[FCPair pairWithFirst:v8 second:@"Sentinel"];
  v131 = v93;
  v91 = +[FCPair pairWithFirst:v8 second:@"SentinelSecure"];
  v132 = v91;
  v89 = +[FCPair pairWithFirst:@"AudioPlaylist" second:@"AudioPlaylistItem"];
  v133 = v89;
  v87 = +[FCPair pairWithFirst:@"IssueReadingHistory" second:@"IssueReadingHistoryItem"];
  v134 = v87;
  v85 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"PuzzleHistory");
  v135 = v85;
  v83 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"ReadingHistory");
  v136 = v83;
  v81 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"ReadingList");
  v137 = v81;
  v79 = +[FCPair pairWithFirst:@"ChannelMemberships" second:@"ReferenceToMembership"];
  v138 = v79;
  v78 = +[FCPair pairWithFirst:@"SensitiveSubscriptions" second:@"Subscription"];
  v139 = v78;
  v76 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"Shortcuts");
  v140 = v76;
  v74 = +[FCPair pairWithFirst:@"Subscriptions" second:@"Subscription"];
  v141 = v74;
  v72 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"UserEventHistory");
  v142 = v72;
  v68 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"UserInfo");
  v143 = v68;
  v66 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"UserInfo");
  v144 = v66;
  v64 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"UserInfo");
  v145 = v64;
  v62 = +[FCPair pairWithFirst:@"UserPrivacyExporter" second:@"UserPrivacyExporter"];
  v146 = v62;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:17];
  uint64_t v70 = v8;
  v58 = +[FCPair pairWithFirst:v8 second:@"PersonalizationProfile"];
  v166 = v58;
  v54 = +[FCPair pairWithFirst:v8 second:@"PersonalizationProfileSecure"];
  v179 = v54;
  v51 = +[FCPair pairWithFirst:@"AudioPlaylist" second:@"AudioPlaylistItem"];
  v167 = v51;
  v60 = +[FCPair pairWithFirst:@"AudioPlaylistSecure" second:@"AudioPlaylistItemSecure"];
  v180 = v60;
  v47 = +[FCPair pairWithFirst:@"IssueReadingHistory" second:@"IssueReadingHistoryItem"];
  v168 = v47;
  v59 = +[FCPair pairWithFirst:@"IssueReadingHistorySecure" second:@"IssueReadingHistoryItemSecure"];
  v181 = v59;
  v45 = +[FCPair pairWithFirst:@"PuzzleHistory" second:@"PuzzleHistoryItem"];
  v169 = v45;
  v56 = +[FCPair pairWithFirst:@"PuzzleHistorySecure" second:@"PuzzleHistoryItemSecure"];
  v182 = v56;
  v43 = +[FCPair pairWithFirst:@"ReadingHistory" second:@"ReadingHistoryItem"];
  v170 = v43;
  v52 = +[FCPair pairWithFirst:@"ReadingHistorySecure" second:@"ReadingHistoryItemSecure"];
  v183 = v52;
  v41 = +[FCPair pairWithFirst:@"ReadingList" second:@"ReadingListEntry"];
  v171 = v41;
  v49 = +[FCPair pairWithFirst:@"ReadingListSecure" second:@"ReadingListEntrySecure"];
  v184 = v49;
  v40 = +[FCPair pairWithFirst:@"SensitiveSubscriptions" second:@"Subscription"];
  v172 = v40;
  v39 = +[FCPair pairWithFirst:@"SensitiveSubscriptionsSecure" second:@"SubscriptionSecure"];
  v185 = v39;
  v38 = +[FCPair pairWithFirst:@"Shortcuts" second:@"Shortcut"];
  v173 = v38;
  v48 = +[FCPair pairWithFirst:@"ShortcutsSecure" second:@"ShortcutSecure"];
  v186 = v48;
  v37 = +[FCPair pairWithFirst:@"Subscriptions" second:@"Subscription"];
  v174 = v37;
  v46 = +[FCPair pairWithFirst:@"Subscriptions_CK" second:@"Subscription_CK"];
  v187 = v46;
  v36 = +[FCPair pairWithFirst:@"UserEventHistory" second:@"UserEventHistorySession"];
  v175 = v36;
  v44 = +[FCPair pairWithFirst:@"UserEventHistorySecure" second:@"UserEventHistorySessionSecure"];
  v188 = v44;
  v35 = +[FCPair pairWithFirst:@"UserInfo" second:@"UserInfo"];
  v176 = v35;
  v34 = +[FCPair pairWithFirst:@"UserInfoSecure" second:@"UserInfoSecure"];
  v189 = v34;
  v33 = +[FCPair pairWithFirst:@"UserInfo" second:@"TagSettings"];
  v177 = v33;
  v32 = +[FCPair pairWithFirst:@"UserInfoSecure" second:@"TagSettingsSecure"];
  v190 = v32;
  v31 = +[FCPair pairWithFirst:@"UserInfo" second:@"PuzzleTypeSettings"];
  v178 = v31;
  v30 = +[FCPair pairWithFirst:second:](FCPair, "pairWithFirst:second:", @"UserInfoSecure");
  v191 = v30;
  v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v166 count:13];
  v29 = +[FCPair pairWithFirst:@"Subscriptions" second:@"Subscription"];
  v164 = v29;
  v42 = +[FCPair pairWithFirst:@"SensitiveSubscriptionsSecure" second:@"SubscriptionSecure"];
  v165 = v42;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v165 forKeys:&v164 count:1];
  v117 = +[FCPair pairWithFirst:@"AudioPlaylist" second:@"AudioPlaylistItem"];
  v162[0] = v117;
  v99 = +[FCPair pairWithFirst:@"AudioPlaylistSecure2" second:@"AudioPlaylistItemSecure2"];
  v163[0] = v99;
  v116 = +[FCPair pairWithFirst:@"IssueReadingHistory" second:@"IssueReadingHistoryItem"];
  v162[1] = v116;
  v98 = +[FCPair pairWithFirst:@"IssueReadingHistorySecure2" second:@"IssueReadingHistoryItemSecure2"];
  v163[1] = v98;
  v115 = +[FCPair pairWithFirst:@"PuzzleHistory" second:@"PuzzleHistoryItem"];
  v162[2] = v115;
  v105 = +[FCPair pairWithFirst:@"PuzzleHistorySecure2" second:@"PuzzleHistoryItemSecure2"];
  v163[2] = v105;
  v108 = +[FCPair pairWithFirst:@"ReadingHistory" second:@"ReadingHistoryItem"];
  v162[3] = v108;
  v95 = +[FCPair pairWithFirst:@"ReadingHistorySecure2" second:@"ReadingHistoryItemSecure2"];
  v163[3] = v95;
  v110 = +[FCPair pairWithFirst:@"ReadingList" second:@"ReadingListEntry"];
  v162[4] = v110;
  v106 = +[FCPair pairWithFirst:@"ReadingListSecure2" second:@"ReadingListEntrySecure2"];
  v163[4] = v106;
  v103 = +[FCPair pairWithFirst:@"SensitiveSubscriptions" second:@"Subscription"];
  v162[5] = v103;
  v94 = +[FCPair pairWithFirst:@"SensitiveSubscriptionsSecure2" second:@"SubscriptionSecure2"];
  v163[5] = v94;
  v122 = +[FCPair pairWithFirst:@"Shortcuts" second:@"Shortcut"];
  v162[6] = v122;
  v112 = +[FCPair pairWithFirst:@"ShortcutsSecure2" second:@"ShortcutSecure2"];
  v163[6] = v112;
  v120 = +[FCPair pairWithFirst:@"Subscriptions" second:@"Subscription"];
  v162[7] = v120;
  v9 = +[FCPair pairWithFirst:@"SensitiveSubscriptionsSecure2" second:@"SubscriptionSecure2"];
  v163[7] = v9;
  v10 = +[FCPair pairWithFirst:@"UserInfo" second:@"UserInfo"];
  v162[8] = v10;
  v11 = +[FCPair pairWithFirst:@"UserInfoSecure2" second:@"UserInfoSecure2"];
  v163[8] = v11;
  v12 = +[FCPair pairWithFirst:@"UserInfo" second:@"TagSettings"];
  v162[9] = v12;
  v13 = +[FCPair pairWithFirst:@"UserInfoSecure2" second:@"TagSettingsSecure2"];
  v163[9] = v13;
  v14 = +[FCPair pairWithFirst:@"UserInfo" second:@"PuzzleTypeSettings"];
  v162[10] = v14;
  v15 = +[FCPair pairWithFirst:@"UserInfoSecure2" second:@"PuzzleTypeSettingsSecure"];
  v163[10] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:11];
  v129 = +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:v125 V2Changes:v119 V3Changes:v28 V4Changes:v16];

  self;
  v127 = +[FCPair pairWithFirst:v70 second:@"static_sentinel"];
  v130 = v127;
  v126 = +[FCPair pairWithFirst:v70 second:@"static_sentinel_secure"];
  v131 = v126;
  v123 = +[FCPair pairWithFirst:v70 second:@"SharedPersonalizationProfile"];
  v132 = v123;
  v121 = +[FCPair pairWithFirst:@"UserInfo" second:@"user_info_static_record_name"];
  v133 = v121;
  v128 = +[FCPair pairWithFirst:@"UserPrivacyExporter" second:@"static_user_privacy_exporter_record"];
  v134 = v128;
  v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:5];
  v17 = +[FCPair pairWithFirst:v70 second:@"SharedPersonalizationProfile"];
  v166 = v17;
  v18 = +[FCPair pairWithFirst:v70 second:@"SharedPersonalizationProfileSecure"];
  v179 = v18;
  v19 = +[FCPair pairWithFirst:@"UserInfo" second:@"user_info_static_record_name"];
  v167 = v19;
  v20 = +[FCPair pairWithFirst:@"UserInfoSecure" second:@"user_info_static_record_name_secure"];
  v180 = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v166 count:2];
  v22 = +[FCPair pairWithFirst:@"UserInfo" second:@"user_info_static_record_name"];
  v162[0] = v22;
  v23 = +[FCPair pairWithFirst:@"UserInfoSecure2" second:@"user_info_static_record_name_secure2"];
  v163[0] = v23;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v163 forKeys:v162 count:1];
  v25 = +[FCCKPrivateDatabaseVersionMapping mappingWithBaseValues:v118 V2Changes:v21 V3Changes:MEMORY[0x1E4F1CC08] V4Changes:v24];

  v26 = +[FCCKPrivateDatabaseSchema databaseSchemaWithZones:records:recordTypeVersionMapping:recordNameVersionMapping:]((uint64_t)FCCKPrivateDatabaseSchema, v102, v101, v129, v25);

  return v26;
}

+ (id)recordSchemas
{
  v559[38] = *MEMORY[0x1E4F143B8];
  self;
  v493 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 0);
  v558[0] = v493;
  v492 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v558[1] = v492;
  v491 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"order", 0);
  v558[2] = v491;
  v490 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v558[3] = v490;
  v489 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v558[4] = v489;
  v488 = [MEMORY[0x1E4F1C978] arrayWithObjects:v558 count:5];
  v487 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"AudioPlaylistItem", v488);
  v559[0] = v487;
  v486 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 1);
  v557[0] = v486;
  v485 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 1);
  v557[1] = v485;
  v484 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"order", 0);
  v557[2] = v484;
  v483 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v557[3] = v483;
  v482 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v557[4] = v482;
  v481 = [MEMORY[0x1E4F1C978] arrayWithObjects:v557 count:5];
  v480 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"AudioPlaylistItemSecure", v481);
  v559[1] = v480;
  v479 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 1);
  v556[0] = v479;
  v478 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 1);
  v556[1] = v478;
  v477 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"order", 1);
  v556[2] = v477;
  v476 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v556[3] = v476;
  v475 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v556[4] = v475;
  v474 = [MEMORY[0x1E4F1C978] arrayWithObjects:v556 count:5];
  v473 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"AudioPlaylistItemSecure2", v474);
  v559[2] = v473;
  v472 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"issueID", 0);
  v555[0] = v472;
  v471 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisited", 0);
  v555[1] = v471;
  v470 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastBadged", 0);
  v555[2] = v470;
  v469 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastEngaged", 0);
  v555[3] = v469;
  v468 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastSeen", 0);
  v555[4] = v468;
  v467 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastRemovedFromMyMagazines", 0);
  v555[5] = v467;
  v466 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisitedArticleID", 0);
  v555[6] = v466;
  v465 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisitedPageID", 0);
  v555[7] = v465;
  v464 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v555[8] = v464;
  v463 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v555[9] = v463;
  v462 = [MEMORY[0x1E4F1C978] arrayWithObjects:v555 count:10];
  v461 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"IssueReadingHistoryItem", v462);
  v559[3] = v461;
  v460 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"issueID", 1);
  v554[0] = v460;
  v459 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisited", 0);
  v554[1] = v459;
  v458 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastBadged", 0);
  v554[2] = v458;
  v457 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastEngaged", 0);
  v554[3] = v457;
  v456 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastSeen", 0);
  v554[4] = v456;
  v455 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastRemovedFromMyMagazines", 0);
  v554[5] = v455;
  v454 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisitedArticleID", 1);
  v554[6] = v454;
  v453 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisitedPageID", 1);
  v554[7] = v453;
  v452 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v554[8] = v452;
  v451 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v554[9] = v451;
  v450 = [MEMORY[0x1E4F1C978] arrayWithObjects:v554 count:10];
  v449 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"IssueReadingHistoryItemSecure", v450);
  v559[4] = v449;
  v448 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"issueID", 1);
  v553[0] = v448;
  v447 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisited", 1);
  v553[1] = v447;
  v446 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastBadged", 1);
  v553[2] = v446;
  v445 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastEngaged", 1);
  v553[3] = v445;
  v444 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastSeen", 1);
  v553[4] = v444;
  v443 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastRemovedFromMyMagazines", 1);
  v553[5] = v443;
  v442 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisitedArticleID", 1);
  v553[6] = v442;
  v441 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisitedPageID", 1);
  v553[7] = v441;
  v440 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v553[8] = v440;
  v439 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v553[9] = v439;
  v438 = [MEMORY[0x1E4F1C978] arrayWithObjects:v553 count:10];
  v437 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"IssueReadingHistoryItemSecure2", v438);
  v559[5] = v437;
  v436 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"data", 0);
  v552[0] = v436;
  v435 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"version", 0);
  v552[1] = v435;
  v434 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v552[2] = v434;
  v433 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v552[3] = v433;
  v432 = [MEMORY[0x1E4F1C978] arrayWithObjects:v552 count:4];
  v431 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PersonalizationProfile", v432);
  v559[6] = v431;
  v430 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"data", 1);
  v551[0] = v430;
  v429 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"version", 0);
  v551[1] = v429;
  v428 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v551[2] = v428;
  v427 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v551[3] = v427;
  v426 = [MEMORY[0x1E4F1C978] arrayWithObjects:v551 count:4];
  v425 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PersonalizationProfileSecure", v426);
  v559[7] = v425;
  v424 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v550[0] = v424;
  v423 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v550[1] = v423;
  v422 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleID", 0);
  v550[2] = v422;
  v421 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleTypeID", 0);
  v550[3] = v421;
  v420 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"progressData", 0);
  v550[4] = v420;
  v419 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"progressLevel", 0);
  v550[5] = v419;
  v418 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"score", 0);
  v550[6] = v418;
  v417 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"rankID", 0);
  v550[7] = v417;
  v416 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"usedReveal", 0);
  v550[8] = v416;
  v415 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"playDuration", 0);
  v550[9] = v415;
  v414 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastPlayedDate", 0);
  v550[10] = v414;
  v413 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedDate", 0);
  v550[11] = v413;
  v412 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"firstCompletedDate", 0);
  v550[12] = v412;
  v411 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"firstPlayDuration", 0);
  v550[13] = v411;
  v410 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"bestScore", 0);
  v550[14] = v410;
  v409 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"difficulty", 0);
  v550[15] = v409;
  v408 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"publishDate", 0);
  v550[16] = v408;
  v407 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"behaviorFlags", 0);
  v550[17] = v407;
  v406 = [MEMORY[0x1E4F1C978] arrayWithObjects:v550 count:18];
  v405 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PuzzleHistoryItem", v406);
  v559[8] = v405;
  v404 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v549[0] = v404;
  v403 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v549[1] = v403;
  v402 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleID", 1);
  v549[2] = v402;
  v401 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleTypeID", 1);
  v549[3] = v401;
  v400 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"progressData", 1);
  v549[4] = v400;
  v399 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"progressLevel", 0);
  v549[5] = v399;
  v398 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"score", 1);
  v549[6] = v398;
  v397 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"rankID", 1);
  v549[7] = v397;
  v396 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"usedReveal", 1);
  v549[8] = v396;
  v395 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"playDuration", 1);
  v549[9] = v395;
  v394 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastPlayedDate", 1);
  v549[10] = v394;
  v393 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedDate", 1);
  v549[11] = v393;
  v392 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"firstCompletedDate", 1);
  v549[12] = v392;
  v391 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"firstPlayDuration", 1);
  v549[13] = v391;
  v390 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"bestScore", 1);
  v549[14] = v390;
  v389 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"difficulty", 1);
  v549[15] = v389;
  v388 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"publishDate", 1);
  v549[16] = v388;
  v387 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"behaviorFlags", 1);
  v549[17] = v387;
  v386 = [MEMORY[0x1E4F1C978] arrayWithObjects:v549 count:18];
  v385 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PuzzleHistoryItemSecure", v386);
  v559[9] = v385;
  v384 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v548[0] = v384;
  v383 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v548[1] = v383;
  v382 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleID", 1);
  v548[2] = v382;
  v381 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleTypeID", 1);
  v548[3] = v381;
  v380 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"progressData", 1);
  v548[4] = v380;
  v379 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"progressLevel", 1);
  v548[5] = v379;
  v378 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"score", 1);
  v548[6] = v378;
  v377 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"rankID", 1);
  v548[7] = v377;
  v376 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"usedReveal", 1);
  v548[8] = v376;
  v375 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"playDuration", 1);
  v548[9] = v375;
  v374 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastPlayedDate", 1);
  v548[10] = v374;
  v373 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedDate", 1);
  v548[11] = v373;
  v372 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"firstCompletedDate", 1);
  v548[12] = v372;
  v371 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"firstPlayDuration", 1);
  v548[13] = v371;
  v370 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"bestScore", 1);
  v548[14] = v370;
  v369 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"difficulty", 1);
  v548[15] = v369;
  v368 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"publishDate", 1);
  v548[16] = v368;
  v367 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"behaviorFlags", 1);
  v548[17] = v367;
  v366 = [MEMORY[0x1E4F1C978] arrayWithObjects:v548 count:18];
  v365 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PuzzleHistoryItemSecure2", v366);
  v559[10] = v365;
  v364 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v547[0] = v364;
  v363 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v547[1] = v363;
  v362 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleTypeID", 0);
  v547[2] = v362;
  v361 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"settingsData", 0);
  v547[3] = v361;
  v360 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastSeenPuzzleIDs", 0);
  v547[4] = v360;
  v359 = [MEMORY[0x1E4F1C978] arrayWithObjects:v547 count:5];
  v358 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PuzzleTypeSettings", v359);
  v559[11] = v358;
  v357 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v546[0] = v357;
  v356 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v546[1] = v356;
  v355 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleTypeID", 1);
  v546[2] = v355;
  v354 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"settingsData", 1);
  v546[3] = v354;
  v353 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastSeenPuzzleIDs", 1);
  v546[4] = v353;
  v352 = [MEMORY[0x1E4F1C978] arrayWithObjects:v546 count:5];
  v351 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"PuzzleTypeSettingsSecure", v352);
  v559[12] = v351;
  v350 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 0);
  v545[0] = v350;
  v349 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sourceChannelTagID", 0);
  v545[1] = v349;
  v348 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"deviceID", 0);
  v545[2] = v348;
  v347 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisited", 0);
  v545[3] = v347;
  v346 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleRead", 0);
  v545[4] = v346;
  v345 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleSeen", 0);
  v545[5] = v345;
  v344 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedListening", 0);
  v545[6] = v344;
  v343 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedReading", 0);
  v545[7] = v343;
  v342 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"liked", 0);
  v545[8] = v342;
  v341 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"disliked", 0);
  v545[9] = v341;
  v340 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"offensive", 0);
  v545[10] = v340;
  v339 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleConsumed", 0);
  v545[11] = v339;
  v338 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v545[12] = v338;
  v337 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v545[13] = v337;
  v336 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listenedCount", 0);
  v545[14] = v336;
  v335 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listeningProgress", 0);
  v545[15] = v335;
  v334 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listeningProgressLastSaved", 0);
  v545[16] = v334;
  v333 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastListened", 0);
  v545[17] = v333;
  v332 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readingPosition", 0);
  v545[18] = v332;
  v331 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readingPositionLastSaved", 0);
  v545[19] = v331;
  v330 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readCount", 0);
  v545[20] = v330;
  v329 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"removedFromAudio", 0);
  v545[21] = v329;
  v328 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pruningDisabled", 0);
  v545[22] = v328;
  v327 = [MEMORY[0x1E4F1C978] arrayWithObjects:v545 count:23];
  v326 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReadingHistoryItem", v327);
  v559[13] = v326;
  v325 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 1);
  v544[0] = v325;
  v324 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sourceChannelTagID", 1);
  v544[1] = v324;
  v323 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"deviceID", 1);
  v544[2] = v323;
  v322 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisited", 0);
  v544[3] = v322;
  v321 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleRead", 0);
  v544[4] = v321;
  v320 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleSeen", 0);
  v544[5] = v320;
  v319 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedListening", 0);
  v544[6] = v319;
  v318 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedReading", 0);
  v544[7] = v318;
  v317 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"liked", 0);
  v544[8] = v317;
  v316 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"disliked", 0);
  v544[9] = v316;
  v315 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"offensive", 0);
  v544[10] = v315;
  v314 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleConsumed", 0);
  v544[11] = v314;
  v313 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v544[12] = v313;
  v312 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v544[13] = v312;
  v311 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listenedCount", 0);
  v544[14] = v311;
  v310 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listeningProgress", 1);
  v544[15] = v310;
  v309 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listeningProgressLastSaved", 1);
  v544[16] = v309;
  v308 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastListened", 1);
  v544[17] = v308;
  v307 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readingPosition", 1);
  v544[18] = v307;
  v306 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readingPositionLastSaved", 1);
  v544[19] = v306;
  v305 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readCount", 0);
  v544[20] = v305;
  v304 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"removedFromAudio", 0);
  v544[21] = v304;
  v303 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pruningDisabled", 0);
  v544[22] = v303;
  v302 = [MEMORY[0x1E4F1C978] arrayWithObjects:v544 count:23];
  v301 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReadingHistoryItemSecure", v302);
  v559[14] = v301;
  v300 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 1);
  v543[0] = v300;
  v299 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sourceChannelTagID", 1);
  v543[1] = v299;
  v298 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"deviceID", 1);
  v543[2] = v298;
  v297 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastVisited", 1);
  v543[3] = v297;
  v296 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleRead", 1);
  v543[4] = v296;
  v295 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleSeen", 1);
  v543[5] = v295;
  v294 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedListening", 1);
  v543[6] = v294;
  v293 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"completedReading", 1);
  v543[7] = v293;
  v292 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"liked", 1);
  v543[8] = v292;
  v291 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"disliked", 1);
  v543[9] = v291;
  v290 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"offensive", 1);
  v543[10] = v290;
  v289 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleConsumed", 1);
  v543[11] = v289;
  v288 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v543[12] = v288;
  v287 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v543[13] = v287;
  v286 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listenedCount", 1);
  v543[14] = v286;
  v285 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listeningProgress", 1);
  v543[15] = v285;
  v284 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"listeningProgressLastSaved", 1);
  v543[16] = v284;
  v283 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastListened", 1);
  v543[17] = v283;
  v282 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readingPosition", 1);
  v543[18] = v282;
  v281 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readingPositionLastSaved", 1);
  v543[19] = v281;
  v280 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readCount", 1);
  v543[20] = v280;
  v279 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"removedFromAudio", 1);
  v543[21] = v279;
  v278 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pruningDisabled", 1);
  v543[22] = v278;
  v277 = [MEMORY[0x1E4F1C978] arrayWithObjects:v543 count:23];
  v276 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReadingHistoryItemSecure2", v277);
  v559[15] = v276;
  v275 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 0);
  v542[0] = v275;
  v274 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v542[1] = v274;
  v273 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"origin", 0);
  v542[2] = v273;
  v272 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v542[3] = v272;
  v271 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v542[4] = v271;
  v270 = [MEMORY[0x1E4F1C978] arrayWithObjects:v542 count:5];
  v269 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReadingListEntry", v270);
  v559[16] = v269;
  v268 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 1);
  v541[0] = v268;
  v267 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v541[1] = v267;
  v266 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"origin", 0);
  v541[2] = v266;
  v265 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v541[3] = v265;
  v264 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v541[4] = v264;
  v263 = [MEMORY[0x1E4F1C978] arrayWithObjects:v541 count:5];
  v262 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReadingListEntrySecure", v263);
  v559[17] = v262;
  v261 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"articleID", 1);
  v540[0] = v261;
  v260 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 1);
  v540[1] = v260;
  v259 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"origin", 1);
  v540[2] = v259;
  v258 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v540[3] = v258;
  v257 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v540[4] = v257;
  v256 = [MEMORY[0x1E4F1C978] arrayWithObjects:v540 count:5];
  v255 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReadingListEntrySecure2", v256);
  v559[18] = v255;
  v254 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"membershipID", 0);
  v539 = v254;
  v253 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v539 count:1];
  v252 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ReferenceToMembership", v253);
  v559[19] = v252;
  v251 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"encryptionKey", 1);
  v538[0] = v251;
  v250 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"version", 0);
  v538[1] = v250;
  v249 = [MEMORY[0x1E4F1C978] arrayWithObjects:v538 count:2];
  v248 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"SentinelSecure", v249);
  v559[20] = v248;
  v247 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"encryptionKey", 1);
  v537[0] = v247;
  v246 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"migratedUnencryptedData", 0);
  v537[1] = v246;
  v245 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"deletedUnencryptedData", 0);
  v537[2] = v245;
  v244 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"migratedSubscriptions", 0);
  v537[3] = v244;
  v243 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"deletedSubscriptions", 0);
  v537[4] = v243;
  v242 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"migratedToVersion", 1);
  v537[5] = v242;
  v241 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"deletedToVersion", 1);
  v537[6] = v241;
  v240 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"version", 0);
  v537[7] = v240;
  v239 = [MEMORY[0x1E4F1C978] arrayWithObjects:v537 count:8];
  v238 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"Sentinel", v239);
  v559[21] = v238;
  v237 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v536[0] = v237;
  v236 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"order", 0);
  v536[1] = v236;
  v235 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"type", 0);
  v536[2] = v235;
  v234 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v536[3] = v234;
  v233 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v536[4] = v233;
  v232 = [MEMORY[0x1E4F1C978] arrayWithObjects:v536 count:5];
  v231 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"Shortcut", v232);
  v559[22] = v231;
  v230 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v535[0] = v230;
  v229 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"order", 0);
  v535[1] = v229;
  v228 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"type", 0);
  v535[2] = v228;
  v227 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v535[3] = v227;
  v226 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v535[4] = v226;
  v225 = [MEMORY[0x1E4F1C978] arrayWithObjects:v535 count:5];
  v224 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ShortcutSecure", v225);
  v559[23] = v224;
  v223 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 1);
  v534[0] = v223;
  v222 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"order", 1);
  v534[1] = v222;
  v221 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"type", 1);
  v534[2] = v221;
  v220 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v534[3] = v220;
  v219 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v534[4] = v219;
  v218 = [MEMORY[0x1E4F1C978] arrayWithObjects:v534 count:5];
  v217 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"ShortcutSecure2", v218);
  v559[24] = v217;
  v216 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 0);
  v533[0] = v216;
  v215 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionType", 0);
  v533[1] = v215;
  v214 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrder", 0);
  v533[2] = v214;
  v213 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrigin", 0);
  v533[3] = v213;
  v212 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v533[4] = v212;
  v211 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"url", 0);
  v533[5] = v211;
  v210 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"title", 0);
  v533[6] = v210;
  v209 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pollingURL", 0);
  v533[7] = v209;
  v208 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsEnabled", 0);
  v533[8] = v208;
  v207 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"groupID", 0);
  v533[9] = v207;
  v206 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v533[10] = v206;
  v205 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v533[11] = v205;
  v204 = [MEMORY[0x1E4F1C978] arrayWithObjects:v533 count:12];
  v203 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"Subscription", v204);
  v559[25] = v203;
  v202 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 1);
  v532[0] = v202;
  v201 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionType", 0);
  v532[1] = v201;
  v200 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrder", 1);
  v532[2] = v200;
  v199 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrigin", 0);
  v532[3] = v199;
  v198 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v532[4] = v198;
  v197 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"url", 0);
  v532[5] = v197;
  v196 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"title", 0);
  v532[6] = v196;
  v195 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pollingURL", 0);
  v532[7] = v195;
  v194 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsEnabled", 0);
  v532[8] = v194;
  v193 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"groupID", 1);
  v532[9] = v193;
  uint64_t v192 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v532[10] = v192;
  v191 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v532[11] = v191;
  v190 = [MEMORY[0x1E4F1C978] arrayWithObjects:v532 count:12];
  v189 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"Subscription_CK", v190);
  v559[26] = v189;
  v188 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 1);
  v531[0] = v188;
  v187 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionType", 0);
  v531[1] = v187;
  v186 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrder", 1);
  v531[2] = v186;
  v185 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrigin", 0);
  v531[3] = v185;
  v184 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 0);
  v531[4] = v184;
  v183 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"url", 0);
  v531[5] = v183;
  v182 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"title", 0);
  v531[6] = v182;
  v181 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pollingURL", 0);
  v531[7] = v181;
  v180 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsEnabled", 0);
  v531[8] = v180;
  v179 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"groupID", 1);
  v531[9] = v179;
  v178 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v531[10] = v178;
  v177 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v531[11] = v177;
  v176 = [MEMORY[0x1E4F1C978] arrayWithObjects:v531 count:12];
  v175 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"SubscriptionSecure", v176);
  v559[27] = v175;
  v174 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 1);
  v530[0] = v174;
  v173 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionType", 1);
  v530[1] = v173;
  v172 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrder", 1);
  v530[2] = v172;
  v171 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscriptionOrigin", 1);
  v530[3] = v171;
  v170 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"dateAdded", 1);
  v530[4] = v170;
  v169 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"url", 1);
  v530[5] = v169;
  v168 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"title", 1);
  v530[6] = v168;
  v167 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"pollingURL", 1);
  v530[7] = v167;
  v166 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsEnabled", 1);
  v530[8] = v166;
  v165 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"groupID", 1);
  v530[9] = v165;
  v164 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v530[10] = v164;
  v163 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v530[11] = v163;
  v162 = [MEMORY[0x1E4F1C978] arrayWithObjects:v530 count:12];
  v161 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"SubscriptionSecure2", v162);
  v559[28] = v161;
  v160 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"accessToken", 0);
  v529[0] = v160;
  v159 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 0);
  v529[1] = v159;
  v158 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"fontMultiplier", 0);
  v529[2] = v158;
  v157 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"fontMultiplierMacOS", 0);
  v529[3] = v157;
  v156 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"contentScale", 0);
  v529[4] = v156;
  v155 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"contentScaleMacOS", 0);
  v529[5] = v155;
  v154 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"webAccessOptIn", 0);
  v529[6] = v154;
  v153 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v529[7] = v153;
  v152 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v529[8] = v152;
  v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:v529 count:9];
  v150 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"TagSettings", v151);
  v559[29] = v150;
  v149 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"accessToken", 1);
  v528[0] = v149;
  v148 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 1);
  v528[1] = v148;
  v147 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"fontMultiplier", 0);
  v528[2] = v147;
  v146 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"fontMultiplierMacOS", 0);
  v528[3] = v146;
  v145 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"contentScale", 0);
  v528[4] = v145;
  v144 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"contentScaleMacOS", 0);
  v528[5] = v144;
  v143 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"webAccessOptIn", 0);
  v528[6] = v143;
  v142 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v528[7] = v142;
  v141 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v528[8] = v141;
  v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v528 count:9];
  v139 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"TagSettingsSecure", v140);
  v559[30] = v139;
  v138 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"accessToken", 1);
  v527[0] = v138;
  v137 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"tagID", 1);
  v527[1] = v137;
  v136 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"fontMultiplier", 1);
  v527[2] = v136;
  v135 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"fontMultiplierMacOS", 1);
  v527[3] = v135;
  v134 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"contentScale", 1);
  v527[4] = v134;
  v133 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"contentScaleMacOS", 1);
  v527[5] = v133;
  v132 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"webAccessOptIn", 1);
  v527[6] = v132;
  v131 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v527[7] = v131;
  v130 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v527[8] = v130;
  v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v527 count:9];
  v128 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"TagSettingsSecure2", v129);
  v559[31] = v128;
  v127 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sessionData", 0);
  v526[0] = v127;
  v126 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v526[1] = v126;
  v125 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v526[2] = v125;
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v526 count:3];
  v123 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"UserEventHistorySession", v124);
  v559[32] = v123;
  v122 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sessionData", 1);
  v525[0] = v122;
  v121 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v525[1] = v121;
  v120 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v525[2] = v120;
  v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v525 count:3];
  v118 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"UserEventHistorySessionSecure", v119);
  v559[33] = v118;
  v117 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"feldsparID", 0);
  v524[0] = v117;
  v116 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsUserID", 0);
  v524[1] = v116;
  v115 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"adsUserID", 0);
  v524[2] = v115;
  v114 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"adsUserIDCreatedDate", 0);
  v524[3] = v114;
  v113 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastOpenedDate", 0);
  v524[4] = v113;
  v112 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"finishFirstLaunchVersion", 0);
  v524[5] = v112;
  v111 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"monthlyMeteredCount", 0);
  v524[6] = v111;
  v110 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"totalMeteredCount", 0);
  v524[7] = v110;
  v109 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"meteredCountLastResetDate", 0);
  v524[8] = v109;
  v108 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"monthlyPaidBundleMeteredCount", 0);
  v524[9] = v108;
  v107 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"paidBundleMeteredCountLastResetDate", 0);
  v524[10] = v107;
  v106 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchCount", 0);
  v524[11] = v106;
  v105 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastAppLaunchUpsellInstanceID", 0);
  v524[12] = v105;
  v104 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastSeenDate", 0);
  v524[13] = v104;
  v103 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastShownCampaignID", 0);
  v524[14] = v103;
  v102 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastPresenterBundleID", 0);
  v524[15] = v102;
  v101 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"newsletterSignupLastSeenDate", 0);
  v524[16] = v101;
  v100 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"personalizedNewsletterSignupLastSeenDate", 0);
  v524[17] = v100;
  v99 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"issuesNewsletterOptinLastSeenDate", 0);
  v524[18] = v99;
  v98 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"userStartDate", 0);
  v524[19] = v98;
  v97 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastViewedSavedDate", 0);
  v524[20] = v97;
  v96 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastViewedSharedWithYouDate", 0);
  v524[21] = v96;
  v95 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"topStoriesIntroduced", 0);
  v524[22] = v95;
  v94 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"editorialArticleVersion", 0);
  v524[23] = v94;
  v93 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v524[24] = v93;
  v92 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v524[25] = v92;
  v91 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"marketingNotificationsEnabled", 0);
  v524[26] = v91;
  v90 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"newIssueNotificationsEnabled", 0);
  v524[27] = v90;
  v89 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"endOfAudioNotificationsEnabled", 0);
  v524[28] = v89;
  v88 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsTopicNotificationsEnabledState2", 0);
  v524[29] = v88;
  v87 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"canonicalLanguage", 0);
  v524[30] = v87;
  v86 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"postPurchaseOnboardingLastSeenDate", 0);
  v524[31] = v86;
  v85 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"appReviewRequestLastSeenDate", 0);
  v524[32] = v85;
  v84 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsOnboardingState", 0);
  v524[33] = v84;
  v83 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"shortcutsOnboardingState", 0);
  v524[34] = v83;
  v82 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"shortcutsOnboardingCompletedDate", 0);
  v524[35] = v82;
  v81 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsSyncState", 0);
  v524[36] = v81;
  v80 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsSyncStateLastSavedDate", 0);
  v524[37] = v80;
  v79 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsFavoritesLastModifiedDate", 0);
  v524[38] = v79;
  v78 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsOnboardingCompletedDate", 0);
  v524[39] = v78;
  v77 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsUserID", 0);
  v524[40] = v77;
  v76 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleNotificationsEnabled2", 0);
  v524[41] = v76;
  v75 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleNotificationsLastChangedDate", 0);
  v524[42] = v75;
  v74 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleStatsStartDate", 0);
  v524[43] = v74;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v524 count:44];
  v72 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"UserInfo", v73);
  v559[34] = v72;
  v71 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"feldsparID", 1);
  v523[0] = v71;
  uint64_t v70 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsUserID", 1);
  v523[1] = v70;
  v69 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"adsUserID", 1);
  v523[2] = v69;
  v68 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"adsUserIDCreatedDate", 1);
  v523[3] = v68;
  v67 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastOpenedDate", 0);
  v523[4] = v67;
  v66 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"finishFirstLaunchVersion", 0);
  v523[5] = v66;
  v65 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"monthlyMeteredCount", 0);
  v523[6] = v65;
  v64 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"totalMeteredCount", 0);
  v523[7] = v64;
  v63 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"meteredCountLastResetDate", 0);
  v523[8] = v63;
  v62 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"monthlyPaidBundleMeteredCount", 0);
  v523[9] = v62;
  v61 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"paidBundleMeteredCountLastResetDate", 0);
  v523[10] = v61;
  v60 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchCount", 0);
  v523[11] = v60;
  v59 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastAppLaunchUpsellInstanceID", 0);
  v523[12] = v59;
  v58 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastSeenDate", 1);
  v523[13] = v58;
  v57 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastShownCampaignID", 1);
  v523[14] = v57;
  v56 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastPresenterBundleID", 1);
  v523[15] = v56;
  v55 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"newsletterSignupLastSeenDate", 1);
  v523[16] = v55;
  v54 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"personalizedNewsletterSignupLastSeenDate", 1);
  v523[17] = v54;
  v53 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"issuesNewsletterOptinLastSeenDate", 1);
  v523[18] = v53;
  v52 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"userStartDate", 1);
  v523[19] = v52;
  v51 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastViewedSavedDate", 0);
  v523[20] = v51;
  v50 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastViewedSharedWithYouDate", 0);
  v523[21] = v50;
  v49 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"topStoriesIntroduced", 0);
  v523[22] = v49;
  v48 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"editorialArticleVersion", 0);
  v523[23] = v48;
  v47 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v523[24] = v47;
  v46 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v523[25] = v46;
  v45 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"marketingNotificationsEnabled", 0);
  v523[26] = v45;
  v44 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"newIssueNotificationsEnabled", 0);
  v523[27] = v44;
  v43 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"endOfAudioNotificationsEnabled", 0);
  v523[28] = v43;
  v42 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsTopicNotificationsEnabledState2", 1);
  v523[29] = v42;
  v41 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"canonicalLanguage", 1);
  v523[30] = v41;
  v40 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"postPurchaseOnboardingLastSeenDate", 1);
  v523[31] = v40;
  v39 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"appReviewRequestLastSeenDate", 1);
  v523[32] = v39;
  v38 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsOnboardingState", 0);
  v523[33] = v38;
  v37 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"shortcutsOnboardingState", 0);
  v523[34] = v37;
  v36 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"shortcutsOnboardingCompletedDate", 1);
  v523[35] = v36;
  v35 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsSyncState", 0);
  v523[36] = v35;
  v34 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsSyncStateLastSavedDate", 1);
  v523[37] = v34;
  v33 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsFavoritesLastModifiedDate", 1);
  v523[38] = v33;
  v32 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsOnboardingCompletedDate", 1);
  v523[39] = v32;
  v31 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsUserID", 1);
  v523[40] = v31;
  v30 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleNotificationsEnabled2", 1);
  v523[41] = v30;
  v29 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleNotificationsLastChangedDate", 1);
  v523[42] = v29;
  v28 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleStatsStartDate", 1);
  v523[43] = v28;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v523 count:44];
  v26 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"UserInfoSecure", v27);
  v559[35] = v26;
  v25 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"feldsparID", 1);
  v522[0] = v25;
  v24 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"notificationsUserID", 1);
  v522[1] = v24;
  v23 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"adsUserID", 1);
  v522[2] = v23;
  v22 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"adsUserIDCreatedDate", 1);
  v522[3] = v22;
  v21 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastOpenedDate", 1);
  v522[4] = v21;
  v20 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"finishFirstLaunchVersion", 1);
  v522[5] = v20;
  v19 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"monthlyMeteredCount", 1);
  v522[6] = v19;
  v18 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"totalMeteredCount", 1);
  v522[7] = v18;
  v17 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"meteredCountLastResetDate", 1);
  v522[8] = v17;
  v16 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"monthlyPaidBundleMeteredCount", 1);
  v522[9] = v16;
  v15 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"paidBundleMeteredCountLastResetDate", 1);
  v522[10] = v15;
  v515 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchCount", 1);
  v522[11] = v515;
  v14 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastAppLaunchUpsellInstanceID", 1);
  v522[12] = v14;
  v13 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastSeenDate", 1);
  v522[13] = v13;
  v520 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastShownCampaignID", 1);
  v522[14] = v520;
  v519 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"upsellAppLaunchLastPresenterBundleID", 1);
  v522[15] = v519;
  v518 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"newsletterSignupLastSeenDate", 1);
  v522[16] = v518;
  v517 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"personalizedNewsletterSignupLastSeenDate", 1);
  v522[17] = v517;
  v516 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"issuesNewsletterOptinLastSeenDate", 1);
  v522[18] = v516;
  v507 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"userStartDate", 1);
  v522[19] = v507;
  v514 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastViewedSavedDate", 1);
  v522[20] = v514;
  v513 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"lastViewedSharedWithYouDate", 1);
  v522[21] = v513;
  v512 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"topStoriesIntroduced", 1);
  v522[22] = v512;
  v511 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"editorialArticleVersion", 1);
  v522[23] = v511;
  v11 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 1);
  v522[24] = v11;
  v10 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 1);
  v522[25] = v10;
  v510 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"marketingNotificationsEnabled", 1);
  v522[26] = v510;
  v509 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"newIssueNotificationsEnabled", 1);
  v522[27] = v509;
  v508 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"endOfAudioNotificationsEnabled", 1);
  v522[28] = v508;
  v502 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsTopicNotificationsEnabledState2", 1);
  v522[29] = v502;
  v506 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"canonicalLanguage", 1);
  v522[30] = v506;
  v505 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"postPurchaseOnboardingLastSeenDate", 1);
  v522[31] = v505;
  v504 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"appReviewRequestLastSeenDate", 1);
  v522[32] = v504;
  v503 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsOnboardingState", 1);
  v522[33] = v503;
  v501 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"shortcutsOnboardingState", 1);
  v522[34] = v501;
  v500 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"shortcutsOnboardingCompletedDate", 1);
  v522[35] = v500;
  v499 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsSyncState", 1);
  v522[36] = v499;
  v498 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsSyncStateLastSavedDate", 1);
  v522[37] = v498;
  v494 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsOnboardingCompletedDate", 1);
  v522[38] = v494;
  v12 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsFavoritesLastModifiedDate", 1);
  v522[39] = v12;
  v497 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"sportsUserID", 1);
  v522[40] = v497;
  v496 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleNotificationsEnabled2", 1);
  v522[41] = v496;
  v495 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleNotificationsLastChangedDate", 1);
  v522[42] = v495;
  v0 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"puzzleStatsStartDate", 1);
  v522[43] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v522 count:44];
  v2 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"UserInfoSecure2", v1);
  v559[36] = v2;
  v3 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"writerVersionHighWatermark", 0);
  v521[0] = v3;
  v4 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"readerMinimumRequiredVersion", 0);
  v521[1] = v4;
  v5 = +[FCCKRecordFieldSchema fieldWithName:isEncrypted:]((uint64_t)FCCKRecordFieldSchema, @"subscribedChannelTagIDs", 1);
  v521[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v521 count:3];
  v7 = +[FCCKRecordSchema recordWithType:fields:]((uint64_t)FCCKRecordSchema, @"UserPrivacyExporter", v6);
  v559[37] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v559 count:38];

  return v8;
}

- (void)registerZoneRestorationSources:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 184), a2);
  }
}

- (void)registerZonePruningAssistants:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

- (id)initWithContainerIdentifier:(void *)a3 secureContainerIdentifier:(char)a4 productionEnvironment:(void *)a5 encryptionDelegate:(void *)a6 networkBehaviorMonitor:(char)a7 privateDataSyncingEnabled:
{
  id v13 = a2;
  id v14 = a3;
  v35 = v13;
  v36 = v14;
  if (a1)
  {
    v15 = v14;
    v16 = (objc_class *)MEMORY[0x1E4F81BD0];
    id v34 = a6;
    id v33 = a5;
    id v17 = [v16 alloc];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke;
    v37[3] = &unk_1E5B54888;
    char v40 = a4;
    id v38 = v13;
    id v39 = v15;
    v31 = (void *)[v17 initWithConstructor:v37];
    v18 = +[FCCKPrivateDatabase privateDatabaseSchema]();
    v19 = [MEMORY[0x1E4F1CA48] array];
    v32 = objc_alloc_init(FCCKDatabaseQualityOfServiceUpgradingMiddleware);
    [v19 addObject:v32];
    v29 = -[FCCKDatabaseLoggingMiddleware initAllowingNilDesiredKeys:]([FCCKDatabaseLoggingMiddleware alloc], 1);
    v28 = -[FCCKDatabaseUserAuthenticationMiddleware initWithPrivateDataSyncingEnabled:]([FCCKDatabaseUserAuthenticationMiddleware alloc], a7);
    v20 = objc_alloc_init(FCCKDatabaseRecordVersionMiddleware);
    v30 = objc_alloc_init(FCCKAESSIVRecordNameCipher);
    self;
    v21 = -[FCCKDatabaseEncryptionMiddleware initWithEncryptionSchema:recordNameCipher:]((id *)[FCCKDatabaseEncryptionMiddleware alloc], v18, v30);
    v22 = -[FCCKDatabaseEncryptedZoneMigrator initWithSchema:recordEncryptionMiddleware:deprecatedBlock:]((id *)[FCCKDatabaseEncryptedZoneMigrator alloc], v18, v21, &__block_literal_global_242);
    v23 = -[FCCKDatabaseEncryptionStartUpMiddleware initWithEncryptionMigrator:]((id *)[FCCKDatabaseEncryptionStartUpMiddleware alloc], v22);
    [v19 addObject:v23];
    [v19 addObject:v29];
    [v19 addObject:v28];
    v24 = v20;
    [v19 addObject:v20];
    [v19 addObject:v21];
    v25 = -[FCCKPrivateDatabase initWithCKProperties:schema:middleware:encryptionDelegate:networkBehaviorMonitor:](a1, v31, v18, v19, v33, v34);

    v26 = v25;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)initWithCKProperties:(void *)a3 schema:(void *)a4 middleware:(void *)a5 encryptionDelegate:(void *)a6 networkBehaviorMonitor:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v52.receiver = a1;
  v52.super_class = (Class)FCCKPrivateDatabase;
  id v17 = (id *)objc_msgSendSuper2(&v52, sel_init);
  v18 = v17;
  if (v17)
  {
    id v44 = v16;
    id v46 = v12;
    objc_storeStrong(v17 + 9, a2);
    objc_storeStrong(v18 + 10, a3);
    objc_storeStrong(v18 + 15, a4);
    id v45 = v15;
    objc_storeWeak(v18 + 2, v15);
    objc_storeStrong(v18 + 3, a6);
    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.news.FCCKPrivateDatabase", v19);
    id v21 = v18[11];
    v18[11] = v20;

    id v22 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v23 = v18[12];
    v18[12] = v22;

    [v18[12] setName:@"com.apple.news.FCCKPrivateDatabase.serial"];
    [v18[12] setMaxConcurrentOperationCount:1];
    id v24 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v25 = v18[13];
    v18[13] = v24;

    [v18[13] setName:@"com.apple.news.FCCKPrivateDatabase.highPriority"];
    [v18[13] setMaxConcurrentOperationCount:3];
    id v26 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    id v27 = v18[14];
    v18[14] = v26;

    [v18[14] setName:@"com.apple.news.FCCKPrivateDatabase.noPreflight"];
    [v18[14] setMaxConcurrentOperationCount:-1];
    dispatch_group_t v28 = dispatch_group_create();
    id v29 = v18[19];
    v18[19] = v28;

    dispatch_group_enter((dispatch_group_t)v18[19]);
    id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v32 = v18[15];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if ([v37 conformsToProtocol:&unk_1EF930600]) {
            [v30 addObject:v37];
          }
          if ([v37 conformsToProtocol:&unk_1EF8E48C0]) {
            [v31 addObject:v37];
          }
          if ([v37 conformsToProtocol:&unk_1EF8F1218]) {
            [v47 addObject:v37];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v53 count:16];
      }
      while (v34);
    }

    id v38 = v18[16];
    v18[16] = v30;
    id v39 = v30;

    id v40 = v18[17];
    v18[17] = v31;
    id v41 = v31;

    id v42 = v18[18];
    v18[18] = v47;

    id v12 = v46;
    id v16 = v44;
    id v15 = v45;
  }

  return v18;
}

id *__167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
  [v2 setCaptureResponseHTTPHeaders:1];
  id v21 = v2;
  [v2 setUseZoneWidePCS:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
  [v3 setCaptureResponseHTTPHeaders:1];
  [v3 setUseZoneWidePCS:1];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:*(void *)(a1 + 32) environment:v4];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5 options:v2];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5 options:v3];
  dispatch_queue_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:*(void *)(a1 + 40) environment:v4];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v20 options:v3];
  v9 = (void *)MEMORY[0x1E4F1C978];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke_2;
  v22[3] = &unk_1E5B50288;
  id v23 = v6;
  id v24 = v7;
  id v25 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  id v13 = objc_msgSend(v9, "fc_array:", v22);
  id v14 = [FCCKPrivateDatabaseCKProperties alloc];
  id v15 = [v12 privateCloudDatabase];
  id v16 = [v11 privateCloudDatabase];
  id v17 = [v10 privateCloudDatabase];
  v18 = -[FCCKPrivateDatabaseCKProperties initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:]((id *)&v14->super.isa, v13, v15, v16, v17);

  return v18;
}

void __167__FCCKPrivateDatabase_initWithContainerIdentifier_secureContainerIdentifier_productionEnvironment_encryptionDelegate_networkBehaviorMonitor_privateDataSyncingEnabled___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1[4])
  {
    objc_msgSend(v3, "addObject:");
    id v3 = v4;
  }
  if (a1[5])
  {
    objc_msgSend(v4, "addObject:");
    id v3 = v4;
  }
  if (a1[6])
  {
    objc_msgSend(v4, "addObject:");
    id v3 = v4;
  }
}

- (id)t_initWithContainers:(void *)a3 database:(void *)a4 databaseWithZoneWidePCS:(void *)a5 secureDatabase:(void *)a6 schema:(void *)a7 middleware:(void *)a8 encryptionDelegate:(void *)a9 networkBehaviorMonitor:
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  if (a1)
  {
    dispatch_queue_t v20 = (objc_class *)MEMORY[0x1E4F81BD0];
    id v21 = a9;
    id v22 = a8;
    id v23 = a7;
    id v24 = a6;
    id v25 = [v20 alloc];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __152__FCCKPrivateDatabase_t_initWithContainers_database_databaseWithZoneWidePCS_secureDatabase_schema_middleware_encryptionDelegate_networkBehaviorMonitor___block_invoke;
    v28[3] = &unk_1E5B548B0;
    id v29 = v16;
    id v30 = v17;
    id v31 = v18;
    id v32 = v19;
    id v26 = (void *)[v25 initWithConstructor:v28];
    a1 = -[FCCKPrivateDatabase initWithCKProperties:schema:middleware:encryptionDelegate:networkBehaviorMonitor:](a1, v26, v24, v23, v22, v21);
  }
  return a1;
}

id *__152__FCCKPrivateDatabase_t_initWithContainers_database_databaseWithZoneWidePCS_secureDatabase_schema_middleware_encryptionDelegate_networkBehaviorMonitor___block_invoke(void **a1)
{
  v1 = -[FCCKPrivateDatabaseCKProperties initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:]((id *)[FCCKPrivateDatabaseCKProperties alloc], a1[4], a1[5], a1[6], a1[7]);
  return v1;
}

+ (id)testingDatabase
{
  id v2 = [FCCKPrivateDatabase alloc];
  id v3 = -[FCCKPrivateDatabase t_initWithContainers:database:databaseWithZoneWidePCS:secureDatabase:schema:middleware:encryptionDelegate:networkBehaviorMonitor:]((id *)&v2->super.isa, 0, 0, 0, 0, 0, 0, 0, 0);

  return v3;
}

- (void)addOperation:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    [v3 setDatabase:a1];
    if ([v4 skipPreflight])
    {
      v5 = -[FCCKPrivateDatabase _queueForOperation:]((char *)a1, v4);
      [v5 addOperation:v4];
    }
    else
    {
      uint64_t v6 = [v4 qualityOfService];
      v7 = *(void **)(a1 + 88);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __36__FCCKPrivateDatabase_addOperation___block_invoke;
      v8[3] = &unk_1E5B4E490;
      v8[4] = a1;
      uint64_t v10 = v6;
      id v9 = v4;
      FCDispatchAsyncWithQualityOfService(v7, v6, v8);
    }
  }
}

- (char)_queueForOperation:(char *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 skipPreflight])
    {
      uint64_t v5 = 112;
    }
    else
    {
      uint64_t v6 = [v4 relativePriority];
      uint64_t v5 = 96;
      if (v6 > 0) {
        uint64_t v5 = 104;
      }
    }
    a1 = (char *)*(id *)&a1[v5];
  }

  return a1;
}

void __36__FCCKPrivateDatabase_addOperation___block_invoke(uint64_t a1)
{
  -[FCCKPrivateDatabase _beginInitialStartUpIfNeeded](*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 152);
  }
  else {
    id v3 = 0;
  }
  if (FCDispatchGroupIsEmpty(v3))
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__FCCKPrivateDatabase_addOperation___block_invoke_2;
    block[3] = &unk_1E5B4BE70;
    block[4] = *(void *)(a1 + 32);
    uint64_t v6 = &v17;
    id v17 = v4;
    FCBlockWithQualityOfService(v5, block);
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(void **)(v8 + 152);
      uint64_t v10 = *(void **)(v8 + 88);
    }
    else
    {
      id v9 = 0;
      uint64_t v10 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__FCCKPrivateDatabase_addOperation___block_invoke_3;
    v14[3] = &unk_1E5B4BE70;
    v14[4] = v8;
    uint64_t v6 = &v15;
    uint64_t v11 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    id v12 = v10;
    v7 = v9;
    id v13 = FCBlockWithQualityOfService(v11, v14);
    dispatch_group_notify((dispatch_group_t)v7, v12, v13);
  }
}

- (void)_beginInitialStartUpIfNeeded
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 9))
  {
    uint64_t v2 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 128);
      int v5 = 138412290;
      uint64_t v6 = v3;
      id v4 = v2;
      _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "Starting up with middleware: %@", (uint8_t *)&v5, 0xCu);
    }
    *(unsigned char *)(a1 + 9) = 1;
    -[FCCKPrivateDatabase _continueStartUp](a1);
  }
}

void __36__FCCKPrivateDatabase_addOperation___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    if (v3 == 2) {
      goto LABEL_5;
    }
    if (v3 != 1) {
      goto LABEL_6;
    }
    -[FCCKPrivateDatabase _possiblyRetryStartUp](v2);
    if (*(void *)(a1 + 32))
    {
LABEL_5:
      [*(id *)(a1 + 40) cancel];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
LABEL_6:
  -[FCCKPrivateDatabase _queueForOperation:]((char *)v2, *(void **)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addOperation:*(void *)(a1 + 40)];
}

- (void)_possiblyRetryStartUp
{
  if (!*(unsigned char *)(a1 + 11) && *(void *)(a1 + 160) == 1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
    [v2 timeIntervalSinceDate:*(void *)(a1 + 176)];
    double v4 = v3;

    if (v4 >= fmin(exp2((double)(unint64_t)(*(void *)(a1 + 168) - 1)) * 5.0, 60.0))
    {
      -[FCCKPrivateDatabase _continueStartUp](a1);
    }
  }
}

void __36__FCCKPrivateDatabase_addOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 160);
    if (v3 == 2) {
      goto LABEL_5;
    }
    if (v3 != 1) {
      goto LABEL_6;
    }
    -[FCCKPrivateDatabase _possiblyRetryStartUp](v2);
    if (*(void *)(a1 + 32))
    {
LABEL_5:
      [*(id *)(a1 + 40) cancel];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
LABEL_6:
  -[FCCKPrivateDatabase _queueForOperation:]((char *)v2, *(void **)(a1 + 40));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 addOperation:*(void *)(a1 + 40)];
}

- (id)pruningAssistantForZoneName:(id *)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  dispatch_queue_t v20 = v3;
  if (a1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F1A320];
    id v5 = v3;
    id v6 = [v4 alloc];
    uint64_t v7 = (void *)[v6 initWithZoneName:v5 ownerName:*MEMORY[0x1E4F19C08]];

    uint64_t v8 = -[FCCKPrivateDatabase _serverToClientRecordZoneID:](a1, v7);
    id v9 = [v8 zoneName];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = a1[24];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      a1 = 0;
      id v13 = MEMORY[0x1E4F14500];
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v16 canHelpPruneZoneName:v9])
          {
            if (a1 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v18 = (void *)[[NSString alloc] initWithFormat:@"can't have multiple assistants pruning the same zone"];
              *(_DWORD *)buf = 136315906;
              id v26 = "-[FCCKPrivateDatabase pruningAssistantForZoneName:]";
              __int16 v27 = 2080;
              dispatch_group_t v28 = "FCCKPrivateDatabase.m";
              __int16 v29 = 1024;
              int v30 = 411;
              __int16 v31 = 2114;
              id v32 = v18;
              _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
            }
            id v17 = v16;

            a1 = v17;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v12);
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (void)fetchSecureDatabaseSupportedWithCompletionHandler:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[FCCKPrivateDatabase secureDatabase](a1);
    id v5 = [v4 container];

    if (v5)
    {
      id v6 = -[FCCKPrivateDatabase secureDatabase](a1);
      uint64_t v7 = [v6 container];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __73__FCCKPrivateDatabase_fetchSecureDatabaseSupportedWithCompletionHandler___block_invoke;
      v8[3] = &unk_1E5B548D8;
      id v9 = v3;
      [v7 accountInfoWithCompletionHandler:v8];
    }
    else
    {
      (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
    }
  }
}

- (id)secureDatabase
{
  if (a1)
  {
    id v1 = *(id *)(a1 + 72);
    uint64_t v2 = [v1 value];
    id v3 = (void *)v2;
    if (v2) {
      id v4 = *(void **)(v2 + 24);
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __73__FCCKPrivateDatabase_fetchSecureDatabaseSupportedWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 supportsDeviceToDeviceEncryption], v5);
}

- (void)enumeratePayloadsWithRecordIDs:(void *)a3 records:(void *)a4 zoneIDs:(void *)a5 zones:(uint64_t)a6 options:(void *)a7 payloadHandler:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke;
    aBlock[3] = &unk_1E5B549A0;
    uint64_t v28 = a6;
    aBlock[4] = a1;
    id v23 = v13;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    id v27 = v17;
    id v18 = _Block_copy(aBlock);
    id v19 = (void (**)(void, void, void))v18;
    dispatch_queue_t v20 = (void (*)(void *, uint64_t, void *))*((void *)v18 + 2);
    if ((a6 & 2) != 0)
    {
      v20(v18, 1, &__block_literal_global_68);
      ((void (**)(void, uint64_t, void *))v19)[2](v19, 2, &__block_literal_global_137_0);
      long long v21 = &__block_literal_global_139_0;
    }
    else
    {
      v20(v18, 1, &__block_literal_global_141);
      long long v21 = &__block_literal_global_143;
    }
    ((void (**)(void, uint64_t, void *))v19)[2](v19, 3, v21);
  }
}

void __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke(uint64_t a1, int64_t a2, void *a3)
{
  id v5 = a3;
  char v6 = *(unsigned char *)(a1 + 80);
  char v7 = v6 & 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_2;
  aBlock[3] = &unk_1E5B54900;
  char v36 = v6 & 1;
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v37 = (v6 & 4) != 0;
  aBlock[4] = v8;
  int64_t v24 = a2;
  uint64_t v35 = a2;
  id v9 = v5;
  id v34 = v9;
  id v10 = _Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_3;
  v31[3] = &unk_1E5B54928;
  id v11 = v10;
  id v32 = v11;
  uint64_t v12 = _Block_copy(v31);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_4;
  v28[3] = &unk_1E5B54950;
  char v30 = v7;
  void v28[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v29 = v13;
  id v14 = _Block_copy(v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_5;
  v26[3] = &unk_1E5B54978;
  id v15 = v14;
  id v27 = v15;
  id v16 = _Block_copy(v26);
  id v17 = objc_msgSend(*(id *)(a1 + 40), "fc_arrayOfObjectsPassingTest:", v15);
  id v18 = objc_msgSend(*(id *)(a1 + 48), "fc_arrayOfObjectsPassingTest:", v16);
  id v19 = objc_msgSend(*(id *)(a1 + 56), "fc_arrayOfObjectsPassingTest:", v11);
  id v25 = v12;
  dispatch_queue_t v20 = objc_msgSend(*(id *)(a1 + 64), "fc_arrayOfObjectsPassingTest:", v12);
  if ([v17 count]
    || [v18 count]
    || [v19 count]
    || [v20 count])
  {
    id v21 = v13;
    long long v22 = objc_alloc_init(FCCKPrivateDatabaseCKPayload);
    id v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_recordIDs, v17);
      objc_storeStrong((id *)&v23->_records, v18);
      objc_storeStrong((id *)&v23->_zoneIDs, v19);
      objc_storeStrong((id *)&v23->_zones, v20);
      v23->_destination = v24;
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

    id v13 = v21;
  }
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = v3;
  }
  else
  {
    -[FCCKPrivateDatabase _clientToServerRecordZoneID:](*(id *)(a1 + 32), v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v6 = v5;
  if (*(unsigned char *)(a1 + 57)
    && ([v5 zoneName],
        char v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:*MEMORY[0x1E4F19D88]],
        v7,
        v8))
  {
    uint64_t v9 = *(void *)(a1 + 48) == 3;
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    if (v10) {
      id v10 = (void *)v10[10];
    }
    uint64_t v12 = v10;
    id v13 = [v6 zoneName];
    id v14 = -[FCCKPrivateDatabaseSchema schemaForZoneWithName:](v12, v13);
    uint64_t v9 = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v14);
  }
  return v9;
}

- (id)_clientToServerRecordZoneID:(id)a1
{
  id v2 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v8 = a2;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    id v5 = [v3 arrayWithObjects:&v8 count:1];

    char v6 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](v2, v5, 0);
    objc_msgSend(v6, "firstObject", v8, v9);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 zoneID];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    if (v5)
    {
      id v16 = v3;
      char v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = v3;
      int v8 = [v6 arrayWithObjects:&v16 count:1];

      uint64_t v9 = -[FCCKPrivateDatabase _mapRecordIDs:toClient:](v5, v8, 0);
      objc_msgSend(v9, "firstObject", v16, v17);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  if (v10) {
    id v10 = (void *)v10[10];
  }
  uint64_t v12 = v10;
  id v13 = -[FCCKPrivateDatabaseSchema schemaForZoneContainingRecordID:](v12, v5);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v13);

  return v14;
}

uint64_t __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 recordID];
  uint64_t v4 = (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    if (v2[10]) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = v2[9] == 0;
    }
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = v2 && !v2[10] && v2[9] != 0;

  return v3;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return a2 && *(unsigned char *)(a2 + 10) != 0;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return !a2 || *(unsigned char *)(a2 + 10) == 0;
}

BOOL __99__FCCKPrivateDatabase_enumeratePayloadsWithRecordIDs_records_zoneIDs_zones_options_payloadHandler___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return a2 && *(unsigned char *)(a2 + 10) != 0;
}

- (void)enumerateActiveDestinationsWithOptions:(void *)a3 handler:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v9 = v5;
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    id v5 = v9;
    if (v6 >= 1)
    {
      id v7 = -[FCCKPrivateDatabase secureDatabase](a1);

      if (v7) {
        (*((void (**)(id, uint64_t))v9 + 2))(v9, 3);
      }
      id v5 = v9;
      if ((a2 & 2) != 0)
      {
        int v8 = -[FCCKPrivateDatabase databaseWithZoneWidePCS](a1);

        id v5 = v9;
        if (v8)
        {
          (*((void (**)(id, uint64_t))v9 + 2))(v9, 2);
          id v5 = v9;
        }
      }
    }
  }
}

- (id)databaseWithZoneWidePCS
{
  if (a1)
  {
    id v1 = *(id *)(a1 + 72);
    uint64_t v2 = [v1 value];
    BOOL v3 = (void *)v2;
    if (v2) {
      uint64_t v4 = *(void **)(v2 + 16);
    }
    else {
      uint64_t v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)addCKOperation:(uint64_t)a3 destination:
{
  if (a1)
  {
    id v5 = a2;
    -[FCCKPrivateDatabase _preflightOperation:](a1, v5);
    -[FCCKPrivateDatabase _addCKOperation:destination:]((uint64_t)a1, v5, a3);
  }
}

- (void)_preflightOperation:(void *)a1
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      id v5 = [v4 recordsToSave];
      uint64_t v6 = -[FCCKPrivateDatabase _mapRecords:toClient:]((uint64_t)a1, v5, 0);
      [v4 setRecordsToSave:v6];

      id v7 = [v4 recordIDsToDelete];
      int v8 = -[FCCKPrivateDatabase _mapRecordIDs:toClient:](a1, v7, 0);
      [v4 setRecordIDsToDelete:v8];

      id v9 = [v4 perRecordCompletionBlock];
      if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v38 = (void *)[[NSString alloc] initWithFormat:@"CKModifyRecordsOperation.perRecordCompletionBlock is not supported"];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[FCCKPrivateDatabase _preflightRecordsInModifyOperation:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "FCCKPrivateDatabase.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v52) = 821;
        WORD2(v52) = 2114;
        *(void *)((char *)&v52 + 6) = v38;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      id v10 = [v4 modifyRecordsCompletionBlock];
      uint64_t v11 = v10;
      if (!v10) {
        goto LABEL_15;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __58__FCCKPrivateDatabase__preflightRecordsInModifyOperation___block_invoke;
      *(void *)&long long v52 = &unk_1E5B549E8;
      *((void *)&v52 + 1) = a1;
      id v53 = v10;
      [v4 setModifyRecordsCompletionBlock:buf];
LABEL_14:

LABEL_15:
LABEL_16:

      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      uint64_t v12 = [v4 recordIDs];
      id v13 = -[FCCKPrivateDatabase _mapRecordIDs:toClient:](a1, v12, 0);
      [v4 setRecordIDs:v13];

      id v9 = [v4 perRecordCompletionBlock];
      if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v41 = (void *)[[NSString alloc] initWithFormat:@"CKFetchRecordsOperation.perRecordCompletionBlock is not supported"];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[FCCKPrivateDatabase _preflightRecordsInFetchOperation:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "FCCKPrivateDatabase.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v52) = 922;
        WORD2(v52) = 2114;
        *(void *)((char *)&v52 + 6) = v41;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      uint64_t v14 = [v4 fetchRecordsCompletionBlock];
      uint64_t v11 = v14;
      if (!v14) {
        goto LABEL_15;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke;
      *(void *)&long long v52 = &unk_1E5B4CD48;
      *((void *)&v52 + 1) = a1;
      id v53 = v14;
      [v4 setFetchRecordsCompletionBlock:buf];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      id v15 = [v4 recordZonesToSave];
      id v16 = -[FCCKPrivateDatabase _mapZones:toClient:]((uint64_t)a1, v15, 0);
      [v4 setRecordZonesToSave:v16];

      uint64_t v17 = [v4 recordZoneIDsToDelete];
      id v18 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](a1, v17, 0);
      [v4 setRecordZoneIDsToDelete:v18];

      id v19 = [v4 modifyRecordZonesCompletionBlock];
      id v9 = v19;
      if (!v19) {
        goto LABEL_16;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __63__FCCKPrivateDatabase__preflightZoneIDsInModifyZonesOperation___block_invoke;
      *(void *)&long long v52 = &unk_1E5B549E8;
      *((void *)&v52 + 1) = a1;
      id v53 = v19;
      [v4 setModifyRecordZonesCompletionBlock:buf];
LABEL_24:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      dispatch_queue_t v20 = [v4 recordZoneIDs];
      id v21 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](a1, v20, 0);
      [v4 setRecordZoneIDs:v21];

      long long v22 = [v4 fetchRecordZonesCompletionBlock];
      id v9 = v22;
      if (!v22) {
        goto LABEL_16;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke;
      *(void *)&long long v52 = &unk_1E5B4CD48;
      *((void *)&v52 + 1) = a1;
      id v53 = v22;
      [v4 setFetchRecordZonesCompletionBlock:buf];
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      id v23 = [v4 recordZoneIDs];

      if (v23)
      {
        int64_t v24 = [v4 recordZoneIDs];
        id v25 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](a1, v24, 0);
        [v4 setRecordZoneIDs:v25];
      }
      id v26 = [v4 configurationsByRecordZoneID];

      if (v26)
      {
        id v27 = [v4 configurationsByRecordZoneID];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke;
        v50[3] = &unk_1E5B54A10;
        v50[4] = a1;
        uint64_t v28 = objc_msgSend(v27, "fc_dictionaryByTransformingKeysWithBlock:", v50);
        [v4 setConfigurationsByRecordZoneID:v28];
      }
      id v29 = [v4 recordChangedBlock];
      id v9 = v29;
      if (v29)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_2;
        *(void *)&long long v52 = &unk_1E5B54A38;
        id v30 = v29;
        *((void *)&v52 + 1) = a1;
        id v53 = v30;
        [v4 setRecordChangedBlock:buf];
      }
      __int16 v31 = [v4 recordWithIDWasDeletedBlock];
      uint64_t v11 = v31;
      if (v31)
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_3;
        v48[3] = &unk_1E5B54A60;
        v48[4] = a1;
        id v49 = v31;
        [v4 setRecordWithIDWasDeletedBlock:v48];
      }
      id v32 = [v4 recordZoneChangeTokensUpdatedBlock];
      uint64_t v33 = v32;
      if (v32)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_4;
        v46[3] = &unk_1E5B54A88;
        v46[4] = a1;
        id v47 = v32;
        [v4 setRecordZoneChangeTokensUpdatedBlock:v46];
      }
      id v34 = [v4 recordZoneFetchCompletionBlock];
      uint64_t v35 = v34;
      if (v34)
      {
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_5;
        v44[3] = &unk_1E5B54AB0;
        v44[4] = a1;
        id v45 = v34;
        [v4 setRecordZoneFetchCompletionBlock:v44];
      }
      char v36 = [v4 fetchRecordZoneChangesCompletionBlock];
      BOOL v37 = v36;
      if (v36)
      {
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_6;
        v42[3] = &unk_1E5B4E7A8;
        v42[4] = a1;
        id v43 = v36;
        [v4 setFetchRecordZoneChangesCompletionBlock:v42];
      }
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[FCCKPrivateDatabase _preflightRecordsInDatabaseChangesOperation:]((uint64_t)a1, v3);
      goto LABEL_17;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      id v39 = (void *)[[NSString alloc] initWithFormat:@"can't handle queries on the private database"];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCCKPrivateDatabase _preflightOperation:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCCKPrivateDatabase.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v52) = 797;
      WORD2(v52) = 2114;
      *(void *)((char *)&v52 + 6) = v39;
      id v40 = MEMORY[0x1E4F14500];
LABEL_46:
      _os_log_error_impl(&dword_1A460D000, v40, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v39 = (void *)[[NSString alloc] initWithFormat:@"all CK operations MUST go through database preflight"];
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[FCCKPrivateDatabase _preflightOperation:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "FCCKPrivateDatabase.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v52) = 809;
        WORD2(v52) = 2114;
        *(void *)((char *)&v52 + 6) = v39;
        id v40 = MEMORY[0x1E4F14500];
        goto LABEL_46;
      }
    }
  }
LABEL_17:
}

- (void)_addCKOperation:(uint64_t)a3 destination:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = *(id *)(a1 + 136);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v9;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
          id v21 = v12;
          uint64_t v14 = [v13 database:a1 willEnqueueOperation:v5 error:&v21];
          id v9 = v21;

          if (v14 == 2)
          {
LABEL_24:

            goto LABEL_25;
          }
          if (v14 == 1)
          {

            [v5 cancelWithUnderlyingError:v9];
            goto LABEL_14;
          }
          ++v11;
          uint64_t v12 = v9;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {

      id v9 = 0;
    }
LABEL_14:
    switch(a3)
    {
      case 0:
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          break;
        }
        id v15 = (void *)[[NSString alloc] initWithFormat:@"Case unsupported"];
        *(_DWORD *)buf = 136315906;
        id v27 = "-[FCCKPrivateDatabase _addCKOperation:destination:]";
        __int16 v28 = 2080;
        id v29 = "FCCKPrivateDatabase.m";
        __int16 v30 = 1024;
        int v31 = 759;
        __int16 v32 = 2114;
        uint64_t v33 = v15;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        goto LABEL_20;
      case 1:
        id v17 = *(id *)(a1 + 72);
        uint64_t v18 = [v17 value];
        id v19 = (void *)v18;
        if (v18) {
          dispatch_queue_t v20 = *(void **)(v18 + 8);
        }
        else {
          dispatch_queue_t v20 = 0;
        }
        id v6 = v20;

        [v6 addOperation:v5];
        goto LABEL_24;
      case 2:
        id v16 = -[FCCKPrivateDatabase databaseWithZoneWidePCS](a1);
        goto LABEL_19;
      case 3:
        id v16 = -[FCCKPrivateDatabase secureDatabase](a1);
LABEL_19:
        id v15 = v16;
        [v16 addOperation:v5];
LABEL_20:

        break;
      default:
        break;
    }
LABEL_25:
  }
}

- (void)_continueStartUp
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(unsigned char *)(a1 + 11) = 1;
    if ([*(id *)(a1 + 128) count])
    {
      id v2 = *(id *)(a1 + 128);
      id v3 = [v2 firstObject];

      id v4 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v4;
        *(_DWORD *)buf = 138412290;
        id v12 = (id)objc_opt_class();
        id v6 = v12;
        _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Performing startup for middleware: %@", buf, 0xCu);
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __39__FCCKPrivateDatabase__continueStartUp__block_invoke;
      v8[3] = &unk_1E5B4C808;
      id v9 = v3;
      uint64_t v10 = a1;
      id v7 = v3;
      [v7 performStartUpForDatabase:a1 completion:v8];
    }
    else
    {
      -[FCCKPrivateDatabase _finishStartUpWithError:](a1, 0);
    }
  }
}

- (void)t_performStartUpWithCompletion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__FCCKPrivateDatabase_t_performStartUpWithCompletion___block_invoke;
    block[3] = &unk_1E5B4C018;
    block[4] = a1;
    id v4 = a2;
    dispatch_async(v3, block);
    id v5 = *(void **)(a1 + 152);
    id v6 = *(NSObject **)(a1 + 88);
    id v7 = v5;
    dispatch_group_notify(v7, v6, v4);
  }
}

void __54__FCCKPrivateDatabase_t_performStartUpWithCompletion___block_invoke(uint64_t a1)
{
}

void __39__FCCKPrivateDatabase__continueStartUp__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    *(_DWORD *)buf = 138412546;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    id v16 = v3;
    id v6 = v14;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Finished startup for middleware: %@, result error %@", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    uint64_t v8 = *(void **)(v7 + 88);
  }
  else {
    uint64_t v8 = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__FCCKPrivateDatabase__continueStartUp__block_invoke_145;
  v10[3] = &unk_1E5B4BE70;
  id v11 = v3;
  uint64_t v12 = v7;
  id v9 = v3;
  FCDispatchAsyncWithQualityOfService(v8, 25, v10);
}

void __39__FCCKPrivateDatabase__continueStartUp__block_invoke_145(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3)
  {
    -[FCCKPrivateDatabase _finishStartUpWithError:](v2, v3);
  }
  else
  {
    if (v2) {
      id v4 = *(void **)(v2 + 128);
    }
    else {
      id v4 = 0;
    }
    id v5 = v4;
    id v6 = objc_msgSend(v5, "fc_arrayByRemovingFirstObject");
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      objc_storeStrong((id *)(v7 + 128), v6);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    -[FCCKPrivateDatabase _continueStartUp](v8);
  }
}

- (void)_finishStartUpWithError:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = FCPrivateDataEncryptionLog;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
      {
        id v5 = @"disabled";
        if (*(uint64_t *)(a1 + 40) > 0) {
          id v5 = @"enabled";
        }
        int v13 = 138543618;
        id v14 = v5;
        __int16 v15 = 2114;
        id v16 = v3;
        _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "Private database startup failed with encryption %{public}@, error: %{public}@", (uint8_t *)&v13, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6 <= 0) {
        uint64_t v7 = @"disabled";
      }
      else {
        uint64_t v7 = @"enabled";
      }
      uint64_t v8 = v4;
      id v9 = FCCKPrivateDatabaseVersionString(v6);
      int v13 = 138543618;
      id v14 = v7;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "Private database startup succeeded with encryption %{public}@, version=%{public}@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t started = FCCKDatabaseStartUpResultFromError(v3);
    if (started == 2) {
      -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](v3, @"Private database startup failed with fatal error");
    }
    *(unsigned char *)(a1 + 11) = 0;
    *(void *)(a1 + 160) = started;
    if (!*(unsigned char *)(a1 + 10))
    {
      *(unsigned char *)(a1 + 10) = 1;
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 152));
    }
    if (started)
    {
      ++*(void *)(a1 + 168);
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v11;
    }
  }
}

- (void)_preflightRecordsInDatabaseChangesOperation:(uint64_t)a1
{
  id v3 = a2;
  id v4 = [v3 recordZoneWithIDChangedBlock];
  id v5 = v4;
  if (v4)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke;
    v14[3] = &unk_1E5B54AD8;
    v14[4] = a1;
    id v15 = v4;
    [v3 setRecordZoneWithIDChangedBlock:v14];
  }
  uint64_t v6 = [v3 recordZoneWithIDWasDeletedBlock];
  uint64_t v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_2;
    v12[3] = &unk_1E5B54AD8;
    v12[4] = a1;
    id v13 = v6;
    [v3 setRecordZoneWithIDWasDeletedBlock:v12];
  }
  uint64_t v8 = [v3 fetchDatabaseChangesCompletionBlock];
  id v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_3;
    v10[3] = &unk_1E5B54B00;
    void v10[4] = a1;
    id v11 = v8;
    [v3 setFetchDatabaseChangesCompletionBlock:v10];
  }
}

- (id)_mapRecords:(char)a3 toClient:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if ((a3 & 1) == 0)
    {
      id v7 = v5;
      id v8 = *(id *)(a1 + 80);
      if (v8)
      {
      }
      else if (*(uint64_t *)(a1 + 40) <= 0)
      {
        NSClassFromString(&cfstr_Xctest.isa);
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__FCCKPrivateDatabase__mapRecords_toClient___block_invoke;
    v11[3] = &unk_1E5B54BC8;
    char v12 = a3;
    v11[4] = a1;
    id v9 = -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:](a1, v6, a3, v11);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_mapRecordIDs:(char)a3 toClient:
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__FCCKPrivateDatabase__mapRecordIDs_toClient___block_invoke;
    v5[3] = &unk_1E5B54B78;
    char v6 = a3;
    v5[4] = a1;
    a1 = -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:]((uint64_t)a1, a2, a3, v5);
    uint64_t v3 = vars8;
  }
  return a1;
}

void __58__FCCKPrivateDatabase__preflightRecordsInModifyOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  -[FCCKPrivateDatabase _mapRecords:toClient:](v7, a2, 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[FCCKPrivateDatabase _mapRecordIDs:toClient:](*(void **)(a1 + 32), v9, 1);

  id v11 = -[FCCKPrivateDatabase _serverToClientError:](*(void *)(a1 + 32), v8);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_serverToClientError:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    char v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 domain];
      int v8 = [v7 isEqualToString:*MEMORY[0x1E4F19C40]];

      if (v8)
      {
        id v9 = [v6 userInfo];
        uint64_t v10 = *MEMORY[0x1E4F19CD8];
        id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];
        uint64_t v32 = *MEMORY[0x1E4F19D00];
        uint64_t v12 = objc_msgSend(v9, "objectForKeyedSubscript:");
        uint64_t v33 = *MEMORY[0x1E4F19D10];
        uint64_t v13 = objc_msgSend(v9, "objectForKeyedSubscript:");
        uint64_t v34 = *MEMORY[0x1E4F19D08];
        uint64_t v14 = objc_msgSend(v9, "objectForKeyedSubscript:");
        id v15 = (void *)v14;
        id v16 = (void *)v12;
        if (v11) {
          BOOL v17 = 0;
        }
        else {
          BOOL v17 = v12 == 0;
        }
        uint64_t v18 = (void *)v13;
        if (!v17 || v13 != 0 || v14 != 0)
        {
          id v21 = (void *)[v9 mutableCopy];
          int v31 = v11;
          if (v11)
          {
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __44__FCCKPrivateDatabase__serverToClientError___block_invoke;
            v35[3] = &unk_1E5B54C40;
            v35[4] = a1;
            long long v22 = objc_msgSend(v11, "fc_dictionaryByTransformingKeysWithBlock:", v35);
            [v21 setObject:v22 forKeyedSubscript:v10];
          }
          long long v23 = v21;
          if (v16)
          {
            long long v24 = -[FCCKPrivateDatabase _serverToClientRecord:](a1, v16);
            [v21 setObject:v24 forKeyedSubscript:v32];
          }
          if (v18)
          {
            long long v25 = -[FCCKPrivateDatabase _serverToClientRecord:](a1, v18);
            [v23 setObject:v25 forKeyedSubscript:v33];
          }
          if (v15)
          {
            id v26 = -[FCCKPrivateDatabase _serverToClientRecord:](a1, v15);
            [v23 setObject:v26 forKeyedSubscript:v34];
          }
          id v27 = (void *)MEMORY[0x1E4F28C58];
          __int16 v28 = [v6 domain];
          uint64_t v29 = objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, objc_msgSend(v6, "code"), v23);

          char v6 = (void *)v29;
          id v11 = v31;
        }
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_mapRecordZoneIDs:(char)a3 toClient:
{
  if (a1)
  {
    a1 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:expectUnknownZones:]((uint64_t)a1, a2, a3, 0);
    uint64_t v3 = vars8;
  }
  return a1;
}

id __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke(uint64_t a1, void *a2)
{
  return -[FCCKPrivateDatabase _clientToServerRecordZoneID:](*(id *)(a1 + 32), a2);
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientRecord:](*(void *)(a1 + 32), a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_serverToClientRecord:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    v9[0] = v3;
    char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    uint64_t v7 = -[FCCKPrivateDatabase _mapRecords:toClient:](a1, v6, 1);
    id v5 = [v7 firstObject];
  }
  return v5;
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  char v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  -[FCCKPrivateDatabase _clientRecordID:](v6, v8);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = *(void **)(a1 + 32);
  id v10 = v8;
  if (v9)
  {
    v19[0] = v7;
    id v11 = (void *)MEMORY[0x1E4F1C978];
    id v12 = v7;
    uint64_t v13 = [v11 arrayWithObjects:v19 count:1];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__FCCKPrivateDatabase__serverToClientRecordType_withRecordID___block_invoke;
    v16[3] = &unk_1E5B54C18;
    id v17 = v10;
    uint64_t v18 = v9;
    uint64_t v14 = -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:]((uint64_t)v9, v13, 1, v16);
    id v9 = [v14 firstObject];
  }
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v15, v9);
}

- (id)_clientRecordID:(id)a1
{
  id v2 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v8 = a2;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];

    char v6 = -[FCCKPrivateDatabase _mapRecordIDs:toClient:](v2, v5, 1);
    objc_msgSend(v6, "firstObject", v8, v9);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:](v7, a2);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v10, v9, v8);
}

- (id)_serverToClientRecordZoneID:(id)a1
{
  id v2 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v8 = a2;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];

    uint64_t v6 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](v2, v5, 1);
    objc_msgSend(v6, "firstObject", v8, v9);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v12 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:](v12, a2);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = -[FCCKPrivateDatabase _serverToClientError:](*(void *)(a1 + 32), v13);

  (*(void (**)(uint64_t, id, id, id, uint64_t, void *))(v11 + 16))(v11, v17, v15, v14, a5, v16);
}

void __69__FCCKPrivateDatabase__preflightRecordsInRecordZoneChangesOperation___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientError:](*(void *)(a1 + 32), a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:expectUnknownZones:](*(id *)(a1 + 32), a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_serverToClientRecordZoneID:(id)a1 expectUnknownZones:(void *)a2
{
  id v2 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v8 = a2;
    id v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = a2;
    uint64_t v5 = [v3 arrayWithObjects:&v8 count:1];

    uint64_t v6 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:expectUnknownZones:]((uint64_t)v2, v5, 1, 1);
    objc_msgSend(v6, "firstObject", v8, v9);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:expectUnknownZones:](*(id *)(a1 + 32), a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __67__FCCKPrivateDatabase__preflightRecordsInDatabaseChangesOperation___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a2;
  -[FCCKPrivateDatabase _serverToClientError:](v7, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v8, a3, v9);
}

void __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v7, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke_2;
  v13[3] = &unk_1E5B54B28;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v8;
  id v9 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  id v10 = -[FCCKPrivateDatabase _serverToClientError:](*(void *)(a1 + 32), v6);

  (*(void (**)(void, id, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v9, v10, v11, v12);
}

void __57__FCCKPrivateDatabase__preflightRecordsInFetchOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  -[FCCKPrivateDatabase _clientRecordID:](v5, a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = -[FCCKPrivateDatabase _serverToClientRecord:](*(void *)(a1 + 32), v6);

  if (v9) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v9];
  }
}

void __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = -[FCCKPrivateDatabase _serverToClientError:](*(void *)(a1 + 32), a3);
  if (v5)
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke_2;
    v11[3] = &unk_1E5B54B50;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v7;
    id v8 = v7;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];
    (*(void (**)(void, id, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, v6, v9, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __63__FCCKPrivateDatabase__preflightZonesIDsInFetchZonesOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  -[FCCKPrivateDatabase _serverToClientRecordZoneID:](v5, a2);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  if (v8 && v7)
  {
    v14[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v12 = -[FCCKPrivateDatabase _mapZones:toClient:](v7, v11, 1);
    uint64_t v10 = [v12 firstObject];
  }
  if (v13 && v10) {
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v13];
  }
}

- (id)_mapZones:(char)a3 toClient:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if ((a3 & 1) == 0)
    {
      id v7 = v5;
      id v8 = *(id *)(a1 + 80);
      if (v8)
      {
      }
      else if (*(uint64_t *)(a1 + 40) <= 0)
      {
        NSClassFromString(&cfstr_Xctest.isa);
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__FCCKPrivateDatabase__mapZones_toClient___block_invoke;
    v11[3] = &unk_1E5B54BF0;
    char v12 = a3;
    v11[4] = a1;
    uint64_t v9 = -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:](a1, v6, a3, v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __63__FCCKPrivateDatabase__preflightZoneIDsInModifyZonesOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  -[FCCKPrivateDatabase _mapZones:toClient:](v7, a2, 1);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = -[FCCKPrivateDatabase _mapRecordZoneIDs:toClient:](*(void **)(a1 + 32), v9, 1);

  uint64_t v11 = -[FCCKPrivateDatabase _serverToClientError:](*(void *)(a1 + 32), v8);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __46__FCCKPrivateDatabase__mapRecordIDs_toClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    id v13 = 0;
    uint64_t v7 = [a3 serverToClientRecordID:v5 inDatabase:v6 error:&v13];
    id v8 = v13;
    if (v7) {
      goto LABEL_8;
    }
    id v9 = FCPrivateDataEncryptionLog;
    if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    uint64_t v10 = "Failed to map server record ID %{public}@ to client with error: %{public}@";
    goto LABEL_12;
  }
  id v12 = 0;
  uint64_t v7 = [a3 clientToServerRecordID:v5 inDatabase:v6 error:&v12];
  id v8 = v12;
  if (v7) {
    goto LABEL_8;
  }
  id v9 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    uint64_t v10 = "Failed to map client record ID %{public}@ to server with error: %{public}@";
LABEL_12:
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
  }
LABEL_7:
  uint64_t v7 = 0;
LABEL_8:

  return v7;
}

- (id)_mapObjects:(char)a3 toClient:(void *)a4 withBlock:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = a4;
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  id v24 = *(id *)(a1 + 144);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v6;
  uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v25)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copy", v20);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        if (a3)
        {
          id v10 = [v24 reverseObjectEnumerator];
        }
        else
        {
          id v10 = v24;
        }
        uint64_t v11 = v10;
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v27;
LABEL_11:
          uint64_t v15 = 0;
          __int16 v16 = (void *)v9;
          while (1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
            uint64_t v18 = (void *)MEMORY[0x1A6260FD0]();
            uint64_t v9 = v7[2](v7, v16, v17);

            if (!v9) {
              break;
            }
            ++v15;
            __int16 v16 = (void *)v9;
            if (v13 == v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
              if (v13) {
                goto LABEL_11;
              }

              goto LABEL_19;
            }
          }
        }
        else
        {

          if (!v9) {
            continue;
          }
LABEL_19:
          [v20 addObject:v9];
          uint64_t v11 = (void *)v9;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v25);
  }

  return v20;
}

- (id)_mapRecordZoneIDs:(char)a3 toClient:(char)a4 expectUnknownZones:
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__FCCKPrivateDatabase__mapRecordZoneIDs_toClient_expectUnknownZones___block_invoke;
  v6[3] = &unk_1E5B54BA0;
  char v7 = a3;
  v6[4] = a1;
  char v8 = a4;
  id v4 = -[FCCKPrivateDatabase _mapObjects:toClient:withBlock:](a1, a2, a3, v6);
  return v4;
}

id __69__FCCKPrivateDatabase__mapRecordZoneIDs_toClient_expectUnknownZones___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 zoneName];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F19D88]];

  if (v8)
  {
    id v9 = v5;
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    id v16 = 0;
    id v9 = [v6 serverToClientRecordZoneID:v5 inDatabase:v10 error:&v16];
    id v11 = v16;
    if (v9) {
      goto LABEL_11;
    }
    if (*(unsigned char *)(a1 + 41)) {
      goto LABEL_11;
    }
    uint64_t v12 = FCPrivateDataEncryptionLog;
    if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v11;
    uint64_t v13 = "Failed to map server record zone ID %{public}@ to client with error: %{public}@";
  }
  else
  {
    id v15 = 0;
    id v9 = [v6 clientToServerRecordZoneID:v5 inDatabase:v10 error:&v15];
    id v11 = v15;
    if (v9) {
      goto LABEL_11;
    }
    if (*(unsigned char *)(a1 + 41)) {
      goto LABEL_11;
    }
    uint64_t v12 = FCPrivateDataEncryptionLog;
    if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v11;
    uint64_t v13 = "Failed to map client record zone ID %{public}@ to server with error: %{public}@";
  }
  _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
LABEL_11:

LABEL_12:
  return v9;
}

- (id)_clientToServerRecord:(uint64_t)a1
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  if (a1 && v3)
  {
    v9[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    char v7 = -[FCCKPrivateDatabase _mapRecords:toClient:](a1, v6, 0);
    id v5 = [v7 firstObject];
  }
  return v5;
}

id __44__FCCKPrivateDatabase__mapRecords_toClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    id v13 = 0;
    char v7 = [a3 serverToClientRecord:v5 inDatabase:v6 error:&v13];
    id v8 = v13;
    if (v7) {
      goto LABEL_8;
    }
    id v9 = FCPrivateDataEncryptionLog;
    if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    uint64_t v10 = "Failed to map server record %{public}@ to client with error: %{public}@";
    goto LABEL_12;
  }
  id v12 = 0;
  char v7 = [a3 clientToServerRecord:v5 inDatabase:v6 error:&v12];
  id v8 = v12;
  if (v7) {
    goto LABEL_8;
  }
  id v9 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v5;
    __int16 v16 = 2114;
    id v17 = v8;
    uint64_t v10 = "Failed to map client record %{public}@ to server with error: %{public}@";
LABEL_12:
    _os_log_error_impl(&dword_1A460D000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
  }
LABEL_7:
  char v7 = 0;
LABEL_8:

  return v7;
}

id __42__FCCKPrivateDatabase__mapZones_toClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = [v5 zoneID];
  id v8 = [v7 zoneName];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19D88]];

  if (v9)
  {
    id v10 = v5;
    goto LABEL_10;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    id v17 = 0;
    id v10 = [v6 serverToClientRecordZone:v5 inDatabase:v11 error:&v17];
    id v12 = v17;
    if (v10) {
      goto LABEL_9;
    }
    id v13 = FCPrivateDataEncryptionLog;
    if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543618;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v12;
    uint64_t v14 = "Failed to map server record zone %{public}@ to client with error: %{public}@";
  }
  else
  {
    id v16 = 0;
    id v10 = [v6 clientToServerRecordZone:v5 inDatabase:v11 error:&v16];
    id v12 = v16;
    if (v10) {
      goto LABEL_9;
    }
    id v13 = FCPrivateDataEncryptionLog;
    if (!os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543618;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v12;
    uint64_t v14 = "Failed to map client record zone %{public}@ to server with error: %{public}@";
  }
  _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
LABEL_9:

LABEL_10:
  return v10;
}

id __62__FCCKPrivateDatabase__serverToClientRecordType_withRecordID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = 0;
  id v8 = [a3 serverToClientRecordType:v5 withRecordID:v6 inDatabase:v7 error:&v13];
  id v9 = v13;
  if (!v8)
  {
    id v10 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v15 = v5;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      id v19 = v9;
      _os_log_error_impl(&dword_1A460D000, v10, OS_LOG_TYPE_ERROR, "Failed to map server record type %{public}@ and ID %{public}@ to client with error: %{public}@", buf, 0x20u);
    }
  }

  return v8;
}

id __44__FCCKPrivateDatabase__serverToClientError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[FCCKPrivateDatabase _clientRecordID:](*(id *)(a1 + 32), v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[FCCKPrivateDatabase _serverToClientRecordZoneID:](*(id *)(a1 + 32), v3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = v3;
    }
  }
  id v5 = v4;

  return v5;
}

- (void)zoneIDsUsingSecureContainer
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    id v3 = (id *)v1[10];
    uint64_t v4 = v1[5];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __50__FCCKPrivateDatabase_zoneIDsUsingSecureContainer__block_invoke;
    id v10 = &unk_1E5B54C68;
    id v11 = v2;
    uint64_t v12 = v1;
    id v5 = v2;
    -[FCCKPrivateDatabaseSchema enumerateZoneSchemasForVersion:withBlock:](v3, v4, &v7);
    id v1 = objc_msgSend(v5, "allObjects", v7, v8, v9, v10);
  }
  return v1;
}

void __50__FCCKPrivateDatabase_zoneIDsUsingSecureContainer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *((unsigned char *)v3 + 10))
  {
    id v19 = v3;
    id v4 = objc_alloc(MEMORY[0x1E4F1A320]);
    id v5 = v19[2];
    uint64_t v6 = *MEMORY[0x1E4F19C08];
    uint64_t v7 = (void *)[v4 initWithZoneName:v5 ownerName:*MEMORY[0x1E4F19C08]];

    uint64_t v8 = [v7 zoneName];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F19D88]];

    if (v9)
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
    else
    {
      uint64_t v10 = *(void *)(a1 + 40);
      if (v10) {
        id v11 = *(FCCKRecordZoneIDMapping **)(v10 + 80);
      }
      else {
        id v11 = 0;
      }
      uint64_t v12 = -[FCCKPrivateDatabaseSchema mappingFromRecordZoneID:toVersion:](v11, v7, 0);
      id v13 = objc_alloc(MEMORY[0x1E4F1A320]);
      uint64_t v14 = [v12 toZoneSchema];
      id v15 = (void *)v14;
      if (v14) {
        __int16 v16 = *(void **)(v14 + 16);
      }
      else {
        __int16 v16 = 0;
      }
      id v17 = v16;
      __int16 v18 = (void *)[v13 initWithZoneName:v17 ownerName:v6];

      [*(id *)(a1 + 32) addObject:v18];
    }

    id v3 = v19;
  }
}

- (void)takeDatabaseOfflineDueToError:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v8 = v3;
      _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "Taking database offline due to error: %{public}@", buf, 0xCu);
    }
    id v5 = *(NSObject **)(a1 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__FCCKPrivateDatabase_takeDatabaseOfflineDueToError___block_invoke;
    block[3] = &unk_1E5B4C018;
    block[4] = a1;
    dispatch_sync(v5, block);
  }
}

uint64_t __53__FCCKPrivateDatabase_takeDatabaseOfflineDueToError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 96);
  }
  else {
    id v3 = 0;
  }
  [v3 cancelAllOperations];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 104);
  }
  else {
    id v5 = 0;
  }
  uint64_t result = [v5 cancelAllOperations];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    *(void *)(v7 + 160) = 2;
  }
  return result;
}

- (void)reportRecoverableStartUpError:(uint64_t)a1
{
  if (a1) {
    -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](a2, @"Private database startup failed with recoverable error");
  }
}

- (void)_possiblySimulateCrashForError:(void *)a1 message:(void *)a2
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (NFInternalBuild())
  {
    id v5 = NewsCoreUserDefaults();
    if (([v5 BOOLForKey:@"disable_simulated_crashes_for_encryption"] & 1) != 0
      || NSClassFromString(&cfstr_Xctest.isa))
    {
    }
    else
    {
      char v6 = FCShouldErrorBeExcludedFromSimulatedCrashes(v3);

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = FCPrivateDataEncryptionCrashLog;
        if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionCrashLog, OS_LOG_TYPE_INFO))
        {
          int v8 = 138543618;
          id v9 = v4;
          __int16 v10 = 2114;
          id v11 = v3;
          _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
          uint64_t v7 = FCPrivateDataEncryptionCrashLog;
        }
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          int v8 = 138543618;
          id v9 = v4;
          __int16 v10 = 2114;
          id v11 = v3;
          _os_log_fault_impl(&dword_1A460D000, v7, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@", (uint8_t *)&v8, 0x16u);
        }
      }
    }
  }
}

- (void)reportEncryptionMigrationError:(uint64_t)a1
{
  if (a1) {
    -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](a2, @"Private database encryption migration failed with error");
  }
}

- (void)reportPostMigrationCleanupError:(uint64_t)a1
{
  if (a1) {
    -[FCCKPrivateDatabase _possiblySimulateCrashForError:message:](a2, @"Private database encryption data cleanup failed with error");
  }
}

uint64_t __64__FCCKPrivateDatabase__privateDatabaseDeprecatedRecordTestBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 recordType];
  int v4 = [v3 isEqualToString:@"Subscription"];

  if (v4)
  {
    id v5 = [v2 objectForKeyedSubscript:@"subscriptionType"];
    uint64_t v6 = [v5 isEqualToString:@"pending"];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v2 recordType];
  int v8 = [v7 isEqualToString:@"ReadingHistoryItem"];

  if (v8)
  {
    id v9 = [v2 objectForKeyedSubscript:@"articleID"];

    if (v9) {
      uint64_t v6 = v6;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  __int16 v10 = [v2 recordType];
  int v11 = [v10 isEqualToString:@"ReadingListEntry"];

  if (v11)
  {
    uint64_t v12 = [v2 recordID];
    id v13 = [v12 recordName];
    int v14 = [v13 containsString:@"http"];

    uint64_t v6 = v14 | v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zonePruningAssistants, 0);
  objc_storeStrong((id *)&self->_zoneRestorationSources, 0);
  objc_storeStrong((id *)&self->_dateOfLastFailedStartUpAttempt, 0);
  objc_storeStrong((id *)&self->_initialStartUpGroup, 0);
  objc_storeStrong((id *)&self->_recordMiddleware, 0);
  objc_storeStrong((id *)&self->_operationMiddleware, 0);
  objc_storeStrong((id *)&self->_remainingStartUpMiddleware, 0);
  objc_storeStrong((id *)&self->_middleware, 0);
  objc_storeStrong((id *)&self->_noPreflightOperationQueue, 0);
  objc_storeStrong((id *)&self->_highPriorityOperationQueue, 0);
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_ckProperties, 0);
  objc_storeStrong((id *)&self->_sentinelRecord, 0);
  objc_storeStrong((id *)&self->_secureEncryptionKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_destroyWeak((id *)&self->_encryptionDelegate);
}

- (void)fetchAllDatabaseChangesWithServerChangeToken:(id)a3 qualityOfService:(int64_t)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = objc_alloc_init(FCCKPrivateFetchDatabaseChangesOperation);
    [(FCCKPrivateFetchDatabaseChangesOperation *)v13 setPreviousServerChangeToken:v10];
    [(FCOperation *)v13 setQualityOfService:a4];
    if (a4 == 9) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = a4 == 33 || a4 == 25;
    }
    [(FCOperation *)v13 setRelativePriority:v14];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke;
    v16[3] = &unk_1E5B55CC8;
    void v16[4] = self;
    int64_t v20 = a4;
    id v17 = v11;
    id v19 = v12;
    id v18 = v10;
    [(FCCKPrivateFetchDatabaseChangesOperation *)v13 setFetchDatabaseChangesCompletionBlock:v16];
    -[FCCKPrivateDatabase addOperation:]((uint64_t)self, v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v22 = "-[FCCKPrivateDatabase(Additions) fetchAllDatabaseChangesWithServerChangeToken:qualityOfService:completionQueue"
          ":completionHandler:]";
    __int16 v23 = 2080;
    id v24 = "FCCKPrivateDatabase+Additions.m";
    __int16 v25 = 1024;
    int v26 = 25;
    __int16 v27 = 2114;
    long long v28 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

void __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = v14;
  if (v14)
  {
    int v16 = objc_msgSend(v14, "fc_isCKErrorWithCode:", 21);
    id v17 = FCCloudKitLog;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v17, OS_LOG_TYPE_DEFAULT, "Database changes server change token expired, resetting the token and trying again", buf, 2u);
      }
      [*(id *)(a1 + 32) fetchAllDatabaseChangesWithServerChangeToken:0 qualityOfService:*(void *)(a1 + 64) completionQueue:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 56)];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v36 = v15;
        _os_log_error_impl(&dword_1A460D000, v17, OS_LOG_TYPE_ERROR, "Error fetching database changes: %{public}@", buf, 0xCu);
      }
      uint64_t v22 = *(void **)(a1 + 56);
      if (v22)
      {
        __int16 v23 = *(NSObject **)(a1 + 40);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_4;
        block[3] = &unk_1E5B4CA88;
        id v34 = v22;
        dispatch_async(v23, block);
      }
    }
    goto LABEL_20;
  }
  id v18 = FCCloudKitLog;
  if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    uint64_t v36 = v19;
    _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_DEFAULT, "Fetched database changes with serverChangeToken: %@", buf, 0xCu);
  }
  if (!v11)
  {
    int64_t v20 = 0;
    if (v12) {
      goto LABEL_10;
    }
LABEL_16:
    id v21 = 0;
    goto LABEL_17;
  }
  int64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  if (!v12) {
    goto LABEL_16;
  }
LABEL_10:
  id v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
LABEL_17:
  id v24 = *(void **)(a1 + 56);
  if (v24)
  {
    __int16 v25 = *(NSObject **)(a1 + 40);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_7;
    v26[3] = &unk_1E5B55CA0;
    id v31 = v24;
    id v27 = 0;
    id v28 = v20;
    id v29 = v21;
    id v30 = v13;
    char v32 = a5;
    dispatch_async(v25, v26);
  }
LABEL_20:
}

uint64_t __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __130__FCCKPrivateDatabase_Additions__fetchAllDatabaseChangesWithServerChangeToken_qualityOfService_completionQueue_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL, void, void, void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 32) == 0, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 72));
}

- (void)fetchChangesForRecordZoneID:(id)a3 changeToken:(id)a4 desiredKeys:(id)a5 fetchAllChanges:(BOOL)a6 qualityOfService:(int64_t)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = v17;
  if (v17)
  {
    if (v14)
    {
      id v19 = objc_alloc_init(FCCKPrivateFetchRecordZoneChangesOperation);
      [(FCCKPrivateDatabaseOperation *)v19 setDatabase:self];
      [(FCCKPrivateFetchRecordZoneChangesOperation *)v19 setRecordZoneID:v14];
      [(FCCKPrivateFetchRecordZoneChangesOperation *)v19 setPreviousServerChangeToken:v15];
      [(FCCKPrivateFetchRecordZoneChangesOperation *)v19 setDesiredKeys:v16];
      [(FCCKPrivateFetchRecordZoneChangesOperation *)v19 setFetchAllChanges:v10];
      [(FCOperation *)v19 setQualityOfService:a7];
      if (a7 == 9) {
        uint64_t v20 = -1;
      }
      else {
        uint64_t v20 = a7 == 33 || a7 == 25;
      }
      [(FCOperation *)v19 setRelativePriority:v20];
      [(FCCKPrivateFetchRecordZoneChangesOperation *)v19 setFetchNewestChangesFirst:1];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __137__FCCKPrivateDatabase_Additions__fetchChangesForRecordZoneID_changeToken_desiredKeys_fetchAllChanges_qualityOfService_completionHandler___block_invoke;
      v22[3] = &unk_1E5B55CF0;
      id v23 = v15;
      id v24 = self;
      id v25 = v14;
      BOOL v29 = v10;
      id v26 = v16;
      int64_t v28 = a7;
      id v27 = v18;
      [(FCCKPrivateFetchRecordZoneChangesOperation *)v19 setFetchRecordZoneChangesCompletionBlock:v22];
      -[FCCKPrivateDatabase addOperation:]((uint64_t)self, v19);
    }
    else
    {
      (*((void (**)(id, void, void, void, void, void, void))v17 + 2))(v17, 0, 0, 0, 0, 0, 0);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCCKPrivateDatabase(Additions) fetchChangesForRecordZoneID:changeToken:desiredKeys:fetchAllChanges:qualityOf"
          "Service:completionHandler:]";
    __int16 v32 = 2080;
    long long v33 = "FCCKPrivateDatabase+Additions.m";
    __int16 v34 = 1024;
    int v35 = 77;
    __int16 v36 = 2114;
    uint64_t v37 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

void __137__FCCKPrivateDatabase_Additions__fetchChangesForRecordZoneID_changeToken_desiredKeys_fetchAllChanges_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  if (objc_msgSend(a6, "fc_isCKErrorWithCode:", 21))
  {
    if (!*(void *)(a1 + 32) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v14 = (void *)[[NSString alloc] initWithFormat:@"how did a nil change token expire?"];
      int v15 = 136315906;
      id v16 = "-[FCCKPrivateDatabase(Additions) fetchChangesForRecordZoneID:changeToken:desiredKeys:fetchAllChanges:quality"
            "OfService:completionHandler:]_block_invoke";
      __int16 v17 = 2080;
      id v18 = "FCCKPrivateDatabase+Additions.m";
      __int16 v19 = 1024;
      int v20 = 101;
      __int16 v21 = 2114;
      uint64_t v22 = v14;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v15, 0x26u);
    }
    [*(id *)(a1 + 40) fetchChangesForRecordZoneID:*(void *)(a1 + 48) changeToken:0 desiredKeys:*(void *)(a1 + 56) fetchAllChanges:*(unsigned __int8 *)(a1 + 80) qualityOfService:*(void *)(a1 + 72) completionHandler:*(void *)(a1 + 64)];
  }
  else
  {
    (*(void (**)(void, BOOL, id, id, void, id, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), a6 == 0, v11, v12, 0, v13, a5);
  }
}

@end