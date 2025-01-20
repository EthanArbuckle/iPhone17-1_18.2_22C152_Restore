@interface FeatureConfig
- (FeatureConfig)init;
- (NSString)name;
- (void)setName:(id)a3;
@end

@implementation FeatureConfig

- (FeatureConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)FeatureConfig;
  v2 = [(FeatureConfig *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;
  }
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end