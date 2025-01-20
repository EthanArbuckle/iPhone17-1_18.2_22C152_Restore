@interface _REHashFeatureTransformer
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REHashFeatureTransformer)init;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
@end

@implementation _REHashFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return [&unk_26CFCD398 hash];
}

- (_REHashFeatureTransformer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_REHashFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(REFeatureTransformer *)v2 setName:@"Hash"];
  }
  return v3;
}

- (BOOL)_validateWithFeatures:(id)a3
{
  id v3 = [a3 firstObject];
  BOOL v4 = [v3 featureType] == 1;

  return v4;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)_featureCount
{
  return 1;
}

+ (id)functionName
{
  return @"hash";
}

- (int64_t)_bitCount
{
  return 32;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t v4 = *a3;
  if (REFeatureValueTypeForTaggedPointer(*a3) == 3)
  {
    objc_super v5 = REStringValueForTaggedPointer(v4);
    unsigned int v6 = REHashString(v5);

    uint64_t v7 = v6;
  }
  else
  {
    v8 = (void *)*MEMORY[0x263EFF4A0];
    v9 = REDescriptionForTaggedPointer(v4);
    RERaiseInternalException(v8, @"Feature value %@ isn't a string", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

    uint64_t v7 = 0;
  }
  return RECreateIntegerFeatureValueTaggedPointer(v7);
}

@end