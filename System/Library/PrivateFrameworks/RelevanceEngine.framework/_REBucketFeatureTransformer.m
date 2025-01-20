@interface _REBucketFeatureTransformer
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REBucketFeatureTransformer)init;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
- (unint64_t)max;
- (unint64_t)min;
- (void)_updateConfigurationForCount:(unint64_t)a3;
- (void)configureWithInvocation:(id)a3;
- (void)dealloc;
- (void)setMax:(unint64_t)a3;
- (void)setMin:(unint64_t)a3;
@end

@implementation _REBucketFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  v4 = (_REBucketFeatureTransformer *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t min = self->_min;
      unint64_t v7 = v5->_min;
      if (min != v7)
      {
        uint64_t v15 = REFeatureValueTypeForTaggedPointer(self->_min);
        if (v15 != REFeatureValueTypeForTaggedPointer(v7)) {
          goto LABEL_13;
        }
        v16 = REFeatureValueForTaggedPointer(min);
        v17 = REFeatureValueForTaggedPointer(v7);
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_13;
        }
      }
      unint64_t max = self->_max;
      unint64_t v9 = v5->_max;
      if (max != v9)
      {
        uint64_t v10 = REFeatureValueTypeForTaggedPointer(self->_max);
        if (v10 != REFeatureValueTypeForTaggedPointer(v9)) {
          goto LABEL_13;
        }
        v11 = REFeatureValueForTaggedPointer(max);
        v12 = REFeatureValueForTaggedPointer(v9);
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_13;
        }
      }
      if (self->_count == v5->_count) {
        BOOL v14 = self->_bitCount == v5->_bitCount;
      }
      else {
LABEL_13:
      }
        BOOL v14 = 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (int64_t)_bitCount
{
  return self->_bitCount;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v3 = REFeatureValueHashForTaggedPointer(self->_min);
  return REFeatureValueHashForTaggedPointer(self->_max) ^ v3;
}

- (void)configureWithInvocation:(id)a3
{
  id v32 = a3;
  uint64_t v4 = [v32 numberOfArguments];
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v29 = (void *)*MEMORY[0x263EFF4A0];
    v30 = @"Incorrect number of arguments. Expecting one or three arguments";
LABEL_12:
    RERaiseInternalException(v29, v30, v5, v6, v7, v8, v9, v10, v31);
    goto LABEL_13;
  }
  uint64_t v11 = v4;
  uint64_t v12 = REIntegerValueForTaggedPointer([v32 getArgumentAtIndex:0]);
  if (!v12)
  {
    v29 = (void *)*MEMORY[0x263EFF4A0];
    v30 = @"Invalid number of buckets";
    goto LABEL_12;
  }
  [(_REBucketFeatureTransformer *)self _updateConfigurationForCount:v12];
  int v13 = v32;
  if (v11 == 1) {
    goto LABEL_14;
  }
  unint64_t v14 = [v32 getArgumentAtIndex:1];
  unint64_t v15 = [v32 getArgumentAtIndex:2];
  if (REFeatureValueTypeForTaggedPointer(v14) != 1 && REFeatureValueTypeForTaggedPointer(v14) != 2) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Bucket transformer only supports Int64 or Double values types", v16, v17, v18, v19, v20, v21, v31);
  }
  uint64_t v22 = REFeatureValueTypeForTaggedPointer(v14);
  if (v22 != REFeatureValueTypeForTaggedPointer(v15)) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Bucket transformer min and max value types must match", v23, v24, v25, v26, v27, v28, v31);
  }
  [(_REBucketFeatureTransformer *)self setMin:v14];
  [(_REBucketFeatureTransformer *)self setMax:v15];
LABEL_13:
  int v13 = v32;
LABEL_14:
}

- (_REBucketFeatureTransformer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_REBucketFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(_REBucketFeatureTransformer *)v2 _updateConfigurationForCount:10];
    [(_REBucketFeatureTransformer *)v3 setMin:RECreateDoubleFeatureValueTaggedPointer()];
    [(_REBucketFeatureTransformer *)v3 setMax:RECreateDoubleFeatureValueTaggedPointer()];
  }
  return v3;
}

- (void)setMin:(unint64_t)a3
{
  self->_unint64_t min = a3;
}

- (void)setMax:(unint64_t)a3
{
  self->_unint64_t max = a3;
}

- (void)_updateConfigurationForCount:(unint64_t)a3
{
  self->_unint64_t count = a3;
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Bucket%lu", a3);
  [(REFeatureTransformer *)self setName:v4];

  unint64_t count = self->_count;
  self->_bitCount = 0;
  unint64_t v6 = count - 1;
  if (v6)
  {
    int64_t v7 = 0;
    do
    {
      ++v7;
      BOOL v8 = v6 > 1;
      v6 >>= 1;
    }
    while (v8);
    self->_bitCount = v7;
  }
}

- (BOOL)_validateWithFeatures:(id)a3
{
  uint64_t v3 = [a3 firstObject];
  BOOL v4 = [v3 featureType] == 2;

  return v4;
}

- (unint64_t)_featureCount
{
  return 1;
}

+ (id)functionName
{
  return @"bucket";
}

- (void)dealloc
{
  [(_REBucketFeatureTransformer *)self setMin:0];
  [(_REBucketFeatureTransformer *)self setMax:0];
  v3.receiver = self;
  v3.super_class = (Class)_REBucketFeatureTransformer;
  [(_REBucketFeatureTransformer *)&v3 dealloc];
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  if (self->_count)
  {
    objc_super v5 = (void *)*a3;
    uint64_t v6 = REFeatureValueTypeForTaggedPointer(self->_min);
    uint64_t v7 = REFeatureValueTypeForTaggedPointer((unint64_t)v5);
    if (v6 == 1)
    {
      if (v7 == 1) {
        uint64_t v9 = REIntegerValueForTaggedPointer((unint64_t)v5);
      }
      else {
        uint64_t v9 = (uint64_t)REDoubleValueForTaggedPointer(v5, v8);
      }
      uint64_t v13 = REIntegerValueForTaggedPointer(self->_min);
      uint64_t v14 = REIntegerValueForTaggedPointer(self->_max);
      unint64_t count = self->_count;
      uint64_t v16 = (unint64_t)((double)(v9 - v13) / ((double)(v14 - v13) / (double)count));
    }
    else
    {
      if (v7 == 1) {
        double v12 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v5);
      }
      else {
        double v12 = REDoubleValueForTaggedPointer(v5, v8);
      }
      double v17 = REDoubleValueForTaggedPointer((void *)self->_min, v11);
      double v19 = REDoubleValueForTaggedPointer((void *)self->_max, v18);
      unint64_t count = self->_count;
      uint64_t v16 = (uint64_t)((v12 - v17) / ((v19 - v17) / (double)count));
    }
    if (v16 >= count) {
      unint64_t v20 = count - 1;
    }
    else {
      unint64_t v20 = v16;
    }
    if (v16 >= 0) {
      uint64_t v10 = v20;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return RECreateIntegerFeatureValueTaggedPointer(v10);
}

- (unint64_t)min
{
  return self->_min;
}

- (unint64_t)max
{
  return self->_max;
}

@end