@interface APLegacyInterfaceError
+ (id)createErrorWithDomain:(id)a3 code:(int)a4 reason:(id)a5;
+ (id)discardedErrorWithCode:(int64_t)a3 andReason:(id)a4;
+ (id)invalidRequestErrorWithCode:(int64_t)a3 reason:(id)a4;
+ (id)validationErrorWithCode:(int64_t)a3 andReason:(id)a4;
@end

@implementation APLegacyInterfaceError

+ (id)createErrorWithDomain:(id)a3 code:(int)a4 reason:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = v8;
  if (v8 && [v8 length])
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v14 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  else
  {
    v10 = 0;
  }
  id v11 = [objc_alloc((Class)NSError) initWithDomain:v7 code:a4 userInfo:v10];

  return v11;
}

+ (id)validationErrorWithCode:(int64_t)a3 andReason:(id)a4
{
  return +[APLegacyInterfaceError createErrorWithDomain:@"com.apple.ap.AdValidationErrorDomain" code:a3 reason:a4];
}

+ (id)discardedErrorWithCode:(int64_t)a3 andReason:(id)a4
{
  return +[APLegacyInterfaceError createErrorWithDomain:@"com.apple.ap.DaemonDiscardedErrorDomain" code:a3 reason:a4];
}

+ (id)invalidRequestErrorWithCode:(int64_t)a3 reason:(id)a4
{
  return +[APLegacyInterfaceError createErrorWithDomain:@"com.apple.ap.InvalidRequestErrorDomain" code:a3 reason:a4];
}

@end