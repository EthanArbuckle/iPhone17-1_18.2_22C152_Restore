@interface AEAAuditTokenSwiftUtility
+ ($115C4C562B26FF47E01F9F4EA65B5887)underlyingAuditTokenFromAuditToken:(SEL)a3;
+ (id)auditTokenWithUnderlyingAuditToken:(id *)a3;
@end

@implementation AEAAuditTokenSwiftUtility

+ (id)auditTokenWithUnderlyingAuditToken:(id *)a3
{
  v4 = [AEAConcreteAuditToken alloc];
  long long v5 = *(_OWORD *)&a3->var0[4];
  v8[0] = *(_OWORD *)a3->var0;
  v8[1] = v5;
  v6 = [(AEAConcreteAuditToken *)v4 initWithAuditToken:v8];

  return v6;
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)underlyingAuditTokenFromAuditToken:(SEL)a3
{
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v9 && (isKindOfClass & 1) != 0)
  {
    [v9 underlyingToken];
  }
  else
  {
    v6 = +[AEAConcreteAuditToken invalidAuditToken];
    v7 = v6;
    if (v6)
    {
      [v6 underlyingToken];
    }
    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }
  }

  return result;
}

@end