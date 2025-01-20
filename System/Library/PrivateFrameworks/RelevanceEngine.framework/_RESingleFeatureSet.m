@interface _RESingleFeatureSet
- (BOOL)containsFeature:(id)a3;
- (_RESingleFeatureSet)init;
- (_RESingleFeatureSet)initWithFeature:(id)a3;
- (_RESingleFeatureSet)initWithFeatures:(id)a3;
- (id)allFeatures;
- (id)featureWithName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation _RESingleFeatureSet

- (unint64_t)count
{
  return 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  unint64_t result = 1;
  a3->var0 = 1;
  a3->var1 = (id *)&self->_feature;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__mutation_value;
  return result;
}

- (BOOL)containsFeature:(id)a3
{
  feature = self->_feature;
  return feature == a3 || -[REFeature isEqual:](feature, "isEqual:");
}

- (id)allFeatures
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_feature;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (_RESingleFeatureSet)initWithFeature:(id)a3
{
  id v5 = a3;
  if (initWithFeature__onceToken != -1) {
    dispatch_once(&initWithFeature__onceToken, &__block_literal_global_46_2);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&initWithFeature__Lock);
  v6 = [(id)initWithFeature__FeatureSetCache objectForKey:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&initWithFeature__Lock);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_RESingleFeatureSet;
    v8 = [(REFeatureSet *)&v12 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_feature, a3);
      os_unfair_lock_lock((os_unfair_lock_t)&initWithFeature__Lock);
      [(id)initWithFeature__FeatureSetCache setObject:v9 forKey:v5];
      os_unfair_lock_unlock((os_unfair_lock_t)&initWithFeature__Lock);
    }
    v7 = v9;
    self = v7;
  }
  v10 = v7;

  return v10;
}

- (void).cxx_destruct
{
}

- (_RESingleFeatureSet)initWithFeatures:(id)a3
{
  v4 = [a3 firstObject];
  id v5 = [(_RESingleFeatureSet *)self initWithFeature:v4];

  return v5;
}

- (_RESingleFeatureSet)init
{
  return [(_RESingleFeatureSet *)self initWithFeature:0];
}

- (id)featureWithName:(id)a3
{
  feature = self->_feature;
  id v5 = a3;
  v6 = [(REFeature *)feature name];
  int v7 = [v6 isEqualToString:v5];

  if (v7) {
    v8 = self->_feature;
  }
  else {
    v8 = 0;
  }
  return v8;
}

@end