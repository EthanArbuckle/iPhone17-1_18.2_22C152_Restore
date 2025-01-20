@interface NSAttributedString(UserNotificationsKit)
+ (id)nc_safeAttributedStringWithString:()UserNotificationsKit;
@end

@implementation NSAttributedString(UserNotificationsKit)

+ (id)nc_safeAttributedStringWithString:()UserNotificationsKit
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x263F086A0];
    id v4 = a3;
    v5 = (void *)[[v3 alloc] initWithString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end