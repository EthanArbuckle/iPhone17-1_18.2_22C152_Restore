@interface NSDictionary(HKSPSerialization)
- (id)hksp_serializedClassName;
- (id)hksp_serializedKey;
- (id)hksp_serializedProperties;
- (uint64_t)hksp_isSerialized;
@end

@implementation NSDictionary(HKSPSerialization)

- (uint64_t)hksp_isSerialized
{
  if ([a1 count] != 1) {
    return 0;
  }
  v2 = objc_msgSend(a1, "hksp_serializedKey");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = objc_msgSend(a1, "hksp_serializedKey");
    uint64_t v4 = [v3 hasPrefix:@"$"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)hksp_serializedKey
{
  v1 = [a1 allKeys];
  v2 = [v1 firstObject];

  return v2;
}

- (id)hksp_serializedClassName
{
  v1 = objc_msgSend(a1, "hksp_serializedKey");
  v2 = [v1 substringFromIndex:1];

  return v2;
}

- (id)hksp_serializedProperties
{
  if (objc_msgSend(a1, "hksp_isSerialized"))
  {
    v2 = objc_msgSend(a1, "hksp_serializedKey");
    v3 = [a1 objectForKeyedSubscript:v2];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end