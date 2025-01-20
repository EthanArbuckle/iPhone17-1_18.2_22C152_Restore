@interface _REBinaryFeatureTransformer
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REBinaryFeatureTransformer)init;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
- (unint64_t)threshold;
- (void)configureWithInvocation:(id)a3;
- (void)dealloc;
- (void)setThreshold:(unint64_t)a3;
@end

@implementation _REBinaryFeatureTransformer

+ (id)functionName
{
  return @"threshold";
}

- (_REBinaryFeatureTransformer)init
{
  v4.receiver = self;
  v4.super_class = (Class)_REBinaryFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v4 init];
  if (v2)
  {
    [(_REBinaryFeatureTransformer *)v2 setThreshold:RECreateIntegerFeatureValueTaggedPointer(0)];
    [(REFeatureTransformer *)v2 setName:@"Binary"];
  }
  return v2;
}

- (void)dealloc
{
  [(_REBinaryFeatureTransformer *)self setThreshold:0];
  v3.receiver = self;
  v3.super_class = (Class)_REBinaryFeatureTransformer;
  [(_REBinaryFeatureTransformer *)&v3 dealloc];
}

- (void)setThreshold:(unint64_t)a3
{
  self->_threshold = a3;
}

- (void)configureWithInvocation:(id)a3
{
  id v11 = a3;
  if ([v11 numberOfArguments] == 1) {
    -[_REBinaryFeatureTransformer setThreshold:](self, "setThreshold:", [v11 getArgumentAtIndex:0]);
  }
  else {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Expecting one argument in the invocation", v4, v5, v6, v7, v8, v9, v10);
  }
}

- (int64_t)_bitCount
{
  return 1;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 0;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  BOOL v4 = RECompareFeatureValues(*a3, (void *)self->_threshold) == 1;
  return RECreateBooleanFeatureValueTaggedPointer(v4);
}

- (BOOL)_validateWithFeatures:(id)a3
{
  objc_super v3 = [a3 firstObject];
  BOOL v4 = [v3 featureType] == 2;

  return v4;
}

- (unint64_t)hash
{
  return REFeatureValueHashForTaggedPointer(self->_threshold);
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (_REBinaryFeatureTransformer *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unint64_t threshold = self->_threshold;
      unint64_t v7 = v5->_threshold;
      if (threshold == v7)
      {
        char v8 = 1;
      }
      else
      {
        uint64_t v9 = REFeatureValueTypeForTaggedPointer(threshold);
        if (v9 == REFeatureValueTypeForTaggedPointer(v7))
        {
          uint64_t v10 = REFeatureValueForTaggedPointer(threshold);
          id v11 = REFeatureValueForTaggedPointer(v7);
          char v8 = [v10 isEqual:v11];
        }
        else
        {
          char v8 = 0;
        }
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)threshold
{
  return self->_threshold;
}

@end