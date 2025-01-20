void sub_1000043A8(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t vars8;

  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  sub_1000043F8(a1);
  os_unfair_lock_unlock(v2);

  sub_100004500((void *)a1);
}

void sub_1000043F8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "ds_data_invalid", 1);
  v3 = (void *)qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006578(a1, v3);
  }
  v4 = *(void **)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005B14;
  v8[3] = &unk_100008460;
  id v5 = v2;
  id v9 = v5;
  uint64_t v10 = a1;
  if (!xpc_array_apply(v4, v8)) {
    sub_10000655C();
  }
  xpc_object_t v6 = xpc_array_create(0, 0);
  v7 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v6;
}

void sub_100004500(void *a1)
{
  if (a1)
  {
    xpc_object_t v2 = qword_10000C028;
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = a1 + 13;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[%s] Freeing up datastore object", (uint8_t *)&v8, 0xCu);
    }
    v3 = (void *)a1[5];
    if (v3)
    {
      if (a1[10] == 1) {
        free(v3);
      }
      else {
        munmap(v3, a1[6]);
      }
    }
    v4 = (void *)a1[12];
    if (v4) {
      free(v4);
    }
    id v5 = (void *)a1[7];
    a1[7] = 0;

    xpc_object_t v6 = (void *)a1[2];
    a1[2] = 0;

    v7 = (void *)a1[3];
    a1[3] = 0;

    free(a1);
  }
}

uint64_t sub_100004604(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return _objc_release_x1();
}

void sub_100004610(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  string = xpc_dictionary_get_string(v3, "ds_name");
  uint64_t v6 = sub_100004800();
  v7 = qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    v14 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Initial subscriber handshake ", (uint8_t *)&v13, 0xCu);
  }
  if (v6)
  {
    if (*(void *)(v6 + 96))
    {
      int v8 = (void *)xpc_connection_copy_entitlement_value();
      id v9 = v8;
      if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
      {
        unsigned int v10 = 0;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
          sub_100006694();
        }
        unsigned int v10 = 1;
      }
    }
    else
    {
      unsigned int v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
      sub_10000662C();
    }
    unsigned int v10 = 22;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_uint64(reply, "ds_status", v10);
  if (!v10)
  {
    xpc_dictionary_set_uint64(reply, "ds_type", *(void *)(v6 + 80));
    xpc_endpoint_t v12 = xpc_endpoint_create(*(xpc_connection_t *)(v6 + 16));
    xpc_dictionary_set_value(reply, "endpoint", v12);
  }
  xpc_dictionary_send_reply();
}

uint64_t sub_100004800()
{
  os_unfair_lock_lock((os_unfair_lock_t)&dword_10000C018);
  uint64_t pointer = xpc_dictionary_get_pointer();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_10000C018);
  return pointer;
}

void sub_10000484C(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  string = xpc_dictionary_get_string(v4, "ds_name");
  uint64_t v6 = sub_100004800();
  v7 = qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    v15 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Publisher registering for datastore", (uint8_t *)&v14, 0xCu);
  }
  if (v6)
  {
    int v8 = (void *)xpc_connection_copy_entitlement_value();
    id v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
    {
      unsigned int v10 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
        sub_1000067CC();
      }
      unsigned int v10 = 1;
    }
    if (*(unsigned char *)(v6 + 64))
    {
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
        sub_100006764();
      }
      unsigned int v10 = 37;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
      sub_1000066FC();
    }
    unsigned int v10 = 22;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v4);

  xpc_dictionary_set_uint64(reply, "ds_status", v10);
  if (!v10)
  {
    *(unsigned char *)(v6 + 64) |= 1u;
    xpc_dictionary_set_uint64(reply, "ds_type", *(void *)(v6 + 80));
    xpc_dictionary_set_uint64(reply, "max_size", *(void *)(v6 + 88));
    xpc_endpoint_t v12 = xpc_endpoint_create(*(xpc_connection_t *)(v6 + 24));
    xpc_dictionary_set_value(reply, "endpoint", v12);

    int v13 = qword_10000C028;
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315138;
      v15 = (const char *)(v6 + 104);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%s] Invalidating data from producer's previous lifetime", (uint8_t *)&v14, 0xCu);
    }
    sub_100004AE0(v6);
  }
  xpc_dictionary_send_reply();
}

void sub_100004AE0(uint64_t a1)
{
  xpc_object_t v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  __swp(v3, (unsigned int *)(a1 + 40));
  if (v3)
  {
    if (*(void *)(a1 + 80) == 1) {
      free(v3);
    }
    else {
      munmap(v3, *(void *)(a1 + 48));
    }
    *(void *)(a1 + 48) = 0;
    sub_1000043F8(a1);
  }
  os_unfair_lock_unlock(v2);
  id v4 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C34;
  block[3] = &unk_100008480;
  block[4] = a1;
  dispatch_async(v4, block);
}

void sub_100004BA4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (const void *)a2[5];
  xpc_object_t xdict = v3;
  if (v4)
  {
    if (a2[10] == 1)
    {
      xpc_dictionary_set_data(v3, "ds_data", v4, a2[6]);
    }
    else
    {
      readonly = (void *)xpc_shmem_create_readonly();
      xpc_dictionary_set_value(xdict, "ds_ool_data", readonly);
    }
    xpc_dictionary_set_uint64(xdict, "ds_type", a2[10]);
    uint64_t v5 = 0;
    id v3 = xdict;
  }
  else
  {
    uint64_t v5 = 96;
  }
  xpc_dictionary_set_uint64(v3, "ds_status", v5);
}

id sub_100004C68(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "ds_name", (const char *)(a1 + 104));
  id v3 = (void *)xpc_event_publisher_fire_with_reply_sync();

  return v3;
}

void sub_100004CDC(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(void *)(a1 + 40))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    xpc_object_t v2 = qword_10000C028;
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = a1 + 104;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[%s] Requesting data from producer", buf, 0xCu);
    }
    id v3 = sub_100004C68(a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (!v3 || xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
        sub_100006854();
      }
    }
    else
    {
      id v4 = v3;
      if ((*(unsigned char *)(a1 + 64) & 1) == 0) {
        sub_10000655C();
      }
      id v3 = v4;
      if (xpc_dictionary_get_uint64(v4, "request_type") != 5) {
        sub_10000655C();
      }
      region = 0;
      uint64_t v5 = *(void **)(a1 + 40);
      if (*(void *)(a1 + 80) == 1)
      {
        free(v5);
        data = xpc_dictionary_get_data(v3, "ds_data", (size_t *)(a1 + 48));
        v7 = malloc_type_malloc(*(void *)(a1 + 48), 0x857ABE1DuLL);
        region = v7;
        memcpy(v7, data, *(void *)(a1 + 48));
      }
      else
      {
        munmap(v5, *(void *)(a1 + 48));
        int v8 = xpc_dictionary_get_value(v3, "ds_ool_data");
        *(void *)(a1 + 48) = xpc_shmem_map(v8, &region);

        v7 = region;
      }
      *(void *)(a1 + 40) = v7;
      id v9 = qword_10000C028;
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v12 = a1 + 104;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%s] Populated with data", buf, 0xCu);
      }
    }
  }
}

void sub_100004F14(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "request_type");
  if (uint64 == 6)
  {
    sub_10000484C(v3, v4);
  }
  else if (uint64 == 1)
  {
    sub_100004610(v3, v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR))
  {
    sub_1000068C0();
  }
}

void sub_100004FC0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006C0C();
  }
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006B88();
  }
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006B04();
  }
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006A98();
  }
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006A2C();
  }
  xpc_object_t v2 = (void *)qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006994(a1, v2);
  }
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
    sub_100006928();
  }
}

void sub_1000050E8()
{
  v0 = qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Printing out registered datastores...\n", buf, 2u);
  }
  xpc_dictionary_apply((xpc_object_t)qword_10000C020, &stru_1000083B0);
  v1 = qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)xpc_object_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Done", v2, 2u);
  }
}

BOOL sub_1000051A0(id a1, const char *a2, OS_xpc_object *a3)
{
  id v3 = a3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_pointer) {
    sub_10000655C();
  }
  uint64_t value = xpc_pointer_get_value();
  sub_100004FC0(value);

  return 1;
}

void start()
{
  dword_10000C018 = 0;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  v1 = (void *)qword_10000C020;
  qword_10000C020 = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.xpc.datastore", "datastored");
  id v3 = (void *)qword_10000C028;
  qword_10000C028 = (uint64_t)v2;

  dispatch_workloop_t v4 = dispatch_workloop_create("com.apple.datastored.ipc_wl");
  mach_service = xpc_connection_create_mach_service("com.apple.xpc.datastore", 0, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005390;
  handler[3] = &unk_1000083D8;
  handler[4] = v4;
  xpc_connection_set_event_handler(mach_service, handler);
  objc_storeStrong(&qword_10000C010, mach_service);
  objc_storeStrong((id *)&qword_10000C000, v4);
  uint64_t v6 = xpc_event_publisher_create();
  xpc_event_publisher_set_handler();
  xpc_event_publisher_set_error_handler();
  objc_storeStrong((id *)&qword_10000C008, v6);
  xpc_event_publisher_activate();
  signal(30, (void (__cdecl *)(int))sub_1000050E8);
  dispatch_main();
}

void sub_100005390(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005454;
    handler[3] = &unk_1000083D8;
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_resume((xpc_connection_t)v4);
  }
}

void sub_100005454(uint64_t a1, void *a2)
{
  xpc_object_t object = a2;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_100004F14(object, *(void **)(a1 + 32));
  }
  else
  {
    xpc_type_t type = xpc_get_type(object);

    if (type == (xpc_type_t)&_xpc_type_error)
    {
      id v4 = *(_xpc_connection_s **)(a1 + 32);
      xpc_connection_cancel(v4);
    }
  }
}

void sub_100005510(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  switch(a2)
  {
    case 2:
      xpc_connection_resume(*(xpc_connection_t *)(*(void *)(a1 + 32) + 16));
      break;
    case 1:
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x2020000000;
      v51 = 0;
      os_unfair_lock_lock((os_unfair_lock_t)&dword_10000C018);
      *(void *)__s = _NSConcreteStackBlock;
      *(void *)&__s[8] = 3221225472;
      *(void *)&long long v38 = sub_1000064B4;
      *((void *)&v38 + 1) = &unk_1000084F0;
      *(void *)&long long v39 = &buf;
      *((void *)&v39 + 1) = a3;
      xpc_dictionary_apply((xpc_object_t)qword_10000C020, __s);
      uint64_t v32 = *(void *)(*((void *)&buf + 1) + 24);
      if (v32)
      {
        v33 = qword_10000C028;
        if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
        {
          LODWORD(handler) = 136315138;
          *(void *)((char *)&handler + 4) = v32 + 104;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%s] Removing datastore from registered list", (uint8_t *)&handler, 0xCu);
          uint64_t v32 = *(void *)(*((void *)&buf + 1) + 24);
        }
        xpc_dictionary_set_value((xpc_object_t)qword_10000C020, (const char *)(v32 + 104), 0);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_10000C018);
        sub_100005C80(*(void *)(*((void *)&buf + 1) + 24));
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_10000C018);
        v34 = qword_10000C028;
        if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
          sub_100006D48(a3, v34);
        }
      }
      _Block_object_dispose(&buf, 8);
      break;
    case 0:
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      *(_OWORD *)__s = 0u;
      long long v38 = 0u;
      char event_name = xpc_get_event_name();
      id v9 = qword_10000C028;
      if (event_name)
      {
        if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = __s;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%s] Adding info for datastore", (uint8_t *)&buf, 0xCu);
        }
        id v10 = v7;
        size_t v11 = strlen(__s);
        uint64_t v12 = malloc_type_calloc(1uLL, v11 + 105, 0xBE055987uLL);
        int v13 = (void **)v12;
        if (v12)
        {
          strcpy((char *)v12 + 104, __s);
          id v14 = v10;
          v13[9] = (void *)a3;
          int64_t int64 = xpc_dictionary_get_int64(v14, "SizeLimit");
          v13[11] = (void *)int64;
          if (int64)
          {
            v13[10] = (void *)1;
            string = xpc_dictionary_get_string(v14, "RequiresEntitlement");
            if (string) {
              v13[12] = strdup(string);
            }
            *((_DWORD *)v13 + 8) = 0;
            xpc_object_t v17 = xpc_array_create(0, 0);
            v18 = v13[7];
            v13[7] = v17;

            *((unsigned char *)v13 + 64) &= ~1u;
            label = 0;
            asprintf(&label, "%s.ipc_dq", (const char *)v13 + 104);
            v19 = dispatch_queue_create_with_target_V2(label, 0, (dispatch_queue_t)qword_10000C000);
            dispatch_set_finalizer_f(v19, (dispatch_function_t)sub_100004604);
            dispatch_set_context(v19, v13);
            v20 = *v13;
            *int v13 = v19;
            v21 = v19;

            free(label);
            asprintf(&label, "%s.launch_pub_dq", (const char *)v13 + 104);
            v22 = dispatch_queue_create(label, 0);
            dispatch_set_finalizer_f(v22, (dispatch_function_t)sub_1000043A8);
            dispatch_set_context(v22, v13);
            v23 = v13[1];
            v13[1] = v22;
            v24 = v22;

            free(label);
            v25 = xpc_connection_create(0, 0);
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            uint64_t v50 = (uint64_t)sub_100005CDC;
            v51 = &unk_1000084A0;
            v52 = v13;
            xpc_connection_set_event_handler(v25, &buf);
            v26 = v13[2];
            v13[2] = v25;
            v27 = v25;

            xpc_connection_activate(v27);
            v28 = xpc_connection_create(0, 0);
            *(void *)&long long handler = _NSConcreteStackBlock;
            *((void *)&handler + 1) = 3221225472;
            v46 = sub_1000060E4;
            v47 = &unk_1000084A0;
            v48 = v13;
            xpc_connection_set_event_handler(v28, &handler);
            v29 = v13[3];
            v13[3] = v28;
            v30 = v28;

            xpc_connection_activate(v30);
            os_unfair_lock_lock((os_unfair_lock_t)&dword_10000C018);
            uint64_t pointer = xpc_dictionary_get_pointer();
            if (pointer)
            {
              xpc_dictionary_set_pointer();
              sub_100005C80(pointer);
              sub_100004500(v13);
              if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
                sub_100006C78();
              }
            }
            else
            {
              xpc_dictionary_set_pointer();
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_10000C018);
            goto LABEL_28;
          }
        }
        else
        {
          id v35 = v10;
        }

LABEL_28:
        break;
      }
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
        sub_100006CE0();
      }
      break;
  }
}

void sub_100005AAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100005ACC(id a1, int a2)
{
  id v3 = qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
    sub_100006DD4(a2, v3);
  }
}

uint64_t sub_100005B14(uint64_t a1)
{
  mach_port_name_t v2 = xpc_mach_send_copy_right();
  if (v2 - 1 <= 0xFFFFFFFD)
  {
    mach_port_name_t v3 = v2;
    id v4 = (void *)xpc_pipe_create_from_port();
    int v5 = xpc_pipe_simpleroutine();
    if (v5)
    {
      int v6 = v5;
      id v7 = qword_10000C028;
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40) + 104;
        int v10 = 136315650;
        uint64_t v11 = v9;
        __int16 v12 = 1024;
        mach_port_name_t v13 = v3;
        __int16 v14 = 1024;
        int v15 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%s] Unable to send invalidation to client %#x: %d", (uint8_t *)&v10, 0x18u);
      }
    }
    mach_port_deallocate(mach_task_self_, v3);
  }
  return 1;
}

void sub_100005C34(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
  sub_100004CDC(*(void *)(a1 + 32));
  mach_port_name_t v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 32);

  os_unfair_lock_unlock(v2);
}

void sub_100005C80(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 24));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  mach_port_name_t v2 = *(void **)a1;
  *(void *)a1 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
}

void sub_100005CDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005DA4;
    handler[3] = &unk_1000083D8;
    id v4 = v3;
    id v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, **(dispatch_queue_t **)(a1 + 32));
    xpc_connection_activate((xpc_connection_t)v4);
  }
}

void sub_100005DA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "request_type");
    if (uint64 == 3)
    {
      int v5 = v3;
      int v6 = 1;
      goto LABEL_6;
    }
    if (uint64 == 2)
    {
      int v5 = v3;
      int v6 = 0;
LABEL_6:
      sub_100005E54(v5, v6);
      goto LABEL_10;
    }
    id v7 = qword_10000C028;
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
      sub_100006E4C(v7);
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
LABEL_10:
}

void sub_100005E54(void *a1, int a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  string = xpc_dictionary_get_string(v3, "ds_name");
  uint64_t v6 = sub_100004800();
  id v7 = qword_10000C028;
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    mach_port_name_t v13 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Requesting datastore data", buf, 0xCu);
  }
  if (v6)
  {
    int v8 = xpc_dictionary_get_value(v3, "ds_data_invalid_notify");
    if (*(void *)(v6 + 40))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
      sub_100004BA4(reply, (void *)v6);
      xpc_array_append_value(*(xpc_object_t *)(v6 + 56), v8);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 32));
    }
    else
    {
      uint64_t v9 = qword_10000C028;
      if (!a2)
      {
        if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_DEBUG)) {
          sub_100006EF8();
        }
        id v10 = reply;
        id v11 = v8;
        xpc_dictionary_handoff_reply();

        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        mach_port_name_t v13 = string;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%s] Datastore not populated but soft demand request - returning ENODATA", buf, 0xCu);
      }
      xpc_dictionary_set_uint64(reply, "ds_status", 0x60uLL);
    }
    xpc_dictionary_send_reply();
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR)) {
    sub_100006E90();
  }
  xpc_dictionary_set_uint64(reply, "ds_status", 0x16uLL);
  xpc_dictionary_send_reply();
LABEL_15:
}

void sub_1000060E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000061DC;
    handler[3] = &unk_1000083D8;
    id v4 = v3;
    id v7 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, **(dispatch_queue_t **)(a1 + 32));
    int v5 = strdup((const char *)(*(void *)(a1 + 32) + 104));
    xpc_connection_set_context((xpc_connection_t)v4, v5);
    xpc_connection_set_finalizer_f((xpc_connection_t)v4, (xpc_finalizer_t)&_free);
    xpc_connection_activate((xpc_connection_t)v4);
  }
}

void sub_1000061DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "request_type");
    if (uint64 != 7)
    {
      if (uint64 == 4)
      {
        id v10 = v3;
        string = xpc_dictionary_get_string(v10, "ds_name");
        __int16 v12 = qword_10000C028;
        if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
        {
          int v16 = 136315138;
          xpc_object_t v17 = string;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%s] Invalidating data", (uint8_t *)&v16, 0xCu);
        }
        xpc_object_t reply = xpc_dictionary_create_reply(v10);

        uint64_t v14 = sub_100004800();
        if (v14)
        {
          sub_100004AE0(v14);
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v15 = 22;
        }
        xpc_dictionary_set_uint64(reply, "ds_status", v15);
        xpc_dictionary_send_reply();
      }
      else if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR))
      {
        sub_1000068C0();
      }
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    context = (const char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
    uint64_t v6 = qword_10000C028;
    if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315138;
      xpc_object_t v17 = context;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%s] Publisher gone - relinquishing datastore", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v7 = sub_100004800();
    if (v7)
    {
      if ((*(unsigned char *)(v7 + 64) & 1) == 0) {
        sub_10000655C();
      }
      *(unsigned char *)(v7 + 64) &= ~1u;
      int v8 = qword_10000C028;
      if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_INFO))
      {
        int v16 = 136315138;
        xpc_object_t v17 = context;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%s] Clearing ownership of datastore", (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10000C028, OS_LOG_TYPE_ERROR))
    {
      sub_100006F60();
    }
  }
}

uint64_t sub_100006448(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 32));
  sub_100004CDC(*(void *)(a1 + 48));
  sub_100004BA4(*(void **)(a1 + 32), *(void **)(a1 + 48));
  xpc_array_append_value(*(xpc_object_t *)(*(void *)(a1 + 48) + 56), *(xpc_object_t *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 32));

  return xpc_dictionary_send_reply();
}

uint64_t sub_1000064B4(uint64_t a1)
{
  uint64_t value = xpc_pointer_get_value();
  if (!value) {
    return 1;
  }
  uint64_t v3 = value;
  if (*(void *)(value + 72) != *(void *)(a1 + 40)) {
    return 1;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  return result;
}

void sub_10000650C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006534(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000655C()
{
}

void sub_100006578(uint64_t a1, void *a2)
{
  uint64_t v2 = a1 + 104;
  uint64_t v3 = *(void **)(a1 + 56);
  id v4 = a2;
  int v5 = 136315394;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  size_t count = xpc_array_get_count(v3);
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%s] Notifying %zu subscribers of data invalidation", (uint8_t *)&v5, 0x16u);
}

void sub_10000662C()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] No such datastore present", v2, v3, v4, v5, v6);
}

void sub_100006694()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Client does not have valid entitlement to query datastore", v2, v3, v4, v5, v6);
}

void sub_1000066FC()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Rejected registration - datastore not statically declared", v2, v3, v4, v5, v6);
}

void sub_100006764()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Rejecting registration since datastore has already been claimed", v2, v3, v4, v5, v6);
}

void sub_1000067CC()
{
  sub_100006528();
  __int16 v2 = 2080;
  uint64_t v3 = "com.apple.xpc.datastore.publisher";
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[%s] Rejected registration - publisher doesn't have %s entitlement", v1, 0x16u);
}

void sub_100006854()
{
  sub_100006550();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Received no data from producer", v2, v3, v4, v5, v6);
}

void sub_1000068C0()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "Unknown request %llu, ignoring", v2, v3, v4, v5, v6);
}

void sub_100006928()
{
  sub_100006550();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "\tdata_size     = %zu\n", v2, v3, v4, v5, v6);
}

void sub_100006994(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v3 = a2;
  xpc_array_get_count(v2);
  sub_100006528();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "\t#subscribers  = %zu", v4, 0xCu);
}

void sub_100006A2C()
{
  sub_100006550();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "\tentitlement   = %s", v2, v3, v4, v5, v6);
}

void sub_100006A98()
{
  sub_100006550();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "\tmax_size      = %llu", v2, v3, v4, v5, v6);
}

void sub_100006B04()
{
  sub_100006550();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "\tds_type       = %s", v2, v3, v4, v5, v6);
}

void sub_100006B88()
{
  sub_100006550();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "\tchecked in    = %s", v2, v3, v4, v5, v6);
}

void sub_100006C0C()
{
  sub_100006550();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "datastore: %s", v2, v3, v4, v5, v6);
}

void sub_100006C78()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Datastore is being registered for twice - dropping both on the ground", v2, v3, v4, v5, v6);
}

void sub_100006CE0()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "Failed for find datastore name for event token %#llx", v2, v3, v4, v5, v6);
}

void sub_100006D48(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "???";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[%s] Could not find a datastore tracking the specified token = %#llx", (uint8_t *)&v2, 0x16u);
}

void sub_100006DD4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "datastored received error %d\n", (uint8_t *)v2, 8u);
}

void sub_100006E4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received unknown datastore request type on subscriber connection", v1, 2u);
}

void sub_100006E90()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Datastore not present - returning EINVAL", v2, v3, v4, v5, v6);
}

void sub_100006EF8()
{
  sub_100006528();
  sub_100006534((void *)&_mh_execute_header, v0, v1, "[%s] Datastore not populated, handing off to slow queue", v2, v3, v4, v5, v6);
}

void sub_100006F60()
{
  sub_100006528();
  sub_10000650C((void *)&_mh_execute_header, v0, v1, "[%s] Could not find datastore", v2, v3, v4, v5, v6);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void free(void *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
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

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return _xpc_connection_get_context(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

uint64_t xpc_dictionary_get_pointer()
{
  return _xpc_dictionary_get_pointer();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return _xpc_dictionary_handoff_reply();
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

uint64_t xpc_dictionary_set_pointer()
{
  return _xpc_dictionary_set_pointer();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire_with_reply_sync()
{
  return _xpc_event_publisher_fire_with_reply_sync();
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

uint64_t xpc_mach_send_copy_right()
{
  return _xpc_mach_send_copy_right();
}

uint64_t xpc_pipe_create_from_port()
{
  return _xpc_pipe_create_from_port();
}

uint64_t xpc_pipe_simpleroutine()
{
  return _xpc_pipe_simpleroutine();
}

uint64_t xpc_pointer_get_value()
{
  return _xpc_pointer_get_value();
}

uint64_t xpc_shmem_create_readonly()
{
  return _xpc_shmem_create_readonly();
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return _xpc_shmem_map(xshmem, region);
}