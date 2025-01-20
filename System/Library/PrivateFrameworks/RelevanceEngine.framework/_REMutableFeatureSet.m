@interface _REMutableFeatureSet
- (BOOL)containsFeature:(id)a3;
- (_REMutableFeatureSet)init;
- (_REMutableFeatureSet)initWithCapacity:(unint64_t)a3;
- (_REMutableFeatureSet)initWithFeature:(id)a3;
- (_REMutableFeatureSet)initWithFeatures:(id)a3;
- (id)featureWithName:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addFeature:(id)a3;
- (void)removeAllFeatures;
- (void)removeFeature:(id)a3;
@end

@implementation _REMutableFeatureSet

- (_REMutableFeatureSet)initWithFeatures:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
  v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    v10 = (void *)*MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v5 containsObject:v12] & 1) == 0)
        {
          v13 = [v12 name];
          if ([v4 containsObject:v13])
          {
            RERaiseInternalException(v10, @"Features as duplicate feature with name \"%@\"", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
          }
          else
          {
            [v4 addObject:v13];
            [v5 addObject:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v24.receiver = self;
  v24.super_class = (Class)_REMutableFeatureSet;
  v20 = [(REMutableFeatureSet *)&v24 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_features, v5);
    objc_storeStrong((id *)&v21->_names, v4);
  }

  return v21;
}

- (void)addFeature:(id)a3
{
  id v5 = a3;
  v4 = [v5 name];
  if (([(NSMutableSet *)self->_names containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_names addObject:v4];
    [(NSMutableSet *)self->_features addObject:v5];
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableSet *)self->_features countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (_REMutableFeatureSet)init
{
  return [(_REMutableFeatureSet *)self initWithCapacity:0];
}

- (_REMutableFeatureSet)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_REMutableFeatureSet;
  v4 = [(REMutableFeatureSet *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] setWithCapacity:a3];
    features = v4->_features;
    v4->_features = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9C0] setWithCapacity:a3];
    names = v4->_names;
    v4->_names = (NSMutableSet *)v7;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

- (unint64_t)count
{
  return [(NSMutableSet *)self->_features count];
}

- (void)removeFeature:(id)a3
{
  id v5 = a3;
  if (-[_REMutableFeatureSet containsFeature:](self, "containsFeature:"))
  {
    v4 = [v5 name];
    [(NSMutableSet *)self->_features removeObject:v5];
    [(NSMutableSet *)self->_names removeObject:v4];
  }
}

- (BOOL)containsFeature:(id)a3
{
  return [(NSMutableSet *)self->_features containsObject:a3];
}

- (_REMutableFeatureSet)initWithFeature:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_REMutableFeatureSet;
  id v5 = [(REMutableFeatureSet *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v7 = [v4 name];
    uint64_t v8 = [v6 setWithObject:v7];
    names = v5->_names;
    v5->_names = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] setWithObject:v4];
    features = v5->_features;
    v5->_features = (NSMutableSet *)v10;
  }
  return v5;
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
  id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "name", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeAllFeatures
{
  [(NSMutableSet *)self->_features removeAllObjects];
  names = self->_names;
  [(NSMutableSet *)names removeAllObjects];
}

@end