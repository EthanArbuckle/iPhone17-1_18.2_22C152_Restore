@interface _DASExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (_DASPlugin)contextPlugin;
- (id)remoteContextWithError:(id *)a3;
- (int)pid;
- (void)activityCompletedWithStatus:(unsigned __int8)a3;
- (void)setContextPlugin:(id)a3;
@end

@implementation _DASExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1001C4520 != -1) {
    dispatch_once(&qword_1001C4520, &stru_1001785A8);
  }
  v2 = (void *)qword_1001C4528;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1001C4530 != -1) {
    dispatch_once(&qword_1001C4530, &stru_1001785C8);
  }
  v2 = (void *)qword_1001C4538;

  return v2;
}

- (int)pid
{
  v2 = [(_DASExtensionHostContext *)self _auxiliaryConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (id)remoteContextWithError:(id *)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1000E9EA8;
  v12 = sub_1000E9EB8;
  id v13 = 0;
  v4 = [(_DASExtensionHostContext *)self _auxiliaryConnection];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E9EC0;
  v7[3] = &unk_1001785F0;
  v7[4] = &v8;
  v5 = [v4 remoteObjectProxyWithErrorHandler:v7];

  if (a3) {
    *a3 = (id) v9[5];
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)activityCompletedWithStatus:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = +[_DASDaemonLogger logForCategory:@"plugin"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Host received notice that extension is finished", v7, 2u);
  }

  v6 = [(_DASExtensionHostContext *)self contextPlugin];
  [v6 extensionDidFinishWithStatus:v3];
}

- (_DASPlugin)contextPlugin
{
  return (_DASPlugin *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextPlugin:(id)a3
{
}

- (void).cxx_destruct
{
}

@end