@interface _REFeatureMapWrapper
- (NSSet)allFeatures;
- (_REFeatureMapWrapper)initWithFeatureMap:(id)a3;
- (id)valueForFeature:(id)a3;
@end

@implementation _REFeatureMapWrapper

- (_REFeatureMapWrapper)initWithFeatureMap:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REFeatureMapWrapper;
  v6 = [(_REFeatureMapWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureMap, a3);
  }

  return v7;
}

- (NSSet)allFeatures
{
  return [(REFeatureMap *)self->_featureMap allFeatures];
}

- (id)valueForFeature:(id)a3
{
  return [(REFeatureMap *)self->_featureMap featureValueForFeature:a3];
}

- (void).cxx_destruct
{
}

@end