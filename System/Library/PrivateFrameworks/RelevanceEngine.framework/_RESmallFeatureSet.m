@interface _RESmallFeatureSet
- (BOOL)containsFeature:(id)a3;
- (_RESmallFeatureSet)init;
- (_RESmallFeatureSet)initWithFeature:(id)a3;
- (_RESmallFeatureSet)initWithFeatures:(id)a3;
- (id)allFeatures;
- (id)featureWithName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation _RESmallFeatureSet

- (void).cxx_destruct
{
  features = self->_features;
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&features[i], 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  a3->var0 = 1;
  a3->var1 = (id *)self->_features;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__mutation_value_65;
  return [(_RESmallFeatureSet *)self count];
}

- (unint64_t)count
{
  unint64_t result = 0;
  features = self->_features;
  do
  {
    if (!features[result]) {
      break;
    }
    ++result;
  }
  while (result != 3);
  return result;
}

- (_RESmallFeatureSet)initWithFeatures:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_RESmallFeatureSet;
  v5 = [(REFeatureSet *)&v14 init];
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    while (v7 < [v4 count])
    {
      uint64_t v8 = [v4 objectAtIndexedSubscript:v7];
      v9 = v5->_features[v7];
      v5->_features[v7] = (REFeature *)v8;

      ++v7;
      v6 -= 8;
      if (v7 == 3) {
        goto LABEL_9;
      }
    }
    if (v7 <= 2)
    {
      uint64_t v10 = -v6;
      features = v5->_features;
      do
      {
        v12 = *(REFeature **)((char *)features + v10);
        *(REFeature **)((char *)features + v10) = 0;

        v10 += 8;
      }
      while (v10 != 24);
    }
  }
LABEL_9:

  return v5;
}

- (id)allFeatures
{
  v3 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
  uint64_t v4 = 0;
  features = self->_features;
  do
  {
    uint64_t v6 = features[v4];
    if (!v6) {
      break;
    }
    unint64_t v7 = v6;
    [v3 addObject:v6];

    ++v4;
  }
  while (v4 != 3);
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (_RESmallFeatureSet)init
{
  return [(_RESmallFeatureSet *)self initWithFeatures:MEMORY[0x263EFFA68]];
}

- (_RESmallFeatureSet)initWithFeature:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v9 count:1];

  unint64_t v7 = -[_RESmallFeatureSet initWithFeatures:](self, "initWithFeatures:", v6, v9, v10);
  return v7;
}

- (id)featureWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 0;
  features = self->_features;
  while (1)
  {
    unint64_t v7 = features[v5];
    uint64_t v8 = v7;
    if (!v7) {
      break;
    }
    id v9 = [(REFeature *)v7 name];
    char v10 = [v9 isEqualToString:v4];

    if (v10) {
      break;
    }

    if (++v5 == 3)
    {
      uint64_t v8 = 0;
      break;
    }
  }

  return v8;
}

- (BOOL)containsFeature:(id)a3
{
  id v4 = (REFeature *)a3;
  uint64_t v5 = 0;
  features = self->_features;
  while (1)
  {
    unint64_t v7 = features[v5];
    if (!v7)
    {
LABEL_6:
      BOOL v11 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = v7;
    if (v8 == v4) {
      break;
    }
    id v9 = v8;
    BOOL v10 = [(REFeature *)v8 isEqual:v4];

    if (v10) {
      goto LABEL_8;
    }

    if (++v5 == 3) {
      goto LABEL_6;
    }
  }

  id v9 = v4;
LABEL_8:

  BOOL v11 = 1;
LABEL_9:

  return v11;
}

@end