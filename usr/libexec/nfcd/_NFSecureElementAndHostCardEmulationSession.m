@interface _NFSecureElementAndHostCardEmulationSession
+ (id)validateEntitlements:(id)a3;
- (NFSecureElementWrapper)embeddedSecureElementWrapper;
- (id)_getSecureElementWrapperForSEID:(id)a3;
- (id)initialRoutingConfig;
- (void)didStartSession:(id)a3;
- (void)setEmbeddedSecureElementWrapper:(id)a3;
- (void)startEmulationWithCompletion:(id)a3;
- (void)stopEmulationWithCompletion:(id)a3;
- (void)transceive:(id)a3 forSEID:(id)a4 completion:(id)a5;
@end

@implementation _NFSecureElementAndHostCardEmulationSession

+ (id)validateEntitlements:(id)a3
{
  id v5 = a3;
  if [v5 seSessionAccess] && (objc_msgSend(v5, "hceAccess"))
  {
    id v6 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", v12, ClassName, Name, 30);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(a1);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v27 = v15;
      __int16 v28 = 2082;
      v29 = object_getClassName(a1);
      __int16 v30 = 2082;
      v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 30;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card and SE access", buf, 0x22u);
    }

    id v16 = objc_alloc((Class)NSError);
    v17 = +[NSString stringWithUTF8String:"nfcd"];
    v24[0] = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:"Not entitled"];
    v25[0] = v18;
    v25[1] = &off_10031A758;
    v24[1] = @"Line";
    v24[2] = @"Method";
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v25[2] = v19;
    v24[3] = NSDebugDescriptionErrorKey;
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 31];
    v25[3] = v20;
    v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    id v6 = [v16 initWithDomain:v17 code:32 userInfo:v21];
  }

  return v6;
}

- (id)initialRoutingConfig
{
  return +[NFRoutingConfig embeddedWiredModeWithHCE];
}

- (void)didStartSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  [(_NFHCESession *)&v7 didStartSession:a3];
  v4 = +[_NFHardwareManager sharedHardwareManager];
  id v5 = [v4 secureElementWrapper];
  embeddedSecureElementWrapper = self->_embeddedSecureElementWrapper;
  self->_embeddedSecureElementWrapper = v5;
}

- (id)_getSecureElementWrapperForSEID:(id)a3
{
  id v5 = a3;
  id v6 = [(_NFSecureElementAndHostCardEmulationSession *)self embeddedSecureElementWrapper];
  objc_super v7 = [v6 serialNumber];
  if ([v7 isEqualToString:v5])
  {

LABEL_4:
    v11 = [(_NFSecureElementAndHostCardEmulationSession *)self embeddedSecureElementWrapper];
    goto LABEL_15;
  }
  v8 = [(_NFSecureElementAndHostCardEmulationSession *)self embeddedSecureElementWrapper];
  v9 = [v8 systemOSSerialNumber];
  unsigned int v10 = [v9 isEqualToString:v5];

  if (v10) {
    goto LABEL_4;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v16 = 45;
    if (isMetaClass) {
      uint64_t v16 = 43;
    }
    v13(3, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", v16, ClassName, Name, 55, v5);
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
    *(_DWORD *)buf = 67110146;
    int v24 = v19;
    __int16 v25 = 2082;
    v26 = object_getClassName(self);
    __int16 v27 = 2082;
    __int16 v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 55;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown secure element id: %{public}@", buf, 0x2Cu);
  }

  v11 = 0;
LABEL_15:

  return v11;
}

- (void)startEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  kdebug_trace();
  id v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TAG_SESSION_START_EMULATION_XPC", (const char *)&unk_100286819, buf, 2u);
  }

  v12.receiver = self;
  v12.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  objc_super v7 = [(_NFSession *)&v12 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000711A8;
  block[3] = &unk_100301D38;
  id v10 = v5;
  SEL v11 = a2;
  block[4] = self;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (void)stopEmulationWithCompletion:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  id v6 = [(_NFSession *)&v11 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007187C;
  block[3] = &unk_100301D38;
  id v9 = v5;
  SEL v10 = a2;
  block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

- (void)transceive:(id)a3 forSEID:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_NFSecureElementAndHostCardEmulationSession;
  objc_super v12 = [(_NFSession *)&v21 workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071F2C;
  block[3] = &unk_100302250;
  id v19 = v11;
  SEL v20 = a2;
  block[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  dispatch_async(v12, block);
}

- (NFSecureElementWrapper)embeddedSecureElementWrapper
{
  return self->_embeddedSecureElementWrapper;
}

- (void)setEmbeddedSecureElementWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end