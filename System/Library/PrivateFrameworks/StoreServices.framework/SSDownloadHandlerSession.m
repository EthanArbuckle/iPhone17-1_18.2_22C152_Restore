@interface SSDownloadHandlerSession
- (BOOL)blocksOtherDownloads;
- (BOOL)canBePaused;
- (BOOL)needsPowerAssertion;
- (NSNumber)duetTimeoutInterval;
- (NSString)downloadPhase;
- (id)_initWithMessage:(id)a3 controlConnection:(id)a4;
- (void)_finishWithType:(int)a3 error:(id)a4;
- (void)_setBool:(BOOL)a3 forSessionProperty:(const char *)a4;
- (void)dealloc;
- (void)disavowSessionWithError:(id)a3;
- (void)finishSessionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)releaseSessionControl;
- (void)setBlocksOtherDownloads:(BOOL)a3;
- (void)setCanBePaused:(BOOL)a3;
- (void)setNeedsPowerAssertion:(BOOL)a3;
- (void)setPercentComplete:(float)a3;
- (void)setStatusDescription:(id)a3;
@end

@implementation SSDownloadHandlerSession

- (id)_initWithMessage:(id)a3 controlConnection:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SSDownloadHandlerSession;
  v5 = [(SSDownloadSession *)&v7 _initWithMessage:a3 controlConnection:a4];
  if (v5)
  {
    objc_opt_class();
    v5[6] = SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
    objc_opt_class();
    v5[7] = SSXPCDictionaryCopyCFObjectWithClass(a3, "5");
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadHandlerSession;
  [(SSDownloadSession *)&v3 dealloc];
}

- (BOOL)blocksOtherDownloads
{
  id v2 = [(SSDownloadSession *)self _copySessionPropertyWithKey:"3"];
  if (!v2) {
    return 1;
  }
  objc_super v3 = v2;
  BOOL v4 = MEMORY[0x1A62689E0]() != MEMORY[0x1E4F14570] || xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

- (BOOL)canBePaused
{
  id v2 = [(SSDownloadSession *)self _copySessionPropertyWithKey:"4"];
  if (!v2) {
    return 1;
  }
  objc_super v3 = v2;
  BOOL v4 = MEMORY[0x1A62689E0]() != MEMORY[0x1E4F14570] || xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

- (void)disavowSessionWithError:(id)a3
{
}

- (NSString)downloadPhase
{
  downloadPhase = self->_downloadPhase;
  if (downloadPhase)
  {
    CFArrayRef v3 = downloadPhase;
  }
  else
  {
    CFDictionaryRef v4 = [(SSDownloadSession *)self _copySessionPropertyWithKey:"2"];
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F145F0]) {
        CFArrayRef v3 = SSXPCCreateCFObjectFromXPCObject(v5);
      }
      else {
        CFArrayRef v3 = 0;
      }
      xpc_release(v5);
    }
    else
    {
      CFArrayRef v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (void)finishSessionWithSuccess:(BOOL)a3 error:(id)a4
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [(SSDownloadHandlerSession *)self _finishWithType:v4 error:a4];
}

- (BOOL)needsPowerAssertion
{
  id v2 = [(SSDownloadSession *)self _copySessionPropertyWithKey:"5"];
  if (!v2) {
    return 1;
  }
  CFArrayRef v3 = v2;
  BOOL v4 = MEMORY[0x1A62689E0]() != MEMORY[0x1E4F14570] || xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

- (void)releaseSessionControl
{
}

- (void)setBlocksOtherDownloads:(BOOL)a3
{
}

- (void)setCanBePaused:(BOOL)a3
{
}

- (void)setNeedsPowerAssertion:(BOOL)a3
{
}

- (void)setPercentComplete:(float)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v20 = 136446210;
      v21 = "-[SSDownloadHandlerSession setPercentComplete:]";
      LODWORD(v19) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v20, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 4);
  xpc_dictionary_set_int64(v18, "1", self->super._sessionID);
  xpc_dictionary_set_double(v18, "2", a3);
  [(SSXPCConnection *)self->super._controlConnection sendMessage:v18];
  xpc_release(v18);
}

- (void)setStatusDescription:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v8 = v7;
    }
    else {
      int v8 = v7 & 2;
    }
    if (v8)
    {
      int v20 = 136446210;
      v21 = "-[SSDownloadHandlerSession setStatusDescription:]";
      LODWORD(v19) = 12;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        v10 = (void *)v9;
        uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v20, v19);
        free(v10);
        SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, v11);
      }
    }
  }
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v18, "0", 51);
  xpc_dictionary_set_int64(v18, "1", self->super._sessionID);
  SSXPCDictionarySetCFObject(v18, "2", (__CFString *)a3);
  [(SSXPCConnection *)self->super._controlConnection sendMessage:v18];
  xpc_release(v18);
}

- (void)_finishWithType:(int)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      int v22 = 136446210;
      v23 = "-[SSDownloadHandlerSession _finishWithType:error:]";
      LODWORD(v21) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v22, v21);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 2);
  xpc_dictionary_set_int64(v20, "1", self->super._sessionID);
  xpc_dictionary_set_int64(v20, "2", a3);
  SSXPCDictionarySetCFObject(v20, "3", (__CFString *)a4);
  [(SSXPCConnection *)self->super._controlConnection sendMessage:v20];
  xpc_release(v20);
}

- (void)_setBool:(BOOL)a3 forSessionProperty:(const char *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_FAULT)) {
      int v10 = v9;
    }
    else {
      int v10 = v9 & 2;
    }
    if (v10)
    {
      int v23 = 136446210;
      uint64_t v24 = "-[SSDownloadHandlerSession _setBool:forSessionProperty:]";
      LODWORD(v22) = 12;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v23, v22);
        free(v12);
        SSFileLog(v7, @"%@", v14, v15, v16, v17, v18, v19, v13);
      }
    }
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v20, "0", 30);
  xpc_dictionary_set_int64(v20, "1", self->super._sessionID);
  xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v21, a4, a3);
  xpc_dictionary_set_value(v20, "2", v21);
  xpc_release(v21);
  [(SSXPCConnection *)self->super._controlConnection sendMessage:v20];
  xpc_release(v20);
}

- (NSNumber)duetTimeoutInterval
{
  return self->_duetTimeoutInterval;
}

@end