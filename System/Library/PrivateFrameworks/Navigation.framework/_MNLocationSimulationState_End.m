@interface _MNLocationSimulationState_End
- (id)nextSimulatedLocationWithElapsedTime:(double)a3;
- (int64_t)type;
@end

@implementation _MNLocationSimulationState_End

- (int64_t)type
{
  return 10;
}

- (id)nextSimulatedLocationWithElapsedTime:(double)a3
{
  return 0;
}

@end