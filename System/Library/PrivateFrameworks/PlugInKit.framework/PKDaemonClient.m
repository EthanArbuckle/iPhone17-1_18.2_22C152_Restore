@interface PKDaemonClient
+ (id)convertToXPC:(id)a3 version:(unint64_t)a4;
- (OS_dispatch_queue)replyQueue;
- (OS_xpc_object)pkd;
- (PKDaemonClient)initWithConnection:(id)a3 queue:(id)a4 user:(unsigned int)a5;
- (PKDaemonClient)initWithServiceName:(const char *)a3;
- (PKDaemonClient)initWithServiceName:(const char *)a3 user:(unsigned int)a4;
- (id)convertFromXPC:(id)a3;
- (id)errorInReply:(id)a3;
- (id)rawConnection;
- (id)request:(const char *)a3;
- (id)request:(const char *)a3 paths:(id)a4;
- (int64_t)protocolVersion;
- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 reply:(id)a6;
- (void)addPlugIns:(id)a3 reply:(id)a4;
- (void)bulkPlugins:(unint64_t)a3 reply:(id)a4;
- (void)bulkSetPluginAnnotations:(id)a3 reply:(id)a4;
- (void)findPlugInByPathURL:(id)a3 reply:(id)a4;
- (void)findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5;
- (void)holdPlugins:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 reply:(id)a7;
- (void)matchPlugIns:(id)a3 flags:(unint64_t)a4 uuid:(id)a5 reply:(id)a6;
- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 environment:(id)a6 languages:(id)a7 persona:(id)a8 sandbox:(id)a9 reply:(id)a10;
- (void)releaseHold:(id)a3 flags:(unint64_t)a4 reply:(id)a5;
- (void)removePlugIns:(id)a3 reply:(id)a4;
- (void)send:(id)a3 reply:(id)a4;
- (void)sendSynchronously:(BOOL)a3 request:(id)a4 reply:(id)a5;
- (void)sendSynchronously:(BOOL)a3 request:(id)a4 retry:(BOOL)a5 reply:(id)a6;
- (void)set:(id)a3 plugins:(id)a4;
- (void)set:(id)a3 uuids:(id)a4;
- (void)setPkd:(id)a3;
- (void)setPluginAnnotations:(id)a3 annotations:(id)a4 reply:(id)a5;
- (void)setProtocolVersion:(int64_t)a3;
- (void)setReplyQueue:(id)a3;
@end

@implementation PKDaemonClient

+ (id)convertToXPC:(id)a3 version:(unint64_t)a4
{
  if (a4 == 3)
  {
    v5 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)findPlugInByUUID:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)uuid = 0;
  uint64_t v12 = 0;
  id v8 = a5;
  id v9 = a3;
  v10 = [(PKDaemonClient *)self request:"find"];
  [v9 getUUIDBytes:uuid];

  xpc_dictionary_set_uuid(v10, "uuids", uuid);
  [(PKDaemonClient *)self sendSynchronously:v5 request:v10 reply:v8];
}

- (PKDaemonClient)initWithServiceName:(const char *)a3 user:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3) {
    v6 = a3;
  }
  else {
    v6 = "com.apple.pluginkit.pkd";
  }
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v8 = dispatch_queue_create("pkd_client", v7);

  xpc_connection_t mach_service = xpc_connection_create_mach_service(v6, v8, 0);
  v10 = [(PKDaemonClient *)self initWithConnection:mach_service queue:v8 user:v4];

  return v10;
}

- (PKDaemonClient)initWithConnection:(id)a3 queue:(id)a4 user:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PKDaemonClient;
  v11 = [(PKDaemonClient *)&v21 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_replyQueue, a4);
    objc_storeStrong((id *)&v12->_pkd, a3);
    objc_initWeak(&location, v12);
    pkd = v12->_pkd;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = sub_1B38CB7A0;
    v18 = &unk_1E6059518;
    objc_copyWeak(&v19, &location);
    xpc_connection_set_event_handler(pkd, &v15);
    if (a5) {
      xpc_connection_set_target_uid();
    }
    -[PKDaemonClient setProtocolVersion:](v12, "setProtocolVersion:", 3, v15, v16, v17, v18);
    xpc_connection_resume(v12->_pkd);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)matchPlugIns:(id)a3 flags:(unint64_t)a4 uuid:(id)a5 reply:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)uuid = 0;
  uint64_t v15 = 0;
  id v10 = a6;
  id v11 = a3;
  [a5 getUUIDBytes:uuid];
  uint64_t v12 = [(PKDaemonClient *)self request:"match"];
  uint64_t v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(v12, "rules", v13);
  xpc_dictionary_set_uint64(v12, "flags", a4);
  xpc_dictionary_set_uuid(v12, "uuids", uuid);
  [(PKDaemonClient *)self sendSynchronously:(a4 >> 10) & 1 request:v12 retry:1 reply:v10];
}

- (void)sendSynchronously:(BOOL)a3 request:(id)a4 retry:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1B38B48C4;
  v26[3] = &unk_1E6059540;
  objc_copyWeak(&v28, &location);
  id v12 = v11;
  id v27 = v12;
  uint64_t v13 = (void (**)(void, void))MEMORY[0x1B3EBB710](v26);
  if (v8)
  {
    xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(self->_pkd, v10);
    xpc_object_t v15 = (xpc_object_t)MEMORY[0x1E4F14520];
    if (v14 == (xpc_object_t)MEMORY[0x1E4F14520] && v7)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v10, "flags");
      xpc_dictionary_set_uint64(v10, "flags", uint64 & 0xFFFFFFFFFFFF7FFFLL);
      int v17 = 1;
      while (1)
      {
        v18 = pklog_handle_for_category(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = self;
          _os_log_error_impl(&dword_1B38B0000, v18, OS_LOG_TYPE_ERROR, "%@: retrying sync request", buf, 0xCu);
        }

        xpc_object_t v14 = xpc_connection_send_message_with_reply_sync(self->_pkd, v10);
        if (v14 != v15) {
          break;
        }
        if (--v17)
        {
          xpc_object_t v14 = v15;
          break;
        }
      }
    }
    ((void (**)(void, xpc_object_t))v13)[2](v13, v14);
  }
  else
  {
    pkd = self->_pkd;
    replyQueue = self->_replyQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1B38B4744;
    handler[3] = &unk_1E6059590;
    objc_copyWeak(&v24, &location);
    BOOL v25 = v7;
    id v22 = v10;
    v23 = v13;
    xpc_connection_send_message_with_reply(pkd, v22, replyQueue, handler);

    objc_destroyWeak(&v24);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (id)errorInReply:(id)a3
{
  id v3 = a3;
  if (MEMORY[0x1B3EBBC90]() == MEMORY[0x1E4F145A8])
  {
    v6 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]));
    uint64_t v7 = 4;
    goto LABEL_6;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "errorcode");
  string = xpc_dictionary_get_string(v3, "error");
  if (uint64)
  {
    if (string)
    {
      v6 = [NSString stringWithUTF8String:string];
      uint64_t v7 = uint64;
LABEL_6:
      BOOL v8 = pkError(v7, v6);

      goto LABEL_11;
    }
    BOOL v8 = pkError(uint64, @"unknown error returned by PlugInKit subsystem");
  }
  else
  {
    if (string) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"pkd reported error without a code: %s", string);
    }
    BOOL v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)convertFromXPC:(id)a3
{
  id v4 = a3;
  if ([(PKDaemonClient *)self protocolVersion] == 3) {
    BOOL v5 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)request:(const char *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "request", a3);
  xpc_dictionary_set_uint64(v5, "version", [(PKDaemonClient *)self protocolVersion]);
  return v5;
}

- (int64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int64_t)a3
{
  self->_protocolVersion = a3;
}

- (void)sendSynchronously:(BOOL)a3 request:(id)a4 reply:(id)a5
{
}

- (PKDaemonClient)initWithServiceName:(const char *)a3
{
  return [(PKDaemonClient *)self initWithServiceName:a3 user:0];
}

- (id)rawConnection
{
  return self->_pkd;
}

- (void)addPlugIns:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(PKDaemonClient *)self request:"add" paths:a3];
  [(PKDaemonClient *)self send:v7 reply:v6];
}

- (void)removePlugIns:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(PKDaemonClient *)self request:"remove" paths:a3];
  [(PKDaemonClient *)self send:v7 reply:v6];
}

- (void)bulkPlugins:(unint64_t)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(PKDaemonClient *)self request:"bulk"];
  xpc_dictionary_set_uint64(v7, "flags", a3);
  [(PKDaemonClient *)self send:v7 reply:v6];
}

- (void)readyPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 environment:(id)a6 languages:(id)a7 persona:(id)a8 sandbox:(id)a9 reply:(id)a10
{
  BOOL v14 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = [(PKDaemonClient *)self request:"ready"];
  xpc_dictionary_set_uint64(v22, "flags", a5);
  if (v17)
  {
    v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v22, "environment", v23);
  }
  if ([v18 count])
  {
    id v24 = pklog_handle_for_category(1);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v18;
      _os_log_impl(&dword_1B38B0000, v24, OS_LOG_TYPE_INFO, "Setting app-specific languages: %@", (uint8_t *)&v28, 0xCu);
    }

    BOOL v25 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v22, "preferredlanguages", v25);
  }
  if (v19)
  {
    v26 = [v19 personaUniqueString];

    if (v26)
    {
      id v27 = [v19 personaUniqueString];
      xpc_dictionary_set_string(v22, "persona", (const char *)[v27 UTF8String]);
    }
    else
    {
      id v27 = pklog_handle_for_category(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1B38D5080();
      }
    }
  }
  if (v20) {
    xpc_dictionary_set_string(v22, "sandbox", (const char *)[v20 UTF8String]);
  }
  [(PKDaemonClient *)self set:v22 plugins:v16];
  [(PKDaemonClient *)self sendSynchronously:v14 request:v22 reply:v21];
}

- (void)accessPlugIns:(id)a3 synchronously:(BOOL)a4 flags:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(PKDaemonClient *)self request:"access"];
  xpc_dictionary_set_uint64(v12, "flags", a5);
  [(PKDaemonClient *)self set:v12 plugins:v11];

  [(PKDaemonClient *)self sendSynchronously:v7 request:v12 reply:v10];
}

- (void)findPlugInByPathURL:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t xdict = [(PKDaemonClient *)self request:"find"];
  BOOL v8 = [v7 absoluteString];

  id v9 = v8;
  xpc_dictionary_set_string(xdict, "paths", (const char *)[v9 UTF8String]);

  [(PKDaemonClient *)self send:xdict reply:v6];
}

- (void)setPluginAnnotations:(id)a3 annotations:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  xpc_object_t xdict = [(PKDaemonClient *)self request:"annotate"];
  [(PKDaemonClient *)self set:xdict uuids:v10];

  id v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(xdict, "annotations", v11);
  [(PKDaemonClient *)self send:xdict reply:v8];
}

- (void)bulkSetPluginAnnotations:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t xdict = [(PKDaemonClient *)self request:"bulk-annotate"];
  id v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(xdict, "annotations", v8);
  [(PKDaemonClient *)self send:xdict reply:v6];
}

- (void)holdPlugins:(id)a3 extensionPointName:(id)a4 platforms:(id)a5 flags:(unint64_t)a6 reply:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12) {
    [(PKDaemonClient *)self request:"lock" paths:v12];
  }
  else {
  id v16 = [(PKDaemonClient *)self request:"lock"];
  }

  if (v13)
  {
    xpc_dictionary_set_string(v16, "extensionpoint", (const char *)[v13 UTF8String]);
    if ([v14 count])
    {
      v23 = self;
      unint64_t v24 = a6;
      xpc_object_t v17 = xpc_array_create(0, 0);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v18 = v14;
      unint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v26;
        do
        {
          uint64_t v21 = 0;
          if (v19 <= 1) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v19;
          }
          do
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v18);
            }
            xpc_array_set_uint64(v17, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v21++), "unsignedLongLongValue", v23, v24, (void)v25));
          }
          while (v22 != v21);
          unint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v19);
      }

      xpc_dictionary_set_value(v16, "platforms", v17);
      self = v23;
      a6 = v24;
    }
  }
  xpc_dictionary_set_uint64(v16, "flags", a6);
  [(PKDaemonClient *)self sendSynchronously:(a6 >> 3) & 1 request:v16 reply:v15];
}

- (void)releaseHold:(id)a3 flags:(unint64_t)a4 reply:(id)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PKDaemonClient *)self request:"lock"];
  v12[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  [(PKDaemonClient *)self set:v10 uuids:v11];
  xpc_dictionary_set_uint64(v10, "flags", a4);
  [(PKDaemonClient *)self sendSynchronously:(a4 >> 3) & 1 request:v10 reply:v8];
}

- (id)request:(const char *)a3 paths:(id)a4
{
  id v6 = a4;
  id v7 = [(PKDaemonClient *)self request:a3];
  id v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(v7, "paths", v8);
  return v7;
}

- (void)send:(id)a3 reply:(id)a4
{
}

- (void)set:(id)a3 plugins:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_array_create(0, 0);
  xpc_object_t v8 = xpc_array_create(0, 0);
  xpc_object_t v9 = xpc_array_create(0, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B38CC474;
  v13[3] = &unk_1E60595B8;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  [v5 enumerateObjectsUsingBlock:v13];

  xpc_dictionary_set_value(v6, "uuids", v12);
  xpc_dictionary_set_value(v6, "paths", v11);
  xpc_dictionary_set_value(v6, "oneshotuuids", v10);
}

- (void)set:(id)a3 uuids:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  xpc_object_t v7 = xpc_array_create(0, 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  unint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      if (v9 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v9;
      }
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        *(void *)uuid = 0;
        uint64_t v19 = 0;
        objc_msgSend(v13, "getUUIDBytes:", uuid, (void)v14);
        xpc_array_set_uuid(v7, 0xFFFFFFFFFFFFFFFFLL, uuid);
        ++v11;
      }
      while (v12 != v11);
      unint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v9);
  }

  xpc_dictionary_set_value(v5, "uuids", v7);
}

- (OS_xpc_object)pkd
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPkd:(id)a3
{
}

- (OS_dispatch_queue)replyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_pkd, 0);
}

@end