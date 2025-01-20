@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  memset(buffer, 0, 255);
  proc_name((int)[v6 processIdentifier], buffer, 0xFEu);
  v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NFPrivateServiceInterface];
  [v6 setExportedInterface:v7];

  v8 = objc_opt_new();
  [v6 setExportedObject:v8];
  v9 = [v6 valueForEntitlement:@"com.apple.nfstorage"];

  if (v9)
  {
    [v6 resume];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v21 = [v6 processIdentifier];
      uint64_t v16 = 43;
      if (!isMetaClass) {
        uint64_t v16 = 45;
      }
      v11(3, "%c[%{public}s %{public}s]:%i PID %d (%s) missing entitlement: %s", v16, ClassName, Name, 37, v21, buffer, "com.apple.nfstorage");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      *(_DWORD *)buf = 67110658;
      int v23 = v19;
      __int16 v24 = 2082;
      v25 = object_getClassName(self);
      __int16 v26 = 2082;
      v27 = sel_getName(a2);
      __int16 v28 = 1024;
      int v29 = 37;
      __int16 v30 = 1024;
      unsigned int v31 = [v6 processIdentifier];
      __int16 v32 = 2080;
      v33 = buffer;
      __int16 v34 = 2080;
      v35 = "com.apple.nfstorage";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%s) missing entitlement: %s", buf, 0x3Cu);
    }
  }
  return v9 != 0;
}

@end