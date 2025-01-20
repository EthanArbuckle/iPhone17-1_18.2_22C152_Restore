@interface NSMutableDictionary(UserNotificationsCore)
- (uint64_t)unc_safeSetObject:()UserNotificationsCore forKey:;
- (void)unc_safeSetNonEmptyArray:()UserNotificationsCore forKey:;
- (void)unc_safeSetNonEmptyDictionary:()UserNotificationsCore forKey:;
- (void)unc_safeSetNonEmptySet:()UserNotificationsCore forKey:;
- (void)unc_safeSetNonEmptyString:()UserNotificationsCore forKey:;
- (void)unc_safeSetNonEmptyString:()UserNotificationsCore withLimit:forKey:;
@end

@implementation NSMutableDictionary(UserNotificationsCore)

- (void)unc_safeSetNonEmptyArray:()UserNotificationsCore forKey:
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count]) {
    [a1 setObject:v7 forKey:v6];
  }
  else {
    [a1 removeObjectForKey:v6];
  }
}

- (void)unc_safeSetNonEmptyDictionary:()UserNotificationsCore forKey:
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count]) {
    [a1 setObject:v7 forKey:v6];
  }
  else {
    [a1 removeObjectForKey:v6];
  }
}

- (void)unc_safeSetNonEmptySet:()UserNotificationsCore forKey:
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count]) {
    [a1 setObject:v7 forKey:v6];
  }
  else {
    [a1 removeObjectForKey:v6];
  }
}

- (void)unc_safeSetNonEmptyString:()UserNotificationsCore forKey:
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 length]) {
    [a1 setObject:v7 forKey:v6];
  }
  else {
    [a1 removeObjectForKey:v6];
  }
}

- (void)unc_safeSetNonEmptyString:()UserNotificationsCore withLimit:forKey:
{
  id v11 = a3;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 length])
  {
    if ([v11 length] <= a4)
    {
      id v10 = v11;
    }
    else
    {
      uint64_t v9 = objc_msgSend(v11, "substringWithRange:", 0, a4);

      id v10 = (id)v9;
    }
    id v11 = v10;
    objc_msgSend(a1, "setObject:forKey:");
  }
  else
  {
    [a1 removeObjectForKey:v8];
  }
}

- (uint64_t)unc_safeSetObject:()UserNotificationsCore forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

@end