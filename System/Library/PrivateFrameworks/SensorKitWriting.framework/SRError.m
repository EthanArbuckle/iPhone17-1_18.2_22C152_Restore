@interface SRError
+ (id)authorizationError;
+ (id)authorizationErrorWithStatus:(int64_t)a3;
+ (id)connectionNotFoundError;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)invalidEntitlementError;
+ (id)invalidInfoPlistErrorWithMissingKey:(id)a3 code:(int64_t)a4;
@end

@implementation SRError

+ (id)errorWithCode:(int64_t)a3
{
  v5 = descriptionFromErrorCode(a3);
  uint64_t v6 = recoverySuggestionFromErrorCode(a3);

  return (id)[a1 errorWithCode:a3 description:v5 recoverySuggestion:v6];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5
{
  return (id)[a1 errorWithCode:a3 description:a4 recoverySuggestion:a5 underlyingError:0];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v7 = descriptionFromErrorCode(a3);
  uint64_t v8 = recoverySuggestionFromErrorCode(a3);

  return (id)[a1 errorWithCode:a3 description:v7 recoverySuggestion:v8 underlyingError:a4];
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4 recoverySuggestion:(id)a5 underlyingError:(id)a6
{
  v10 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v11 = v10;
  if (a4) {
    [v10 setObject:a4 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  if (a5) {
    [v11 setObject:a5 forKeyedSubscript:*MEMORY[0x263F08348]];
  }
  if (a6) {
    [v11 setObject:a6 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v12 = (void *)MEMORY[0x263F087E8];
  NSErrorDomain v13 = SRErrorDomain;

  return (id)[v12 errorWithDomain:v13 code:a3 userInfo:v11];
}

+ (id)connectionNotFoundError
{
  return (id)[a1 errorWithCode:8193];
}

+ (id)invalidEntitlementError
{
  return (id)[a1 errorWithCode:0];
}

+ (id)authorizationErrorWithStatus:(int64_t)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SRErrorNoAuthorization", &stru_270985B88, 0);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SRErrorNoAuthorizationRecovery", &stru_270985B88, 0);
  uint64_t v7 = [a1 errorWithCode:a3];

  return (id)[a1 errorWithCode:1 description:v5 recoverySuggestion:v6 underlyingError:v7];
}

+ (id)authorizationError
{
  return (id)[a1 errorWithCode:1];
}

+ (id)invalidInfoPlistErrorWithMissingKey:(id)a3 code:(int64_t)a4
{
  uint64_t v6 = [NSString stringWithFormat:@"Your bundle's Info.plist must have an %@ key", a3];

  return (id)[a1 errorWithCode:a4 description:v6 recoverySuggestion:0];
}

@end