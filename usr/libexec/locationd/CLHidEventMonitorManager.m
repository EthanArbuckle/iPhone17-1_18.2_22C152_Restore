@interface CLHidEventMonitorManager
- (CLHidEventMonitorManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5;
- (void)addSystemClientMatching:(id)a3;
- (void)removeSystemClientmatching:(id)a3;
@end

@implementation CLHidEventMonitorManager

- (CLHidEventMonitorManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CLHidEventMonitorManager;
  return [(CLHidEventManager *)&v6 initWithDelegate:a3 queue:a4 matching:a5 type:1];
}

- (void)addSystemClientMatching:(id)a3
{
  [(NSMutableArray *)[(CLHidEventManager *)self matching] addObject:a3];
  v4 = [(CLHidEventManager *)self manager];
  v5 = [(CLHidEventManager *)self matching];

  [(HIDEventSystemClient *)v4 setMatching:v5];
}

- (void)removeSystemClientmatching:(id)a3
{
  [(NSMutableArray *)[(CLHidEventManager *)self matching] removeObject:a3];
  v4 = [(CLHidEventManager *)self manager];
  v5 = [(CLHidEventManager *)self matching];

  [(HIDEventSystemClient *)v4 setMatching:v5];
}

@end