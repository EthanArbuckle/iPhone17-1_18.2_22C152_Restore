@interface NFServiceCoreNFCUI
+ (id)instance;
- (NFServiceCoreNFCUI)init;
- (void)activate:(id)a3 context:(id)a4 withCompletion:(id)a5;
- (void)invalidate;
- (void)setPurpose:(id)a3;
- (void)setUIMode:(int64_t)a3;
- (void)setUIOperationMode:(int64_t)a3;
- (void)tagCount:(id)a3;
@end

@implementation NFServiceCoreNFCUI

+ (id)instance
{
  if (qword_100010F78 != -1) {
    dispatch_once(&qword_100010F78, &stru_10000C680);
  }
  v2 = (void *)qword_100010F70;
  return v2;
}

- (NFServiceCoreNFCUI)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFServiceCoreNFCUI;
  result = [(NFServiceCoreNFCUI *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)activate:(id)a3 context:(id)a4 withCompletion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *))a5;
  v12 = +[NSXPCConnection currentConnection];
  objc_initWeak(&location, v12);

  objc_initWeak(&from, v9);
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidationRequested)
  {
    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    CFStringRef v51 = @"Invalid parameter";
    v13 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    v14 = +[NSError errorWithDomain:@"NFUIService" code:10 userInfo:v13];
    v11[2](v11, v14);

    os_unfair_lock_unlock(&self->_lock);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v17 = 43;
      }
      else {
        uint64_t v17 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i Invalidation already requested.", v17, ClassName, Name, 68);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21)) {
        int v22 = 43;
      }
      else {
        int v22 = 45;
      }
      v23 = object_getClassName(self);
      v24 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v22;
      *(_WORD *)v48 = 2082;
      *(void *)&v48[2] = v23;
      *(_WORD *)&v48[10] = 2082;
      *(void *)&v48[12] = v24;
      *(_WORD *)&v48[20] = 1024;
      *(_DWORD *)&v48[22] = 68;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalidation already requested.", buf, 0x22u);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    if (self->_uiController)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v25 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v25)
      {
        v26 = object_getClass(self);
        if (class_isMetaClass(v26)) {
          uint64_t v27 = 43;
        }
        else {
          uint64_t v27 = 45;
        }
        v28 = object_getClassName(self);
        v29 = sel_getName(a2);
        v25(3, "%c[%{public}s %{public}s]:%i Error : Re-using the sharing service...", v27, v28, v29, 76);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uiController = NFSharedLogGetLogger();
      if (os_log_type_enabled(uiController, OS_LOG_TYPE_ERROR))
      {
        v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        v33 = object_getClassName(self);
        v34 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v32;
        *(_WORD *)v48 = 2082;
        *(void *)&v48[2] = v33;
        *(_WORD *)&v48[10] = 2082;
        *(void *)&v48[12] = v34;
        *(_WORD *)&v48[20] = 1024;
        *(_DWORD *)&v48[22] = 76;
        _os_log_impl((void *)&_mh_execute_header, uiController, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : Re-using the sharing service...", buf, 0x22u);
      }
    }
    else
    {
      v35 = (SFNFCTagReaderUIController *)objc_opt_new();
      uiController = self->_uiController;
      self->_uiController = v35;
    }

    [(SFNFCTagReaderUIController *)self->_uiController setOperationMode:self->_operationMode];
    [(SFNFCTagReaderUIController *)self->_uiController setMode:self->_mode];
    [(SFNFCTagReaderUIController *)self->_uiController setPurpose:self->_purpose];
    [(SFNFCTagReaderUIController *)self->_uiController nfcTagScannedCount:self->_tagCount];
    *(void *)buf = 0;
    *(void *)v48 = buf;
    *(void *)&v48[8] = 0x3032000000;
    *(void *)&v48[16] = sub_100008080;
    *(void *)&v48[24] = sub_100008090;
    v36 = self;
    v49 = v36;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100008098;
    v40[3] = &unk_10000C6A8;
    objc_copyWeak(&v43, &from);
    v42 = buf;
    v44[1] = (id)a2;
    id v41 = v10;
    objc_copyWeak(v44, &location);
    [(SFNFCTagReaderUIController *)self->_uiController setInvalidationHandler:v40];
    v37 = self->_uiController;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100008378;
    v38[3] = &unk_10000C6D0;
    v38[4] = v36;
    v39 = v11;
    [(SFNFCTagReaderUIController *)v37 activateWithCompletion:v38];

    objc_destroyWeak(v44);
    objc_destroyWeak(&v43);
    _Block_object_dispose(buf, 8);
  }
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)setUIMode:(int64_t)a3
{
  if (self->_uiController)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Update mode on next activation", v11, ClassName, Name, 120);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v17 = v14;
      __int16 v18 = 2082;
      v19 = object_getClassName(self);
      __int16 v20 = 2082;
      v21 = sel_getName(a2);
      __int16 v22 = 1024;
      int v23 = 120;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Update mode on next activation", buf, 0x22u);
    }
  }
  self->_mode = a3;
}

- (void)setUIOperationMode:(int64_t)a3
{
  if (self->_uiController)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v11 = 45;
      if (isMetaClass) {
        uint64_t v11 = 43;
      }
      v7(6, "%c[%{public}s %{public}s]:%i Update mode on next activation", v11, ClassName, Name, 129);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13)) {
        int v14 = 43;
      }
      else {
        int v14 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v17 = v14;
      __int16 v18 = 2082;
      v19 = object_getClassName(self);
      __int16 v20 = 2082;
      v21 = sel_getName(a2);
      __int16 v22 = 1024;
      int v23 = 129;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Update mode on next activation", buf, 0x22u);
    }
  }
  self->_operationMode = a3;
}

- (void)tagCount:(id)a3
{
  uiController = self->_uiController;
  id v5 = [a3 integerValue];
  if (uiController)
  {
    [(SFNFCTagReaderUIController *)uiController nfcTagScannedCount:v5];
  }
  else
  {
    self->_tagCount = (int64_t)v5;
  }
}

- (void)setPurpose:(id)a3
{
  id v5 = a3;
  uiController = self->_uiController;
  id v7 = v5;
  if (uiController) {
    -[SFNFCTagReaderUIController setPurpose:](uiController, "setPurpose:");
  }
  else {
    objc_storeStrong((id *)&self->_purpose, a3);
  }
}

- (void)invalidate
{
  if (self->_uiController)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_invalidationRequested = 1;
    os_unfair_lock_unlock(p_lock);
    uiController = self->_uiController;
    [(SFNFCTagReaderUIController *)uiController invalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_uiController, 0);
}

@end