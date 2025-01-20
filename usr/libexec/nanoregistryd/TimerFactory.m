@interface TimerFactory
+ (id)timerWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 waking:(BOOL)a6 handlerQueue:(id)a7 handlerBlock:(id)a8;
@end

@implementation TimerFactory

+ (id)timerWithIdentifier:(id)a3 delay:(double)a4 gracePeriod:(double)a5 waking:(BOOL)a6 handlerQueue:(id)a7 handlerBlock:(id)a8
{
  v12 = &off_1001651F0;
  if (!a6) {
    v12 = &off_100164E30;
  }
  v13 = (objc_class *)*v12;
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v17 = [[v13 alloc] initWithIdentifier:v16 delay:v15 gracePeriod:v14 handlerQueue:a4 handlerBlock:a5];

  return v17;
}

@end