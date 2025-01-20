@interface ZhuGeBasebandPostponementStatusArmory
+ (id)convertToPostponementKey:(id)a3;
+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5;
- (BOOL)loadPostponementStatus:(id *)a3;
- (NSDictionary)postponementStatus;
- (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5;
- (void)setPostponementStatus:(id)a3;
@end

@implementation ZhuGeBasebandPostponementStatusArmory

+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = +[ZhuGeSingletonArmory sharedInstance];
  v9 = [v8 query:v7 isCachable:v6 withError:a5];

  return v9;
}

- (BOOL)loadPostponementStatus:(id *)a3
{
  CFTypeRef cf = 0;
  v5 = +[ZhuGeBasebandConnectionArmory getCTServerConnection];
  if (v5)
  {
    v9 = v5;
    uint64_t v10 = _CTServerConnectionCopyPostponementStatus();
    uint64_t v20 = v10;
    BOOL v11 = v10 == 0;
    if (v10)
    {
      CTError_error_string(&v20);
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandPostponementStatusArmory loadPostponementStatus:]", 448, @"Failed to get postponementStatus: %d:%d(%s)", v12, v13, v14, v10);
      *a3 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:4 underlyingError:0];
    }
    else
    {
      [(ZhuGeBasebandPostponementStatusArmory *)self setPostponementStatus:cf];

      CFTypeRef cf = 0;
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandPostponementStatusArmory loadPostponementStatus:]", 456, @"postponementStatus is reloaded", v15, v16, v17, v19);
    }
    CFRelease(v9);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandPostponementStatusArmory loadPostponementStatus:]", 441, @"Failed to get CTServerConnection instance", v6, v7, v8, v19);
    [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:39 underlyingError:0];
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  id v8 = a3;
  v9 = [(ZhuGeBasebandPostponementStatusArmory *)self postponementStatus];

  if (v9 && a4 || [(ZhuGeBasebandPostponementStatusArmory *)self loadPostponementStatus:a5])
  {
    uint64_t v10 = [(ZhuGeBasebandPostponementStatusArmory *)self postponementStatus];
    BOOL v11 = [v10 objectForKeyedSubscript:v8];

    if (!v11)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[ZhuGeBasebandPostponementStatusArmory query:isCachable:withError:]", 494, @"key %@ does not exist in postponementStatus", v12, v13, v14, (uint64_t)v8);
      *a5 = [MEMORY[0x263F087E8] errorWithZhuGeErrorCode:29 underlyingError:0];
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)convertToPostponementKey:(id)a3
{
  if ([a3 isEqualToString:@"kCTPostponementStatus"]) {
    id v3 = (id)*MEMORY[0x263F02EA0];
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (NSDictionary)postponementStatus
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPostponementStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end