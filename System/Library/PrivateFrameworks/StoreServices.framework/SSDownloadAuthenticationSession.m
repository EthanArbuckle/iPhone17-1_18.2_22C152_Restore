@interface SSDownloadAuthenticationSession
- (NSURLAuthenticationChallenge)authenticationChallenge;
- (void)_finishWithType:(int)a3 credential:(id)a4;
@end

@implementation SSDownloadAuthenticationSession

- (NSURLAuthenticationChallenge)authenticationChallenge
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  uint64_t v11 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SSDownloadAuthenticationSession_authenticationChallenge__block_invoke;
  v5[3] = &unk_1E5BAA0A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  v3 = (NSURLAuthenticationChallenge *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __58__SSDownloadAuthenticationSession_authenticationChallenge__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _copySessionPropertyWithKey:"2"];
  if (v2)
  {
    CFDictionaryRef v3 = (const __CFDictionary *)v2;
    if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14580])
    {
      CFArrayRef v4 = SSXPCCreateCFObjectFromXPCObject(v3);
      uint64_t v21 = 0;
      v5 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v21];
      if (v21)
      {
        id v6 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v6) {
          id v6 = +[SSLogConfig sharedConfig];
        }
        int v7 = [v6 shouldLog];
        if ([v6 shouldLogToDisk]) {
          int v8 = v7 | 2;
        }
        else {
          int v8 = v7;
        }
        if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_ERROR)) {
          v8 &= 2u;
        }
        if (v8)
        {
          uint64_t v9 = objc_opt_class();
          int v22 = 138543618;
          uint64_t v23 = v9;
          __int16 v24 = 2114;
          uint64_t v25 = v21;
          LODWORD(v20) = 22;
          uint64_t v10 = _os_log_send_and_compose_impl();
          if (v10)
          {
            uint64_t v11 = (void *)v10;
            uint64_t v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v10, 4, &v22, v20);
            free(v11);
            SSFileLog(v6, @"%@", v13, v14, v15, v16, v17, v18, v12);
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [[SSDownloadAuthenticationChallengeSender alloc] initWithAuthenticationSession:*(void *)(a1 + 32)];
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E4F29070]), "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", objc_msgSend(v5, "protectionSpace"), objc_msgSend(v5, "proposedCredential"), objc_msgSend(v5, "previousFailureCount"), objc_msgSend(v5, "failureResponse"), objc_msgSend(v5, "error"), v19);
      }
    }
    xpc_release(v3);
  }
}

- (void)_finishWithType:(int)a3 credential:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "0", 2);
  xpc_dictionary_set_int64(v7, "1", self->super._sessionID);
  xpc_dictionary_set_int64(v7, "2", a3);
  if (a4)
  {
    uint64_t v23 = 0;
    SSXPCDictionarySetCFObject(v7, "3", (__CFString *)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a4 requiringSecureCoding:1 error:&v23]);
    if (v23)
    {
      id v8 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v8) {
        id v8 = +[SSLogConfig sharedConfig];
      }
      int v9 = [v8 shouldLog];
      if ([v8 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v10 &= 2u;
      }
      if (v10)
      {
        uint64_t v11 = objc_opt_class();
        int v24 = 138543618;
        uint64_t v25 = v11;
        __int16 v26 = 2114;
        uint64_t v27 = v23;
        LODWORD(v22) = 22;
        uint64_t v21 = &v24;
        uint64_t v12 = _os_log_send_and_compose_impl();
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          uint64_t v14 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v24, v22);
          free(v13);
          SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, v14);
        }
      }
    }
  }
  -[SSXPCConnection sendMessage:](self->super._controlConnection, "sendMessage:", v7, v21);
  xpc_release(v7);
}

@end