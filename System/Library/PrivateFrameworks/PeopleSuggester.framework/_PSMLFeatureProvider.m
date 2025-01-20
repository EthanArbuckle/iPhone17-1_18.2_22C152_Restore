@interface _PSMLFeatureProvider
- (NSSet)featureNames;
- (_PSMLFeatureProvider)init;
- (_PSMLFeatureProvider)initWithFeatureValues:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)featureValueForName:(id)a3;
- (void)setNumber:(id)a3 forFeature:(id)a4;
- (void)setString:(id)a3 forFeature:(id)a4;
- (void)setValue:(id)a3 forFeature:(id)a4;
@end

@implementation _PSMLFeatureProvider

- (_PSMLFeatureProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PSMLFeatureProvider;
  v2 = [(_PSMLFeatureProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    featureValues = v2->_featureValues;
    v2->_featureValues = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    featureNames = v2->_featureNames;
    v2->_featureNames = (NSMutableSet *)v5;
  }
  return v2;
}

- (_PSMLFeatureProvider)initWithFeatureValues:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_PSMLFeatureProvider;
  uint64_t v5 = [(_PSMLFeatureProvider *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    featureValues = v5->_featureValues;
    v5->_featureValues = (NSMutableDictionary *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v9 = [v4 allKeys];
    uint64_t v10 = [v8 initWithArray:v9];
    featureNames = v5->_featureNames;
    v5->_featureNames = (NSMutableSet *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_featureValues copy];
  uint64_t v6 = (void *)[v4 initWithFeatureValues:v5];

  return v6;
}

- (void)setValue:(id)a3 forFeature:(id)a4
{
  featureValues = self->_featureValues;
  id v7 = a4;
  [(NSMutableDictionary *)featureValues setObject:a3 forKeyedSubscript:v7];
  [(NSMutableSet *)self->_featureNames addObject:v7];
}

- (void)setNumber:(id)a3 forFeature:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (!strcmp((const char *)[v17 objCType], "i"))
  {
    v11 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v12 = (int)[v17 intValue];
    objc_super v13 = v11;
LABEL_11:
    uint64_t v15 = [v13 featureValueWithInt64:v12];
    goto LABEL_12;
  }
  id v7 = v17;
  if (strcmp((const char *)[v7 objCType], "d"))
  {
    id v8 = v7;
    if (!strcmp((const char *)[v8 objCType], "B"))
    {
      v16 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v12 = [v8 BOOLValue];
    }
    else
    {
      id v9 = v8;
      if (strcmp((const char *)[v9 objCType], "q"))
      {
        uint64_t v10 = 0;
        goto LABEL_13;
      }
      v16 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v12 = [v9 longValue];
    }
    objc_super v13 = v16;
    goto LABEL_11;
  }
  v14 = (void *)MEMORY[0x1E4F1E950];
  [v7 doubleValue];
  uint64_t v15 = objc_msgSend(v14, "featureValueWithDouble:");
LABEL_12:
  uint64_t v10 = (void *)v15;
LABEL_13:
  [(NSMutableDictionary *)self->_featureValues setObject:v10 forKeyedSubscript:v6];
  [(NSMutableSet *)self->_featureNames addObject:v6];
}

- (void)setString:(id)a3 forFeature:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1E950];
  id v8 = a4;
  id v7 = [v6 featureValueWithString:a3];
  [(NSMutableDictionary *)self->_featureValues setObject:v7 forKeyedSubscript:v8];

  [(NSMutableSet *)self->_featureNames addObject:v8];
}

- (id)featureValueForName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_featureValues objectForKeyedSubscript:a3];
}

- (NSSet)featureNames
{
  return &self->_featureNames->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNames, 0);

  objc_storeStrong((id *)&self->_featureValues, 0);
}

@end