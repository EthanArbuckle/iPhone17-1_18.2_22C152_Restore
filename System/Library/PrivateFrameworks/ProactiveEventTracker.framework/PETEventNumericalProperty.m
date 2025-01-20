@interface PETEventNumericalProperty
- (BOOL)isValidValue:(id)a3;
- (PETEventNumericalProperty)initWithName:(id)a3 range:(_NSRange)a4 clampValues:(BOOL)a5;
- (_NSRange)validRange;
- (id)_loggingKeyStringRepresentationForValue:(id)a3;
- (id)description;
- (id)longestValueString;
- (unint64_t)_unsignedIntegerValueForNumericValue:(id)a3;
- (unint64_t)cardinality;
@end

@implementation PETEventNumericalProperty

- (id)longestValueString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_validRange.location + self->_validRange.length - 1);
}

- (unint64_t)cardinality
{
  return self->_validRange.length;
}

- (unint64_t)_unsignedIntegerValueForNumericValue:(id)a3
{
  if (self->_clampValues)
  {
    p_validRange = &self->_validRange;
    NSUInteger location = self->_validRange.location;
    unint64_t v5 = [a3 unsignedIntegerValue];
    unint64_t v6 = p_validRange->location + p_validRange->length - 1;
    if (v5 < v6) {
      unint64_t v6 = v5;
    }
    if (location <= v6) {
      return v6;
    }
    else {
      return location;
    }
  }
  else
  {
    return [a3 unsignedIntegerValue];
  }
}

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PETEventNumericalProperty *)self isValidValue:v4])
  {
    char v10 = 0;
    unint64_t v5 = [(PETEventNumericalProperty *)self _unsignedIntegerValueForNumericValue:v4];
    unint64_t v6 = &v10;
    do
    {
      *--unint64_t v6 = (v5 % 0xA) | 0x30;
      BOOL v7 = v5 > 9;
      v5 /= 0xAuLL;
    }
    while (v7);
    v8 = (void *)[[NSString alloc] initWithBytes:v6 length:&v10 - v6 encoding:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isValidValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_clampValues)
    {
      BOOL v5 = 1;
    }
    else
    {
      unint64_t v6 = [v4 unsignedIntegerValue];
      NSUInteger location = self->_validRange.location;
      BOOL v9 = v6 >= location;
      NSUInteger v8 = v6 - location;
      BOOL v9 = !v9 || v8 >= self->_validRange.length;
      BOOL v5 = !v9;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (_NSRange)validRange
{
  p_validRange = &self->_validRange;
  NSUInteger location = self->_validRange.location;
  NSUInteger length = p_validRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PETEventProperty *)self name];
  BOOL v5 = NSStringFromRange(self->_validRange);
  unint64_t v6 = [v3 stringWithFormat:@"Numerical: Name=%@ Range=%@", v4, v5];

  return v6;
}

- (PETEventNumericalProperty)initWithName:(id)a3 range:(_NSRange)a4 clampValues:(BOOL)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)PETEventNumericalProperty;
  _NSRange result = [(PETEventProperty *)&v9 initWithName:a3];
  if (result)
  {
    result->_validRange.NSUInteger location = location;
    result->_validRange.NSUInteger length = length;
    result->_clampValues = a5;
  }
  return result;
}

@end