@interface NEAgentExtensibleSSO
- (NEAgentExtensibleSSO)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7;
- (NSArray)uuids;
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)managerInterface;
- (void)attachIPCWithCompletionHandler:(id)a3;
- (void)authenticateWithParameters:(id)a3 completionHandler:(id)a4;
- (void)authorization:(id)a3 didCompleteWithError:(id)a4;
- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5;
- (void)authorizationDidCancel:(id)a3;
- (void)authorizationDidNotHandle:(id)a3;
- (void)handleInitWithCompletionHandler:(id)a3;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation NEAgentExtensibleSSO

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authenticateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_extensibleSSOURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);

  objc_destroyWeak((id *)&self->_managerObjectFactory);
}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "VPN Authorization completed", v13, 2u);
  }

  v10 = [v8 valueForHTTPHeaderField:@"X-SSO-Net-Credentials"];

  if (v7 && v10 && [v10 isEqualToString:@"IdentityPersistentReference"])
  {
    CFStringRef v14 = @"extensible-sso-credential-certificate";
    id v15 = v7;
    v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    sub_100005DA8(self, (const char *)1, (uint64_t)v11);
  }
  else
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "VPN Authorization failed with bad HTTP response", v13, 2u);
    }

    sub_100005DA8(self, 0, 0);
  }
}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  id v5 = a4;
  v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "VPN Authorization completed with error %@", (uint8_t *)&v7, 0xCu);
  }

  sub_100005DA8(self, 0, 0);
}

- (void)authorizationDidCancel:(id)a3
{
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "VPN Authorization canceled", v5, 2u);
  }

  sub_100005DA8(self, (const char *)2, 0);
}

- (void)authorizationDidNotHandle:(id)a3
{
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "VPN Authorization not handled", v5, 2u);
  }

  sub_100005DA8(self, 0, 0);
}

- (void)authenticateWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 40, 1);
  }
  else {
    id Property = 0;
  }
  v10 = [Property VPN];
  v11 = [v10 protocol];
  v12 = [v11 serverAddress];

  if (v12) {
    goto LABEL_7;
  }
  id v14 = self ? objc_getProperty(self, v13, 40, 1) : 0;
  id v15 = [v14 appVPN];
  v16 = [v15 protocol];
  v12 = [v16 serverAddress];

  if (v12)
  {
LABEL_7:
    v26[0] = @"X-SSO-Net-Authorization-Type";
    v26[1] = @"X-SSO-Net-Authorization";
    v27[0] = @"IKEv2";
    v27[1] = @"Certificate";
    v26[2] = @"X-SSO-Net-Resource";
    v27[2] = v12;
    v18 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    if (self) {
      v19 = objc_getProperty(self, v17, 24, 1);
    }
    else {
      v19 = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006278;
    block[3] = &unk_10000C3B8;
    block[4] = self;
    id v23 = v18;
    id v24 = v8;
    id v20 = v18;
    dispatch_async(v19, block);
  }
  else
  {
    v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Configuration is missing a server address, cannot use extensible SSO", buf, 2u);
    }

    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

- (void)attachIPCWithCompletionHandler:(id)a3
{
}

- (void)sleepWithCompletionHandler:(id)a3
{
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006474;
  block[3] = &unk_10000C3B8;
  block[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(Property, block);
}

- (NSXPCInterface)driverInterface
{
  if (qword_100012200 != -1) {
    dispatch_once(&qword_100012200, &stru_10000C390);
  }
  v2 = (void *)qword_1000121F8;

  return (NSXPCInterface *)v2;
}

- (NSXPCInterface)managerInterface
{
  if (qword_1000121F0 != -1) {
    dispatch_once(&qword_1000121F0, &stru_10000C370);
  }
  v2 = (void *)qword_1000121E8;

  return (NSXPCInterface *)v2;
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, id))a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 32, 1);
  }
  else {
    id Property = 0;
  }
  v6[2](v6, +[SOAuthorization canPerformAuthorizationWithURL:Property responseCode:0 useInternalExtensions:0]);
}

- (NEAgentExtensibleSSO)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  if (!objc_opt_class())
  {
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "SOAuthorization is not available, cannot use extensible SSO", buf, 2u);
    }
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)NEAgentExtensibleSSO;
  id v13 = [(NEAgentExtensibleSSO *)&v22 init];
  self = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_managerObjectFactory, v12);
    objc_storeStrong((id *)&self->_queue, a6);
    id v14 = [v10 objectForKeyedSubscript:@"plugin-path"];
    id v15 = +[NSURL URLWithString:v14];
    extensibleSSOURL = self->_extensibleSSOURL;
    self->_extensibleSSOURL = v15;

    if (self->_extensibleSSOURL)
    {
      v17 = (SOAuthorization *)objc_alloc_init((Class)SOAuthorization);
      authorization = self->_authorization;
      self->_authorization = v17;

      [(SOAuthorization *)self->_authorization setDelegate:self];
      [(SOAuthorization *)self->_authorization setDelegateDispatchQueue:self->_queue];
      [(SOAuthorization *)self->_authorization setEnableUserInteraction:0];

      goto LABEL_5;
    }
    id v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "NSURL URLWithString failed for extensible SSO %@", buf, 0xCu);
    }

LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
LABEL_5:
  self = self;
  v19 = self;
LABEL_12:

  return v19;
}

- (NSArray)uuids
{
  uint64_t v8 = 0;
  memset(buffer, 0, sizeof(buffer));
  pid_t v2 = getpid();
  v3 = 0;
  if (proc_pidinfo(v2, 17, 1uLL, buffer, 56) == 56)
  {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buffer];
    id v6 = v4;
    v3 = +[NSArray arrayWithObjects:&v6 count:1];
  }

  return (NSArray *)v3;
}

@end