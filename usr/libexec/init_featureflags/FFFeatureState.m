@interface FFFeatureState
- (id)name;
@end

@implementation FFFeatureState

- (id)name
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(FFFeatureState *)self domain];
  v5 = [(FFFeatureState *)self feature];
  id v6 = [v3 initWithFormat:@"%@/%@", v4, v5];

  return v6;
}

@end