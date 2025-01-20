@interface _REFeatureSet
- (BOOL)containsFeature:(id)a3;
- (_REFeatureSet)init;
- (_REFeatureSet)initWithFeature:(id)a3;
- (_REFeatureSet)initWithFeatures:(id)a3;
- (id)featureWithName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation _REFeatureSet

- (void).cxx_destruct
{
}

- (_REFeatureSet)initWithFeatures:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 count])
  {
    if (initWithFeatures__onceToken != -1) {
      dispatch_once(&initWithFeatures__onceToken, &__block_literal_global_55);
    }
    v8 = (_RESmallFeatureSet *)(id)initWithFeatures__EmptyFeatureSet;
    goto LABEL_9;
  }
  if ([v4 count] == 1)
  {
    v5 = [_RESingleFeatureSet alloc];
    v6 = [v4 firstObject];
    v7 = [(_RESingleFeatureSet *)v5 initWithFeature:v6];

    goto LABEL_25;
  }
  if ((unint64_t)[v4 count] <= 3)
  {
    v8 = [[_RESmallFeatureSet alloc] initWithFeatures:v4];
LABEL_9:
    v7 = (_REFeatureSet *)v8;
    goto LABEL_25;
  }
  v29 = self;
  v9 = [MEMORY[0x263EFF9C0] set];
  v10 = [MEMORY[0x263EFF9C0] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v30 = v4;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
    v15 = (void *)*MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (([v10 containsObject:v17] & 1) == 0)
        {
          v18 = [v17 name];
          if ([v9 containsObject:v18])
          {
            RERaiseInternalException(v15, @"Features as duplicate feature with name \"%@\"", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
          }
          else
          {
            [v9 addObject:v18];
            [v10 addObject:v17];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }

  v31.receiver = v29;
  v31.super_class = (Class)_REFeatureSet;
  v25 = [(REFeatureSet *)&v31 init];
  if (v25)
  {
    uint64_t v26 = [v10 copy];
    features = v25->_features;
    v25->_features = (NSSet *)v26;
  }
  self = v25;

  v7 = self;
  id v4 = v30;
LABEL_25:

  return v7;
}

- (_REFeatureSet)init
{
  return [(_REFeatureSet *)self initWithFeatures:MEMORY[0x263EFFA68]];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSSet *)self->_features countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (unint64_t)count
{
  return [(NSSet *)self->_features count];
}

- (BOOL)containsFeature:(id)a3
{
  return [(NSSet *)self->_features containsObject:a3];
}

- (_REFeatureSet)initWithFeature:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = -[_REFeatureSet initWithFeatures:](self, "initWithFeatures:", v6, v9, v10);
  return v7;
}

- (id)featureWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_features;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end