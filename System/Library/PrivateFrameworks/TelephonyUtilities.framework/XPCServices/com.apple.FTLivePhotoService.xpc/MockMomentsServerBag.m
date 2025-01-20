@interface MockMomentsServerBag
- (BOOL)isLoaded;
- (BOOL)isMomentsDisabled;
- (MockMomentsServerBag)init;
- (double)momentsRequestTimeout;
- (void)setIsLoaded:(BOOL)a3;
- (void)setIsMomentsDisabled:(BOOL)a3;
- (void)setMomentsRequestTimeout:(double)a3;
@end

@implementation MockMomentsServerBag

- (BOOL)isLoaded
{
  return sub_10002409C() & 1;
}

- (void)setIsLoaded:(BOOL)a3
{
}

- (BOOL)isMomentsDisabled
{
  return sub_10002410C() & 1;
}

- (void)setIsMomentsDisabled:(BOOL)a3
{
}

- (double)momentsRequestTimeout
{
  return sub_100024178();
}

- (void)setMomentsRequestTimeout:(double)a3
{
}

- (MockMomentsServerBag)init
{
  return (MockMomentsServerBag *)sub_1000241BC();
}

@end