@interface IKTextFieldElement(TVMLKitAdditions)
- (uint64_t)tv_isSecure;
- (uint64_t)tv_keyboardType;
@end

@implementation IKTextFieldElement(TVMLKitAdditions)

- (uint64_t)tv_isSecure
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKeyedSubscript:@"secure"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)tv_keyboardType
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKeyedSubscript:@"keyboardType"];

  if ([v2 isEqualToString:@"emailAddress"])
  {
    uint64_t v3 = 7;
  }
  else if ([v2 isEqualToString:@"numberPad"])
  {
    uint64_t v3 = 4;
  }
  else if ([v2 isEqualToString:@"url"])
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

@end