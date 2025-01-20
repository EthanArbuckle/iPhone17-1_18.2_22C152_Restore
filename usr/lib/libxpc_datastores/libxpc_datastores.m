id _xpc_datastores_service_connection()
{
  void *v0;
  uint64_t vars8;

  if (qword_2684E2910 != -1) {
    dispatch_once(&qword_2684E2910, &unk_26E0313A8);
  }
  v0 = (void *)qword_2684E2918;

  return v0;
}

void sub_22CB85BFC()
{
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.xpc.datastore", 0, 0);
  v1 = (void *)qword_2684E2918;
  qword_2684E2918 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_2684E2918, &unk_26E0313C8);
  v2 = (_xpc_connection_s *)qword_2684E2918;

  xpc_connection_activate(v2);
}

void sub_22CB85C60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x230F73C20](a2);
  if (a2 == MEMORY[0x263EF86A8] && v3 == MEMORY[0x263EF8720])
  {
    v5 = (void *)qword_2684E2918;
    qword_2684E2918 = 0;
  }
}

id _xdo_fetch_ds_data_req_serialize(const char *a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (a3 == 1) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  xpc_dictionary_set_uint64(v5, "request_type", v7);
  xpc_dictionary_set_string(v6, "ds_name", a1);
  v8 = (void *)xpc_mach_send_create();
  xpc_dictionary_set_value(v6, "ds_data_invalid_notify", v8);

  return v6;
}

uint64_t _xdo_fetch_ds_data_resp_deserialize(void *a1, void *a2)
{
  id v3 = a1;
  v4 = a2;
  if (!v4) {
    sub_22CB872D0();
  }
  if (!v3) {
    sub_22CB872D0();
  }
  xpc_object_t v5 = v4;
  if (MEMORY[0x230F73C20](v3) == MEMORY[0x263EF8720])
  {
    uint64_t uint64 = 96;
    goto LABEL_9;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "ds_status");
  if (uint64)
  {
LABEL_9:
    v12 = v5;
    os_unfair_lock_lock_with_options();
    v13 = *(void **)&v12[10]._os_unfair_lock_opaque;
    *(void *)&v12[10]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v5 + 8);
    goto LABEL_12;
  }
  uint64_t v7 = *(void *)&v5[2]._os_unfair_lock_opaque;
  if (v7 != xpc_dictionary_get_uint64(v3, "ds_type")) {
    sub_22CB872D0();
  }
  v8 = objc_alloc_init(OS_xds_local_cache);
  v9 = v8;
  if (v7 == 1)
  {
    v8->ds_type = 1;
    size_t length = 0;
    data = xpc_dictionary_get_data(v3, "ds_data", &length);
    v11 = malloc_type_malloc(length, 0x6938E89FuLL);
    v9->data = v11;
    memcpy(v11, data, length);
    v9->size = length;
  }
  else
  {
    v8->ds_type = 2;
    v14 = xpc_dictionary_get_value(v3, "ds_ool_data");
    size_t length = 0;
    size_t v15 = xpc_shmem_map(v14, (void **)&length);
    v9->data = (void *)length;
    v9->size = v15;
  }
  v16 = v5;
  v17 = v9;
  os_unfair_lock_lock_with_options();
  v18 = *(void **)&v16[10]._os_unfair_lock_opaque;
  *(void *)&v16[10]._os_unfair_lock_opaque = v17;

  os_unfair_lock_unlock(v5 + 8);
  uint64_t uint64 = 0;
LABEL_12:

  return uint64;
}

uint64_t xpc_datastore_copy_state(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](a1, sel_copyCurrentStateWithReqType_, a2);
}

id _xpc_datastore_publisher_alloc(uint64_t a1)
{
  v2 = [OS_xpc_datastore_publisher alloc];
  v4 = [v2 initWithName:v3 a1];

  return v4;
}

id _xpc_datastore_publisher_create_suspended(const char *a1)
{
  v11 = 0;
  if (asprintf(&v11, "%s.pending_work_dq", a1) < 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v2 = v11;
    id v3 = dispatch_queue_attr_make_initially_inactive(0);
    dispatch_queue_t v4 = dispatch_queue_create(v2, v3);

    xpc_object_t v5 = [OS_xpc_datastore_publisher alloc];
    uint64_t v7 = [v5 initWithName:v6];
    objc_storeStrong((id *)(v7 + 64), v4);
    v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = v4;
    v9 = v4;

    free(v11);
  }

  return (id)v7;
}

uint64_t _xpc_datastore_publisher_resume(void *a1)
{
  id v1 = a1;
  char v2 = *((unsigned char *)v1 + 80);
  if (v2) {
    sub_22CB872D0();
  }
  id v3 = (dispatch_queue_t *)v1;
  dispatch_queue_t v4 = *((void *)v1 + 7);
  if (v4)
  {
    v6 = v3;
    dispatch_set_target_queue(v4, v3[8]);
    dispatch_activate(v6[7]);
    id v3 = v6;
    char v2 = *((unsigned char *)v6 + 80);
  }
  *((unsigned char *)v3 + 80) = v2 | 1;

  return MEMORY[0x270F9A758]();
}

void _xdp_set_ds_data_req_serialize(void *a1, void *a2)
{
  xpc_object_t xdict = a1;
  id v3 = a2;
  xpc_dictionary_set_uint64(xdict, "request_type", 5uLL);
  xpc_dictionary_set_string(xdict, "ds_name", v3[3]);
  dispatch_queue_t v4 = (os_unfair_lock_s *)(v3 + 4);
  xpc_object_t v5 = v3;
  os_unfair_lock_lock_with_options();
  v6 = (id)v5[5];
  os_unfair_lock_unlock(v4);

  if (v5[1] == (const char *)1)
  {
    xpc_dictionary_set_data(xdict, "ds_data", *((const void **)v6 + 2), *((void *)v6 + 3));
  }
  else
  {
    readonly = (void *)xpc_shmem_create_readonly();

    xpc_dictionary_set_value(xdict, "ds_ool_data", readonly);
    v6 = (char *)readonly;
  }
}

id _xdp_register_ds_req_serialize(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "request_type", 6uLL);
  xpc_dictionary_set_string(v2, "ds_name", a1);

  return v2;
}

void _xdp_register_ds_resp_deserialize(void *a1, void *a2)
{
  id v3 = a1;
  dispatch_queue_t v4 = a2;
  v4[1] = xpc_dictionary_get_uint64(v3, "ds_type");
  v4[2] = xpc_dictionary_get_uint64(v3, "max_size");
  xpc_dictionary_get_value(v3, "endpoint");
  xpc_object_t v5 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x230F73C20]() != MEMORY[0x263EF8718]) {
    sub_22CB872D0();
  }
  xpc_connection_t v6 = xpc_connection_create_from_endpoint(v5);
  if (!v6) {
    sub_22CB872D0();
  }
  uint64_t v7 = v6;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_22CB864E8;
  handler[3] = &unk_264931C60;
  v8 = v4;
  id v15 = v8;
  xpc_connection_set_event_handler(v7, handler);
  v9 = (void *)v8[6];
  v8[6] = v7;
  v10 = v7;

  xpc_connection_activate(v10);
  v11 = v8;
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "request_type", 7uLL);
  v13 = (_xpc_connection_s *)v8[6];

  xpc_connection_send_message(v13, v12);
}

void sub_22CB864E8(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = MEMORY[0x230F73C20]();
  uint64_t v4 = MEMORY[0x263EF8720];
  if (v3 != MEMORY[0x263EF8720]) {
    sub_22CB87308();
  }
  xpc_object_t v5 = v10;
  if (v10 == (id)MEMORY[0x263EF86A0])
  {
    uint64_t v6 = _xpc_datastores_service_connection();
    if (!v6) {
      sub_22CB872D0();
    }
    uint64_t v7 = (_xpc_connection_s *)v6;
    v8 = _xdp_register_ds_req_serialize(*(const char **)(*(void *)(a1 + 32) + 24));
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v7, v8);
    if (MEMORY[0x230F73C20]() != v4) {
      _xdp_register_ds_resp_deserialize(v9, *(void *)(a1 + 32));
    }

    xpc_object_t v5 = v10;
  }
}

uint64_t xpc_datastore_publisher_create(const char *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (qword_2684E2930 != -1) {
    dispatch_once(&qword_2684E2930, &unk_26E0313E8);
  }
  v8 = (void *)xpc_copy_event();

  if (v8)
  {
    if (!v6)
    {
      dispatch_get_global_queue(0, 0);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    xpc_object_t v9 = _xpc_datastores_service_connection();
    if (!v9)
    {
      uint64_t v13 = 0;
      *__error() = 45;
LABEL_18:

      goto LABEL_19;
    }
    id v10 = _xdp_register_ds_req_serialize(a1);
    xpc_object_t v11 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v9, v10);
    if (MEMORY[0x230F73C20]() == MEMORY[0x263EF8720])
    {
      int v12 = 54;
    }
    else
    {
      if (!xpc_dictionary_get_uint64(v11, "ds_status"))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&dword_2684E2920);
        uint64_t v13 = xpc_dictionary_get_pointer();
        if (!v13)
        {
          v14 = [OS_xpc_datastore_publisher alloc];
          uint64_t v13 = [v14 initWithName:v15];
        }
        uint64_t v16 = MEMORY[0x230F739D0](v7);
        v17 = *(void **)(v13 + 72);
        *(void *)(v13 + 72) = v16;

        objc_storeStrong((id *)(v13 + 64), v6);
        _xdp_register_ds_resp_deserialize(v11, (void *)v13);
        xpc_dictionary_set_pointer();
        _xpc_datastore_publisher_resume((void *)v13);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_2684E2920);
        goto LABEL_17;
      }
      int v12 = 1;
    }
    uint64_t v13 = 0;
    *__error() = v12;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v13 = 0;
  *__error() = 22;
LABEL_19:

  return v13;
}

void xpc_datastore_publisher_invalidate_state(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock_with_options();
  xpc_object_t v2 = (void *)*((void *)v1 + 5);
  *((void *)v1 + 5) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)v1 + 8);
  id v7 = v1;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "request_type", 4uLL);
  uint64_t v4 = (const char *)*((void *)v7 + 3);

  xpc_dictionary_set_string(v3, "ds_name", v4);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(*((xpc_connection_t *)v7 + 6), v3);
  id v6 = v5;
  if (v5 != (xpc_object_t)MEMORY[0x263EF86A0] && xpc_dictionary_get_uint64(v5, "ds_status")) {
    sub_22CB872D0();
  }
}

uint64_t _xpc_datastore_subscriber_refresh(void *a1, uint64_t a2)
{
  id v3 = a1;
  os_unfair_lock_lock_with_options();
  id v4 = *((id *)v3 + 5);
  os_unfair_lock_unlock((os_unfair_lock_t)v3 + 8);
  if (v4 && (BOOL v5 = _xpc_datastore_subscriber_invalidated(v3), v4, !v5))
  {
    uint64_t ds_data_resp_deserialize = 0;
  }
  else
  {
    id v6 = (ipc_space_t *)MEMORY[0x263EF8960];
    if (mach_port_insert_right(*MEMORY[0x263EF8960], *((_DWORD *)v3 + 14), *((_DWORD *)v3 + 14), 0x14u)) {
      _os_assumes_log();
    }
    mach_port_name_t v7 = *((_DWORD *)v3 + 14);
    v8 = _xdo_fetch_ds_data_req_serialize(*((const char **)v3 + 3), v7, a2);
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(*((xpc_connection_t *)v3 + 6), v8);
    uint64_t ds_data_resp_deserialize = _xdo_fetch_ds_data_resp_deserialize(v9, v3);
    mach_port_deallocate(*v6, v7);
  }
  return ds_data_resp_deserialize;
}

id _xpc_datastore_subscriber_alloc(uint64_t a1)
{
  xpc_object_t v2 = [OS_xpc_datastore_subscriber alloc];
  id v4 = [v2 initWithName:v3 a1];

  return v4;
}

id _xds_fetch_ds_info_req_serialize(const char *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "request_type", 1uLL);
  xpc_dictionary_set_string(v2, "ds_name", a1);

  return v2;
}

uint64_t _xds_fetch_ds_info_resp_deserialize(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3) {
    sub_22CB872D0();
  }
  BOOL v5 = v4;
  if (!v4) {
    sub_22CB872D0();
  }
  if (MEMORY[0x230F73C20](v3) == MEMORY[0x263EF8720])
  {
    uint64_t v6 = 96;
  }
  else if (xpc_dictionary_get_uint64(v3, "ds_status"))
  {
    uint64_t v6 = 1;
  }
  else
  {
    v5[1] = xpc_dictionary_get_uint64(v3, "ds_type");
    xpc_dictionary_get_value(v3, "endpoint");
    mach_port_name_t v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x230F73C20]() != MEMORY[0x263EF8718]) {
      sub_22CB872D0();
    }
    xpc_connection_t v8 = xpc_connection_create_from_endpoint(v7);
    if (!v8) {
      sub_22CB872D0();
    }
    xpc_object_t v9 = v8;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = sub_22CB86D04;
    handler[3] = &unk_264931C60;
    id v10 = v5;
    id v15 = v10;
    xpc_connection_set_event_handler(v9, handler);
    xpc_object_t v11 = (void *)v10[6];
    v10[6] = v9;
    int v12 = v9;

    xpc_connection_activate(v12);
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_22CB86D04(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (MEMORY[0x230F73C20]() != MEMORY[0x263EF8720]) {
    sub_22CB87308();
  }
  id v3 = v12;
  if (v12 == (id)MEMORY[0x263EF86A0])
  {
    xpc_connection_t v8 = *(os_unfair_lock_s **)(a1 + 32);
    xpc_object_t v9 = v8 + 8;
    id v10 = v8;
    os_unfair_lock_lock_with_options();
    xpc_object_t v11 = *(void **)&v10[10]._os_unfair_lock_opaque;
    *(void *)&v10[10]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v9);
    _xpc_datastore_subscriber_initial_handshake(*(void *)(a1 + 32));
  }
  else
  {
    if (v12 != (id)MEMORY[0x263EF86A8]) {
      goto LABEL_7;
    }
    id v4 = *(os_unfair_lock_s **)(a1 + 32);
    BOOL v5 = v4 + 8;
    uint64_t v6 = v4;
    os_unfair_lock_lock_with_options();
    mach_port_name_t v7 = *(void **)&v6[10]._os_unfair_lock_opaque;
    *(void *)&v6[10]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v5);
  }
  id v3 = v12;
LABEL_7:
}

uint64_t _xpc_datastore_subscriber_initial_handshake(void *a1)
{
  id v1 = a1;
  _xpc_datastores_service_connection();
  xpc_object_t v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = _xds_fetch_ds_info_req_serialize(v1[3]);
    xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
    uint64_t ds_info_resp_deserialize = _xds_fetch_ds_info_resp_deserialize(v4, v1);
    if (ds_info_resp_deserialize) {
      *__error() = ds_info_resp_deserialize;
    }
  }
  else
  {
    uint64_t ds_info_resp_deserialize = 45;
  }

  return ds_info_resp_deserialize;
}

BOOL _xpc_datastore_subscriber_invalidated(void *a1)
{
  id v1 = a1;
  int v2 = xpc_pipe_receive();
  if (v2 == 35)
  {
    BOOL v3 = 0;
  }
  else
  {
    if (v2) {
      sub_22CB87324();
    }
    BOOL v3 = xpc_dictionary_get_BOOL(0, "ds_data_invalid");
  }

  return v3;
}

mach_port_name_t *xpc_datastore_subscriber_create(uint64_t a1)
{
  int v2 = [OS_xpc_datastore_subscriber alloc];
  xpc_object_t v4 = (mach_port_name_t *)[v2 initWithName:v3];
  int v5 = _xpc_datastore_subscriber_initial_handshake(v4);
  if (v5)
  {
    uint64_t v6 = 0;
    *__error() = v5;
  }
  else
  {
    if (mach_port_allocate(*MEMORY[0x263EF8960], 1u, v4 + 14)) {
      sub_22CB872D0();
    }
    uint64_t v6 = v4;
  }

  return v6;
}

void sub_22CB86FB0()
{
  dword_2684E2920 = 0;
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  id v1 = (void *)qword_2684E2928;
  qword_2684E2928 = (uint64_t)v0;

  xpc_set_event_stream_handler("com.apple.xpc.datastores.publish", 0, &unk_26E031408);
}

void sub_22CB87018(uint64_t a1, void *a2)
{
  id v2 = a2;
  string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86C8]);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_2684E2920);
  xpc_object_t v4 = xpc_dictionary_get_pointer();
  if (!v4)
  {
    xpc_object_t v4 = _xpc_datastore_publisher_create_suspended(string);
    xpc_dictionary_set_pointer();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_2684E2920);
  int v5 = v4[8];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_22CB87140;
  v8[3] = &unk_264931C88;
  id v9 = v4;
  id v10 = v2;
  id v6 = v2;
  mach_port_name_t v7 = v4;
  dispatch_async_and_wait(v5, v8);
}

void sub_22CB87140(uint64_t a1)
{
  id v2 = (void *)(*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
  BOOL v3 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  id v4 = v2;
  if (v4)
  {
    uint64_t serialization = xpc_make_serialization();
    if (!serialization) {
      sub_22CB87340();
    }
    id v6 = (void *)serialization;
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = *(void *)&v3[2]._os_unfair_lock_opaque;
  xpc_connection_t v8 = objc_alloc_init(OS_xds_local_cache);
  id v9 = v8;
  if (v7 == 1)
  {
    v8->ds_type = 1;
    v8->data = v6;
    v8->size = 0;
  }
  else
  {
    v8->ds_type = 2;
    id v10 = mmap(0, 0, 3, 4097, -1, 0);
    mprotect(v10, 0, 1);
    v9->data = v10;
    v9->size = 0;
    free(v6);
  }
  xpc_object_t v11 = v3 + 8;
  id v12 = v9;
  uint64_t v13 = v3;
  os_unfair_lock_lock_with_options();
  v14 = *(void **)&v13[10]._os_unfair_lock_opaque;
  *(void *)&v13[10]._os_unfair_lock_opaque = v12;

  os_unfair_lock_unlock(v11);
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  _xdp_set_ds_data_req_serialize(reply, *(void **)(a1 + 32));
  xpc_dictionary_send_reply();
}

void sub_22CB872D0()
{
}

void sub_22CB872EC()
{
}

void sub_22CB87308()
{
}

void sub_22CB87324()
{
}

void sub_22CB87340()
{
}

void sub_22CB8735C()
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x270ED8058]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void free(void *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x270EDA1D8](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5C0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x270EDBF60]();
}

uint64_t xpc_create_from_serialization()
{
  return MEMORY[0x270EDBF78]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

uint64_t xpc_dictionary_get_pointer()
{
  return MEMORY[0x270EDC090]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

uint64_t xpc_dictionary_set_pointer()
{
  return MEMORY[0x270EDC138]();
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

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}

uint64_t xpc_make_serialization()
{
  return MEMORY[0x270EDC288]();
}

uint64_t xpc_pipe_receive()
{
  return MEMORY[0x270EDC2A0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_shmem_create_readonly()
{
  return MEMORY[0x270EDC3B8]();
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x270EDC3C0](xshmem, region);
}