@interface CryptexSession
- (BOOL)sessionAddCptxWithBundleID:(const char *)a3 withType:(int64_t)a4 dmgFd:(int *)a5 trustCacheFD:(int *)a6 manifestFD:(int *)a7 volumeHashFD:(int *)a8 infoPlistFd:(int *)a9 cx1Properties:(id)a10;
- (BOOL)session_removal_begun;
- (CryptexSession)initWithCore:(id)a3;
- (NSMutableArray)peer_array;
- (NSMutableArray)quire_array;
- (NSString)name;
- (OS_dispatch_group)session_work_group;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (OS_session_core)cs;
- (OS_xpc_object)listener;
- (char)copySessionName;
- (int)activate;
- (int)error;
- (int64_t)stop_reason;
- (unint64_t)exit_code;
- (void)cancelPeerConnections;
- (void)parseCommandFromMessage:(id)a3 fromPeer:(id)a4;
- (void)sessionAddParseXPC:(id)a3;
- (void)sessionEventNotify:(int64_t)a3;
- (void)sessionMessageReply:(id)a3;
- (void)sessionStart;
- (void)sessionStopWithReason:(int64_t)a3 exitCode:(unint64_t)a4;
- (void)setCs:(id)a3;
- (void)setDq:(id)a3;
- (void)setError:(int)a3;
- (void)setExitReason:(int64_t)a3 withCode:(unint64_t)a4;
- (void)setExit_code:(unint64_t)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setName:(id)a3;
- (void)setPeer_array:(id)a3;
- (void)setQuire_array:(id)a3;
- (void)setSession_removal_begun:(BOOL)a3;
- (void)setSession_work_group:(id)a3;
- (void)setStop_reason:(int64_t)a3;
- (void)setupHandler;
@end

@implementation CryptexSession

- (void)cancelPeerConnections
{
  v3 = [(CryptexSession *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CryptexSession *)self peer_array];
    *(_DWORD *)buf = 134217984;
    id v16 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling peer connections: %zu", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(CryptexSession *)self peer_array];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        xpc_connection_cancel(*(xpc_connection_t *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)sessionStart
{
  [(CryptexSession *)self sessionEventNotify:2];
  v3 = [(CryptexSession *)self cs];
  int uid = cryptex_session_core_get_uid();

  v5 = [(CryptexSession *)self session_work_group];
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(CryptexSession *)self session_work_group];
  dispatch_group_enter(v6);

  id v7 = [(CryptexSession *)self log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Searching for LaunchAgents to add to the session", (uint8_t *)&v18, 2u);
  }

  uint64_t v8 = sub_100016EB4();
  v9 = [(CryptexSession *)self cs];
  long long v10 = cryptex_session_core_get_overrides();

  CFIndex v11 = sub_1000180E0((uint64_t)v8, uid, v10);
  if (v11)
  {
    CFIndex v12 = v11;
    [(CryptexSession *)self sessionEventNotify:32];
    [(CryptexSession *)self setError:v12];
    int v13 = *__error();
    v14 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = [(CryptexSession *)self error];
      int v18 = 138412546;
      v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to start session %@: %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }

    *__error() = v13;
    id v16 = [(CryptexSession *)self session_work_group];
    dispatch_group_leave(v16);
  }
  else
  {
    v17 = self;
    cryptex_async_f();
  }
}

- (void)sessionMessageReply:(id)a3
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    if ([(CryptexSession *)self error])
    {
      v5 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = [(CryptexSession *)self error];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session has an error (code %d), reporting it.", (uint8_t *)v10, 8u);
      }

      xpc_dictionary_set_int64(reply, "STATE", 1);
      int64_t v6 = [(CryptexSession *)self error];
      id v7 = "ERROR";
      uint64_t v8 = reply;
    }
    else
    {
      id v7 = "STATE";
      uint64_t v8 = reply;
      int64_t v6 = 0;
    }
    xpc_dictionary_set_int64(v8, v7, v6);
    xpc_dictionary_send_reply();
  }
  else
  {
    v9 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100041D90(v9);
    }
  }
}

- (void)sessionStopWithReason:(int64_t)a3 exitCode:(unint64_t)a4
{
  id v7 = sub_100016EB4();
  int v8 = *__error();
  v9 = [(CryptexSession *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = [(CryptexSession *)self error];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "sessionStopWithReason occurred.: %{darwin.errno}d", buf, 8u);
  }

  *__error() = v8;
  if (![(CryptexSession *)self session_removal_begun])
  {
    [(CryptexSession *)self setSession_removal_begun:1];
    long long v10 = [(CryptexSession *)self session_work_group];
    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    CFIndex v11 = [(CryptexSession *)self session_work_group];
    dispatch_group_enter(v11);

    [(CryptexSession *)self setExitReason:a3 withCode:a4];
    [(CryptexSession *)self sessionEventNotify:8];
    CFIndex v12 = [(CryptexSession *)self quire_array];
    id v13 = [v12 count];

    if (v13)
    {
      v14 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = [(CryptexSession *)self quire_array];
        id v16 = [v15 count];
        *(_DWORD *)buf = 134217984;
        id v40 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Taking down quires: count %zu", buf, 0xCu);
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v17 = [(CryptexSession *)self quire_array];
      id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v18)
      {
        id v20 = v18;
        uint64_t v21 = *(void *)v35;
        *(void *)&long long v19 = 134217984;
        long long v33 = v19;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v24 = [(CryptexSession *)self log];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              id v40 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "unmounting %p", buf, 0xCu);
            }

            v25 = [(CryptexSession *)self session_work_group];
            dispatch_group_enter(v25);

            sub_10001986C((uint64_t)v7, v23, 1uLL, (uint64_t)self, (uint64_t)sub_10000CD18);
          }
          id v20 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v20);
      }
    }
    else
    {
      [(CryptexSession *)self sessionEventNotify:16];
      [(CryptexSession *)self cancelPeerConnections];
    }
    v26 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Searching for LaunchAgents to remove from the session", buf, 2u);
    }

    v27 = [(CryptexSession *)self cs];
    v28 = cryptex_session_core_get_overrides();

    v29 = [(CryptexSession *)self cs];
    int uid = cryptex_session_core_get_uid();

    sub_100018294((uint64_t)v7, uid);
    v31 = [(CryptexSession *)self session_work_group];
    dispatch_group_leave(v31);

    v32 = +[CryptexSessionList sharedList];
    [v32 removeCryptexSession:self];
  }
}

- (void)sessionAddParseXPC:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    [(CryptexSession *)self setError:22];
    int v10 = *__error();
    CFIndex v11 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v17 = [(CryptexSession *)self error];
      CFIndex v12 = "No payload sent for add.: %{darwin.errno}d";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v12, buf, 8u);
    }
LABEL_10:

    *__error() = v10;
    goto LABEL_15;
  }
  int64_t v6 = xpc_dictionary_get_dictionary(v4, "PAYLOAD");
  if (!v6)
  {
    [(CryptexSession *)self setError:22];
    int v10 = *__error();
    CFIndex v11 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v17 = [(CryptexSession *)self error];
      CFIndex v12 = "Payload format incorrect: %{darwin.errno}d";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v7 = v6;
  int v8 = xpc_dictionary_get_array(v6, "CRYPTEXES");
  if (v8)
  {
    v9 = v8;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10000D0C4;
    applier[3] = &unk_100059550;
    applier[4] = self;
    xpc_array_apply(v8, applier);
  }
  else
  {
    [(CryptexSession *)self setError:22];
    int v13 = *__error();
    v14 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v17 = [(CryptexSession *)self error];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "session_add incorrectly formatted: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v13;
  }

LABEL_15:
}

- (BOOL)sessionAddCptxWithBundleID:(const char *)a3 withType:(int64_t)a4 dmgFd:(int *)a5 trustCacheFD:(int *)a6 manifestFD:(int *)a7 volumeHashFD:(int *)a8 infoPlistFd:(int *)a9 cx1Properties:(id)a10
{
  id v12 = a10;
  int v13 = (void *)cryptex_core_create();
  uint64_t v14 = cryptex_core_set_assets_from_fds();
  if (v14)
  {
    [(CryptexSession *)self setError:v14];
    int v15 = *__error();
    id v16 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v26 = 67109120;
      LODWORD(v27) = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "failed to add cryptex assets: %{darwin.errno}d", (uint8_t *)&v26, 8u);
    }

    *__error() = v15;
  }
  else
  {
    if (v12) {
      cryptex_core_set_cryptex1_properties();
    }
    unsigned int v17 = [(CryptexSession *)self session_work_group];
    dispatch_group_enter(v17);

    id v18 = (void *)cryptex_host_create();
    cryptex_core_attach_host();
    long long v19 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315394;
      v27 = a3;
      __int16 v28 = 2112;
      v29 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Installing cryptex %s to %@", (uint8_t *)&v26, 0x16u);
    }

    id v20 = sub_100016EB4();
    uint64_t v21 = [(CryptexSession *)self cs];
    int uid = cryptex_session_core_get_uid();
    v23 = sub_10003B2B4(v20, 0, self, uid, 0, (uint64_t)sub_10000D874);

    sub_1000183AC(v20, v13, (uint64_t)v23);
    v24 = [(CryptexSession *)self cs];
    cryptex_session_core_append_to_array();
  }
  return v14 == 0;
}

- (void)parseCommandFromMessage:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CryptexSession *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(daemon) delivering to %@", (uint8_t *)&v21, 0xCu);
  }

  xpc_type_t type = xpc_get_type(v6);
  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_4;
  }
  CFIndex v11 = xpc_dictionary_get_value(v6, "COMMAND");

  if (!v11)
  {
    if (xpc_dictionary_get_BOOL(v6, "REMOVE"))
    {
      id v16 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Recieved Peer Remove Message", (uint8_t *)&v21, 2u);
      }

      int v10 = [(CryptexSession *)self peer_array];
      [v10 removeObject:v7];
      goto LABEL_20;
    }
LABEL_4:
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(v6, _xpc_error_key_description);
      int v10 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315138;
        v22 = (CryptexSession *)string;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Recieved error from peer - %s", (uint8_t *)&v21, 0xCu);
      }
    }
    else
    {
      int v10 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100041F5C(v10);
      }
    }
LABEL_20:

    goto LABEL_31;
  }
  int64_t int64 = xpc_dictionary_get_int64(v6, "COMMAND");
  if (int64 == 3)
  {
    unsigned int v17 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: ADD", (uint8_t *)&v21, 0xCu);
    }

    [(CryptexSession *)self sessionAddParseXPC:v6];
  }
  else
  {
    uint64_t v13 = int64;
    if (int64 == 2)
    {
      id v18 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        v22 = self;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: STOP", (uint8_t *)&v21, 0xCu);
      }

      [(CryptexSession *)self sessionStopWithReason:4 exitCode:0];
    }
    else if (int64 == 1)
    {
      uint64_t v14 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        v22 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: START", (uint8_t *)&v21, 0xCu);
      }

      [(CryptexSession *)self sessionStart];
    }
    else
    {
      long long v19 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        sub_100041FA0(v13, v19);
      }
    }
  }
  id v20 = [(CryptexSession *)self session_work_group];
  dispatch_group_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

  [(CryptexSession *)self sessionMessageReply:v6];
LABEL_31:
}

- (void)setupHandler
{
  v3 = [(CryptexSession *)self listener];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000E004;
  handler[3] = &unk_1000595A0;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);

  id v4 = [(CryptexSession *)self listener];
  xpc_connection_activate(v4);

  v5 = [(CryptexSession *)self listener];
  xpc_endpoint_t v6 = xpc_endpoint_create(v5);

  id v7 = [(CryptexSession *)self cs];
  cryptex_session_core_set_endpoint();
}

- (CryptexSession)initWithCore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CryptexSession;
  v5 = [(CryptexSession *)&v17 init];
  if (v5)
  {
    xpc_endpoint_t v6 = sub_100016EB4();
    id v7 = (void *)cryptex_session_core_copy_name();
    [(CryptexSession *)v5 setCs:v4];
    int v8 = +[NSString stringWithUTF8String:v7];
    [(CryptexSession *)v5 setName:v8];

    os_log_t v9 = os_log_create("com.apple.libcryptex", "session_item");
    [(CryptexSession *)v5 setLog:v9];

    int v10 = +[NSMutableArray array];
    [(CryptexSession *)v5 setPeer_array:v10];

    CFIndex v11 = +[NSMutableArray array];
    [(CryptexSession *)v5 setQuire_array:v11];

    [(CryptexSession *)v5 setError:0];
    id v12 = cryptex_queue_create_with_target();
    [(CryptexSession *)v5 setDq:v12];

    uint64_t v13 = [(CryptexSession *)v5 dq];
    xpc_connection_t v14 = xpc_connection_create(0, v13);
    [(CryptexSession *)v5 setListener:v14];

    dispatch_group_t v15 = dispatch_group_create();
    [(CryptexSession *)v5 setSession_work_group:v15];

    [(CryptexSession *)v5 setSession_removal_begun:0];
    free(v7);
  }
  return v5;
}

- (void)sessionEventNotify:(int64_t)a3
{
  v5 = [(CryptexSession *)self cs];
  uint64_t value = cryptex_session_core_get_state();

  [(CryptexSession *)self error];
  xpc_endpoint_t v6 = [(CryptexSession *)self cs];
  int64_t v23 = a3;
  int64_t v7 = cryptex_session_core_transition();

  int v8 = [(CryptexSession *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int64_t v30 = a3;
    __int16 v31 = 2048;
    unint64_t v32 = [(CryptexSession *)self exit_code];
    __int16 v33 = 2048;
    int64_t v34 = [(CryptexSession *)self stop_reason];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sessionNotify event:%lld code: %llu reason: %lld", buf, 0x20u);
  }

  os_log_t v9 = [(CryptexSession *)self peer_array];
  id v10 = [v9 count];

  if (v10)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [(CryptexSession *)self peer_array];
    id v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(obj);
          }
          dispatch_group_t v15 = *(_xpc_connection_s **)(*((void *)&v24 + 1) + 8 * i);
          objc_super v17 = [(CryptexSession *)self cs];
          id v18 = (void *)cryptex_session_core_copy_xpc_object();

          xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_value(v19, "object", v18);
          int64_t v20 = v23;
          if (v7 == 6)
          {
            xpc_dictionary_set_int64(v19, "error_event", [(CryptexSession *)self error]);
            int64_t v20 = 32;
          }
          xpc_dictionary_set_int64(v19, "start", value);
          xpc_dictionary_set_int64(v19, "event", v20);
          xpc_dictionary_set_int64(v19, "reason", [(CryptexSession *)self stop_reason]);
          xpc_dictionary_set_uint64(v19, "code", [(CryptexSession *)self exit_code]);
          xpc_dictionary_set_int64(v19, "state", v7);
          xpc_connection_send_message(v15, v19);
        }
        id v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
    }
  }
}

- (int)activate
{
  id v3 = [(CryptexSession *)self name];
  [v3 UTF8String];

  id v4 = [(CryptexSession *)self cs];
  v5 = (void *)cryptex_session_core_copy_homedir();

  xpc_endpoint_t v6 = [(CryptexSession *)self cs];
  cryptex_session_core_get_attributes();

  int64_t v7 = [(CryptexSession *)self cs];
  cryptex_session_core_get_homedir_size();

  uint64_t v8 = sub_10000FEC0();
  if (v8)
  {
    int v9 = *__error();
    id v10 = [(CryptexSession *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      int64_t v23 = self;
      __int16 v24 = 1024;
      int v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create user for %@: %{darwin.errno}d", buf, 0x12u);
    }

    id v11 = 0;
    *__error() = v9;
  }
  else
  {
    uint64_t v12 = sub_10000FEC8();
    if (v12)
    {
      uint64_t v13 = [(CryptexSession *)self cs];
      cryptex_session_core_set_homedir();

      xpc_connection_t v14 = [(CryptexSession *)self cs];
      cryptex_session_core_set_uid();

      dispatch_group_t v15 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        int64_t v23 = (CryptexSession *)v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created homedir %s", buf, 0xCu);
      }

      uint64_t v8 = sub_10003B434();
      if (v8)
      {
        int v16 = *__error();
        objc_super v17 = [(CryptexSession *)self log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          int64_t v23 = self;
          __int16 v24 = 1024;
          int v25 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to create launchd session for %@: %{darwin.errno}d", buf, 0x12u);
        }

        *__error() = v16;
      }
      else
      {
        sub_1000217AC();
        uint64_t v8 = 0;
      }
      id v11 = (void *)v12;
    }
    else
    {
      int v18 = *__error();
      xpc_object_t v19 = [(CryptexSession *)self log];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = 22;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to find homedir for user.: %{darwin.errno}d", buf, 8u);
      }

      id v11 = 0;
      *__error() = v18;
      uint64_t v8 = 22;
    }
  }
  [(CryptexSession *)self setError:v8];
  [(CryptexSession *)self sessionEventNotify:1];
  int v20 = [(CryptexSession *)self error];
  free(v11);
  free(v5);
  return v20;
}

- (char)copySessionName
{
  v2 = [(CryptexSession *)self cs];
  id v3 = (char *)cryptex_session_core_copy_name();

  return v3;
}

- (void)setExitReason:(int64_t)a3 withCode:(unint64_t)a4
{
  if (![(CryptexSession *)self stop_reason])
  {
    [(CryptexSession *)self setStop_reason:a3];
    [(CryptexSession *)self setExit_code:a4];
  }
}

- (OS_session_core)cs
{
  return self->_cs;
}

- (void)setCs:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
}

- (NSMutableArray)peer_array
{
  return self->_peer_array;
}

- (void)setPeer_array:(id)a3
{
}

- (NSMutableArray)quire_array
{
  return self->_quire_array;
}

- (void)setQuire_array:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)error
{
  return self->_error;
}

- (void)setError:(int)a3
{
  self->_error = a3;
}

- (OS_dispatch_group)session_work_group
{
  return self->_session_work_group;
}

- (void)setSession_work_group:(id)a3
{
}

- (BOOL)session_removal_begun
{
  return self->_session_removal_begun;
}

- (void)setSession_removal_begun:(BOOL)a3
{
  self->_session_removal_begun = a3;
}

- (int64_t)stop_reason
{
  return self->_stop_reason;
}

- (void)setStop_reason:(int64_t)a3
{
  self->_stop_reason = a3;
}

- (unint64_t)exit_code
{
  return self->_exit_code;
}

- (void)setExit_code:(unint64_t)a3
{
  self->_exit_code = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session_work_group, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_quire_array, 0);
  objc_storeStrong((id *)&self->_peer_array, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_log, 0);

  objc_storeStrong((id *)&self->_cs, 0);
}

@end