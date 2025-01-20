@interface ACMRequest
+ (id)authenticationRequest;
+ (id)ticketVerificationRequest;
@end

@implementation ACMRequest

+ (id)authenticationRequest
{
  [+[ACMAppleConnect sharedInstance] private];
  id v2 = +[ACMExternalAppleConnectImplComponents components];

  return (id)[v2 createAuthenticationRequest];
}

+ (id)ticketVerificationRequest
{
  id v2 = +[ACMExternalAppleConnectImplComponents components];

  return (id)[v2 createTicketVerificationRequest];
}

@end