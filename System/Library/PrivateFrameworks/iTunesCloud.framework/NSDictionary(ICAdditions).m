@interface NSDictionary(ICAdditions)
- (double)ic_doubleValueForKey:()ICAdditions;
- (id)ic_arrayValueForKey:()ICAdditions;
- (id)ic_dataValueForKey:()ICAdditions;
- (id)ic_dictionaryValueForKey:()ICAdditions;
- (id)ic_numberValueForKey:()ICAdditions;
- (id)ic_stringValueForKey:()ICAdditions;
- (uint64_t)ic_BOOLValueForKey:()ICAdditions;
- (uint64_t)ic_int64ValueForKey:()ICAdditions;
- (uint64_t)ic_intValueForKey:()ICAdditions;
- (uint64_t)ic_integerValueForKey:()ICAdditions;
- (uint64_t)ic_uintValueForKey:()ICAdditions;
@end

@implementation NSDictionary(ICAdditions)

- (uint64_t)ic_integerValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_BOOLValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)ic_stringValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSString()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ic_numberValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSNumber()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ic_dictionaryValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSDictionary()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ic_dataValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSData()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ic_arrayValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (_NSIsNSArray()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (double)ic_doubleValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  double v2 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v1 doubleValue];
    double v2 = v3;
  }

  return v2;
}

- (uint64_t)ic_int64ValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 longLongValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_uintValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 unsignedIntValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)ic_intValueForKey:()ICAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_respondsToSelector()) {
    uint64_t v2 = [v1 intValue];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

@end