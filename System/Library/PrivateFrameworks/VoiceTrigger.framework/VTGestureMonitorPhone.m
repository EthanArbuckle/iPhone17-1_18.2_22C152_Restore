@interface VTGestureMonitorPhone
- (VTGestureMonitorPhone)init;
- (void)startObserving;
- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4;
@end

@implementation VTGestureMonitorPhone

- (void).cxx_destruct
{
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGesture:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 3)
  {
    v8.receiver = self;
    v8.super_class = (Class)VTGestureMonitorPhone;
    v7 = [(VTGestureMonitor *)&v8 delegate];
    [v7 gestureMonitorDidReceiveSleepGesture:self];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)VTGestureMonitorPhone;
    v7 = [(VTGestureMonitor *)&v9 delegate];
    [v7 gestureMonitorDidReceiveWakeGesture:self];
LABEL_5:
  }
}

- (void)startObserving
{
  [(CMWakeGestureManager *)self->_gestureManager setDelegate:self];
  gestureManager = self->_gestureManager;

  [(CMWakeGestureManager *)gestureManager startWakeGestureUpdates];
}

- (VTGestureMonitorPhone)init
{
  v6.receiver = self;
  v6.super_class = (Class)VTGestureMonitorPhone;
  v2 = [(VTGestureMonitorPhone *)&v6 init];
  if (v2 && [MEMORY[0x263F017D8] isWakeGestureAvailable])
  {
    uint64_t v3 = [MEMORY[0x263F017D8] sharedManager];
    gestureManager = v2->_gestureManager;
    v2->_gestureManager = (CMWakeGestureManager *)v3;
  }
  return v2;
}

@end