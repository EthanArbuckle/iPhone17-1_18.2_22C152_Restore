@interface _RETransformedFeature
- (BOOL)isEqual:(id)a3;
- (REFeatureSet)features;
- (REFeatureTransformer)transformer;
- (_RETransformedFeature)initWithTransformer:(id)a3 features:(id)a4;
- (id)_dependentFeatures;
- (id)_rootFeatures;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (int64_t)_bitCount;
- (unint64_t)featureType;
- (unint64_t)hash;
- (void)_computeHash;
- (void)_replaceDependentFeature:(id)a3 withFeature:(id)a4;
@end

@implementation _RETransformedFeature

- (id)_dependentFeatures
{
  return self->_features;
}

- (id)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_RETransformedFeature *)a3;
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
      transformer = self->_transformer;
      v7 = v5->_transformer;
      if (transformer == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = transformer;
        int v10 = [(REFeatureTransformer *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      features = self->_features;
      v13 = v5->_features;
      v14 = features;
      v15 = v14;
      if (v14 == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [(REFeatureSet *)v14 isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)_rootFeatures
{
  return RERootFeatureSetForFeatures(self->_features);
}

- (int64_t)_bitCount
{
  return [(REFeatureTransformer *)self->_transformer _bitCount];
}

- (unint64_t)featureType
{
  return [(REFeatureTransformer *)self->_transformer _outputType];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_name);
  objc_storeStrong(v4 + 4, self->_transformer);
  objc_storeStrong(v4 + 3, self->_features);
  [v4 _computeHash];
  return v4;
}

- (void)_computeHash
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_hash = [(REFeatureTransformer *)self->_transformer hash];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_features;
  uint64_t v4 = [(REFeatureSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
      uint64_t v5 = [(REFeatureSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)hash
{
  return self->_hash;
}

- (_RETransformedFeature)initWithTransformer:(id)a3 features:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_RETransformedFeature;
  long long v8 = [(_RETransformedFeature *)&v27 init];
  if (v8)
  {
    if (([(id)objc_opt_class() supportsInvalidation] & 1) != 0
      || [(id)objc_opt_class() supportsPersistence])
    {
      uint64_t v9 = [v6 copy];

      id v6 = (id)v9;
    }
    objc_storeStrong((id *)&v8->_transformer, v6);
    uint64_t v10 = +[REFeatureSet featureSetWithFeatures:v7];
    features = v8->_features;
    v8->_features = (REFeatureSet *)v10;

    v12 = [MEMORY[0x263F089D8] string];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v17), "name", (void)v23);
          [v12 appendString:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }

    v19 = [v6 name];
    [v12 appendString:v19];

    uint64_t v20 = [v12 copy];
    name = v8->_name;
    v8->_name = (NSString *)v20;

    [(_RETransformedFeature *)v8 _computeHash];
  }

  return v8;
}

- (REFeatureTransformer)transformer
{
  return self->_transformer;
}

- (void)_replaceDependentFeature:(id)a3 withFeature:(id)a4
{
  id v20 = a4;
  id v6 = a3;
  id v7 = [v6 name];
  long long v8 = [v20 name];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"This API is only meant to switch around pointers to the same type of object", v10, v11, v12, v13, v14, v15, v19);
  }
  uint64_t v16 = (void *)[(REFeatureSet *)self->_features mutableCopy];
  [v16 removeFeature:v6];

  [v16 addFeature:v20];
  uint64_t v17 = (REFeatureSet *)[v16 copy];
  features = self->_features;
  self->_features = v17;

  [(_RETransformedFeature *)self _computeHash];
}

- (REFeatureSet)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end