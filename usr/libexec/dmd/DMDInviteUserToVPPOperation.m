@interface DMDInviteUserToVPPOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInviteUserToVPPOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2EE8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___DMDInviteUserToVPPOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4)) {
    goto LABEL_10;
  }
  v7 = [v6 URL];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    CFStringRef v17 = @"request.URL";
    v9 = &v17;
    v10 = &v16;
    goto LABEL_9;
  }
  v8 = [v6 originator];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v14 = DMFInvalidParameterErrorKey;
    CFStringRef v15 = @"request.originator";
    v9 = &v15;
    v10 = &v14;
LABEL_9:
    v11 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invite user to VPP: %{private}@", buf, 0xCu);
  }
  if ([v5 conformsToOverridePatternWithKey:@"vpp-licensing-invitation-url-pattern"])
  {
    id v6 = +[MCProfileConnection sharedConnection];
    v7 = [v6 restrictedAppBundleIDs];
    v8 = [v6 effectiveWhitelistedAppBundleIDs];
    uint64_t v9 = MCAppStoreBundleIdentifier;
    if (([v7 containsObject:MCAppStoreBundleIdentifier] & 1) != 0
      || v8 && ([v8 containsObject:v9] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100085524();
      }
      v10 = self;
      uint64_t v11 = 1400;
    }
    else
    {
      if (byte_1000FBB28 != 1)
      {
        byte_1000FBB28 = 1;
        v25 = +[DMDPowerAssertion assertionForOperation:@"DMDInviteUserToVPPOperation: run"];
        v23 = objc_opt_new();
        v12 = +[NSBundle bundleForClass:objc_opt_class()];
        v24 = [v12 localizedStringForKey:@"%@ would like to assign apps and books to you." value:&stru_1000CC390 table:@"DMFNotifications"];

        objc_super v13 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v14 = [v13 localizedStringForKey:@"Allow App and Book Assignment?" value:&stru_1000CC390 table:@"DMFNotifications"];
        [v23 setHeader:v14];

        CFStringRef v15 = [v4 originator];
        uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v15);
        [v23 setMessage:v16];

        CFStringRef v17 = +[NSBundle bundleForClass:objc_opt_class()];
        v18 = [v17 localizedStringForKey:@"Continue" value:&stru_1000CC390 table:@"DMFNotifications"];
        [v23 setDefaultButtonTitle:v18];

        v19 = +[NSBundle bundleForClass:objc_opt_class()];
        v20 = [v19 localizedStringForKey:@"Cancel" value:&stru_1000CC390 table:@"DMFNotifications"];
        [v23 setAlternateButtonTitle:v20];

        v21 = +[DMDUserNotificationController sharedController];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100051214;
        v26[3] = &unk_1000CB2D0;
        id v27 = v5;
        v28 = self;
        id v29 = v25;
        id v22 = v25;
        [v21 showNotification:v23 completion:v26];

        goto LABEL_16;
      }
      v10 = self;
      uint64_t v11 = 1407;
    }
    [(DMDTaskOperation *)v10 endOperationWithDMFErrorCode:v11];
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10008556C();
  }
  [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1402];
LABEL_17:
}

@end