@interface NSError(RCErrorAdditions)
+ (id)rc_endpointErrorWithUnderlyingEndpointErrors:()RCErrorAdditions;
+ (id)rc_errorWithCode:()RCErrorAdditions description:additionalUserInfo:;
+ (id)rc_missingConfigErrorWithUnderlyingError:()RCErrorAdditions;
+ (id)rc_offlineErrorWithReason:()RCErrorAdditions;
+ (uint64_t)rc_errorWithCode:()RCErrorAdditions description:;
+ (uint64_t)rc_notAvailableError;
+ (uint64_t)rc_notCachedError;
+ (uint64_t)rc_parsingError;
+ (uint64_t)rc_unknownBackgroundNetworkOperationError;
@end

@implementation NSError(RCErrorAdditions)

+ (id)rc_errorWithCode:()RCErrorAdditions description:additionalUserInfo:
{
  id v7 = a4;
  id v8 = a5;
  if (v8) {
    [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  }
  else {
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:*MEMORY[0x1E4F28568]];
  }
  v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCErrorDomain" code:a3 userInfo:v10];

  return v11;
}

+ (uint64_t)rc_errorWithCode:()RCErrorAdditions description:
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", a3, a4, 0);
}

+ (uint64_t)rc_notCachedError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 4, @"The operation could not be completed with just the contents of the cache.", MEMORY[0x1E4F1CC08]);
}

+ (uint64_t)rc_notAvailableError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 5, @"The requested data is not available.", MEMORY[0x1E4F1CC08]);
}

+ (id)rc_offlineErrorWithReason:()RCErrorAdditions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"RCErrorOfflineReasonKey";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 7, 0, v3);

  return v4;
}

+ (id)rc_missingConfigErrorWithUnderlyingError:()RCErrorAdditions
{
  id v3 = a3;
  if (v3
    && ([MEMORY[0x1E4F1CA98] null],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v3 isEqual:v4],
        v4,
        (v5 & 1) == 0))
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [v7 setObject:@"Failed to load the configuration." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v7 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCErrorDomain" code:10 userInfo:v7];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (uint64_t)rc_parsingError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 9, @"The response could not be parsed into a valid configuration.", MEMORY[0x1E4F1CC08]);
}

+ (id)rc_endpointErrorWithUnderlyingEndpointErrors:()RCErrorAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "description", (void)v14);
          [v4 appendString:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    [v11 setObject:@"The endpoint returned one or more errors." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v11 setObject:v4 forKeyedSubscript:@"RCErrorEndpointErrorsKey"];
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RCErrorDomain" code:14 userInfo:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (uint64_t)rc_unknownBackgroundNetworkOperationError
{
  return objc_msgSend(a1, "rc_errorWithCode:description:additionalUserInfo:", 12, @"The background URL session did become invalid but not error was provided.", MEMORY[0x1E4F1CC08]);
}

@end