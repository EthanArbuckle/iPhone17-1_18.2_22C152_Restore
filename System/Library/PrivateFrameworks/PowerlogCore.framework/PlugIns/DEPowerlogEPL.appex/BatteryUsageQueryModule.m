@interface BatteryUsageQueryModule
+ (id)sharedModule;
- (BatteryUsageQueryModule)init;
- (NSArray)graphNames;
- (NSString)manualFileName;
- (int)type;
- (void)populateBatteryGraphModelsWithCompletion:(id)a3;
- (void)populateBatteryModelsWithCompletion:(id)a3;
- (void)populateBatteryUsageWithCompletion:(id)a3;
- (void)queryBackend:(id)a3 withCompletion:(id)a4;
- (void)setGraphNames:(id)a3;
- (void)setManualFileName:(id)a3;
- (void)setType:(int)a3;
@end

@implementation BatteryUsageQueryModule

+ (id)sharedModule
{
  if (qword_10000C6F8 != -1) {
    dispatch_once(&qword_10000C6F8, &stru_1000082D8);
  }
  v2 = (void *)qword_10000C6F0;
  return v2;
}

- (BatteryUsageQueryModule)init
{
  v8.receiver = self;
  v8.super_class = (Class)BatteryUsageQueryModule;
  v2 = [(BatteryUsageQueryModule *)&v8 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queryUsageQueue = v2->_queryUsageQueue;
    v2->_queryUsageQueue = v3;

    [(NSOperationQueue *)v2->_queryUsageQueue setName:@"com.apple.preferences.battery_ui_query"];
    [(NSOperationQueue *)v2->_queryUsageQueue setMaxConcurrentOperationCount:1];
    v2->_type = 0;
    v5 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queryModelQueue = v2->_queryModelQueue;
    v2->_queryModelQueue = v5;

    [(NSOperationQueue *)v2->_queryModelQueue setName:@"com.apple.preferences.battery_model_query"];
    [(NSOperationQueue *)v2->_queryModelQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)populateBatteryUsageWithCompletion:(id)a3
{
  id v4 = a3;
  v6 = [[QueryOperations alloc] initWithCompletion:v4];

  [(QueryOperations *)v6 setFunctionName:@"PLBatteryUIQueryFunctionKey"];
  [(QueryOperations *)v6 setQueryType:[(BatteryUsageQueryModule *)self type]];
  v5 = [(BatteryUsageQueryModule *)self manualFileName];
  [(QueryOperations *)v6 setManualFileName:v5];

  [(NSOperationQueue *)self->_queryUsageQueue addOperation:v6];
}

- (void)populateBatteryModelsWithCompletion:(id)a3
{
  id v4 = a3;
  v6 = [[QueryOperations alloc] initWithCompletion:v4];

  [(QueryOperations *)v6 setFunctionName:@"PLBatteryUIModelsQueryFunctionKey"];
  v5 = [(BatteryUsageQueryModule *)self graphNames];
  [(QueryOperations *)v6 setGraphArray:v5];

  [(NSOperationQueue *)self->_queryModelQueue addOperation:v6];
}

- (void)populateBatteryGraphModelsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [[QueryOperations alloc] initWithCompletion:v4];

  [(QueryOperations *)v5 setFunctionName:@"PLBatteryUIGraphKey"];
  NSLog(@"Operation is: %@", v5);
  [(NSOperationQueue *)self->_queryModelQueue addOperation:v5];
}

- (void)queryBackend:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[QueryOperations alloc] initWithCompletion:v6];

  [(QueryOperations *)v9 setFunctionName:@"PLBatteryUIQueryFunctionKey"];
  [(QueryOperations *)v9 setQueryType:[(BatteryUsageQueryModule *)self type]];
  [(QueryOperations *)v9 setBackend:v7];

  objc_super v8 = [(BatteryUsageQueryModule *)self manualFileName];
  [(QueryOperations *)v9 setManualFileName:v8];

  [(NSOperationQueue *)self->_queryUsageQueue addOperation:v9];
}

- (NSString)manualFileName
{
  return self->_manualFileName;
}

- (void)setManualFileName:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSArray)graphNames
{
  return self->_graphNames;
}

- (void)setGraphNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphNames, 0);
  objc_storeStrong((id *)&self->_manualFileName, 0);
  objc_storeStrong((id *)&self->_queryModelQueue, 0);
  objc_storeStrong((id *)&self->_queryUsageQueue, 0);
}

@end