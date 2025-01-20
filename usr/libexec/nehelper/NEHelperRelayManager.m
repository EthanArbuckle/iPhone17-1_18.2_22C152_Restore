@interface NEHelperRelayManager
- (NEHelperRelayManager)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperRelayManager

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ processing Relay Manager message", buf, 0xCu);
  }

  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "relay-command");
  if (uint64 - 1 <= 1)
  {
    uint64_t v7 = uint64;
    size_t length = 0;
    data = xpc_dictionary_get_data(v4, "relay-persistent-reference", &length);
    if (data && length)
    {
      v9 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data);
      v10 = xpc_dictionary_get_value(v4, "relay-identity-domain");
      v11 = v10;
      if (!v10)
      {
        uuid = xpc_dictionary_get_uuid(v4, "relay-config-id");
        if (!uuid)
        {
LABEL_16:
          sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
LABEL_42:

          goto LABEL_43;
        }
        v15 = (_xpc_connection_s *)[objc_alloc((Class)NSUUID) initWithUUIDBytes:uuid];
        v16 = +[NEConfigurationManager sharedManagerForAllUsers];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1000031F0;
        v39[3] = &unk_100038C60;
        v39[4] = self;
        id v40 = v4;
        uint64_t v42 = v7;
        id v41 = v9;
        [v16 loadConfigurationWithID:v15 withCompletionQueue:&_dispatch_main_q handler:v39];

LABEL_41:
        goto LABEL_42;
      }
      if (xpc_get_type(v10) != (xpc_type_t)&_xpc_type_string)
      {
        v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = self;
          v13 = "%@ invalid domain";
LABEL_45:
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
      string_ptr = xpc_string_get_string_ptr(v11);
      if (strcmp(string_ptr, "com.apple.networkrelay"))
      {
        v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = self;
          v13 = "%@ unsupported domain";
          goto LABEL_45;
        }
LABEL_15:

        goto LABEL_16;
      }
      xpc_dictionary_get_remote_connection(v4);
      v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v15 = v18;
      if (v18) {
        uint64_t pid = xpc_connection_get_pid(v18);
      }
      else {
        uint64_t pid = 0;
      }
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      v21 = +[NSNumber numberWithInt:pid];
      [v20 setObject:v21 forKeyedSubscript:kNRIPCOptionPID];

      v22 = xpc_dictionary_get_value(v4, "relay-options");
      v23 = v22;
      if (v22)
      {
        if (xpc_get_type(v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          uint64_t v24 = _CFXPCCreateCFObjectFromXPCObject();
          *(void *)buf = v24;
          if (v24)
          {
            [v20 addEntriesFromDictionary:v24];
            myCFRelease();
          }
        }
      }
      if (v7 == 2)
      {
        id v38 = [objc_alloc((Class)NRIdentityProxyClient) initWithCertificateReference:v9 options:v20];
        id v31 = [v38 copyCertificateData];
        v26 = v31;
        if (v31 && [v31 length])
        {
          v32 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_value(v33, "relay-certificate-data", v32);
          sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v33);

          goto LABEL_39;
        }
        v37 = ne_log_obj();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = self;
          __int16 v45 = 2080;
          v46 = string_ptr;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%@ requested certificate not found for %s", buf, 0x16u);
        }

        v35 = v4;
        int64_t v36 = 2;
      }
      else
      {
        if (v7 != 1)
        {
LABEL_40:

          goto LABEL_41;
        }
        id v38 = [objc_alloc((Class)NRIdentityProxyClient) initWithIdentityReference:v9 options:v20];
        id v25 = [v38 copySecKeyProxy];
        v26 = v25;
        if (v25)
        {
          v27 = [v25 endpoint];

          if (v27)
          {
            v28 = [v26 endpoint];
            v29 = [v28 _endpoint];

            xpc_object_t v30 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_value(v30, "relay-identity-xpc-endpoint", v29);
            sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v30);

LABEL_39:
            goto LABEL_40;
          }
        }
        v34 = ne_log_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = self;
          __int16 v45 = 2080;
          v46 = string_ptr;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@ key proxy creation failed for %s", buf, 0x16u);
        }

        v35 = v4;
        int64_t v36 = 12;
      }
      sub_100001CA0((uint64_t)NEHelperServer, v35, v36, 0);
      goto LABEL_39;
    }
    sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
  }
LABEL_43:
}

- (NEHelperRelayManager)initWithFirstMessage:(id)a3
{
  id v4 = xpc_dictionary_get_remote_connection(a3);
  self;
  v7.receiver = self;
  v7.super_class = (Class)NEHelperRelayManager;
  v5 = [(NEHelperRelayManager *)&v7 init];

  return v5;
}

@end