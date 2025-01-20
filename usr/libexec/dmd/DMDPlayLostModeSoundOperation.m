@interface DMDPlayLostModeSoundOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDPlayLostModeSoundOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2F48;
}

- (void)runWithRequest:(id)a3
{
  v4 = +[FMDFMIPManager sharedInstance];
  if ([v4 isManagedLostModeActive])
  {
    +[DMDPowerAssertion assertionForOperation:@"DMDPlayLostModeSoundOperation: run"];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100061C10;
    v6[3] = &unk_1000C9B78;
    v6[4] = self;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v7;
    [v4 playSoundWithOptions:0 completion:v6];
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:601];
  }
}

@end