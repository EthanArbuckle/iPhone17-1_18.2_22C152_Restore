@interface CryptexRemoteService
- (BOOL)supportsFeature:(const char *)a3;
- (CryptexRemoteService)initWithDevice:(id)a3 queue:(id)a4 flags:(unint64_t)a5;
- (OS_dispatch_queue)client_queue;
- (OS_dispatch_queue)internal_queue;
- (OS_remote_device)device;
- (__CFError)initService;
- (__CFError)sendRequestSync:(id)a3 response:(id *)a4;
- (id)remote_conn;
- (unint64_t)flags;
- (void)dealloc;
- (void)initService;
@end

@implementation CryptexRemoteService

- (CryptexRemoteService)initWithDevice:(id)a3 queue:(id)a4 flags:(unint64_t)a5
{
  v8 = (OS_remote_device *)a3;
  v9 = (OS_dispatch_queue *)a4;
  v20.receiver = self;
  v20.super_class = (Class)CryptexRemoteService;
  v10 = [(CryptexRemoteService *)&v20 init];
  device = v10->_device;
  v10->_device = v8;
  v12 = v8;

  client_queue = v10->_client_queue;
  v10->_client_queue = v9;
  v14 = v9;

  v10->_flags = a5;
  dispatch_queue_t v15 = dispatch_queue_create("com.apple.security.libcryptex.remote_service", 0);
  internal_queue = v10->_internal_queue;
  v10->_internal_queue = (OS_dispatch_queue *)v15;

  service = v10->service;
  v10->service = 0;

  connection = v10->connection;
  v10->connection = 0;

  return v10;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (self->connection)
  {
    int v3 = *__error();
    v4 = _remote_service_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      connection = self->connection;
      *(_DWORD *)buf = 138543362;
      v9 = connection;
      _os_log_impl(&dword_21DAF1000, v4, OS_LOG_TYPE_DEBUG, "canceling RXPC connection %{public}@", buf, 0xCu);
    }

    *__error() = v3;
    xpc_remote_connection_cancel();
    v6 = self->connection;
    self->connection = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CryptexRemoteService;
  [(CryptexRemoteService *)&v7 dealloc];
}

- (id)remote_conn
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  connection = self->connection;
  if (!connection)
  {
    v4 = [(CryptexRemoteService *)self internal_queue];
    v5 = (OS_xpc_remote_connection *)xpc_remote_connection_create_with_remote_service();
    v6 = self->connection;
    self->connection = v5;

    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    int v7 = *__error();
    v8 = _remote_service_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = self->connection;
      int v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_21DAF1000, v8, OS_LOG_TYPE_DEBUG, "establish RXPC connection %{public}@", (uint8_t *)&v12, 0xCu);
    }

    *__error() = v7;
    connection = self->connection;
  }
  uint64_t v10 = connection;

  return v10;
}

int *__35__CryptexRemoteService_remote_conn__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x223C12420](a2);
  uint64_t v3 = MEMORY[0x263EF8720];
  int v4 = *__error();
  v5 = _remote_service_log();
  v6 = v5;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      int v7 = "error received on remote connection";
      v8 = buf;
      v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
      goto LABEL_6;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __int16 v12 = 0;
    int v7 = "unexpected message from remote connection";
    v8 = (uint8_t *)&v12;
    v9 = v6;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_6:
    _os_log_impl(&dword_21DAF1000, v9, v10, v7, v8, 2u);
  }

  result = __error();
  int *result = v4;
  return result;
}

- (__CFError)initService
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->service) {
    [(CryptexRemoteService *)&v22 initService];
  }
  uint64_t v3 = [(CryptexRemoteService *)self device];
  int state = remote_device_get_state();

  if (state != 2)
  {
    v9 = _remote_service_log();

    if (v9)
    {
      os_log_type_t v10 = _remote_service_log();
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      [(CryptexRemoteService *)self device];
      *(void *)((char *)&v23 + 4) = LODWORD(v23) = 138412290;
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      id v12 = MEMORY[0x263EF8438];
      [(CryptexRemoteService *)self device];
      *(void *)((char *)&v23 + 4) = LODWORD(v23) = 138412290;
      v11 = (char *)_os_log_send_and_compose_impl();

      os_log_type_t v10 = MEMORY[0x263EF8438];
    }

    CFErrorRef Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 172, "com.apple.security.cryptex", 57, 0, v11);
    goto LABEL_9;
  }
  v5 = [(CryptexRemoteService *)self device];
  v6 = (OS_remote_service *)remote_device_copy_service();
  service = self->service;
  self->service = v6;

  if (!self->service)
  {
    int v15 = *__error();
    if (v15 == 83)
    {
      v18 = _remote_service_log();

      if (v18)
      {
        v19 = _remote_service_log();
        os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        *(void *)&long long v23 = 0x5304000100;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(void *)&long long v23 = 0x5304000100;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 191, "com.apple.security.cryptex.posix", 83, 0, v11);
    }
    else if (v15 == 3)
    {
      v16 = _remote_service_log();

      if (v16)
      {
        v17 = _remote_service_log();
        os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        *(void *)&long long v23 = 0x304000100;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(void *)&long long v23 = 0x304000100;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 185, "com.apple.security.cryptex.posix", 3, 0, v11);
    }
    else
    {
      objc_super v20 = _remote_service_log();

      if (v20)
      {
        v21 = _remote_service_log();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        LODWORD(v23) = 67109120;
        DWORD1(v23) = v15;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        LODWORD(v23) = 67109120;
        DWORD1(v23) = v15;
        v11 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef Error = createError("-[CryptexRemoteService initService]", "remote_service.m", 197, "com.apple.security.cryptex.posix", v15, 0, v11);
    }
LABEL_9:
    v8 = Error;
    free(v11);
    return v8;
  }
  return 0;
}

- (BOOL)supportsFeature:(const char *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  service = self->service;
  if (service)
  {
LABEL_2:
    return MEMORY[0x270F5A9A8](service, a3);
  }
  v6 = [(CryptexRemoteService *)self initService];
  if (!v6)
  {
    service = self->service;
    goto LABEL_2;
  }
  int v7 = v6;
  int v8 = *__error();
  v9 = _remote_service_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_21DAF1000, v9, OS_LOG_TYPE_ERROR, "failed to init service: %@", (uint8_t *)&v11, 0xCu);
  }

  *__error() = v8;
  CFRelease(v7);
  return 0;
}

- (__CFError)sendRequestSync:(id)a3 response:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFTypeRef cf = 0;
  if (self->service || (CFErrorRef Error = [(CryptexRemoteService *)self initService]) == 0)
  {
    int v7 = (__CFError *)xpc_copy_debug_description();
    int v8 = *__error();
    v9 = _remote_service_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v39 = v7;
      _os_log_impl(&dword_21DAF1000, v9, OS_LOG_TYPE_DEBUG, "sending request: %s", buf, 0xCu);
    }

    *__error() = v8;
    free(v7);
    os_log_type_t v10 = [(CryptexRemoteService *)self remote_conn];
    int v11 = (void *)xpc_remote_connection_send_message_with_reply_sync();

    if (MEMORY[0x223C12420](v11) == MEMORY[0x263EF8720])
    {
      uint64_t v22 = (__CFError *)xpc_copy_debug_description();
      long long v23 = _remote_service_log();

      if (v23)
      {
        uint64_t v24 = _remote_service_log();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        *(_DWORD *)buf = 136315138;
        v39 = v22;
        v25 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_DWORD *)buf = 136315138;
        v39 = v22;
        v25 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 249, "com.apple.security.cryptex", 54, 0, v25);
      free(v25);
      free(v22);
    }
    else
    {
      id v12 = (__CFError *)xpc_copy_debug_description();
      int v13 = *__error();
      uint64_t v14 = _remote_service_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v39 = v12;
        _os_log_impl(&dword_21DAF1000, v14, OS_LOG_TYPE_DEBUG, "got reply: %s", buf, 0xCu);
      }

      *__error() = v13;
      free(v12);
      int cferr = _xpc_reply_get_cferr(v11, &cf);
      if (cferr)
      {
        v16 = _remote_service_log();

        if (v16)
        {
          v17 = _remote_service_log();
          os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v18 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_WORD *)buf = 0;
          v18 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 261, "com.apple.security.cryptex", cferr, 0, v18);
        free(v18);
      }
      else if (cf)
      {
        v26 = _remote_service_log();

        if (v26)
        {
          v27 = _remote_service_log();
          os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          v28 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_WORD *)buf = 0;
          v28 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 269, "com.apple.security.cryptex", 16, cf, v28);
        free(v28);
      }
      else
      {
        id v36 = 0;
        int argv = _xpc_reply_get_argv(v11, &v36);
        id v30 = v36;
        v31 = v30;
        if (argv)
        {
          v32 = _remote_service_log();

          if (v32)
          {
            v33 = _remote_service_log();
            os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
            *(_WORD *)buf = 0;
            v34 = (char *)_os_log_send_and_compose_impl();
          }
          else
          {
            *(_WORD *)buf = 0;
            v34 = (char *)_os_log_send_and_compose_impl();
          }
          CFErrorRef Error = createError("-[CryptexRemoteService sendRequestSync:response:]", "remote_service.m", 276, "com.apple.security.cryptex", argv, 0, v34);
          free(v34);
        }
        else
        {
          *a4 = xpc_copy(v30);

          CFErrorRef Error = 0;
        }
      }
    }
  }
  else
  {
    int v20 = *__error();
    v21 = _remote_service_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = Error;
      _os_log_impl(&dword_21DAF1000, v21, OS_LOG_TYPE_ERROR, "failed to init service: %@", buf, 0xCu);
    }

    *__error() = v20;
  }
  if (cf) {
    CFRelease(cf);
  }

  return Error;
}

- (OS_remote_device)device
{
  return self->_device;
}

- (OS_dispatch_queue)client_queue
{
  return self->_client_queue;
}

- (OS_dispatch_queue)internal_queue
{
  return self->_internal_queue;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal_queue, 0);
  objc_storeStrong((id *)&self->_client_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->connection, 0);

  objc_storeStrong((id *)&self->service, 0);
}

- (void)initService
{
}

@end