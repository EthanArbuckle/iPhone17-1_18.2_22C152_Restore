@interface ISSetupAssistant
- (ISSetupAssistant)init;
- (id)accountSetupRequestParameters;
- (id)delegateServiceIdentifier;
- (id)handler;
- (void)_setCookiesWithString:(id)a3 userIdentifier:(id)a4;
- (void)_setupHomeSharingWithParameters:(id)a3;
- (void)_setupITunesMatchWithParameters:(id)a3;
- (void)completeSetupWithResponseParameters:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)setHandler:(id)a3;
- (void)setupOperationFailed;
@end

@implementation ISSetupAssistant

- (ISSetupAssistant)init
{
  v4.receiver = self;
  v4.super_class = (Class)ISSetupAssistant;
  v2 = [(ISSetupAssistant *)&v4 init];
  if (v2) {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ISSetupAssistent", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  }
  return v2;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release((dispatch_object_t)dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)ISSetupAssistant;
  [(ISSetupAssistant *)&v4 dealloc];
}

- (id)accountSetupRequestParameters
{
  id v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:@"iTunes" forKey:@"drm-client"];
  v3 = +[ISDevice sharedInstance];
  id v4 = [(ISDevice *)v3 hardwareName];
  if (v4) {
    objc_msgSend(v2, "setObject:forKey:", objc_msgSend(v4, "lowercaseString"), @"drm-type");
  }
  id v5 = [(ISDevice *)v3 guid];
  if (v5) {
    [v2 setObject:v5 forKey:@"guid"];
  }
  id v6 = [(ISDevice *)v3 deviceName];
  if (v6) {
    [v2 setObject:v6 forKey:@"device-name"];
  }
  id v7 = +[SSDevice currentDevice];
  id v8 = [v7 productVersion];
  if (v8) {
    [v2 setObject:v8 forKey:@"drm-version"];
  }
  id v9 = [v7 userAgent];
  if (v9) {
    [v2 setObject:v9 forKey:@"user-agent"];
  }
  return v2;
}

- (void)completeSetupWithResponseParameters:(id)a3 handler:(id)a4
{
  id v7 = +[SSLogConfig sharedConfig];
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    int v10 = v9;
  }
  else {
    int v10 = v9 & 2;
  }
  if (v10)
  {
    int v53 = 138412290;
    uint64_t v54 = objc_opt_class();
    LODWORD(v47) = 12;
    v45 = &v53;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v53, v47);
      free(v12);
      v45 = (int *)v13;
      SSFileLog();
    }
  }
  objc_msgSend(a3, "objectForKey:", @"dsid", v45);
  uint64_t UniqueIdentifierFromValue = SSAccountGetUniqueIdentifierFromValue();
  if (UniqueIdentifierFromValue)
  {
    id v15 = [a3 objectForKey:@"cookies"];
    v48 = (void (**)(id, uint64_t, void))a4;
    if (!v15)
    {
      -[ISSetupAssistant _setCookiesWithString:userIdentifier:](self, "_setCookiesWithString:userIdentifier:", [a3 objectForKey:@"pod"], UniqueIdentifierFromValue);
      id v15 = [a3 objectForKey:@"weak-token"];
    }
    [(ISSetupAssistant *)self _setCookiesWithString:v15 userIdentifier:UniqueIdentifierFromValue];
    id v16 = [a3 objectForKey:@"storefront"];
    id v17 = +[SSLogConfig sharedConfig];
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    if (os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_ERROR)) {
      int v20 = v19;
    }
    else {
      int v20 = v19 & 2;
    }
    if (v20)
    {
      uint64_t v21 = objc_opt_class();
      int v53 = 138412546;
      uint64_t v54 = v21;
      __int16 v55 = 2112;
      id v56 = v16;
      LODWORD(v47) = 22;
      v46 = &v53;
      uint64_t v22 = _os_log_send_and_compose_impl();
      if (v22)
      {
        v23 = (void *)v22;
        v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v53, v47);
        free(v23);
        v46 = (int *)v24;
        SSFileLog();
      }
    }
    id v25 = objc_msgSend(a3, "objectForKey:", @"strong-token", v46);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v27 = +[SSAccountStore defaultStore];
    unint64_t v28 = (unint64_t)[v27 activeAccount];
    unint64_t v29 = (unint64_t)[v27 accountWithUniqueIdentifier:UniqueIdentifierFromValue];
    BOOL v30 = (v28 | v29) == 0;
    if (v29)
    {
      if (v26)
      {
        unint64_t v31 = v29;
        [(id)v29 setSecureToken:v26];
        if (v28) {
          [v27 addAccount:v31];
        }
        else {
          [v27 setActiveAccount:v31];
        }
      }
      goto LABEL_45;
    }
    id v36 = objc_alloc_init((Class)SSAccount);
    objc_msgSend(v36, "setAccountName:", objc_msgSend(a3, "objectForKey:", @"email"));
    [v36 setSecureToken:v26];
    [v36 setStoreFrontIdentifier:v16];
    [v36 setUniqueIdentifier:UniqueIdentifierFromValue];
    id v37 = [a3 objectForKey:@"newCustomer"];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v36, "setNewCustomer:", objc_msgSend(v37, "BOOLValue"));
    }
    if (v28 && ![(id)v28 accountSource])
    {
      [v27 addAccount:v36];

LABEL_45:
      id v38 = +[SSLogConfig sharedConfig];
      unsigned int v39 = [v38 shouldLog];
      if ([v38 shouldLogToDisk]) {
        int v40 = v39 | 2;
      }
      else {
        int v40 = v39;
      }
      if (os_log_type_enabled((os_log_t)[v38 OSLogObject], OS_LOG_TYPE_ERROR)) {
        int v41 = v40;
      }
      else {
        int v41 = v40 & 2;
      }
      if (v41)
      {
        uint64_t v42 = objc_opt_class();
        int v53 = 138412290;
        uint64_t v54 = v42;
        LODWORD(v47) = 12;
        uint64_t v43 = _os_log_send_and_compose_impl();
        if (v43)
        {
          v44 = (void *)v43;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v53, v47);
          free(v44);
          SSFileLog();
        }
      }
      v48[2](v48, 1, 0);
      return;
    }
    [v27 setActiveAccount:v36];
    +[SSAccountStore resetExpiration];
    if (v16) {
      objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "setStoreFrontIdentifier:isTransient:", v16, 0);
    }
    if (PSIsRunningInAssistant()) {
      objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "enableAllAutomaticDownloadKindsWithCompletionBlock:", 0);
    }

    if (!v30) {
      goto LABEL_45;
    }
    v32 = 0;
    a4 = v48;
  }
  else
  {
    v32 = +[NSError errorWithDomain:@"ISSetupErrorDomain" code:1 userInfo:0];
  }
  [(ISSetupAssistant *)self setHandler:a4];
  v33 = dispatch_group_create();
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1FE0;
  block[3] = &unk_41B8;
  block[4] = self;
  block[5] = a3;
  dispatch_group_async(v33, (dispatch_queue_t)dispatchQueue, block);
  if (PSIsRunningInAssistant())
  {
    v35 = self->_dispatchQueue;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1FEC;
    v51[3] = &unk_41B8;
    v51[4] = self;
    v51[5] = a3;
    dispatch_group_async(v33, (dispatch_queue_t)v35, v51);
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1FF8;
  v49[3] = &unk_41E0;
  BOOL v50 = UniqueIdentifierFromValue != 0;
  v49[4] = self;
  v49[5] = v32;
  dispatch_group_notify(v33, (dispatch_queue_t)&_dispatch_main_q, v49);
  dispatch_release(v33);
}

- (id)delegateServiceIdentifier
{
  return @"com.apple.itunes";
}

- (void)setupOperationFailed
{
}

- (void)_setCookiesWithString:(id)a3 userIdentifier:(id)a4
{
  if (a3)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", a3, @"Set-Cookie", 0);
    objc_msgSend(+[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage"), "setCookies:forUserIdentifier:", +[NSHTTPCookie cookiesWithResponseHeaderFields:forURL:](NSHTTPCookie, "cookiesWithResponseHeaderFields:forURL:", v5, +[NSURL URLWithString:](NSURL, "URLWithString:", @"http://itunes.apple.com")), a4);
  }
}

- (void)_setupHomeSharingWithParameters:(id)a3
{
  id v5 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_21C8;
  block[3] = &unk_4230;
  block[4] = a3;
  block[5] = v5;
  void block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v5);
}

- (void)_setupITunesMatchWithParameters:(id)a3
{
  id v4 = [a3 objectForKey:@"slot-acquired"];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v4 BOOLValue]
    && objc_msgSend(+[ML3MusicLibrary sharedLibrary](ML3MusicLibrary, "sharedLibrary"), "isLibraryEmpty"))
  {
    id v5 = objc_msgSend(objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
    id v6 = +[SSLogConfig sharedConfig];
    unsigned int v7 = [v6 shouldLog];
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
      *(_DWORD *)int v40 = 138412546;
      *(void *)&v40[4] = objc_opt_class();
      *(_WORD *)&v40[12] = 2112;
      *(void *)&v40[14] = v5;
      LODWORD(v35) = 22;
      v33 = (NSString *)v40;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        int v10 = (void *)v9;
        uint64_t v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, v40, v35);
        free(v10);
        v33 = v11;
        SSFileLog();
      }
    }
    v12 = +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", 0, v33);
    v13 = v12;
    if (v5) {
      [(SSURLBagContext *)v12 setUserIdentifier:v5];
    }
    id v14 = [objc_alloc((Class)SSURLBag) initWithURLBagContext:v13];
    [v14 invalidate];
    *(void *)int v40 = 0;
    *(void *)&v40[8] = v40;
    *(void *)&v40[16] = 0x2020000000;
    char v41 = 0;
    id v15 = dispatch_semaphore_create(0);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_296C;
    v37[3] = &unk_4258;
    v37[5] = v15;
    v37[6] = v40;
    v37[4] = self;
    [v14 loadWithCompletionBlock:v37];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    if (*(unsigned char *)(*(void *)&v40[8] + 24))
    {
      id v16 = objc_alloc_init((Class)HSCloudClient);
      id v17 = dispatch_semaphore_create(0);
      id v18 = +[SSLogConfig sharedConfig];
      unsigned int v19 = [v18 shouldLog];
      unsigned int v20 = [v18 shouldLogToDisk];
      uint64_t v21 = [v18 OSLogObject];
      if (v20) {
        v19 |= 2u;
      }
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        v19 &= 2u;
      }
      if (v19)
      {
        uint64_t v22 = objc_opt_class();
        int v38 = 138412290;
        uint64_t v39 = v22;
        LODWORD(v35) = 12;
        v34 = &v38;
        uint64_t v23 = _os_log_send_and_compose_impl();
        if (v23)
        {
          v24 = (void *)v23;
          id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v38, v35);
          free(v24);
          v34 = (int *)v25;
          SSFileLog();
        }
      }
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_2B28;
      v36[3] = &unk_4280;
      v36[4] = v17;
      objc_msgSend(v16, "authenticateWithCompletionHandler:", v36, v34);
      dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v26 = +[SSLogConfig sharedConfig];
      unsigned int v27 = [v26 shouldLog];
      unsigned int v28 = [v26 shouldLogToDisk];
      unint64_t v29 = [v26 OSLogObject];
      if (v28) {
        v27 |= 2u;
      }
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        v27 &= 2u;
      }
      if (v27)
      {
        uint64_t v30 = objc_opt_class();
        int v38 = 138412290;
        uint64_t v39 = v30;
        LODWORD(v35) = 12;
        uint64_t v31 = _os_log_send_and_compose_impl();
        if (v31)
        {
          v32 = (void *)v31;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v38, v35);
          free(v32);
          SSFileLog();
        }
      }
    }
    _Block_object_dispose(v40, 8);
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

@end