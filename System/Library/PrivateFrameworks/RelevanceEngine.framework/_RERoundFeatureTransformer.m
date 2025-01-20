@interface _RERoundFeatureTransformer
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_RERoundFeatureTransformer)init;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
@end

@implementation _RERoundFeatureTransformer

+ (id)functionName
{
  return @"round";
}

- (_RERoundFeatureTransformer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_RERoundFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(REFeatureTransformer *)v2 setName:@"Round"];
  }
  return v3;
}

- (int64_t)_bitCount
{
  return -1;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 2;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  v4 = (void *)*a3;
  if (REFeatureValueTypeForTaggedPointer(*a3) == 1)
  {
    RERetainFeatureValueTaggedPointer(v4);
    return (unint64_t)v4;
  }
  else
  {
    REDoubleValueForTaggedPointer(v4, v5);
    return RECreateDoubleFeatureValueTaggedPointer();
  }
}

- (BOOL)_validateWithFeatures:(id)a3
{
  v3 = [a3 firstObject];
  BOOL v4 = [v3 featureType] == 2;

  return v4;
}

- (unint64_t)hash
{
  return 0xFF4352C498039EA1;
}

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

@end