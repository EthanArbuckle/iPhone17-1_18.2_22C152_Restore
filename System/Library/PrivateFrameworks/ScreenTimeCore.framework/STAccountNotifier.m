@interface STAccountNotifier
- (STAccountNotifier)init;
- (STAccountObserving)observer;
- (STAccountStateMonitor)monitor;
- (void)accountStateMonitorDidUpdate:(id)a3 initializing:(BOOL)a4;
- (void)registerObserver:(id)a3;
- (void)setMonitor:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation STAccountNotifier

- (STAccountNotifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)STAccountNotifier;
  return [(STAccountNotifier *)&v3 init];
}

- (void)registerObserver:(id)a3
{
  [(STAccountNotifier *)self setObserver:a3];
  v4 = [[STAccountStateMonitor alloc] initWithDelegate:self];
  [(STAccountNotifier *)self setMonitor:v4];
}

- (void)accountStateMonitorDidUpdate:(id)a3 initializing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(STAccountNotifier *)self observer];
  v7 = [v6 accountState];

  [v8 accountDidUpdateToState:v7 initializing:v4];
}

- (STAccountObserving)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (STAccountStateMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end