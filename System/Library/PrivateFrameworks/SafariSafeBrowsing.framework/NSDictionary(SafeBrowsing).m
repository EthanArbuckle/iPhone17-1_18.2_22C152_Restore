@interface NSDictionary(SafeBrowsing)
- (id)ssb_arrayForKey:()SafeBrowsing;
- (id)ssb_dictionaryForKey:()SafeBrowsing;
- (id)ssb_numberForKey:()SafeBrowsing;
- (id)ssb_stringForKey:()SafeBrowsing;
@end

@implementation NSDictionary(SafeBrowsing)

- (id)ssb_stringForKey:()SafeBrowsing
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ssb_numberForKey:()SafeBrowsing
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ssb_arrayForKey:()SafeBrowsing
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)ssb_dictionaryForKey:()SafeBrowsing
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end