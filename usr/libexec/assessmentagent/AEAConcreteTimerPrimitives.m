@interface AEAConcreteTimerPrimitives
- (id)scheduledTimerWithDuration:(double)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation AEAConcreteTimerPrimitives

- (id)scheduledTimerWithDuration:(double)a3 queue:(id)a4 handler:(id)a5
{
  return +[AEADispatchTimer scheduledTimerWithDuration:a4 queue:a5 handler:a3];
}

@end