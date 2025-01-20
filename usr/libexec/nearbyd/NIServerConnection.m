@interface NIServerConnection
+ (BOOL)_internalBuildShouldDenyConnection;
+ (id)createOneShotConnectionAndResume:(BOOL)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForConnection;
- (NIServerConnection)initWithSessionID:(id)a3 queue:(id)a4 exportedObject:(id)a5 options:(unint64_t)a6;
- (NSUUID)sessionID;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectProxy;
- (id)synchronousRemoteObjectProxy;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation NIServerConnection

- (NIServerConnection)initWithSessionID:(id)a3 queue:(id)a4 exportedObject:(id)a5 options:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"NIServerConnection.m", 25, @"Invalid parameter not satisfying: %@", @"sessionID" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)NIServerConnection;
  v15 = [(NIServerConnection *)&v33 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_sessionID, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    v16->_options = a6;
    os_log_t v17 = os_log_create("com.apple.NearbyInteraction", "NIServerConnection");
    log = v16->_log;
    v16->_log = (OS_os_log *)v17;

    if (+[NIServerConnection _internalBuildShouldDenyConnection])
    {
      if (+[NIPlatformInfo isInternalBuild])
      {
        v19 = v16->_log;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          v21 = +[NSProcessInfo processInfo];
          v22 = [v21 processName];
          *(_DWORD *)buf = 138412290;
          v35 = v22;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Deny connection: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v23 = objc_alloc((Class)NSXPCConnection);
      if (a6) {
        CFStringRef v24 = @"com.apple.nearbyd.xpc.nearbyinteraction.observer";
      }
      else {
        CFStringRef v24 = @"com.apple.nearbyd.xpc.nearbyinteraction";
      }
      v25 = (NSXPCConnection *)[v23 initWithMachServiceName:v24 options:4096];
      connection = v16->_connection;
      v16->_connection = v25;

      v27 = v16->_connection;
      v28 = sub_100303F7C();
      [(NSXPCConnection *)v27 setExportedInterface:v28];

      if (v14) {
        [(NSXPCConnection *)v16->_connection setExportedObject:v14];
      }
      v29 = v16->_connection;
      v30 = sub_100303158();
      [(NSXPCConnection *)v29 setRemoteObjectInterface:v30];

      [(NSXPCConnection *)v16->_connection _setQueue:v13];
    }
  }

  return v16;
}

- (void)dealloc
{
  [(NIServerConnection *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NIServerConnection;
  [(NIServerConnection *)&v3 dealloc];
}

- (id)remoteObjectProxy
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F3F14;
  v5[3] = &unk_10085FE00;
  v5[4] = self;
  objc_super v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];

  return v3;
}

- (id)synchronousRemoteObjectProxy
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002F4000;
  v5[3] = &unk_10085FE00;
  v5[4] = self;
  objc_super v3 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v5];

  return v3;
}

- (id)interruptionHandler
{
  return [(NSXPCConnection *)self->_connection interruptionHandler];
}

- (id)invalidationHandler
{
  return [(NSXPCConnection *)self->_connection invalidationHandler];
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)resume
{
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditTokenForConnection
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

+ (id)createOneShotConnectionAndResume:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.NearbyInteraction", v4);
  v6 = [NIServerConnection alloc];
  v7 = objc_opt_new();
  v8 = [(NIServerConnection *)v6 initWithSessionID:v7 queue:v5 exportedObject:0 options:0];

  if (v3) {
    [(NIServerConnection *)v8 resume];
  }

  return v8;
}

+ (BOOL)_internalBuildShouldDenyConnection
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@".GlobalPreferences"];
    BOOL v3 = [v2 objectForKey:@"com.apple.NearbyInteraction.ConnectionAllowList"];
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = +[NSProcessInfo processInfo];
      dispatch_queue_t v5 = [v4 processName];
      unsigned int v6 = [v3 containsObject:v5] ^ 1;
    }
    else
    {
      v4 = [v2 objectForKey:@"com.apple.NearbyInteraction.ConnectionDenyList"];
      if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v6) = 0;
        goto LABEL_11;
      }
      dispatch_queue_t v5 = +[NSProcessInfo processInfo];
      v7 = [v5 processName];
      LOBYTE(v6) = [v4 containsObject:v7];
    }
LABEL_11:

    return v6;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (NSUUID)sessionID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (id)exportedObject
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setExportedObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end