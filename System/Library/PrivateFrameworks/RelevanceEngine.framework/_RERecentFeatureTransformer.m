@interface _RERecentFeatureTransformer
+ (BOOL)supportsInvalidation;
+ (BOOL)supportsPersistence;
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (_RERecentFeatureTransformer)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
- (void)_updateConfigurationForCount:(unint64_t)a3;
- (void)configureWithInvocation:(id)a3;
@end

@implementation _RERecentFeatureTransformer

+ (id)functionName
{
  return @"recent";
}

+ (BOOL)supportsInvalidation
{
  return 1;
}

+ (BOOL)supportsPersistence
{
  return 1;
}

- (_RERecentFeatureTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_RERecentFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(REFeatureValueCounter);
    counter = v2->_counter;
    v2->_counter = v3;

    [(_RERecentFeatureTransformer *)v2 _updateConfigurationForCount:20];
  }
  return v2;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  return [(REFeatureValueCounter *)self->_counter readFromURL:a3 error:a4];
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return [(REFeatureValueCounter *)self->_counter writeToURL:a3 error:a4];
}

- (void)configureWithInvocation:(id)a3
{
  id v21 = a3;
  if ([v21 numberOfArguments] == 1)
  {
    unint64_t v10 = [v21 getArgumentAtIndex:0];
    unint64_t v11 = v10;
    if (v10 && REFeatureValueTypeForTaggedPointer(v10) == 1)
    {
      [(_RERecentFeatureTransformer *)self _updateConfigurationForCount:REIntegerValueForTaggedPointer(v11)];
    }
    else
    {
      v12 = (void *)*MEMORY[0x263EFF4A0];
      v13 = REDescriptionForTaggedPointer(v11);
      RERaiseInternalException(v12, @"Invalid interval %@", v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Incorrect number of arguments. Expecting one or three arguments", v4, v5, v6, v7, v8, v9, v20);
  }
}

- (void)_updateConfigurationForCount:(unint64_t)a3
{
  if (a3 >= 2)
  {
    p_bitCount = &self->_bitCount;
    self->_bitCount = 0;
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"%s Count is too low. Must be 2 or greater.", a3, v3, v4, v5, v6, v7, (uint64_t)"-[_RERecentFeatureTransformer _updateConfigurationForCount:]");
    p_bitCount = &self->_bitCount;
    self->_bitCount = 0;
    if (!a3) {
      goto LABEL_8;
    }
  }
  unint64_t v11 = 0;
  unint64_t v12 = a3;
  do
  {
    ++v11;
    BOOL v13 = v12 > 1;
    v12 >>= 1;
  }
  while (v13);
  unint64_t *p_bitCount = v11;
LABEL_8:
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Recent%lu", a3);
  [(REFeatureTransformer *)self setName:v14];

  counter = self->_counter;
  [(REFeatureValueCounter *)counter setCount:a3];
}

- (int64_t)_bitCount
{
  return self->_bitCount;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  uint64_t v5 = REFeatureValueForTaggedPointer(*a3);
  unint64_t v6 = RECreateIntegerFeatureValueTaggedPointer([(REFeatureValueCounter *)self->_counter trackedValueForValue:v5]);

  return v6;
}

- (BOOL)_validateWithFeatures:(id)a3
{
  uint64_t v3 = [a3 firstObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REFeatureValueCounter count](self->_counter, "count"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (_RERecentFeatureTransformer *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      counter = self->_counter;
      unint64_t v6 = v4;
      uint64_t v7 = [(REFeatureValueCounter *)counter count];
      uint64_t v8 = v6->_counter;

      BOOL v9 = v7 == [(REFeatureValueCounter *)v8 count];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(_RERecentFeatureTransformer);
  [(_RERecentFeatureTransformer *)v4 _updateConfigurationForCount:[(REFeatureValueCounter *)self->_counter count]];
  return v4;
}

- (void).cxx_destruct
{
}

@end