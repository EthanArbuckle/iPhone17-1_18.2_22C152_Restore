@interface CRDaemonController
+ (BOOL)doLaunchControl:(id)a3 action:(id)a4;
+ (id)getAllowedListFromEntitlements:(id)a3;
+ (id)safeGetStringParam:(id)a3 key:(id)a4;
+ (void)controlWithParameters:(id)a3 withReply:(id)a4;
+ (void)getLibXPCInternalWithSymbol:(const char *)a3;
@end

@implementation CRDaemonController

+ (id)getAllowedListFromEntitlements:(id)a3
{
  id v3 = a3;
  v4 = +[NSXPCConnection currentConnection];
  v5 = [v4 valueForEntitlement:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

+ (void)controlWithParameters:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, void))a4;
  v8 = handleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315394;
    v21 = "+[CRDaemonController controlWithParameters:withReply:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%s] parameters: %@", (uint8_t *)&v20, 0x16u);
  }

  v9 = [a1 safeGetStringParam:v6 key:@"action"];
  v10 = v9;
  if (v9)
  {
    if (([v9 isEqual:@"load"] & 1) != 0
      || [v10 isEqual:@"unload"])
    {
      v11 = [a1 getAllowedListFromEntitlements:@"com.apple.private.corerepair.allow-job-control"];
      v12 = [a1 safeGetStringParam:v6 key:@"name"];
      if (v12)
      {
        if ([v11 containsObject:v12])
        {
          uint64_t v13 = (uint64_t)[a1 doLaunchControl:v12 action:v10];
LABEL_9:

          goto LABEL_10;
        }
        v18 = handleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10003E804();
        }
      }
      else
      {
        v18 = handleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10003E7D0();
        }
      }

      uint64_t v13 = 0;
      goto LABEL_9;
    }
    if (![v10 isEqual:@"writeDefaults"])
    {
      uint64_t v13 = 0;
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    v11 = [a1 getAllowedListFromEntitlements:@"com.apple.private.corerepair.allow-pref-access"];
    v12 = [a1 safeGetStringParam:v6 key:@"name"];
    v14 = [a1 safeGetStringParam:v6 key:@"prefKey"];
    v15 = [v6 objectForKeyedSubscript:@"prefValue"];
    if (v12)
    {
      if ([v11 containsObject:v12])
      {
        if (v14)
        {
          if (v15)
          {
            v16 = +[NSNull null];

            if (v15 == v16)
            {

              v15 = 0;
            }
            v17 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:v12];
            [v17 setObject:v15 forKey:v14];
            [v17 synchronize];

            uint64_t v13 = 1;
            v15 = v17;
            goto LABEL_21;
          }
          v15 = handleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10003E8D4();
          }
LABEL_41:
          uint64_t v13 = 0;
LABEL_21:

          goto LABEL_9;
        }
        v19 = handleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10003E8A0();
        }
      }
      else
      {
        v19 = handleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10003E908();
        }
      }
    }
    else
    {
      v19 = handleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10003E86C();
      }
    }

    goto LABEL_41;
  }
  v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10003E79C();
  }
  uint64_t v13 = 0;
LABEL_10:

  if (v7) {
LABEL_11:
  }
    v7[2](v7, v13, 0);
LABEL_12:
}

+ (BOOL)doLaunchControl:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v8 = +[NSString stringWithFormat:@"/System/Library/LaunchDaemons/%@.plist", v6];
  v9 = (void (*)(uint64_t, xpc_object_t, id *))[a1 getLibXPCInternalWithSymbol:"_xpc_domain_routine"];
  v10 = (void (*)(id))[a1 getLibXPCInternalWithSymbol:"xpc_release"];
  if (!v9 || (v11 = v10) == 0)
  {
    int v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003E970();
    }
    goto LABEL_17;
  }
  unsigned __int8 v12 = [v7 isEqualToString:@"load"];
  if (v12)
  {
    uint64_t v13 = 800;
    v14 = "enable";
    goto LABEL_7;
  }
  if (([v7 isEqualToString:@"unload"] & 1) == 0)
  {
    int v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10003E9A4();
    }
LABEL_17:

    v19 = 0;
    xpc_object_t v16 = 0;
    xpc_object_t v15 = 0;
    id v17 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = 801;
  v14 = "disable";
LABEL_7:
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v15, "type", 7uLL);
  xpc_dictionary_set_uint64(v15, "handle", 0);
  xpc_dictionary_set_BOOL(v15, v14, 0);
  xpc_dictionary_set_BOOL(v15, "legacy-load", 1);
  xpc_dictionary_set_BOOL(v15, "force", 1);
  xpc_dictionary_set_BOOL(v15, "by-cli", 1);
  xpc_object_t v16 = xpc_array_create(0, 0);
  xpc_array_set_string(v16, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v8 UTF8String]);
  xpc_dictionary_set_value(v15, "paths", v16);
  if ((v12 & 1) == 0) {
    xpc_dictionary_set_BOOL(v15, "no-einprogress", 1);
  }
  id v25 = 0;
  v9(v13, v15, &v25);
  id v17 = v25;
  v18 = xpc_dictionary_get_dictionary(v17, "errors");
  v19 = v18;
  if (v18 && xpc_dictionary_get_count(v18))
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10000C8B0;
    applier[3] = &unk_100058C60;
    applier[4] = &v26;
    unsigned __int8 v24 = v12;
    xpc_dictionary_apply(v19, applier);
    if (!v17) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  *((unsigned char *)v27 + 24) = 1;
  if (v17) {
LABEL_14:
  }
    v11(v17);
LABEL_18:
  char v21 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v21;
}

+ (void)getLibXPCInternalWithSymbol:(const char *)a3
{
  if (qword_10006E8D8 != -1) {
    dispatch_once(&qword_10006E8D8, &stru_100058C80);
  }
  if (qword_10006E8E0)
  {
    result = dlsym((void *)qword_10006E8E0, a3);
    if (result) {
      return result;
    }
    v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003EB10();
    }
  }
  else
  {
    v5 = handleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003EADC();
    }
  }

  return 0;
}

+ (id)safeGetStringParam:(id)a3 key:(id)a4
{
  v4 = 0;
  if (a3)
  {
    if (a4)
    {
      v4 = [a3 objectForKeyedSubscript:a4];
      if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v4 length])
      {

        v4 = 0;
      }
    }
  }

  return v4;
}

@end