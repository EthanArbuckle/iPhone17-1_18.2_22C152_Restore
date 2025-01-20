@interface NEHelperSourceAppInfo
- (NEHelperSourceAppInfo)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperSourceAppInfo

- (void).cxx_destruct
{
}

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  memset(dst, 0, sizeof(dst));
  int uint64 = xpc_dictionary_get_uint64(v3, "pid");
  string = xpc_dictionary_get_string(v3, "app-identifier");
  v6 = (void *)string;
  if (uint64)
  {
    if (!string)
    {
LABEL_8:
      v8 = (void *)ne_copy_signature_info_for_pid();
      v9 = v8;
      if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v10 = xpc_dictionary_get_value(v9, "SourceAppSigningIdentifier");
        v30 = xpc_dictionary_get_value(v9, "SourceAppUniqueIdentifier");
        if (!v6 && v10) {
          v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        }
        if (v30)
        {
          v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();

LABEL_12:
          id v50 = 0;
          long long v48 = 0u;
          long long v49 = 0u;
          long long buffer = 0u;
          if (proc_pidinfo(uint64, 17, 1uLL, &buffer, 56) == 56)
          {
            uuid_copy(dst, (const unsigned __int8 *)&buffer);
            memset(out, 0, sizeof(out));
            uuid_unparse(dst, out);
            v12 = ne_log_obj();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_18;
            }
            int v41 = 136315394;
            v42 = out;
            __int16 v43 = 1024;
            int v44 = uint64;
            v13 = "Found UUID: %s by lookup for pid: %d";
            v14 = (char *)&v41;
            v15 = v12;
            uint32_t v16 = 18;
          }
          else
          {
            v17 = ne_log_obj();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)uuid_string_t out = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not convert from PID to UUID", (uint8_t *)out, 2u);
            }

            v12 = ne_log_obj();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
LABEL_18:

              if (!v6) {
                goto LABEL_26;
              }
              goto LABEL_19;
            }
            *(_DWORD *)uuid_string_t out = 67109120;
            *(_DWORD *)&out[4] = uint64;
            v13 = "Could not convert from PID (%d) to UUID";
            v14 = out;
            v15 = v12;
            uint32_t v16 = 8;
          }
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)v14, v16);
          goto LABEL_18;
        }
      }
      else
      {
        v10 = 0;
      }
      v11 = 0;
      goto LABEL_12;
    }
    if (!*string)
    {
      v6 = 0;
      goto LABEL_8;
    }
  }
  else if (!string || !*string)
  {
    sub_100001CA0((uint64_t)NEHelperServer, v3, 22, 0);
    goto LABEL_53;
  }
  id v7 = [objc_alloc((Class)NSString) initWithUTF8String:string];
  v6 = v7;
  if (uint64) {
    goto LABEL_8;
  }
  v11 = 0;
  if (!v7) {
    goto LABEL_26;
  }
LABEL_19:
  if ([v6 length])
  {
    v18 = +[LSApplicationProxy applicationProxyForIdentifier:v6];
    v19 = v18;
    if (v18)
    {
      id v20 = [v18 shortVersionString];
      v21 = [v19 teamID];
      id v22 = [v21 length];

      v23 = [v19 teamID];
      id v24 = [v23 compare:@"0000000000"];

      id v25 = objc_alloc((Class)NSString);
      v26 = v25;
      if (v24 && v22)
      {
        v27 = [v19 teamID];
        id v28 = [v26 initWithFormat:@"%@.%@", v27, v6];
      }
      else
      {
        id v28 = [v25 initWithFormat:@"%@.%@", &stru_10003A6D0, v6];
      }
    }
    else
    {
      id v28 = [objc_alloc((Class)NSString) initWithFormat:@".%@", v6];
      id v20 = 0;
    }

    xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
    if (v28 && [v28 length]) {
      xpc_dictionary_set_string(v29, "app-identifier", (const char *)[v28 UTF8String]);
    }
    if (v20 && [v20 length])
    {
      id v20 = v20;
      xpc_dictionary_set_string(v29, "version-string", (const char *)[v20 UTF8String]);
    }
    goto LABEL_40;
  }
LABEL_26:
  xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
  id v28 = 0;
  id v20 = 0;
LABEL_40:
  if (v11 && [v11 length])
  {
    id v31 = v11;
    xpc_dictionary_set_data(v29, "app-cd-hash", [v31 bytes], (size_t)[v31 length]);
  }
  if (v6 && [v6 length] && uuid_is_null(dst))
  {
    v32 = sub_100020288();
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100026038;
    v37[3] = &unk_100039870;
    id v38 = v6;
    id v39 = v29;
    id v40 = v3;
    id v33 = v38;
    v35 = v37;
    if (v32)
    {
      Property = objc_getProperty(v32, v34, 8, 1);
      *(void *)&long long buffer = _NSConcreteStackBlock;
      *((void *)&buffer + 1) = 3221225472;
      *(void *)&long long v48 = sub_100025688;
      *((void *)&v48 + 1) = &unk_100039790;
      *(void *)&long long v49 = v32;
      *((void *)&v49 + 1) = v33;
      id v50 = 0;
      v51 = v35;
      dispatch_async(Property, &buffer);
    }
  }
  else
  {
    if (!uuid_is_null(dst)) {
      xpc_dictionary_set_uuid(v29, "app-euuid", dst);
    }
    sub_100001CA0((uint64_t)NEHelperServer, v3, 0, v29);
  }

LABEL_53:
}

- (OS_dispatch_queue)handlerQueue
{
  if (self)
  {
    self = (NEHelperSourceAppInfo *)objc_getProperty(self, a2, 8, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (NEHelperSourceAppInfo)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NEHelperSourceAppInfo;
  v5 = [(NEHelperSourceAppInfo *)&v26 init];
  if (!v5) {
    goto LABEL_10;
  }
  xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)xpc_connection_copy_entitlement_value();
  v8 = (void *)xpc_connection_copy_entitlement_value();
  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL value = xpc_BOOL_get_value(v7);
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL value = 0;
    if (!v8) {
      goto LABEL_8;
    }
  }
  if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL v14 = xpc_BOOL_get_value(v8);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("NEHelperSourceAppInfo", v15);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v16;

    if (v14 || value) {
      goto LABEL_9;
    }
LABEL_12:
    pid_t pid = xpc_connection_get_pid(v6);
    int v19 = proc_name(pid, buffer, 0x100u);
    id v20 = ne_log_obj();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v19 < 1)
    {
      if (v21)
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)id v28 = pid;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = "com.apple.private.nehelper.privileged";
        __int16 v29 = 2080;
        v30 = "com.apple.private.neagent";
        id v22 = "Denying connection from process %d because it is missing the %s entitlement and %s entitlement";
        v23 = v20;
        uint32_t v24 = 28;
        goto LABEL_19;
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 136315906;
      *(void *)id v28 = buffer;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)&v28[10] = pid;
      __int16 v29 = 2080;
      v30 = "com.apple.private.nehelper.privileged";
      __int16 v31 = 2080;
      v32 = "com.apple.private.neagent";
      id v22 = "Denying connection from %s (%d) because it is missing the %s entitlement and %s entitlement";
      v23 = v20;
      uint32_t v24 = 38;
LABEL_19:
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    }

    v13 = 0;
    goto LABEL_17;
  }
LABEL_8:
  v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("NEHelperSourceAppInfo", v10);
  v12 = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v11;

  if (!value) {
    goto LABEL_12;
  }
LABEL_9:

LABEL_10:
  v13 = v5;
LABEL_17:

  return v13;
}

@end