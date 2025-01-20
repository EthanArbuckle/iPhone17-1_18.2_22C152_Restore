@interface CLDurianZoneMonitorWrapper
- (BOOL)isInZone:(id)a3;
- (CLDurianZoneMonitorWrapper)init;
- (CLDurianZoneMonitorWrapper)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4;
- (void)dealloc;
@end

@implementation CLDurianZoneMonitorWrapper

- (CLDurianZoneMonitorWrapper)init
{
  return 0;
}

- (CLDurianZoneMonitorWrapper)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLDurianZoneMonitorWrapper;
  if ([(CLDurianZoneMonitorWrapper *)&v7 init])
  {
    sub_100134750(&__p, (char *)[a3 UTF8String]);
    operator new();
  }
  return 0;
}

- (BOOL)isInZone:(id)a3
{
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  [a3 coordinate];
  v14[0] = v5;
  v14[1] = v6;
  [a3 coordinate];
  v12[1] = v7;
  uint64_t v13 = v8;
  [a3 horizontalAccuracy];
  v12[0] = v9;
  char v11 = 0;
  return sub_1001A5C3C((uint64_t)wrappedAvengerZoneMonitor, v14, (double *)&v13, v12, &v11);
}

- (void)dealloc
{
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  if (wrappedAvengerZoneMonitor) {
    (*(void (**)(void *, SEL))(*(void *)wrappedAvengerZoneMonitor + 8))(wrappedAvengerZoneMonitor, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLDurianZoneMonitorWrapper;
  [(CLDurianZoneMonitorWrapper *)&v4 dealloc];
}

@end