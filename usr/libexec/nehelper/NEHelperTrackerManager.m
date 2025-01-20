@interface NEHelperTrackerManager
- (NEHelperTrackerManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperTrackerManager

- (void).cxx_destruct
{
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v60 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ processing Tracker Manager request", buf, 0xCu);
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (reply)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "tracker-command");
    if (uint64 != 2)
    {
      if (uint64 == 1)
      {
        v8 = xpc_dictionary_get_value(v4, "test-domains");
        os_unfair_lock_lock(&stru_100042C08);
        if (!v8 && qword_100042AE0
          || (sub_100004584((uint64_t)NEHelperTrackerManager, v8, 0), qword_100042AE0))
        {
          v9 = ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            size_t count = xpc_array_get_count((xpc_object_t)qword_100042AE0);
            *(_DWORD *)buf = 138412546;
            v60 = self;
            __int16 v61 = 2048;
            size_t v62 = count;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ sending back domain list of %zu items", buf, 0x16u);
          }

          xpc_dictionary_set_int64(reply, "result-code", 0);
          xpc_dictionary_set_value(reply, "domain-dictionary", (xpc_object_t)qword_100042AD8);
          xpc_dictionary_set_value(reply, "sorted-domains", (xpc_object_t)qword_100042AE0);
          xpc_dictionary_set_int64(reply, "unique-prefix-count", qword_100042BF8);
          int64_t v11 = qword_100042C00;
          v12 = "total-byte-count";
          v13 = reply;
        }
        else
        {
          v12 = "result-code";
          v13 = reply;
          int64_t v11 = 2;
        }
        xpc_dictionary_set_int64(v13, v12, v11);
        os_unfair_lock_unlock(&stru_100042C08);

        goto LABEL_54;
      }
LABEL_30:
      xpc_dictionary_set_int64(reply, "result-code", 22);
LABEL_54:
      xpc_dictionary_get_remote_connection(v4);
      v41 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v41, reply);

      goto LABEL_55;
    }
    string = xpc_dictionary_get_string(v4, "bundle-id");
    if (!string) {
      goto LABEL_30;
    }
    v15 = string;
    id v16 = +[NSString stringWithUTF8String:string];
    v42 = v15;
    v43 = self;
    if (!self)
    {
      id v33 = 0;
      goto LABEL_41;
    }
    id v17 = [objc_alloc((Class)_SWCServiceSpecifier) initWithServiceType:0 applicationIdentifier:v16 domain:0];
    id v18 = objc_alloc_init((Class)NSMutableArray);
    id v57 = 0;
    id v46 = v17;
    v19 = +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:v17 error:&v57];
    v45 = (NEHelperTrackerManager *)v57;
    v47 = v19;
    id v48 = v16;
    if (v19)
    {
      id v44 = v4;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v20 = v19;
      id v21 = [v20 countByEnumeratingWithState:&v53 objects:buf count:16];
      if (v21)
      {
        id v22 = v21;
        char v23 = 0;
        uint64_t v24 = *(void *)v54;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v54 != v24) {
              objc_enumerationMutation(v20);
            }
            v26 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if ([v26 isApproved])
            {
              v27 = [v26 serviceSpecifier];
              v28 = [v27 domain];
              v29 = [v28 lowercaseString];

              if (v29 && ([v18 containsObject:v29] & 1) == 0) {
                [v18 addObject:v29];
              }
            }
            else
            {
              char v23 = 1;
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v53 objects:buf count:16];
        }
        while (v22);
      }
      else
      {
        char v23 = 0;
      }

      [v18 sortUsingSelector:NSSelectorFromString(@"compare:")];
      id v4 = v44;
      v31 = v45;
      v32 = v46;
      if (![v18 count] && (v23 & 1) != 0)
      {
        id v33 = 0;
LABEL_40:

        id v16 = v48;
LABEL_41:

        v34 = ne_log_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          v60 = v43;
          __int16 v61 = 2080;
          size_t v62 = (size_t)v42;
          __int16 v63 = 2112;
          id v64 = v33;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%@ sending back approved domain list for %s: %@", buf, 0x20u);
        }

        if (v33)
        {
          xpc_object_t v35 = xpc_array_create(0, 0);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v36 = v33;
          id v37 = [v36 countByEnumeratingWithState:&v49 objects:v58 count:16];
          if (v37)
          {
            id v38 = v37;
            uint64_t v39 = *(void *)v50;
            do
            {
              for (j = 0; j != v38; j = (char *)j + 1)
              {
                if (*(void *)v50 != v39) {
                  objc_enumerationMutation(v36);
                }
                xpc_array_set_string(v35, 0xFFFFFFFFFFFFFFFFLL, (const char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)j) UTF8String]);
              }
              id v38 = [v36 countByEnumeratingWithState:&v49 objects:v58 count:16];
            }
            while (v38);
          }
        }
        else
        {
          xpc_object_t v35 = 0;
        }
        xpc_dictionary_set_int64(reply, "result-code", 0);
        xpc_dictionary_set_value(reply, "sorted-domains", v35);

        goto LABEL_54;
      }
    }
    else
    {
      v30 = ne_log_obj();
      v31 = v45;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v60 = v45;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error getting info: %@\n", buf, 0xCu);
      }

      [v18 count];
      v32 = v46;
    }
    id v33 = v18;
    goto LABEL_40;
  }
LABEL_55:
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)(id)qword_100042AD0;
}

- (NEHelperTrackerManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  self;
  if (qword_100042AE8 != -1) {
    dispatch_once(&qword_100042AE8, &stru_100038C80);
  }
  v13.receiver = self;
  v13.super_class = (Class)NEHelperTrackerManager;
  v5 = [(NEHelperTrackerManager *)&v13 init];
  if (v5)
  {
    uint64_t v6 = xpc_dictionary_get_remote_connection(v4);
    connection = v5->_connection;
    v5->_connection = (OS_xpc_object *)v6;

    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      id v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ Created new NEHelperTrackerManager", buf, 0xCu);
    }
    int64_t v11 = v5;
  }

  return v5;
}

@end