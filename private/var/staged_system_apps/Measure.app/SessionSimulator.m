@interface SessionSimulator
- (void)replaySensorDidFinishLoadingWithStartTimestamp:(double)a3 endTimestamp:(double)a4;
@end

@implementation SessionSimulator

- (void)replaySensorDidFinishLoadingWithStartTimestamp:(double)a3 endTimestamp:(double)a4
{
  v6 = self;
  sub_1000C0320(a3, a4);
}

@end