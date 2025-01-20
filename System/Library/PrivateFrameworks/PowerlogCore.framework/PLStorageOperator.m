@interface PLStorageOperator
+ (id)entryEventForwardDefinitionActivityStates;
+ (id)entryEventForwardDefinitionConfiguration;
+ (id)entryEventForwardDefinitionSchemaChange;
+ (id)entryEventForwardDefinitionSubmissionTag;
+ (id)entryEventForwardDefinitionTaskingMode;
+ (id)entryEventForwardDefinitionTimeOffset;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionCacheSize;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionActivity;
+ (id)entryEventNoneDefinitionAdditionalTablesTurnedOn;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionArchive;
+ (id)entryEventPointDefinitionCacheFlush;
+ (id)entryEventPointDefinitionOTA;
+ (id)entryEventPointDefinitionPLLog;
+ (id)entryEventPointDefinitionTimeCorrection;
+ (id)entryEventPointDefinitions;
+ (id)eventIntervalCacheSizeWithPayload:(id)a3 withEntryDate:(id)a4;
+ (id)eventPointCacheFlushWithPayload:(id)a3;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (void)logEventForwardConfiguration:(id)a3;
- (void)logEventForwardSchemaChange:(id)a3;
- (void)logEventForwardTaskingMode:(id)a3;
- (void)logEventForwardTimeOffset:(id)a3;
- (void)logEventNoneAdditionalTablesTurnedOn:(id)a3;
- (void)logEventPointArchive:(id)a3;
- (void)logEventPointCacheFlush:(id)a3;
- (void)logEventPointOTA:(id)a3;
- (void)logEventPointPLLog:(id)a3;
- (void)logEventPointPreUnlock:(id)a3;
- (void)logEventPointTimeCorrection:(id)a3;
@end

@implementation PLStorageOperator

+ (id)entryEventIntervalDefinitions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([a1 isDebugEnabledForKey:@"LogCacheSize"])
  {
    v6 = @"CacheSize";
    v3 = [a1 entryEventIntervalDefinitionCacheSize];
    v7[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

+ (id)entryEventIntervalDefinitionCacheSize
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v24[0] = @"Configs";
  v22[0] = @"SchemaVersion";
  v22[1] = @"OnDemandQuery";
  v23[0] = &unk_1F1584B10;
  v23[1] = MEMORY[0x1E4F1CC28];
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v25[0] = v19;
  v24[1] = @"Keys";
  v20[0] = @"timestampEnd";
  v18 = +[PLEntryDefinition sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v21[0] = v17;
  v20[1] = @"EntryKey";
  v16 = +[PLEntryDefinition sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v21[1] = v15;
  v20[2] = @"InsertCount";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v21[2] = v13;
  v20[3] = @"UpdateCount";
  v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v21[3] = v3;
  v20[4] = @"State";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v21[4] = v5;
  v20[5] = @"WarningCount";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v21[5] = v7;
  v20[6] = @"SafetyDropCount";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v21[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v11;
}

+ (id)entryEventPointDefinitions
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"OTA";
  v3 = [a1 entryEventPointDefinitionOTA];
  v11[0] = v3;
  v10[1] = @"TimeCorrection";
  v4 = [a1 entryEventPointDefinitionTimeCorrection];
  v11[1] = v4;
  v10[2] = @"Archive";
  v5 = [a1 entryEventPointDefinitionArchive];
  v11[2] = v5;
  v10[3] = @"PLLog";
  v6 = [a1 entryEventPointDefinitionPLLog];
  v11[3] = v6;
  v10[4] = @"CacheFlush";
  v7 = [a1 entryEventPointDefinitionCacheFlush];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)entryEventPointDefinitionCacheFlush
{
  v25[3] = *MEMORY[0x1E4F143B8];
  if (+[PLPlatform isiOS]
    && +[PLPlatform internalBuild])
  {
    v24[0] = @"Configs";
    v22[0] = @"SchemaVersion";
    v22[1] = @"OnDemandQuery";
    v23[0] = &unk_1F1584B20;
    v23[1] = MEMORY[0x1E4F1CC28];
    void v22[2] = @"DynamicDefinition";
    void v23[2] = MEMORY[0x1E4F1CC38];
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    v25[0] = v15;
    v24[1] = @"Keys";
    v20[0] = @"Reason";
    v14 = +[PLEntryDefinition sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
    v20[1] = @"Size";
    v21[0] = v13;
    v2 = +[PLEntryDefinition sharedInstance];
    v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v21[1] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v25[1] = v4;
    void v24[2] = @"DynamicKeys";
    v18[0] = @"key";
    v16 = @"TableName";
    v5 = +[PLEntryDefinition sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    v17 = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v18[1] = @"value";
    v19[0] = v7;
    v8 = +[PLEntryDefinition sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v19[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    v25[2] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventPointDefinitionOTA
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Configs";
  v14[0] = @"SchemaVersion";
  v14[1] = @"OnDemandQuery";
  v15[0] = &unk_1F1584B30;
  v15[1] = MEMORY[0x1E4F1CC28];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[0] = v2;
  v16[1] = @"Keys";
  v12[0] = @"Type";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v13[0] = v4;
  v12[1] = @"Name";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v13[1] = v6;
  v12[2] = @"Success";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointDefinitionTimeCorrection
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = @"Configs";
  v16[0] = @"SchemaVersion";
  v16[1] = @"OnDemandQuery";
  v17[0] = &unk_1F1584B10;
  v17[1] = MEMORY[0x1E4F1CC28];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v13;
  v18[1] = @"Keys";
  v14[0] = @"TimeReferenceType";
  v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"TimeInReference";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v15[1] = v5;
  void v14[2] = @"ProjectedTimeInMonotonic";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  void v15[2] = v7;
  v14[3] = @"CallStack";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionArchive
{
  v33[2] = *MEMORY[0x1E4F143B8];
  v32[0] = @"Configs";
  v30[0] = @"SchemaVersion";
  v30[1] = @"OnDemandQuery";
  v31[0] = &unk_1F1584B40;
  v31[1] = MEMORY[0x1E4F1CC28];
  v30[2] = @"TrimConditionsTemplate";
  v30[3] = @"TrimConditionsTemplateArg";
  v31[2] = &unk_1F1580C60;
  v31[3] = &unk_1F1584B50;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
  v33[0] = v27;
  v32[1] = @"Keys";
  v28[0] = @"StartDate";
  v26 = +[PLEntryDefinition sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_DateFormat");
  v29[0] = v25;
  v28[1] = @"EndDate";
  v24 = +[PLEntryDefinition sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_DateFormat");
  v29[1] = v23;
  v28[2] = @"SystemTimeOffset";
  v22 = +[PLEntryDefinition sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
  v29[2] = v21;
  v28[3] = @"SystemTimeOffsetModified";
  v20 = +[PLEntryDefinition sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v29[3] = v19;
  v28[4] = @"UUID";
  v18 = +[PLEntryDefinition sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v29[4] = v17;
  v28[5] = @"FullMode";
  v16 = +[PLEntryDefinition sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v29[5] = v15;
  v28[6] = @"Stage";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v29[6] = v13;
  v28[7] = @"NumAttempts";
  v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v29[7] = v3;
  v28[8] = @"SyncedOffDate";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v29[8] = v5;
  v28[9] = @"RemovedDate";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_DateFormat");
  v29[9] = v7;
  v28[10] = @"MainDBSizeAtStart";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v29[10] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:11];
  v33[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionPLLog
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = @"Configs";
  v16[0] = @"SchemaVersion";
  v16[1] = @"OnDemandQuery";
  v17[0] = &unk_1F1584B60;
  v17[1] = MEMORY[0x1E4F1CC28];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v13;
  v18[1] = @"Keys";
  v14[0] = @"file";
  v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v15[0] = v3;
  v14[1] = @"function";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v15[1] = v5;
  void v14[2] = @"line";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  void v15[2] = v7;
  v14[3] = @"message";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitions
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"SchemaChange";
  v3 = [a1 entryEventForwardDefinitionSchemaChange];
  v12[0] = v3;
  v11[1] = @"Configuration";
  v4 = [a1 entryEventForwardDefinitionConfiguration];
  v12[1] = v4;
  v11[2] = @"TimeOffset";
  v5 = [a1 entryEventForwardDefinitionTimeOffset];
  v12[2] = v5;
  v11[3] = @"ActivityStates";
  v6 = [a1 entryEventForwardDefinitionActivityStates];
  void v12[3] = v6;
  v11[4] = @"TaskingMode";
  v7 = [a1 entryEventForwardDefinitionTaskingMode];
  v12[4] = v7;
  v11[5] = @"SubmissionTag";
  v8 = [a1 entryEventForwardDefinitionSubmissionTag];
  v12[5] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

+ (id)entryEventForwardDefinitionConfiguration
{
  void v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = @"Configs";
  v20[0] = @"SchemaVersion";
  v20[1] = @"OnDemandQuery";
  v21[0] = &unk_1F1584B70;
  v21[1] = MEMORY[0x1E4F1CC28];
  void v20[2] = @"TrimConditionsTemplate";
  v20[3] = @"TrimConditionsTemplateArg";
  void v21[2] = &unk_1F1580C60;
  v21[3] = &unk_1F1584B80;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  v23[0] = v17;
  v22[1] = @"Keys";
  v18[0] = @"Mode";
  v16 = +[PLEntryDefinition sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v19[0] = v15;
  v18[1] = @"Version";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_RealFormat");
  v19[1] = v13;
  void v18[2] = @"PID";
  v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  void v19[2] = v3;
  v18[3] = @"ProcessName";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  void v19[3] = v5;
  v18[4] = @"ExitReason";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[4] = v7;
  v18[5] = @"DefaultsEnabled";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v19[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionSchemaChange
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Configs";
  v14[0] = @"SchemaVersion";
  v14[1] = @"OnDemandQuery";
  v15[0] = &unk_1F1584B90;
  v15[1] = MEMORY[0x1E4F1CC28];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[0] = v2;
  v16[1] = @"Keys";
  v12[0] = @"TableName";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v13[0] = v4;
  v12[1] = @"PreviousVersion";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v13[1] = v6;
  v12[2] = @"CurrentVersion";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitionTimeOffset
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Configs";
  v14[0] = @"SchemaVersion";
  v14[1] = @"OnDemandQuery";
  v15[0] = &unk_1F1584B10;
  v15[1] = MEMORY[0x1E4F1CC28];
  void v14[2] = @"TrimConditionsTemplate";
  v14[3] = @"TrimConditionsTemplateArg";
  void v15[2] = &unk_1F1580C60;
  v15[3] = &unk_1F1584B80;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v17[0] = v2;
  v16[1] = @"Keys";
  v12[0] = @"kernel";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v13[0] = v4;
  v12[1] = @"system";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v13[1] = v6;
  v12[2] = @"baseband";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitionActivityStates
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Configs";
  v12[0] = @"SchemaVersion";
  v12[1] = @"OnDemandQuery";
  v13[0] = &unk_1F1584B90;
  v13[1] = MEMORY[0x1E4F1CC28];
  v12[2] = @"TrimConditionsTemplate";
  void v12[3] = @"TrimConditionsTemplateArg";
  v13[2] = &unk_1F1580C60;
  void v13[3] = &unk_1F1584B80;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  v15[0] = v2;
  v14[1] = @"Keys";
  v10[0] = @"ActivityID";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"State";
  v11[0] = v4;
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitionTaskingMode
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Configs";
  v14[0] = @"SchemaVersion";
  v14[1] = @"OnDemandQuery";
  v15[0] = &unk_1F1584B60;
  v15[1] = MEMORY[0x1E4F1CC28];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[0] = v2;
  v16[1] = @"Keys";
  v12[0] = @"Action";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"ErrorType";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  v12[2] = @"TaskingTablesPayload";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitionSubmissionTag
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Configs";
  v12[0] = @"SchemaVersion";
  v12[1] = @"TrimConditionsTemplate";
  v13[0] = &unk_1F1584B60;
  v13[1] = &unk_1F1580C78;
  v12[2] = @"TrimConditionsTemplateArg";
  v13[2] = &unk_1F1580C90;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v15[0] = v2;
  v14[1] = @"Keys";
  v10[0] = @"UUIDTag";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v10[1] = @"Reason";
  v11[0] = v4;
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventNoneDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Activity";
  v3 = [a1 entryEventNoneDefinitionActivity];
  v7[1] = @"AdditionalTablesTurnedOn";
  v8[0] = v3;
  v4 = [a1 entryEventNoneDefinitionAdditionalTablesTurnedOn];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventNoneDefinitionActivity
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Configs";
  v14[0] = @"SchemaVersion";
  v14[1] = @"OnDemandQuery";
  v15[0] = &unk_1F1584B10;
  v15[1] = MEMORY[0x1E4F1CC28];
  void v14[2] = @"TrimConditionsTemplate";
  void v15[2] = &unk_1F1580CA8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v17[0] = v2;
  v16[1] = @"Keys";
  v12[0] = @"Identifier";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v13[0] = v4;
  v12[1] = @"Criteria";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v13[1] = v6;
  v12[2] = @"MustRunCriterion";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventNoneDefinitionAdditionalTablesTurnedOn
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"Configs";
  v10[0] = @"SchemaVersion";
  v10[1] = @"OnDemandQuery";
  v11[0] = &unk_1F1584B10;
  v11[1] = MEMORY[0x1E4F1CC28];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v13[0] = v2;
  v12[1] = @"Keys";
  v8 = @"TableName";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)eventIntervalCacheSizeWithPayload:(id)a3 withEntryDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() entryKeyForType:@"EventInterval" andName:@"CacheSize"];
  v8 = [[PLEntry alloc] initWithEntryKey:v7 withDate:v5];

  [(PLEntry *)v8 setObjectsFromRawData:v6];
  return v8;
}

+ (id)eventPointCacheFlushWithPayload:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v25 = [(id)objc_opt_class() entryKeyForType:@"EventPoint" andName:@"CacheFlush"];
  v3 = [[PLEntry alloc] initWithEntryKey:v25];
  v4 = [v26 objectForKeyedSubscript:@"Reason"];
  [(PLEntry *)v3 setObject:v4 forKeyedSubscript:@"Reason"];

  id v5 = [v26 objectForKeyedSubscript:@"Size"];
  [(PLEntry *)v3 setObject:v5 forKeyedSubscript:@"Size"];

  if (_os_feature_enabled_impl())
  {
    id v6 = +[PLStorageCache sharedStorageCache];
    v7 = [v6 cacheContent];
    v8 = (void *)[v7 copy];

    v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[PLStorageOperator eventPointCacheFlushWithPayload:]((uint64_t)v8, v9);
    }

    v10 = +[PLStorageCache sharedStorageCache];
    id obj = [v10 cacheContent];

    objc_sync_enter(obj);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v16 = [v11 objectForKeyedSubscript:v15];
          BOOL v17 = (int)[v16 intValue] > 50;

          if (v17)
          {
            v18 = PLLogCommon();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v34 = v15;
              _os_log_debug_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEBUG, "Flush cache cacheContent tableEntry: %@", buf, 0xCu);
            }

            v31 = @"TableName";
            uint64_t v32 = v15;
            v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            v20 = [v11 objectForKeyedSubscript:v15];
            [(PLEntry *)v3 setObject:v20 forKeyedSubscript:v19];
          }
          else
          {
            v19 = PLLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v34 = v15;
              _os_log_debug_impl(&dword_1BBD2F000, v19, OS_LOG_TYPE_DEBUG, "Flush cache cacheContent tableEntry's size is less than 50: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v12);
    }

    v21 = +[PLStorageCache sharedStorageCache];
    v22 = [v21 cacheContent];
    [v22 removeAllObjects];

    objc_sync_exit(obj);
  }

  return v3;
}

- (void)logEventPointCacheFlush:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __45__PLStorageOperator_logEventPointCacheFlush___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__PLStorageOperator_logEventPointCacheFlush___block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() eventPointCacheFlushWithPayload:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventPointOTA:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __38__PLStorageOperator_logEventPointOTA___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__PLStorageOperator_logEventPointOTA___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventPoint" andName:@"OTA"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventPointTimeCorrection:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __49__PLStorageOperator_logEventPointTimeCorrection___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__PLStorageOperator_logEventPointTimeCorrection___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventPoint" andName:@"TimeCorrection"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventPointArchive:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __42__PLStorageOperator_logEventPointArchive___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __42__PLStorageOperator_logEventPointArchive___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventPoint" andName:@"Archive"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventPointPLLog:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __40__PLStorageOperator_logEventPointPLLog___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__PLStorageOperator_logEventPointPLLog___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventPoint" andName:@"PLLog"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventForwardConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __50__PLStorageOperator_logEventForwardConfiguration___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__PLStorageOperator_logEventForwardConfiguration___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventForward" andName:@"Configuration"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventForwardSchemaChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __49__PLStorageOperator_logEventForwardSchemaChange___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__PLStorageOperator_logEventForwardSchemaChange___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventForward" andName:@"SchemaChange"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventForwardTimeOffset:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __47__PLStorageOperator_logEventForwardTimeOffset___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __47__PLStorageOperator_logEventForwardTimeOffset___block_invoke(uint64_t a1)
{
  id v12 = [(id)objc_opt_class() entryKeyForType:@"EventForward" andName:@"TimeOffset"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v12 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [(PLEntry *)v2 entryDate];
  [v3 logForSubsystem:@"PPTStorageOperator" category:@"TimeOffset" data:v4 date:v5];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [(PLEntry *)v2 entryDate];
  [v6 logForSubsystem:@"XcodeMetrics" category:@"TimeOffset" data:v7 date:v8];

  v10 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = [(PLEntry *)v2 entryDate];
  [v10 logForSubsystem:@"BackgroundProcessing" category:@"TimeOffset" data:v9 date:v11];
}

- (void)logEventForwardTaskingMode:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __48__PLStorageOperator_logEventForwardTaskingMode___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__PLStorageOperator_logEventForwardTaskingMode___block_invoke(uint64_t a1)
{
  id v3 = [(id)objc_opt_class() entryKeyForType:@"EventForward" andName:@"TaskingMode"];
  id v2 = [[PLEntry alloc] initWithEntryKey:v3 withRawData:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) logEntry:v2];
}

- (void)logEventNoneAdditionalTablesTurnedOn:(id)a3
{
  id v4 = a3;
  id v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __58__PLStorageOperator_logEventNoneAdditionalTablesTurnedOn___block_invoke;
  v7[3] = &unk_1E62539B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__PLStorageOperator_logEventNoneAdditionalTablesTurnedOn___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)objc_opt_class() entryKeyForType:@"EventNone" andName:@"AdditionalTablesTurnedOn"];
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v13 = a1;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
        v10 = [[PLEntry alloc] initWithEntryKey:v2];
        [(PLEntry *)v10 setObject:v9 forKeyedSubscript:@"TableName"];
        [v3 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  id v11 = *(void **)(v13 + 32);
  v18 = v2;
  v19 = v3;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v11 logEntries:v12 withGroupID:v2];
}

- (void)logEventPointPreUnlock:(id)a3
{
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:@"EventNone" andName:@"Activity"];
  uint64_t v6 = +[PLOperator entryKeyForType:@"EventForward" andName:@"ActivityStates"];
  int v7 = [v4 isEqualToString:v5];

  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"ID NOT IN (SELECT %@ FROM %@)", @"ActivityID", v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (void)eventPointCacheFlushWithPayload:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "Flush cache cacheContent:%@", (uint8_t *)&v2, 0xCu);
}

@end