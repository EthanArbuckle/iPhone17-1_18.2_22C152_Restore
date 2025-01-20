@interface NSDictionary(TVMLKitAdditions)
- (id)tv_arrayForKey:()TVMLKitAdditions;
- (id)tv_dictionaryForKey:()TVMLKitAdditions;
- (id)tv_lookupValueForKey:()TVMLKitAdditions expectedClass:;
- (id)tv_numberForKey:()TVMLKitAdditions;
- (id)tv_stringForKey:()TVMLKitAdditions;
- (uint64_t)tv_BOOLForKey:()TVMLKitAdditions defaultValue:;
@end

@implementation NSDictionary(TVMLKitAdditions)

- (id)tv_lookupValueForKey:()TVMLKitAdditions expectedClass:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  return v1;
}

- (id)tv_stringForKey:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)tv_dictionaryForKey:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)tv_arrayForKey:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (id)tv_numberForKey:()TVMLKitAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "tv_lookupValueForKey:expectedClass:", v4, objc_opt_class());

  return v5;
}

- (uint64_t)tv_BOOLForKey:()TVMLKitAdditions defaultValue:
{
  v5 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_respondsToSelector()) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

@end