@interface KCSharingGroupNotificationConnection
+ (id)sharedInstance;
- (KCSharingGroupNotificationConnection)init;
- (id)connection;
- (void)groupsUpdatedWithInfos:(id)a3;
@end

@implementation KCSharingGroupNotificationConnection

- (void).cxx_destruct
{
}

- (id)connection
{
  if (!self->_connectionOK)
  {
    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;
  }
  v4 = self->_connection;
  if (!v4)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    self->_connectionOK = 1;
    v5 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.AuthenticationServices.CredentialSharingGroups" options:0];
    v6 = self->_connection;
    self->_connection = v5;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001D5780;
    v14[3] = &unk_1003077A0;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001D5840;
    v12[3] = &unk_1003077A0;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v12];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, -1);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.KCSharingGroupNotificationConnection.xpcConnection", v8);
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___KCSharingGroupNotificationProtocol];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v10];
    [(NSXPCConnection *)self->_connection setExportedInterface:v10];
    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(NSXPCConnection *)self->_connection _setQueue:v9];
    [(NSXPCConnection *)self->_connection activate];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    v4 = self->_connection;
  }

  return v4;
}

- (void)groupsUpdatedWithInfos:(id)a3
{
  id v4 = a3;
  v5 = [(KCSharingGroupNotificationConnection *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1003070C8];
  [v6 groupsUpdatedWithInfos:v4];
}

- (KCSharingGroupNotificationConnection)init
{
  v3.receiver = self;
  v3.super_class = (Class)KCSharingGroupNotificationConnection;
  return [(KCSharingGroupNotificationConnection *)&v3 init];
}

+ (id)sharedInstance
{
  if (qword_10035D2E0 != -1) {
    dispatch_once(&qword_10035D2E0, &stru_100307088);
  }
  v2 = (void *)qword_10035D2E8;

  return v2;
}

@end