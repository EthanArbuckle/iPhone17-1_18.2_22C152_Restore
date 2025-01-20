@interface MTStopwatchStorage
- (MTStopwatchStorage)init;
- (_TtC18MobileTimerSupport23MTStopwatchStorageProxy)storageProxy;
- (void)createStopWatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5 source:(id)a6;
- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)getStopwatchesWitchCompletion:(id)a3;
- (void)localSetup;
- (void)registerObserver:(id)a3;
- (void)setStorageProxy:(id)a3;
- (void)setSystemReady;
- (void)unregisterObserver:(id)a3;
- (void)updateStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
@end

@implementation MTStopwatchStorage

- (MTStopwatchStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTStopwatchStorage;
  v2 = [(MTStopwatchStorage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MTStopwatchStorage *)v2 localSetup];
  }
  return v3;
}

- (void)localSetup
{
  id v3 = (id)objc_opt_new();
  [(MTStopwatchStorage *)self setStorageProxy:v3];
}

- (void)createStopWatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 createStopWatch:v10 withCompletion:v9 source:v8];
}

- (void)updateStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 updateStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 deleteStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(MTStopwatchStorage *)self storageProxy];
  [v14 didAddLap:v13 forStopwatch:v12 withCompletion:v11 source:v10];
}

- (void)getStopwatchesWitchCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStopwatchStorage *)self storageProxy];
  [v5 getStopwatchesWitchCompletion:v4];
}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 didClearAllLapsForStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 didStartLapTimerForStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 didPauseLapTimerForStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 didLapLapTimerForStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 didResetLapTimerForStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTStopwatchStorage *)self storageProxy];
  [v11 didResumeLapTimerForStopwatch:v10 withCompletion:v9 source:v8];
}

- (void)setSystemReady
{
  id v2 = [(MTStopwatchStorage *)self storageProxy];
  [v2 setSystemReady];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStopwatchStorage *)self storageProxy];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MTStopwatchStorage *)self storageProxy];
  [v5 unregisterObserver:v4];
}

- (_TtC18MobileTimerSupport23MTStopwatchStorageProxy)storageProxy
{
  return self->_storageProxy;
}

- (void)setStorageProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end