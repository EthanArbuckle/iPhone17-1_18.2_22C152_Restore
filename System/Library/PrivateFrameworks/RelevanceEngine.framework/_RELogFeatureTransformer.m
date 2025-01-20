@interface _RELogFeatureTransformer
- (BOOL)_validateWithFeatures:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_RELogFeatureTransformer)initWithBase:(id)a3;
- (int64_t)_bitCount;
- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4;
- (unint64_t)_featureCount;
- (unint64_t)_outputType;
- (unint64_t)hash;
@end

@implementation _RELogFeatureTransformer

- (_RELogFeatureTransformer)initWithBase:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_RELogFeatureTransformer;
  v5 = [(REFeatureTransformer *)&v13 init];
  if (v5)
  {
    if ([v4 type] == 1) {
      double v6 = (double)(unint64_t)[v4 int64Value];
    }
    else {
      [v4 doubleValue];
    }
    v5->_long double base = v6;
    v5->_type = 3;
    long double base = v5->_base;
    float v8 = base;
    if (fabsf(v8 + -2.7183) >= 0.00000011921)
    {
      if (fabsf(v8 + -2.0) >= 0.00000011921)
      {
        if (fabsf(v8 + -10.0) >= 0.00000011921)
        {
          long double v10 = log(base);
          v5->_long double base = v10;
          objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&v10);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v5->_type = 2;
          v9 = @"10";
        }
      }
      else
      {
        v5->_type = 1;
        v9 = @"2";
      }
    }
    else
    {
      v5->_type = 0;
      v9 = @"e";
    }
    v11 = [@"Log" stringByAppendingString:v9];
    [(REFeatureTransformer *)v5 setName:v11];
  }
  return v5;
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
  v5 = (void *)*a3;
  if (REFeatureValueTypeForTaggedPointer(*a3) == 1) {
    double v7 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v5);
  }
  else {
    double v7 = REDoubleValueForTaggedPointer(v5, v6);
  }
  switch(self->_type)
  {
    case 0uLL:
      log(v7);
      break;
    case 1uLL:
      log2(v7);
      break;
    case 2uLL:
      log10(v7);
      break;
    case 3uLL:
      if (fabs(self->_base) >= 0.0000001) {
        log(v7);
      }
      break;
    default:
      break;
  }
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (BOOL)_validateWithFeatures:(id)a3
{
  v3 = [a3 firstObject];
  BOOL v4 = [v3 featureType] == 2;

  return v4;
}

- (unint64_t)hash
{
  if (self->_type != 3) {
    return self->_type;
  }
  v2 = [NSNumber numberWithDouble:self->_base];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (_RELogFeatureTransformer *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  unint64_t type = self->_type;
  unint64_t v6 = v4->_type;
  if (type == 3 && v6 == 3)
  {
    float base = self->_base;
    float v10 = v4->_base;
    BOOL v8 = vabds_f32(base, v10) < 0.00000011921;
    goto LABEL_11;
  }
  if (type == v6) {
LABEL_8:
  }
    BOOL v8 = 1;
  else {
LABEL_9:
  }
    BOOL v8 = 0;
LABEL_11:

  return v8;
}

@end