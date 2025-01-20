@interface TransparencyError
+ (BOOL)hasUnknownSPKIHashError:(id)a3;
+ (id)diagnosticError:(id)a3;
+ (id)diagnosticError:(id)a3 depth:(unint64_t)a4;
+ (id)diagnosticUserInfo:(id)a3 depth:(unint64_t)a4;
+ (id)diagnosticUserInfoValue:(id)a3 depth:(unint64_t)a4;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 userinfo:(id)a7 description:(id)a8;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 userinfo:(id)a7 description:(id)a8 arguments:(char *)a9;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 userinfo:(id)a6 description:(id)a7;
+ (id)errorWithError:(id)a3 underlyingError:(id)a4;
+ (id)truncateUnderlyingErrorDepth:(id)a3 maxDepth:(unint64_t)a4;
+ (id)unimplementedError:(id)a3;
@end

@implementation TransparencyError

+ (id)unimplementedError:(id)a3
{
  return +[TransparencyError errorWithDomain:@"TransparencyErrorInterface", -132, @"%@ is unimplemented", a3 code description];
}

+ (id)truncateUnderlyingErrorDepth:(id)a3 maxDepth:(unint64_t)a4
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4)
    {
      v6 = [v5 userInfo];
      uint64_t v7 = *MEMORY[0x263F08608];
      v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08608]];
      v9 = +[TransparencyError truncateUnderlyingErrorDepth:v8 maxDepth:a4 - 1];

      v10 = (void *)MEMORY[0x263EFF9A0];
      v11 = [v5 userInfo];
      v12 = [v10 dictionaryWithDictionary:v11];

      [v12 setObject:v9 forKeyedSubscript:v7];
      v13 = (void *)MEMORY[0x263F087E8];
      v14 = [v5 domain];
      v15 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v5, "code"), v12);
    }
    else
    {
      v16 = (void *)MEMORY[0x263F087E8];
      v9 = [v5 domain];
      v15 = objc_msgSend(v16, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v5, "code"), 0);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 userinfo:(id)a7 description:(id)a8 arguments:(char *)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v16)
  {
    uint64_t v18 = [v16 mutableCopy];
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v19 = (void *)v18;
  if (v15)
  {
    v20 = +[TransparencyError truncateUnderlyingErrorDepth:v15 maxDepth:10];
    [v19 setObject:v20 forKey:*MEMORY[0x263F08608]];
  }
  if (v17)
  {
    v21 = (void *)[[NSString alloc] initWithFormat:v17 arguments:a9];
    [v19 setObject:v21 forKey:*MEMORY[0x263F08320]];
  }
  v22 = [MEMORY[0x263F087E8] errorWithDomain:v14 code:a4 userInfo:v19];
  if (a5 == 5)
  {
    v23 = +[TransparencyAnalytics logger];
    v24 = v23;
    uint64_t v25 = 0;
  }
  else
  {
    if (a5 != 6) {
      goto LABEL_13;
    }
    v23 = +[TransparencyAnalytics logger];
    v24 = v23;
    uint64_t v25 = 1;
  }
  [v23 logResultForEvent:@"errorEvent" hardFailure:v25 result:v22];

LABEL_13:

  return v22;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 userinfo:(id)a7 description:(id)a8
{
  v8 = +[TransparencyError errorWithDomain:code:errorLevel:underlyingError:userinfo:description:arguments:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:userinfo:description:arguments:", a3, a4, a5, a6, a7, a8, &v11, &v11);

  return v8;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 userinfo:(id)a6 description:(id)a7
{
  return +[TransparencyError errorWithDomain:a3, (int)a4, 4, a5, a6, @"%@", a7 code errorLevel underlyingError userinfo description];
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7 arguments:(char *)a8
{
  return +[TransparencyError errorWithDomain:a3 code:a4 errorLevel:a5 underlyingError:a6 userinfo:0 description:a7 arguments:a8];
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 errorLevel:(unint64_t)a5 underlyingError:(id)a6 description:(id)a7
{
  uint64_t v7 = +[TransparencyError errorWithDomain:a3 code:a4 errorLevel:a5 underlyingError:a6 description:a7 arguments:&v10];

  return v7;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 underlyingError:(id)a5 description:(id)a6
{
  v6 = +[TransparencyError errorWithDomain:a3 code:a4 errorLevel:4 underlyingError:a5 description:a6 arguments:&v9];

  return v6;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  id v5 = +[TransparencyError errorWithDomain:a3 code:a4 errorLevel:4 underlyingError:0 description:a5 arguments:&v8];

  return v5;
}

+ (BOOL)hasUnknownSPKIHashError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    LOBYTE(v7) = 0;
    goto LABEL_18;
  }
  id v5 = [v3 domain];
  if (![v5 isEqualToString:@"TransparencyErrorVerify"])
  {

LABEL_7:
    uint64_t v8 = [v4 userInfo];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = *MEMORY[0x263F08608];
      uint64_t v7 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      if (v7)
      {
        uint64_t v11 = [v9 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 domain];
          if ([v12 isEqualToString:@"TransparencyErrorVerify"])
          {
            uint64_t v13 = [v11 code];

            if (v13 == -9)
            {
              LOBYTE(v7) = 1;
LABEL_16:

              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        LOBYTE(v7) = 0;
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v7) = 0;
    }
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v6 = [v4 code];

  if (v6 != -9) {
    goto LABEL_7;
  }
  LOBYTE(v7) = 1;
LABEL_18:

  return (char)v7;
}

+ (id)errorWithError:(id)a3 underlyingError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v5 userInfo];
    uint64_t v9 = *MEMORY[0x263F08608];
    uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    uint64_t v11 = [v5 domain];
    uint64_t v12 = [v5 code];
    if (v10)
    {
      uint64_t v13 = [v5 userInfo];
      id v14 = [v13 objectForKeyedSubscript:v9];
      id v15 = +[TransparencyError errorWithError:v14 underlyingError:v7];
      id v16 = +[TransparencyError errorWithDomain:v11 code:v12 underlyingError:v15 description:0];
    }
    else
    {
      id v16 = +[TransparencyError errorWithDomain:v11 code:v12 underlyingError:v7 description:0];
    }
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

+ (id)diagnosticUserInfoValue:(id)a3 depth:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = 0;
  if (v6 && a4 <= 5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v8 = (__CFString *)v6;
LABEL_6:
      uint64_t v7 = v8;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [MEMORY[0x263EFF980] array];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        unint64_t v14 = a4 + 1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            id v16 = objc_msgSend(a1, "diagnosticUserInfoValue:depth:", *(void *)(*((void *)&v17 + 1) + 8 * i), v14, (void)v17);
            if (v16) {
              [(__CFString *)v7 addObject:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [a1 diagnosticUserInfo:v6 depth:a4 + 1];
        goto LABEL_6;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [a1 diagnosticError:v6 depth:a4 + 1];
        goto LABEL_6;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = [v6 description];
        goto LABEL_6;
      }
      uint64_t v7 = @"unknown";
    }
  }
LABEL_7:

  return v7;
}

+ (id)diagnosticUserInfo:(id)a3 depth:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 <= 5)
  {
    id v17 = [MEMORY[0x263EFF9A0] dictionary];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      unint64_t v11 = a4 + 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v14 = [v7 objectForKeyedSubscript:v13];
            id v15 = [a1 diagnosticUserInfoValue:v14 depth:v11];
            [v17 setObject:v15 forKeyedSubscript:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)diagnosticError:(id)a3 depth:(unint64_t)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 <= 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14[0] = @"domain";
    id v7 = [v6 domain];
    v14[1] = @"code";
    v15[0] = v7;
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    v15[1] = v8;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v10 = (void *)[v9 mutableCopy];

    unint64_t v11 = [v6 userInfo];
    uint64_t v12 = [a1 diagnosticUserInfo:v11 depth:a4 + 1];
    [v10 setObject:v12 forKeyedSubscript:@"userInfo"];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)diagnosticError:(id)a3
{
  return (id)[a1 diagnosticError:a3 depth:0];
}

@end