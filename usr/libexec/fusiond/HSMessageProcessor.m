@interface HSMessageProcessor
- (HSMessageProcessor)init;
- (int)processMessage:(id)a3 response:(id *)a4;
- (int)processMessagev1:(id)a3 response:(id *)a4;
- (int)rebootDevice:(id *)a3;
@end

@implementation HSMessageProcessor

- (HSMessageProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)HSMessageProcessor;
  v2 = [(HSMessageProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HSSepUtil sharedSingleton];
    sepUtil = v2->_sepUtil;
    v2->_sepUtil = (HSSepUtil *)v3;
  }
  return v2;
}

- (int)processMessagev1:(id)a3 response:(id *)a4
{
  id v5 = a3;
  if (v5)
  {
    NSLog(@"Processing Message in v1 format");
    objc_super v6 = +[FNPluginManager sharedManager];
    v7 = [v5 messageStr];
    v8 = [v6 getClient:v7];

    v9 = [v5 description];
    NSLog(@"Message : %@", v9);

    [v8 sendMessage:v5 response:a4];
    int v10 = 0;
  }
  else
  {
    *a4 = [objc_alloc((Class)HSMessageResponse) initWithName:@"Error" statusCode:&off_100011F80];
    int v10 = 2;
  }

  return v10;
}

- (int)rebootDevice:(id *)a3
{
  v4 = sub_100003568();
  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_100010808);
  objc_super v6 = +[NSNumber numberWithUnsignedInt:0];
  [v4 setObject:v6 forKeyedSubscript:@"Status"];

  [v4 setObject:&stru_1000108C8 forKeyedSubscript:@"Error"];
  if (a3) {
    *a3 = v4;
  }

  return 0;
}

- (int)processMessage:(id)a3 response:(id *)a4
{
  id v6 = a3;
  v96 = v6;
  if (!a4)
  {
    v76 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
    v77 = [v76 lastPathComponent];
    v91 = +[NSString stringWithFormat:@"Input response dictionary pointer is NULL."];
    uint64_t v24 = 4;
    sub_100009790(4, @"[%@:%d] %@\n", v78, v79, v80, v81, v82, v83, (uint64_t)v77);

    id v97 = 0;
    id v9 = 0;
    v11 = 0;
    v95 = 0;
    goto LABEL_23;
  }
  v7 = v6;
  v92 = self;
  v94 = a4;
  v8 = +[NSNumber numberWithInt:4];
  id v9 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v8, @"Status", &stru_1000108C8, @"Error", &stru_1000108C8, @"Output", 0, @"Data", 0];

  int v10 = +[NSNumber numberWithInt:0];
  id v97 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v10, @"Status", &stru_1000108C8, @"Error", @"Success", @"Output", &stru_1000108C8, @"Data", 0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v7 objectForKey:@"Command"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
      v14 = [v13 lastPathComponent];
      v84 = +[NSString stringWithFormat:@"command = %@", v12];
      sub_100009790(2, @"[%@:%d] %@\n", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

      a4 = v94;
      if ([v12 isEqualToString:@"SepUtil"])
      {
        uint64_t v21 = [(HSSepUtil *)v92->_sepUtil processSepUtilCommand:v7 response:v94];
      }
      else if ([v12 isEqualToString:@"GetLogs"])
      {
        v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
        v40 = [v39 lastPathComponent];
        v87 = +[NSString stringWithFormat:@"Start processing the %@ command", v12, 99, v84];
        sub_100009790(2, @"[%@:%d] %@\n", v41, v42, v43, v44, v45, v46, (uint64_t)v40);

        uint64_t v21 = sub_100009CD4(v94);
      }
      else
      {
        if (![v12 isEqualToString:@"PerformComponentCheckReboot"])
        {
          uint64_t v24 = 4;
          goto LABEL_14;
        }
        v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
        v48 = [v47 lastPathComponent];
        v88 = +[NSString stringWithFormat:@"Start processing the %@ command", v12, 99, v84];
        sub_100009790(2, @"[%@:%d] %@\n", v49, v50, v51, v52, v53, v54, (uint64_t)v48);

        uint64_t v21 = [(HSMessageProcessor *)v92 rebootDevice:v94];
      }
      uint64_t v24 = v21;
LABEL_14:
      v11 = v12;
      goto LABEL_15;
    }
    v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
    v32 = [v31 lastPathComponent];
    v86 = +[NSString stringWithFormat:@"Command is not a string. This is not supported\n"];
    uint64_t v24 = 4;
    sub_100009790(4, @"[%@:%d] %@\n", v33, v34, v35, v36, v37, v38, (uint64_t)v32);

    [v9 setObject:@"Command is not a string. This is not supported" forKey:@"Error"];
    id v12 = 0;
  }
  else
  {
    v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
    v23 = [v22 lastPathComponent];
    v85 = +[NSString stringWithFormat:@"Message is not a dictionary. This is not supported\n"];
    uint64_t v24 = 4;
    sub_100009790(4, @"[%@:%d] %@\n", v25, v26, v27, v28, v29, v30, (uint64_t)v23);

    [v9 setObject:@"Message is not a dictionary. This is not supported" forKey:@"Error"];
    id v12 = 0;
    v11 = 0;
  }
  a4 = v94;
LABEL_15:
  id v55 = *a4;
  v95 = v12;
  if (*a4 || !v9)
  {
    if (v55)
    {
      v56 = [v55 valueForKey:@"Output"];
      if (![v56 length])
      {
        v57 = [*a4 valueForKey:@"Error"];
        if ([v57 length])
        {
        }
        else
        {
          v75 = [*a4 valueForKey:@"Status"];
          id v93 = [v75 integerValue];

          if (v93) {
            goto LABEL_23;
          }
          v56 = [*a4 valueForKey:@"Data"];
          if (!v56
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v56 length]
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v56 count])
          {
            *a4 = v97;
          }
        }
      }
    }
  }
  else
  {
    id v9 = v9;
    *a4 = v9;
  }
LABEL_23:
  v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
  v59 = [v58 lastPathComponent];
  v89 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HSMessageProcessor processMessage:response:]", 128, *a4);
  sub_100009790(2, @"[%@:%d] %@\n", v60, v61, v62, v63, v64, v65, (uint64_t)v59);

  v66 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/ComponentCheck/Daemon/HSMessageProcessor.m"];
  v67 = [v66 lastPathComponent];
  v90 = +[NSString stringWithFormat:@"rval = %d", v24, 128, v89];
  sub_100009790(2, @"[%@:%d] %@\n", v68, v69, v70, v71, v72, v73, (uint64_t)v67);

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentCheckUtil, 0);

  objc_storeStrong((id *)&self->_sepUtil, 0);
}

@end