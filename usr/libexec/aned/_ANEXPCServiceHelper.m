@interface _ANEXPCServiceHelper
+ (BOOL)allowAggressivePowerSavingFor:(id)a3;
+ (BOOL)allowProcessModelShareFor:(id)a3;
+ (BOOL)allowRestrictedAccessFor:(id)a3;
+ (BOOL)allowRestrictedAccessFor:(id)a3 entitlementString:(id)a4;
+ (id)new;
+ (id)serviceWithName:(id)a3 interface:(id)a4 delegate:(id)a5 requiresEntitlement:(BOOL)a6 entitlementString:(id)a7;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requiresEntitlement;
- (NSString)entitlementString;
- (NSString)serviceName;
- (NSXPCInterface)interface;
- (NSXPCListener)listener;
- (_ANEXPCServiceHelper)init;
- (_ANEXPCServiceHelper)initWithMachServiceName:(id)a3 interface:(id)a4 delegate:(id)a5 requiresEntitlement:(BOOL)a6 entitlementString:(id)a7;
- (id)server;
- (void)setEntitlementString:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation _ANEXPCServiceHelper

+ (id)new
{
  return 0;
}

- (_ANEXPCServiceHelper)init
{
  return 0;
}

- (_ANEXPCServiceHelper)initWithMachServiceName:(id)a3 interface:(id)a4 delegate:(id)a5 requiresEntitlement:(BOOL)a6 entitlementString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_ANEXPCServiceHelper;
  v16 = [(_ANEXPCServiceHelper *)&v25 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong(&v16->_server, a5);
    v18 = (NSString *)[v12 copy];
    serviceName = v17->_serviceName;
    v17->_serviceName = v18;

    objc_storeStrong((id *)&v17->_interface, a4);
    v17->_requiresEntitlement = a6;
    v20 = (NSString *)[v15 copy];
    entitlementString = v17->_entitlementString;
    v17->_entitlementString = v20;

    v22 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:v12];
    listener = v17->_listener;
    v17->_listener = v22;

    [(NSXPCListener *)v17->_listener setDelegate:v17];
    [(NSXPCListener *)v17->_listener resume];
  }

  return v17;
}

+ (id)serviceWithName:(id)a3 interface:(id)a4 delegate:(id)a5 requiresEntitlement:(BOOL)a6 entitlementString:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [objc_alloc((Class)objc_opt_class()) initWithMachServiceName:v14 interface:v13 delegate:v12 requiresEntitlement:v7 entitlementString:v11];

  return v15;
}

+ (BOOL)allowRestrictedAccessFor:(id)a3
{
  id v4 = a3;
  v5 = +[_ANEStrings restrictedAccessEntitlement];
  LOBYTE(a1) = [a1 allowRestrictedAccessFor:v4 entitlementString:v5];

  return (char)a1;
}

+ (BOOL)allowAggressivePowerSavingFor:(id)a3
{
  id v4 = a3;
  v5 = +[_ANEStrings aggressivePowerSavingEntitlement];
  LOBYTE(a1) = [a1 allowRestrictedAccessFor:v4 entitlementString:v5];

  return (char)a1;
}

+ (BOOL)allowProcessModelShareFor:(id)a3
{
  id v4 = a3;
  v5 = +[_ANEStrings processModelShareAccessEntitlement];
  LOBYTE(a1) = [a1 allowRestrictedAccessFor:v4 entitlementString:v5];

  return (char)a1;
}

+ (BOOL)allowRestrictedAccessFor:(id)a3 entitlementString:(id)a4
{
  id v4 = [a3 valueForEntitlement:a4];
  v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[_ANELog daemon];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v15 = NSStringFromSelector(a2);
    v16 = [(_ANEXPCServiceHelper *)self serviceName];
    unsigned int v17 = [v8 processIdentifier];
    v18 = [(_ANEXPCServiceHelper *)self entitlementString];
    unsigned int v19 = [(_ANEXPCServiceHelper *)self requiresEntitlement];
    *(_DWORD *)location = 138413570;
    v20 = "NO";
    *(void *)&location[4] = v15;
    __int16 v30 = 2112;
    if (v19) {
      v20 = "YES";
    }
    v31 = v16;
    __int16 v32 = 1024;
    unsigned int v33 = v17;
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    v37 = v18;
    __int16 v38 = 2080;
    v39 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@: %@ : PID=%d : conn=%@ requiresEntitlement(%@)=%s", location, 0x3Au);
  }
  if ([(_ANEXPCServiceHelper *)self requiresEntitlement]
    && !+[_ANEXPCServiceHelper allowRestrictedAccessFor:v8 entitlementString:self->_entitlementString])
  {
    id v13 = +[_ANELog daemon];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001BAAC(v8, self, v13);
    }

    [v8 invalidate];
    BOOL v12 = 0;
  }
  else
  {
    v10 = [(_ANEXPCServiceHelper *)self interface];
    [v8 setExportedInterface:v10];

    id v11 = [(_ANEXPCServiceHelper *)self server];
    [v8 setExportedObject:v11];

    objc_initWeak((id *)location, v8);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000A1C4;
    v27[3] = &unk_10002C7B0;
    objc_copyWeak(v28, (id *)location);
    v28[1] = (id)a2;
    v27[4] = self;
    [v8 setInterruptionHandler:v27];
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_10000A248;
    v24 = &unk_10002C7B0;
    objc_copyWeak(v26, (id *)location);
    v26[1] = (id)a2;
    objc_super v25 = self;
    [v8 setInvalidationHandler:&v21];
    [v8 resume:v21, v22, v23, v24];
    objc_destroyWeak(v26);
    objc_destroyWeak(v28);
    objc_destroyWeak((id *)location);
    BOOL v12 = 1;
  }

  return v12;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (BOOL)requiresEntitlement
{
  return self->_requiresEntitlement;
}

- (NSString)entitlementString
{
  return self->_entitlementString;
}

- (void)setEntitlementString:(id)a3
{
}

- (id)server
{
  return self->_server;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_server, 0);
  objc_storeStrong((id *)&self->_entitlementString, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end