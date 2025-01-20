@interface AEAConcreteXPCConnectionPrimitives
- (BOOL)connectionCanFetchActiveRestrictionUUIDs:(id)a3;
- (BOOL)connectionCanPublishAssessmentState:(id)a3;
- (BOOL)connectionCanRegisterAsAssessmentSource:(id)a3;
- (id)auditTokenForConnection:(id)a3;
- (id)makeActiveRestrictionUUIDFetchingListener;
- (id)makeSourceRegisteringListener;
- (int64_t)connectionTypeForConnection:(id)a3;
@end

@implementation AEAConcreteXPCConnectionPrimitives

- (BOOL)connectionCanPublishAssessmentState:(id)a3
{
  v3 = [a3 valueForEntitlement:AEAssessmentModeEntitlement];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)connectionCanRegisterAsAssessmentSource:(id)a3
{
  v3 = [a3 valueForEntitlement:AEAssessmentModeEntitlement];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)connectionCanFetchActiveRestrictionUUIDs:(id)a3
{
  v3 = [a3 valueForEntitlement:AEAssessmentModeFetchActiveRestrictionUUIDEntitlement];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)auditTokenForConnection:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [AEAConcreteAuditToken alloc];
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v7, 0, sizeof(v7));
  }
  v5 = [(AEAConcreteAuditToken *)v4 initWithAuditToken:v7];

  return v5;
}

- (id)makeSourceRegisteringListener
{
  id v2 = objc_alloc((Class)NSXPCListener);
  id v3 = [v2 initWithMachServiceName:AEAssessmentStatePublisherRegisteringMachServiceName];

  return v3;
}

- (id)makeActiveRestrictionUUIDFetchingListener
{
  id v2 = objc_alloc((Class)NSXPCListener);
  id v3 = [v2 initWithMachServiceName:AEAssessmentActiveRestrictionUUIDFetchingMachServiceName];

  return v3;
}

- (int64_t)connectionTypeForConnection:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 serviceName];
  unsigned __int8 v5 = [v4 isEqualToString:AEAssessmentStatePublisherRegisteringMachServiceName];

  if (v5)
  {
    int64_t v6 = 1;
  }
  else
  {
    v7 = [v3 serviceName];
    unsigned int v8 = [v7 isEqualToString:AEAssessmentActiveRestrictionUUIDFetchingMachServiceName];

    if (v8) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 0;
    }
  }

  return v6;
}

@end