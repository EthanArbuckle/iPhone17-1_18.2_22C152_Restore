@interface NSDictionary(TVPlaybackAdditions)
- (id)_lookupValueForKey:()TVPlaybackAdditions expectedClass:;
- (id)tvp_URLForKey:()TVPlaybackAdditions;
- (id)tvp_arrayForKey:()TVPlaybackAdditions;
- (id)tvp_dataForKey:()TVPlaybackAdditions;
- (id)tvp_dateForKey:()TVPlaybackAdditions;
- (id)tvp_dateFromMillisecondsSince1970ForKey:()TVPlaybackAdditions;
- (id)tvp_dictionaryForKey:()TVPlaybackAdditions;
- (id)tvp_numberForKey:()TVPlaybackAdditions;
- (id)tvp_stringForKey:()TVPlaybackAdditions;
- (uint64_t)tvp_BOOLForKey:()TVPlaybackAdditions defaultValue:;
- (uint64_t)tvp_appleTimingAppHeaderValue;
@end

@implementation NSDictionary(TVPlaybackAdditions)

- (id)_lookupValueForKey:()TVPlaybackAdditions expectedClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)tvp_numberForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)tvp_stringForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)tvp_URLForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (uint64_t)tvp_BOOLForKey:()TVPlaybackAdditions defaultValue:
{
  v5 = objc_msgSend(a1, "tvp_numberForKey:");
  v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)tvp_dateForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)tvp_dateFromMillisecondsSince1970ForKey:()TVPlaybackAdditions
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = objc_msgSend(MEMORY[0x263EFF910], "tvp_dateWithMillisecondsSince1970:", v1);

  return v2;
}

- (id)tvp_dictionaryForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)tvp_arrayForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (id)tvp_dataForKey:()TVPlaybackAdditions
{
  id v4 = a3;
  v5 = [a1 _lookupValueForKey:v4 expectedClass:objc_opt_class()];

  return v5;
}

- (uint64_t)tvp_appleTimingAppHeaderValue
{
  v1 = [a1 objectForKey:@"apple-timing-app"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v1 componentsSeparatedByString:@" "];
    v3 = [v2 firstObject];
    uint64_t v4 = [v3 integerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end