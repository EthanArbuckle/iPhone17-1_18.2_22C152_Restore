@interface GTURLAccessProviderXPCDispatcher
- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)makeURL_:(id)a3 replyConnection:(id)a4;
- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)urlForPath_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTURLAccessProviderXPCDispatcher

- (GTURLAccessProviderXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v11.receiver = self;
  v11.super_class = (Class)GTURLAccessProviderXPCDispatcher;
  v9 = [(GTXPCDispatcher *)&v11 initWithProtocolMethods:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v6, "identifier", v8);
  long long v23 = 0u;
  long long v24 = 0u;
  size_t length = 0;
  data = (long long *)xpc_dictionary_get_data(v6, "auditToken", &length);
  if (data && length == 32)
  {
    long long v11 = data[1];
    long long v23 = *data;
    long long v24 = v11;
  }
  else
  {
    v12 = [v7 connection];
    xpc_connection_get_audit_token();
  }
  v13 = gt_xpc_dictionary_create_reply(v6);
  service = self->_service;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B710;
  v17[3] = &unk_100034980;
  id v18 = v7;
  id v19 = v13;
  long long v20 = v23;
  long long v21 = v24;
  id v15 = v13;
  id v16 = v7;
  [(GTURLAccessProvider *)service securityScopedURLFromSandboxID:nsobject completionHandler:v17];
}

- (void)makeURL_:(id)a3 replyConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  id v7 = gt_xpc_dictionary_create_reply(xdict);
  uint64_t v8 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(xdict, "url", v8);
  if (nsobject)
  {
    string = xpc_dictionary_get_string(xdict, "sandboxExtension");
    if (string)
    {
      long long v11 = +[NSData dataWithBytes:string length:strlen(string) + 1];
      _CFURLAttachSecurityScopeToFileURL();
    }
    v12 = [(GTURLAccessProvider *)self->_service makeURL:nsobject];
    if (([v6 isTrusted] & 1) == 0)
    {
      v13 = +[NSURLComponents componentsWithURL:v12 resolvingAgainstBaseURL:1];
      [v13 setHost:@"localhost"];
      uint64_t v14 = [v13 URL];

      v12 = (void *)v14;
    }
    xpc_dictionary_set_nsobject(v7, "identifier", (uint64_t)v12);
  }
  [v6 sendMessage:v7];
}

- (void)transferIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v9);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    service = self->_service;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000BAC8;
    v15[3] = &unk_1000349A8;
    id v16 = v8;
    id v17 = v6;
    [(GTURLAccessProvider *)service transferIdentifier:nsobject toDevice:v13 completionHandler:v15];
  }
  else
  {
    [v6 sendMessage:v8];
  }
}

- (void)copyIdentifier_toDevice_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v7);
  uint64_t v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "identifier", v9);
  string = xpc_dictionary_get_string(v7, "deviceUDID");

  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    service = self->_service;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000BD48;
    v17[3] = &unk_1000349D0;
    id v18 = v8;
    id v19 = v6;
    [(GTURLAccessProvider *)service copyIdentifier:nsobject toDevice:v13 completionHandler:v17];
  }
  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v15 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTURLAccessProviderXPCDispatcher", @"Invalid device UDID passed to copyIdentifier"];
    long long v21 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v13 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v16];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v6 sendMessage:v8];
  }
}

- (void)urlForPath_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = gt_xpc_dictionary_create_reply(v7);
  string = xpc_dictionary_get_string(v7, "path");

  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v11 = (void *)v10;
    uint64_t v12 = [(GTURLAccessProvider *)self->_service urlForPath:v10];
    unsigned int v13 = [v12 startAccessingSecurityScopedResource];
    xpc_dictionary_set_nsobject(v8, "result", (uint64_t)v12);
    uint64_t v14 = [v6 connection];
    xpc_connection_get_audit_token();

    id v15 = v12;
    [v15 fileSystemRepresentation];
    long long v18 = 0u;
    long long v19 = 0u;
    id v16 = (const char *)sandbox_extension_issue_file_to_process();
    if (v16)
    {
      id v17 = (char *)v16;
      xpc_dictionary_set_string(v8, "sandboxExtension", v16);
      free(v17);
    }
    if (v13) {
      [v15 stopAccessingSecurityScopedResource];
    }
    [v6 sendMessage:v8, v18, v19];
  }
  else
  {
    [v6 sendMessage:v8];
  }
}

- (void).cxx_destruct
{
}

@end