@interface NSString(ICSWriter)
- (id)_ICSStringForParameterQuotedValue;
- (id)_ICSStringForParameterValue;
- (id)_ICSStringForProperyValue;
- (void)_ICSStringWithOptions:()ICSWriter appendingToString:;
@end

@implementation NSString(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
}

- (id)_ICSStringForProperyValue
{
  v1 = (void *)[a1 mutableCopy];
  [v1 _ICSStripControlChracters];
  [v1 _ICSEscapePropertyValue];
  return v1;
}

- (id)_ICSStringForParameterValue
{
  v1 = (void *)[a1 mutableCopy];
  [v1 _ICSStripControlChracters];
  [v1 _ICSEscapeParameterValue];
  return v1;
}

- (id)_ICSStringForParameterQuotedValue
{
  v1 = (void *)[a1 mutableCopy];
  [v1 _ICSStripControlChracters];
  [v1 _ICSEscapeParameterQuotedValue];
  return v1;
}

@end