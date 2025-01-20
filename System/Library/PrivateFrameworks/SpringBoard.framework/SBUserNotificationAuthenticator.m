@interface SBUserNotificationAuthenticator
@end

@implementation SBUserNotificationAuthenticator

void ___SBUserNotificationAuthenticator_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.CFUserNotification" additionalCredentials:3];
  v1 = (void *)_SBUserNotificationAuthenticator___authenticator;
  _SBUserNotificationAuthenticator___authenticator = v0;
}

@end