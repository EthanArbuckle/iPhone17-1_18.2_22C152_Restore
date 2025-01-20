@interface _REChangeFeatureTransformer
+ (BOOL)supportsInvalidation;
+ (id)functionName;
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_REChangeFeatureTransformer)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
- (unint64_t)value;
- (void)_updateConfigurationForInterval:(double)a3;
- (void)configureWithInvocation:(id)a3;
- (void)dealloc;
- (void)setValue:(unint64_t)a3;
@end

@implementation _REChangeFeatureTransformer

+ (id)functionName
{
  return @"changed";
}

+ (BOOL)supportsInvalidation
{
  return 1;
}

- (_REChangeFeatureTransformer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_REChangeFeatureTransformer;
  v2 = [(REFeatureTransformer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_REChangeFeatureTransformer *)v2 _updateConfigurationForInterval:10.0];
  }
  return v3;
}

- (void)dealloc
{
  [(_REChangeFeatureTransformer *)self setValue:0];
  v3.receiver = self;
  v3.super_class = (Class)_REChangeFeatureTransformer;
  [(_REChangeFeatureTransformer *)&v3 dealloc];
}

- (void)setValue:(unint64_t)a3
{
  self->_value = a3;
}

- (void)_updateConfigurationForInterval:(double)a3
{
  self->_interval = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"Changed%f", *(void *)&a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(REFeatureTransformer *)self setName:v4];
}

- (void)configureWithInvocation:(id)a3
{
  id v22 = a3;
  if ([v22 numberOfArguments] != 1)
  {
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], @"Incorrect number of arguments. Expecting one or three arguments", v4, v5, v6, v7, v8, v9, v21);
    goto LABEL_9;
  }
  v10 = (void *)[v22 getArgumentAtIndex:0];
  if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 1)
  {
    double v11 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v10);
LABEL_7:
    [(_REChangeFeatureTransformer *)self _updateConfigurationForInterval:v11];
    goto LABEL_9;
  }
  if (REFeatureValueTypeForTaggedPointer((unint64_t)v10) == 2)
  {
    double v11 = REDoubleValueForTaggedPointer(v10, v12);
    goto LABEL_7;
  }
  v13 = (void *)*MEMORY[0x263EFF4A0];
  v14 = REDescriptionForTaggedPointer((unint64_t)v10);
  RERaiseInternalException(v13, @"Invalid interval %@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

LABEL_9:
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
  unint64_t v5 = *a3;
  if (self->_value)
  {
    lastChangeDate = [MEMORY[0x263EFF910] date];
    unint64_t value = self->_value;
    if (v5 != value)
    {
      uint64_t v8 = REFeatureValueTypeForTaggedPointer(v5);
      if (v8 != REFeatureValueTypeForTaggedPointer(value)
        || (REFeatureValueForTaggedPointer(v5),
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            REFeatureValueForTaggedPointer(value),
            v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v9 isEqual:v10],
            v10,
            v9,
            (v11 & 1) == 0))
      {
        [(_REChangeFeatureTransformer *)self setValue:v5];
        objc_storeStrong((id *)&self->_lastChangeDate, lastChangeDate);
        v12 = objc_opt_new();
        v13 = [lastChangeDate dateByAddingTimeInterval:self->_interval];
        [v12 invalidateAtDate:v13];

        [(REFeatureTransformer *)self invalidateWithContext:v12];
      }
    }
    v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:self->_lastChangeDate duration:self->_interval];
    int v15 = [v14 containsDate:lastChangeDate];
  }
  else
  {
    -[_REChangeFeatureTransformer setValue:](self, "setValue:", *a3, a4);
    uint64_t v16 = [MEMORY[0x263EFF910] distantPast];
    int v15 = 0;
    lastChangeDate = self->_lastChangeDate;
    self->_lastChangeDate = v16;
  }

  return RECreateBooleanFeatureValueTaggedPointer(v15);
}

- (BOOL)_validateWithFeatures:(id)a3
{
  objc_super v3 = [a3 firstObject];
  BOOL v4 = v3 != 0;

  return v4;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithDouble:self->_interval];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (_REChangeFeatureTransformer *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_interval == v4->_interval;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(_REChangeFeatureTransformer);
  [(_REChangeFeatureTransformer *)v4 _updateConfigurationForInterval:self->_interval];
  return v4;
}

- (unint64_t)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end