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
  v9 = [v6 valueForEntitlement:@"com.apple.nfrestore"];

  if (!v9)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v34 = [v6 processIdentifier];
      uint64_t v17 = 43;
      if (!isMetaClass) {
        uint64_t v17 = 45;
      }
      v12(3, "%c[%{public}s %{public}s]:%i PID %d (%s) missing entitlement: %s", v17, ClassName, Name, 35, v34, buffer, "com.apple.nfrestore");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    *(_DWORD *)buf = 67110658;
    int v36 = v20;
    __int16 v37 = 2082;
    v38 = object_getClassName(self);
    __int16 v39 = 2082;
    v40 = sel_getName(a2);
    __int16 v41 = 1024;
    int v42 = 35;
    __int16 v43 = 1024;
    unsigned int v44 = [v6 processIdentifier];
    __int16 v45 = 2080;
    v46 = buffer;
    __int16 v47 = 2080;
    v48 = "com.apple.nfrestore";
    v21 = "%c[%{public}s %{public}s]:%i PID %d (%s) missing entitlement: %s";
    v22 = v18;
    uint32_t v23 = 60;
    goto LABEL_22;
  }
  if (!+[NFRestoreServiceServer checkCurrentuser])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v24 = NFLogGetLogger();
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(self);
      BOOL v27 = class_isMetaClass(v26);
      v28 = object_getClassName(self);
      v33 = sel_getName(a2);
      uint64_t v29 = 45;
      if (v27) {
        uint64_t v29 = 43;
      }
      v25(3, "%c[%{public}s %{public}s]:%i Current user isn't expected", v29, v28, v33, 40);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v18 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    v30 = object_getClass(self);
    if (class_isMetaClass(v30)) {
      int v31 = 43;
    }
    else {
      int v31 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v36 = v31;
    __int16 v37 = 2082;
    v38 = object_getClassName(self);
    __int16 v39 = 2082;
    v40 = sel_getName(a2);
    __int16 v41 = 1024;
    int v42 = 40;
    v21 = "%c[%{public}s %{public}s]:%i Current user isn't expected";
    v22 = v18;
    uint32_t v23 = 34;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
LABEL_23:

    BOOL v10 = 0;
    goto LABEL_24;
  }
  [v6 resume];
  BOOL v10 = 1;
LABEL_24:

  return v10;
}

@end