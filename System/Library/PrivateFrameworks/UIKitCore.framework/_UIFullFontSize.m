@interface _UIFullFontSize
+ (id)defaultValue;
+ (id)valued:(double)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsEvaluation;
- (BOOL)setNeedsEvaluation;
- (_UIFullFontSize)initWithValue:(double)a3 isDefault:(BOOL)a4;
- (double)valueWithEvaluationIfNeeded:(id)a3;
- (id)overrideUnlessDefault:(double)value;
@end

@implementation _UIFullFontSize

- (double)valueWithEvaluationIfNeeded:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isDefault && self->_needsEvaluation)
  {
    self->_needsEvaluation = 0;
    self->_double value = (*((double (**)(id))v4 + 2))(v4);
  }
  double value = self->_value;

  return value;
}

+ (id)defaultValue
{
  v2 = [_UIFullFontSize alloc];
  [off_1E52D39B8 defaultFontSize];
  v3 = -[_UIFullFontSize initWithValue:isDefault:](v2, "initWithValue:isDefault:", 1);
  return v3;
}

+ (id)valued:(double)a3
{
  v3 = [[_UIFullFontSize alloc] initWithValue:0 isDefault:a3];
  return v3;
}

- (_UIFullFontSize)initWithValue:(double)a3 isDefault:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFullFontSize;
  result = [(_UIFullFontSize *)&v7 init];
  if (result)
  {
    result->_double value = a3;
    result->_isDefault = a4;
    result->_needsEvaluation = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (self->_isDefault) {
      BOOL v6 = *((unsigned char *)v5 + 16) != 0;
    }
    else {
      BOOL v6 = !*((unsigned char *)v5 + 16)
    }
        && !self->_needsEvaluation
        && !*((unsigned char *)v5 + 17)
        && vabdd_f64(self->_value, *((double *)v5 + 1)) < 0.00000011920929;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)needsEvaluation
{
  return self->_isDefault && self->_needsEvaluation;
}

- (BOOL)setNeedsEvaluation
{
  BOOL isDefault = self->_isDefault;
  if (self->_isDefault) {
    self->_needsEvaluation = 1;
  }
  return isDefault;
}

- (id)overrideUnlessDefault:(double)value
{
  id v5 = [_UIFullFontSize alloc];
  if (self->_isDefault) {
    double value = self->_value;
  }
  BOOL v6 = [(_UIFullFontSize *)v5 initWithValue:self->_isDefault isDefault:value];
  if (self->_isDefault) {
    v6->_needsEvaluation = self->_needsEvaluation;
  }
  return v6;
}

@end