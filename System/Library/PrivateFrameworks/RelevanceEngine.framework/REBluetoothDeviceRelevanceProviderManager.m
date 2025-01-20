@interface REBluetoothDeviceRelevanceProviderManager
+ (BOOL)_wantsSeperateRelevanceQueue;
+ (Class)_relevanceProviderClass;
+ (id)_features;
- (BOOL)connectedToCar;
- (BOOL)connectedToSpeaker;
- (REBluetoothDeviceRelevanceProviderManager)initWithQueue:(id)a3;
- (id)_valueForProvider:(id)a3 feature:(id)a4;
- (void)_prepareForUpdate;
- (void)pause;
- (void)predictorDidUpdate:(id)a3;
- (void)resume;
@end

@implementation REBluetoothDeviceRelevanceProviderManager

+ (id)_features
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = +[REFeature bluetoothDeviceFeature];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (REBluetoothDeviceRelevanceProviderManager)initWithQueue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REBluetoothDeviceRelevanceProviderManager;
  result = [(RERelevanceProviderManager *)&v4 initWithQueue:a3];
  if (result)
  {
    result->_connectedToSpeaker = 0;
    result->_connectedToCar = 0;
  }
  return result;
}

+ (Class)_relevanceProviderClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)_wantsSeperateRelevanceQueue
{
  return 0;
}

- (id)_valueForProvider:(id)a3 feature:(id)a4
{
  id v5 = a3;
  if ([v5 connectedToSpeaker] && self->_connectedToSpeaker)
  {
    BOOL connectedToCar = 1;
  }
  else if ([v5 connectedToCar])
  {
    BOOL connectedToCar = self->_connectedToCar;
  }
  else
  {
    BOOL connectedToCar = 0;
  }
  v7 = +[REFeatureValue featureValueWithBool:connectedToCar];

  return v7;
}

- (void)resume
{
  id v3 = +[RESingleton sharedInstance];
  [v3 addObserver:self];
}

- (void)pause
{
  id v3 = +[RESingleton sharedInstance];
  [v3 removeObserver:self];
}

- (void)_prepareForUpdate
{
  id v3 = +[RESingleton sharedInstance];
  self->_BOOL connectedToCar = [v3 connectedToCar];

  id v4 = +[RESingleton sharedInstance];
  self->_connectedToSpeaker = [v4 connectedToSpeaker];
}

- (void)predictorDidUpdate:(id)a3
{
  id v4 = +[RERelevanceProviderManagerUpdate immediateUpdateForAllProviders];
  [(RERelevanceProviderManager *)self _scheduleUpdate:v4];
}

- (BOOL)connectedToCar
{
  return self->_connectedToCar;
}

- (BOOL)connectedToSpeaker
{
  return self->_connectedToSpeaker;
}

@end