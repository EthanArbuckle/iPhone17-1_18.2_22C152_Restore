id sub_100001B54(uint64_t a1, int a2)
{
  void *v3;
  uint64_t vars8;

  self;
  if (a2 - 1) <= 0xD && ((0x3FBBu >> (a2 - 1)))
  {
    v3 = objc_opt_class();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_100001BC0(os_unfair_lock_s *a1, void *a2)
{
  if (a1)
  {
    v3 = a1 + 2;
    id v4 = a2;
    os_unfair_lock_lock(v3);
    [objc_getProperty(a1, v5, 40, 1) addObject:v4];

    os_unfair_lock_unlock(v3);
  }
}

void sub_100001CA0(uint64_t a1, void *a2, int64_t a3, void *a4)
{
  xpc_object_t original = a2;
  id v6 = a4;
  self;
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  v8 = reply;
  if (reply)
  {
    xpc_dictionary_set_int64(reply, "result-code", a3);
    if (v6) {
      xpc_dictionary_set_value(v8, "result-data", v6);
    }
    xpc_dictionary_get_remote_connection(original);
    v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v9, v8);
  }
}

void sub_100001D64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v12 = v3;
    BOOL v4 = xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection;
    id v3 = v12;
    if (v4)
    {
      SEL v5 = *(void **)(a1 + 32);
      id v6 = v12;
      v7 = v6;
      if (v5)
      {
        uint64_t v14 = 0;
        v15 = &v14;
        uint64_t v16 = 0x3032000000;
        v17 = sub_100002BAC;
        v18 = sub_100002BBC;
        id v8 = v6;
        id v19 = v8;
        v10 = objc_getProperty(v5, v9, 24, 1);
        xpc_connection_set_target_queue((xpc_connection_t)v8, v10);

        v11 = (_xpc_connection_s *)v15[5];
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_100002128;
        handler[3] = &unk_100038EC0;
        handler[4] = v5;
        handler[5] = &v14;
        xpc_connection_set_event_handler(v11, handler);
        xpc_connection_resume((xpc_connection_t)v15[5]);
        _Block_object_dispose(&v14, 8);
      }
      id v3 = v12;
    }
  }
}

void sub_100001ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002128(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!v3 || xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    SEL v5 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      xpc_connection_cancel(v5);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = 0;
    }
    else
    {
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "XPC connection is nil when handling first message", (uint8_t *)buffer, 2u);
      }
    }
    goto LABEL_38;
  }
  unsigned int uint64 = xpc_dictionary_get_uint64(v4, "delegate-class-id");
  if (uint64)
  {
    v10 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, uint64);
    if (v10)
    {
      v11 = v10;
      if ([(objc_class *)v10 conformsToProtocol:&OBJC_PROTOCOL___NEHelperDelegate])
      {
        id v12 = [[v11 alloc] initWithFirstMessage:v4];
        if (v12)
        {
          v13 = v12;
          uint64_t v61 = 0;
          v62 = &v61;
          uint64_t v63 = 0x3032000000;
          v64 = sub_100002BAC;
          v65 = sub_100002BBC;
          unint64_t v14 = [NEHelperClient alloc];
          v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v16 = v15;
          id v57 = v13;
          if (v14)
          {
            v67.receiver = (id)v14;
            v67.super_class = (Class)NEHelperClient;
            v17 = (NEHelperClient *)[super init];
            unint64_t v14 = (unint64_t)v17;
            if (v17)
            {
              objc_storeStrong((id *)&v17->_connection, v15);
              objc_storeStrong((id *)(v14 + 32), v13);
              *(_DWORD *)(v14 + 8) = uint64;
              pid_t pid = xpc_connection_get_pid(v16);
              *(void *)(v14 + 16) = (32 * pid + uint64) ^ v14;
              int v19 = nelog_is_debug_logging_enabled() ^ 1;
              if (uint64 == 2) {
                LOBYTE(v19) = 0;
              }
              if ((v19 & 1) == 0)
              {
                long long v87 = 0u;
                long long v88 = 0u;
                long long v85 = 0u;
                long long v86 = 0u;
                long long v83 = 0u;
                long long v84 = 0u;
                long long v81 = 0u;
                long long v82 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                memset(buffer, 0, sizeof(buffer));
                proc_name(pid, buffer, 0x100u);
                v20 = ne_log_obj();
                v21 = v20;
                if (uint64 == 2)
                {
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v69 = buffer;
                    __int16 v70 = 1024;
                    LODWORD(v71) = pid;
                    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Processing new Settings client connection from client %s pid %d", buf, 0x12u);
                  }
                }
                else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  v54 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, uint64);
                  uint64_t v55 = NSStringFromClass(v54);
                  *(_DWORD *)buf = 138412802;
                  v69 = (_OWORD *)v55;
                  __int16 v70 = 2080;
                  v71 = buffer;
                  __int16 v72 = 1024;
                  pid_t v73 = pid;
                  v56 = (void *)v55;
                  _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Processing new client connection with class %@ from client %s pid %d", buf, 0x1Cu);
                }
              }
              *(void *)&buffer[0] = _NSConcreteStackBlock;
              *((void *)&buffer[0] + 1) = 3221225472;
              *(void *)&buffer[1] = sub_10000C908;
              *((void *)&buffer[1] + 1) = &unk_100039018;
              *(void *)&long long v75 = __PAIR64__(uint64, pid);
              if (qword_100042C70 != -1) {
                dispatch_once(&qword_100042C70, buffer);
              }
            }
          }

          id v66 = (id)v14;
          v39 = (void *)v62[5];
          if (v39)
          {
            sub_100001BC0(*(os_unfair_lock_s **)(a1 + 32), v39);
            id Property = (id)v62[5];
            if (Property) {
              id Property = objc_getProperty(Property, v40, 32, 1);
            }
            id v42 = Property;
            v43 = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_10000BE48;
            handler[3] = &unk_100038EC0;
            handler[4] = *(void *)(a1 + 32);
            handler[5] = &v61;
            xpc_connection_set_event_handler(v43, handler);
            v44 = ne_log_obj();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            {
              v47 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, uint64);
              NSStringFromClass(v47);
              id v48 = (id)objc_claimAutoreleasedReturnValue();
              pid_t v49 = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
              LODWORD(buffer[0]) = 138412546;
              *(void *)((char *)buffer + 4) = v48;
              WORD6(buffer[0]) = 1024;
              *(_DWORD *)((char *)buffer + 14) = v49;
              _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Start processing first message with class %@ from client pid %d", (uint8_t *)buffer, 0x12u);
            }
            if (v42)
            {
              if (objc_opt_respondsToSelector())
              {
                v45 = [v42 handlerQueue];
                id v58 = v42;
                id v59 = v4;
                xpc_dictionary_handoff_reply();
              }
              else
              {
                [v42 handleMessage:v4];
              }
            }
            else
            {
              sub_100001CA0((uint64_t)NEHelperServer, v4, 32, 0);
            }
            v46 = ne_log_obj();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              v50 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, uint64);
              NSStringFromClass(v50);
              id v51 = (id)objc_claimAutoreleasedReturnValue();
              pid_t v52 = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
              LODWORD(buffer[0]) = 138412546;
              *(void *)((char *)buffer + 4) = v51;
              WORD6(buffer[0]) = 1024;
              *(_DWORD *)((char *)buffer + 14) = v52;
              _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "End processing first message with class %@ from client pid %d", (uint8_t *)buffer, 0x12u);
            }
          }
          else
          {
            sub_100001CA0((uint64_t)NEHelperServer, v4, 1, 0);
            xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
          }
          _Block_object_dispose(&v61, 8);

          goto LABEL_38;
        }
        v30 = ne_log_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v53 = NSStringFromClass(v11);
          LODWORD(buffer[0]) = 138412290;
          *(void *)((char *)buffer + 4) = v53;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@ initWithConnection failed", (uint8_t *)buffer, 0xCu);
        }
      }
      else
      {
        v30 = ne_log_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v34 = NSStringFromClass(v11);
          LODWORD(buffer[0]) = 138412290;
          *(void *)((char *)buffer + 4) = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Received invalid class name \"%@\"", (uint8_t *)buffer, 0xCu);
        }
      }
      goto LABEL_35;
    }
    v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buffer[0]) = 67109120;
      DWORD1(buffer[0]) = uint64;
      v31 = "Received unknown class ID \"%d\"";
      v32 = v30;
      uint32_t v33 = 8;
LABEL_32:
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v31, (uint8_t *)buffer, v33);
      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (!xpc_dictionary_get_BOOL(v4, "init-command"))
  {
    v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer[0]) = 0;
      v31 = "Received invalid class ID";
      v32 = v30;
      uint32_t v33 = 2;
      goto LABEL_32;
    }
LABEL_35:

    v35 = ne_log_obj();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, uint64);
      v37 = NSStringFromClass(v36);
      pid_t v38 = xpc_connection_get_pid(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      LODWORD(buffer[0]) = 138412546;
      *(void *)((char *)buffer + 4) = v37;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to create a NEHelperClient with class %@ from client pid %d", (uint8_t *)buffer, 0x12u);
    }
    sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
    xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    goto LABEL_38;
  }
  v22 = *(void **)(a1 + 32);
  if (v22)
  {
    v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buffer[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Handling init command", (uint8_t *)buffer, 2u);
    }

    sub_10000C1DC();
    sub_10000C3C0(1);
    self;
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v25 = dispatch_queue_create("Initialize tracking domain info", v24);

    dispatch_async(v25, &stru_100038CC8);
    id v27 = objc_getProperty(v22, v26, 24, 1);
    self;
    v28 = +[NEConfigurationManager sharedManagerForAllUsers];
    *(void *)&buffer[0] = _NSConcreteStackBlock;
    *((void *)&buffer[0] + 1) = 3221225472;
    *(void *)&buffer[1] = sub_10001EF18;
    *((void *)&buffer[1] + 1) = &unk_100039848;
    *(void *)&long long v75 = v27;
    id v29 = v27;
    [v28 loadConfigurationsWithCompletionQueue:v29 handler:buffer];

    sub_10001F1D8((uint64_t)NEHelperConfigurationManager, 0);
  }
  sub_100001CA0((uint64_t)NEHelperServer, v4, 0, 0);
LABEL_38:
}

void sub_100002B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002BAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002BBC(uint64_t a1)
{
}

void sub_1000031F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
      goto LABEL_4;
    }
    uint64_t v43 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v110 = v43;
    __int16 v111 = 2112;
    id v112 = v6;
    v22 = "%@ loadConfigurationWithID failed. error: %@";
    v44 = v7;
    uint32_t v45 = 22;
LABEL_46:
    _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v22, buf, v45);
    goto LABEL_3;
  }
  id v8 = [v5 relay];

  if (!v8)
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v21 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v110 = v21;
    v22 = "%@ no relay found in configuration";
    goto LABEL_45;
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9 == 2)
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v23 = [v5 relay];
    v24 = [v23 relays];

    id v25 = [v24 countByEnumeratingWithState:&v88 objects:v101 count:16];
    if (v25)
    {
      id v26 = v25;
      id v87 = v5;
      char v27 = 0;
      uint64_t v28 = *(void *)v89;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v89 != v28) {
            objc_enumerationMutation(v24);
          }
          v30 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          v31 = [v30 certificateReferences];
          if (v31)
          {
            v32 = [v30 certificateReferences];
            unsigned __int8 v33 = [v32 containsObject:*(void *)(a1 + 48)];
          }
          else
          {
            unsigned __int8 v33 = 0;
          }

          v27 |= v33;
        }
        id v26 = [v24 countByEnumeratingWithState:&v88 objects:v101 count:16];
      }
      while (v26);

      id v5 = v87;
      if (v27)
      {
        v99[0] = kSecReturnRef;
        v99[1] = kSecClass;
        v100[0] = kCFBooleanTrue;
        v100[1] = kSecClassCertificate;
        v99[2] = kSecValuePersistentRef;
        v100[2] = *(void *)(a1 + 48);
        CFDictionaryRef v34 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:3];
        CFTypeRef result = 0;
        OSStatus v35 = SecItemCopyMatching(v34, &result);
        if (result)
        {
          CFDataRef v36 = SecCertificateCopyData((SecCertificateRef)result);
          CFTypeRef v93 = v36;
          myCFRelease();
          if (v36)
          {
            id v37 = (id)_CFXPCCreateXPCObjectFromCFObject();
            myCFRelease();
            xpc_object_t v38 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_value(v38, "relay-certificate-data", v37);
            sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 0, v38);

            goto LABEL_88;
          }
          v71 = ne_log_obj();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            uint64_t v82 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v110 = v82;
            _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%@ SecCertificateCopyData failed", buf, 0xCu);
          }

          id v57 = *(void **)(a1 + 40);
          int64_t v58 = 22;
        }
        else
        {
          v56 = ne_log_obj();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            uint64_t v80 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            uint64_t v110 = v80;
            __int16 v111 = 1024;
            LODWORD(v112) = v35;
            _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching failed %d", buf, 0x12u);
          }

          id v57 = *(void **)(a1 + 40);
          int64_t v58 = 2;
        }
        sub_100001CA0((uint64_t)NEHelperServer, v57, v58, 0);
LABEL_89:

        goto LABEL_4;
      }
    }
    else
    {
    }
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v46 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v110 = v46;
    v22 = "%@ requested certificate not found in relay configuration";
LABEL_45:
    v44 = v7;
    uint32_t v45 = 12;
    goto LABEL_46;
  }
  if (v9 != 1) {
    goto LABEL_4;
  }
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id v86 = v5;
  v10 = [v5 relay];
  v11 = [v10 relays];

  id v12 = [v11 countByEnumeratingWithState:&v95 objects:v108 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v96;
LABEL_10:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v96 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v95 + 1) + 8 * v15);
      uint64_t v17 = [v16 identityReference];
      if (v17)
      {
        v18 = (void *)v17;
        int v19 = [v16 identityReference];
        unsigned __int8 v20 = [v19 isEqualToData:*(void *)(a1 + 48)];

        if (v20) {
          break;
        }
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v95 objects:v108 count:16];
        if (v13) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
    CFDictionaryRef v34 = v16;

    if (!v34) {
      goto LABEL_38;
    }
    v39 = &selRef_knownNetworkInfoForLocalNetworkPromptWithOptions_;
    if (qword_100042AC8)
    {
      uint64_t v40 = [(id)qword_100042AC8 objectForKeyedSubscript:*(void *)(a1 + 48)];
      if (v40)
      {
        id v37 = (id)v40;
        int v41 = 0;
        id v5 = v86;
        goto LABEL_61;
      }
    }
    v47 = [(__CFDictionary *)v34 identity];
    unsigned __int8 v48 = [v47 isModernSystem];

    if ((v48 & 1) == 0)
    {
      v106[0] = kSecReturnRef;
      v106[1] = kSecClass;
      v107[0] = kCFBooleanTrue;
      v107[1] = kSecClassIdentity;
      v106[2] = kSecValuePersistentRef;
      v107[2] = *(void *)(a1 + 48);
      id v37 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:3];
      CFTypeRef v93 = 0;
      OSStatus v59 = SecItemCopyMatching((CFDictionaryRef)v37, &v93);
      uint64_t v55 = v93;
      id v5 = v86;
      if (!v93)
      {
        OSStatus v74 = v59;
        long long v75 = ne_log_obj();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          uint64_t v84 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v110 = v84;
          __int16 v111 = 1024;
          LODWORD(v112) = v74;
          _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching for identity failed %d", buf, 0x12u);
        }

        v69 = *(void **)(a1 + 40);
        int64_t v70 = 2;
        goto LABEL_80;
      }
      CFTypeRef result = v93;
      goto LABEL_57;
    }
    v104[0] = kSecReturnRef;
    v104[1] = kSecValuePersistentRef;
    uint64_t v49 = *(void *)(a1 + 48);
    v105[0] = kCFBooleanTrue;
    v105[1] = v49;
    v104[2] = kSecClass;
    v105[2] = kSecClassCertificate;
    id v37 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:3];
    CFTypeRef v93 = 0;
    OSStatus v50 = SecItemCopyMatching((CFDictionaryRef)v37, &v93);
    if (!v93)
    {
      OSStatus v72 = v50;
      pid_t v73 = ne_log_obj();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        uint64_t v83 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v110 = v83;
        __int16 v111 = 1024;
        LODWORD(v112) = v72;
        _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching for cert failed %d", buf, 0x12u);
      }

      sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
      id v5 = v86;
      goto LABEL_88;
    }
    v103[0] = kCFBooleanTrue;
    v102[0] = kSecReturnRef;
    v102[1] = kSecValuePersistentRef;
    id v51 = [(__CFDictionary *)v34 identity];
    pid_t v52 = [v51 keyPersistentReference];
    v102[2] = kSecClass;
    v103[1] = v52;
    v103[2] = kSecClassKey;
    CFDictionaryRef v53 = +[NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:3];

    CFTypeRef v92 = 0;
    OSStatus v54 = SecItemCopyMatching(v53, &v92);
    if (v92)
    {
      uint64_t v55 = (const void *)SecIdentityCreate();
      CFTypeRef result = v55;
      myCFRelease();
      myCFRelease();
      id v5 = v86;
      if (v55)
      {
        id v37 = v53;
        v39 = &selRef_knownNetworkInfoForLocalNetworkPromptWithOptions_;
LABEL_57:

        id v37 = [objc_alloc((Class)SecKeyProxy) initWithIdentity:v55];
        v60 = ne_log_obj();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Created new key proxy", buf, 2u);
        }

        myCFRelease();
        if (!v37)
        {
LABEL_67:
          v68 = ne_log_obj();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            uint64_t v81 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            uint64_t v110 = v81;
            _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%@ key proxy creation failed ", buf, 0xCu);
          }

          v69 = *(void **)(a1 + 40);
          int64_t v70 = 12;
LABEL_80:
          sub_100001CA0((uint64_t)NEHelperServer, v69, v70, 0);
          goto LABEL_88;
        }
        int v41 = 1;
LABEL_61:
        uint64_t v61 = [v37 endpoint];

        if (v61)
        {
          if (v41)
          {
            v62 = v39[345];
            if (!v62)
            {
              uint64_t v63 = (char *)objc_alloc_init((Class)NSMutableDictionary);
              v64 = v39[345];
              v39[345] = v63;

              v62 = v39[345];
            }
            [v62 setObject:v37 forKeyedSubscript:*(void *)(a1 + 48)];
          }
          v65 = [v37 endpoint];
          id v66 = [v65 _endpoint];

          xpc_object_t v67 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_value(v67, "relay-identity-xpc-endpoint", v66);
          sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 0, v67);

          goto LABEL_88;
        }
        goto LABEL_67;
      }
      long long v79 = ne_log_obj();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to create identity reference", buf, 2u);
      }

      sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
    }
    else
    {
      OSStatus v77 = v54;
      long long v78 = ne_log_obj();
      id v5 = v86;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        uint64_t v85 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v110 = v85;
        __int16 v111 = 1024;
        LODWORD(v112) = v77;
        _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%@ SecItemCopyMatching for key failed %d", buf, 0x12u);
      }

      sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
      myCFRelease();
    }
    id v37 = v53;
LABEL_88:

    goto LABEL_89;
  }
LABEL_17:

LABEL_38:
  id v42 = ne_log_obj();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    uint64_t v76 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v110 = v76;
    _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@ requested identity not found in relay configuration", buf, 0xCu);
  }

  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 2, 0);
  id v5 = v86;
LABEL_4:
}

void sub_100003E24(uint64_t a1)
{
  if (qword_100042AC8)
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    id v1 = *(id *)(a1 + 32);
    id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (v2)
    {
      id v3 = v2;
      uint64_t v4 = *(void *)v7;
      do
      {
        id v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v1);
          }
          [qword_100042AC8 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v6 + 1) + 8 * (void)v5)];
          id v5 = (char *)v5 + 1;
        }
        while (v3 != v5);
        id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }
  }
}

void sub_100004584(uint64_t a1, void *a2, char a3)
{
  id v4 = a2;
  uint64_t v5 = self;
  double v170 = 0.0;
  double v171 = 0.0;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_array)
  {
    long long v7 = (void *)qword_100042AD8;
    qword_100042AD8 = 0;

    long long v8 = (void *)qword_100042AE0;
    qword_100042AE0 = 0;

    qword_100042BF8 = 0;
    qword_100042C00 = 0;
    qword_100042AF0 = 0;
    char v6 = 1;
  }
  else
  {
    char v6 = 0;
  }
  if (!qword_100042AE0)
  {
    char v139 = a3;
    char v140 = v6;
    xpc_object_t v142 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t xarray = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    id v10 = v4;
    self;
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(applier[0]) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Adding Test domains to tracker list", (uint8_t *)applier, 2u);
    }

    if (v4 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v10))
    {
      *(void *)&applier[0] = _NSConcreteStackBlock;
      *((void *)&applier[0] + 1) = 3221225472;
      *(void *)&applier[1] = sub_100006460;
      *((void *)&applier[1] + 1) = &unk_100038CA8;
      *(void *)&applier[2] = v9;
      xpc_array_apply(v10, applier);
    }
    id v143 = v4;

    id v12 = v9;
    self;
    id v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Fetching Web tracking domain info from SWC", buf, 2u);
    }

    uint64_t v14 = +[_SWCTrackingDomainInfo trackingDomainInfoWithDomains:0];
    uint64_t v15 = v14;
    if (!v14 || ![v14 count])
    {
      uint64_t v43 = ne_log_obj();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "No Web tracker domain list", buf, 2u);
      }

      v44 = ne_log_obj();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      LOWORD(applier[0]) = 0;
      unsigned __int8 v48 = "Failed to retrieve tracker domain list for Web";
      goto LABEL_119;
    }
    uint64_t v16 = +[_SWCTrackingDomainInfo lastDatabaseUpdate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;

    int v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v15 count];
      uint64_t v21 = +[_SWCTrackingDomainInfo lastDatabaseUpdate];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Tracker domain info retrieved - count %lu (last update %@)", buf, 0x16u);
    }
    uint64_t v138 = v5;

    memset(out_token, 0, sizeof(out_token));
    id v22 = v15;
    id v23 = [v22 countByEnumeratingWithState:out_token objects:applier count:16];
    if (v23)
    {
      id v24 = v23;
      int v147 = 0;
      int xdict = 0;
      uint64_t v25 = **(void **)&out_token[4];
      uint64_t v154 = **(void **)&out_token[4];
      id obj = v22;
      do
      {
        id v26 = 0;
        id v151 = v24;
        do
        {
          if (**(void **)&out_token[4] != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*(void *)&out_token[2] + 8 * (void)v26);
          uint64_t v28 = [v22 objectForKeyedSubscript:v27];
          id v29 = [v28 source];
          if (v29)
          {
            v31 = [v12 objectForKeyedSubscript:v27];
            if (v31)
            {
              v30 = v31;
              v32 = v28;
              unsigned __int8 v33 = [v31 objectForKeyedSubscript:@"source"];
              CFDictionaryRef v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 unsignedIntValue] | 1);
              [v30 setObject:v34 forKeyedSubscript:@"source"];
            }
            else
            {
              OSStatus v35 = v12;
              v30 = objc_alloc_init((Class)NSMutableDictionary);
              CFDataRef v36 = [v28 ownerName];
              [v30 setObject:v36 forKeyedSubscript:@"owner"];

              id v37 = +[NSNumber numberWithUnsignedInteger:v29];
              [v30 setObject:v37 forKeyedSubscript:@"source"];

              id v38 = v28;
              if (qword_100042C10 != -1) {
                dispatch_once(&qword_100042C10, &stru_100038CE8);
              }
              v32 = v28;
              if (byte_100042C0C) {
                id v39 = [v38 canBlockRequest];
              }
              else {
                id v39 = 0;
              }

              uint64_t v40 = +[NSNumber numberWithBool:v39];
              [v30 setObject:v40 forKeyedSubscript:@"can-block-request"];

              id v12 = v35;
              [v35 setObject:v30 forKeyedSubscript:v27];
              id v24 = v151;
            }
            int v41 = ne_log_obj();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              id v42 = [v12 objectForKeyedSubscript:v27];
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&uint8_t buf[4] = ++xdict;
              id v24 = v151;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v27;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v29;
              *(_WORD *)&buf[28] = 2112;
              *(void *)&buf[30] = v42;
              _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%d: Adding Web domain <%@><%lu><%@>", buf, 0x26u);
            }
            uint64_t v28 = v32;

            uint64_t v25 = v154;
            id v22 = obj;
          }
          else
          {
            v30 = ne_log_obj();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&uint8_t buf[4] = ++v147;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v27;
              *(_WORD *)&buf[18] = 2048;
              *(void *)&buf[20] = v29;
              _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%d: Skipping non-Web domain <%@><0x%lX>", buf, 0x1Cu);
            }
          }

          id v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v22 countByEnumeratingWithState:out_token objects:applier count:16];
      }
      while (v24);
    }
    else
    {
      int v147 = 0;
      int xdict = 0;
    }

    uint32_t v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = xdict;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v147;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Added %d Web domains, skipped %d non-Web domains", buf, 0xEu);
    }

    uint64_t v46 = (const void *)NEResourcesCopyAppTrackingDomainsPath();
    id v4 = v143;
    if (!v46)
    {
      v44 = ne_log_obj();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        unsigned __int8 v48 = "No App tracker domain file found";
        goto LABEL_119;
      }
LABEL_43:

LABEL_44:

      goto LABEL_45;
    }
    if ((sub_100005E48(v138, v12, &v171, v46) & 1) == 0)
    {
      v44 = ne_log_obj();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        unsigned __int8 v48 = "Failed to retrieve tracker domain list for App";
        goto LABEL_119;
      }
      goto LABEL_43;
    }
    v47 = (const void *)NEResourcesCopyTestAppTrackingDomainsPath();
    if (v47)
    {
      if ((sub_100005E48(v138, v12, &v170, v47) & 1) == 0)
      {
        v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          LOWORD(applier[0]) = 0;
          unsigned __int8 v48 = "Failed to retrieve tracker test domain list for App";
LABEL_119:
          _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v48, (uint8_t *)applier, 2u);
          goto LABEL_43;
        }
        goto LABEL_43;
      }
    }
    else
    {
      uint64_t v49 = ne_log_obj();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LOWORD(applier[0]) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "No Test App tracker domain file found", (uint8_t *)applier, 2u);
      }
    }
    id v50 = v12;
    xpc_object_t xdicta = v142;
    id v155 = xarray;
    uint64_t v152 = self;
    id v51 = ne_log_obj();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      id v137 = [v50 count];
      LODWORD(applier[0]) = 134217984;
      *(void *)((char *)applier + 4) = v137;
      _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "Processing all domains <count %lu>", (uint8_t *)applier, 0xCu);
    }

    long long v185 = 0u;
    memset(buf, 0, sizeof(buf));
    id obja = v50;
    id v52 = [obja countByEnumeratingWithState:buf objects:out_token count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = **(void **)&buf[16];
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (**(void **)&buf[16] != v54) {
            objc_enumerationMutation(obja);
          }
          v56 = *(void **)(*(void *)&buf[8] + 8 * i);
          id v57 = [obja objectForKeyedSubscript:v56];
          int64_t v58 = [v57 objectForKeyedSubscript:@"owner"];
          OSStatus v59 = [v57 objectForKeyedSubscript:@"source"];
          v60 = (const char *)[v56 UTF8String];
          int v61 = strlen(v60);
          v62 = ne_log_obj();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            int v73 = [v59 unsignedIntValue] & 1;
            unsigned int v74 = [v59 unsignedIntValue];
            LODWORD(applier[0]) = 138413570;
            *(void *)((char *)applier + 4) = v152;
            WORD6(applier[0]) = 2080;
            *(void *)((char *)applier + 14) = v60;
            WORD3(applier[1]) = 1024;
            DWORD2(applier[1]) = v61;
            WORD6(applier[1]) = 2112;
            *(void *)((char *)&applier[1] + 14) = v58;
            WORD3(applier[2]) = 1024;
            DWORD2(applier[2]) = v73;
            WORD6(applier[2]) = 1024;
            *(_DWORD *)((char *)&applier[2] + 14) = (v74 >> 1) & 1;
            _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "%@ DDG domain %s <%d> : %@ web %u app %u", (uint8_t *)applier, 0x32u);
          }

          int v172 = 0;
          if (!ne_trie_has_high_ascii()) {
            goto LABEL_80;
          }
          uint64_t v63 = ne_log_obj();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(applier[0]) = 136315394;
            *(void *)((char *)applier + 4) = v60;
            WORD6(applier[0]) = 1024;
            *(_DWORD *)((char *)applier + 14) = v61;
            _os_log_debug_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "DDG domain - puny-coding %s <%d>", (uint8_t *)applier, 0x12u);
          }

          if (ne_tracker_validate_domain() && v172 >= 1 && v172 < 254)
          {
            *((unsigned char *)applier + v172) = 0;
            v64 = ne_log_obj();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v176 = 136315394;
              *(void *)&v176[4] = v60;
              __int16 v177 = 2080;
              v178 = applier;
              _os_log_debug_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "DDG domain - puny-coded %s -> %s", v176, 0x16u);
            }

            v60 = (const char *)applier;
LABEL_80:
            v65 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_string(v65, "owner", (const char *)[v58 UTF8String]);
            id v66 = [v57 objectForKeyedSubscript:@"can-block-request"];
            xpc_dictionary_set_BOOL(v65, "can-block-request", (BOOL)[v66 BOOLValue]);

            if ([v59 unsignedIntValue]) {
              xpc_dictionary_set_BOOL(v65, "is-web-list", 1);
            }
            if (([v59 unsignedIntValue] & 2) != 0) {
              xpc_dictionary_set_BOOL(v65, "is-app-list", 1);
            }
            xpc_dictionary_set_value(xdicta, v60, v65);
            self;
            if (v60 && (unsigned int v67 = strlen(v60), v67 - 254 >= 0xFFFFFF03))
            {
              uint64_t v69 = v67 - 1;
              int64_t v70 = byte_100042AF8;
              do
                *v70++ = v60[v69--];
              while (v69 != -1);
              v68 = byte_100042AF8;
              byte_100042AF8[v67] = 0;
            }
            else
            {
              v68 = 0;
            }
            id v71 = [objc_alloc((Class)NSString) initWithCString:v68 encoding:4];
            id v72 = [objc_alloc((Class)NSString) initWithCString:v60 encoding:4];
            [v155 setObject:v72 forKeyedSubscript:v71];

            goto LABEL_93;
          }
          v65 = ne_log_obj();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v176 = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to puny-code domain", v176, 2u);
          }
LABEL_93:
        }
        id v53 = [obja countByEnumeratingWithState:buf objects:out_token count:16];
      }
      while (v53);
    }

    long long v75 = v155;
    id v76 = objc_alloc_init((Class)NSMutableDictionary);
    id v77 = objc_alloc_init((Class)NSMutableDictionary);
    long long v78 = ne_log_obj();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      id v79 = [v155 count];
      LODWORD(applier[0]) = 134217984;
      *(void *)((char *)applier + 4) = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "Deriving unique prefixes for %lu tracker domains", (uint8_t *)applier, 0xCu);
    }

    long long v168 = 0u;
    long long v169 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    v144 = [v155 keyEnumerator];
    id v80 = [v144 countByEnumeratingWithState:&v166 objects:v175 count:16];
    v153 = v76;
    if (v80)
    {
      id v81 = v80;
      uint64_t v82 = 0;
      uint64_t v148 = 0;
      uint64_t xarraya = *(void *)v167;
      do
      {
        uint64_t v83 = 0;
        uint64_t v84 = v82;
        do
        {
          if (*(void *)v167 != xarraya) {
            objc_enumerationMutation(v144);
          }
          uint64_t v85 = *(void **)(*((void *)&v166 + 1) + 8 * (void)v83);
          uint64_t v82 = [v75 objectForKeyedSubscript:v85];

          id v86 = [v153 objectForKeyedSubscript:v82];

          if (!v86)
          {
            id v87 = [obja objectForKeyedSubscript:v82];
            long long v88 = [v87 objectForKeyedSubscript:@"owner"];
            id v89 = [v82 length];
            v148 += (uint64_t)[v88 length] + 2 * (void)v89 + 2;
            [v153 setObject:v82 forKeyedSubscript:v82];
          }
          long long v164 = 0u;
          long long v165 = 0u;
          long long v162 = 0u;
          long long v163 = 0u;
          long long v90 = [v75 keyEnumerator];
          id v91 = [v90 countByEnumeratingWithState:&v162 objects:v174 count:16];
          if (v91)
          {
            id v92 = v91;
            uint64_t v93 = *(void *)v163;
            do
            {
              for (j = 0; j != v92; j = (char *)j + 1)
              {
                if (*(void *)v163 != v93) {
                  objc_enumerationMutation(v90);
                }
                uint64_t v95 = *(void *)(*((void *)&v162 + 1) + 8 * (void)j);
                if (([v85 isEqual:v95] & 1) == 0)
                {
                  long long v96 = [v85 commonPrefixWithString:v95 options:2];
                  if ([v96 length]) {
                    [v77 setObject:v96 forKeyedSubscript:v96];
                  }
                }
              }
              id v92 = [v90 countByEnumeratingWithState:&v162 objects:v174 count:16];
            }
            while (v92);
          }

          uint64_t v83 = (char *)v83 + 1;
          uint64_t v84 = v82;
          long long v75 = v155;
        }
        while (v83 != v81);
        id v81 = [v144 countByEnumeratingWithState:&v166 objects:v175 count:16];
      }
      while (v81);

      uint64_t v97 = v148;
      id v76 = v153;
    }
    else
    {
      uint64_t v97 = 0;
    }

    if (![v77 count] && objc_msgSend(v75, "count") == (id)1)
    {
      long long v98 = [v75 allKeys];
      v99 = [v98 objectAtIndexedSubscript:0];

      [v77 setObject:v99 forKeyedSubscript:v99];
    }
    v100 = ne_log_obj();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      id v101 = [v77 count];
      id v102 = [v75 count];
      LODWORD(applier[0]) = 134218240;
      *(void *)((char *)applier + 4) = v101;
      WORD6(applier[0]) = 2048;
      *(void *)((char *)applier + 14) = v102;
      _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Derived %lu unique prefixes for %lu tracker domains", (uint8_t *)applier, 0x16u);
    }

    xpc_object_t xarray = xpc_array_create(0, 0);
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v103 = [v76 keyEnumerator];
    id v104 = [v103 countByEnumeratingWithState:&v158 objects:v173 count:16];
    if (v104)
    {
      id v105 = v104;
      uint64_t v106 = *(void *)v159;
      do
      {
        for (k = 0; k != v105; k = (char *)k + 1)
        {
          if (*(void *)v159 != v106) {
            objc_enumerationMutation(v103);
          }
          v108 = [*(id *)(*((void *)&v158 + 1) + 8 * (void)k) lowercaseString];
          xpc_object_t v109 = xpc_string_create((const char *)[v108 UTF8String]);
          xpc_array_append_value(xarray, v109);
        }
        id v105 = [v103 countByEnumeratingWithState:&v158 objects:v173 count:16];
      }
      while (v105);
    }

    if ((v139 & 1) == 0)
    {
      objc_storeStrong((id *)&qword_100042AD8, v142);
      objc_storeStrong((id *)&qword_100042AE0, xarray);
      qword_100042BF8 = (uint64_t)[v77 count];
      qword_100042C00 = v97;
    }
    double v110 = v170;
    double v111 = v171;
    if (v171 <= v170) {
      *(double *)&uint64_t v112 = v170;
    }
    else {
      *(double *)&uint64_t v112 = v171;
    }
    if (v18 > v171) {
      *(double *)&uint64_t v112 = v18;
    }
    qword_100042AF0 = v112;
    v113 = ne_log_obj();
    id v4 = v143;
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(applier[0]) = 134218752;
      *(void *)((char *)applier + 4) = qword_100042AF0;
      WORD6(applier[0]) = 2048;
      *(double *)((char *)applier + 14) = v18;
      WORD3(applier[1]) = 2048;
      *((double *)&applier[1] + 1) = v111;
      LOWORD(applier[2]) = 2048;
      *(double *)((char *)&applier[2] + 2) = v110;
      _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "Domain list g_lastUpdateTimeInterval %f <lastUpdateTimeInterval %f lastUpdateTimeIntervalApp %f lastUpdateTimeIntervalAppTest %f>", (uint8_t *)applier, 0x2Au);
    }

    *(void *)v176 = 0;
    if ((v140 & 1) == 0)
    {
      int v114 = open("/private/var/db/com.apple.networkextension.tracker-info", 0);
      if (v114 < 0)
      {
        v122 = ne_log_obj();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          v123 = __error();
          v124 = strerror(*v123);
          LODWORD(applier[0]) = 136315650;
          *(void *)((char *)applier + 4) = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
          WORD6(applier[0]) = 2080;
          *(void *)((char *)applier + 14) = "/private/var/db/com.apple.networkextension.tracker-info";
          WORD3(applier[1]) = 2080;
          *((void *)&applier[1] + 1) = v124;
          _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "%s: failed to open mmap file %s: %s", (uint8_t *)applier, 0x20u);
        }
      }
      else
      {
        int v115 = v114;
        memset(applier, 0, 112);
        int v116 = ne_trie_init_from_file();
        int v117 = v116;
        BOOL v119 = *(double *)v176 != *(double *)&qword_100042AF0 || v116 == 0;
        v120 = ne_log_obj();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
        {
          out_token[0] = 136316674;
          *(void *)&out_token[1] = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
          LOWORD(out_token[3]) = 2080;
          *(void *)((char *)&out_token[3] + 2) = "/private/var/db/com.apple.networkextension.tracker-info";
          HIWORD(out_token[5]) = 1024;
          out_token[6] = v115;
          LOWORD(out_token[7]) = 1024;
          *(int *)((char *)&out_token[7] + 2) = v117 != 0;
          HIWORD(out_token[8]) = 2048;
          *(void *)&out_token[9] = *(void *)v176;
          LOWORD(out_token[11]) = 2048;
          *(void *)((char *)&out_token[11] + 2) = qword_100042AF0;
          HIWORD(out_token[13]) = 1024;
          out_token[14] = v119;
          _os_log_debug_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "%s: opened mmap file %s <fd %d> trie_ok %d file timestamp %f g_lastUpdateTimeInterval %f do_rebuild %d", (uint8_t *)out_token, 0x3Cu);
        }

        if (v117) {
          ne_trie_free();
        }
        close(v115);
        id v4 = v143;
        if (!v119)
        {
          v121 = ne_log_obj();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(applier[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_DEFAULT, "No need to re-build the tracker domain trie", (uint8_t *)applier, 2u);
          }

LABEL_170:
          self;
          int v132 = dword_100042A00;
          if (dword_100042A00 != -1) {
            goto LABEL_177;
          }
          out_token[0] = -1;
          if (notify_register_check("com.apple.nehelper.tracker-info-ready", out_token))
          {
            v133 = ne_log_obj();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
            {
              LODWORD(applier[0]) = 136315138;
              *(void *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
              _os_log_error_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification", (uint8_t *)applier, 0xCu);
            }

            int v132 = dword_100042A00;
          }
          else
          {
            int v132 = out_token[0];
            dword_100042A00 = out_token[0];
          }
          if (v132 != -1)
          {
LABEL_177:
            uint32_t v134 = notify_set_state(v132, (unint64_t)*(double *)&qword_100042AF0);
            if (v134)
            {
              uint32_t v135 = v134;
              v136 = ne_log_obj();
              if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
              {
                LODWORD(applier[0]) = 136315394;
                *(void *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
                WORD6(applier[0]) = 1024;
                *(_DWORD *)((char *)applier + 14) = v135;
                _os_log_error_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "Failed to set the state for the %s notification (status %d)", (uint8_t *)applier, 0x12u);
              }
            }
            else
            {
              notify_post("com.apple.nehelper.tracker-info-ready");
              v136 = ne_log_obj();
              if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(applier[0]) = 136315138;
                *(void *)((char *)applier + 4) = "com.apple.nehelper.tracker-info-ready";
                _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_DEFAULT, "Posted to %s", (uint8_t *)applier, 0xCu);
              }
            }
          }
          goto LABEL_44;
        }
      }
    }
    int v125 = open("/private/var/db/com.apple.networkextension.tracker-info.temp", 518, 420);
    if (v125 >= 1)
    {
      int v126 = v125;
      long long v183 = 0u;
      long long v182 = 0u;
      long long v181 = 0u;
      memset(out_token, 0, sizeof(out_token));
      v127 = ne_log_obj();
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(applier[0]) = 136315906;
        *(void *)((char *)applier + 4) = "+[NEHelperTrackerManager fetchTrackerDomainList:isInit:]";
        WORD6(applier[0]) = 2080;
        *(void *)((char *)applier + 14) = "/private/var/db/com.apple.networkextension.tracker-info.temp";
        WORD3(applier[1]) = 2048;
        *((void *)&applier[1] + 1) = (unint64_t)*(double *)v176;
        LOWORD(applier[2]) = 2048;
        *(void *)((char *)&applier[2] + 2) = (unint64_t)*(double *)&qword_100042AF0;
        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "%s: Created new mmap file %s (old ts %llu new ts %llu)", (uint8_t *)applier, 0x2Au);
      }

      [v77 count];
      ne_tracker_build_trie();
      ne_trie_free();
      close(v126);
      rename((const std::__fs::filesystem::path *)"/private/var/db/com.apple.networkextension.tracker-info.temp", (const std::__fs::filesystem::path *)"/private/var/db/com.apple.networkextension.tracker-info", v128);
      if (v129 < 0)
      {
        int v130 = *__error();
        if (strerror_r(v130, (char *)applier, 0x80uLL)) {
          LOBYTE(applier[0]) = 0;
        }
        v131 = ne_log_obj();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "/private/var/db/com.apple.networkextension.tracker-info.temp";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "/private/var/db/com.apple.networkextension.tracker-info";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = v130;
          *(_WORD *)&buf[28] = 2080;
          *(void *)&buf[30] = applier;
          _os_log_fault_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_FAULT, "Failed to move %s to %s: [%d] %s", buf, 0x26u);
        }

        id v4 = v143;
      }
    }
    goto LABEL_170;
  }
LABEL_45:
}

uint64_t sub_100005E48(uint64_t a1, void *a2, void *a3, const void *a4)
{
  id v44 = a2;
  self;
  char v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)id v50 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Fetching from App domain file url %@", buf, 0xCu);
  }

  long long v7 = +[NSFileManager defaultManager];
  long long v8 = [v7 attributesOfItemAtPath:a4 error:0];

  id v9 = +[NSData dataWithContentsOfFile:a4];
  CFRelease(a4);
  if (v8 && v9 && [v9 length])
  {
    id v10 = [v8 objectForKey:NSFileCreationDate];
    v11 = v10;
    if (v10)
    {
      [v10 timeIntervalSinceReferenceDate];
      *a3 = v12;
      id v13 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:0];
      uint64_t v14 = ne_log_obj();
      uint64_t v15 = v14;
      if (v13)
      {
        id v38 = v9;
        id v39 = v8;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v13 count];
          *(_DWORD *)buf = 134218242;
          *(void *)id v50 = v16;
          *(_WORD *)&v50[8] = 2112;
          *(void *)&v50[10] = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetched App domain list <count %lu, %@>", buf, 0x16u);
        }
        id v37 = v11;

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        double v17 = v13;
        id v18 = [v17 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v41 = 0;
          uint64_t v20 = *(void *)v46;
          CFStringRef v21 = @"s";
          id v42 = v17;
          do
          {
            id v22 = 0;
            id v43 = v19;
            do
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v22);
              id v24 = [v17 objectForKeyedSubscript:v23];
              uint64_t v25 = [v24 objectForKeyedSubscript:v21];
              if (([v25 unsignedIntValue] & 2) != 0)
              {
                uint64_t v27 = v20;
                CFStringRef v28 = v21;
                id v29 = [v44 objectForKeyedSubscript:v23];
                if (v29)
                {
                  id v26 = v29;
                  v30 = [v29 objectForKeyedSubscript:@"source"];
                  v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v30 unsignedIntValue] | 2);
                  [v26 setObject:v31 forKeyedSubscript:@"source"];
                }
                else
                {
                  id v26 = objc_alloc_init((Class)NSMutableDictionary);
                  v32 = [v24 objectForKeyedSubscript:@"n"];
                  [v26 setObject:v32 forKeyedSubscript:@"owner"];

                  [v26 setObject:v25 forKeyedSubscript:@"source"];
                  [v44 setObject:v26 forKeyedSubscript:v23];
                }
                unsigned __int8 v33 = ne_log_obj();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                {
                  unsigned int v40 = [v25 unsignedIntValue];
                  CFDictionaryRef v34 = [v44 objectForKeyedSubscript:v23];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)id v50 = ++HIDWORD(v41);
                  *(_WORD *)&v50[4] = 2112;
                  *(void *)&v50[6] = v23;
                  *(_WORD *)&v50[14] = 1024;
                  *(_DWORD *)&v50[16] = v40;
                  *(_WORD *)&v50[20] = 2112;
                  *(void *)&v50[22] = v34;
                  _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%d: Adding App domain <%@><%u><%@>", buf, 0x22u);
                }
                CFStringRef v21 = v28;
                uint64_t v20 = v27;
                double v17 = v42;
                id v19 = v43;
              }
              else
              {
                id v26 = ne_log_obj();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109634;
                  LODWORD(v41) = v41 + 1;
                  *(_DWORD *)id v50 = v41;
                  *(_WORD *)&v50[4] = 2112;
                  *(void *)&v50[6] = v23;
                  *(_WORD *)&v50[14] = 2048;
                  *(void *)&v50[16] = v25;
                  _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%d: Skipping App domain <%@><0x%lX>", buf, 0x1Cu);
                }
              }

              id v22 = (char *)v22 + 1;
            }
            while (v19 != v22);
            id v19 = [v17 countByEnumeratingWithState:&v45 objects:v51 count:16];
          }
          while (v19);
        }

        uint64_t v35 = 1;
        id v9 = v38;
        long long v8 = v39;
        v11 = v37;
        goto LABEL_36;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "App tracker domain list invalid", buf, 2u);
      }

      double v17 = 0;
    }
    else
    {
      double v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No App tracker domain file creation date", buf, 2u);
      }
    }
    uint64_t v35 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "No App tracker domain file metadata or data", buf, 2u);
  }
  uint64_t v35 = 0;
LABEL_37:

  return v35;
}

void sub_100006430(id a1)
{
  byte_100042C0C = +[_SWCTrackingDomainInfo instancesRespondToSelector:"canBlockRequest"];
}

uint64_t sub_100006460(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        long long v7 = string_ptr;
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        [v8 setObject:@"<Test Owner>" forKeyedSubscript:@"owner"];
        id v9 = +[NSNumber numberWithUnsignedInteger:3];
        [v8 setObject:v9 forKeyedSubscript:@"source"];

        id v10 = *(void **)(a1 + 32);
        v11 = +[NSString stringWithUTF8String:v7];
        [v10 setObject:v8 forKeyedSubscript:v11];

        uint64_t v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = *(void **)(a1 + 32);
          uint64_t v15 = +[NSString stringWithUTF8String:v7];
          id v16 = [v14 objectForKeyedSubscript:v15];
          int v17 = 136315394;
          id v18 = v7;
          __int16 v19 = 2112;
          uint64_t v20 = v16;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Adding test domain <%s><%@>", (uint8_t *)&v17, 0x16u);
        }
      }
    }
  }

  return 1;
}

void sub_100006778(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("NEHelperTrackerManagerQueue", v3);
  id v2 = (void *)qword_100042AD0;
  qword_100042AD0 = (uint64_t)v1;
}

void sub_1000067DC(id a1)
{
  os_unfair_lock_lock(&stru_100042C08);
  sub_100004584((uint64_t)NEHelperTrackerManager, 0, 1);

  os_unfair_lock_unlock(&stru_100042C08);
}

BOOL sub_100006998(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (!a1)
  {
    BOOL v23 = 0;
    goto LABEL_75;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "MessageType");
  if (uint64 == 1003)
  {
    id v16 = v5;
    if (sub_1000081A4(0))
    {
      id v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "MessageType", 0x3EDuLL);
      CFArrayRef v17 = (const __CFArray *)WiFiManagerClientCopyNetworksWithBundleIdentifier();
      size_t length = (size_t)v17;
      if (v17)
      {
        CFArrayRef v18 = v17;
        CFIndex Count = CFArrayGetCount(v17);
        if (Count)
        {
          uint64_t v20 = Count;
          id v21 = objc_alloc_init((Class)NSMutableArray);
          if (v20 < 1)
          {
            BOOL v23 = 1;
LABEL_57:
            long long v48 = _CFXPCCreateXPCObjectFromCFObject();
            xpc_dictionary_set_value(v9, "QueryResult", v48);
            sub_100001CA0((uint64_t)NEHelperServer, v16, 100, v9);
          }
          else
          {
            CFIndex v22 = 0;
            BOOL v23 = 0;
            while (1)
            {
              CFArrayGetValueAtIndex(v18, v22);
              uint64_t v24 = sub_100008270();
              if (!v24) {
                break;
              }
              uint64_t v25 = (void *)v24;
              [v21 addObject:v24];

              BOOL v23 = v20 <= ++v22;
              if (v20 == v22) {
                goto LABEL_57;
              }
            }
            long long v48 = ne_log_obj();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = objc_opt_class();
              id v110 = *(id *)&buf[4];
              _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@ received invalid network object from WiFiManager.", buf, 0xCu);
            }
          }

          myCFRelease();
LABEL_73:

          goto LABEL_74;
        }
        sub_100001CA0((uint64_t)NEHelperServer, v16, 100, v9);
        myCFRelease();
      }
      else
      {
        sub_100001CA0((uint64_t)NEHelperServer, v16, 100, v9);
      }
      BOOL v23 = 1;
      goto LABEL_73;
    }
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_39:
      BOOL v23 = 0;
      goto LABEL_73;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v42 = *(id *)&buf[4];
    id v43 = "%@ failed to get WiFiManager client.";
LABEL_106:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);

    goto LABEL_39;
  }
  if (uint64 != 1002)
  {
    if (uint64 != 1001)
    {
      BOOL v23 = 1;
      goto LABEL_75;
    }
    id v7 = v5;
    size_t length = 0;
    data = xpc_dictionary_get_data(v7, "AddParameter", &length);
    if (data && length)
    {
      id v9 = +[NSData dataWithBytesNoCopy:data length:length freeWhenDone:0];
      id v10 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v9 error:0];
      v11 = [v10 decodeObjectOfClass:objc_opt_class() forKey:@"NEHotspotConfigurationKey"];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v12 = [v11 validate];
        if (v12 != (id)100)
        {
          int64_t v56 = (int64_t)v12;
          id v57 = ne_log_obj();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v108 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v108;
            id v109 = v108;
            _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%@ failed to validate the configuration data for add/update request.", buf, 0xCu);
          }
          xpc_object_t v58 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v58, "MessageType", 0x3ECuLL);
          sub_100001CA0((uint64_t)NEHelperServer, v7, v56, v58);

          BOOL v23 = 1;
          goto LABEL_45;
        }
        id v13 = v11;
        if (WiFiNetworkCreate())
        {
          if (([v13 useSSIDPrefix] & 1) != 0
            || ([v13 SSID], uint64_t v14 = objc_claimAutoreleasedReturnValue(), v14, !v14))
          {
            if (![v13 useSSIDPrefix]
              || ([v13 SSIDPrefix],
                  int v61 = objc_claimAutoreleasedReturnValue(),
                  v61,
                  !v61)
              || ([v13 SSIDPrefix],
                  v62 = objc_claimAutoreleasedReturnValue(),
                  WiFiNetworkSetProperty(),
                  v62,
                  ![v13 hidden]))
            {
LABEL_84:
              uint64_t v63 = [v13 lifeTimeInDays];
              if (v63 && (sub_100008444(a1) & 1) == 0 && [v13 securityType] != (id)3)
              {
                id v64 = [v13 securityType];

                if (v64 == (id)4) {
                  goto LABEL_90;
                }
                v65 = [v13 lifeTimeInDays];
                [v65 doubleValue];
                double v67 = v66 * 86400.0;

                uint64_t v63 = +[NSDate date];
                [v63 dateByAddingTimeInterval:v67];
                WiFiNetworkSetExpireDate();
              }

LABEL_90:
              +[NSNumber numberWithInt:2];
              WiFiNetworkSetProperty();
              long long v185 = v13;
              if ([v13 securityType] == (id)1)
              {
                WiFiNetworkSetWEP();
              }
              else
              {
                if ([v13 securityType] != (id)2)
                {
                  if ([v13 securityType] != (id)3 && objc_msgSend(v13, "securityType") != (id)4) {
                    goto LABEL_157;
                  }
                  id v84 = [v13 eapSettings];
                  id v181 = objc_alloc_init((Class)NSMutableDictionary);
                  uint64_t v85 = [v84 username];
                  id v86 = [v85 length];

                  if (v86)
                  {
                    id v87 = [v84 username];
                    [v181 setObject:v87 forKey:@"UserName"];
                  }
                  long long v88 = [v84 password];
                  id v89 = [v88 length];

                  if (v89)
                  {
                    long long v90 = [v84 password];
                    [v181 setObject:v90 forKey:@"UserPassword"];
                  }
                  id v91 = [v84 supportedEAPTypes];
                  id v92 = [v91 count];

                  if (v92)
                  {
                    uint64_t v93 = [v84 supportedEAPTypes];
                    [v181 setObject:v93 forKey:@"AcceptEAPTypes"];
                  }
                  if ([v84 isTLSClientCertificateRequired])
                  {
                    id v182 = objc_alloc_init((Class)NSMutableDictionary);
                    v94 = [v84 identityReference];
                    [v182 setObject:v94 forKeyedSubscript:@"TLSClientIdentityData"];

                    uint64_t v95 = [v84 clientTrustChainReference];
                    id v96 = [v95 count];

                    if (v96)
                    {
                      uint64_t v97 = [v84 clientTrustChainReference];
                      [v182 setObject:v97 forKeyedSubscript:@"TLSClientIdentityTrustChain"];
                    }
                    [v181 setObject:v182 forKeyedSubscript:@"TLSIdentityHandle"];
                  }
                  id v183 = v10;
                  long long v98 = [v84 trustedServerCertificateReferences];
                  id v99 = [v98 count];

                  if (v99)
                  {
                    v100 = [v84 trustedServerCertificateReferences];
                    [v181 setObject:v100 forKeyedSubscript:@"TLSTrustedCertificates"];
                  }
                  id v101 = [v84 supportedEAPTypes];
                  id v102 = +[NSNumber numberWithInteger:21];
                  unsigned int v103 = [v101 containsObject:v102];

                  if (v103)
                  {
                    unint64_t v104 = (unint64_t)[v84 ttlsInnerAuthenticationType];
                    if (v104 > 3) {
                      CFStringRef v105 = @"EAP";
                    }
                    else {
                      CFStringRef v105 = off_100038DE0[v104];
                    }
                    [v181 setObject:v105 forKeyedSubscript:@"TTLSInnerAuthentication"];
                  }
                  int v114 = [v84 outerIdentity];
                  id v115 = [v114 length];

                  if (v115)
                  {
                    int v116 = [v84 outerIdentity];
                    [v181 setObject:v116 forKeyedSubscript:@"OuterIdentity"];
                  }
                  int v117 = [v84 trustedServerNames];
                  id v118 = [v117 count];

                  if (v118)
                  {
                    BOOL v119 = [v84 trustedServerNames];
                    [v181 setObject:v119 forKeyedSubscript:@"TLSTrustedServerNames"];
                  }
                  id v120 = [v84 preferredTLSVersion];
                  CFStringRef v121 = @"1.2";
                  if (v120 == (id)1) {
                    CFStringRef v121 = @"1.1";
                  }
                  if (v120) {
                    CFStringRef v122 = v121;
                  }
                  else {
                    CFStringRef v122 = @"1.0";
                  }
                  [v181 setObject:v122 forKeyedSubscript:@"TLSMaximumVersion"];

                  v178 = +[NSDictionary dictionaryWithObject:v181 forKey:@"EAPClientConfiguration"];
                  WiFiNetworkSetProperty();
                  WiFiNetworkSetWPA();
                  id v13 = v185;
                  if ([v185 securityType] == (id)4)
                  {
                    WiFiNetworkSetProperty();
                    v123 = [v185 hs20Settings];
                    v124 = [v123 domainName];
                    WiFiNetworkSetProperty();

                    int v125 = [v185 hs20Settings];
                    [v125 isRoamingEnabled];
                    id v13 = v185;
                    WiFiNetworkSetProperty();

                    int v126 = [v185 hs20Settings];
                    v127 = [v126 roamingConsortiumOIs];
                    id v128 = [v127 count];

                    if (v128)
                    {
                      int v129 = [v185 hs20Settings];
                      int v130 = [v129 roamingConsortiumOIs];
                      WiFiNetworkSetProperty();
                    }
                    v131 = [v185 hs20Settings];
                    int v132 = [v131 naiRealmNames];
                    id v133 = [v132 count];

                    if (v133)
                    {
                      uint32_t v134 = [v185 hs20Settings];
                      uint32_t v135 = [v134 naiRealmNames];
                      WiFiNetworkSetProperty();
                    }
                  }
                  v136 = [v13 eapSettings];
                  id v137 = [v136 password];
                  id v138 = [v137 length];

                  if (v138)
                  {
                    char v139 = [v13 eapSettings];
                    char v140 = [v139 password];
                    WiFiNetworkSetPassword();
                  }
                  uint64_t v82 = v181;
                  id v10 = v183;
LABEL_156:

LABEL_157:
                  if (sub_1000081A4(0))
                  {
                    id v184 = v10;
                    v141 = +[NSUUID UUID];
                    xpc_object_t v142 = [v141 UUIDString];

                    id v143 = *(void **)(a1 + 8);
                    unsigned __int8 v179 = [v13 joinOnce];
                    unsigned __int8 v176 = [v13 isAccessory];
                    id v180 = v143;
                    id v144 = v143;
                    id v145 = v7;
                    id obj = v142;
                    id v146 = v142;
                    self;
                    int v147 = [NEHelperHotspotConfigurationTask alloc];
                    id v148 = v146;
                    id v149 = v145;
                    id v150 = v144;
                    if (v147)
                    {
                      *(void *)buf = v147;
                      *(void *)&buf[8] = NEHelperHotspotConfigurationTask;
                      id v151 = [(NEHelperHotspotConfigurationTask *)[super init];
                      int v147 = v151;
                      if (v151)
                      {
                        objc_storeStrong((id *)&v151->_taskIdentifier, obj);
                        objc_storeStrong((id *)&v147->_requestMessage, a2);
                        objc_storeStrong((id *)&v147->_bundleID, v180);
                        v147->_joinOnce = v179;
                        v147->_isAccessory = v176;
                      }
                    }
                    id v10 = v184;

                    [(id)qword_100042C20 setObject:v147 forKeyedSubscript:v148];
                    id v152 = objc_alloc_init((Class)NSMutableDictionary);
                    [v152 setObject:*(void *)(a1 + 8) forKeyedSubscript:kWiFiNetworkBundleIdentifierKey];
                    v153 = +[NSNumber numberWithInteger:sub_100008444(a1) ^ 1];
                    [v152 setObject:v153 forKeyedSubscript:kWiFiAddNetworkOriginatorKey];

                    uint64_t v154 = v185;
                    if ([v185 joinOnce])
                    {
                      id v155 = ne_log_obj();
                      if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                      {
                        v156 = objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v156;
                        id v157 = v156;
                        _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_INFO, "%@ setting kWiFiAddNetworkDisassociateOnSessionEndKey option", buf, 0xCu);
                      }
                      long long v158 = +[NSNumber numberWithBool:1];
                      [v152 setObject:v158 forKeyedSubscript:kWiFiAddNetworkDisassociateOnSessionEndKey];

                      uint64_t v154 = v185;
                    }
                    if ([v154 useSSIDPrefix])
                    {
                      long long v159 = ne_log_obj();
                      if (os_log_type_enabled(v159, OS_LOG_TYPE_INFO))
                      {
                        long long v160 = objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v160;
                        id v161 = v160;
                        _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_INFO, "%@ setting kWiFiAddNetworkUseSSIDPrefixKey option", buf, 0xCu);
                      }
                      long long v162 = +[NSNumber numberWithBool:1];
                      [v152 setObject:v162 forKeyedSubscript:kWiFiAddNetworkUseSSIDPrefixKey];

                      uint64_t v154 = v185;
                    }
                    if ([v154 isAccessory])
                    {
                      long long v163 = ne_log_obj();
                      if (os_log_type_enabled(v163, OS_LOG_TYPE_INFO))
                      {
                        long long v164 = objc_opt_class();
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v164;
                        id v165 = v164;
                        _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_INFO, "%@ setting isAccessory option", buf, 0xCu);
                      }
                      [v152 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isAccessory"];
                    }
                    int v166 = WiFiManagerClientAddNetworkAsync();
                    myCFRelease();
                    BOOL v23 = v166 == 0;
                    if (v166)
                    {
                      long long v167 = ne_log_obj();
                      if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
                      {
                        double v171 = objc_opt_class();
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = v171;
                        *(_WORD *)&buf[12] = 1024;
                        *(_DWORD *)&buf[14] = v166;
                        id v172 = v171;
                        _os_log_error_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_ERROR, "%@ WiFiManagerClientAddNetworkAsync() failed: %d", buf, 0x12u);
                      }
                    }

                    goto LABEL_45;
                  }
                  long long v168 = ne_log_obj();
                  if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
                  {
                    v173 = objc_opt_class();
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v173;
                    id v174 = v173;
                    _os_log_error_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_ERROR, "%@ failed to get WiFiManager client.", buf, 0xCu);
                  }
                  myCFRelease();
LABEL_44:
                  BOOL v23 = 0;
LABEL_45:

                  goto LABEL_73;
                }
                WiFiNetworkSetWPA();
              }
              uint64_t v82 = [v13 passphrase];
              WiFiNetworkSetProperty();
              goto LABEL_156;
            }
          }
          else
          {
            uint64_t v15 = [v13 SSID];
            WiFiNetworkSetProperty();

            if (([v13 hidden] & 1) == 0) {
              goto LABEL_84;
            }
          }
          WiFiNetworkSetProperty();
          goto LABEL_84;
        }

        long long v47 = ne_log_obj();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v68 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v68;
          id v69 = v68;
          int64_t v70 = "%@ failed to convert input configuration into wifi network dictionary for add/update request";
LABEL_108:
          _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, v70, buf, 0xCu);
        }
      }
      else
      {
        long long v47 = ne_log_obj();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          uint64_t v83 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v83;
          id v69 = v83;
          int64_t v70 = "%@ received invalid configuration object for add/update request.";
          goto LABEL_108;
        }
      }

      goto LABEL_44;
    }
    id v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    uint64_t v41 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v41;
    id v42 = v41;
    id v43 = "%@ failed to get input configuration for add/update request.";
    goto LABEL_106;
  }
  string = xpc_dictionary_get_string(v5, "NetworkToRemove");
  if (!string)
  {
    id v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
LABEL_48:

      BOOL v23 = 0;
      goto LABEL_74;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v45 = *(id *)&buf[4];
    long long v46 = "%@ failed to get input data for configuration remove request.";
LABEL_110:
    _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, v46, buf, 0xCu);

    goto LABEL_48;
  }
  uint64_t v27 = string;
  if (!sub_1000081A4(0))
  {
    id v44 = ne_log_obj();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v45 = *(id *)&buf[4];
    long long v46 = "%@ failed to get WiFiManager client.";
    goto LABEL_110;
  }
  size_t length = 0;
  uint64_t v28 = WiFiManagerClientCopyCurrentSessionBasedNetwork();
  if (!v28)
  {
    uint64_t v35 = ne_log_obj();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_54;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = objc_opt_class();
    id v37 = *(id *)&buf[4];
    _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%@ The currently associated Wi-Fi network is not a JoinOnce network.", buf, 0xCu);
    goto LABEL_136;
  }
  BundleIdentifier = (const void *)WiFiNetworkGetBundleIdentifier();
  if (CFEqual(BundleIdentifier, *(CFTypeRef *)(a1 + 8)))
  {
    v30 = ne_log_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      id v106 = *(id *)&buf[4];
      _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@ disassociating (JoinOnce)Wi-Fi network.", buf, 0xCu);
    }
    CFArrayRef v31 = (const __CFArray *)WiFiManagerClientCopyDevices();
    size_t length = (size_t)v31;
    if (v31 && (CFArrayRef v32 = v31, CFArrayGetCount(v31)))
    {
      if (!CFArrayGetValueAtIndex(v32, 0) || (int v33 = WiFiDeviceClientDisassociate()) == 0)
      {
        myCFRelease();
        myCFRelease();
        goto LABEL_133;
      }
      int v34 = v33;
      uint64_t v35 = ne_log_obj();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      CFDataRef v36 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v36;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v34;
      id v37 = v36;
      id v38 = "%@ WiFiDeviceClientDisassociate failed: %d";
      id v39 = v35;
      uint32_t v40 = 18;
    }
    else
    {
      uint64_t v35 = ne_log_obj();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_54;
      }
      v107 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v107;
      id v37 = v107;
      id v38 = "%@ WiFiManagerClientCopyDevices() failed(No Wi-Fi devices found).";
      id v39 = v35;
      uint32_t v40 = 12;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
LABEL_136:

LABEL_54:
    myCFRelease();
    myCFRelease();
    if (v28) {
      goto LABEL_133;
    }
    goto LABEL_59;
  }
  myCFRelease();
  myCFRelease();
LABEL_59:
  id v49 = +[NSString stringWithUTF8String:v27];
  CFArrayRef v50 = (const __CFArray *)WiFiManagerClientCopyNetworksWithBundleIdentifier();
  size_t length = (size_t)v50;
  if (!v50)
  {
    v60 = ne_log_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      double v111 = objc_opt_class();
      uint64_t v112 = *(void *)(a1 + 8);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v111;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v112;
      id v113 = v111;
      _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%@ %@ does not own any networks", buf, 0x16u);
    }
    goto LABEL_132;
  }
  CFArrayRef v51 = v50;
  CFIndex v52 = CFArrayGetCount(v50);
  if (v52 < 1) {
    goto LABEL_131;
  }
  CFIndex v53 = v52;
  CFIndex v54 = 0;
  while (!CFArrayGetValueAtIndex(v51, v54))
  {
LABEL_65:
    if (v53 == ++v54) {
      goto LABEL_131;
    }
  }
  uint64_t v55 = sub_100008270();
  if (![v49 isEqualToString:v55])
  {

    goto LABEL_65;
  }
  id v71 = ne_log_obj();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
  {
    long long v169 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v169;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v49;
    id v170 = v169;
    _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%@ removing configuration for network [%@]", buf, 0x16u);
  }
  WiFiManagerClientRemoveNetwork();
  if (WiFiNetworkIsHotspot())
  {
    CFArrayRef v72 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v72 && (CFArrayRef v73 = v72, CFArrayGetCount(v72)))
    {
      CFArrayGetValueAtIndex(v73, 0);
      int v74 = WiFiDeviceClientDisassociate();
      if (v74)
      {
        int v75 = v74;
        id v76 = ne_log_obj();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          id v77 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v77;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v75;
          id v78 = v77;
          id v79 = "%@ WiFiDeviceClientDisassociate failed: %d";
          id v80 = v76;
          uint32_t v81 = 18;
          goto LABEL_182;
        }
        goto LABEL_129;
      }
    }
    else
    {
      id v76 = ne_log_obj();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        v175 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v175;
        id v78 = v175;
        id v79 = "%@ WiFiManagerClientCopyDevices() failed (No Wi-Fi devices found).";
        id v80 = v76;
        uint32_t v81 = 12;
LABEL_182:
        _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, v79, buf, v81);
      }
LABEL_129:
    }
  }

LABEL_131:
  myCFRelease();
  myCFRelease();
LABEL_132:

LABEL_133:
  BOOL v23 = 1;
LABEL_74:

LABEL_75:
  return v23;
}

uint64_t sub_1000081A4(int a1)
{
  uint64_t v1 = qword_100042C30;
  if (a1 || !qword_100042C30)
  {
    if (qword_100042C30)
    {
      WiFiManagerClientRegisterServerRestartCallback();
      CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop();
    }
    myCFRelease();
    uint64_t v1 = WiFiManagerClientCreate();
    qword_100042C30 = v1;
    if (v1)
    {
      WiFiManagerClientRegisterServerRestartCallback();
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      return qword_100042C30;
    }
  }
  return v1;
}

uint64_t sub_100008270()
{
  if (WiFiNetworkIsHotspot())
  {
    uint64_t result = WiFiNetworkGetHS20DomainName();
    if (!result)
    {
      return WiFiNetworkGetProperty();
    }
  }
  else
  {
    return WiFiNetworkGetSSID();
  }
  return result;
}

id sub_1000082F0()
{
  v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] WiFiManager restarted", v2, 2u);
  }

  sub_1000081A4(1);
  id result = [(id)qword_100042C20 count];
  if (result)
  {
    [(id)qword_100042C20 enumerateKeysAndObjectsUsingBlock:&stru_100038DC0];
    return [(id)qword_100042C20 removeAllObjects];
  }
  return result;
}

void sub_100008388(id a1, id a2, id a3, BOOL *a4)
{
  id v5 = a3;
  id v6 = a2;
  myCFRelease();
  if (v5) {
    id Property = objc_getProperty(v5, v7, 24, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "MessageType", 0x3ECuLL);
  sub_100001CA0((uint64_t)NEHelperServer, v9, 107, v10);
}

uint64_t sub_100008444(uint64_t a1)
{
  id v2 = +[LSApplicationProxy applicationProxyForIdentifier:*(void *)(a1 + 8)];
  id v3 = [v2 appState];
  unsigned int v4 = [v3 isValid];

  if (v4)
  {
    id v5 = [v2 applicationType];
    unsigned __int8 v6 = [v5 isEqualToString:LSSystemApplicationType];

    if ((v6 & 1) == 0)
    {
      id v7 = [v2 applicationType];
      [v7 isEqualToString:LSUserApplicationType];

LABEL_7:
      uint64_t v8 = 0;
      goto LABEL_8;
    }
  }
  else if (![*(id *)(a1 + 8) length] {
         || ([*(id *)(a1 + 8) hasPrefix:@"com.apple."] & 1) == 0)
  }
  {
    goto LABEL_7;
  }
  uint64_t v8 = 1;
LABEL_8:

  return v8;
}

void sub_10000852C(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unsigned __int8 v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    CFStringRef v7 = @"User has given consent, network added and joined successfully.";
    switch(a3)
    {
      case 0u:
        break;
      case 1u:
        CFStringRef v7 = @"User did NOT given consent.";
        break;
      case 2u:
        CFStringRef v7 = @"System has cancelled the popup or it timed out.";
        break;
      case 3u:
        CFStringRef v7 = @"Request failed, already asking the user for consent.";
        break;
      case 4u:
        CFStringRef v7 = @"Request failed, invalid bundle ID.";
        break;
      case 5u:
        CFStringRef v7 = @"Request failed, existing network that cannot be overwritten.";
        break;
      case 6u:
        CFStringRef v7 = @"Request succeed, already associated to that network.";
        break;
      case 7u:
        CFStringRef v7 = @"Added to known networks, but association failed.";
        break;
      case 8u:
        CFStringRef v7 = @"Session based add failed, application is not in foreground.";
        break;
      case 9u:
        CFStringRef v7 = @"Request failed, network not found.";
        break;
      default:
        if (a3 == 0x7FFFFFFF) {
          CFStringRef v7 = @"Request failed, unknown error.";
        }
        else {
          CFStringRef v7 = @"unknown";
        }
        break;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a3;
    LOWORD(v33) = 2112;
    *(void *)((char *)&v33 + 2) = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] add network callback callled, result: [%d][%@]", buf, 0x12u);
  }

  if ([(id)qword_100042C20 count])
  {
    CFArrayRef v31 = a4;
    id v8 = a4;
    self;
    if (v8)
    {
      uint64_t v9 = [(id)qword_100042C20 objectForKeyedSubscript:v8];
      [(id)qword_100042C20 removeObjectForKey:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }

    myCFRelease();
    if (!v9)
    {
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] failed to find the task object", buf, 2u);
      }
      goto LABEL_33;
    }
    v11 = objc_getProperty((id)v9, v10, 24, 1);
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "MessageType", 0x3ECuLL);
    if (a3 == 7) {
      goto LABEL_26;
    }
    if (a3)
    {
      sub_100001CA0((uint64_t)NEHelperServer, v11, a3, v12);
    }
    else
    {
      if ((*(unsigned char *)(v9 + 9) & 1) == 0)
      {
LABEL_26:
        sub_100001CA0((uint64_t)NEHelperServer, v11, 0, v12);
        if ((*(unsigned char *)(v9 + 8) & 1) == 0)
        {
          id Property = objc_getProperty((id)v9, v13, 32, 1);
          sub_100008B54((uint64_t)NEHelperHotspotConfigurationTask, Property);
        }
        goto LABEL_32;
      }
      uint64_t v15 = sub_100008270();
      id v17 = objc_getProperty((id)v9, v16, 32, 1);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100008A20;
      v26[3] = &unk_100038D80;
      int v30 = 0;
      uint64_t v27 = v11;
      id v28 = v12;
      id v29 = (id)v9;
      id v18 = v15;
      id v19 = v17;
      uint64_t v20 = v26;
      self;
      id v21 = +[NEConfigurationManager sharedManagerForAllUsers];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&long long v33 = 3221225472;
      *((void *)&v33 + 1) = sub_100008DD0;
      int v34 = &unk_100038D10;
      id v35 = v19;
      id v36 = v18;
      id v37 = v21;
      id v38 = v20;
      id v22 = v21;
      id v23 = v18;
      id v24 = v19;
      uint64_t v25 = v20;
      [v22 loadConfigurationsWithCompletionQueue:&_dispatch_main_q handler:buf];
    }
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_INFO, "[NEHelperHotspotConfigurationManager] there are no pending tasks", buf, 2u);
  }
LABEL_34:
}

void sub_100008A20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to update configuration to allow SSID, error %@", (uint8_t *)&v10, 0xCu);
    }
  }
  int64_t v5 = *(unsigned int *)(a1 + 56);
  if (v5 == 7 || v5 == 0)
  {
    sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, *(void **)(a1 + 40));
    id v8 = *(unsigned char **)(a1 + 48);
    if (v8)
    {
      if (v8[8]) {
        goto LABEL_14;
      }
      id Property = objc_getProperty(v8, v7, 32, 1);
    }
    else
    {
      id Property = 0;
    }
    sub_100008B54((uint64_t)NEHelperHotspotConfigurationTask, Property);
    goto LABEL_14;
  }
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), v5, *(void **)(a1 + 40));
LABEL_14:
}

void sub_100008B54(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = SCPreferencesCreate(kCFAllocatorDefault, @"nehelper", @"/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist");
  if (!v3)
  {
    int64_t v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    id v16 = (id)objc_opt_class();
    id v6 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ failed to create hotspot configuration preference file.", buf, 0xCu);
LABEL_16:

    goto LABEL_17;
  }
  unsigned int v4 = v3;
  int64_t v5 = SCPreferencesGetValue(v3, @"bundle-ids");
  if (!isa_nsarray())
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    goto LABEL_9;
  }
  if (![v5 containsObject:v2])
  {
    id v7 = [v5 mutableCopy];
LABEL_9:
    id v6 = v7;
    [v7 addObject:v2];
    if (SCPreferencesSetValue(v4, @"bundle-ids", v6))
    {
      if (SCPreferencesCommitChanges(v4))
      {
LABEL_15:
        myCFRelease();
        goto LABEL_16;
      }
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_opt_class();
        id v10 = v9;
        int v11 = SCError();
        *(_DWORD *)buf = 138412546;
        id v16 = v9;
        __int16 v17 = 2080;
        id v18 = SCErrorString(v11);
        xpc_object_t v12 = "%@ SCPreferencesCommitChanges failed: %s";
LABEL_19:
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else
    {
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_opt_class();
        id v10 = v13;
        int v14 = SCError();
        *(_DWORD *)buf = 138412546;
        id v16 = v13;
        __int16 v17 = 2080;
        id v18 = SCErrorString(v14);
        xpc_object_t v12 = "%@ SCPreferencesSetValue failed: %s";
        goto LABEL_19;
      }
    }

    goto LABEL_15;
  }
  myCFRelease();
LABEL_17:
}

void sub_100008DD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = +[NEConfigurationManager networkPrivacyConfigurationName];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v29 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v9)
    {
      id v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v8);
          }
          int v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v15 = [v14 name];
          unsigned int v16 = [v15 isEqualToString:v7];

          if (v16)
          {
            id v17 = v14;

            int v11 = v17;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v10);
    }
    else
    {
      int v11 = 0;
    }

    id v18 = [v11 pathController];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = [v18 pathRules];
    id v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      id v28 = v18;
      char v30 = 0;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v33 + 1) + 8 * (void)j);
          uint64_t v25 = [v24 matchSigningIdentifier];
          if ([v25 isEqualToString:*(void *)(a1 + 32)])
          {
            unsigned __int8 v26 = [v24 multicastPreferenceSet];

            if ((v26 & 1) == 0)
            {
              [v24 setDenyMulticast:0];
              [v24 setTemporaryAllowMulticastNetworkName:*(void *)(a1 + 40)];
              char v30 = 1;
            }
          }
          else
          {
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v21);

      id v18 = v28;
      if (v30)
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_100009104;
        v31[3] = &unk_100039178;
        uint64_t v27 = *(void **)(a1 + 48);
        id v32 = *(id *)(a1 + 56);
        [v27 saveConfiguration:v11 withCompletionQueue:&_dispatch_main_q handler:v31];

LABEL_29:
        id v6 = 0;

        id v5 = v29;
        goto LABEL_30;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_29;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_30:
}

void sub_100009104(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = ne_log_obj();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to save configuration with allowed SSID: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Saved configuration with allowed SSID", (uint8_t *)&v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000094EC(id a1)
{
  objc_storeStrong((id *)&qword_100042C18, &_dispatch_main_q);
  qword_100042C20 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

void sub_10000953C(uint64_t a1)
{
  self;
  id v2 = SCPreferencesCreate(kCFAllocatorDefault, @"nehelper", @"/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist");
  if (v2)
  {
    id v3 = SCPreferencesGetValue(v2, @"bundle-ids");
    if (isa_nsarray()) {
      id v4 = [v3 copy];
    }
    else {
      id v4 = 0;
    }
    myCFRelease();
    id v6 = v4;

    if (!v6 || ![v6 containsObject:*(void *)(a1 + 32)]) {
      goto LABEL_31;
    }
    id v7 = *(id *)(a1 + 32);
    self;
    id v8 = SCPreferencesCreate(kCFAllocatorDefault, @"nehelper", @"/Library/Preferences/com.apple.networkextension.hotspot-configuration.plist");
    if (!v8)
    {
      id v10 = ne_log_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_DWORD *)buf = 138412290;
      id v29 = (id)objc_opt_class();
      id v11 = v29;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ failed to create hotspot configuration preference file.", buf, 0xCu);
LABEL_23:

LABEL_24:
      if (WiFiManagerClientCreate())
      {
        WiFiManagerClientRemoveNetworksWithBundleIdentifier();
        id v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = objc_opt_class();
          id v20 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          id v29 = v19;
          __int16 v30 = 2112;
          CFArrayRef v31 = v20;
          id v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ removed all networks matching the bundle identifier [%@]", buf, 0x16u);
        }
        myCFRelease();
      }
      else
      {
        uint64_t v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          id v23 = objc_opt_class();
          id v24 = *(const char **)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          id v29 = v23;
          __int16 v30 = 2112;
          CFArrayRef v31 = v24;
          id v25 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ failed to get WiFiManager client, unable to remove networks matching bundle identifier [%@]", buf, 0x16u);
        }
      }
      goto LABEL_31;
    }
    id v9 = v8;
    id v10 = SCPreferencesGetValue(v8, @"bundle-ids");
    if (!isa_nsarray() || ![v10 containsObject:v7])
    {
      myCFRelease();
      goto LABEL_24;
    }
    id v11 = [v10 mutableCopy];
    [v11 removeObject:v7];
    if (SCPreferencesSetValue(v9, @"bundle-ids", v11))
    {
      if (SCPreferencesCommitChanges(v9))
      {
LABEL_22:
        myCFRelease();
        goto LABEL_23;
      }
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_opt_class();
        id v14 = v13;
        int v15 = SCError();
        *(_DWORD *)buf = 138412546;
        id v29 = v13;
        __int16 v30 = 2080;
        CFArrayRef v31 = SCErrorString(v15);
        unsigned int v16 = "%@ SCPreferencesCommitChanges failed: %s";
LABEL_33:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      }
    }
    else
    {
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned __int8 v26 = objc_opt_class();
        id v14 = v26;
        int v27 = SCError();
        *(_DWORD *)buf = 138412546;
        id v29 = v26;
        __int16 v30 = 2080;
        CFArrayRef v31 = SCErrorString(v27);
        unsigned int v16 = "%@ SCPreferencesSetValue failed: %s";
        goto LABEL_33;
      }
    }

    goto LABEL_22;
  }
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = (id)objc_opt_class();
    id v17 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ failed to create hotspot configuration preference file.", buf, 0xCu);
  }
  id v6 = 0;
LABEL_31:
}

uint64_t sub_100009D74(const char *a1, int32_t a2, char *a3, int32_t a4)
{
  UErrorCode pErrorCode = U_ZERO_ERROR;
  UIDNAInfo v13 = (UIDNAInfo)xmmword_10002A630;
  id v8 = uidna_openUTS46(0x22u, &pErrorCode);
  uint64_t v9 = uidna_nameToASCII_UTF8(v8, a1, a2, a3, a4, &v13, &pErrorCode);
  uidna_close(v8);
  if (pErrorCode)
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v16 = a1;
      __int16 v17 = 1024;
      unsigned __int32 errors = pErrorCode;
      id v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed errorCode %d";
LABEL_9:
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  if (v13.errors)
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned int v16 = a1;
      __int16 v17 = 1024;
      unsigned __int32 errors = v13.errors;
      id v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed info.errors 0x%08X";
      goto LABEL_9;
    }
    return 0;
  }
  return v9;
}

void sub_10000ABC8(uint64_t a1, void *a2)
{
  if (!a1 || !a2) {
    return;
  }
  id v3 = a2;
  if (*(void *)(a1 + 16))
  {
    int v4 = *(unsigned __int8 *)(a1 + 24);
    id Property = (void *)WiFiNetworkGetProperty();
    SSIDData = (void *)WiFiNetworkGetSSIDData();
    SSID = (void *)WiFiNetworkGetSSID();
    if (v4)
    {
      if (WiFiNetworkIsEAP())
      {
        int v8 = 3;
      }
      else if (WiFiNetworkIsWPAWPA2PSK() || WiFiNetworkIsSAE())
      {
        int v8 = 2;
      }
      else if (WiFiNetworkIsWEP())
      {
        int v8 = 1;
      }
      else
      {
        int v8 = 4 * (WiFiNetworkIsOpen() == 0);
      }
      *(_DWORD *)valuePtr = v8;
      CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, valuePtr);
      if (!Property) {
        goto LABEL_19;
      }
    }
    else
    {
      CFNumberRef v9 = 0;
      if (!Property) {
        goto LABEL_19;
      }
    }
    if (SSIDData && SSID)
    {
      *(void *)valuePtr = kCNNetworkInfoKeySSIDData;
      *(void *)&valuePtr[8] = kCNNetworkInfoKeySSID;
      *(void *)&valuePtr[16] = kCNNetworkInfoKeyBSSID;
      CFStringRef v20 = 0;
      values[0] = SSIDData;
      values[1] = SSID;
      values[2] = Property;
      CFNumberRef v18 = 0;
      if (v9)
      {
        CFStringRef v20 = @"wifi-security-type";
        CFNumberRef v18 = v9;
        CFIndex v10 = 4;
      }
      else
      {
        CFIndex v10 = 3;
      }
      id v11 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)valuePtr, (const void **)values, v10, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      myCFRelease();
      values[0] = v11;
      if (v11)
      {
        id v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        myCFRelease();
      }
      goto LABEL_23;
    }
LABEL_19:
    myCFRelease();
    id v11 = 0;
    values[0] = 0;
LABEL_23:
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      UIDNAInfo v13 = objc_opt_class();
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)valuePtr = 138412546;
      *(void *)&valuePtr[4] = v13;
      *(_WORD *)&valuePtr[12] = 2112;
      *(void *)&valuePtr[14] = v14;
      id v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ sending actual Wi-Fi info to [%@]", valuePtr, 0x16u);
    }
    sub_100001CA0((uint64_t)NEHelperServer, v3, 0, v11);

    goto LABEL_26;
  }
  sub_10000B3B8(a1, v3, 0);
LABEL_26:

  myCFRelease();
  unsigned int v16 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;
}

void sub_10000AED4(uint64_t a1, int a2)
{
  int v4 = ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      id v7 = (id)objc_opt_class();
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v6, 32, 1);
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = Property;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ [%@] has an active VPN or DNS configuration", buf, 0x16u);
    }
    sub_10000ABC8(*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      id v10 = (id)objc_opt_class();
      id v11 = *(id *)(a1 + 32);
      if (v11) {
        id v11 = objc_getProperty(v11, v9, 32, 1);
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ [%@] has no active VPN or DNS configuration", buf, 0x16u);
    }
    uint64_t v12 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned int v13 = [v12 isVersion:*(void *)(a1 + 48) greaterThanOrEqualToVersion:@"13.0"];

    uint64_t v14 = ne_log_obj();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        id v17 = (id)objc_opt_class();
        id v18 = *(id *)(a1 + 32);
        if (v18) {
          id v18 = objc_getProperty(v18, v16, 32, 1);
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ [%@] is linked on or above iOS 13.0, retuning nil", buf, 0x16u);
      }
      sub_10000B3B8(*(void *)(a1 + 32), *(void **)(a1 + 40), 1);
    }
    else
    {
      if (v15)
      {
        id v20 = (id)objc_opt_class();
        id v21 = *(id *)(a1 + 32);
        if (v21) {
          id v21 = objc_getProperty(v21, v19, 32, 1);
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ returning pseudo Wi-Fi information to [%@]", buf, 0x16u);
      }
      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = *(id *)(a1 + 40);
      if (v22)
      {
        if (!qword_100042C40)
        {
          if ((byte_100042C38 & 1) == 0)
          {
            byte_100042C38 = 1;
            id v24 = &_CPGetDeviceRegionCode;
            if (&_CPGetDeviceRegionCode)
            {
              id v25 = (const void *)CPGetDeviceRegionCode();
              unsigned __int8 v26 = v25;
              if (v25) {
                LOBYTE(v24) = CFEqual(v25, @"CH") != 0;
              }
              else {
                LOBYTE(v24) = 0;
              }
            }
            else
            {
              unsigned __int8 v26 = 0;
            }
            byte_100042C39 = (char)v24;
            int v27 = ne_log_obj();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v26;
              _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "region code is %@", buf, 0xCu);
            }
          }
          if (byte_100042C39) {
            CFStringRef v28 = @"WLAN";
          }
          else {
            CFStringRef v28 = @"Wi-Fi";
          }
          CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, v28, 0x8000100u, 0);
          if (ExternalRepresentation)
          {
            CFDataRef v30 = ExternalRepresentation;
            *(void *)buf = kCNNetworkInfoKeySSIDData;
            *(void *)&uint8_t buf[8] = kCNNetworkInfoKeySSID;
            *(void *)&buf[16] = kCNNetworkInfoKeyBSSID;
            values[0] = ExternalRepresentation;
            values[1] = (void *)v28;
            values[2] = @"00:00:00:00:00:00";
            qword_100042C40 = (uint64_t)CFDictionaryCreate(kCFAllocatorDefault, (const void **)buf, (const void **)values, 3, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            CFRelease(v30);
          }
        }
        CFArrayRef v31 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        id v32 = ne_log_obj();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v33 = objc_opt_class();
          uint64_t v34 = *(void *)(v22 + 32);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v34;
          id v35 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%@ sending pseudo Wi-Fi info to [%@]", buf, 0x16u);
        }
        sub_100001CA0((uint64_t)NEHelperServer, v23, 0, v31);
        myCFRelease();
        long long v36 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = 0;
      }
    }
  }
}

void sub_10000B3B8(uint64_t a1, void *a2, int64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (v5)
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = objc_opt_class();
        uint64_t v9 = *(void *)(a1 + 32);
        int v12 = 138412802;
        unsigned int v13 = v8;
        __int16 v14 = 2048;
        int64_t v15 = a3;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        id v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ sending result code %lld to [%@]", (uint8_t *)&v12, 0x20u);
      }
      sub_100001CA0((uint64_t)NEHelperServer, v6, a3, 0);
    }
    myCFRelease();
    id v11 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;
  }
}

void sub_10000B4E0(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a2;
  id v27 = a3;
  id v26 = a5;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v12) {
    goto LABEL_29;
  }
  id v13 = v12;
  uint64_t v14 = *(void *)v31;
  id v28 = v11;
  do
  {
    int64_t v15 = 0;
    do
    {
      if (*(void *)v31 != v14) {
        objc_enumerationMutation(v11);
      }
      __int16 v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v15);
      uint64_t v17 = [v16 VPN:v26, v27];
      if (v17
        && ([v16 VPN],
            id v5 = objc_claimAutoreleasedReturnValue(),
            ([v5 isEnabled] & 1) != 0))
      {
        int v18 = 0;
      }
      else
      {
        uint64_t v19 = [v16 dnsSettings];
        if (!v19)
        {
          if (v17) {

          }
          id v7 = 0;
          goto LABEL_25;
        }
        id v7 = (void *)v19;
        id v6 = [v16 dnsSettings];
        if (![v6 isEnabled])
        {
          unsigned int v24 = 0;
          goto LABEL_23;
        }
        int v18 = 1;
      }
      id v21 = [v16 applicationIdentifier];
      uint64_t v22 = *(void **)(a1 + 32);
      if (v22) {
        id Property = objc_getProperty(v22, v20, 32, 1);
      }
      else {
        id Property = 0;
      }
      unsigned int v24 = [v21 isEqual:Property];

      if (!v18)
      {
        id v11 = v28;
        if (!v17) {
          goto LABEL_17;
        }
        goto LABEL_24;
      }
      id v11 = v28;
LABEL_23:

      if (!v17)
      {
LABEL_17:

        if (v24) {
          goto LABEL_30;
        }
        goto LABEL_25;
      }
LABEL_24:

      if (v24)
      {
LABEL_30:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        goto LABEL_31;
      }
LABEL_25:
      int64_t v15 = (char *)v15 + 1;
    }
    while (v13 != v15);
    id v25 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
    id v13 = v25;
  }
  while (v25);
LABEL_29:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_31:
}

void sub_10000B744(id a1)
{
  byte_100042C50 = os_variant_has_internal_diagnostics();
}

void sub_10000B76C(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 40, 1);
  }
  id v4 = Property;
  if (!sub_10000B9C4(0))
  {
    int v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v11 = "[NEHelperWiFiInfoManager] Failed to get WiFi Manager Client instance";
      id v12 = buf;
      goto LABEL_26;
    }
    goto LABEL_9;
  }
  uint64_t v5 = WiFiManagerClientCopyCurrentSessionBasedNetwork();
  if (!v5)
  {
    if (v4)
    {
      if (WiFiManagerClientGetDevice())
      {
        uint64_t v6 = WiFiDeviceClientCopyCurrentNetwork();
        goto LABEL_10;
      }
      int v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      id v11 = "[NEHelperWiFiInfoManager] WiFiManagerClientGetDevice for %@ returned NULL";
      id v12 = buf;
      id v13 = v8;
      uint32_t v14 = 12;
      goto LABEL_27;
    }
    if (sub_10000B9C4(0))
    {
      CFArrayRef v9 = (const __CFArray *)WiFiManagerClientCopyDevices();
      *(void *)buf = v9;
      if (v9)
      {
        CFArrayRef v10 = v9;
        if (CFArrayGetCount(v9))
        {
          CFArrayGetValueAtIndex(v10, 0);
          uint64_t v6 = WiFiDeviceClientCopyCurrentNetwork();
          CFRelease(v10);
          goto LABEL_10;
        }
      }
      myCFRelease();
      int v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      __int16 v15 = 0;
      id v11 = "[NEHelperWiFiInfoManager] WiFiManagerClientCopyDevices() returned no devices";
      goto LABEL_24;
    }
    int v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = 0;
      id v11 = "[NEHelperWiFiInfoManager] Failed to get WiFi Manager Client instance";
LABEL_24:
      id v12 = (uint8_t *)&v15;
LABEL_26:
      id v13 = v8;
      uint32_t v14 = 2;
LABEL_27:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v11, v12, v14);
    }
LABEL_9:

    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = v5;
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[NEHelperWiFiInfoManager] currently associated to a session based Wi-Fi network", buf, 2u);
  }

LABEL_10:
  *(void *)(*(void *)(a1 + 32) + 16) = v6;
}

uint64_t sub_10000B9C4(int a1)
{
  uint64_t v1 = qword_100042C48;
  if (a1 || !qword_100042C48)
  {
    if (qword_100042C48)
    {
      WiFiManagerClientRegisterServerRestartCallback();
      CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop();
    }
    myCFRelease();
    uint64_t v1 = WiFiManagerClientCreate();
    qword_100042C48 = v1;
    if (v1)
    {
      WiFiManagerClientRegisterServerRestartCallback();
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      return qword_100042C48;
    }
  }
  return v1;
}

uint64_t sub_10000BA90()
{
  v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "[NEHelperWiFiInfoManager] WiFiManager restarted", v2, 2u);
  }

  return sub_10000B9C4(1);
}

void sub_10000BE48(uint64_t a1, void *a2)
{
  id v4 = a2;
  id Property = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!Property) {
    goto LABEL_18;
  }
  if (!v4) {
    goto LABEL_5;
  }
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    id Property = *(_xpc_connection_s **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!Property)
    {
LABEL_6:
      xpc_connection_cancel(Property);
      uint64_t v6 = *(os_unfair_lock_s **)(a1 + 32);
      if (v6)
      {
        id v7 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        os_unfair_lock_lock(v6 + 2);
        [objc_getProperty(v6, v8, 40, 1) removeObject:v7];

        os_unfair_lock_unlock(v6 + 2);
      }
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      CFArrayRef v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;

      goto LABEL_18;
    }
LABEL_5:
    id Property = (_xpc_connection_s *)objc_getProperty(Property, v3, 24, 1);
    goto LABEL_6;
  }
  id v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v18) {
      int v19 = *(_DWORD *)(v18 + 8);
    }
    else {
      int v19 = 0;
    }
    id v20 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, v19);
    uint64_t v22 = NSStringFromClass(v20);
    id v23 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v23) {
      id v23 = objc_getProperty(v23, v21, 24, 1);
    }
    *(_DWORD *)buf = 138412546;
    long long v33 = v22;
    __int16 v34 = 1024;
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)v23);
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Start processing new message with class %@ from client pid %d", buf, 0x12u);
  }
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v13 && (id v14 = objc_getProperty(v13, v12, 32, 1)) != 0)
  {
    id v15 = v14;
    if (objc_opt_respondsToSelector())
    {
      __int16 v16 = [v15 handlerQueue];
      id v15 = v15;
      id v31 = v4;
      xpc_dictionary_handoff_reply();
    }
    else
    {
      [v15 handleMessage:v4];
    }
  }
  else
  {
    sub_100001CA0((uint64_t)NEHelperServer, v4, 32, 0);
    id v15 = 0;
  }
  uint64_t v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v24) {
      int v25 = *(_DWORD *)(v24 + 8);
    }
    else {
      int v25 = 0;
    }
    id v26 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, v25);
    id v28 = NSStringFromClass(v26);
    id v29 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v29) {
      id v29 = objc_getProperty(v29, v27, 24, 1);
    }
    pid_t v30 = xpc_connection_get_pid((xpc_connection_t)v29);
    *(_DWORD *)buf = 138412546;
    long long v33 = v28;
    __int16 v34 = 1024;
    pid_t pid = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "End processing new message with class %@ from client pid %d", buf, 0x12u);
  }
LABEL_18:
}

id sub_10000C1D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMessage:*(void *)(a1 + 40)];
}

void sub_10000C1DC()
{
  int valuePtr = 0;
  v0 = SCPreferencesCreate(kCFAllocatorDefault, @"NEHelper control settings", @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v0)
  {
    uint64_t v1 = v0;
    CFPropertyListRef Value = SCPreferencesGetValue(v0, @"DisableRestrictions");
    CFTypeID TypeID = CFBooleanGetTypeID();
    BOOL v4 = Value && CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 0;
    CFPropertyListRef v5 = SCPreferencesGetValue(v1, @"DisableNexus");
    CFTypeID v6 = CFBooleanGetTypeID();
    BOOL v7 = v5 && CFGetTypeID(v5) == v6 && CFBooleanGetValue((CFBooleanRef)v5) != 0;
    CFPropertyListRef v8 = SCPreferencesGetValue(v1, @"FallbackDefault");
    CFTypeID v9 = CFNumberGetTypeID();
    if (v8) {
      LOBYTE(v8) = CFGetTypeID(v8) == v9 && CFNumberGetValue((CFNumberRef)v8, kCFNumberIntType, &valuePtr) != 0;
    }
    CFRelease(v1);
  }
  else
  {
    BOOL v4 = 0;
    BOOL v7 = 0;
    LOBYTE(v8) = 0;
  }
  if (qword_100042C80 != -1) {
    dispatch_once(&qword_100042C80, &stru_100039038);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C76C;
  v10[3] = &unk_100038EF8;
  BOOL v12 = v4;
  BOOL v13 = v7;
  char v14 = (char)v8;
  int v11 = valuePtr;
  dispatch_async((dispatch_queue_t)qword_100042C78, v10);
}

void sub_10000C3C0(uint64_t a1)
{
  id v2 = SCPreferencesCreate(kCFAllocatorDefault, @"NEHelper managed preferences", @"/Library/Managed Preferences/mobile/com.apple.networkextension.control.plist");
  id v3 = SCPreferencesCreate(kCFAllocatorDefault, @"NEHelper control settings", @"/Library/Preferences/com.apple.networkextension.control.plist");
  BOOL v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (!SCPreferencesLock(v3, 1u))
    {
      uint64_t v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        CFErrorRef Error = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = "/Library/Preferences/com.apple.networkextension.control.plist";
        __int16 v25 = 2112;
        CFErrorRef v26 = Error;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "[Managed] Failed to lock SCPreferences for %s: %@", buf, 0x16u);
      }
      goto LABEL_34;
    }
    uint64_t v6 = 0;
    BOOL v7 = off_100038EE0;
    do
    {
      CFStringRef v8 = v7[v6];
      CFPropertyListRef Value = (void *)SCPreferencesGetValue(v2, v8);
      if (CFStringCompare(v8, @"CriticalDomains", 0))
      {
        if (Value)
        {
          SCPreferencesSetValue(v4, v8, Value);
        }
        else if ((a1 & 1) == 0)
        {
          SCPreferencesRemoveValue(v4, v8);
        }
      }
      else
      {
        id v10 = Value;
        int v11 = SCPreferencesGetValue(v4, v8);
        if (isa_nsarray() && [v10 count])
        {
          BOOL v12 = v7;
          uint64_t v13 = a1;
          sub_10000F23C((uint64_t)NEHelperSettingsManager, v11, v10);
          char v14 = (__CFError *)objc_claimAutoreleasedReturnValue();
          id v15 = ne_log_obj();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v24 = (const char *)v8;
            __int16 v25 = 2112;
            CFErrorRef v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Managed] setting %@ to %@", buf, 0x16u);
          }

          SCPreferencesSetValue(v4, v8, v14);
          a1 = v13;
          BOOL v7 = v12;
        }
      }
      ++v6;
    }
    while (v6 != 3);
    if (!SCPreferencesCommitChanges(v4))
    {
      __int16 v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v20 = SCError();
        id v21 = SCErrorString(v20);
        *(_DWORD *)buf = 136315138;
        uint64_t v24 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Managed] Failed to save the control settings: %s", buf, 0xCu);
      }
    }
    if (!SCPreferencesUnlock(v4))
    {
      uint64_t v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        CFErrorRef v22 = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        uint64_t v24 = "/Library/Preferences/com.apple.networkextension.control.plist";
        __int16 v25 = 2112;
        CFErrorRef v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[Managed] Failed to unlock preferences for %s: %@", buf, 0x16u);
      }
    }
  }
  if (!v2)
  {
    if (!v4) {
      return;
    }
    goto LABEL_29;
  }
LABEL_34:
  CFRelease(v2);
  if (!v4) {
    return;
  }
LABEL_29:
  CFRelease(v4);
}

uint64_t sub_10000C76C(uint64_t a1)
{
  sub_10000C7DC("com.apple.networkextension.disable-restrictions", *(unsigned __int8 *)(a1 + 36));
  uint64_t result = sub_10000C7DC("com.apple.networkextension.disable-nexus", *(unsigned __int8 *)(a1 + 37));
  if (*(unsigned char *)(a1 + 38))
  {
    uint64_t v3 = *(int *)(a1 + 32);
    return sub_10000C7DC("com.apple.networkextension.fallback-default", v3);
  }
  return result;
}

uint64_t sub_10000C7DC(const char *a1, uint64_t a2)
{
  if (qword_100042C80 != -1) {
    dispatch_once(&qword_100042C80, &stru_100039038);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100042C78);
  int out_token = -1;
  uint64_t result = notify_register_check(a1, &out_token);
  if (!result)
  {
    uint64_t v5 = 0;
    if (notify_get_state(out_token, &v5) || v5 != a2)
    {
      uint64_t v5 = a2;
      if (!notify_set_state(out_token, a2)) {
        notify_post(a1);
      }
    }
    return notify_cancel(out_token);
  }
  return result;
}

void sub_10000C898(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("NEHelperServerNotificationQueue", v3);
  id v2 = (void *)qword_100042C78;
  qword_100042C78 = (uint64_t)v1;
}

id sub_10000C8FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleMessage:*(void *)(a1 + 40)];
}

void sub_10000C908(uint64_t a1)
{
  memset(buffer, 0, sizeof(buffer));
  if (proc_name(*(_DWORD *)(a1 + 32), buffer, 0x100u) >= 1)
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(_DWORD *)(a1 + 32);
      BOOL v4 = (objc_class *)sub_100001B54((uint64_t)NEHelperServer, *(_DWORD *)(a1 + 36));
      uint64_t v5 = NSStringFromClass(v4);
      int v6 = 136315650;
      BOOL v7 = buffer;
      __int16 v8 = 1024;
      int v9 = v3;
      __int16 v10 = 2112;
      int v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Launched by %s (pid %d) using class %@", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

id sub_10000CA2C()
{
  self;
  if (qword_100042C68 != -1) {
    dispatch_once(&qword_100042C68, &stru_100038E48);
  }
  v0 = (void *)qword_100042C60;

  return v0;
}

void sub_10000CA84(id a1)
{
  NEInitCFTypes();
  dispatch_queue_t v1 = [NEHelperServer alloc];
  if (!v1)
  {
    id v2 = 0;
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_8;
  }
  v16.receiver = v1;
  v16.super_class = (Class)NEHelperServer;
  id v2 = [super init];
  if (v2)
  {
    int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NEHelperServer queue", v3);
    uint64_t v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.nehelper", 0, 1uLL);
    BOOL v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = mach_service;

    id v8 = [objc_alloc((Class)NSMutableSet) initWithCapacity:0];
    int v9 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v8;

    *((_DWORD *)v2 + 2) = 0;
    __int16 v10 = (void *)*((void *)v2 + 4);
    if (!v10 || xpc_get_type(v10) != (xpc_type_t)&_xpc_type_connection) {
      goto LABEL_5;
    }
    xpc_connection_set_target_queue(*((xpc_connection_t *)v2 + 4), *((dispatch_queue_t *)v2 + 3));
    BOOL v12 = (_xpc_connection_s *)*((void *)v2 + 4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100001D64;
    handler[3] = &unk_1000394C0;
    id v15 = v2;
    xpc_connection_set_event_handler(v12, handler);
  }
  id v2 = v2;
  uint64_t v11 = (uint64_t)v2;
LABEL_8:

  uint64_t v13 = (void *)qword_100042C60;
  qword_100042C60 = v11;
}

void sub_10000CC1C(uint64_t a1, void *a2)
{
}

void sub_10000CC2C(uint64_t a1, void *a2)
{
}

void sub_10000CC3C(uint64_t a1)
{
}

void sub_10000CC44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received effective settings change for event: %{public}@, groups: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if ([v6 containsObject:MOEffectiveSettingsGroupAllowedClient]) {
    sub_10000CED4(*(void *)(a1 + 32));
  }
}

void sub_10000CD38(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Querying LaunchServices", buf, 2u);
  }

  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:0];
  id Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, v3, 24, 1);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE3C;
  block[3] = &unk_1000397B8;
  block[4] = v6;
  dispatch_async(Property, block);
}

void sub_10000CE3C(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "LaunchServices is available", v6, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(unsigned char *)(v3 + 12) = 1;
  }
  id v4 = sub_100020288();
  sub_100024B3C(v4, v5);
}

void sub_10000CED4(uint64_t a1)
{
  if (a1)
  {
    dispatch_queue_t v1 = objc_opt_new();
    id v2 = [v1 allowedClient];
    uint64_t v3 = [v2 allowedClient];
    id v4 = [v3 value];

    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 bundleIdentifier];
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "The current Managed Settings allowed client is now %{public}@", (uint8_t *)&v8, 0xCu);
    }
    BOOL v7 = [v4 bundleIdentifier];
    sub_10001FA34((uint64_t)NEHelperConfigurationManager, v7);
  }
}

void sub_10000D000(void *a1, void *a2, const char *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(v6, _xpc_event_key_name);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D874;
      block[3] = &unk_100038FD0;
      block[4] = a3;
      void block[5] = string;
      if (qword_100042C70 != -1) {
        dispatch_once(&qword_100042C70, block);
      }
      if (!strcmp(a3, "com.apple.fsevents.matching"))
      {
        if (!strcmp(string, "ConfigFileChanged"))
        {
          memset(&buf, 0, sizeof(buf));
          if (stat("/Library/Preferences/com.apple.networkextension.plist", &buf) && *__error() == 2)
          {
            uint64_t v48 = 0;
            id v49 = &v48;
            uint64_t v50 = 0x3032000000;
            CFArrayRef v51 = sub_100002BAC;
            CFIndex v52 = sub_100002BBC;
            id v53 = (id)os_transaction_create();
            uint64_t v24 = +[NEConfigurationManager sharedManagerForAllUsers];
            id v26 = objc_getProperty(a1, v25, 24, 1);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_10000D928;
            v45[3] = &unk_100038F20;
            v45[4] = &v48;
            [v24 handleFileRemovedWithCompletionQueue:v26 completionHandler:v45];

            id v27 = sub_100020288();
            sub_100025780(v27, v28);

            _Block_object_dispose(&v48, 8);
          }
        }
        else if (!strcmp(string, "ControlSettingsChanged"))
        {
          sub_10000C1DC();
        }
        else
        {
          uint64_t v11 = strcmp(string, "ManagedPreferencesChanged");
          if (!v11) {
            sub_10000C3C0(v11);
          }
        }
      }
      else if (!strcmp(a3, "com.apple.distnoted.matching"))
      {
        if (!strcmp(string, "ApplicationInstalled") || !strcmp(string, "ApplicationUninstalled"))
        {
          id v12 = (id)_CFXPCCreateCFObjectFromXPCObject();
          uint64_t v13 = +[NSString stringWithUTF8String:_xpc_event_key_name];
          char v14 = [v12 objectForKeyedSubscript:v13];

          id v15 = [v12 objectForKeyedSubscript:@"UserInfo"];
          if (isa_nsdictionary() && isa_nsstring())
          {
            id v44 = [v15 objectForKeyedSubscript:@"bundleIDs"];
            if (isa_nsarray())
            {
              objc_super v16 = +[NSPredicate predicateWithBlock:&stru_100038FB0];
              uint64_t v17 = [v44 filteredArrayUsingPredicate:v16];

              LODWORD(v16) = [v14 isEqualToString:@"ApplicationInstalled"];
              id v42 = [v15 objectForKeyedSubscript:@"isPlaceholder"];
              uint64_t v18 = ne_log_obj();
              BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
              if (v16)
              {
                if (v19)
                {
                  unsigned int v20 = [v42 BOOLValue];
                  id v21 = "";
                  if (v20) {
                    id v21 = "placeholder ";
                  }
                  buf.st_dev = 136446466;
                  *(void *)&buf.st_mode = v21;
                  WORD2(buf.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v17;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received an apps installed notification with %{public}sbundle IDs %@", (uint8_t *)&buf, 0x16u);
                }
                CFErrorRef v22 = 0;
                id v23 = v17;
              }
              else
              {
                if (v19)
                {
                  buf.st_dev = 138412290;
                  *(void *)&buf.st_mode = v17;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received an apps uninstalled notification with bundle IDs %@", (uint8_t *)&buf, 0xCu);
                }
                id v23 = 0;
                CFErrorRef v22 = v17;
              }

              id v38 = v17;
              uint64_t v48 = 0;
              id v49 = &v48;
              uint64_t v50 = 0x3032000000;
              CFArrayRef v51 = sub_100002BAC;
              CFIndex v52 = sub_100002BBC;
              id v53 = (id)os_transaction_create();
              unsigned __int8 v41 = [v42 BOOLValue];
              v47[0] = _NSConcreteStackBlock;
              v47[1] = 3221225472;
              v47[2] = sub_10000D93C;
              v47[3] = &unk_100038F20;
              v47[4] = &v48;
              id v29 = v23;
              id v30 = v22;
              long long v40 = v47;
              group = dispatch_group_create();
              if ([v29 count])
              {
                dispatch_group_enter(group);
                id v31 = sub_100020288();
                v56[0] = _NSConcreteStackBlock;
                v56[1] = 3221225472;
                v56[2] = sub_10000D950;
                v56[3] = &unk_1000397B8;
                id v57 = group;
                sub_10002588C(v31, v29, v56);
              }
              if (objc_msgSend(v30, "count", v38))
              {
                dispatch_group_enter(group);
                long long v33 = sub_100020288();
                v54[0] = _NSConcreteStackBlock;
                v54[1] = 3221225472;
                v54[2] = sub_10000D958;
                v54[3] = &unk_1000397B8;
                uint64_t v55 = group;
                sub_10002588C(v33, v30, v54);
              }
              id Property = objc_getProperty(a1, v32, 24, 1);
              *(void *)&buf.st_dev = _NSConcreteStackBlock;
              buf.st_ino = 3221225472;
              *(void *)&buf.st_uid = sub_10000D960;
              *(void *)&buf.st_rdev = &unk_100038F90;
              LOBYTE(buf.st_ctimespec.tv_sec) = v41;
              id v35 = v29;
              buf.st_atimespec.tv_sec = (__darwin_time_t)v35;
              id v36 = v30;
              buf.st_atimespec.tv_nsec = (uint64_t)v36;
              buf.st_mtimespec.tv_sec = (__darwin_time_t)a1;
              long long v37 = v40;
              buf.st_mtimespec.tv_nsec = (uint64_t)v37;
              dispatch_group_notify(group, Property, &buf);

              _Block_object_dispose(&v48, 8);
            }
          }
        }
        else if (!strcmp(string, "ApplicationDatabaseUpdated"))
        {
          int v8 = ne_log_obj();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.st_dev) = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handling an application database updated notification", (uint8_t *)&buf, 2u);
          }

          id v9 = sub_100020288();
          sub_1000256EC(v9, v10);

          notify_post("com.apple.networkextension.apps-changed");
        }
      }
    }
    NWPrivilegedHelperHandleEvent();
  }
}

void sub_10000D850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_10000D874(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315394;
    uint64_t v6 = v3;
    __int16 v7 = 2080;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Launched by event of type %s and name %s", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10000D928(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000D93C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000D950(uint64_t a1)
{
}

void sub_10000D958(uint64_t a1)
{
}

void sub_10000D960(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSArray);
  if (*(unsigned char *)(a1 + 64) || ![*(id *)(a1 + 32) count])
  {
    id v45 = v2;
    goto LABEL_18;
  }
  uint64_t v3 = a1;
  BOOL v4 = [*(id *)(a1 + 32) count] == (id)1;
  int v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(v3 + 32);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      uint64_t v8 = "Handling an apps installed notification with bundle IDs %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v6)
  {
    id v9 = [*(id *)(v3 + 32) count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v9;
    uint64_t v8 = "Handling an apps installed notification with %lu bundle IDs";
    goto LABEL_9;
  }

  sub_1000159B0((uint64_t)NEHelperConfigurationManager, 0, *(void **)(v3 + 32), 0);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = *(id *)(v3 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v51 objects:v65 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v52;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(v10);
        }
        sub_100014B58((uint64_t)NEHelperConfigurationManager, *(void **)(*((void *)&v51 + 1) + 8 * i), 0);
      }
      id v11 = [v10 countByEnumeratingWithState:&v51 objects:v65 count:16];
    }
    while (v11);
  }

  sub_10001F1D8((uint64_t)NEHelperConfigurationManager, *(void **)(v3 + 32));
  uint64_t v14 = [v2 arrayByAddingObjectsFromArray:*(void *)(v3 + 32)];

  id v45 = (void *)v14;
  a1 = v3;
LABEL_18:
  uint64_t v47 = a1;
  id v15 = [*(id *)(a1 + 40) count];
  objc_super v16 = objc_msgSend_teamID;
  if (!v15)
  {
    uint64_t v22 = a1;
    id v23 = v45;
    goto LABEL_39;
  }
  BOOL v17 = [*(id *)(a1 + 40) count] == (id)1;
  uint64_t v18 = ne_log_obj();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      uint64_t v20 = *(void *)(v47 + 40);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v20;
      id v21 = "Handling an apps uninstalled notification with bundle IDs %@";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&buf, 0xCu);
    }
  }
  else if (v19)
  {
    id v24 = [*(id *)(v47 + 40) count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v24;
    id v21 = "Handling an apps uninstalled notification with %lu bundle IDs";
    goto LABEL_25;
  }

  id v44 = +[NSPredicate predicateWithBlock:&stru_100038F40];
  SEL v25 = [*(id *)(v47 + 40) filteredArrayUsingPredicate:v44];
  id v26 = *(void **)(v47 + 48);
  id v46 = v25;
  if (v26)
  {
    id v27 = ne_log_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v46;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removing configurations for apps with bundle IDs %@", (uint8_t *)&buf, 0xCu);
    }

    if ([v46 count])
    {
      sub_1000159B0((uint64_t)NEHelperConfigurationManager, 0, 0, v46);
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x3032000000;
      v60[3] = sub_100002BAC;
      v60[4] = sub_100002BBC;
      id v61 = (id)os_transaction_create();
      id v28 = +[NEConfigurationManager sharedManagerForAllUsers];
      id v30 = objc_getProperty(v26, v29, 24, 1);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_10000E768;
      v59[3] = &unk_100038F20;
      v59[4] = v60;
      [v28 handleApplicationsRemoved:v46 completionQueue:v30 withCompletionHandler:v59];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id obj = v46;
      id v31 = [obj countByEnumeratingWithState:&v55 objects:&buf count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v56;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v56 != v32) {
              objc_enumerationMutation(obj);
            }
            id v34 = *(id *)(*((void *)&v55 + 1) + 8 * (void)j);
            uint64_t v35 = self;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10000953C;
            block[3] = &unk_100038D58;
            id v63 = v34;
            uint64_t v64 = v35;
            id v36 = v34;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
          id v31 = [obj countByEnumeratingWithState:&v55 objects:&buf count:16];
        }
        while (v31);
      }

      _Block_object_dispose(v60, 8);
    }
  }

  id v23 = [v45 arrayByAddingObjectsFromArray:*(void *)(v47 + 40)];

  uint64_t v22 = v47;
  objc_super v16 = objc_msgSend_teamID;
LABEL_39:
  v49[0] = _NSConcreteStackBlock;
  uint64_t v37 = *((void *)v16 + 170);
  v49[1] = v37;
  v49[2] = sub_10000E090;
  v49[3] = &unk_100038F68;
  id v38 = *(void **)(v22 + 48);
  id v50 = *(id *)(v22 + 56);
  id v39 = v23;
  long long v40 = v49;
  if (v38)
  {
    unsigned __int8 v41 = +[NEConfigurationManager sharedManagerForAllUsers];
    id Property = objc_getProperty(v38, v42, 24, 1);
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = v37;
    double v67 = sub_10000E0DC;
    v68 = &unk_100038FF8;
    id v69 = v39;
    int64_t v70 = v40;
    [v41 loadConfigurationsWithCompletionQueue:Property handler:&buf];
  }
}

void sub_10000E064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t sub_10000E090(uint64_t a1, int a2)
{
  if (a2) {
    notify_post("com.apple.networkextension.apps-changed");
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

void sub_10000E0DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v57 = ne_session_fallback_advisory();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id obj = v3;
  id v68 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
  if (v68)
  {
    int v62 = 0;
    uint64_t v67 = *(void *)v76;
    do
    {
      BOOL v4 = 0;
      do
      {
        if (*(void *)v76 != v67) {
          objc_enumerationMutation(obj);
        }
        int v5 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v4);
        BOOL v6 = [v5 pluginType];
        if (v6 && [*(id *)(a1 + 32) containsObject:v6])
        {
          uint64_t v7 = ne_log_obj();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = [v5 name];
            *(_DWORD *)long long buf = 138412546;
            uint32_t v81 = v8;
            __int16 v82 = 2112;
            uint64_t v83 = v6;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "App for configuration %@ (%@) changed", buf, 0x16u);
          }
          int v9 = 1;
          goto LABEL_11;
        }
        id v10 = [v5 appVPN];
        id v11 = [v10 appRules];
        if ([v11 count]) {
          goto LABEL_17;
        }
        uint64_t v12 = [v5 contentFilter];
        uint64_t v13 = [v12 perApp];
        uint64_t v14 = [v13 appRules];
        if ([v14 count]) {
          goto LABEL_16;
        }
        id v69 = v6;
        v65 = [v5 dnsProxy];
        id v15 = [v65 perApp];
        objc_super v16 = [v15 appRules];
        if ([v16 count])
        {

          BOOL v6 = v69;
LABEL_16:

LABEL_17:
LABEL_18:
          BOOL v17 = [v5 appVPN];
          uint64_t v18 = [v5 contentFilter];
          BOOL v19 = [v18 perApp];

          if (v19)
          {
            uint64_t v20 = [v5 contentFilter];
            goto LABEL_24;
          }
          id v21 = [v5 dnsProxy];
          uint64_t v22 = [v21 perApp];

          if (v22)
          {
            uint64_t v20 = [v5 dnsProxy];
            goto LABEL_24;
          }
          id v23 = [v5 relay];
          id v24 = [v23 perApp];

          if (v24)
          {
            uint64_t v20 = [v5 relay];
LABEL_24:
            SEL v25 = v20;
            id v24 = [v20 perApp];

            if (v17)
            {
              id v26 = v17;
              goto LABEL_27;
            }
            id v26 = v24;
            if (v24)
            {
LABEL_27:
              id v27 = [v26 appRules];
            }
            else
            {
              id v27 = 0;
            }
          }
          else
          {
            id v27 = 0;
            id v26 = v17;
            if (v17) {
              goto LABEL_27;
            }
          }
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v28 = v27;
          id v29 = [v28 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (v29)
          {
            id v30 = v29;
            id v63 = v24;
            double v66 = v17;
            int64_t v70 = v6;
            uint64_t v31 = *(void *)v72;
            while (2)
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(void *)v72 != v31) {
                  objc_enumerationMutation(v28);
                }
                long long v33 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                uint64_t v34 = [v33 matchSigningIdentifier];
                if (v34)
                {
                  uint64_t v35 = (void *)v34;
                  id v36 = *(void **)(a1 + 32);
                  uint64_t v37 = [v33 matchSigningIdentifier];
                  LOBYTE(v36) = [v36 containsObject:v37];

                  if (v36)
                  {

                    id v38 = ne_log_obj();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      id v39 = [v5 name];
                      long long v40 = *(void **)(a1 + 32);
                      *(_DWORD *)long long buf = 138412546;
                      uint32_t v81 = v39;
                      __int16 v82 = 2112;
                      uint64_t v83 = v40;
                      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "One or more apps in the per-app rules for configuration %@ changed: %@", buf, 0x16u);
                    }
                    int v62 = 1;
                    goto LABEL_41;
                  }
                }
              }
              id v30 = [v28 countByEnumeratingWithState:&v71 objects:v79 count:16];
              if (v30) {
                continue;
              }
              break;
            }
            id v38 = v28;
LABEL_41:
            BOOL v6 = v70;
            id v24 = v63;
            BOOL v17 = v66;
          }
          else
          {
            id v38 = v28;
          }

          goto LABEL_44;
        }
        v60 = [v5 relay];
        OSStatus v59 = [v60 perApp];
        long long v58 = [v59 appRules];
        id v64 = [v58 count];

        BOOL v6 = v69;
        if (v64) {
          goto LABEL_18;
        }
        uint64_t v41 = [v5 pathController];
        if (!v41
          || (SEL v42 = (void *)v41,
              [v5 pathController],
              id v43 = objc_claimAutoreleasedReturnValue(),
              char v44 = [v43 hasNonDefaultRules] | v57,
              v43,
              v42,
              (v44 & 1) == 0))
        {
          uint64_t v45 = [v5 alwaysOnVPN];
          if (!v45
            || (id v46 = (void *)v45,
                [v5 alwaysOnVPN],
                uint64_t v47 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v48 = [v47 isEnabled],
                v47,
                v46,
                (v48 & 1) == 0))
          {
            uint64_t v49 = [v5 dnsProxy];
            if (!v49
              || (id v50 = (void *)v49,
                  [v5 dnsProxy],
                  long long v51 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v52 = [v51 isEnabled],
                  v51,
                  v50,
                  (v52 & 1) == 0))
            {
              long long v53 = [v5 appPush];
              if (v53)
              {
                long long v54 = [v5 appPush];
                unsigned int v55 = [v54 isEnabled];
              }
              else
              {
                unsigned int v55 = 0;
              }
              BOOL v6 = v69;

              int v9 = v55 | v62;
LABEL_11:
              int v62 = v9;
              goto LABEL_44;
            }
          }
        }
        int v62 = 1;
        BOOL v6 = v69;
LABEL_44:

        BOOL v4 = (char *)v4 + 1;
      }
      while (v4 != v68);
      id v56 = [obj countByEnumeratingWithState:&v75 objects:v84 count:16];
      id v68 = v56;
    }
    while (v56);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000E768(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

BOOL sub_10000E77C(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  if (isa_nsstring())
  {
    LOBYTE(v4) = 1;
    id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:0];
    BOOL v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 applicationState];
      unsigned int v4 = [v7 isInstalled] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

BOOL sub_10000E808(id a1, id a2, NSDictionary *a3)
{
  return isa_nsstring();
}

BOOL sub_10000E810(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = (void *)xpc_connection_copy_entitlement_value();

  return v3 != 0;
}

id sub_10000E870(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t pid = xpc_connection_get_pid(v2);

  LODWORD(v2) = proc_name(pid, buffer, 0x100u);
  id v4 = objc_alloc((Class)NSString);
  if ((int)v2 < 1) {
    return [v4 initWithFormat:@"process%d", pid];
  }
  else {
    return [v4 initWithCString:buffer encoding:4];
  }
}

id sub_10000E934(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    lock = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = objc_getProperty(a1, v5, 40, 1);
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v18;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(_DWORD **)(*((void *)&v17 + 1) + 8 * (void)v11);
          if (v12)
          {
            if (v12[2] == 6)
            {
              objc_getProperty(*(id *)(*((void *)&v17 + 1) + 8 * (void)v11), v8, 32, 1);
              if (objc_opt_respondsToSelector())
              {
                uint64_t v13 = [objc_getProperty(v12, v8, 32, 1) name];
                unsigned int v14 = [v3 isEqualToString:v13];

                if (v14) {
                  [v4 addObject:v12];
                }
              }
            }
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    os_unfair_lock_unlock(lock);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id sub_10000F23C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (isa_nsarray() && [v4 count])
  {
    id v6 = [v4 mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v6, "indexOfObject:", v12, (void)v15) == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v6 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    id v13 = [objc_alloc((Class)NSArray) initWithArray:v6];
  }
  else
  {
    id v13 = v5;
  }

  return v13;
}

uint64_t sub_10001005C(unsigned int a1, uint64_t a2, int a3)
{
  int v5 = socket(a3, 2, 0);
  if (v5 < 0) {
    return *__error();
  }
  int v6 = v5;
  int v7 = ioctl(v5, a1, a2);
  close(v6);
  if (v7 < 0) {
    return *__error();
  }
  else {
    return 0;
  }
}

uint64_t sub_1000100D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 == 30)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    *(_OWORD *)&v22[16] = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    *(_OWORD *)uint64_t v22 = 0u;
    __strlcpy_chk();
    *(_WORD *)uint64_t v22 = 7708;
    *(_OWORD *)&v22[8] = *(_OWORD *)(a2 + 8);
    if (a3)
    {
      WORD4(v24) = 7708;
      long long v25 = *(_OWORD *)(a3 + 8);
    }
    if (a4) {
      uint64_t v11 = *(void *)(a4 + 16);
    }
    else {
      uint64_t v11 = -1;
    }
    *((void *)&v27 + 1) = v11;
    if (*(unsigned __int8 *)(a2 + 8) == 254 && (*(unsigned char *)(a2 + 9) & 0xC0) == 0x80)
    {
      uint64_t v12 = sub_10001005C(0xC0806982, (uint64_t)&v21, 30);
      if (v12)
      {
        uint64_t v8 = v12;
        id v13 = ne_log_obj();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        int v19 = 136315138;
        long long v20 = strerror(v8);
        unsigned int v14 = "Couldn't set link-local IPv6 address, %s";
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v15 = sub_10001005C(0x8080691A, (uint64_t)&v21, 30);
      if (v15)
      {
        uint64_t v8 = v15;
        id v13 = ne_log_obj();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          goto LABEL_27;
        }
        int v19 = 136315138;
        long long v20 = strerror(v8);
        unsigned int v14 = "Couldn't set IPv6 address, %s";
LABEL_24:
        long long v16 = v13;
        uint32_t v17 = 12;
        goto LABEL_30;
      }
    }
    return 0;
  }
  if (v6 == 2)
  {
    *(_OWORD *)&v22[16] = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    __strlcpy_chk();
    *(_OWORD *)uint64_t v22 = 0x210uLL;
    *(_DWORD *)&v22[4] = *(_DWORD *)(a2 + 4);
    *(_OWORD *)&v22[16] = __PAIR64__(*(unsigned int *)&v22[4], 528);
    long long v23 = 0uLL;
    if (a3)
    {
      LOWORD(v23) = 528;
      DWORD1(v23) = *(_DWORD *)(a3 + 4);
    }
    uint64_t v7 = sub_10001005C(0x8040691A, (uint64_t)&v21, 2);
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v7;
    if (v7 == 17)
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Couldn't set interface address, already exists", (uint8_t *)&v19, 2u);
      }

      return 0;
    }
    id v13 = ne_log_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_27:

      return v8;
    }
    LOWORD(v19) = 0;
    unsigned int v14 = "Couldn't set interface address";
    long long v16 = v13;
    uint32_t v17 = 2;
LABEL_30:
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v17);
    goto LABEL_27;
  }
  return 22;
}

void sub_100011AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011B88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = v4;
  if (!v4 || xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary) {
    goto LABEL_35;
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v5, "interface-option-data", &length);
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "interface-option");
  if (uint64)
  {
    int v8 = uint64;
    if (setsockopt(*(_DWORD *)(a1 + 56), 2, uint64, data, length))
    {
      int v9 = *__error();
      if (strerror_r(v9, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109634;
        int v31 = v8;
        __int16 v32 = 1024;
        int v33 = v9;
        __int16 v34 = 2080;
        uint64_t v35 = __strerrbuf;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to set socket option %d on kernel control socket: [%d] %s", buf, 0x18u);
      }
    }
  }
  if (xpc_dictionary_get_BOOL(v5, "interface-bind-channel-pid") && xpc_dictionary_get_uint64(v5, "interface-type") == 2)
  {
    xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
    uint64_t v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    if (v11)
    {
      pid_t pid = xpc_connection_get_pid(v11);
      pid_t v28 = pid;
      uint64_t v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__strerrlong long buf = 67109120;
        LODWORD(v37) = pid;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "binding ipsec channel to pid: %d", (uint8_t *)__strerrbuf, 8u);
      }

      if (!setsockopt(*(_DWORD *)(a1 + 56), 2, 17, &v28, 4u)) {
        goto LABEL_22;
      }
      int v15 = *__error();
      if (strerror_r(v15, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      uint64_t v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109634;
        int v31 = 17;
        __int16 v32 = 1024;
        int v33 = v15;
        __int16 v34 = 2080;
        uint64_t v35 = __strerrbuf;
        uint32_t v17 = "Failed to set socket option %d on kernel control socket: [%d] %s";
        long long v18 = buf;
        int v19 = v16;
        uint32_t v20 = 24;
LABEL_37:
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v17, v18, v20);
      }
    }
    else
    {
      uint64_t v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        *(_DWORD *)__strerrlong long buf = 138412290;
        uint64_t v37 = v27;
        uint32_t v17 = "Could not get remote connection for message: %@";
        long long v18 = (uint8_t *)__strerrbuf;
        int v19 = v16;
        uint32_t v20 = 12;
        goto LABEL_37;
      }
    }

LABEL_22:
  }
  uuid = xpc_dictionary_get_uuid(v5, "interface-bind-channel-exec-uuid");
  if (uuid)
  {
    uint64_t v22 = uuid;
    if (xpc_dictionary_get_uint64(v5, "interface-type") == 2)
    {
      if (setsockopt(*(_DWORD *)(a1 + 56), 2, 20, v22, 0x10u))
      {
        int v23 = *__error();
        if (strerror_r(v23, __strerrbuf, 0x80uLL)) {
          __strerrbuf[0] = 0;
        }
        long long v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109634;
          int v31 = 20;
          __int16 v32 = 1024;
          int v33 = v23;
          __int16 v34 = 2080;
          uint64_t v35 = __strerrbuf;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to set socket option %d on kernel control socket: [%d] %s", buf, 0x18u);
        }
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    CStringPtr = CFStringGetCStringPtr(@"DisableTrafficShaping", 0x8000100u);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(v5, CStringPtr);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_BOOL(v5, "interface-direct-link");
  }
LABEL_35:

  return 1;
}

void sub_10001464C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000146B0(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  id v5 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  if (v8) {
    [v5 encodeObject:v8 forKey:@"config-index"];
  }
  [v5 encodeInt64:a3 forKey:@"config-generation"];
  [v5 finishEncoding];
  int v6 = [v5 encodedData];
  xpc_object_t v7 = xpc_data_create([v6 bytes], (size_t)[v6 length]);
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, v7);
}

void sub_1000147A4(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  xpc_object_t v8 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v8)
  {
    id v11 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = [objc_alloc((Class)NSArray) initWithArray:v8 copyItems:1];
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * (void)v16) copyPasswordsFromSystemKeychain:v20];
          uint64_t v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    id v17 = v12;
    [v11 encodeObject:v17 forKey:@"config-objects"];

    [v11 finishEncoding];
    long long v18 = [v11 encodedData];
    xpc_object_t v8 = xpc_data_create([v18 bytes], (size_t)[v18 length]);

    if (v9) {
      goto LABEL_10;
    }
LABEL_12:
    id v19 = 0;
    goto LABEL_13;
  }
  id v17 = 0;
  if (!v9) {
    goto LABEL_12;
  }
LABEL_10:
  id v19 = [v9 code:v20];
LABEL_13:
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), (int64_t)v19, v8);
}

id sub_10001499C(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100042CD0);
  id v3 = 0;
  if (v2 && qword_100042C88) {
    id v3 = [(id)qword_100042C88 isEqualToString:v2];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042CD0);

  return v3;
}

void sub_100014A0C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NEConfigurationManager sharedManagerForAllUsers];
  id v12 = objc_getProperty(a1, v11, 56, 1);
  id Property = objc_getProperty(a1, v13, 32, 1);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001D130;
  v18[3] = &unk_100039240;
  id v15 = v9;
  id v19 = v15;
  id v16 = v7;
  id v20 = v16;
  id v17 = v8;
  id v21 = v17;
  long long v22 = a1;
  [v10 loadConfigurations:0 withFilter:v12 completionQueue:Property completionHandler:v18];
}

void sub_100014B58(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  sub_10000CA2C();
  int v6 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v6 && (char v7 = v6[12], v6, (v7 & 1) != 0))
  {
    id v26 = 0;
    id v9 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v26];
    id v8 = v26;
    if (v8 || !v9)
    {
      SEL v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v30 = v4;
        __int16 v31 = 2112;
        __int16 v32 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Did not find an app with bundle ID %@, cannot add app rules from app mapping: %@", buf, 0x16u);
      }
    }
    else
    {
      id v10 = [v9 entitlements];
      SEL v11 = [v10 objectForKey:@"com.apple.developer.networking.networkextension" ofClass:objc_opt_class()];

      if ([v11 count])
      {
        id v12 = [v9 entitlements];
        SEL v13 = [v12 objectForKey:@"get-task-allow" ofClass:objc_opt_class()];

        id v14 = [v9 entitlements];
        id v15 = [v14 objectForKey:@"com.apple.private.networkextension.test-control" ofClass:objc_opt_class()];

        if (([v13 BOOLValue] & 1) != 0 || objc_msgSend(v15, "BOOLValue"))
        {
          id v16 = [v9 URL];
          id v17 = +[NSBundle bundleWithURL:v16];

          long long v18 = [v17 infoDictionary];
          if (isa_nsdictionary())
          {
            id v19 = [v18 objectForKeyedSubscript:@"NETestAppMapping"];
            if (isa_nsdictionary() && [v19 count])
            {
              log = ne_log_obj();
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412546;
                CFStringRef v30 = @"NETestAppMapping";
                __int16 v31 = 2112;
                __int16 v32 = v4;
                _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Setting app rules from the %@ for %@", buf, 0x16u);
              }

              if (v5)
              {
                sub_10001C9A8((uint64_t)NEHelperConfigurationManager, v19, v5);
              }
              else
              {
                v27[0] = @"user-uuid";
                id v20 = NECopyConsoleUserUUID();
                v27[1] = @"application-id";
                v28[0] = v20;
                v28[1] = v4;
                os_log_t loga = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

                id v21 = +[NEConfigurationManager sharedManagerForAllUsers];
                v24[0] = _NSConcreteStackBlock;
                v24[1] = 3221225472;
                v24[2] = sub_10001C770;
                v24[3] = &unk_100039290;
                id v25 = v19;
                [v21 loadConfigurations:0 withFilter:loga completionQueue:&_dispatch_main_q completionHandler:v24];
              }
            }
          }
        }
      }
    }
  }
  else
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v30 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "LaunchServices is not available, cannot add app rules from app mapping from app %@", buf, 0xCu);
    }
  }
}

void sub_100014FC4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 code];

  sub_100001CA0((uint64_t)NEHelperServer, v2, (int64_t)v3, 0);
}

void sub_100015014(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v12 = *(void **)(a1 + 40);
    int64_t v13 = 7;
LABEL_13:
    sub_100001CA0((uint64_t)NEHelperServer, v12, v13, 0);
    goto LABEL_14;
  }
  char v7 = [v5 pluginType];
  if (!v7 || (uint64_t v8 = *(void *)(a1 + 32)) != 0 && (*(unsigned char *)(v8 + 14) & 1) != 0)
  {
  }
  else
  {
    int v9 = *(unsigned __int8 *)(a1 + 56);

    if (!v9)
    {
      id v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v11, 64, 1);
        }
        *(_DWORD *)long long buf = 138412290;
        id v25 = Property;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ is not allowed to remove provider-based configurations", buf, 0xCu);
      }

      id v12 = *(void **)(a1 + 40);
      int64_t v13 = 10;
      goto LABEL_13;
    }
  }
  sub_10001B750(*(void *)(a1 + 32), v5);
  id v15 = +[NEConfigurationManager sharedManagerForAllUsers];
  uint64_t v16 = *(void *)(a1 + 48);
  id v17 = *(void **)(a1 + 32);
  if (v17) {
    id v18 = objc_getProperty(v17, v14, 32, 1);
  }
  else {
    id v18 = 0;
  }
  id v19 = *(void **)(a1 + 48);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001C658;
  v21[3] = &unk_1000392E0;
  id v22 = v19;
  id v23 = *(id *)(a1 + 40);
  [v15 removeConfigurationFromDisk:v16 completionQueue:v18 completionHandler:v21];

LABEL_14:
}

void sub_10001522C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NEConfigurationManager sharedManagerForAllUsers];
  id Property = objc_getProperty(a1, v5, 32, 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001C1A8;
  v8[3] = &unk_100039290;
  id v7 = v3;
  id v9 = v7;
  [v4 loadConfigurations:0 withFilter:0 completionQueue:Property completionHandler:v8];
}

void sub_100015304(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NEConfigurationManager sharedManagerForAllUsers];
  id Property = objc_getProperty(a1, v5, 32, 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001BED8;
  v8[3] = &unk_100039290;
  id v7 = v3;
  id v9 = v7;
  [v4 loadConfigurations:0 withFilter:0 completionQueue:Property completionHandler:v8];
}

id sub_1000153DC(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t v10 = 0;
  SEL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int64_t v13 = sub_100016E4C;
  id v14 = sub_100016E5C;
  id v15 = 0;
  sub_10001BD4C();
  id v3 = qword_100042CE0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001BD9C;
  v7[3] = &unk_1000396F8;
  id v8 = v2;
  id v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1000154FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015514(uint64_t a1, const char *a2)
{
  if (a2)
  {
    id v3 = *(unsigned char **)(a1 + 40);
    if (v3) {
      char v4 = v3[8] & 1;
    }
    else {
      char v4 = 0;
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      *(unsigned char *)(v5 + 16) = v4;
      id v6 = *(unsigned __int8 **)(a1 + 32);
      id v3 = *(unsigned char **)(a1 + 40);
      if (!v3)
      {
LABEL_7:
        id v8 = v3;
        id v9 = *(void **)(a1 + 40);
        if (v9)
        {
          id Property = objc_getProperty(v9, v7, 40, 1);
          SEL v11 = *(void **)(a1 + 40);
        }
        else
        {
          SEL v11 = 0;
          id Property = 0;
        }
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10001B1D4;
        v15[3] = &unk_100039330;
        id v16 = v11;
        id v17 = *(id *)(a1 + 48);
        sub_10001B258(v6, v8, Property, v15);

        return;
      }
    }
    else
    {
      id v6 = 0;
      if (!v3) {
        goto LABEL_7;
      }
    }
    id v3 = objc_getProperty(v3, a2, 32, 1);
    goto LABEL_7;
  }
  uint64_t v12 = *(void **)(a1 + 40);
  if (v12) {
    id v13 = objc_getProperty(v12, a2, 48, 1);
  }
  else {
    id v13 = 0;
  }
  sub_100001CA0((uint64_t)NEHelperServer, v13, 10, 0);
  id v14 = *(void **)(a1 + 48);

  sub_100001CA0((uint64_t)NEHelperServer, v14, 0, 0);
}

id sub_1000156A8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000156D4(uint64_t a1)
{
}

void sub_1000156DC(uint64_t a1, void *a2, id a3)
{
  id v5 = a2;
  if ([v5 count] == a3)
  {
    sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 22, 0);
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndexedSubscript:a3];
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v9, "config-operation", 8);
    if (v8) {
      id Property = objc_getProperty(v8, v10, 24, 1);
    }
    else {
      id Property = 0;
    }
    id v13 = (_xpc_connection_s *)Property;
    id v14 = *(void **)(a1 + 40);
    if (v14) {
      id v15 = objc_getProperty(v14, v12, 32, 1);
    }
    else {
      id v15 = 0;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001B0CC;
    v18[3] = &unk_100039380;
    id v16 = *(id *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 48);
    id v19 = v16;
    uint64_t v21 = v17;
    id v20 = v5;
    id v22 = a3;
    xpc_connection_send_message_with_reply(v13, v9, v15, v18);
  }
}

id sub_100015878(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_100016E4C;
  id v13 = sub_100016E5C;
  id v14 = 0;
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AD70;
  v6[3] = &unk_100039588;
  id v8 = &v9;
  id v3 = v1;
  id v7 = v3;
  [v2 enumerateApplicationsOfType:0 block:v6];

  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_100015998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000159B0(uint64_t a1, char a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  self;
  if (qword_100042CC8 != -1) {
    dispatch_once(&qword_100042CC8, &stru_1000395E8);
  }
  id v8 = sub_100015AC0();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001986C;
  block[3] = &unk_100039638;
  char v14 = a2;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id sub_100015AC0()
{
  self;
  if (qword_100042C98 != -1) {
    dispatch_once(&qword_100042C98, &stru_1000390F0);
  }
  v0 = (void *)qword_100042C90;

  return v0;
}

void sub_100015B18(uint64_t a1)
{
  id v63 = objc_alloc_init((Class)MOEffectiveSettingsStore);
  id v2 = [v63 user];
  id v3 = [v2 sharingPolicy];
  unsigned int v4 = [v3 isEqualToString:MOUserSharingPolicyRestricted];

  if (!v4)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v84 = 0x3032000000;
    uint64_t v85 = sub_100016E4C;
    id v86 = sub_100016E5C;
    id v87 = 0;
    uint64_t v7 = *(void *)(a1 + 48);
    unsigned int v59 = *(_DWORD *)(a1 + 72);
    id v8 = *(id *)(a1 + 32);
    if (!v7)
    {
      uint64_t v60 = 0;
      id v61 = 0;
      id v62 = 0;
      id v20 = 0;
      id v16 = 0;
      goto LABEL_23;
    }
    id v9 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
    id v10 = v9;
    if (v9)
    {
      id v62 = [v9 teamIdentifier];
      id v61 = [v10 SDKVersion];
      uint64_t v11 = [v10 infoDictionary];
      id v12 = [v11 objectForKey:@"NSBonjourServices" ofClass:objc_opt_class()];
      HIDWORD(v60) = v12 != 0;

      id v13 = [v10 entitlements];
      char v14 = [v13 objectForKey:@"com.apple.developer.networking.multicast" ofClass:objc_opt_class()];
      LODWORD(v60) = v14 != 0;

      id v15 = NEResourcesCopyDevicePreferredLocalizations();
      id v16 = [v10 localizedNameWithPreferredLocalizations:v15];
    }
    else
    {
      uint64_t v60 = 0;
      id v61 = 0;
      id v62 = 0;
      id v16 = 0;
    }
    uint64_t v17 = +[LSApplicationProxy applicationProxyForIdentifier:v8 placeholder:0];
    if (v17)
    {
      id v18 = +[NSSet setWithObject:@"NSLocalNetworkUsageDescription"];
      id v19 = [v17 localizedValuesForKeys:v18 fromTable:0];

      if (!v19
        || ([v19 stringForKey:@"NSLocalNetworkUsageDescription"],
            (id v20 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v20 = [v17 objectForInfoDictionaryKey:@"NSLocalNetworkUsageDescription" ofClass:objc_opt_class()];
      }

      if (v16) {
        goto LABEL_22;
      }
    }
    else
    {
      id v20 = 0;
      if (v16)
      {
LABEL_22:

LABEL_23:
        id v26 = (__CFString *)v62;
        objc_storeStrong(&v87, v20);
        id v27 = v61;
        pid_t v28 = v27;
        if (!*(void *)(a1 + 32) || !v16)
        {
          __int16 v31 = ne_log_obj();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            uint64_t v55 = *(void *)(a1 + 32);
            *(_DWORD *)long long v76 = 138412802;
            *(void *)&v76[4] = v55;
            __int16 v77 = 2112;
            long long v78 = v16;
            __int16 v79 = 2112;
            id v80 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not find bundle ID or display name for app: (bundleID: %@, name: %@, teamID: %@)", v76, 0x20u);
          }

          sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 22, 0);
          goto LABEL_58;
        }
        if (v27)
        {
          [v27 doubleValue];
          BOOL v30 = v29 < 18.0;
        }
        else
        {
          BOOL v30 = 0;
        }
        if (v60 && !v30 && !*(void *)(*((void *)&buf + 1) + 40))
        {
          long long v54 = ne_log_obj();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            uint64_t v58 = *(void *)(a1 + 32);
            *(_DWORD *)long long v76 = 138413058;
            *(void *)&v76[4] = v58;
            __int16 v77 = 2112;
            long long v78 = v16;
            __int16 v79 = 2112;
            id v80 = v26;
            __int16 v81 = 2112;
            __int16 v82 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "App did not provide a local network usage string, not prompting: (bundleID: %@, name: %@, teamID: %@, sdkVersion: %@)", v76, 0x2Au);
          }

          sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 1, 0);
          goto LABEL_58;
        }
        if (!v26)
        {
          __int16 v32 = ne_log_obj();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = *(void *)(a1 + 32);
            *(_DWORD *)long long v76 = 138412546;
            *(void *)&v76[4] = v33;
            __int16 v77 = 2112;
            long long v78 = v16;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "No team ID found for (bundleID: %@, name: %@)", v76, 0x16u);
          }

          id v26 = @"TEAMID";
        }
        __int16 v34 = ne_log_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          id v56 = *(__CFString **)(a1 + 32);
          int v57 = *(_DWORD *)(a1 + 72);
          *(_DWORD *)long long v76 = 138413058;
          *(void *)&v76[4] = v16;
          __int16 v77 = 2112;
          long long v78 = v26;
          __int16 v79 = 2112;
          id v80 = v56;
          __int16 v81 = 1024;
          LODWORD(v82) = v57;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Got message for: %@ (%@.%@ PID %d)", v76, 0x26u);
        }

        uint64_t v35 = +[NSString stringWithFormat:@"%@.%@", v26, *(void *)(a1 + 32)];
        uint64_t v36 = *(void *)(a1 + 48);
        id v37 = *(id *)(a1 + 40);
        id v38 = v35;
        id v39 = v38;
        if (v36)
        {
          if (qword_100042CB0)
          {
            long long v40 = [(id)qword_100042CB0 objectForKeyedSubscript:v38];
            uint64_t v41 = v40;
            if (v40 && [v40 count])
            {
              SEL v42 = ne_log_obj();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long v76 = 138412290;
                *(void *)&v76[4] = v39;
                _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "We've already got a prompt outstanding for %@, joining queue", v76, 0xCu);
              }

              [v41 addObject:v37];
              char v43 = 0;
            }
            else
            {
              char v44 = ne_log_obj();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long v76 = 138412290;
                *(void *)&v76[4] = v39;
                _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "No prompts for %@, starting queue and prompting", v76, 0xCu);
              }

              id v45 = [objc_alloc((Class)NSMutableArray) initWithObjects:v37, 0];
              char v43 = 1;
              uint64_t v41 = v45;
            }
            [(id)qword_100042CB0 setObject:v41 forKeyedSubscript:v39];

            if ((v43 & 1) == 0) {
              goto LABEL_51;
            }
          }
          else
          {
            id v47 = objc_alloc_init((Class)NSMutableDictionary);
            unsigned __int8 v48 = (void *)qword_100042CB0;
            qword_100042CB0 = (uint64_t)v47;

            id v49 = [objc_alloc((Class)NSMutableArray) initWithObjects:v37, 0];
            [(id)qword_100042CB0 setObject:v49 forKeyedSubscript:v39];
            id v50 = ne_log_obj();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long v76 = 138412290;
              *(void *)&v76[4] = v39;
              _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "First prompt, starting the queue with %@ and prompting", v76, 0xCu);
            }
          }
          long long v51 = +[NEConfigurationManager sharedManagerForAllUsers];
          unsigned __int8 v52 = sub_100015AC0();
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_100016E64;
          v64[3] = &unk_100039470;
          v64[4] = *(void *)(a1 + 48);
          id v65 = v39;
          id v46 = v51;
          double v66 = v46;
          id v67 = *(id *)(a1 + 56);
          id v68 = *(id *)(a1 + 32);
          int v73 = *(_DWORD *)(a1 + 72);
          id v69 = v16;
          int64_t v70 = v26;
          id v53 = *(id *)(a1 + 64);
          char v74 = *(unsigned char *)(a1 + 76);
          id v71 = v53;
          p_long long buf = &buf;
          [v46 loadConfigurations:0 withFilter:0 completionQueue:v52 completionHandler:v64];

LABEL_57:
LABEL_58:

          _Block_object_dispose(&buf, 8);
          goto LABEL_59;
        }

LABEL_51:
        id v46 = ne_log_obj();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long v76 = 138412290;
          *(void *)&v76[4] = v39;
          _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Prompt for %@ enqueued, stopping", v76, 0xCu);
        }
        goto LABEL_57;
      }
    }
    uint64_t v21 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v8];
    *(void *)long long v76 = 0;
    id v22 = +[RBSProcessHandle handleForPredicate:v21 error:v76];
    id v23 = *(id *)v76;

    if (v22)
    {
      if (v23)
      {
LABEL_18:
        id v16 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      long long v24 = +[RBSProcessIdentifier identifierWithPid:v59];
      id v75 = 0;
      id v22 = +[RBSProcessHandle handleForIdentifier:v24 error:&v75];
      id v25 = v75;

      id v23 = v25;
      if (v25) {
        goto LABEL_18;
      }
    }
    id v16 = [v22 name];
    goto LABEL_21;
  }
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prompt for %@ occurred in restricted (guest) mode, suppressing alert", (uint8_t *)&buf, 0xCu);
  }

  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 1, 0);
LABEL_59:
}

void sub_100016590(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1000165D8(uint64_t a1, void *a2)
{
}

void sub_1000165F4(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"ConfigurationProperties"];
  unsigned int v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v5 = [v4 objectForKeyedSubscript:@"Signature"];
  if (isa_nsdata())
  {
    uint64_t v7 = +[NEConfigurationManager sharedManagerForAllUsers];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 48);
    if (v9) {
      id Property = objc_getProperty(v9, v6, 32, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v11 = *(void **)(a1 + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100016A68;
    v16[3] = &unk_1000394E8;
    id v17 = v11;
    id v18 = *(id *)(a1 + 40);
    char v21 = *(unsigned char *)(a1 + 56);
    id v12 = v5;
    uint64_t v13 = *(void *)(a1 + 48);
    id v19 = v12;
    uint64_t v20 = v13;
    [v7 loadConfigurationWithID:v8 withCompletionQueue:Property handler:v16];
  }
  else
  {
    char v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v23 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No signature found for configuration identifier %@", buf, 0xCu);
    }

    sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), 22, 0);
  }
}

void sub_1000167FC(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v12)
  {
    id v13 = v12;
    id v29 = v11;
    id v30 = v10;
    uint64_t v14 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = [v16 VPN];
        if (v17)
        {
          id v18 = (void *)v17;
          int v19 = *(unsigned __int8 *)(a1 + 56);
          if (*(unsigned char *)(a1 + 56)
            && ([v16 VPN],
                id v5 = objc_claimAutoreleasedReturnValue(),
                ([v5 isEnabled] & 1) == 0))
          {
          }
          else
          {
            uint64_t v20 = [v16 applicationIdentifier];
            unsigned int v21 = [v20 isEqual:*(void *)(a1 + 32)];

            if (v19)
            {

              if (v21) {
                goto LABEL_18;
              }
            }
            else
            {

              if (v21)
              {
LABEL_18:
                uint64_t v23 = ne_log_obj();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  uint64_t v24 = *(void *)(a1 + 40);
                  uint64_t v25 = [v16 applicationIdentifier];
                  id v26 = (void *)v25;
                  int v27 = *(unsigned __int8 *)(a1 + 56);
                  *(_DWORD *)long long buf = 138412802;
                  uint64_t v37 = v24;
                  if (v27) {
                    CFStringRef v28 = @" (enabled)";
                  }
                  else {
                    CFStringRef v28 = &stru_10003A6D0;
                  }
                  __int16 v38 = 2112;
                  uint64_t v39 = v25;
                  __int16 v40 = 2112;
                  CFStringRef v41 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@ Bundle id %@ has VPN configuration%@", buf, 0x20u);
                }
                int64_t v22 = 0;
                id v11 = v29;
                id v10 = v30;
                goto LABEL_24;
              }
            }
          }
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    id v11 = v29;
    id v10 = v30;
  }
  int64_t v22 = 7;
LABEL_24:

  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 48), v22, 0);
}

void sub_100016A68(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v26 = *(void **)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      long long v32 = v26;
      __int16 v33 = 2112;
      long long v34 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to load configuration with ID %@: %@", buf, 0x16u);
    }

    id v12 = *(void **)(a1 + 40);
    int64_t v13 = 3;
    goto LABEL_12;
  }
  uint64_t v8 = [v5 VPN];

  if (!v8)
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v27 = [v5 name];
      *(_DWORD *)long long buf = 138412290;
      long long v32 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Configuration %@ is not a VPN configuration", buf, 0xCu);
    }
    id v12 = *(void **)(a1 + 40);
    int64_t v13 = 22;
    goto LABEL_12;
  }
  id v9 = [v5 VPN];
  unsigned int v10 = [v9 isEnabled];
  int v11 = *(unsigned __int8 *)(a1 + 64);

  if (v11 == v10)
  {
    id v12 = *(void **)(a1 + 40);
    int64_t v13 = 0;
LABEL_12:
    sub_100001CA0((uint64_t)NEHelperServer, v12, v13, 0);
    goto LABEL_13;
  }
  uint64_t v16 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v17 = [v5 VPN];
  [v17 setEnabled:v16];

  int v19 = +[NEConfigurationManager sharedManagerForAllUsers];
  uint64_t v21 = *(void *)(a1 + 48);
  id Property = *(id *)(a1 + 56);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 48, 1);
  }
  id v23 = Property;
  uint64_t v24 = *(void **)(a1 + 56);
  if (v24) {
    id v25 = objc_getProperty(v24, v22, 32, 1);
  }
  else {
    id v25 = 0;
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  void v28[2] = sub_100016D4C;
  v28[3] = &unk_1000392E0;
  id v29 = v5;
  id v30 = *(id *)(a1 + 40);
  [v19 saveConfigurationToDisk:v29 currentSignature:v21 userUUID:v23 isUpgrade:0 completionQueue:v25 completionHandler:v28];

LABEL_13:
}

void sub_100016D4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned int v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) name];
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to enable configuration %@: %@", (uint8_t *)&v7, 0x16u);
    }
    int64_t v5 = 22;
  }
  else
  {
    int64_t v5 = 0;
  }
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 40), v5, 0);
}

uint64_t sub_100016E4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016E5C(uint64_t a1)
{
}

void sub_100016E64(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v166 = a2;
  id v8 = a3;
  id v174 = a5;
  uint64_t v175 = a1;
  long long v164 = v8;
  if (v8)
  {
    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to load configurations with error %{public}@", buf, 0xCu);
    }

    sub_100018678(*(void *)(a1 + 32), *(void **)(a1 + 40), 0, 22);
    goto LABEL_153;
  }
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v9, 48, 1);
  }
  id v162 = Property;
  v178 = +[NEConfigurationManager networkPrivacyConfigurationName];
  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  id v12 = v166;
  id v13 = [v12 countByEnumeratingWithState:&v208 objects:v226 count:16];
  if (v13)
  {
    unsigned __int8 v176 = 0;
    id v177 = 0;
    uint64_t v14 = *(void *)v209;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v209 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v208 + 1) + 8 * i);
        uint64_t v17 = [v16 name];
        unsigned int v18 = [v17 isEqualToString:v178];

        if (v18)
        {
          if (v177)
          {
            int v19 = ne_log_obj();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              int v27 = [v16 identifier];
              *(_DWORD *)long long buf = 138543618;
              *(void *)&uint8_t buf[4] = v178;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Found a duplicate %{public}@ configuration %{public}@, removing", buf, 0x16u);
            }
            uint64_t v20 = *(void **)(v175 + 48);
            uint64_t v21 = [v16 identifier];
            int64_t v22 = sub_100015AC0();
            v205[0] = _NSConcreteStackBlock;
            v205[1] = 3221225472;
            v205[2] = sub_1000188BC;
            v205[3] = &unk_1000392E0;
            id v206 = v178;
            id v207 = 0;
            [v20 removeConfigurationFromDisk:v21 completionQueue:v22 completionHandler:v205];

            id v23 = v206;
          }
          else
          {
            id v177 = v16;
            id v23 = [v174 objectForKeyedSubscript:@"ConfigurationProperties"];
            uint64_t v24 = [v177 identifier];
            id v25 = [v23 objectForKeyedSubscript:v24];
            uint64_t v26 = [v25 objectForKeyedSubscript:@"Signature"];

            unsigned __int8 v176 = (void *)v26;
          }
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v208 objects:v226 count:16];
    }
    while (v13);

    if (v177)
    {
      char v172 = 0;
      goto LABEL_25;
    }
  }
  else
  {

    unsigned __int8 v176 = 0;
  }
  id v177 = [objc_alloc((Class)NEConfiguration) initWithName:v178 grade:2];
  char v172 = 1;
LABEL_25:
  CFStringRef v28 = [v177 pathController];
  BOOL v29 = v28 == 0;

  if (v29)
  {
    id v30 = objc_alloc_init((Class)NEPathController);
    [v177 setPathController:v30];
  }
  __int16 v31 = [v177 pathController];
  [v31 setEnabled:1];

  if (*(void *)(v175 + 56))
  {
    long long v32 = (uint64_t (*)(uint64_t, uint64_t))+[NEProcessInfo copyUUIDsForBundleID:*(void *)(v175 + 64) uid:0];
    if (([v32 containsObject:*(void *)(v175 + 56)] & 1) == 0)
    {
      __int16 v33 = ne_log_obj();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = *(void *)(v175 + 56);
        uint64_t v35 = *(void *)(v175 + 64);
        *(_DWORD *)long long buf = 138412802;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v35;
        *(_WORD *)&unsigned char buf[22] = 2112;
        v223 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Received UUID %@ for %@ does not match cached UUIDs %@", buf, 0x20u);
      }

      uint64_t v36 = +[NELaunchServices bundleProxyForIdentifier:*(void *)(v175 + 64) uid:0 plugins:0];
      uint64_t v37 = v36;
      if (v36)
      {
        __int16 v38 = [v36 machOUUIDs];
        uint64_t v39 = [v37 machOUUIDs];
        unsigned int v40 = [v39 containsObject:*(void *)(v175 + 56)];

        if (v40)
        {
          CFStringRef v41 = ne_log_obj();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            uint64_t v42 = *(void *)(v175 + 56);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v42;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v38;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Received UUID %@ does match launch services UUIDs %@", buf, 0x16u);
          }
        }
      }
    }
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v223 = sub_100016E4C;
  v224 = sub_100016E5C;
  id v225 = 0;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  char v43 = [v177 pathController];
  char v44 = [v43 pathRules];

  id v45 = [v44 countByEnumeratingWithState:&v201 objects:v221 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v202;
    while (2)
    {
      for (j = 0; j != v45; j = (char *)j + 1)
      {
        if (*(void *)v202 != v46) {
          objc_enumerationMutation(v44);
        }
        unsigned __int8 v48 = *(void **)(*((void *)&v201 + 1) + 8 * (void)j);
        id v49 = [v48 matchSigningIdentifier];
        unsigned int v50 = [v49 isEqualToString:*(void *)(v175 + 64)];

        if (v50)
        {
          objc_storeStrong((id *)(*(void *)&buf[8] + 40), v48);
          goto LABEL_49;
        }
      }
      id v45 = [v44 countByEnumeratingWithState:&v201 objects:v221 count:16];
      if (v45) {
        continue;
      }
      break;
    }
  }
LABEL_49:

  if ([*(id *)(*(void *)&buf[8] + 40) multicastPreferenceSet])
  {
    unsigned int v51 = [*(id *)(*(void *)&buf[8] + 40) denyMulticast];
    if (v51)
    {
      unsigned __int8 v52 = ne_log_obj();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        uint64_t v54 = *(void *)(v175 + 64);
        uint64_t v53 = *(void *)(v175 + 72);
        *(_DWORD *)v227 = 138412546;
        uint64_t v228 = v53;
        __int16 v229 = 2112;
        uint64_t v230 = v54;
        uint64_t v55 = "Local network denied by preference for %@ (%@)";
LABEL_60:
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, v55, v227, 0x16u);
      }
    }
    else
    {
      unsigned __int8 v52 = ne_log_obj();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        uint64_t v71 = *(void *)(v175 + 64);
        uint64_t v70 = *(void *)(v175 + 72);
        *(_DWORD *)v227 = 138412546;
        uint64_t v228 = v70;
        __int16 v229 = 2112;
        uint64_t v230 = v71;
        uint64_t v55 = "Local network allowed by preference for %@ (%@)";
        goto LABEL_60;
      }
    }

    sub_100018678(*(void *)(v175 + 32), *(void **)(v175 + 40), v51 != 1, 0);
    goto LABEL_152;
  }
  uint64_t v56 = *(void *)(v175 + 32);
  uint64_t v57 = *(unsigned int *)(v175 + 104);
  id v58 = *(id *)(v175 + 64);
  unsigned int v59 = v58;
  if (!v56)
  {

    goto LABEL_116;
  }
  uint64_t v60 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v58];
  id v213 = 0;
  id v61 = +[RBSProcessHandle handleForPredicate:v60 error:&v213];
  id v62 = v213;

  if (!v61)
  {
    id v63 = +[RBSProcessIdentifier identifierWithPid:v57];
    id v212 = 0;
    id v61 = +[RBSProcessHandle handleForIdentifier:v63 error:&v212];
    id v64 = v212;

    id v62 = v64;
  }
  id v65 = [v61 currentState];
  unsigned int v66 = [v65 isRunning];

  id v67 = [v61 currentState];
  id v68 = [v67 endowmentNamespaces];
  if ([v68 containsObject:@"com.apple.frontboard.visibility"])
  {
    unsigned int v69 = 1;
  }
  else
  {
    long long v72 = [v61 currentState];
    int v73 = [v72 endowmentNamespaces];
    unsigned int v69 = [v73 containsObject:@"com.apple.launchservices.userfacing"];
  }
  char v74 = ne_log_obj();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v121 = "not ";
    if (v66) {
      CFStringRef v122 = "";
    }
    else {
      CFStringRef v122 = "not ";
    }
    *(_DWORD *)v227 = 138412802;
    uint64_t v228 = (uint64_t)v59;
    uint64_t v230 = (uint64_t)v122;
    __int16 v229 = 2080;
    if (v69) {
      CFStringRef v121 = "";
    }
    __int16 v231 = 2080;
    v232 = v121;
    _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "%@ is %srunning, is %sforeground", v227, 0x20u);
  }

  if ((v66 & v69) != 1)
  {

LABEL_116:
    double v111 = ne_log_obj();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
    {
      uint64_t v112 = *(void *)(v175 + 64);
      *(_DWORD *)v227 = 138412290;
      uint64_t v228 = v112;
      _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "Prompt for %@ denied because app is not in foreground, stopping", v227, 0xCu);
    }

    sub_100018678(*(void *)(v175 + 32), *(void **)(v175 + 40), 0, 16);
    goto LABEL_152;
  }
  id v75 = ne_log_obj();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v227 = 138412290;
    uint64_t v228 = (uint64_t)v59;
    _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "Allowing alert for %@ that is in foreground", v227, 0xCu);
  }

  v185[0] = _NSConcreteStackBlock;
  v185[1] = 3221225472;
  v185[2] = sub_1000189C8;
  v185[3] = &unk_100039420;
  v185[4] = *(void *)(v175 + 32);
  id v186 = *(id *)(v175 + 40);
  id v187 = *(id *)(v175 + 80);
  id v188 = *(id *)(v175 + 64);
  id v189 = *(id *)(v175 + 88);
  char v198 = *(unsigned char *)(v175 + 108);
  id v190 = *(id *)(v175 + 48);
  id v191 = 0;
  id v192 = v177;
  char v199 = v172;
  char v200 = 0;
  id v193 = v176;
  id v194 = 0;
  v196 = buf;
  int v197 = *(_DWORD *)(v175 + 104);
  id v195 = v162;
  id v161 = objc_retainBlock(v185);
  uint64_t v76 = *(void *)(v175 + 32);
  if (v76 && (*(unsigned char *)(v76 + 15) & 1) != 0)
  {
    id v113 = sub_100015AC0();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100018FD8;
    block[3] = &unk_100039448;
    id v180 = v161;
    dispatch_async(v113, block);

    id v114 = v180;
    goto LABEL_151;
  }
  __int16 v77 = ne_log_obj();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    uint64_t v79 = *(void *)(v175 + 64);
    uint64_t v78 = *(void *)(v175 + 72);
    *(_DWORD *)v227 = 138412546;
    uint64_t v228 = v78;
    __int16 v229 = 2112;
    uint64_t v230 = v79;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Local network preference not yet set, prompting for %@ (%@)", v227, 0x16u);
  }

  if (!objc_opt_class() || !_os_feature_enabled_impl())
  {
    id v115 = objc_alloc((Class)NEUserNotification);
    uint64_t v116 = *(void *)(v175 + 72);
    uint64_t v117 = *(void *)(*(void *)(*(void *)(v175 + 96) + 8) + 40);
    id v118 = sub_100015AC0();
    id v114 = [v115 initAndShowLocalNetworkAlertWithAppName:v116 reasonString:v117 extensionItem:0 callbackQueue:v118 callbackHandler:v161];

    if (v114)
    {
      BOOL v119 = ne_log_obj();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v145 = *(void *)(v175 + 72);
        uint64_t v144 = *(void *)(v175 + 80);
        id v146 = *(const char **)(v175 + 64);
        *(_DWORD *)v227 = 138412802;
        uint64_t v228 = v145;
        __int16 v229 = 2112;
        uint64_t v230 = v144;
        __int16 v231 = 2112;
        v232 = v146;
        _os_log_debug_impl((void *)&_mh_execute_header, v119, OS_LOG_TYPE_DEBUG, "Displayed prompt for %@ (%@.%@)", v227, 0x20u);
      }
    }
    else
    {
      id v120 = ne_log_obj();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        uint64_t v148 = *(void *)(v175 + 72);
        uint64_t v147 = *(void *)(v175 + 80);
        id v149 = *(const char **)(v175 + 64);
        *(_DWORD *)v227 = 138412802;
        uint64_t v228 = v148;
        __int16 v229 = 2112;
        uint64_t v230 = v147;
        __int16 v231 = 2112;
        v232 = v149;
        _os_log_error_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "Failed to display prompt for %@ (%@.%@), prompt already in progress or not supported", v227, 0x20u);
      }

      sub_100018678(*(void *)(v175 + 32), *(void **)(v175 + 40), 0, 36);
      id v114 = 0;
    }
    goto LABEL_151;
  }
  id v80 = objc_alloc_init((Class)CWFInterface);
  [v80 activate];
  __int16 v81 = [v80 knownNetworkInfoForLocalNetworkPromptWithOptions:0];
  __int16 v82 = ne_log_obj();
  long long v158 = v80;
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v227 = 138412290;
    uint64_t v228 = (uint64_t)v81;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "local network wifiInfo: %@", v227, 0xCu);
  }
  long long v160 = v81;

  long long v159 = NEResourcesCopyDeviceLocalizedNSString();
  uint64_t v83 = v81;
  if (!v81)
  {
    uint64_t v123 = +[NSString stringWithFormat:@"%@\n\n%@", *(void *)(*(void *)(*(void *)(v175 + 96) + 8) + 40), v159];
    id v114 = 0;
    uint64_t v124 = *(void *)(*(void *)(v175 + 96) + 8);
    int v125 = *(void **)(v124 + 40);
    *(void *)(v124 + 40) = v123;
    goto LABEL_143;
  }
  id v157 = [v81 mutableCopy];
  uint64_t v84 = CWFLocalNetworkMapCalloutsKey;
  uint64_t v85 = [v83 objectForKeyedSubscript:CWFLocalNetworkMapCalloutsKey];
  id v169 = [v85 mutableCopy];
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  id v86 = v85;
  id v87 = [v86 countByEnumeratingWithState:&v181 objects:v220 count:16];
  id obj = v86;
  uint64_t v156 = v84;
  if (!v87)
  {
    char v165 = 0;
    char v88 = 0;
    uint64_t v89 = 0;
    goto LABEL_135;
  }
  char v165 = 0;
  char v88 = 0;
  uint64_t v89 = 0;
  uint64_t v168 = *(void *)v182;
  uint64_t v173 = CWFLocalNetworkMapDeviceCountKey;
  uint64_t v171 = CWFLocalNetworkMapDeviceNamesKey;
  uint64_t v163 = CWFLocalNetworkMapTitleKey;
  do
  {
    id v170 = v87;
    for (k = 0; k != v170; k = (char *)k + 1)
    {
      if (*(void *)v182 != v168) {
        objc_enumerationMutation(obj);
      }
      id v91 = *(void **)(*((void *)&v181 + 1) + 8 * (void)k);
      id v92 = ne_log_obj();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v227 = 138412290;
        uint64_t v228 = (uint64_t)v91;
        _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_INFO, "callout: %@", v227, 0xCu);
      }

      uint64_t v93 = [v91 objectForKeyedSubscript:v173];

      if (v93)
      {
        v94 = [v91 objectForKeyedSubscript:v173];
        uint64_t v95 = (uint64_t)[v94 integerValue];
        if (v95 >= 50) {
          uint64_t v96 = 50;
        }
        else {
          uint64_t v96 = v95;
        }
      }
      else
      {
        uint64_t v96 = 0;
      }
      uint64_t v97 = [v91 objectForKeyedSubscript:v171];

      if (v97
        && ([v91 objectForKeyedSubscript:v171],
            long long v98 = objc_claimAutoreleasedReturnValue(),
            [v98 firstObject],
            id v99 = objc_claimAutoreleasedReturnValue(),
            v98,
            v99))
      {
        v100 = NEResourcesCopyDeviceLocalizedFormatString();
        uint64_t v101 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v100, v99);

        if (v96 <= 0)
        {
          uint64_t v105 = 0;
          char v165 = 1;
          goto LABEL_103;
        }
        id v102 = @"APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT_AND_PLURAL";
        if (v96 == 1) {
          id v102 = @"APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT_AND";
        }
        char v165 = 1;
      }
      else
      {
        if (v96 <= 0)
        {
          uint64_t v101 = 0;
          id v99 = 0;
          uint64_t v105 = 0;
          goto LABEL_103;
        }
        id v99 = 0;
        uint64_t v101 = 0;
        id v102 = @"APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT_PLURAL";
        if (v96 == 1) {
          id v102 = @"APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_COUNT";
        }
      }
      unsigned int v103 = v102;
      unint64_t v104 = NEResourcesCopyDeviceLocalizedFormatString();
      uint64_t v105 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v104, v96);
      if (v96 > v89) {
        uint64_t v89 = v96;
      }

      char v88 = 1;
LABEL_103:
      if (!(v101 | v105)) {
        goto LABEL_112;
      }
      id v106 = [v91 mutableCopy];
      v107 = v106;
      if (v101)
      {
        [v106 setObject:v101 forKey:@"mapLabelCalloutSubtitleKey"];
        CFStringRef v108 = @"mapLabelCalloutSubtitle2Key";
        if (!v105) {
          goto LABEL_109;
        }
LABEL_108:
        [v107 setObject:v105 forKey:v108];
        goto LABEL_109;
      }
      CFStringRef v108 = @"mapLabelCalloutSubtitleKey";
      if (v105) {
        goto LABEL_108;
      }
LABEL_109:
      [v169 removeObject:v91, v108];
      [v169 addObject:v107];
      id v109 = ne_log_obj();
      if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
      {
        id v110 = [v91 objectForKeyedSubscript:v163];
        *(_DWORD *)v227 = 138412802;
        uint64_t v228 = v101;
        __int16 v229 = 2112;
        uint64_t v230 = v105;
        __int16 v231 = 2112;
        v232 = v110;
        _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_INFO, "local network name='%@' count='%@' for title='%@'", v227, 0x20u);
      }
LABEL_112:
    }
    id v86 = obj;
    id v87 = [obj countByEnumeratingWithState:&v181 objects:v220 count:16];
  }
  while (v87);
LABEL_135:

  [v157 setObject:v169 forKey:v156];
  v219[0] = v157;
  v218[0] = @"kTCCNotificationExtensionClientDataKey";
  v218[1] = @"kTCCNotificationExtensionDaemonDataKey";
  CFStringRef v216 = @"kTCCNotificationExtensionDaemonDataInfoString";
  v217 = v159;
  int v126 = +[NSDictionary dictionaryWithObjects:&v217 forKeys:&v216 count:1];
  v219[1] = v126;
  v127 = +[NSDictionary dictionaryWithObjects:v219 forKeys:v218 count:2];

  id v114 = objc_alloc_init((Class)NSExtensionItem);
  [v114 setUserInfo:v127];
  id v128 = ne_log_obj();
  if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
  {
    int v129 = [v114 userInfo];
    *(_DWORD *)v227 = 138412546;
    uint64_t v228 = (uint64_t)v114;
    __int16 v229 = 2112;
    uint64_t v230 = (uint64_t)v129;
    _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_INFO, "created extensionItem='%@' with userInfo='%@'", v227, 0x16u);
  }
  v214[0] = @"deviceCount";
  int v130 = +[NSNumber numberWithInteger:v89];
  v215[0] = v130;
  v214[1] = @"networkCount";
  if (obj)
  {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [obj count]);
    v131 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v131 = &off_10003E9F0;
  }
  v215[1] = v131;
  v214[2] = @"deviceNamesPresent";
  int v132 = +[NSNumber numberWithBool:v165 & 1];
  v215[2] = v132;
  v214[3] = @"deviceCountsPresent";
  id v133 = +[NSNumber numberWithBool:v88 & 1];
  v215[3] = v133;
  uint64_t v134 = +[NSDictionary dictionaryWithObjects:v215 forKeys:v214 count:4];
  uint64_t v135 = *(void *)(v175 + 32);
  v136 = *(void **)(v135 + 88);
  *(void *)(v135 + 88) = v134;

  if (obj) {
  int v125 = v157;
  }
LABEL_143:

  id v137 = objc_alloc((Class)NEUserNotification);
  uint64_t v138 = *(void *)(v175 + 72);
  uint64_t v139 = *(void *)(*(void *)(*(void *)(v175 + 96) + 8) + 40);
  char v140 = sub_100015AC0();
  id v141 = [v137 initAndShowLocalNetworkAlertWithAppName:v138 reasonString:v139 extensionItem:v114 callbackQueue:v140 callbackHandler:v161];

  if (v141)
  {
    xpc_object_t v142 = ne_log_obj();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v151 = *(void *)(v175 + 72);
      uint64_t v150 = *(void *)(v175 + 80);
      id v152 = *(const char **)(v175 + 64);
      *(_DWORD *)v227 = 138412802;
      uint64_t v228 = v151;
      __int16 v229 = 2112;
      uint64_t v230 = v150;
      __int16 v231 = 2112;
      v232 = v152;
      _os_log_debug_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_DEBUG, "Displayed prompt for %@ (%@.%@)", v227, 0x20u);
    }
  }
  else
  {
    id v143 = ne_log_obj();
    if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
    {
      uint64_t v154 = *(void *)(v175 + 72);
      uint64_t v153 = *(void *)(v175 + 80);
      id v155 = *(const char **)(v175 + 64);
      *(_DWORD *)v227 = 138412802;
      uint64_t v228 = v154;
      __int16 v229 = 2112;
      uint64_t v230 = v153;
      __int16 v231 = 2112;
      v232 = v155;
      _os_log_error_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_ERROR, "Failed to display prompt for %@ (%@.%@), prompt already in progress or not supported", v227, 0x20u);
    }

    sub_100018678(*(void *)(v175 + 32), *(void **)(v175 + 40), 0, 36);
  }

LABEL_151:
LABEL_152:
  _Block_object_dispose(buf, 8);

LABEL_153:
}

void sub_1000185BC(_Unwind_Exception *a1)
{
}

void sub_100018678(uint64_t a1, void *a2, BOOL a3, int64_t a4)
{
  int v7 = a2;
  if (a1)
  {
    if (a4) {
      xpc_object_t v8 = 0;
    }
    else {
      xpc_object_t v8 = xpc_BOOL_create(a3);
    }
    __int16 v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      int64_t v22 = v7;
      __int16 v23 = 1024;
      LODWORD(v24) = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Draining local network replies for %@ with allowed: %u", buf, 0x12u);
    }

    if (qword_100042CB0)
    {
      id v10 = [(id)qword_100042CB0 objectForKeyedSubscript:v7];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v11 = (char *)[v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v11)
      {
        id v12 = v11;
        id v13 = 0;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v10);
            }
            sub_100001CA0((uint64_t)NEHelperServer, *(void **)(*((void *)&v17 + 1) + 8 * i), a4, v8);
          }
          id v13 = &v12[(void)v13];
          id v12 = (char *)[v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v12);
      }
      else
      {
        id v13 = 0;
      }
      [v10 removeAllObjects];
      [(id)qword_100042CB0 setObject:0 forKeyedSubscript:v7];
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218242;
      int64_t v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Drained %llu local network replies for %@", buf, 0x16u);
    }
  }
}

void sub_1000188BC(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = ne_log_obj();
  int64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to remove duplicate %{public}@ configuration with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removed duplicate %{public}@ configuration", (uint8_t *)&v9, 0xCu);
  }
}

void sub_1000189C8(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v71) = a2 == 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "User responded with local network: %u", buf, 8u);
  }

  id v6 = *(id *)(a1 + 32);
  if (!v6)
  {
    id v54 = 0;
LABEL_15:
    id v53 = 0;
    goto LABEL_16;
  }
  id v7 = objc_getProperty(v6, v5, 88, 1);
  if (v7)
  {
    uint64_t v8 = v7;
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 88, 1);
    }
    uint64_t v10 = [Property objectForKey:@"deviceCount"];
    id v11 = [v10 integerValue];
  }
  else
  {
    id v11 = 0;
  }
  id v6 = *(id *)(a1 + 32);
  id v54 = v11;
  if (!v6) {
    goto LABEL_15;
  }
  id v12 = objc_getProperty(v6, v5, 88, 1);
  id v6 = *(id *)(a1 + 32);
  if (!v12) {
    goto LABEL_15;
  }
  if (v6) {
    id v6 = objc_getProperty(v6, v5, 88, 1);
  }
  id v13 = [v6 objectForKey:@"networkCount"];
  id v53 = [v13 integerValue];

  id v6 = *(id *)(a1 + 32);
LABEL_16:
  id v14 = objc_getProperty(v6, v5, 88, 1);
  if (v14)
  {
    uint64_t v16 = v14;
    id v17 = *(id *)(a1 + 32);
    if (v17) {
      id v17 = objc_getProperty(v17, v15, 88, 1);
    }
    long long v18 = [v17 objectForKey:@"deviceNamesPresent"];
    unsigned int v52 = [v18 BOOLValue];
  }
  else
  {
    unsigned int v52 = 0;
  }
  id v20 = objc_getProperty(*(id *)(a1 + 32), v15, 88, 1);
  uint64_t v21 = *(void **)(a1 + 32);
  if (v20)
  {
    if (v21) {
      uint64_t v21 = objc_getProperty(v21, v19, 88, 1);
    }
    int64_t v22 = [v21 objectForKey:@"deviceCountsPresent"];
    id v23 = [v22 BOOLValue];

    uint64_t v21 = *(void **)(a1 + 32);
  }
  else
  {
    id v23 = 0;
  }
  uint64_t v24 = (void *)v21[11];
  v21[11] = 0;

  if (*(void *)(a1 + 32))
  {
    uint64_t v51 = a2;
    BOOL v25 = a2 == 0;
    uint64_t v26 = *(unsigned __int8 *)(a1 + 132);
    int v27 = *(void **)(a1 + 56);
    BOOL v29 = *(void **)(a1 + 40);
    CFStringRef v28 = *(void **)(a1 + 48);
    id v30 = *(id *)(a1 + 64);
    id v31 = v27;
    id v32 = v28;
    id v33 = v29;
    id v34 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v35 = +[NSNumber numberWithBool:v25];
    [v34 setObject:v35 forKeyedSubscript:@"allowed"];

    [v34 setObject:v33 forKeyedSubscript:@"identifier"];
    [v34 setObject:v32 forKeyedSubscript:@"teamID"];

    [v34 setObject:v31 forKeyedSubscript:@"bundleID"];
    [v34 setObject:v30 forKeyedSubscript:@"query"];

    uint64_t v36 = +[NSNumber numberWithBool:v30 != 0];
    [v34 setObject:v36 forKeyedSubscript:@"hasQuery"];

    uint64_t v37 = +[NSNumber numberWithBool:v26];
    [v34 setObject:v37 forKeyedSubscript:@"hasEntitlement"];

    __int16 v38 = +[NSNumber numberWithInteger:v54];
    [v34 setObject:v38 forKeyedSubscript:@"nearbyGenericBonjourDeviceCount"];

    uint64_t v39 = +[NSNumber numberWithInteger:v53];
    [v34 setObject:v39 forKeyedSubscript:@"networkCount"];

    unsigned int v40 = +[NSNumber numberWithBool:v52];
    [v34 setObject:v40 forKeyedSubscript:@"deviceNamesPresent"];

    CFStringRef v41 = +[NSNumber numberWithBool:v23];
    [v34 setObject:v41 forKeyedSubscript:@"deviceCountsPresent"];

    uint64_t v42 = ne_log_obj();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v71 = v34;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Local network decision: %@", buf, 0xCu);
    }

    AnalyticsSendEvent();
    a2 = v51;
  }
  BOOL v43 = a2 == 0;
  char v44 = *(void **)(a1 + 72);
  id v45 = sub_100015AC0();
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100018FF0;
  v55[3] = &unk_1000393F8;
  id v46 = *(id *)(a1 + 80);
  uint64_t v47 = *(void *)(a1 + 32);
  unsigned __int8 v48 = *(void **)(a1 + 40);
  id v56 = v46;
  uint64_t v57 = v47;
  id v58 = v48;
  id v59 = *(id *)(a1 + 88);
  char v67 = *(unsigned char *)(a1 + 133);
  id v60 = *(id *)(a1 + 96);
  id v61 = *(id *)(a1 + 56);
  char v68 = *(unsigned char *)(a1 + 134);
  id v49 = *(id *)(a1 + 104);
  uint64_t v50 = *(void *)(a1 + 120);
  id v62 = v49;
  uint64_t v65 = v50;
  int v66 = *(_DWORD *)(a1 + 128);
  BOOL v69 = v43;
  id v63 = *(id *)(a1 + 72);
  id v64 = *(id *)(a1 + 112);
  [v44 loadConfigurations:0 withFilter:0 completionQueue:v45 completionHandler:v55];
}

uint64_t sub_100018FD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018FF0(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v64 = a1;
  if (*(void *)(a1 + 32))
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int buffer = 138543362;
      id v83 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to re-load configurations with error %{public}@", (uint8_t *)&buffer, 0xCu);
    }

    sub_100018678(*(void *)(a1 + 40), *(void **)(a1 + 48), 0, 22);
    goto LABEL_49;
  }
  id v12 = *(id *)(a1 + 56);
  id v58 = v10;
  id v13 = [v10 objectForKeyedSubscript:@"ConfigurationProperties"];
  id v14 = [*(id *)(a1 + 56) identifier];
  uint64_t v15 = [v13 objectForKeyedSubscript:v14];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"Signature"];

  id v59 = v9;
  id v60 = v8;
  uint64_t v57 = v16;
  if (!*(unsigned char *)(a1 + 116) && ([v16 isEqualToData:*(void *)(a1 + 64)] & 1) == 0)
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v17 = v8;
    id v18 = [v17 countByEnumeratingWithState:&v74 objects:v86 count:16];
    if (v18)
    {
      id v19 = v18;
      id v61 = v12;
      id v8 = *(id *)v75;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(id *)v75 != v8) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          int64_t v22 = [v21 identifier];
          id v23 = [*(id *)(a1 + 56) identifier];
          unsigned int v24 = [v22 isEqual:v23];

          if (v24)
          {
            id v12 = v21;

            goto LABEL_17;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v74 objects:v86 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      id v12 = v61;
    }
LABEL_17:
  }
  id v62 = v12;
  [v12 pathController];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v56 = long long v73 = 0u;
  BOOL v25 = [v56 pathRules];
  id v26 = [v25 countByEnumeratingWithState:&v70 objects:v85 count:16];
  if (!v26) {
    goto LABEL_41;
  }
  id v27 = v26;
  uint64_t v28 = *(void *)v71;
  uint64_t v63 = *(void *)v71;
  while (2)
  {
    for (j = 0; j != v27; j = (char *)j + 1)
    {
      if (*(void *)v71 != v28) {
        objc_enumerationMutation(v25);
      }
      id v30 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
      id v31 = [v30 matchSigningIdentifier];
      if (![v31 isEqualToString:*(void *)(v64 + 72)]) {
        goto LABEL_28;
      }
      int v32 = *(unsigned __int8 *)(v64 + 117);
      if (*(unsigned char *)(v64 + 117))
      {
        id v8 = [v30 matchPath];
        if ([v8 isEqualToString:*(void *)(v64 + 80)]) {
          goto LABEL_38;
        }
        if (*(unsigned char *)(v64 + 117))
        {

LABEL_28:
          continue;
        }
      }
      id v33 = [v30 matchPath];
      id v34 = v33;
      if (!v33 || !*(void *)(v64 + 80))
      {

        if (v32) {
LABEL_38:
        }

LABEL_40:
        objc_storeStrong((id *)(*(void *)(*(void *)(v64 + 104) + 8) + 40), v30);
        goto LABEL_41;
      }
      uint64_t v35 = v25;
      uint64_t v36 = [v30 matchPath];
      unsigned __int8 v37 = [v36 isEqualToString:*(void *)(v64 + 80)];

      if (v32) {
      BOOL v25 = v35;
      }
      uint64_t v28 = v63;
      if (v37) {
        goto LABEL_40;
      }
    }
    id v27 = [v25 countByEnumeratingWithState:&v70 objects:v85 count:16];
    if (v27) {
      continue;
    }
    break;
  }
LABEL_41:

  __int16 v38 = *(void **)(*(void *)(*(void *)(v64 + 104) + 8) + 40);
  id v9 = v59;
  if (!v38)
  {
    id v39 = [objc_alloc((Class)NEPathRule) initWithSigningIdentifier:*(void *)(v64 + 72)];
    [v39 setAllowEmptyDesignatedRequirement:1];
    unsigned int v40 = [v56 pathRules];

    if (v40)
    {
      CFStringRef v41 = [v56 pathRules];
      uint64_t v42 = [v41 arrayByAddingObject:v39];
      [v56 setPathRules:v42];
    }
    else
    {
      id v84 = v39;
      CFStringRef v41 = +[NSArray arrayWithObjects:&v84 count:1];
      [v56 setPathRules:v41];
    }

    if (*(void *)(v64 + 80))
    {
      [v39 setMatchPath:];
    }
    else
    {
      int v51 = *(_DWORD *)(v64 + 112);
      if (v51)
      {
        bzero(&buffer, 0x400uLL);
        if ((proc_pidpath(v51, &buffer, 0x400u) & 0x80000000) == 0)
        {
          unsigned int v52 = +[NSString stringWithUTF8String:&buffer];
          [v39 setMatchPath:v52];

          id v53 = ne_log_obj();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
          {
            id v54 = [v39 matchPath];
            int v55 = *(_DWORD *)(v64 + 112);
            *(_DWORD *)long long buf = 138412546;
            uint64_t v79 = v54;
            __int16 v80 = 1024;
            int v81 = v55;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Found path %@ for PID %d", buf, 0x12u);
          }
        }
      }
    }
    uint64_t v43 = *(void *)(*(void *)(v64 + 104) + 8);
    char v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v39;

    __int16 v38 = *(void **)(*(void *)(*(void *)(v64 + 104) + 8) + 40);
  }
  [v38 setDenyMulticast:*(unsigned char *)(v64 + 118) == 0];
  [*(id *)(*(void *)(*(void *)(v64 + 104) + 8) + 40) setMulticastPreferenceSet:1];
  id v45 = *(void **)(v64 + 88);
  uint64_t v46 = *(void *)(v64 + 96);
  uint64_t v47 = sub_100015AC0();
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1000196D0;
  v65[3] = &unk_1000393D0;
  uint64_t v48 = *(void *)(v64 + 40);
  id v49 = *(void **)(v64 + 48);
  id v66 = v62;
  uint64_t v67 = v48;
  id v68 = v49;
  char v69 = *(unsigned char *)(v64 + 118);
  id v50 = v62;
  [v45 saveConfigurationToDisk:v50 currentSignature:v57 userUUID:v46 isUpgrade:0 completionQueue:v47 completionHandler:v65];

  id v8 = v60;
  id v10 = v58;
LABEL_49:
}

void sub_1000196D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v4 = ne_log_obj();
  int64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v3;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to save configuration with error %{public}@ for %{public}@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    int v8 = 0;
    int64_t v9 = 94;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = *(unsigned __int8 *)(a1 + 56);
      int v12 = 67109120;
      LODWORD(v13) = v10;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Got local network response: %u, delivering reply", (uint8_t *)&v12, 8u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    int v8 = *(unsigned __int8 *)(a1 + 56);
    int64_t v9 = 0;
  }
  sub_100018678(v6, v7, v8, v9);
}

void sub_100019808(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("show-local-network-alert", v3);
  id v2 = (void *)qword_100042C90;
  qword_100042C90 = (uint64_t)v1;
}

void sub_10001986C(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Installing default local network access policies", buf, 2u);
  }

  uint64_t v45 = a1;
  if (*(unsigned char *)(a1 + 48))
  {
    unint64_t v3 = 0;
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)[*(id *)(a1 + 32) mutableCopy];
    unint64_t v3 = (unint64_t)*(id *)(a1 + 40);
  }
  char v44 = (void *)v3;
  BOOL v43 = (v4 | v3) == 0;
  if (!(v4 | v3))
  {
    self;
    unint64_t v4 = (unint64_t)objc_alloc_init((Class)NSMutableArray);
    int64_t v5 = +[LSApplicationRecord enumeratorWithOptions:0];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v63 objects:buf count:16];
    if (!v6) {
      goto LABEL_25;
    }
    id v7 = v6;
    uint64_t v8 = *(void *)v64;
    while (1)
    {
      int64_t v9 = 0;
      do
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v9);
        if ([v10 developerType] == 1)
        {
          unsigned int v11 = [v10 isAppStoreVendable];
          if ([v10 developerType] != 1)
          {
            if (v11) {
              goto LABEL_19;
            }
            goto LABEL_20;
          }
          char v12 = v11 ^ 1;
        }
        else
        {
          if ([v10 developerType] != 1) {
            goto LABEL_19;
          }
          char v12 = 0;
        }
        if (([v10 isDeletableSystemApplication] & 1) == 0 && (v12 & 1) == 0)
        {
LABEL_19:
          id v13 = [v10 bundleIdentifier];
          [(id)v4 addObject:v13];
        }
LABEL_20:
        int64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v14 = [v5 countByEnumeratingWithState:&v63 objects:buf count:16];
      id v7 = v14;
      if (!v14)
      {
LABEL_25:

        uint64_t v15 = ne_log_large_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          unint64_t v70 = v4;
          _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "All user apps: %@", buf, 0xCu);
        }

        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v16 = (id)qword_100042CC0;
        id v17 = [v16 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v60;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v60 != v19) {
                objc_enumerationMutation(v16);
              }
              unint64_t v21 = *(void *)(*((void *)&v59 + 1) + 8 * i);
              if (([(id)v4 containsObject:v21] & 1) == 0)
              {
                id v22 = objc_alloc((Class)LSApplicationRecord);
                id v58 = 0;
                id v23 = [v22 initWithBundleIdentifier:v21 allowPlaceholder:0 error:&v58];
                id v24 = v58;
                BOOL v25 = ne_log_obj();
                id v26 = v25;
                if (v23)
                {
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    unint64_t v70 = v21;
                    _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Deny-listing %@", buf, 0xCu);
                  }

                  [(id)v4 addObject:v21];
                }
                else
                {
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    unint64_t v70 = v21;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Not deny-listing %@, not installed yet", buf, 0xCu);
                  }
                }
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v59 objects:v68 count:16];
          }
          while (v18);
        }

        break;
      }
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v27 = (id)qword_100042CB8;
  id v28 = [v27 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v55;
    do
    {
      for (j = 0; j != v29; j = (char *)j + 1)
      {
        if (*(void *)v55 != v30) {
          objc_enumerationMutation(v27);
        }
        unint64_t v32 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
        if ([(id)v4 containsObject:v32])
        {
          id v33 = ne_log_obj();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            unint64_t v70 = v32;
            _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Allow-listing %@", buf, 0xCu);
          }

          [(id)v4 removeObject:v32];
        }
      }
      id v29 = [v27 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v29);
  }

  id v34 = NEGetRootUUID();
  uint64_t v35 = +[NEConfigurationManager networkPrivacyConfigurationName];
  uint64_t v36 = +[NEConfigurationManager sharedManagerForAllUsers];
  unsigned __int8 v37 = sub_100015AC0();
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100019EC0;
  v46[3] = &unk_100039610;
  id v47 = v35;
  id v48 = v36;
  char v52 = *(unsigned char *)(v45 + 48);
  BOOL v53 = v43;
  id v49 = (id)v4;
  id v50 = v44;
  id v51 = v34;
  id v38 = v34;
  id v39 = v44;
  id v40 = (id)v4;
  id v41 = v36;
  id v42 = v35;
  [v41 loadConfigurations:0 withFilter:0 completionQueue:v37 completionHandler:v46];
}

void sub_100019EC0(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v91 = a5;
  if (!v9)
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v85 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v116 objects:v128 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v117;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v117 != v16) {
            objc_enumerationMutation(v12);
          }
          id v18 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          uint64_t v19 = [v18 name];
          unsigned int v20 = [v19 isEqualToString:*(void *)(a1 + 32)];

          if (v20)
          {
            if (v15)
            {
              unint64_t v21 = ne_log_obj();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                id v86 = v15;
                BOOL v25 = *(void **)(a1 + 32);
                id v26 = [v18 identifier];
                *(_DWORD *)long long buf = 138543618;
                id v125 = v25;
                uint64_t v15 = v86;
                __int16 v126 = 2114;
                id v127 = v26;
                _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Found a duplicate %{public}@ configuration %{public}@, removing", buf, 0x16u);
              }
              id v22 = *(void **)(a1 + 40);
              id v23 = [v18 identifier];
              id v24 = sub_100015AC0();
              v113[0] = _NSConcreteStackBlock;
              v113[1] = 3221225472;
              v113[2] = sub_10001AB08;
              v113[3] = &unk_1000392E0;
              id v114 = *(id *)(a1 + 32);
              id v115 = 0;
              [v22 removeConfigurationFromDisk:v23 completionQueue:v24 completionHandler:v113];
            }
            else
            {
              uint64_t v15 = v18;
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v116 objects:v128 count:16];
      }
      while (v14);

      if (v15) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    uint64_t v15 = [objc_alloc((Class)NEConfiguration) initWithName:*(void *)(a1 + 32) grade:2];
    if (!v15)
    {
LABEL_22:
      id v27 = [v15 pathController];

      if (!v27)
      {
        id v28 = objc_alloc_init((Class)NEPathController);
        [v15 setPathController:v28];
      }
      id v29 = [v15 pathController];
      [v29 setEnabled:1];

      uint64_t v30 = [v15 pathController];
      [v30 setIgnoreRouteRules:1];

      id v87 = v15;
      id v31 = [v15 pathController];
      [v31 setIgnoreFallback:1];

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id obj = v11;
      id v92 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
      if (!v92)
      {
LABEL_95:

        id v9 = 0;
        id v8 = v85;
        int v10 = v87;
        goto LABEL_96;
      }
      uint64_t v90 = *(void *)v110;
      unint64_t v32 = &AnalyticsSendEvent_ptr;
LABEL_26:
      uint64_t v33 = 0;
      while (1)
      {
        if (*(void *)v110 != v90) {
          objc_enumerationMutation(obj);
        }
        uint64_t v95 = v33;
        id v34 = *(void **)(*((void *)&v109 + 1) + 8 * v33);
        uint64_t v35 = [v91 objectForKeyedSubscript:@"ConfigurationProperties"];
        uint64_t v36 = [v34 identifier];
        unsigned __int8 v37 = [v35 objectForKeyedSubscript:v36];
        v94 = [v37 objectForKeyedSubscript:@"Signature"];

        uint64_t v93 = [v34 pathController];
        id v38 = objc_alloc_init((Class)NSMutableArray);
        if (!*(unsigned char *)(a1 + 72))
        {
          id v39 = objc_alloc_init((Class)NSMutableArray);
          id v40 = [v34 pathController];
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          uint64_t v89 = v40;
          id v41 = [v40 pathRules];
          id v42 = [v41 countByEnumeratingWithState:&v105 objects:v122 count:16];
          if (!v42) {
            goto LABEL_52;
          }
          id v43 = v42;
          uint64_t v44 = *(void *)v106;
          while (1)
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v106 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void **)(*((void *)&v105 + 1) + 8 * (void)v45);
              if ([v46 isDefaultPathRule])
              {
                [v38 addObject:v46];
                goto LABEL_47;
              }
              if (*(unsigned char *)(a1 + 73))
              {
                id v47 = *(void **)(a1 + 48);
                id v48 = [v46 matchSigningIdentifier];
                LOBYTE(v47) = [v47 containsObject:v48];

                if ((v47 & 1) == 0)
                {
                  char v52 = ne_log_obj();
                  if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_45;
                  }
                  BOOL v53 = [v46 matchSigningIdentifier];
                  *(_DWORD *)long long buf = 138412290;
                  id v125 = v53;
                  long long v54 = v52;
                  long long v55 = "Removing rule for %@, not found";
                  goto LABEL_50;
                }
              }
              id v49 = *(void **)(a1 + 56);
              if (v49)
              {
                id v50 = [v46 matchSigningIdentifier];
                unsigned int v51 = [v49 containsObject:v50];

                if (v51)
                {
                  char v52 = ne_log_obj();
                  if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
LABEL_45:

                    goto LABEL_46;
                  }
                  BOOL v53 = [v46 matchSigningIdentifier];
                  *(_DWORD *)long long buf = 138412290;
                  id v125 = v53;
                  long long v54 = v52;
                  long long v55 = "Removing rule for %@, uninstalled";
LABEL_50:
                  _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, v55, buf, 0xCu);

                  goto LABEL_45;
                }
              }
              long long v56 = [v46 matchSigningIdentifier];
              [v39 addObject:v56];

              [v38 addObject:v46];
LABEL_46:
              unint64_t v32 = &AnalyticsSendEvent_ptr;
LABEL_47:
              uint64_t v45 = (char *)v45 + 1;
            }
            while (v43 != v45);
            id v57 = [v41 countByEnumeratingWithState:&v105 objects:v122 count:16];
            id v43 = v57;
            if (!v57)
            {
LABEL_52:

              id v58 = ne_log_large_obj();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                id v125 = v39;
                _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Existing apps: %@", buf, 0xCu);
              }

              [*(id *)(a1 + 48) removeObjectsInArray:v39];
              break;
            }
          }
        }
        long long v59 = ne_log_large_obj();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          id v84 = *(void **)(a1 + 48);
          *(_DWORD *)long long buf = 138412290;
          id v125 = v84;
          _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "Apps for which we need a policy: %@", buf, 0xCu);
        }

        long long v103 = 0u;
        long long v104 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v60 = *(id *)(a1 + 48);
        id v61 = [v60 countByEnumeratingWithState:&v101 objects:v121 count:16];
        if (v61) {
          break;
        }
LABEL_82:

        [v93 setPathRules:v38];
        long long v74 = ne_log_obj();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEBUG, "Final rule list:", buf, 2u);
        }

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v75 = [v93 pathRules];
        id v76 = [v75 countByEnumeratingWithState:&v96 objects:v120 count:16];
        if (v76)
        {
          id v77 = v76;
          uint64_t v78 = *(void *)v97;
          do
          {
            for (j = 0; j != v77; j = (char *)j + 1)
            {
              if (*(void *)v97 != v78) {
                objc_enumerationMutation(v75);
              }
              __int16 v80 = *(void **)(*((void *)&v96 + 1) + 8 * (void)j);
              int v81 = ne_log_obj();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                id v125 = v80;
                _os_log_debug_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
            id v77 = [v75 countByEnumeratingWithState:&v96 objects:v120 count:16];
          }
          while (v77);
        }

        __int16 v82 = *(void **)(a1 + 40);
        id v83 = sub_100015AC0();
        [v82 saveConfigurationToDisk:x0 currentSignature:x1 userUUID:x2 isUpgrade:x3 completionQueue:x4 completionHandler:x5];

        uint64_t v33 = v95 + 1;
        unint64_t v32 = &AnalyticsSendEvent_ptr;
        if ((id)(v95 + 1) == v92)
        {
          id v92 = [obj countByEnumeratingWithState:&v109 objects:v123 count:16];
          if (!v92) {
            goto LABEL_95;
          }
          goto LABEL_26;
        }
      }
      id v62 = v61;
      uint64_t v63 = *(void *)v102;
LABEL_59:
      uint64_t v64 = 0;
      while (1)
      {
        if (*(void *)v102 != v63) {
          objc_enumerationMutation(v60);
        }
        long long v65 = *(void **)(*((void *)&v101 + 1) + 8 * v64);
        if (*(unsigned char *)(a1 + 73)
          || ([(id)qword_100042CC0 containsObject:*(void *)(*((void *)&v101 + 1) + 8 * v64)] & 1) != 0)
        {
          goto LABEL_72;
        }
        id v66 = objc_alloc((Class)LSApplicationRecord);
        id v100 = 0;
        id v67 = [v66 initWithBundleIdentifier:v65 allowPlaceholder:0 error:&v100];
        id v68 = v100;
        if ([v67 developerType] == 1)
        {
          unsigned __int8 v69 = [v67 isAppStoreVendable];
          if ([v67 developerType] == 1)
          {
            char v70 = v69 ^ 1;
LABEL_69:
            if ([v67 isDeletableSystemApplication] & 1) != 0 || (v70)
            {
LABEL_78:
              long long v72 = ne_log_obj();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                id v125 = v65;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "Ignoring local network rule for %@, not eligible", buf, 0xCu);
              }

              unint64_t v32 = &AnalyticsSendEvent_ptr;
              goto LABEL_75;
            }
            goto LABEL_71;
          }
          if ((v69 & 1) == 0) {
            goto LABEL_78;
          }
        }
        else if ([v67 developerType] == 1)
        {
          char v70 = 0;
          goto LABEL_69;
        }
LABEL_71:

        unint64_t v32 = &AnalyticsSendEvent_ptr;
LABEL_72:
        id v68 = [objc_alloc((Class)v32[318]) initWithSigningIdentifier:v65];
        [v68 setAllowEmptyDesignatedRequirement:1];
        [v68 setDenyMulticast:1];
        [v68 setMulticastPreferenceSet:0];
        long long v71 = ne_log_obj();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412546;
          id v125 = v65;
          __int16 v126 = 2112;
          id v127 = v68;
          _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Created path rule for %@: %@", buf, 0x16u);
        }

        [v38 addObject:v68];
LABEL_75:

        if (v62 == (id)++v64)
        {
          id v73 = [v60 countByEnumeratingWithState:&v101 objects:v121 count:16];
          id v62 = v73;
          if (!v73) {
            goto LABEL_82;
          }
          goto LABEL_59;
        }
      }
    }
LABEL_21:
    [v11 insertObject:v15 atIndex:0];
    goto LABEL_22;
  }
  int v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v125 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to load configurations with error %@", buf, 0xCu);
  }
LABEL_96:
}

void sub_10001AB08(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = ne_log_obj();
  int64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to remove duplicate %{public}@ configuration with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removed duplicate %{public}@ configuration", (uint8_t *)&v9, 0xCu);
  }
}

void sub_10001AC14(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int64_t v5 = ne_log_obj();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to save configuration with error %@ for %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v_Block_object_dispose(&STACK[0x420], 8) = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Saved configuration successfully", (uint8_t *)&v8, 2u);
  }
}

void sub_10001AD20(id a1)
{
  dispatch_queue_t v1 = (void *)qword_100042CB8;
  qword_100042CB8 = (uint64_t)&off_10003FD18;

  id v2 = (void *)qword_100042CC0;
  qword_100042CC0 = (uint64_t)&off_10003FD30;
}

void sub_10001AD70(uint64_t a1, void *a2, BOOL *a3)
{
  id v34 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = [v34 plugInKitPlugins];
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = v34;
    id v8 = v5;
    id v9 = v6;
    self;
    __int16 v10 = [v7 entitlementValueForKey:@"com.apple.networking.vpn.configuration" ofClass:objc_opt_class()];
    if (isa_nsarray()
      && [v10 count]
      && (!v9 || [v10 containsObject:v9]))
    {
      id v28 = v10;
      id v29 = v9;
      uint64_t v30 = v7;
      uint64_t v32 = a1;
      uint64_t v33 = a3;
      unsigned int v27 = [v9 hasPrefix:@"com.apple."];
      id v11 = objc_alloc_init((Class)NSMutableDictionary);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v31 = v8;
      id v12 = v8;
      id v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v36;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v18 = [v17 protocol];
            unsigned __int8 v19 = [v18 isEqualToString:@"com.apple.networkextension.app-proxy"];

            CFStringRef v20 = @"HasAppProxy";
            if ((v19 & 1) == 0)
            {
              unint64_t v21 = [v17 protocol];
              unsigned int v22 = [v21 isEqualToString:@"com.apple.networkextension.packet-tunnel"];

              CFStringRef v20 = @"HasPacketTunnel";
              if (!v22) {
                continue;
              }
            }
            [v11 setObject:&__kCFBooleanTrue forKeyedSubscript:v20];
          }
          id v14 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v14);
      }

      if (v27 && ![v11 count])
      {
        id v24 = v11;
        id v11 = 0;
        a1 = v32;
        a3 = v33;
        id v7 = v30;
        id v8 = v31;
        __int16 v10 = v28;
      }
      else
      {
        id v7 = v30;
        id v23 = [v30 bundleIdentifier];
        [v11 setObject:v23 forKeyedSubscript:@"PluginType"];

        __int16 v10 = v28;
        [v11 setObject:v28 forKeyedSubscript:@"LegacyPluginTypes"];
        id v24 = [v30 localizedName];
        [v11 setObject:v24 forKeyedSubscript:@"AppName"];
        a1 = v32;
        a3 = v33;
        id v8 = v31;
      }

      id v9 = v29;
    }
    else
    {
      id v11 = 0;
    }

    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v11;
  }
  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

void sub_10001B0CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (!v3 || xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = 0;
LABEL_4:
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
    goto LABEL_5;
  }
  int64_t int64 = xpc_dictionary_get_int64(xdict, "result-code");
  uint64_t v6 = xpc_dictionary_get_value(xdict, "result-data");
  uint64_t v4 = v6;
  if (int64 || !v6 || xpc_get_type(v6) != (xpc_type_t)&_xpc_type_endpoint) {
    goto LABEL_4;
  }
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, v4);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

LABEL_5:
}

void sub_10001B1D4(uint64_t a1, const char *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    id Property = objc_getProperty(v4, a2, 48, 1);
  }
  else {
    id Property = 0;
  }
  sub_100001CA0((uint64_t)NEHelperServer, Property, (int64_t)a2, 0);
  uint64_t v6 = *(void **)(a1 + 40);

  sub_100001CA0((uint64_t)NEHelperServer, v6, 0, 0);
}

void sub_10001B258(unsigned __int8 *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = v9;
  if (a1)
  {
    id v47 = a1;
    id v48 = v9;
    id v11 = v7;
    id v12 = [v11 VPN];
    id v13 = [v12 protocol];

    id v14 = [v13 identityData];

    id v49 = v8;
    id v50 = v7;
    if (v14)
    {
      uint64_t v15 = [v13 identityData];
      uint64_t v16 = [v13 identityDataPassword];
      id v14 = +[NEIdentityKeychainItem importPKCS12Data:v15 passphrase:v16];

      if (v14)
      {
        if ([v14 count])
        {
          id v17 = [v14 firstObject];
          [v13 setIdentityReferenceInternal:v17];
        }
      }
    }
    uint64_t v45 = v13;
    uint64_t v46 = v11;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v18 = [v11 relay];
    unsigned __int8 v19 = [v18 relays];

    id v20 = [v19 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v59;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v59 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          uint64_t v25 = [v24 identityData];

          if (v25)
          {
            id v26 = [v24 identityData];
            unsigned int v27 = [v24 identityDataPassword];
            id v28 = +[NEIdentityKeychainItem importPKCS12Data:v26 passphrase:v27];

            if (v28)
            {
              if ([v28 count])
              {
                id v29 = [v28 firstObject];
                [v24 setIdentityReferenceInternal:v29];
              }
              if ((unint64_t)[v28 count] >= 2)
              {
                id v30 = [v28 mutableCopy];
                [v30 removeObjectAtIndex:0];
                [v24 setCertificateReferences:v30];
              }
              id v14 = v28;
            }
            else
            {
              id v14 = 0;
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v21);
    }

    sub_10001B750((uint64_t)v47, v46);
    id v31 = [v46 VPN];
    uint64_t v32 = [v31 protocol];
    id v33 = [v32 type];

    id v8 = v49;
    id v7 = v50;
    __int16 v10 = v48;
    if (v33 == (id)1)
    {
      id v34 = [v46 VPN];
      long long v35 = [v34 protocol];

      if ([v35 authenticationMethod] == (id)1) {
        [v35 setLocalIdentifier:0];
      }
      else {
        [v35 setIdentityReferenceInternal:0];
      }
    }
    long long v36 = [v46 contentFilter];
    if (v36 && (int v37 = v47[16], v36, v37))
    {
      long long v38 = sub_10001B9A4();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001B9FC;
      block[3] = &unk_100039790;
      id v39 = &v54;
      id v54 = v46;
      id v57 = v48;
      id v55 = v49;
      long long v56 = v47;
      dispatch_async(v38, block);

      id v40 = v57;
    }
    else
    {
      id v40 = +[NEConfigurationManager sharedManagerForAllUsers];
      id v42 = objc_getProperty(v47, v41, 48, 1);
      id Property = objc_getProperty(v47, v43, 32, 1);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10001BC1C;
      v51[3] = &unk_100039178;
      id v39 = &v52;
      id v52 = v48;
      [v40 saveConfigurationToDisk:v46 currentSignature:v49 userUUID:v42 isUpgrade:0 completionQueue:Property completionHandler:v51];
    }
  }
}

void sub_10001B750(uint64_t a1, void *a2)
{
  if (a1)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = [a2 relay];
    id v3 = [v2 relays];

    id v4 = [v3 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v9 = [v8 identityReferenceInternal];

          if (v9)
          {
            __int16 v10 = [v8 certificateReferences];

            if (v10)
            {
              id v11 = [v8 certificateReferences];
              id v12 = [v8 identityReferenceInternal];
              id v13 = [v11 arrayByAddingObject:v12];
            }
            else
            {
              id v11 = [v8 identityReferenceInternal];
              id v21 = v11;
              id v13 = +[NSArray arrayWithObjects:&v21 count:1];
            }

            id v14 = v13;
            self;
            if ([v14 count])
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100003E24;
              block[3] = &unk_1000397B8;
              id v20 = v14;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v5);
    }
  }
}

id sub_10001B9A4()
{
  self;
  if (qword_100042CA8 != -1) {
    dispatch_once(&qword_100042CA8, &stru_100039110);
  }
  v0 = (void *)qword_100042CA0;

  return v0;
}

void sub_10001B9FC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationIdentifier];
  unsigned __int8 v3 = sub_10001499C((uint64_t)NEHelperConfigurationManager, v2);

  if (v3)
  {
    id v4 = sub_10001B9A4();
    dispatch_suspend(v4);

    uint64_t v6 = +[NEConfigurationManager sharedManagerForAllUsers];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 48, 1);
    }
    id v11 = Property;
    id v12 = *(void **)(a1 + 48);
    if (v12) {
      id v13 = objc_getProperty(v12, v10, 32, 1);
    }
    else {
      id v13 = 0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BC64;
    v17[3] = &unk_100039178;
    id v18 = *(id *)(a1 + 56);
    [v6 saveConfigurationToDisk:v7 currentSignature:v8 userUUID:v11 isUpgrade:0 completionQueue:v13 completionHandler:v17];
  }
  else
  {
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = [*(id *)(a1 + 32) applicationIdentifier];
      long long v16 = [*(id *)(a1 + 32) name];
      *(_DWORD *)long long buf = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ is no longer the current allowed content filter app, cannot save configuration %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_10001BC1C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 code];
  id v4 = *(uint64_t (**)(uint64_t, id))(v2 + 16);

  return v4(v2, v3);
}

uint64_t sub_10001BC64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10001B9A4();
  dispatch_resume(v4);

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 code];

  uint64_t v7 = *(uint64_t (**)(uint64_t, id))(v5 + 16);

  return v7(v5, v6);
}

void sub_10001BCE8(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("allowed-content-filter", v3);
  uint64_t v2 = (void *)qword_100042CA0;
  qword_100042CA0 = (uint64_t)v1;
}

void sub_10001BD4C()
{
  self;
  if (qword_100042CE8 != -1)
  {
    dispatch_once(&qword_100042CE8, &stru_1000396D0);
  }
}

id sub_10001BD9C(uint64_t a1)
{
  uint64_t v2 = [(id)qword_100042CD8 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = (void *)qword_100042CD8;
  uint64_t v6 = *(void *)(a1 + 32);

  return [v5 removeObjectForKey:v6];
}

void sub_10001BDFC(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v2 = (void *)qword_100042CD8;
  qword_100042CD8 = (uint64_t)v1;

  uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("pending operations", v5);
  id v4 = (void *)qword_100042CE0;
  qword_100042CE0 = (uint64_t)v3;
}

void sub_10001BED8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSMutableArray array];
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "bundle-id");
  BOOL v28 = xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 32), "one-per-configuration");
  if (string)
  {
    uint64_t v26 = a1;
    id v29 = [objc_alloc((Class)NSString) initWithUTF8String:string];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v27 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
    BOOL v8 = v28;
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v13 = [v12 appVPN:v26];
          if (v13)
          {
            id v14 = (void *)v13;
            long long v15 = [v12 appVPN];
            unsigned int v16 = [v15 isEnabled];

            if (v16)
            {
              long long v17 = [v12 appVPN];
              id v18 = [v17 copyAppRuleBySigningIdentifier:v29];

              if (v18)
              {
                if (v8)
                {
                  unsigned __int8 v19 = [v18 matchDomains];
                  id v20 = [v19 firstObject];

                  if (v20) {
                    [v4 addObject:v20];
                  }
                }
                else
                {
                  long long v32 = 0u;
                  long long v33 = 0u;
                  long long v30 = 0u;
                  long long v31 = 0u;
                  id v20 = [v18 matchDomains];
                  id v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
                  if (v21)
                  {
                    id v22 = v21;
                    uint64_t v23 = *(void *)v31;
                    do
                    {
                      for (j = 0; j != v22; j = (char *)j + 1)
                      {
                        if (*(void *)v31 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        [v4 addObject:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
                      }
                      id v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
                    }
                    while (v22);
                    BOOL v8 = v28;
                  }
                }
              }
            }
          }
        }
        id v9 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v9);
    }

    a1 = v26;
    id v3 = v27;
  }
  uint64_t v25 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 0, v25);
}

void sub_10001C1A8(uint64_t a1, void *a2)
{
  uint64_t v39 = a1;
  id v2 = a2;
  id v3 = +[NSMutableDictionary dictionary];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v55;
    uint64_t v41 = *(void *)v55;
    do
    {
      id v7 = 0;
      id v42 = v5;
      do
      {
        if (*(void *)v55 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v7);
        uint64_t v9 = [v8 pathController:v39];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          id v11 = [v8 pathController];
          unsigned int v12 = [v11 isEnabled];

          if (v12)
          {
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            uint64_t v13 = [v8 pathController];
            id v14 = [v13 pathRules];

            id v15 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
            uint64_t v45 = v7;
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v51;
              while (2)
              {
                for (i = 0; i != v16; i = (char *)i + 1)
                {
                  if (*(void *)v51 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  unsigned __int8 v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  if ([v19 isDefaultPathRule])
                  {
                    id v44 = v19;
                    goto LABEL_18;
                  }
                }
                id v16 = [v14 countByEnumeratingWithState:&v50 objects:v59 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }
            id v44 = 0;
LABEL_18:

            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            id v20 = [v8 pathController];
            id v21 = [v20 pathRules];

            id v22 = [v21 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v47;
              do
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v47 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
                  id v27 = [v26 matchSigningIdentifier];
                  id v28 = [v3 objectForKeyedSubscript:v27];

                  if (!v28)
                  {
                    id v29 = objc_alloc((Class)NEPathRule);
                    long long v30 = [v26 matchSigningIdentifier];
                    id v28 = [v29 initWithSigningIdentifier:v30];
                  }
                  long long v31 = [v8 pathController];
                  unsigned __int8 v32 = [v31 ignoreRouteRules];

                  if ((v32 & 1) == 0)
                  {
                    [v28 addCellularBehavior:[v26 cellularBehavior] grade:[v8 grade]];
                    [v28 addWiFiBehavior:[v26 wifiBehavior] grade:[v8 grade]];
                  }
                  if ([v26 denyCellularFallback]) {
                    [v28 setDenyCellularFallback:1];
                  }
                  if ([v26 denyMulticast]) {
                    [v28 setDenyMulticast:1];
                  }
                  if ([v26 multicastPreferenceSet]) {
                    [v28 setMulticastPreferenceSet:1];
                  }
                  long long v33 = [v26 matchSigningIdentifier];
                  [v3 setObject:v28 forKeyedSubscript:v33];
                }
                id v23 = [v21 countByEnumeratingWithState:&v46 objects:v58 count:16];
              }
              while (v23);
            }

            uint64_t v6 = v41;
            id v5 = v42;
            id v7 = v45;
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v5);
  }

  long long v34 = [v3 allValues];
  id v35 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  long long v36 = v35;
  if (v34) {
    [v35 encodeObject:v34 forKey:@"config-aggregate-rules"];
  }
  [v36 finishEncoding:v39];
  long long v37 = [v36 encodedData];
  xpc_object_t v38 = xpc_data_create([v37 bytes], (size_t)[v37 length]);
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(v40 + 32), 0, v38);
}

void sub_10001C658(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 code];
  }
  else
  {
    id v4 = sub_100020288();
    id v6 = [*(id *)(a1 + 32) UUIDString];
    if (v4)
    {
      id Property = objc_getProperty(v4, v5, 8, 1);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100025584;
      v9[3] = &unk_100039768;
      v9[4] = v4;
      id v10 = v6;
      dispatch_async(Property, v9);
    }
    id v3 = 0;
  }
  BOOL v8 = *(void **)(a1 + 40);

  sub_100001CA0((uint64_t)NEHelperServer, v8, (int64_t)v3, 0);
}

void sub_10001C770(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      unsigned int v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v12);
        id v14 = [v8 objectForKeyedSubscript:@"ConfigurationProperties"];
        id v15 = [v13 identifier];
        id v16 = [v14 objectForKeyedSubscript:v15];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"Signature"];

        if (v17 && sub_10001C9A8((uint64_t)NEHelperConfigurationManager, *(void **)(a1 + 32), v13))
        {
          id v18 = +[NEConfigurationManager sharedManagerForAllUsers];
          unsigned __int8 v19 = NECopyConsoleUserUUID();
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10001D050;
          v21[3] = &unk_1000392B8;
          void v21[4] = v13;
          [v18 saveConfigurationToDisk:v13 currentSignature:v17 userUUID:v19 isUpgrade:0 completionQueue:&_dispatch_main_q completionHandler:v21];
        }
        unsigned int v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

BOOL sub_10001C9A8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  self;
  id v6 = v5;
  id v7 = v4;
  self;
  id v8 = [v7 appVPN];
  id v9 = [v7 contentFilter];
  id v10 = [v9 perApp];

  if (v10)
  {
    uint64_t v11 = [v7 contentFilter];
  }
  else
  {
    unsigned int v12 = [v7 dnsProxy];
    uint64_t v13 = [v12 perApp];

    if (v13)
    {
      uint64_t v11 = [v7 dnsProxy];
    }
    else
    {
      id v14 = [v7 relay];
      id v15 = [v14 perApp];

      if (!v15)
      {
        uint64_t v17 = 0;
        id v20 = 0;
        id v18 = v8;
        if (v8) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }
      uint64_t v11 = [v7 relay];
    }
  }
  id v16 = v11;
  uint64_t v17 = [v11 perApp];

  if (v8)
  {
    id v18 = v8;
LABEL_10:
    unsigned __int8 v19 = [v18 appRules];
    id v20 = [v19 mutableCopy];

    goto LABEL_11;
  }
  id v18 = v17;
  if (v17) {
    goto LABEL_10;
  }
  id v20 = 0;
LABEL_11:
  id v21 = [v7 externalIdentifier];

  if (v21)
  {
    long long v22 = [v7 externalIdentifier];
    long long v23 = [v6 objectForKeyedSubscript:v22];

    if (isa_nsarray() && [v23 count])
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v24 = v23;
      id v25 = [v24 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (!v25) {
        goto LABEL_33;
      }
      id v26 = v25;
      long long v54 = v23;
      long long v55 = v17;
      long long v56 = v8;
      id v57 = v6;
      uint64_t v27 = *(void *)v60;
      while (1)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v60 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v59 + 1) + 8 * i);
          if (!isa_nsstring())
          {
            long long v30 = ne_log_obj();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              long long v31 = [v7 externalIdentifier];
              *(_DWORD *)long long buf = 138412546;
              uint64_t v64 = v31;
              __int16 v65 = 2112;
              CFStringRef v66 = @"NETestAppMapping";
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Value of %@ in %@ in the Info.plist contains a non-string object, skipping", buf, 0x16u);
            }
            goto LABEL_27;
          }
          if (!v20)
          {
            id v20 = objc_alloc_init((Class)NSMutableArray);
LABEL_26:
            long long v30 = [objc_alloc((Class)NEAppRule) initWithSigningIdentifier:v29];
            [v20 addObject:v30];
LABEL_27:

            continue;
          }
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_10001D00C;
          v58[3] = &unk_100039560;
          v58[4] = v29;
          if ([v20 indexOfObjectPassingTest:v58] == (id)0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_26;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (!v26)
        {
          id v8 = v56;
          id v6 = v57;
          long long v23 = v54;
          goto LABEL_33;
        }
      }
    }
    long long v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v53 = [v7 externalIdentifier];
      *(_DWORD *)id v67 = 138412546;
      id v68 = v53;
      __int16 v69 = 2112;
      CFStringRef v70 = @"NETestAppMapping";
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Value of %@ in %@ in the Info.plist is not an array or is empty", v67, 0x16u);
    }
LABEL_33:
  }
  id v32 = [v20 count];
  if (v32)
  {
    long long v33 = [v7 appVPN];

    if (v33)
    {
      long long v34 = [v7 appVPN];
      [v34 setAppRules:v20];
LABEL_53:

      goto LABEL_54;
    }
    id v35 = [v7 contentFilter];

    if (v35)
    {
      long long v36 = [v7 contentFilter];
      long long v37 = [v36 perApp];

      if (!v37)
      {
        id v38 = objc_alloc_init((Class)NEPerApp);
        uint64_t v39 = [v7 contentFilter];
        [v39 setPerApp:v38];
      }
      uint64_t v40 = [v7 contentFilter:v54, v55, v56, v57];
LABEL_52:
      long long v34 = v40;
      long long v51 = [v40 perApp];
      [v51 setAppRules:v20];

      goto LABEL_53;
    }
    uint64_t v41 = [v7 dnsProxy];

    if (v41)
    {
      id v42 = [v7 dnsProxy];
      SEL v43 = [v42 perApp];

      if (!v43)
      {
        id v44 = objc_alloc_init((Class)NEPerApp);
        uint64_t v45 = [v7 dnsProxy];
        [v45 setPerApp:v44];
      }
      uint64_t v40 = [v7 dnsProxy:v54, v55, v56, v57];
      goto LABEL_52;
    }
    long long v46 = [v7 relay];

    if (v46)
    {
      long long v47 = [v7 relay];
      long long v48 = [v47 perApp];

      if (!v48)
      {
        id v49 = objc_alloc_init((Class)NEPerApp);
        long long v50 = [v7 relay];
        [v50 setPerApp:v49];
      }
      uint64_t v40 = [v7 relay:v54, v55, v56, v57];
      goto LABEL_52;
    }
  }
LABEL_54:

  return v32 != 0;
}

id sub_10001D00C(uint64_t a1, void *a2)
{
  id v3 = [a2 matchSigningIdentifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_10001D050(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 32) identifier];
      int v6 = 138412546;
      id v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to add app rules to %@: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_10001D130(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  int64_t int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "permission-type");
  id v10 = [*(id *)(a1 + 40) contentFilter];
  if (!v10 || *(void *)(a1 + 48))
  {

    goto LABEL_4;
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15)
  {
    char v16 = *(unsigned char *)(v15 + 12);

    if (v16) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  id v17 = v8;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id v18 = v7;
  id v19 = [v18 countByEnumeratingWithState:&v156 objects:v165 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v157;
    while (2)
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v157 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v156 + 1) + 8 * i);
        long long v24 = [v23 contentFilter];

        if (v24)
        {
          long long v48 = ne_log_obj();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            id Property = *(id *)(a1 + 56);
            if (Property) {
              id Property = objc_getProperty(Property, v49, 64, 1);
            }
            id v106 = Property;
            long long v107 = [*(id *)(a1 + 40) identifier];
            long long v109 = [v23 identifier];
            id v110 = *(id *)(a1 + 56);
            if (v110) {
              id v110 = objc_getProperty(v110, v108, 40, 1);
            }
            *(_DWORD *)char v172 = 138413058;
            id v173 = v106;
            __int16 v174 = 2112;
            uint64_t v175 = v107;
            __int16 v176 = 2112;
            id v177 = v109;
            __int16 v178 = 2112;
            id v179 = v110;
            _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@ trying to save a new content filter configuration with identifier %@, but a configuration (%@) already exists for application identifier %@", v172, 0x2Au);
          }
          sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 10, 0);

          id v8 = v17;
          goto LABEL_144;
        }
      }
      id v20 = [v18 countByEnumeratingWithState:&v156 objects:v165 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  id v8 = v17;
LABEL_4:
  if (int64 == 3)
  {
LABEL_7:
    unsigned int v12 = "APP_WARNING_HEADER_DNS_PROXY";
    uint64_t v13 = "APP_WARNING_DNS_PROXY";
    id v14 = @"DNS Proxy";
    goto LABEL_9;
  }
  if (!int64)
  {
    uint64_t v11 = [*(id *)(a1 + 40) dnsProxy];

    if (!v11)
    {
      unsigned int v12 = 0;
      uint64_t v13 = 0;
      id v14 = 0;
LABEL_25:
      id v25 = v12;
      id v26 = v13;
      uint64_t v27 = [*(id *)(a1 + 40) contentFilter];

      if (v27)
      {
        id v25 = "APP_WARNING_HEADER_FILTER";
        id v26 = "APP_WARNING_FILTER";
        id v14 = @"content filter";
      }
      id v28 = [*(id *)(a1 + 40) relay];

      if (v28)
      {
        unsigned int v12 = "APP_WARNING_HEADER_RELAY";
        uint64_t v13 = "APP_WARNING_RELAY";
        id v14 = @"Relay";
      }
      else
      {
        unsigned int v12 = v25;
        uint64_t v13 = (char *)v26;
      }
      goto LABEL_30;
    }
    goto LABEL_7;
  }
  id v14 = 0;
  uint64_t v13 = 0;
  unsigned int v12 = 0;
LABEL_9:
  if (int64 == 1)
  {
    unsigned int v12 = "APP_WARNING_HEADER_FILTER";
    uint64_t v13 = "APP_WARNING_FILTER";
    id v14 = @"content filter";
    goto LABEL_30;
  }
  if (!int64) {
    goto LABEL_25;
  }
LABEL_30:
  if (int64 == 2 || !v14)
  {
    uint64_t v29 = [*(id *)(a1 + 40) VPN];
    id v30 = [v29 tunnelType];

    id v14 = v30 == (id)2 ? @"Transparent Proxy" : @"VPN";
    uint64_t v13 = v30 == (id)2 ? "APP_WARNING_FILTER" : "APP_WARNING_VPN";
    unsigned int v12 = "APP_WARNING_HEADER_VPN";
    if (v30 == (id)2) {
      unsigned int v12 = "APP_WARNING_HEADER_TRANSPARENT_PROXY";
    }
  }
  id v128 = v13;
  int v129 = v12;
  id v139 = v7;
  if ([*(id *)(a1 + 40) isTransparentProxy])
  {
    long long v31 = *(unsigned char **)(a1 + 56);
    id v32 = *(id *)(a1 + 40);
    id v33 = v7;
    if (v31)
    {
      long long v34 = ne_log_obj();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        if (v31[10]) {
          long long v52 = "Enabled";
        }
        else {
          long long v52 = "Disabled";
        }
        long long v53 = "Yes";
        if ((v31[13] & 1) == 0) {
          long long v53 = "No";
        }
        *(_DWORD *)long long buf = 136315394;
        long long v167 = v52;
        __int16 v168 = 2080;
        uint64_t v169 = (uint64_t)v53;
        _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "platform entitled: %s isDevelopment: %s", buf, 0x16u);
      }

      if ((v31[10] & 1) == 0)
      {
        self = v31;
        id v35 = [v32 VPN];
        long long v36 = [v35 protocol];

        if (!v36)
        {
          int64_t v47 = 2;
LABEL_76:

          sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), v47, 0);
          goto LABEL_144;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v33)
          {
            id v137 = v14;
            long long v162 = 0u;
            long long v163 = 0u;
            long long v160 = 0u;
            long long v161 = 0u;
            id v37 = v33;
            id v38 = [v37 countByEnumeratingWithState:&v160 objects:v172 count:16];
            if (v38)
            {
              id v39 = v38;
              id v127 = v36;
              id v130 = v33;
              uint64_t v132 = a1;
              id v40 = v8;
              uint64_t v41 = *(void *)v161;
              while (2)
              {
                for (j = 0; j != v39; j = (char *)j + 1)
                {
                  if (*(void *)v161 != v41) {
                    objc_enumerationMutation(v37);
                  }
                  SEL v43 = *(void **)(*((void *)&v160 + 1) + 8 * (void)j);
                  id v44 = [v43 identifier];
                  uint64_t v45 = [v32 identifier];

                  if (v44 == v45)
                  {
                    long long v50 = [v43 VPN];
                    long long v51 = [v50 protocol];

                    uint64_t v46 = (uint64_t)[v51 order];
                    id v8 = v40;
                    id v33 = v130;
                    a1 = v132;
                    long long v36 = v127;
                    goto LABEL_61;
                  }
                }
                id v39 = [v37 countByEnumeratingWithState:&v160 objects:v172 count:16];
                if (v39) {
                  continue;
                }
                break;
              }
              id v8 = v40;
              id v33 = v130;
              a1 = v132;
              long long v36 = v127;
            }
            uint64_t v46 = 0x7FFFFFFFLL;
LABEL_61:

            id v14 = v137;
          }
          else
          {
            uint64_t v46 = 0x7FFFFFFFLL;
          }
          long long v54 = ne_log_obj();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            long long v102 = (const char *)[v36 order];
            id v104 = objc_getProperty(self, v103, 40, 1);
            *(_DWORD *)long long buf = 134218498;
            long long v167 = v102;
            __int16 v168 = 2048;
            uint64_t v169 = v46;
            __int16 v170 = 2112;
            id v171 = v104;
            _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "protocol.order %lu, allowed_order %lu, applicationID: %@", buf, 0x20u);
          }

          id v7 = v139;
          if ([v36 order] != (id)v46)
          {
            if (objc_getProperty(self, v55, 40, 1))
            {
              long long v56 = ne_log_obj();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                long long v111 = (const char *)objc_getProperty(self, v57, 64, 1);
                *(_DWORD *)long long buf = 138412290;
                long long v167 = v111;
                _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@ trying to modify transparent proxy order through an app. Modifying transparent proxy order is only allowed through profile.", buf, 0xCu);
              }

              int64_t v47 = 10;
              goto LABEL_76;
            }
          }
        }
      }
    }
  }
  uint64_t v58 = *(void *)(a1 + 56);
  long long v59 = *(void **)(a1 + 40);
  id v60 = v7;
  id v61 = v59;
  long long v62 = v61;
  if (!v58)
  {

    id v87 = *(void **)(a1 + 40);
    id v7 = v139;
LABEL_138:
    long long v118 = [v87 appPush];

    if (v118)
    {
      id v120 = *(void **)(a1 + 48);
      long long v119 = *(unsigned __int8 **)(a1 + 56);
      v154[0] = _NSConcreteStackBlock;
      v154[1] = 3221225472;
      v154[2] = sub_10001DF48;
      v154[3] = &unk_1000391A0;
      CFStringRef v121 = *(void **)(a1 + 40);
      id v155 = *(id *)(a1 + 32);
      sub_10001B258(v119, v121, v120, v154);
      CFStringRef v122 = +[NEConfigurationManager sharedManagerForAllUsers];
      uint64_t v124 = [*(id *)(a1 + 40) application];
      id v125 = *(void **)(a1 + 56);
      if (v125) {
        id v126 = objc_getProperty(v125, v123, 32, 1);
      }
      else {
        id v126 = 0;
      }
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_10001DF64;
      v152[3] = &unk_1000391C8;
      id v153 = *(id *)(a1 + 40);
      [v122 showLocalNetworkAlertForApp:v124 withCompletionQueue:v126 handler:v152];

      long long v99 = v155;
    }
    else
    {
      v146[0] = _NSConcreteStackBlock;
      v146[1] = 3221225472;
      v146[2] = sub_10001E04C;
      v146[3] = &unk_100039218;
      v146[4] = *(void *)(a1 + 56);
      id v147 = *(id *)(a1 + 40);
      uint64_t v150 = v129;
      uint64_t v151 = v128;
      id v148 = *(id *)(a1 + 48);
      id v149 = *(id *)(a1 + 32);
      +[NEUserNotification cancelCurrentNotificationWithResponse:2 queue:&_dispatch_main_q completionHandler:v146];

      long long v99 = v147;
    }
    goto LABEL_143;
  }
  selfa = +[NSPredicate predicateWithBlock:&stru_100039150];
  uint64_t v63 = [v60 filteredArrayUsingPredicate:];
  if (!int64) {
    goto LABEL_90;
  }
  uint64_t v64 = [v62 contentFilter];
  __int16 v65 = (void *)v64;
  if (int64 >= 2 && v64) {
    goto LABEL_89;
  }
  CFStringRef v66 = v14;
  uint64_t v67 = [v62 VPN];
  id v68 = (void *)v67;
  if (int64 > 2 && v67)
  {
LABEL_88:

    id v14 = v66;
LABEL_89:

    goto LABEL_90;
  }
  id v69 = v8;
  CFStringRef v70 = v63;
  long long v71 = [v62 appVPN];
  long long v72 = v71;
  if (int64 >= 3 && v71)
  {

    uint64_t v63 = v70;
    id v8 = v69;
    goto LABEL_88;
  }
  uint64_t v134 = [v62 dnsProxy];

  id v14 = v66;
  uint64_t v63 = v70;
  id v8 = v69;
  if (int64 <= 3 || !v134)
  {
    BOOL v86 = [v63 count] != 0;
    goto LABEL_105;
  }
LABEL_90:
  v131 = v63;
  id v133 = v60;
  uint64_t v138 = v14;
  uint64_t v73 = a1;
  id v74 = v8;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v75 = v63;
  id v76 = [v75 countByEnumeratingWithState:&v160 objects:v172 count:16];
  if (v76)
  {
    id v77 = v76;
    uint64_t v78 = *(void *)v161;
    while (2)
    {
      for (k = 0; k != v77; k = (char *)k + 1)
      {
        if (*(void *)v161 != v78) {
          objc_enumerationMutation(v75);
        }
        __int16 v80 = *(void **)(*((void *)&v160 + 1) + 8 * (void)k);
        uint64_t v81 = [v62 contentFilter];
        if (v81)
        {
          __int16 v82 = (void *)v81;
          id v83 = [v80 contentFilter];

          if (v83)
          {
LABEL_103:

            BOOL v86 = 1;
            goto LABEL_104;
          }
        }
        id v84 = [v62 contentFilter];
        if (v84)
        {
        }
        else
        {
          id v85 = [v80 contentFilter];

          if (!v85) {
            goto LABEL_103;
          }
        }
      }
      id v77 = [v75 countByEnumeratingWithState:&v160 objects:v172 count:16];
      if (v77) {
        continue;
      }
      break;
    }
  }

  BOOL v86 = 0;
LABEL_104:
  id v8 = v74;
  a1 = v73;
  id v14 = v138;
  uint64_t v63 = v131;
  id v60 = v133;
LABEL_105:

  id v87 = *(void **)(a1 + 40);
  id v7 = v139;
  if (!v86) {
    goto LABEL_138;
  }
  if ([v87 grade] != (id)2
    || ([*(id *)(a1 + 40) relay],
        char v88 = objc_claimAutoreleasedReturnValue(),
        v88,
        v88))
  {
LABEL_124:
    long long v97 = *(void **)(a1 + 48);
    long long v96 = *(unsigned __int8 **)(a1 + 56);
    v140[0] = _NSConcreteStackBlock;
    v140[1] = 3221225472;
    v140[2] = sub_10001E188;
    v140[3] = &unk_1000391A0;
    long long v98 = *(void **)(a1 + 40);
    id v141 = *(id *)(a1 + 32);
    sub_10001B258(v96, v98, v97, v140);
    long long v99 = v141;
LABEL_143:

    goto LABEL_144;
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v89 = v60;
  id v90 = [v89 countByEnumeratingWithState:&v142 objects:v164 count:16];
  if (!v90)
  {
LABEL_116:
    id v95 = v89;
LABEL_123:

    goto LABEL_124;
  }
  id v91 = v90;
  uint64_t v92 = *(void *)v143;
LABEL_110:
  uint64_t v93 = 0;
  while (1)
  {
    if (*(void *)v143 != v92) {
      objc_enumerationMutation(v89);
    }
    v94 = *(void **)(*((void *)&v142 + 1) + 8 * v93);
    if ([v94 grade] == (id)2) {
      break;
    }
    if (v91 == (id)++v93)
    {
      id v91 = [v89 countByEnumeratingWithState:&v142 objects:v164 count:16];
      if (v91) {
        goto LABEL_110;
      }
      goto LABEL_116;
    }
  }
  id v95 = v94;

  if (!v95) {
    goto LABEL_124;
  }
  if (*(void *)(a1 + 48))
  {
    [v95 clearSystemKeychain];
    goto LABEL_123;
  }
  id v100 = ne_log_obj();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
  {
    id v112 = *(id *)(a1 + 56);
    id v113 = v8;
    if (v112) {
      id v112 = objc_getProperty(v112, v101, 64, 1);
    }
    id v114 = v112;
    long long v116 = [*(id *)(a1 + 40) identifier];
    id v117 = *(id *)(a1 + 56);
    if (v117) {
      id v117 = objc_getProperty(v117, v115, 40, 1);
    }
    *(_DWORD *)char v172 = 138413314;
    id v173 = v114;
    __int16 v174 = 2112;
    uint64_t v175 = v14;
    __int16 v176 = 2112;
    id v177 = v116;
    __int16 v178 = 2112;
    id v179 = v113;
    __int16 v180 = 2112;
    id v181 = v117;
    _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "%@ trying to save a new personal %@ configuration with identifier %@, but a configuration (%@) already exists for application identifier %@", v172, 0x34u);

    id v8 = v113;
  }

  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 32), 10, 0);
LABEL_144:
}

void sub_10001DF48(uint64_t a1, int64_t a2)
{
}

void sub_10001DF64(uint64_t a1, int a2)
{
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      id v5 = "granted";
    }
    else {
      id v5 = "denied";
    }
    int v6 = [*(id *)(a1 + 32) application];
    int v7 = 136315394;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "user %s local network access for %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_10001E04C(uint64_t a1)
{
  id v2 = objc_alloc((Class)NEUserNotification);
  id v4 = [*(id *)(a1 + 40) applicationName];
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  int v7 = *(void **)(a1 + 32);
  if (v7) {
    id Property = objc_getProperty(v7, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001E1A4;
  v14[3] = &unk_1000391F0;
  id v15 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = *(id *)(a1 + 56);
  id v12 = [v2 initAndShowAddConfigurationsForApp:v4 warningHeader:v5 warning:v6 callbackQueue:Property callbackHandler:v14];
  uint64_t v13 = *(void **)(a1 + 32);
  if (v13) {
    objc_setProperty_atomic(v13, v11, v12, 80);
  }
}

void sub_10001E188(uint64_t a1, int64_t a2)
{
}

void sub_10001E1A4(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    if (+[NEUserNotification shouldPromptForLocalAuthentication])
    {
      id v3 = [*(id *)(a1 + 32) identifier];
      id v4 = v3;
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v5 = *(void **)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      if (v7) {
        BOOL v34 = *(unsigned char *)(v7 + 16) != 0;
      }
      else {
        BOOL v34 = 0;
      }
      id v8 = *(void **)(a1 + 56);
      id v9 = v3;
      id v10 = v8;
      id obj = v5;
      id v11 = v5;
      id v12 = v6;
      self;
      uint64_t v13 = [NEHelperPendingOperation alloc];
      id v14 = v9;
      id v15 = v12;
      id v16 = v11;
      id v17 = v10;
      if (v13)
      {
        block.receiver = v13;
        block.super_class = (Class)NEHelperPendingOperation;
        id v18 = (NEHelperPendingOperation *)[super init];
        uint64_t v13 = v18;
        if (v18)
        {
          v18->_operation = 3;
          objc_storeStrong((id *)&v18->_configurationIdentifier, v4);
          objc_storeStrong((id *)&v13->_configuration, v6);
          objc_storeStrong((id *)&v13->_signature, obj);
          v13->_isAllowedContentFilterApp = v34;
          objc_storeStrong((id *)&v13->_requestMessage, v8);
        }
      }

      sub_10001BD4C();
      id v19 = qword_100042CE0;
      block.receiver = _NSConcreteStackBlock;
      block.super_class = (Class)3221225472;
      id v40 = sub_10001E580;
      uint64_t v41 = &unk_100039768;
      id v42 = v14;
      SEL v43 = v13;
      id v20 = v13;
      id v21 = v14;
      dispatch_sync(v19, &block);

      long long v22 = *(void **)(a1 + 48);
      if (v22)
      {
        id v23 = *(id *)(a1 + 32);
        id v25 = objc_getProperty(v22, v24, 72, 1);
        id v26 = [v23 identifier];

        uint64_t v27 = [v26 UUIDString];
        +[NSString stringWithFormat:@"prefs:root=General&path=ManagedConfigurationList/VPN/LocalAuthenticationTrigger&sender=%@&configID=%@", v25, v27];
        id obja = (id)objc_claimAutoreleasedReturnValue();

        id v28 = +[NSURL URLWithString:obja];
        uint64_t v29 = +[LSApplicationWorkspace defaultWorkspace];
        [v29 openSensitiveURL:v28 withOptions:0];
      }
    }
    else
    {
      id v32 = *(void **)(a1 + 40);
      long long v31 = *(unsigned __int8 **)(a1 + 48);
      id v33 = *(void **)(a1 + 32);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001E564;
      v37[3] = &unk_1000391A0;
      id v38 = *(id *)(a1 + 56);
      sub_10001B258(v31, v33, v32, v37);
    }
  }
  else
  {
    id v30 = *(void **)(a1 + 56);
    sub_100001CA0((uint64_t)NEHelperServer, v30, 10, 0);
  }
}

void sub_10001E564(uint64_t a1, int64_t a2)
{
}

id sub_10001E580(uint64_t a1)
{
  return [(id)qword_100042CD8 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

BOOL sub_10001E594(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  id v4 = [v3 contentFilter];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 VPN];
    if (v6)
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v7 = [v3 appVPN];
      if (v7)
      {
        BOOL v5 = 1;
      }
      else
      {
        id v8 = [v3 dnsProxy];
        if (v8)
        {
          BOOL v5 = 1;
        }
        else
        {
          id v9 = [v3 relay];
          BOOL v5 = v9 != 0;
        }
      }
    }
  }

  return v5;
}

void sub_10001EF18(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v7)
      {
        id v9 = v7;
        uint64_t v10 = *(void *)v21;
        *(void *)&long long v8 = 136315394;
        long long v19 = v8;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v6);
            }
            id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            uint64_t v13 = [v12 VPN:v19];
            id v14 = [v13 protocol];
            id v15 = [v14 type];

            if (v15 == (id)3)
            {
              id v16 = ne_log_obj();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = v19;
                id v25 = "+[NEHelperConfigurationManager handleUnsupportedConfiguration:]_block_invoke";
                __int16 v26 = 2112;
                uint64_t v27 = v12;
                _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: removing configuration %@", buf, 0x16u);
              }

              id v17 = +[NEConfigurationManager sharedManagerForAllUsers];
              id v18 = [v12 identifier];
              [v17 removeConfigurationFromDisk:v18 completionQueue:*(void *)(a1 + 32) completionHandler:&stru_1000395C8];
            }
          }
          id v9 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        }
        while (v9);
      }
    }
  }
}

void sub_10001F110(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "+[NEHelperConfigurationManager handleUnsupportedConfiguration:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_10001F1D8(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  dispatch_queue_t v3 = dispatch_queue_create("upgrade-app-groups", 0);
  int v4 = +[NEConfigurationManager sharedManagerForAllUsers];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F2CC;
  v7[3] = &unk_100039660;
  id v8 = v2;
  dispatch_queue_t v9 = v3;
  id v5 = v3;
  id v6 = v2;
  [v4 loadConfigurations:0 withFilter:0 completionQueue:v5 completionHandler:v7];
}

void sub_10001F2CC(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v51 = a3;
  id v53 = a5;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    long long v52 = 0;
    long long v55 = 0;
    id v11 = 0;
    uint64_t v12 = *(void *)v61;
    id v54 = v8;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v13);
        uint64_t v15 = [v14 applicationIdentifier];
        if (v15)
        {
          id v16 = (void *)v15;
          if (![*(id *)(a1 + 32) count])
          {

LABEL_11:
            long long v19 = ne_log_obj();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              long long v20 = [v14 applicationIdentifier];
              *(_DWORD *)long long buf = 138412290;
              __int16 v65 = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Upgrading app groups for app %@", buf, 0xCu);
            }
            long long v21 = [v14 applicationIdentifier];
            long long v22 = +[NELaunchServices bundleProxyForIdentifier:v21 uid:0 plugins:0];

            if (v22)
            {
              long long v23 = [v22 appGroups];
              id v24 = [v23 count];

              id v25 = ne_log_obj();
              __int16 v26 = v25;
              if (v24)
              {
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  uint64_t v27 = [v22 appGroups];
                  id v28 = [v14 applicationIdentifier];
                  *(_DWORD *)long long buf = 138412546;
                  __int16 v65 = v27;
                  __int16 v66 = 2112;
                  uint64_t v67 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Adding app groups %@ for app %@", buf, 0x16u);
                }
                uint64_t v29 = +[NEConfigurationManager sharedManagerForAllUsers];
                id v30 = [v22 appGroups];
                long long v31 = [v14 applicationIdentifier];
                [v29 addGroups:v30 forApp:v31];

                if (v11)
                {
                  id v8 = v54;
LABEL_26:

                  goto LABEL_27;
                }
                long long v36 = [v53 objectForKeyedSubscript:@"ConfigurationProperties"];
                id v37 = [v14 identifier];
                __int16 v26 = [v36 objectForKeyedSubscript:v37];

                uint64_t v35 = [v26 objectForKeyedSubscript:@"Signature"];

                if (isa_nsdata())
                {
                  id v38 = +[NEConfigurationManager sharedManagerForAllUsers];
                  id v39 = [v14 identifier];
                  uint64_t v56 = [v38 getCurrentUserUUIDForConfigurationID:v39 fromIndex:v53];

                  id v11 = v14;
                  long long v52 = (void *)v56;
                }
                else
                {
                  id v40 = ne_log_obj();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v41 = [v14 name];
                    *(_DWORD *)long long buf = 138412290;
                    __int16 v65 = v41;
                    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "No signature found for AppleConnect configuration %@", buf, 0xCu);
                  }
                  id v11 = 0;
                }
                id v8 = v54;
LABEL_25:

                long long v55 = (void *)v35;
                goto LABEL_26;
              }
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = [v14 applicationIdentifier];
                *(_DWORD *)long long buf = 138412290;
                __int16 v65 = v32;
                id v33 = v26;
                BOOL v34 = "App %@ does not have any app groups";
LABEL_23:
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
              }
            }
            else
            {
              __int16 v26 = ne_log_obj();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = [v14 applicationIdentifier];
                *(_DWORD *)long long buf = 138412290;
                __int16 v65 = v32;
                id v33 = v26;
                BOOL v34 = "Did not find %@ while upgrading app groups";
                goto LABEL_23;
              }
            }
            uint64_t v35 = (uint64_t)v55;
            goto LABEL_25;
          }
          id v17 = *(void **)(a1 + 32);
          id v18 = [v14 applicationIdentifier];
          LODWORD(v17) = [v17 containsObject:v18];

          if (v17) {
            goto LABEL_11;
          }
        }
LABEL_27:
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v42 = [v8 countByEnumeratingWithState:&v60 objects:v68 count:16];
      id v10 = v42;
      if (!v42) {
        goto LABEL_38;
      }
    }
  }
  long long v52 = 0;
  long long v55 = 0;
  id v11 = 0;
LABEL_38:
  char v59 = 0;
  SEL v43 = +[NEConfigurationManager sharedManagerForAllUsers];
  id v44 = [v43 copyAppGroupMapDidChange:&v59];

  if (v44) {
    BOOL v45 = v59 == 0;
  }
  else {
    BOOL v45 = 1;
  }
  if (v45)
  {
    uint64_t v46 = ne_log_obj();
    int64_t v47 = v52;
    long long v48 = v55;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "App group map did not change", buf, 2u);
    }
    goto LABEL_47;
  }
  int64_t v47 = v52;
  long long v48 = v55;
  if (v11)
  {
    id v49 = +[NEConfigurationManager sharedManagerForAllUsers];
    uint64_t v50 = *(void *)(a1 + 40);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10001F944;
    v57[3] = &unk_1000392B8;
    uint64_t v58 = v11;
    [v49 saveConfigurationToDisk:v58 currentSignature:v55 userUUID:v52 isUpgrade:0 completionQueue:v50 completionHandler:v57];

    uint64_t v46 = v58;
LABEL_47:
  }
}

void sub_10001F944(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3 && [v3 code] != (id)9)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) name];
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to save %@ while upgrading app groups: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_10001FA34(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100016E4C;
  void v8[4] = sub_100016E5C;
  id v9 = (id)os_transaction_create();
  id v3 = sub_10001B9A4();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001FB6C;
  v5[3] = &unk_1000396F8;
  id v6 = v2;
  int v7 = v8;
  id v4 = v2;
  dispatch_async(v3, v5);

  _Block_object_dispose(v8, 8);
}

void sub_10001FB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001FB6C(uint64_t a1)
{
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Current allowed content filter app is now %@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_100042CD0);
  uint64_t v4 = qword_100042C88;
  if (qword_100042C88)
  {
    if (*(void *)(a1 + 32))
    {
      LODWORD(v5) = [[(id)qword_100042C88 isEqualToString:];
      uint64_t v4 = qword_100042C88;
    }
    else
    {
      LODWORD(v5) = 1;
    }
    CFStringRef v26 = @"application-id";
    uint64_t v27 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    if (v5)
    {
      uint64_t v5 = ne_log_obj();
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v21 = qword_100042C88;
        __int16 v22 = 2112;
        uint64_t v23 = v7;
        __int16 v24 = 2112;
        uint64_t v25 = qword_100042C88;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Current allowed content filter app changed from %@ to %@, removing content filter configurations created by %@", buf, 0x20u);
      }

      LOBYTE(v5) = 1;
    }
  }
  else
  {
    id v6 = 0;
    LOBYTE(v5) = 0;
  }
  id v8 = [*(id *)(a1 + 32) copy];
  id v9 = (void *)qword_100042C88;
  qword_100042C88 = (uint64_t)v8;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042CD0);
  if (v5)
  {
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("Remove filters queue", v10);

    uint64_t v12 = sub_10001B9A4();
    dispatch_suspend(v12);

    uint64_t v13 = +[NEConfigurationManager sharedManagerForAllUsers];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001FE10;
    v17[3] = &unk_1000396B0;
    uint64_t v14 = *(void *)(a1 + 40);
    dispatch_queue_t v18 = v11;
    uint64_t v19 = v14;
    uint64_t v15 = v11;
    [v13 loadConfigurations:0 withFilter:v6 completionQueue:v15 completionHandler:v17];
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(NSObject **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

void sub_10001FE10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
      uint64_t v13 = [v12 contentFilter];

      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v12;

    if (!v14) {
      goto LABEL_14;
    }
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 name];
      *(_DWORD *)long long buf = 138412290;
      BOOL v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Removing %@ content filter configuration", buf, 0xCu);
    }
    id v17 = +[NEConfigurationManager sharedManagerForAllUsers];
    dispatch_queue_t v18 = [v14 identifier];
    uint64_t v19 = *(void *)(a1 + 32);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100020098;
    v25[3] = &unk_100039688;
    id v26 = v14;
    id v20 = v6;
    uint64_t v21 = *(void *)(a1 + 40);
    id v27 = v20;
    uint64_t v28 = v21;
    id v22 = v14;
    [v17 removeConfigurationFromDisk:v18 completionQueue:v19 completionHandler:v25];
  }
  else
  {
LABEL_9:

LABEL_14:
    uint64_t v23 = sub_10001B9A4();
    dispatch_resume(v23);

    uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
    id v22 = *(id *)(v24 + 40);
    *(void *)(v24 + 40) = 0;
  }
}

void sub_100020098(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 32) name];
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to remove content filter configuration %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v4 = sub_10001B9A4();
  dispatch_resume(v4);

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

id sub_100020288()
{
  self;
  if (qword_100042D18 != -1) {
    dispatch_once(&qword_100042D18, &stru_100039718);
  }
  v0 = (void *)qword_100042D20;

  return v0;
}

void sub_1000202E0(SCPreferencesRef *a1, void *a2)
{
  id v4 = a2;
  if (!a1) {
    goto LABEL_102;
  }
  id Property = objc_getProperty(a1, v3, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (!a1[2])
  {
LABEL_101:
    sub_100001CA0((uint64_t)NEHelperServer, v4, 22, 0);
    goto LABEL_102;
  }
  switch(xpc_dictionary_get_uint64(v4, "cache-command"))
  {
    case 1uLL:
      id v6 = xpc_dictionary_create(0, 0, 0);
      if (!v6) {
        goto LABEL_101;
      }
      id v7 = v6;
      if (SCPreferencesGetValue(a1[2], @"redirected-addresses"))
      {
        uint64_t v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        int v9 = v8;
        if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary) {
          xpc_dictionary_set_value(v7, "redirected-addresses", v9);
        }
      }
      if (SCPreferencesGetValue(a1[2], @"services"))
      {
        uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        __int16 v11 = v10;
        if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_dictionary) {
          xpc_dictionary_set_value(v7, "services", v11);
        }
      }
      goto LABEL_91;
    case 2uLL:
      uint64_t v12 = xpc_dictionary_get_remote_connection(v4);
      BOOL v13 = sub_10000E810((uint64_t)NEHelperServer, v12);

      string = xpc_dictionary_get_string(v4, "cache-service");
      uint64_t v15 = xpc_dictionary_get_value(v4, "cache-routes");
      id v7 = v15;
      if (!string || !v15 || xpc_get_type(v15) != (xpc_type_t)&_xpc_type_dictionary) {
        goto LABEL_100;
      }
      if (v13)
      {
        uint64_t v16 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        id v17 = +[NSString stringWithUTF8String:string];
        int v18 = sub_1000225B0(a1, v16, v17);

        if (v18) {
          goto LABEL_65;
        }
        goto LABEL_101;
      }
      id v77 = ne_log_obj();
      if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = objc_getProperty(a1, v81, 24, 1);
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
      uint64_t v79 = "Denying set routes command because %@ does not have the %s entitlement";
      goto LABEL_98;
    case 3uLL:
      uint64_t v19 = xpc_dictionary_get_remote_connection(v4);
      BOOL v20 = sub_10000E810((uint64_t)NEHelperServer, v19)
         || sub_10000E810((uint64_t)NEHelperServer, v19);
      id v7 = xpc_dictionary_create(0, 0, 0);
      if (!v7 || (id v57 = xpc_dictionary_get_string(v4, "cache-signing-identifier")) == 0)
      {

        goto LABEL_100;
      }
      uint64_t v58 = v57;
      char v59 = xpc_dictionary_get_string(v4, "cache-executable-path");
      if (v59)
      {
        long long v60 = +[NSString stringWithUTF8String:v59];
      }
      else
      {
        long long v60 = 0;
      }
      unsigned int int64 = xpc_dictionary_get_int64(v4, "cache-user-uid");
      if (!int64)
      {
        memset(buf, 0, 32);
        xpc_dictionary_get_audit_token();
        long long v95 = 0u;
        long long v96 = 0u;
        unsigned int int64 = NEUIDForAuditToken();
      }
      LOBYTE(v95) = 0;
      __int16 v66 = +[NSString stringWithUTF8String:v58];
      BOOL v67 = xpc_dictionary_get_BOOL(v4, "cache-allow-synthesis");
      id v68 = sub_100021CD0(a1, v66, v60, v67, int64, &v95);

      if (isa_nsarray())
      {
        if ((_BYTE)v95) {
          char v69 = v20;
        }
        else {
          char v69 = 1;
        }
        if (v69)
        {
          CFStringRef v70 = xpc_array_create(0, 0);
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v94 = 0u;
          id v71 = v68;
          id v72 = [v71 countByEnumeratingWithState:&v91 objects:v98 count:16];
          if (v72)
          {
            id v73 = v72;
            uint64_t v74 = *(void *)v92;
            do
            {
              for (i = 0; i != v73; i = (char *)i + 1)
              {
                if (*(void *)v92 != v74) {
                  objc_enumerationMutation(v71);
                }
                id v76 = *(void **)(*((void *)&v91 + 1) + 8 * i);
                *(void *)long long buf = 0;
                *(void *)&uint8_t buf[8] = 0;
                [v76 getUUIDBytes:buf];
                xpc_array_set_uuid(v70, 0xFFFFFFFFFFFFFFFFLL, buf);
              }
              id v73 = [v71 countByEnumeratingWithState:&v91 objects:v98 count:16];
            }
            while (v73);
          }

          xpc_dictionary_set_value(v7, "cache-app-uuid", v70);
        }
        else
        {
          CFStringRef v70 = ne_log_obj();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
          {
            id v85 = objc_getProperty(a1, v80, 24, 1);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v85;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v58;
            _os_log_fault_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_FAULT, "%@ is trying to access information for %s but is not entitled to do so. Please add the com.apple.private.network.socket-delegate or the com.apple.private.necp.policies entitlement", buf, 0x16u);
          }
        }
      }
      goto LABEL_91;
    case 4uLL:
      uint64_t v21 = xpc_dictionary_get_remote_connection(v4);
      BOOL v22 = sub_10000E810((uint64_t)NEHelperServer, v21);

      uint64_t v23 = xpc_dictionary_get_string(v4, "cache-service");
      uint64_t v24 = xpc_dictionary_get_value(v4, "cache-domain-dictionaries");
      id v7 = v24;
      if (!v23 || v24 && xpc_get_type(v24) != (xpc_type_t)&_xpc_type_array) {
        goto LABEL_100;
      }
      uint64_t v25 = xpc_dictionary_get_string(v4, "cache-interface-name");
      if (!v25) {
        goto LABEL_100;
      }
      if (!v22)
      {
        id v77 = ne_log_obj();
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          goto LABEL_99;
        }
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = objc_getProperty(a1, v78, 24, 1);
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
        uint64_t v79 = "Denying set domain dictionary command because %@ does not have the %s entitlement";
        goto LABEL_98;
      }
      uint64_t v26 = (uint64_t)v25;
      if (v7)
      {
        id v27 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        uint64_t v28 = +[NSString stringWithUTF8String:v23];
        char v29 = sub_100021268(a1, v27, v28, v26);

        goto LABEL_47;
      }
      __int16 v82 = +[NSString stringWithUTF8String:v23];
      char v83 = sub_100021510(a1, v82, v26);

      id v7 = 0;
      if (v83) {
        goto LABEL_91;
      }
      goto LABEL_101;
    case 5uLL:
      long long v30 = xpc_dictionary_get_remote_connection(v4);
      BOOL v31 = sub_10000E810((uint64_t)NEHelperServer, v30);

      long long v32 = xpc_dictionary_get_value(v4, "cache-redirected-address");
      id v7 = v32;
      if (!v32) {
        goto LABEL_100;
      }
      if (xpc_get_type(v32) != (xpc_type_t)&_xpc_type_data) {
        goto LABEL_100;
      }
      if (xpc_data_get_length(v7) < 0x10) {
        goto LABEL_100;
      }
      id v33 = xpc_dictionary_get_string(v4, "cache-interface-name");
      if (!v33) {
        goto LABEL_100;
      }
      if (!v31)
      {
        id v77 = ne_log_obj();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = objc_getProperty(a1, v84, 24, 1);
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
          uint64_t v79 = "Denying add redirected address command because %@ does not have the %s entitlement";
LABEL_98:
          _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, v79, buf, 0x16u);
        }
LABEL_99:

        goto LABEL_100;
      }
      uint64_t v34 = (uint64_t)v33;
      bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(v7);
      size_t v36 = *bytes_ptr;
      if (xpc_data_get_length(v7) < v36) {
        goto LABEL_100;
      }
      char v29 = sub_100021788(a1, (uint64_t)bytes_ptr, v34);
      goto LABEL_47;
    case 7uLL:
      id v37 = xpc_dictionary_get_remote_connection(v4);
      BOOL v38 = sub_10000E810((uint64_t)NEHelperServer, v37);

      if (v38)
      {
        id v39 = xpc_dictionary_get_string(v4, "cache-interface-name");
        if (!v39) {
          goto LABEL_101;
        }
        sub_100021B90(a1, v39);
        goto LABEL_65;
      }
      id v7 = ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_100;
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = objc_getProperty(a1, v61, 24, 1);
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
      long long v62 = "Denying clear redirected addresses command because %@ does not have the %s entitlement";
      goto LABEL_63;
    case 8uLL:
      id v40 = xpc_dictionary_get_string(v4, "cache-app-bundle-id");
      if (v40)
      {
        uint64_t v41 = +[NSString stringWithUTF8String:v40];
        long long v97 = v41;
        id v42 = +[NSArray arrayWithObjects:&v97 count:1];
        sub_1000220BC((uint64_t)a1, v42);
      }
      else
      {
        sub_1000222BC(a1);
      }
      goto LABEL_65;
    case 9uLL:
      SEL v43 = xpc_dictionary_get_remote_connection(v4);
      BOOL v44 = sub_10000E810((uint64_t)NEHelperServer, v43);

      if (!v44)
      {
        id v7 = ne_log_obj();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = objc_getProperty(a1, v63, 24, 1);
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "com.apple.private.nehelper.privileged";
          long long v62 = "Denying set match domains command because %@ does not have the %s entitlement";
LABEL_63:
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v62, buf, 0x16u);
        }
        goto LABEL_100;
      }
      BOOL v45 = xpc_dictionary_get_string(v4, "cache-service");
      uint64_t v46 = xpc_dictionary_get_value(v4, "cache-match-domains");
      id v7 = v46;
      if (!v45 || !v46 || xpc_get_type(v46) != (xpc_type_t)&_xpc_type_array)
      {
LABEL_100:

        goto LABEL_101;
      }
      int64_t v47 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      long long v48 = +[NSString stringWithUTF8String:v45];
      char v29 = sub_100020F50(a1, v47, v48);

LABEL_47:
      if ((v29 & 1) == 0) {
        goto LABEL_101;
      }
LABEL_65:
      id v7 = 0;
LABEL_91:
      sub_100001CA0((uint64_t)NEHelperServer, v4, 0, v7);

LABEL_102:
      return;
    case 0xAuLL:
      uuid = xpc_dictionary_get_uuid(v4, "config-identifier");
      if (uuid)
      {
        uint64_t v50 = uuid;
        int v51 = xpc_dictionary_get_int64(v4, "cache-user-uid");
        if (!v51)
        {
          memset(buf, 0, 32);
          xpc_dictionary_get_audit_token();
          long long v95 = 0u;
          long long v96 = 0u;
          int v51 = NEUIDForAuditToken();
        }
        id v52 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v50];
        id v53 = +[NEConfigurationManager sharedManagerForAllUsers];
        id v55 = objc_getProperty(a1, v54, 8, 1);
        v86[0] = _NSConcreteStackBlock;
        v86[1] = 3221225472;
        v86[2] = sub_1000223D0;
        v86[3] = &unk_100039740;
        id v87 = v52;
        id v88 = v4;
        id v89 = a1;
        int v90 = v51;
        id v56 = v52;
        [v53 loadConfigurationWithID:v56 withCompletionQueue:v55 handler:v86];

        goto LABEL_102;
      }
      uint64_t v64 = ne_log_obj();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "No configuration ID provided for populating the cache", buf, 2u);
      }

      goto LABEL_101;
    default:
      goto LABEL_101;
  }
}

uint64_t sub_100020F50(SCPreferencesRef *a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  id Property = objc_getProperty(a1, v6, 8, 1);
  dispatch_assert_queue_V2(Property);
  uint64_t v8 = SCPreferencesGetValue(a1[2], @"services");
  if (isa_nsdictionary()) {
    id v9 = [v8 mutableCopy];
  }
  else {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v10 = v9;
  __int16 v11 = [v9 objectForKeyedSubscript:v5, v23];
  if (isa_nsdictionary()) {
    id v12 = [v11 mutableCopy];
  }
  else {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  BOOL v13 = v12;
  uint64_t v14 = ne_session_type_to_string();
  uint64_t v15 = +[NSString stringWithUTF8String:v14];
  uint64_t v16 = [v13 objectForKeyedSubscript:v15];

  if (isa_nsdictionary())
  {
    id v17 = [v16 mutableCopy];
    [v17 removeObjectForKey:@"match-domains"];
  }
  else
  {
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
  }
  [v17 setObject:v24 forKeyedSubscript:@"match-domains"];
  int v18 = +[NSString stringWithUTF8String:v14];
  [v13 setObject:v17 forKeyedSubscript:v18];

  [v10 setObject:v13 forKeyedSubscript:v5];
  if (SCPreferencesSetValue(a1[2], @"services", v10) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_100022B70(a1, v19);
    if ((nelog_is_extra_vpn_logging_enabled() & 1) == 0)
    {
      uint64_t v21 = 1;
      goto LABEL_23;
    }
    BOOL v20 = ne_log_large_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Set match domains for service %@:%@", buf, 0x16u);
    }
    uint64_t v21 = 1;
  }
  else
  {
    if ((nelog_is_extra_vpn_logging_enabled() & 1) == 0)
    {
      uint64_t v21 = 0;
      goto LABEL_23;
    }
    BOOL v20 = ne_log_large_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to set match domains for service %@:%@", buf, 0x16u);
    }
    uint64_t v21 = 0;
  }

LABEL_23:
  return v21;
}

uint64_t sub_100021268(SCPreferencesRef *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  id Property = objc_getProperty(a1, v9, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (isa_nsarray())
  {
    __int16 v11 = SCPreferencesGetValue(a1[2], @"services");
    if (isa_nsdictionary()) {
      id v12 = [v11 mutableCopy];
    }
    else {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
    }
    uint64_t v14 = v12;
    uint64_t v15 = [v12 objectForKeyedSubscript:v8];
    id v33 = v15;
    uint64_t v34 = v11;
    if (isa_nsdictionary()) {
      id v16 = [v15 mutableCopy];
    }
    else {
      id v16 = objc_alloc_init((Class)NSMutableDictionary);
    }
    id v17 = v16;
    uint64_t v18 = ne_session_type_to_string();
    uint64_t v19 = +[NSString stringWithUTF8String:v18];
    BOOL v20 = [v17 objectForKeyedSubscript:v19];

    long long v32 = v20;
    if (isa_nsdictionary()) {
      id v21 = [v20 mutableCopy];
    }
    else {
      id v21 = objc_alloc_init((Class)NSMutableDictionary);
    }
    BOOL v22 = v21;
    id v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a4, v8);
    uint64_t v24 = [v22 objectForKeyedSubscript:v23];
    int v25 = isa_nsdictionary();

    if (v25)
    {
      id v26 = [v22 objectForKeyedSubscript:v23];
      id v27 = [v26 mutableCopy];
    }
    else
    {
      id v27 = objc_alloc_init((Class)NSMutableDictionary);
    }
    [v27 setObject:v7 forKeyedSubscript:@"service-domain-info"];
    [v22 setObject:v27 forKeyedSubscript:v23];
    uint64_t v28 = +[NSString stringWithUTF8String:v18];
    [v17 setObject:v22 forKeyedSubscript:v28];

    id v8 = v31;
    [v14 setObject:v17 forKeyedSubscript:v31];
    if (SCPreferencesSetValue(a1[2], @"services", v14) && SCPreferencesCommitChanges(a1[2]))
    {
      sub_100022B70(a1, v29);
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t sub_100021510(SCPreferencesRef *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id Property = objc_getProperty(a1, v6, 8, 1);
  dispatch_assert_queue_V2(Property);
  id v8 = SCPreferencesGetValue(a1[2], @"services");
  if (isa_nsdictionary())
  {
    id v9 = [v8 mutableCopy];
    uint64_t v10 = [v9 objectForKeyedSubscript:v5];
    if (isa_nsdictionary())
    {
      id v11 = [v10 mutableCopy];
      uint64_t v12 = ne_session_type_to_string();
      uint64_t v13 = +[NSString stringWithUTF8String:v12];
      char v29 = v11;
      uint64_t v14 = [v11 objectForKeyedSubscript:v13];

      if (isa_nsdictionary())
      {
        id v15 = [v14 mutableCopy];
        uint64_t v16 = a3;
        id v17 = v15;
        uint64_t v28 = +[NSString stringWithUTF8String:v16];
        uint64_t v18 = [v17 objectForKeyedSubscript:];
        if (isa_nsdictionary())
        {
          id v26 = v18;
          id v27 = v17;
          id v19 = [v18 mutableCopy];
          BOOL v20 = [v19 objectForKeyedSubscript:@"service-domains"];

          if (v20)
          {
            [v19 removeObjectForKey:@"service-domains"];
            id v17 = v27;
            [v27 setObject:v19 forKeyedSubscript:v28];
            id v21 = +[NSString stringWithUTF8String:v12];
            BOOL v22 = v29;
            [v29 setObject:v27 forKeyedSubscript:v21];

            [v9 setObject:v29 forKeyedSubscript:v5];
            if (SCPreferencesSetValue(a1[2], @"services", v9) && SCPreferencesCommitChanges(a1[2]))
            {
              sub_100022B70(a1, v23);
              uint64_t v24 = 1;
            }
            else
            {
              uint64_t v24 = 0;
            }
          }
          else
          {
            uint64_t v24 = 0;
            id v17 = v27;
            BOOL v22 = v29;
          }

          uint64_t v18 = v26;
        }
        else
        {
          uint64_t v24 = 0;
          BOOL v22 = v29;
        }
      }
      else
      {
        uint64_t v24 = 0;
        BOOL v22 = v29;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t sub_100021788(SCPreferencesRef *a1, uint64_t a2, uint64_t a3)
{
  id Property = objc_getProperty(a1, (SEL)a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (!a2) {
    return 0;
  }
  int v7 = *(unsigned __int8 *)(a2 + 1);
  if (v7 != 30 && v7 != 2) {
    return 0;
  }
  id v9 = SCPreferencesGetValue(a1[2], @"redirected-addresses");
  if (isa_nsdictionary()) {
    id v10 = [v9 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v12 = v10;
  uint64_t v13 = +[NSString stringWithUTF8String:a3];
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];
  int v15 = isa_nsdictionary();

  if (v15)
  {
    uint64_t v16 = [v12 objectForKeyedSubscript:v13];
    id v17 = [v16 mutableCopy];
  }
  else
  {
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
  }
  int v18 = *(unsigned __int8 *)(a2 + 1);
  if (v18 == 30)
  {
    id v23 = [v17 objectForKeyedSubscript:@"ipv6-subnets"];
    int v24 = isa_nsdictionary();

    if (v24)
    {
      int v25 = [v17 objectForKeyedSubscript:@"ipv6-subnets"];
      id v22 = [v25 mutableCopy];
    }
    else
    {
      id v22 = objc_alloc_init((Class)NSMutableDictionary);
    }
    if (!isa_nsdictionary()) {
      goto LABEL_41;
    }
    long long v30 = [v22 objectForKeyedSubscript:@"subnet-addresses"];
    int v31 = isa_nsarray();

    if (v31)
    {
      long long v32 = [v22 objectForKeyedSubscript:@"subnet-addresses"];
      id v29 = [v32 mutableCopy];
    }
    else
    {
      id v29 = objc_alloc_init((Class)NSMutableArray);
    }
    if (isa_nsarray())
    {
      uint64_t v35 = +[NSData dataWithBytes:a2 + 8 length:16];
      if (([v29 containsObject:v35] & 1) == 0) {
        [v29 addObject:v35];
      }
      [v22 setObject:v29 forKeyedSubscript:@"subnet-addresses"];
    }
    CFStringRef v34 = @"ipv6-subnets";
    goto LABEL_40;
  }
  if (v18 != 2) {
    goto LABEL_42;
  }
  id v19 = [v17 objectForKeyedSubscript:@"ipv4-subnets"];
  int v20 = isa_nsdictionary();

  if (v20)
  {
    id v21 = [v17 objectForKeyedSubscript:@"ipv4-subnets"];
    id v22 = [v21 mutableCopy];
  }
  else
  {
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
  }
  if (isa_nsdictionary())
  {
    id v26 = [v22 objectForKeyedSubscript:@"subnet-addresses"];
    int v27 = isa_nsarray();

    if (v27)
    {
      uint64_t v28 = [v22 objectForKeyedSubscript:@"subnet-addresses"];
      id v29 = [v28 mutableCopy];
    }
    else
    {
      id v29 = objc_alloc_init((Class)NSMutableArray);
    }
    if (isa_nsarray())
    {
      id v33 = +[NSData dataWithBytes:a2 + 4 length:4];
      if (([v29 containsObject:v33] & 1) == 0) {
        [v29 addObject:v33];
      }
      [v22 setObject:v29 forKeyedSubscript:@"subnet-addresses"];
    }
    CFStringRef v34 = @"ipv4-subnets";
LABEL_40:
    [v17 setObject:v22 forKeyedSubscript:v34];
  }
LABEL_41:

LABEL_42:
  [v12 setObject:v17 forKeyedSubscript:v13];
  if (SCPreferencesSetValue(a1[2], @"redirected-addresses", v12) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_100022B70(a1, v36);
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_100021B90(SCPreferencesRef *a1, const char *a2)
{
  id Property = objc_getProperty(a1, a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  SCPreferencesGetValue(a1[2], @"redirected-addresses");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!isa_nsdictionary()) {
    goto LABEL_8;
  }
  id v5 = [v10 mutableCopy];
  SEL v6 = +[NSString stringWithUTF8String:a2];
  int v7 = [v5 objectForKeyedSubscript:v6];
  int v8 = isa_nsdictionary();

  if (v8) {
    [v5 setObject:0 forKeyedSubscript:v6];
  }

  if (!v5)
  {
LABEL_8:
    if (!SCPreferencesRemoveValue(a1[2], @"redirected-addresses"))
    {
      id v5 = 0;
      goto LABEL_12;
    }
    id v5 = 0;
    if (!SCPreferencesCommitChanges(a1[2])) {
      goto LABEL_12;
    }
LABEL_10:
    sub_100022B70(a1, v9);
    goto LABEL_12;
  }
  if (SCPreferencesSetValue(a1[2], @"redirected-addresses", v5) && SCPreferencesCommitChanges(a1[2])) {
    goto LABEL_10;
  }
LABEL_12:
}

id sub_100021CD0(void *a1, void *a2, void *a3, int a4, unsigned int a5, unsigned char *a6)
{
  id v11 = a2;
  if (a1)
  {
    unsigned __int8 v40 = 0;
    uint64_t v12 = sub_1000237C0(a1, v11, a3, a4, a5, 0, a6, &v40);
    uint64_t v13 = v12;
    if (byte_100042D28) {
      goto LABEL_26;
    }
    int v14 = v40;
    id v15 = v12;
    id v16 = v11;
    id v17 = sub_100024464(v15);
    int v18 = v17;
    if (v14 && [v17 count] != (id)1)
    {
      id v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v33 = [v18 count];
        *(_DWORD *)long long buf = 134217984;
        id v42 = v33;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Synthentic UUID count is wrong (%lu)", buf, 0xCu);
      }
      goto LABEL_25;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D38);
    id v19 = sub_100023540();
    id v38 = sub_100023720(v19, 0);
    int v20 = [v38 objectForKeyedSubscript:v16];
    unsigned __int8 v21 = [v20 isEqualToArray:v18];
    id v22 = ne_log_obj();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    unsigned __int8 v37 = v21;
    if (v21)
    {
      if (v23)
      {
        id v24 = [v20 count];
        *(_DWORD *)long long buf = 134218242;
        id v42 = v24;
        __int16 v43 = 2112;
        id v44 = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%lu UUIDs for %@ are already in the cache", buf, 0x16u);
      }

      int v25 = v38;
      if (!v14) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v23)
      {
        id v26 = [v15 count];
        *(_DWORD *)long long buf = 134218242;
        id v42 = v26;
        __int16 v43 = 2112;
        id v44 = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Caching %lu UUID(s) for %@", buf, 0x16u);
      }

      int v25 = v38;
      [v38 setObject:v18 forKeyedSubscript:v16];
      if (!v14) {
        goto LABEL_23;
      }
    }
    size_t v36 = v20;
    id v39 = v15;
    id v27 = sub_100023720(v19, 1);
    uint64_t v28 = [v27 objectForKeyedSubscript:v16];
    id v29 = [v18 firstObject];
    unsigned __int8 v30 = [v28 isEqualToData:v29];

    int v31 = ne_log_obj();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v32)
      {
        *(_DWORD *)long long buf = 138412290;
        id v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "A synthetic UUID for %@ is already in the cache", buf, 0xCu);
      }

      id v15 = v39;
      int v20 = v36;
      if (v37) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v32)
      {
        *(_DWORD *)long long buf = 138412290;
        id v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Caching a synthetic UUID for %@", buf, 0xCu);
      }

      CFStringRef v34 = [v18 firstObject];
      [v27 setObject:v34 forKeyedSubscript:v16];

      id v15 = v39;
      int v20 = v36;
    }
LABEL_23:
    sub_1000245B8((uint64_t)v19);
LABEL_24:
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D38);

LABEL_25:
    goto LABEL_26;
  }
  uint64_t v13 = 0;
LABEL_26:

  return v13;
}

void sub_1000220BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D38);
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing UUIDs for %@", buf, 0xCu);
    }

    id v5 = (void *)sub_100024AF8();
    SEL v6 = v5;
    if (v5)
    {
      int v7 = [v5 objectForKeyedSubscript:@"uuid-mappings"];
      if (v7)
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v3;
        id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v17;
          while (2)
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i) (void)v16];

              if (v13)
              {

                id v14 = [v7 mutableCopy];
                [v14 removeObjectsForKeys:v8];
                id v15 = [v6 mutableCopy];
                [v15 setObject:v14 forKeyedSubscript:@"uuid-mappings"];
                sub_1000245B8((uint64_t)v15);

                id v8 = v14;
                goto LABEL_16;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D38);
  }
}

void sub_1000222BC(void *a1)
{
  if (a1)
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clearing the UUID cache", v10, 2u);
    }

    +[NEProcessInfo clearUUIDCache];
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D38);
    id v3 = (void *)sub_100024AF8();
    id v4 = v3;
    if (v3) {
      id v5 = [v3 mutableCopy];
    }
    else {
      id v5 = objc_alloc_init((Class)NSMutableDictionary);
    }
    SEL v6 = v5;
    [v5 setObject:0 forKeyedSubscript:@"uuid-mappings"];
    sub_1000245B8((uint64_t)v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D38);
    sub_10000CA2C();
    int v7 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      char v8 = v7[12];

      if (v8) {
        sub_100024B3C(a1, v9);
      }
    }
  }
}

void sub_1000223D0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  SEL v6 = v5;
  if (!a3)
  {
    id v10 = [v5 appVPN];

    if (v10)
    {
      uint64_t v11 = [v6 appVPN];
      uint64_t v12 = [v11 appRules];
    }
    else
    {
      uint64_t v13 = [v6 pathController];

      if (!v13)
      {
        long long v18 = [v6 relay];

        if (!v18)
        {
LABEL_12:
          char v8 = *(void **)(a1 + 40);
          int64_t v9 = 0;
          goto LABEL_13;
        }
        uint64_t v11 = [v6 relay];
        long long v19 = [v11 perApp];
        id v14 = [v19 appRules];

LABEL_10:
        if (v14)
        {
          id v15 = *(void **)(a1 + 48);
          uint64_t v16 = *(unsigned int *)(a1 + 56);
          long long v17 = [v6 name];
          sub_100022FC0(v15, v14, v16, v17);
        }
        goto LABEL_12;
      }
      uint64_t v11 = [v6 pathController];
      uint64_t v12 = [v11 pathRules];
    }
    id v14 = (void *)v12;
    goto LABEL_10;
  }
  int v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    int v21 = 138412290;
    uint64_t v22 = v20;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to load configuration %@", (uint8_t *)&v21, 0xCu);
  }

  char v8 = *(void **)(a1 + 40);
  int64_t v9 = 2;
LABEL_13:
  sub_100001CA0((uint64_t)NEHelperServer, v8, v9, 0);
}

uint64_t sub_1000225B0(SCPreferencesRef *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  int64_t v9 = SCPreferencesGetValue(a1[2], @"services");
  id v57 = v9;
  if (isa_nsdictionary()) {
    id v10 = [v9 mutableCopy];
  }
  else {
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v11 = v10;
  uint64_t v12 = [v10 objectForKeyedSubscript:v6];
  id v56 = v12;
  if (isa_nsdictionary()) {
    id v13 = [v12 mutableCopy];
  }
  else {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v14 = v13;
  uint64_t v15 = ne_session_type_to_string();
  uint64_t v16 = +[NSString stringWithUTF8String:v15];
  long long v17 = [v14 objectForKeyedSubscript:v16];

  id v55 = v17;
  if (isa_nsdictionary())
  {
    id v18 = [v17 mutableCopy];
    [v18 removeObjectForKey:@"included-routes"];
    [v18 removeObjectForKey:@"excluded-routes"];
  }
  else
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
  }
  long long v19 = [v5 objectForKeyedSubscript:@"included-routes"];

  if (v19)
  {
    uint64_t v20 = [v5 objectForKeyedSubscript:@"included-routes"];
    [v18 setObject:v20 forKeyedSubscript:@"included-routes"];
  }
  int v21 = [v5 objectForKeyedSubscript:@"excluded-routes"];

  if (v21)
  {
    uint64_t v22 = [v5 objectForKeyedSubscript:@"excluded-routes"];
    [v18 setObject:v22 forKeyedSubscript:@"excluded-routes"];
  }
  BOOL v23 = +[NSString stringWithUTF8String:v15];
  [v14 setObject:v18 forKeyedSubscript:v23];

  id v24 = v6;
  [v11 setObject:v14 forKeyedSubscript:v6];
  if (SCPreferencesSetValue(a1[2], @"services", v11) && SCPreferencesCommitChanges(a1[2]))
  {
    sub_100022B70(a1, v25);
    uint64_t v26 = 1;
  }
  else
  {
    uint64_t v26 = 0;
  }
  if (nelog_is_extra_vpn_logging_enabled())
  {
    id v27 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = (__CFString *)objc_alloc_init((Class)NSMutableString);
      id v29 = [v27 mutableCopy];
      SEL v54 = [v27 objectForKeyedSubscript:@"included-routes"];
      int v51 = v24;
      if (v54)
      {
        id v52 = v29;
        unsigned __int8 v30 = [v54 objectForKeyedSubscript:@"ipv4-subnets"];
        int v31 = v30;
        if (v30)
        {
          BOOL v32 = v24;
          id v33 = sub_100022C54(v30);
          [(__CFString *)v28 appendFormat:@"\nIPv4: %@", v33];

          id v24 = v32;
        }
        CFStringRef v34 = v28;
        uint64_t v35 = [v54 objectForKeyedSubscript:@"ipv6-subnets"];
        size_t v36 = v35;
        if (v35)
        {
          id v37 = sub_100022C54(v35);
          [(__CFString *)v34 appendFormat:@"\nIPv6: %@", v37];

          id v24 = v51;
        }

        uint64_t v28 = v34;
        id v29 = v52;
      }
      id v38 = [v27 objectForKeyedSubscript:@"excluded-routes"];
      id v39 = v38;
      if (v38)
      {
        id v53 = v28;
        unsigned int v50 = v26;
        unsigned __int8 v40 = [v38 objectForKeyedSubscript:@"ipv4-subnets"];
        uint64_t v41 = v40;
        if (v40)
        {
          id v42 = sub_100022C54(v40);
          [(__CFString *)v53 appendFormat:@"\nIPv4 excluded: %@", v42];
        }
        __int16 v43 = [v39 objectForKeyedSubscript:@"ipv6-subnets"];
        id v44 = v43;
        if (v43)
        {
          id v45 = v29;
          id v46 = sub_100022C54(v43);
          [(__CFString *)v53 appendFormat:@"\nIPv6 excluded: %@", v46];

          id v29 = v45;
        }

        id v24 = v51;
        uint64_t v28 = v53;
        uint64_t v26 = v50;
      }
      [v29 setObject:0 forKeyedSubscript:@"included-routes"];
      [v29 setObject:0 forKeyedSubscript:@"excluded-routes"];
      if ([v29 count]) {
        [(__CFString *)v28 appendFormat:@"\nextra: %@", v29];
      }
    }
    else
    {
      uint64_t v28 = @"NULL";
    }

    int64_t v47 = ne_log_large_obj();
    long long v48 = v47;
    if (v26)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        char v59 = v24;
        __int16 v60 = 2112;
        long long v61 = v28;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Set routes for service %@:%@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      char v59 = v24;
      __int16 v60 = 2112;
      long long v61 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to set routes for service %@:%@", buf, 0x16u);
    }
  }
  return v26;
}

void sub_100022B70(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 8, 1);
    dispatch_assert_queue_V2(Property);
    uint32_t v3 = notify_post("com.apple.networkextension.ondemandcachechanged");
    if (v3)
    {
      uint32_t v4 = v3;
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        SEL v7 = "com.apple.networkextension.ondemandcachechanged";
        __int16 v8 = 1024;
        uint32_t v9 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to post the %s notification: %u", (uint8_t *)&v6, 0x12u);
      }
    }
  }
}

id sub_100022C54(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v1 count] != (id)2) {
    goto LABEL_40;
  }
  id v2 = [v1 objectForKeyedSubscript:@"subnet-addresses"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_39:

LABEL_40:
    id v5 = [v1 description];
    goto LABEL_41;
  }
  uint32_t v3 = [v1 objectForKeyedSubscript:@"subnet-masks"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint32_t v4 = (char *)[v2 count], v4 != objc_msgSend(v3, "count")))
  {

    goto LABEL_39;
  }
  id v5 = objc_alloc_init((Class)NSMutableString);
  if (v4)
  {
    int v6 = 0;
    char v7 = 0;
    int v25 = v4;
    do
    {
      if (v7) {
        [v5 appendString:@", "];
      }
      __int16 v8 = [v2 objectAtIndexedSubscript:v6];
      uint32_t v9 = [v3 objectAtIndexedSubscript:v6];
      id v10 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v11 = (unint64_t)[v10 length];
          if ((id)v11 == [v9 length] && (v11 == 16 || v11 == 4))
          {
            if (v11 == 16) {
              int v12 = 30;
            }
            else {
              int v12 = 2;
            }
            if (inet_ntop(v12, [v10 bytes], v26, 0x2Eu))
            {
              id v13 = (unsigned __int8 *)[v9 bytes];
              uint64_t v14 = 0;
              int v15 = 0;
              char v16 = 0;
              unsigned __int8 v17 = 0;
LABEL_20:
              BOOL v18 = v16;
              while (2)
              {
                int v19 = v13[v14];
                int v20 = 7;
                BOOL v21 = v18;
                do
                {
                  BOOL v18 = ((1 << v20) & v19) == 0;
                  if (((1 << v20) & v19) != 0)
                  {
                    ++v17;
                    if (v21)
                    {
                      uint64_t v14 = ++v15;
                      char v16 = 1;
                      if (v11 > v15) {
                        goto LABEL_20;
                      }
                      goto LABEL_30;
                    }
                  }
                  --v20;
                  BOOL v21 = v18;
                }
                while (v20 != -1);
                uint64_t v14 = ++v15;
                if (v11 > v15) {
                  continue;
                }
                break;
              }
              if ((v16 & 1) == 0)
              {
                if (8 * v11 == v17)
                {
                  id v23 = +[NSString stringWithUTF8String:v26];
                }
                else
                {
                  id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%s/%u", v26, v17];
                }
                id v22 = v23;
                uint32_t v4 = v25;
                goto LABEL_32;
              }
            }
LABEL_30:
            uint32_t v4 = v25;
          }
        }
      }
      id v22 = [objc_alloc((Class)NSString) initWithFormat:@"[%@/%@]", v10, v9];
LABEL_32:

      [v5 appendString:v22];
      ++v6;
      char v7 = 1;
    }
    while (v6 != v4);
  }

LABEL_41:
  return v5;
}

void sub_100022FC0(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v43 = a4;
  if (!a1) {
    goto LABEL_40;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&unk_100042D38);
  __int16 v8 = sub_100023540();
  id v9 = sub_100023720(v8, 0);
  id v40 = sub_100023720(v8, 1);
  id v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v54 = v43;
    __int16 v55 = 2048;
    id v56 = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Populating the cache with UUIDs for %lu app rules", buf, 0x16u);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = v7;
  id v46 = [v11 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (!v46)
  {

    goto LABEL_36;
  }
  uint64_t v38 = (uint64_t)v8;
  id v39 = v7;
  char v12 = 0;
  uint64_t v45 = *(void *)v50;
  id v42 = v11;
  uint64_t v41 = a1;
  do
  {
    for (i = 0; i != v46; i = (char *)i + 1)
    {
      if (*(void *)v50 != v45) {
        objc_enumerationMutation(v11);
      }
      uint64_t v14 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        char v16 = [v15 matchSigningIdentifier];
        unsigned __int8 v17 = [v16 isEqualToString:@"PathRuleDefaultIdentifier"];

        if (v17) {
          goto LABEL_29;
        }
      }
      else
      {
        id v15 = 0;
      }
      BOOL v18 = [v14 matchSigningIdentifier:v38, v39];
      int v19 = [v9 objectForKeyedSubscript:v18];

      if (!v19)
      {
        char v48 = 0;
        if (v15) {
          int v20 = [v15 isIdentifierExternal];
        }
        else {
          int v20 = 0;
        }
        char v47 = 0;
        BOOL v21 = [v14 matchSigningIdentifier];
        id v22 = [v14 matchPath];
        id v23 = sub_1000237C0(a1, v21, v22, v20, a3, 0, &v48, &v47);

        id v24 = sub_100024464(v23);
        int v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = v9;
          id v27 = [v23 count];
          id v44 = v24;
          uint64_t v28 = v23;
          uint64_t v29 = a3;
          if (v47) {
            CFStringRef v30 = @"synthetic ";
          }
          else {
            CFStringRef v30 = &stru_10003A6D0;
          }
          int v31 = [v14 matchSigningIdentifier];
          *(_DWORD *)long long buf = 138413058;
          id v54 = v43;
          __int16 v55 = 2048;
          id v56 = v27;
          id v9 = v26;
          a1 = v41;
          __int16 v57 = 2112;
          CFStringRef v58 = v30;
          a3 = v29;
          id v23 = v28;
          id v24 = v44;
          __int16 v59 = 2112;
          __int16 v60 = v31;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: Populating the cache with %lu %@UUID(s) for %@", buf, 0x2Au);

          id v11 = v42;
        }

        BOOL v32 = [v14 matchSigningIdentifier];
        [v9 setObject:v24 forKeyedSubscript:v32];

        if (v47)
        {
          if ([v24 count] == (id)1)
          {
            id v33 = [v24 firstObject];
            CFStringRef v34 = [v14 matchSigningIdentifier];
            [v40 setObject:v33 forKeyedSubscript:v34];
          }
          else
          {
            id v33 = ne_log_obj();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              id v35 = [v24 count];
              *(_DWORD *)long long buf = 138412546;
              id v54 = v43;
              __int16 v55 = 2048;
              id v56 = v35;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%@: Cannot populate synthesized UUID, count is wrong (%lu)", buf, 0x16u);
            }
          }
        }
        char v12 = 1;
      }
LABEL_29:
    }
    id v46 = [v11 countByEnumeratingWithState:&v49 objects:v61 count:16];
  }
  while (v46);

  __int16 v8 = (void *)v38;
  id v7 = v39;
  if (v12)
  {
    size_t v36 = ne_log_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v54 = v43;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: Saving the cache", buf, 0xCu);
    }

    sub_1000245B8(v38);
    goto LABEL_39;
  }
LABEL_36:
  id v37 = ne_log_obj();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v54 = v43;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@: Cache was already fully populated", buf, 0xCu);
  }

LABEL_39:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100042D38);

LABEL_40:
}

void *sub_100023540()
{
  v0 = (void *)sub_100024AF8();
  id v1 = v0;
  if (v0) {
    id v2 = [v0 mutableCopy];
  }
  else {
    id v2 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint32_t v3 = v2;
  uint32_t v4 = [v2 objectForKeyedSubscript:@"os-version"];

  if (!v4)
  {
    uint64_t v5 = ne_session_copy_os_version_string();
    if (v5)
    {
      int v6 = (void *)v5;
      id v7 = [objc_alloc((Class)NSString) initWithCString:v5 encoding:4];
      free(v6);
      [v3 setObject:v7 forKeyedSubscript:@"os-version"];
    }
    else
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get the current OS version", buf, 2u);
      }
    }
  }
  __int16 v8 = [v3 objectForKeyedSubscript:@"boot-uuid"];

  if (!v8)
  {
    *(void *)long long buf = 0;
    uint64_t v13 = 0;
    if (ne_session_get_boot_session_uuid())
    {
      id v9 = [objc_alloc((Class)NSData) initWithBytes:buf length:16];
      [v3 setObject:v9 forKeyedSubscript:@"boot-uuid"];
    }
    else
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to get the current boot session UUID", v11, 2u);
      }
    }
  }
  return v3;
}

id sub_100023720(void *a1, int a2)
{
  uint32_t v3 = @"uuid-mappings";
  if (a2) {
    uint32_t v3 = @"synthesized-uuid-mappings";
  }
  uint32_t v4 = v3;
  id v5 = a1;
  int v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = v6;
  if (v6) {
    id v8 = [v6 mutableCopy];
  }
  else {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v9 = v8;
  [v5 setObject:v8 forKeyedSubscript:v4];

  return v9;
}

id sub_1000237C0(void *a1, void *a2, void *a3, int a4, unsigned int a5, unint64_t a6, unsigned char *a7, unsigned char *a8)
{
  id v13 = a2;
  id v14 = a3;
  char v16 = objc_getProperty(a1, v15, 8, 1);
  dispatch_assert_queue_V2(v16);

  if (a6 < 0xB)
  {
    if (v14)
    {
      id v111 = v14;
      int v19 = +[NSArray arrayWithObjects:&v111 count:1];
    }
    else
    {
      int v19 = 0;
    }
    int v94 = a4;
    long long v99 = v19;
    if (isa_nsarray())
    {
      int v20 = sub_100024838(a1, v19);
      if (isa_nsarray())
      {
        BOOL v21 = [v20 count] == 0;
LABEL_13:
        unint64_t v100 = a6;
        if (!v14 && v21)
        {
          id v103 = 0;
          uint64_t v22 = +[NELaunchServices bundleProxyForIdentifier:v13 uid:a5 plugins:&v103];
          unint64_t v23 = (unint64_t)v103;
          if ([(id)v23 count] && objc_msgSend((id)v22, "isWatchKitApp"))
          {

            uint64_t v22 = 0;
          }
          if (v22 | v23)
          {
            id v88 = a8;
            id v91 = v13;
            *a7 = 1;
            id v24 = (id)v22;
            id v25 = (id)v23;
            id v26 = v20;
            id Property = objc_getProperty(a1, v27, 8, 1);
            dispatch_assert_queue_V2(Property);
            long long v97 = v24;
            int v20 = sub_1000249DC(a1, v24, v26);
            long long v104 = 0u;
            long long v105 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            id v29 = v25;
            id v30 = [v29 countByEnumeratingWithState:&v104 objects:buf count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v105;
              do
              {
                id v33 = 0;
                CFStringRef v34 = v20;
                do
                {
                  if (*(void *)v105 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  int v20 = sub_1000249DC(a1, *(void **)(*((void *)&v104 + 1) + 8 * (void)v33), v34);

                  id v33 = (char *)v33 + 1;
                  CFStringRef v34 = v20;
                }
                while (v31 != v33);
                id v31 = [v29 countByEnumeratingWithState:&v104 objects:buf count:16];
              }
              while (v31);
            }

            id v14 = 0;
            id v13 = v91;
            a8 = v88;
          }
        }
        uint64_t v35 = [(id)qword_100042CF8 objectForKeyedSubscript:v13];
        long long v98 = (void *)v35;
        if (isa_nsstring())
        {
          uint64_t v110 = v35;
          size_t v36 = +[NSArray arrayWithObjects:&v110 count:1];
        }
        else if (*a7)
        {
          size_t v36 = 0;
        }
        else
        {
          id v37 = v13;
          id v39 = objc_getProperty(a1, v38, 8, 1);
          dispatch_assert_queue_V2(v39);
          id v40 = v37;
          uint64_t v41 = v40;
          if ([v40 hasPrefix:@"com.apple."])
          {
            uint64_t v41 = [v40 substringFromIndex:10];

            if ([v41 hasPrefix:@"icloud."])
            {
              uint64_t v42 = [v41 substringFromIndex:7];

              uint64_t v41 = (void *)v42;
            }
          }
          if ([v41 rangeOfCharacterFromSet:qword_100042D08] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            long long v95 = [@"/usr/libexec/" stringByAppendingString:v41];
            *(void *)long long buf = v95;
            long long v92 = [@"/usr/sbin/" stringByAppendingString:v41];
            *(void *)&uint8_t buf[8] = v92;
            id v43 = [@"/usr/local/bin/" stringByAppendingString:v41];
            *(void *)&uint8_t buf[16] = v43;
            [@"/usr/bin/" stringByAppendingString:v41];
            id v44 = a8;
            v46 = id v45 = v14;
            id v113 = v46;
            size_t v36 = +[NSArray arrayWithObjects:buf count:4];

            id v14 = v45;
            a8 = v44;
          }
          else
          {
            size_t v36 = 0;
          }
        }
        long long v96 = v36;
        if (isa_nsarray())
        {
          char v47 = sub_100024838(a1, v36);
          if (isa_nsarray() && [v47 count])
          {
            if (isa_nsarray() && [v20 count])
            {
              id v48 = [v20 arrayByAddingObjectsFromArray:v47];
            }
            else
            {
              id v48 = v47;
            }
            id v49 = v48;

            int v20 = v49;
          }
        }
        id v50 = v13;
        long long v52 = objc_getProperty(a1, v51, 8, 1);
        dispatch_assert_queue_V2(v52);
        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        id v53 = (id)qword_100042CF0;
        id v54 = [v53 countByEnumeratingWithState:&v104 objects:buf count:16];
        if (v54)
        {
          id v55 = v54;
          id v89 = a8;
          id v90 = v14;
          id v93 = v13;
          uint64_t v56 = *(void *)v105;
          while (2)
          {
            for (i = 0; i != v55; i = (char *)i + 1)
            {
              if (*(void *)v105 != v56) {
                objc_enumerationMutation(v53);
              }
              CFStringRef v58 = *(void **)(*((void *)&v104 + 1) + 8 * i);
              __int16 v59 = [v58 objectAtIndexedSubscript:0];
              unsigned __int8 v60 = [v50 isEqualToString:v59];

              if (v60)
              {
                long long v61 = [v58 objectAtIndexedSubscript:1];
                goto LABEL_58;
              }
            }
            id v55 = [v53 countByEnumeratingWithState:&v104 objects:buf count:16];
            if (v55) {
              continue;
            }
            break;
          }
          long long v61 = 0;
LABEL_58:
          id v14 = v90;
          id v13 = v93;
          a8 = v89;
        }
        else
        {
          long long v61 = 0;
        }

        if (isa_nsuuid())
        {
          unint64_t v62 = v100;
          if (isa_nsarray() && [v20 count])
          {
            uint64_t v63 = [v20 arrayByAddingObject:v61];
          }
          else
          {
            long long v109 = v61;
            uint64_t v63 = +[NSArray arrayWithObjects:&v109 count:1];
          }
          uint64_t v64 = (void *)v63;

          int v20 = v64;
        }
        else
        {
          unint64_t v62 = v100;
        }
        if ((!isa_nsarray() || ![v20 count])
          && [v50 hasPrefix:@"com.apple.webapp-"])
        {
          uint64_t v65 = sub_1000237C0(a1, @"com.apple.webapp", v14, 0, a5, v62 + 1, a7, a8);

          int v20 = (void *)v65;
        }
        if (!isa_nsarray() || ![v20 count])
        {
          __int16 v66 = [(id)qword_100042D00 objectForKeyedSubscript:v50];
          if (isa_nsstring())
          {
            uint64_t v67 = sub_1000237C0(a1, v66, v14, 0, a5, v62 + 1, a7, a8);

            int v20 = (void *)v67;
          }
        }
        if (isa_nsarray())
        {
          if ((unint64_t)[v20 count] | v62) {
            goto LABEL_85;
          }
        }
        else if (v62)
        {
          goto LABEL_85;
        }
        if ([v50 hasPrefix:@"iCloud."])
        {
          id v68 = [v50 substringFromIndex:7];
          unint64_t v69 = v62 + 1;
          CFStringRef v70 = sub_1000237C0(a1, v68, v14, 0, a5, v69, a7, a8);

          if (!isa_nsarray() || ![v70 count])
          {
            uint64_t v71 = sub_1000237C0(a1, @"com.apple.bird", v14, 0, a5, v69, a7, a8);

            CFStringRef v70 = (void *)v71;
          }

          int v20 = v70;
          unint64_t v62 = v100;
        }
LABEL_85:
        if (isa_nsarray())
        {
          if ((unint64_t)[v20 count] | v62) {
            goto LABEL_94;
          }
        }
        else if (v62)
        {
          goto LABEL_94;
        }
        if ([v50 hasPrefix:@"com.apple.clouddocs."])
        {
          id v72 = [v50 substringFromIndex:20];
          unint64_t v73 = v62 + 1;
          uint64_t v74 = sub_1000237C0(a1, v72, v14, 0, a5, v73, a7, a8);

          if (!isa_nsarray() || ![v74 count])
          {
            uint64_t v75 = sub_1000237C0(a1, @"com.apple.bird", v14, 0, a5, v73, a7, a8);

            uint64_t v74 = (void *)v75;
          }

          int v20 = v74;
          unint64_t v62 = v100;
        }
LABEL_94:
        if ((!isa_nsarray() || ![v20 count])
          && [v50 hasPrefix:@"com.apple.CloudDocs"])
        {
          uint64_t v76 = sub_1000237C0(a1, @"com.apple.bird", v14, 0, a5, v62 + 1, a7, a8);

          int v20 = (void *)v76;
        }
        if (isa_nsarray())
        {
          if ((unint64_t)[v20 count] | v62) {
            goto LABEL_104;
          }
        }
        else if (v62)
        {
          goto LABEL_104;
        }
        if ([v50 hasPrefix:@"com.apple.cloudkit."])
        {
          uint64_t v77 = sub_1000237C0(a1, @"com.apple.cloudd", v14, 0, a5, v62 + 1, a7, a8);

          int v20 = (void *)v77;
        }
LABEL_104:
        if (isa_nsarray())
        {
          if ((unint64_t)[v20 count] | v62) {
            goto LABEL_112;
          }
        }
        else if (v62)
        {
          goto LABEL_112;
        }
        if (([v50 hasPrefix:@"com.automation."] & 1) != 0
          || ([v50 hasPrefix:@"com.iosframeworksqa."] & 1) != 0
          || [v50 hasPrefix:@"com.atvqa."])
        {
          uint64_t v78 = sub_1000237C0(a1, @"com.apple.coreautomationd", v14, 0, a5, v62 + 1, a7, a8);

          int v20 = (void *)v78;
        }
LABEL_112:
        if (isa_nsarray())
        {
          if ((unint64_t)[v20 count] | v62) {
            goto LABEL_120;
          }
        }
        else if (v62)
        {
          goto LABEL_120;
        }
        if ((unint64_t)[v50 length] >= 0xC
          && [v50 rangeOfCharacterFromSet:qword_100042D10] == (id)10)
        {
          uint64_t v79 = [v50 substringWithRange:10, 1];
          unsigned int v80 = [v79 isEqualToString:@"."];

          if (v80)
          {
            uint64_t v81 = [v50 substringFromIndex:11];
            uint64_t v82 = sub_1000237C0(a1, v81, v14, 0, a5, v62 + 1, a7, a8);

            int v20 = (void *)v82;
          }
        }
LABEL_120:
        if (isa_nsarray())
        {
          if ((unint64_t)[v20 count] | v62 || (v94 & 1) == 0)
          {
LABEL_129:
            id v18 = v20;

            unsigned __int8 v17 = v99;
            goto LABEL_130;
          }
        }
        else if (v62 || !v94)
        {
          goto LABEL_129;
        }
        id v83 = objc_alloc_init((Class)NSUUID);
        id v108 = v83;
        uint64_t v84 = +[NSArray arrayWithObjects:&v108 count:1];

        id v85 = ne_log_obj();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          id v86 = [v50 UTF8String];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v83;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v86;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Synthesized UUID %@ for bundle ID %s", buf, 0x16u);
        }

        *a8 = 1;
        int v20 = (void *)v84;
        goto LABEL_129;
      }
    }
    else
    {
      int v20 = 0;
    }
    BOOL v21 = 1;
    goto LABEL_13;
  }
  unsigned __int8 v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "we are out of our depths!", buf, 2u);
  }
  id v18 = 0;
LABEL_130:

  return v18;
}

id sub_100024464(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        if (isa_nsuuid())
        {
          v15[0] = 0;
          v15[1] = 0;
          [v8 getUUIDBytes:v15];
          id v9 = [objc_alloc((Class)NSData) initWithBytes:v15 length:16];
          [v2 addObject:v9];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_1000245B8(uint64_t a1)
{
  id v13 = 0;
  id v1 = +[NSPropertyListSerialization dataWithPropertyList:a1 format:200 options:0 error:&v13];
  id v2 = (char *)v13;
  id v3 = v2;
  if (v1) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      SEL v15 = v3;
      uint64_t v6 = "Failed to serialize the cache plist: %@";
      id v7 = v5;
      uint32_t v8 = 12;
LABEL_22:
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (([v1 writeToFile:@"/Library/Preferences/com.apple.networkextension.uuidcache.plist" atomically:1] & 1) == 0)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v6 = "Failed to write the serialized cache to disk";
      id v7 = v5;
      uint32_t v8 = 2;
      goto LABEL_22;
    }
LABEL_19:

    goto LABEL_20;
  }
  ne_force_reset_uuid_cache();
  if (dword_100042A04 != -1) {
    goto LABEL_14;
  }
  uint32_t v9 = notify_register_check("com.apple.networkextension.uuidcache", &dword_100042A04);
  if (v9)
  {
    uint32_t v10 = v9;
    dword_100042A04 = -1;
    long long v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      SEL v15 = "com.apple.networkextension.uuidcache";
      __int16 v16 = 1024;
      uint32_t v17 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
    }
  }
  if (dword_100042A04 != -1)
  {
LABEL_14:
    ++qword_100042D30;
    long long v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      SEL v15 = (const char *)qword_100042D30;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Setting UUID cache generation to %llu", buf, 0xCu);
    }

    if (!notify_set_state(dword_100042A04, qword_100042D30)) {
      notify_post("com.apple.networkextension.uuidcache");
    }
  }
LABEL_20:
}

id sub_100024838(void *a1, void *a2)
{
  id v3 = a2;
  id Property = objc_getProperty(a1, v4, 8, 1);
  dispatch_assert_queue_V2(Property);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = +[NSFileManager defaultManager];
        unsigned int v14 = [v13 isReadableFileAtPath:v12];

        if (v14)
        {
          id v15 = +[NEProcessInfo copyUUIDsForExecutable:v12];
          if (v9) {
            [v9 addObjectsFromArray:v15];
          }
          else {
            id v9 = [objc_alloc((Class)NSMutableArray) initWithArray:v15];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id sub_1000249DC(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  id v9 = [v6 machOUUIDs];

  if (!isa_nsarray() || ![v9 count]) {
    goto LABEL_6;
  }
  if ((unint64_t)[v9 count] >= 2
    && +[NEProcessInfo is64bitCapable])
  {
    id v10 = [v9 mutableCopy];
    [v10 exchangeObjectAtIndex:((char *)[v9 count]) - 1 withObjectAtIndex:0];
    if (!v10)
    {
LABEL_6:
      id v10 = v5;
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = [v9 copy];
    if (!v10) {
      goto LABEL_6;
    }
  }
  if (v5)
  {
    uint64_t v12 = [v5 arrayByAddingObjectsFromArray:v10];

    id v10 = (id)v12;
  }
LABEL_7:

  return v10;
}

uint64_t sub_100024AF8()
{
  v0 = (void *)ne_copy_uuid_cache();
  if (v0) {
    uint64_t v1 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

void sub_100024B3C(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024BC8;
    block[3] = &unk_1000397B8;
    void block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_100024BC8(uint64_t a1)
{
  id v3 = +[NEConfigurationManager sharedManagerForAllUsers];
  SEL v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id Property = objc_getProperty(v4, v2, 8, 1);
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
    id Property = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024C84;
  v7[3] = &unk_100039848;
  void v7[4] = v6;
  [v3 loadConfigurationsWithCompletionQueue:Property handler:v7];
}

void sub_100024C84(uint64_t a1, void *a2)
{
  id v13 = a2;
  if ([v13 count])
  {
    id v3 = [v13 indexOfObjectPassingTest:&stru_100039820];
    if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      SEL v4 = [v13 objectAtIndexedSubscript:v3];
      id v5 = [v4 appVPN];

      if (v5)
      {
        uint64_t v6 = [v4 appVPN];
        uint64_t v7 = [v6 appRules];
      }
      else
      {
        id v8 = [v4 pathController];

        if (!v8)
        {
LABEL_9:

          goto LABEL_10;
        }
        uint64_t v6 = [v4 pathController];
        uint64_t v7 = [v6 pathRules];
      }
      id v9 = (void *)v7;

      if (v9)
      {
        id v10 = *(void **)(a1 + 32);
        uint64_t v11 = NEGetConsoleUserUID();
        uint64_t v12 = [v4 name];
        sub_100022FC0(v10, v9, v11, v12);
      }
      goto LABEL_9;
    }
  }
LABEL_10:
}

BOOL sub_100024DB4(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 name];
    unsigned __int8 v6 = [v5 isEqualToString:@"com.apple.commcenter.ne.cellularusage"];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

void sub_100024E30(id a1)
{
  v43[0] = @"com.apple.datausage.dataaccess.activesync";
  id v33 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D61963E5-13EC-4EAB-A9EB-E6C9BF4D266B"];
  v43[1] = v33;
  uint64_t v32 = +[NSArray arrayWithObjects:v43 count:2];
  v44[0] = v32;
  v42[0] = @"com.apple.datausage.telephony.mms";
  id v31 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"569F2700-CAF9-483D-B19D-7AF406DCE15E"];
  v42[1] = v31;
  id v30 = +[NSArray arrayWithObjects:v42 count:2];
  v44[1] = v30;
  v41[0] = @"com.apple.datausage.atc";
  id v29 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"B3F98213-9C65-405E-BB33-55FA02C7E003"];
  v41[1] = v29;
  uint64_t v28 = +[NSArray arrayWithObjects:v41 count:2];
  v44[2] = v28;
  v40[0] = @"com.apple.datausage.telephony.ims";
  id v27 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"67A03811-DB0A-594E-C2AE-8B0517EDF26F"];
  v40[1] = v27;
  id v26 = +[NSArray arrayWithObjects:v40 count:2];
  v44[3] = v26;
  v39[0] = @"com.apple.icloud.restore";
  id v25 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"D444877C-8E3A-461F-97E2-17A8C4B9924E"];
  v39[1] = v25;
  id v24 = +[NSArray arrayWithObjects:v39 count:2];
  v44[4] = v24;
  v38[0] = @"com.apple.datausage.airdrop";
  id v1 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"9CE8B501-90E7-456E-952B-4937ED29C7BD"];
  v38[1] = v1;
  id v2 = +[NSArray arrayWithObjects:v38 count:2];
  v44[5] = v2;
  v37[0] = @"com.apple.datausage.dns.multicast";
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"979C0A62-49FE-4739-BDCB-CAC584AC832D"];
  v37[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v37 count:2];
  v44[6] = v4;
  v36[0] = @"com.apple.datausage.telephony.rcs";
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"CE95569A-401E-4586-ABCF-1231D42E1D3C"];
  v36[1] = v5;
  unsigned __int8 v6 = +[NSArray arrayWithObjects:v36 count:2];
  v44[7] = v6;
  v35[0] = @"com.apple.mobileassetd.client.auto-asset-client";
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"5C5BCB61-2C52-4D1F-9C1B-A5049F4998E8"];
  v35[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v35 count:2];
  v44[8] = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:v44 count:9];
  id v10 = (void *)qword_100042CF0;
  qword_100042CF0 = v9;

  uint64_t v11 = (void *)qword_100042CF8;
  qword_100042CF8 = (uint64_t)&off_10003FD48;

  uint64_t v12 = (void *)qword_100042D00;
  qword_100042D00 = (uint64_t)&off_10003FD70;

  id v13 = +[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-+"];
  uint64_t v14 = [v13 invertedSet];
  id v15 = (void *)qword_100042D08;
  qword_100042D08 = v14;

  __int16 v16 = +[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"];
  uint64_t v17 = [v16 invertedSet];
  long long v18 = (void *)qword_100042D10;
  qword_100042D10 = v17;

  long long v19 = SCPreferencesCreate(kCFAllocatorDefault, @"NEHelper control settings", @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v19)
  {
    long long v20 = v19;
    CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(v19, @"DisableUUIDDiskCache");
    NEInitCFTypes();
    if (NEIsValidCFType())
    {
      int valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      byte_100042D28 = valuePtr != 0;
    }
    CFRelease(v20);
  }
  uint64_t v22 = objc_alloc_init(NEHelperCacheManager);
  unint64_t v23 = (void *)qword_100042D20;
  qword_100042D20 = (uint64_t)v22;
}

void sub_100025584(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(const __SCPreferences **)(v2 + 16);
  }
  else {
    id v3 = 0;
  }
  SCPreferencesGetValue(v3, @"services");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (isa_nsdictionary()) {
    id v4 = [v12 mutableCopy];
  }
  else {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v5 = v4;
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v6)
  {
    [v5 removeObjectForKey:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v7 ? *(const __SCPreferences **)(v7 + 16) : 0;
    if (SCPreferencesSetValue(v8, @"services", v5))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = v9 ? *(const __SCPreferences **)(v9 + 16) : 0;
      if (SCPreferencesCommitChanges(v10)) {
        sub_100022B70(*(void **)(a1 + 32), v11);
      }
    }
  }
}

void sub_100025688(uint64_t a1)
{
  char v3 = 0;
  uint64_t v2 = sub_100021CD0(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 0, 0, &v3);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1000256EC(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025778;
    block[3] = &unk_1000397B8;
    void block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_100025778(uint64_t a1)
{
}

void sub_100025780(void *a1, const char *a2)
{
  if (a1)
  {
    id Property = objc_getProperty(a1, a2, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002580C;
    block[3] = &unk_1000397B8;
    void block[4] = a1;
    dispatch_async(Property, block);
  }
}

void sub_10002580C(uint64_t a1)
{
  +[NEProcessInfo clearUUIDCache];
  if (SCPreferencesRemoveAllValues())
  {
    uint64_t v2 = *(void *)(a1 + 32);
    char v3 = v2 ? *(const __SCPreferences **)(v2 + 16) : 0;
    if (SCPreferencesCommitChanges(v3)) {
      sub_100022B70(*(void **)(a1 + 32), v4);
    }
  }
  id v5 = *(void **)(a1 + 32);

  sub_1000222BC(v5);
}

void sub_10002588C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id Property = objc_getProperty(a1, v6, 8, 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025964;
    block[3] = &unk_1000397E0;
    void block[4] = a1;
    id v10 = v5;
    id v11 = v7;
    dispatch_async(Property, block);
  }
}

uint64_t sub_100025964(uint64_t a1)
{
  sub_1000220BC(*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void sub_100026038(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v4 count];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 134218242;
      id v14 = v9;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Found %lu UUID(s) by lookup for bundle id: %@", buf, 0x16u);
    }

    unsigned __int8 v6 = [v4 firstObject];
    id v7 = v6;
    if (v6) {
      [v6 getUUIDBytes:&v12];
    }
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found UUID: %@ for bundleID: %@", buf, 0x16u);
    }

    if (!uuid_is_null((const unsigned __int8 *)&v12)) {
      xpc_dictionary_set_uuid(*(xpc_object_t *)(a1 + 40), "app-euuid", (const unsigned __int8 *)&v12);
    }
  }
  sub_100001CA0((uint64_t)NEHelperServer, *(void **)(a1 + 48), 0, *(void **)(a1 + 40));
}

uint64_t start()
{
  if (qword_100042D40 != -1) {
    dispatch_once(&qword_100042D40, &stru_1000398B0);
  }
  sub_10000CA2C();
  id v1 = (int *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    uint64_t v2 = +[NEConfigurationManager sharedManagerForAllUsers];
    [v2 postGeneration];

    id Property = objc_getProperty(v1, v3, 24, 1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000CC1C;
    handler[3] = &unk_1000394C0;
    void handler[4] = v1;
    xpc_set_event_stream_handler("com.apple.fsevents.matching", Property, handler);
    unsigned __int8 v6 = objc_getProperty(v1, v5, 24, 1);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000CC2C;
    v18[3] = &unk_1000394C0;
    void v18[4] = v1;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", v6, v18);
    id v8 = objc_getProperty(v1, v7, 24, 1);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000CC3C;
    v17[3] = &unk_100038E70;
    void v17[4] = v1;
    if (notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", v1 + 4, v8, v17))
    {
      id v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 136315138;
        *(void *)((char *)&block + 4) = "com.apple.mobile.keybagd.first_unlock";
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to register for the %s notification", (uint8_t *)&block, 0xCu);
      }
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000CC44;
    v16[3] = &unk_100038E98;
    void v16[4] = v1;
    +[MOEffectiveSettings startObservingChangesWithHandler:v16];
    uint64_t v11 = (_xpc_connection_s *)objc_getProperty(v1, v10, 32, 1);
    xpc_connection_resume(v11);
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = dispatch_queue_create("check launch services", v12);

    *(void *)&long long block = _NSConcreteStackBlock;
    *((void *)&block + 1) = 3221225472;
    BOOL v21 = sub_10000CD38;
    uint64_t v22 = &unk_1000397B8;
    unint64_t v23 = v1;
    dispatch_async(v13, &block);
  }
  id v14 = +[NSRunLoop mainRunLoop];
  [v14 run];

  return 0;
}

void sub_100026838(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("nw_privileged_queue", v1);
  SEL v3 = (void *)qword_100042D48;
  qword_100042D48 = (uint64_t)v2;

  uint64_t v4 = qword_100042D48;

  _NWPrivilegedHelperStart(v4);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
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

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return _CFStringCreateExternalRepresentation(alloc, theString, encoding, lossByte);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

uint64_t CPGetDeviceRegionCode()
{
  return _CPGetDeviceRegionCode();
}

uint64_t NECopyConsoleUserUUID()
{
  return _NECopyConsoleUserUUID();
}

uint64_t NECopySigningIdentifierForXPCMessage()
{
  return _NECopySigningIdentifierForXPCMessage();
}

uint64_t NECopyUserUUIDFromXPCEUID()
{
  return _NECopyUserUUIDFromXPCEUID();
}

uint64_t NEGetConsoleUserUID()
{
  return _NEGetConsoleUserUID();
}

uint64_t NEGetEntitlement()
{
  return _NEGetEntitlement();
}

uint64_t NEGetRootUUID()
{
  return _NEGetRootUUID();
}

uint64_t NEInitCFTypes()
{
  return _NEInitCFTypes();
}

uint64_t NEIsValidCFType()
{
  return _NEIsValidCFType();
}

uint64_t NEResourcesCopyAppTrackingDomainsPath()
{
  return _NEResourcesCopyAppTrackingDomainsPath();
}

uint64_t NEResourcesCopyDeviceLocalizedFormatString()
{
  return _NEResourcesCopyDeviceLocalizedFormatString();
}

uint64_t NEResourcesCopyDeviceLocalizedNSString()
{
  return _NEResourcesCopyDeviceLocalizedNSString();
}

uint64_t NEResourcesCopyDevicePreferredLocalizations()
{
  return _NEResourcesCopyDevicePreferredLocalizations();
}

uint64_t NEResourcesCopyLocalizedNSString()
{
  return _NEResourcesCopyLocalizedNSString();
}

uint64_t NEResourcesCopyTestAppTrackingDomainsPath()
{
  return _NEResourcesCopyTestAppTrackingDomainsPath();
}

uint64_t NEResourcesSetPreferredLanguages()
{
  return _NEResourcesSetPreferredLanguages();
}

uint64_t NEUIDForAuditToken()
{
  return _NEUIDForAuditToken();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NWPrivilegedHelperHandleEvent()
{
  return _NWPrivilegedHelperHandleEvent();
}

CFErrorRef SCCopyLastError(void)
{
  return _SCCopyLastError();
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

uint64_t SCPreferencesRemoveAllValues()
{
  return _SCPreferencesRemoveAllValues();
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesRemoveValue(prefs, key);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return _SCPreferencesSetValue(prefs, key, value);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return _SecCertificateCopyData(certificate);
}

uint64_t SecIdentityCreate()
{
  return _SecIdentityCreate();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return _WiFiDeviceClientCopyCurrentNetwork();
}

uint64_t WiFiDeviceClientDisassociate()
{
  return _WiFiDeviceClientDisassociate();
}

uint64_t WiFiManagerClientAddNetworkAsync()
{
  return _WiFiManagerClientAddNetworkAsync();
}

uint64_t WiFiManagerClientCopyCurrentSessionBasedNetwork()
{
  return _WiFiManagerClientCopyCurrentSessionBasedNetwork();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return _WiFiManagerClientCopyDevices();
}

uint64_t WiFiManagerClientCopyNetworksWithBundleIdentifier()
{
  return _WiFiManagerClientCopyNetworksWithBundleIdentifier();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientGetDevice()
{
  return _WiFiManagerClientGetDevice();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return _WiFiManagerClientRegisterServerRestartCallback();
}

uint64_t WiFiManagerClientRemoveNetwork()
{
  return _WiFiManagerClientRemoveNetwork();
}

uint64_t WiFiManagerClientRemoveNetworksWithBundleIdentifier()
{
  return _WiFiManagerClientRemoveNetworksWithBundleIdentifier();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return _WiFiManagerClientUnscheduleFromRunLoop();
}

uint64_t WiFiNetworkCreate()
{
  return _WiFiNetworkCreate();
}

uint64_t WiFiNetworkGetBundleIdentifier()
{
  return _WiFiNetworkGetBundleIdentifier();
}

uint64_t WiFiNetworkGetHS20DomainName()
{
  return _WiFiNetworkGetHS20DomainName();
}

uint64_t WiFiNetworkGetProperty()
{
  return _WiFiNetworkGetProperty();
}

uint64_t WiFiNetworkGetSSID()
{
  return _WiFiNetworkGetSSID();
}

uint64_t WiFiNetworkGetSSIDData()
{
  return _WiFiNetworkGetSSIDData();
}

uint64_t WiFiNetworkIsEAP()
{
  return _WiFiNetworkIsEAP();
}

uint64_t WiFiNetworkIsHotspot()
{
  return _WiFiNetworkIsHotspot();
}

uint64_t WiFiNetworkIsOpen()
{
  return _WiFiNetworkIsOpen();
}

uint64_t WiFiNetworkIsSAE()
{
  return _WiFiNetworkIsSAE();
}

uint64_t WiFiNetworkIsWEP()
{
  return _WiFiNetworkIsWEP();
}

uint64_t WiFiNetworkIsWPAWPA2PSK()
{
  return _WiFiNetworkIsWPAWPA2PSK();
}

uint64_t WiFiNetworkSetExpireDate()
{
  return _WiFiNetworkSetExpireDate();
}

uint64_t WiFiNetworkSetPassword()
{
  return _WiFiNetworkSetPassword();
}

uint64_t WiFiNetworkSetProperty()
{
  return _WiFiNetworkSetProperty();
}

uint64_t WiFiNetworkSetWEP()
{
  return _WiFiNetworkSetWEP();
}

uint64_t WiFiNetworkSetWPA()
{
  return _WiFiNetworkSetWPA();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

int connectx(int a1, const sa_endpoints_t *a2, sae_associd_t a3, unsigned int a4, const iovec *a5, unsigned int a6, size_t *a7, sae_connid_t *a8)
{
  return _connectx(a1, a2, a3, a4, a5, a6, a7, a8);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t isa_nsarray()
{
  return _isa_nsarray();
}

uint64_t isa_nsdata()
{
  return _isa_nsdata();
}

uint64_t isa_nsdictionary()
{
  return _isa_nsdictionary();
}

uint64_t isa_nsstring()
{
  return _isa_nsstring();
}

uint64_t isa_nsuuid()
{
  return _isa_nsuuid();
}

uint64_t myCFRelease()
{
  return _myCFRelease();
}

uint64_t ne_copy_signature_info_for_pid()
{
  return _ne_copy_signature_info_for_pid();
}

uint64_t ne_copy_uuid_cache()
{
  return _ne_copy_uuid_cache();
}

uint64_t ne_force_reset_uuid_cache()
{
  return _ne_force_reset_uuid_cache();
}

uint64_t ne_is_sockaddr_valid()
{
  return _ne_is_sockaddr_valid();
}

uint64_t ne_log_large_obj()
{
  return _ne_log_large_obj();
}

uint64_t ne_log_obj()
{
  return _ne_log_obj();
}

uint64_t ne_session_copy_os_version_string()
{
  return _ne_session_copy_os_version_string();
}

uint64_t ne_session_fallback_advisory()
{
  return _ne_session_fallback_advisory();
}

uint64_t ne_session_get_boot_session_uuid()
{
  return _ne_session_get_boot_session_uuid();
}

uint64_t ne_session_type_to_string()
{
  return _ne_session_type_to_string();
}

uint64_t ne_tracker_build_trie()
{
  return _ne_tracker_build_trie();
}

uint64_t ne_tracker_validate_domain()
{
  return _ne_tracker_validate_domain();
}

uint64_t ne_trie_free()
{
  return _ne_trie_free();
}

uint64_t ne_trie_has_high_ascii()
{
  return _ne_trie_has_high_ascii();
}

uint64_t ne_trie_init_from_file()
{
  return _ne_trie_init_from_file();
}

uint64_t necp_session_open()
{
  return _necp_session_open();
}

uint64_t nelog_is_debug_logging_enabled()
{
  return _nelog_is_debug_logging_enabled();
}

uint64_t nelog_is_extra_vpn_logging_enabled()
{
  return _nelog_is_extra_vpn_logging_enabled();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return _nw_endpoint_create_address(address);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
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

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return _strerror_r(__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return _uidna_nameToASCII_UTF8(idna, name, length, dest, capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return _uidna_openUTS46(options, pErrorCode);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
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

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

uint64_t xpc_connection_is_extension()
{
  return _xpc_connection_is_extension();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

uint64_t xpc_dictionary_handoff_reply()
{
  return _xpc_dictionary_handoff_reply();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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

xpc_object_t xpc_fd_create(int fd)
{
  return _xpc_fd_create(fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
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

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return [a1 SDKVersion];
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return [a1 SSID];
}

id objc_msgSend_SSIDPrefix(void *a1, const char *a2, ...)
{
  return [a1 SSIDPrefix];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_VPN(void *a1, const char *a2, ...)
{
  return [a1 VPN];
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return [a1 _endpoint];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowedClient(void *a1, const char *a2, ...)
{
  return [a1 allowedClient];
}

id objc_msgSend_alwaysOnVPN(void *a1, const char *a2, ...)
{
  return [a1 alwaysOnVPN];
}

id objc_msgSend_appGroups(void *a1, const char *a2, ...)
{
  return [a1 appGroups];
}

id objc_msgSend_appPush(void *a1, const char *a2, ...)
{
  return [a1 appPush];
}

id objc_msgSend_appRules(void *a1, const char *a2, ...)
{
  return [a1 appRules];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appVPN(void *a1, const char *a2, ...)
{
  return [a1 appVPN];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canBlockRequest(void *a1, const char *a2, ...)
{
  return [a1 canBlockRequest];
}

id objc_msgSend_cellularBehavior(void *a1, const char *a2, ...)
{
  return [a1 cellularBehavior];
}

id objc_msgSend_certificateReferences(void *a1, const char *a2, ...)
{
  return [a1 certificateReferences];
}

id objc_msgSend_clearSystemKeychain(void *a1, const char *a2, ...)
{
  return [a1 clearSystemKeychain];
}

id objc_msgSend_clearUUIDCache(void *a1, const char *a2, ...)
{
  return [a1 clearUUIDCache];
}

id objc_msgSend_clientTrustChainReference(void *a1, const char *a2, ...)
{
  return [a1 clientTrustChainReference];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return [a1 containingBundle];
}

id objc_msgSend_contentFilter(void *a1, const char *a2, ...)
{
  return [a1 contentFilter];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCertificateData(void *a1, const char *a2, ...)
{
  return [a1 copyCertificateData];
}

id objc_msgSend_copyPasswordsFromSystemKeychain(void *a1, const char *a2, ...)
{
  return [a1 copyPasswordsFromSystemKeychain];
}

id objc_msgSend_copySecKeyProxy(void *a1, const char *a2, ...)
{
  return [a1 copySecKeyProxy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_denyCellularFallback(void *a1, const char *a2, ...)
{
  return [a1 denyCellularFallback];
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return [a1 denyMulticast];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return [a1 developerType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dnsProxy(void *a1, const char *a2, ...)
{
  return [a1 dnsProxy];
}

id objc_msgSend_dnsSettings(void *a1, const char *a2, ...)
{
  return [a1 dnsSettings];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eapSettings(void *a1, const char *a2, ...)
{
  return [a1 eapSettings];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_externalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifier];
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return [a1 finishEncoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_grade(void *a1, const char *a2, ...)
{
  return [a1 grade];
}

id objc_msgSend_handlerQueue(void *a1, const char *a2, ...)
{
  return [a1 handlerQueue];
}

id objc_msgSend_hasNonDefaultRules(void *a1, const char *a2, ...)
{
  return [a1 hasNonDefaultRules];
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return [a1 hidden];
}

id objc_msgSend_hs20Settings(void *a1, const char *a2, ...)
{
  return [a1 hs20Settings];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_identityData(void *a1, const char *a2, ...)
{
  return [a1 identityData];
}

id objc_msgSend_identityDataPassword(void *a1, const char *a2, ...)
{
  return [a1 identityDataPassword];
}

id objc_msgSend_identityReference(void *a1, const char *a2, ...)
{
  return [a1 identityReference];
}

id objc_msgSend_identityReferenceInternal(void *a1, const char *a2, ...)
{
  return [a1 identityReferenceInternal];
}

id objc_msgSend_ignoreRouteRules(void *a1, const char *a2, ...)
{
  return [a1 ignoreRouteRules];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_is64bitCapable(void *a1, const char *a2, ...)
{
  return [a1 is64bitCapable];
}

id objc_msgSend_isAccessory(void *a1, const char *a2, ...)
{
  return [a1 isAccessory];
}

id objc_msgSend_isAppStoreVendable(void *a1, const char *a2, ...)
{
  return [a1 isAppStoreVendable];
}

id objc_msgSend_isApproved(void *a1, const char *a2, ...)
{
  return [a1 isApproved];
}

id objc_msgSend_isDefaultPathRule(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPathRule];
}

id objc_msgSend_isDeletableSystemApplication(void *a1, const char *a2, ...)
{
  return [a1 isDeletableSystemApplication];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isIdentifierExternal(void *a1, const char *a2, ...)
{
  return [a1 isIdentifierExternal];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isModernSystem(void *a1, const char *a2, ...)
{
  return [a1 isModernSystem];
}

id objc_msgSend_isRoamingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRoamingEnabled];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return [a1 isSupervised];
}

id objc_msgSend_isTLSClientCertificateRequired(void *a1, const char *a2, ...)
{
  return [a1 isTLSClientCertificateRequired];
}

id objc_msgSend_isTransparentProxy(void *a1, const char *a2, ...)
{
  return [a1 isTransparentProxy];
}

id objc_msgSend_isVPNCreationAllowed(void *a1, const char *a2, ...)
{
  return [a1 isVPNCreationAllowed];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWatchKitApp(void *a1, const char *a2, ...)
{
  return [a1 isWatchKitApp];
}

id objc_msgSend_joinOnce(void *a1, const char *a2, ...)
{
  return [a1 joinOnce];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyPersistentReference(void *a1, const char *a2, ...)
{
  return [a1 keyPersistentReference];
}

id objc_msgSend_lastDatabaseUpdate(void *a1, const char *a2, ...)
{
  return [a1 lastDatabaseUpdate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lifeTimeInDays(void *a1, const char *a2, ...)
{
  return [a1 lifeTimeInDays];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_machOUUIDs(void *a1, const char *a2, ...)
{
  return [a1 machOUUIDs];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_matchDomains(void *a1, const char *a2, ...)
{
  return [a1 matchDomains];
}

id objc_msgSend_matchPath(void *a1, const char *a2, ...)
{
  return [a1 matchPath];
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return [a1 matchSigningIdentifier];
}

id objc_msgSend_multicastPreferenceSet(void *a1, const char *a2, ...)
{
  return [a1 multicastPreferenceSet];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_naiRealmNames(void *a1, const char *a2, ...)
{
  return [a1 naiRealmNames];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkPrivacyConfigurationName(void *a1, const char *a2, ...)
{
  return [a1 networkPrivacyConfigurationName];
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return [a1 order];
}

id objc_msgSend_outerIdentity(void *a1, const char *a2, ...)
{
  return [a1 outerIdentity];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return [a1 passphrase];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_pathController(void *a1, const char *a2, ...)
{
  return [a1 pathController];
}

id objc_msgSend_pathRules(void *a1, const char *a2, ...)
{
  return [a1 pathRules];
}

id objc_msgSend_payloadInfo(void *a1, const char *a2, ...)
{
  return [a1 payloadInfo];
}

id objc_msgSend_perApp(void *a1, const char *a2, ...)
{
  return [a1 perApp];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return [a1 plugInKitPlugins];
}

id objc_msgSend_pluginType(void *a1, const char *a2, ...)
{
  return [a1 pluginType];
}

id objc_msgSend_postGeneration(void *a1, const char *a2, ...)
{
  return [a1 postGeneration];
}

id objc_msgSend_preferredTLSVersion(void *a1, const char *a2, ...)
{
  return [a1 preferredTLSVersion];
}

id objc_msgSend_privacyTrackingDomains(void *a1, const char *a2, ...)
{
  return [a1 privacyTrackingDomains];
}

id objc_msgSend_profileSource(void *a1, const char *a2, ...)
{
  return [a1 profileSource];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_relay(void *a1, const char *a2, ...)
{
  return [a1 relay];
}

id objc_msgSend_relays(void *a1, const char *a2, ...)
{
  return [a1 relays];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_roamingConsortiumOIs(void *a1, const char *a2, ...)
{
  return [a1 roamingConsortiumOIs];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return [a1 securityType];
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 serviceSpecifier];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return [a1 sharedManagerForAllUsers];
}

id objc_msgSend_sharingPolicy(void *a1, const char *a2, ...)
{
  return [a1 sharingPolicy];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_shouldPromptForLocalAuthentication(void *a1, const char *a2, ...)
{
  return [a1 shouldPromptForLocalAuthentication];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_supportedEAPTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedEAPTypes];
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return [a1 teamID];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_trustedServerCertificateReferences(void *a1, const char *a2, ...)
{
  return [a1 trustedServerCertificateReferences];
}

id objc_msgSend_trustedServerNames(void *a1, const char *a2, ...)
{
  return [a1 trustedServerNames];
}

id objc_msgSend_ttlsInnerAuthenticationType(void *a1, const char *a2, ...)
{
  return [a1 ttlsInnerAuthenticationType];
}

id objc_msgSend_tunnelType(void *a1, const char *a2, ...)
{
  return [a1 tunnelType];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_useSSIDPrefix(void *a1, const char *a2, ...)
{
  return [a1 useSSIDPrefix];
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return [a1 user];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return [a1 validate];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_wifiBehavior(void *a1, const char *a2, ...)
{
  return [a1 wifiBehavior];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1];
}