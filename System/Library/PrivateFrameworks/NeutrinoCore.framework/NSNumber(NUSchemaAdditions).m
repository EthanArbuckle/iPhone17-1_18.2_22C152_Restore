@interface NSNumber(NUSchemaAdditions)
- (BOOL)nu_isFloat;
- (uint64_t)nu_isBoolean;
- (uint64_t)nu_isInfinite;
- (uint64_t)nu_isInteger;
- (uint64_t)nu_isNaN;
@end

@implementation NSNumber(NUSchemaAdditions)

- (uint64_t)nu_isInfinite
{
  uint64_t result = objc_msgSend(a1, "nu_isFloat");
  if (result)
  {
    [a1 doubleValue];
    return fabs(v3) == INFINITY;
  }
  return result;
}

- (uint64_t)nu_isNaN
{
  uint64_t result = objc_msgSend(a1, "nu_isFloat");
  if (result)
  {
    [a1 doubleValue];
    return 0;
  }
  return result;
}

- (uint64_t)nu_isBoolean
{
  uint64_t result = objc_msgSend(a1, "nu_isInteger");
  if (result) {
    return (unint64_t)[a1 integerValue] < 2;
  }
  return result;
}

- (uint64_t)nu_isInteger
{
  return objc_msgSend(a1, "nu_isFloat") ^ 1;
}

- (BOOL)nu_isFloat
{
  return CFNumberIsFloatType(a1) == 1;
}

@end