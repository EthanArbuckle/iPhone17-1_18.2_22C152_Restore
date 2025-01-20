@interface BSAuditToken(UserNotificationsCore_ObjectiveC)
- (uint64_t)unc_applicationIdentifier;
- (uint64_t)unc_isInternalUserNotificationsTool;
@end

@implementation BSAuditToken(UserNotificationsCore_ObjectiveC)

- (uint64_t)unc_isInternalUserNotificationsTool
{
  v2 = objc_msgSend(a1, "unc_applicationIdentifier");
  if ([v2 isEqualToString:@"com.apple.usernotifications.untool"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = objc_msgSend(a1, "unc_applicationIdentifier");
    uint64_t v3 = [v4 isEqualToString:@"com.apple.internal.suiuntool"];
  }
  return v3;
}

- (uint64_t)unc_applicationIdentifier
{
  return [a1 valueForEntitlement:@"application-identifier"];
}

@end