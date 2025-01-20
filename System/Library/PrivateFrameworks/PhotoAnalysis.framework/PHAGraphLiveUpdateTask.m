@interface PHAGraphLiveUpdateTask
- (double)period;
- (id)name;
@end

@implementation PHAGraphLiveUpdateTask

- (double)period
{
  return -1.0;
}

- (id)name
{
  return @"PHAGraphLiveUpdateTask";
}

@end