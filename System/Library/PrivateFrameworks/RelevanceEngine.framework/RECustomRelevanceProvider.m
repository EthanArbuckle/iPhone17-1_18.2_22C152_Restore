@interface RECustomRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (RECustomRelevanceProvider)initWithDictionary:(id)a3;
- (RECustomRelevanceProvider)initWithFeature:(id)a3 value:(unint64_t)a4;
- (REFeature)feature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
- (unint64_t)value;
- (void)dealloc;
@end

@implementation RECustomRelevanceProvider

- (RECustomRelevanceProvider)initWithFeature:(id)a3 value:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RECustomRelevanceProvider;
  v8 = [(RERelevanceProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_feature, a3);
    v9->_value = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a4);
  }

  return v9;
}

- (void)dealloc
{
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)RECustomRelevanceProvider;
  [(RECustomRelevanceProvider *)&v3 dealloc];
}

+ (id)relevanceSimulatorID
{
  return @"custom_provider";
}

- (RECustomRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"feature_name"];
  v6 = (void *)v5;
  id v7 = &stru_26CFA57D0;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = [v4 objectForKeyedSubscript:@"feature_type"];
  v10 = +[REFeature featureWithName:featureType:](REFeature, "featureWithName:featureType:", v8, [v9 integerValue]);

  objc_super v11 = +[REFeatureValue featureValueWithDictionary:v4];

  v12 = (const void *)RECreateFeatureValueTaggedPointer(v11);
  v13 = [(RECustomRelevanceProvider *)self initWithFeature:v10 value:v12];
  REReleaseFeatureValueTaggedPointer(v12);

  return v13;
}

- (id)dictionaryEncoding
{
  v21[2] = *MEMORY[0x263EF8340];
  objc_super v3 = [(REFeature *)self->_feature _dependentFeatures];
  uint64_t v4 = [v3 count];

  if (v4) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"We don't currently handle encoding this feature type", v5, v6, v7, v8, v9, v10, v19);
  }
  v20[0] = @"feature_name";
  objc_super v11 = [(REFeature *)self->_feature name];
  v20[1] = @"feature_type";
  v21[0] = v11;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REFeature featureType](self->_feature, "featureType"));
  v21[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  v14 = REFeatureValueForTaggedPointer(self->_value);
  v15 = [v14 dictionaryEncoding];
  v16 = (void *)[v15 mutableCopy];

  [v16 addEntriesFromDictionary:v13];
  v17 = (void *)[v16 copy];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RECustomRelevanceProvider;
  uint64_t v4 = [(RERelevanceProvider *)&v7 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_feature);
  value = (void *)self->_value;
  v4[5] = value;
  RERetainFeatureValueTaggedPointer(value);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RECustomRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)RECustomRelevanceProvider;
    if ([(RERelevanceProvider *)&v18 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = v4;
        feature = self->_feature;
        objc_super v7 = v5->_feature;
        if (feature == v7)
        {
        }
        else
        {
          uint64_t v8 = v7;
          uint64_t v9 = feature;
          BOOL v10 = [(REFeature *)v9 isEqual:v8];

          if (!v10) {
            goto LABEL_14;
          }
        }
        unint64_t value = self->_value;
        unint64_t v13 = v5->_value;
        if (value == v13)
        {
          char v11 = 1;
        }
        else
        {
          uint64_t v14 = REFeatureValueTypeForTaggedPointer(value);
          if (v14 != REFeatureValueTypeForTaggedPointer(v13))
          {
LABEL_14:
            char v11 = 0;
            goto LABEL_15;
          }
          v15 = REFeatureValueForTaggedPointer(value);
          v16 = REFeatureValueForTaggedPointer(v13);
          char v11 = [v15 isEqual:v16];
        }
LABEL_15:

        goto LABEL_16;
      }
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)_hash
{
  uint64_t v3 = REFeatureValueHashForTaggedPointer(self->_value);
  return [(REFeature *)self->_feature hash] ^ v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)RECustomRelevanceProvider;
  uint64_t v3 = [(RECustomRelevanceProvider *)&v8 description];
  feature = self->_feature;
  uint64_t v5 = REDescriptionForTaggedPointer(self->_value);
  uint64_t v6 = [v3 stringByAppendingFormat:@" feature=%@, value=%@", feature, v5];

  return v6;
}

- (REFeature)feature
{
  return self->_feature;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end