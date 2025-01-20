@interface REFeatureSet
+ (REFeatureSet)featureSetWithFeature:(id)a3;
+ (REFeatureSet)featureSetWithFeatures:(id)a3;
+ (id)featureSet;
- (BOOL)containsFeature:(id)a3;
- (BOOL)intersectsFeatureSet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFeatureSet:(id)a3;
- (BOOL)isSubsetOfFeatureSet:(id)a3;
- (NSArray)allFeatures;
- (REFeatureSet)init;
- (REFeatureSet)initWithFeature:(id)a3;
- (REFeatureSet)initWithFeatureSet:(id)a3;
- (REFeatureSet)initWithFeatures:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)featureWithName:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)enumerateFeaturesUsingBlock:(id)a3;
@end

@implementation REFeatureSet

- (REFeatureSet)initWithFeatureSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v13 + 1) + 8 * v10++), (void)v13);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v11 = [(REFeatureSet *)self initWithFeatures:v5];
  return v11;
}

- (REFeatureSet)initWithFeatures:(id)a3
{
  id v4 = a3;
  v5 = [[_REFeatureSet alloc] initWithFeatures:v4];

  return &v5->super;
}

+ (id)featureSet
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (REFeatureSet)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v4 = objc_alloc_init(_REFeatureSet);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REFeatureSet;
    id v4 = [(REFeatureSet *)&v7 init];
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (BOOL)isEqualToFeatureSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (REFeatureSet *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else if (v4 && (unint64_t v6 = [(REFeatureSet *)self count], v6 == [(REFeatureSet *)v5 count]))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v7 = self;
    uint64_t v8 = [(REFeatureSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          if (!-[REFeatureSet containsFeature:](v5, "containsFeature:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
          {
            BOOL v12 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v9 = [(REFeatureSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_16:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REFeatureSet *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(REFeatureSet *)self isEqualToFeatureSet:v4];
  }

  return v5;
}

- (REFeatureSet)initWithFeature:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[_RESingleFeatureSet alloc] initWithFeature:v4];

  return &v5->super;
}

+ (REFeatureSet)featureSetWithFeature:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFeature:v3];

  return (REFeatureSet *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[REFeatureSet allocWithZone:a3];
  return [(REFeatureSet *)v4 initWithFeatureSet:self];
}

- (NSArray)allFeatures
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REFeatureSet count](self, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self;
  uint64_t v5 = [(REFeatureSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v6 = [(REFeatureSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[REMutableFeatureSet allocWithZone:a3];
  return [(REFeatureSet *)v4 initWithFeatureSet:self];
}

+ (REFeatureSet)featureSetWithFeatures:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFeatures:v3];

  return (REFeatureSet *)v4;
}

- (BOOL)intersectsFeatureSet:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (REFeatureSet *)a3;
  unint64_t v5 = [(REFeatureSet *)self count];
  unint64_t v6 = [(REFeatureSet *)v4 count];
  if (v5 >= v6) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = self;
  }
  if (v5 < v6) {
    self = v4;
  }
  uint64_t v8 = v7;
  uint64_t v9 = self;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = v8;
  uint64_t v11 = [(REFeatureSet *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        if (-[REFeatureSet containsFeature:](v9, "containsFeature:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
        {
          LOBYTE(v11) = 1;
          goto LABEL_16;
        }
      }
      uint64_t v11 = [(REFeatureSet *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v11;
}

uint64_t __34___REFeatureSet_initWithFeatures___block_invoke()
{
  initWithFeatures__EmptyFeatureSet = objc_alloc_init(_REEmptyFeatureSet);
  return MEMORY[0x270F9A758]();
}

- (BOOL)isSubsetOfFeatureSet:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && (unint64_t v5 = -[REFeatureSet count](self, "count"), v5 <= [v4 count]))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = self;
    uint64_t v8 = [(REFeatureSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          if (!objc_msgSend(v4, "containsFeature:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            BOOL v6 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [(REFeatureSet *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 1;
LABEL_14:
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)enumerateFeaturesUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self;
  uint64_t v6 = [(REFeatureSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(REFeatureSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)count
{
  return 0;
}

- (id)featureWithName:(id)a3
{
  return 0;
}

- (BOOL)containsFeature:(id)a3
{
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return 0;
}

@end