@interface RMMDMConduitConfig
- (id)reportDetails;
@end

@implementation RMMDMConduitConfig

- (id)reportDetails
{
  v5.receiver = self;
  v5.super_class = (Class)RMMDMConduitConfig;
  v2 = [(RMConduitConfig *)&v5 reportDetails];
  id v3 = [v2 mutableCopy];

  return v3;
}

@end