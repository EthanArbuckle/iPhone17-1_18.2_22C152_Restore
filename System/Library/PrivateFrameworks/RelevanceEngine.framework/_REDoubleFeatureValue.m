@interface _REDoubleFeatureValue
+ (id)featureValueWithDouble:(double)a3;
- (BOOL)isEqual:(id)a3;
- (_REDoubleFeatureValue)initWithValue:(double)a3;
- (double)doubleValue;
- (unint64_t)_integralFeatureValue;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation _REDoubleFeatureValue

- (unint64_t)hash
{
  v2 = [NSNumber numberWithDouble:self->_value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (unint64_t)type
{
  return 2;
}

+ (id)featureValueWithDouble:(double)a3
{
  if (featureValueWithDouble__onceToken != -1) {
    dispatch_once(&featureValueWithDouble__onceToken, &__block_literal_global_222);
  }
  if (fabs(a3) < *(double *)&REFloatingPointTaggedPointerPrecision)
  {
    v4 = (void *)featureValueWithDouble__ZeroValue;
LABEL_7:
    v5 = v4;
    goto LABEL_9;
  }
  if (fabs(a3 + -1.0) < *(double *)&REFloatingPointTaggedPointerPrecision)
  {
    v4 = (void *)featureValueWithDouble__OneValue;
    goto LABEL_7;
  }
  v5 = [[_REDoubleFeatureValue alloc] initWithValue:a3];
LABEL_9:
  return v5;
}

- (double)doubleValue
{
  return self->_value;
}

- (_REDoubleFeatureValue)initWithValue:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_REDoubleFeatureValue;
  result = [(_REDoubleFeatureValue *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_REDoubleFeatureValue *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && vabdd_f64(self->_value, v4->_value) < *(double *)&REFloatingPointTaggedPointerPrecision;
  }

  return v5;
}

- (unint64_t)_integralFeatureValue
{
  return *(void *)&self->_value;
}

@end