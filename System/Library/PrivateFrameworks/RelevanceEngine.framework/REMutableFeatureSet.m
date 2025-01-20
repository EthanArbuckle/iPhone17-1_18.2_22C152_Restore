@interface REMutableFeatureSet
- (REMutableFeatureSet)init;
- (REMutableFeatureSet)initWithCapacity:(unint64_t)a3;
- (REMutableFeatureSet)initWithFeature:(id)a3;
- (REMutableFeatureSet)initWithFeatures:(id)a3;
- (void)addFeature:(id)a3;
- (void)intersetFeatureSet:(id)a3;
- (void)minusFeatureSet:(id)a3;
- (void)removeAllFeatures;
- (void)removeFeature:(id)a3;
- (void)unionFeatureSet:(id)a3;
@end

@implementation REMutableFeatureSet

- (void)unionFeatureSet:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(REMutableFeatureSet *)self addFeature:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (REMutableFeatureSet)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v4 = objc_alloc_init(_REMutableFeatureSet);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REMutableFeatureSet;
    id v4 = [(REFeatureSet *)&v7 init];
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (void)minusFeatureSet:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(REMutableFeatureSet *)self removeFeature:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (REMutableFeatureSet)initWithFeatures:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_REMutableFeatureSet alloc] initWithFeatures:v4];

  return &v5->super;
}

- (void)intersetFeatureSet:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REFeatureSet count](self, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = self;
  uint64_t v7 = [(REFeatureSet *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v8 = [(REFeatureSet *)v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * j);
        if ((objc_msgSend(v4, "containsFeature:", v16, (void)v17) & 1) == 0) {
          [(REMutableFeatureSet *)v6 removeFeature:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (REMutableFeatureSet)initWithFeature:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_REMutableFeatureSet alloc] initWithFeature:v4];

  return &v5->super;
}

- (REMutableFeatureSet)initWithCapacity:(unint64_t)a3
{
  id v4 = [[_REMutableFeatureSet alloc] initWithCapacity:a3];

  return &v4->super;
}

- (void)removeAllFeatures
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REFeatureSet count](self, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self;
  uint64_t v5 = [(REFeatureSet *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v18 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(REFeatureSet *)v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[REMutableFeatureSet removeFeature:](v4, "removeFeature:", *(void *)(*((void *)&v14 + 1) + 8 * v13++), (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)addFeature:(id)a3
{
  OUTLINED_FUNCTION_1_6();
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (void)removeFeature:(id)a3
{
  OUTLINED_FUNCTION_1_6();
  objc_opt_class();
  NSRequestConcreteImplementation();
}

@end