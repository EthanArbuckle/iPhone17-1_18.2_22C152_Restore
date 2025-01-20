@interface GKClientAppSigningStatus
+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4;
+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6;
+ (id)hashForAuditToken:(id *)a3;
+ (id)headerValueForSignatureType:(int64_t)a3;
+ (id)opsValidationCategoryAndStatus:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6;
+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4;
+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6;
@end

@implementation GKClientAppSigningStatus

+ (id)hashForAuditToken:(id *)a3
{
  return +[NSString stringWithFormat:@"%d%d%d%d%d%d%d%d", a3->var0[0], a3->var0[1], a3->var0[2], a3->var0[3], a3->var0[4], a3->var0[5], a3->var0[6], a3->var0[7]];
}

+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var0[4];
  v6[0] = *(_OWORD *)a4->var0;
  v6[1] = v4;
  return +[GKClientAppSigningStatus appIsDevSigned:*(void *)&a3 auditToken:v6 csopsFnValidCat:&csops_audittoken csopsFnStatus:&csops_audittoken];
}

+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var0[4];
  v6[0] = *(_OWORD *)a4->var0;
  v6[1] = v4;
  return +[GKClientAppSigningStatus appSignatureType:*(void *)&a3 auditToken:v6 csopsFnValidCat:&csops_audittoken csopsFnStatus:&csops_audittoken];
}

+ (BOOL)appIsDevSigned:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  long long v6 = *(_OWORD *)&a4->var0[4];
  v12[0] = *(_OWORD *)a4->var0;
  v12[1] = v6;
  v7 = +[GKClientAppSigningStatus opsValidationCategoryAndStatus:*(void *)&a3 auditToken:v12 csopsFnValidCat:a5 csopsFnStatus:a6];
  if ([v7 category] && objc_msgSend(v7, "status"))
  {
    if ([v7 category] == 3)
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      BOOL v9 = [v7 category] == 10 || [v7 category] == 1;
      unint64_t v10 = (unint64_t)[v7 status] & 4;
      [v7 setStatus:v10];
      unsigned int v8 = v9 & (v10 >> 2);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (int64_t)appSignatureType:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  long long v6 = *(_OWORD *)&a4->var0[4];
  v11[0] = *(_OWORD *)a4->var0;
  v11[1] = v6;
  v7 = +[GKClientAppSigningStatus opsValidationCategoryAndStatus:*(void *)&a3 auditToken:v11 csopsFnValidCat:a5 csopsFnStatus:a6];
  unsigned int v8 = [v7 category] - 2;
  if (v8 > 8) {
    int64_t v9 = 0;
  }
  else {
    int64_t v9 = qword_10024F340[v8];
  }

  return v9;
}

+ (id)opsValidationCategoryAndStatus:(int)a3 auditToken:(id *)a4 csopsFnValidCat:(void *)a5 csopsFnStatus:(void *)a6
{
  uint64_t v9 = *(void *)&a3;
  long long v10 = *(_OWORD *)&a4->var0[4];
  v25[0] = *(_OWORD *)a4->var0;
  v25[1] = v10;
  v11 = +[GKClientAppSigningStatus hashForAuditToken:v25];
  uint64_t v12 = +[SigningStatusCache getValue:v11];
  if (v12)
  {
    v13 = (void *)v12;
    if (!os_log_GKGeneral) {
      id v14 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKLRUCache, OS_LOG_TYPE_DEBUG)) {
      sub_100136A18();
    }
    v15 = v13;
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v16 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKLRUCache, OS_LOG_TYPE_DEBUG)) {
      sub_1001369A4();
    }
    LODWORD(v25[0]) = 0;
    if (((unsigned int (*)(uint64_t, uint64_t, _OWORD *, uint64_t, $115C4C562B26FF47E01F9F4EA65B5887 *))a5)(v9, 17, v25, 4, a4))
    {
      if (!os_log_GKGeneral) {
        id v17 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100136930();
      }
      LODWORD(v25[0]) = 0;
    }
    unsigned int v24 = 0;
    if (((unsigned int (*)(uint64_t, void, unsigned int *, uint64_t, $115C4C562B26FF47E01F9F4EA65B5887 *))a6)(v9, 0, &v24, 4, a4))
    {
      if (!os_log_GKGeneral) {
        id v18 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1001368BC();
      }
      unsigned int v24 = 0;
    }
    v19 = [OpsValidationCategoryAndStatus alloc];
    v20 = [(OpsValidationCategoryAndStatus *)v19 initWithOpsValidationCategory:LODWORD(v25[0]) status:v24];
    v21 = +[SigningStatusCache sharedInstance];
    [v21 insertValue:v20 forKey:v11];

    v15 = v20;
  }
  v22 = v15;

  return v22;
}

+ (id)headerValueForSignatureType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"unknown";
  }
  else {
    return *(&off_1002DC1C0 + a3 - 1);
  }
}

@end