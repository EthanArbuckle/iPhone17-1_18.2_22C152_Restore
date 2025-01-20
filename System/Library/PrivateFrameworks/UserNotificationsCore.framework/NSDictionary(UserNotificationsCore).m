@interface NSDictionary(UserNotificationsCore)
- (__CFString)unc_safeCastNonNilStringForKey:()UserNotificationsCore;
- (id)unc_nonEmptyCopy;
- (id)unc_nonNilArrayForKey:()UserNotificationsCore;
- (id)unc_nonNilDictionaryForKey:()UserNotificationsCore;
- (id)unc_nonNilSetForKey:()UserNotificationsCore;
- (id)unc_safeCastObjectForKey:()UserNotificationsCore class:;
- (id)unc_safeCastObjectForKey:()UserNotificationsCore classes:;
@end

@implementation NSDictionary(UserNotificationsCore)

- (id)unc_safeCastObjectForKey:()UserNotificationsCore class:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = UNSafeCast();

  return v2;
}

- (id)unc_safeCastObjectForKey:()UserNotificationsCore classes:
{
  id v6 = a4;
  v7 = [a1 objectForKey:a3];
  v8 = UNSafeCastAny();

  return v8;
}

- (id)unc_nonEmptyCopy
{
  v2 = (void *)[a1 count];
  if (v2) {
    v2 = (void *)[a1 copy];
  }

  return v2;
}

- (id)unc_nonNilArrayForKey:()UserNotificationsCore
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x263EFFA68];
  }
  id v3 = v1;

  return v3;
}

- (id)unc_nonNilDictionaryForKey:()UserNotificationsCore
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = v1;
  if (!v1) {
    v1 = (void *)MEMORY[0x263EFFA78];
  }
  id v3 = v1;

  return v3;
}

- (id)unc_nonNilSetForKey:()UserNotificationsCore
{
  v1 = objc_msgSend(a1, "objectForKey:");
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x263EFFA08] set];
  }
  v4 = v3;

  return v4;
}

- (__CFString)unc_safeCastNonNilStringForKey:()UserNotificationsCore
{
  id v4 = a3;
  objc_msgSend(a1, "unc_safeCastObjectForKey:class:", v4, objc_opt_class());
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &stru_270CB9250;
  }
  v7 = v6;

  return v7;
}

@end