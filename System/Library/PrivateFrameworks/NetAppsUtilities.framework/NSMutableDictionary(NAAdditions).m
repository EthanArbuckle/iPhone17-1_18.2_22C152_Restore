@interface NSMutableDictionary(NAAdditions)
- (id)na_objectForKey:()NAAdditions withDefaultValue:;
- (void)na_safeSetObject:()NAAdditions forKey:;
@end

@implementation NSMutableDictionary(NAAdditions)

- (id)na_objectForKey:()NAAdditions withDefaultValue:
{
  id v6 = a3;
  v7 = a4;
  v8 = [a1 objectForKey:v6];
  if (!v8)
  {
    v8 = v7[2](v7);
    [a1 setObject:v8 forKey:v6];
  }

  return v8;
}

- (void)na_safeSetObject:()NAAdditions forKey:
{
  if (a3)
  {
    if (a4) {
      return objc_msgSend(a1, "setObject:forKey:");
    }
  }
  return a1;
}

@end