@interface CLClientManagerAuthorizationContext
- (BOOL)authorizedForWidgetUpdates;
- (BOOL)inUseLevelIsAtLeast:(int)a3;
- (BOOL)isAuthorizedForServiceType:(unint64_t)a3;
- (BOOL)isAuthorizedForServiceTypeMask:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonProvisionallyAuthorizedForServiceType:(unint64_t)a3;
- (BOOL)isNonProvisionallyAuthorizedForServiceTypeMask:(unint64_t)a3;
- (CLClientManagerAuthorizationContext)initWithInUseLevel:(int)a3 registrationResult:(int)a4 transientAwareRegistrationResult:(int)a5 serviceMaskTuple:(CLClientServiceTypeMaskTuple)a6 diagnosticMask:(unint64_t)a7 authorizedForWidgetUpdates:(BOOL)a8;
- (id)authorizationContextByANDingServiceMaskTuple:(CLClientServiceTypeMaskTuple)a3;
- (id)description;
- (id)getStateSummary;
- (int)inUseLevel;
- (int)registrationResult;
- (int)transientAwareRegistrationResult;
- (unint64_t)diagnosticMask;
- (unint64_t)effectiveServiceMask;
- (unint64_t)provisionalServiceMask;
- (unint64_t)staticServiceMask;
@end

@implementation CLClientManagerAuthorizationContext

- (id)description
{
  return +[NSString stringWithFormat:@"AuthContext InUse:%d  RegResult:%d(%d) EffectiveMask:%d  ProvisionalMask:%d  DiagnosticMask:%d", self->_inUseLevel, self->_registrationResult, self->_transientAwareRegistrationResult, self->_effectiveServiceMask, self->_provisionalServiceMask, self->_diagnosticMask];
}

- (BOOL)isAuthorizedForServiceType:(unint64_t)a3
{
  return [(CLClientManagerAuthorizationContext *)self isAuthorizedForServiceTypeMask:1 << a3];
}

- (BOOL)isNonProvisionallyAuthorizedForServiceTypeMask:(unint64_t)a3
{
  return (a3 & ~[(CLClientManagerAuthorizationContext *)self effectiveServiceMask]) == 0;
}

- (BOOL)isAuthorizedForServiceTypeMask:(unint64_t)a3
{
  unint64_t v5 = [(CLClientManagerAuthorizationContext *)self effectiveServiceMask];
  return (a3 & ~([(CLClientManagerAuthorizationContext *)self provisionalServiceMask] | v5)) == 0;
}

- (unint64_t)effectiveServiceMask
{
  return self->_effectiveServiceMask;
}

- (unint64_t)provisionalServiceMask
{
  return self->_provisionalServiceMask;
}

- (BOOL)inUseLevelIsAtLeast:(int)a3
{
  return self->_inUseLevel >= a3;
}

- (BOOL)isNonProvisionallyAuthorizedForServiceType:(unint64_t)a3
{
  return [(CLClientManagerAuthorizationContext *)self isNonProvisionallyAuthorizedForServiceTypeMask:1 << a3];
}

- (CLClientManagerAuthorizationContext)initWithInUseLevel:(int)a3 registrationResult:(int)a4 transientAwareRegistrationResult:(int)a5 serviceMaskTuple:(CLClientServiceTypeMaskTuple)a6 diagnosticMask:(unint64_t)a7 authorizedForWidgetUpdates:(BOOL)a8
{
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  v15.receiver = self;
  v15.super_class = (Class)CLClientManagerAuthorizationContext;
  result = [(CLClientManagerAuthorizationContext *)&v15 init];
  if (result)
  {
    result->_registrationResult = a4;
    result->_inUseLevel = a3;
    result->_effectiveServiceMask = var0;
    result->_provisionalServiceMask = var1;
    result->_transientAwareRegistrationResult = a5;
    result->_diagnosticMask = a7;
    result->_authorizedForWidgetUpdates = a8;
  }
  return result;
}

- (int)registrationResult
{
  return self->_registrationResult;
}

- (int)transientAwareRegistrationResult
{
  return self->_transientAwareRegistrationResult;
}

- (BOOL)authorizedForWidgetUpdates
{
  return self->_authorizedForWidgetUpdates;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5) {
    LOBYTE(v5) = self->_inUseLevel == *((_DWORD *)a3 + 5)
  }
              && self->_staticServiceMask == *((void *)a3 + 4)
              && self->_effectiveServiceMask == *((void *)a3 + 5)
              && self->_provisionalServiceMask == *((void *)a3 + 6)
              && self->_registrationResult == *((_DWORD *)a3 + 4)
              && self->_authorizedForWidgetUpdates == *((unsigned __int8 *)a3 + 8)
              && self->_transientAwareRegistrationResult == *((_DWORD *)a3 + 3)
              && self->_diagnosticMask == *((void *)a3 + 3);
  return v5;
}

- (int)inUseLevel
{
  return self->_inUseLevel;
}

- (id)authorizationContextByANDingServiceMaskTuple:(CLClientServiceTypeMaskTuple)a3
{
  v3 = self;
  uint64_t v4 = *((void *)self + 5);
  uint64_t v5 = *((void *)self + 6);
  unint64_t v6 = v4 & a3.var0;
  unint64_t v7 = v5 & a3.var1;
  if ((v4 & a3.var0) != v4 || v7 != v5)
  {
    v9 = [CLClientManagerAuthorizationContext alloc];
    LOBYTE(v11) = v3[8];
    v10 = -[CLClientManagerAuthorizationContext initWithInUseLevel:registrationResult:transientAwareRegistrationResult:serviceMaskTuple:diagnosticMask:authorizedForWidgetUpdates:](v9, "initWithInUseLevel:registrationResult:transientAwareRegistrationResult:serviceMaskTuple:diagnosticMask:authorizedForWidgetUpdates:", *((unsigned int *)v3 + 5), *((unsigned int *)v3 + 4), *((unsigned int *)v3 + 3), v6, v7, *((void *)v3 + 3), v11);
    return v10;
  }
  return self;
}

- (id)getStateSummary
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_inUseLevel)] forKeyedSubscript:@"InUseLevel"];
  [v3 setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_effectiveServiceMask) forKeyedSubscript:@"EffectiveServiceMask"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_provisionalServiceMask)] forKeyedSubscript:@"ProvisionalServiceMask"];
  [v3 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_registrationResult) forKeyedSubscript:@"RegistrationResult"];
  [v3 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_transientAwareRegistrationResult) forKeyedSubscript:@"TransientAwareRegistrationResult"];
  [v3 setObject:[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_diagnosticMask)] forKeyedSubscript:@"DiagnosticMask"];
  [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_authorizedForWidgetUpdates)] forKeyedSubscript:@"AuthorizedForWidgetUpdates"];
  return v3;
}

- (unint64_t)diagnosticMask
{
  return self->_diagnosticMask;
}

- (unint64_t)staticServiceMask
{
  return self->_staticServiceMask;
}

@end