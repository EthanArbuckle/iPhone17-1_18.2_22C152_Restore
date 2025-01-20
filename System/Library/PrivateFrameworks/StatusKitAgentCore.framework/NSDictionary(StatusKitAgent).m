@interface NSDictionary(StatusKitAgent)
- (id)ska_dataFrombase64EncodedStringForKey:()StatusKitAgent;
- (id)ska_dateFromUnixTimestampForKey:()StatusKitAgent;
- (id)ska_dictionaryForKey:()StatusKitAgent;
- (id)ska_numberForKey:()StatusKitAgent;
- (id)ska_stringForKey:()StatusKitAgent;
@end

@implementation NSDictionary(StatusKitAgent)

- (id)ska_dictionaryForKey:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)ska_dataFrombase64EncodedStringForKey:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "ska_stringForKey:");
  if (v1) {
    id v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v1 options:0];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)ska_dateFromUnixTimestampForKey:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "ska_numberForKey:");
  id v2 = v1;
  if (!v1 || ([v1 doubleValue], v3 == 0.0))
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:");
  }

  return v4;
}

- (id)ska_stringForKey:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)ska_numberForKey:()StatusKitAgent
{
  v1 = objc_msgSend(a1, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end