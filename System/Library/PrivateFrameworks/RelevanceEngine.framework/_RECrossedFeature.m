@interface _RECrossedFeature
- (BOOL)isEqual:(id)a3;
- (NSArray)features;
- (_RECrossedFeature)initWithFeatures:(id)a3;
- (id)_dependentFeatures;
- (id)_rootFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (int64_t)_bitCount;
- (unint64_t)featureType;
- (unint64_t)hash;
- (void)_computeHash;
- (void)_replaceDependentFeature:(id)a3 withFeature:(id)a4;
- (void)_updateFeaturesArray;
@end

@implementation _RECrossedFeature

- (unint64_t)hash
{
  return self->_hash;
}

- (id)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_RECrossedFeature *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_featureType == v5->_featureType)
      {
        features = self->_features;
        v8 = v5->_features;
        v9 = features;
        v10 = v9;
        if (v9 == v8) {
          char v11 = 1;
        }
        else {
          char v11 = [(NSArray *)v9 isEqual:v8];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (id)_dependentFeatures
{
  return self->_dependentFeatures;
}

- (id)_rootFeatures
{
  return RERootFeatureSetForFeatures(self->_dependentFeatures);
}

- (_RECrossedFeature)initWithFeatures:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v37 = +[REFeatureSet featureSet];
  unint64_t v4 = +[REMLModel featureBitWidth];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v45;
    v9 = (void *)*MEMORY[0x263EFF4A0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v12 = [v11 _bitCount];
        if (v12 < 0)
        {
          RERaiseInternalException(v9, @"Feature %@ cannot be crossed. It may need to be transformed first", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
        }
        else
        {
          uint64_t v19 = v12 + v7;
          if (v12 + v7 <= v4)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [v11 _dependentFeatures];
              [v37 unionFeatureSet:v20];
            }
            else
            {
              [v37 addFeature:v11];
            }
            uint64_t v7 = v19;
          }
          else
          {
            RERaiseInternalException(v9, @"Feature %@ cannot be crossed with other features. It requires too much precision", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v6);
  }

  v43.receiver = self;
  v43.super_class = (Class)_RECrossedFeature;
  v21 = [(_RECrossedFeature *)&v43 init];
  if (v21)
  {
    uint64_t v22 = [v37 copy];
    dependentFeatures = v21->_dependentFeatures;
    v21->_dependentFeatures = (REFeatureSet *)v22;

    [(_RECrossedFeature *)v21 _updateFeaturesArray];
    v21->_bitCount = 0;
    v24 = [MEMORY[0x263F089D8] string];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v25 = v21->_features;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      uint64_t v29 = 1;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          v31 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          if ([v24 length]) {
            [v24 appendString:@"X"];
          }
          v32 = [v31 name];
          [v24 appendString:v32];

          if ([v31 featureType] == 2) {
            uint64_t v29 = 2;
          }
          v21->_bitCount += [v31 _bitCount];
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v27);
    }
    else
    {
      uint64_t v29 = 1;
    }

    uint64_t v33 = [v24 copy];
    name = v21->_name;
    v21->_name = (NSString *)v33;

    v21->_featureType = v29;
    [(_RECrossedFeature *)v21 _computeHash];
  }
  return v21;
}

- (void)_updateFeaturesArray
{
  id v5 = [(REFeatureSet *)self->_dependentFeatures allFeatures];
  id v3 = [v5 sortedArrayUsingComparator:&__block_literal_global_75];
  features = self->_features;
  self->_features = v3;
}

- (void)_computeHash
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_hash = self->_featureType;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_features;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        self->_hash ^= objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "hash", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  features = self->_features;
  return (id)[v4 initWithFeatures:features];
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (int64_t)_bitCount
{
  return self->_bitCount;
}

- (void)_replaceDependentFeature:(id)a3 withFeature:(id)a4
{
  id v20 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 name];
  long long v8 = [v20 name];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"This API is only meant to switch around pointers to the same type of object", v10, v11, v12, v13, v14, v15, v19);
  }
  uint64_t v16 = (void *)[(REFeatureSet *)self->_dependentFeatures mutableCopy];
  [v16 removeFeature:v6];

  [v16 addFeature:v20];
  uint64_t v17 = (REFeatureSet *)[v16 copy];
  dependentFeatures = self->_dependentFeatures;
  self->_dependentFeatures = v17;

  [(_RECrossedFeature *)self _updateFeaturesArray];
  [(_RECrossedFeature *)self _computeHash];
}

- (NSArray)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_dependentFeatures, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end