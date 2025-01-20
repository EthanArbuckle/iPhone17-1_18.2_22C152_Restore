@interface PLAccountingOperator
+ (id)entryAggregateDefinitionEnergy;
+ (id)entryAggregateDefinitionQualificationEnergy;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionDistributionEvents;
+ (id)entryEventBackwardDefinitionPowerEvents;
+ (id)entryEventBackwardDefinitionQualificationEvents;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionDistributionEvents;
+ (id)entryEventForwardDefinitionPowerEvents;
+ (id)entryEventForwardDefinitionQualificationEvents;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionDistributionEvents;
+ (id)entryEventIntervalDefinitionEnergyEstimateEvents;
+ (id)entryEventIntervalDefinitionPowerEvents;
+ (id)entryEventIntervalDefinitionQualificationEvents;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionDistributionRules;
+ (id)entryEventNoneDefinitionNodes;
+ (id)entryEventNoneDefinitionQualificationRules;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionDistributionEvents;
+ (id)entryEventPointDefinitionQualificationEvents;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSMutableDictionary)ruleIDToPendingJobs;
- (NSSet)rules;
- (PLAccountingOperator)init;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (void)initOperatorDependancies;
- (void)setRuleIDToPendingJobs:(id)a3;
- (void)setRules:(id)a3;
- (void)startAccounting;
@end

@implementation PLAccountingOperator

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingOperator;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Nodes";
  objc_super v2 = [(id)objc_opt_class() entryEventNoneDefinitionNodes];
  v8[0] = v2;
  v7[1] = @"DistributionRules";
  v3 = [(id)objc_opt_class() entryEventNoneDefinitionDistributionRules];
  v8[1] = v3;
  v7[2] = @"QualificationRules";
  v4 = [(id)objc_opt_class() entryEventNoneDefinitionQualificationRules];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)entryEventNoneDefinitionNodes
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Configs";
  v12[0] = @"SchemaVersion";
  v12[1] = @"TrimConditionsTemplate";
  v13[0] = &unk_1F1584BA0;
  v13[1] = &unk_1F1580CC0;
  v12[2] = @"AppIdentifierKeys";
  v13[2] = MEMORY[0x1E4F1CC38];
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v15[0] = v2;
  v14[1] = @"Keys";
  v10[0] = @"Name";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat_withBundleID");
  v10[1] = @"IsPermanent";
  v11[0] = v4;
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventNoneDefinitionDistributionRules
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Configs";
  v14[0] = @"SchemaVersion";
  v14[1] = @"TrimConditionsTemplate";
  v15[0] = &unk_1F1584BB0;
  v15[1] = &unk_1F1580CC0;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[0] = v2;
  v16[1] = @"Keys";
  v12[0] = @"NodeID";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"RootNodeID";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  v12[2] = @"DistributionID";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventNoneDefinitionQualificationRules
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Configs";
  v12[0] = @"SchemaVersion";
  v12[1] = @"TrimConditionsTemplate";
  v13[0] = &unk_1F1584BB0;
  v13[1] = &unk_1F1580CC0;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v15[0] = v2;
  v14[1] = @"Keys";
  v10[0] = @"RootNodeID";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"QualificationID";
  v11[0] = v4;
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"PowerEvents";
  objc_super v2 = [(id)objc_opt_class() entryEventForwardDefinitionPowerEvents];
  v8[0] = v2;
  v7[1] = @"DistributionEvents";
  v3 = [(id)objc_opt_class() entryEventForwardDefinitionDistributionEvents];
  v8[1] = v3;
  v7[2] = @"QualificationEvents";
  v4 = [(id)objc_opt_class() entryEventForwardDefinitionQualificationEvents];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)entryEventForwardDefinitionPowerEvents
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"Configs";
  v16[0] = @"SchemaVersion";
  v16[1] = @"SQLPrepareStatementCaching";
  v17[0] = &unk_1F1584BC0;
  v17[1] = MEMORY[0x1E4F1CC38];
  void v16[2] = @"SubEntryKey";
  v17[2] = @"RootNodeID";
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v19[0] = v2;
  v18[1] = @"Keys";
  v14[0] = @"RootNodeID";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v15[0] = v4;
  v14[1] = @"Power";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v15[1] = v6;
  void v14[2] = @"StartOffset";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v15[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v9;
  v18[2] = @"IndexKeys";
  v13 = @"RootNodeID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v19[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  return v11;
}

+ (id)entryEventForwardDefinitionDistributionEvents
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"DynamicDefinition";
  v25[0] = &unk_1F1584BC0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SQLPrepareStatementCaching";
  v24[3] = @"SubEntryKey";
  v25[2] = MEMORY[0x1E4F1CC38];
  v25[3] = @"DistributionID";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v16;
  v26[1] = @"Keys";
  v22[0] = @"DistributionID";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[1] = @"StartOffset";
  v23[0] = v14;
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v23[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v3;
  v26[2] = @"DynamicKeys";
  v20[0] = @"key";
  v18 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"value";
  v21[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v9;
  v26[3] = @"IndexKeys";
  v17[0] = @"DistributionID";
  v17[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v11;
}

+ (id)entryEventForwardDefinitionQualificationEvents
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"DynamicDefinition";
  v25[0] = &unk_1F1584BC0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SQLPrepareStatementCaching";
  v24[3] = @"SubEntryKey";
  v25[2] = MEMORY[0x1E4F1CC38];
  v25[3] = @"QualificationID";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v16;
  v26[1] = @"Keys";
  v22[0] = @"QualificationID";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[1] = @"StartOffset";
  v23[0] = v14;
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v23[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v3;
  v26[2] = @"DynamicKeys";
  v20[0] = @"key";
  v18 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"value";
  v21[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v9;
  v26[3] = @"IndexKeys";
  v17[0] = @"QualificationID";
  v17[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"PowerEvents";
  objc_super v2 = [(id)objc_opt_class() entryEventBackwardDefinitionPowerEvents];
  v8[0] = v2;
  v7[1] = @"DistributionEvents";
  v3 = [(id)objc_opt_class() entryEventBackwardDefinitionDistributionEvents];
  v8[1] = v3;
  v7[2] = @"QualificationEvents";
  v4 = [(id)objc_opt_class() entryEventBackwardDefinitionQualificationEvents];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)entryEventBackwardDefinitionPowerEvents
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v18[0] = @"Configs";
  v16[0] = @"SchemaVersion";
  v16[1] = @"SQLPrepareStatementCaching";
  v17[0] = &unk_1F1584BC0;
  v17[1] = MEMORY[0x1E4F1CC38];
  void v16[2] = @"SubEntryKey";
  void v17[2] = @"RootNodeID";
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v19[0] = v2;
  v18[1] = @"Keys";
  v14[0] = @"RootNodeID";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v15[0] = v4;
  v14[1] = @"Power";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v15[1] = v6;
  void v14[2] = @"EndOffset";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v15[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v9;
  v18[2] = @"IndexKeys";
  v13 = @"RootNodeID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v19[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

  return v11;
}

+ (id)entryEventBackwardDefinitionDistributionEvents
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"DynamicDefinition";
  v25[0] = &unk_1F1584BC0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SQLPrepareStatementCaching";
  v24[3] = @"SubEntryKey";
  v25[2] = MEMORY[0x1E4F1CC38];
  v25[3] = @"DistributionID";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v16;
  v26[1] = @"Keys";
  v22[0] = @"DistributionID";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[1] = @"EndOffset";
  v23[0] = v14;
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v23[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v3;
  v26[2] = @"DynamicKeys";
  v20[0] = @"key";
  v18 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"value";
  v21[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v9;
  v26[3] = @"IndexKeys";
  v17[0] = @"DistributionID";
  v17[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v11;
}

+ (id)entryEventBackwardDefinitionQualificationEvents
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"DynamicDefinition";
  v25[0] = &unk_1F1584BC0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SQLPrepareStatementCaching";
  v24[3] = @"SubEntryKey";
  v25[2] = MEMORY[0x1E4F1CC38];
  v25[3] = @"QualificationID";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v16;
  v26[1] = @"Keys";
  v22[0] = @"QualificationID";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[1] = @"EndOffset";
  v23[0] = v14;
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v23[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v3;
  v26[2] = @"DynamicKeys";
  v20[0] = @"key";
  v18 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"value";
  v21[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v9;
  v26[3] = @"IndexKeys";
  v17[0] = @"QualificationID";
  v17[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v11;
}

+ (id)entryEventIntervalDefinitions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"PowerEvents";
  objc_super v2 = [(id)objc_opt_class() entryEventIntervalDefinitionPowerEvents];
  v9[0] = v2;
  v8[1] = @"EnergyEstimateEvents";
  v3 = [(id)objc_opt_class() entryEventIntervalDefinitionEnergyEstimateEvents];
  v9[1] = v3;
  v8[2] = @"DistributionEvents";
  v4 = [(id)objc_opt_class() entryEventIntervalDefinitionDistributionEvents];
  v9[2] = v4;
  v8[3] = @"QualificationEvents";
  v5 = [(id)objc_opt_class() entryEventIntervalDefinitionQualificationEvents];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)entryEventIntervalDefinitionPowerEvents
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v20[0] = @"Configs";
  v18[0] = @"SchemaVersion";
  v18[1] = @"SQLPrepareStatementCaching";
  v19[0] = &unk_1F1584BC0;
  v19[1] = MEMORY[0x1E4F1CC38];
  v18[2] = @"SubEntryKey";
  v19[2] = @"RootNodeID";
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
  v21[0] = v14;
  v20[1] = @"Keys";
  v16[0] = @"RootNodeID";
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v17[0] = v2;
  v16[1] = @"Power";
  v3 = +[PLEntryDefinition sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v17[1] = v4;
  void v16[2] = @"StartOffset";
  v5 = +[PLEntryDefinition sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v17[2] = v6;
  void v16[3] = @"EndOffset";
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v17[3] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v21[1] = v9;
  void v20[2] = @"IndexKeys";
  v15 = @"RootNodeID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  void v21[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v11;
}

+ (id)entryEventIntervalDefinitionEnergyEstimateEvents
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"SQLPrepareStatementCaching";
  v25[0] = &unk_1F1584BD0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SubEntryKey";
  v25[2] = @"NodeID";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v26[1] = @"Keys";
  v27[0] = v21;
  v22[0] = @"NodeID";
  v20 = +[PLEntryDefinition sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v23[0] = v19;
  v22[1] = @"RootNodeID";
  v18 = +[PLEntryDefinition sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v23[1] = v17;
  void v22[2] = @"ParentEntryID";
  v16 = +[PLEntryDefinition sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  void v23[2] = v15;
  v22[3] = @"Energy";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v23[3] = v13;
  v22[4] = @"CorrectionEnergy";
  objc_super v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v23[4] = v3;
  v22[5] = @"TerminationRatio";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[5] = v5;
  v22[6] = @"StartOffset";
  v6 = +[PLEntryDefinition sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v23[6] = v7;
  v22[7] = @"EndOffset";
  v8 = +[PLEntryDefinition sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[7] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];
  v27[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v11;
}

+ (id)entryEventIntervalDefinitionDistributionEvents
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28[0] = @"Configs";
  v26[0] = @"SchemaVersion";
  v26[1] = @"DynamicDefinition";
  v27[0] = &unk_1F1584BC0;
  v27[1] = MEMORY[0x1E4F1CC38];
  void v26[2] = @"SQLPrepareStatementCaching";
  v26[3] = @"SubEntryKey";
  v27[2] = MEMORY[0x1E4F1CC38];
  v27[3] = @"DistributionID";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v18;
  v28[1] = @"Keys";
  v24[0] = @"DistributionID";
  v17 = +[PLEntryDefinition sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v25[0] = v16;
  v24[1] = @"StartOffset";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v25[1] = v14;
  v24[2] = @"EndOffset";
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v25[2] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v29[1] = v3;
  v28[2] = @"DynamicKeys";
  v22[0] = @"key";
  v20 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v21 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v22[1] = @"value";
  v23[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v23[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v29[2] = v9;
  v28[3] = @"IndexKeys";
  v19[0] = @"DistributionID";
  v19[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v29[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  return v11;
}

+ (id)entryEventIntervalDefinitionQualificationEvents
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v28[0] = @"Configs";
  v26[0] = @"SchemaVersion";
  v26[1] = @"DynamicDefinition";
  v27[0] = &unk_1F1584BC0;
  v27[1] = MEMORY[0x1E4F1CC38];
  void v26[2] = @"SQLPrepareStatementCaching";
  v26[3] = @"SubEntryKey";
  v27[2] = MEMORY[0x1E4F1CC38];
  v27[3] = @"QualificationID";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v18;
  v28[1] = @"Keys";
  v24[0] = @"QualificationID";
  v17 = +[PLEntryDefinition sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v25[0] = v16;
  v24[1] = @"StartOffset";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v25[1] = v14;
  v24[2] = @"EndOffset";
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v25[2] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];
  v29[1] = v3;
  v28[2] = @"DynamicKeys";
  v22[0] = @"key";
  v20 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v21 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v22[1] = @"value";
  v23[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v23[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v29[2] = v9;
  v28[3] = @"IndexKeys";
  v19[0] = @"QualificationID";
  v19[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v29[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  return v11;
}

+ (id)entryEventPointDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"DistributionEvents";
  objc_super v2 = [(id)objc_opt_class() entryEventPointDefinitionDistributionEvents];
  v6[1] = @"QualificationEvents";
  v7[0] = v2;
  v3 = [(id)objc_opt_class() entryEventPointDefinitionQualificationEvents];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventPointDefinitionDistributionEvents
{
  void v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"DynamicDefinition";
  v25[0] = &unk_1F1584BC0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SQLPrepareStatementCaching";
  void v24[3] = @"SubEntryKey";
  v25[2] = MEMORY[0x1E4F1CC38];
  void v25[3] = @"DistributionID";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v16;
  v26[1] = @"Keys";
  v22[0] = @"DistributionID";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[1] = @"StartOffset";
  v23[0] = v14;
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v23[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v3;
  void v26[2] = @"DynamicKeys";
  v20[0] = @"key";
  v18 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"value";
  v21[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v9;
  v26[3] = @"IndexKeys";
  v17[0] = @"DistributionID";
  v17[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v11;
}

+ (id)entryEventPointDefinitionQualificationEvents
{
  void v27[4] = *MEMORY[0x1E4F143B8];
  v26[0] = @"Configs";
  v24[0] = @"SchemaVersion";
  v24[1] = @"DynamicDefinition";
  v25[0] = &unk_1F1584BC0;
  v25[1] = MEMORY[0x1E4F1CC38];
  v24[2] = @"SQLPrepareStatementCaching";
  void v24[3] = @"SubEntryKey";
  v25[2] = MEMORY[0x1E4F1CC38];
  void v25[3] = @"QualificationID";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v16;
  v26[1] = @"Keys";
  v22[0] = @"QualificationID";
  v15 = +[PLEntryDefinition sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[1] = @"StartOffset";
  v23[0] = v14;
  v13 = +[PLEntryDefinition sharedInstance];
  objc_super v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v23[1] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v27[1] = v3;
  void v26[2] = @"DynamicKeys";
  v20[0] = @"key";
  v18 = @"ChildNodeID";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v20[1] = @"value";
  v21[0] = v6;
  v7 = +[PLEntryDefinition sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v27[2] = v9;
  v26[3] = @"IndexKeys";
  v17[0] = @"QualificationID";
  v17[1] = @"FK_ID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v27[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];

  return v11;
}

+ (id)entryAggregateDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"RootNodeEnergy";
  v3 = [a1 entryAggregateDefinitionEnergy];
  v7[1] = @"QualificationEnergy";
  v8[0] = v3;
  v4 = [a1 entryAggregateDefinitionQualificationEnergy];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryAggregateDefinitionEnergy
{
  void v28[4] = *MEMORY[0x1E4F143B8];
  v27[0] = @"Configs";
  v25[0] = @"SchemaVersion";
  v25[1] = @"AggregateWallClockBucket";
  v26[0] = &unk_1F1584BC0;
  v26[1] = MEMORY[0x1E4F1CC38];
  v25[2] = @"SQLPrepareStatementCaching";
  void v25[3] = @"TrimConditionsTemplate";
  void v26[2] = MEMORY[0x1E4F1CC38];
  v26[3] = &unk_1F1580CC0;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  v28[0] = v15;
  v27[1] = @"Keys";
  v23[0] = @"NodeID";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v24[0] = v13;
  v23[1] = @"RootNodeID";
  objc_super v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v24[1] = v3;
  void v23[2] = @"Energy";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v24[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v28[1] = v6;
  v27[2] = @"AggregateBuckets";
  v21[0] = &unk_1F1584BE0;
  v19 = @"AggregateBucketRetainDuration";
  v20 = &unk_1F1584BF0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v21[1] = &unk_1F1584C00;
  v22[0] = v7;
  v17 = @"AggregateBucketRetainDuration";
  v18 = &unk_1F1584C10;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v22[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v28[2] = v9;
  v27[3] = @"AggregateKeys";
  v16 = @"Energy";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v28[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];

  return v11;
}

+ (id)entryAggregateDefinitionQualificationEnergy
{
  v30[4] = *MEMORY[0x1E4F143B8];
  v29[0] = @"Configs";
  v27[0] = @"SchemaVersion";
  v27[1] = @"AggregateWallClockBucket";
  v28[0] = &unk_1F1584BC0;
  v28[1] = MEMORY[0x1E4F1CC38];
  v27[2] = @"SQLPrepareStatementCaching";
  v27[3] = @"TrimConditionsTemplate";
  v28[2] = MEMORY[0x1E4F1CC38];
  v28[3] = &unk_1F1580CC0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  v30[0] = v17;
  v29[1] = @"Keys";
  v25[0] = @"NodeID";
  v16 = +[PLEntryDefinition sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v26[0] = v15;
  v25[1] = @"RootNodeID";
  v14 = +[PLEntryDefinition sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v26[1] = v13;
  v25[2] = @"QualificationID";
  objc_super v2 = +[PLEntryDefinition sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  void v26[2] = v3;
  void v25[3] = @"Energy";
  v4 = +[PLEntryDefinition sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v26[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];
  v30[1] = v6;
  v29[2] = @"AggregateBuckets";
  v23[0] = &unk_1F1584BE0;
  v21 = @"AggregateBucketRetainDuration";
  v22 = &unk_1F1584BF0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v23[1] = &unk_1F1584C00;
  v24[0] = v7;
  v19 = @"AggregateBucketRetainDuration";
  v20 = &unk_1F1584C10;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v24[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v30[2] = v9;
  v29[3] = @"AggregateKeys";
  v18 = @"Energy";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v30[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];

  return v11;
}

- (PLAccountingOperator)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLAccountingOperator;
  return [(PLOperator *)&v3 init];
}

- (void)initOperatorDependancies
{
}

- (void)startAccounting
{
  +[PLEntryKey setupEntryObjectsForOperatorClass:objc_opt_class()];
  id v3 = +[PowerlogCore sharedCore];
  objc_super v2 = [v3 storage];
  [v2 setupStorageForOperatorClass:objc_opt_class()];
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v4 = a3;
  v5 = +[PLOperator entryKeyForType:@"EventNone" andName:@"Nodes"];
  int v6 = [v4 isEqualToString:v5];

  v7 = +[PLOperator entryKeyForType:@"Aggregate" andName:@"RootNodeEnergy"];
  if (v6)
  {
    [NSString stringWithFormat:@"(ID > %i) AND (%@ = 0) AND (ID NOT IN (SELECT %@ FROM '%@'))", 10000, @"IsPermanent", @"NodeID", v7];
    v8 = LABEL_3:;
LABEL_7:

    goto LABEL_8;
  }
  int v9 = [v4 isEqualToString:v7];

  if (v9
    || (+[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", @"Aggregate", @"QualificationEnergy"), v10 = objc_claimAutoreleasedReturnValue(), int v11 = [v4 isEqualToString:v10], v10, v11))
  {
    v12 = NSString;
    v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v13 = [v7 dateByAddingTimeInterval:-1209600.0];
    [v13 timeIntervalSince1970];
    uint64_t v15 = v14;
    v16 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v17 = [v16 dateByAddingTimeInterval:-1209600.0];
    [v17 timeIntervalSince1970];
    uint64_t v19 = v18;
    v20 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v21 = [v20 dateByAddingTimeInterval:-2592000.0];
    [v21 timeIntervalSince1970];
    v8 = objc_msgSend(v12, "stringWithFormat:", @"(timeInterval = %f AND timestamp < %f) OR (timeInterval = %f AND Energy < %f AND timestamp < %f) OR (timeInterval = %f AND timestamp < %f)", 0x40AC200000000000, v15, 0x40F5180000000000, 0x40F86A0000000000, v19, 0x40F5180000000000, v22);

    goto LABEL_7;
  }
  v24 = +[PLOperator entryKeyForType:@"EventNone" andName:@"DistributionRules"];
  int v25 = [v4 isEqualToString:v24];

  if (v25
    || (+[PLOperator entryKeyForType:andName:](PLAccountingOperator, "entryKeyForType:andName:", @"EventNone", @"QualificationRules"), v26 = objc_claimAutoreleasedReturnValue(), int v27 = [v4 isEqualToString:v26], v26, v27))
  {
    v28 = NSString;
    v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v7 timeIntervalSince1970];
    objc_msgSend(v28, "stringWithFormat:", @"timestamp<%f", v29, v30, v31, v32);
    goto LABEL_3;
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (NSSet)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (NSMutableDictionary)ruleIDToPendingJobs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRuleIDToPendingJobs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleIDToPendingJobs, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

@end