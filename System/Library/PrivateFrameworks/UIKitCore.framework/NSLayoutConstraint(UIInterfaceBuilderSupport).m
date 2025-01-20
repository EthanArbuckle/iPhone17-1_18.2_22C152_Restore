@interface NSLayoutConstraint(UIInterfaceBuilderSupport)
- (_NSLayoutConstraintConstant)_encodedConstant;
- (uint64_t)_setEncodedConstant:()UIInterfaceBuilderSupport;
@end

@implementation NSLayoutConstraint(UIInterfaceBuilderSupport)

- (_NSLayoutConstraintConstant)_encodedConstant
{
  double v2 = 0.0;
  if (![a1 symbolicConstant])
  {
    [a1 constant];
    double v2 = v3;
  }
  uint64_t v4 = [a1 symbolicConstant];
  return +[_NSLayoutConstraintConstant constantWithSymbolicValue:v4 numericValue:v2];
}

- (uint64_t)_setEncodedConstant:()UIInterfaceBuilderSupport
{
  if ([a3 symbolicValue])
  {
    uint64_t v5 = [a3 symbolicValue];
    return [a1 setSymbolicConstant:v5];
  }
  else
  {
    [a3 numericValue];
    return objc_msgSend(a1, "setConstant:");
  }
}

@end