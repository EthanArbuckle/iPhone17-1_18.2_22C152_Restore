@interface DoAPAudioRelayHub
+ (BOOL)applicationIDIsSiri:(const char *)a3;
+ (BOOL)applicationIDIsSoundSensor:(const char *)a3;
+ (id)instance;
- (BOOL)isXpcConnectedForDeviceType:(int64_t)a3;
- (DoAPAudioRelayHub)init;
- (NSHashTable)doapAudioRelays;
- (OS_xpc_object)siriXpcConnection;
- (OS_xpc_object)soundSensorXpcConnection;
- (OS_xpc_object)xpcServer;
- (id)relayForIdentifier:(id)a3;
- (id)relayWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6;
- (void)handleCheckInMsg:(id)a3 applicationID:(const char *)a4;
- (void)handleConnection:(id)a3;
- (void)handleConnectionEvent:(id)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleMsg:(id)a3;
- (void)handleServerEvent:(id)a3;
- (void)handleStartStreamMsg:(id)a3;
- (void)handleStopStreamMsg:(id)a3;
- (void)removeDoAPAudioRelayObject:(id)a3;
- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4 forClient:(int64_t)a5;
- (void)setSiriXpcConnection:(id)a3;
- (void)setSoundSensorXpcConnection:(id)a3;
@end

@implementation DoAPAudioRelayHub

- (DoAPAudioRelayHub)init
{
  v15.receiver = self;
  v15.super_class = (Class)DoAPAudioRelayHub;
  v2 = [(DoAPAudioRelayHub *)&v15 init];
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000CD070);
    siriXpcConnection = v2->_siriXpcConnection;
    v2->_siriXpcConnection = 0;

    soundSensorXpcConnection = v2->_soundSensorXpcConnection;
    v2->_soundSensorXpcConnection = 0;

    uint64_t v5 = +[NSHashTable weakObjectsHashTable];
    doapAudioRelays = v2->_doapAudioRelays;
    v2->_doapAudioRelays = (NSHashTable *)v5;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.BTLEAudioController.xpc", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    xpcServer = v2->_xpcServer;
    v2->_xpcServer = mach_service;

    v9 = [(DoAPAudioRelayHub *)v2 xpcServer];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002C9CC;
    handler[3] = &unk_1000B1960;
    v10 = v2;
    v14 = v10;
    xpc_connection_set_event_handler(v9, handler);

    v11 = [(DoAPAudioRelayHub *)v10 xpcServer];
    xpc_connection_resume(v11);

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000CD070);
  }
  return v2;
}

+ (id)instance
{
  if (qword_1000CD080 != -1) {
    dispatch_once(&qword_1000CD080, &stru_1000B19F0);
  }
  v2 = (void *)qword_1000CD078;

  return v2;
}

- (id)relayWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [(DoAPAudioRelayHub *)self relayForIdentifier:v10];
  if (v12)
  {
    v13 = (DoAPAudioRelay *)v12;
    v14 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Publishing DoAPAudioRelay %@ already done", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    v13 = [[DoAPAudioRelay alloc] initWithIdentifier:v10 deviceType:a4 properties:v11 codecType:v6 hub:self];
    objc_super v15 = [(DoAPAudioRelayHub *)self doapAudioRelays];
    [v15 addObject:v13];

    v16 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - Publishing DoAPAudioRelay %@", (uint8_t *)&v18, 0xCu);
    }
    [(DoAPAudioRelay *)v13 publish];
  }

  return v13;
}

- (BOOL)isXpcConnectedForDeviceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2)
  {
    v4 = [(DoAPAudioRelayHub *)self siriXpcConnection];
LABEL_6:
    BOOL v7 = v4 != 0;

    return v7;
  }
  int v6 = _os_feature_enabled_impl();
  BOOL v7 = 0;
  if (a3 == 4 && v6)
  {
    v4 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
    goto LABEL_6;
  }
  return v7;
}

- (void)handleServerEvent:(id)a3
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_connection)
  {
    [(DoAPAudioRelayHub *)self handleConnection:v4];
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_10006FE34();
  }
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub XPC connection: %p", buf, 0xCu);
  }
  *(_OWORD *)buf = 0u;
  long long v24 = 0u;
  xpc_connection_get_audit_token();
  int v6 = (void *)xpc_copy_entitlement_for_token();
  BOOL v7 = v6;
  if (!v6)
  {
    string = 0;
    goto LABEL_10;
  }
  if (xpc_dictionary_get_BOOL(v6, "com.apple.bluetooth.doap"))
  {
    string = xpc_dictionary_get_string(v7, "application-identifier");
    if (_os_feature_enabled_impl() && !string)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10007002C();
      }
      goto LABEL_21;
    }
LABEL_10:
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000CD070);
    if (_os_feature_enabled_impl()
      && !+[DoAPAudioRelayHub applicationIDIsSiri:string])
    {
      if (!_os_feature_enabled_impl()
        || !+[DoAPAudioRelayHub applicationIDIsSoundSensor:string])
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006FFC4();
        }
        goto LABEL_18;
      }
      v16 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];

      if (v16)
      {
        v17 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006FF30(v17, self);
        }
        int v18 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
        xpc_connection_set_event_handler(v18, &stru_1000B1A30);

        v19 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
        xpc_connection_cancel(v19);
      }
      [(DoAPAudioRelayHub *)self setSoundSensorXpcConnection:v4];
      v20 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10002D1E0;
      v21[3] = &unk_1000B1960;
      v21[4] = self;
      xpc_connection_set_event_handler(v20, v21);

      v14 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
    }
    else
    {
      v9 = [(DoAPAudioRelayHub *)self siriXpcConnection];

      if (v9)
      {
        id v10 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006FE9C(v10, self);
        }
        id v11 = [(DoAPAudioRelayHub *)self siriXpcConnection];
        xpc_connection_set_event_handler(v11, &stru_1000B1A10);

        uint64_t v12 = [(DoAPAudioRelayHub *)self siriXpcConnection];
        xpc_connection_cancel(v12);
      }
      [(DoAPAudioRelayHub *)self setSiriXpcConnection:v4];
      v13 = [(DoAPAudioRelayHub *)self siriXpcConnection];
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10002D16C;
      handler[3] = &unk_1000B1960;
      void handler[4] = self;
      xpc_connection_set_event_handler(v13, handler);

      v14 = [(DoAPAudioRelayHub *)self siriXpcConnection];
    }
    objc_super v15 = v14;
    xpc_connection_resume(v14);

LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000CD070);
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100070060();
  }
LABEL_21:
}

- (void)handleDisconnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    BOOL v7 = [(DoAPAudioRelayHub *)self siriXpcConnection];
    v8 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
    *(_DWORD *)buf = 134218240;
    v33 = v7;
    __int16 v34 = 2048;
    v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub XPC disconnection - siri: %p, soundSensor: %p", buf, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000CD070);
  v9 = [(DoAPAudioRelayHub *)self siriXpcConnection];

  if (v9)
  {
    [(DoAPAudioRelayHub *)self setSiriXpcConnection:0];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = [(DoAPAudioRelayHub *)self doapAudioRelays];
    id v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v27;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_super v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ((char *)[v15 deviceType] - 1 <= (char *)2) {
            [v15 handleResetStream];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v12);
    }
LABEL_13:

    goto LABEL_26;
  }
  if (_os_feature_enabled_impl())
  {
    v16 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];

    if (v16)
    {
      [(DoAPAudioRelayHub *)self setSoundSensorXpcConnection:0];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = [(DoAPAudioRelayHub *)self doapAudioRelays];
      id v17 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v10);
            }
            v21 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
            if ([v21 deviceType] == (id)4) {
              [v21 handleResetStream];
            }
          }
          id v18 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v18);
      }
      goto LABEL_13;
    }
  }
LABEL_26:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000CD070);
}

- (void)handleConnectionEvent:(id)a3
{
  id v4 = a3;
  xpc_type_t type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(DoAPAudioRelayHub *)self handleMsg:v4];
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v4 == &_xpc_error_connection_invalid)
    {
      [(DoAPAudioRelayHub *)self handleDisconnection:&_xpc_error_connection_invalid];
    }
    else if (v4 == &_xpc_error_connection_interrupted)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100070094();
      }
    }
    else if (v4 == &_xpc_error_termination_imminent)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_1000700C8();
      }
    }
    else
    {
      BOOL v6 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
      if (v4 == &_xpc_error_peer_code_signing_requirement)
      {
        if (v6) {
          sub_1000700FC();
        }
      }
      else if (v6)
      {
        sub_100070130();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100070198();
  }
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v4, "kMsgId");
  BOOL v7 = xpc_dictionary_get_value(v4, "kMsgArgs");
  xpc_connection_get_audit_token();
  v8 = (void *)xpc_copy_entitlement_for_token();
  v9 = v8;
  if (v8)
  {
    id v10 = xpc_dictionary_get_string(v8, "application-identifier");
    if (_os_feature_enabled_impl() && !v10)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100070234();
      }
      goto LABEL_25;
    }
    if (!_os_feature_enabled_impl()
      || +[DoAPAudioRelayHub applicationIDIsSiri:v10])
    {
      id v11 = (void *)qword_1000CD178;
      if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      id v12 = v11;
      uint64_t v13 = [(DoAPAudioRelayHub *)self siriXpcConnection];
      *(_DWORD *)buf = 134218242;
      v21 = v13;
      __int16 v22 = 2080;
      long long v23 = string;
      v14 = "Received Siri XPC message from %p: %s";
      goto LABEL_12;
    }
    if (_os_feature_enabled_impl()
      && +[DoAPAudioRelayHub applicationIDIsSoundSensor:v10])
    {
      id v18 = (void *)qword_1000CD178;
      if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:
        if (!strcmp(string, "CheckIn"))
        {
          [(DoAPAudioRelayHub *)self handleCheckInMsg:v4 applicationID:v10];
        }
        else
        {
          objc_super v15 = +[NSString stringWithFormat:@"handle%sMsg:", string];
          v16 = NSSelectorFromString(v15);

          if (v7) {
            id v17 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          }
          else {
            id v17 = 0;
          }
          [self v16:v17];
        }
        goto LABEL_25;
      }
      id v12 = v18;
      uint64_t v13 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
      *(_DWORD *)buf = 134218242;
      v21 = v13;
      __int16 v22 = 2080;
      long long v23 = string;
      v14 = "Received Sound Sensor XPC message from %p: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);

      goto LABEL_13;
    }
    uint64_t v19 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = v10;
      __int16 v22 = 2048;
      long long v23 = v5;
      __int16 v24 = 2080;
      long long v25 = string;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Received XPC message from unexpected applicationID %s, connection %p, msg ID: %s", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_100070200();
  }
LABEL_25:
}

- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4 forClient:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000CD070);
  if ((unint64_t)(a5 - 1) > 2)
  {
    int v17 = _os_feature_enabled_impl();
    if (a5 == 4)
    {
      if (v17)
      {
        id v18 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];

        if (v18)
        {
          uint64_t v19 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            v21 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
            *(_DWORD *)buf = 134218242;
            long long v25 = v21;
            __int16 v26 = 2112;
            id v27 = v8;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending Sound Sensor XPC message to %p: %@", buf, 0x16u);
          }
          v14 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v14, "kMsgId", (const char *)[v8 UTF8String]);
          if (v9)
          {
            __int16 v22 = (void *)_CFXPCCreateXPCObjectFromCFObject();
            xpc_dictionary_set_value(v14, "kMsgArgs", v22);
          }
          v16 = [(DoAPAudioRelayHub *)self soundSensorXpcConnection];
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    id v10 = [(DoAPAudioRelayHub *)self siriXpcConnection];

    if (v10)
    {
      id v11 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = v11;
        uint64_t v13 = [(DoAPAudioRelayHub *)self siriXpcConnection];
        *(_DWORD *)buf = 134218242;
        long long v25 = v13;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending Siri XPC message to %p: %@", buf, 0x16u);
      }
      v14 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v14, "kMsgId", (const char *)[v8 UTF8String]);
      if (v9)
      {
        objc_super v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v14, "kMsgArgs", v15);
      }
      v16 = [(DoAPAudioRelayHub *)self siriXpcConnection];
LABEL_16:
      long long v23 = (__CFString *)v16;
      xpc_connection_send_message(v16, v14);
LABEL_23:

      goto LABEL_24;
    }
    _os_feature_enabled_impl();
  }
  v14 = (id)qword_1000CD178;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a5 >= 5)
    {
      long long v23 = +[NSString stringWithFormat:@"Invalid (%ld)", a5];
    }
    else
    {
      long long v23 = off_1000B1A50[a5];
    }
    *(_DWORD *)buf = 138412290;
    long long v25 = v23;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - No XPC client is checked in yet for %@", buf, 0xCu);
    goto LABEL_23;
  }
LABEL_24:

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000CD070);
}

- (void)handleCheckInMsg:(id)a3 applicationID:(const char *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(DoAPAudioRelayHub *)self doapAudioRelays];
    *(_DWORD *)buf = 136315394;
    v56 = a4;
    __int16 v57 = 1024;
    LODWORD(v58) = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelayHub - %s checked in. Number of DoAP Audio Relays: %u", buf, 0x12u);
  }
  char v10 = _os_feature_enabled_impl();
  if (!a4 && (v10 & 1) != 0) {
    goto LABEL_55;
  }
  xpc_object_t original = v6;
  v50 = +[NSMutableArray array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v47 = self;
  id obj = [(DoAPAudioRelayHub *)self doapAudioRelays];
  id v11 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  p_vtable = &OBJC_METACLASS___HIDAppleSiriRemoteDevice.vtable;
  if (!v11) {
    goto LABEL_31;
  }
  id v13 = v11;
  uint64_t v14 = *(void *)v52;
  do
  {
    objc_super v15 = 0;
    do
    {
      if (*(void *)v52 != v14) {
        objc_enumerationMutation(obj);
      }
      v16 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v15);
      if (_os_feature_enabled_impl())
      {
        if ([p_vtable + 192 applicationIDIsSiri:a4]
          && (char *)[v16 deviceType] - 1 > (char *)2)
        {
          goto LABEL_24;
        }
        if ([p_vtable + 192 applicationIDIsSoundSensor:a4]) {
          [v16 deviceType];
        }
        int v17 = (id)qword_1000CD178;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          unint64_t v27 = (unint64_t)[v16 deviceType];
          if (v27 >= 5)
          {
            long long v28 = +[NSString stringWithFormat:@"Invalid (%ld)", v27];
          }
          else
          {
            long long v28 = off_1000B1A50[v27];
          }
          *(_DWORD *)buf = 136315394;
          v56 = a4;
          __int16 v57 = 2112;
          v58 = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "DoAPAudioRelayHub - skipping relay. applicationID %s, deviceType %@", buf, 0x16u);
        }
      }
      id v18 = +[NSMutableDictionary dictionary];
      uint64_t v19 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v16 deviceType]);
      [v18 setValue:v19 forKey:@"kMsgDeviceType"];

      v20 = [v16 hidProperties];

      if (v20)
      {
        v21 = [v16 hidProperties];
        [v21 objectForKeyedSubscript:@"ProductID"];
        v23 = __int16 v22 = p_vtable;
        [v18 setValue:v23 forKey:@"kMsgPidNum"];

        p_vtable = v22;
      }
      __int16 v24 = [v16 identifier];

      if (v24)
      {
        long long v25 = [v16 identifier];
        [v18 setValue:v25 forKey:@"kMsgArgIdentifier"];
      }
      if ([v16 codec])
      {
        __int16 v26 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v16 codec]);
        [v18 setValue:v26 forKey:@"kMsgCodecType"];
      }
      [v50 addObject:v18];

LABEL_24:
      objc_super v15 = (char *)v15 + 1;
    }
    while (v13 != v15);
    id v29 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    id v13 = v29;
  }
  while (v29);
LABEL_31:

  id v6 = original;
  reply = (__CFString *)xpc_dictionary_create_reply(original);
  v31 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_dictionary_set_value(reply, "kMsgArgs", v31);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000CD070);
  if (!_os_feature_enabled_impl())
  {
    v37 = [(DoAPAudioRelayHub *)v47 siriXpcConnection];

    v38 = (void *)qword_1000CD178;
    if (!v37)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_1000702D0();
      }
      goto LABEL_54;
    }
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      v40 = [(DoAPAudioRelayHub *)v47 siriXpcConnection];
      *(_DWORD *)buf = 134218242;
      v56 = v40;
      __int16 v57 = 2112;
      v58 = reply;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Sending Siri CheckIn reply to %p: %@", buf, 0x16u);
    }
    v36 = v47;
LABEL_41:
    v41 = [(DoAPAudioRelayHub *)v36 siriXpcConnection];
LABEL_42:
    v42 = v41;
    xpc_connection_send_message(v41, reply);

    goto LABEL_54;
  }
  if (![p_vtable + 192 applicationIDIsSiri:a4])
  {
    if (![p_vtable + 192 applicationIDIsSoundSensor:a4]) {
      goto LABEL_54;
    }
    v43 = [(DoAPAudioRelayHub *)v47 soundSensorXpcConnection];

    v44 = (void *)qword_1000CD178;
    if (!v43)
    {
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10007029C();
      }
      goto LABEL_54;
    }
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v45 = v44;
      v46 = [(DoAPAudioRelayHub *)v47 soundSensorXpcConnection];
      *(_DWORD *)buf = 134218242;
      v56 = v46;
      __int16 v57 = 2112;
      v58 = reply;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Sending Sound Sensor CheckIn reply to %p: %@", buf, 0x16u);
    }
    v41 = [(DoAPAudioRelayHub *)v47 soundSensorXpcConnection];
    goto LABEL_42;
  }
  v32 = [(DoAPAudioRelayHub *)v47 siriXpcConnection];

  v33 = (void *)qword_1000CD178;
  if (v32)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v34 = v33;
      v35 = [(DoAPAudioRelayHub *)v47 siriXpcConnection];
      *(_DWORD *)buf = 134218242;
      v56 = v35;
      __int16 v57 = 2112;
      v58 = reply;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Sending Siri CheckIn reply to %p: %@", buf, 0x16u);
    }
    v36 = v47;
    goto LABEL_41;
  }
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100070268();
  }
LABEL_54:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000CD070);

LABEL_55:
}

- (void)handleStartStreamMsg:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kMsgArgIdentifier"];
  uint64_t v5 = [(DoAPAudioRelayHub *)self relayForIdentifier:v4];
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100070304();
  }
  [v5 handleStartStream];
}

- (void)handleStopStreamMsg:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kMsgArgIdentifier"];
  uint64_t v5 = [(DoAPAudioRelayHub *)self relayForIdentifier:v4];
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100070344();
  }
  [v5 handleStopStream];
}

- (id)relayForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(DoAPAudioRelayHub *)self doapAudioRelays];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        char v10 = [v9 identifier];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeDoAPAudioRelayObject:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
    sub_100070384();
  }
  uint64_t v5 = [(DoAPAudioRelayHub *)self doapAudioRelays];
  [v5 removeObject:v4];
}

+ (BOOL)applicationIDIsSiri:(const char *)a3
{
  if (!a3) {
    return 0;
  }
  if (!strcmp(a3, "com.apple.corespeechd")) {
    return 1;
  }
  return strcmp(a3, "com.apple.MobileSMS") == 0;
}

+ (BOOL)applicationIDIsSoundSensor:(const char *)a3
{
  return a3 && strcmp(a3, "com.apple.SensingPredictXPCService") == 0;
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (OS_xpc_object)siriXpcConnection
{
  return self->_siriXpcConnection;
}

- (void)setSiriXpcConnection:(id)a3
{
}

- (OS_xpc_object)soundSensorXpcConnection
{
  return self->_soundSensorXpcConnection;
}

- (void)setSoundSensorXpcConnection:(id)a3
{
}

- (NSHashTable)doapAudioRelays
{
  return self->_doapAudioRelays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doapAudioRelays, 0);
  objc_storeStrong((id *)&self->_soundSensorXpcConnection, 0);
  objc_storeStrong((id *)&self->_siriXpcConnection, 0);

  objc_storeStrong((id *)&self->_xpcServer, 0);
}

@end