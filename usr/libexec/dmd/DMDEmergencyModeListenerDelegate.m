@interface DMDEmergencyModeListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DMDEmergencyModeListenerDelegate)initWithPolicyPersistence:(id)a3;
- (DMDPolicyPersistence)policyPersistence;
@end

@implementation DMDEmergencyModeListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.dmd.emergency-mode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    v7 = +[DMFEmergencyModeMonitor remoteInterface];
    [v5 setExportedInterface:v7];

    v8 = [(DMDEmergencyModeListenerDelegate *)self policyPersistence];
    [v5 setExportedObject:v8];

    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    v10 = DMFEmergencyModeLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100083D4C((uint64_t)v5, v10);
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (DMDPolicyPersistence)policyPersistence
{
  return self->_policyPersistence;
}

- (DMDEmergencyModeListenerDelegate)initWithPolicyPersistence:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMDEmergencyModeListenerDelegate;
  v6 = [(DMDEmergencyModeListenerDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policyPersistence, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end