@interface NEHelperTest
- (NEHelperTest)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperTest

- (void)handleMessage:(id)a3
{
  xpc_object_t xdict = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "operation");
  switch(uint64)
  {
    case 3uLL:
      string = xpc_dictionary_get_string(xdict, "app-bundle-id");
      if (string)
      {
        v5 = xpc_string_create(string);
        xpc_object_t v6 = xpc_array_create(0, 0);
        xpc_array_append_value(v6, v5);
        xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_value(v7, (const char *)[@"bundleIDs" UTF8String], v6);
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        v9 = v8;
        v10 = _xpc_event_key_name;
        v11 = "ApplicationInstalled";
        goto LABEL_8;
      }
      break;
    case 2uLL:
      v14 = xpc_dictionary_get_string(xdict, "app-bundle-id");
      if (v14)
      {
        if (!*v14)
        {
          sub_10001FA34((uint64_t)NEHelperConfigurationManager, 0);
          goto LABEL_13;
        }
        v5 = +[NSString stringWithUTF8String:v14];
        sub_10001FA34((uint64_t)NEHelperConfigurationManager, v5);
LABEL_12:

LABEL_13:
        int64_t v15 = 0;
        goto LABEL_15;
      }
      break;
    case 1uLL:
      v4 = xpc_dictionary_get_string(xdict, "app-bundle-id");
      if (v4)
      {
        v5 = xpc_string_create(v4);
        xpc_object_t v6 = xpc_array_create(0, 0);
        xpc_array_append_value(v6, v5);
        xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_value(v7, (const char *)[@"bundleIDs" UTF8String], v6);
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        v9 = v8;
        v10 = _xpc_event_key_name;
        v11 = "ApplicationUninstalled";
LABEL_8:
        xpc_dictionary_set_string(v8, v10, v11);
        xpc_dictionary_set_value(v9, "UserInfo", v7);
        v13 = sub_10000CA2C();
        sub_10000D000(v13, v9, "com.apple.distnoted.matching");

        goto LABEL_12;
      }
      break;
  }
  int64_t v15 = 22;
LABEL_15:
  sub_100001CA0((uint64_t)NEHelperServer, xdict, v15, 0);
}

- (NEHelperTest)initWithFirstMessage:(id)a3
{
  v4 = xpc_dictionary_get_remote_connection(a3);
  if (sub_10000E810((uint64_t)NEHelperServer, v4))
  {
    v9.receiver = self;
    v9.super_class = (Class)NEHelperTest;
    self = [(NEHelperTest *)&v9 init];
    v5 = self;
  }
  else
  {
    xpc_object_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = sub_10000E870((uint64_t)NEHelperServer, v4);
      *(_DWORD *)buf = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      v13 = "com.apple.private.networkextension.test-control";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Denying test connection because %@ does not have the %s entitlement", buf, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

@end