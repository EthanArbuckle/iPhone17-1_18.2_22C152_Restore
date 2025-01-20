@interface NSDictionary(PowerlogExtensions)
- (__CFString)objectForNullMarkerForKey:()PowerlogExtensions;
- (id)descriptionSingleLine;
- (id)serializedJSONString;
@end

@implementation NSDictionary(PowerlogExtensions)

- (__CFString)objectForNullMarkerForKey:()PowerlogExtensions
{
  objc_msgSend(a1, "objectForKey:");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v1) {
    v1 = @"<none>";
  }
  return v1;
}

- (id)descriptionSingleLine
{
  v1 = [a1 description];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F15208F0];

  if ([v2 rangeOfString:@"  "] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = v2;
  }
  else
  {
    do
    {
      v3 = [v2 stringByReplacingOccurrencesOfString:@"  " withString:@" "];

      v2 = v3;
    }
    while ([v3 rangeOfString:@"  "] != 0x7FFFFFFFFFFFFFFFLL);
  }
  return v3;
}

- (id)serializedJSONString
{
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:a1])
  {
    uint64_t v5 = 0;
    v2 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a1 options:0 error:&v5];
    v3 = 0;
    if (!v5) {
      v3 = (void *)[[NSString alloc] initWithData:v2 encoding:4];
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end