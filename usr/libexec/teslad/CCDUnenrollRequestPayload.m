@interface CCDUnenrollRequestPayload
- (id)action;
@end

@implementation CCDUnenrollRequestPayload

- (id)action
{
  return @"RequestUnenrollProvisionalDevice";
}

@end