@interface NSString(UserNotificationsKit)
- (__CFString)nc_stringByRemovingCharactersFromSet:()UserNotificationsKit;
@end

@implementation NSString(UserNotificationsKit)

- (__CFString)nc_stringByRemovingCharactersFromSet:()UserNotificationsKit
{
  id v4 = a3;
  uint64_t v5 = [(__CFString *)a1 length];
  if (v5 << 32
    && (v11.length = (int)v5, v11.location = 0, CFStringFindCharacterFromSet(a1, (CFCharacterSetRef)v4, v11, 0, 0)))
  {
    v6 = (__CFString *)[(__CFString *)a1 mutableCopy];
    uint64_t v7 = [(__CFString *)v6 length];
    if (v7 - 1 >= 0)
    {
      uint64_t v8 = v7;
      do
      {
        if (objc_msgSend(v4, "characterIsMember:", -[__CFString characterAtIndex:](v6, "characterAtIndex:", --v8)))-[__CFString deleteCharactersInRange:](v6, "deleteCharactersInRange:", v8, 1); {
      }
        }
      while (v8 > 0);
    }
  }
  else
  {
    v6 = a1;
  }

  return v6;
}

@end