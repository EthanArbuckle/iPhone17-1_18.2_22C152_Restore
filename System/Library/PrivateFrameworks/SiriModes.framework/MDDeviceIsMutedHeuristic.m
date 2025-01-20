@interface MDDeviceIsMutedHeuristic
- (BOOL)isDeviceSilentMode;
- (MDDeviceIsMutedHeuristic)init;
- (MDDeviceIsMutedHeuristic)initWithRingerStateObserver:(id)a3;
- (id)determineCurrentMode;
@end

@implementation MDDeviceIsMutedHeuristic

- (MDDeviceIsMutedHeuristic)init
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.siri.mode.MDDeviceIsMutedHeuristic", 0);
  v4 = (void *)[objc_alloc(MEMORY[0x263F28578]) initWithName:@"com.apple.springboard.ringerstate" options:1 queue:v3 delegate:0];
  v5 = [(MDDeviceIsMutedHeuristic *)self initWithRingerStateObserver:v4];

  return v5;
}

- (MDDeviceIsMutedHeuristic)initWithRingerStateObserver:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MDDeviceIsMutedHeuristic;
  v6 = [(MDDeviceIsMutedHeuristic *)&v10 init];
  if (v6)
  {
    v7 = [[MDModeDecision alloc] initWithMode:2];
    displayOnlyModeDecision = v6->_displayOnlyModeDecision;
    v6->_displayOnlyModeDecision = v7;

    objc_storeStrong((id *)&v6->_ringerStateObserver, a3);
  }

  return v6;
}

- (id)determineCurrentMode
{
  if ([(MDDeviceIsMutedHeuristic *)self isDeviceSilentMode]) {
    dispatch_queue_t v3 = self->_displayOnlyModeDecision;
  }
  else {
    dispatch_queue_t v3 = 0;
  }

  return v3;
}

- (BOOL)isDeviceSilentMode
{
  return [(AFNotifyObserver *)self->_ringerStateObserver state] == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayOnlyModeDecision, 0);

  objc_storeStrong((id *)&self->_ringerStateObserver, 0);
}

@end