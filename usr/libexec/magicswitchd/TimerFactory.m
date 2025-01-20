@interface TimerFactory
+ (id)timerWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 waking:(BOOL)a6 handlerBlock:(id)a7;
@end

@implementation TimerFactory

+ (id)timerWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 waking:(BOOL)a6 handlerBlock:(id)a7
{
  v10 = &off_100018408;
  if (!a6) {
    v10 = &off_100018360;
  }
  v11 = (objc_class *)*v10;
  id v12 = a7;
  id v13 = a3;
  id v14 = [[v11 alloc] initWithIdentifier:v13 delay:v12 gracePeriod:a4 handlerBlock:a5];

  return v14;
}

@end