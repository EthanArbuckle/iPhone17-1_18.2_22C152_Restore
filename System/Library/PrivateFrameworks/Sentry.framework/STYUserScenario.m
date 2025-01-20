@interface STYUserScenario
+ (id)scenarioFromSignpostEvent:(id)a3 error:(id *)a4;
+ (id)scenarioFromSignpostInterval:(id)a3 error:(id *)a4;
- (NSString)appBundleId;
- (NSString)appName;
- (NSString)scenarioGroup;
- (NSString)scenarioID;
- (NSString)titleText;
- (STYUserScenario)initWithConfiguration:(id)a3 scenarioGroup:(id)a4 kpi:(int64_t)a5 processBundleID:(id)a6 titleText:(id)a7 processName:(id)a8 processID:(int)a9;
- (STYUserScenario)initWithLifecycleScenarioCategoryAndModelName:(id)a3 modelName:(id)a4 titleText:(id)a5;
- (int)appProcessID;
- (int64_t)kpi;
@end

@implementation STYUserScenario

- (STYUserScenario)initWithLifecycleScenarioCategoryAndModelName:(id)a3 modelName:(id)a4 titleText:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)STYUserScenario;
  v12 = [(STYUserScenario *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scenarioGroup, a3);
    uint64_t v14 = [NSString stringWithFormat:@"%@.%@", v10, v9];
    scenarioID = v13->_scenarioID;
    v13->_scenarioID = (NSString *)v14;

    objc_storeStrong((id *)&v13->_titleText, a5);
    v13->_kpi = -1000;
    v16 = v13;
  }

  return v13;
}

- (STYUserScenario)initWithConfiguration:(id)a3 scenarioGroup:(id)a4 kpi:(int64_t)a5 processBundleID:(id)a6 titleText:(id)a7 processName:(id)a8 processID:(int)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v24 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)STYUserScenario;
  v19 = [(STYUserScenario *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_scenarioID, a3);
    objc_storeStrong((id *)&v20->_scenarioGroup, a4);
    v20->_kpi = a5;
    objc_storeStrong((id *)&v20->_titleText, a7);
    objc_storeStrong((id *)&v20->_appBundleId, a6);
    objc_storeStrong((id *)&v20->_appName, a8);
    v20->_appProcessID = a9;
    v21 = v20;
  }

  return v20;
}

+ (id)scenarioFromSignpostEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[STYUserScenarioCache sharedCache];
  v7 = [v6 scenarioFromSignpostEvent:v5 error:a4];

  return v7;
}

+ (id)scenarioFromSignpostInterval:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[STYUserScenarioCache sharedCache];
  v7 = [v6 scenarioFromSignpostInterval:v5 error:a4];

  return v7;
}

- (NSString)scenarioGroup
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)scenarioID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)kpi
{
  return self->_kpi;
}

- (NSString)titleText
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)appBundleId
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (int)appProcessID
{
  return self->_appProcessID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_scenarioID, 0);
  objc_storeStrong((id *)&self->_scenarioGroup, 0);
}

@end