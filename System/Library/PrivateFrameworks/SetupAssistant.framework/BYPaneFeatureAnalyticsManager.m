@interface BYPaneFeatureAnalyticsManager
+ (id)_featuresForPane:(int64_t)a3;
+ (id)_nameForFeature:(int64_t)a3;
- (BOOL)_isFeatureForPaneIncludedInExpress:(int64_t)a3;
- (BYAnalyticsManager)analyticsManager;
- (BYExpressSetupDataSource)expressDataSource;
- (BYFlowItemDispositionProvider)flowItemDispositionProvider;
- (BYPaneFeatureAnalyticsManager)initWithAnalyticsManager:(id)a3 runState:(id)a4 host:(id)a5 flowItemDispositionProvider:(id)a6;
- (BYRunState)runState;
- (NSSet)expressSetupFeatures;
- (NSString)host;
- (id)_isValueDifferentFromExpressForFeature:(int64_t)a3 value:(id)a4;
- (void)clearActionForFeature:(int64_t)a3;
- (void)recordActionWithValue:(id)a3 forFeature:(int64_t)a4;
- (void)recordActionWithValue:(id)a3 previousValue:(id)a4 forFeature:(int64_t)a5;
- (void)setAnalyticsManager:(id)a3;
- (void)setExpressDataSource:(id)a3;
- (void)setExpressDataSource:(id)a3 features:(id)a4;
- (void)setExpressSetupFeatures:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setHost:(id)a3;
- (void)setRunState:(id)a3;
@end

@implementation BYPaneFeatureAnalyticsManager

- (BYPaneFeatureAnalyticsManager)initWithAnalyticsManager:(id)a3 runState:(id)a4 host:(id)a5 flowItemDispositionProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BYPaneFeatureAnalyticsManager;
  v15 = [(BYPaneFeatureAnalyticsManager *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_analyticsManager, a3);
    objc_storeStrong((id *)&v16->_runState, a4);
    objc_storeStrong((id *)&v16->_host, a5);
    objc_storeStrong((id *)&v16->_flowItemDispositionProvider, a6);
  }

  return v16;
}

- (void)recordActionWithValue:(id)a3 forFeature:(int64_t)a4
{
}

- (void)recordActionWithValue:(id)a3 previousValue:(id)a4 forFeature:(int64_t)a5
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CA60];
  id v24 = v8;
  v25[0] = @"feature";
  id v10 = a3;
  v23 = [(id)objc_opt_class() _nameForFeature:a5];
  v26[0] = v23;
  v26[1] = v10;
  v25[1] = @"value";
  v25[2] = @"differsFromExpress";
  id v11 = [(BYPaneFeatureAnalyticsManager *)self _isValueDifferentFromExpressForFeature:a5 value:v10];
  v26[2] = v11;
  v25[3] = @"hasCompletedInitialSetup";
  id v12 = NSNumber;
  id v13 = [(BYPaneFeatureAnalyticsManager *)self runState];
  id v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "hasCompletedInitialRun"));
  v26[3] = v14;
  v25[4] = @"host";
  v15 = [(BYPaneFeatureAnalyticsManager *)self host];
  v26[4] = v15;
  v25[5] = @"disposition";
  v16 = [(BYPaneFeatureAnalyticsManager *)self flowItemDispositionProvider];
  v17 = BYStringForFlowItemDispositions([v16 dispositions]);
  v26[5] = v17;
  objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];
  v19 = [v9 dictionaryWithDictionary:v18];

  if (v24)
  {
    v20 = [(BYPaneFeatureAnalyticsManager *)self runState];
    int v21 = [v20 hasCompletedInitialRun];

    if (v21) {
      [v19 setObject:v24 forKeyedSubscript:@"previousValue"];
    }
  }
  v22 = [(BYPaneFeatureAnalyticsManager *)self analyticsManager];
  [v22 addEvent:@"com.apple.setupassistant.ios.paneFeatureAction" withPayload:v19 persist:0];
}

- (void)clearActionForFeature:(int64_t)a3
{
  v5 = [(BYPaneFeatureAnalyticsManager *)self analyticsManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__BYPaneFeatureAnalyticsManager_clearActionForFeature___block_invoke;
  v6[3] = &unk_1E5D2BD20;
  v6[4] = self;
  v6[5] = a3;
  [v5 removeEventsUsingBlock:v6];
}

uint64_t __55__BYPaneFeatureAnalyticsManager_clearActionForFeature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 isEqualToString:@"com.apple.setupassistant.ios.paneFeatureAction"])
  {
    v6 = [v5 objectForKeyedSubscript:@"feature"];
    v7 = [(id)objc_opt_class() _nameForFeature:*(void *)(a1 + 40)];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setExpressDataSource:(id)a3 features:(id)a4
{
  id v7 = a4;
  [(BYPaneFeatureAnalyticsManager *)self setExpressDataSource:a3];
  if (v7)
  {
    v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    [(BYPaneFeatureAnalyticsManager *)self setExpressSetupFeatures:v6];
  }
  else
  {
    [(BYPaneFeatureAnalyticsManager *)self setExpressSetupFeatures:0];
  }
}

+ (id)_nameForFeature:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10) {
    return @"Screen Time";
  }
  else {
    return *(&off_1E5D2BD40 + a3 - 1);
  }
}

- (id)_isValueDifferentFromExpressForFeature:(int64_t)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];

  if (v7)
  {
    if ([(BYPaneFeatureAnalyticsManager *)self _isFeatureForPaneIncludedInExpress:a3])
    {
      uint64_t v8 = 0;
      switch(a3)
      {
        case 0:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 screenTimeEnabled];
          goto LABEL_15;
        case 1:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 softwareUpdateAutoUpdateEnabled];
          goto LABEL_15;
        case 2:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 softwareUpdateAutoDownloadEnabled];
          goto LABEL_15;
        case 4:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 appAnalyticsOptIn];
          goto LABEL_15;
        case 5:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 deviceAnalyticsOptIn];
          goto LABEL_15;
        case 6:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 locationServicesOptIn];
          goto LABEL_15;
        case 7:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 siriOptIn];
          goto LABEL_15;
        case 8:
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = [v9 siriDataSharingOptIn];
          goto LABEL_15;
        case 9:
          id v12 = NSNumber;
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v10 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v9, "userInterfaceStyleModeValue"));
LABEL_15:
          uint64_t v8 = (void *)v10;
          goto LABEL_16;
        case 10:
          id v14 = NSNumber;
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v15 = [v9 watchMigrationData];
          goto LABEL_24;
        case 15:
          id v14 = NSNumber;
          v9 = [(BYPaneFeatureAnalyticsManager *)self expressDataSource];
          uint64_t v15 = [v9 walletMetadata];
LABEL_24:
          v16 = (void *)v15;
          uint64_t v8 = [v14 numberWithInt:v15 != 0];

LABEL_16:
          break;
        default:
          break;
      }
      if ([v8 isEqualToNumber:v6]) {
        id v11 = @"Not Different";
      }
      else {
        id v11 = @"Different";
      }
    }
    else
    {
      id v11 = @"Not Present in Express";
    }
  }
  else
  {
    id v11 = @"Not Applicable";
  }

  return v11;
}

- (BOOL)_isFeatureForPaneIncludedInExpress:(int64_t)a3
{
  v4 = [(id)objc_opt_class() _featuresForPane:a3];
  id v5 = [(BYPaneFeatureAnalyticsManager *)self expressSetupFeatures];
  char v6 = [v5 intersectsSet:v4];

  return v6;
}

+ (id)_featuresForPane:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E2B0;
      goto LABEL_13;
    case 1:
    case 2:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E2C8;
      goto LABEL_13;
    case 4:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFE4E2E0, &unk_1EFE4E2F8, 0);
      goto LABEL_6;
    case 5:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFE4E310, &unk_1EFE4E2F8, 0);
      v3 = LABEL_6:;
      break;
    case 6:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E328;
      goto LABEL_13;
    case 7:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E340;
      goto LABEL_13;
    case 8:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E358;
      goto LABEL_13;
    case 9:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E370;
      goto LABEL_13;
    case 10:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E388;
      goto LABEL_13;
    case 15:
      v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = &unk_1EFE4E3A0;
LABEL_13:
      v3 = [v4 setWithObject:v5];
      break;
    default:
      break;
  }
  return v3;
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (BYFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (BYExpressSetupDataSource)expressDataSource
{
  return self->_expressDataSource;
}

- (void)setExpressDataSource:(id)a3
{
}

- (NSSet)expressSetupFeatures
{
  return self->_expressSetupFeatures;
}

- (void)setExpressSetupFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressSetupFeatures, 0);
  objc_storeStrong((id *)&self->_expressDataSource, 0);
  objc_storeStrong((id *)&self->_flowItemDispositionProvider, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end