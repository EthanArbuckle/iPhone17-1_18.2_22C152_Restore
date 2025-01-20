@interface OSIDNDMonitor
- (BOOL)isDNDModeConsidered:(id)a3;
- (DNDStateService)service;
- (OSIDNDMonitor)init;
- (id)scheduledDNDEndDate;
- (void)setService:(id)a3;
@end

@implementation OSIDNDMonitor

- (OSIDNDMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)OSIDNDMonitor;
  v2 = [(OSIDNDMonitor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[DNDStateService serviceForClientIdentifier:@"ospredictiond"];
    service = v2->_service;
    v2->_service = (DNDStateService *)v3;
  }
  return v2;
}

- (BOOL)isDNDModeConsidered:(id)a3
{
  uint64_t v3 = [a3 activeModeConfiguration];
  if ([v3 dimsLockScreen] == (id)2)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [v3 mode];
    if ([v5 semanticType] == (id)1)
    {
      BOOL v4 = 1;
    }
    else
    {
      objc_super v6 = [v3 mode];
      BOOL v4 = [v6 semanticType] == 0;
    }
  }

  return v4;
}

- (id)scheduledDNDEndDate
{
  service = self->_service;
  uint64_t v10 = 0;
  BOOL v4 = [(DNDStateService *)service queryCurrentStateWithError:&v10];
  v5 = v4;
  objc_super v6 = 0;
  if (!v10)
  {
    v7 = [v4 userVisibleTransitionDate];
    if ([v5 isActive]
      && [(OSIDNDMonitor *)self isDNDModeConsidered:v5]
      && ([v5 userVisibleTransitionLifetimeType] == (id)4
       || [v5 userVisibleTransitionLifetimeType] == (id)2
       || ![v5 userVisibleTransitionLifetimeType])
      && ([v7 timeIntervalSinceNow], v8 < 36000.0))
    {
      objc_super v6 = [v5 userVisibleTransitionDate];
    }
    else
    {
      objc_super v6 = 0;
    }
  }

  return v6;
}

- (DNDStateService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end