@interface NSURL(SXJSONObject)
- (uint64_t)initWithJSONObject:()SXJSONObject andVersion:;
@end

@implementation NSURL(SXJSONObject)

- (uint64_t)initWithJSONObject:()SXJSONObject andVersion:
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    uint64_t v5 = [NSURL URLWithString:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end