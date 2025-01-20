void _bsd_log_spd(uint64_t a1, char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  if (_bsd_log_spd_once != -1) {
    dispatch_once(&_bsd_log_spd_once, &__block_literal_global);
  }
  if (_bsd_log_spd_alt_logger) {
    _bsd_log_spd_alt_logger(a1, a2, va);
  }
  else {
    vsyslog(a1, a2, va);
  }
}

void *___bsd_log_spd_block_invoke()
{
  result = dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_bsd_alt_log");
  _bsd_log_spd_alt_logger = (uint64_t (*)(void, void, void))result;
  return result;
}

uint64_t _spd_os_log()
{
  if (_spd_os_log_onceToken != -1) {
    dispatch_once(&_spd_os_log_onceToken, &__block_literal_global_4);
  }
  return _spd_os_log_gOSLog;
}

os_log_t ___spd_os_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.network.spd", (const char *)&unk_21E6159ED);
  _spd_os_log_gOSLog = (uint64_t)result;
  return result;
}

uint64_t spd_client_session_queue()
{
  if (spd_client_session_queue_once != -1) {
    dispatch_once(&spd_client_session_queue_once, &__block_literal_global_0);
  }
  return spd_client_session_queue_queue;
}

dispatch_queue_t __spd_client_session_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.libspd.client-sessions", 0);
  spd_client_session_queue_queue = (uint64_t)result;
  return result;
}

uint64_t spd_register_for_notifications(void *a1)
{
  if (!a1) {
    return 4;
  }
  if (_spd_helper_send_async(10, 0, 0xFFFFFFFF))
  {
    v2 = _spd_os_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      spd_register_for_notifications_cold_1();
    }
  }
  uint64_t v3 = _s_spd_notification_client_sessions;
  *a1 = _s_spd_notification_client_sessions;
  if (v3) {
    *(void *)(v3 + 8) = a1;
  }
  uint64_t result = 0;
  _s_spd_notification_client_sessions = (uint64_t)a1;
  a1[1] = &_s_spd_notification_client_sessions;
  return result;
}

uint64_t _spd_helper_send_async(int64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2000000000;
  int v24 = 0;
  message = _spd_helper_create_message(a1, -1, a2, a3);
  if (message)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    v13 = ___spd_helper_send_async_block_invoke;
    v14 = &unk_2644B5170;
    int64_t v17 = a1;
    v18 = a2;
    int v19 = -1;
    unsigned int v20 = a3;
    v15 = &v21;
    v16 = message;
    pthread_mutex_lock(&_spd_connection_mutex);
    _spd_xpc_init_locked();
    if (_spd_connection)
    {
      pthread_mutex_unlock(&_spd_connection_mutex);
      v7 = _spd_os_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E613000, v7, OS_LOG_TYPE_INFO, "Executing when_connected block immediately.", buf, 2u);
      }
      v13((uint64_t)aBlock);
    }
    else
    {
      v8 = _spd_os_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E613000, v8, OS_LOG_TYPE_INFO, "Enqueuing when_connected block.", buf, 2u);
      }
      v9 = (const void *)_spd_pending;
      if (_spd_pending)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v26 = 0x40000000;
        v27 = ___spd_when_connected_block_invoke;
        v28 = &unk_2644B5198;
        uint64_t v29 = _spd_pending;
        v30 = aBlock;
        _spd_pending = (uint64_t)_Block_copy(buf);
        _Block_release(v9);
      }
      else
      {
        _spd_pending = (uint64_t)_Block_copy(aBlock);
      }
      pthread_mutex_unlock(&_spd_connection_mutex);
    }
  }
  uint64_t v10 = *((unsigned int *)v22 + 6);
  _Block_object_dispose(&v21, 8);
  return v10;
}

uint64_t spd_deregister_for_notifications(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1) {
      *(void *)(v2 + 8) = a1[1];
    }
    *(void *)a1[1] = v2;
    uint64_t v3 = (const void *)a1[3];
    if (v3) {
      _Block_release(v3);
    }
    v4 = (const void *)a1[4];
    if (v4) {
      _Block_release(v4);
    }
    free(a1);
    uint64_t v5 = _spd_helper_send_async(11, 0, 0xFFFFFFFF);
    if (v5)
    {
      v6 = _spd_os_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        spd_deregister_for_notifications_cold_2();
      }
    }
  }
  else
  {
    v7 = _spd_os_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      spd_deregister_for_notifications_cold_1();
    }
    return 4;
  }
  return v5;
}

uint64_t spd_checkin_socket(int a1, unsigned __int8 *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (dyld_program_sdk_at_least()) {
    spd_checkin_socket_cold_1();
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  sockaddr v31 = (sockaddr)0;
  long long v32 = 0u;
  LODWORD(v28.tv_sec) = 128;
  if (getsockname(a1, &v31, (socklen_t *)&v28)) {
    return 5;
  }
  LODWORD(v28.tv_sec) = 128;
  if (getpeername(a1, &v31, (socklen_t *)&v28)) {
    return 5;
  }
  message = _spd_helper_create_message(40, a1, 0, 0xFFFFFFFF);
  if (!message) {
    return 5;
  }
  v7 = message;
  uint64_t v8 = MEMORY[0x223C2C7C0]();
  uint64_t v9 = MEMORY[0x263EF8708];
  if (v8 == MEMORY[0x263EF8708])
  {
    uint64_t v23 = a2;
    int v11 = 0;
    char v12 = 1;
LABEL_10:
    char v13 = v12;
    pthread_mutex_lock(&_spd_connection_mutex);
    while (1)
    {
      v14 = (_xpc_connection_s *)_spd_connection;
      if (_spd_connection) {
        break;
      }
      if ((_spd_xpc_init_locked() & 1) == 0)
      {
        int v19 = _spd_os_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          spd_checkin_socket_cold_4(&v29, v30);
        }
LABEL_22:
        pthread_mutex_unlock(&_spd_connection_mutex);
        unsigned int v20 = _spd_os_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          spd_checkin_socket_cold_2(&v24, v25);
        }
LABEL_24:
        char v12 = 0;
        int v11 = 1;
        if (v13) {
          goto LABEL_10;
        }
        goto LABEL_29;
      }
      *(void *)&v31.sa_len = 0;
      *(void *)&v31.sa_data[6] = 0;
      v28.tv_sec = 0;
      v28.tv_nsec = 0;
      gettimeofday((timeval *)&v31, 0);
      v28.tv_sec = *(void *)&v31.sa_len + 2;
      v28.tv_nsec = 0;
      if (pthread_cond_timedwait(&_spd_connection_cond, &_spd_connection_mutex, &v28) == 60)
      {
        v15 = _spd_os_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          spd_checkin_socket_cold_3(&v26, v27);
        }
        goto LABEL_22;
      }
    }
    xpc_retain((xpc_object_t)_spd_connection);
    pthread_mutex_unlock(&_spd_connection_mutex);
    xpc_object_t v16 = xpc_connection_send_message_with_reply_sync(v14, v7);
    if (MEMORY[0x223C2C7C0]() != v9)
    {
      uint64_t v17 = v9;
      v18 = _spd_os_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)&v31.sa_len = 67109120;
        *(_DWORD *)&v31.sa_data[2] = v11;
        _os_log_error_impl(&dword_21E613000, v18, OS_LOG_TYPE_ERROR, "Attempt #%d: got error when sending message!", &v31.sa_len, 8u);
      }
      xpc_release(v16);
      xpc_release(v14);
      uint64_t v9 = v17;
      goto LABEL_24;
    }
    xpc_release(v14);
    if (!v16)
    {
LABEL_29:
      xpc_object_t v10 = 0;
      int64_t int64 = 5;
      a2 = v23;
      goto LABEL_32;
    }
    a2 = v23;
    if (xpc_dictionary_get_value(v16, "result")) {
      int64_t int64 = xpc_dictionary_get_int64(v16, "result");
    }
    else {
      int64_t int64 = 5;
    }
    xpc_object_t v10 = xpc_retain(v16);
    xpc_release(v16);
  }
  else
  {
    xpc_object_t v10 = 0;
    int64_t int64 = 5;
  }
LABEL_32:
  xpc_release(v7);
  if (int64 || !v10)
  {
    if (!v10) {
      return int64;
    }
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(v10, "uuid");
    if (uuid && (v22 = uuid, !uuid_is_null(uuid)))
    {
      uuid_copy(a2, v22);
      int64_t int64 = 0;
    }
    else
    {
      int64_t int64 = 5;
    }
  }
  xpc_release(v10);
  return int64;
}

uint64_t spd_checkout_socket(const unsigned __int8 *a1)
{
  return _spd_helper_send_async(41, a1, 0xFFFFFFFF);
}

uint64_t spd_checkout_all_sockets()
{
  return _spd_helper_send_async(42, 0, 0xFFFFFFFF);
}

uint64_t spd_start_monitoring_socket(const unsigned __int8 *a1)
{
  return _spd_helper_send_async(30, a1, 0xFFFFFFFF);
}

uint64_t spd_stop_monitoring_socket(const unsigned __int8 *a1)
{
  return _spd_helper_send_async(31, a1, 0xFFFFFFFF);
}

uint64_t spd_start_monitoring_all_sockets()
{
  pid_t v0 = getpid();

  return _spd_helper_send_async(20, 0, v0);
}

uint64_t spd_start_monitoring_all_sockets_for_pid(unsigned int a1)
{
  return _spd_helper_send_async(20, 0, a1);
}

uint64_t spd_stop_monitoring_all_sockets()
{
  pid_t v0 = getpid();

  return _spd_helper_send_async(21, 0, v0);
}

uint64_t spd_stop_monitoring_all_sockets_for_pid(unsigned int a1)
{
  return _spd_helper_send_async(21, 0, a1);
}

void *_spd_helper_create_message(int64_t a1, int a2, const unsigned __int8 *a3, unsigned int a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  uint64_t v9 = v8;
  if (v8)
  {
    xpc_dictionary_set_int64(v8, "msg_type", a1);
    char v10 = dyld_program_sdk_at_least();
    xpc_dictionary_set_BOOL(v9, "legacy", v10 != 1);
    char v11 = dyld_program_sdk_at_least();
    xpc_dictionary_set_BOOL(v9, "modern", v11);
    if (a2 != -1) {
      xpc_dictionary_set_fd(v9, "socket", a2);
    }
    if (a3) {
      xpc_dictionary_set_uuid(v9, "uuid", a3);
    }
    if ((a4 & 0x80000000) == 0) {
      xpc_dictionary_set_int64(v9, "pid", a4);
    }
  }
  return v9;
}

void ___spd_helper_send_async_block_invoke(uint64_t a1)
{
  if (_spd_connection)
  {
    xpc_connection_send_message((xpc_connection_t)_spd_connection, *(xpc_object_t *)(a1 + 40));
    uint64_t v2 = _spd_os_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      ___spd_helper_send_async_block_invoke_cold_2(a1, v2);
    }
    int v3 = 0;
  }
  else
  {
    v4 = _spd_os_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___spd_helper_send_async_block_invoke_cold_1();
    }
    int v3 = 5;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
  xpc_release(v5);
}

uint64_t _spd_xpc_init_locked()
{
  if (_spd_xpc_init_locked_once != -1) {
    dispatch_once(&_spd_xpc_init_locked_once, &__block_literal_global_7);
  }
  uint64_t v0 = 1;
  if ((_spd_connection_in_progress & 1) == 0 && !_spd_connection)
  {
    _spd_connection_in_progress = 1;
    xpc_object_t v1 = xpc_dictionary_create(0, 0, 0);
    if (v1)
    {
      uint64_t v2 = v1;
      uint64_t v0 = 1;
      xpc_dictionary_set_int64(v1, "msg_type", 1);
      pid_t v3 = getpid();
      xpc_dictionary_set_int64(v2, "pid", v3);
      xpc_set_event();
      xpc_release(v2);
    }
    else
    {
      return 0;
    }
  }
  return v0;
}

uint64_t ___spd_when_connected_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void ___spd_xpc_init_locked_block_invoke()
{
  uint64_t v0 = _spd_os_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    ___spd_xpc_init_locked_block_invoke_cold_1();
  }
  if (_spd_helper_queue_once != -1) {
    dispatch_once(&_spd_helper_queue_once, &__block_literal_global_10);
  }
  xpc_set_event_stream_handler("com.apple.spd.matching", (dispatch_queue_t)_spd_helper_queue_queue, &__block_literal_global_15);
}

dispatch_queue_t ___spd_helper_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.libspd.internal-queue", 0);
  _spd_helper_queue_queue = (uint64_t)result;
  return result;
}

void spd_xpc_event_stream_handler_block_invoke(uint64_t a1, void *a2)
{
  pid_t v3 = _spd_os_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    spd_xpc_event_stream_handler_block_invoke_cold_2();
  }
  connection = xpc_dictionary_create_connection(a2, "connection");
  if (connection)
  {
    uint64_t v5 = connection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = spd_xpc_event_stream_handler_block_invoke_2;
    handler[3] = &__block_descriptor_tmp_18;
    handler[4] = connection;
    xpc_connection_set_event_handler(connection, handler);
    if (_spd_helper_queue_once != -1) {
      dispatch_once(&_spd_helper_queue_once, &__block_literal_global_10);
    }
    xpc_connection_set_target_queue(v5, (dispatch_queue_t)_spd_helper_queue_queue);
    pthread_mutex_lock(&_spd_connection_mutex);
    if (_spd_connection) {
      _spd_xpc_cleanup_locked();
    }
    _spd_connection_in_progress = 0;
    _spd_connection = (uint64_t)v5;
    xpc_connection_resume(v5);
    v6 = (void (**)(void))_spd_pending;
    _spd_pending = 0;
    pthread_cond_broadcast(&_spd_connection_cond);
    pthread_mutex_unlock(&_spd_connection_mutex);
    if (v6)
    {
      v7 = _spd_os_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_21E613000, v7, OS_LOG_TYPE_INFO, "Executing pending block(s).", v9, 2u);
      }
      v6[2](v6);
      _Block_release(v6);
    }
  }
  else
  {
    xpc_object_t v8 = _spd_os_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      spd_xpc_event_stream_handler_block_invoke_cold_1();
    }
  }
}

void spd_xpc_event_stream_handler_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x223C2C7C0](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    pthread_mutex_lock(&_spd_connection_mutex);
    if (_spd_connection == *(void *)(a1 + 32))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      xpc_object_t v8 = _spd_os_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = "???";
        if (string) {
          uint64_t v9 = string;
        }
        *(_DWORD *)buf = 136315138;
        v15 = v9;
        _os_log_impl(&dword_21E613000, v8, OS_LOG_TYPE_DEFAULT, "XPC connection is gone, reason: %s", buf, 0xCu);
      }
      _spd_xpc_cleanup_locked();
    }
    pthread_mutex_unlock(&_spd_connection_mutex);
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    int64_t int64 = xpc_dictionary_get_int64(a2, "msg_type");
    if (int64 == 50)
    {
      int v6 = xpc_dictionary_get_int64(a2, "pid");
      if (spd_client_session_queue_once != -1) {
        dispatch_once(&spd_client_session_queue_once, &__block_literal_global_0);
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = spd_xpc_event_stream_handler_block_invoke_3;
      block[3] = &__block_descriptor_tmp_17;
      int v13 = v6;
      dispatch_async((dispatch_queue_t)spd_client_session_queue_queue, block);
    }
    else
    {
      uint64_t v10 = int64;
      char v11 = _spd_os_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        spd_xpc_event_stream_handler_block_invoke_2_cold_1(v10, v11);
      }
    }
  }
}

void _spd_xpc_cleanup_locked()
{
  if (_spd_connection)
  {
    xpc_connection_cancel((xpc_connection_t)_spd_connection);
    xpc_release((xpc_object_t)_spd_connection);
    _spd_connection = 0;
    _spd_connection_in_progress = 0;
    if (spd_client_session_queue_once != -1) {
      dispatch_once(&spd_client_session_queue_once, &__block_literal_global_0);
    }
    uint64_t v0 = spd_client_session_queue_queue;
    dispatch_async(v0, &__block_literal_global_21);
  }
  else
  {
    _spd_connection_in_progress = 0;
  }
}

void spd_xpc_event_stream_handler_block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_object_t v1 = (void *)_s_spd_notification_client_sessions;
  if (_s_spd_notification_client_sessions)
  {
    int v2 = *(_DWORD *)(a1 + 32);
    do
    {
      if (v1[2] && v1[3])
      {
        pid_t v3 = _spd_os_log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v9) = v2;
          _os_log_impl(&dword_21E613000, v3, OS_LOG_TYPE_INFO, "Calling session client's callback on their queue for client [PID=%d]", buf, 8u);
        }
        uint64_t v4 = v1[2];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = __spd_notification_socket_activity_block_invoke;
        block[3] = &__block_descriptor_tmp_22;
        void block[4] = v1;
        int v7 = v2;
        dispatch_async(v4, block);
      }
      else
      {
        uint64_t v5 = _spd_os_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v9 = v1;
          _os_log_error_impl(&dword_21E613000, v5, OS_LOG_TYPE_ERROR, "Unable to dispatch session client's handler [ADDR=%p]", buf, 0xCu);
        }
      }
      xpc_object_t v1 = (void *)*v1;
    }
    while (v1);
  }
}

void ___spd_xpc_cleanup_locked_block_invoke()
{
  if (_s_spd_notification_client_sessions)
  {
    uint64_t v0 = _spd_os_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl(&dword_21E613000, v0, OS_LOG_TYPE_INFO, "Old connection went away. Registering again with spd", v2, 2u);
    }
    if (_spd_helper_send_async(10, 0, 0xFFFFFFFF))
    {
      xpc_object_t v1 = _spd_os_log();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        ___spd_xpc_cleanup_locked_block_invoke_cold_1();
      }
    }
  }
}

uint64_t __spd_notification_socket_activity_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))(*(void *)(*(void *)(a1 + 32) + 24), *(unsigned int *)(a1 + 40));
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3(unsigned char *result, unsigned char *a2)
{
  void *result = 0;
  *a2 = 0;
  return result;
}

uint64_t spd_client_session_create(void *a1)
{
  _s_pub_session = spd_client_session_queue();
  if (!a1) {
    return 4;
  }
  int v2 = malloc_type_calloc(1uLL, 0x28uLL, 0xA004015616432uLL);
  *a1 = v2;
  if (v2) {
    return 0;
  }
  else {
    return 6;
  }
}

uint64_t spd_client_session_destroy(uint64_t a1)
{
  if (!a1) {
    return 4;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __spd_client_session_destroy_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  void block[4] = a1;
  dispatch_async((dispatch_queue_t)_s_pub_session, block);
  return 0;
}

void __spd_client_session_destroy_block_invoke(uint64_t a1)
{
  if (spd_deregister_for_notifications(*(uint64_t **)(a1 + 32)))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      if (*(void *)(v2 + 32))
      {
        pid_t v3 = *(NSObject **)(v2 + 16);
        if (v3)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __spd_client_session_destroy_block_invoke_2;
          block[3] = &__block_descriptor_tmp_1;
          void block[4] = v2;
          dispatch_async(v3, block);
        }
      }
    }
  }
}

uint64_t __spd_client_session_destroy_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t spd_client_session_set_callbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 4;
  if (a1 && a2)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    void aBlock[2] = __spd_client_session_set_callbacks_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_3_0;
    aBlock[4] = a2;
    aBlock[5] = a1;
    aBlock[6] = a4;
    *(void *)(a1 + 24) = _Block_copy(aBlock);
    if (a3)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 0x40000000;
      v9[2] = __spd_client_session_set_callbacks_block_invoke_2;
      v9[3] = &__block_descriptor_tmp_4_0;
      v9[4] = a3;
      v9[5] = a1;
      v9[6] = a4;
      xpc_object_t v8 = _Block_copy(v9);
      uint64_t result = 0;
      *(void *)(a1 + 32) = v8;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __spd_client_session_set_callbacks_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 40), a2, *(void *)(a1 + 48));
}

uint64_t __spd_client_session_set_callbacks_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(a1 + 32))(*(void *)(a1 + 40), a2, *(void *)(a1 + 48));
}

uint64_t spd_client_session_set_dispatch_queue(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 4;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 24))
    {
      *(void *)(a1 + 16) = a2;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __spd_client_session_set_dispatch_queue_block_invoke;
      block[3] = &__block_descriptor_tmp_6;
      void block[4] = a1;
      dispatch_async((dispatch_queue_t)_s_pub_session, block);
      return 0;
    }
    else
    {
      return 29;
    }
  }
  return v2;
}

void __spd_client_session_set_dispatch_queue_block_invoke(uint64_t a1)
{
  if (spd_register_for_notifications(*(void **)(a1 + 32)))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 32))
    {
      pid_t v3 = *(NSObject **)(v2 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __spd_client_session_set_dispatch_queue_block_invoke_2;
      block[3] = &__block_descriptor_tmp_5_0;
      void block[4] = v2;
      dispatch_async(v3, block);
    }
  }
}

uint64_t __spd_client_session_set_dispatch_queue_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
}

uint64_t spd_client_create(void *a1)
{
  if (!a1) {
    return 4;
  }
  uint64_t v2 = malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
  *a1 = v2;
  if (!v2) {
    return 6;
  }
  pid_t v3 = v2;
  uint64_t result = 0;
  *pid_t v3 = -1;
  return result;
}

uint64_t spd_client_destroy(void *a1)
{
  if (!a1) {
    return 4;
  }
  free(a1);
  return 0;
}

uint64_t spd_client_checkin_socket(uint64_t a1, int a2)
{
  if (!a1) {
    return 4;
  }
  *(_DWORD *)a1 = a2;
  return spd_checkin_socket(a2, (unsigned __int8 *)(a1 + 4));
}

uint64_t spd_client_checkout_socket(uint64_t a1)
{
  if (!a1) {
    return 4;
  }
  xpc_object_t v1 = (const unsigned __int8 *)(a1 + 4);
  if (uuid_is_null((const unsigned __int8 *)(a1 + 4))) {
    return 4;
  }

  return spd_checkout_socket(v1);
}

uint64_t spd_client_start_monitoring_socket(uint64_t a1)
{
  if (!a1) {
    return 4;
  }
  xpc_object_t v1 = (const unsigned __int8 *)(a1 + 4);
  if (uuid_is_null((const unsigned __int8 *)(a1 + 4))) {
    return 4;
  }

  return spd_start_monitoring_socket(v1);
}

uint64_t spd_client_stop_monitoring_socket(uint64_t a1)
{
  if (!a1) {
    return 4;
  }
  xpc_object_t v1 = (const unsigned __int8 *)(a1 + 4);
  if (uuid_is_null((const unsigned __int8 *)(a1 + 4))) {
    return 4;
  }

  return spd_stop_monitoring_socket(v1);
}

void spd_register_for_notifications_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E613000, v0, v1, "Failure to register for notifications", v2, v3, v4, v5, v6);
}

void spd_deregister_for_notifications_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E613000, v0, v1, "Deregistering notification port has NULL reference", v2, v3, v4, v5, v6);
}

void spd_deregister_for_notifications_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E613000, v0, v1, "Failure to de-register for notifications", v2, v3, v4, v5, v6);
}

void spd_checkin_socket_cold_1()
{
  qword_267D3A4F8 = (uint64_t)"Linked against modern SDK, VOIP socket will not wake. Use Local Push Connectivity instead";
  __break(1u);
}

void spd_checkin_socket_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_21E613000, v2, v3, "No existing connection... Try again...", v4);
}

void spd_checkin_socket_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_21E613000, v2, v3, "Failing to get xpc connection in time!", v4);
}

void spd_checkin_socket_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_21E613000, v2, v3, "_spd_xpc_init_locked failed", v4);
}

void ___spd_helper_send_async_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E613000, v0, v1, "_spd_get_xpc_connection_retained failed", v2, v3, v4, v5, v6);
}

void ___spd_helper_send_async_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = *(_DWORD *)(a1 + 64);
  int v4 = *(_DWORD *)(a1 + 68);
  int v5 = 136316674;
  uint8_t v6 = "_spd_helper_send_async_block_invoke";
  __int16 v7 = 1024;
  int v8 = 415;
  __int16 v9 = 2048;
  uint64_t v10 = v2;
  __int16 v11 = 1024;
  int v12 = v3;
  __int16 v13 = 1040;
  int v14 = 16;
  __int16 v15 = 2096;
  uint64_t v16 = a1 + 56;
  __int16 v17 = 1024;
  int v18 = v4;
  _os_log_debug_impl(&dword_21E613000, a2, OS_LOG_TYPE_DEBUG, "%s:%d sent type: %llu, sfd: %d, %{uuid_t}.16P, pid: %u", (uint8_t *)&v5, 0x38u);
}

void ___spd_xpc_init_locked_block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  int v2 = 163;
  _os_log_debug_impl(&dword_21E613000, v0, OS_LOG_TYPE_DEBUG, "%s:%d calling xpc_set_event_stream_handler", v1, 0x12u);
}

void spd_xpc_event_stream_handler_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E613000, v0, v1, "No connection from spd!", v2, v3, v4, v5, v6);
}

void spd_xpc_event_stream_handler_block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  int v2 = 80;
  _os_log_debug_impl(&dword_21E613000, v0, OS_LOG_TYPE_DEBUG, "%s:%d spd_xpc_event_stream_handler", v1, 0x12u);
}

void spd_xpc_event_stream_handler_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E613000, a2, OS_LOG_TYPE_ERROR, "unknown msg type %lld", (uint8_t *)&v2, 0xCu);
}

void ___spd_xpc_cleanup_locked_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E613000, v0, v1, "_spd_helper_send_async failed", v2, v3, v4, v5, v6);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

void free(void *a1)
{
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

void xpc_connection_resume(xpc_connection_t connection)
{
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

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_connection_t xpc_dictionary_create_connection(xpc_object_t xdict, const char *key)
{
  return (xpc_connection_t)MEMORY[0x270EDC010](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x270EDC0B8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}