@interface _REFrequencyFeatureTransformer
+ (BOOL)supportsInvalidation;
+ (BOOL)supportsPersistence;
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (_REFrequencyFeatureTransformer)init;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
- (void)_updateConfigurationForCount:(unint64_t)a3;
- (void)configureWithInvocation:(id)a3;
- (void)increaseCountForFeatureValue:(id)a3;
@end

@implementation _REFrequencyFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  v4 = (_REFrequencyFeatureTransformer *)a3;
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
      v6 = v4;
      uint64_t v7 = [(REFeatureValueCounter *)counter count];
      v8 = v6->_counter;

      BOOL v9 = v7 == [(REFeatureValueCounter *)v8 count];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  return [(REFeatureValueCounter *)self->_counter readFromURL:a3 error:a4];
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REFeatureValueCounter count](self->_counter, "count"));
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsPersistence
{
  return 1;
}

+ (BOOL)supportsInvalidation
{
  return 1;
}

+ (id)functionName
{
  return @"frequency";
}

- (_REFrequencyFeatureTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_REFrequencyFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v6 init];
  if (v2)
  {
    unint64_t v3 = objc_alloc_init(REFeatureValueCounter);
    counter = v2->_counter;
    v2->_counter = v3;

    [(_REFrequencyFeatureTransformer *)v2 _updateConfigurationForCount:20];
  }
  return v2;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return [(REFeatureValueCounter *)self->_counter writeToURL:a3 error:a4];
}

- (void)configureWithInvocation:(id)a3
{
  id v21 = a3;
  if ((unint64_t)([v21 numberOfArguments] - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    self->_validCount = -1;
    if ([v21 numberOfArguments] == 2) {
      self->_validCount = REIntegerValueForTaggedPointer([v21 getArgumentAtIndex:1]);
    }
    unint64_t v10 = [v21 getArgumentAtIndex:0];
    unint64_t v11 = v10;
    if (v10 && REFeatureValueTypeForTaggedPointer(v10) == 1)
    {
      [(_REFrequencyFeatureTransformer *)self _updateConfigurationForCount:REIntegerValueForTaggedPointer(v11)];
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
  if (a3 <= 1) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"%s Count is too low. Must be 2 or greater.", a3, v3, v4, v5, v6, v7, (uint64_t)"-[_REFrequencyFeatureTransformer _updateConfigurationForCount:]");
  }
  unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Frequency%lu", a3);
  [(REFeatureTransformer *)self setName:v10];

  counter = self->_counter;
  [(REFeatureValueCounter *)counter setCount:a3];
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
  unint64_t v6 = [(REFeatureValueCounter *)self->_counter totalCount];
  unint64_t validCount = self->_validCount;
  if ((validCount & 0x8000000000000000) != 0 || v6 > validCount)
  {
    uint64_t v9 = REFeatureValueForTaggedPointer(*a3);
    [(REFeatureValueCounter *)self->_counter countForValue:v9];
    unint64_t v10 = RECreateDoubleFeatureValueTaggedPointer();

    return v10;
  }
  else
  {
    return RECreateIntegerFeatureValueTaggedPointer(-1);
  }
}

- (BOOL)_validateWithFeatures:(id)a3
{
  uint64_t v3 = [a3 firstObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)increaseCountForFeatureValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end