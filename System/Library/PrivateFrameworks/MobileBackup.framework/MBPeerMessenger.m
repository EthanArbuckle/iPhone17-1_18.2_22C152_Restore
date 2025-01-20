@interface MBPeerMessenger
+ (Class)_requestClassForTask:(id)a3;
+ (Class)_responseClassForTask:(id)a3;
+ (id)_eventIDForTask:(id)a3;
+ (id)_taskForRequestClass:(Class)a3;
+ (id)sendRequestSync:(id)a3 session:(id)a4 error:(id *)a5;
+ (void)_initializeState;
+ (void)_registerRequestHandlerTask:(id)a3;
+ (void)registerRequestClass:(Class)a3 responseClass:(Class)a4 forTask:(id)a5;
+ (void)registerRequestHandler:(id)a3 forTask:(id)a4 session:(id)a5;
+ (void)sendRequest:(id)a3 session:(id)a4 responseHandler:(id)a5;
+ (void)unregisterAllMessages;
+ (void)unregisterAllRequestHandlersForSession:(id)a3;
@end

@implementation MBPeerMessenger

+ (void)_initializeState
{
  if (qword_1004826B8 != -1) {
    dispatch_once(&qword_1004826B8, &stru_100416490);
  }
}

+ (void)registerRequestClass:(Class)a3 responseClass:(Class)a4 forTask:(id)a5
{
  id v9 = a5;
  if (([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___MBPeerMessagable] & 1) == 0) {
    __assert_rtn("+[MBPeerMessenger registerRequestClass:responseClass:forTask:]", "MBPeerMessenger.m", 46, "[requestClass conformsToProtocol: @protocol(MBPeerMessagable)]");
  }
  if (([(objc_class *)a4 conformsToProtocol:&OBJC_PROTOCOL___MBPeerMessagable] & 1) == 0) {
    __assert_rtn("+[MBPeerMessenger registerRequestClass:responseClass:forTask:]", "MBPeerMessenger.m", 47, "[responseClass conformsToProtocol: @protocol(MBPeerMessagable)]");
  }
  [a1 _initializeState];
  v8 = [a1 _taskForRequestClass:a3];

  if (!v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
    [(id)qword_1004826D0 setObject:a3 forKeyedSubscript:v9];
    [(id)qword_1004826D8 setObject:a4 forKeyedSubscript:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
  }
}

+ (void)unregisterAllMessages
{
  [a1 _initializeState];
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_1004826D0;
  qword_1004826D0 = v2;

  uint64_t v4 = objc_opt_new();
  v5 = (void *)qword_1004826D8;
  qword_1004826D8 = v4;

  [(id)qword_1004826E0 reset];
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
}

+ (Class)_responseClassForTask:(id)a3
{
  id v4 = a3;
  [a1 _initializeState];
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
  id v5 = [(id)qword_1004826D8 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
  return (Class)v5;
}

+ (Class)_requestClassForTask:(id)a3
{
  id v4 = a3;
  [a1 _initializeState];
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
  id v5 = [(id)qword_1004826D0 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
  return (Class)v5;
}

+ (id)_taskForRequestClass:(Class)a3
{
  [a1 _initializeState];
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend((id)qword_1004826D0, "allKeys", 0);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(id)qword_1004826D0 objectForKeyedSubscript:v9] == a3)
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
          id v10 = v9;

          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
  id v10 = 0;
LABEL_11:
  return v10;
}

+ (void)sendRequest:(id)a3 session:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v26 = a4;
  id v9 = a5;
  id v10 = [a1 _taskForRequestClass:objc_opt_class()];
  v11 = v10;
  if (v10)
  {
    if ([v10 isEqualToString:@"MBPeerTaskInit"])
    {
      long long v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = objc_opt_class();
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting the %@ cache", (uint8_t *)&buf, 0xCu);
        uint64_t v24 = objc_opt_class();
        _MBLog();
      }

      [(id)qword_1004826E0 reset];
    }
    long long v13 = objc_msgSend(v8, "dictionaryRepresentation", v24);
    long long v14 = +[NSMutableDictionary dictionaryWithDictionary:v13];

    long long v15 = +[NSUUID UUID];
    v25 = [v15 UUIDString];

    [v14 setObject:v25 forKeyedSubscript:@"MBPeerMessengerTransactionID"];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_1001F8550;
    v47[3] = &unk_1004164B8;
    id v48 = v9;
    id v49 = a1;
    v47[4] = v11;
    v16 = objc_retainBlock(v47);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v51 = 0x3032000000;
    v52 = sub_1001F867C;
    v53 = sub_1001F86A8;
    id v54 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = sub_1001F867C;
    v45 = sub_1001F86A8;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1001F86B0;
    v34[3] = &unk_1004164E0;
    id v17 = v8;
    id v35 = v17;
    id v18 = v26;
    id v40 = a1;
    id v36 = v18;
    v37 = v11;
    id v19 = v14;
    id v38 = v19;
    p_long long buf = &buf;
    v46 = objc_retainBlock(v34);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0x4024000000000000;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001F87CC;
    v27[3] = &unk_100416508;
    id v28 = v17;
    v31 = v33;
    id v29 = v18;
    v32 = &v41;
    v20 = v16;
    id v30 = v20;
    id v21 = [v27 copy];
    v22 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v21;

    (*(void (**)(void))(v42[5] + 16))();
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v23 = +[MBError errorWithCode:10 description:@"Failed to encode request for class"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v23);
  }
}

+ (id)sendRequestSync:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1001F8CF8;
  id v28 = sub_1001F8D08;
  id v29 = 0;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1001F8CF8;
  v22 = sub_1001F8D08;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001F8D10;
  v14[3] = &unk_100416530;
  v16 = &v24;
  id v17 = &v18;
  id v10 = dispatch_semaphore_create(0);
  long long v15 = v10;
  [a1 sendRequest:v8 session:v9 responseHandler:v14];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
  {
    v11 = (void *)v19[5];
    if (v11) {
      *a5 = v11;
    }
  }
  id v12 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

+ (void)_registerRequestHandlerTask:(id)a3
{
  id v4 = a3;
  [a1 _initializeState];
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
  [(id)qword_1004826C8 addObject:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
}

+ (void)registerRequestHandler:(id)a3 forTask:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _initializeState];
  id v11 = [a1 _requestClassForTask:v9];
  id v12 = [a1 _responseClassForTask:v9];
  if (!v11) {
    __assert_rtn("+[MBPeerMessenger registerRequestHandler:forTask:session:]", "MBPeerMessenger.m", 230, "requestClass != nil");
  }
  if (!v12) {
    __assert_rtn("+[MBPeerMessenger registerRequestHandler:forTask:session:]", "MBPeerMessenger.m", 231, "responseClass != nil");
  }
  long long v13 = [a1 _eventIDForTask:v9];
  long long v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1001F8F74;
  uint64_t v18 = &unk_1004165A8;
  id v21 = v11;
  id v22 = a1;
  id v19 = v9;
  id v20 = v8;
  id v14 = v8;
  [v10 registerRequestID:v13 options:0 handler:&v15];

  objc_msgSend(a1, "_registerRequestHandlerTask:", v9, v15, v16, v17, v18, v19);
}

+ (void)unregisterAllRequestHandlersForSession:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1004826C0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = (id)qword_1004826C8;
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(a1, "_eventIDForTask:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        [v4 deregisterRequestID:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1004826C0);
}

+ (id)_eventIDForTask:(id)a3
{
  return +[NSString stringWithFormat:@"MBPeerMessenger-%@", a3];
}

@end