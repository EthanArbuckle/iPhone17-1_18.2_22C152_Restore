@interface FMDRatchetManager
+ (BOOL)isFeatureEnabled;
+ (id)ratchetErrorDeniedWithUnderlyingError:(id)a3;
+ (id)ratchetManagerTurnOffFMIP;
+ (id)ratchetManageriCloudSignOut;
- (BOOL)fallbackToNoAuthentication;
- (FMDRatchetManager)initWithIdentifier:(id)a3;
- (FMFuture)currentTask;
- (LARatchet)ratchet;
- (NSString)localizedBeginBody;
- (NSString)localizedBeginTitle;
- (NSString)localizedCalloutReason;
- (NSString)localizedCountdownBody;
- (NSString)localizedReason;
- (NSString)ratchetIdentifier;
- (NSURL)deepLinkURL;
- (id)deniedOperationBlock;
- (id)permittedOperationBlock;
- (id)ratchetOptions;
- (void)armRatchetIfNeeded;
- (void)evaluateOperation;
- (void)handleRatchetError:(id)a3;
- (void)setCurrentTask:(id)a3;
- (void)setDeepLinkURL:(id)a3;
- (void)setDeniedOperationBlock:(id)a3;
- (void)setFallbackToNoAuthentication:(BOOL)a3;
- (void)setLocalizedBeginBody:(id)a3;
- (void)setLocalizedBeginTitle:(id)a3;
- (void)setLocalizedCalloutReason:(id)a3;
- (void)setLocalizedCountdownBody:(id)a3;
- (void)setLocalizedReason:(id)a3;
- (void)setPermittedOperationBlock:(id)a3;
- (void)setRatchet:(id)a3;
- (void)setRatchetIdentifier:(id)a3;
@end

@implementation FMDRatchetManager

+ (BOOL)isFeatureEnabled
{
  v2 = +[LARatchetManager sharedInstance];
  unsigned __int8 v3 = [v2 isFeatureEnabled];

  return v3;
}

+ (id)ratchetErrorDeniedWithUnderlyingError:(id)a3
{
  unsigned __int8 v3 = off_10031CBE8;
  if (a3)
  {
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    id v9 = a3;
    id v4 = a3;
    id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v6 = +[NSError errorWithDomain:v3 code:1 userInfo:v5];
  }
  else
  {
    id v5 = 0;
    v6 = +[NSError errorWithDomain:v3 code:1 userInfo:0];
  }

  return v6;
}

+ (id)ratchetManageriCloudSignOut
{
  v2 = [[FMDRatchetManager alloc] initWithIdentifier:@"com.apple.findmydevice.ratchet.turnOff"];
  unsigned __int8 v3 = [@"FM_RATCHET_REASON_SIGNOUT" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedReason:v3];

  id v4 = [@"FM_RATCHET_BEGIN_TITLE_SIGNOUT" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedBeginTitle:v4];

  id v5 = [@"FM_RATCHET_BEGIN_SIGNOUT" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedBeginBody:v5];

  v6 = [@"FM_RATCHET_COUNTDOWN_SIGNOUT" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedCountdownBody:v6];

  v7 = [@"FM_RATCHET_CALLOUT_REASON_SIGNOUT" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedCalloutReason:v7];

  NSErrorUserInfoKey v8 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
  [(FMDRatchetManager *)v2 setDeepLinkURL:v8];

  [(FMDRatchetManager *)v2 setFallbackToNoAuthentication:1];

  return v2;
}

+ (id)ratchetManagerTurnOffFMIP
{
  v2 = [[FMDRatchetManager alloc] initWithIdentifier:@"com.apple.findmydevice.ratchet.turnOff"];
  unsigned __int8 v3 = [@"FM_RATCHET_REASON_TURN_OFF" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedReason:v3];

  id v4 = [[@"FM_RATCHET_BEGIN_TITLE_TURN_OFF" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedBeginTitle:v4];

  id v5 = [@"FM_RATCHET_BEGIN_TURN_OFF" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedBeginBody:v5];

  v6 = [@"FM_RATCHET_COUNTDOWN_TURN_OFF" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedCountdownBody:v6];

  v7 = [@"FM_RATCHET_CALLOUT_REASON_TURN_OFF" fmd_localizedStringInTable:@"Localizable-DIMPLEKEY"];
  [(FMDRatchetManager *)v2 setLocalizedCalloutReason:v7];

  NSErrorUserInfoKey v8 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING/FindMyDevice-Settings"];
  [(FMDRatchetManager *)v2 setDeepLinkURL:v8];

  [(FMDRatchetManager *)v2 setFallbackToNoAuthentication:1];

  return v2;
}

- (FMDRatchetManager)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMDRatchetManager;
  v6 = [(FMDRatchetManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ratchetIdentifier, a3);
  }

  return v7;
}

- (void)evaluateOperation
{
  unsigned __int8 v3 = [(FMDRatchetManager *)self currentTask];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)FMFuture);
    [(FMDRatchetManager *)self permittedOperationBlock];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100034D88;
    v13[3] = &unk_1002D9648;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v14;
    id v6 = [v4 addSuccessBlock:v13];
    [(FMDRatchetManager *)self deniedOperationBlock];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100034DA0;
    v11[3] = &unk_1002D9670;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v12;
    id v8 = [v4 addFailureBlock:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100034DB8;
    v10[3] = &unk_1002D9698;
    v10[4] = self;
    id v9 = [v4 addCompletionBlock:v10];
    [(FMDRatchetManager *)self setCurrentTask:v4];
    [(FMDRatchetManager *)self armRatchetIfNeeded];
  }
}

- (id)ratchetOptions
{
  v12[0] = &off_1002F1EA0;
  unsigned __int8 v3 = [(FMDRatchetManager *)self localizedReason];
  v13[0] = v3;
  v12[1] = &off_1002F1EB8;
  id v4 = [(FMDRatchetManager *)self localizedCalloutReason];
  v13[1] = v4;
  v12[2] = &off_1002F1ED0;
  id v5 = [(FMDRatchetManager *)self deepLinkURL];
  v13[2] = v5;
  v12[3] = &off_1002F1EE8;
  id v6 = [(FMDRatchetManager *)self localizedBeginTitle];
  v13[3] = v6;
  v12[4] = &off_1002F1F00;
  id v7 = [(FMDRatchetManager *)self localizedBeginBody];
  void v13[4] = v7;
  v12[5] = &off_1002F1F18;
  id v8 = [(FMDRatchetManager *)self localizedCountdownBody];
  v13[5] = v8;
  v12[6] = &off_1002F1F30;
  id v9 = +[NSNumber numberWithBool:[(FMDRatchetManager *)self fallbackToNoAuthentication]];
  v13[6] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

- (void)armRatchetIfNeeded
{
  unsigned __int8 v3 = [(FMDRatchetManager *)self ratchet];

  if (v3)
  {
    id v4 = sub_100059CA0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(FMDRatchetManager *)self ratchetIdentifier];
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ratchet already initialized %@.", buf, 0xCu);
    }
  }
  else
  {
    id v6 = objc_alloc((Class)LARatchet);
    id v7 = [(FMDRatchetManager *)self ratchetIdentifier];
    id v4 = [v6 initWithIdentifier:v7];

    [(FMDRatchetManager *)self setRatchet:v4];
    id v8 = [(FMDRatchetManager *)self ratchetOptions];
    id v9 = sub_100059CA0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(FMDRatchetManager *)self ratchetIdentifier];
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Arming ratchet %@ with options %@.", buf, 0x16u);
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003516C;
    v11[3] = &unk_1002D96C0;
    void v11[4] = self;
    [v4 armWithOptions:v8 completion:v11];
  }
}

- (void)handleRatchetError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:LARatchetErrorUserInfoKeyState];

  if (v6)
  {
    id v7 = v6;
    id v8 = [v4 code];
    id v9 = sub_100059CA0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v10)
      {
        v11 = [(FMDRatchetManager *)self ratchetIdentifier];
        id v12 = [v7 rawValue];
        v13 = [v4 localizedDescription];
        int v19 = 138412802;
        v20 = v11;
        __int16 v21 = 2048;
        id v22 = v12;
        __int16 v23 = 2112;
        v24 = v13;
        __int16 v14 = "Unexpected failure to arm ratchet %@ state %li, error: %@.";
LABEL_12:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, 0x20u);
      }
    }
    else if (v10)
    {
      v11 = [(FMDRatchetManager *)self ratchetIdentifier];
      id v18 = [v7 rawValue];
      v13 = [v4 localizedDescription];
      int v19 = 138412802;
      v20 = v11;
      __int16 v21 = 2048;
      id v22 = v18;
      __int16 v23 = 2112;
      v24 = v13;
      __int16 v14 = "Failed to arm ratchet %@ state %li, error: %@.";
      goto LABEL_12;
    }

    v16 = [(FMDRatchetManager *)self currentTask];
    v17 = +[FMDRatchetManager ratchetErrorDeniedWithUnderlyingError:v4];
    [v16 finishWithError:v17];

    goto LABEL_10;
  }
  v15 = sub_100059CA0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10023D404(self, v4, v15);
  }

  id v7 = [(FMDRatchetManager *)self currentTask];
  v16 = +[FMDRatchetManager ratchetErrorDeniedWithUnderlyingError:v4];
  [v7 finishWithError:v16];
LABEL_10:
}

- (NSString)localizedReason
{
  return self->_localizedReason;
}

- (void)setLocalizedReason:(id)a3
{
}

- (NSString)localizedBeginTitle
{
  return self->_localizedBeginTitle;
}

- (void)setLocalizedBeginTitle:(id)a3
{
}

- (NSString)localizedBeginBody
{
  return self->_localizedBeginBody;
}

- (void)setLocalizedBeginBody:(id)a3
{
}

- (NSString)localizedCountdownBody
{
  return self->_localizedCountdownBody;
}

- (void)setLocalizedCountdownBody:(id)a3
{
}

- (NSString)localizedCalloutReason
{
  return self->_localizedCalloutReason;
}

- (void)setLocalizedCalloutReason:(id)a3
{
}

- (NSURL)deepLinkURL
{
  return self->_deepLinkURL;
}

- (void)setDeepLinkURL:(id)a3
{
}

- (BOOL)fallbackToNoAuthentication
{
  return self->_fallbackToNoAuthentication;
}

- (void)setFallbackToNoAuthentication:(BOOL)a3
{
  self->_fallbackToNoAuthentication = a3;
}

- (id)permittedOperationBlock
{
  return self->_permittedOperationBlock;
}

- (void)setPermittedOperationBlock:(id)a3
{
}

- (id)deniedOperationBlock
{
  return self->_deniedOperationBlock;
}

- (void)setDeniedOperationBlock:(id)a3
{
}

- (NSString)ratchetIdentifier
{
  return self->_ratchetIdentifier;
}

- (void)setRatchetIdentifier:(id)a3
{
}

- (LARatchet)ratchet
{
  return self->_ratchet;
}

- (void)setRatchet:(id)a3
{
}

- (FMFuture)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_ratchet, 0);
  objc_storeStrong((id *)&self->_ratchetIdentifier, 0);
  objc_storeStrong(&self->_deniedOperationBlock, 0);
  objc_storeStrong(&self->_permittedOperationBlock, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_localizedCalloutReason, 0);
  objc_storeStrong((id *)&self->_localizedCountdownBody, 0);
  objc_storeStrong((id *)&self->_localizedBeginBody, 0);
  objc_storeStrong((id *)&self->_localizedBeginTitle, 0);

  objc_storeStrong((id *)&self->_localizedReason, 0);
}

@end