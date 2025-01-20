@interface NSError(PXError)
+ (id)_px_errorWithDomain:()PXError code:underlyingError:localizedDescription:debugDescription:;
+ (id)px_errorWithDomain:()PXError code:debugDescription:;
+ (id)px_errorWithDomain:()PXError code:underlyingError:debugDescription:;
+ (id)px_errorWithDomain:()PXError code:underlyingError:localizedDescription:;
+ (id)px_genericErrorWithDebugDescription:()PXError;
+ (id)px_genericErrorWithUnderlyingError:()PXError debugDescription:;
- (BOOL)px_isDomain:()PXError code:;
@end

@implementation NSError(PXError)

- (BOOL)px_isDomain:()PXError code:
{
  id v6 = a3;
  id v7 = [a1 domain];
  if (v7 == v6)
  {

    goto LABEL_5;
  }
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
LABEL_5:
    BOOL v9 = [a1 code] == a4;
    goto LABEL_6;
  }
  BOOL v9 = 0;
LABEL_6:

  return v9;
}

+ (id)px_genericErrorWithUnderlyingError:()PXError debugDescription:
{
  v11 = (objc_class *)NSString;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[[v11 alloc] initWithFormat:v12 arguments:&a9];

  v15 = objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", @"PXErrorDomain", -1, v13, 0, v14);

  return v15;
}

+ (id)px_genericErrorWithDebugDescription:()PXError
{
  v10 = (objc_class *)NSString;
  id v11 = a3;
  id v12 = (void *)[[v10 alloc] initWithFormat:v11 arguments:&a9];

  id v13 = objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", @"PXErrorDomain", -1, 0, 0, v12);

  return v13;
}

+ (id)px_errorWithDomain:()PXError code:debugDescription:
{
  id v12 = (objc_class *)NSString;
  id v13 = a5;
  id v14 = a3;
  v15 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  v16 = objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", v14, a4, 0, 0, v15);

  return v16;
}

+ (id)px_errorWithDomain:()PXError code:underlyingError:debugDescription:
{
  id v13 = (objc_class *)NSString;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = (void *)[[v13 alloc] initWithFormat:v14 arguments:&a9];

  v18 = objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", v16, a4, v15, 0, v17);

  return v18;
}

+ (id)px_errorWithDomain:()PXError code:underlyingError:localizedDescription:
{
  id v13 = (objc_class *)NSString;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = (void *)[[v13 alloc] initWithFormat:v14 arguments:&a9];

  v18 = objc_msgSend(a1, "_px_errorWithDomain:code:underlyingError:localizedDescription:debugDescription:", v16, a4, v15, v17, 0);

  return v18;
}

+ (id)_px_errorWithDomain:()PXError code:underlyingError:localizedDescription:debugDescription:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17 = v16;
  if (v13) {
    [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  if (v15)
  {
    v18 = (void *)[v15 copy];
    [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x263F07F80]];
  }
  if (v14)
  {
    v19 = (void *)[v14 copy];
    [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v20 = [a1 errorWithDomain:v12 code:a4 userInfo:v17];

  return v20;
}

@end