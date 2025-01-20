@interface NSDictionary(WebNSDictionaryExtras)
- (uint64_t)_webkit_arrayForKey:()WebNSDictionaryExtras;
- (uint64_t)_webkit_numberForKey:()WebNSDictionaryExtras;
- (uint64_t)_webkit_objectForMIMEType:()WebNSDictionaryExtras;
- (uint64_t)_webkit_stringForKey:()WebNSDictionaryExtras;
- (void)_webkit_BOOLForKey:()WebNSDictionaryExtras;
@end

@implementation NSDictionary(WebNSDictionaryExtras)

- (uint64_t)_webkit_numberForKey:()WebNSDictionaryExtras
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)_webkit_stringForKey:()WebNSDictionaryExtras
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)_webkit_arrayForKey:()WebNSDictionaryExtras
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v1;
  }
  else {
    return 0;
  }
}

- (uint64_t)_webkit_objectForMIMEType:()WebNSDictionaryExtras
{
  uint64_t result = objc_msgSend(a1, "objectForKey:");
  if (!result)
  {
    uint64_t v6 = [a3 rangeOfString:@"/"];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      uint64_t v7 = [a3 substringToIndex:v6 + 1];
      return [a1 objectForKey:v7];
    }
  }
  return result;
}

- (void)_webkit_BOOLForKey:()WebNSDictionaryExtras
{
  uint64_t result = objc_msgSend(a1, "_webkit_numberForKey:");
  if (result)
  {
    return (void *)[result BOOLValue];
  }
  return result;
}

@end