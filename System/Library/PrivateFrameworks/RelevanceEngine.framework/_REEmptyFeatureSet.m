@interface _REEmptyFeatureSet
- (BOOL)containsFeature:(id)a3;
- (_REEmptyFeatureSet)init;
- (id)allFeatures;
- (id)featureWithName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation _REEmptyFeatureSet

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return 0;
}

- (unint64_t)count
{
  return 0;
}

- (_REEmptyFeatureSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)_REEmptyFeatureSet;
  return [(REFeatureSet *)&v3 init];
}

- (id)featureWithName:(id)a3
{
  return 0;
}

- (BOOL)containsFeature:(id)a3
{
  return 0;
}

- (id)allFeatures
{
  return (id)MEMORY[0x263EFFA68];
}

@end