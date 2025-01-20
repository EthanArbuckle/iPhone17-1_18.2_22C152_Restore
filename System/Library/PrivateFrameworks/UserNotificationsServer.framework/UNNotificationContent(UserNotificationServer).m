@interface UNNotificationContent(UserNotificationServer)
- (BOOL)uns_willAlertUser;
- (uint64_t)uns_willNotifyUser;
@end

@implementation UNNotificationContent(UserNotificationServer)

- (uint64_t)uns_willNotifyUser
{
  if (objc_msgSend(a1, "uns_willAlertUser")) {
    return 1;
  }
  v3 = [a1 badge];
  if (v3)
  {
    BOOL v2 = 1;
  }
  else
  {
    v4 = [a1 sound];
    BOOL v2 = v4 != 0;
  }
  return v2;
}

- (BOOL)uns_willAlertUser
{
  BOOL v2 = [a1 body];
  if ([v2 length])
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 subtitle];
    if ([v4 length])
    {
      BOOL v3 = 1;
    }
    else
    {
      v5 = [a1 title];
      BOOL v3 = [v5 length] != 0;
    }
  }

  return v3;
}

@end