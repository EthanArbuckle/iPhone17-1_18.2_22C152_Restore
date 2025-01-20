@interface GTFileWriterServiceXPCDispatcher
- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4;
- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4;
- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTFileWriterServiceXPCDispatcher

- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7 = a3;
  v8 = [a4 protocolMethods];
  v11.receiver = self;
  v11.super_class = (Class)GTFileWriterServiceXPCDispatcher;
  v9 = [(GTXPCDispatcher *)&v11 initWithProtocolMethods:v8];

  if (v9) {
    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && (+[NSString stringWithUTF8String:v14],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      uint64_t v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      service = self->_service;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100010970;
      v24[3] = &unk_100034AE8;
      id v25 = v8;
      id v26 = v7;
      [(GTFileWriterService *)service initiateTransfer:nsarray basePath:v13 fromDevice:v16 options:nsobject completionHandler:v24];
    }
    else
    {
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      v22 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid device UDID passed to initiateTransfer"];
      v28 = v22;
      v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v16 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v23];

      xpc_dictionary_set_nserror(v8, "error", v16);
      [v7 sendMessage:v8];
    }
  }
  else
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v20 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid path passed to initiateTransfer"];
    v30 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v13 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v21];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v7 sendMessage:v8];
  }
}

- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && (+[NSString stringWithUTF8String:v14],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      uint64_t v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      service = self->_service;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100010D14;
      v24[3] = &unk_1000349D0;
      id v25 = v8;
      id v26 = v7;
      [(GTFileWriterService *)service startTransfer:nsarray basePath:v13 fromDevice:v16 options:nsobject completionHandler:v24];
    }
    else
    {
      NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
      v22 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid device UDID passed to startTransfer"];
      v28 = v22;
      v23 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      v16 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v23];

      xpc_dictionary_set_nserror(v8, "error", v16);
      [v7 sendMessage:v8];
    }
  }
  else
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    v20 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid path passed to startTransfer"];
    v30 = v20;
    v21 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v13 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v21];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v7 sendMessage:v8];
  }
}

- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = gt_xpc_dictionary_create_reply(v6);
  uint64_t v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (+[NSString stringWithUTF8String:string],
        (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && (+[NSString stringWithUTF8String:v14],
          (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      uint64_t v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "sessionID");
      service = self->_service;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100011100;
      v25[3] = &unk_100034AE8;
      id v26 = v8;
      id v27 = v7;
      [(GTFileWriterService *)service beginTransferSessionWithFileEntries:nsarray basePath:v13 toDevice:v16 options:nsobject sessionID:uint64 completionHandler:v25];
    }
    else
    {
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      v23 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid device UDID passed to beginTransferSessionWithFileEntries"];
      NSErrorUserInfoKey v29 = v23;
      v24 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      v16 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v24];

      xpc_dictionary_set_nserror(v8, "error", v16);
      [v7 sendMessage:v8];
    }
  }
  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    v21 = +[NSString stringWithFormat:@"Invalid argument sent to service \"%@\": %@", @"GTFileWriterServiceXPCDispatcher", @"Invalid path passed to beginTransferSessionWithFileEntries"];
    v31 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v13 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:4 userInfo:v22];

    xpc_dictionary_set_nserror(v8, "error", v13);
    [v7 sendMessage:v8];
  }
}

- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(v7, "data");
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "sessionID");
  v10 = gt_xpc_dictionary_create_reply(v7);

  service = self->_service;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011260;
  v14[3] = &unk_100034AE8;
  id v15 = v10;
  id v16 = v6;
  id v12 = v6;
  id v13 = v10;
  [(GTFileWriterService *)service writeFileData:nsdata_nocopy sessionID:uint64 completionHandler:v14];
}

- (void).cxx_destruct
{
}

@end