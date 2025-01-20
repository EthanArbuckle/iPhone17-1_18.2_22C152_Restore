@interface CCDProfileConfigurationRequestPayload
- (id)action;
@end

@implementation CCDProfileConfigurationRequestPayload

- (id)action
{
  return @"RequestProfileConfiguration";
}

@end