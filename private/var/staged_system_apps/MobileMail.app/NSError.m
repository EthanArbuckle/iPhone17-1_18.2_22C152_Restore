@interface NSError
+ (id)_mf_errorWithCode:(unint64_t)a3 request:(id)a4 underlyingError:(id)a5 allowFallbackRouting:(BOOL)a6 debugDescription:(id)a7;
+ (id)_restorationStateErrorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)mailHandoffErrorWithActivityContextInfo:(id)a3 errorFormat:(id)a4;
+ (id)mailHandoffSimulatedError;
+ (id)mf_blackPearlStateRestorationNotSupportedError;
+ (id)mf_generalRoutingErrorWithDescription:(id)a3 request:(id)a4;
+ (id)mf_invalidRestorationDataErrorWithUnderlyingError:(id)a3;
+ (id)mf_noSuitableRouteErrorWithRequest:(id)a3;
+ (id)mf_restorationAccountNotAvailableErrorWithUnderlyingError:(id)a3;
+ (id)mf_restorationMailboxNotAvailableErrorWithUnderlyingError:(id)a3;
+ (id)mf_restorationMessageNotAvailableErrorWithUnderlyingError:(id)a3;
+ (id)mf_restorationQueryInvalid;
+ (id)mf_routingErrorWithUnderlyingError:(id)a3 request:(id)a4 allowFallbackRouting:(BOOL)a5;
- (BOOL)mf_allowFallbackRouting;
- (BOOL)mf_isAnyRestorationError;
- (BOOL)mf_isBlackPearlStateRestorationNotSupportedError;
- (BOOL)mf_isBlockedURLError;
- (BOOL)mf_isInvalidRestorationDataError;
- (BOOL)mf_isNoSuitableRouteError;
- (BOOL)mf_isRestorationAccountNotAvailableError;
- (BOOL)mf_isRestorationMailboxNotAvailableError;
- (BOOL)mf_isRestorationMessageNotAvailableError;
- (BOOL)mf_isSpotlightHandoffError;
- (MFURLRoutingRequest)mf_request;
- (NSDictionary)mf_mailHandoffActivityContextInfo;
- (NSString)mf_mailHandoffActivityType;
- (unint64_t)mf_activityErrorReason;
- (unint64_t)mf_activitySource;
@end

@implementation NSError

- (NSDictionary)mf_mailHandoffActivityContextInfo
{
  v2 = [(NSError *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"ceActivityType"];

  if (v3)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [v2 objectForKeyedSubscript:@"ceActivityInfo"];
  }
  v5 = v4;

  return (NSDictionary *)v5;
}

- (unint64_t)mf_activitySource
{
  v2 = [(NSError *)self mf_mailHandoffActivityContextInfo];
  v3 = [v2 objectForKeyedSubscript:@"ceActivityIsHandoff"];

  if (v3) {
    id v4 = [v3 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (unint64_t)mf_activityErrorReason
{
  v2 = [(NSError *)self mf_mailHandoffActivityContextInfo];
  v3 = [v2 objectForKeyedSubscript:@"ceActivityErrorReason"];

  if (v3) {
    id v4 = [v3 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (NSString)mf_mailHandoffActivityType
{
  v2 = [(NSError *)self mf_mailHandoffActivityContextInfo];
  v3 = [v2 objectForKeyedSubscript:@"ceActivityType"];

  return (NSString *)v3;
}

- (BOOL)mf_isSpotlightHandoffError
{
  v2 = [(NSError *)self mf_mailHandoffActivityType];
  unsigned __int8 v3 = [CSSearchableItemActionType isEqualToString:v2];

  return v3;
}

+ (id)mailHandoffErrorWithActivityContextInfo:(id)a3 errorFormat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v14];
  v11[0] = NSLocalizedDescriptionKey;
  v11[1] = @"ceActivityInfo";
  v12[0] = v7;
  v12[1] = v5;
  v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v9 = +[NSError errorWithDomain:MFHandoffErrorDomain code:-1 userInfo:v8];

  return v9;
}

+ (id)mailHandoffSimulatedError
{
  NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
  CFStringRef v6 = @"Simulated handoff error.";
  v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  unsigned __int8 v3 = +[NSError errorWithDomain:MFHandoffErrorDomain code:101 userInfo:v2];

  return v3;
}

+ (id)mf_noSuitableRouteErrorWithRequest:(id)a3
{
  unsigned __int8 v3 = [a1 _mf_errorWithCode:6000002 request:a3 underlyingError:0 allowFallbackRouting:1 debugDescription:0];

  return v3;
}

+ (id)mf_routingErrorWithUnderlyingError:(id)a3 request:(id)a4 allowFallbackRouting:(BOOL)a5
{
  NSErrorUserInfoKey v5 = [a1 _mf_errorWithCode:6000003 request:a4 underlyingError:a3 allowFallbackRouting:0 debugDescription:0];

  return v5;
}

+ (id)mf_generalRoutingErrorWithDescription:(id)a3 request:(id)a4
{
  id v4 = [a1 _mf_errorWithCode:6000000 request:a4 underlyingError:0 allowFallbackRouting:1 debugDescription:a3];

  return v4;
}

+ (id)_mf_errorWithCode:(unint64_t)a3 request:(id)a4 underlyingError:(id)a5 allowFallbackRouting:(BOOL)a6 debugDescription:(id)a7
{
  BOOL v8 = a6;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (qword_100699E50 != -1) {
    dispatch_once(&qword_100699E50, &stru_10060DB10);
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v11 forKeyedSubscript:@"MFURLRouterErrorRequestKey"];
  v15 = +[NSNumber numberWithBool:v8];
  [v14 setObject:v15 forKeyedSubscript:@"MFURLRoutingErrorAllowFallbackRoutingKey"];

  if (v12) {
    [v14 setObject:v12 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (v13) {
    [v14 setObject:v13 forKeyedSubscript:NSDebugDescriptionErrorKey];
  }
  id v16 = [v14 copy];
  v17 = +[NSError errorWithDomain:@"MFURLRoutingErrorDomain" code:a3 userInfo:v16];

  return v17;
}

- (BOOL)mf_isBlockedURLError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"MFURLRoutingErrorDomain", 6000001);

  return v3;
}

- (BOOL)mf_isNoSuitableRouteError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"MFURLRoutingErrorDomain", 6000002);

  return v3;
}

- (BOOL)mf_allowFallbackRouting
{
  v2 = [(NSError *)self userInfo];
  char v3 = [v2 objectForKeyedSubscript:@"MFURLRoutingErrorAllowFallbackRoutingKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (MFURLRoutingRequest)mf_request
{
  v2 = [(NSError *)self userInfo];
  char v3 = [v2 objectForKeyedSubscript:@"MFURLRouterErrorRequestKey"];

  return (MFURLRoutingRequest *)v3;
}

+ (id)mf_invalidRestorationDataErrorWithUnderlyingError:(id)a3
{
  char v3 = [a1 _restorationStateErrorWithCode:5000000 underlyingError:a3];

  return v3;
}

+ (id)mf_restorationAccountNotAvailableErrorWithUnderlyingError:(id)a3
{
  char v3 = [a1 _restorationStateErrorWithCode:5000001 underlyingError:a3];

  return v3;
}

+ (id)mf_restorationMailboxNotAvailableErrorWithUnderlyingError:(id)a3
{
  char v3 = [a1 _restorationStateErrorWithCode:5000002 underlyingError:a3];

  return v3;
}

+ (id)mf_restorationMessageNotAvailableErrorWithUnderlyingError:(id)a3
{
  char v3 = [a1 _restorationStateErrorWithCode:5000003 underlyingError:a3];

  return v3;
}

+ (id)mf_blackPearlStateRestorationNotSupportedError
{
  return [a1 _restorationStateErrorWithCode:5000004 underlyingError:0];
}

+ (id)mf_restorationQueryInvalid
{
  return [a1 _restorationStateErrorWithCode:5000005 underlyingError:0];
}

+ (id)_restorationStateErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  CFStringRef v6 = v5;
  if (qword_100699E58 == -1)
  {
    if (v5)
    {
LABEL_3:
      NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
      id v11 = v6;
      id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_100699E58, &stru_10060DBE8);
    if (v6) {
      goto LABEL_3;
    }
  }
  id v7 = 0;
LABEL_6:
  BOOL v8 = +[NSError errorWithDomain:@"com.apple.mobilemail.restoration" code:a3 userInfo:v7];

  return v8;
}

- (BOOL)mf_isAnyRestorationError
{
  v2 = [(NSError *)self domain];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.mobilemail.restoration"];

  return v3;
}

- (BOOL)mf_isInvalidRestorationDataError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"com.apple.mobilemail.restoration", 5000000);

  return v3;
}

- (BOOL)mf_isRestorationAccountNotAvailableError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"com.apple.mobilemail.restoration", 5000001);

  return v3;
}

- (BOOL)mf_isRestorationMailboxNotAvailableError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"com.apple.mobilemail.restoration", 5000002);

  return v3;
}

- (BOOL)mf_isRestorationMessageNotAvailableError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"com.apple.mobilemail.restoration", 5000003);

  return v3;
}

- (BOOL)mf_isBlackPearlStateRestorationNotSupportedError
{
  v2 = [(NSError *)self ef_match];
  char v3 = ((uint64_t (**)(void, const __CFString *, uint64_t))v2)[2](v2, @"com.apple.mobilemail.restoration", 5000004);

  return v3;
}

@end