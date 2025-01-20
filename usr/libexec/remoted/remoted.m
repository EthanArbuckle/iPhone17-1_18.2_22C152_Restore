void sub_100001E60(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  xpc_type_t type;
  unsigned int v13;
  const char *string;
  NSObject *v15;
  id v16;
  unsigned int v17;
  id v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *reply;
  xpc_type_t v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  NSObject *v31;
  id v32;
  dispatch_time_t v33;
  unsigned int v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  unsigned char *v47;
  NSObject *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t uint64;
  NSObject *v53;
  id v54;
  id v55;
  BOOL v56;
  uint64_t v57;
  void *v58;
  id v59;
  NSObject *v60;
  NSObject *v61;
  const char *v62;
  id v63;
  BOOL v64;
  NSObject *v65;
  id v66;
  unsigned int v67;
  BOOL v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  id v75;
  id v76;
  uint64_t v77;
  void v78[5];
  void v79[5];
  void applier[5];
  void v81[5];
  void v82[5];
  void block[5];
  uint8_t buf[4];
  id v85;
  __int16 v86;
  const char *v87;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  v5 = [*(id *)(a1 + 32) connection];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [*(id *)(a1 + 32) connection];
    v8 = *(void **)(a1 + 40);

    if (v7 != v8)
    {
      v9 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *v4;
        *(_DWORD *)buf = 138543362;
        v85 = v10;
        v11 = "%{public}@> ignore message from previous connection";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
        goto LABEL_97;
      }
      goto LABEL_97;
    }
  }
  type = xpc_get_type(v3);
  v13 = [*v4 state];
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v13 == 5)
    {
      v15 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        v16 = *v4;
        *(_DWORD *)buf = 138543362;
        v85 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@> Device connection interrupted, device already gone, giving up", buf, 0xCu);
      }
    }
    else
    {
      if ([*v4 state] != 2)
      {
        v21 = qword_10005C018;
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *v4;
          *(_DWORD *)buf = 138543362;
          v85 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@> Device must renegotiate TLS", buf, 0xCu);
        }
        *((unsigned char *)*v4 + 59) = 0;
        [*v4 refreshServiceListeners];
        if (*((unsigned char *)*v4 + 57))
        {
          v23 = qword_10005C018;
          if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *v4;
            *(_DWORD *)buf = 138543362;
            v85 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@> Device connection interrupted. Proceed to reset", buf, 0xCu);
          }
          [*v4 disconnect];
          [*v4 setState:0];
          [*v4 attach];
          goto LABEL_97;
        }
      }
      v31 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *v4;
        *(_DWORD *)buf = 138543362;
        v85 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@> Device connection interrupted", buf, 0xCu);
      }
      if ([*v4 state] == 1)
      {
        v33 = dispatch_time(0, 1000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000095B4;
        block[3] = &unk_1000550D0;
        block[4] = *v4;
        dispatch_after(v33, (dispatch_queue_t)qword_10005BCF0, block);
      }
      else
      {
        v34 = [*v4 state];
        v35 = *v4;
        if (v34 == 2)
        {
          [v35 setState:0];
          v36 = qword_10005BCF0;
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_1000095BC;
          v82[3] = &unk_1000550D0;
          v82[4] = *v4;
          v37 = v82;
        }
        else
        {
          [v35 setState:4];
          v36 = qword_10005BCF0;
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_1000095C4;
          v81[3] = &unk_1000550D0;
          v81[4] = *v4;
          v37 = v81;
        }
        dispatch_async(v36, v37);
      }
    }
    v44 = [*v4 connection];

    if (v44)
    {
      v45 = [*v4 connection];
      xpc_remote_connection_cancel();

      [*v4 setConnection:0];
    }
    goto LABEL_97;
  }
  if (v13 == 1)
  {
    string = xpc_dictionary_get_string(v3, "MessageType");
    [*v4 setMessaging_protocol_version:xpc_dictionary_get_uint64(v3, "MessagingProtocolVersion")];
    if (objc_msgSend(*v4, "messaging_protocol_version") && (!string || strcmp(string, "Handshake")))
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
        sub_100034018();
      }
      goto LABEL_96;
    }
    [*v4 setUuid:xpc_dictionary_get_uuid(v3, "UUID")];
    v25 = xpc_dictionary_get_value(v3, "Properties");
    reply = v25;
    if (v25)
    {
      v27 = xpc_get_type(v25);
      v28 = qword_10005C018;
      if (v27 != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
          sub_100033FE4();
        }

        goto LABEL_96;
      }
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        v38 = *v4;
        *(_DWORD *)buf = 138543362;
        v85 = v38;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@> Updating existing properties dictionary", buf, 0xCu);
      }
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000095CC;
      applier[3] = &unk_100055148;
      applier[4] = *v4;
      xpc_dictionary_apply(reply, applier);
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
      {
        v39 = [*v4 properties];
        v40 = (void *)xpc_copy_clean_description();

        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG)) {
          sub_100033F74();
        }
        free(v40);
        v41 = [*v4 public_properties];
        v42 = (void *)xpc_copy_clean_description();

        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG)) {
          sub_100033F04();
        }
        free(v42);
      }
    }
    v43 = xpc_dictionary_get_value(v3, "Services");
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_100009684;
    v79[3] = &unk_100055148;
    v79[4] = *v4;
    xpc_dictionary_apply(v43, v79);
    if ((unint64_t)objc_msgSend(*v4, "messaging_protocol_version") < 4
      || ([*v4 tlsEnabled] & 1) != 0)
    {
      [*v4 handshakeCompleted:0];
LABEL_67:

LABEL_90:
      goto LABEL_97;
    }
    [*v4 setState:2];
    v46 = [*v4 negotiateTls];
    v47 = *v4;
    if (v46)
    {
      v47[58] = 1;
      v48 = qword_10005C018;
      if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      v49 = *v4;
      *(_DWORD *)buf = 138543362;
      v85 = v49;
      v50 = "%{public}@> Requested TLS.";
    }
    else
    {
      v47[58] = 0;
      v48 = qword_10005C018;
      if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_67;
      }
      v55 = *v4;
      *(_DWORD *)buf = 138543362;
      v85 = v55;
      v50 = "%{public}@> Declined TLS.";
    }
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
    goto LABEL_67;
  }
  v17 = [*v4 state];
  v18 = *v4;
  if (v17 != 2)
  {
    if ([v18 state] != 3) {
      sub_100034428(&v77, buf, v4);
    }
    if (objc_msgSend(*v4, "messaging_protocol_version"))
    {
      v29 = xpc_dictionary_get_string(v3, "MessageType");
      if (v29)
      {
        v30 = v29;
        if (!strcmp(v29, "Heartbeat"))
        {
          if ((xpc_dictionary_expects_reply() & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
              sub_1000341B8();
            }
            goto LABEL_96;
          }
          uint64 = xpc_dictionary_get_uint64(v3, "SequenceNumber");
          v53 = qword_10005C018;
          if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
          {
            v54 = *v4;
            *(_DWORD *)buf = 138543618;
            v85 = v54;
            v86 = 2048;
            v87 = (const char *)uint64;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@> Responding to heartbeat request with sequence number %llu", buf, 0x16u);
          }
          *((void *)*v4 + 11) = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
          ++*((void *)*v4 + 13);
          reply = xpc_dictionary_create_reply(v3);
          xpc_dictionary_set_uint64(reply, "SequenceNumber", uint64);
        }
        else
        {
          if (!strcmp(v30, "Reset"))
          {
            reply = [*v4 handleReset:v3];
            if (reply) {
              goto LABEL_89;
            }
            goto LABEL_96;
          }
          if (!strcmp(v30, "ResetGoahead")) {
            goto LABEL_79;
          }
          if (!strcmp(v30, "Timesync"))
          {
            if ((xpc_dictionary_expects_reply() & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
                sub_1000342F0();
              }
              goto LABEL_96;
            }
            v70 = xpc_dictionary_get_value(v3, "TimesyncPayload");
            if (!v70)
            {
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
                sub_100034220();
              }
              goto LABEL_96;
            }
            v71 = v70;
            v72 = sub_10000F1F4(v70, (void *)qword_10005C018);
            if (!v72)
            {
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
                sub_100034288();
              }

              goto LABEL_96;
            }
            v73 = (void *)v72;
            reply = xpc_dictionary_create_reply(v3);
            xpc_dictionary_set_value(reply, "TimesyncPayload", v73);
          }
          else
          {
            if (strcmp(v30, "Goodbye"))
            {
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
                sub_1000343C0();
              }
              goto LABEL_96;
            }
            if ((xpc_dictionary_expects_reply() & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
                sub_100034358();
              }
              goto LABEL_96;
            }
            reply = xpc_dictionary_create_reply(v3);
            xpc_dictionary_set_string(reply, "Result", "Ok");
            v78[0] = _NSConcreteStackBlock;
            v78[1] = 3221225472;
            v78[2] = sub_1000098B4;
            v78[3] = &unk_1000550D0;
            v78[4] = *v4;
            dispatch_async((dispatch_queue_t)qword_10005BCF0, v78);
          }
        }
        if (!reply) {
          goto LABEL_97;
        }
        goto LABEL_89;
      }
      if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
        goto LABEL_96;
      }
LABEL_69:
      sub_1000340E8();
      goto LABEL_96;
    }
    if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      goto LABEL_96;
    }
LABEL_53:
    sub_100034080();
    goto LABEL_96;
  }
  if (!objc_msgSend(v18, "messaging_protocol_version"))
  {
    if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      goto LABEL_96;
    }
    goto LABEL_53;
  }
  v19 = xpc_dictionary_get_string(v3, "MessageType");
  if (!v19)
  {
    if (!os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      goto LABEL_96;
    }
    goto LABEL_69;
  }
  v20 = v19;
  if (!strcmp(v19, "Reset"))
  {
    v51 = [*v4 handleReset:v3];
    if (v51)
    {
      reply = (void *)v51;
LABEL_89:
      xpc_dictionary_send_reply();
      goto LABEL_90;
    }
LABEL_96:
    [*v4 disconnect];
    goto LABEL_97;
  }
  if (!strcmp(v20, "ResetGoahead"))
  {
LABEL_79:
    [*v4 handleResetGoAhead];
    goto LABEL_97;
  }
  if (strcmp(v20, "StartTls"))
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_100034150();
    }
    goto LABEL_96;
  }
  v56 = xpc_dictionary_get_BOOL(v3, "YesNo");
  v57 = xpc_dictionary_get_uint64(v3, "TlsPolicy");
  if (v57)
  {
    v58 = (void *)qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      v59 = *v4;
      v60 = v58;
      *(_DWORD *)buf = 138543618;
      v85 = v59;
      v86 = 2082;
      v87 = sub_100018FBC(v57);
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}@> Peer TLS requirement: %{public}s", buf, 0x16u);
    }
  }
  v61 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
  {
    v62 = "declined";
    v63 = *v4;
    if (v56) {
      v62 = "requested";
    }
    *(_DWORD *)buf = 138543618;
    v85 = v63;
    v86 = 2080;
    v87 = v62;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}@> Peer %s TLS.", buf, 0x16u);
  }
  if (*((unsigned char *)*v4 + 58)) {
    v64 = v56;
  }
  else {
    v64 = 0;
  }
  if (v64)
  {
    v65 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      v66 = *v4;
      *(_DWORD *)buf = 138543362;
      v85 = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}@> Both sides requested TLS.", buf, 0xCu);
    }
    *((unsigned char *)*v4 + 59) = 1;
    v67 = [*v4 isHost];
    v9 = qword_10005C018;
    v68 = os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT);
    if (!v67)
    {
      if (!v68) {
        goto LABEL_97;
      }
      v76 = *v4;
      *(_DWORD *)buf = 138543362;
      v85 = v76;
      v11 = "%{public}@> Wait for peer to reset connection to enable TLS.";
      goto LABEL_5;
    }
    if (v68)
    {
      v69 = *v4;
      *(_DWORD *)buf = 138543362;
      v85 = v69;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@> Resetting connection to enable TLS.", buf, 0xCu);
    }
    [*v4 _resetNow];
  }
  else
  {
    *((unsigned char *)*v4 + 59) = 0;
    v74 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      v75 = *v4;
      *(_DWORD *)buf = 138543362;
      v85 = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%{public}@> Not enabling TLS.", buf, 0xCu);
    }
    [*v4 handshakeCompleted:v57];
  }
LABEL_97:
}

id sub_100002F80(uint64_t a1, uint64_t a2, int a3)
{
  v4 = *(void **)(a1 + 32);
  if (a3)
  {
    [v4 setBrowser:0];
    id result = [*(id *)(a1 + 32) dontRestartBrowse];
    if ((result & 1) == 0)
    {
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      return [v6 startBrowsing:v7];
    }
  }
  else
  {
    return [v4 fire:a2];
  }
  return result;
}

uint64_t sub_1000032A8()
{
  os_log_t v0 = os_log_create("com.apple.RemoteServiceDiscovery", "rsd_events");
  v1 = (void *)qword_10005BC80;
  qword_10005BC80 = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_10005BC90;
  qword_10005BC90 = v2;

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.rsd_events", 0);
  v5 = (void *)qword_10005BC78;
  qword_10005BC78 = (uint64_t)v4;

  uint64_t v6 = xpc_event_publisher_create();
  uint64_t v7 = (void *)qword_10005BC88;
  qword_10005BC88 = v6;

  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();

  return xpc_event_publisher_activate();
}

void sub_10000337C(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  uint64_t v6 = a4;
  if (a2 == 1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [[(id)qword_10005BC90 copy];
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v17 token] == (id)a3)
          {
            v18 = (void *)qword_10005BC80;
            if (os_log_type_enabled((os_log_t)qword_10005BC80, OS_LOG_TYPE_INFO))
            {
              v19 = v18;
              id v20 = [v17 name];
              *(_DWORD *)v30 = 136446210;
              *(void *)&v30[4] = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removing RSD events registration: %{public}s", v30, 0xCu);
            }
            [v17 cancelBrowsing];
            [(id)qword_10005BC90 removeObject:v17];
            goto LABEL_24;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_24:
  }
  else if (!a2)
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v36 = v7;
    long long v37 = v7;
    long long v34 = v7;
    long long v35 = v7;
    long long v32 = v7;
    long long v33 = v7;
    *(_OWORD *)v30 = v7;
    long long v31 = v7;
    if ((xpc_get_event_name() & 1) == 0) {
      __strlcpy_chk();
    }
    v8 = [[RSDEventRegistration alloc] initWithToken:a3 name:v30];
    [(id)qword_10005BC90 addObject:v8];
    [(RSDEventRegistration *)v8 startBrowsing:v6];
    v9 = qword_10005BC80;
    if (os_log_type_enabled((os_log_t)qword_10005BC80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v27 = v30;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered for RSD events: %{public}s", buf, 0xCu);
    }
    if (os_log_type_enabled((os_log_t)qword_10005BC80, OS_LOG_TYPE_INFO))
    {
      v10 = xpc_copy_description(v6);
      v11 = qword_10005BC80;
      if (os_log_type_enabled((os_log_t)qword_10005BC80, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        v27 = v30;
        __int16 v28 = 2082;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", buf, 0x16u);
      }
      free(v10);
    }
  }
}

void sub_100003674(id a1, int a2)
{
  v3 = qword_10005BC80;
  if (os_log_type_enabled((os_log_t)qword_10005BC80, OS_LOG_TYPE_ERROR)) {
    sub_100032C5C(a2, v3);
  }
}

uint64_t sub_1000036BC()
{
  return _os_log_send_and_compose_impl();
}

BOOL sub_1000036E0(void *a1)
{
  v1 = a1;
  if (!objc_opt_class())
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      sub_100032CD4(v1);
    }
    goto LABEL_14;
  }
  id v8 = 0;
  uint64_t v2 = +[SecureConfigParameters loadContentsAndReturnError:&v8];
  id v3 = v8;
  if (!v2)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100032D18((uint64_t)v3, v1);
    }

    goto LABEL_14;
  }
  CFBooleanRef v4 = (const __CFBoolean *)[v2 research_disableAppleInfrastructureEnforcement];
  CFBooleanRef v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v10 = @"com.apple.pcc.research.disableAppleInfrastructureEnforcement";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SecureConfig parameter '%{public}@' not present", buf, 0xCu);
    }

LABEL_14:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (sub_100011B1C(v4))
  {
    BOOL v6 = CFBooleanGetValue(v5) != 0;
  }
  else
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100032D90(v1);
    }
    BOOL v6 = 0;
  }

  CFRelease(v5);
LABEL_19:

  return v6;
}

void sub_100003880(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_1000038A4(void *a1)
{
  id v2 = a1;
  objc_storeStrong((id *)&qword_10005BC98, a1);
  id v3 = (void *)qword_10005BCA0;
  qword_10005BCA0 = (uint64_t)v2;
  id v8 = v2;

  os_log_t v4 = os_log_create("com.apple.RemoteServiceDiscovery", "ControlInterface");
  CFBooleanRef v5 = (void *)qword_10005BCA8;
  qword_10005BCA8 = (uint64_t)v4;

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted.control", (dispatch_queue_t)qword_10005BC98, 1uLL);
  long long v7 = (void *)qword_10005BCB0;
  qword_10005BCB0 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_10005BCB0, &stru_100054EE0);
  xpc_connection_activate((xpc_connection_t)qword_10005BCB0);
}

void sub_10000397C(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003A38;
    handler[3] = &unk_100054F08;
    id v3 = v2;
    CFBooleanRef v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_10005BC98);
    xpc_connection_activate(v3);
  }
}

void sub_100003A38(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
LABEL_21:
    xpc_connection_cancel(v4);
    goto LABEL_40;
  }
  if ((xpc_dictionary_expects_reply() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_ERROR)) {
      sub_1000330BC();
    }
    goto LABEL_21;
  }
  string = xpc_dictionary_get_string(v5, "cmd");
  if ((os_variant_has_internal_content() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_ERROR)) {
      sub_100033088();
    }
    goto LABEL_26;
  }
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_ERROR)) {
      sub_100032EC0();
    }
    goto LABEL_26;
  }
  if (!strcmp(string, "attach_loopback"))
  {
    id v10 = v5;
    sub_10002E784();
LABEL_37:
    reply = xpc_dictionary_create_reply(v10);

    xpc_dictionary_set_string(reply, "result", "OK");
    goto LABEL_38;
  }
  if (!strcmp(string, "connect_loopback"))
  {
    id v10 = v5;
    sub_10002E900();
    goto LABEL_37;
  }
  if (!strcmp(string, "detach_loopback"))
  {
    id v10 = v5;
    sub_10002ED70();
    goto LABEL_37;
  }
  if (!strcmp(string, "suspend_loopback"))
  {
    id v10 = v5;
    sub_10002EEC4();
    goto LABEL_37;
  }
  if (!strcmp(string, "resume_loopback"))
  {
    id v10 = v5;
    sub_10002F014();
    goto LABEL_37;
  }
  if (!strcmp(string, "reset_loopback"))
  {
    id v10 = v5;
    sub_10002F160();
    goto LABEL_37;
  }
  if (!strcmp(string, "enable_bonjour"))
  {
    v11 = v5;
    char v12 = 0;
LABEL_42:
    uint64_t v8 = sub_100003F90(v11, v12);
    goto LABEL_27;
  }
  if (!strcmp(string, "disable_bonjour"))
  {
    id v13 = qword_10005BCA0;
    id v10 = v5;
    id v14 = &stru_100054F48;
LABEL_36:
    dispatch_async(v13, v14);
    goto LABEL_37;
  }
  if (!strcmp(string, "enable_bonjour_loopback"))
  {
    v11 = v5;
    char v12 = 1;
    goto LABEL_42;
  }
  if (!strcmp(string, "enable_network_peer"))
  {
    id v18 = v5;
    v19 = xpc_dictionary_get_string(v18, "arg");
    if (!v19)
    {
LABEL_55:
      reply = sub_100020794(v18);
      goto LABEL_56;
    }
    *(void *)&long long block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 3221225472;
    __int16 v28 = sub_1000040C4;
    v29 = &unk_100054F88;
    *(void *)&long long v30 = strdup(v19);
    id v20 = qword_10005BCA0;
LABEL_45:
    dispatch_async(v20, &block);
    reply = xpc_dictionary_create_reply(v18);
    xpc_dictionary_set_string(reply, "result", "OK");
LABEL_56:

    goto LABEL_38;
  }
  if (!strcmp(string, "disable_network_peer"))
  {
    id v13 = qword_10005BCA0;
    id v10 = v5;
    id v14 = &stru_100054FA8;
    goto LABEL_36;
  }
  if (!strcmp(string, "connect_network_peer"))
  {
    id v18 = v5;
    long long v21 = xpc_dictionary_get_string(v18, "arg");
    long long v26 = 0uLL;
    int v22 = inet_pton(30, v21, &v26);
    if (v22 == -1)
    {
      long long v23 = __error();
      long long v24 = qword_10005BCA8;
      if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_ERROR)) {
        sub_100032FD8(v23, v24);
      }
      goto LABEL_55;
    }
    if (v22 != 1)
    {
      if (v22) {
        sub_100032EF4(&v25, &block);
      }
      if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_ERROR)) {
        sub_100032FA4();
      }
      goto LABEL_55;
    }
    id v20 = qword_10005BCA0;
    *(void *)&long long block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 3221225472;
    __int16 v28 = sub_10000419C;
    v29 = &unk_100054FC8;
    long long v30 = v26;
    goto LABEL_45;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_ERROR)) {
    sub_100033054();
  }
LABEL_26:
  uint64_t v8 = sub_100020794(v5);
LABEL_27:
  reply = (void *)v8;
LABEL_38:
  id v15 = reply;
  if (!v15) {
    sub_100032E14(&v26, &block);
  }
  v16 = v15;

  xpc_dictionary_get_remote_connection(v16);
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v16);

LABEL_40:
}

id sub_100003F90(void *a1, char a2)
{
  id v3 = a1;
  string = xpc_dictionary_get_string(v3, "arg");
  if (string)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100004084;
    v7[3] = &unk_100054F68;
    v7[4] = strdup(string);
    char v8 = a2;
    dispatch_async((dispatch_queue_t)qword_10005BCA0, v7);
    reply = xpc_dictionary_create_reply(v3);
    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    reply = sub_100020794(v3);
  }

  return reply;
}

void sub_100004084(uint64_t a1)
{
  sub_10002AE48(*(const char **)(a1 + 32), *(unsigned char *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);

  free(v2);
}

void sub_1000040C4(uint64_t a1)
{
  BOOL v2 = sub_10001DC40(*(const char **)(a1 + 32));
  id v3 = qword_10005BCA8;
  if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v4 = "failed";
    if (v2) {
      os_log_t v4 = "succeeded";
    }
    int v5 = 136446210;
    BOOL v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "network peer enable %{public}s", (uint8_t *)&v5, 0xCu);
  }
  free(*(void **)(a1 + 32));
}

void sub_10000419C(uint64_t a1)
{
  BOOL v1 = sub_10001E378((void *)(a1 + 32));
  BOOL v2 = qword_10005BCA8;
  if (os_log_type_enabled((os_log_t)qword_10005BCA8, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = "failed";
    if (v1) {
      id v3 = "succeeded";
    }
    int v4 = 136446210;
    int v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "network peer connect %{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000425C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100004818()
{
  if (qword_10005BCD8 != -1) {
    dispatch_once(&qword_10005BCD8, &stru_100055008);
  }
  uint64_t v0 = (void *)qword_10005BCD0;

  return v0;
}

NSObject *sub_100004B48(const char *a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v5 = if_nametoindex(a1);
  if (v5)
  {
    unsigned int v6 = v5;
    long long v7 = sub_10002CF20(v5);
    char v8 = v7;
    if (v7)
    {
      uint64_t v9 = nw_parameters_copy_required_interface(v7);
      name = nw_interface_get_name(v9);
      if (!strncmp(name, a1, 0x10uLL))
      {
        nw_parameters_set_local_only(v8, 0);
        nw_parameters_set_required_interface_type(v8, nw_interface_type_other);
        *a3 = v6;
        char v12 = v8;
        goto LABEL_14;
      }
      v11 = sub_100004818();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_1000331F4();
      }
    }
    else
    {
      uint64_t v9 = sub_100004818();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_100033158();
      }
    }
    char v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  char v8 = sub_100004818();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10003318C();
  }
  char v12 = 0;
LABEL_15:

  return v12;
}

void sub_100004F50(void *a1)
{
  id v1 = a1;
  BOOL v2 = sub_100004818();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initializing CoreDevice backend", v9, 2u);
  }

  id v3 = (void *)qword_10005BCC0;
  qword_10005BCC0 = (uint64_t)v1;
  id v4 = v1;

  uint64_t v5 = objc_opt_new();
  unsigned int v6 = (void *)qword_10005BCB8;
  qword_10005BCB8 = v5;

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted.coredevice", (dispatch_queue_t)qword_10005BCC0, 1uLL);
  char v8 = (void *)qword_10005BCC8;
  qword_10005BCC8 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_10005BCC8, &stru_100054FE8);
  xpc_connection_activate((xpc_connection_t)qword_10005BCC8);
}

void sub_10000503C(id a1, OS_xpc_object *a2)
{
  BOOL v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000050F8;
    handler[3] = &unk_100054F08;
    id v3 = v2;
    uint64_t v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_10005BCC0);
    xpc_connection_activate(v3);
  }
}

void sub_1000050F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    sub_100005C70(v4);
    goto LABEL_102;
  }
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v7;
  *(_OWORD *)&buf[16] = v7;
  xpc_connection_get_audit_token();
  char v8 = (void *)xpc_copy_entitlement_for_token();
  BOOL v9 = v8 == 0;

  if (v9)
  {
    id v13 = sub_100004818();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000332EC();
    }
    goto LABEL_14;
  }
  if ((xpc_dictionary_expects_reply() & 1) == 0)
  {
    id v13 = sub_100004818();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000334C0();
    }
LABEL_14:

    sub_100005C70(v4);
    goto LABEL_102;
  }
  string = xpc_dictionary_get_string(v5, "cmd");
  v11 = string;
  if (!string)
  {
    char v12 = sub_100004818();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100032EC0();
    }
    goto LABEL_20;
  }
  if (!strcmp(string, "add_listener_device"))
  {
    __s2 = (char *)v4;
    id v15 = v5;
    v16 = sub_100004818();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "add server listener start", buf, 2u);
    }

    v17 = xpc_dictionary_get_string(v15, "interface_name");
    id v18 = v17;
    if (v17)
    {
      unsigned int v70 = 0;
      v19 = sub_100004B48(v17, 1, &v70);
      id v20 = v19;
      if (v19 && (uint64_t v21 = v70) != 0)
      {
        int v22 = nw_listener_create(v19);
        if (v22)
        {
          uint64_t uint64 = xpc_dictionary_get_uint64(v15, "connect_timeout");
          long long v24 = sub_100004818();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            *(void *)&uint8_t buf[4] = v18;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Creating new listener device for interface: %{public}s", buf, 0xCu);
          }

          uint64_t v25 = [[RSDRemoteCoreDeviceDevice alloc] initWithServerListener:v22 controlPeer:__s2 interfaceName:v18 interfaceIndex:v21 connectTimeout:uint64];
          long long v26 = v25;
          if (v25 && [(RSDRemoteDevice *)v25 device_name])
          {
            [v26 attach];
            v27 = sub_100004818();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              id v28 = [v26 device_name];
              *(_DWORD *)buf = 136446466;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&buf[12] = 2082;
              *(void *)&buf[14] = v18;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Attached new listener device: %{public}s for interface: %{public}s", buf, 0x16u);
            }

            *(void *)&long long handler = _NSConcreteStackBlock;
            *((void *)&handler + 1) = 3221225472;
            *(void *)&long long v72 = sub_100005E60;
            *((void *)&v72 + 1) = &unk_100055030;
            id v29 = v26;
            *(void *)&long long v73 = v29;
            nw_listener_set_new_connection_handler(v22, &handler);
            *(void *)&long long v75 = 0;
            *((void *)&v75 + 1) = &v75;
            uint64_t v76 = 0x2020000000;
            char v77 = 1;
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_100006004;
            *(void *)&buf[24] = &unk_100055058;
            long long v30 = v22;
            v79 = v30;
            v82 = &v75;
            id v80 = v29;
            id v81 = v15;
            nw_listener_set_state_changed_handler(v30, buf);
            nw_listener_set_queue(v30, (dispatch_queue_t)qword_10005BCC0);
            nw_listener_start(v30);
            long long v31 = sub_100004818();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v69 = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "add server listener done", v69, 2u);
            }

            _Block_object_dispose(&v75, 8);
            long long v32 = (void *)v73;
          }
          else
          {
            v62 = sub_100004818();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
              sub_100033388();
            }

            long long v32 = sub_100005E14(v15, "ERROR");
            xpc_dictionary_send_reply();
          }
        }
        else
        {
          v64 = sub_100004818();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT)) {
            sub_100033354();
          }

          long long v26 = sub_100005E14(v15, "ERROR");
          xpc_dictionary_send_reply();
        }
      }
      else
      {
        v55 = sub_100004818();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
          sub_100033158();
        }

        int v22 = sub_100005E14(v15, "ERROR");
        xpc_dictionary_send_reply();
      }
    }
    else
    {
      v53 = sub_100004818();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_100033320();
      }

      v54 = sub_100005E14(v15, "ERROR");
      xpc_dictionary_send_reply();
    }
    goto LABEL_102;
  }
  if (!strcmp(v11, "add_client_device"))
  {
    id v33 = v4;
    id v34 = v5;
    long long v35 = xpc_dictionary_get_string(v34, "interface_name");
    long long v36 = xpc_dictionary_get_string(v34, "listener_address");
    uint64_t v37 = xpc_dictionary_get_uint64(v34, "listener_port");
    if (v35 && v36 && v37 && v37 < 0x10000)
    {
      host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port();
      if (host_with_numeric_port)
      {
        uint64_t v39 = xpc_dictionary_get_uint64(v34, "connect_timeout");
        v40 = sub_100004818();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Creating new client device for interface: %{public}s", buf, 0xCu);
        }

        v41 = [[RSDRemoteCoreDeviceDevice alloc] initWithClientEndpoint:host_with_numeric_port controlPeer:v33 interfaceName:v35 connectTimeout:v39];
        v42 = v41;
        if (v41 && [(RSDRemoteDevice *)v41 device_name])
        {
          [(RSDRemoteCoreDeviceDevice *)v42 attach];
          v43 = sub_100004818();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = [(RSDRemoteDevice *)v42 device_name];
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = v44;
            *(_WORD *)&buf[12] = 2082;
            *(void *)&buf[14] = v35;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Attached new client device: %{public}s for interface: %{public}s", buf, 0x16u);
          }

          id v14 = sub_100005E14(v34, "OK");
          xpc_dictionary_set_string(v14, "device_name", [(RSDRemoteDevice *)v42 device_name]);
        }
        else
        {
          v63 = sub_100004818();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
            sub_100033388();
          }

          id v14 = sub_100005E14(v34, "ERROR");
        }
      }
      else
      {
        v65 = sub_100004818();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_1000333F0();
        }

        id v14 = sub_100005E14(v34, "ERROR");
      }
    }
    else
    {
      v56 = sub_100004818();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_1000333BC();
      }

      id v14 = sub_100005E14(v34, "ERROR");
    }

    goto LABEL_100;
  }
  if (strcmp(v11, "remove_device"))
  {
    char v12 = sub_100004818();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100033054();
    }
LABEL_20:

    id v14 = sub_100020794(v5);
    goto LABEL_100;
  }
  id v45 = v4;
  id v66 = v5;
  __s2a = (char *)xpc_dictionary_get_string(v66, "device_name");
  if (!__s2a)
  {
    v57 = sub_100004818();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_100033424();
    }

    uint64_t v58 = sub_100005E14(v66, "ERROR");
LABEL_79:
    id v14 = (void *)v58;
    goto LABEL_80;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long handler = 0u;
  long long v72 = 0u;
  id v46 = (id)qword_10005BCB8;
  id v47 = [v46 countByEnumeratingWithState:&handler objects:buf count:16];
  if (!v47)
  {
LABEL_59:

LABEL_76:
    v61 = sub_100004818();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_100033458();
    }

    uint64_t v58 = sub_100005E14(v66, "ERROR");
    goto LABEL_79;
  }
  uint64_t v48 = *(void *)v72;
LABEL_51:
  uint64_t v49 = 0;
  while (1)
  {
    if (*(void *)v72 != v48) {
      objc_enumerationMutation(v46);
    }
    v50 = *(void **)(*((void *)&handler + 1) + 8 * v49);
    [v50 control_peer:v66];
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    if (v51 == v45) {
      break;
    }

LABEL_57:
    if (v47 == (id)++v49)
    {
      id v47 = [v46 countByEnumeratingWithState:&handler objects:buf count:16];
      if (v47) {
        goto LABEL_51;
      }
      goto LABEL_59;
    }
  }
  BOOL v52 = strcmp([v50 device_name], __s2a) == 0;

  if (!v52) {
    goto LABEL_57;
  }
  id v59 = v50;

  if (!v59) {
    goto LABEL_76;
  }
  v60 = sub_100004818();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v75) = 136446210;
    *(void *)((char *)&v75 + 4) = __s2a;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Disconnecting removed device: %{public}s", (uint8_t *)&v75, 0xCu);
  }

  [v59 disconnect];
  [v59 cancelListener];
  id v14 = sub_100005E14(v66, "OK");

LABEL_80:
LABEL_100:
  if (v14)
  {
    xpc_dictionary_send_reply();
  }
LABEL_102:
}

void sub_100005C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005C2C(id a1)
{
  qword_10005BCD0 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "CoreDevice");

  _objc_release_x1();
}

void sub_100005C70(void *a1)
{
  id v1 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = [(id)qword_10005BCB8 copy];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v14;
    *(void *)&long long v4 = 136446210;
    long long v12 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        char v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 control_peer:v12];
        BOOL v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

        if (v9 == v1)
        {
          id v10 = sub_100004818();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = [v8 device_name];
            *(_DWORD *)buf = v12;
            id v18 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Peer connection canceled, disconnecting device: %{public}s", buf, 0xCu);
          }

          [v8 disconnect];
          [v8 cancelListener];
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  xpc_connection_cancel(v1);
}

id sub_100005E14(void *a1, const char *a2)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_string(reply, "result", a2);

  return reply;
}

void sub_100005E60(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = sub_100004818();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[*(id *)(a1 + 32) device_name];
    int v12 = 138543618;
    id v13 = v3;
    __int16 v14 = 2082;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> got incoming remoted connection for device: %{public}s", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v6 = [*(id *)(a1 + 32) connection];

  if (v6)
  {
    long long v7 = sub_100004818();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = *(void **)(a1 + 32);
      int v12 = 138543362;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> canceling existing connection to replace it", (uint8_t *)&v12, 0xCu);
    }

    BOOL v9 = [*(id *)(a1 + 32) client_connection];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) client_connection];
      nw_connection_cancel(v10);
    }
    id v11 = [*(id *)(a1 + 32) connection];
    xpc_remote_connection_cancel();

    [*(id *)(a1 + 32) setClient_connection:v3];
  }
  else
  {
    [*(id *)(a1 + 32) setClient_connection:v3];
    [*(id *)(a1 + 32) needsConnect];
  }
}

void sub_100006004(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2 == 3)
  {
    int v12 = sub_100004818();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000335F8();
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v11 = sub_100005E14(*(void **)(a1 + 48), "ERROR");
    }
    else
    {
      id v11 = 0;
    }
    [*(id *)(a1 + 40) disconnect];
    [*(id *)(a1 + 40) cancelListener];
    goto LABEL_27;
  }
  if (a2 != 2)
  {
    if (v5)
    {
      id v13 = sub_100004818();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000334F4((uint64_t)v6, a2, v13);
      }

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        goto LABEL_26;
      }
    }
LABEL_20:
    id v11 = 0;
    goto LABEL_32;
  }
  unsigned int port = nw_listener_get_port(*(nw_listener_t *)(a1 + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    __int16 v14 = sub_100004818();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [*(id *)(a1 + 40) device_name];
      int v18 = 67109378;
      unsigned int v19 = port;
      __int16 v20 = 2082;
      id v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "listener port: %u for device: %{public}s, ignored because client is no longer waiting for reply", (uint8_t *)&v18, 0x12u);
    }

    goto LABEL_20;
  }
  char v8 = sub_100004818();
  BOOL v9 = v8;
  if (port)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 40) device_name];
      int v18 = 67109378;
      unsigned int v19 = port;
      __int16 v20 = 2082;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "listener port: %u for device: %{public}s", (uint8_t *)&v18, 0x12u);
    }

    id v11 = sub_100005E14(*(void **)(a1 + 48), "OK");
    xpc_dictionary_set_string(v11, "device_name", (const char *)[*(id *)(a1 + 40) device_name]);
    xpc_dictionary_set_uint64(v11, "listener_port", port);
    goto LABEL_27;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    sub_10003356C(a1, v9);
  }

LABEL_26:
  id v11 = sub_100005E14(*(void **)(a1 + 48), "ERROR");
LABEL_27:
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v16 + 24)) {
    BOOL v17 = v11 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    *(unsigned char *)(v16 + 24) = 0;
    xpc_dictionary_send_reply();
  }
LABEL_32:
}

void sub_1000062D4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1000062FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006318(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100006B78(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100006F20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, "HasInternalSecurityPolicies"))
    {
      [*(id *)(a1 + 32) setIs_exposed_to_untrusted_devices_internal:1];
    }
    else if (!strcmp(string_ptr, "PreSetup"))
    {
      [*(id *)(a1 + 32) setIs_exposed_to_untrusted_devices_presetup:1];
    }
  }
  else
  {
    id v5 = (void *)qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_1000338E0(a1, v5, v4);
    }
  }

  return 1;
}

id sub_100006FE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    xpc_string_get_string_ptr(v3);
    uint64_t v6 = +[NSNumber numberWithUnsignedInt:remote_device_type_parse()];
    id v11 = v6;
    id v5 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    if (type != (xpc_type_t)&_xpc_type_array)
    {
      id v5 = 0;
      goto LABEL_7;
    }
    +[NSMutableArray array];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C4AC;
    v8[3] = &unk_100055230;
    uint64_t v10 = a1;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v5;
    xpc_array_apply(v3, v8);
    uint64_t v6 = v9;
  }

LABEL_7:

  return v5;
}

void sub_1000072A0(void *a1)
{
  id v1 = a1;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)qword_10005BCE8;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v8 != v5) {
        objc_enumerationMutation(v2);
      }
      if (!v1[2](v1, *(void *)(*((void *)&v7 + 1) + 8 * v6))) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t sub_1000075A4(uint64_t a1)
{
  memset(v14, 170, sizeof(v14));
  id v2 = [*(id *)(a1 + 32) service];
  id v3 = v2;
  if (v2) {
    [v2 getTcpOptions];
  }
  else {
    memset(v14, 0, 20);
  }

  uint64_t result = sub_10001FD44((int)[*(id *)(a1 + 32) socket], 0, 0, (unsigned __int8 *)v14, (int *)&v14[2] + 1);
  if (!result)
  {
    *(void *)&long long v5 = 138543618;
    long long v13 = v5;
    do
    {
      uint64_t v6 = (void *)qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        long long v7 = *(void **)(a1 + 32);
        long long v8 = v6;
        long long v9 = [v7 device];
        long long v10 = [*(id *)(a1 + 32) service];
        id v11 = [v10 name];
        *(_DWORD *)buf = v13;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> Got incoming connection for \"%s\"", buf, 0x16u);
      }
      int v12 = [[*(id *)(a1 + 32) service:v13];
      [v12 fireDevice:*(void *)(a1 + 40) fd:HIDWORD(v14[2])];

      close(SHIDWORD(v14[2]));
      uint64_t result = sub_10001FD44((int)[*(id *)(a1 + 32) socket], 0, 0, (unsigned __int8 *)v14, (int *)&v14[2] + 1);
    }
    while (!result);
  }
  return result;
}

uint64_t sub_10000775C(uint64_t a1)
{
  int v1 = [*(id *)(a1 + 32) socket];

  return close(v1);
}

uint64_t sub_100007EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = [*(id *)(a1 + 32) connection];

  if (!v5) {
    [*(id *)(a1 + 32) setLatestConnectError:a3];
  }
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

id sub_1000084F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

uint64_t sub_1000085F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    long long v5 = *(void **)(a1 + 32);
    uint64_t v6 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v4)];
    [v5 addObject:v6];
  }
  return 1;
}

id sub_100009544(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

void sub_10000954C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v5 = *(void **)(a1 + 32);
  long long v7 = a4;
  uint64_t v6 = sub_10001B05C(v5, a3);
  v7[2](v7, v6);
}

id sub_1000095B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

id sub_1000095BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

id sub_1000095C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

uint64_t sub_1000095CC(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) properties];
  xpc_dictionary_set_value(v6, a2, v5);

  long long v9 = a2;
  if (lfind(&v9, &off_100055250, &qword_100044DC0, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000C560))
  {
    long long v7 = [*(id *)(a1 + 32) public_properties];
    xpc_dictionary_set_value(v7, a2, v5);
  }
  return 1;
}

uint64_t sub_100009684(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    long long v7 = *(void **)(a1 + 32);
    uint64_t v6 = (id *)(a1 + 32);
    long long v8 = [v7 serviceWithName:a2];
    long long v9 = (void *)xpc_copy_clean_description();
    long long v10 = qword_10005C018;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEBUG))
      {
        id v16 = *v6;
        int v17 = 138543874;
        id v18 = v16;
        __int16 v19 = 2080;
        uint64_t v20 = a2;
        __int16 v21 = 2080;
        int v22 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@> Updating port for existing remote service \"%s\": %s", (uint8_t *)&v17, 0x20u);
      }
      [v8 updateWithDescription:v5];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        id v11 = *v6;
        int v17 = 138543874;
        id v18 = v11;
        __int16 v19 = 2082;
        uint64_t v20 = a2;
        __int16 v21 = 2082;
        int v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@> Adding remote service \"%{public}s\": %{public}s", (uint8_t *)&v17, 0x20u);
      }
      int v12 = [[RSDRemoteService alloc] initWithName:a2 description:v5];
      if (v12)
      {
        long long v13 = v12;
        [(RSDRemoteService *)v12 setDevice:*v6];
        __int16 v14 = [*v6 services];
        [v14 addObject:v13];
      }
      else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
      {
        sub_1000344E8();
      }
    }
    free(v9);
  }
  else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
  {
    sub_100034564();
  }

  return 1;
}

id sub_1000098B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) disconnect];
}

uint64_t sub_100009C04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100009C18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009C2C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = *(void *)(v4 + 80);
  *(void *)(v4 + 80) = 0;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_100034654();
    }
    goto LABEL_10;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "SequenceNumber");
  long long v7 = qword_10005C018;
  if (uint64 != a1[6])
  {
    uint64_t v11 = uint64;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = a1[4];
      uint64_t v13 = a1[6];
      int v14 = 138543874;
      uint64_t v15 = v12;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@> Heartbeat %llu failed - WRONG sequence number %llu in reply", (uint8_t *)&v14, 0x20u);
    }
LABEL_10:
    long long v10 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[6];
    int v14 = 138543618;
    uint64_t v15 = v8;
    __int16 v16 = 2048;
    uint64_t v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Heartbeat %llu succeeded", (uint8_t *)&v14, 0x16u);
  }
  *(void *)(a1[4] + 64) = v5;
  *(void *)(a1[4] + 72) = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  long long v10 = *(void (**)(void))(a1[5] + 16);
LABEL_11:
  v10();
}

void sub_10000A060(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_1000347A4();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = xpc_dictionary_get_value(v3, "TimesyncPayload");
    if (v4)
    {
      sub_10000F344(*(void *)(a1 + 48), v4, (void *)qword_10005C018);
      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
        sub_100034810();
      }
      uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v5();
  }
}

uint64_t sub_10000A308(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error
    && [*(id *)(a1 + 32) state] == 5)
  {
    id v3 = qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Device gone, aborting goodbye", (uint8_t *)&v7, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
}

id sub_10000A6E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetNow];
}

void sub_10000ABFC(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type = xpc_get_type(object);
  uint64_t v4 = *(void **)(a1 + 32);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if ([v4 state] == 5)
    {
      uint64_t v6 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> Device gone, aborting reset", buf, 0xCu);
      }
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000ADB8;
      block[3] = &unk_1000550D0;
      block[4] = *(void *)(a1 + 32);
      dispatch_async((dispatch_queue_t)qword_10005BCF0, block);
    }
  }
  else
  {
    [v4 refreshServiceListeners];
    id v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "MessageType", "ResetGoahead");
    uint64_t v5 = [*(id *)(a1 + 32) connection];
    xpc_remote_connection_send_message();

    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  }
}

id sub_10000ADB8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  return [*(id *)(a1 + 32) reset];
}

void sub_10000AE40(uint64_t a1)
{
  if ((([*(id *)(a1 + 32) connectable] & 1) != 0
     || [*(id *)(a1 + 32) state] == 5)
    && [*(id *)(*(void *)(a1 + 32) + 112) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 112) objectAtIndex:0];
    [*(id *)(*(void *)(a1 + 32) + 112) removeObjectAtIndex:0];
    v2[2]();
    [*(id *)(a1 + 32) drainPendedRequests];
  }
}

void sub_10000BEFC()
{
  id v0 = sub_10001AB48();
  if (v0)
  {
    id v2 = v0;
    int v1 = (void *)sub_10001A44C();
    xpc_dictionary_set_value((xpc_object_t)qword_10005C030, "EncryptedRemoteXPCPopulatedOIDs", v1);

    id v0 = v2;
  }
}

void sub_10000BF64()
{
  CFStringRef v0 = [(id)qword_10005C010 valueForKey:@"device-uuid"];
  CFUUIDRef v1 = CFUUIDCreateFromString(0, v0);
  if (v1)
  {
    CFUUIDRef v2 = v1;
  }
  else
  {
    CFUUIDRef v3 = CFUUIDCreate(0);
    if (!v3) {
      sub_100034F58(&buf, out);
    }
    CFUUIDRef v2 = v3;
    CFStringRef v4 = CFUUIDCreateString(0, v3);
    if (!v4) {
      sub_100034FC4(&buf, out);
    }
    CFStringRef v0 = v4;
    [(id)qword_10005C010 setValue:v4 forKey:@"device-uuid"];
  }
  CFUUIDBytes v7 = CFUUIDGetUUIDBytes(v2);
  uuid_copy((unsigned __int8 *)&xmmword_10005C020, &v7.byte0);
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v5;
  *(_OWORD *)&out[16] = v5;
  uuid_unparse((const unsigned __int8 *)&xmmword_10005C020, out);
  uint64_t v6 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 0x1004100202;
    __int16 v9 = 2096;
    long long v10 = &xmmword_10005C020;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device-uuid: %{uuid_t}.16P", (uint8_t *)&buf, 0x12u);
  }
  CFRelease(v2);
  CFRelease(v0);
}

char *sub_10000C0E4(const __CFString *a1)
{
  CFIndex v2 = (2 * CFStringGetLength(a1)) | 1;
  CFUUIDRef v3 = (char *)malloc_type_malloc(v2, 0x52F5D9A2uLL);
  if (!v3) {
    sub_100035030(&v6, v7);
  }
  CFStringRef v4 = v3;
  if (!CFStringGetCString(a1, v3, v2, 0x8000100u)) {
    sub_10003509C(&v6, v7);
  }
  return v4;
}

void sub_10000C19C(void *a1, const char *a2, const __CFString *a3)
{
  id v5 = a1;
  CFTypeID v6 = CFGetTypeID(a3);
  if (v6 == CFStringGetTypeID())
  {
    CFUUIDBytes v7 = sub_10000C0E4(a3);
    xpc_dictionary_set_string(v5, a2, v7);
    free(v7);
  }
  else
  {
    CFTypeID v8 = CFGetTypeID(a3);
    if (v8 == CFBooleanGetTypeID())
    {
      BOOL v9 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
      xpc_dictionary_set_BOOL(v5, a2, v9);
    }
    else
    {
      CFTypeID v10 = CFGetTypeID(a3);
      if (v10 == CFNumberGetTypeID())
      {
        uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
        CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
        xpc_dictionary_set_uint64(v5, a2, valuePtr);
      }
      else
      {
        CFTypeID v11 = CFGetTypeID(a3);
        if (v11 == CFDataGetTypeID())
        {
          BytePtr = CFDataGetBytePtr((CFDataRef)a3);
          size_t Length = CFDataGetLength((CFDataRef)a3);
          xpc_dictionary_set_data(v5, a2, BytePtr, Length);
        }
        else
        {
          int v14 = (void *)qword_10005C018;
          if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
            sub_100035108((uint64_t)a2, v14, a3);
          }
        }
      }
    }
  }
}

void start()
{
  uint64_t v0 = objc_opt_new();
  CFUUIDRef v1 = (void *)qword_10005C038;
  qword_10005C038 = v0;

  uint64_t v2 = objc_opt_new();
  CFUUIDRef v3 = (void *)qword_10005C040;
  qword_10005C040 = v2;

  uint64_t v4 = objc_opt_new();
  id v5 = (void *)qword_10005BCE8;
  qword_10005BCE8 = v4;

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  CFUUIDBytes v7 = (void *)qword_10005C030;
  qword_10005C030 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.RemoteServiceDiscovery", "remoted");
  BOOL v9 = (void *)qword_10005C018;
  qword_10005C018 = (uint64_t)v8;

  CFTypeID v10 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "remoted starting up, waiting for services...", v13, 2u);
  }
  dispatch_queue_t v11 = dispatch_queue_create("com.apple.remoted", 0);
  uint64_t v12 = (void *)qword_10005BCF0;
  qword_10005BCF0 = (uint64_t)v11;

  sub_10000C430();
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, &stru_100055208);
  sub_10001EDC8((void *)qword_10005BCF0);
  dispatch_main();
}

uint64_t sub_10000C430()
{
  uint64_t v0 = xpc_event_publisher_create();
  CFUUIDRef v1 = (void *)qword_10005BCE0;
  qword_10005BCE0 = v0;

  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();

  return xpc_event_publisher_activate();
}

uint64_t sub_10000C4AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    xpc_string_get_string_ptr(v4);
    uint64_t v6 = remote_device_type_parse();
    if (v6)
    {
      CFUUIDBytes v7 = *(void **)(a1 + 32);
      os_log_t v8 = +[NSNumber numberWithUnsignedInt:v6];
      [v7 addObject:v8];
    }
  }
  else
  {
    id v5 = (void *)qword_10005C018;
    if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR)) {
      sub_1000351AC(a1, v5, v4);
    }
  }

  return 1;
}

uint64_t sub_10000C560(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void sub_10000C56C(id a1)
{
  int v3 = 0;
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswerWithError();
  byte_10005BCF8 = CFBooleanGetValue(v1) != 0;
  CFRelease(v1);
  uint64_t v2 = qword_10005C018;
  if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109120;
    int v5 = byte_10005BCF8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "InDiagnosticsMode: %d", buf, 8u);
  }
}

void sub_10000C674(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  uint64_t v6 = a4;
  switch(a2)
  {
    case 2u:
      uint64_t v13 = qword_10005C018;
      if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uu = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Finalized the initial set of remoted services", uu, 2u);
      }
      int v14 = [[RSDPreferences alloc] initWithPrefDomain:@"com.apple.remoted"];
      uint64_t v15 = (void *)qword_10005C010;
      qword_10005C010 = (uint64_t)v14;

      [(id)qword_10005C010 migrateContentsOnDisk];
      sub_10001AA90((void *)qword_10005BCF0);
      os_variant_has_internal_content();
      sub_10000BF64();
      __int16 v16 = (void *)qword_10005C030;
      char has_internal_content = os_variant_has_internal_content();
      xpc_dictionary_set_BOOL(v16, "AppleInternal", has_internal_content);
      *(void *)uint64_t buf = 0;
      if (!sub_10000EB28("kern.osversion", (char **)buf)) {
        _os_assumes_log();
      }
      __int16 v18 = *(void **)buf;
      if (*(void *)buf)
      {
        xpc_dictionary_set_string((xpc_object_t)qword_10005C030, "BuildVersion", *(const char **)buf);
        free(v18);
      }
      CFDictionaryRef v19 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
      if (v19)
      {
        CFDictionaryRef v20 = v19;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v19, _kCFSystemVersionProductVersionKey);
        if (Value) {
          sub_10000C19C((void *)qword_10005C030, "OSVersion", Value);
        }
        CFRelease(v20);
      }
      int v22 = (const char *)bridge_version_copy_current_string();
      if (v22)
      {
        long long v23 = (char *)v22;
        xpc_dictionary_set_string((xpc_object_t)qword_10005C030, "BridgeVersion", v22);
        free(v23);
      }
      else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
      {
        sub_1000353BC();
      }
      in = 0;
      if (!sub_10000EB28("kern.bootsessionuuid", &in)) {
        _os_assumes_log();
      }
      id v33 = in;
      if (in)
      {
        memset(uu, 170, sizeof(uu));
        if (uuid_parse(in, uu)) {
          _os_assumes_log();
        }
        else {
          xpc_dictionary_set_uuid((xpc_object_t)qword_10005C030, "BootSessionUUID", uu);
        }
      }
      free(v33);
      id v34 = (void *)qword_10005C030;
      BOOL v35 = getenv("__OSINSTALL_ENVIRONMENT") != 0;
      xpc_dictionary_set_BOOL(v34, "OSInstallEnvironment", v35);
      long long v36 = +[NSURL fileURLWithPath:@"/System/Library/CoreServices/RestoreVersion.plist" isDirectory:0];
      *(void *)uu = 0;
      uint64_t v37 = +[NSDictionary dictionaryWithContentsOfURL:v36 error:uu];
      id v38 = *(id *)uu;
      uint64_t v39 = v38;
      if (v37)
      {

        v40 = [v37 objectForKeyedSubscript:@"RestoreLongVersion"];
        long long v36 = v40;
        if (v40)
        {
          xpc_dictionary_set_string((xpc_object_t)qword_10005C030, "RestoreLongVersion", (const char *)[v40 UTF8String]);
        }
        else if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_ERROR))
        {
          sub_100035388();
        }
      }
      else
      {
        v41 = (id)qword_10005C018;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_1000352D8(v39);
        }
      }
      uint64_t version_flags = xpc_remote_connection_get_version_flags();
      xpc_dictionary_set_uint64((xpc_object_t)qword_10005C030, "RemoteXPCVersionFlags", version_flags);
      xpc_dictionary_set_BOOL((xpc_object_t)qword_10005C030, "SensitivePropertiesVisible", 1);

      sub_10000CDE8();
      if (os_variant_has_internal_content()) {
        sub_10002A948((void *)qword_10005BCF0);
      }
      sub_100004F50((void *)qword_10005BCF0);
      if (os_variant_has_internal_content()) {
        sub_10002F374((id)qword_10005BCF0);
      }
      sub_10000FA14((void *)qword_10005BCF0);
      sub_1000129E8((void *)qword_10005BCF0);
      sub_1000279D8((void *)qword_10005BCF0);
      sub_1000263A0((void *)qword_10005BCF0);
      if (os_variant_has_internal_content()) {
        sub_10001DB6C((void *)qword_10005BCF0);
      }
      sub_1000157D0((void *)qword_10005BCF0);
      sub_100017798((void *)qword_10005BCF0);
      sub_1000038A4((void *)qword_10005BCF0);
      sub_1000234A8((void *)qword_10005BCF0);
      sub_10002927C((id)qword_10005BCF0);
      sub_1000032A8();
      sub_100020090();
      break;
    case 1u:
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v24 = [[(id)qword_10005C038 copy];
      id v25 = [v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v44;
        while (2)
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v44 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if ([v29 token] == (id)a3)
            {
              long long v30 = (void *)qword_10005C018;
              if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
              {
                long long v31 = v30;
                id v32 = [v29 name];
                *(_DWORD *)uu = 136446210;
                *(void *)&uu[4] = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Unregistered remoted service: %{public}s", uu, 0xCu);
              }
              [(id)qword_10005C038 removeObject:v29];
              goto LABEL_38;
            }
          }
          id v26 = [v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }
LABEL_38:

      break;
    case 0u:
      *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v58 = v7;
      long long v59 = v7;
      long long v56 = v7;
      long long v57 = v7;
      long long v54 = v7;
      long long v55 = v7;
      *(_OWORD *)uu = v7;
      long long v53 = v7;
      if ((xpc_get_event_name() & 1) == 0) {
        __strlcpy_chk();
      }
      os_log_t v8 = [[RSDLocalService alloc] initWithToken:a3 name:uu event:v6];
      if (v8)
      {
        BOOL v9 = v8;
        [(id)qword_10005C038 addObject:v8];
        CFTypeID v10 = qword_10005C018;
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 136446210;
          *(void *)&uint8_t buf[4] = uu;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registered remoted service: %{public}s", buf, 0xCu);
        }
        if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
        {
          dispatch_queue_t v11 = (void *)xpc_copy_debug_description();
          uint64_t v12 = qword_10005C018;
          if (os_log_type_enabled((os_log_t)qword_10005C018, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 136446466;
            *(void *)&uint8_t buf[4] = uu;
            __int16 v50 = 2082;
            id v51 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", buf, 0x16u);
          }
          free(v11);
        }
      }
      break;
  }
}

void sub_10000CD44(id a1, int a2)
{
}

void sub_10000CDE8()
{
  CFStringRef v0 = (const __CFString *)MGCopyAnswer();
  if (v0)
  {
    CFStringRef v1 = v0;
    sub_10000C19C((void *)qword_10005C030, "BoardId", v0);
    uint64_t v2 = (id)qword_10005C018;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "BoardId";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v1);
  }
  else
  {
    int v3 = (id)qword_10005C018;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000366B0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  CFStringRef v11 = (const __CFString *)MGCopyAnswer();
  if (v11)
  {
    CFStringRef v12 = v11;
    sub_10000C19C((void *)qword_10005C030, "BoardRevision", v11);
    uint64_t v13 = (id)qword_10005C018;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "BoardRevision";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v12);
  }
  else
  {
    int v14 = (id)qword_10005C018;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100036638(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  CFStringRef v22 = (const __CFString *)MGCopyAnswer();
  if (v22)
  {
    CFStringRef v23 = v22;
    sub_10000C19C((void *)qword_10005C030, "CPUArchitecture", v22);
    id v24 = (id)qword_10005C018;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "CPUArchitecture";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v23);
  }
  else
  {
    id v25 = (id)qword_10005C018;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000365C0(v25, v26, v27, v28, v29, v30, v31, v32);
    }
  }
  CFStringRef v33 = (const __CFString *)MGCopyAnswer();
  if (v33)
  {
    CFStringRef v34 = v33;
    sub_10000C19C((void *)qword_10005C030, "CertificateProductionStatus", v33);
    BOOL v35 = (id)qword_10005C018;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "CertificateProductionStatus";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v34);
  }
  else
  {
    long long v36 = (id)qword_10005C018;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100036548(v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }
  CFStringRef v44 = (const __CFString *)MGCopyAnswer();
  if (v44)
  {
    CFStringRef v45 = v44;
    sub_10000C19C((void *)qword_10005C030, "CertificateSecurityMode", v44);
    long long v46 = (id)qword_10005C018;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "CertificateSecurityMode";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v45);
  }
  else
  {
    id v47 = (id)qword_10005C018;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_1000364D0(v47, v48, v49, v50, v51, v52, v53, v54);
    }
  }
  CFStringRef v55 = (const __CFString *)MGCopyAnswer();
  if (v55)
  {
    CFStringRef v56 = v55;
    sub_10000C19C((void *)qword_10005C030, "ChipID", v55);
    long long v57 = (id)qword_10005C018;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ChipID";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v56);
  }
  else
  {
    long long v58 = (id)qword_10005C018;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
      sub_100036458(v58, v59, v60, v61, v62, v63, v64, v65);
    }
  }
  CFStringRef v66 = (const __CFString *)MGCopyAnswer();
  if (v66)
  {
    CFStringRef v67 = v66;
    sub_10000C19C((void *)qword_10005C030, "DeviceClass", v66);
    v68 = (id)qword_10005C018;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceClass";
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v67);
  }
  else
  {
    v69 = (id)qword_10005C018;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
      sub_1000363E0(v69, v70, v71, v72, v73, v74, v75, v76);
    }
  }
  CFStringRef v77 = (const __CFString *)MGCopyAnswer();
  if (v77)
  {
    CFStringRef v78 = v77;
    sub_10000C19C((void *)qword_10005C030, "DeviceColor", v77);
    v79 = (id)qword_10005C018;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceColor";
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v78);
  }
  else
  {
    id v80 = (id)qword_10005C018;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_100036368(v80, v81, v82, v83, v84, v85, v86, v87);
    }
  }
  CFStringRef v88 = (const __CFString *)MGCopyAnswer();
  if (v88)
  {
    CFStringRef v89 = v88;
    sub_10000C19C((void *)qword_10005C030, "DeviceEnclosureColor", v88);
    v90 = (id)qword_10005C018;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceEnclosureColor";
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v89);
  }
  else
  {
    v91 = (id)qword_10005C018;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
      sub_1000362F0(v91, v92, v93, v94, v95, v96, v97, v98);
    }
  }
  CFStringRef v99 = (const __CFString *)MGCopyAnswer();
  if (v99)
  {
    CFStringRef v100 = v99;
    sub_10000C19C((void *)qword_10005C030, "DeviceSupportsLockdown", v99);
    v101 = (id)qword_10005C018;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "DeviceSupportsLockdown";
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v100);
  }
  else
  {
    v102 = (id)qword_10005C018;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      sub_100036278(v102, v103, v104, v105, v106, v107, v108, v109);
    }
  }
  CFStringRef v110 = (const __CFString *)MGCopyAnswer();
  if (v110)
  {
    CFStringRef v111 = v110;
    sub_10000C19C((void *)qword_10005C030, "EffectiveProductionStatusAp", v110);
    v112 = (id)qword_10005C018;
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveProductionStatusAp";
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v111);
  }
  else
  {
    v113 = (id)qword_10005C018;
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
      sub_100036200(v113, v114, v115, v116, v117, v118, v119, v120);
    }
  }
  CFStringRef v121 = (const __CFString *)MGCopyAnswer();
  if (v121)
  {
    CFStringRef v122 = v121;
    sub_10000C19C((void *)qword_10005C030, "EffectiveProductionStatusSEP", v121);
    v123 = (id)qword_10005C018;
    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveProductionStatusSEP";
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v122);
  }
  else
  {
    v124 = (id)qword_10005C018;
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR)) {
      sub_100036188(v124, v125, v126, v127, v128, v129, v130, v131);
    }
  }
  CFStringRef v132 = (const __CFString *)MGCopyAnswer();
  if (v132)
  {
    CFStringRef v133 = v132;
    sub_10000C19C((void *)qword_10005C030, "EffectiveSecurityModeAp", v132);
    v134 = (id)qword_10005C018;
    if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveSecurityModeAp";
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v133);
  }
  else
  {
    v135 = (id)qword_10005C018;
    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
      sub_100036110(v135, v136, v137, v138, v139, v140, v141, v142);
    }
  }
  CFStringRef v143 = (const __CFString *)MGCopyAnswer();
  if (v143)
  {
    CFStringRef v144 = v143;
    sub_10000C19C((void *)qword_10005C030, "EffectiveSecurityModeSEP", v143);
    v145 = (id)qword_10005C018;
    if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EffectiveSecurityModeSEP";
      _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v144);
  }
  else
  {
    v146 = (id)qword_10005C018;
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
      sub_100036098(v146, v147, v148, v149, v150, v151, v152, v153);
    }
  }
  CFStringRef v154 = (const __CFString *)MGCopyAnswer();
  if (v154)
  {
    CFStringRef v155 = v154;
    sub_10000C19C((void *)qword_10005C030, "EthernetMacAddress", v154);
    v156 = (id)qword_10005C018;
    if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "EthernetMacAddress";
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v155);
  }
  else
  {
    v157 = (id)qword_10005C018;
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR)) {
      sub_100036020(v157, v158, v159, v160, v161, v162, v163, v164);
    }
  }
  CFStringRef v165 = (const __CFString *)MGCopyAnswer();
  if (v165)
  {
    CFStringRef v166 = v165;
    sub_10000C19C((void *)qword_10005C030, "HWModel", v165);
    v167 = (id)qword_10005C018;
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HWModelStr";
      _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v166);
  }
  else
  {
    v168 = (id)qword_10005C018;
    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR)) {
      sub_100035FA8(v168, v169, v170, v171, v172, v173, v174, v175);
    }
  }
  CFStringRef v176 = (const __CFString *)MGCopyAnswer();
  if (v176)
  {
    CFStringRef v177 = v176;
    sub_10000C19C((void *)qword_10005C030, "HardwarePlatform", v176);
    v178 = (id)qword_10005C018;
    if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HardwarePlatform";
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v177);
  }
  else
  {
    v179 = (id)qword_10005C018;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR)) {
      sub_100035F30(v179, v180, v181, v182, v183, v184, v185, v186);
    }
  }
  CFStringRef v187 = (const __CFString *)MGCopyAnswer();
  if (v187)
  {
    CFStringRef v188 = v187;
    sub_10000C19C((void *)qword_10005C030, "HasSEP", v187);
    v189 = (id)qword_10005C018;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HasSEP";
      _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v188);
  }
  else
  {
    v190 = (id)qword_10005C018;
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR)) {
      sub_100035EB8(v190, v191, v192, v193, v194, v195, v196, v197);
    }
  }
  CFStringRef v198 = (const __CFString *)MGCopyAnswer();
  if (v198)
  {
    CFStringRef v199 = v198;
    sub_10000C19C((void *)qword_10005C030, "HumanReadableProductVersionString", v198);
    v200 = (id)qword_10005C018;
    if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "HumanReadableProductVersionString";
      _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v199);
  }
  else
  {
    v201 = (id)qword_10005C018;
    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR)) {
      sub_100035E40(v201, v202, v203, v204, v205, v206, v207, v208);
    }
  }
  CFStringRef v209 = (const __CFString *)MGCopyAnswer();
  if (v209)
  {
    CFStringRef v210 = v209;
    sub_10000C19C((void *)qword_10005C030, "Image4CryptoHashMethod", v209);
    v211 = (id)qword_10005C018;
    if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "Image4CryptoHashMethod";
      _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v210);
  }
  else
  {
    v212 = (id)qword_10005C018;
    if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR)) {
      sub_100035DC8(v212, v213, v214, v215, v216, v217, v218, v219);
    }
  }
  CFStringRef v220 = (const __CFString *)MGCopyAnswer();
  if (v220)
  {
    CFStringRef v221 = v220;
    sub_10000C19C((void *)qword_10005C030, "Image4Supported", v220);
    v222 = (id)qword_10005C018;
    if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "Image4Supported";
      _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v221);
  }
  else
  {
    v223 = (id)qword_10005C018;
    if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR)) {
      sub_100035D50(v223, v224, v225, v226, v227, v228, v229, v230);
    }
  }
  CFStringRef v231 = (const __CFString *)MGCopyAnswer();
  if (v231)
  {
    CFStringRef v232 = v231;
    sub_10000C19C((void *)qword_10005C030, "IsUIBuild", v231);
    v233 = (id)qword_10005C018;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "IsUIBuild";
      _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v232);
  }
  else
  {
    v234 = (id)qword_10005C018;
    if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR)) {
      sub_100035CD8(v234, v235, v236, v237, v238, v239, v240, v241);
    }
  }
  CFStringRef v242 = (const __CFString *)MGCopyAnswer();
  if (v242)
  {
    CFStringRef v243 = v242;
    sub_10000C19C((void *)qword_10005C030, "IsVirtualDevice", v242);
    v244 = (id)qword_10005C018;
    if (os_log_type_enabled(v244, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "IsVirtualDevice";
      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v243);
  }
  else
  {
    v245 = (id)qword_10005C018;
    if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR)) {
      sub_100035C60(v245, v246, v247, v248, v249, v250, v251, v252);
    }
  }
  CFStringRef v253 = (const __CFString *)MGCopyAnswer();
  if (v253)
  {
    CFStringRef v254 = v253;
    sub_10000C19C((void *)qword_10005C030, "MobileDeviceMinimumVersion", v253);
    v255 = (id)qword_10005C018;
    if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "MobileDeviceMinimumVersion";
      _os_log_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v254);
  }
  else
  {
    v256 = (id)qword_10005C018;
    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR)) {
      sub_100035BE8(v256, v257, v258, v259, v260, v261, v262, v263);
    }
  }
  CFStringRef v264 = (const __CFString *)MGCopyAnswer();
  if (v264)
  {
    CFStringRef v265 = v264;
    sub_10000C19C((void *)qword_10005C030, "ModelNumber", v264);
    v266 = (id)qword_10005C018;
    if (os_log_type_enabled(v266, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ModelNumber";
      _os_log_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v265);
  }
  else
  {
    v267 = (id)qword_10005C018;
    if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR)) {
      sub_100035B70(v267, v268, v269, v270, v271, v272, v273, v274);
    }
  }
  CFStringRef v275 = (const __CFString *)MGCopyAnswer();
  if (v275)
  {
    CFStringRef v276 = v275;
    sub_10000C19C((void *)qword_10005C030, "OceanComputeCarrierID", v275);
    v277 = (id)qword_10005C018;
    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "OceanComputeCarrierID";
      _os_log_impl((void *)&_mh_execute_header, v277, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v276);
  }
  else
  {
    v278 = (id)qword_10005C018;
    if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR)) {
      sub_100035AF8(v278, v279, v280, v281, v282, v283, v284, v285);
    }
  }
  CFStringRef v286 = (const __CFString *)MGCopyAnswer();
  if (v286)
  {
    CFStringRef v287 = v286;
    sub_10000C19C((void *)qword_10005C030, "OceanComputeCarrierSlot", v286);
    v288 = (id)qword_10005C018;
    if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "OceanComputeCarrierSlot";
      _os_log_impl((void *)&_mh_execute_header, v288, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v287);
  }
  else
  {
    v289 = (id)qword_10005C018;
    if (os_log_type_enabled(v289, OS_LOG_TYPE_ERROR)) {
      sub_100035A80(v289, v290, v291, v292, v293, v294, v295, v296);
    }
  }
  CFStringRef v297 = (const __CFString *)MGCopyAnswer();
  if (v297)
  {
    CFStringRef v298 = v297;
    sub_10000C19C((void *)qword_10005C030, "ProductName", v297);
    v299 = (id)qword_10005C018;
    if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ProductName";
      _os_log_impl((void *)&_mh_execute_header, v299, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v298);
  }
  else
  {
    v300 = (id)qword_10005C018;
    if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR)) {
      sub_100035A08(v300, v301, v302, v303, v304, v305, v306, v307);
    }
  }
  CFStringRef v308 = (const __CFString *)MGCopyAnswer();
  if (v308)
  {
    CFStringRef v309 = v308;
    sub_10000C19C((void *)qword_10005C030, "ProductType", v308);
    v310 = (id)qword_10005C018;
    if (os_log_type_enabled(v310, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ProductType";
      _os_log_impl((void *)&_mh_execute_header, v310, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v309);
  }
  else
  {
    v311 = (id)qword_10005C018;
    if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR)) {
      sub_100035990(v311, v312, v313, v314, v315, v316, v317, v318);
    }
  }
  CFStringRef v319 = (const __CFString *)MGCopyAnswer();
  if (v319)
  {
    CFStringRef v320 = v319;
    sub_10000C19C((void *)qword_10005C030, "ProductVersionExtra", v319);
    v321 = (id)qword_10005C018;
    if (os_log_type_enabled(v321, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ProductVersionExtra";
      _os_log_impl((void *)&_mh_execute_header, v321, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v320);
  }
  else
  {
    v322 = (id)qword_10005C018;
    if (os_log_type_enabled(v322, OS_LOG_TYPE_ERROR)) {
      sub_100035918(v322, v323, v324, v325, v326, v327, v328, v329);
    }
  }
  CFStringRef v330 = (const __CFString *)MGCopyAnswer();
  if (v330)
  {
    CFStringRef v331 = v330;
    sub_10000C19C((void *)qword_10005C030, "RegionCode", v330);
    v332 = (id)qword_10005C018;
    if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "RegionCode";
      _os_log_impl((void *)&_mh_execute_header, v332, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v331);
  }
  else
  {
    v333 = (id)qword_10005C018;
    if (os_log_type_enabled(v333, OS_LOG_TYPE_ERROR)) {
      sub_1000358A0(v333, v334, v335, v336, v337, v338, v339, v340);
    }
  }
  CFStringRef v341 = (const __CFString *)MGCopyAnswer();
  if (v341)
  {
    CFStringRef v342 = v341;
    sub_10000C19C((void *)qword_10005C030, "RegionInfo", v341);
    v343 = (id)qword_10005C018;
    if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "RegionInfo";
      _os_log_impl((void *)&_mh_execute_header, v343, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v342);
  }
  else
  {
    v344 = (id)qword_10005C018;
    if (os_log_type_enabled(v344, OS_LOG_TYPE_ERROR)) {
      sub_100035828(v344, v345, v346, v347, v348, v349, v350, v351);
    }
  }
  CFStringRef v352 = (const __CFString *)MGCopyAnswer();
  if (v352)
  {
    CFStringRef v353 = v352;
    sub_10000C19C((void *)qword_10005C030, "ReleaseType", v352);
    v354 = (id)qword_10005C018;
    if (os_log_type_enabled(v354, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ReleaseType";
      _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v353);
  }
  else
  {
    v355 = (id)qword_10005C018;
    if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR)) {
      sub_1000357B0(v355, v356, v357, v358, v359, v360, v361, v362);
    }
  }
  CFStringRef v363 = (const __CFString *)MGCopyAnswer();
  if (v363)
  {
    CFStringRef v364 = v363;
    sub_10000C19C((void *)qword_10005C030, "SecurityDomain", v363);
    v365 = (id)qword_10005C018;
    if (os_log_type_enabled(v365, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SecurityDomain";
      _os_log_impl((void *)&_mh_execute_header, v365, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v364);
  }
  else
  {
    v366 = (id)qword_10005C018;
    if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR)) {
      sub_100035738(v366, v367, v368, v369, v370, v371, v372, v373);
    }
  }
  CFStringRef v374 = (const __CFString *)MGCopyAnswer();
  if (v374)
  {
    CFStringRef v375 = v374;
    sub_10000C19C((void *)qword_10005C030, "SerialNumber", v374);
    v376 = (id)qword_10005C018;
    if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SerialNumber";
      _os_log_impl((void *)&_mh_execute_header, v376, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v375);
  }
  else
  {
    v377 = (id)qword_10005C018;
    if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR)) {
      sub_1000356C0(v377, v378, v379, v380, v381, v382, v383, v384);
    }
  }
  CFStringRef v385 = (const __CFString *)MGCopyAnswer();
  if (v385)
  {
    CFStringRef v386 = v385;
    sub_10000C19C((void *)qword_10005C030, "SigningFuse", v385);
    v387 = (id)qword_10005C018;
    if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SigningFuse";
      _os_log_impl((void *)&_mh_execute_header, v387, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v386);
  }
  else
  {
    v388 = (id)qword_10005C018;
    if (os_log_type_enabled(v388, OS_LOG_TYPE_ERROR)) {
      sub_100035648(v388, v389, v390, v391, v392, v393, v394, v395);
    }
  }
  CFStringRef v396 = (const __CFString *)MGCopyAnswer();
  if (v396)
  {
    CFStringRef v397 = v396;
    sub_10000C19C((void *)qword_10005C030, "StoreDemoMode", v396);
    v398 = (id)qword_10005C018;
    if (os_log_type_enabled(v398, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "StoreDemoMode";
      _os_log_impl((void *)&_mh_execute_header, v398, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v397);
  }
  else
  {
    v399 = (id)qword_10005C018;
    if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR)) {
      sub_1000355D0(v399, v400, v401, v402, v403, v404, v405, v406);
    }
  }
  CFStringRef v407 = (const __CFString *)MGCopyAnswer();
  if (v407)
  {
    CFStringRef v408 = v407;
    sub_10000C19C((void *)qword_10005C030, "SupplementalBuildVersion", v407);
    v409 = (id)qword_10005C018;
    if (os_log_type_enabled(v409, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "SupplementalBuildVersion";
      _os_log_impl((void *)&_mh_execute_header, v409, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v408);
  }
  else
  {
    v410 = (id)qword_10005C018;
    if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR)) {
      sub_100035558(v410, v411, v412, v413, v414, v415, v416, v417);
    }
  }
  CFStringRef v418 = (const __CFString *)MGCopyAnswer();
  if (v418)
  {
    CFStringRef v419 = v418;
    sub_10000C19C((void *)qword_10005C030, "ThinningProductType", v418);
    v420 = (id)qword_10005C018;
    if (os_log_type_enabled(v420, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "ThinningProductType";
      _os_log_impl((void *)&_mh_execute_header, v420, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v419);
  }
  else
  {
    v421 = (id)qword_10005C018;
    if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR)) {
      sub_1000354E0(v421, v422, v423, v424, v425, v426, v427, v428);
    }
  }
  CFStringRef v429 = (const __CFString *)MGCopyAnswer();
  if (v429)
  {
    CFStringRef v430 = v429;
    sub_10000C19C((void *)qword_10005C030, "UniqueChipID", v429);
    v431 = (id)qword_10005C018;
    if (os_log_type_enabled(v431, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "UniqueChipID";
      _os_log_impl((void *)&_mh_execute_header, v431, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v430);
  }
  else
  {
    v432 = (id)qword_10005C018;
    if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR)) {
      sub_100035468(v432, v433, v434, v435, v436, v437, v438, v439);
    }
  }
  CFStringRef v440 = (const __CFString *)MGCopyAnswer();
  if (v440)
  {
    CFStringRef v441 = v440;
    sub_10000C19C((void *)qword_10005C030, "UniqueDeviceID", v440);
    v442 = (id)qword_10005C018;
    if (os_log_type_enabled(v442, OS_LOG_TYPE_INFO))
    {
      int v451 = 136315138;
      v452 = "UniqueDeviceID";
      _os_log_impl((void *)&_mh_execute_header, v442, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v441);
  }
  else
  {
    v443 = (id)qword_10005C018;
    if (os_log_type_enabled(v443, OS_LOG_TYPE_ERROR)) {
      sub_1000353F0(v443, v444, v445, v446, v447, v448, v449, v450);
    }
  }
}

size_t sub_10000EB28(const char *a1, char **a2)
{
  *__error() = 0;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v21 = v4;
  long long v22 = v4;
  long long v19 = v4;
  long long v20 = v4;
  long long v17 = v4;
  long long v18 = v4;
  *(_OWORD *)__s1 = v4;
  long long v16 = v4;
  size_t size = 128;
  int v5 = sysctlbyname(a1, __s1, &size, 0, 0);
  int v6 = v5;
  if (size)
  {
    if (v5) {
      return 0;
    }
  }
  else
  {
    size_t size = 128;
    *__error() = 12;
    if (v6) {
      return 0;
    }
  }
  if (size != 128 || *__error() != 12) {
    goto LABEL_12;
  }
  int v8 = sysctlbyname(a1, 0, &size, 0, 0);
  size_t result = 0;
  if (v8) {
    return result;
  }
  if (size < 0x81)
  {
LABEL_12:
    CFStringRef v11 = 0;
    uint64_t v10 = __s1;
LABEL_13:
    *a2 = strdup(v10);
    uint64_t v10 = v11;
    goto LABEL_14;
  }
  uint64_t v9 = (char *)malloc_type_malloc(size, 0x22094D1AuLL);
  if (!v9) {
    sub_100036728(&v12, v14);
  }
  uint64_t v10 = v9;
  if (!sysctlbyname(a1, v9, &size, 0, 0))
  {
    CFStringRef v11 = v10;
    goto LABEL_13;
  }
  size_t size = 0;
LABEL_14:
  free(v10);
  return size;
}

double sub_10000ECB0(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_10000ECF8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL sub_10000ED04()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_10000ED1C()
{
  return _os_crash_msg();
}

void sub_10000ED34(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10000ED54(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000ED8C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000EDA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000EDD0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000EDF0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t sub_10000EE10()
{
  if (qword_10005BD10 != -1) {
    dispatch_once(&qword_10005BD10, &stru_100055370);
  }
  return byte_10005BD08;
}

void sub_10000EE54(id a1)
{
  CFStringRef v1 = (const __CFString *)MGCopyAnswer();
  if (v1)
  {
    CFStringRef v2 = v1;
    CFTypeID v3 = CFGetTypeID(v1);
    if (v3 != CFStringGetTypeID())
    {
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      _os_log_send_and_compose_impl();
      uint64_t v4 = _os_crash_msg();
      sub_100036794(v4);
    }
    byte_10005BD08 = CFEqual(v2, @"AppleDisplay");
    CFRelease(v2);
  }
  else
  {
    byte_10005BD08 = 0;
  }
}

void sub_10000EFC8(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EFF8()
{
  if (qword_10005BD20 != -1) {
    dispatch_once(&qword_10005BD20, &stru_100055390);
  }
  return byte_10005BD18;
}

void sub_10000F03C(id a1)
{
  id v1 = (id)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    byte_10005BD18 = [v1 BOOLValue];
  }
}

unint64_t sub_10000F0AC()
{
  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  if (clock_gettime(_CLOCK_REALTIME, &__tp)) {
    sub_100036798(&v3, v5);
  }
  __tp.tv_sec += 2208988800;
  unsigned int v0 = sntp_datestamp_from_timespec(__tp.tv_sec);
  return sntp_timestamp_from_datestamp(v0, v1);
}

id sub_10000F138(unint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  memset(bytes, 0, sizeof(bytes));
  LOBYTE(bytes[0]) = 35;
  unint64_t v10 = sntp_timestamp_hton(a1);
  xpc_object_t v4 = xpc_data_create(bytes, 0x30uLL);
  if (!v4) {
    sub_10003684C(&v7, v11);
  }
  uint64_t v5 = v4;

  return v5;
}

id sub_10000F1F4(void *a1, void *a2)
{
  id v3 = a1;
  xpc_object_t v4 = a2;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v15 = v5;
  long long v16 = v5;
  _OWORD bytes[2] = v5;
  long long buffer = v5;
  bytes[0] = v5;
  bytes[1] = v5;
  unint64_t v6 = sub_10000F0AC();
  unint64_t v7 = sntp_timestamp_hton(v6);
  if (xpc_data_get_bytes(v3, &buffer, 0, 0x30uLL) == 48)
  {
    v17[0] = buffer;
    v17[1] = v15;
    v17[2] = v16;
    long long v11 = xmmword_100044DD8;
    unint64_t v12 = v7;
    sntp_server_respond((uint64_t)v17, (uint64_t)&v11, (uint64_t (*)(void))sub_10000F0AC, (uint64_t)bytes);
    xpc_object_t v8 = xpc_data_create(bytes, 0x30uLL);
    if (!v8) {
      sub_10003684C(&v11, v17);
    }
    uint64_t v9 = v8;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000368E4(v4);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_10000F344(unint64_t a1, void *a2, void *a3)
{
  unint64_t v32 = a1;
  xpc_object_t v4 = a3;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[3] = v5;
  v31[4] = v5;
  v31[1] = v5;
  v31[2] = v5;
  long long v30 = v5;
  v31[0] = v5;
  long long buffer = v5;
  long long v29 = v5;
  if (xpc_data_get_bytes(a2, &buffer, 0, 0x30uLL) == 48)
  {
    unint64_t v27 = sub_10000F0AC();
    *(_OWORD *)&v37.modes = buffer;
    *(_OWORD *)&v37.freq = v29;
    *(_OWORD *)&v37.esterror = v30;
    sntp_client_process_response((unsigned __int8 *)&v37, &v32, &v27, (uint64_t)v31);
    int v6 = v31[0];
    if (LODWORD(v31[0]))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100036A30(v6, v4);
      }
      goto LABEL_29;
    }
    unint64_t v7 = sntp_calc_offset((uint64_t)v31);
    unint64_t v9 = v8;
    uint64_t v10 = v27;
    long long v11 = v4;
    uint64_t v12 = sntp_datestamp_to_nsec(v7, v9);
    unint64_t v13 = sntp_timestamp_to_datestamp(v10);
    uint64_t v15 = sntp_datestamp_to_timespec(v13, v14);
    uint64_t v17 = v16;
    uint64_t v18 = v15 - 2208988800;
    v33[0] = v15 - 2208988800;
    v33[1] = v16;
    if (v12 >= 0) {
      unint64_t v19 = v12;
    }
    else {
      unint64_t v19 = -v12;
    }
    if (!v7 && v19 < 0x7A12000)
    {
      *(void *)&v37.modes = 8209;
      memset(&v37.freq, 0, 120);
      v37.offset = v12;
      v37.status = 1;
      int v20 = ntp_adjtime(&v37);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 134218496;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v37.offset;
        __int16 v35 = 2048;
        uint64_t v36 = v37.freq / 0x10000;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "PACING with ntp_adjtime of %lld ns => resulting offset: %ld ns freq: %ld PPM", buf, 0x20u);
      }
      if (v20 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000369B8(v20, v11);
      }
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v21 = sntp_datestamp_to_timespec(v7, v9);
    uint64_t v23 = v22 + v17;
    *(void *)uint64_t buf = v21 + v18;
    *(void *)&buf[8] = v22 + v17;
    if (v22 + v17 <= 999999999)
    {
      if ((v23 & 0x8000000000000000) == 0)
      {
LABEL_22:
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v37.modes = 68158466;
          *(&v37.modes + 1) = 16;
          LOWORD(v37.offset) = 2096;
          *(uint64_t *)((char *)&v37.offset + 2) = (uint64_t)v33;
          WORD1(v37.freq) = 1040;
          HIDWORD(v37.freq) = 16;
          LOWORD(v37.maxerror) = 2096;
          *(uint64_t *)((char *)&v37.maxerror + 2) = (uint64_t)buf;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setting time from %{timespec}.*P to %{timespec}.*P", (uint8_t *)&v37, 0x22u);
        }
        if (clock_settime(_CLOCK_REALTIME, (const timespec *)buf))
        {
          uint64_t v26 = v11;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_100036928(v26);
          }
        }
        goto LABEL_28;
      }
      uint64_t v24 = 1000000000;
      uint64_t v25 = -1;
    }
    else
    {
      uint64_t v24 = -1000000000;
      uint64_t v25 = 1;
    }
    *(void *)uint64_t buf = v21 + v18 + v25;
    *(void *)&buf[8] = v24 + v23;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100036AA8(v4);
  }
LABEL_29:
}

void sub_10000FA14(void *a1)
{
  id v2 = a1;
  if (!qword_10005BD28)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_host");
    xpc_object_t v4 = (void *)qword_10005BD30;
    qword_10005BD30 = (uint64_t)v3;

    long long v5 = qword_10005BD30;
    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing ncm host backend", buf, 2u);
    }
    objc_storeStrong((id *)&qword_10005BD28, a1);
    uint64_t v6 = objc_opt_new();
    unint64_t v7 = (void *)qword_10005BD38;
    qword_10005BD38 = v6;

    id v8 = (id)qword_10005BD38;
    if (!v8) {
      sub_100036AEC(&v23, buf);
    }

    uint64_t v9 = objc_opt_new();
    uint64_t v10 = (void *)qword_10005BD40;
    qword_10005BD40 = v9;

    id v11 = (id)qword_10005BD40;
    if (!v11) {
      sub_100036B7C(&v23, buf);
    }

    if (qword_10005BD48) {
      sub_100036C9C(&v23, buf);
    }
    uint64_t v12 = sub_1000121DC((void *)qword_10005BD28);
    qword_10005BD48 = (uint64_t)v12;
    if (!v12) {
      sub_100036C0C(&v23, buf);
    }
    unint64_t v13 = IOServiceMatching("AppleUSBNCMData");
    if (!v13)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v23 = 134217984;
      uint64_t v24 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v19 = _os_crash_msg();
      sub_100036794(v19);
    }
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    uint64_t v15 = Mutable;
    if (!Mutable)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v23 = 134217984;
      uint64_t v24 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v20 = _os_crash_msg();
      sub_100036794(v20);
    }
    CFDictionarySetValue(Mutable, @"IOModel", @"USB");
    int valuePtr = 1452;
    CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v15, @"idVendor", v16);
    CFDictionarySetValue(v13, @"IOPropertyMatch", v15);
    uint64_t v17 = IOServiceMatching("IOEthernetInterface");
    CFDictionaryRef v18 = v17;
    if (!v17)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v23 = 134217984;
      uint64_t v24 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v21 = _os_crash_msg();
      sub_100036794(v21);
    }
    CFDictionarySetValue(v17, @"IOParentMatch", v13);
    if (v16) {
      CFRelease(v16);
    }
    CFRelease(v15);
    CFRelease(v13);
    sub_1000122E8((uint64_t)v12, (IOServiceMatchingCallback)sub_10000FF48, v18);
  }
}

void sub_10000FED8(_Unwind_Exception *a1)
{
  CFRelease(v2);
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000FF48(uint64_t a1, io_iterator_t iterator)
{
  kern_return_t v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  BOOL v27;
  CFStringRef v28;
  NSObject *v29;
  char v30;
  long long v31;
  io_registry_entry_t v32;
  __CFString *v33;
  NSObject *v34;
  kern_return_t Name;
  NSObject *v36;
  NSObject *v37;
  BOOL v38;
  char v40;
  char v41[15];
  char v42;
  char v43[11];
  int v44;
  char v45;
  char v46[15];
  char v47;
  char v48[15];
  char v49;
  char v50[11];
  io_iterator_t iteratora;
  uint8_t v52[4];
  __CFString *v53;
  uint8_t buf[16];
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;

  if (!a1) {
    sub_100036D2C(v52, buf);
  }
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v4 = result;
    do
    {
      CFStringRef v44 = v4;
      long long v5 = qword_10005BD30;
      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NCM device attached", buf, 2u);
      }
      uint64_t v6 = qword_10005BD30;
      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }
      *(_DWORD *)uint64_t buf = 0;
      int v7 = -5;
      do
      {
        if (sub_100011FB8(v4, buf))
        {
          if (*(_DWORD *)buf != 4372) {
            goto LABEL_17;
          }
          if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEBUG)) {
            sub_100036E64(&v42, v43);
          }
          goto LABEL_22;
        }
        usleep(0x186A0u);
      }
      while (!__CFADD__(v7++, 1));
      uint64_t v9 = qword_10005BD30;
      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to extract productid, fallback to false", v52, 2u);
      }
LABEL_17:
      uint64_t v10 = sub_100011810(v4);
      if (v10)
      {
LABEL_18:
        id v11 = [RSDNCMInterface alloc];
        uint64_t v12 = [(RSDNCMInterface *)v11 initWithService:v4 notificationPort:a1 queue:qword_10005BD28];
        unint64_t v13 = v12;
        if (v12)
        {
          [(RSDNCMInterface *)v12 setIs_private:v10];
          unint64_t v14 = v13;
          [(RSDNCMInterface *)v14 setInactive_callback:&stru_1000553F8];
          [(RSDNCMInterface *)v14 setAddressed_callback:&stru_100055418];
          [(RSDNCMInterface *)v14 setDetached_callback:&stru_100055438];

          if ([(RSDNCMInterface *)v14 activate])
          {
            uint64_t v15 = [[RSDRemoteNCMHostDevice alloc] initWithInterface:v14];
            [(RSDNCMInterface *)v14 setDevice:v15];
            *(_DWORD *)uint64_t buf = -1431655766;
            CFNumberRef v16 = v15;
            uint64_t v17 = [(RSDRemoteNCMDevice *)v16 interface];
            sub_100011E3C((io_registry_entry_t)[v17 service], buf);

            [(RSDRemoteDevice *)v16 setBackendProperty:"LocationID" withUint:*(unsigned int *)buf];
            [(RSDRemoteNCMHostDevice *)v16 attach];
            [(id)qword_10005BD38 addObject:v14];
          }
        }

        goto LABEL_22;
      }
      iteratora = 0;
      CFStringRef v18 = IOObjectCopyClass(v4);
      CFStringRef v19 = v18;
      if (v18)
      {
        if (CFStringCompare(v18, @"IOEthernetInterface", 0))
        {
          uint64_t v20 = qword_10005BD30;
          if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138412290;
            *(void *)&uint8_t buf[4] = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unsupported class %@", buf, 0xCu);
          }
        }
        else
        {
          io_object_t v21 = sub_1000118BC(v4, 3);
          io_registry_entry_t v22 = v21;
          if (v21)
          {
            if (IOObjectConformsTo(v21, "IOUSBDevice"))
            {
              int v23 = IORegistryEntryCreateIterator(v22, "IOService", 0, &iteratora);
              if (v23)
              {
                uint64_t v24 = qword_10005BD30;
                if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)uint64_t buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v23;
                  _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateIterator failed: 0x%08x", buf, 8u);
                }
LABEL_44:
                LODWORD(v28) = 0;
LABEL_45:
                long long v30 = 0;
              }
              else
              {
                *(void *)&uint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
                uint64_t v60 = v31;
                uint64_t v61 = v31;
                long long v58 = v31;
                uint64_t v59 = v31;
                CFStringRef v56 = v31;
                long long v57 = v31;
                *(_OWORD *)uint64_t buf = v31;
                CFStringRef v55 = v31;
                while (1)
                {
                  unint64_t v32 = IOIteratorNext(iteratora);
                  LODWORD(v28) = v32;
                  if (!v32) {
                    break;
                  }
                  CFStringRef v33 = (__CFString *)sub_100011960(v32);
                  CFStringRef v34 = qword_10005BD30;
                  if (v33)
                  {
                    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)uint64_t v52 = 136315138;
                      uint64_t v53 = v33;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Iterating %s", v52, 0xCu);
                    }
                    free(v33);
                    Name = IORegistryEntryGetName((io_registry_entry_t)v28, (char *)buf);
                    if (Name)
                    {
                      uint64_t v36 = qword_10005BD30;
                      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)uint64_t v52 = 67109120;
                        LODWORD(v53) = Name;
                        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: 0x%08x", v52, 8u);
                      }
                    }
                    else if (!(*(void *)buf ^ 0x61746144204D434ELL | buf[8]) {
                           && sub_100011810((io_registry_entry_t)v28))
                    }
                    {
                      IOObjectRelease((io_object_t)v28);
                      LODWORD(v28) = 1;
                      break;
                    }
                    IOObjectRelease((io_object_t)v28);
                  }
                  else if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
                  {
                    sub_100036EF4(&v45, v46);
                  }
                }
                long long v30 = 1;
              }
              IOObjectRelease(v22);
              goto LABEL_62;
            }
            long long v28 = IOObjectCopyClass(v22);
            long long v29 = qword_10005BD30;
            if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = 138412290;
              *(void *)&uint8_t buf[4] = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unexpected 3rd parent class %@", buf, 0xCu);
              if (!v28) {
                goto LABEL_45;
              }
            }
            else if (!v28)
            {
              goto LABEL_45;
            }
            CFRelease(v28);
            goto LABEL_44;
          }
          uint64_t v25 = (__CFString *)sub_100011960(v4);
          long long v26 = qword_10005BD30;
          long long v27 = os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            if (v27)
            {
              *(_DWORD *)uint64_t buf = 136315138;
              *(void *)&uint8_t buf[4] = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Can't find 3rd parent for %s", buf, 0xCu);
            }
            free(v25);
          }
          else if (v27)
          {
            sub_100036EC8(&v47, v48);
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
      {
        sub_100036EC8(&v49, v50);
      }
      LODWORD(v28) = 0;
      long long v30 = 0;
LABEL_62:
      if (iteratora) {
        IOObjectRelease(iteratora);
      }
      if (v19) {
        CFRelease(v19);
      }
      if (v30)
      {
        timex v37 = qword_10005BD30;
        uint64_t v38 = os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT);
        if (!v28)
        {
          if (v38)
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Using the public NCM interface", buf, 2u);
          }
          goto LABEL_18;
        }
        if (v38)
        {
          *(_WORD *)uint64_t buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Not using the public NCM interface due to the existence of private NCM interface", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR))
      {
        sub_100036E9C(&v40, v41);
      }
LABEL_22:
      if (v4)
      {
        if (IOObjectRelease(v4)) {
          sub_100036DBC(v52, buf);
        }
      }
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

void sub_1000106C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,unsigned int a27)
{
  if (v27) {
    CFRelease(v27);
  }
  sub_1000117A8(&a27);
  _Unwind_Resume(a1);
}

void sub_100010C38(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) state] != 3)
  {
    id v2 = [*v1 connection];

    if (v2)
    {
      os_log_t v3 = qword_10005BD30;
      if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR)) {
        sub_100036FF8((uint64_t *)v1, v3);
      }
      uint64_t v4 = [*v1 connection];
      xpc_remote_connection_cancel();
    }
  }
}

id sub_10001132C(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

void sub_100011334(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    long long v5 = qword_10005BD30;
    if (os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_ERROR)) {
      sub_10003728C(a1, a3, v5);
    }
    [*(id *)(a1 + 32) connect:0];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) connection];

    int v7 = qword_10005BD30;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v12, 0xCu);
      }
      close(*(_DWORD *)(*(void *)(a1 + 32) + 304));
    }
    else
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v12, 0xCu);
      }
      xpc_remote_connection_get_failsafe_version_flags();
      id v11 = (void *)xpc_remote_connection_create_with_connected_fd();
      [*(id *)(a1 + 32) connect:v11];
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 304) = -1;
}

uint64_t sub_1000117A8(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_100037308(&v2, v3);
    }
  }
  return result;
}

uint64_t sub_100011810(io_registry_entry_t a1)
{
  int v8 = 0;
  int v2 = -5;
  do
  {
    if (sub_100011EE4(a1, &v8)) {
      return (HIBYTE(v8) >> 5) & 1;
    }
    usleep(0x186A0u);
  }
  while (!__CFADD__(v2++, 1));
  uint64_t v4 = qword_10005BD30;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_10005BD30, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v5)
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to extract nwifflags, fallback to false", v7, 2u);
    return 0;
  }
  return result;
}

uint64_t sub_1000118BC(io_registry_entry_t a1, int a2)
{
  if (!a1) {
    sub_10003739C(&v5, parent);
  }
  parent[0] = 0;
  uint64_t v3 = 0;
  if (!IORegistryEntryGetParentEntry(a1, "IOService", parent))
  {
    uint64_t v3 = parent[0];
    if (a2 != 1)
    {
      uint64_t v3 = sub_1000118BC(parent[0], (a2 - 1));
      IOObjectRelease(parent[0]);
    }
  }
  return v3;
}

CFStringRef sub_100011960(io_registry_entry_t a1)
{
  CFStringRef result = IORegistryEntryCopyPath(a1, "IOService");
  if (result)
  {
    CFStringRef v2 = result;
    uint64_t v3 = sub_10000C0E4(result);
    CFRelease(v2);
    return (const __CFString *)v3;
  }
  return result;
}

void sub_1000119A4(id a1, RSDNCMInterface *a2)
{
  id v2 = [(RSDNCMInterface *)a2 device];
  [v2 setSuspended:1];
}

void sub_1000119EC(id a1, RSDNCMInterface *a2)
{
  id v2 = [(RSDNCMInterface *)a2 device];
  sub_10002D0BC(v2);
  [v2 triggerNeedsConnect];
  [v2 setSuspended:0];
}

void sub_100011A44(id a1, RSDNCMInterface *a2)
{
  id v2 = a2;
  id v3 = [(RSDNCMInterface *)v2 device];
  [v3 disconnect];
  [(RSDNCMInterface *)v2 setDevice:0];
  [(id)qword_10005BD38 removeObject:v2];
}

double sub_100011AB4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_100011ACC()
{
  return _os_log_send_and_compose_impl();
}

unsigned char *sub_100011AF0(unsigned char *result, unsigned char *a2)
{
  *double result = 0;
  *a2 = 0;
  return result;
}

void sub_100011B00(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

const void *sub_100011B1C(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFBooleanGetTypeID());
  }
  return result;
}

BOOL sub_100011B54(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"IOLinkStatus", kCFAllocatorDefault, 3u);
    BOOL v2 = v4 != 0;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _os_assumes_log();
      }
      *a2 = [v4 unsignedIntValue];
    }
    else
    {
      uint64_t v5 = sub_100011C24();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100037410();
      }
    }
  }
  return v2;
}

id sub_100011C24()
{
  if (qword_10005BD58 != -1) {
    dispatch_once(&qword_10005BD58, &stru_100055458);
  }
  uint64_t v0 = (void *)qword_10005BD50;

  return v0;
}

BOOL sub_100011C78(io_registry_entry_t a1, char *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFStringRef v4 = (const __CFString *)IORegistryEntrySearchCFProperty(a1, "IOService", @"BSD Name", kCFAllocatorDefault, 3u);
    if (v4)
    {
      CFStringRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 != CFStringGetTypeID()) {
        _os_assumes_log();
      }
      CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
      int CString = CFStringGetCString(v5, a2, 16, SystemEncoding);
      BOOL v2 = CString != 0;
      if (CString && !*a2) {
        _os_assumes_log();
      }
      CFRelease(v5);
    }
    else
    {
      uint64_t v9 = sub_100011C24();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100037444();
      }

      return 0;
    }
  }
  return v2;
}

void sub_100011D64(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100011D84(io_registry_entry_t entry, void *a2)
{
  uint64_t result = 0;
  if (entry && a2)
  {
    CFTypeRef v5 = IORegistryEntrySearchCFProperty(entry, "IOService", @"USB Serial Number", kCFAllocatorDefault, 3u);
    *a2 = v5;
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(v5);
      if (v6 != CFStringGetTypeID()) {
        _os_assumes_log();
      }
      return 1;
    }
    else
    {
      int v7 = sub_100011C24();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100037478();
      }

      return 0;
    }
  }
  return result;
}

BOOL sub_100011E3C(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFStringRef v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"locationID", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0;
    if (v4)
    {
      *a2 = [v4 unsignedIntValue];
    }
    else
    {
      CFTypeID v6 = sub_100011C24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000374AC();
      }
    }
  }
  return v2;
}

uint64_t sub_100011EE4(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    CFTypeRef v5 = IORegistryEntrySearchCFProperty(a1, "IOService", @"NetworkInterfaceFlags", kCFAllocatorDefault, 3u);
    if (v5
      || (CFTypeRef v5 = IORegistryEntrySearchCFProperty(a1, "IOService", @"NetworkInterfaceFlags", kCFAllocatorDefault, 1u)) != 0)
    {
      *a2 = [v5 unsignedIntValue];
      uint64_t v2 = 1;
    }
    else
    {
      CFTypeRef v5 = sub_100011C24();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_1000374E0();
      }
      uint64_t v2 = 0;
    }
  }
  return v2;
}

BOOL sub_100011FB8(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFStringRef v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"idProduct", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0;
    if (v4)
    {
      *a2 = [v4 unsignedIntValue];
    }
    else
    {
      CFTypeID v6 = sub_100011C24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100037514();
      }
    }
  }
  return v2;
}

BOOL sub_100012060(io_registry_entry_t a1, _DWORD *a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFStringRef v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"HostState", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0;
    if (v4)
    {
      *a2 = [v4 unsignedIntValue];
    }
    else
    {
      CFTypeID v6 = sub_100011C24();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100037548();
      }
    }
  }
  return v2;
}

BOOL sub_100012108(io_registry_entry_t a1, uint64_t a2)
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    CFStringRef v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", @"IOMACAddress", kCFAllocatorDefault, 3u);
    CFTypeRef v5 = v4;
    BOOL v2 = v4 != 0;
    if (v4)
    {
      if ((unint64_t)[v4 length] <= 5) {
        _os_assumes_log();
      }
      CFTypeID v6 = [v5 bytes];
      __int16 v7 = v6[2];
      *(_DWORD *)a2 = *(_DWORD *)v6;
      *(_WORD *)(a2 + 4) = v7;
    }
    else
    {
      int v8 = sub_100011C24();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10003757C();
      }
    }
  }
  return v2;
}

id *sub_1000121DC(void *a1)
{
  id v2 = a1;
  id v3 = (id *)malloc_type_calloc(1uLL, 0x20uLL, 0x10A00403DD93119uLL);
  if (!v3) {
    sub_1000375B0(&v8, v9);
  }
  CFStringRef v4 = v3;
  objc_storeStrong(v3, a1);
  if (IOMainPort(0, (mach_port_t *)v4 + 2)) {
    os_assert_mach();
  }
  IONotificationPortRef v5 = IONotificationPortCreate(*((_DWORD *)v4 + 2));
  v4[2] = v5;
  if (!v5) {
    sub_10003761C(&v8, v9);
  }
  id v6 = *v4;
  if (!v6) {
    sub_100037688(&v8, v9);
  }

  IONotificationPortSetDispatchQueue((IONotificationPortRef)v4[2], (dispatch_queue_t)*v4);
  return v4;
}

void sub_1000122E8(uint64_t a1, IOServiceMatchingCallback callback, const __CFDictionary *a3)
{
  kern_return_t v5;
  NSObject *v6;
  NSObject *v7;
  void v8[6];
  uint64_t v9;
  _OWORD v10[5];

  if (!a1) {
    sub_1000375B0(&v9, v10);
  }
  IONotificationPortRef v5 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 16), "IOServiceFirstMatch", a3, callback, *(void **)(a1 + 16), (io_iterator_t *)(a1 + 24));
  id v6 = sub_100011C24();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000376F4(v5, v6);
  }

  if (v5)
  {
    _os_assumes_log();
  }
  else
  {
    __int16 v7 = *(NSObject **)a1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012408;
    v8[3] = &unk_100054FC8;
    void v8[4] = a1;
    v8[5] = callback;
    dispatch_async(v7, v8);
  }
}

uint64_t sub_100012408(uint64_t a1)
{
  id v2 = sub_100011C24();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10003776C(a1, v2);
  }

  return (*(uint64_t (**)(void, void))(a1 + 40))(*(void *)(*(void *)(a1 + 32) + 16), *(unsigned int *)(*(void *)(a1 + 32) + 24));
}

uint64_t sub_100012464(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_1000377EC(&v2, v3);
    }
  }
  return result;
}

uint64_t sub_1000124CC(const char *a1, const char *a2, IOOptionBits a3)
{
  kern_return_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  kern_return_t v18;
  kern_return_t v19;
  io_registry_entry_t v21;
  long long v22;
  kern_return_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  int *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  io_iterator_t iterator[2];
  char *path;
  io_name_t name;
  void buf[2];
  uint64_t v36;

  *(void *)iterator = 0;
  path = 0;
  if (!a2)
  {
    uint64_t v36 = 0;
    memset(name, 0, 80);
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    LODWORD(buf[0]) = 134217984;
    *(void *)((char *)buf + 4) = 0;
    _os_log_send_and_compose_impl();
    uint64_t v25 = _os_crash_msg();
    sub_100036794(v25);
  }
  if (a1)
  {
    if (asprintf(&path, "IODeviceTree:/%s", a1) < 0)
    {
      uint64_t v36 = 0;
      memset(name, 0, 80);
      long long v26 = &_os_log_default;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      long long v27 = __error();
      long long v28 = strerror(*v27);
      LODWORD(buf[0]) = 136315138;
      *(void *)((char *)buf + 4) = v28;
      _os_log_send_and_compose_impl();

      long long v29 = _os_crash_msg();
      sub_100036794(v29);
    }
    IONotificationPortRef v5 = path;
  }
  else
  {
    IONotificationPortRef v5 = "IODeviceTree:/";
  }
  io_iterator_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, v5);
  io_object_t v7 = v6;
  iterator[1] = v6;
  if (v6)
  {
    uint64_t v8 = IORegistryEntryCreateIterator(v6, "IODeviceTree", a3, iterator);
    if (v8)
    {
      uint64_t v9 = sub_100011C24();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100037908(v8, v9);
      }
    }
    else
    {
      while (1)
      {
        io_object_t v21 = IOIteratorNext(iterator[0]);
        if (!v21) {
          break;
        }
        *(void *)&io_registry_entry_t v22 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&name[96] = v22;
        *(_OWORD *)&name[112] = v22;
        *(_OWORD *)&name[64] = v22;
        *(_OWORD *)&name[80] = v22;
        *(_OWORD *)&name[32] = v22;
        *(_OWORD *)&name[48] = v22;
        *(_OWORD *)name = v22;
        *(_OWORD *)&name[16] = v22;
        int v23 = IORegistryEntryGetName(v21, name);
        if (v23)
        {
          uint64_t v24 = sub_100011C24();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = 67109120;
            HIDWORD(buf[0]) = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName: %d", (uint8_t *)buf, 8u);
          }
        }
        else if (!strcmp(a2, name))
        {
          uint64_t v17 = 1;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    uint64_t v10 = sub_100011C24();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003789C((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  uint64_t v17 = 0;
LABEL_15:
  if (iterator[0])
  {
    CFStringRef v18 = IOObjectRelease(iterator[0]);
    if (v18)
    {
      buf[0] = 0;
      memset(name, 0, 80);
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      LODWORD(v36) = 67109120;
      HIDWORD(v36) = v18;
      _os_log_send_and_compose_impl();
      long long v30 = _os_crash_msg();
      sub_100036794(v30);
    }
  }
  if (v7)
  {
    CFStringRef v19 = IOObjectRelease(v7);
    if (v19)
    {
      buf[0] = 0;
      memset(name, 0, 80);
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      LODWORD(v36) = 67109120;
      HIDWORD(v36) = v19;
      _os_log_send_and_compose_impl();
      uint64_t v31 = _os_crash_msg();
      sub_100036794(v31);
    }
  }
  free(path);
  return v17;
}

void sub_100012954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, __int16 a14, char a15, char a16, void *a17)
{
}

void sub_1000129A4(id a1)
{
  qword_10005BD50 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "iokit");

  _objc_release_x1();
}

void sub_1000129E8(void *a1)
{
  id v2 = a1;
  if (!qword_10005BD60 && (sub_10000EE10() & 1) == 0)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_device");
    CFStringRef v4 = (void *)qword_10005BD68;
    qword_10005BD68 = (uint64_t)v3;

    IONotificationPortRef v5 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing ncm device backend", buf, 2u);
    }
    objc_storeStrong((id *)&qword_10005BD60, a1);
    uint64_t v6 = objc_opt_new();
    io_object_t v7 = (void *)qword_10005BD70;
    qword_10005BD70 = v6;

    id v8 = (id)qword_10005BD70;
    if (!v8) {
      sub_100037980(&v14, buf);
    }

    if (qword_10005BD78) {
      sub_100037B30(&v14, buf);
    }
    uint64_t v9 = sub_1000121DC((void *)qword_10005BD60);
    qword_10005BD78 = (uint64_t)v9;
    if (!v9) {
      sub_100037A10(&v14, buf);
    }
    CFMutableDictionaryRef v10 = IOServiceMatching("AppleUSBDeviceNCMData");
    if (!v10) {
      sub_100037AA0(&v14, buf);
    }
    id v11 = IOServiceMatching("IOEthernetInterface");
    CFDictionaryRef v12 = v11;
    if (!v11)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v14 = 134217984;
      uint64_t v15 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v13 = _os_crash_msg();
      sub_100036794(v13);
    }
    CFDictionarySetValue(v11, @"IOParentMatch", v10);
    CFRelease(v10);
    sub_1000122E8((uint64_t)v9, (IOServiceMatchingCallback)sub_100012C78, v12);
  }
}

void sub_100012C50(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100012C78(uint64_t a1, io_iterator_t iterator)
{
  if (!a1) {
    sub_100037BC0(&v26, v32);
  }
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v4 = result;
    *(void *)&long long v3 = 67109120;
    long long v23 = v3;
    while (1)
    {
      IONotificationPortRef v5 = qword_10005BD68;
      if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)unint64_t v32 = v23;
        *(_DWORD *)&v32[4] = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", v32, 8u);
      }
      CFStringRef v6 = IOObjectCopyClass(v4);
      CFComparisonResult v7 = CFStringCompare(v6, @"AppleUSBDeviceNCMPrivateEthernetInterface", 0);
      if (v6) {
        CFRelease(v6);
      }
      if (v7 == kCFCompareEqualTo) {
        goto LABEL_29;
      }
      id v8 = (void *)IORegistryEntrySearchCFProperty(v4, "IOService", @"DeviceDescription", kCFAllocatorDefault, 3u);
      if (!v8) {
        break;
      }
      id v9 = v8;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      CFMutableDictionaryRef v10 = [v9 objectForKeyedSubscript:@"ConfigurationDescriptors"];
      id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v27 != v12) {
              objc_enumerationMutation(v10);
            }
            int v14 = [[*(id *)(*((void *)&v26 + 1) + 8 * i) objectForKeyedSubscript:@"Interfaces"] intValue];
            uint64_t v15 = qword_10005BD68;
            if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t buf = 138543362;
              uint64_t v31 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "interfaces: %{public}@", buf, 0xCu);
            }
            unsigned __int8 v16 = [v14 containsObject:@"AppleUSBNCMDataAux"];

            if (v16)
            {
              int v17 = 1;
              goto LABEL_22;
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      int v17 = 0;
LABEL_22:

      CFRelease(v9);
      long long v18 = qword_10005BD68;
      if (!v17) {
        goto LABEL_27;
      }
      if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not using the public NCM interface due to the existence of private NCM interface", v32, 2u);
      }
LABEL_33:
      if (v4)
      {
        if (IOObjectRelease(v4)) {
          sub_100037C50(&v26, v32);
        }
      }
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v4 = result;
      if (!result) {
        return result;
      }
    }
    long long v18 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to find USB device for interface", buf, 2u);
      long long v18 = qword_10005BD68;
    }
LABEL_27:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using the public NCM interface", v32, 2u);
    }
LABEL_29:
    long long v19 = [RSDNCMInterface alloc];
    long long v20 = [(RSDNCMInterface *)v19 initWithService:v4 notificationPort:a1 queue:qword_10005BD60];
    io_object_t v21 = v20;
    if (v20)
    {
      [(RSDNCMInterface *)v20 setIs_private:v7 == kCFCompareEqualTo];
      io_registry_entry_t v22 = v21;
      [(RSDNCMInterface *)v22 setInactive_callback:&stru_100055510];
      [(RSDNCMInterface *)v22 setAddressed_callback:&stru_100055530];
      [(RSDNCMInterface *)v22 setDetached_callback:&stru_100055550];

      if ([(RSDNCMInterface *)v22 activate]) {
        [(id)qword_10005BD70 addObject:v22];
      }
    }

    goto LABEL_33;
  }
  return result;
}

void sub_100013094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, unsigned int a17)
{
  CFRelease(v17);
  sub_1000117A8(&a17);
  _Unwind_Resume(a1);
}

id sub_100013B70(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if (result != 5)
  {
    long long v3 = *(void **)(a1 + 32);
    return [v3 createBonjourListener];
  }
  return result;
}

void sub_100013BC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = qword_10005BD68;
  if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> %{public}@ got incoming remoted connection", (uint8_t *)&v12, 0x16u);
  }
  xpc_remote_connection_get_failsafe_version_flags();
  CFStringRef v6 = (void *)xpc_remote_connection_create_with_nw_connection();
  CFComparisonResult v7 = [*(id *)(a1 + 32) connection];

  if (v7)
  {
    id v8 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> Canceling existing connection to replace it", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(v10 + 304))
    {
      xpc_remote_connection_cancel();
      uint64_t v10 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v10 + 304), v6);
    id v11 = [*(id *)(a1 + 32) connection];
    xpc_remote_connection_cancel();
  }
  else
  {
    [*(id *)(a1 + 32) connect:v6];
  }
}

void sub_100013D68(uint64_t a1, int a2, void *a3)
{
  uint64_t v5 = a3;
  CFStringRef v6 = v5;
  if (a2 == 3)
  {
    long long v20 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_ERROR)) {
      sub_100037E6C(a1, (uint64_t)v6, v20);
    }
    nw_error_domain_t error_domain = nw_error_get_error_domain(v6);
    int error_code = nw_error_get_error_code(v6);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel(*(nw_listener_t *)(*(void *)(a1 + 32) + 312));
      dispatch_time_t v23 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000140A4;
      block[3] = &unk_1000550D0;
      block[4] = *(void *)(a1 + 32);
      dispatch_after(v23, (dispatch_queue_t)qword_10005BD60, block);
    }
  }
  else if (a2 == 2)
  {
    CFComparisonResult v7 = (void *)qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = v7;
      uint64_t v10 = (void *)nw_listener_copy_local_endpoint();
      *(_DWORD *)uint64_t buf = 138544130;
      uint64_t v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v10;
      __int16 v30 = 1024;
      int v31 = 2;
      __int16 v32 = 2112;
      CFStringRef v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@> listening on %@ (state %u, error %@)", buf, 0x26u);
    }
    int port = nw_listener_get_port(*(nw_listener_t *)(*(void *)(a1 + 32) + 312));
    if (port)
    {
      int v12 = port;
      uint64_t v13 = qword_10005BD68;
      if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t buf = 138543618;
        uint64_t v27 = v14;
        __int16 v28 = 1024;
        LODWORD(v29) = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@> listener port: %u", buf, 0x12u);
      }
      id v15 = (void *)nw_listener_copy_local_endpoint();
      if (v15)
      {
        uint64_t description = nw_endpoint_get_description();
        if (description)
        {
          uint64_t v17 = description;
          long long v18 = qword_10005BD68;
          if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = *(void *)(a1 + 32);
            *(_DWORD *)uint64_t buf = 138543618;
            uint64_t v27 = v19;
            __int16 v28 = 2080;
            uint64_t v29 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@> listener local endpoint: %s", buf, 0x16u);
          }
        }
      }
    }
  }
  else if (v5)
  {
    uint64_t v24 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_ERROR)) {
      sub_100037DF0(a1, (uint64_t)v6, v24);
    }
  }
}

id sub_1000140A4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if (result != 5)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 createBonjourListener];
  }
  return result;
}

void sub_1000140F4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  CFStringRef v6 = qword_10005BD68;
  if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = "removed";
    int v9 = 138543874;
    if (a3) {
      uint64_t v8 = "added";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2080;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> advertised endpoint %@ %s", (uint8_t *)&v9, 0x20u);
  }
}

id sub_1000144B4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if (result != 5)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 createPortListener];
  }
  return result;
}

uint64_t sub_100014504(uint64_t a1)
{
  int v11 = -1431655766;
  for (uint64_t result = sub_10001FD44(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_100044D80, &v11);
        !result;
        uint64_t result = sub_10001FD44(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_100044D80, &v11))
  {
    id v3 = qword_10005BD68;
    if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t buf = 138543362;
      uint64_t v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Got incoming remoted connection", buf, 0xCu);
    }
    xpc_remote_connection_get_failsafe_version_flags();
    id v5 = (void *)xpc_remote_connection_create_with_connected_fd();
    CFStringRef v6 = [*(id *)(a1 + 32) connection];

    if (v6)
    {
      uint64_t v7 = qword_10005BD68;
      if (os_log_type_enabled((os_log_t)qword_10005BD68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t buf = 138543362;
        uint64_t v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Canceling existing connection to replace it", buf, 0xCu);
      }
      uint64_t v9 = *(void *)(a1 + 32);
      if (*(void *)(v9 + 304))
      {
        xpc_remote_connection_cancel();
        uint64_t v9 = *(void *)(a1 + 32);
      }
      objc_storeStrong((id *)(v9 + 304), v5);
      uint64_t v10 = [*(id *)(a1 + 32) connection];
      xpc_remote_connection_cancel();
    }
    else
    {
      [*(id *)(a1 + 32) connect:v5];
    }
  }
  return result;
}

uint64_t sub_100014700(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100014770(id a1, RSDNCMInterface *a2)
{
  uint64_t v4 = a2;
  id v2 = [(RSDNCMInterface *)v4 device];

  if (v2)
  {
    id v3 = [(RSDNCMInterface *)v4 device];
    [v3 disconnect];

    [(RSDNCMInterface *)v4 setDevice:0];
  }
}

void sub_1000147E8(id a1, RSDNCMInterface *a2)
{
  uint64_t v7 = a2;
  id v2 = [(RSDNCMInterface *)v7 device];

  if (v2)
  {
    id v3 = [(RSDNCMInterface *)v7 device];
    [v3 disconnect];

    [(RSDNCMInterface *)v7 setDevice:0];
  }
  uint64_t v4 = [[RSDRemoteNCMDeviceDevice alloc] initWithInterface:v7];
  [(RSDNCMInterface *)v7 setDevice:v4];

  id v5 = [(RSDNCMInterface *)v7 device];
  sub_10002D0BC(v5);

  CFStringRef v6 = [(RSDNCMInterface *)v7 device];
  [v6 attach];
}

void sub_1000148B8(id a1, RSDNCMInterface *a2)
{
  uint64_t v4 = a2;
  id v2 = [(RSDNCMInterface *)v4 device];

  if (v2)
  {
    id v3 = [(RSDNCMInterface *)v4 device];
    [v3 disconnect];

    [(RSDNCMInterface *)v4 setDevice:0];
  }
  [(id)qword_10005BD70 removeObject:v4];
}

void sub_100014940(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_100014960(int a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v6, _nw_parameters_configure_protocol_default_configuration);
  if (!a1) {
    sub_100037F70(&v13, v14);
  }
  uint64_t v8 = secure_tcp;
  uint64_t v9 = nw_interface_create_with_index();
  if (v9)
  {
    nw_parameters_require_interface(v8, v9);
    nw_parameters_set_local_only(v8, 1);
    nw_parameters_set_required_address_family();
    nw_parameters_set_required_interface_type(v8, nw_interface_type_wired);
    nw_parameters_set_no_fallback();
    nw_parameters_set_indefinite();
    xpc_remote_connection_setup_nw_parameters();
    uint64_t v10 = 0;
    *a3 = v8;
  }
  else
  {
    if (qword_10005BD88 != -1) {
      dispatch_once(&qword_10005BD88, &stru_100055570);
    }
    int v11 = qword_10005BD80;
    if (os_log_type_enabled((os_log_t)qword_10005BD80, OS_LOG_TYPE_ERROR)) {
      sub_10003801C(v11);
    }
    uint64_t v10 = 6;
  }

  return v10;
}

void sub_100014AD0(id a1)
{
  qword_10005BD80 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "bonjour");

  _objc_release_x1();
}

uint64_t sub_100014B14(const char *a1)
{
  id v2 = +[NSString stringWithUTF8String:a1];
  id v3 = [(id)qword_10005BD90 objectForKeyedSubscript:v2];
  if (v3)
  {
    [(id)qword_10005BD90 removeObjectForKey:v2];
    sub_100014BC8(a1);
    sub_100014E18();
    uint64_t v4 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_100038060();
    }
    uint64_t v4 = 2;
  }

  return v4;
}

void sub_100014BC8(const char *a1)
{
  id v2 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = (id)qword_10005BDB0;
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [v8 interface];
        int v10 = strcmp(a1, (const char *)[v9 name]);

        if (!v10) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v2;
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        unsigned __int8 v16 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
        if ([v16 state] == 3)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100016780;
          v17[3] = &unk_100055600;
          v17[4] = v16;
          [v16 goodByeWithCallback:v17];
        }
        else
        {
          [v16 disconnect];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }
}

void sub_100014E18()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = (id)qword_10005BD90;
  id v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(id *)(*((void *)&v9 + 1) + 8 * (void)v5);
        uint64_t v7 = (const char *)[v6 UTF8String];
        uint64_t v8 = [(id)qword_10005BD90 objectForKeyedSubscript:v6];
        xpc_dictionary_set_string(empty, v7, (const char *)[v8 address]);

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  xpc_set_event();
}

uint64_t sub_100014F74(uint64_t a1, const void *a2)
{
  return sub_100014F7C(a1, a2, 1);
}

uint64_t sub_100014F7C(uint64_t a1, const void *a2, int a3)
{
  *(_OWORD *)long long v20 = 0u;
  memset(v21, 0, sizeof(v21));
  id v6 = +[NSString stringWithUTF8String:a1];
  uint64_t v7 = [(id)qword_10005BD90 objectForKeyedSubscript:v6];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_10003829C();
    }
    uint64_t v8 = 17;
    goto LABEL_19;
  }
  id v18 = 0;
  long long v9 = [[RSDNetworkInterface alloc] initWithName:a1 error:&v18];
  id v10 = v18;
  if (!v9)
  {
    id v15 = (void *)qword_10005BD98;
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_1000380C8(v15, v10);
    }
    uint64_t v8 = (uint64_t)[v10 code];
    goto LABEL_18;
  }
  long long v11 = [[RSDRemoteComputeControllerDevice alloc] initWithInterface:v9 address:a2];
  if (!v11) {
    sub_10003815C(&v17, v19);
  }
  long long v12 = v11;

  if (!inet_ntop(30, a2, v20, 0x2Eu))
  {
    uint64_t v8 = *__error();
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_1000381C8();
    }

LABEL_18:
    goto LABEL_19;
  }
  id v13 = [[RSDComputeControllerDeviceEndpoint alloc] initWithAddress:v20];
  if (!v13) {
    sub_100038230(&v17, v19);
  }
  uint64_t v14 = v13;

  [(id)qword_10005BD90 setObject:v14 forKeyedSubscript:v6];
  if (a3) {
    sub_100014E18();
  }
  [(RSDRemoteComputeControllerDevice *)v12 attach];

  uint64_t v8 = 0;
LABEL_19:

  return v8;
}

uint64_t sub_1000151C4(uint64_t a1, const void *a2)
{
  return sub_100014F7C(a1, a2, 0);
}

uint64_t sub_1000151CC(uint64_t a1)
{
  return sub_1000151D4(a1, 1);
}

uint64_t sub_1000151D4(uint64_t a1, int a2)
{
  uint64_t v4 = +[NSString stringWithUTF8String:a1];
  id v5 = [(id)qword_10005BDA0 objectForKeyedSubscript:v4];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_100038444();
    }
    uint64_t v6 = 17;
  }
  else
  {
    id v7 = (id)qword_10005BDB8;
    if (!v7) {
      sub_100038304(&v28, &handler);
    }

    id v28 = 0;
    uint64_t v8 = [[RSDNetworkInterface alloc] initWithName:a1 error:&v28];
    id v25 = v28;
    if (v8)
    {
      int v24 = a2;
      long long v9 = +[RSDRemoteComputeControllerDevice tlsOidsRequiredOfPeer];
      id v10 = sub_100029AF0(16, v9);

      id v27 = 0;
      uint64_t v6 = sub_100014960([(RSDNetworkInterface *)v8 index], 1, &v27, v10);
      long long v11 = v27;
      if (v6)
      {
        long long v12 = qword_10005BD98;
        if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_FAULT)) {
          sub_100037160(v12);
        }

        id v13 = 0;
        uint64_t v14 = 0;
      }
      else
      {
        bonjour_service = nw_browse_descriptor_create_bonjour_service("_remoted_compute._tcp", "local.");
        uint64_t v17 = nw_browser_create(bonjour_service, v11);
        if (!v17) {
          sub_1000383D8(&v26, &handler);
        }
        uint64_t v14 = v17;

        *(void *)&long long handler = _NSConcreteStackBlock;
        *((void *)&handler + 1) = 3221225472;
        __int16 v30 = sub_1000167E0;
        int v31 = &unk_100055668;
        __int16 v32 = v8;
        nw_browser_set_browse_results_changed_handler(v14, &handler);
        nw_browser_set_state_changed_handler(v14, &stru_1000556A8);
        nw_browser_set_queue(v14, (dispatch_queue_t)qword_10005BDA8);
        nw_browser_start(v14);
        id v13 = +[NSString stringWithUTF8String:a1];
        id v18 = [(id)qword_10005BDA0 objectForKeyedSubscript:v13];
        [v18 setNw_browser:v14];

        uint64_t v6 = 0;
      }
      a2 = v24;
      unsigned __int8 v16 = v25;
    }
    else
    {
      id v15 = (void *)qword_10005BD98;
      unsigned __int8 v16 = v25;
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
        sub_1000380C8(v15, v25);
      }
      uint64_t v6 = (uint64_t)[v25 code];
      long long v11 = 0;
      id v13 = 0;
      uint64_t v14 = 0;
    }

    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
        sub_100038370();
      }
    }
    else
    {
      long long v19 = objc_alloc_init(RSDComputeControllerBrowser);
      [(id)qword_10005BDA0 setObject:v19 forKeyedSubscript:v4];

      long long v20 = (void *)os_transaction_create();
      long long v21 = [(id)qword_10005BDA0 objectForKeyedSubscript:v4];
      [v21 setBrowser_tx:v20];

      if (a2) {
        sub_100015678();
      }
      uint64_t v6 = 0;
    }
  }

  return v6;
}

uint64_t sub_10001559C(uint64_t a1)
{
  return sub_1000151D4(a1, 0);
}

uint64_t sub_1000155A4(const char *a1)
{
  id v2 = +[NSString stringWithUTF8String:a1];
  id v3 = [(id)qword_10005BDA0 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 nw_browser];
    nw_browser_cancel(v5);

    [(id)qword_10005BDA0 removeObjectForKey:v2];
    sub_100014BC8(a1);
    sub_100015678();
    uint64_t v6 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_1000384AC();
    }
    uint64_t v6 = 2;
  }

  return v6;
}

void sub_100015678()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_object_t v1 = xpc_array_create_empty();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)qword_10005BDA0;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v9 + 1) + 8 * (void)v6);
        xpc_object_t v8 = xpc_string_create([v7 UTF8String]);
        xpc_array_append_value(v1, v8);

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  xpc_dictionary_set_value(empty, "interfaces", v1);
  xpc_set_event();
}

void sub_1000157D0(void *a1)
{
  id v2 = a1;
  if (!qword_10005BDA8)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "compute_controller");
    id v4 = (void *)qword_10005BD98;
    qword_10005BD98 = (uint64_t)v3;

    if (sub_100028F14() == 15)
    {
      sub_1000159A8(0);
      sub_10001AB54(5, 10, 5, &stru_1000555B0);
      uint64_t v5 = (void *)qword_10005BD98;
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = v5;
        int v16 = 136446210;
        uint64_t description = remote_device_type_get_description();
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initializing compute platform with type %{public}s", (uint8_t *)&v16, 0xCu);
      }
      objc_storeStrong((id *)&qword_10005BDA8, a1);
      uint64_t v7 = objc_opt_new();
      xpc_object_t v8 = (void *)qword_10005BDB0;
      qword_10005BDB0 = v7;

      uint64_t v9 = objc_opt_new();
      long long v10 = (void *)qword_10005BDB8;
      qword_10005BDB8 = v9;

      uint64_t v11 = objc_opt_new();
      long long v12 = (void *)qword_10005BDA0;
      qword_10005BDA0 = v11;

      uint64_t v13 = objc_opt_new();
      uint64_t v14 = (void *)qword_10005BD90;
      qword_10005BD90 = v13;
    }
    else
    {
      id v15 = qword_10005BD98;
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "not enabling backend on this platform", (uint8_t *)&v16, 2u);
      }
    }
  }
}

void sub_1000159A8(void *a1)
{
  id v1 = a1;
  id v2 = [&off_100056F40 mutableCopy];
  CFStringRef v9 = @"GetCombined";
  CFBooleanRef v10 = kCFBooleanTrue;
  os_log_t v3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v4 = AMFDRSealingMapCopyLocalDictForClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;

    [v2 addObject:@"1.2.840.113635.100.6.85"];
  }
  else
  {
    uint64_t v6 = qword_10005BD98;
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)xpc_object_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Chassis manifest not present.", v8, 2u);
    }
  }
  id v7 = [v2 copy];
  sub_10001A5FC(v7, v1);
}

void sub_100015AF0(id a1, NSError *a2)
{
  if (!a2) {
    sub_1000159A8(0);
  }
}

void sub_100016044(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v1 = *(void **)(a1 + 32);
  if (v1[35])
  {
    id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:(char *)*v2 + 264];
    if (v3 && ([(id)qword_10005BDB8 containsObject:v3] & 1) != 0)
    {
      id v4 = [*v2 type];
      uint64_t v5 = [(id)objc_opt_class() tlsOidsRequiredOfPeer];
      uint64_t v6 = sub_100029AF0((uint64_t)v4, v5);

      int v7 = [*((id *)*v2 + 37) index];
      id v18 = 0;
      int v8 = sub_100014960(v7, 2, &v18, v6);
      CFStringRef v9 = v18;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
          sub_100038654();
        }
        [*v2 disconnect];
      }
      else
      {
        nw_connection_t v15 = nw_connection_create(*((nw_endpoint_t *)*v2 + 35), v9);
        xpc_remote_connection_get_version_flags();
        int v16 = (void *)xpc_remote_connection_create_with_nw_connection();
        [*v2 connect:v16];
      }
    }
    else
    {
      CFBooleanRef v10 = qword_10005BD98;
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = *v2;
        *(_DWORD *)uint64_t buf = 138543362;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@> device has already gone, disconnecting", buf, 0xCu);
      }
      [*v2 disconnect];
    }
  }
  else
  {
    int v17 = -1;
    int v12 = sub_10001EFB0(&v17, (__n128 *)[v1 remote_address], 0xCAF6u, (int)[*((id *)*v2 + 37) index], (uint64_t)&xmmword_100044D80);
    uint64_t v13 = qword_10005BD98;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
        sub_1000385E8();
      }
      [*v2 connect:0];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_INFO))
      {
        id v14 = *v2;
        *(_DWORD *)uint64_t buf = 138543362;
        id v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
      }
      [*v2 pollConnect:x0 onQueue:x1 withLog:x2 completion:x3];
    }
  }
}

void sub_100016390(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
      sub_1000386C0();
    }
    [*(id *)(a1 + 32) connect:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) connection];

    uint64_t v5 = qword_10005BD98;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v10 = 138543362;
        uint64_t v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v10, 0xCu);
      }
      close(*(_DWORD *)(a1 + 40));
    }
    else
    {
      if (v6)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v10 = 138543362;
        uint64_t v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v10, 0xCu);
      }
      xpc_remote_connection_get_failsafe_version_flags();
      CFStringRef v9 = (void *)xpc_remote_connection_create_with_connected_fd();
      [*(id *)(a1 + 32) connect:v9];
    }
  }
}

id sub_100016780(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
    sub_100038814();
  }
  return [*(id *)(a1 + 32) disconnect];
}

void sub_1000167E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  BOOL v6 = a3;
  char changes = nw_browse_result_get_changes(v5, v6);
  uint64_t v8 = qword_10005BD98;
  if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 138412546;
    *(void *)id v25 = v5;
    *(_WORD *)&v25[8] = 2112;
    *(void *)&v25[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "browse_results_changed: %@ -> %@", buf, 0x16u);
  }
  if ((changes & 2) != 0) {
    CFStringRef v9 = v6;
  }
  else {
    CFStringRef v9 = v5;
  }
  if ((changes & 6) != 0)
  {
    int v10 = v9;
    if (!v10) {
      sub_10003887C(uu, buf);
    }
    uint64_t v11 = v10;

    int v12 = nw_browse_result_copy_endpoint(v11);
    if (!v12) {
      sub_100038230(uu, buf);
    }
    uint64_t v13 = v12;

    memset(uu, 170, sizeof(uu));
    id v14 = v13;
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v14);
    if (!bonjour_service_name) {
      sub_1000388E8(&v22, buf);
    }
    uuid_parse(bonjour_service_name, uu);

    int v16 = qword_10005BD98;
    if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68157954;
      *(_DWORD *)id v25 = 16;
      *(_WORD *)&v25[4] = 2096;
      *(void *)&v25[6] = &xmmword_10005C020;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "browser local_device_uuid: %{uuid_t}.16P", buf, 0x12u);
    }
    if (uuid_is_null(uu)) {
      sub_1000389DC(&v22, buf);
    }
    id v17 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
    if ((changes & 2) != 0)
    {
      if ([(id)qword_10005BDB8 containsObject:v17])
      {
        long long v19 = qword_10005BD98;
        if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_FAULT)) {
          sub_100038998(v19);
        }
      }
      else
      {
        [(id)qword_10005BDB8 addObject:v17];
      }
      id v18 = sub_100016AF8(uu);
      if (v18)
      {
        id v20 = qword_10005BD98;
        if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEBUG)) {
          sub_100038954(v20);
        }
      }
      else
      {
        long long v21 = [[RSDRemoteComputeControllerDevice alloc] initWithInterface:*(void *)(a1 + 32) endpoint:v14 bonjourUUID:uu];
        [(RSDRemoteDevice *)v21 setTlsEnabled:1];
        [(RSDRemoteComputeControllerDevice *)v21 attach];
      }
    }
    else
    {
      if ((changes & 4) == 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      id v18 = sub_100016AF8(uu);
      [(id)qword_10005BDB8 removeObject:v17];
      if (v18)
      {
        if ([v18 state] == 3) {
          [v18 heartbeatWithCallback:&stru_100055640];
        }
        else {
          [v18 disconnect];
        }
      }
    }

    goto LABEL_28;
  }
LABEL_29:
}

id sub_100016AF8(const unsigned __int8 *a1)
{
  id v2 = qword_10005BD98;
  if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68157954;
    int v24 = 16;
    __int16 v25 = 2096;
    uint64_t v26 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checking for existing device %{uuid_t}.16P", buf, 0x12u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = (id)qword_10005BDB0;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v5 = 68157954;
    long long v17 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v3);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v12 = (void *)qword_10005BD98;
        if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = v12;
          id v14 = (const unsigned __int8 *)[v11 bonjourUUID];
          *(_DWORD *)uint64_t buf = v17;
          int v24 = 16;
          __int16 v25 = 2096;
          uint64_t v26 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "comparing against device uuid %{uuid_t}.16P", buf, 0x12u);
        }
        if (!uuid_compare((const unsigned __int8 *)objc_msgSend(v11, "bonjourUUID", v17, (void)v18), a1))
        {
          id v15 = v11;

          ++v8;
          uint64_t v7 = v15;
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);

    if (v7 && v8 >= 2) {
      sub_100038A48();
    }
  }
  else
  {

    uint64_t v7 = 0;
  }

  return v7;
}

void sub_100016D28(id a1, BOOL a2)
{
  id v3 = qword_10005BD98;
  if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEBUG)) {
    sub_100038A64(a2, v3);
  }
}

void sub_100016D70(id a1, int a2, OS_nw_error *a3)
{
  id v4 = a3;
  switch(a2)
  {
    case 4:
      uint64_t v9 = qword_10005BD98;
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        uint64_t v11 = v4;
        id v6 = "nw_browser_state_waiting: %@";
        uint64_t v7 = v9;
        uint32_t v8 = 12;
        goto LABEL_8;
      }
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_FAULT)) {
        sub_100038BC4();
      }
      break;
    case 1:
      uint64_t v5 = qword_10005BD98;
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        id v6 = "browsing for other bonjour remoted instances";
        uint64_t v7 = v5;
        uint32_t v8 = 2;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
      }
      break;
    default:
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR))
      {
        sub_100038B5C();
        if (!v4) {
          break;
        }
      }
      else if (!v4)
      {
        break;
      }
      if (os_log_type_enabled((os_log_t)qword_10005BD98, OS_LOG_TYPE_ERROR)) {
        sub_100038AF4();
      }
      break;
  }
}

void sub_100016F14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL sub_100016F3C()
{
  id v6 = 0;
  sub_100019054((void *)qword_10005BDC0, @"rsd_compute_node_tls_chmf_required", @"compute-node-tls-chmf-required", (unsigned __int8 **)&v6);
  if (v6)
  {
    BOOL v0 = *(unsigned __int8 *)v6 != 0;
    id v1 = "";
  }
  else
  {
    int v7 = 0;
    if (sub_10001E7C4("IODeviceTree:/product", (uint64_t)"fdr-sealed-chassis", &v7))
    {
      BOOL v0 = v7 != 0;
      if (v7) {
        id v1 = " by default per EDT";
      }
      else {
        id v1 = " by default";
      }
    }
    else
    {
      id v2 = qword_10005BDC0;
      if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 136315394;
        uint64_t v9 = "IODeviceTree:/product";
        __int16 v10 = 2080;
        uint64_t v11 = "fdr-sealed-chassis";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Failed to read '%s/%s' from EDT. Assuming chassis not sealed.", buf, 0x16u);
      }
      BOOL v0 = 0;
      id v1 = " by default";
    }
  }
  id v3 = qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "";
    if (!v0) {
      id v4 = "not ";
    }
    *(_DWORD *)uint64_t buf = 136315394;
    uint64_t v9 = v4;
    __int16 v10 = 2080;
    uint64_t v11 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Chassis manifest is %srequired for TLS on compute node%s", buf, 0x16u);
  }
  free(v6);
  return v0;
}

void sub_1000170FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
}

uint64_t sub_100017110(uint64_t a1)
{
  return sub_100017118(a1, 1);
}

uint64_t sub_100017118(uint64_t a1, int a2)
{
  id v4 = +[NSString stringWithCString:a1 encoding:4];
  if (qword_10005BDC8)
  {
    uint64_t v5 = qword_10005BDC0;
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
      sub_100038FEC(a1, v5);
    }
    uint64_t v6 = 17;
    goto LABEL_26;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v7;
  *(_OWORD *)&out[16] = v7;
  id v39 = 0;
  uint32_t v8 = [[RSDNetworkInterface alloc] initWithName:a1 error:&v39];
  id v9 = v39;
  __int16 v10 = v9;
  if (v8)
  {
    CFStringRef v34 = v9;
    uint64_t v11 = [RSDListener alloc];
    int v12 = [(RSDListener *)v11 initWithInterface:v8 targetQueue:qword_10005BDE0];
    uint64_t v13 = (void *)qword_10005BDC8;
    qword_10005BDC8 = (uint64_t)v12;

    id v14 = (void *)qword_10005BDC8;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100018024;
    v37[3] = &unk_100055600;
    id v15 = v8;
    uint64_t v38 = v15;
    [v14 listenOnPort:51958 connectionHandler:v37];
    int v16 = +[RSDRemoteComputeNodeDevice tlsOidsRequiredOfPeer];
    long long v17 = sub_100029AF0(15, v16);

    if (uuid_is_null((const unsigned __int8 *)&xmmword_10005C020)) {
      sub_100038F80(dst, buf);
    }
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEBUG)) {
      sub_100038F08();
    }
    uuid = xpc_dictionary_get_uuid((xpc_object_t)qword_10005C030, "BootSessionUUID");
    if (!uuid) {
      sub_100038D4C(dst, buf);
    }
    memset(dst, 170, sizeof(dst));
    uuid_copy(dst, uuid);
    if (uuid_is_null(dst)) {
      sub_100038E9C(&v40, buf);
    }
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEBUG)) {
      sub_100038E30();
    }
    xmmword_10005C020 = (__int128)veorq_s8((int8x16_t)xmmword_10005C020, *(int8x16_t *)dst);
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEBUG)) {
      sub_100038DB8();
    }
    uuid_unparse((const unsigned __int8 *)&xmmword_10005C020, out);
    long long v19 = (void *)qword_10005BDC8;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000181D8;
    v35[3] = &unk_100055030;
    long long v20 = v15;
    uint64_t v36 = v20;
    [v19 listenOnBonjourName:out type:"_remoted_compute._tcp" domain:"local." configureTLS:v17 connectionHandler:v35];
    long long v21 = +[NSString stringWithCString:a1 encoding:4];
    uint64_t v22 = qword_10005BDC0;
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136446210;
      *(void *)&uint8_t buf[4] = a1;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "compute node listening on %{public}s", buf, 0xCu);
    }

LABEL_18:
    uint64_t v23 = os_transaction_create();
    int v24 = (void *)qword_10005BDD8;
    qword_10005BDD8 = v23;

    if (a2) {
      sub_100017704();
    }
    uint64_t v6 = 0;
    goto LABEL_26;
  }
  __int16 v25 = (void *)qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
    sub_100038CA4(v25, v10);
  }
  uint64_t v6 = (uint64_t)[v10 code];

  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v26 = qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
    sub_100038C38(v6, v26, v27, v28, v29, v30, v31, v32);
  }
LABEL_26:

  return v6;
}

uint64_t sub_100017570(uint64_t a1)
{
  return sub_100017118(a1, 0);
}

uint64_t sub_100017578(uint64_t a1)
{
  id v2 = +[NSString stringWithCString:a1 encoding:4];
  if (qword_10005BDC8)
  {
    [(id)qword_10005BDC8 cancel];
    id v3 = (void *)qword_10005BDC8;
    qword_10005BDC8 = 0;

    if ([(id)qword_10005BDD0 state] == 2)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000176A8;
      v8[3] = &unk_1000556C8;
      int v9 = -1;
      [(id)qword_10005BDD0 goodByeWithCallback:v8];
    }
    else
    {
      [(id)qword_10005BDD0 disconnect];
    }
    uint64_t v6 = (void *)qword_10005BDD8;
    qword_10005BDD8 = 0;

    sub_100017704();
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = qword_10005BDC0;
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
      sub_100039064(a1, v4);
    }
    uint64_t v5 = 2;
  }

  return v5;
}

id sub_1000176A8(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 32))
  {
    id v3 = qword_10005BDC0;
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
      sub_1000390DC(a2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return [(id)qword_10005BDD0 disconnect];
}

void sub_100017704()
{
  xpc_object_t xdict = xpc_dictionary_create_empty();
  BOOL v0 = [(id)qword_10005BDC8 interface];
  xpc_object_t v1 = xpc_string_create((const char *)[v0 name]);

  xpc_dictionary_set_value(xdict, "interface", v1);
  xpc_set_event();
}

void sub_100017798(void *a1)
{
  id v2 = a1;
  if (!qword_10005BDE0)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "compute_node");
    uint64_t v4 = (void *)qword_10005BDC0;
    qword_10005BDC0 = (uint64_t)v3;

    int v5 = sub_100028F14();
    uint64_t v6 = qword_10005BDC0;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT);
    if (v5 == 16)
    {
      if (v7)
      {
        uint64_t v8 = v6;
        int v9 = 136446210;
        uint64_t description = remote_device_type_get_description();
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initializing compute platform with type %{public}s", (uint8_t *)&v9, 0xCu);
      }
      objc_storeStrong((id *)&qword_10005BDE0, a1);
      sub_10001A5FC(&off_100056F70, 0);
      sub_10001AB54(5, 10, 5, &stru_1000556E8);
    }
    else if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "not enabling backend on this platform", (uint8_t *)&v9, 2u);
    }
  }
}

void sub_100017904(id a1, NSError *a2)
{
  if (!a2) {
    sub_10001A5FC(&off_100056F70, 0);
  }
}

void sub_100017E28(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 296))
  {
    xpc_remote_connection_get_failsafe_version_flags();
    id v7 = (id)xpc_remote_connection_create_with_nw_connection();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 296);
    *(void *)(v3 + 296) = 0;

LABEL_5:
    [*(id *)(a1 + 32) connect:v7];

    return;
  }
  if ((*(_DWORD *)(v2 + 288) & 0x80000000) == 0)
  {
    xpc_remote_connection_get_failsafe_version_flags();
    id v7 = (id)xpc_remote_connection_create_with_connected_fd();
    *(_DWORD *)(*(void *)(a1 + 32) + 288) = -1;
    goto LABEL_5;
  }
  int v5 = qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t buf = 138543362;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for the other side to connect", buf, 0xCu);
  }
}

uint64_t sub_100018024(uint64_t a1, int a2)
{
  int v17 = 0;
  unsigned int v18 = -1431655766;
  *(void *)&v15.sa_len = 0;
  *(void *)&v15.sa_data[6] = 0;
  uint64_t v16 = 0;
  socklen_t v14 = 28;
  for (uint64_t result = sub_10001FD44(a2, &v15, &v14, (unsigned __int8 *)&xmmword_100044D80, (int *)&v18);
        !result;
        uint64_t result = sub_10001FD44(a2, &v15, &v14, (unsigned __int8 *)&xmmword_100044D80, (int *)&v18))
  {
    int v5 = qword_10005BDC0;
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got incoming remoted connection from port", buf, 2u);
    }
    if (qword_10005BDD0)
    {
      uint64_t v6 = qword_10005BDC0;
      if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "replacing the remoted connection", buf, 2u);
      }
      [(id)qword_10005BDD0 replacePeerSocket:v18];
    }
    else
    {
      id v7 = [RSDRemoteComputeNodeDevice alloc];
      uint64_t v8 = [(RSDRemoteComputeNodeDevice *)v7 initWithInterface:*(void *)(a1 + 32) peerSocket:v18];
      uint64_t v9 = (void *)qword_10005BDD0;
      qword_10005BDD0 = (uint64_t)v8;

      if (qword_10005BDD0)
      {
        [(id)qword_10005BDD0 attach];
      }
      else
      {
        __int16 v10 = qword_10005BDC0;
        if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
          sub_1000391B4(&v11, v12, v10);
        }
      }
    }
  }
  return result;
}

void sub_1000181D8(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 138543362;
    v15[0] = qword_10005BDC8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ got incoming remoted bonjour connection", buf, 0xCu);
  }
  int v5 = nw_connection_copy_current_path(v3);
  uint64_t v6 = nw_path_copy_effective_remote_endpoint(v5);
  if (nw_endpoint_get_type(v6) != nw_endpoint_type_address) {
    sub_100039238(&v13, buf);
  }
  address = nw_endpoint_get_address(v6);
  uint64_t v8 = qword_10005BDC0;
  if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68157954;
    LODWORD(v15[0]) = 16;
    WORD2(v15[0]) = 2096;
    *(void *)((char *)v15 + 6) = &address->sa_data[6];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "remote address: %{network:in6_addr}.16P", buf, 0x12u);
  }
  if (qword_10005BDD0)
  {
    uint64_t v9 = qword_10005BDC0;
    if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "replacing the remoted connection", buf, 2u);
    }
    [(id)qword_10005BDD0 replacePeerConnection:v3];
  }
  else
  {
    __int16 v10 = [[RSDRemoteComputeNodeDevice alloc] initWithInterface:*(void *)(a1 + 32) peerConnection:v3 endpoint:v6];
    uint8_t v11 = (void *)qword_10005BDD0;
    qword_10005BDD0 = (uint64_t)v10;

    [(id)qword_10005BDD0 setTlsEnabled:1];
    if (qword_10005BDD0)
    {
      [(id)qword_10005BDD0 attach];
    }
    else
    {
      int v12 = qword_10005BDC0;
      if (os_log_type_enabled((os_log_t)qword_10005BDC0, OS_LOG_TYPE_ERROR)) {
        sub_1000391F4(v12);
      }
    }
  }
}

void sub_100018414(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

char *sub_100018430(_xpc_connection_s *a1)
{
  uint64_t v3 = 0;
  pid_t pid = xpc_connection_get_pid(a1);
  asprintf(&v3, "pid/%d", pid);
  return v3;
}

void sub_10001846C(void *a1)
{
  id v2 = a1;
  if (!qword_10005BDE8)
  {
    id v7 = v2;
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ComputeInterface");
    uint64_t v4 = (void *)qword_10005BDF0;
    qword_10005BDF0 = (uint64_t)v3;

    objc_storeStrong((id *)&qword_10005BDE8, a1);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", (dispatch_queue_t)qword_10005BDE8, 1uLL);
    uint64_t v6 = (void *)qword_10005BDF8;
    qword_10005BDF8 = (uint64_t)mach_service;

    xpc_connection_set_event_handler((xpc_connection_t)qword_10005BDF8, &stru_100055708);
    xpc_connection_activate((xpc_connection_t)qword_10005BDF8);
    id v2 = v7;
  }
}

void sub_100018530(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000185EC;
    handler[3] = &unk_100054F08;
    os_log_t v3 = v2;
    int v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_10005BDE8);
    xpc_connection_activate(v3);
  }
}

void sub_1000185EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_connection_get_audit_token();
  uint64_t v4 = (void *)xpc_copy_entitlement_for_token();

  if (v4)
  {
    int v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v6 = v3;
    if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_error)
    {
      if (xpc_dictionary_expects_reply())
      {
        string = xpc_dictionary_get_string(v6, "cmd");
        if (!string)
        {
          if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
            sub_1000392D8();
          }
          uint64_t v9 = sub_100020794(v6);
          goto LABEL_25;
        }
        uint64_t v8 = string;
        if (!strcmp(string, "add_device"))
        {
          id v11 = v6;
          v37[0] = 0;
          v37[1] = 0;
          int v12 = xpc_dictionary_get_string(v11, "interface_name");
          if (v12)
          {
            uint64_t v13 = (uint64_t)v12;
            int v14 = sub_10001FC90(v12);
            if (v14)
            {
              int v15 = v14;
              if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
                sub_100039374();
              }
              uint64_t v16 = v11;
              int v17 = v15;
              goto LABEL_64;
            }
            uint64_t v27 = xpc_dictionary_get_string(v11, "address");
            if (v27)
            {
              int v28 = inet_pton(30, v27, v37);
              if (v28 == -1)
              {
                CFStringRef v34 = __error();
                __int16 v35 = qword_10005BDF0;
                if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
                  sub_100032FD8(v34, v35);
                }
              }
              else
              {
                if (v28 == 1)
                {
                  sub_100014F74(v13, v37);
                  goto LABEL_76;
                }
                if (v28) {
                  sub_100032EF4(&v36, buf);
                }
                if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
                  sub_100032FA4();
                }
              }
              uint64_t v30 = sub_100020794(v11);
              goto LABEL_65;
            }
            if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
              sub_100039340();
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR))
          {
LABEL_55:
            sub_10003930C();
          }
        }
        else if (!strcmp(v8, "remove_device"))
        {
          id v11 = v6;
          unsigned int v18 = xpc_dictionary_get_string(v11, "interface_name");
          if (v18)
          {
            long long v19 = v18;
            int v20 = sub_10001FC90(v18);
            if (v20)
            {
              int v21 = v20;
              if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
                sub_100039374();
              }
              uint64_t v16 = v11;
              int v17 = v21;
              goto LABEL_64;
            }
            sub_100014B14(v19);
            goto LABEL_76;
          }
          if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_55;
          }
        }
        else
        {
          if (strcmp(v8, "browse"))
          {
            if (!strcmp(v8, "browse_cancel"))
            {
              uint64_t v9 = sub_100018BD8(v6);
            }
            else if (!strcmp(v8, "listen"))
            {
              uint64_t v9 = sub_100018C8C(v6);
            }
            else if (!strcmp(v8, "listen_cancel"))
            {
              uint64_t v9 = sub_100018D94(v6);
            }
            else if (!strcmp(v8, "require_tls"))
            {
              uint64_t v9 = sub_100018E48(v6);
            }
            else if (!strcmp(v8, "is_tls_required_cmd"))
            {
              uint64_t v9 = sub_100018F34(v6);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
                sub_1000393A8();
              }
              uint64_t v9 = sub_1000207A0(v6, 22);
            }
LABEL_25:
            xpc_object_t reply = (xpc_object_t)v9;
LABEL_67:
            id v31 = reply;
            if (!v31) {
              sub_100032E14(v37, buf);
            }
            uint64_t v32 = v31;

            xpc_dictionary_get_remote_connection(v32);
            CFStringRef v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
            xpc_connection_send_message(v33, v32);

            goto LABEL_69;
          }
          id v11 = v6;
          uint64_t v22 = xpc_dictionary_get_string(v11, "interface_name");
          if (v22)
          {
            uint64_t v23 = (uint64_t)v22;
            int v24 = sub_10001FC90(v22);
            __int16 v25 = qword_10005BDF0;
            if (v24)
            {
              int v26 = v24;
              if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
                sub_100039374();
              }
              uint64_t v16 = v11;
              int v17 = v26;
              goto LABEL_64;
            }
            if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 136446210;
              *(void *)&uint8_t buf[4] = v23;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Client request browsing on %{public}s", buf, 0xCu);
            }
            int v29 = sub_1000151CC(v23);
            if (v29)
            {
              int v17 = v29;
              uint64_t v16 = v11;
LABEL_64:
              uint64_t v30 = sub_1000207A0(v16, v17);
LABEL_65:
              xpc_object_t reply = (xpc_object_t)v30;
LABEL_66:

              goto LABEL_67;
            }
LABEL_76:
            xpc_object_t reply = xpc_dictionary_create_reply(v11);
            xpc_dictionary_set_string(reply, "result", "OK");
            goto LABEL_66;
          }
          if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
            goto LABEL_55;
          }
        }
        uint64_t v16 = v11;
        int v17 = 22;
        goto LABEL_64;
      }
      if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
        sub_1000334C0();
      }
    }
    xpc_connection_cancel(v5);
LABEL_69:

    goto LABEL_70;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
    sub_1000392A4();
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
LABEL_70:
}

id sub_100018BD8(void *a1)
{
  id v1 = a1;
  string = xpc_dictionary_get_string(v1, "interface_name");
  if (string)
  {
    sub_1000155A4(string);
    xpc_object_t reply = xpc_dictionary_create_reply(v1);

    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
      sub_10003930C();
    }
    xpc_object_t reply = sub_1000207A0(v1, 22);
  }

  return reply;
}

id sub_100018C8C(void *a1)
{
  id v1 = a1;
  string = xpc_dictionary_get_string(v1, "interface_name");
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
      sub_10003930C();
    }
    id v6 = v1;
    int v7 = 22;
    goto LABEL_11;
  }
  uint64_t v3 = (uint64_t)string;
  int v4 = sub_10001FC90(string);
  if (v4)
  {
    int v5 = v4;
    if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
      sub_100039374();
    }
    id v6 = v1;
    int v7 = v5;
    goto LABEL_11;
  }
  int v8 = sub_100017110(v3);
  if (v8)
  {
    int v7 = v8;
    id v6 = v1;
LABEL_11:
    xpc_object_t reply = sub_1000207A0(v6, v7);
    goto LABEL_12;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v1);
  xpc_dictionary_set_string(reply, "result", "OK");
LABEL_12:

  return reply;
}

id sub_100018D94(void *a1)
{
  id v1 = a1;
  string = xpc_dictionary_get_string(v1, "interface_name");
  if (string)
  {
    sub_100017578((uint64_t)string);
    xpc_object_t reply = xpc_dictionary_create_reply(v1);

    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
      sub_10003930C();
    }
    xpc_object_t reply = sub_1000207A0(v1, 22);
  }

  return reply;
}

id sub_100018E48(void *a1)
{
  id v1 = a1;
  id v2 = xpc_dictionary_get_value(v1, "is_tls_required");
  uint64_t v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_BOOL_get_value(v3)) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
    sub_1000290EC(v5);
    xpc_object_t reply = xpc_dictionary_create_reply(v1);
    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BDF0, OS_LOG_TYPE_ERROR)) {
      sub_1000393DC();
    }
    xpc_object_t reply = sub_1000207A0(v1, 22);
  }

  return reply;
}

id sub_100018F34(void *a1)
{
  id v1 = a1;
  uint64_t v2 = -[RSDRemoteComputeControllerDevice tlsRequirement]_0();
  xpc_object_t reply = xpc_dictionary_create_reply(v1);

  xpc_dictionary_set_string(reply, "result", "OK");
  xpc_dictionary_set_BOOL(reply, "is_tls_required", v2 == 3);

  return reply;
}

const char *sub_100018FBC(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return "invalid";
  }
  else {
    return off_100055840[a1 - 1];
  }
}

uint64_t sub_100018FE4(const char *a1)
{
  if (!strcmp(a1, "disabled")) {
    return 1;
  }
  if (!strcmp(a1, "optional")) {
    return 2;
  }
  if (!strcmp(a1, "required")) {
    return 3;
  }
  return 0;
}

void sub_100019054(void *a1, void *a2, void *a3, unsigned __int8 **a4)
{
  id v24 = a1;
  id v7 = a2;
  id v8 = a3;
  *a4 = 0;
  uint64_t v9 = [(id)qword_10005C010 valueForKey:v8];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v10 = (unsigned __int8 *)malloc_type_calloc(1uLL, 1uLL, 0x61D5536CuLL);
      if (!v10)
      {
        id v21 = &_os_log_default;
        os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        uint64_t v22 = __error();
        strerror(*v22);
        _os_log_send_and_compose_impl();

        uint64_t v23 = _os_crash_msg();
        sub_100036794(v23);
      }
      *a4 = v10;
      unsigned __int8 v11 = [v9 BOOLValue];
      int v12 = 0;
      uint64_t v13 = *a4;
LABEL_9:
      *uint64_t v13 = v11;
      goto LABEL_10;
    }
  }
  int v12 = (char *)malloc_type_calloc(0xBuLL, 1uLL, 0x61D5536CuLL);
  if (!v12)
  {
    id v15 = &_os_log_default;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    uint64_t v16 = __error();
    strerror(*v16);
    _os_log_send_and_compose_impl();

    uint64_t v17 = _os_crash_msg();
    sub_100036794(v17);
  }
  [v7 UTF8String];
  if (os_parse_boot_arg_string())
  {
    int v14 = (unsigned __int8 *)malloc_type_calloc(1uLL, 1uLL, 0x61D5536CuLL);
    uint64_t v13 = v14;
    if (!v14)
    {
      id v18 = &_os_log_default;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      long long v19 = __error();
      strerror(*v19);
      _os_log_send_and_compose_impl();

      uint64_t v20 = _os_crash_msg();
      sub_100036794(v20);
    }
    *a4 = v14;
    unsigned __int8 v11 = strcmp(v12, "1") == 0;
    goto LABEL_9;
  }
LABEL_10:
  free(v12);
}

void sub_10001947C(_Unwind_Exception *exception_object)
{
}

uint64_t sub_1000194AC(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [(id)qword_10005C010 valueForKey:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = sub_100018FE4((const char *)[v8 UTF8String]);
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v11 = off_100055840[v10 - 1];
          LODWORD(buf[0]) = 136446466;
          *(void *)((char *)buf + 4) = v11;
          WORD6(buf[0]) = 2114;
          *(void *)((char *)buf + 14) = v7;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TLS is %{public}s per preference '%{public}@'", (uint8_t *)buf, 0x16u);
        }
        int v12 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100039478();
      }
    }
  }
  int v12 = (char *)malloc_type_calloc(0xBuLL, 1uLL, 0x61D5536CuLL);
  if (!v12)
  {
    memset(buf, 0, sizeof(buf));
    id v17 = &_os_log_default;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    id v18 = __error();
    strerror(*v18);
    _os_log_send_and_compose_impl();

    uint64_t v19 = _os_crash_msg();
    sub_100036794(v19);
  }
  id v13 = v6;
  [v13 UTF8String];
  if (!os_parse_boot_arg_string())
  {
LABEL_16:
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v14 = sub_100018FE4(v12);
  if (!v14)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100039410();
    }
    goto LABEL_16;
  }
  uint64_t v10 = v14;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v15 = off_100055840[v10 - 1];
    LODWORD(buf[0]) = 136446466;
    *(void *)((char *)buf + 4) = v15;
    WORD6(buf[0]) = 2114;
    *(void *)((char *)buf + 14) = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TLS is %{public}s per boot arg '%{public}@'", (uint8_t *)buf, 0x16u);
  }
LABEL_17:
  free(v12);

  return v10;
}

void sub_1000197E0(_Unwind_Exception *a1)
{
}

void sub_100019808()
{
  sub_10001987C();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  sub_100019848(v0);
}

void sub_100019848(id obj)
{
  objc_storeStrong((id *)&qword_10005BE08, obj);

  sub_10000BEFC();
}

NSObject *sub_10001987C()
{
  sub_10001A2FC();
  CFErrorRef error = 0;
  v55[0] = kSecOidCommonName;
  v55[1] = @"remoted-identity";
  id v0 = +[NSArray arrayWithObjects:v55 count:2];
  CFStringRef v56 = v0;
  id v1 = +[NSArray arrayWithObjects:&v56 count:1];
  v57[0] = v1;
  v53[0] = kSecOidCountryName;
  v53[1] = @"US";
  uint64_t v2 = +[NSArray arrayWithObjects:v53 count:2];
  uint64_t v54 = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:&v54 count:1];
  v57[1] = v3;
  v51[0] = kSecOidOrganization;
  v51[1] = @"Apple Inc";
  int v4 = +[NSArray arrayWithObjects:v51 count:2];
  uint64_t v52 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v52 count:1];
  v57[2] = v5;
  CFStringRef v34 = +[NSArray arrayWithObjects:v57 count:3];

  CFStringRef v49 = @"GetCombined";
  CFBooleanRef v50 = kCFBooleanTrue;
  CFStringRef v33 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v6 = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  SecAccessControlRef v7 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  SecAccessControlRef v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039520();
    }
    goto LABEL_16;
  }
  v47[0] = kSecAttrIsPermanent;
  v47[1] = kSecAttrTokenID;
  v48[0] = &__kCFBooleanFalse;
  v48[1] = kSecAttrTokenIDAppleKeyStore;
  v47[2] = kSecAttrKeyType;
  v47[3] = kSecAttrAccessControl;
  v48[2] = kSecAttrKeyTypeECSECPrimeRandom;
  v48[3] = v7;
  v47[4] = kSecAttrKeySizeInBits;
  v48[4] = &off_100057018;
  CFDictionaryRef parameters = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:5];
  SecKeyRef v9 = SecKeyCreateRandomKey(parameters, &error);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039588();
    }

LABEL_16:
    SecKeyRef v15 = 0;
    uint64_t v10 = 0;
    SelfSignedCertificate = 0;
    id v17 = 0;
    id v18 = 0;
    id v32 = 0;
    goto LABEL_49;
  }
  uint64_t v10 = v9;
  uint64_t v37 = 0;
  uint64_t v30 = MAECopyDCRTWithOptions();
  id v32 = 0;
  if (!v30)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003975C();
    }
    goto LABEL_29;
  }
  [v35 setObject:v30 forKeyedSubscript:@"1.2.840.113635.100.6.84"];
  unsigned __int8 v11 = qword_10005BE00;
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "New self identity contains DCRT chain data.", buf, 2u);
  }
  *(void *)uint64_t buf = 0;
  int v12 = (const void *)SecKeyCopySystemKey();
  if (v12)
  {
    Attestation = (void *)SecKeyCreateAttestation();
    if (!Attestation && os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039860();
    }
    id v14 = Attestation;
    CFRelease(v12);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_1000397F8();
    }
    id v14 = 0;
  }
  int v28 = v14;

  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_1000397C4();
    }
LABEL_29:
    int v28 = 0;
    goto LABEL_30;
  }
  [v35 setObject:v14 forKeyedSubscript:@"1.2.840.113635.100.6.83"];
  uint64_t v19 = qword_10005BE00;
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "New self identity contains DAK attestation.", buf, 2u);
  }
LABEL_30:
  uint64_t v20 = (void *)AMFDRSealingMapCopyLocalDataForClass();
  if (v20)
  {
    [v35 setObject:v20 forKeyedSubscript:@"1.2.840.113635.100.6.85"];
    id v21 = qword_10005BE00;
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "New self identity contains FDR-sealed chassis manifest data.", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
  {
    sub_1000396F4();
  }
  SecKeyRef v15 = SecKeyCopyPublicKey(v10);
  uint64_t v45 = kSecCertificateExtensionsEncoded;
  id v22 = [v35 copy];
  id v46 = v22;
  int v29 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];

  SelfSignedCertificate = (const void *)SecGenerateSelfSignedCertificate();
  if (!SelfSignedCertificate)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_1000395F0();
    }

    SelfSignedCertificate = 0;
    goto LABEL_47;
  }
  uint64_t v23 = SecIdentityCreate();
  id v17 = (__SecIdentity *)v23;
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039624();
    }

LABEL_47:
    id v17 = 0;
    goto LABEL_48;
  }
  v39[0] = kSecAttrLabel;
  v39[1] = kSecAttrAccessGroup;
  *(void *)uint64_t buf = @"com.apple.remoted.identity";
  CFStringRef v41 = @"com.apple.remoted";
  v39[2] = kSecClass;
  v39[3] = kSecValueRef;
  CFStringRef v42 = kSecClassIdentity;
  uint64_t v43 = v23;
  v39[4] = kSecAttrAccessible;
  uint64_t v44 = v6;
  id v24 = +[NSDictionary dictionaryWithObjects:buf forKeys:v39 count:5];
  if (SecItemAdd((CFDictionaryRef)v24, 0))
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003968C();
    }
LABEL_40:

LABEL_48:
    id v18 = 0;
    goto LABEL_49;
  }
  sec_identity_t v26 = sec_identity_create(v17);
  uint64_t v27 = qword_10005BE00;
  if (!v26)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039658();
    }
    goto LABEL_40;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Created new identity.", v36, 2u);
  }
  id v18 = v26;

LABEL_49:
  if (v17) {
    CFRelease(v17);
  }
  if (SelfSignedCertificate) {
    CFRelease(SelfSignedCertificate);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (error) {
    CFRelease(error);
  }

  if (!v18 && (os_variant_is_recovery() & 1) == 0 && os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_FAULT)) {
    sub_1000394E0();
  }

  return v18;
}

void sub_10001A1FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, CFTypeRef a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  CFRelease(v26);
  if (v25) {
    CFRelease(v25);
  }
  if (a19) {
    CFRelease(a19);
  }
  _Unwind_Resume(a1);
}

void sub_10001A2D0()
{
  sub_10001A2FC();

  sub_100019848(0);
}

void sub_10001A2FC()
{
  v6[0] = kSecAttrLabel;
  v6[1] = kSecAttrAccessGroup;
  v7[0] = @"com.apple.remoted.identity";
  v7[1] = @"com.apple.remoted";
  v6[2] = kSecClass;
  v7[2] = kSecClassIdentity;
  CFDictionaryRef v0 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  OSStatus v1 = SecItemDelete(v0);
  if (v1 == -25300 || v1 == 0)
  {
    uint64_t v3 = qword_10005BE00;
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deleted identity.", v5, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
  {
    sub_1000398C8();
  }
}

uint64_t sub_10001A44C()
{
  return objc_claimAutoreleasedReturnValue();
}

id sub_10001A470(void *a1)
{
  OSStatus v1 = a1;
  xpc_object_t empty = xpc_array_create_empty();
  SecCertificateRef certificateRef = 0;
  if (v1)
  {
    uint64_t v3 = sec_identity_copy_ref(v1);
    if (SecIdentityCopyCertificate(v3, &certificateRef))
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039930();
      }
    }
    else
    {
      int v4 = "1.2.840.113635.100.6.83";
      uint64_t v5 = off_100055828;
      do
      {
        +[NSString stringWithUTF8String:v4];
        uint64_t v6 = (const void *)SecCertificateCopyExtensionValue();
        if (v6)
        {
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v4);
          CFRelease(v6);
        }
        SecAccessControlRef v7 = *v5++;
        int v4 = v7;
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v8 = empty;
  if (certificateRef) {
    CFRelease(certificateRef);
  }
  if (v3) {
    CFRelease(v3);
  }

  return v8;
}

void sub_10001A5B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (v10) {
    CFRelease(v10);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001A5FC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = qword_10005BE10;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001A6BC;
  v8[3] = &unk_100055730;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_10001A6BC(uint64_t a1)
{
  result[0] = 0;
  *(void *)&long long v22 = kSecAttrLabel;
  *((void *)&v22 + 1) = kSecAttrAccessGroup;
  v21[0] = @"com.apple.remoted.identity";
  v21[1] = @"com.apple.remoted";
  *(void *)&long long v23 = kSecClass;
  *((void *)&v23 + 1) = kSecReturnRef;
  v21[2] = kSecClassIdentity;
  v21[3] = &__kCFBooleanTrue;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v21 forKeys:&v22 count:4];
  OSStatus v3 = SecItemCopyMatching(v2, result);
  if (v3 != -25300 && v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039998();
    }
    id v4 = 0;
  }
  else
  {
    if (!result[0])
    {

LABEL_25:
      id v4 = sub_10001987C();
      goto LABEL_26;
    }
    id v4 = sec_identity_create((SecIdentityRef)result[0]);
  }
  if (result[0]) {
    CFRelease(result[0]);
  }

  if (!v4) {
    goto LABEL_25;
  }
  id v5 = *(id *)(a1 + 32);
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = &__NSArray0__struct;
  }
  id v7 = sub_10001A470(v4);
  id v8 = objc_alloc_init((Class)NSMutableSet);
  result[0] = _NSConcreteStackBlock;
  result[1] = (CFTypeRef)3221225472;
  result[2] = sub_10001C3A4;
  result[3] = &unk_100055080;
  id v9 = v8;
  id v20 = v9;
  xpc_array_apply(v7, result);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        if (![v9 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * i)])
        {

          goto LABEL_25;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v22 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

LABEL_26:
  id v14 = qword_10005BE18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AA3C;
  block[3] = &unk_100055730;
  id v17 = v4;
  id v18 = *(id *)(a1 + 40);
  id v15 = v4;
  dispatch_async(v14, block);
}

void sub_10001AA14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001AA3C(uint64_t a1)
{
  sub_100019848(*(id *)(a1 + 32));
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    OSStatus v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_10001AA90(void *a1)
{
  id v7 = a1;
  objc_storeStrong((id *)&qword_10005BE18, a1);
  CFDictionaryRef v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.remoted.identity", v2);
  id v4 = (void *)qword_10005BE10;
  qword_10005BE10 = (uint64_t)v3;

  if (!qword_10005BE00)
  {
    os_log_t v5 = os_log_create("com.apple.RemoteServiceDiscovery", "identity");
    id v6 = (void *)qword_10005BE00;
    qword_10005BE00 = (uint64_t)v5;
  }
}

id sub_10001AB48()
{
  return (id)qword_10005BE08;
}

void sub_10001AB54(int a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = (void *)qword_10005BE18;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001AF6C;
  v10[3] = &unk_100055800;
  id v11 = v7;
  id v9 = v7;
  sub_10001E8BC(v8, a1, a2, a3, &stru_100055770, &stru_1000557D8, 0, v10);
}

void sub_10001AC28(id a1, id a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = qword_10005BE00;
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Attempting to issue DCRT", buf, 2u);
  }
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD14;
  block[3] = &unk_100055198;
  id v7 = v2;
  id v5 = v2;
  dispatch_async(v4, block);
}

void sub_10001AD14(uint64_t a1)
{
  v4[0] = kMAOptionsNetworkTimeoutInterval;
  v4[1] = kMAOptionsIgnoreExistingDCRT;
  v5[0] = &off_100056FD0;
  v5[1] = &__kCFBooleanFalse;
  id v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  id v3 = *(id *)(a1 + 32);
  MAEIssueDCRTWithCompletion();
}

void sub_10001AE34(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
    sub_100039A00();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_10001AEB8(id a1, NSError *a2)
{
  id v2 = a2;
  if ([&off_100056F88 count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [&off_100056F88 objectAtIndexedSubscript:v3];
      [v4 longValue];
      int HasDomainAndErrorCode = mobileactivationErrorHasDomainAndErrorCode();

      if (HasDomainAndErrorCode) {
        break;
      }
      ++v3;
    }
    while (v3 < (unint64_t)[&off_100056F88 count]);
  }
  else
  {
    LOBYTE(HasDomainAndErrorCode) = 0;
  }

  return HasDomainAndErrorCode;
}

void sub_10001AF6C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = qword_10005BE00;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039A68();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Successfully issued DCRT after %d attempt(s)", (uint8_t *)v7, 8u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001B05C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  int v5 = [v4 type];
  id v6 = objc_opt_class();

  id v7 = [v6 tlsOidsRequiredOfPeer];
  uint64_t v8 = sub_10001B0DC(v5, v7, v3);

  return v8;
}

uint64_t sub_10001B0DC(int a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = sec_trust_copy_ref(v6);
  CFArrayRef v8 = SecTrustCopyCertificateChain(v7);
  CFArrayRef v9 = v8;
  if (v8)
  {
    id v10 = [(__CFArray *)v8 lastObject];
    if (v10)
    {
      uint64_t v11 = sub_10001B200(a1, v5, v10);
      CFRelease(v10);
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039B04();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
  {
    sub_100039AD0();
  }
  uint64_t v11 = 0;
LABEL_9:

  if (v7) {
    CFRelease(v7);
  }

  return v11;
}

void sub_10001B1D0(_Unwind_Exception *a1)
{
  CFRelease(v2);
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10001B200(int a1, void *a2, __SecCertificate *a3)
{
  id v5 = a2;
  error[0] = 0;
  id v6 = SecCertificateCopyKey(a3);
  id v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039B38();
    }
    goto LABEL_33;
  }
  CFDataRef v8 = SecKeyCopyExternalRepresentation(v6, error);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039B6C();
    }
    goto LABEL_33;
  }
  CFArrayRef v9 = (void *)SecCertificateCopyExtensionValue();
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039BD4();
    }

    goto LABEL_33;
  }
  id v10 = v9;
  long long v39 = 0u;
  long long v40 = 0u;
  *(_OWORD *)uint64_t buf = 0u;
  *(void *)CFStringRef v33 = 0;
  id v31 = v10;
  id v11 = [v31 bytes];
  if (CTParseCertificateSet((unint64_t)v11, (unint64_t)[v31 length] + (void)v11, buf, 3, v33)|| !*(void *)v33)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039DA8();
    }
    id v12 = 0;
    goto LABEL_21;
  }
  id v12 = objc_alloc_init((Class)NSMutableArray);
  if (!v12)
  {
LABEL_21:
    id v16 = 0;
    goto LABEL_22;
  }
  if (*(void *)v33)
  {
    uint64_t v13 = 0;
    int v14 = 0;
    do
    {
      id v15 = (void *)SecCertificateCreateWithBytes();
      [v12 setObject:v15 atIndexedSubscript:v13];

      uint64_t v13 = ++v14;
    }
    while (*(void *)v33 > (unint64_t)v14);
  }
  id v16 = [v12 copy];
LABEL_22:

  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039C08();
    }

    goto LABEL_33;
  }
  id v17 = (void *)SecCertificateCopyExtensionValue();
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039C3C();
    }

LABEL_33:
    uint64_t v19 = 0;
LABEL_34:
    uint64_t v20 = 0;
    goto LABEL_35;
  }
  size_t v18 = aks_attest_context_size;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v19 = malloc_type_calloc(1uLL, v18, 0x1B044E25uLL);
      if (v19) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v19 = malloc_type_calloc(1uLL, v18, 0x61D5536CuLL);
    if (!v19)
    {
      error[1] = 0;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      *(_OWORD *)uint64_t buf = 0u;
      id v26 = &_os_log_default;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      uint64_t v27 = __error();
      int v28 = strerror(*v27);
      *(_DWORD *)CFStringRef v33 = 136315650;
      *(void *)&v33[4] = "known-constant allocation";
      __int16 v34 = 2048;
      size_t v35 = v18;
      __int16 v36 = 2080;
      uint64_t v37 = v28;
      _os_log_send_and_compose_impl();

      uint64_t v29 = _os_crash_msg();
      sub_100036794(v29);
    }
  }
  id v22 = v17;
  [v22 bytes];
  [v22 length];
  if (aks_attest_context_init())
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039D40();
    }
LABEL_70:

    goto LABEL_34;
  }
  long long v23 = (id)qword_10005BE00;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [(__CFData *)v8 sha256];
    long long v24 = [v30 base64EncodedStringWithOptions:0];
    *(_DWORD *)uint64_t buf = 138543362;
    *(void *)&uint8_t buf[4] = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Authenticating TLS peer with public key sha256: %{public}@", buf, 0xCu);
  }
  if ([v5 containsObject:@"1.2.840.113635.100.6.84"]
    && (sub_10001B9AC(v16) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039D0C();
    }
    goto LABEL_70;
  }
  if ([v5 containsObject:@"1.2.840.113635.100.6.83"]
    && (sub_10001BAD4(v8, v16) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039CD8();
    }
    goto LABEL_70;
  }
  if (a1 == 15)
  {
    if (sub_100016F3C() && (sub_10001C0A0() & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039CA4();
      }
      goto LABEL_70;
    }
  }
  else if (a1 == 16 && (sub_10001BE08() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039C70();
    }
    goto LABEL_70;
  }
  long long v25 = qword_10005BE00;
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "TLS peer authenticated successfully.", buf, 2u);
  }

  uint64_t v20 = 1;
LABEL_35:
  free(v19);
  if (v7) {
    CFRelease(v7);
  }
  if (error[0]) {
    CFRelease(error[0]);
  }

  return v20;
}

void sub_10001B8DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef cf)
{
  free(v14);
  if (v13) {
    CFRelease(v13);
  }
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10001B938(void *a1, __SecCertificate *a2)
{
  id v3 = a1;
  int v4 = [v3 type];
  id v5 = objc_opt_class();

  id v6 = [v5 tlsOidsRequiredOfPeer];
  uint64_t v7 = sub_10001B200(v4, v6, a2);

  return v7;
}

uint64_t sub_10001B9AC(void *a1)
{
  id v1 = a1;
  id v2 = qword_10005BE00;
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Verifying peer's DCRT chain against SCRT root CA...", buf, 2u);
  }
  uint64_t v3 = 1;
  if ((sub_10001C428(v1, 1) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_100039E44();
    }
    int v4 = qword_10005BE00;
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Verifying peer's DCRT chain against UCRT root CA...", v6, 2u);
    }
    if (sub_10001C428(v1, 0))
    {
      uint64_t v3 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039E10();
      }
      uint64_t v3 = 0;
    }
  }

  return v3;
}

uint64_t sub_10001BAD4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  CFTypeRef cf = 0;
  id v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = SecCertificateCopyKey(v5);
    CFDataRef v8 = v7;
    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039EAC();
      }
      uint64_t v12 = 0;
      goto LABEL_19;
    }
    CFDataRef v9 = SecKeyCopyExternalRepresentation(v7, (CFErrorRef *)&cf);
    id v10 = qword_10005BE00;
    if (!v9)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039EE0();
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Verifying peer's DAK attestation...", buf, 2u);
    }
    CFDataRef v11 = v9;
    [(__CFData *)v11 bytes];
    [(__CFData *)v11 length];
    if (aks_attest_context_verify())
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A088();
      }
LABEL_17:
      uint64_t v12 = 0;
      id v13 = 0;
LABEL_18:

      CFRelease(v8);
LABEL_19:
      CFRelease(v6);
      goto LABEL_20;
    }
    uint64_t v28 = 0;
    *(void *)uint64_t buf = 0;
    if (!aks_attest_context_get() && *(void *)buf && v28)
    {
      id v15 = objc_alloc((Class)NSData);
      id v16 = [v15 initWithBytes:*(void *)buf length:v28];
      if (v16)
      {
        id v17 = v16;

        char v18 = 1;
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039FEC();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
    {
      sub_10003A020();
    }
    id v17 = 0;
    char v18 = 0;
LABEL_33:
    id v13 = v17;
    if (v18)
    {
      if ([v3 isEqual:v13])
      {
        uint64_t v12 = 1;
        goto LABEL_18;
      }
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039F48();
      }
    }
    else
    {
      uint64_t v19 = qword_10005BE00;
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_100039F7C(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    uint64_t v12 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
    sub_100039E78();
  }
  uint64_t v12 = 0;
LABEL_20:
  if (cf) {
    CFRelease(cf);
  }

  return v12;
}

void sub_10001BDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf)
{
  CFRelease(v9);
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10001BE08()
{
  CFTypeRef cf = 0;
  CFStringRef v18 = @"GetCombined";
  CFBooleanRef v19 = kCFBooleanTrue;
  CFDictionaryRef v0 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  int v8 = 0;
  id v1 = (void *)AMFDRSealingMapCopyLocalDictForClass();
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A0F0();
    }
    goto LABEL_12;
  }
  if (sub_10001C874())
  {
    char v2 = sub_10001CB98(v1, v12, v11, (_WORD *)&v8 + 1, &v8);
    id v3 = qword_10005BE00;
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 67109376;
        int v15 = HIWORD(v8);
        __int16 v16 = 1024;
        int v17 = (unsigned __int16)v8;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Peer authenticated as compute node at carrier %lc index %lc", buf, 0xEu);
      }
      if (sub_10001CF14(&v10, &v9))
      {
        BOOL v4 = sub_10001D040(v1, v10, v9);
        id v5 = qword_10005BE00;
        if (v4)
        {
          if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Self matched cctrl in chassis manifest.", buf, 2u);
          }
LABEL_12:
          uint64_t v6 = 1;
          goto LABEL_22;
        }
        if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_FAULT)) {
          sub_10003A158();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
      {
        sub_10003A198();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
    {
      sub_10003A1CC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
  {
    sub_10003A200();
  }
  uint64_t v6 = 0;
LABEL_22:

  if (cf) {
    CFRelease(cf);
  }
  return v6;
}

void sub_10001C078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001C0A0()
{
  uint64_t v14 = 0;
  CFTypeRef cf = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  int v10 = 0;
  if ((sub_10001C874() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A200();
    }
    goto LABEL_29;
  }
  CFDictionaryRef v0 = +[NSString stringWithFormat:@"%08llX-%016llX", v14, v13];
  id v1 = (void *)SecCertificateCopyExtensionValue();
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A234();
    }

    goto LABEL_29;
  }
  char v2 = (void *)AMFDRSealingMapCopyDictFromCombinedData();
  id v3 = v2;
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A268();
    }

    goto LABEL_29;
  }
  BOOL v4 = sub_10001D040(v2, v14, v13);
  id v5 = qword_10005BE00;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A304();
    }

    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer authenticated as cctrl.", buf, 2u);
  }
  if ((sub_10001CF14(&v12, &v11) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A198();
    }

    goto LABEL_29;
  }
  char v6 = sub_10001CB98(v3, v12, v11, (_WORD *)&v10 + 1, &v10);
  uint64_t v7 = qword_10005BE00;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A2D0();
    }

LABEL_29:
    uint64_t v8 = 0;
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 67109376;
    int v17 = HIWORD(v10);
    __int16 v18 = 1024;
    int v19 = (unsigned __int16)v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Self matched compute node at carrier %lc index %lc", buf, 0xEu);
  }

  uint64_t v8 = 1;
LABEL_30:
  if (cf) {
    CFRelease(cf);
  }
  return v8;
}

void sub_10001C37C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
}

void sub_10001C39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const void *a16)
{
  if (a2) {
    objc_terminate();
  }
  sub_10001C37C(a1, 0, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_10001C3A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    id v5 = *(void **)(a1 + 32);
    char v6 = +[NSString stringWithUTF8String:xpc_string_get_string_ptr(v4)];
    [v5 addObject:v6];
  }
  return 1;
}

uint64_t sub_10001C428(void *a1, int a2)
{
  id v3 = a1;
  CFTypeRef cf = 0;
  SecTrustRef trust = 0;
  id v4 = [v3 mutableCopy];
  SecTrustResultType result = kSecTrustResultInvalid;
  if (a2)
  {
    id v5 = objc_alloc((Class)NSData);
    id v6 = [v5 initWithBytes:aBeginCertifica length:dword_10005BC70];
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A338();
      }
      goto LABEL_23;
    }
    uint64_t AppleBasicAttestationSystem = SecPolicyCreateAppleBasicAttestationSystem();
    if (!AppleBasicAttestationSystem)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A36C();
      }
LABEL_22:

LABEL_23:
      uint64_t v9 = 0;
LABEL_24:

      uint64_t v11 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    id v8 = objc_alloc((Class)NSData);
    id v6 = [v8 initWithBytes:aBeginCertifica_0 length:dword_10005B94C];
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A574();
      }
      goto LABEL_23;
    }
    uint64_t AppleBasicAttestationSystem = SecPolicyCreateAppleBasicAttestationUser();
    if (!AppleBasicAttestationSystem)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A5A8();
      }
      goto LABEL_22;
    }
  }
  uint64_t v9 = (const void *)AppleBasicAttestationSystem;
  int v10 = (const void *)SecCertificateCreateWithPEM();
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A3A0();
    }

    goto LABEL_24;
  }
  [v4 addObject:v10];
  if (SecTrustCreateWithCertificates(v4, v9, &trust))
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A50C();
    }
  }
  else
  {
    int v19 = v10;
    if (!SecTrustSetAnchorCertificates(trust, (CFArrayRef)+[NSArray arrayWithObjects:&v19 count:1]))
    {
      if (!SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
      {
        if (SecTrustGetTrustResult(trust, &result))
        {
          if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
            sub_10003A43C();
          }
          goto LABEL_28;
        }
        if (result != kSecTrustResultRecoverableTrustFailure || !SecTrustIsExpiredOnly())
        {
          if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
            sub_10003A3D4();
          }
          goto LABEL_28;
        }
        uint64_t v14 = qword_10005BE00;
        if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ignoring past-due expiration date on DCRT.", v15, 2u);
        }
      }
      uint64_t v13 = qword_10005BE00;
      uint64_t v11 = 1;
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Peer's DCRT passed trust evaluation.", v15, 2u);
      }
      goto LABEL_29;
    }
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A4A4();
    }
  }
LABEL_28:
  uint64_t v11 = 0;
LABEL_29:

  CFRelease(v10);
LABEL_30:
  if (cf) {
    CFRelease(cf);
  }
  if (trust) {
    CFRelease(trust);
  }
  if (v9) {
    CFRelease(v9);
  }

  return v11;
}

void sub_10001C804(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, CFTypeRef a12)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a12) {
    CFRelease(a12);
  }
  if (v12) {
    CFRelease(v12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001C874()
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v1 = 0;
  uint64_t v2 = 0;
  aks_attest_context_get();
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
    sub_10003A784();
  }

  return 0;
}

uint64_t sub_10001CB98(void *a1, uint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5)
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = a1;
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v22 = a4;
    uint64_t v23 = a5;
    uint64_t v10 = *(void *)v31;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v31 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      objc_opt_class();
      uint64_t v13 = 0;
      id v14 = 0;
      if (objc_opt_isKindOfClass())
      {
        if ([v12 hasPrefix:@"N"]
          && [v12 hasSuffix:@"1"]
          && [v12 length] == (id)4)
        {
          unsigned int v15 = [v12 characterAtIndex:1];
          unsigned int v27 = [v12 characterAtIndex:2];
          uint64_t v13 = [v7 objectForKeyedSubscript:v12];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v26 = v15;
            id v14 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
            __int16 v16 = qword_10005BE00;
            if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 138412802;
              id v35 = v14;
              __int16 v36 = 1024;
              unsigned int v37 = v26;
              __int16 v38 = 1024;
              unsigned int v39 = v27;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Chassis manifest lists cnode UDID '%@' at carrier %lc index %lc", buf, 0x18u);
            }
            if (sub_10001D1CC(v14, (uint64_t)&v29, (uint64_t)&v28))
            {
              if (v29 == a2 && v28 == a3)
              {
                if (v22) {
                  *uint64_t v22 = v26;
                }
                if (v23) {
                  *uint64_t v23 = v27;
                }

                uint64_t v20 = 1;
                goto LABEL_32;
              }
            }
            else
            {
              __int16 v18 = qword_10005BE00;
              if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)uint64_t buf = 138543362;
                id v35 = v14;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to extract HW identifiers from cnode UDID '%{public}@'", buf, 0xCu);
              }
            }
            goto LABEL_19;
          }
          int v17 = qword_10005BE00;
          if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)uint64_t buf = 138543362;
            id v35 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Chassis manifest contained unexpected type at %{public}@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v13 = 0;
        }
        id v14 = 0;
      }
LABEL_19:

      if (v9 == (id)++v11)
      {
        id v19 = [v7 countByEnumeratingWithState:&v30 objects:v40 count:16];
        id v9 = v19;
        if (v19) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v20 = 0;
LABEL_32:

  return v20;
}

uint64_t sub_10001CF14(void *a1, void *a2)
{
  uint64_t v4 = (const void *)MGCopyAnswer();
  uint64_t v5 = MGCopyAnswer();
  uint64_t v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A820();
      }
      uint64_t v6 = 0;
LABEL_15:
      CFRelease(v4);
      return v6;
    }
    if (a1) {
      CFNumberGetValue((CFNumberRef)v4, kCFNumberLongLongType, a1);
    }
    if (a2) {
      CFNumberGetValue((CFNumberRef)v6, kCFNumberLongLongType, a2);
    }
LABEL_10:
    CFRelease((CFTypeRef)v6);
    if (!v4) {
      return 0;
    }
    uint64_t v6 = 1;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
    sub_10003A7EC();
  }
  if (v6) {
    goto LABEL_10;
  }
  return v6;
}

void sub_10001D014(_Unwind_Exception *a1)
{
  CFRelease(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10001D040(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = [a1 objectForKeyedSubscript:@"BM02"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A8BC();
    }
    goto LABEL_17;
  }
  id v6 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
  id v7 = qword_10005BE00;
  if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Chassis manifest lists cctrl UDID '%@'", buf, 0xCu);
  }
  if ((sub_10001D1CC(v6, (uint64_t)&v12, (uint64_t)&v11) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A854();
    }

LABEL_17:
    BOOL v9 = 0;
    goto LABEL_18;
  }
  BOOL v9 = v12 == a2 && v11 == a3;

LABEL_18:
  return v9;
}

uint64_t sub_10001D1CC(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = [v5 componentsSeparatedByString:@"-"];
  id v7 = v6;
  if (v6 && [v6 count] == (id)2)
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    BOOL v9 = +[NSScanner scannerWithString:v8];

    if ([v9 scanHexLongLong:a2])
    {
      uint64_t v10 = 1;
      uint64_t v11 = [v7 objectAtIndexedSubscript:1];
      uint64_t v12 = +[NSScanner scannerWithString:v11];

      if (([v12 scanHexLongLong:a3] & 1) == 0)
      {
        uint64_t v13 = (void *)qword_10005BE00;
        if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
          sub_10003A958(v13, v7);
        }
        uint64_t v10 = 0;
      }
      BOOL v9 = v12;
    }
    else
    {
      unsigned int v15 = (void *)qword_10005BE00;
      if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
        sub_10003A9F8(v15, v7);
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10005BE00, OS_LOG_TYPE_ERROR)) {
      sub_10003A8F0();
    }
    uint64_t v10 = 0;
    BOOL v9 = 0;
  }

  return v10;
}

void sub_10001D368(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001D9B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = qword_10005BE20;
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
      sub_10003728C(a1, a3, v5);
    }
    [*(id *)(a1 + 32) connect:0];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) connection];

    id v7 = qword_10005BE20;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v12, 0xCu);
      }
      close(*(_DWORD *)(a1 + 40));
    }
    else
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v12, 0xCu);
      }
      xpc_remote_connection_get_failsafe_version_flags();
      uint64_t v11 = (void *)xpc_remote_connection_create_with_connected_fd();
      [*(id *)(a1 + 32) connect:v11];
    }
  }
}

void sub_10001DB6C(void *a1)
{
  id v2 = a1;
  if (!qword_10005BE30)
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "network_peer");
    uint64_t v4 = (void *)qword_10005BE20;
    qword_10005BE20 = (uint64_t)v3;

    uint64_t v5 = qword_10005BE20;
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "initializing network peer device", v8, 2u);
    }
    objc_storeStrong((id *)&qword_10005BE30, a1);
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)qword_10005BE28;
    qword_10005BE28 = v6;
  }
}

BOOL sub_10001DC40(const char *a1)
{
  id v2 = (id)qword_10005BE30;
  if (!v2) {
    sub_10003AB34(handler, buf);
  }

  os_log_t v3 = qword_10005BE20;
  if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enabling network peer", buf, 2u);
  }
  if (a1)
  {
    if (qword_10005BE38)
    {
      BOOL result = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10003ADA4();
        return 0;
      }
    }
    else
    {
      uint64_t v5 = if_nametoindex(a1);
      if (v5)
      {
        uint64_t v6 = v5;
        if (sub_10001F918(a1, &qword_10005BE40, 0))
        {
          BOOL result = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR);
          if (result)
          {
            sub_10003AD3C();
            return 0;
          }
        }
        else
        {
          BOOL v8 = qword_10005BE20;
          if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "create peer listener start", buf, 2u);
          }
          __int16 handle_6 = -6663;
          int handle = -1;
          int v9 = sub_10001F504(&handle, (__n128 *)&qword_10005BE40, &handle_6, v6, (uint64_t)&unk_100044D94);
          if (v9)
          {
            int v10 = v9;
            uint64_t v11 = qword_10005BE20;
            if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to start remoted listener: %{darwin.errno}d", buf, 8u);
              uint64_t v11 = qword_10005BE20;
            }
            BOOL result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
            if (result)
            {
              sub_10003ACD4();
              return 0;
            }
          }
          else
          {
            if ((id)qword_10005BE50) {
              sub_10003AC4C(&v21, buf);
            }
            dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, handle, 0, (dispatch_queue_t)qword_10005BE30);
            uint64_t v13 = (void *)qword_10005BE50;
            qword_10005BE50 = (uint64_t)v12;

            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_10001E620;
            handler[3] = &unk_1000554F0;
            int v20 = handle;
            dispatch_source_set_event_handler((dispatch_source_t)qword_10005BE50, handler);
            LODWORD(v18) = handle;
            dispatch_source_set_mandatory_cancel_handler();
            dispatch_activate((dispatch_object_t)qword_10005BE50);
            id v14 = qword_10005BE20;
            if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "create peer listener done", buf, 2u);
            }
            unsigned int v15 = objc_alloc_init(RSDNCMInterface);
            __int16 v16 = (void *)qword_10005BE38;
            qword_10005BE38 = (uint64_t)v15;

            [((id)qword_10005BE38) setIndex:v6 _NSConcreteStackBlock:3221225472 sub_10001E798:&unk_1000554F0 v18];
            [(id)qword_10005BE38 setName:strdup(a1)];
            int v17 = qword_10005BE20;
            if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 136446210;
              *(void *)&uint8_t buf[4] = a1;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "network peer enabled on %{public}s", buf, 0xCu);
            }
            return 1;
          }
        }
      }
      else
      {
        id v7 = qword_10005BE20;
        BOOL result = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_10003ABD4((uint64_t)a1, v7);
          return 0;
        }
      }
    }
  }
  else
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10003ABA0();
      return 0;
    }
  }
  return result;
}

void sub_10001E06C()
{
  id v0 = (id)qword_10005BE30;
  if (!v0) {
    sub_10003AB34(&v17, buf);
  }

  uint64_t v1 = qword_10005BE20;
  if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "disabling network peer", buf, 2u);
  }
  if (qword_10005BE38)
  {
    id v2 = (id)qword_10005BE50;
    if (!v2) {
      sub_10003AE0C(&v17, buf);
    }

    dispatch_source_cancel((dispatch_source_t)qword_10005BE50);
    os_log_t v3 = (void *)qword_10005BE50;
    qword_10005BE50 = 0;

    uint64_t v4 = (void *)qword_10005BE38;
    qword_10005BE38 = 0;

    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEBUG)) {
      sub_10003AE78();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(id)qword_10005BE28 copy];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v10 state] == 3)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10001E318;
            v12[3] = &unk_100055600;
            v12[4] = v10;
            [v10 goodByeWithCallback:v12];
          }
          else
          {
            [v10 disconnect];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }

    qword_10005BE40 = 0;
    *(void *)algn_10005BE48 = 0;
    uint64_t v11 = qword_10005BE20;
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "network peer disabled", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR))
  {
    sub_10003ADD8();
  }
}

id sub_10001E318(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
    sub_100038814();
  }
  return [*(id *)(a1 + 32) disconnect];
}

BOOL sub_10001E378(void *a1)
{
  id v2 = (id)qword_10005BE30;
  if (!v2) {
    sub_10003AB34(&v8, v9);
  }

  if (!qword_10005BE38)
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10003AEB8();
    return 0;
  }
  uint64_t v3 = sub_10001E4B0(a1);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
      sub_10003AF20();
    }

    return 0;
  }
  id v6 = [[RSDRemoteNetworkPeerDevice alloc] initClientWithRemoteAddress:a1];
  if (v6)
  {
    id v7 = v6;
    [v6 attach];

    return 1;
  }
  BOOL result = os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_10003AEEC();
    return 0;
  }
  return result;
}

id sub_10001E4B0(void *a1)
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = (id)qword_10005BE28;
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v2);
        }
        int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v10 = [v9 remote_address];
        if (*v10 == *a1 && v10[1] == a1[1])
        {
          id v12 = v9;

          ++v5;
          id v6 = v12;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v4);

    if (v6 && v5 >= 2) {
      sub_10003AF54(&v14, v19);
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

uint64_t sub_10001E620(uint64_t a1)
{
  int v16 = 0;
  unsigned int v17 = -1431655766;
  *(void *)&v14.sa_len = 0;
  *(void *)&v14.sa_data[6] = 0;
  uint64_t v15 = 0;
  socklen_t v13 = 28;
  for (uint64_t result = sub_10001FD44(*(_DWORD *)(a1 + 32), &v14, &v13, (unsigned __int8 *)&xmmword_100044D80, (int *)&v17);
        !result;
        uint64_t result = sub_10001FD44(*(_DWORD *)(a1 + 32), &v14, &v13, (unsigned __int8 *)&xmmword_100044D80, (int *)&v17))
  {
    id v3 = qword_10005BE20;
    if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got incoming remoted connection", buf, 2u);
    }
    id v4 = sub_10001E4B0(&v14.sa_data[6]);
    int v5 = v4;
    if (v4)
    {
      [v4 serverReplacePeerSocket:v17];
    }
    else
    {
      id v6 = [RSDRemoteNetworkPeerDevice alloc];
      id v7 = [(RSDRemoteNetworkPeerDevice *)v6 initServerWithPeerSocket:v17];
      if (v7)
      {
        uint64_t v8 = v7;
        [v7 attach];
      }
      else
      {
        int v9 = qword_10005BE20;
        if (os_log_type_enabled((os_log_t)qword_10005BE20, OS_LOG_TYPE_ERROR)) {
          sub_10003AFF0(&v10, v11, v9);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001E798(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

double sub_10001E7A0(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_10001E7C4(char *a1, uint64_t a2, _DWORD *a3)
{
  id v4 = sub_10001E83C(a1, a2);
  int v5 = v4;
  uint64_t v6 = 0;
  if (a3 && v4)
  {
    if ([v4 length] == (id)4)
    {
      *a3 = *(_DWORD *)[v5 bytes];
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

id sub_10001E83C(char *path, uint64_t a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(0, path);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, (CFStringRef)+[NSString stringWithUTF8String:a2], 0, 0);
  if (CFProperty)
  {
    int v5 = CFProperty;
    CFTypeID v6 = CFGetTypeID(CFProperty);
    if (v6 == CFDataGetTypeID()) {
      CFProperty = v5;
    }
    else {
      CFProperty = 0;
    }
  }

  return CFProperty;
}

void sub_10001E8BC(void *a1, int a2, int a3, int a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a1;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  int v46 = 0;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_10001EADC;
  uint64_t v43 = sub_10001EB08;
  id v44 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001EB10;
  v28[3] = &unk_1000558B0;
  __int16 v34 = v45;
  id v20 = v16;
  id v30 = v20;
  int v36 = a2;
  id v21 = v17;
  id v31 = v21;
  int v37 = a3;
  int v38 = a4;
  id v22 = v15;
  id v29 = v22;
  id v23 = v18;
  id v32 = v23;
  id v35 = &v39;
  id v24 = v19;
  id v33 = v24;
  uint64_t v25 = objc_retainBlock(v28);
  unsigned int v26 = objc_retainBlock(v25);
  unsigned int v27 = (void *)v40[5];
  v40[5] = (uint64_t)v26;

  ((void (*)(void *))v25[2])(v25);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
}

void sub_10001EAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_10001EADC(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10001EB08(uint64_t a1)
{
}

void sub_10001EB10(uint64_t a1)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_10001EC14;
  v5[3] = &unk_100055888;
  uint64_t v10 = *(void *)(a1 + 72);
  int v12 = *(_DWORD *)(a1 + 88);
  uint64_t v2 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 92);
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 80);
  id v8 = v3;
  uint64_t v11 = v4;
  id v9 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void sub_10001EC14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    goto LABEL_7;
  }
  int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v4 >= *(_DWORD *)(a1 + 80)) {
    goto LABEL_7;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    if ((*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v3))
    {
      int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      goto LABEL_6;
    }
LABEL_7:
    uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_8;
  }
LABEL_6:
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * (*(int *)(a1 + 84) + (v4 - 1) * *(int *)(a1 + 88)));
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ED64;
  block[3] = &unk_100055860;
  id v11 = *(id *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 64);
  dispatch_after(v6, v7, block);

LABEL_8:
}

uint64_t sub_10001ED64(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned int *)(*(void *)(a1[5] + 8) + 24));
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1[6] + 8) + 40) + 16);

  return v3();
}

void sub_10001EDC8(void *a1)
{
  id v2 = a1;
  os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "watchdog");
  int v4 = (void *)qword_10005BE58;
  qword_10005BE58 = (uint64_t)v3;

  objc_storeStrong((id *)&qword_10005BE60, a1);
  if ((sub_10000EE10() & 1) == 0)
  {
    if (qword_10005BE70 != -1) {
      dispatch_once(&qword_10005BE70, &stru_1000558D0);
    }
    if (!dword_10005BE78)
    {
      id v7 = qword_10005BE58;
      if (!os_log_type_enabled((os_log_t)qword_10005BE58, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      __int16 v11 = 0;
      uint64_t v8 = "Not enable remoted watchdog";
      id v9 = (uint8_t *)&v11;
      goto LABEL_7;
    }
  }
  wd_endpoint_register();
  wd_endpoint_add_queue();
  uint64_t v5 = os_transaction_create();
  dispatch_time_t v6 = (void *)qword_10005BE68;
  qword_10005BE68 = v5;

  wd_endpoint_activate();
  id v7 = qword_10005BE58;
  if (os_log_type_enabled((os_log_t)qword_10005BE58, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = 0;
    uint64_t v8 = "activated remoted watchdog";
    id v9 = (uint8_t *)&v10;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  }
LABEL_8:
}

void sub_10001EF18(id a1)
{
  uint64_t v1 = malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (os_parse_boot_arg_string()) {
    dword_10005BE78 = remote_device_type_parse();
  }

  free(v1);
}

void sub_10001EF9C(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001EFB0(int *a1, __n128 *a2, unsigned int a3, int a4, uint64_t a5)
{
  memset(v22, 170, 28);
  if (!a1 || !a2 || !a3)
  {
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 134218496;
      *(void *)id v24 = a1;
      *(_WORD *)&v24[8] = 2048;
      uint64_t v25 = a2;
      *(_WORD *)unsigned int v26 = 1024;
      *(_DWORD *)&v26[2] = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "invalid fd %p, addr %p or port %d", buf, 0x1Cu);
    }
    goto LABEL_11;
  }
  if (a2->n128_u8[0] == 254 && !a4 && (a2->n128_u8[1] & 0xC0) == 0x80)
  {
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B190(v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_11:
    uint64_t v17 = 22;
    goto LABEL_15;
  }
  uint64_t v18 = sub_10001F2CC(a1, a4, a5);
  if (v18)
  {
    uint64_t v17 = v18;
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B128();
    }
  }
  else
  {
    sub_10001F484((uint64_t)v22, a2, a3, a4);
    id v20 = sub_10001F278();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 67110402;
      *(_DWORD *)id v24 = v22[0].sa_len;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = v22[0].sa_family;
      LOWORD(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 2) = bswap32(*(unsigned __int16 *)v22[0].sa_data) >> 16;
      HIWORD(v25) = 1024;
      *(_DWORD *)unsigned int v26 = *(_DWORD *)&v22[1].sa_data[6];
      *(_WORD *)&v26[4] = 1040;
      int v27 = 16;
      __int16 v28 = 2096;
      id v29 = &v22[0].sa_data[6];
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "sockaddr_in6 { len: %d, family: %d, port: %d, scope_id: %d, addr: %{network:in6_addr}.16P }", buf, 0x2Au);
    }

    if (*a1 < 0) {
      sub_10003B0BC(&v21, buf);
    }
    if (!connect(*a1, v22, 0x1Cu) || *__error() == 36) {
      return 0;
    }
    uint64_t v17 = *__error();
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B030(a1, v17, v9);
    }
  }
LABEL_15:

  if (a1 && v17) {
    close_drop_optional_np();
  }
  return v17;
}

id sub_10001F278()
{
  if (qword_10005BE88 != -1) {
    dispatch_once(&qword_10005BE88, &stru_1000558F0);
  }
  id v0 = (void *)qword_10005BE80;

  return v0;
}

uint64_t sub_10001F2CC(int *a1, int a2, uint64_t a3)
{
  int v11 = a2;
  *a1 = socket(30, 1, 0);
  dispatch_time_t v6 = sub_10001F278();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10003B300(a1, v6);
  }

  if (*a1 == -1)
  {
    a3 = *__error();
    id v7 = sub_10001F278();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003B1C8();
    }
LABEL_16:

    if (a3)
    {
LABEL_17:
      close_drop_optional_np();
      return a3;
    }
    return a3;
  }
  if (fcntl(*a1, 4, 4) == -1) {
    sub_100034AB0(&v10, v12);
  }
  if (a2 && setsockopt(*a1, 41, 125, &v11, 4u))
  {
    a3 = *__error();
    id v7 = sub_10001F278();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003B298();
    }
    goto LABEL_16;
  }
  if (a3)
  {
    a3 = sub_10001FE20(*a1, (unsigned __int8 *)a3);
    if (a3)
    {
      uint64_t v8 = sub_10001F278();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10003B230();
      }

      goto LABEL_17;
    }
  }
  return a3;
}

__n128 sub_10001F484(uint64_t a1, __n128 *a2, unsigned int a3, int a4)
{
  if (!a1) {
    sub_10003B39C(&v5, v6);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0;
  *(_WORD *)a1 = 7708;
  *(_WORD *)(a1 + 2) = __rev16(a3);
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  *(_DWORD *)(a1 + 24) = a4;
  return result;
}

uint64_t sub_10001F504(int *a1, __n128 *a2, _WORD *a3, int a4, uint64_t a5)
{
  if (!a1 || !a2 || !a3)
  {
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t buf = 134218496;
      *(void *)int v27 = a1;
      *(_WORD *)&v27[8] = 2048;
      *(void *)&v27[10] = a2;
      *(_WORD *)&v27[18] = 2048;
      *(void *)&v27[20] = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "invalid fd %p, addr %p or port %p", buf, 0x20u);
    }
    goto LABEL_11;
  }
  if (a2->n128_u8[0] == 254 && !a4 && (a2->n128_u8[1] & 0xC0) == 0x80)
  {
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B190(v9, v10, v11, v12, v13, v14, v15, v16);
    }
LABEL_11:
    uint64_t v17 = 22;
LABEL_15:

    if (a1 && v17) {
      close_drop_optional_np();
    }
    return v17;
  }
  memset(v25, 170, 28);
  uint64_t v18 = sub_10001F2CC(a1, a4, a5);
  if (v18)
  {
    uint64_t v17 = v18;
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B128();
    }
    goto LABEL_15;
  }
  int v24 = 1;
  if (setsockopt(*a1, 0xFFFF, 4, &v24, 4u) < 0)
  {
    uint64_t v17 = *__error();
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B408();
    }
    goto LABEL_15;
  }
  sub_10001F484((uint64_t)v25, a2, (unsigned __int16)*a3, a4);
  id v20 = sub_10001F278();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67110402;
    *(_DWORD *)int v27 = v25[0].sa_len;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v25[0].sa_family;
    *(_WORD *)&v27[10] = 1024;
    *(_DWORD *)&v27[12] = bswap32(*(unsigned __int16 *)v25[0].sa_data) >> 16;
    *(_WORD *)&v27[16] = 1024;
    *(_DWORD *)&v27[18] = *(_DWORD *)&v25[1].sa_data[6];
    *(_WORD *)&v27[22] = 1040;
    *(_DWORD *)&v27[24] = 16;
    __int16 v28 = 2096;
    id v29 = &v25[0].sa_data[6];
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "sockaddr_in6 { len: %d, family: %d, port: %d, scope_id: %d, addr: %{network:in6_addr}.16P }", buf, 0x2Au);
  }

  if (bind(*a1, v25, 0x1Cu) == -1)
  {
    uint64_t v17 = *__error();
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B470();
    }
    goto LABEL_15;
  }
  if (listen(*a1, 128) == -1)
  {
    uint64_t v17 = *__error();
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B4D8();
    }
    goto LABEL_15;
  }
  socklen_t v23 = 28;
  if (getsockname(*a1, v25, &v23) == -1)
  {
    uint64_t v17 = *__error();
    id v9 = sub_10001F278();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003B540();
    }
    goto LABEL_15;
  }
  *a3 = bswap32(*(unsigned __int16 *)v25[0].sa_data) >> 16;
  uint64_t v21 = sub_10001F278();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = (unsigned __int16)*a3;
    *(_DWORD *)uint64_t buf = 68158466;
    *(_DWORD *)int v27 = 16;
    *(_WORD *)&v27[4] = 2096;
    *(void *)&v27[6] = &v25[0].sa_data[6];
    *(_WORD *)&v27[14] = 1024;
    *(_DWORD *)&v27[16] = a4;
    *(_WORD *)&v27[20] = 1024;
    *(_DWORD *)&v27[22] = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "bound to %{network:in6_addr}.16P%%%d:%d", buf, 0x1Eu);
  }

  return 0;
}

uint64_t sub_10001F918(const char *a1, _OWORD *a2, int a3)
{
  if (!a2)
  {
    dispatch_time_t v6 = sub_10001F278();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003B5A8(v6, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v7 = 22;
    goto LABEL_33;
  }
  int v27 = 0;
  if (getifaddrs(&v27))
  {
    dispatch_time_t v6 = sub_10001F278();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003B64C(v6);
    }
    uint64_t v7 = 0xFFFFFFFFLL;
LABEL_33:

    return v7;
  }
  uint64_t v15 = v27;
  if (!v27)
  {
    freeifaddrs(0);
    goto LABEL_30;
  }
  uint64_t v16 = 0;
  int v17 = 0;
  do
  {
    if (v15->ifa_flags)
    {
      ifa_addr = v15->ifa_addr;
      if (ifa_addr->sa_family == 30
        && !strncmp(v15->ifa_name, a1, 0x10uLL)
        && (!a3 || ifa_addr->sa_data[6] == 254 && (ifa_addr->sa_data[7] & 0xC0) == 0x80))
      {
        *(_DWORD *)&ifa_addr[1].sa_data[6] = if_nametoindex(a1);
        id v19 = sub_10001F278();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t buf = 136315650;
          id v29 = a1;
          __int16 v30 = 1040;
          int v31 = 16;
          __int16 v32 = 2096;
          id v33 = &ifa_addr->sa_data[6];
          _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%s: %{network:in6_addr}.16P", buf, 0x1Cu);
        }

        ++v17;
        uint64_t v16 = v15;
      }
    }
    uint64_t v15 = v15->ifa_next;
  }
  while (v15);
  if (v16) {
    *a2 = *(_OWORD *)&v16->ifa_addr->sa_data[6];
  }
  freeifaddrs(v27);
  if (v17 >= 2)
  {
    dispatch_time_t v6 = sub_10001F278();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136315138;
      id v29 = a1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found more than one ipv6 addresses for %s", buf, 0xCu);
    }
    uint64_t v7 = 0;
    goto LABEL_33;
  }
  if (!v17)
  {
LABEL_30:
    dispatch_time_t v6 = sub_10001F278();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003B5E0((uint64_t)a1, v6, v20, v21, v22, v23, v24, v25);
    }
    uint64_t v7 = 3;
    goto LABEL_33;
  }
  return 0;
}

uint64_t sub_10001FBC0(int a1, _OWORD *a2)
{
  memset(v8, 0, sizeof(v8));
  int v9 = 0;
  socklen_t v7 = 28;
  if (!a2) {
    sub_10003B6DC(&v6, v10);
  }
  if (getpeername(a1, (sockaddr *)v8, &v7))
  {
    uint64_t v3 = *__error();
    int v4 = sub_10001F278();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003B748();
    }
  }
  else
  {
    uint64_t v3 = 0;
    *a2 = *(_OWORD *)&v8[8];
  }
  return v3;
}

uint64_t sub_10001FC90(const char *a1)
{
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (!if_nametoindex(a1))
  {
    uint64_t v3 = sub_10001F278();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003B7B0((uint64_t)a1, v3, v10, v11, v12, v13, v14, v15);
    }
    uint64_t v2 = 2;
    goto LABEL_8;
  }
  uint64_t v2 = sub_10001F918(a1, &v17, 0);
  if (v2)
  {
    uint64_t v3 = sub_10001F278();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003B81C((uint64_t)a1, v3, v4, v5, v6, v7, v8, v9);
    }
LABEL_8:
  }
  return v2;
}

uint64_t sub_10001FD44(int a1, sockaddr *a2, socklen_t *a3, unsigned __int8 *a4, int *a5)
{
  if (!a5) {
    return 22;
  }
  int v7 = accept(a1, a2, a3);
  if (v7 == -1)
  {
    uint64_t v9 = *__error();
    if (v9 != 35)
    {
      uint64_t v11 = sub_10001F278();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003B888();
      }
    }
  }
  else
  {
    int v8 = v7;
    uint64_t v9 = sub_10001FE20(v7, a4);
    if (v9)
    {
      uint64_t v10 = sub_10001F278();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10003B8F0();
      }

      if ((v8 & 0x80000000) == 0) {
        close(v8);
      }
    }
    else
    {
      *a5 = v8;
    }
  }
  return v9;
}

uint64_t sub_10001FE20(int a1, unsigned __int8 *a2)
{
  if (!*((_DWORD *)a2 + 4)) {
    sub_10003B958(&v7, v8);
  }
  LODWORD(v8[0]) = *((_DWORD *)a2 + 4);
  if (!setsockopt(a1, 6, 32, v8, 4u))
  {
    if (*a2)
    {
      LODWORD(v8[0]) = 1;
      if (setsockopt(a1, 0xFFFF, 8, v8, 4u))
      {
        uint64_t v4 = *__error();
        uint64_t v5 = sub_10001F278();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_10003BAFC();
        }
        goto LABEL_5;
      }
      LODWORD(v8[0]) = *a2;
      if (LODWORD(v8[0]) && setsockopt(a1, 6, 16, v8, 4u))
      {
        uint64_t v4 = *__error();
        uint64_t v5 = sub_10001F278();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_10003BA94();
        }
        goto LABEL_5;
      }
      LODWORD(v8[0]) = *((_DWORD *)a2 + 2);
      if (LODWORD(v8[0]) && setsockopt(a1, 6, 258, v8, 4u))
      {
        uint64_t v4 = *__error();
        uint64_t v5 = sub_10001F278();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_10003BA2C();
        }
        goto LABEL_5;
      }
      LODWORD(v8[0]) = *((_DWORD *)a2 + 3);
      if (LODWORD(v8[0]) && setsockopt(a1, 6, 257, v8, 4u))
      {
        uint64_t v4 = *__error();
        uint64_t v5 = sub_10001F278();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_10003B9C4();
        }
        goto LABEL_5;
      }
    }
    return 0;
  }
  uint64_t v4 = *__error();
  uint64_t v5 = sub_10001F278();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10003BB64();
  }
LABEL_5:

  return v4;
}

void sub_10002004C(id a1)
{
  qword_10005BE80 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "network");

  _objc_release_x1();
}

void sub_100020090()
{
  if (qword_10005BEB0 != -1) {
    dispatch_once(&qword_10005BEB0, &stru_1000559C8);
  }
  if (!byte_10005BEB8)
  {
    if (qword_10005BEC0 != -1) {
      dispatch_once(&qword_10005BEC0, &stru_1000559E8);
    }
    if (dword_10005BEC8
      || os_variant_is_darwinos() && !os_variant_is_recovery()
      || sub_10000EE10())
    {
      os_log_t v0 = os_log_create("com.apple.RemoteServiceDiscovery", "timesync");
      uint64_t v1 = (void *)qword_10005BE90;
      qword_10005BE90 = (uint64_t)v0;

      dispatch_queue_t v2 = dispatch_queue_create("com.apple.remoted.timesync", 0);
      uint64_t v3 = (void *)qword_10005BE98;
      qword_10005BE98 = (uint64_t)v2;

      uint64_t started = remote_device_start_browsing();
      uint64_t v5 = (void *)qword_10005BEA8;
      qword_10005BEA8 = started;

      uint64_t v6 = qword_10005BE90;
      if (os_log_type_enabled((os_log_t)qword_10005BE90, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "enabled remoted timesync", v7, 2u);
      }
    }
  }
}

void sub_1000201EC(id a1, OS_remote_device *a2, BOOL a3)
{
  uint64_t v4 = a2;
  unsigned int type = remote_device_get_type();
  if (qword_10005BEC0 != -1) {
    dispatch_once(&qword_10005BEC0, &stru_1000559E8);
  }
  if (dword_10005BEC8)
  {
    BOOL v6 = dword_10005BEC8 == type;
  }
  else
  {
    if (type > 0xF) {
      goto LABEL_15;
    }
    BOOL v6 = 1;
    if (((1 << type) & 0x9200) == 0) {
      goto LABEL_15;
    }
  }
  if (v6 && qword_10005BEA0 == 0)
  {
    objc_storeStrong((id *)&qword_10005BEA0, a2);
    uint64_t name = remote_device_get_name();
    uint64_t v9 = qword_10005BE90;
    if (os_log_type_enabled((os_log_t)qword_10005BE90, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 136446210;
      uint64_t v19 = name;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "start timesync with %{public}s", buf, 0xCu);
    }
    uint64_t v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005BE98);
    dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000204C4;
    handler[3] = &unk_100055958;
    uint64_t v16 = name;
    uint64_t v11 = v10;
    uint64_t v15 = v11;
    unsigned int v17 = type;
    dispatch_source_set_event_handler(v11, handler);
    uint64_t v13 = v11;
    remote_device_set_connected_callback();
    uint64_t v12 = v13;
    remote_device_set_disconnected_callback();
    dispatch_activate(v12);
  }
LABEL_15:
}

void sub_1000204C4(uint64_t a1)
{
  int v2 = remote_device_timesync();
  uint64_t v3 = qword_10005BE90;
  if (os_log_type_enabled((os_log_t)qword_10005BE90, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "fail";
    uint64_t v5 = *(void *)(a1 + 40);
    if (v2) {
      uint64_t v4 = "success";
    }
    int v8 = 136446466;
    uint64_t v9 = v5;
    __int16 v10 = 2082;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "timesync with %{public}s %{public}s", (uint8_t *)&v8, 0x16u);
  }
  BOOL v6 = *(NSObject **)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) == 15) {
    dispatch_time_t v7 = -1;
  }
  else {
    dispatch_time_t v7 = dispatch_time(0, 60000000000);
  }
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void sub_1000205E4(uint64_t a1)
{
}

void sub_1000205F8(uint64_t a1)
{
  int v2 = qword_10005BE90;
  if (os_log_type_enabled((os_log_t)qword_10005BE90, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 136446210;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s disconnected, timesync stop", (uint8_t *)&v5, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v4 = (void *)qword_10005BEA0;
  qword_10005BEA0 = 0;
}

void sub_1000206B4(id a1)
{
  if (os_parse_boot_arg_int()) {
    byte_10005BEB8 = 0;
  }
}

void sub_1000206FC(id a1)
{
  uint64_t v1 = malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (os_parse_boot_arg_string()) {
    dword_10005BEC8 = remote_device_type_parse();
  }

  free(v1);
}

void sub_100020780(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

id sub_100020794(void *a1)
{
  return sub_100005E14(a1, "ERROR");
}

id sub_1000207A0(void *a1, int a2)
{
  uint64_t v3 = sub_100005E14(a1, "ERROR");
  xpc_dictionary_set_int64(v3, "error_code", a2);

  return v3;
}

void sub_100020A1C(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v4 = sub_100018430(v3);
    int v5 = (id)qword_10005BED0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) name];
      *(_DWORD *)uint64_t buf = 136446466;
      id v11 = v6;
      __int16 v12 = 2080;
      uint64_t v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Accepting service connection for \"%{public}s\" (client=\"%s\")", buf, 0x16u);
    }

    free(v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100020BB4;
    v8[3] = &unk_100055170;
    void v8[4] = *(void *)(a1 + 32);
    dispatch_time_t v7 = v3;
    uint64_t v9 = v7;
    xpc_connection_set_event_handler(v7, v8);
    xpc_connection_set_target_queue(v7, (dispatch_queue_t)qword_10005BED8);
    xpc_connection_activate(v7);
  }
}

void sub_100020B98(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_100020BB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = v4;
  id v7 = v3;
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
LABEL_10:
    xpc_connection_cancel(v6);
    goto LABEL_24;
  }
  if ((xpc_dictionary_expects_reply() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003BD18();
    }
    goto LABEL_10;
  }
  id v9 = v7;
  id v10 = v5;
  id v11 = (const char *)[v10 entitlement];
  if (!v11) {
    sub_10003BBCC(&v31, buf);
  }
  __int16 v12 = v11;
  if (!strcmp(v11, "None-AppleInternal") || sub_100023E44(v12)) {
    goto LABEL_13;
  }
  if (xpc_get_type(v9) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_10003BC8C(&v31, buf);
  }
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t buf = v13;
  *(_OWORD *)&uint8_t buf[16] = v13;
  xpc_dictionary_get_audit_token();
  uint64_t v14 = (void *)xpc_copy_entitlement_for_token();
  BOOL v15 = v14 == 0;

  if (!v15)
  {
LABEL_13:
  }
  else
  {
    uint64_t v16 = (void *)xpc_copy_entitlement_for_token();
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v29 = sub_100018430(v6);
      __int16 v30 = (id)qword_10005BED0;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 136446466;
        *(void *)&uint8_t buf[4] = [v10 name];
        *(_WORD *)&uint8_t buf[12] = 2080;
        *(void *)&buf[14] = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "service_handler: Client lacks privilege to interact with service with name %{public}s (client=\"%s\")", buf, 0x16u);
      }

      free(v29);
      goto LABEL_19;
    }
  }
  string = xpc_dictionary_get_string(v9, "cmd");
  if (!string || strcmp(string, "connect"))
  {
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003BC58();
    }
LABEL_19:
    uint64_t v19 = sub_100005E14(v9, "ERROR");
    uint64_t v20 = v19;
    if (v19)
    {
      xpc_dictionary_get_remote_connection(v19);
      uint64_t v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v21, v20);
    }
    goto LABEL_24;
  }
  uint64_t v22 = sub_100018430(v6);
  uint64_t v23 = (id)qword_10005BED0;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136446466;
    *(void *)&uint8_t buf[4] = [v10 name];
    *(_WORD *)&uint8_t buf[12] = 2080;
    *(void *)&buf[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%{public}s> Got CONNECT command (client=\"%s\")", buf, 0x16u);
  }

  free(v22);
  id v24 = v10;
  id v25 = v9;
  unsigned int v26 = [v24 device];
  *(void *)uint64_t buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = sub_100023E84;
  *(void *)&buf[24] = &unk_1000550A8;
  id v33 = v24;
  id v34 = v25;
  id v27 = v25;
  id v28 = v24;
  [v26 invokeWhenConnectable:buf];

LABEL_24:
}

void sub_100020FC8(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_100021354(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v4 = sub_100018430(v3);
    id v5 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t buf = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Accepting device connection (client=\"%s\")", buf, 0x16u);
    }
    free(v4);
    id v7 = [*(id *)(a1 + 32) device_peers];
    [v7 addObject:v3];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000214DC;
    v9[3] = &unk_100055170;
    v9[4] = *(void *)(a1 + 32);
    int v8 = v3;
    id v10 = v8;
    xpc_connection_set_event_handler(v8, v9);
    xpc_connection_set_target_queue(v8, (dispatch_queue_t)qword_10005BED8);
    xpc_connection_activate(v8);
  }
}

void sub_1000214DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = v4;
  id v7 = v3;
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_cancel(v6);
    [v5 device_peers];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v10 removeObject:v6];
LABEL_32:

    goto LABEL_33;
  }
  string = xpc_dictionary_get_string(v7, "cmd");
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003BE88();
    }
    if (xpc_dictionary_expects_reply()) {
      goto LABEL_25;
    }
    goto LABEL_33;
  }
  id v9 = string;
  if (!strcmp(string, "helo_device"))
  {
    id v10 = v5;
    __int16 v13 = v6;
    if (xpc_dictionary_get_uint64(v7, "device_state") == 1
      && [v10 state] - 3 <= 2)
    {
      xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
      sub_100022F50(v10, v13, v14);
      xpc_connection_send_message(v13, v14);
    }
    goto LABEL_32;
  }
  if (!strcmp(v9, "heartbeat"))
  {
    id v15 = v5;
    id v16 = v7;
    BOOL v17 = [v15 heartbeat_requests];
    id v18 = [v17 count];

    if (!v18)
    {
      *(void *)uint64_t buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_1000241D4;
      *(void *)&buf[24] = &unk_100055A30;
      id v130 = v15;
      [v130 heartbeatWithCallback:buf];
    }
    uint64_t v19 = [v15 heartbeat_requests];
    [v19 addObject:v16];
  }
  else if (!strcmp(v9, "timesync"))
  {
    id v20 = v5;
    uint64_t v21 = v6;
    id v22 = v7;
    *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v131 = v23;
    *(_OWORD *)&v131[16] = v23;
    xpc_connection_get_audit_token();
    id v24 = (void *)xpc_copy_entitlement_for_token();
    BOOL v25 = v24 == 0;

    if (v25)
    {
      sub_1000207A0(v22, 1);
      id v26 = (id)objc_claimAutoreleasedReturnValue();
      id v27 = sub_100018430(v21);
      id v28 = qword_10005BED0;
      if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 136315138;
        *(void *)&uint8_t buf[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "device_timesync: Client lacks privilege (client=\"%s\")", buf, 0xCu);
      }
      free(v27);
      xpc_dictionary_send_reply();
    }
    else
    {
      *(void *)uint64_t buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_100024330;
      *(void *)&buf[24] = &unk_100055600;
      id v130 = v22;
      [v20 timesyncWithCallback:buf];
      id v26 = v130;
    }
  }
  else
  {
    if (xpc_dictionary_expects_reply())
    {
      if (!strcmp(v9, "list_services"))
      {
        id v117 = v5;
        id v29 = v7;
        xpc_dictionary_get_remote_connection(v29);
        uint64_t v115 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        xpc_object_t xdict = xpc_dictionary_create_reply(v29);
        __int16 v30 = sub_100018430(v115);
        uint64_t v31 = (id)qword_10005BED0;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_10003BEBC((uint64_t)[v117 uuidString], (uint64_t)v30, (uint64_t)v134);
        }

        free(v30);
        xpc_dictionary_set_string(xdict, "result", "OK");
        xpc_object_t v32 = xpc_array_create(0, 0);
        long long v132 = 0u;
        long long v133 = 0u;
        memset(v131, 0, sizeof(v131));
        id v33 = [v117 services];
        id v34 = [v33 countByEnumeratingWithState:v131 objects:buf count:16];
        if (v34)
        {
          uint64_t v35 = **(void **)&v131[16];
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (**(void **)&v131[16] != v35) {
                objc_enumerationMutation(v33);
              }
              int v37 = *(void **)(*(void *)&v131[8] + 8 * i);
              if (sub_10002439C(v29, v37)) {
                xpc_array_set_string(v32, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v37 name]);
              }
            }
            id v34 = [v33 countByEnumeratingWithState:v131 objects:buf count:16];
          }
          while (v34);
        }

        xpc_dictionary_set_value(xdict, "services", v32);
        int v38 = sub_100018430(v115);
        uint64_t v39 = (id)qword_10005BED0;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          size_t count = xpc_array_get_count(v32);
          uint64_t v41 = [v117 services];
          *(_DWORD *)CFStringRef v121 = 134218754;
          size_t v122 = count;
          __int16 v123 = 1024;
          unsigned int v124 = [v41 count];
          __int16 v125 = 2082;
          id v126 = [v117 uuidString];
          __int16 v127 = 2080;
          uint64_t v128 = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "device_list_services: Returning %zd/%d services for device %{public}s (client=\"%s\")", v121, 0x26u);
        }
        free(v38);

        xpc_object_t reply = xdict;
        goto LABEL_26;
      }
      if (!strcmp(v9, "list_local_services"))
      {
        xpc_object_t xdicta = v5;
        id v116 = v7;
        xpc_dictionary_get_remote_connection(v116);
        uint64_t v118 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (sub_1000244D8(v116))
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v116);
          long long v42 = sub_100018430(v118);
          uint64_t v43 = (id)qword_10005BED0;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
            sub_10003BF04((uint64_t)[xdicta uuidString], (uint64_t)v42, (uint64_t)v121);
          }

          free(v42);
          xpc_object_t v44 = xpc_array_create(0, 0);
          long long v132 = 0u;
          long long v133 = 0u;
          memset(v131, 0, sizeof(v131));
          uint64_t v45 = [xdicta service_listeners];
          id v46 = [v45 countByEnumeratingWithState:v131 objects:buf count:16];
          if (v46)
          {
            uint64_t v47 = **(void **)&v131[16];
            do
            {
              for (j = 0; j != v46; j = (char *)j + 1)
              {
                if (**(void **)&v131[16] != v47) {
                  objc_enumerationMutation(v45);
                }
                CFStringRef v49 = [*(id *)(*(void *)&v131[8] + 8 * (void)j) service:xdicta];
                xpc_array_set_string(v44, 0xFFFFFFFFFFFFFFFFLL, (const char *)[v49 name]);
              }
              id v46 = [v45 countByEnumeratingWithState:v131 objects:buf count:16];
            }
            while (v46);
          }

          xpc_dictionary_set_value(reply, "services", v44);
          xpc_dictionary_set_string(reply, "result", "OK");
        }
        else
        {
          uint64_t v60 = sub_100018430(v118);
          uint64_t v61 = qword_10005BED0;
          if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 136315138;
            *(void *)&uint8_t buf[4] = v60;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "device_list_local_services: Client lacks privilege (client=\"%s\")", buf, 0xCu);
          }
          free(v60);
          xpc_object_t reply = sub_100005E14(v116, "ERROR");
        }

        goto LABEL_26;
      }
      if (strcmp(v9, "get_service"))
      {
        if (!strcmp(v9, "check_service"))
        {
          id v62 = v5;
          uint64_t v63 = (_xpc_connection_s *)v7;
          xpc_dictionary_get_remote_connection(v63);
          uint64_t v64 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
          uint64_t v65 = xpc_dictionary_get_string(v63, "name");
          if (v65)
          {
            CFStringRef v66 = v65;
            CFStringRef v67 = sub_100018430(v64);
            v68 = (id)qword_10005BED0;
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)uint64_t buf = 136446722;
              *(void *)&uint8_t buf[4] = v66;
              *(_WORD *)&uint8_t buf[12] = 2082;
              *(void *)&buf[14] = [v62 uuidString];
              *(_WORD *)&unsigned char buf[22] = 2080;
              *(void *)&buf[24] = v67;
              _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Fetching service %{public}s on %{public}s (client=\"%s\")", buf, 0x20u);
            }

            free(v67);
            v69 = [v62 serviceWithName:v66];
            if (v69)
            {
              xpc_object_t reply = xpc_dictionary_create_reply(v63);
              xpc_dictionary_set_string(reply, "result", "OK");
            }
            else
            {
              uint64_t v87 = sub_100018430(v64);
              CFStringRef v88 = qword_10005BED0;
              if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 136446466;
                *(void *)&uint8_t buf[4] = v66;
                *(_WORD *)&uint8_t buf[12] = 2080;
                *(void *)&buf[14] = v87;
                _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "device_check_service: Unable to find service with name %{public}s (client=\"%s\")", buf, 0x16u);
              }
              free(v87);
              xpc_object_t reply = sub_100005E14(v63, "ERROR");
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
              sub_10003BF80();
            }
            xpc_object_t reply = sub_100005E14(v63, "ERROR");
          }
          goto LABEL_157;
        }
        if (!strcmp(v9, "get_heartbeat_stats"))
        {
          id v70 = v5;
          xpc_object_t reply = xpc_dictionary_create_reply(v7);
          xpc_dictionary_set_string(reply, "result", "OK");
          id v71 = [v70 heartbeat_stats];

          xpc_dictionary_set_data(reply, "heartbeat_stats", v71, 0x30uLL);
          goto LABEL_26;
        }
        if (!strcmp(v9, "get_connectable"))
        {
          id v72 = v5;
          xpc_object_t reply = xpc_dictionary_create_reply(v7);
          unsigned __int8 v73 = [v72 connectable];

          xpc_dictionary_set_BOOL(reply, "result", v73);
          goto LABEL_26;
        }
        if (!strcmp(v9, "reset"))
        {
          id v77 = v5;
          id v78 = v7;
          xpc_dictionary_get_remote_connection(v78);
          v79 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
          id v80 = v78;
          if (xpc_get_type(v80) != (xpc_type_t)&_xpc_type_dictionary) {
            sub_10003BFB4(v131, buf);
          }
          *(void *)&long long v81 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v81 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uint64_t buf = v81;
          *(_OWORD *)&uint8_t buf[16] = v81;
          xpc_dictionary_get_audit_token();
          uint64_t v82 = (void *)xpc_copy_entitlement_for_token();
          BOOL v83 = v82 == 0;

          uint64_t v84 = sub_100018430(v79);
          uint64_t v85 = qword_10005BED0;
          if (v83)
          {
            if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t buf = 136315138;
              *(void *)&uint8_t buf[4] = v84;
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "device_reset: Client lacks privilege to reset device (client=\"%s\")", buf, 0xCu);
            }
            free(v84);
            xpc_object_t reply = sub_100005E14(v80, "ERROR");
          }
          else
          {
            uint64_t v86 = (id)qword_10005BED0;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t buf = 136446466;
              *(void *)&uint8_t buf[4] = [v77 uuidString];
              *(_WORD *)&uint8_t buf[12] = 2080;
              *(void *)&buf[14] = v84;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "Resetting remote device %{public}s (client=\"%s\")", buf, 0x16u);
            }

            free(v84);
            [v77 reset];
            xpc_object_t reply = xpc_dictionary_create_reply(v80);
            xpc_dictionary_set_string(reply, "result", "OK");
          }

          goto LABEL_26;
        }
        if (strcmp(v9, "set_alias"))
        {
          if (!strcmp(v9, "disconnect_device"))
          {
            id v62 = v5;
            uint64_t v63 = (_xpc_connection_s *)v7;
            xpc_dictionary_get_remote_connection(v63);
            uint64_t v64 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
            if ([v62 type] - 14 >= 3)
            {
              uint64_t v105 = (void *)qword_10005BED0;
              if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
                sub_10003C074(v105, v62);
              }
              xpc_object_t reply = sub_1000207A0(v63, 1);
            }
            else
            {
              uint64_t v98 = sub_100018430(v64);
              CFStringRef v99 = (id)qword_10005BED0;
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t buf = 136446466;
                *(void *)&uint8_t buf[4] = [v62 device_name];
                *(_WORD *)&uint8_t buf[12] = 2080;
                *(void *)&buf[14] = v98;
                _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "Disconnecting remote device %{public}s (client=\"%s\")", buf, 0x16u);
              }

              free(v98);
              if ([v62 state] == 3)
              {
                *(void *)uint64_t buf = _NSConcreteStackBlock;
                *(void *)&uint8_t buf[8] = 3221225472;
                *(void *)&uint8_t buf[16] = sub_100024588;
                *(void *)&buf[24] = &unk_100055600;
                id v130 = v62;
                [v130 goodByeWithCallback:buf];
              }
              else
              {
                [v62 disconnect];
              }
              xpc_object_t reply = xpc_dictionary_create_reply(v63);
              xpc_dictionary_set_string(reply, "result", "OK");
            }
            goto LABEL_157;
          }
          if (!strcmp(v9, "get_latest_connect_error"))
          {
            id v100 = v5;
            xpc_object_t reply = xpc_dictionary_create_reply(v7);
            signed int v101 = [v100 latestConnectError];

            xpc_dictionary_set_int64(reply, "result", v101);
            goto LABEL_26;
          }
          if (strcmp(v9, "authenticate_device"))
          {
            if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
              sub_10003C24C();
            }
LABEL_25:
            xpc_object_t reply = sub_100005E14(v7, "ERROR");
            goto LABEL_26;
          }
          id v62 = v5;
          uint64_t v63 = v6;
          uint64_t v64 = (_xpc_connection_s *)v7;
          *(void *)uint64_t v131 = 0;
          uint64_t v106 = sub_100018430(v63);
          uint64_t v107 = qword_10005BED0;
          if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 136315138;
            *(void *)&uint8_t buf[4] = v106;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Authenticating device certificate on behalf of client... (client=\"%s\")", buf, 0xCu);
          }
          free(v106);
          if (xpc_dictionary_get_data(v64, "identity_cert", (size_t *)v131))
          {
            uint64_t v108 = (__SecCertificate *)SecCertificateCreateWithBytes();
            if (v108)
            {
              if (sub_10001B938(v62, v108))
              {
                uint64_t v109 = sub_100018430(v63);
                CFStringRef v110 = qword_10005BED0;
                if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t buf = 136315138;
                  *(void *)&uint8_t buf[4] = v109;
                  _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "Successfully authenticated device certificate on behalf of client (client=\"%s\")", buf, 0xCu);
                }
                free(v109);
                xpc_object_t reply = xpc_dictionary_create_reply(v64);
                xpc_dictionary_set_string(reply, "result", "OK");
              }
              else
              {
                v112 = sub_100018430(v63);
                if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
                  sub_10003C1E4();
                }
                free(v112);
                xpc_object_t reply = sub_100005E14(v64, "ERROR");
              }
              CFRelease(v108);
              goto LABEL_157;
            }
            CFStringRef v111 = sub_100018430(v63);
            if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
              sub_10003C17C();
            }
          }
          else
          {
            CFStringRef v111 = sub_100018430(v63);
            if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
              sub_10003C114();
            }
          }
          free(v111);
          xpc_object_t reply = sub_100005E14(v64, "ERROR");
LABEL_157:

LABEL_26:
          if (reply)
          {
            xpc_dictionary_get_remote_connection(reply);
            uint64_t v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
            xpc_connection_send_message(v12, reply);
          }
          goto LABEL_33;
        }
        id v89 = v5;
        v90 = v6;
        id v91 = v7;
        *(void *)&long long v92 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v92 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)uint64_t buf = v92;
        *(_OWORD *)&uint8_t buf[16] = v92;
        xpc_connection_get_audit_token();
        uint64_t v93 = (void *)xpc_copy_entitlement_for_token();
        BOOL v94 = v93 == 0;

        if (v94)
        {
          v102 = sub_100018430(v90);
          uint64_t v103 = qword_10005BED0;
          if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v131 = 136315138;
            *(void *)&v131[4] = v102;
            _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "device_set_alias: Client lacks privilege to name device (client=\"%s\")", v131, 0xCu);
          }
          free(v102);
          uint64_t v104 = sub_100005E14(v91, "ERROR");
        }
        else
        {
          uint64_t v95 = xpc_dictionary_get_string(v91, "device_alias");
          if (v95)
          {
            uint64_t v96 = sub_100018430(v90);
            uint64_t v97 = (id)qword_10005BED0;
            if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t v131 = 136446722;
              *(void *)&v131[4] = [v89 uuidString];
              *(_WORD *)&v131[12] = 2082;
              *(void *)&v131[14] = v95;
              *(_WORD *)&v131[22] = 2080;
              *(void *)&v131[24] = v96;
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_INFO, "setting remote device %{public}s alias as %{public}s (client=\"%s\")", v131, 0x20u);
            }

            free(v96);
            [v89 setDevice_alias:v95];
            xpc_object_t reply = xpc_dictionary_create_reply(v91);
            xpc_dictionary_set_string(reply, "result", "OK");
            goto LABEL_145;
          }
          if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
            sub_10003C040();
          }
          uint64_t v104 = sub_100005E14(v91, "ERROR");
        }
        xpc_object_t reply = (void *)v104;
LABEL_145:

        goto LABEL_26;
      }
      id v119 = v5;
      id v50 = v7;
      xpc_dictionary_get_remote_connection(v50);
      uint64_t v51 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      uint64_t v52 = xpc_dictionary_get_string(v50, "name");
      if (!v52)
      {
        if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
          sub_10003BF4C();
        }
        xpc_object_t reply = sub_100005E14(v50, "ERROR");
        goto LABEL_102;
      }
      uint64_t v53 = v52;
      uint64_t v54 = sub_100018430(v51);
      CFStringRef v55 = (id)qword_10005BED0;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t buf = 136446722;
        *(void *)&uint8_t buf[4] = v53;
        *(_WORD *)&uint8_t buf[12] = 2082;
        *(void *)&buf[14] = [v119 uuidString];
        *(_WORD *)&unsigned char buf[22] = 2080;
        *(void *)&buf[24] = v54;
        _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Fetching service %{public}s on %{public}s (client=\"%s\")", buf, 0x20u);
      }

      free(v54);
      CFStringRef v56 = [v119 serviceWithName:v53];
      if (v56)
      {
        if (sub_10002439C(v50, v56))
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v50);
          xpc_dictionary_set_string(reply, "result", "OK");
          id v57 = [v56 copyClientDescription];
          xpc_dictionary_set_value(reply, "service", v57);

          long long v58 = sub_100018430(v51);
          uint64_t v59 = qword_10005BED0;
          if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t buf = 136446466;
            *(void *)&uint8_t buf[4] = v53;
            *(_WORD *)&uint8_t buf[12] = 2080;
            *(void *)&buf[14] = v58;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "device_get_service: Returning service \"%{public}s\" (client=\"%s\")", buf, 0x16u);
          }
          free(v58);
          goto LABEL_101;
        }
        uint64_t v74 = sub_100018430(v51);
        uint64_t v76 = qword_10005BED0;
        if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 136446466;
          *(void *)&uint8_t buf[4] = v53;
          *(_WORD *)&uint8_t buf[12] = 2080;
          *(void *)&buf[14] = v74;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "device_get_service: Client lacks privilege to find service with name %{public}s (client=\"%s\")", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v74 = sub_100018430(v51);
        uint64_t v75 = qword_10005BED0;
        if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 136446466;
          *(void *)&uint8_t buf[4] = v53;
          *(_WORD *)&uint8_t buf[12] = 2080;
          *(void *)&buf[14] = v74;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "device_get_service: Unable to find service with name %{public}s (client=\"%s\")", buf, 0x16u);
        }
      }
      free(v74);
      xpc_object_t reply = sub_100005E14(v50, "ERROR");
LABEL_101:

LABEL_102:
      goto LABEL_26;
    }
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C280();
    }
  }
LABEL_33:
}

void sub_100022B58(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

id sub_100022CE4(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    id v3 = [*(id *)(a1 + 32) connection];
    uint64_t v4 = sub_100018430(v3);

    id v5 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unregistering client browse. (client=\"%s\")", (uint8_t *)&v7, 0xCu);
    }
    free(v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR))
  {
    sub_10003C2B4();
  }
  return [*(id *)(a1 + 32) cancel];
}

void sub_100022F50(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = a2;
  id v7 = a1;
  BOOL v8 = sub_100024134();
  id v9 = sub_100018430(v6);

  id v10 = qword_10005BED0;
  if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEBUG)) {
    sub_10003C2E8(v8, (uint64_t)v9, v10);
  }
  free(v9);
  xpc_dictionary_set_string(v5, "cmd", "found_device");
  id v11 = [v7 copyClientDescriptionWithSensitiveProperties:v8];

  xpc_dictionary_set_value(v5, "device", v11);
}

void sub_100023138(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) connection];
  xpc_connection_cancel(v1);
}

void sub_1000231BC(void *a1)
{
  id v1 = a1;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = (id)qword_10005BEE0;
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) deliverDevice:v1];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_1000232BC(void *a1)
{
  id v1 = a1;
  id v2 = qword_10005BED0;
  if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Delivering device update", buf, 2u);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v1 device_peers];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      long long v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
        sub_100022F50(v1, v8, v9);
        xpc_connection_send_message((xpc_connection_t)v8, v9);

        long long v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }
}

void sub_100023430(void *a1)
{
  id v3 = a1;
  id v1 = [v3 device_listener];

  if (v1)
  {
    [v3 device_listener];
    id v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v2);

    [v3 setDevice_listener:0];
  }
}

void sub_1000234A8(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableSet);
  id v3 = (void *)qword_10005BEE0;
  qword_10005BEE0 = (uint64_t)v2;

  id v4 = (void *)qword_10005BED8;
  qword_10005BED8 = (uint64_t)v1;
  id v9 = v1;

  os_log_t v5 = os_log_create("com.apple.RemoteServiceDiscovery", "ClientInterface");
  uint64_t v6 = (void *)qword_10005BED0;
  qword_10005BED0 = (uint64_t)v5;

  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.remoted", (dispatch_queue_t)qword_10005BED8, 1uLL);
  long long v8 = (void *)qword_10005BEE8;
  qword_10005BEE8 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_10005BEE8, &stru_100055A08);
  xpc_connection_activate((xpc_connection_t)qword_10005BEE8);
}

void sub_100023584(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100023640;
    handler[3] = &unk_100054F08;
    id v3 = v2;
    os_log_t v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_10005BED8);
    xpc_connection_activate(v3);
  }
}

void sub_100023640(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_cancel(v4);
    goto LABEL_40;
  }
  if (xpc_dictionary_expects_reply())
  {
    string = xpc_dictionary_get_string(v5, "cmd");
    if (!string)
    {
      if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
        sub_10003C45C();
      }
      goto LABEL_19;
    }
    long long v8 = string;
    if (strcmp(string, "browse"))
    {
      if (!strcmp(v8, "get_unique_device") || !strcmp(v8, "get_device"))
      {
        uint64_t v9 = sub_1000245E8(v4, v5);
        goto LABEL_21;
      }
      if (!strcmp(v8, "get_local_device_description"))
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(reply, "result", "OK");
        xpc_dictionary_set_uint64(v11, "device_messaging_protocol_version", 6uLL);
        xpc_dictionary_set_uuid(v11, "UUID", (const unsigned __int8 *)&xmmword_10005C020);
        xpc_dictionary_set_value(v11, "properties", (xpc_object_t)qword_10005C030);
        xpc_dictionary_set_value(reply, "device", v11);
        goto LABEL_37;
      }
      if (!strcmp(v8, "get_local_device_identity"))
      {
        id v27 = v4;
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        uint64_t v54 = sub_100024FA4;
        CFStringRef v55 = &unk_100055AC8;
        CFStringRef v56 = (BrowseRegistration *)v5;
        id v57 = v27;
        long long v58 = &stru_100055A50;
        id v28 = v56;
        id v29 = v27;
        sub_10001A5FC(0, &buf);

        goto LABEL_40;
      }
      if (!strcmp(v8, "delete_local_device_identity"))
      {
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        sub_10001A2D0();
      }
      else
      {
        if (strcmp(v8, "create_local_device_identity"))
        {
          if (strcmp(v8, "list_local_device_services"))
          {
            if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
              sub_10003C4FC();
            }
LABEL_19:
            uint64_t v9 = sub_100005E14(v5, "ERROR");
LABEL_21:
            xpc_object_t reply = (xpc_object_t)v9;
LABEL_38:
            id v24 = reply;
            if (!v24) {
              sub_10003C3F0(v51, &buf);
            }
            BOOL v25 = v24;

            xpc_dictionary_get_remote_connection(v25);
            id v26 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
            xpc_connection_send_message(v26, v25);

            goto LABEL_40;
          }
          xpc_object_t v11 = v5;
          xpc_object_t reply = xpc_dictionary_create_reply(v11);
          long long v12 = xpc_array_create(0, 0);
          if (sub_1000244D8(v11))
          {
            xpc_object_t v42 = v11;
            xpc_dictionary_set_string(reply, "result", "OK");
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v30 = (id)qword_10005C038;
            id v31 = [v30 countByEnumeratingWithState:&v47 objects:&buf count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v48;
              do
              {
                for (i = 0; i != v32; i = (char *)i + 1)
                {
                  if (*(void *)v48 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  xpc_object_t v35 = xpc_string_create((const char *)[*(id *)(*((void *)&v47 + 1) + 8 * i) name]);
                  xpc_array_append_value(v12, v35);
                }
                id v32 = [v30 countByEnumeratingWithState:&v47 objects:&buf count:16];
              }
              while (v32);
            }

            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            id v36 = (id)qword_10005C040;
            id v37 = [v36 countByEnumeratingWithState:&v43 objects:v51 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v44;
              do
              {
                for (j = 0; j != v38; j = (char *)j + 1)
                {
                  if (*(void *)v44 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  xpc_object_t v41 = xpc_string_create((const char *)[*(id *)(*((void *)&v43 + 1) + 8 * (void)j) name]);
                  xpc_array_append_value(v12, v41);
                }
                id v38 = [v36 countByEnumeratingWithState:&v43 objects:v51 count:16];
              }
              while (v38);
            }

            xpc_dictionary_set_value(reply, "services", v12);
            xpc_object_t v11 = v42;
          }
          else
          {
            xpc_dictionary_set_string(reply, "result", "ERROR");
          }
          goto LABEL_36;
        }
        xpc_object_t reply = xpc_dictionary_create_reply(v5);
        sub_100019808();
      }
      xpc_dictionary_set_string(reply, "result", "OK");
      goto LABEL_38;
    }
    xpc_object_t v11 = v5;
    long long v12 = xpc_dictionary_get_remote_connection(v11);
    BOOL v13 = xpc_dictionary_get_BOOL(v11, "present_only");
    xpc_object_t v14 = sub_100018430((_xpc_connection_s *)v12);
    id v15 = qword_10005BED0;
    BOOL v16 = os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v14;
        BOOL v17 = "Registering client browse (present-only). (client=\"%s\")";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v16)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v14;
      BOOL v17 = "Registering client browse. (client=\"%s\")";
      goto LABEL_27;
    }
    free(v14);
    id v18 = [[BrowseRegistration alloc] initWithRequest:v11];
    if (!v18) {
      sub_10003C490(v51, &buf);
    }
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    uint64_t v54 = sub_100024B74;
    CFStringRef v55 = &unk_100055A78;
    uint64_t v19 = v18;
    CFStringRef v56 = v19;
    sub_1000072A0(&buf);
    id v20 = sub_100018430((_xpc_connection_s *)v12);
    uint64_t v21 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v51 = 136315138;
      uint64_t v52 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Completed immediate devices. (client=\"%s\")", v51, 0xCu);
    }
    free(v20);
    if (v13)
    {
      [(BrowseRegistration *)v19 cancel];
      id v22 = sub_100018430((_xpc_connection_s *)v12);
      long long v23 = qword_10005BED0;
      if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v51 = 136315138;
        uint64_t v52 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Completed client browse (present-only). (client=\"%s\")", v51, 0xCu);
      }
      free(v22);
    }
    xpc_object_t reply = xpc_dictionary_create_reply(v11);
    xpc_dictionary_set_string(reply, "cmd", "browse");
    xpc_dictionary_set_string(reply, "result", "OK");

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
    sub_10003C530();
  }
LABEL_40:
}

BOOL sub_100023E44(const char *a1)
{
  return !strcmp(a1, "AppleInternal") && (os_variant_has_internal_content() & 1) != 0;
}

void sub_100023E84(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) device];
  unsigned int v4 = [v3 state];

  if (v4 == 5)
  {
    xpc_object_t reply = sub_100005E14(*(void **)(a1 + 40), "ERROR");
  }
  else
  {
    long long v18 = xmmword_100044D80;
    LODWORD(v19) = 8;
    uint64_t v6 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "keepalive");
    long long v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_BOOL) {
      LOBYTE(v18) = xpc_BOOL_get_value(v7);
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepalive_time");
    if (uint64) {
      DWORD1(v18) = uint64;
    }
    uint64_t v9 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepcount");
    if (v9) {
      DWORD2(v18) = v9;
    }
    uint64_t v10 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepinterval");
    if (v10) {
      HIDWORD(v18) = v10;
    }
    uint64_t v11 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "connect_timeout");
    if (v11) {
      LODWORD(v19) = v11;
    }
    int v12 = [*v2 getSocketWithTcpOption:&v18];
    if (v12 < 0)
    {
      BOOL v17 = (void *)qword_10005BED0;
      if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
        sub_10003C564(v2, v17);
      }
      xpc_object_t reply = sub_100005E14(*(void **)(a1 + 40), "INTERRUPTED");
    }
    else
    {
      xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
      BOOL v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_object_t v14 = sub_100018430(v13);
      id v15 = (id)qword_10005BED0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [*v2 name:v18 v19];
        *(_DWORD *)long long buf = 136446466;
        id v21 = v16;
        __int16 v22 = 2080;
        long long v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}s> Connect succeeded (client=\"%s\")", buf, 0x16u);
      }

      free(v14);
      xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
      xpc_dictionary_set_string(reply, "result", "OK");
      xpc_dictionary_set_fd(reply, "fd", v12);
      close(v12);
    }
  }
  xpc_dictionary_send_reply();
}

void sub_100024118(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100024134()
{
  xpc_connection_get_audit_token();
  os_log_t v0 = (void *)xpc_copy_entitlement_for_token();

  BOOL result = 0;
  if (v0)
  {
    id v1 = (void *)xpc_copy_entitlement_for_token();

    if (v1 || !sandbox_check_by_audit_token()) {
      return 1;
    }
  }
  return result;
}

void sub_1000241D4(uint64_t a1, int a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unsigned int v4 = [[*(id *)(a1 + 32) heartbeat_requests];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    if (a2) {
      long long v8 = "OK";
    }
    else {
      long long v8 = "ERROR";
    }
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(*((void *)&v12 + 1) + 8 * (void)v9));
        xpc_dictionary_set_string(reply, "result", v8);
        xpc_dictionary_send_reply();

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v11 = [[*(id *)(a1 + 32) heartbeat_requests];
  [v11 removeAllObjects];
}

void sub_100024330(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = sub_1000207A0(v2, a2);
  }
  else
  {
    id reply = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_string(reply, "result", "OK");
    uint64_t v3 = (uint64_t)reply;
  }
  id v5 = (id)v3;
  xpc_dictionary_send_reply();
}

BOOL sub_10002439C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (const char *)[v4 entitlement];
  if (!v5) {
    sub_10003C600(&v13, v14);
  }
  id v6 = v5;
  if (!strcmp(v5, "None-AppleInternal") || sub_100023E44(v6)) {
    goto LABEL_7;
  }
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_10003C66C(&v13, v14);
  }
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[0] = v7;
  v14[1] = v7;
  xpc_dictionary_get_audit_token();
  long long v8 = (void *)xpc_copy_entitlement_for_token();

  if (v8 || (uint64_t v9 = (void *)xpc_copy_entitlement_for_token(), v9, v9))
  {
LABEL_7:
    BOOL v10 = 1;
  }
  else
  {
    long long v12 = (void *)xpc_copy_entitlement_for_token();
    BOOL v10 = v12 != 0;
  }
  return v10;
}

BOOL sub_1000244D8(void *a1)
{
  id v1 = a1;
  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary) {
    sub_10003C66C(&v6, v7);
  }
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v2;
  v7[1] = v2;
  xpc_dictionary_get_audit_token();
  id v3 = (void *)xpc_copy_entitlement_for_token();
  BOOL v4 = v3 != 0;

  return v4;
}

id sub_100024588(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v4 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C6D8(a2, v4);
    }
  }
  return [*(id *)(a1 + 32) disconnect];
}

id sub_1000245E8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int uint64 = xpc_dictionary_get_uint64(v4, "device_type");
  string = xpc_dictionary_get_string(v4, "device_name");
  uuid = xpc_dictionary_get_uuid(v4, "UUID");
  long long v8 = xpc_dictionary_get_string(v4, "trust_level");
  BOOL v9 = uint64 != 0;
  if (string) {
    int v10 = v9 + 1;
  }
  else {
    int v10 = uint64 != 0;
  }
  if (uuid) {
    ++v10;
  }
  if (v10 != 1)
  {
    long long v14 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v43 = 67109632;
      *(_DWORD *)&v43[4] = v9;
      LOWORD(v44) = 1024;
      *(_DWORD *)((char *)&v44 + 2) = string != 0;
      HIWORD(v44) = 1024;
      LODWORD(v45) = uuid != 0;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "GET query with invalid criteria (t:%d n:%d u:%d)", v43, 0x14u);
    }
    uint64_t v13 = sub_100005E14(v4, "ERROR");
    goto LABEL_15;
  }
  uint64_t v11 = v8;
  if (!uuid && v8)
  {
    long long v12 = qword_10005BED0;
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C750(v11 != 0, 0, v12);
    }
    uint64_t v13 = sub_100005E14(v4, "ERROR");
LABEL_15:
    id reply = (void *)v13;
    goto LABEL_32;
  }
  BOOL v16 = v8 != 0;
  BOOL v17 = sub_100024134();
  *(void *)long long v43 = 0;
  long long v44 = v43;
  uint64_t v45 = 0x3032000000;
  long long v46 = sub_100024B98;
  long long v47 = sub_100024BA8;
  id v48 = 0;
  uint64_t v33 = 0;
  id v34 = (uint8_t *)&v33;
  uint64_t v35 = 0x3032000000;
  id v36 = sub_100024B98;
  id v37 = sub_100024BA8;
  id v38 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100024BB0;
  v29[3] = &unk_100055AA0;
  unsigned int v30 = uint64;
  BOOL v31 = v17;
  v29[6] = string;
  v29[7] = uuid;
  v29[4] = &v33;
  v29[5] = v43;
  BOOL v32 = v16;
  sub_1000072A0(v29);
  if (v11)
  {
    if (!strcmp(v11, "trusted"))
    {
      uint64_t v19 = v34;
      goto LABEL_23;
    }
    if (strcmp(v11, "untrusted"))
    {
LABEL_28:
      id v26 = sub_100018430(v3);
      id v27 = qword_10005BED0;
      if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109378;
        unsigned int v40 = uint64;
        __int16 v41 = 2080;
        xpc_object_t v42 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "device_get_unique: Unable to find device with type %d (client=\"%s\")", buf, 0x12u);
      }
      free(v26);
      id reply = sub_100005E14(v4, "ERROR");
      goto LABEL_31;
    }
  }
  else
  {
    long long v18 = (void *)*((void *)v34 + 5);
    if (v18) {
      goto LABEL_24;
    }
  }
  uint64_t v19 = v44;
LABEL_23:
  long long v18 = (void *)*((void *)v19 + 5);
LABEL_24:
  id v20 = v18;
  if (!v20) {
    goto LABEL_28;
  }
  id v21 = v20;
  id reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_set_string(reply, "result", "OK");
  id v22 = [v21 copyClientDescriptionWithSensitiveProperties:v17];
  xpc_dictionary_set_value(reply, "device", v22);

  long long v23 = sub_100018430(v3);
  id v24 = (id)qword_10005BED0;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    unsigned int v25 = [v21 type];
    *(_DWORD *)long long buf = 67109378;
    unsigned int v40 = v25;
    __int16 v41 = 2080;
    xpc_object_t v42 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "device_get_unique: Returning device of type %d (client=\"%s\")", buf, 0x12u);
  }

  free(v23);
LABEL_31:
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(v43, 8);
LABEL_32:

  return reply;
}

void sub_100024A88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  free(v29);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100024AD4(id a1, OS_xpc_object *a2)
{
  long long v2 = a2;
  if (!v2) {
    sub_10003C7DC(&v5, v6);
  }
  xpc_object_t xdict = v2;

  xpc_dictionary_get_remote_connection(xdict);
  id v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v3, xdict);
}

uint64_t sub_100024B74(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t sub_100024B98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100024BA8(uint64_t a1)
{
}

uint64_t sub_100024BB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(_DWORD *)(a1 + 64))
  {
    if ([v3 type] != *(_DWORD *)(a1 + 64))
    {
LABEL_3:
      id v5 = 0;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (*(void *)(a1 + 48))
  {
    if (strcmp((const char *)objc_msgSend(v3, "device_name"), *(const char **)(a1 + 48))
      && (!objc_msgSend(v4, "device_alias")
       || strcmp((const char *)objc_msgSend(v4, "device_alias"), *(const char **)(a1 + 48))))
    {
      uint64_t v6 = sub_100024E48(v4, "HWModel", *(unsigned __int8 *)(a1 + 68));
      long long v7 = v6;
      if (v6 && strcasestr(v6, *(const char **)(a1 + 48)))
      {
        id v5 = v4;
        long long v8 = 0;
        BOOL v9 = 0;
        int v10 = 0;
        goto LABEL_35;
      }
      long long v15 = sub_100024E48(v4, "ProductType", *(unsigned __int8 *)(a1 + 68));
      int v10 = v15;
      if (v15 && strcasestr(v15, *(const char **)(a1 + 48)))
      {
        BOOL v9 = 0;
      }
      else
      {
        BOOL v16 = sub_100024E48(v4, "UniqueDeviceID", *(unsigned __int8 *)(a1 + 68));
        BOOL v9 = v16;
        if (!v16 || !strcasestr(v16, *(const char **)(a1 + 48)))
        {
          BOOL v17 = sub_100024E48(v4, "SerialNumber", *(unsigned __int8 *)(a1 + 68));
          long long v8 = v17;
          if (v17 && strcasestr(v17, *(const char **)(a1 + 48))) {
            goto LABEL_33;
          }
          uint64_t v18 = sub_100024EFC(v4, *(unsigned __int8 *)(a1 + 68));
          if (v18)
          {
            id v5 = 0;
            if (strtoull(*(const char **)(a1 + 48), 0, 0) == v18) {
              goto LABEL_33;
            }
          }
          else
          {
            id v5 = 0;
          }
LABEL_34:
          if (!v7)
          {
LABEL_36:
            if (v10) {
              free(v10);
            }
            if (v9) {
              free(v9);
            }
            if (v8) {
              free(v8);
            }
            goto LABEL_15;
          }
LABEL_35:
          free(v7);
          goto LABEL_36;
        }
      }
      long long v8 = 0;
LABEL_33:
      id v5 = v4;
      goto LABEL_34;
    }
  }
  else if (!*(void *)(a1 + 56) {
         || ![v3 uuid]
  }
         || uuid_compare(*(const unsigned __int8 **)(a1 + 56), (const unsigned __int8 *)[v4 uuid]))
  {
    goto LABEL_3;
  }
LABEL_14:
  id v5 = v4;
LABEL_15:
  if (v5)
  {
    [v5 type];
    if (remote_device_type_is_trusted()) {
      uint64_t v11 = *(void *)(a1 + 32);
    }
    else {
      uint64_t v11 = *(void *)(a1 + 40);
    }
    objc_storeStrong((id *)(*(void *)(v11 + 8) + 40), v5);
  }
LABEL_20:
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (*(unsigned char *)(a1 + 69))
  {
    if (v12 && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      goto LABEL_23;
    }
LABEL_25:
    uint64_t v13 = 1;
    goto LABEL_26;
  }
  if (!v12) {
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v13 = 0;
LABEL_26:

  return v13;
}

char *sub_100024E48(void *a1, const char *a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 public_properties];
  long long v7 = xpc_dictionary_get_value(v6, a2);

  if (!v7 && a3)
  {
    long long v8 = [v5 properties];
    long long v7 = xpc_dictionary_get_value(v8, a2);
  }
  if (v7 && (string_ptr = xpc_string_get_string_ptr(v7)) != 0) {
    int v10 = strdup(string_ptr);
  }
  else {
    int v10 = 0;
  }

  return v10;
}

uint64_t sub_100024EFC(void *a1, int a2)
{
  id v3 = a1;
  id v4 = [v3 public_properties];
  id v5 = xpc_dictionary_get_value(v4, "LocationID");

  if (!v5 && a2)
  {
    uint64_t v6 = [v3 properties];
    id v5 = xpc_dictionary_get_value(v6, "LocationID");
  }
  if (!v5 || (uint64_t value = xpc_uint64_get_value(v5)) == 0) {
    uint64_t value = 0;
  }

  return value;
}

void sub_100024FA4(uint64_t a1)
{
  long long v2 = sub_10001AB48();
  CFTypeRef cf = 0;
  SecKeyRef privateKeyRef = 0;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(reply, "result", "ERROR");
  if (!v2)
  {
    uint64_t v6 = sub_100018430(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C848();
    }
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = sec_identity_copy_ref(v2);
  if (SecIdentityCopyPrivateKey(v5, &privateKeyRef))
  {
    uint64_t v6 = sub_100018430(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003CA50();
    }
LABEL_11:
    CFDictionaryRef v7 = 0;
LABEL_12:
    id v8 = 0;
LABEL_13:
    free(v6);
    CFDataRef v9 = 0;
    int v10 = v5;
    goto LABEL_14;
  }
  if (SecIdentityCopyCertificate(v5, (SecCertificateRef *)&cf))
  {
    uint64_t v6 = sub_100018430(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C9E8();
    }
    goto LABEL_11;
  }
  CFDictionaryRef v11 = SecKeyCopyAttributes(privateKeyRef);
  CFDictionaryRef v7 = v11;
  if (!v11)
  {
    uint64_t v6 = sub_100018430(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C8B0();
    }
    goto LABEL_11;
  }
  uint64_t v12 = [(__CFDictionary *)v11 objectForKeyedSubscript:kSecAttrTokenOID];
  if (!v12)
  {
    uint64_t v6 = sub_100018430(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C918();
    }
    goto LABEL_12;
  }
  id v8 = v12;
  xpc_dictionary_set_data(empty, "identity_key", [v8 bytes], (size_t)[v8 length]);
  CFDataRef v13 = SecCertificateCopyData((SecCertificateRef)cf);
  if (!v13)
  {
    uint64_t v6 = sub_100018430(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_10005BED0, OS_LOG_TYPE_ERROR)) {
      sub_10003C980();
    }
    goto LABEL_13;
  }
  CFDataRef v9 = v13;
  xpc_dictionary_set_data(empty, "identity_cert", [(__CFData *)v9 bytes], (size_t)[(__CFData *)v9 length]);
  xpc_dictionary_set_value(reply, "identity", empty);
  int v10 = v5;
  xpc_dictionary_set_string(reply, "result", "OK");
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  if (cf) {
    CFRelease(cf);
  }
  if (privateKeyRef) {
    CFRelease(privateKeyRef);
  }
  if (v10) {
    CFRelease(v10);
  }
}

void sub_100025310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf, CFTypeRef a10)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a10) {
    CFRelease(a10);
  }
  if (v10) {
    CFRelease(v10);
  }
  _Unwind_Resume(exception_object);
}

double sub_1000253A0(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_1000253BC(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + 14) = a2;
  return result;
}

id sub_100025684()
{
  if (qword_10005BEF8 != -1) {
    dispatch_once(&qword_10005BEF8, &stru_100055BA0);
  }
  os_log_t v0 = (void *)qword_10005BEF0;

  return v0;
}

uint64_t sub_1000256D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t sub_1000256F0(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100025B68(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 3)
  {
    long long v15 = sub_100025684();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003CE5C((uint64_t)v5, v15);
    }

    nw_error_domain_t error_domain = nw_error_get_error_domain(v5);
    int error_code = nw_error_get_error_code(v5);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel(*(nw_listener_t *)(*(void *)(a1 + 32) + 16));
      dispatch_time_t v18 = dispatch_time(0, 5000000000);
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = *(NSObject **)(v19 + 24);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100025E9C;
      v21[3] = &unk_100055B18;
      v21[4] = v19;
      long long v24 = *(_OWORD *)(a1 + 56);
      uint64_t v25 = *(void *)(a1 + 72);
      id v22 = *(id *)(a1 + 40);
      id v23 = *(id *)(a1 + 48);
      dispatch_after(v18, v20, v21);
    }
  }
  else if (a2 == 2)
  {
    uint64_t v6 = sub_100025684();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      CFDictionaryRef v7 = (void *)nw_listener_copy_local_endpoint();
      *(_DWORD *)long long buf = 138412802;
      uint64_t v27 = (uint64_t)v7;
      __int16 v28 = 1024;
      int v29 = 2;
      __int16 v30 = 2112;
      BOOL v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "listening on %@ (state %u, error %@)", buf, 0x1Cu);
    }
    int port = nw_listener_get_port(*(nw_listener_t *)(*(void *)(a1 + 32) + 16));
    if (port)
    {
      int v9 = port;
      int v10 = sub_100025684();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        LODWORD(v27) = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "listener port: %u", buf, 8u);
      }

      CFDictionaryRef v11 = nw_listener_copy_local_endpoint();
      if (v11)
      {
        uint64_t description = nw_endpoint_get_description();
        if (description)
        {
          uint64_t v13 = description;
          long long v14 = sub_100025684();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "listener local endpoint: %s", buf, 0xCu);
          }
        }
      }
LABEL_22:
    }
  }
  else if (*(_DWORD *)(a1 + 80))
  {
    CFDictionaryRef v11 = sub_100025684();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003CDE4((uint64_t)v5, v11);
    }
    goto LABEL_22;
  }
}

unsigned char *sub_100025E9C(void *a1)
{
  double result = (unsigned char *)a1[4];
  if (!result[32]) {
    return [result listenOnBonjourName:a1[7] type:a1[8] domain:a1[9] configureTLS:a1[5] connectionHandler:a1[6]];
  }
  return result;
}

void sub_100025EC0(id a1, OS_nw_endpoint *a2, BOOL a3)
{
  BOOL v3 = a3;
  id v4 = a2;
  id v5 = sub_100025684();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "removed";
    if (v3) {
      uint64_t v6 = "added";
    }
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2080;
    int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "advertised endpoint %@ %s", (uint8_t *)&v7, 0x16u);
  }
}

void sub_100026064(id a1)
{
  qword_10005BEF0 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "listener");

  _objc_release_x1();
}

void sub_1000263A0(void *a1)
{
  id v2 = a1;
  if (sub_10000EE10())
  {
    os_log_t v3 = os_log_create("com.apple.RemoteServiceDiscovery", "display_device");
    id v4 = (void *)qword_10005BF00;
    qword_10005BF00 = (uint64_t)v3;

    id v5 = qword_10005BF00;
    if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing display backend", buf, 2u);
    }
    objc_storeStrong((id *)&qword_10005BF08, a1);
    uint64_t v6 = objc_opt_new();
    int v7 = (void *)qword_10005BF10;
    qword_10005BF10 = v6;

    id v8 = (id)qword_10005BF10;
    if (!v8) {
      sub_10003CFB8(&v16, buf);
    }

    if (qword_10005BF18) {
      sub_10003D288(&v16, buf);
    }
    qword_10005BF18 = (uint64_t)sub_1000121DC((void *)qword_10005BF08);
    if (!qword_10005BF18) {
      sub_10003D048(&v16, buf);
    }
    if (qword_10005BF20) {
      sub_10003D1F8(&v16, buf);
    }
    qword_10005BF20 = (uint64_t)sub_1000121DC((void *)qword_10005BF08);
    if (!qword_10005BF20) {
      sub_10003D0D8(&v16, buf);
    }
    uint64_t v9 = qword_10005BF18;
    CFMutableDictionaryRef v10 = IOServiceMatching("AppleUSBDeviceNCMData");
    if (!v10) {
      sub_10003D168(&v16, buf);
    }
    CFDictionaryRef v11 = IOServiceMatching("IOEthernetInterface");
    CFDictionaryRef v12 = v11;
    if (!v11)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      *(_OWORD *)long long buf = 0u;
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      int v16 = 134217984;
      uint64_t v17 = 0;
      _os_log_send_and_compose_impl();
      uint64_t v15 = _os_crash_msg();
      sub_100036794(v15);
    }
    CFDictionarySetValue(v11, @"IOParentMatch", v10);
    CFRelease(v10);
    sub_1000122E8(v9, (IOServiceMatchingCallback)sub_100026698, v12);
    uint64_t v13 = qword_10005BF20;
    CFDictionaryRef v14 = IOServiceMatching("AppleDisplayPlatformControl");
    sub_1000122E8(v13, (IOServiceMatchingCallback)sub_1000268BC, v14);
  }
}

void sub_100026670(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100026698(uint64_t a1, io_iterator_t iterator)
{
  if (!a1) {
    sub_10003D318(&v13, buf);
  }
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      uint64_t v6 = qword_10005BF00;
      if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }
      CFStringRef v7 = IOObjectCopyClass(v5);
      CFComparisonResult v8 = CFStringCompare(v7, @"AppleUSBDeviceNCMPrivateEthernetInterface", 0);
      if (v7) {
        CFRelease(v7);
      }
      if (v8 == kCFCompareEqualTo)
      {
        uint64_t v9 = [RSDNCMInterface alloc];
        CFMutableDictionaryRef v10 = [(RSDNCMInterface *)v9 initWithService:v5 notificationPort:a1 queue:qword_10005BF08];
        CFDictionaryRef v11 = v10;
        if (v10)
        {
          [(RSDNCMInterface *)v10 setIs_private:1];
          CFDictionaryRef v12 = v11;
          [(RSDNCMInterface *)v12 setAddressed_callback:&stru_100055BC0];
          [(RSDNCMInterface *)v12 setDetached_callback:&stru_100055BE0];

          if ([(RSDNCMInterface *)v12 activate]) {
            [(id)qword_10005BF10 addObject:v12];
          }
        }
      }
      if (IOObjectRelease(v5)) {
        sub_10003D3A8(&v13, buf);
      }
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_100026878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12)
{
  if (v12) {
    CFRelease(v12);
  }
  sub_1000117A8(&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_1000268BC(IONotificationPort *a1, io_iterator_t iterator)
{
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  uint64_t notification;
  uint8_t buf[88];

  if (!a1) {
    sub_10003D450(&notification, buf);
  }
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_service_t v5 = result;
    do
    {
      LODWORD(notification) = 0;
      uint64_t v6 = IOServiceAddInterestNotification(a1, v5, "IOGeneralInterest", (IOServiceInterestCallback)sub_100027660, 0, (io_object_t *)&notification);
      if (v6)
      {
        CFStringRef v7 = v6;
        CFComparisonResult v8 = qword_10005BF00;
        if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "IOServiceAddInterestNotification: 0x%x", buf, 8u);
        }
      }
      else
      {
        sub_10002767C(v5);
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_service_t v5 = result;
    }
    while (result);
  }
  return result;
}

id sub_1000270E8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if (result != 3)
  {
    os_log_t v3 = *(void **)(a1 + 32);
    return [v3 createPortListener];
  }
  return result;
}

uint64_t sub_100027138(uint64_t a1)
{
  int v11 = -1431655766;
  for (uint64_t result = sub_10001FD44(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_100044D80, &v11);
        !result;
        uint64_t result = sub_10001FD44(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_100044D80, &v11))
  {
    os_log_t v3 = qword_10005BF00;
    if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Got incoming remoted connection", buf, 0xCu);
    }
    xpc_remote_connection_get_failsafe_version_flags();
    io_service_t v5 = (void *)xpc_remote_connection_create_with_connected_fd();
    uint64_t v6 = [*(id *)(a1 + 32) connection];

    if (v6)
    {
      CFStringRef v7 = qword_10005BF00;
      if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Canceling existing connection to replace it", buf, 0xCu);
      }
      uint64_t v9 = *(void *)(a1 + 32);
      if (*(void *)(v9 + 296))
      {
        xpc_remote_connection_cancel();
        uint64_t v9 = *(void *)(a1 + 32);
      }
      objc_storeStrong((id *)(v9 + 296), v5);
      CFMutableDictionaryRef v10 = [*(id *)(a1 + 32) connection];
      xpc_remote_connection_cancel();
    }
    else
    {
      [*(id *)(a1 + 32) connect:v5];
    }
  }
  return result;
}

uint64_t sub_100027334(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100027510(id a1, RSDNCMInterface *a2)
{
  uint64_t v6 = a2;
  id v2 = [(RSDNCMInterface *)v6 device];

  if (v2)
  {
    os_log_t v3 = [(RSDNCMInterface *)v6 device];
    [v3 setSuspended:0];
  }
  else
  {
    uint64_t v4 = [[RSDRemoteDisplayDeviceDevice alloc] initWithInterface:v6];
    [(RSDNCMInterface *)v6 setDevice:v4];

    io_service_t v5 = [(RSDNCMInterface *)v6 device];
    sub_10002D0BC(v5);

    os_log_t v3 = [(RSDNCMInterface *)v6 device];
    [v3 attach];
  }
}

void sub_1000275D8(id a1, RSDNCMInterface *a2)
{
  uint64_t v4 = a2;
  id v2 = [(RSDNCMInterface *)v4 device];

  if (v2)
  {
    os_log_t v3 = [(RSDNCMInterface *)v4 device];
    [v3 disconnect];

    [(RSDNCMInterface *)v4 setDevice:0];
  }
  [(id)qword_10005BF10 removeObject:v4];
}

void sub_100027660(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536870608) {
    sub_10002767C(a2);
  }
}

void sub_10002767C(io_registry_entry_t a1)
{
  int v34 = -1;
  if (!sub_100012060(a1, &v34))
  {
    uint64_t v6 = qword_10005BF00;
    if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_ERROR)) {
      sub_10003D5D0(v6);
    }
    return;
  }
  int v1 = v34;
  if (v34 >= 4) {
    sub_10003D554(&v33, buf);
  }
  switch(v34)
  {
    case 1:
      CFStringRef v7 = qword_10005BF00;
      if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AppleDisplayPlatformControl: Host disconnected", buf, 2u);
      }
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v8 = (id)qword_10005BF10;
      id v9 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            CFDictionaryRef v14 = [v13 device:v25];

            if (v14)
            {
              uint64_t v15 = [v13 device];
              [v15 disconnect];

              [v13 setDevice:0];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v25 objects:v35 count:16];
        }
        while (v10);
      }
      goto LABEL_33;
    case 2:
      int v16 = qword_10005BF00;
      if (os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AppleDisplayPlatformControl: Host sleep", buf, 2u);
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v8 = (id)qword_10005BF10;
      id v17 = [v8 countByEnumeratingWithState:&v29 objects:v36 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v8);
            }
            long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
            long long v22 = [v21 device];

            if (v22)
            {
              id v23 = [v21 device];
              [v23 setSuspended:1];
            }
          }
          id v18 = [v8 countByEnumeratingWithState:&v29 objects:v36 count:16];
        }
        while (v18);
      }
LABEL_33:

      return;
    case 3:
      uint64_t v2 = qword_10005BF00;
      if (!os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_WORD *)long long buf = 0;
      os_log_t v3 = "AppleDisplayPlatformControl: Host active";
      uint64_t v4 = v2;
      uint32_t v5 = 2;
      break;
    default:
      uint64_t v24 = qword_10005BF00;
      if (!os_log_type_enabled((os_log_t)qword_10005BF00, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v1;
      os_log_t v3 = "AppleDisplayPlatformControl: %d";
      uint64_t v4 = v24;
      uint32_t v5 = 8;
      break;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
}

void sub_1000279D8(void *a1)
{
  id v22 = a1;
  os_log_t v2 = os_log_create("com.apple.RemoteServiceDiscovery", "display_host");
  os_log_t v3 = (void *)qword_10005BF28;
  qword_10005BF28 = (uint64_t)v2;

  uint64_t v4 = qword_10005BF28;
  if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing display host backend", buf, 2u);
  }
  objc_storeStrong((id *)&qword_10005BF30, a1);
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = (void *)qword_10005BF38;
  qword_10005BF38 = v5;

  id v7 = (id)qword_10005BF38;
  if (!v7) {
    sub_10003D614(&v25, buf);
  }

  uint64_t v8 = objc_opt_new();
  id v9 = (void *)qword_10005BF40;
  qword_10005BF40 = v8;

  id v10 = (id)qword_10005BF40;
  if (!v10) {
    sub_10003D6A0(&v25, buf);
  }

  if (qword_10005BF48) {
    sub_10003D7B8(&v25, buf);
  }
  uint64_t v11 = sub_1000121DC((void *)qword_10005BF30);
  qword_10005BF48 = (uint64_t)v11;
  if (!v11) {
    sub_10003D72C(&v25, buf);
  }
  CFDictionaryRef v12 = IOServiceMatching("AppleUSBNCMData");
  if (!v12)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    *(_OWORD *)long long buf = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v25 = 134217984;
    uint64_t v26 = 0;
    _os_log_send_and_compose_impl();
    uint64_t v19 = _os_crash_msg();
    sub_100036794(v19);
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryRef v14 = Mutable;
  if (!Mutable)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    *(_OWORD *)long long buf = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v25 = 134217984;
    uint64_t v26 = 0;
    _os_log_send_and_compose_impl();
    uint64_t v20 = _os_crash_msg();
    sub_100036794(v20);
  }
  CFDictionarySetValue(Mutable, @"IOModel", @"USB");
  int valuePtr = 1452;
  CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v14, @"idVendor", v15);
  int v23 = 4372;
  CFNumberRef v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v23);
  CFDictionarySetValue(v14, @"idProduct", v16);
  CFDictionarySetValue(v12, @"IOPropertyMatch", v14);
  id v17 = IOServiceMatching("IOEthernetInterface");
  CFDictionaryRef v18 = v17;
  if (!v17)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    *(_OWORD *)long long buf = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v25 = 134217984;
    uint64_t v26 = 0;
    _os_log_send_and_compose_impl();
    uint64_t v21 = _os_crash_msg();
    sub_100036794(v21);
  }
  CFDictionarySetValue(v17, @"IOParentMatch", v12);
  if (v16) {
    CFRelease(v16);
  }
  if (v15) {
    CFRelease(v15);
  }
  CFRelease(v14);
  CFRelease(v12);
  sub_1000122E8((uint64_t)v11, (IOServiceMatchingCallback)sub_100027F9C, v18);
}

void sub_100027F14(_Unwind_Exception *a1)
{
  CFRelease(v2);
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100027F9C(uint64_t a1, io_iterator_t iterator)
{
  if (!a1) {
    sub_10003D844(v18, buf);
  }
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      uint64_t v6 = qword_10005BF28;
      if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NCM device attached", buf, 2u);
      }
      id v7 = qword_10005BF28;
      if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }
      *(_DWORD *)long long buf = 0;
      int v8 = -5;
      while ((sub_100011EE4(v5, buf) & 1) == 0)
      {
        usleep(0x186A0u);
        if (__CFADD__(v8++, 1))
        {
          id v10 = qword_10005BF28;
          if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)CFDictionaryRef v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to extract nwifflags, fallback to false", v18, 2u);
          }
          goto LABEL_19;
        }
      }
      if ((*(_DWORD *)buf & 0x20000000) != 0)
      {
        uint64_t v11 = [RSDNCMInterface alloc];
        CFDictionaryRef v12 = [(RSDNCMInterface *)v11 initWithService:v5 notificationPort:a1 queue:qword_10005BF30];
        uint64_t v13 = v12;
        if (v12)
        {
          [(RSDNCMInterface *)v12 setIs_private:1];
          CFDictionaryRef v14 = v13;
          [(RSDNCMInterface *)v14 setInactive_callback:&stru_100055C00];
          [(RSDNCMInterface *)v14 setAddressed_callback:&stru_100055C20];
          [(RSDNCMInterface *)v14 setDetached_callback:&stru_100055C40];

          if ([(RSDNCMInterface *)v14 activate])
          {
            CFNumberRef v15 = [[RSDRemoteDisplayHostDevice alloc] initWithInterface:v14];
            [(RSDNCMInterface *)v14 setDevice:v15];
            *(_DWORD *)long long buf = -1431655766;
            CFNumberRef v16 = v15;
            id v17 = [(RSDRemoteNCMDevice *)v16 interface];
            sub_100011E3C((io_registry_entry_t)[v17 service], buf);

            [(RSDRemoteDevice *)v16 setBackendProperty:"LocationID" withUint:*(unsigned int *)buf];
            [(RSDRemoteDevice *)v16 attach];
            [(id)qword_10005BF38 addObject:v14];
          }
        }
      }
LABEL_19:
      if (IOObjectRelease(v5)) {
        sub_10003D8D0(v18, buf);
      }
      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_100028278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
}

id sub_1000289B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) triggerNeedsConnect];
}

void sub_1000289C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = qword_10005BF28;
    if (os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_ERROR)) {
      sub_10003728C(a1, a3, v5);
    }
    [*(id *)(a1 + 32) connect:0];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) connection];

    id v7 = qword_10005BF28;
    BOOL v8 = os_log_type_enabled((os_log_t)qword_10005BF28, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v12, 0xCu);
      }
      close(*(_DWORD *)(*(void *)(a1 + 32) + 296));
    }
    else
    {
      if (v8)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v12 = 138543362;
        uint64_t v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v12, 0xCu);
      }
      xpc_remote_connection_get_failsafe_version_flags();
      uint64_t v11 = (void *)xpc_remote_connection_create_with_connected_fd();
      [*(id *)(a1 + 32) connect:v11];
    }
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 296) = -1;
}

uint64_t sub_100028D9C(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_10003D980(&v2, v3);
    }
  }
  return result;
}

void sub_100028E04(id a1, RSDNCMInterface *a2)
{
  id v2 = [(RSDNCMInterface *)a2 device];
  [v2 setSuspended:1];
}

void sub_100028E4C(id a1, RSDNCMInterface *a2)
{
  id v2 = [(RSDNCMInterface *)a2 device];
  sub_10002D0BC(v2);
  [v2 triggerNeedsConnect];
  [v2 setSuspended:0];
}

void sub_100028EA4(id a1, RSDNCMInterface *a2)
{
  id v2 = a2;
  id v3 = [(RSDNCMInterface *)v2 device];
  [v3 disconnect];
  [(RSDNCMInterface *)v2 setDevice:0];
  [(id)qword_10005BF38 removeObject:v2];
}

uint64_t sub_100028F14()
{
  os_log_t v0 = malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (os_parse_boot_arg_string() && (uint64_t v1 = remote_device_type_parse(), (v1 - 15) <= 1))
  {
    id v2 = sub_100029098();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      id v3 = "enable backend required by boot-args";
      uint64_t v4 = (uint8_t *)&v11;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
    }
  }
  else
  {
    int v5 = sub_1000124CC(0, "manta-c", 0);
    int v6 = sub_1000124CC(0, "manta-b", 0);
    if ((v5 & v6) == 1)
    {
      uint64_t v9 = _os_crash();
      sub_100036794(v9);
    }
    int v7 = v5 | v6;
    if (v5) {
      uint64_t v1 = 16;
    }
    else {
      uint64_t v1 = 15;
    }
    if (v7 != 1)
    {
      uint64_t v1 = 0;
      goto LABEL_15;
    }
    id v2 = sub_100029098();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      id v3 = "enable backend required by device tree";
      uint64_t v4 = (uint8_t *)&v10;
      goto LABEL_12;
    }
  }

LABEL_15:
  free(v0);
  return v1;
}

void sub_100029080(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

id sub_100029098()
{
  if (qword_10005BF70 != -1) {
    dispatch_once(&qword_10005BF70, &stru_100055D48);
  }
  os_log_t v0 = (void *)qword_10005BF68;

  return v0;
}

void sub_1000290EC(uint64_t a1)
{
  uint64_t v1 = (void *)qword_10005C010;
  id v2 = +[NSString stringWithUTF8String:sub_100018FBC(a1)];
  [v1 setValue:v2 forKey:@"compute-platform-tls-requirement"];
}

void sub_10002927C(id obj)
{
  objc_storeStrong((id *)&qword_10005BF50, obj);
  id v4 = obj;
  uint64_t v2 = xpc_event_publisher_create();
  id v3 = (void *)qword_10005BF58;
  qword_10005BF58 = v2;

  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();
  xpc_event_publisher_activate();
}

void sub_100029320(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  int v5 = a4;
  if (byte_10005BF60 == 1)
  {
    int v6 = sub_100029098();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "skip xpc event after initialization", buf, 2u);
    }

    goto LABEL_43;
  }
  if (a2 == 2)
  {
    int v12 = sub_100029098();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Finalized the initial set of compute platform xpc event", buf, 2u);
    }

    byte_10005BF60 = 1;
    sub_10001846C((void *)qword_10005BF50);
  }
  else
  {
    if (a2 == 1)
    {
      uint64_t v13 = sub_100029098();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (!v14) {
        goto LABEL_43;
      }
      CFNumberRef v15 = (void *)xpc_copy_debug_description();
      CFNumberRef v16 = sub_100029098();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136446210;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "xpc event REMOVE: %{public}s", buf, 0xCu);
      }

LABEL_42:
      free(v15);
      goto LABEL_43;
    }
    if (a2) {
      goto LABEL_43;
    }
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v37 = v7;
    long long v38 = v7;
    long long v35 = v7;
    long long v36 = v7;
    long long v33 = v7;
    long long v34 = v7;
    *(_OWORD *)long long buf = v7;
    long long v32 = v7;
    if (xpc_get_event_name())
    {
      if (*(_DWORD *)buf == 2003792482 && *(_DWORD *)&buf[3] == 6648695)
      {
        CFDictionaryRef v18 = xpc_dictionary_get_array(v5, "interfaces");
        uint64_t v19 = v18;
        if (v18) {
          xpc_array_apply(v18, &stru_100055CA0);
        }
      }
      else if (*(void *)buf == 0x746E696F70646E65 && *(unsigned __int16 *)&buf[8] == 115)
      {
        xpc_dictionary_apply(v5, &stru_100055CE0);
      }
      else if (*(_DWORD *)buf == 1953720684 && *(_DWORD *)&buf[3] == 7234932)
      {
        string = xpc_dictionary_get_string(v5, "interface");
        if (string)
        {
          uint64_t v24 = sub_100029098();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v27 = 136446210;
            long long v28 = (uint8_t *)string;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "start listening on %{public}s from xpc_event", (uint8_t *)&v27, 0xCu);
          }

          int v25 = sub_100017570((uint64_t)string);
          if (v25 && v25 != 17)
          {
            uint64_t v26 = sub_100029098();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
              sub_10003DA1C((uint64_t)string, v26);
            }
          }
        }
      }
      else
      {
        __int16 v11 = sub_100029098();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10003DA94((uint64_t)buf, v11);
        }
      }
      uint64_t v20 = sub_100029098();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

      if (v21)
      {
        CFNumberRef v15 = (void *)xpc_copy_debug_description();
        id v22 = sub_100029098();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          int v27 = 136446466;
          long long v28 = buf;
          __int16 v29 = 2082;
          long long v30 = v15;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "xpc event ADD: %{public}s: %{public}s", (uint8_t *)&v27, 0x16u);
        }

        goto LABEL_42;
      }
    }
    else
    {
      id v17 = sub_100029098();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10003DB0C(v17);
      }
    }
  }
LABEL_43:
}

BOOL sub_100029748(id a1, unint64_t a2, OS_xpc_object *a3)
{
  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    uint64_t v4 = (uint64_t)string_ptr;
    int v5 = sub_100029098();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 136446210;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "start browsing on %{public}s from xpc event", (uint8_t *)&v10, 0xCu);
    }

    int v6 = sub_10001559C(v4);
    if (v6)
    {
      int v7 = v6;
      if (v6 != 17)
      {
        BOOL v8 = sub_100029098();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
          sub_10003DB50(v4, v7, v8);
        }
      }
    }
  }
  return 1;
}

BOOL sub_10002984C(id a1, const char *a2, OS_xpc_object *a3)
{
  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    int v5 = string_ptr;
    v15[0] = 0;
    v15[1] = 0;
    int v6 = sub_100029098();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136446466;
      id v17 = v5;
      __int16 v18 = 2082;
      uint64_t v19 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "adding node %{public}s%%%{public}s from xpc event", buf, 0x16u);
    }

    int v7 = inet_pton(30, v5, v15);
    int v8 = v7;
    if (v7 == -1)
    {
      int v10 = *__error();
      uint64_t v11 = sub_100029098();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10003DC94(v10, v11);
      }

      goto LABEL_12;
    }
    if (v7 != 1)
    {
      if (!v7)
      {
        uint64_t v9 = sub_100029098();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10003DC50(v9);
        }
LABEL_14:

        return 1;
      }
LABEL_12:
      uint64_t v9 = sub_100029098();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_10003DBD8(v8, v9);
      }
      goto LABEL_14;
    }
    int v13 = sub_1000151C4((uint64_t)a2, v15);
    if (v13)
    {
      int v14 = v13;
      if (v13 != 17)
      {
        uint64_t v9 = sub_100029098();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136446722;
          id v17 = v5;
          __int16 v18 = 2082;
          uint64_t v19 = a2;
          __int16 v20 = 1024;
          int v21 = v14;
          _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "failed to add device %{public}s%%%{public}s in publisher: %{darwin.errno}d", buf, 0x1Cu);
        }
        goto LABEL_14;
      }
    }
  }
  return 1;
}

void sub_100029A4C(id a1, int a2)
{
}

id sub_100029AF0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_10001AB48();
  if (v3)
  {
    id v6 = v2;
    configure_tls_long long block = (void *)xpc_remote_connection_create_configure_tls_block();
  }
  else
  {
    configure_tls_long long block = objc_retainBlock(_nw_parameters_configure_protocol_disable);
  }

  return configure_tls_block;
}

void sub_100029BD8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int v5 = *(_DWORD *)(a1 + 40);
  id v6 = *(void **)(a1 + 32);
  int v8 = a4;
  uint64_t v7 = sub_10001B0DC(v5, v6, a3);
  v8[2](v8, v7);
}

void sub_100029C50(id a1)
{
  qword_10005BF68 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "compute");

  _objc_release_x1();
}

unsigned int *sub_10002A07C(unsigned int *result)
{
  if (!*result) {
    sub_10003DEBC(&v1, v2);
  }
  *uint64_t result = bswap32(bswap32(*result) - 1);
  return result;
}

id sub_10002A5A8()
{
  if (qword_10005BFB8 != -1) {
    dispatch_once(&qword_10005BFB8, &stru_100055D68);
  }
  os_log_t v0 = (void *)qword_10005BFB0;

  return v0;
}

NSObject *sub_10002A5FC(int a1)
{
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
  if (byte_10005BF80) {
    goto LABEL_5;
  }
  if (!a1) {
    sub_10003E034(&v8, v9);
  }
  id v3 = nw_interface_create_with_index();
  if (v3)
  {
    uint64_t v4 = v3;
    nw_parameters_require_interface(secure_tcp, v3);
    nw_parameters_set_local_only(secure_tcp, 1);
    nw_parameters_set_required_address_family();
    nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_wired);

LABEL_5:
    nw_parameters_set_no_fallback();
    nw_parameters_set_indefinite();
    xpc_remote_connection_setup_nw_parameters();
    int v5 = secure_tcp;
    goto LABEL_6;
  }
  uint64_t v7 = sub_10002A5A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10003E0A0();
  }

  int v5 = 0;
LABEL_6:

  return v5;
}

void sub_10002A948(void *a1)
{
  id v2 = a1;
  id v3 = sub_10002A5A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "initializing bonjour peer device", (uint8_t *)&buf, 2u);
  }

  objc_storeStrong((id *)&qword_10005BF90, a1);
  uint64_t v4 = objc_opt_new();
  int v5 = (void *)qword_10005BF88;
  qword_10005BF88 = v4;

  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)qword_10005BF78;
  qword_10005BF78 = v6;

  CFStringRef v8 = [(id)qword_10005C010 valueForKey:@"bonjour-interface-name"];
  if (v8)
  {
    CFStringRef v9 = v8;
    int v10 = sub_10000C0E4(v8);
    CFRelease(v9);
    if (v10)
    {
      sub_10002AD5C(v10, 5);
      goto LABEL_23;
    }
  }
  CFDictionaryRef v11 = IOServiceMatching("IOService");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
  if (!MatchingService) {
    sub_10003E158(v33, &buf);
  }
  io_object_t v13 = MatchingService;
  CFTypeRef v14 = IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", @"remotexpc-bonjour-enabled", kCFAllocatorDefault, 1u);
  IOObjectRelease(v13);
  if (v14)
  {
    CFTypeID v15 = CFGetTypeID(v14);
    if (v15 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength((CFDataRef)v14);
      if (Length == 4)
      {
        int v17 = *(_DWORD *)CFDataGetBytePtr((CFDataRef)v14);
        CFRelease(v14);
        if (v17)
        {
          __int16 v18 = malloc_type_malloc(0x10uLL, 0xD13E0E7AuLL);
          if (!v18) {
            sub_10003E1C4(v33, &buf);
          }
          uint64_t v19 = v18;
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x2020000000;
          int v37 = 5;
          v34[0] = 0;
          v34[1] = v34;
          v34[2] = 0x2020000000;
          char v35 = 0;
          __int16 v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10005BF90);
          dispatch_source_set_timer(v20, 0, 0x3B9ACA00uLL, 0);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          void v33[2] = sub_10002B88C;
          v33[3] = &unk_100055D90;
          v33[4] = v34;
          v33[5] = v19;
          dispatch_source_set_mandatory_cancel_handler();
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          uint64_t v39 = sub_10002B910;
          unsigned int v40 = &unk_100055DB8;
          long long v43 = v36;
          long long v44 = v19;
          __int16 v41 = v20;
          xpc_object_t v42 = v34;
          int v21 = v20;
          dispatch_source_set_event_handler(v21, &buf);
          dispatch_activate(v21);

          _Block_object_dispose(v34, 8);
          _Block_object_dispose(v36, 8);
        }
        goto LABEL_23;
      }
      uint64_t v31 = Length;
      long long v32 = sub_10002A5A8();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_10003E230(v31, v32);
      }
    }
    else
    {
      int v23 = sub_10002A5A8();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10003E2BC(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    CFRelease(v14);
    goto LABEL_23;
  }
  id v22 = sub_10002A5A8();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "remotexpc-bonjour-enabled";
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "cannot find %{public}s property", (uint8_t *)&buf, 0xCu);
  }

LABEL_23:
}

void sub_10002AD5C(char *a1, int a2)
{
  char v4 = sub_10002AE48(a1, byte_10005BF80);
  if (!a2 || (v4 & 1) != 0)
  {
    if ((v4 & 1) == 0)
    {
      uint64_t v6 = sub_10002A5A8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10003E334();
      }
    }
    free(a1);
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_10002BA98;
    void v7[3] = &unk_100055DD8;
    v7[4] = a1;
    int v8 = a2;
    dispatch_after(v5, (dispatch_queue_t)qword_10005BF90, v7);
  }
}

uint64_t sub_10002AE48(const char *a1, char a2)
{
  char v4 = sub_10002A5A8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "enabling bonjour", buf, 2u);
  }

  if (!qword_10005BF90)
  {
    dispatch_time_t v5 = sub_10002A5A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003E39C();
    }
    goto LABEL_9;
  }
  if (qword_10005BF98)
  {
    dispatch_time_t v5 = sub_10002A5A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003ADA4();
    }
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  if (!a1)
  {
    dispatch_time_t v5 = sub_10002A5A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003ABA0();
    }
    goto LABEL_9;
  }
  uint64_t v8 = if_nametoindex(a1);
  CFStringRef v9 = sub_10002A5A8();
  dispatch_time_t v5 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003E3D0();
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    CFNumberRef v16 = a1;
    __int16 v17 = 1024;
    int v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "enabling bonjour for interface name:%s index:%d", buf, 0x12u);
  }

  byte_10005BF80 = a2;
  sub_10002B100(v8);
  sub_10002B240(v8);
  int v10 = objc_alloc_init(RSDNCMInterface);
  CFDictionaryRef v11 = (void *)qword_10005BF98;
  qword_10005BF98 = (uint64_t)v10;

  [(id)qword_10005BF98 setIndex:v8];
  [(id)qword_10005BF98 setName:strdup(a1)];
  if ((a2 & 1) == 0)
  {
    CFStringRef v12 = CFStringCreateWithCString(0, a1, 0x8000100u);
    if (!v12) {
      sub_10003E438(&v14, buf);
    }
    CFStringRef v13 = v12;
    [(id)qword_10005C010 setValue:v12 forKey:@"bonjour-interface-name"];
    [(id)qword_10005C010 synchronize];
    CFRelease(v13);
  }
  dispatch_time_t v5 = sub_10002A5A8();
  uint64_t v6 = 1;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "bonjour enabled", buf, 2u);
  }
LABEL_10:

  return v6;
}

void sub_10002B100(int a1)
{
  uint64_t v1 = sub_10002A5FC(a1);
  if (v1)
  {
    bonjour_service = nw_browse_descriptor_create_bonjour_service("_remoted_bp._tcp", "local.");
    if ((id)qword_10005BFA0) {
      sub_10003E510(&v6, v7);
    }
    nw_browser_t v3 = nw_browser_create(bonjour_service, v1);
    char v4 = (void *)qword_10005BFA0;
    qword_10005BFA0 = (uint64_t)v3;

    id v5 = (id)qword_10005BFA0;
    if (!v5) {
      sub_10003E4A4(&v6, v7);
    }

    nw_browser_set_browse_results_changed_handler((nw_browser_t)qword_10005BFA0, &stru_100055E18);
    nw_browser_set_state_changed_handler((nw_browser_t)qword_10005BFA0, &stru_100055E80);
    nw_browser_set_queue((nw_browser_t)qword_10005BFA0, (dispatch_queue_t)qword_10005BF90);
    nw_browser_start((nw_browser_t)qword_10005BFA0);
  }
  else
  {
    bonjour_service = sub_10002A5A8();
    if (os_log_type_enabled(bonjour_service, OS_LOG_TYPE_FAULT)) {
      sub_10003E000();
    }
  }
}

void sub_10002B240(int a1)
{
  id v2 = sub_10002A5A8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "init bonjour listener start", buf, 2u);
  }

  nw_browser_t v3 = sub_10002A5FC(a1);
  if (v3)
  {
    if ((id)qword_10005BFA8) {
      sub_10003E7B4(out, buf);
    }
    nw_listener_t v4 = nw_listener_create(v3);
    id v5 = (void *)qword_10005BFA8;
    qword_10005BFA8 = (uint64_t)v4;

    id v6 = (id)qword_10005BFA8;
    if (!v6) {
      sub_10003E598(out, buf);
    }

    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v7;
    *(_OWORD *)&out[16] = v7;
    if (uuid_is_null((const unsigned __int8 *)&xmmword_10005C020)) {
      sub_10003E748(dst, buf);
    }
    uint64_t v8 = sub_10002A5A8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100038F08();
    }

    uuid = xpc_dictionary_get_uuid((xpc_object_t)qword_10005C030, "BootSessionUUID");
    if (!uuid) {
      sub_10003E604(dst, buf);
    }
    memset(dst, 170, sizeof(dst));
    uuid_copy(dst, uuid);
    if (uuid_is_null(dst)) {
      sub_10003E6DC(&v14, buf);
    }
    int v10 = sub_10002A5A8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100038E30();
    }

    xmmword_10005C020 = (__int128)veorq_s8((int8x16_t)xmmword_10005C020, *(int8x16_t *)dst);
    CFDictionaryRef v11 = sub_10002A5A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100038DB8();
    }

    uuid_unparse((const unsigned __int8 *)&xmmword_10005C020, out);
    if (strlen(out) - 1 >= 0x3F) {
      sub_10003E670(dst, buf);
    }
    bonjour_service = nw_advertise_descriptor_create_bonjour_service(out, "_remoted_bp._tcp", "local.");
    nw_advertise_descriptor_set_no_auto_rename(bonjour_service, 1);
    nw_listener_set_advertise_descriptor((nw_listener_t)qword_10005BFA8, bonjour_service);
    nw_listener_set_new_connection_handler((nw_listener_t)qword_10005BFA8, &stru_100055EE0);
    nw_listener_set_state_changed_handler((nw_listener_t)qword_10005BFA8, &stru_100055F00);
    nw_listener_set_advertised_endpoint_changed_handler((nw_listener_t)qword_10005BFA8, &stru_100055F40);
    nw_listener_set_queue((nw_listener_t)qword_10005BFA8, (dispatch_queue_t)qword_10005BF90);
    nw_listener_start((nw_listener_t)qword_10005BFA8);
    CFStringRef v13 = sub_10002A5A8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "init bonjour listener done", buf, 2u);
    }
  }
  else
  {
    bonjour_service = sub_10002A5A8();
    if (os_log_type_enabled(bonjour_service, OS_LOG_TYPE_FAULT)) {
      sub_10003E000();
    }
  }
}

void sub_10002B574()
{
  os_log_t v0 = sub_10002A5A8();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "disabling bonjour", buf, 2u);
  }

  if ([(id)qword_10005BF98 name])
  {
    [(id)qword_10005C010 setValue:0 forKey:@"bonjour-interface-name"];
    [(id)qword_10005C010 synchronize];
    byte_10005BF80 = 0;
    if (qword_10005BFA0)
    {
      uint64_t v1 = sub_10002A5A8();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
        sub_10003E90C();
      }

      nw_browser_cancel((nw_browser_t)qword_10005BFA0);
      id v2 = (void *)qword_10005BFA0;
      qword_10005BFA0 = 0;
    }
    if (qword_10005BFA8)
    {
      nw_browser_t v3 = sub_10002A5A8();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        sub_10003E8D8();
      }

      nw_listener_cancel((nw_listener_t)qword_10005BFA8);
      nw_listener_t v4 = (void *)qword_10005BFA8;
      qword_10005BFA8 = 0;
    }
    id v5 = sub_10002A5A8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10003E8A4();
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [[(id)qword_10005BF78 copy];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        int v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) disconnect];
          int v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }

    CFDictionaryRef v11 = sub_10002A5A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10003E870();
    }

    [(id)qword_10005BF88 removeAllObjects];
    CFStringRef v12 = (void *)qword_10005BF98;
    qword_10005BF98 = 0;

    CFStringRef v13 = sub_10002A5A8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "bonjour disabled", buf, 2u);
    }
  }
  else
  {
    CFStringRef v13 = sub_10002A5A8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003E83C();
    }
  }
}

void sub_10002B848(id a1)
{
  qword_10005BFB0 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "BonjourPeer");

  _objc_release_x1();
}

void sub_10002B88C(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v2 = *(char **)(a1 + 40);
    sub_10002AD5C(v2, 5);
  }
  else
  {
    nw_browser_t v3 = sub_10002A5A8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003E940();
    }

    free(*(void **)(a1 + 40));
  }
}

void sub_10002B910(uint64_t a1)
{
  CFMutableDictionaryRef v2 = IOServiceMatching("AppleUSBDeviceNCMData");
  if (!v2) {
    sub_10003E974(&v12, v13);
  }
  CFMutableDictionaryRef v3 = v2;
  nw_listener_t v4 = IOServiceMatching("IOEthernetInterface");
  if (!v4) {
    sub_10003E9E0(&v12, v13);
  }
  CFDictionaryRef v5 = v4;
  CFDictionarySetValue(v4, @"IOParentMatch", v3);
  CFRelease(v3);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_100011C78(MatchingService, *(char **)(a1 + 56));
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v8 = sub_10002A5A8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10003EA80();
      }
    }
    IOObjectRelease(v7);
  }
  else
  {
    uint64_t v9 = sub_10002A5A8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003EA4C();
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || (uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8),
        int v11 = *(_DWORD *)(v10 + 24) - 1,
        (*(_DWORD *)(v10 + 24) = v11) == 0))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  }
}

uint64_t sub_10002BA98(uint64_t a1)
{
  return sub_10002AD5C(*(void *)(a1 + 32), (*(_DWORD *)(a1 + 40) - 1));
}

void sub_10002BAAC(id a1, OS_nw_browse_result *a2, OS_nw_browse_result *a3, BOOL a4)
{
  CFDictionaryRef v5 = a2;
  id v6 = a3;
  char changes = nw_browse_result_get_changes((nw_browse_result_t)v5, (nw_browse_result_t)v6);
  id v8 = sub_10002A5A8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)char v35 = v5;
    *(_WORD *)&v35[8] = 2112;
    *(void *)&v35[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "browse_results_changed: %@ -> %@", buf, 0x16u);
  }

  if ((changes & 2) != 0) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v5;
  }
  if ((changes & 6) != 0)
  {
    uint64_t v10 = v9;
    if (!v10) {
      sub_10003EAB4(uu, buf);
    }
    int v11 = v10;

    uint64_t v12 = nw_browse_result_copy_endpoint(v11);
    if (!v12) {
      sub_100038230(uu, buf);
    }
    CFStringRef v13 = v12;

    uint64_t v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    uint64_t v29 = sub_10002BFA8;
    uint64_t v30 = &unk_100055E40;
    long long v14 = v13;
    uint64_t v31 = v14;
    nw_browse_result_enumerate_interfaces(v11, &v27);
    long long v15 = (void *)nw_endpoint_copy_interface();
    if (!v15) {
      sub_10003EB20(uu, buf);
    }

    memset(uu, 170, sizeof(uu));
    long long v16 = v14;
    bonjour_service_uint64_t name = nw_endpoint_get_bonjour_service_name(v16);
    if (!bonjour_service_name) {
      sub_10003EB8C(&v32, buf);
    }
    uuid_parse(bonjour_service_name, uu);

    int v18 = sub_10002A5A8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 68157954;
      *(_DWORD *)char v35 = 16;
      *(_WORD *)&void v35[4] = 2096;
      *(void *)&v35[6] = &xmmword_10005C020;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "browser local_device_uuid: %{uuid_t}.16P", buf, 0x12u);
    }

    if (uuid_is_null((const unsigned __int8 *)&xmmword_10005C020)) {
      sub_10003ECCC(&v32, buf);
    }
    if (uuid_is_null(uu)) {
      sub_10003EC60(&v32, buf);
    }
    if (!uuid_compare((const unsigned __int8 *)&xmmword_10005C020, uu))
    {
      if (!byte_10005BF80)
      {
        int v21 = sub_10002A5A8();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "ignoring bonjour event for own uuid", buf, 2u);
        }
        goto LABEL_44;
      }
      sub_10002A07C((unsigned int *)uu);
      uint64_t v19 = sub_10002A5A8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "munging uuid and not ignoring bonjour event for own uuid due to loopback test mode", buf, 2u);
      }
    }
    id v20 = objc_alloc((Class)NSUUID);
    int v21 = [v20 initWithUUIDBytes:uu, v27, v28, v29, v30];
    if ((changes & 2) != 0)
    {
      if ([(id)qword_10005BF88 containsObject:v21])
      {
        int v23 = sub_10002A5A8();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_10003EC2C();
        }
      }
      else
      {
        [(id)qword_10005BF88 addObject:v21];
      }
      id v22 = sub_10002BFC8(uu);
      if (v22)
      {
        sub_10002A5A8();
        uint64_t v24 = (RSDRemoteBonjourPeerDevice *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v24->super.super, OS_LOG_TYPE_DEBUG)) {
          sub_10003EBF8();
        }
      }
      else
      {
        int v25 = uuid_compare((const unsigned __int8 *)&xmmword_10005C020, uu);
        sub_10002A5A8();
        uint64_t v24 = (RSDRemoteBonjourPeerDevice *)objc_claimAutoreleasedReturnValue();
        BOOL v26 = os_log_type_enabled(&v24->super.super, OS_LOG_TYPE_DEFAULT);
        if (v25 < 1)
        {
          if (v26)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, &v24->super.super, OS_LOG_TYPE_DEFAULT, "uuid policy: other side will connect", buf, 2u);
          }
        }
        else
        {
          if (v26)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, &v24->super.super, OS_LOG_TYPE_DEFAULT, "uuid policy: create new device and connect", buf, 2u);
          }

          uint64_t v24 = [[RSDRemoteBonjourPeerDevice alloc] initWithBrowsedEndpointUUID:v16 uuid:uu];
          [(RSDRemoteBonjourPeerDevice *)v24 attach];
        }
      }
    }
    else
    {
      if ((changes & 4) == 0)
      {
LABEL_44:

        goto LABEL_45;
      }
      id v22 = sub_10002BFC8(uu);
      [(id)qword_10005BF88 removeObject:v21];
      if (v22)
      {
        if ([v22 state] == 3) {
          [v22 heartbeatWithCallback:&stru_100055E60];
        }
        else {
          [v22 disconnect];
        }
      }
    }

    goto LABEL_44;
  }
LABEL_45:
}

uint64_t sub_10002BFA8()
{
  return 0;
}

id sub_10002BFC8(const unsigned __int8 *a1)
{
  CFMutableDictionaryRef v2 = sub_10002A5A8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 68157954;
    int v21 = 16;
    __int16 v22 = 2096;
    int v23 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checking for existing device %{uuid_t}.16P", buf, 0x12u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = (id)qword_10005BF78;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v11 = sub_10002A5A8();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = (const unsigned __int8 *)[v10 remoteUUID];
          *(_DWORD *)long long buf = 68157954;
          int v21 = 16;
          __int16 v22 = 2096;
          int v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "comparing against device uuid %{uuid_t}.16P", buf, 0x12u);
        }

        if (!uuid_compare((const unsigned __int8 *)[v10 remoteUUID], a1))
        {
          id v13 = v10;

          ++v7;
          id v6 = v13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);

    if (v6 && v7 >= 2) {
      sub_100038A48();
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

void sub_10002C1FC(id a1, BOOL a2)
{
  id v3 = sub_10002A5A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100038A64(a2, v3);
  }
}

void sub_10002C248(id a1, int a2, OS_nw_error *a3)
{
  id v4 = a3;
  switch(a2)
  {
    case 4:
      id v5 = sub_10002A5A8();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        long long v16 = v4;
        id v6 = "nw_browser_state_waiting: %@";
        int v7 = v5;
        uint32_t v8 = 12;
        goto LABEL_8;
      }
LABEL_20:

      break;
    case 2:
      uint64_t v9 = sub_10002A5A8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003EE18();
      }

      nw_error_domain_t error_domain = nw_error_get_error_domain((nw_error_t)v4);
      int error_code = nw_error_get_error_code((nw_error_t)v4);
      if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
      {
        nw_browser_cancel((nw_browser_t)qword_10005BFA0);
        uint64_t v12 = (void *)qword_10005BFA0;
        qword_10005BFA0 = 0;

        dispatch_time_t v13 = dispatch_time(0, 5000000000);
        dispatch_after(v13, (dispatch_queue_t)qword_10005BF90, &stru_100055EA0);
      }
      break;
    case 1:
      id v5 = sub_10002A5A8();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        id v6 = "browsing for other bonjour remoted instances";
        int v7 = v5;
        uint32_t v8 = 2;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v15, v8);
        goto LABEL_20;
      }
      goto LABEL_20;
    default:
      long long v14 = sub_10002A5A8();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003EDA0(a2, v14);
      }

      if (v4)
      {
        id v5 = sub_10002A5A8();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_10003ED38();
        }
        goto LABEL_20;
      }
      break;
  }
}

void sub_10002C460(id a1)
{
  if (qword_10005BF98) {
    BOOL v1 = qword_10005BFA0 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    int v2 = [(id)qword_10005BF98 index];
    sub_10002B100(v2);
  }
}

void sub_10002C4AC(id a1, OS_nw_connection *a2)
{
  int v2 = a2;
  id v3 = sub_10002A5A8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v53 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> got incoming remoted connection", buf, 0xCu);
  }

  id v4 = nw_connection_copy_current_path((nw_connection_t)v2);
  id v5 = nw_path_copy_effective_remote_endpoint(v4);
  id v6 = sub_10002A5A8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t description = nw_endpoint_get_description();
    *(_DWORD *)long long buf = 138543618;
    uint64_t v53 = v2;
    __int16 v54 = 2080;
    uint64_t v55 = description;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> remote endpoint: %s", buf, 0x16u);
  }

  if (nw_endpoint_get_type(v5) != nw_endpoint_type_address) {
    sub_10003EFE8(&v48, buf);
  }
  nw_endpoint_get_address(v5);
  address_with_int port = (void *)nw_endpoint_create_address_with_port();
  uint64_t v9 = sub_10002A5A8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10003EF48((uint64_t)v2, (uint64_t)address_with_port, v9);
  }

  uint64_t v10 = address_with_port;
  int v11 = sub_10002A5A8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = nw_endpoint_get_description();
    *(_DWORD *)CFStringRef v56 = 136315138;
    uint64_t v57 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "checking for existing device endpoint %s", v56, 0xCu);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v13 = (id)qword_10005BF78;
  id v14 = [v13 countByEnumeratingWithState:&v48 objects:buf count:16];
  if (v14)
  {
    id v15 = v14;
    __int16 v41 = v5;
    xpc_object_t v42 = v4;
    uint64_t v45 = 0;
    int v44 = 0;
    uint64_t v16 = *(void *)v49;
    long long v43 = v2;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v49 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v19 = [v18 address_endpoint:v41, v42, v43];
        if (v19)
        {
          id v20 = (void *)v19;
          int v21 = [v18 address_endpoint];
          nw_endpoint_type_t type = nw_endpoint_get_type(v21);

          if (type == nw_endpoint_type_address)
          {
            int v23 = [v18 address_endpoint];
            nw_endpoint_get_address(v23);
            uint64_t v24 = (void *)nw_endpoint_create_address_with_port();

            nw_endpoint_get_address(v10);
            int v25 = (void *)nw_endpoint_create_address_with_port();
            BOOL v26 = sub_10002A5A8();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)CFStringRef v56 = 138412290;
              uint64_t v57 = (uint64_t)v24;
              _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "stripped current endpoint %@", v56, 0xCu);
            }

            uint64_t v27 = sub_10002A5A8();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)CFStringRef v56 = 138412290;
              uint64_t v57 = (uint64_t)v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "stripped target  endpoint %@", v56, 0xCu);
            }

            if ([v24 isEqual:v25])
            {
              if (byte_10005BF80
                && (objc_msgSend(v18, "bonjour_endpoint"),
                    uint64_t v28 = objc_claimAutoreleasedReturnValue(),
                    v28,
                    v28))
              {
                uint64_t v29 = sub_10002A5A8();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
                  sub_10003EF08(&v46, v47, v29);
                }
              }
              else
              {
                id v30 = v18;

                ++v44;
                uint64_t v45 = v30;
              }
            }
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v48 objects:buf count:16];
    }
    while (v15);

    uint64_t v31 = v45;
    if (v45 && v44 >= 2) {
      sub_10003EEEC();
    }

    id v4 = v42;
    int v2 = v43;
    id v5 = v41;
    if (v45)
    {
      uint64_t v32 = sub_10002A5A8();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v53 = (OS_nw_connection *)v45;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@> reusing existing device for incoming connection endpoint", buf, 0xCu);
      }

      long long v33 = [v45 connection];

      if (v33)
      {
        long long v34 = sub_10002A5A8();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          uint64_t v53 = (OS_nw_connection *)v45;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@> canceling existing connection to replace it", buf, 0xCu);
        }

        char v35 = [v45 peerconn];

        if (v35)
        {
          long long v36 = [v45 peerconn];
          nw_connection_cancel(v36);
        }
        int v37 = [v45 connection];
        xpc_remote_connection_cancel();

        [v45 setPeerconn:v43];
      }
      else
      {
        [v45 setPeerconn:v43];
        [v45 needsConnect];
      }
      goto LABEL_47;
    }
  }
  else
  {
  }
  long long v38 = sub_10002A5A8();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    uint64_t v53 = v2;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@> did not find existing device, creating new device for incoming connection endpoint", buf, 0xCu);
  }

  id v39 = (id)nw_path_copy_interface();
  if (!v39) {
    sub_10003EE80(&v48, buf);
  }
  uint64_t v31 = v39;

  nw_endpoint_set_interface();
  unsigned int v40 = [[RSDRemoteBonjourPeerDevice alloc] initWithIncomingEndpoint:v10];
  [(RSDRemoteBonjourPeerDevice *)v40 setPeerconn:v2];
  [(RSDRemoteBonjourPeerDevice *)v40 attach];

LABEL_47:
}

void sub_10002CB34(id a1, int a2, OS_nw_error *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a2 == 3)
  {
    id v15 = sub_10002A5A8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10003F0BC();
    }

    nw_error_domain_t error_domain = nw_error_get_error_domain(v5);
    int error_code = nw_error_get_error_code(v5);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel((nw_listener_t)qword_10005BFA8);
      long long v18 = (void *)qword_10005BFA8;
      qword_10005BFA8 = 0;

      dispatch_time_t v19 = dispatch_time(0, 5000000000);
      dispatch_after(v19, (dispatch_queue_t)qword_10005BF90, &stru_100055F20);
    }
  }
  else if (a2 == 2)
  {
    id v6 = sub_10002A5A8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = (void *)nw_listener_copy_local_endpoint();
      int v20 = 138412802;
      uint64_t v21 = (uint64_t)v7;
      __int16 v22 = 1024;
      int v23 = 2;
      __int16 v24 = 2112;
      int v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "listening on %@ (state %u, error %@)", (uint8_t *)&v20, 0x1Cu);
    }
    int port = nw_listener_get_port((nw_listener_t)qword_10005BFA8);
    if (port)
    {
      int v9 = port;
      uint64_t v10 = sub_10002A5A8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v20 = 67109120;
        LODWORD(v21) = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "listener port: %u", (uint8_t *)&v20, 8u);
      }

      int v11 = nw_listener_copy_local_endpoint();
      if (v11)
      {
        uint64_t description = nw_endpoint_get_description();
        if (description)
        {
          uint64_t v13 = description;
          id v14 = sub_10002A5A8();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v20 = 136315138;
            uint64_t v21 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "listener local endpoint: %s", (uint8_t *)&v20, 0xCu);
          }
        }
      }
LABEL_22:
    }
  }
  else if (v4)
  {
    int v11 = sub_10002A5A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003F054();
    }
    goto LABEL_22;
  }
}

void sub_10002CDDC(id a1)
{
  if (qword_10005BF98) {
    BOOL v1 = qword_10005BFA8 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (v1)
  {
    int v2 = [(id)qword_10005BF98 index];
    sub_10002B240(v2);
  }
}

void sub_10002CE28(id a1, OS_nw_endpoint *a2, BOOL a3)
{
  BOOL v3 = a3;
  id v4 = a2;
  id v5 = sub_10002A5A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "removed";
    if (v3) {
      id v6 = "added";
    }
    int v7 = 138412546;
    uint32_t v8 = v4;
    __int16 v9 = 2080;
    uint64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "advertised endpoint %@ %s", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10002CF04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

NSObject *sub_10002CF20(int a1)
{
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
  if (!a1) {
    sub_10003E034(&v8, v9);
  }
  BOOL v3 = secure_tcp;
  id v4 = nw_interface_create_with_index();
  if (v4)
  {
    nw_parameters_require_interface(v3, v4);
    nw_parameters_set_local_only(v3, 1);
    nw_parameters_set_required_address_family();
    nw_parameters_set_required_interface_type(v3, nw_interface_type_wired);
    nw_parameters_set_no_fallback();
    nw_parameters_set_indefinite();
    xpc_remote_connection_setup_nw_parameters();
    id v5 = v3;
  }
  else
  {
    id v6 = sub_10002D068();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10003801C(v6);
    }

    id v5 = 0;
  }

  return v5;
}

id sub_10002D068()
{
  if (qword_10005BFD8 != -1) {
    dispatch_once(&qword_10005BFD8, &stru_100055FA8);
  }
  os_log_t v0 = (void *)qword_10005BFD0;

  return v0;
}

void sub_10002D0BC(void *a1)
{
  id v1 = a1;
  int v2 = [v1 interface];
  [v1 setBackendProperty:@"InterfaceIndex" withUint:[v2 index]];

  id v3 = [v1 interface];
  [v1 setBackendProperty:@"InterfaceName" withString:[v3 name]];
}

BOOL sub_10002D150()
{
  if (qword_10005BFC8 != -1) {
    dispatch_once(&qword_10005BFC8, &stru_100055F60);
  }
  return (byte_10005BFC0 & 1) == 0;
}

void sub_10002D19C(id a1)
{
  if (os_parse_boot_arg_int()) {
    byte_10005BFC0 = 1;
  }
}

uint64_t sub_10002D4E8(uint64_t a1)
{
  if (!a1) {
    sub_10003F18C(&v2, v3);
  }
  return 33022;
}

void sub_10002D9FC(void *a1, uint64_t a2, int a3)
{
  id v5 = sub_10002D068();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10003F340(a3, v5);
  }

  id v6 = a1;
  if (!v6) {
    sub_10003DF94(&v12, buf);
  }
  int v7 = v6;

  switch(a3)
  {
    case -536870896:
      uint64_t v10 = sub_10002D068();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] kIOMessageServiceIsTerminated", buf, 0xCu);
      }

      [v7 deactivate];
      uint64_t v9 = 3;
      goto LABEL_18;
    case -536771840:
      int v11 = sub_10002D068();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[%p] kIONetworkLinkStateActive", buf, 0xCu);
      }

      if (![v7 state])
      {
        uint64_t v9 = 1;
        goto LABEL_18;
      }
      break;
    case -536771839:
      uint64_t v8 = sub_10002D068();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%p] kIONetworkLinkStateInactive", buf, 0xCu);
      }

      if ([v7 state] != (id)3)
      {
        uint64_t v9 = 0;
LABEL_18:
        [v7 advanceState:v9];
      }
      break;
  }
}

id sub_10002E0BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) addressWithRetry];
}

id sub_10002E4CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) addressWithRetry];
}

uint64_t sub_10002E4D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10002E4E8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10002E4FC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002E740(id a1)
{
  qword_10005BFD0 = (uint64_t)os_log_create("com.apple.RemoteServiceDiscovery", "ncm_common");

  _objc_release_x1();
}

void sub_10002E784()
{
  id v0 = (id)qword_10005BFE0;
  if (!v0) {
    sub_10003AB34(&v5, buf);
  }

  if (dword_10005BC74 == 3)
  {
    if (qword_10005BFF0) {
      sub_10003F80C(&v5, buf);
    }
    id v1 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Attaching loopback device.", buf, 2u);
    }
    uint64_t v2 = [(RSDRemoteDevice *)[RSDRemoteLoopbackDevice alloc] initWithName:"localhost"];
    id v3 = (void *)qword_10005BFF0;
    qword_10005BFF0 = (uint64_t)v2;

    dword_10005BC74 = 1;
    [(id)qword_10005BFF0 setBackendProperty:"IsLoopback" withBool:1];
    [(id)qword_10005BFF0 attach];
  }
  else
  {
    id v4 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10005BC74;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cannot attach loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002E900()
{
  id v1 = +[RSDRemoteDevice tlsOidsRequiredOfPeer];
  id v0 = [v1 allObjects];
  sub_10001A5FC(v0, &stru_100055FE0);
}

void sub_10002E968(id a1)
{
  id v1 = (id)qword_10005BFE0;
  if (!v1) {
    sub_10003AB34(&v11, buf);
  }

  int v2 = dword_10005BC74;
  if (dword_10005BC74 == 1)
  {
    uint64_t v3 = qword_10005BFF0;
    if (!qword_10005BFF0) {
      sub_10003F878(&v11, buf);
    }
    id v4 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@> Connecting to loopback device", buf, 0xCu);
    }
    xpc_remote_connection_get_version_flags();
    *(void *)long long buf = 0;
    xpc_remote_connection_create_connected_ipv6_pair();
    uint64_t v5 = *(void **)buf;
    id v6 = *(id *)buf;
    id v7 = 0;
    objc_storeStrong((id *)&qword_10005BFF8, v5);
    objc_storeStrong((id *)&qword_10005C000, 0);
    byte_10005C009 = 0;
    [(id)qword_10005BFF0 connect:qword_10005C000];
    xpc_remote_connection_set_event_handler();
    if ([(id)qword_10005BFF0 tlsEnabled])
    {
      id v8 = sub_10001AB48();
      if (!v8) {
        sub_100033E7C();
      }
      uint64_t v9 = v8;
      xpc_remote_connection_set_tls();
    }
    xpc_remote_connection_activate();
    dword_10005BC74 = 2;
  }
  else
  {
    uint64_t v10 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v2;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cannot connect loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002EB8C()
{
  id v0 = (id)qword_10005BFE0;
  if (!v0) {
    sub_10003AB34(&v7, buf);
  }

  if (dword_10005BC74 == 3)
  {
    id v1 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10005BC74;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Cannot disconnect loopback, state = %d", buf, 8u);
    }
  }
  else
  {
    if (!qword_10005BFF0) {
      sub_10003F878(&v7, buf);
    }
    int v2 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_10005BFF0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%{public}@> Disconnecting loopback device", buf, 0xCu);
    }
    if (dword_10005BC74 == 2)
    {
      if (!qword_10005BFF8) {
        sub_10003F8E4(&v7, buf);
      }
      xpc_remote_connection_cancel();
      uint64_t v3 = (void *)qword_10005BFF8;
      qword_10005BFF8 = 0;

      id v4 = [(id)qword_10005BFF0 connection];

      if (v4)
      {
        uint64_t v5 = [(id)qword_10005BFF0 connection];
        xpc_remote_connection_cancel();

        [(id)qword_10005BFF0 setConnection:0];
      }
      id v6 = (void *)qword_10005C000;
      if (!qword_10005C000) {
        sub_10003F950(&v7, buf);
      }
      qword_10005C000 = 0;
    }
    dword_10005BC74 = 3;
    byte_10005C008 = 0;
  }
}

void sub_10002ED70()
{
  id v0 = (id)qword_10005BFE0;
  if (!v0) {
    sub_10003AB34(&v4, buf);
  }

  if (dword_10005BC74 == 3)
  {
    id v1 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10005BC74;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Cannot detach loopback, state = %d", buf, 8u);
    }
  }
  else
  {
    if (!qword_10005BFF0) {
      sub_10003F878(&v4, buf);
    }
    int v2 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_10005BFF0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%{public}@> Detaching loopback device", buf, 0xCu);
    }
    sub_10002EB8C();
    [(id)qword_10005BFF0 disconnect];
    uint64_t v3 = (void *)qword_10005BFF0;
    qword_10005BFF0 = 0;
  }
}

void sub_10002EEC4()
{
  id v0 = (id)qword_10005BFE0;
  if (!v0) {
    sub_10003AB34(&v3, buf);
  }

  if (dword_10005BC74 == 2)
  {
    if (!qword_10005BFF0) {
      sub_10003F878(&v3, buf);
    }
    id v1 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_10005BFF0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Suspending loopback device", buf, 0xCu);
    }
    byte_10005C008 = 1;
  }
  else
  {
    int v2 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10005BC74;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cannot suspend loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002F014()
{
  id v0 = (id)qword_10005BFE0;
  if (!v0) {
    sub_10003AB34(&v3, buf);
  }

  if (dword_10005BC74 == 2)
  {
    if (!qword_10005BFF0) {
      sub_10003F878(&v3, buf);
    }
    id v1 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_10005BFF0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Resuming loopback device", buf, 0xCu);
    }
    byte_10005C008 = 0;
    [(id)qword_10005BFF0 drainPendedRequests];
  }
  else
  {
    int v2 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10005BC74;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cannot resume loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002F160()
{
  id v0 = (id)qword_10005BFE0;
  if (!v0) {
    sub_10003AB34(&v4, buf);
  }

  if (dword_10005BC74 == 2)
  {
    if (!qword_10005BFF0) {
      sub_10003F878(&v4, buf);
    }
    if (!qword_10005BFF8) {
      sub_10003F8E4(&v4, buf);
    }
    id v1 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = qword_10005BFF0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Resetting loopback device", buf, 0xCu);
    }
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "MessageType", "Reset");
    xpc_remote_connection_send_message_with_reply();
  }
  else
  {
    uint64_t v3 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = dword_10005BC74;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cannot reset loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002F300(id a1, OS_xpc_object *a2)
{
  byte_10005C009 = 1;
  id v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "MessageType", "ResetGoahead");
  xpc_remote_connection_send_message();
}

void sub_10002F374(id obj)
{
  objc_storeStrong((id *)&qword_10005BFE0, obj);
  id v4 = obj;
  os_log_t v2 = os_log_create("com.apple.RemoteServiceDiscovery", "loopback");
  uint64_t v3 = (void *)qword_10005BFE8;
  qword_10005BFE8 = (uint64_t)v2;
}

void sub_10002FA1C(id a1, OS_xpc_object *a2)
{
  os_log_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    if (byte_10005C009 != 1) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  string = xpc_dictionary_get_string(v2, "MessageType");
  if (!string)
  {
    uint64_t v10 = qword_10005BFE8;
    if (os_log_type_enabled((os_log_t)qword_10005BFE8, OS_LOG_TYPE_ERROR)) {
      sub_10003FE14(v10);
    }
    sub_10002ED70();
    goto LABEL_18;
  }
  id v4 = string;
  if (!strcmp(string, "Handshake") || !strcmp(v4, "StartTls"))
  {
    xpc_remote_connection_send_message();
    goto LABEL_18;
  }
  if (!strcmp(v4, "Heartbeat"))
  {
    uint64_t reply_msg_id = _xpc_dictionary_get_reply_msg_id();
    _xpc_dictionary_set_reply_msg_id();
    v12[1] = _NSConcreteStackBlock;
    v12[2] = 3221225472;
    v12[3] = sub_10002FCC4;
    v12[4] = &unk_100056040;
    _OWORD v12[5] = reply_msg_id;
    xpc_remote_connection_send_message_with_reply();
    goto LABEL_18;
  }
  if (!strcmp(v4, "Reset"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_string(reply, "Result", "Ok");
    xpc_dictionary_send_reply();
LABEL_21:

    goto LABEL_18;
  }
  if (!strcmp(v4, "ResetGoahead"))
  {
LABEL_13:
    sub_10002EB8C();
    dword_10005BC74 = 1;
    sub_10002E900();
    goto LABEL_18;
  }
  if (!strcmp(v4, "Timesync"))
  {
    xpc_dictionary_get_value(v2, "TimesyncPayload");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5) {
      sub_10003FE98(v12, v13);
    }
    xpc_object_t reply = v5;

    sub_10000F1F4(reply, (void *)qword_10005BFE8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      sub_10003FF04(v12, v13);
    }
    id v8 = v7;

    xpc_object_t v9 = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_value(v9, "TimesyncPayload", v8);
    xpc_dictionary_send_reply();

    goto LABEL_21;
  }
LABEL_18:
}

void sub_10002FCC4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    _xpc_dictionary_set_reply_msg_id();
    _xpc_dictionary_set_remote_connection();
    xpc_dictionary_send_reply();
  }
}

void sub_10002FD40(id a1, OS_sec_protocol_metadata *a2, OS_sec_trust *a3, id a4)
{
  id v5 = (void *)qword_10005BFF0;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v6 = sub_10001B05C(v5, a3);
  v7[2](v7, v6);
}

void sub_10002FDC4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000 | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
       + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
       + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64);
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1)
{
  return a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  uint64_t v11 = v10;
  uint64_t v12 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  unsigned long long v14 = __PAIR128__(v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9, v8 - v4 + v11)- v13;
  return (__CFADD__((void)v14, (unint64_t)(*((void *)&v14 + 1) - v12) >> 63) + *((void *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2 = sntp_timestamp_to_datestamp(*(void *)(a1 + 4));
  uint64_t v4 = v3;
  uint64_t v5 = -v2;
  uint64_t v6 = sntp_timestamp_to_datestamp(*(void *)(a1 + 12));
  uint64_t v8 = v7;
  uint64_t v9 = sntp_timestamp_to_datestamp(*(void *)(a1 + 20));
  unint64_t v11 = v10;
  uint64_t v12 = -v9;
  uint64_t v13 = sntp_timestamp_to_datestamp(*(void *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

unint64_t sntp_packet_ntoh@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  long long v5 = *a1;
  uint64_t v6 = *((void *)a1 + 2);
  sntp_header_ntoh((int *)&v5, a2);
  *(void *)(a2 + 24) = sntp_timestamp_ntoh(*((void *)a1 + 3));
  *(void *)(a2 + 32) = sntp_timestamp_ntoh(*((void *)a1 + 4));
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 5));
  *(void *)(a2 + 40) = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v5 = *a1;
  unsigned int v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  int v6 = sntp_shortstamp_ntoh(a1[2]);
  unsigned int v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  unint64_t result = sntp_timestamp_ntoh(*((void *)a1 + 2));
  *(void *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_server_respond@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a4 + 16) = *(void *)(a2 + 16);
  *(void *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = sntp_timestamp_hton(v8);
  unint64_t v10 = a3();
  unint64_t result = sntp_timestamp_hton(v10);
  *(void *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(unsigned char *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }
  return result;
}

unint64_t sntp_client_process_response@<X0>(unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    unint64_t v8 = *a2;
    *(void *)(a4 + 4) = *a2;
    unint64_t v9 = HIDWORD(v8);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  if (a3) {
LABEL_3:
  }
    *(void *)(a4 + 28) = *a3;
LABEL_4:
  long long v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  unint64_t result = sntp_packet_ntoh(v16, (uint64_t)v17);
  long long v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(void *)(a4 + 52) = *((void *)a1 + 2);
  uint64_t v13 = *((void *)a1 + 4);
  uint64_t v14 = *((void *)a1 + 5);
  *(void *)(a4 + 12) = v13;
  *(void *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != v8 || *((_DWORD *)a1 + 7) != v9)
          {
            int v15 = 10;
            goto LABEL_19;
          }
          if (a3)
          {
            unint64_t result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000) != 0)
            {
              int v15 = 11;
              goto LABEL_19;
            }
          }
        }
        int v15 = 0;
      }
      else
      {
        int v15 = 12;
      }
    }
    else
    {
      int v15 = 8;
    }
  }
  else
  {
    int v15 = 9;
  }
LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!result) {
    *(void *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  }
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  size_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  }
  if (v2 > v3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3 = *(void *)(a1 + 8);
  if (v3 == a3) {
    return memcmp(*(const void **)a1, a2, a3);
  }
  if (v3 > a3) {
    return 0xFFFFFFFFLL;
  }
  return 1;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    if (*a1 > a1[1]) {
      goto LABEL_20;
    }
    unint64_t v5 = *a1;
    unint64_t v6 = *a1;
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (a2)
    {
      if (v6 < v5) {
        goto LABEL_20;
      }
      *a2 = v5;
      a2[1] = 0;
    }
    if (v5 == v6)
    {
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
    else if (v5 <= v6)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (!result) {
        return result;
      }
      if (v5 != v6) {
        return 0;
      }
      if (v5 <= a1[1] && *a1 <= v5)
      {
        *a1 = v5;
        return 1;
      }
    }
LABEL_20:
    __break(0x5519u);
  }
  return result;
}

uint64_t ccder_blob_check_null()
{
  return ccder_blob_decode_tl();
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  uint64_t v6 = 0;
  if (a1 < a2 && a4)
  {
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    long long v10 = a3;
    unint64_t v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      void v17[5] = v12;
      v17[6] = v12;
      _OWORD v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      unint64_t v15 = a1;
      unint64_t v16 = a2;
      uint64_t result = X509CertificateParse((unint64_t *)v17, &v15);
      if (result) {
        break;
      }
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3) {
        __break(0x5519u);
      }
      _OWORD *v10 = v17[0];
      uint64_t v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++) {
          continue;
        }
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    uint64_t result = 0;
    if (a5) {
      *a5 = v6;
    }
  }
  return result;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v68 = 0;
  uint64_t v69 = 0;
  unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v67 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  if (*a2 > v5) {
    goto LABEL_186;
  }
  uint64_t v10 = 720915;
  unint64_t v66 = *a2;
  unint64_t v67 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return v10;
  }
  uint64_t v12 = v69;
  unint64_t v13 = v66;
  unint64_t v14 = v69 + v66 - v4;
  if (__CFADD__(v69, v66 - v4)) {
    goto LABEL_188;
  }
  if (v14 > v5 - v4) {
    goto LABEL_186;
  }
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v14;
  unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12)) {
    goto LABEL_187;
  }
  unint64_t v15 = v13 + v12;
  if (v13 > v15 || v15 > v67) {
    goto LABEL_186;
  }
  unint64_t v64 = v13;
  unint64_t v65 = v15;
  unint64_t v62 = v13;
  unint64_t v63 = v15;
  if (ccder_blob_decode_tl())
  {
    if (__CFADD__(v62, v68)) {
      goto LABEL_187;
    }
    uint64_t v16 = 720916;
    if (ccder_blob_decode_uint64() && v62 == v62 + v68)
    {
      if (v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v64 = v62 + v68;
      unint64_t v65 = v63;
      goto LABEL_14;
    }
    return v16;
  }
LABEL_14:
  if (!ccder_blob_decode_tl()) {
    return 720917;
  }
  unint64_t v18 = v64;
  unint64_t v17 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v19 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 136) = v64;
  *(void *)(a1 + 144) = v19;
  if (__CFADD__(v18, v19)) {
    goto LABEL_187;
  }
  unint64_t v20 = v18 + v19;
  if (v18 > v20 || v20 > v17) {
    goto LABEL_186;
  }
  unint64_t v64 = v20;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v64, (unint64_t *)(a1 + 152))) {
    return 720918;
  }
  if (!ccder_blob_decode_tl()) {
    return 720919;
  }
  unint64_t v22 = v64;
  unint64_t v21 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v23 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 120) = v64;
  *(void *)(a1 + 128) = v23;
  if (__CFADD__(v22, v23)) {
    goto LABEL_187;
  }
  unint64_t v24 = v22 + v23;
  if (v22 > v24 || v24 > v21) {
    goto LABEL_186;
  }
  unint64_t v64 = v24;
  if (!ccder_blob_decode_tl()) {
    return 720920;
  }
  unint64_t v26 = v64;
  unint64_t v25 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v27 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 72) = v64;
  *(void *)(a1 + 80) = v27;
  if (__CFADD__(v26, v27)) {
    goto LABEL_187;
  }
  unint64_t v28 = v26 + v27;
  if (v26 > v28 || v28 > v25) {
    goto LABEL_186;
  }
  unint64_t v64 = v28;
  if (!ccder_blob_decode_tl()) {
    return 720921;
  }
  unint64_t v29 = v64;
  unint64_t v30 = v65;
  if (v65 < v64) {
    goto LABEL_186;
  }
  unint64_t v31 = v68;
  if (v68 > v65 - v64) {
    goto LABEL_186;
  }
  *(void *)(a1 + 104) = v64;
  *(void *)(a1 + 112) = v31;
  if (__CFADD__(v29, v31)) {
    goto LABEL_187;
  }
  unint64_t v32 = v29 + v31;
  if (v29 > v29 + v31 || v32 > v30) {
    goto LABEL_186;
  }
  unint64_t v64 = v29 + v31;
  uint64_t result = ccder_blob_decode_tl();
  if (!result) {
    return 720922;
  }
  unint64_t v33 = v64;
  unint64_t v34 = v68;
  unint64_t v35 = v64 - v32 + v68;
  if (!__CFADD__(v64 - v32, v68))
  {
    if (v35 > v30 - v32) {
      goto LABEL_186;
    }
    *(void *)(a1 + 88) = v32;
    *(void *)(a1 + 96) = v35;
    if (__CFADD__(v33, v34)) {
      goto LABEL_187;
    }
    unint64_t v36 = v33 + v34;
    if (v33 > v36 || v36 > v65) {
      goto LABEL_186;
    }
    unint64_t v63 = v65;
    unint64_t v64 = v36;
    unint64_t v62 = v36;
    if (ccder_blob_decode_tl()) {
      return 720923;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl()) {
      return 720924;
    }
    if (v64 > v65) {
      goto LABEL_186;
    }
    unint64_t v62 = v64;
    unint64_t v63 = v65;
    if (ccder_blob_decode_tl())
    {
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v61 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v62, v68)) {
        goto LABEL_187;
      }
      if (v62 > v62 + v68 || v62 + v68 > v63) {
        goto LABEL_186;
      }
      unint64_t v60 = v62;
      unint64_t v61 = v62 + v68;
      if (!ccder_blob_decode_tl() || !v68) {
        return 720925;
      }
      unint64_t v37 = v60;
      if (__CFADD__(v60, v68)) {
LABEL_187:
      }
        __break(0x5513u);
      unint64_t v38 = v60 + v68;
      if (v60 > v60 + v68 || v38 > v61) {
        goto LABEL_186;
      }
      unint64_t v61 = v60 + v68;
      *(unsigned char *)(a1 + 266) = 0;
      memset(&v70[2], 0, 128);
      if (a3) {
        BOOL v39 = a4 == 0;
      }
      else {
        BOOL v39 = 1;
      }
      int v40 = !v39;
      memset(v70, 0, 32);
      if (v37 < v38)
      {
        unsigned __int8 v53 = 0;
        int v41 = 0;
        do
        {
          unint64_t v58 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v59 = 0xAAAAAAAAAAAAAAAALL;
          char v57 = 0;
          uint64_t v56 = 0;
          if ((ccder_blob_decode_tl() & 1) == 0) {
            return 720926;
          }
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          unint64_t v55 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          if (v60 > v60 + v56 || v60 + v56 > v61) {
            goto LABEL_186;
          }
          unint64_t v54 = v60;
          unint64_t v55 = v60 + v56;
          if (!ccder_blob_decode_tl()) {
            return 720927;
          }
          if (v55 < v54 || v68 > v55 - v54) {
            goto LABEL_186;
          }
          unint64_t v58 = v54;
          unint64_t v59 = v68;
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (!sub_100030FF8(&v54, 1, &v57)) {
            return 720928;
          }
          if (!ccder_blob_decode_tl()) {
            return 720929;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v55 != v54 + v68) {
            return 720929;
          }
          if (v40 && !compare_octet_string_raw((uint64_t)&v58, a3, a4))
          {
            if (v55 < v54) {
              goto LABEL_186;
            }
            unint64_t v43 = v68;
            if (v68 > v55 - v54) {
              goto LABEL_186;
            }
            *(void *)(a1 + 248) = v54;
            *(void *)(a1 + 256) = v43;
          }
          if (v59 == 3)
          {
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 15)
            {
              uint64_t v16 = 720930;
              if ((v41 & 1) != 0 || (sub_100031110() & 1) == 0) {
                return v16;
              }
              v41 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 19)
            {
              uint64_t v16 = 720931;
              if ((v41 & 2) != 0 || (sub_1000311E0(&v54, (void *)(a1 + 200), (unsigned char *)(a1 + 265)) & 1) == 0) {
                return v16;
              }
              v41 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 35)
            {
              uint64_t v16 = 720932;
              if ((v41 & 4) != 0
                || (sub_1000312B0(&v54, (unint64_t *)(a1 + 168), (void *)(a1 + 176)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 14)
            {
              uint64_t v16 = 720933;
              if ((v41 & 8) != 0
                || (sub_1000313D8(&v54, (unint64_t *)(a1 + 184), (void *)(a1 + 192)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 37)
            {
              uint64_t v16 = 720934;
              if ((v41 & 0x10) != 0
                || (sub_10003149C(&v54, (unint64_t *)(a1 + 208), (void *)(a1 + 216)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v58 == 7509 && *(unsigned char *)(v58 + 2) == 17)
            {
              uint64_t v16 = 720935;
              if ((v41 & 0x20) != 0
                || (sub_1000315AC(&v54, (unint64_t *)(a1 + 224), (void *)(a1 + 232)) & 1) == 0)
              {
                return v16;
              }
              v41 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v59 >= 8 && *(_DWORD *)v58 == -2042067414 && *(_DWORD *)(v58 + 3) == 1684273030)
          {
            uint64_t v16 = 720936;
            if (!sub_100031680((uint64_t)&v58, (uint64_t)v70, v53)) {
              return v16;
            }
            uint64_t result = sub_10003170C((uint64_t)&v54, v58, v59, (uint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v40);
            if (!result) {
              return v16;
            }
            if (v53 == 0xFF) {
              goto LABEL_189;
            }
            ++v53;
            goto LABEL_155;
          }
          if (__CFADD__(v54, v68)) {
            goto LABEL_187;
          }
          if (v54 > v54 + v68 || v54 + v68 > v55) {
            goto LABEL_186;
          }
          v54 += v68;
          if (v57) {
            *(unsigned char *)(a1 + 266) = 1;
          }
LABEL_155:
          if (v54 != v55) {
            return 720926;
          }
          if (__CFADD__(v60, v56)) {
            goto LABEL_187;
          }
          unint64_t v37 = v60 + v56;
          if (v60 > v60 + v56) {
            goto LABEL_186;
          }
          unint64_t v38 = v61;
          if (v37 > v61) {
            goto LABEL_186;
          }
          v60 += v56;
        }
        while (v37 < v61);
      }
      if (v37 != v38) {
        return 720925;
      }
      if (v37 > v65 || v64 > v37) {
        goto LABEL_186;
      }
      unint64_t v64 = v37;
    }
    if (*(void *)(a1 + 32) < 3uLL)
    {
      uint64_t v16 = 720915;
      if (v64 != v65) {
        return v16;
      }
LABEL_170:
      if (__CFADD__(v66, v69)) {
        goto LABEL_187;
      }
      if (v66 > v66 + v69 || v66 + v69 > v67) {
        goto LABEL_186;
      }
      v66 += v69;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 40))) {
        return 720937;
      }
      *(void *)&v70[0] = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v70[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v60 = 0;
      uint64_t result = ccder_blob_decode_bitstring();
      if (!result) {
        return 720938;
      }
      if (v60 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((void *)&v70[0] + 1) >= *(void *)&v70[0])
        {
          unint64_t v51 = (v60 + 7) >> 3;
          if (v51 <= *((void *)&v70[0] + 1) - *(void *)&v70[0])
          {
            *(void *)(a1 + 56) = *(void *)&v70[0];
            *(void *)(a1 + 64) = v51;
            unint64_t v52 = v67;
            if (v66 <= v67)
            {
              uint64_t v16 = 0;
              *a2 = v66;
              a2[1] = v52;
              return v16;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v65 <= a2[1] && *a2 <= v65)
    {
      *a2 = v65;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_100030FF8(void *a1, int a2, unsigned char *a3)
{
  if (*a1 > a1[1]) {
    __break(0x5519u);
  }
  if ((ccder_blob_decode_tl() & 1) != 0 || !a2) {
    return 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

uint64_t sub_100031110()
{
  uint64_t result = ccder_blob_decode_bitstring();
  if (result) {
    return 0;
  }
  return result;
}

uint64_t sub_1000311E0(void *a1, void *a2, unsigned char *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    uint64_t result = sub_100030FF8(a1, 1, a3);
    if (result)
    {
      if (ccder_blob_decode_uint64())
      {
        if (!*a3) {
          return 0;
        }
        *a2 = 0xAAAAAAAAAAAAAAAALL;
        *a2 = 0xAAAAAAAAAAAAAAABLL;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000312B0(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_15;
    }
    if (v7 - 0x5555555555555556 != a1[1]) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_16;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
        goto LABEL_16;
      }
      *a2 = v10;
      *a3 = 0xAAAAAAAAAAAAAAAALL;
    }
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      unint64_t v9 = v8 - 0x5555555555555556;
      if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_1000313D8(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_10003149C(unint64_t *a1, unint64_t *a2, void *a3)
{
  int v6 = ccder_blob_decode_tl();
  uint64_t result = 0;
  if (v6)
  {
    if (*a1 > a1[1]) {
      goto LABEL_11;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = a1[1];
    uint64_t result = ccder_blob_decode_tl();
    if (!result) {
      return result;
    }
    if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_11;
    }
    *a2 = v10;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v8 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v9 = v8 - 0x5555555555555556;
    if (v8 > v8 - 0x5555555555555556 || v9 > a1[1]) {
LABEL_11:
    }
      __break(0x5519u);
    *a1 = v9;
  }
  return result;
}

uint64_t sub_1000315AC(unint64_t *a1, unint64_t *a2, void *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result == 1)
  {
    unint64_t v7 = a1[1];
    BOOL v8 = v7 >= *a1;
    unint64_t v9 = v7 - *a1;
    if (!v8 || v9 < 0xAAAAAAAAAAAAAAAALL) {
      goto LABEL_13;
    }
    *a2 = *a1;
    *a3 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v11 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      return result;
    }
    unint64_t v12 = v11 - 0x5555555555555556;
    if (v11 > v11 - 0x5555555555555556 || v12 > a1[1]) {
LABEL_13:
    }
      __break(0x5519u);
    *a1 = v12;
  }
  return result;
}

uint64_t sub_100031680(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 > 9) {
    return 0;
  }
  unint64_t v5 = (void *)result;
  unsigned __int8 v6 = 0;
  unint64_t v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    uint64_t result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!result) {
      return result;
    }
    if (a3 <= v6++)
    {
      uint64_t v9 = v5[1];
      unint64_t v10 = (void *)(a2 + 16 * a3);
      void *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10003170C(uint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, int a6)
{
  if (a6) {
    a5 = 0;
  }
  if (a3 == 11)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10301066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x200;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x10601066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x800;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11801066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x12401066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x11901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(void *)(a2 + 3) == 0x21901066463F786)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x8000;
      goto LABEL_275;
    }
LABEL_159:
    int v44 = 0;
LABEL_160:
    if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 27)
    {
      return sub_1000328A8(result, a2, a3, a4, a5);
    }
    if (v44)
    {
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v24 = *a4 | 0x400000;
        goto LABEL_275;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 37748736;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4354)
      {
        uint64_t result = ccder_blob_check_null();
        if (!result) {
          return result;
        }
        uint64_t v54 = *a4;
        uint64_t v55 = 0x8004000000;
        goto LABEL_205;
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
      {
        return (uint64_t)sub_100032ACC((unint64_t *)result, a4, a5);
      }
      if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
      {
        unint64_t v52 = *(void *)result;
        unint64_t v51 = *(void *)(result + 8);
        if (a5)
        {
          if (v52 > v51) {
            goto LABEL_281;
          }
          *a5 = v52;
          a5[1] = v51 - v52;
        }
        *a4 |= 0x80000000uLL;
LABEL_243:
        if (v52 <= v51)
        {
          *(void *)uint64_t result = v51;
          return 1;
        }
LABEL_281:
        __break(0x5519u);
        return result;
      }
    }
LABEL_242:
    unint64_t v52 = *(void *)result;
    unint64_t v51 = *(void *)(result + 8);
    goto LABEL_243;
  }
  if (a3 == 10)
  {
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v54 = *a4;
      uint64_t v55 = 0x58600003F0D0;
LABEL_205:
      uint64_t v24 = v54 | v55;
LABEL_275:
      *a4 = v24;
      return 1;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538) {
      goto LABEL_209;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0xF00;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_209:
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x20;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x40;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x10000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x100;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x400;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x1000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x80000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x2000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x4000000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
    {
      return sub_100032638((unint64_t *)result, a4, a5);
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      uint64_t result = ccder_blob_check_null();
      if (!result) {
        return result;
      }
      uint64_t v24 = *a4 | 0x300000000;
      goto LABEL_275;
    }
    if (*(void *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
    {
      return sub_10003271C();
    }
    int v44 = 1;
    goto LABEL_160;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA) {
      goto LABEL_242;
    }
    goto LABEL_159;
  }
  if (*(void *)a2 == 0xB6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    return sub_100032278((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 49)
  {
    char v56 = 0;
    uint64_t result = sub_100030FF8((void *)result, 0, &v56);
    if (result)
    {
      uint64_t v53 = 0x10000080002;
      if (!v56) {
        uint64_t v53 = 0x20000040001;
      }
      *a4 |= v53;
    }
    return result;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 44)
  {
    return sub_1000323B4((unint64_t *)result, a4, a5);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 36)
  {
    return sub_10003254C((unint64_t *)result);
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 22)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v54 = *a4;
    uint64_t v55 = 1048584;
    goto LABEL_205;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 19)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x8000000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xA6463F78648862ALL && *(unsigned char *)(a2 + 8) == 1)
  {
    *a4 |= 0x1000000uLL;
    goto LABEL_242;
  }
  if (*(void *)a2 == 0x66463F78648862ALL && *(unsigned char *)(a2 + 8) == 29)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x2000000;
    goto LABEL_275;
  }
  if (*(void *)a2 == 0xC6463F78648862ALL && *(unsigned char *)(a2 + 8) == 14)
  {
    uint64_t result = ccder_blob_check_null();
    if (!result) {
      return result;
    }
    uint64_t v24 = *a4 | 0x4000000;
    goto LABEL_275;
  }
  if (*(void *)a2 != 0x86463F78648862ALL || *(unsigned char *)(a2 + 8) != 3) {
    goto LABEL_242;
  }

  return sub_100032978((unint64_t *)result, a4, a5);
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8 = 720939;
  unint64_t v9 = *a2;
  unint64_t v10 = a2[1];
  if (!ccder_blob_decode_tl()) {
    return v8;
  }
  unint64_t v11 = *a2;
  uint64_t result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  uint64_t v8 = result;
  if (result) {
    return v8;
  }
  if (v11 >= 0x5555555555555556)
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  uint64_t v8 = 720939;
  if (*a2 != v11 - 0x5555555555555556) {
    return v8;
  }
  unint64_t v13 = v11 - v9 - 0x5555555555555556;
  if (v11 - v9 >= 0x5555555555555556) {
    goto LABEL_11;
  }
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

BOOL sub_100032278(unint64_t *a1, void *a2, unint64_t *a3)
{
  unint64_t v3 = a1[1];
  if (*a1 > v3) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  unint64_t v11 = v3 - *a1;
  if (ccder_blob_decode_tl()) {
    goto LABEL_5;
  }
  if (*a1 > a1[1]) {
    goto LABEL_19;
  }
  unint64_t v12 = *a1;
  unint64_t v13 = a1[1];
  if (ccder_blob_decode_tl())
  {
LABEL_5:
    unint64_t v8 = v12;
    unint64_t v7 = v13;
    if (v12 > v13) {
      goto LABEL_19;
    }
    *a1 = v12;
    a1[1] = v13;
    unint64_t v9 = v11;
  }
  else
  {
    unint64_t v8 = *a1;
    unint64_t v7 = a1[1];
    unint64_t v9 = v7 - *a1;
  }
  if (__CFADD__(v8, v9)) {
    goto LABEL_20;
  }
  if (v7 == v8 + v9)
  {
    if (!v9) {
      goto LABEL_16;
    }
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v8 <= v7)
      {
        *a1 = v7;
        return v7 == v8 + v9;
      }
      goto LABEL_19;
    }
    if (v8 <= v7 && v9 <= v7 - v8)
    {
      *a3 = v8;
      a3[1] = v9;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v7 == v8 + v9;
}

uint64_t sub_1000323B4(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
      goto LABEL_12;
    }
    unint64_t v8 = v7 - 0x5555555555555556;
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v7 > v8) {
        goto LABEL_12;
      }
      *a3 = v7;
      a3[1] = 0xAAAAAAAAAAAAAAAALL;
    }
    if (v7 <= v8)
    {
      *a1 = v8;
      return 1;
    }
LABEL_12:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003254C(unint64_t *a1)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v3 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v4 = a1[1];
      if (v4 != v3 - 0x5555555555555556) {
        return 0;
      }
      if (v3 <= v4)
      {
        *a1 = v4;
        return 1;
      }
    }
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_100032638(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556)
    {
      __break(0x5513u);
    }
    else
    {
      unint64_t v8 = a1[1];
      if (v8 != v7 - 0x5555555555555556) {
        return 0;
      }
      if (a3)
      {
        if (v8 < v7 || v8 - v7 < 0xAAAAAAAAAAAAAAAALL) {
          goto LABEL_13;
        }
        *a3 = v7;
        a3[1] = 0xAAAAAAAAAAAAAAAALL;
      }
      *a2 |= 0x30000000uLL;
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_13:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003271C()
{
  return 0;
}

uint64_t sub_1000328A8(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, unint64_t *a5)
{
  uint64_t result = ccder_blob_check_null();
  if (result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6) {
      goto LABEL_26;
    }
    if (__CFADD__(a2, a3)) {
      goto LABEL_26;
    }
    unint64_t v10 = a2 + a3;
    if (a2 + a3 == -1) {
      goto LABEL_26;
    }
    unint64_t v11 = a2 + 9;
    unint64_t v12 = (char *)(a2 + 9);
    while (1)
    {
      BOOL v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      BOOL v14 = v13;
      if ((unint64_t)v12 >= v10 - 1) {
        break;
      }
      if (!v14) {
        goto LABEL_25;
      }
      int v15 = *v12++;
      if ((v15 & 0x80000000) == 0) {
        return 0;
      }
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t sub_100032978(unint64_t *a1, void *a2, unint64_t *a3)
{
  uint64_t result = ccder_blob_decode_tl();
  if (result)
  {
    unint64_t v7 = *a1;
    if (*a1 >= 0x5555555555555556) {
      goto LABEL_17;
    }
    if (a1[1] != v7 - 0x5555555555555556) {
      return 0;
    }
    if (v7 > v7 - 0x5555555555555556) {
      goto LABEL_18;
    }
    unint64_t v10 = *a1;
    unint64_t v11 = v7 - 0x5555555555555556;
    uint64_t result = ccder_blob_decode_tl();
    if (result)
    {
      uint64_t result = ccder_blob_decode_tl();
      if (result)
      {
        if (a3)
        {
          if (v11 < v10 || v11 - v10 < 0xAAAAAAAAAAAAAAAALL) {
            goto LABEL_18;
          }
          *a3 = v10;
          a3[1] = 0xAAAAAAAAAAAAAAAALL;
        }
        *a2 |= 0x240000800000uLL;
        unint64_t v8 = *a1;
        if (*a1 < 0x5555555555555556)
        {
          unint64_t v9 = v8 - 0x5555555555555556;
          if (v8 <= v8 - 0x5555555555555556 && v9 <= a1[1])
          {
            *a1 = v9;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *sub_100032ACC(unint64_t *result, void *a2, unint64_t *a3)
{
  unint64_t v4 = *result;
  unint64_t v3 = result[1];
  unint64_t v5 = v3 - *result;
  if (v5 != 32) {
    return (unint64_t *)(v5 == 32);
  }
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    unint64_t v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *uint64_t result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

void sub_100032B2C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_1000036BC();
  _os_crash_msg();
  __break(1u);
}

void sub_100032BC4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_1000036BC();
  _os_crash_msg();
  __break(1u);
}

void sub_100032C5C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "rsd_events publisher received error %d\n", (uint8_t *)v2, 8u);
}

void sub_100032CD4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "SecureConfigDB not available.", v1, 2u);
}

void sub_100032D18(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load SecureConfig parameters: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100032D90(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"com.apple.pcc.research.disableAppleInfrastructureEnforcement";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SecureConfig parameter '%{public}@' has unexpected type", (uint8_t *)&v1, 0xCu);
}

void sub_100032E14(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100032EC0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Control message missing command", v2, v3, v4, v5, v6);
}

void sub_100032EF4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100032FA4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "The address cannot be parsed as a valid IPv6 address", v2, v3, v4, v5, v6);
}

void sub_100032FD8(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "inet_pton: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_100033054()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Control message with unexpected command", v2, v3, v4, v5, v6);
}

void sub_100033088()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Control interface is not available", v2, v3, v4, v5, v6);
}

void sub_1000330BC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus control request: client doesn't expect reply", v2, v3, v4, v5, v6);
}

void sub_1000330F0()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "failed to copy remote endpoint", v2, v3, v4, v5, v6);
}

void sub_100033124()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "Missing client endpoint", v2, v3, v4, v5, v6);
}

void sub_100033158()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "Failed to create connection parameters", v2, v3, v4, v5, v6);
}

void sub_10003318C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Unable to determine index for interface: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1000331F4()
{
  sub_1000062F0();
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "nw_interface created with %{public}s, but we expect to use %{public}s", v2, 0x16u);
}

void sub_100033278()
{
  sub_1000062F0();
  sub_100006318((void *)&_mh_execute_header, v0, v1, "%{public}@> network_copy_interface_address_in6: %{darwin.errno}d");
}

void sub_1000332EC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: client missing entitlement", v2, v3, v4, v5, v6);
}

void sub_100033320()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Missing required listener interface name parameter", v2, v3, v4, v5, v6);
}

void sub_100033354()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "Failed to create listener", v2, v3, v4, v5, v6);
}

void sub_100033388()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "Failed to create remote device or generate device name", v2, v3, v4, v5, v6);
}

void sub_1000333BC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Missing required client device parameter(s)", v2, v3, v4, v5, v6);
}

void sub_1000333F0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Unable to create client device endpoint", v2, v3, v4, v5, v6);
}

void sub_100033424()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Missing required device name parameter to remove", v2, v3, v4, v5, v6);
}

void sub_100033458()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Unable to find device to remove: %{public}s", v2, v3, v4, v5, v6);
}

void sub_1000334C0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: client doesn't expect reply", v2, v3, v4, v5, v6);
}

void sub_1000334F4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2114;
  *(void *)((char *)&v4 + 2) = a1;
  sub_100006318((void *)&_mh_execute_header, a2, a3, "nw_listener state %d received error: %{public}@", v3, (void)v4, WORD4(v4));
}

void sub_10003356C(uint64_t a1, NSObject *a2)
{
  [*(id *)(a1 + 40) device_name];
  sub_1000062F0();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "listener ready with no port for device: %{public}s", v3, 0xCu);
}

void sub_1000335F8()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "nw_listener_state_failed: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100033660(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint8_t v6 = "RequireEntitlement";
  sub_10000ED8C((void *)&_mh_execute_header, a2, a3, "RemoteService definition '%s' is missing the required key '%s'", (uint8_t *)&v3);
}

void sub_1000336E4()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "RemoteService '%s': Failed to set expose policy", v2, v3, v4, v5, v6);
}

void sub_10003374C(void *a1, _OWORD *a2)
{
}

void sub_1000337B8(void *a1, void *a2, const _xpc_type_s *a3)
{
  id v5 = a1;
  [a2 name];
  xpc_type_get_name(a3);
  sub_10000ED74();
  sub_10000ED54((void *)&_mh_execute_header, v6, v7, "RemoteService definition '%s' has unsupported expose policy type '%s'", v8, v9, v10, v11, v12);
}

void sub_100033858(void *a1, void *a2)
{
  id v3 = a1;
  [a2 name];
  sub_1000062F0();
}

void sub_1000338E0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  [v4 name];
  nw_endpoint_type_t type = xpc_get_type(a3);
  xpc_type_get_name(type);
  sub_10000ED74();
  sub_10000ED54((void *)&_mh_execute_header, v7, v8, "RemoteService definition '%s' has \t\t\t\t\t\t\tunsupported expose policy item type '%s'", v9, v10, v11, v12, v13);
}

void sub_100033984(void *a1, _OWORD *a2)
{
}

void sub_1000339F0(void *a1, _OWORD *a2)
{
}

void sub_100033A5C(void *a1, _OWORD *a2)
{
}

void sub_100033AC8(void *a1, _OWORD *a2)
{
  sub_10000ECB0(a1, a2);
  sub_10000ED04();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000036BC();
  sub_10000ED1C();
  __break(1u);
}

void sub_100033B50(void *a1, _OWORD *a2)
{
}

void sub_100033BBC(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_10000EDC0();
  sub_10000ED34((void *)&_mh_execute_header, v1, v2, "%{public}@> Public Properties: %s", (void)v3, DWORD2(v3));
}

void sub_100033C2C(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_10000EDC0();
  sub_10000ED34((void *)&_mh_execute_header, v1, v2, "%{public}@> Properties: %s", (void)v3, DWORD2(v3));
}

void sub_100033C9C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> No local identity available to do TLS with.", v2, v3, v4, v5, v6);
}

void sub_100033D04()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Peer is missing OIDs required for TLS: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100033D6C(void *a1, void *a2)
{
  uint64_t v3 = a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a1 state];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}@> Cannot negotiate TLS in state %d.", (uint8_t *)&v4, 0x12u);
}

void sub_100033E14()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a reset request expecting no reply", v2, v3, v4, v5, v6);
}

void sub_100033E7C()
{
}

void sub_100033E98(void *a1, _OWORD *a2)
{
}

void sub_100033F04()
{
  sub_10000ECF8(__stack_chk_guard);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  sub_10000EDC0();
  sub_10000ED34((void *)&_mh_execute_header, v1, v2, "%{public}@> Public Properties: %s", (void)v3, DWORD2(v3));
}

void sub_100033F74()
{
  sub_10000ECF8(__stack_chk_guard);
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = v0;
  sub_10000EDC0();
  sub_10000ED34((void *)&_mh_execute_header, v1, v2, "%{public}@> Properties: %s", (void)v3, DWORD2(v3));
}

void sub_100033FE4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Unexpected properties type in handshake message.", v2, v3, v4, v5, v6);
}

void sub_100034018()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a handshake message with a wrong or missing type", v2, v3, v4, v5, v6);
}

void sub_100034080()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Got an unexpected message after handshake from a version 0 peer", v2, v3, v4, v5, v6);
}

void sub_1000340E8()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a message with no type", v2, v3, v4, v5, v6);
}

void sub_100034150()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Got an unexpected message during TLS negotiation.", v2, v3, v4, v5, v6);
}

void sub_1000341B8()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a heartbeat request expecting no reply", v2, v3, v4, v5, v6);
}

void sub_100034220()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a timesync request without payload", v2, v3, v4, v5, v6);
}

void sub_100034288()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> create_sntp_response_payload failed", v2, v3, v4, v5, v6);
}

void sub_1000342F0()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a timesync request expecting no reply", v2, v3, v4, v5, v6);
}

void sub_100034358()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a goodbye request expecting no reply", v2, v3, v4, v5, v6);
}

void sub_1000343C0()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Got an unexpected message after handshake.", v2, v3, v4, v5, v6);
}

void sub_100034428(void *a1, _OWORD *a2, id *a3)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  [*a3 state];
  sub_10000EDF0();
  _os_crash_msg();
  __break(1u);
}

void sub_1000344E8()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  __int16 v3 = 2082;
  uint64_t v4 = v0;
  sub_10000ED8C((void *)&_mh_execute_header, v1, (uint64_t)v1, "%{public}@> Skipping remote service \"%{public}s\" with invalid description", v2);
}

void sub_100034564()
{
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Unexpected type for service in handshake message.", v2, v3, v4, v5, v6);
}

void sub_1000345D0()
{
  sub_1000062F0();
  __int16 v2 = 1024;
  int v3 = 1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@> Unable to heartbeat peer with version %d - faking success", v1, 0x12u);
}

void sub_100034654()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10000ED8C((void *)&_mh_execute_header, v1, (uint64_t)v1, "%{public}@> Heartbeat %llu failed - error on connection", v2);
}

void sub_1000346D4()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> timesync failed: device not connected", v2, v3, v4, v5, v6);
}

void sub_10003473C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> timesync failed: remote device doesn't support timesync", v2, v3, v4, v5, v6);
}

void sub_1000347A4()
{
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> time sync request failed: error on connection", v2, v3, v4, v5, v6);
}

void sub_100034810()
{
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> time sync failed: invalid sntp response payload", v2, v3, v4, v5, v6);
}

void sub_10003487C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> goodbye failed: device not connected", v2, v3, v4, v5, v6);
}

void sub_1000348E4()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> goodbye failed: the device type doesn't support goodbye", v2, v3, v4, v5, v6);
}

void sub_10003494C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Device gone, not attempting to reset", v2, v3, v4, v5, v6);
}

void sub_1000349B4()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Remote peer doesn't support reset", v2, v3, v4, v5, v6);
}

void sub_100034A1C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 name];
  sub_10000ED74();
  sub_10000ED54((void *)&_mh_execute_header, v5, v6, "%{public}@> Unable to listen for \"%s\"", v7, v8, v9, v10, v11);
}

void sub_100034AB0(void *a1, _OWORD *a2)
{
}

void sub_100034B34()
{
  sub_1000062F0();
  sub_10000EDA4((void *)&_mh_execute_header, v0, v1, "%{public}@> can't find device udid, not able to fetch alias", v2, v3, v4, v5, v6);
}

void sub_100034B9C()
{
  sub_1000062F0();
  sub_10000EDA4((void *)&_mh_execute_header, v0, v1, "%{public}@> device udid is not a string", v2, v3, v4, v5, v6);
}

void sub_100034C04(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  sub_10000ED04();
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100034CDC()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> device alias is invalid", v2, v3, v4, v5, v6);
}

void sub_100034D44(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  uint64_t v5 = __error();
  strerror(*v5);
  sub_10000EDF0();
  _os_crash_msg();
  __break(1u);
}

void sub_100034E1C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> Unexpected or missing entitlement in service definition", v2, v3, v4, v5, v6);
}

void sub_100034E84()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Unexpected properties type in service description.", v2, v3, v4, v5, v6);
}

void sub_100034EB8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Unexpected port type in service description.", v2, v3, v4, v5, v6);
}

void sub_100034EEC(void *a1, _OWORD *a2)
{
}

void sub_100034F58(void *a1, _OWORD *a2)
{
}

void sub_100034FC4(void *a1, _OWORD *a2)
{
}

void sub_100035030(void *a1, _OWORD *a2)
{
}

void sub_10003509C(void *a1, _OWORD *a2)
{
}

void sub_100035108(uint64_t a1, void *a2, const void *a3)
{
  id v4 = a2;
  CFGetTypeID(a3);
  sub_10000ED54((void *)&_mh_execute_header, v5, v6, "Cannot convert key \"%s\", unsupported type: %lu", v7, v8, v9, v10, 2u);
}

void sub_1000351AC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = a2;
  nw_endpoint_type_t type = xpc_get_type(a3);
  int v8 = 136315394;
  uint64_t v9 = v4;
  __int16 v10 = 2080;
  uint64_t name = xpc_type_get_name(type);
  sub_10000ED8C((void *)&_mh_execute_header, v5, v7, "RemoteService definition '%s' has \t\t\t\t\t\tinvliad LimitExposedToDeviceType item type '%s'", (uint8_t *)&v8);
}

void sub_10003525C(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to fetch InDiagnosticsMode status, error %d", (uint8_t *)v3, 8u);
}

void sub_1000352D8(void *a1)
{
  if (a1)
  {
    id v1 = [a1 description];
    [v1 UTF8String];
  }
  sub_1000062F0();
  sub_10000EDD0((void *)&_mh_execute_header, v3, v4, "failed to load RestoreVersion.plist: %{public}s", v5, v6, v7, v8, v9);
  if (a1) {
}
  }

void sub_100035388()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to retrieve RestoreLongVersion from RestoreVersion dict", v2, v3, v4, v5, v6);
}

void sub_1000353BC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to unparse current bridge version", v2, v3, v4, v5, v6);
}

void sub_1000353F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035468(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000354E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035558(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000355D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035648(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000356C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035738(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000357B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035828(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000358A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035918(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035990(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035A08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035A80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035AF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035B70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035BE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035C60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035CD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035D50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035DC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035E40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035EB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035F30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100035FA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036020(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036110(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036200(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036278(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000362F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036368(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000363E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036458(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000364D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036548(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000365C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036638(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000366B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100036728(void *a1, _OWORD *a2)
{
}

void sub_100036798(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003684C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_1000036BC();
  _os_crash_msg();
  __break(1u);
}

void sub_1000368E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "invalid sntp response payload size", v1, 2u);
}

void sub_100036928(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "clock_settime: %{errno}d", (uint8_t *)v3, 8u);
}

void sub_1000369B8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ntp_adjtime returned error: %d", (uint8_t *)v2, 8u);
}

void sub_100036A30(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "sntp exchange failed: %d", (uint8_t *)v2, 8u);
}

void sub_100036AA8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "invalid sntp response payload", v1, 2u);
}

void sub_100036AEC(void *a1, _OWORD *a2)
{
}

void sub_100036B7C(void *a1, _OWORD *a2)
{
}

void sub_100036C0C(void *a1, _OWORD *a2)
{
}

void sub_100036C9C(void *a1, _OWORD *a2)
{
}

void sub_100036D2C(void *a1, _OWORD *a2)
{
}

void sub_100036DBC(void *a1, _OWORD *a2)
{
}

void sub_100036E64(unsigned char *a1, unsigned char *a2)
{
  sub_100011AF0(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Ignore NCM interface for display backend", v3, 2u);
}

void sub_100036E9C(unsigned char *a1, unsigned char *a2)
{
  sub_100011AF0(a1, a2);
  sub_100011B00((void *)&_mh_execute_header, v2, v3, "Unsupported interface", v4);
}

void sub_100036EC8(unsigned char *a1, unsigned char *a2)
{
  sub_100011AF0(a1, a2);
  sub_100011B00((void *)&_mh_execute_header, v2, v3, "Interface gone before inspection", v4);
}

void sub_100036EF4(unsigned char *a1, unsigned char *a2)
{
  sub_100011AF0(a1, a2);
  sub_100011B00((void *)&_mh_execute_header, v2, v3, "Service entry gone during inspection", v4);
}

void sub_100036F20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to extract USB Serial Number", v1, 2u);
}

void sub_100036F64(void *a1, _OWORD *a2)
{
}

void sub_100036FF8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@> Connection timeout, retrying", (uint8_t *)&v3, 0xCu);
}

void sub_100037074(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100006318((void *)&_mh_execute_header, a2, a3, "%{public}@> network_connect_in6: %{errno}d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_1000370EC(void *a1, _OWORD *a2)
{
}

void sub_100037160(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create bonjour connection parameters", v1, 2u);
}

void sub_1000371A4(void *a1, _OWORD *a2)
{
}

void sub_100037218(void *a1, _OWORD *a2)
{
}

void sub_10003728C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100006318((void *)&_mh_execute_header, a2, a3, "%{public}@> ncm failed to connect with %{errno}d", *(void *)v3, *(void *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_100037308(void *a1, _OWORD *a2)
{
}

void sub_10003739C(void *a1, _OWORD *a2)
{
}

void sub_100037410()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find IOLinkStatus property", v2, v3, v4, v5, v6);
}

void sub_100037444()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find BSD Name property", v2, v3, v4, v5, v6);
}

void sub_100037478()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find USB Serial Number property", v2, v3, v4, v5, v6);
}

void sub_1000374AC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find locationID property", v2, v3, v4, v5, v6);
}

void sub_1000374E0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find NetworkInterfaceFlags property", v2, v3, v4, v5, v6);
}

void sub_100037514()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find idProduct property", v2, v3, v4, v5, v6);
}

void sub_100037548()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find HostState property", v2, v3, v4, v5, v6);
}

void sub_10003757C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to find IOMACAddress property", v2, v3, v4, v5, v6);
}

void sub_1000375B0(void *a1, _OWORD *a2)
{
}

void sub_10003761C(void *a1, _OWORD *a2)
{
}

void sub_100037688(void *a1, _OWORD *a2)
{
}

void sub_1000376F4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "IOServiceAddMatchingNotification returned 0x%08x", (uint8_t *)v2, 8u);
}

void sub_10003776C(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "calling apply_io_iterator iterator: %d", (uint8_t *)v3, 8u);
}

void sub_1000377EC(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003789C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100037908(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateIterator: %d", (uint8_t *)v2, 8u);
}

void sub_100037980(void *a1, _OWORD *a2)
{
}

void sub_100037A10(void *a1, _OWORD *a2)
{
}

void sub_100037AA0(void *a1, _OWORD *a2)
{
}

void sub_100037B30(void *a1, _OWORD *a2)
{
}

void sub_100037BC0(void *a1, _OWORD *a2)
{
}

void sub_100037C50(void *a1, _OWORD *a2)
{
}

void sub_100037CF8(void *a1, _OWORD *a2)
{
}

void sub_100037D74(void *a1, _OWORD *a2)
{
}

void sub_100037DF0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100014940((void *)&_mh_execute_header, a2, a3, "%{public}@> received error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100037E6C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_100014940((void *)&_mh_execute_header, a2, a3, "%{public}@> nw_listener_state_failed: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100037EE8(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@> Unable to start remoted listener: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_100037F70(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003801C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create interface with index", v1, 2u);
}

void sub_100038060()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "failed to remove device on %{public}s: endpoint not found", v2, v3, v4, v5, v6);
}

void sub_1000380C8(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  sub_1000062F0();
  sub_10000EDD0((void *)&_mh_execute_header, v5, v6, "failed to create RSDNetworkInterface: %{public}@", v7, v8, v9, v10, v11);
}

void sub_10003815C(void *a1, _OWORD *a2)
{
}

void sub_1000381C8()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "failed to convert address to string: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_100038230(void *a1, _OWORD *a2)
{
}

void sub_10003829C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "failed to add device on %{public}s: endpoint already exists", v2, v3, v4, v5, v6);
}

void sub_100038304(void *a1, _OWORD *a2)
{
}

void sub_100038370()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "failed to init browser: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_1000383D8(void *a1, _OWORD *a2)
{
}

void sub_100038444()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "failed to listen on %{public}s: listener already exist", v2, v3, v4, v5, v6);
}

void sub_1000384AC()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "failed to cancel browse on %{public}s: browser not found", v2, v3, v4, v5, v6);
}

void sub_100038514(void *a1, _OWORD *a2)
{
}

void sub_100038580()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> failed to copy remote address, the connection may have broken", v2, v3, v4, v5, v6);
}

void sub_1000385E8()
{
  sub_100016EFC();
  sub_100006318((void *)&_mh_execute_header, v0, v1, "%{public}@> network_connect_in6: %{errno}d");
}

void sub_100038654()
{
  sub_100016EFC();
  sub_100006318((void *)&_mh_execute_header, v0, v1, "%{public}@> can't create bonjour parameters: %{darwin.errno}d");
}

void sub_1000386C0()
{
  sub_100016EFC();
  sub_100006318((void *)&_mh_execute_header, v0, v1, "%{public}@> ncm failed to connect with %{errno}d");
}

void sub_10003872C(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  uint64_t v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100038814()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "failed to send goodbye to peer: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003887C(void *a1, _OWORD *a2)
{
}

void sub_1000388E8(void *a1, _OWORD *a2)
{
}

void sub_100038954(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "existing device found, skipping creating", v1, 2u);
}

void sub_100038998(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "unexpected duplicate bonjour uuid", v1, 2u);
}

void sub_1000389DC(void *a1, _OWORD *a2)
{
}

void sub_100038A48()
{
}

void sub_100038A64(char a1, NSObject *a2)
{
  uint64_t v2 = "failed";
  if (a1) {
    uint64_t v2 = "succeeded";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "heartbeat %s", (uint8_t *)&v3, 0xCu);
}

void sub_100038AF4()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "received bonjour browser error: %@", v2, v3, v4, v5, v6);
}

void sub_100038B5C()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "unexpected bonjour browser state: %d", v2, v3, v4, v5, v6);
}

void sub_100038BC4()
{
  sub_1000062F0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "nw_browser_state_failed: %@", v1, 0xCu);
}

void sub_100038C38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038CA4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "failed to create RSDNetworkInterface: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100038D4C(void *a1, _OWORD *a2)
{
}

void sub_100038DB8()
{
  sub_1000183FC();
  sub_100018414((void *)&_mh_execute_header, v0, v1, "listener xor-ed device uuid: %{uuid_t}.16P", v2, v3, v4, v5, v6);
}

void sub_100038E30()
{
  sub_1000183FC();
  sub_100018414((void *)&_mh_execute_header, v0, v1, "listener boot session uuid: %{uuid_t}.16P", v2, v3, v4, v5, v6);
}

void sub_100038E9C(void *a1, _OWORD *a2)
{
}

void sub_100038F08()
{
  sub_1000183FC();
  sub_100018414((void *)&_mh_execute_header, v0, v1, "listener device uuid: %{uuid_t}.16P", v2, v3, v4, v5, v6);
}

void sub_100038F80(void *a1, _OWORD *a2)
{
}

void sub_100038FEC(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to listen on %{public}s: listener already exist", (uint8_t *)&v2, 0xCu);
}

void sub_100039064(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to cancel listen on %{public}s: listener not found", (uint8_t *)&v2, 0xCu);
}

void sub_1000390DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039148(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000391B4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create controller device", buf, 2u);
}

void sub_1000391F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create controller device", v1, 2u);
}

void sub_100039238(void *a1, _OWORD *a2)
{
}

void sub_1000392A4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Client is lack of entitlement", v2, v3, v4, v5, v6);
}

void sub_1000392D8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Compute platform message missing command", v2, v3, v4, v5, v6);
}

void sub_10003930C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: no interface name", v2, v3, v4, v5, v6);
}

void sub_100039340()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: no address", v2, v3, v4, v5, v6);
}

void sub_100039374()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: interface is not valid", v2, v3, v4, v5, v6);
}

void sub_1000393A8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Unexpected command", v2, v3, v4, v5, v6);
}

void sub_1000393DC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: no TLS requirement", v2, v3, v4, v5, v6);
}

void sub_100039410()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Boot arg '%{public}@' contains invalid TLS requirement", v2, v3, v4, v5, v6);
}

void sub_100039478()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Pref '%{public}@' contains invalid TLS requirement", v2, v3, v4, v5, v6);
}

void sub_1000394E0()
{
  sub_100004278();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Identity creation failed.", v1, 2u);
}

void sub_100039520()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to create ACL: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100039588()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to create keypair: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000395F0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create self-signed certificate.", v2, v3, v4, v5, v6);
}

void sub_100039624()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create identity.", v2, v3, v4, v5, v6);
}

void sub_100039658()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to wrap identity", v2, v3, v4, v5, v6);
}

void sub_10003968C()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "SecItemAdd failed with: %d", v2, v3, v4, v5, v6);
}

void sub_1000396F4()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to get chassis manifest with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003975C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "DCRT chain is unavailable: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000397C4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to attest key with DAK.", v2, v3, v4, v5, v6);
}

void sub_1000397F8()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to get DAK: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100039860()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to attest key with DAK: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000398C8()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to delete identity: %d", v2, v3, v4, v5, v6);
}

void sub_100039930()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate from identity: %d", v2, v3, v4, v5, v6);
}

void sub_100039998()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to copy identity: %d", v2, v3, v4, v5, v6);
}

void sub_100039A00()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to issue DCRT: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100039A68()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to issue DCRT after %d attempt(s)", v2, v3, v4, v5, v6);
}

void sub_100039AD0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate chain.", v2, v3, v4, v5, v6);
}

void sub_100039B04()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to get cert chain's leaf certificate.", v2, v3, v4, v5, v6);
}

void sub_100039B38()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to copy leaf certificate public key.", v2, v3, v4, v5, v6);
}

void sub_100039B6C()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to copy leaf certificate public key data with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100039BD4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "No DCRT chain present in peer TLS certificate.", v2, v3, v4, v5, v6);
}

void sub_100039C08()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to parse DCRT chain data.", v2, v3, v4, v5, v6);
}

void sub_100039C3C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "No DAK attestation present in peer TLS certificate.", v2, v3, v4, v5, v6);
}

void sub_100039C70()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to verify cnode peer with chassis manifest", v2, v3, v4, v5, v6);
}

void sub_100039CA4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to verify cctrl peer with chassis manifest", v2, v3, v4, v5, v6);
}

void sub_100039CD8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to verify DAK attestation", v2, v3, v4, v5, v6);
}

void sub_100039D0C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to verify DCRT cert chain", v2, v3, v4, v5, v6);
}

void sub_100039D40()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to parse DAK attestation with aks error: 0x%08x", v2, v3, v4, v5, v6);
}

void sub_100039DA8()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to parse certificate set: 0x%08x", v2, v3, v4, v5, v6);
}

void sub_100039E10()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to trust DCRT with either the SCRT or UCRT root CA.", v2, v3, v4, v5, v6);
}

void sub_100039E44()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "DCRT not trusted with the SCRT root CA.", v2, v3, v4, v5, v6);
}

void sub_100039E78()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to get DCRT leaf cert.", v2, v3, v4, v5, v6);
}

void sub_100039EAC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to extract public key from DCRT.", v2, v3, v4, v5, v6);
}

void sub_100039EE0()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to extract DCRT public key data with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100039F48()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "DAK-attested public key mismatches the public key of the peer's certificate.", v2, v3, v4, v5, v6);
}

void sub_100039F7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039FEC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create NSData", v2, v3, v4, v5, v6);
}

void sub_10003A020()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to extract pubkey param from attestation with error: %08x", v2, v3, v4, v5, v6);
}

void sub_10003A088()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to verify DAK attestation with aks error: 0x%08x", v2, v3, v4, v5, v6);
}

void sub_10003A0F0()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to get local chassis manifest with error: %{public}@. Will skip validating that peer is a cnode in the same chassis.", v2, v3, v4, v5, v6);
}

void sub_10003A158()
{
  sub_100004278();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Self failed to match the cctrl in the chassis manifest", v1, 2u);
}

void sub_10003A198()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to get own chipID and/or ECID", v2, v3, v4, v5, v6);
}

void sub_10003A1CC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Peer failed to authenticate as any compute node in the chassis", v2, v3, v4, v5, v6);
}

void sub_10003A200()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to extract hardware identifiers from peer's DAK attestation.", v2, v3, v4, v5, v6);
}

void sub_10003A234()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "No chassis manifest present in peer TLS certificate.", v2, v3, v4, v5, v6);
}

void sub_10003A268()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to validate chassis manifest from peer cert with error: %{public}@.", v2, v3, v4, v5, v6);
}

void sub_10003A2D0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Self failed to match any compute node in the chassis", v2, v3, v4, v5, v6);
}

void sub_10003A304()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Peer failed to authenticate as cctrl", v2, v3, v4, v5, v6);
}

void sub_10003A338()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to load BAA SCRT root CA cert data.", v2, v3, v4, v5, v6);
}

void sub_10003A36C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create system BAA trust policy.", v2, v3, v4, v5, v6);
}

void sub_10003A3A0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to parse BAA root CA cert.", v2, v3, v4, v5, v6);
}

void sub_10003A3D4()
{
  sub_10000ECF8(__stack_chk_guard);
  sub_10000ECEC();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Peer's DCRT failed trust evaluation with error: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003A43C()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to read trust result with status: %d", v2, v3, v4, v5, v6);
}

void sub_10003A4A4()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to set anchor cert: 0x%08x", v2, v3, v4, v5, v6);
}

void sub_10003A50C()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to create DCRT trust object: 0x%08x", v2, v3, v4, v5, v6);
}

void sub_10003A574()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to load BAA UCRT root CA cert data.", v2, v3, v4, v5, v6);
}

void sub_10003A5A8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create user BAA trust policy.", v2, v3, v4, v5, v6);
}

void sub_10003A5DC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create NSString from NSData", v2, v3, v4, v5, v6);
}

void sub_10003A610()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to split identity string into 4 components", v2, v3, v4, v5, v6);
}

void sub_10003A644(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectAtIndexedSubscript:1];
  sub_1000062F0();
  sub_10001D368((void *)&_mh_execute_header, v3, v5, "Failed to parse ecid: %{public}@", v6);
}

void sub_10003A6E4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectAtIndexedSubscript:0];
  sub_1000062F0();
  sub_10001D368((void *)&_mh_execute_header, v3, v5, "Failed to parse chipId: %{public}@", v6);
}

void sub_10003A784()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to extract identity param from attestation with error: %08x", v2, v3, v4, v5, v6);
}

void sub_10003A7EC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to read ChipID", v2, v3, v4, v5, v6);
}

void sub_10003A820()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to read UniqueChipID", v2, v3, v4, v5, v6);
}

void sub_10003A854()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to extract HW identifiers from cctrl UDID '%{public}@'", v2, v3, v4, v5, v6);
}

void sub_10003A8BC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Chassis manifest contained unexpected type for cctrl UDID", v2, v3, v4, v5, v6);
}

void sub_10003A8F0()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to split UDID string '%{public}@' into 2 components", v2, v3, v4, v5, v6);
}

void sub_10003A958(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectAtIndexedSubscript:1];
  sub_1000062F0();
  sub_10001D368((void *)&_mh_execute_header, v3, v5, "Failed to parse cnode Ecid: %{public}@", v6);
}

void sub_10003A9F8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 objectAtIndexedSubscript:0];
  sub_1000062F0();
  sub_10001D368((void *)&_mh_execute_header, v3, v5, "Failed to parse cnode ChipId: %{public}@", v6);
}

void sub_10003AA98()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "copy_socket_remote_address: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003AB00()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "@{public}@> invalid peer socket, not replacing", v2, v3, v4, v5, v6);
}

void sub_10003AB34(void *a1, _OWORD *a2)
{
}

void sub_10003ABA0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to enable bonjour due to invalid interface name", v2, v3, v4, v5, v6);
}

void sub_10003ABD4(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to find interface index for name %{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_10003AC4C(void *a1, _OWORD *a2)
{
}

void sub_10003ACD4()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "init_peer_listener: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003AD3C()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "network_copy_interface_address_in6: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003ADA4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to enable bonjour as it's already enabled", v2, v3, v4, v5, v6);
}

void sub_10003ADD8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "network peer isn't enabled, ignore disabling request", v2, v3, v4, v5, v6);
}

void sub_10003AE0C(void *a1, _OWORD *a2)
{
}

void sub_10003AE78()
{
  sub_100004278();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "disconnecting all devices", v1, 2u);
}

void sub_10003AEB8()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "network peer isn't enabled, ignore connection request", v2, v3, v4, v5, v6);
}

void sub_10003AEEC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to create client peer device from address", v2, v3, v4, v5, v6);
}

void sub_10003AF20()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "already has a peer with the same address, not connecting", v2, v3, v4, v5, v6);
}

void sub_10003AF54(void *a1, _OWORD *a2)
{
}

void sub_10003AFF0(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create server device", buf, 2u);
}

void sub_10003B030(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connect(fd: %d, ...) failed with %{darwin.errno}d\n", (uint8_t *)v4, 0xEu);
}

void sub_10003B0BC(void *a1, _OWORD *a2)
{
}

void sub_10003B128()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "network_init_socket_in6: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B190(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B1C8()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "socket(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B230()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "failed to set tcp options: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B298()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(IPV6_BOUND_IF) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

float sub_10003B300(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v4[0] = 67109888;
  v4[1] = 30;
  __int16 v5 = 1024;
  int v6 = 1;
  __int16 v7 = 1024;
  int v8 = 0;
  __int16 v9 = 1024;
  int v10 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "socket(domain: %d, type: %d, protocol: %d) ret: %d", (uint8_t *)v4, 0x1Au);
  return result;
}

void sub_10003B39C(void *a1, _OWORD *a2)
{
}

void sub_10003B408()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(SO_REUSEADDR) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B470()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "bind(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B4D8()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "listen(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B540()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "getsockname(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B5A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B5E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B64C(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "getifaddrs(2): %{errno}d", (uint8_t *)v3, 8u);
}

void sub_10003B6DC(void *a1, _OWORD *a2)
{
}

void sub_10003B748()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "getpeername: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B7B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B81C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003B888()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to accept peer socket: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B8F0()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "Failed to set tcp options on accepted peer socket: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003B958(void *a1, _OWORD *a2)
{
}

void sub_10003B9C4()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_KEEPINTVL) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003BA2C()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_KEEPCNT) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003BA94()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_KEEPALIVE) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003BAFC()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(SO_KEEPALIVE) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003BB64()
{
  sub_100016F30();
  sub_100016F14((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_CONNECTIONTIMEOUT) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_10003BBCC(void *a1, _OWORD *a2)
{
}

void sub_10003BC58()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Service message with missing or unexpected command", v2, v3, v4, v5, v6);
}

void sub_10003BC8C(void *a1, _OWORD *a2)
{
}

void sub_10003BD18()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus service request: client doesn't expect reply", v2, v3, v4, v5, v6);
}

void sub_10003BD4C()
{
  sub_1000062F0();
  sub_10000EDA4((void *)&_mh_execute_header, v0, v1, "%{public}@> Returning full properties set", v2, v3, v4, v5, v6);
}

void sub_10003BDB4(void *a1, _OWORD *a2)
{
}

void sub_10003BE20()
{
  sub_1000062F0();
  sub_10000EDA4((void *)&_mh_execute_header, v0, v1, "%{public}@> Returning only public properties", v2, v3, v4, v5, v6);
}

void sub_10003BE88()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Device message missing command", v2, v3, v4, v5, v6);
}

void sub_10003BEBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000253BC(a1, a2, a3, 4.8752e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Listing services on %{public}s (client=\"%s\")", v3, 0x16u);
}

void sub_10003BF04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000253BC(a1, a2, a3, 4.8752e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Listing local services exposed to %{public}s (client=\"%s\")", v3, 0x16u);
}

void sub_10003BF4C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "device_get_service: GET query with no name key", v2, v3, v4, v5, v6);
}

void sub_10003BF80()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "device_check_service: CHECK query with no name key", v2, v3, v4, v5, v6);
}

void sub_10003BFB4(void *a1, _OWORD *a2)
{
}

void sub_10003C040()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus request: doesn't contain alias", v2, v3, v4, v5, v6);
}

void sub_10003C074(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 type];
  remote_device_type_get_description();
  sub_1000062F0();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "device type %{public}s cannot be disconnected manually", v4, 0xCu);
}

void sub_10003C114()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "device_authenticate: No certificate data (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C17C()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "device_authenticate: Failed to create cert from data (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C1E4()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "device_authenticate: Failed to authenticate peer cert (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C24C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Device message with unexpected command", v2, v3, v4, v5, v6);
}

void sub_10003C280()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus device request: client doesn't expect reply", v2, v3, v4, v5, v6);
}

void sub_10003C2B4()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Unexpected message on browse connection - unregistering client browse.", v2, v3, v4, v5, v6);
}

void sub_10003C2E8(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = "with";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "without";
  }
  int v4 = 136446466;
  uint64_t v5 = v3;
  __int16 v6 = 2080;
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Sending device note %{public}s sensitive properties (client=\"%s\")", (uint8_t *)&v4, 0x16u);
}

void sub_10003C388()
{
  sub_1000062F0();
  sub_10000EDA4((void *)&_mh_execute_header, v0, v1, "Canceling client browse. (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C3F0(void *a1, _OWORD *a2)
{
}

void sub_10003C45C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Peer message missing command", v2, v3, v4, v5, v6);
}

void sub_10003C490(void *a1, _OWORD *a2)
{
}

void sub_10003C4FC()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Peer message with unexpected command", v2, v3, v4, v5, v6);
}

void sub_10003C530()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Bogus peer request: client doesn't expect reply", v2, v3, v4, v5, v6);
}

void sub_10003C564(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  [v2 name];
  sub_1000062F0();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%{public}s> Connect failed", v4, 0xCu);
}

void sub_10003C600(void *a1, _OWORD *a2)
{
}

void sub_10003C66C(void *a1, _OWORD *a2)
{
}

void sub_10003C6D8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to send goodbye to peer: %{darwin.errno}d", (uint8_t *)v2, 8u);
}

void sub_10003C750(char a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GET query with invalid criteria (trust:%d u:%d)", (uint8_t *)v3, 0xEu);
}

void sub_10003C7DC(void *a1, _OWORD *a2)
{
}

void sub_10003C848()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "No local identity available. (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C8B0()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to copy key attributes. (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C918()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to copy key data. (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C980()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate data. (client=\"%s\")", v2, v3, v4, v5, v6);
}

void sub_10003C9E8()
{
  sub_100025388();
  sub_100006318((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate from identity: %d (client=\"%s\")", v2, v3);
}

void sub_10003CA50()
{
  sub_100025388();
  sub_100006318((void *)&_mh_execute_header, v0, v1, "Failed to copy private key from identity: %d (client=\"%s\")", v2, v3);
}

void sub_10003CAB8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to start remoted listener: %{darwin.errno}d", (uint8_t *)v2, 8u);
}

void sub_10003CB30(void *a1, _OWORD *a2)
{
}

void sub_10003CBC4(void *a1, _OWORD *a2)
{
}

void sub_10003CC48(void *a1, _OWORD *a2)
{
}

void sub_10003CCCC(void *a1, _OWORD *a2)
{
}

void sub_10003CD50(void *a1, _OWORD *a2)
{
}

void sub_10003CDE4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "received error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003CE5C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "nw_listener_state_failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10003CED4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  int v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003CFB8(void *a1, _OWORD *a2)
{
}

void sub_10003D048(void *a1, _OWORD *a2)
{
}

void sub_10003D0D8(void *a1, _OWORD *a2)
{
}

void sub_10003D168(void *a1, _OWORD *a2)
{
}

void sub_10003D1F8(void *a1, _OWORD *a2)
{
}

void sub_10003D288(void *a1, _OWORD *a2)
{
}

void sub_10003D318(void *a1, _OWORD *a2)
{
}

void sub_10003D3A8(void *a1, _OWORD *a2)
{
}

void sub_10003D450(void *a1, _OWORD *a2)
{
}

void sub_10003D4CC(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@> Unable to start remoted listener: %{errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_10003D554(void *a1, _OWORD *a2)
{
}

void sub_10003D5D0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "extract_io_property_hoststate failed", v1, 2u);
}

void sub_10003D614(void *a1, _OWORD *a2)
{
}

void sub_10003D6A0(void *a1, _OWORD *a2)
{
}

void sub_10003D72C(void *a1, _OWORD *a2)
{
}

void sub_10003D7B8(void *a1, _OWORD *a2)
{
}

void sub_10003D844(void *a1, _OWORD *a2)
{
}

void sub_10003D8D0(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100011ACC();
  _os_crash_msg();
  __break(1u);
}

void sub_10003D980(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100011ACC();
  _os_crash_msg();
  __break(1u);
}

void sub_10003DA1C(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "failed to listen on %{public}s in publisher", (uint8_t *)&v2, 0xCu);
}

void sub_10003DA94(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unknown event name: %{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_10003DB0C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unknown event, skipping", v1, 2u);
}

void sub_10003DB50(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "failed to start browsing on %{public}s in publisher: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_10003DBD8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "unexpected return value %d for inet_pton", (uint8_t *)v2, 8u);
}

void sub_10003DC50(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The address cannot be parsed as a valid IPv6 address", v1, 2u);
}

void sub_10003DC94(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "inet_pton: %{darwin.errno}d", (uint8_t *)v2, 8u);
}

void sub_10003DD0C(void *a1, _OWORD *a2)
{
}

void sub_10003DD78(void *a1, _OWORD *a2)
{
}

void sub_10003DDE4(void *a1, _OWORD *a2)
{
}

void sub_10003DE50(void *a1, _OWORD *a2)
{
}

void sub_10003DEBC(void *a1, _OWORD *a2)
{
}

void sub_10003DF28(void *a1, _OWORD *a2)
{
}

void sub_10003DF94(void *a1, _OWORD *a2)
{
}

void sub_10003E000()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "Failed to create bonjour connection parameters", v2, v3, v4, v5, v6);
}

void sub_10003E034(void *a1, _OWORD *a2)
{
}

void sub_10003E0A0()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "Failed to create interface with index", v2, v3, v4, v5, v6);
}

void sub_10003E0D4()
{
  sub_1000062F0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}@> network_copy_interface_address_in6: %{darwin.errno}d", v2, 0x12u);
}

void sub_10003E158(void *a1, _OWORD *a2)
{
}

void sub_10003E1C4(void *a1, _OWORD *a2)
{
}

void sub_10003E230(uint64_t a1, NSObject *a2)
{
  int v2 = 136446466;
  __int16 v3 = "remotexpc-bonjour-enabled";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, " %{public}s wrong data length: %lu", (uint8_t *)&v2, 0x16u);
}

void sub_10003E2BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003E334()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "enable bonjour peer on %s failed after maximum retries", v2, v3, v4, v5, v6);
}

void sub_10003E39C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "bonjour peer not initialized on this platform, bailing", v2, v3, v4, v5, v6);
}

void sub_10003E3D0()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "failed to find interface index for name %s", v2, v3, v4, v5, v6);
}

void sub_10003E438(void *a1, _OWORD *a2)
{
}

void sub_10003E4A4(void *a1, _OWORD *a2)
{
}

void sub_10003E510(void *a1, _OWORD *a2)
{
}

void sub_10003E598(void *a1, _OWORD *a2)
{
}

void sub_10003E604(void *a1, _OWORD *a2)
{
}

void sub_10003E670(void *a1, _OWORD *a2)
{
}

void sub_10003E6DC(void *a1, _OWORD *a2)
{
}

void sub_10003E748(void *a1, _OWORD *a2)
{
}

void sub_10003E7B4(void *a1, _OWORD *a2)
{
}

void sub_10003E83C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "bonjour wasn't enabled, ignore disabling request", v2, v3, v4, v5, v6);
}

void sub_10003E870()
{
  sub_100004278();
  sub_10002CF04((void *)&_mh_execute_header, v0, v1, "removing all endpoint uuids", v2, v3, v4, v5, v6);
}

void sub_10003E8A4()
{
  sub_100004278();
  sub_10002CF04((void *)&_mh_execute_header, v0, v1, "disconnecting all devices", v2, v3, v4, v5, v6);
}

void sub_10003E8D8()
{
  sub_100004278();
  sub_10002CF04((void *)&_mh_execute_header, v0, v1, "cancelling listener", v2, v3, v4, v5, v6);
}

void sub_10003E90C()
{
  sub_100004278();
  sub_10002CF04((void *)&_mh_execute_header, v0, v1, "cancelling browser", v2, v3, v4, v5, v6);
}

void sub_10003E940()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to enable bonjour peer", v2, v3, v4, v5, v6);
}

void sub_10003E974(void *a1, _OWORD *a2)
{
}

void sub_10003E9E0(void *a1, _OWORD *a2)
{
}

void sub_10003EA4C()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to get matching service", v2, v3, v4, v5, v6);
}

void sub_10003EA80()
{
  sub_100004278();
  sub_10000425C((void *)&_mh_execute_header, v0, v1, "failed to extract bonjour interface name", v2, v3, v4, v5, v6);
}

void sub_10003EAB4(void *a1, _OWORD *a2)
{
}

void sub_10003EB20(void *a1, _OWORD *a2)
{
}

void sub_10003EB8C(void *a1, _OWORD *a2)
{
}

void sub_10003EBF8()
{
  sub_100004278();
  sub_10002CF04((void *)&_mh_execute_header, v0, v1, "existing device found, skipping creating", v2, v3, v4, v5, v6);
}

void sub_10003EC2C()
{
  sub_100004278();
  sub_1000062D4((void *)&_mh_execute_header, v0, v1, "unexpected duplicate bonjour uuid", v2, v3, v4, v5, v6);
}

void sub_10003EC60(void *a1, _OWORD *a2)
{
}

void sub_10003ECCC(void *a1, _OWORD *a2)
{
}

void sub_10003ED38()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "received bonjour browser error: %@", v2, v3, v4, v5, v6);
}

void sub_10003EDA0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unexpected bonjour browser state: %d", (uint8_t *)v2, 8u);
}

void sub_10003EE18()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "nw_browser_state_failed: %@", v2, v3, v4, v5, v6);
}

void sub_10003EE80(void *a1, _OWORD *a2)
{
}

void sub_10003EEEC()
{
}

void sub_10003EF08(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *long long buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "skip browsed loopback peer", buf, 2u);
}

void sub_10003EF48(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t description = nw_endpoint_get_description();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%{public}@> search endpoint: %s", (uint8_t *)&v4, 0x16u);
}

void sub_10003EFE8(void *a1, _OWORD *a2)
{
}

void sub_10003F054()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "received error: %@", v2, v3, v4, v5, v6);
}

void sub_10003F0BC()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "nw_listener_state_failed: %@", v2, v3, v4, v5, v6);
}

void sub_10003F124()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> xpc_remote_connection_copy_remote_endpoint failed. Connection may have broken", v2, v3, v4, v5, v6);
}

void sub_10003F18C(void *a1, _OWORD *a2)
{
}

void sub_10003F1F8()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> nw_endpoint_get_address failed", v2, v3, v4, v5, v6);
}

void sub_10003F260()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "%{public}@> cannot know remote inet6 before device is connected", v2, v3, v4, v5, v6);
}

void sub_10003F2C8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "IOServiceAddInterestNotification on ncm interface: 0x%x", (uint8_t *)v2, 8u);
}

void sub_10003F340(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "IOServiceAddInterestNotification match: nw_endpoint_type_t type = 0x%08x", (uint8_t *)v2, 8u);
}

void sub_10003F3B8(void *a1, _OWORD *a2)
{
}

void sub_10003F424()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "[%p] failed to copy interface MAC address", v2, v3, v4, v5, v6);
}

void sub_10003F48C(void *a1, _OWORD *a2)
{
}

void sub_10003F4F8()
{
  sub_1000062F0();
  sub_1000062FC((void *)&_mh_execute_header, v0, v1, "[%p] failed to copy interface name", v2, v3, v4, v5, v6);
}

void sub_10003F560()
{
  sub_1000062F0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[%p] addressing", v1, 0xCu);
}

void sub_10003F5D4()
{
}

void sub_10003F5F0(void *a1, _OWORD *a2)
{
}

void sub_10003F65C(uint64_t a1, void *a2, _OWORD *a3)
{
  *a2 = 0;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  sub_10000ED04();
  sub_1000036BC();
  sub_10000ED1C();
  __break(1u);
}

void sub_10003F6EC(uint64_t a1, void *a2, _OWORD *a3)
{
  *a2 = 0;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  sub_10000ED04();
  sub_1000036BC();
  sub_10000ED1C();
  __break(1u);
}

void sub_10003F77C()
{
}

void sub_10003F798()
{
  sub_1000062F0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[%p] Releasing", v1, 0xCu);
}

void sub_10003F80C(void *a1, _OWORD *a2)
{
}

void sub_10003F878(void *a1, _OWORD *a2)
{
}

void sub_10003F8E4(void *a1, _OWORD *a2)
{
}

void sub_10003F950(void *a1, _OWORD *a2)
{
}

void sub_10003F9BC(void *a1)
{
  id v1 = a1;
  __error();
  sub_10002FDAC();
  sub_10002FDC4((void *)&_mh_execute_header, v2, v3, "%{public}@> socket(2): %{errno}d", v4, v5, v6, v7, v8);
}

void sub_10003FA48(void *a1)
{
  id v1 = a1;
  __error();
  sub_10002FDAC();
  sub_10002FDC4((void *)&_mh_execute_header, v2, v3, "%{public}@> bind(2): %{errno}d", v4, v5, v6, v7, v8);
}

void sub_10003FAD4(void *a1)
{
  id v1 = a1;
  __error();
  sub_10002FDAC();
  sub_10002FDC4((void *)&_mh_execute_header, v2, v3, "%{public}@> listen(2): %{errno}d", v4, v5, v6, v7, v8);
}

void sub_10003FB60(void *a1)
{
  id v1 = a1;
  __error();
  sub_10002FDAC();
  sub_10002FDC4((void *)&_mh_execute_header, v2, v3, "%{public}@> getsockname(2): %{errno}d", v4, v5, v6, v7, v8);
}

void sub_10003FBEC(os_log_t log)
{
  int v1 = 138543362;
  uint64_t v2 = qword_10005BFF0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@> loopback is suspended, faking a failed connect", (uint8_t *)&v1, 0xCu);
}

void sub_10003FC70(void *a1)
{
  id v1 = a1;
  __error();
  sub_10002FDAC();
  sub_10002FDC4((void *)&_mh_execute_header, v2, v3, "%{public}@> fcntl(2): Failed to set O_NONBLOCK: %{errno}d", v4, v5, v6, v7, v8);
}

void sub_10003FCFC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  uint64_t v3 = qword_10005BFF0;
  __int16 v4 = 2082;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@> invalid port %{public}s", (uint8_t *)&v2, 0x16u);
}

void sub_10003FD88(void *a1)
{
  id v1 = a1;
  __error();
  sub_10002FDAC();
  sub_10002FDC4((void *)&_mh_execute_header, v2, v3, "%{public}@> connectx(2): %{errno}d", v4, v5, v6, v7, v8);
}

void sub_10003FE14(os_log_t log)
{
  int v1 = 138543362;
  uint64_t v2 = qword_10005BFF0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@> Received a message with no type", (uint8_t *)&v1, 0xCu);
}

void sub_10003FE98(void *a1, _OWORD *a2)
{
}

void sub_10003FF04(void *a1, _OWORD *a2)
{
}

uint64_t AMFDRSealingMapCopyDictFromCombinedData()
{
  return _AMFDRSealingMapCopyDictFromCombinedData();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return _AMFDRSealingMapCopyLocalDataForClass();
}

uint64_t AMFDRSealingMapCopyLocalDictForClass()
{
  return _AMFDRSealingMapCopyLocalDictForClass();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return _CFUUIDCreateFromString(alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return _IOObjectCopyClass(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFStringRef IORegistryEntryCopyPath(io_registry_entry_t entry, const io_name_t plane)
{
  return _IORegistryEntryCopyPath(entry, plane);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MAECopyDCRTWithOptions()
{
  return _MAECopyDCRTWithOptions();
}

uint64_t MAEIssueDCRTWithCompletion()
{
  return _MAEIssueDCRTWithCompletion();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return _SecAccessControlCreateWithFlags(allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecCertificateCopyExtensionValue()
{
  return _SecCertificateCopyExtensionValue();
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return _SecCertificateCopyKey(certificate);
}

uint64_t SecCertificateCreateWithBytes()
{
  return _SecCertificateCreateWithBytes();
}

uint64_t SecCertificateCreateWithPEM()
{
  return _SecCertificateCreateWithPEM();
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return _SecGenerateSelfSignedCertificate();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return _SecIdentityCopyCertificate(identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return _SecIdentityCopyPrivateKey(identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return _SecIdentityCreate();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return _SecKeyCopyAttributes(key);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return _SecKeyCopyPublicKey(key);
}

uint64_t SecKeyCopySystemKey()
{
  return _SecKeyCopySystemKey();
}

uint64_t SecKeyCreateAttestation()
{
  return _SecKeyCreateAttestation();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return _SecKeyCreateRandomKey(parameters, error);
}

uint64_t SecPolicyCreateAppleBasicAttestationSystem()
{
  return _SecPolicyCreateAppleBasicAttestationSystem();
}

uint64_t SecPolicyCreateAppleBasicAttestationUser()
{
  return _SecPolicyCreateAppleBasicAttestationUser();
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return _SecTrustCopyCertificateChain(trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustGetTrustResult(trust, result);
}

uint64_t SecTrustIsExpiredOnly()
{
  return _SecTrustIsExpiredOnly();
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return _SecTrustSetAnchorCertificates(trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return __CFPreferencesSetBackupDisabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __os_temporary_resource_shortage()
{
  return ___os_temporary_resource_shortage();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __udivti3()
{
  return ___udivti3();
}

uint64_t _dispatch_is_multithreaded()
{
  return __dispatch_is_multithreaded();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _xpc_dictionary_get_reply_msg_id()
{
  return __xpc_dictionary_get_reply_msg_id();
}

uint64_t _xpc_dictionary_set_remote_connection()
{
  return __xpc_dictionary_set_remote_connection();
}

uint64_t _xpc_dictionary_set_reply_msg_id()
{
  return __xpc_dictionary_set_reply_msg_id();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

uint64_t aks_attest_context_get()
{
  return _aks_attest_context_get();
}

uint64_t aks_attest_context_init()
{
  return _aks_attest_context_init();
}

uint64_t aks_attest_context_verify()
{
  return _aks_attest_context_verify();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

uint64_t bridge_version_copy_current_string()
{
  return _bridge_version_copy_current_string();
}

uint64_t ccder_blob_decode_bitstring()
{
  return _ccder_blob_decode_bitstring();
}

uint64_t ccder_blob_decode_tl()
{
  return _ccder_blob_decode_tl();
}

uint64_t ccder_blob_decode_uint64()
{
  return _ccder_blob_decode_uint64();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int clock_settime(clockid_t __clock_id, const timespec *__tp)
{
  return _clock_settime(__clock_id, __tp);
}

int close(int a1)
{
  return _close(a1);
}

uint64_t close_drop_optional_np()
{
  return _close_drop_optional_np();
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

int connectx(int a1, const sa_endpoints_t *a2, sae_associd_t a3, unsigned int a4, const iovec *a5, unsigned int a6, size_t *a7, sae_connid_t *a8)
{
  return _connectx(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return _dispatch_source_set_mandatory_cancel_handler();
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  return _getservbyname(a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

in_addr_t inet_addr(const char *a1)
{
  return _inet_addr(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

void *__cdecl lfind(const void *a1, const void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  return _lfind(a1, a2, a3, a4, a5);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

uint64_t memdup2_np()
{
  return _memdup2_np();
}

uint64_t mobileactivationErrorHasDomainAndErrorCode()
{
  return _mobileactivationErrorHasDomainAndErrorCode();
}

int ntp_adjtime(timex *a1)
{
  return _ntp_adjtime(a1);
}

nw_advertise_descriptor_t nw_advertise_descriptor_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return _nw_advertise_descriptor_create_bonjour_service(name, type, domain);
}

void nw_advertise_descriptor_set_no_auto_rename(nw_advertise_descriptor_t advertise_descriptor, BOOL no_auto_rename)
{
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return _nw_browse_descriptor_create_bonjour_service(type, domain);
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return _nw_browse_result_copy_endpoint(result);
}

void nw_browse_result_enumerate_interfaces(nw_browse_result_t result, nw_browse_result_enumerate_interface_t enumerator)
{
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return _nw_browse_result_get_changes(old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return _nw_browser_create(descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return _nw_connection_copy_current_path(connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return _nw_connection_create(endpoint, parameters);
}

uint64_t nw_endpoint_copy_interface()
{
  return _nw_endpoint_copy_interface();
}

uint64_t nw_endpoint_create_address_with_port()
{
  return _nw_endpoint_create_address_with_port();
}

nw_endpoint_t nw_endpoint_create_bonjour_service(const char *name, const char *type, const char *domain)
{
  return _nw_endpoint_create_bonjour_service(name, type, domain);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return _nw_endpoint_create_host_with_numeric_port();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_address(endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_bonjour_service_name(endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return _nw_endpoint_get_description();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

uint64_t nw_endpoint_set_interface()
{
  return _nw_endpoint_set_interface();
}

int nw_error_get_error_code(nw_error_t error)
{
  return _nw_error_get_error_code(error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return _nw_error_get_error_domain(error);
}

uint64_t nw_interface_create_with_index()
{
  return _nw_interface_create_with_index();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return _nw_interface_get_index(interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return _nw_interface_get_name(interface);
}

void nw_listener_cancel(nw_listener_t listener)
{
}

uint64_t nw_listener_copy_local_endpoint()
{
  return _nw_listener_copy_local_endpoint();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return _nw_listener_create(parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return _nw_listener_get_port(listener);
}

void nw_listener_set_advertise_descriptor(nw_listener_t listener, nw_advertise_descriptor_t advertise_descriptor)
{
}

void nw_listener_set_advertised_endpoint_changed_handler(nw_listener_t listener, nw_listener_advertised_endpoint_changed_handler_t handler)
{
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_interface_t nw_parameters_copy_required_interface(nw_parameters_t parameters)
{
  return _nw_parameters_copy_required_interface(parameters);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return _nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_indefinite()
{
  return _nw_parameters_set_indefinite();
}

void nw_parameters_set_local_only(nw_parameters_t parameters, BOOL local_only)
{
}

uint64_t nw_parameters_set_no_fallback()
{
  return _nw_parameters_set_no_fallback();
}

uint64_t nw_parameters_set_required_address_family()
{
  return _nw_parameters_set_required_address_family();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
}

nw_endpoint_t nw_path_copy_effective_remote_endpoint(nw_path_t path)
{
  return _nw_path_copy_effective_remote_endpoint(path);
}

uint64_t nw_path_copy_interface()
{
  return _nw_path_copy_interface();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

uint64_t os_assert_mach()
{
  return _os_assert_mach();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_parse_boot_arg_string()
{
  return _os_parse_boot_arg_string();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_is_darwinos()
{
  return _os_variant_is_darwinos();
}

uint64_t os_variant_is_recovery()
{
  return _os_variant_is_recovery();
}

uint64_t remote_device_browser_cancel()
{
  return _remote_device_browser_cancel();
}

uint64_t remote_device_copy_uuid()
{
  return _remote_device_copy_uuid();
}

uint64_t remote_device_get_name()
{
  return _remote_device_get_name();
}

uint64_t remote_device_get_type()
{
  return _remote_device_get_type();
}

uint64_t remote_device_set_connected_callback()
{
  return _remote_device_set_connected_callback();
}

uint64_t remote_device_set_disconnected_callback()
{
  return _remote_device_set_disconnected_callback();
}

uint64_t remote_device_start_browsing()
{
  return _remote_device_start_browsing();
}

uint64_t remote_device_start_browsing_matching()
{
  return _remote_device_start_browsing_matching();
}

uint64_t remote_device_timesync()
{
  return _remote_device_timesync();
}

uint64_t remote_device_type_get_description()
{
  return _remote_device_type_get_description();
}

uint64_t remote_device_type_is_trusted()
{
  return _remote_device_type_is_trusted();
}

uint64_t remote_device_type_parse()
{
  return _remote_device_type_parse();
}

uint64_t remote_socket_poll_connect_async()
{
  return _remote_socket_poll_connect_async();
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

SecIdentityRef sec_identity_copy_ref(sec_identity_t identity)
{
  return _sec_identity_copy_ref(identity);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return _sec_identity_create(identity);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return _sec_trust_copy_ref(trust);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

uint64_t wd_endpoint_activate()
{
  return _wd_endpoint_activate();
}

uint64_t wd_endpoint_add_queue()
{
  return _wd_endpoint_add_queue();
}

uint64_t wd_endpoint_register()
{
  return _wd_endpoint_register();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_clean_description()
{
  return _xpc_copy_clean_description();
}

uint64_t xpc_copy_debug_description()
{
  return _xpc_copy_debug_description();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return _xpc_data_get_bytes(xdata, buffer, off, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return _xpc_dictionary_expects_reply();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uuid(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

uint64_t xpc_get_event_name()
{
  return _xpc_get_event_name();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_cancel()
{
  return _xpc_remote_connection_cancel();
}

uint64_t xpc_remote_connection_copy_remote_endpoint()
{
  return _xpc_remote_connection_copy_remote_endpoint();
}

uint64_t xpc_remote_connection_create_configure_tls_block()
{
  return _xpc_remote_connection_create_configure_tls_block();
}

uint64_t xpc_remote_connection_create_connected_ipv6_pair()
{
  return _xpc_remote_connection_create_connected_ipv6_pair();
}

uint64_t xpc_remote_connection_create_with_connected_fd()
{
  return _xpc_remote_connection_create_with_connected_fd();
}

uint64_t xpc_remote_connection_create_with_nw_connection()
{
  return _xpc_remote_connection_create_with_nw_connection();
}

uint64_t xpc_remote_connection_get_failsafe_version_flags()
{
  return _xpc_remote_connection_get_failsafe_version_flags();
}

uint64_t xpc_remote_connection_get_version_flags()
{
  return _xpc_remote_connection_get_version_flags();
}

uint64_t xpc_remote_connection_send_message()
{
  return _xpc_remote_connection_send_message();
}

uint64_t xpc_remote_connection_send_message_with_reply()
{
  return _xpc_remote_connection_send_message_with_reply();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

uint64_t xpc_remote_connection_set_target_queue()
{
  return _xpc_remote_connection_set_target_queue();
}

uint64_t xpc_remote_connection_set_tls()
{
  return _xpc_remote_connection_set_tls();
}

uint64_t xpc_remote_connection_setup_nw_parameters()
{
  return _xpc_remote_connection_setup_nw_parameters();
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return _xpc_uuid_create(uuid);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__resetNow(void *a1, const char *a2, ...)
{
  return [a1 _resetNow];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attach(void *a1, const char *a2, ...)
{
  return [a1 attach];
}

id objc_msgSend_bonjourUUID(void *a1, const char *a2, ...)
{
  return [a1 bonjourUUID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_browser(void *a1, const char *a2, ...)
{
  return [a1 browser];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelBrowsing(void *a1, const char *a2, ...)
{
  return [a1 cancelBrowsing];
}

id objc_msgSend_cancelListener(void *a1, const char *a2, ...)
{
  return [a1 cancelListener];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return [a1 canceled];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectable(void *a1, const char *a2, ...)
{
  return [a1 connectable];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyClientDescription(void *a1, const char *a2, ...)
{
  return [a1 copyClientDescription];
}

id objc_msgSend_copyServiceDescription(void *a1, const char *a2, ...)
{
  return [a1 copyServiceDescription];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createBonjourListener(void *a1, const char *a2, ...)
{
  return [a1 createBonjourListener];
}

id objc_msgSend_createPortListener(void *a1, const char *a2, ...)
{
  return [a1 createPortListener];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_dontRestartBrowse(void *a1, const char *a2, ...)
{
  return [a1 dontRestartBrowse];
}

id objc_msgSend_drainPendedRequests(void *a1, const char *a2, ...)
{
  return [a1 drainPendedRequests];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return [a1 entitlement];
}

id objc_msgSend_eraseAll(void *a1, const char *a2, ...)
{
  return [a1 eraseAll];
}

id objc_msgSend_fetchDeviceAlias(void *a1, const char *a2, ...)
{
  return [a1 fetchDeviceAlias];
}

id objc_msgSend_getTcpOptions(void *a1, const char *a2, ...)
{
  return [a1 getTcpOptions];
}

id objc_msgSend_handleResetGoAhead(void *a1, const char *a2, ...)
{
  return [a1 handleResetGoAhead];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initWithGeneratedName(void *a1, const char *a2, ...)
{
  return [a1 initWithGeneratedName];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_isHost(void *a1, const char *a2, ...)
{
  return [a1 isHost];
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return [a1 isTrusted];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latestConnectError(void *a1, const char *a2, ...)
{
  return [a1 latestConnectError];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_migrateContentsOnDisk(void *a1, const char *a2, ...)
{
  return [a1 migrateContentsOnDisk];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsConnect(void *a1, const char *a2, ...)
{
  return [a1 needsConnect];
}

id objc_msgSend_negotiateTls(void *a1, const char *a2, ...)
{
  return [a1 negotiateTls];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_peerconn(void *a1, const char *a2, ...)
{
  return [a1 peerconn];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_prefDomain(void *a1, const char *a2, ...)
{
  return [a1 prefDomain];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_refreshServiceListeners(void *a1, const char *a2, ...)
{
  return [a1 refreshServiceListeners];
}

id objc_msgSend_remoteUUID(void *a1, const char *a2, ...)
{
  return [a1 remoteUUID];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_setupConnectionTimer(void *a1, const char *a2, ...)
{
  return [a1 setupConnectionTimer];
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return [a1 sha256];
}

id objc_msgSend_socket(void *a1, const char *a2, ...)
{
  return [a1 socket];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tlsEnabled(void *a1, const char *a2, ...)
{
  return [a1 tlsEnabled];
}

id objc_msgSend_tlsOidsPopulatedOnPeer(void *a1, const char *a2, ...)
{
  return [a1 tlsOidsPopulatedOnPeer];
}

id objc_msgSend_tlsOidsRequiredOfPeer(void *a1, const char *a2, ...)
{
  return [a1 tlsOidsRequiredOfPeer];
}

id objc_msgSend_tlsRequirement(void *a1, const char *a2, ...)
{
  return [a1 tlsRequirement];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_triggerNeedsConnect(void *a1, const char *a2, ...)
{
  return [a1 triggerNeedsConnect];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return [a1 uuidString];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}