void RPRelease(uint64_t a1)
{
  NSObject *global_queue;
  void block[5];

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __RPRelease_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a1;
  dispatch_async(global_queue, block);
}

void __RPRelease_block_invoke(uint64_t a1)
{
}

uint64_t RPSocket::set_client(RPSocket *this, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *((void *)this + 5);
  if (v11) {
    goto LABEL_5;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v11 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_5:
    if (*(int *)(v11 + 16) >= 5) {
      LogMsg(5u, v11, (uint64_t)"RPSocket.cpp", 259, (uint64_t)"set_client", 0, @"RPSocket %p: setting client. old: %p. new: %p", a8, (uint64_t)this);
    }
  }
  if (a2) {
    v12 = a3;
  }
  else {
    v12 = 0;
  }
  RPSocket::suspend(this);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  *((void *)this + 3) = a2;
  v13 = (const void *)*((void *)this + 4);
  if (v13) {
    CFRelease(v13);
  }
  if (v12) {
    CFTypeRef v14 = CFRetain(v12);
  }
  else {
    CFTypeRef v14 = 0;
  }
  *((void *)this + 4) = v14;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 136));

  return RPSocket::resume(this);
}

uint64_t RPSocket::suspend(RPSocket *this)
{
  v2 = (pthread_mutex_t *)((char *)this + 136);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  int v3 = *((_DWORD *)this + 52) - 1;
  *((_DWORD *)this + 52) = v3;
  if (!v3) {
    (*(void (**)(RPSocket *))(*(void *)this + 16))(this);
  }

  return pthread_mutex_unlock(v2);
}

uint64_t RPSocket::resume(RPSocket *this)
{
  v2 = (pthread_mutex_t *)((char *)this + 136);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  int v3 = *((_DWORD *)this + 52);
  *((_DWORD *)this + 52) = v3 + 1;
  if (!v3) {
    (*(void (**)(RPSocket *))(*(void *)this + 24))(this);
  }

  return pthread_mutex_unlock(v2);
}

uint64_t BlockInvoker(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t RPSocketReadBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a3) {
    return 1;
  }
  uint64_t v8 = a3;
  while (1)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v11) {
      goto LABEL_7;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v11 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_7:
      if (*(int *)(v11 + 16) >= 5) {
        LogMsg(5u, v11, (uint64_t)"RPSocket.cpp", 517, (uint64_t)"RPSocketRead", 0, @"Reading %lu bytes from socket %p to buffer %p", a8, v8);
      }
    }
    unint64_t v12 = (***(uint64_t (****)(void, uint64_t, uint64_t))(a1 + 16))(*(void *)(a1 + 16), a2, v8);
    uint64_t v13 = *(void *)(a1 + 16);
    if (v12 == -1) {
      break;
    }
    atomic_fetch_add_explicit(*(atomic_ullong *volatile *)(v13 + 224), v12, memory_order_relaxed);
    if (!v12)
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 16) + 40);
      if (v19) {
        goto LABEL_24;
      }
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      uint64_t v19 = getDefaultLogCtx_ctx;
      if (getDefaultLogCtx_ctx)
      {
LABEL_24:
        if (*(int *)(v19 + 16) >= 3) {
          LogMsg(3u, v19, (uint64_t)"RPSocket.cpp", 532, (uint64_t)"RPSocketReadBuffer", 0, @"EOF on %@\n", a8, a1);
        }
      }
      return 0;
    }
    a2 += v12;
    v8 -= v12;
    if (!v8) {
      return 1;
    }
  }
  uint64_t v14 = *(void *)(v13 + 40);
  if (v14) {
    goto LABEL_18;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v14 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_18:
    if (*(int *)(v14 + 16) >= 3)
    {
      v15 = __error();
      v16 = strerror(*v15);
      CFStringRef v17 = CFStringCreateWithCString(0, v16, 0x8000100u);
      LogMsg(3u, v14, (uint64_t)"RPSocket.cpp", 536, (uint64_t)"RPSocketReadBuffer", v17, @"read error on %@", v18, a1);
    }
  }
  return 0;
}

uint64_t RPSocketWrite(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return 1;
  }
  uint64_t v3 = a3;
  while (1)
  {
    unint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 16) + 8))(*(void *)(a1 + 16), a2, v3);
    if ((v6 & 0x8000000000000000) != 0) {
      break;
    }
    a2 += v6;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 16) + 224) + 8), v6, memory_order_relaxed);
    v3 -= v6;
    if (!v3) {
      return 1;
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 16) + 40);
  if (v9) {
    goto LABEL_11;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v9 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_11:
    if (*(int *)(v9 + 16) >= 3) {
      LogMsg(3u, v9, (uint64_t)"RPSocket.cpp", 618, (uint64_t)"RPSocketWrite", 0, @"failed to write %zu bytes to %@\n", v7, v3);
    }
  }
  return 0;
}

uint64_t RPSocketWriteDictionary(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFErrorRef error = 0;
  if (a2)
  {
    CFDataRef v9 = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFDataRef v11 = v9;
    if (v9 && !error)
    {
      CFIndex Length = CFDataGetLength(v9);
      uint64_t v14 = Length;
      if (Length < 0x80000000)
      {
        int v26 = Length;
        if (RPSocketWrite(a1, (uint64_t)&v26, 4))
        {
          BytePtr = CFDataGetBytePtr(v11);
          if (RPSocketWrite(a1, (uint64_t)BytePtr, v14))
          {
            uint64_t v17 = 1;
LABEL_42:
            CFRelease(v11);
            goto LABEL_43;
          }
          uint64_t v23 = *(void *)(*(void *)(a1 + 16) + 40);
          if (v23) {
            goto LABEL_39;
          }
          if (getDefaultLogCtx_once != -1) {
            dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
          }
          uint64_t v23 = getDefaultLogCtx_ctx;
          if (getDefaultLogCtx_ctx)
          {
LABEL_39:
            if (*(int *)(v23 + 16) >= 3) {
              LogMsg(3u, v23, (uint64_t)"RPSocket.cpp", 668, (uint64_t)"RPSocketWriteDictionary", 0, @"failed to write length to %@\n", v21, a1);
            }
          }
        }
        else
        {
          uint64_t v22 = *(void *)(*(void *)(a1 + 16) + 40);
          if (v22) {
            goto LABEL_33;
          }
          if (getDefaultLogCtx_once != -1) {
            dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
          }
          uint64_t v22 = getDefaultLogCtx_ctx;
          if (getDefaultLogCtx_ctx)
          {
LABEL_33:
            if (*(int *)(v22 + 16) >= 3) {
              LogMsg(3u, v22, (uint64_t)"RPSocket.cpp", 663, (uint64_t)"RPSocketWriteDictionary", 0, @"failed to write length to %@\n", v19, a1);
            }
          }
        }
      }
      else
      {
        uint64_t v15 = *(void *)(*(void *)(a1 + 16) + 40);
        if (v15) {
          goto LABEL_9;
        }
        if (getDefaultLogCtx_once != -1) {
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        }
        uint64_t v15 = getDefaultLogCtx_ctx;
        if (getDefaultLogCtx_ctx)
        {
LABEL_9:
          if (*(int *)(v15 + 16) >= 3) {
            LogMsg(3u, v15, (uint64_t)"RPSocket.cpp", 658, (uint64_t)"RPSocketWriteDictionary", 0, @"data too big for %@: %lu\n", v13, a1);
          }
        }
      }
      uint64_t v17 = 0;
      goto LABEL_42;
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v18) {
      goto LABEL_22;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v18 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_22:
      if (*(int *)(v18 + 16) >= 3) {
        LogMsg(3u, v18, (uint64_t)"RPSocket.cpp", 652, (uint64_t)"RPSocketWriteDictionary", 0, @"failed to serialize dictionary to %@: %@\n", v10, a1);
      }
    }
    uint64_t v17 = 0;
    if (v11) {
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 16) + 40);
    if (v16) {
      goto LABEL_15;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v16 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_15:
      if (*(int *)(v16 + 16) >= 3) {
        LogMsg(3u, v16, (uint64_t)"RPSocket.cpp", 646, (uint64_t)"RPSocketWriteDictionary", 0, @"no dictionary to send to %@\n", a8, a1);
      }
    }
    uint64_t v17 = 0;
  }
LABEL_43:
  if (error) {
    CFRelease(error);
  }
  return v17;
}

void RPCreateSocketForFD()
{
  uint64_t v0 = *MEMORY[0x263EF8340];
  operator new();
}

void sub_215294378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RPSocket::~RPSocket(v8, a2, a3, a4, a5, a6, a7, a8);
  MEMORY[0x2166B6A00](v8, 0x10F1C404203EEA6);
  _Unwind_Resume(a1);
}

uint64_t rps_sockaddr_to_string(uint64_t result, sockaddr *a2, const sockaddr *a3, const char *a4)
{
  uint64_t v5 = result;
  uint64_t v14 = *MEMORY[0x263EF8340];
  int sa_family = a2->sa_family;
  if (sa_family != 30 && sa_family != 1 && !a2->sa_family)
  {
    *(_WORD *)(result + 8) = 62;
    uint64_t v7 = *(void *)"<unknown>";
LABEL_21:
    *(void *)uint64_t v5 = v7;
    return result;
  }
  if (sa_family == 30) {
    int v8 = 28;
  }
  else {
    int v8 = 0;
  }
  if (sa_family == 2) {
    int v9 = 16;
  }
  else {
    int v9 = v8;
  }
  if (a2->sa_len) {
    socklen_t sa_len = a2->sa_len;
  }
  else {
    socklen_t sa_len = v9;
  }
  result = getnameinfo(a2, sa_len, v13, 0x401u, v12, 0x20u, 10);
  if (result)
  {
    if (a2->sa_family == 1)
    {
      unsigned int v11 = a2->sa_len - 2;
      if (v11 >= 0x68) {
        unsigned int v11 = 104;
      }
      if (v11) {
        return snprintf((char *)v5, 0x401uLL, "%s%.*s%s");
      }
    }
    *(_WORD *)(v5 + 8) = 62;
    uint64_t v7 = *(void *)"<unknown>";
    goto LABEL_21;
  }
  if (!v12[0] || *(unsigned __int16 *)v12 == 48) {
    v12[0] = 0;
  }
  return snprintf((char *)v5, 0x401uLL, "%s%s%s%s%s");
}

void RPSocket::~RPSocket(RPSocket *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)this = &unk_26C5DF378;
  uint64_t v9 = *((void *)this + 5);
  if (v9) {
    goto LABEL_5;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v9 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      LogMsg(5u, v9, (uint64_t)"RPSocket.cpp", 110, (uint64_t)"~RPSocket", 0, @"Releasing RPSocket: %p (_sockRef: %p)", a8, (uint64_t)this);
    }
  }
  uint64_t v10 = (const void *)*((void *)this + 4);
  if (v10) {
    CFRelease(v10);
  }
  unsigned int v11 = (const void *)*((void *)this + 5);
  if (v11) {
    CFRelease(v11);
  }
  unint64_t v12 = (const void *)*((void *)this + 2);
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v13 = *((void *)this + 6);
  if (v13) {
    dispatch_release(v13);
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 136));
  pthread_mutex_destroy((pthread_mutex_t *)this + 1);
  uint64_t v14 = (void *)*((void *)this + 28);
  if (v14) {
    free(v14);
  }
  uint64_t v15 = (void *)*((void *)this + 27);
  if (v15) {
    free(v15);
  }
}

void __clang_call_terminate(void *a1)
{
}

uint64_t RPSocket::copy_entitlements(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::copy_error(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::get_port(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::accept(RPSocket *this)
{
  return 0;
}

uint64_t RPSocket::set_invalid(RPSocket *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RPSocket::signal(this, 8, a3, a4, a5, a6, a7, a8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  *((void *)this + 3) = 0;
  uint64_t v9 = (const void *)*((void *)this + 4);
  if (v9) {
    CFRelease(v9);
  }
  *((void *)this + 4) = 0;
  uint64_t v10 = (const void *)*((void *)this + 5);
  if (v10) {
    CFRelease(v10);
  }
  *((void *)this + 5) = 0;

  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 136));
}

void RPSocket::signal(RPSocket *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *((void *)this + 5);
  if (v10) {
    goto LABEL_5;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v10 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5) {
      LogMsg(5u, v10, (uint64_t)"RPSocket.cpp", 229, (uint64_t)"signal", 0, @"RPSocket %p (ref: %p): got signal with event %d and current _cb: %p", a8, (uint64_t)this);
    }
  }
  unsigned int v11 = (pthread_mutex_t *)((char *)this + 136);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 136));
  uint64_t v13 = (void (*)(const void *, uint64_t, const void *))*((void *)this + 3);
  if (v13)
  {
    uint64_t v14 = (const void *)*((void *)this + 4);
    uint64_t context = *((void *)this + 3);
    CFTypeRef cf = v14;
    uint64_t v15 = *((void *)this + 6);
    if (v14) {
      CFRetain(v14);
    }
    if (v15) {
      dispatch_retain(v15);
    }
    uint64_t v16 = (const void *)*((void *)this + 1);
    uint64_t v19 = v16;
    uint64_t v20 = a2;
    CFRetain(v16);
    pthread_mutex_unlock(v11);
    if (v15)
    {
      dispatch_sync_f(v15, &context, (dispatch_function_t)RPSocket::invoke_cb);
      dispatch_release(v15);
      uint64_t v16 = v19;
    }
    else
    {
      v13(v16, a2, v14);
    }
    RPRelease((uint64_t)v16);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    uint64_t v17 = *((void *)this + 5);
    if (v17) {
      goto LABEL_18;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v17 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_18:
      if (*(int *)(v17 + 16) >= 3) {
        LogMsg(3u, v17, (uint64_t)"RPSocket.cpp", 243, (uint64_t)"signal", 0, @"No client callback, missing event %d for socket %p", v12, a2);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 136));
  }
}

uint64_t RPSocket::invoke_cb(RPSocket *this, void *a2)
{
  return (*(uint64_t (**)(void, void, void))this)(*((void *)this + 1), *((void *)this + 2), *((void *)this + 3));
}

void RPSocket_fd::event_handler(RPSocket_fd *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void RPSocket_fd::cancel_handler(dispatch_queue_t *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RPSocket::set_invalid((RPSocket *)this, a2, a3, a4, a5, a6, a7, a8);
  dispatch_sync_f(this[30], this, (dispatch_function_t)RPSocket_fd::close_fd);
  uint64_t v9 = (uint64_t)this[1];

  RPRelease(v9);
}

uint64_t RPSocket_fd::close_fd(RPSocket_fd *this, void *a2)
{
  return (*(uint64_t (**)(void))(*(void *)this + 120))();
}

uint64_t RPSocket_fd::closeFD(RPSocket_fd *this)
{
  uint64_t result = *((unsigned int *)this + 58);
  if (result != -1) {
    uint64_t result = close(result);
  }
  *((_DWORD *)this + 58) = -1;
  return result;
}

uint64_t RPSocket_fd::shutdownFD(RPSocket_fd *this)
{
  uint64_t result = *((unsigned int *)this + 58);
  if (result != -1) {
    return shutdown(result, 2);
  }
  return result;
}

void RPSocket_fd::~RPSocket_fd(RPSocket_fd *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RPSocket_fd::~RPSocket_fd(this, a2, a3, a4, a5, a6, a7, a8);

  JUMPOUT(0x2166B6A00);
}

{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t vars8;

  *(void *)this = &unk_26C5DF2E8;
  uint64_t v9 = *((void *)this + 5);
  if (v9) {
    goto LABEL_5;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v9 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 5) {
      LogMsg(5u, v9, (uint64_t)"RPSocket.cpp", 999, (uint64_t)"~RPSocket_fd", 0, @"Releasing RPSocket_fd: %p", a8, (uint64_t)this);
    }
  }
  dispatch_source_cancel(*((dispatch_source_t *)this + 47));
  dispatch_release(*((dispatch_object_t *)this + 47));
  dispatch_release(*((dispatch_object_t *)this + 30));

  RPSocket::~RPSocket(this, v10, v11, v12, v13, v14, v15, v16);
}

const void *RPSocket_fd::copy_entitlements(RPSocket_fd *this)
{
  int v1 = *((_DWORD *)this + 58);
  socklen_t v25 = 4;
  if (copyEntitlementsForSocketPeer_sleep_once != -1) {
    dispatch_once(&copyEntitlementsForSocketPeer_sleep_once, &__block_literal_global_66);
  }
  unsigned int v26 = 0;
  usleep(1000 * copyEntitlementsForSocketPeer_sleep_delay);
  if (getsockopt(v1, 6, 516, &v26, &v25))
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v2 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      uint64_t v3 = __error();
      v4 = strerror(*v3);
      CFStringRef v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
      LogMsg(3u, v2, (uint64_t)"Utilities.c", 298, (uint64_t)"copyEntitlementsForSocketPeer", v5, @"getsockopt", v6, v24);
    }
    return 0;
  }
  uint64_t v7 = v26;
  uint64_t v27 = 0;
  if (!csops()) {
    return 0;
  }
  if (*__error() != 34)
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v13 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      uint64_t v14 = __error();
      strerror(*v14);
      LogMsg(3u, v13, (uint64_t)"Utilities.c", 244, (uint64_t)"copyEntitlementsForPid", 0, @"csops1(%d): %s\n", v15, v7);
    }
    return 0;
  }
  int v8 = (UInt8 *)malloc_type_calloc(1uLL, bswap32(HIDWORD(v27)), 0x59FBFC9DuLL);
  if (csops())
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v10 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      unsigned int v11 = __error();
      strerror(*v11);
      LogMsg(3u, v10, (uint64_t)"Utilities.c", 252, (uint64_t)"copyEntitlementsForPid", 0, @"csops2(%d): %s\n", v12, v7);
    }
    if (!v8) {
      return 0;
    }
    goto LABEL_18;
  }
  if (*(_DWORD *)v8 != 1903288058)
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 257, (uint64_t)"copyEntitlementsForPid", 0, @"bad magic 0x%08x\n", v9, *(unsigned int *)v8);
    }
    goto LABEL_18;
  }
  unsigned int v18 = bswap32(*((_DWORD *)v8 + 1));
  if (v18 < 9
    || (CFIndex v19 = v18 - 8,
        *((_DWORD *)v8 + 1) = v19,
        (CFDataRef v20 = CFDataCreateWithBytesNoCopy(0, v8 + 8, v19, (CFAllocatorRef)*MEMORY[0x263EFFB28])) == 0))
  {
LABEL_18:
    free(v8);
    return 0;
  }
  CFDataRef v21 = v20;
  CFPropertyListRef v22 = CFPropertyListCreateWithData(0, v20, 0, 0, 0);
  uint64_t v16 = v22;
  if (v22)
  {
    CFTypeID v23 = CFGetTypeID(v22);
    if (v23 != CFDictionaryGetTypeID())
    {
      CFRelease(v16);
      uint64_t v16 = 0;
    }
  }
  free(v8);
  CFRelease(v21);
  return v16;
}

uint64_t RPSocket_fd::get_port(RPSocket_fd *this)
{
  int v1 = *((unsigned __int8 *)this + 249);
  if (v1 == 30 || v1 == 2) {
    return bswap32(*((unsigned __int16 *)this + 125)) >> 16;
  }
  else {
    return 0;
  }
}

uint64_t RPSocket_fd::accept(RPSocket_fd *this, unint64_t a2)
{
  if (!a2)
  {
LABEL_5:
    if (accept(*((_DWORD *)this + 58), 0, 0) != -1)
    {
      RPCreateSocketForFD();
    }
    uint64_t v19 = *((void *)this + 5);
    if (v19) {
      goto LABEL_18;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v19 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_18:
      if (*(int *)(v19 + 16) >= 3)
      {
        CFDataRef v20 = __error();
        CFDataRef v21 = strerror(*v20);
        CFStringRef v12 = CFStringCreateWithCString(0, v21, 0x8000100u);
        uint64_t v14 = "RPSocket.cpp";
        uint64_t v28 = *((void *)this + 1);
        uint64_t v15 = "accept";
        CFStringRef v16 = @"accept for %@";
        uint64_t v17 = v19;
        uint64_t v18 = 1073;
        goto LABEL_20;
      }
    }
    return 0;
  }
  uintptr_t v4 = *((int *)this + 58);
  int v5 = kqueue();
  if (v5 != -1)
  {
    int v6 = v5;
    timeout.tv_sec = (int)(a2 / 0x3B9ACA00);
    timeout.tv_nsec = a2 % 0x3B9ACA00;
    eventlist.ident = v4;
    *(_DWORD *)&eventlist.filter = 1179647;
    memset(&eventlist.fflags, 0, 20);
    int v7 = kevent(v5, &eventlist, 1, &eventlist, 1, &timeout);
    if (v7 == -1)
    {
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      uint64_t v22 = getDefaultLogCtx_ctx;
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
      {
        CFTypeID v23 = __error();
        uint64_t v24 = strerror(*v23);
        CFStringRef v25 = CFStringCreateWithCString(0, v24, 0x8000100u);
        LogMsg(3u, v22, (uint64_t)"Utilities.c", 216, (uint64_t)"WaitSocket", v25, @"kevent", v26, v28);
      }
      close(v6);
      return 0;
    }
    int v8 = v7;
    close(v6);
    if (v8 < 1) {
      return 0;
    }
    goto LABEL_5;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v9 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
  {
    uint64_t v10 = __error();
    unsigned int v11 = strerror(*v10);
    CFStringRef v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
    uint64_t v14 = "Utilities.c";
    uint64_t v15 = "WaitSocket";
    CFStringRef v16 = @"kqueue";
    uint64_t v17 = v9;
    uint64_t v18 = 206;
LABEL_20:
    LogMsg(3u, v17, (uint64_t)v14, v18, (uint64_t)v15, v12, v16, v13, v28);
  }
  return 0;
}

CFStringRef RPSocket_fd::copy_type_description(RPSocket_fd *this)
{
  return CFStringCreateWithFormat(0, 0, @"fd fd=%d", *((unsigned int *)this + 58));
}

void RPSocket_fd::invalidate(dispatch_source_t *this)
{
  dispatch_source_cancel(this[47]);
  uint64_t v2 = this[30];

  dispatch_sync_f(v2, this, (dispatch_function_t)RPSocket_fd::shutdown_fd);
}

uint64_t RPSocket_fd::shutdown_fd(RPSocket_fd *this, void *a2)
{
  return (*(uint64_t (**)(void))(*(void *)this + 112))();
}

void RPSocket_fd::unpause(dispatch_object_t *this)
{
}

void RPSocket_fd::pause(dispatch_object_t *this)
{
}

ssize_t RPSocket_fd::write(RPSocket_fd *this, const void *a2, size_t a3)
{
  return write(*((_DWORD *)this + 58), a2, a3);
}

ssize_t RPSocket_fd::read(RPSocket_fd *this, void *a2, size_t a3)
{
  return read(*((_DWORD *)this + 58), a2, a3);
}

CFStringRef RPSocketCopyDescription(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 136));
  uint64_t v2 = *(const void **)(v1 + 16);
  if (v2) {
    CFRetain(*(CFTypeRef *)(v1 + 16));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v1 + 136));
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 40))(v1);
  uintptr_t v4 = (const void *)v3;
  if (v3) {
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"<RPSocket %p %p: %@ %@>", v1, *(void *)(v1 + 8), v2, v3);
  }
  else {
    CFStringRef v5 = CFStringCreateWithFormat(0, 0, @"<RPSocket %p %p: %@>", v1, *(void *)(v1 + 8), v2);
  }
  CFStringRef v6 = v5;
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  return v6;
}

uint64_t FinalizeRPSocket(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 16);
  uint64_t v10 = *(void *)(v9 + 40);
  if (v10) {
    goto LABEL_5;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v10 = getDefaultLogCtx_ctx;
  if (getDefaultLogCtx_ctx)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5) {
      LogMsg(5u, v10, (uint64_t)"RPSocket.cpp", 384, (uint64_t)"FinalizeRPSocket", 0, @"Closed %@ after reading %lld bytes and writing %lld bytes\n", a8, a1);
    }
  }
  if (*(void *)(v9 + 200))
  {
    uint64_t v11 = *(void *)(v9 + 40);
    if (v11) {
      goto LABEL_12;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v11 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx)
    {
LABEL_12:
      if (*(int *)(v11 + 16) >= 5) {
        LogMsg(5u, v11, (uint64_t)"RPSocket.cpp", 387, (uint64_t)"FinalizeRPSocket", 0, @"Ending os transaction for %@\n", a8, a1);
      }
    }
    os_release(*(void **)(v9 + 200));
    *(void *)(v9 + 200) = 0;
  }
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(*(void *)result + 88);
    return v13();
  }
  return result;
}

uint64_t RPCreateSocketForHost(unsigned int a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(void *)&v15.sa_data[6] = 0;
  int v2 = socket(2, 1, 0);
  if (v2 == -1)
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v9 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      uint64_t v10 = __error();
      uint64_t v11 = strerror(*v10);
      CFStringRef v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
      LogMsg(3u, v9, (uint64_t)"RPSocket.cpp", 1749, (uint64_t)"RPCreateSocketForHost", v12, @"socket(port=%d)", v13, a1);
    }
  }
  else
  {
    int v3 = v2;
    *(_WORD *)&v15.socklen_t sa_len = 528;
    *(_WORD *)v15.sa_data = __rev16(a1);
    *(_DWORD *)&v15.sa_data[2] = 16777343;
    if (!connect(v2, &v15, 0x10u)) {
      RPCreateSocketForFD();
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v4 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      CFStringRef v5 = __error();
      CFStringRef v6 = strerror(*v5);
      CFStringRef v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
      LogMsg(3u, v4, (uint64_t)"RPSocket.cpp", 1761, (uint64_t)"RPCreateSocketForHost", v7, @"connect(port=%d)", v8, a1);
    }
    close(v3);
  }
  return 0;
}

CFStringRef LogCtxCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, @"<LogCtxRef: %p>", a1);
}

void FinalizeLogCtx(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 24);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t InitLog(uint64_t *a1)
{
  if (isatty(2))
  {
    logHandle = *MEMORY[0x263EF8348];
    int v2 = LogToFileHandle;
  }
  else
  {
    int v2 = 0;
  }
  if (isRestoreOS())
  {
    int v3 = open("/dev/console", 131073);
    logHandle = (uint64_t)fdopen(v3, "w");
    int v2 = LogToFileHandle;
  }
  uint64_t result = __CreateCFObject((dispatch_once_t *)&createLogCtx___reg, 40);
  *(_DWORD *)(result + 16) = 5;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = v2;
  *a1 = result;
  loggerReady = 1;
  return result;
}

uint64_t LogToFileHandle(int a1, int a2, char *a3)
{
  if (logHandle) {
    return fputs(a3, (FILE *)logHandle);
  }
  return result;
}

void LogMsg(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v16 = getprogname();
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  va_list arguments = (va_list)&a9;
  if (*(void *)(a2 + 32))
  {
    time_t v39 = time(0);
    memset(&v38, 0, sizeof(v38));
    localtime_r(&v39, &v38);
    if (strftime(cStr, 0x63uLL, "%b %d %H:%M:%S ", &v38)
      && (CFStringRef v18 = CFStringCreateWithCString(0, cStr, 0x8000100u)) != 0)
    {
      CFStringRef cf = v18;
      CFArrayAppendValue(Mutable, v18);
    }
    else
    {
      CFStringRef cf = 0;
    }
    uint64_t v19 = getpid();
    if (a1 >= 7) {
      int v20 = 7;
    }
    else {
      int v20 = a1;
    }
    CFStringRef v21 = CFStringCreateWithFormat(0, 0, @"%s[%d] <%s>: ", v16, v19, LevelString_levelName[v20]);
    if (v21) {
      CFArrayAppendValue(Mutable, v21);
    }
  }
  else
  {
    CFStringRef cf = 0;
    CFStringRef v21 = 0;
  }
  CFStringRef v22 = CFStringCreateWithFormat(0, 0, @"%s:%d(%s): ", a3, a4, a5);
  if (v22) {
    CFArrayAppendValue(Mutable, v22);
  }
  CFStringRef v23 = CFStringCreateWithFormatAndArguments(0, 0, a7, arguments);
  if (v23) {
    CFArrayAppendValue(Mutable, v23);
  }
  if (a6)
  {
    CFArrayAppendValue(Mutable, @": ");
    CFArrayAppendValue(Mutable, a6);
  }
  CFStringRef v35 = v21;
  CFTypeRef v37 = a6;
  CFStringRef v24 = CFStringCreateByCombiningStrings(0, Mutable, &stru_26C5DF8E8);
  CFStringRef v25 = v24;
  uint64_t v26 = "failed to convert string\n";
  if (v24)
  {
    CFIndex Length = CFStringGetLength(v24);
    CFIndex v28 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 2;
    v29 = (char *)malloc_type_malloc(v28, 0x8D7FBDB6uLL);
    if (CFStringGetCString(v25, v29, v28, 0x8000100u)) {
      uint64_t v26 = v29;
    }
  }
  else
  {
    v29 = 0;
  }
  if (a1 >= 7) {
    uint64_t v30 = 7;
  }
  else {
    uint64_t v30 = a1;
  }
  uint64_t v31 = a2;
  v32 = *(void (**)(uint64_t, void, const char *))(a2 + 32);
  if (v32)
  {
    size_t v33 = strlen(v26);
    if (v26[v33 - 1] != 10)
    {
      *(_WORD *)&v26[v33] = 10;
      v32 = *(void (**)(uint64_t, void, const char *))(v31 + 32);
    }
    v32(v30, *(void *)(v31 + 24), v26);
  }
  else
  {
    if (a1 >= 5) {
      int v34 = 5;
    }
    else {
      int v34 = a1;
    }
    asl_log(0, 0, v34, "%s", v26);
  }
  if (v29) {
    free(v29);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v25) {
    CFRelease(v25);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v37) {
    CFRelease(v37);
  }
}

uint64_t __CreateCFObject(dispatch_once_t *context, uint64_t a2)
{
  dispatch_once_t v5 = context[16];
  uint64_t v4 = context + 16;
  if (v5 != -1) {
    dispatch_once_f(v4, context, (dispatch_function_t)RegisterClass);
  }
  size_t v6 = a2 - 16;
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v8 = Instance;
  if (Instance) {
    bzero((void *)(Instance + 16), v6);
  }
  return v8;
}

uint64_t RegisterClass(void *a1)
{
  uint64_t v2 = a1[1];
  a1[5] = *a1;
  a1[8] = v2;
  a1[12] = a1[2];
  uint64_t result = _CFRuntimeRegisterClass();
  a1[3] = result;
  return result;
}

__CFDictionary *createCommandDictionaryWithArgs(const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"Command", a1);
  uint64_t v17 = (const void **)&a10;
  uint64_t v13 = key;
  if (key)
  {
    while (1)
    {
      uint64_t v14 = v17;
      CFStringRef v18 = v17 + 1;
      if (!*v14) {
        break;
      }
      CFDictionarySetValue(Mutable, v13, *v14);
      sockaddr v15 = v18;
      uint64_t v17 = v18 + 1;
      uint64_t v13 = *v15;
      if (!*v15) {
        return Mutable;
      }
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 119, (uint64_t)"createCommandDictionaryWithArgs", 0, @"no value for key %@", v12, (uint64_t)v13);
    }
  }
  return Mutable;
}

void setDictionaryIntValue(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

void __copyEntitlementsForSocketPeer_block_invoke()
{
  CFPropertyListRef v0 = CFPreferencesCopyAppValue(@"ClientListenerDelay", @"com.apple.PurpleReverseProxy");
  if (v0
    || (CFPropertyListRef v0 = CFPreferencesCopyValue(@"ClientListenerDelay", @"com.apple.PurpleReverseProxy", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50])) != 0)
  {
    CFTypeID v1 = CFGetTypeID(v0);
    if (v1 == CFNumberGetTypeID()) {
      CFNumberGetValue((CFNumberRef)v0, kCFNumberSInt32Type, &copyEntitlementsForSocketPeer_sleep_delay);
    }
    CFRelease(v0);
  }
}

uint64_t isRestoreOS()
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)__s1 = 0u;
  long long v21 = 0u;
  size_t v19 = 256;
  CFStringRef v0 = (const __CFString *)MGCopyAnswerWithError();
  if (v0)
  {
    uint64_t v2 = v0;
    CFComparisonResult v3 = CFStringCompare(v0, @"Restore", 0);
    BOOL v5 = v3 == kCFCompareEqualTo;
    if (loggerReady == 1)
    {
      CFComparisonResult v6 = v3;
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 5) {
        LogMsg(5u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 372, (uint64_t)"isRestoreOS", 0, @"Asking MobileGestalt for ReleaseType, isRestoreOS: %d\n", v4, v6 == kCFCompareEqualTo);
      }
    }
    goto LABEL_17;
  }
  if (loggerReady == 1)
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 376, (uint64_t)"isRestoreOS", 0, @"Asking for kMGQReleaseType failed: %d\n", v1, 0);
    }
  }
  CFDictionaryRef v7 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v7)
  {
    if (loggerReady != 1) {
      goto LABEL_38;
    }
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 318, (uint64_t)"isRestoreOSSystemVersion", 0, @"CFCopySystemVersionDictionary failed\n", v8, v17);
    }
LABEL_32:
    if (loggerReady == 1)
    {
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
        LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 383, (uint64_t)"isRestoreOS", 0, @"Checking SystemVersion failed: %d\n", v8, 0xFFFFFFFFLL);
      }
    }
LABEL_38:
    unsigned int v18 = sysctlbyname("kern.bootargs", __s1, &v19, 0, 0);
    if (v18)
    {
      if (loggerReady != 1) {
        return 0;
      }
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      uint64_t v13 = getDefaultLogCtx_ctx;
      if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3) {
        return 0;
      }
      uint64_t v17 = v18;
      CFStringRef v14 = @"Calling sysctlbyname for kern.bootargs failed: %d\n";
      unsigned int v15 = 3;
      uint64_t v16 = 392;
    }
    else
    {
      if (strstr(__s1, "rd=md0")) {
        return 1;
      }
      if (loggerReady != 1) {
        return 0;
      }
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      uint64_t v13 = getDefaultLogCtx_ctx;
      if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 5) {
        return 0;
      }
      CFStringRef v14 = @"Did not find rd=md0 in bootargs, assuming not RestoreOS\n";
      unsigned int v15 = 5;
      uint64_t v16 = 390;
    }
    LogMsg(v15, v13, (uint64_t)"Utilities.c", v16, (uint64_t)"isRestoreOS", 0, v14, v12, v17);
    return 0;
  }
  uint64_t v2 = v7;
  Value = CFDictionaryGetValue(v7, @"ReleaseType");
  if (!Value)
  {
    if (loggerReady == 1)
    {
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
        LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"Utilities.c", 325, (uint64_t)"isRestoreOSSystemVersion", 0, @"CFDictionaryGetValue for ReleaseType failed\n", v10, v17);
      }
    }
    CFRelease(v2);
    goto LABEL_32;
  }
  BOOL v5 = CFEqual(Value, @"Restore") != 0;
LABEL_17:
  CFRelease(v2);
  return v5;
}

__CFDictionary *_RPCopyProxyDictionaryWithOptions(const __CFURL *a1, int a2, CFTypeRef cf, int a4, int a5, int a6, int a7, uint64_t a8)
{
  BOOL v12 = !cf
     || (CFTypeID v11 = CFGetTypeID(cf), v11 != CFDictionaryGetTypeID())
     || CFDictionaryGetValue((CFDictionaryRef)cf, @"TestReachability") != (const void *)*MEMORY[0x263EFFB38];
  if (a1) {
    CFStringRef v13 = CFURLCopyHostName(a1);
  }
  else {
    CFStringRef v13 = 0;
  }
  if (v13) {
    CFStringRef v14 = (__CFError *)v13;
  }
  else {
    CFStringRef v14 = (__CFError *)@"www.apple.com";
  }
  if (!v12) {
    goto LABEL_19;
  }
  if (networkIsReachable_once != -1) {
    dispatch_once(&networkIsReachable_once, &__block_literal_global_92);
  }
  if ((networkIsReachable_performReachabilityTest & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2000000000;
  uint64_t v71 = 0;
  block[0] = (CFErrorRef)MEMORY[0x263EF8330];
  block[1] = (CFErrorRef)0x40000000;
  block[2] = (CFErrorRef)__networkIsReachable_block_invoke_2;
  block[3] = (CFErrorRef)&unk_2642390B0;
  block[4] = (CFErrorRef)&v68;
  block[5] = v14;
  dispatch_sync((dispatch_queue_t)networkIsReachable_reachableDictQueue, block);
  uint64_t v15 = v69[3];
  if (!v15
    || (int v66 = 0, !networkIsReachable_SCNetworkReachabilityGetFlags_func(v15, &v66))
    || (char v16 = v66, (v66 & 2) == 0))
  {
    _Block_object_dispose(&v68, 8);
    goto LABEL_19;
  }
  if ((v66 & 4) == 0)
  {
    _Block_object_dispose(&v68, 8);
LABEL_130:
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 223, (uint64_t)"_RPCopyProxyDictionaryWithOptions", 0, @"%@ is reachable, assuming we don't need a proxy dictionary\n", a8, (uint64_t)v14);
    }
    goto LABEL_122;
  }
  _Block_object_dispose(&v68, 8);
  if ((v16 & 0x28) != 0 && (v16 & 0x10) == 0) {
    goto LABEL_130;
  }
LABEL_19:
  if (a2) {
    uint64_t v17 = 1081;
  }
  else {
    uint64_t v17 = 1080;
  }
  CommandDictionaryWithArgs = createCommandDictionaryWithArgs(@"Ping", a2, (int)cf, a4, a5, a6, a7, a8, 0, v64);
  unint64_t v20 = 0;
  do
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 5) {
      LogMsg(5u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 58, (uint64_t)"sendPingMessage", 0, @"attampting sendProxyControlMessage\n", v18, (uint64_t)key);
    }
    uint64_t v21 = RPCreateSocketForHost((unsigned __int16)v17);
    if (v21)
    {
      uint64_t v22 = v21;
      LOWORD(v66) = -17494;
      RPSocket::resume(*(RPSocket **)(v21 + 16));
      if ((RPSocketWrite(v22, (uint64_t)&v66, 2) & 1) == 0)
      {
        if (getDefaultLogCtx_once != -1) {
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        }
        uint64_t v48 = getDefaultLogCtx_ctx;
        if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3) {
          goto LABEL_90;
        }
        uint64_t v49 = 29;
        CFStringRef v50 = @"RPSocketWrite failed\n";
        goto LABEL_89;
      }
      if ((RPSocketWriteDictionary(v22, CommandDictionaryWithArgs, v23, v24, v25, v26, v27, v28) & 1) == 0)
      {
        if (getDefaultLogCtx_once != -1) {
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        }
        uint64_t v48 = getDefaultLogCtx_ctx;
        if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3) {
          goto LABEL_90;
        }
        uint64_t v49 = 34;
        CFStringRef v50 = @"RPSocketWriteDictionary failed\n";
        goto LABEL_89;
      }
      block[0] = 0;
      LODWORD(v68) = -1;
      if (!RPSocketReadBuffer(v22, (uint64_t)&v68, 4, v29, v30, v31, v32, v28) || v68 == -1)
      {
        uint64_t v51 = *(void *)(*(void *)(v22 + 16) + 40);
        if (v51) {
          goto LABEL_54;
        }
        if (getDefaultLogCtx_once != -1) {
          dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
        }
        uint64_t v51 = getDefaultLogCtx_ctx;
        if (getDefaultLogCtx_ctx)
        {
LABEL_54:
          if (*(int *)(v51 + 16) >= 3) {
            LogMsg(3u, v51, (uint64_t)"RPSocket.cpp", 577, (uint64_t)"RPSocketReadDictionary", 0, @"failed to read length from %@\n", v28, v22);
          }
        }
      }
      else
      {
        CFIndex v33 = (int)v68;
        Mutable = CFDataCreateMutable(0, (int)v68);
        if (Mutable)
        {
          long long v35 = Mutable;
          CFDataSetLength(Mutable, v33);
          MutableBytePtr = CFDataGetMutableBytePtr(v35);
          if (RPSocketReadBuffer(v22, (uint64_t)MutableBytePtr, v33, v37, v38, v39, v40, v41))
          {
            CFPropertyListRef v43 = CFPropertyListCreateWithData(0, v35, 2uLL, 0, block);
            v45 = v43;
            if (!v43 || block[0])
            {
              uint64_t v54 = *(void *)(*(void *)(v22 + 16) + 40);
              if (v54) {
                goto LABEL_72;
              }
              if (getDefaultLogCtx_once != -1) {
                dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
              }
              uint64_t v54 = getDefaultLogCtx_ctx;
              if (getDefaultLogCtx_ctx)
              {
LABEL_72:
                if (*(int *)(v54 + 16) >= 3) {
                  LogMsg(3u, v54, (uint64_t)"RPSocket.cpp", 595, (uint64_t)"RPSocketReadDictionary", 0, @"failed to deserialize dictionary from %@: %@\n", v44, v22);
                }
              }
              CFRelease(v35);
              if (v45) {
                goto LABEL_91;
              }
              goto LABEL_84;
            }
            v65 = v14;
            CFTypeID v46 = CFGetTypeID(v43);
            if (v46 == CFDictionaryGetTypeID())
            {
              CFRelease(v35);
              CFStringRef v14 = v65;
LABEL_91:
              (*(void (**)(void))(**(void **)(v22 + 16) + 32))(*(void *)(v22 + 16));
              RPRelease(v22);
              goto LABEL_92;
            }
            uint64_t v55 = *(void *)(*(void *)(v22 + 16) + 40);
            if (v55) {
              goto LABEL_80;
            }
            if (getDefaultLogCtx_once != -1) {
              dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
            }
            uint64_t v55 = getDefaultLogCtx_ctx;
            if (getDefaultLogCtx_ctx)
            {
LABEL_80:
              if (*(int *)(v55 + 16) >= 3) {
                LogMsg(3u, v55, (uint64_t)"RPSocket.cpp", 600, (uint64_t)"RPSocketReadDictionary", 0, @"plist from %@ was not a dictionary\n", v47, v22);
              }
            }
            CFRelease(v45);
            CFStringRef v14 = v65;
          }
          else
          {
            uint64_t v53 = *(void *)(*(void *)(v22 + 16) + 40);
            if (v53) {
              goto LABEL_66;
            }
            if (getDefaultLogCtx_once != -1) {
              dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
            }
            uint64_t v53 = getDefaultLogCtx_ctx;
            if (getDefaultLogCtx_ctx)
            {
LABEL_66:
              if (*(int *)(v53 + 16) >= 3) {
                LogMsg(3u, v53, (uint64_t)"RPSocket.cpp", 589, (uint64_t)"RPSocketReadDictionary", 0, @"RPSocketReadBuffer failed from %@\n", v42, v22);
              }
            }
          }
          CFRelease(v35);
        }
        else
        {
          uint64_t v52 = *(void *)(*(void *)(v22 + 16) + 40);
          if (v52) {
            goto LABEL_60;
          }
          if (getDefaultLogCtx_once != -1) {
            dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
          }
          uint64_t v52 = getDefaultLogCtx_ctx;
          if (getDefaultLogCtx_ctx)
          {
LABEL_60:
            if (*(int *)(v52 + 16) >= 3) {
              LogMsg(3u, v52, (uint64_t)"RPSocket.cpp", 583, (uint64_t)"RPSocketReadDictionary", 0, @"CFDataCreateMutable failed for len %d for %@\n", v28, v33);
            }
          }
        }
      }
LABEL_84:
      if (getDefaultLogCtx_once != -1) {
        dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
      }
      uint64_t v48 = getDefaultLogCtx_ctx;
      if (!getDefaultLogCtx_ctx || *(int *)(getDefaultLogCtx_ctx + 16) < 3) {
        goto LABEL_90;
      }
      uint64_t v49 = 40;
      CFStringRef v50 = @"RPSocketReadDictionary failed\n";
LABEL_89:
      LogMsg(3u, v48, (uint64_t)"ReverseProxyDevice.c", v49, (uint64_t)"sendProxyControlMessage", 0, v50, v28, (uint64_t)key);
LABEL_90:
      v45 = 0;
      goto LABEL_91;
    }
    v45 = 0;
LABEL_92:
    if (v20 > 1) {
      break;
    }
    ++v20;
  }
  while (!v45);
  if (!v45)
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v56 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      CFStringRef v57 = @"sendProxyControlMessage failed\n";
      uint64_t v58 = 63;
LABEL_106:
      LogMsg(3u, v56, (uint64_t)"ReverseProxyDevice.c", v58, (uint64_t)"sendPingMessage", 0, v57, v18, (uint64_t)key);
    }
LABEL_107:
    char v59 = 0;
    if (!CommandDictionaryWithArgs) {
      goto LABEL_109;
    }
LABEL_108:
    CFRelease(CommandDictionaryWithArgs);
    goto LABEL_109;
  }
  if (CFDictionaryGetValue((CFDictionaryRef)v45, @"Pong") != (const void *)*MEMORY[0x263EFFB40])
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    uint64_t v56 = getDefaultLogCtx_ctx;
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3)
    {
      CFStringRef v57 = @"Unexpected ping response\n";
      uint64_t v58 = 68;
      goto LABEL_106;
    }
    goto LABEL_107;
  }
  char v59 = 1;
  if (CommandDictionaryWithArgs) {
    goto LABEL_108;
  }
LABEL_109:
  if (v45) {
    CFRelease(v45);
  }
  if ((v59 & 1) == 0)
  {
    if (getDefaultLogCtx_once != -1) {
      dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
    }
    if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
      LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 83, (uint64_t)"copyProxyDictionaryForURL", 0, @"Failed to ping host proxy service, returning NULL proxy dictionary\n", v18, (uint64_t)key);
    }
LABEL_122:
    v60 = 0;
    goto LABEL_123;
  }
  v60 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(v60, (const void *)*MEMORY[0x263EFFEA0], @"127.0.0.1");
  setDictionaryIntValue(v60, (const void *)*MEMORY[0x263EFFEA8], v17);
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 5) {
    LogMsg(5u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 90, (uint64_t)"copyProxyDictionaryForURL", 0, @"Returning 'socks://127.0.0.1:%d/' for '%@'\n", v61, v17);
  }
LABEL_123:
  CFRelease(v14);
  return v60;
}

void __networkIsReachable_block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)networkIsReachable_reachableDict, *(const void **)(a1 + 40));
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 40));
    CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v4 = (char *)malloc_type_malloc(v3, 0x6E438B87uLL);
    if (v4)
    {
      BOOL v5 = v4;
      if (CFStringGetCString(*(CFStringRef *)(a1 + 40), v4, v3, 0x8000100u))
      {
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = networkIsReachable_SCNetworkReachabilityCreateWithName_func(0, v5);
        uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (v6)
        {
          uint64_t v7 = *(void *)(a1 + 40);
          v11[0] = 0;
          v11[1] = v7;
          v11[2] = MEMORY[0x263EFF3B8];
          v11[3] = MEMORY[0x263EFF3B0];
          v11[4] = 0;
          networkIsReachable_SCNetworkReachabilitySetCallback_func(v6, reachabilityCB, v11);
          uint64_t v8 = (void (*)(uint64_t, dispatch_queue_global_t))networkIsReachable_SCNetworkReachabilitySetDispatchQueue_func;
          uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          dispatch_queue_global_t global_queue = dispatch_get_global_queue(0, 0);
          v8(v9, global_queue);
          CFDictionarySetValue((CFMutableDictionaryRef)networkIsReachable_reachableDict, *(const void **)(a1 + 40), *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
          CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        }
      }
      free(v5);
    }
  }
}

void reachabilityCB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  if (getDefaultLogCtx_ctx)
  {
    if (*(int *)(getDefaultLogCtx_ctx + 16) >= 7) {
      LogMsg(7u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 122, (uint64_t)"reachabilityCB", 0, @"%@ reachable? %s\n", a8, a3);
    }
  }
}

uint64_t __networkIsReachable_block_invoke()
{
  uint64_t result = isRestoreOS();
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)dlopen("/System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration", 1);
    if (result)
    {
      uint64_t v1 = (void *)result;
      networkIsReachable_SCNetworkReachabilityCreateWithName_func = dlsym((void *)result, "SCNetworkReachabilityCreateWithName");
      networkIsReachable_SCNetworkReachabilitySetCallback_func = dlsym(v1, "SCNetworkReachabilitySetCallback");
      networkIsReachable_SCNetworkReachabilitySetDispatchQueue_func = dlsym(v1, "SCNetworkReachabilitySetDispatchQueue");
      uint64_t result = (uint64_t)dlsym(v1, "SCNetworkReachabilityGetFlags");
      networkIsReachable_SCNetworkReachabilityGetFlags_func = (_UNKNOWN *)result;
      if (networkIsReachable_SCNetworkReachabilityCreateWithName_func)
      {
        if (networkIsReachable_SCNetworkReachabilitySetCallback_func
          && networkIsReachable_SCNetworkReachabilitySetDispatchQueue_func)
        {
          if (result)
          {
            networkIsReachable_reachableDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
            uint64_t result = (uint64_t)dispatch_queue_create("reachableDictQueue", 0);
            networkIsReachable_reachableDictQueue = result;
            networkIsReachable_performReachabilityTest = 1;
          }
        }
      }
    }
  }
  return result;
}

__CFDictionary *RPCopyProxyDictionary(const __CFURL *a1)
{
  int v2 = isRestoreOS();

  return _RPCopyProxyDictionaryWithOptions(a1, v2, 0, v3, v4, v5, v6, v7);
}

__CFDictionary *RPCopyProxyDictionaryWithOptions(const __CFURL *a1, const void *a2)
{
  int v4 = isRestoreOS();

  return _RPCopyProxyDictionaryWithOptions(a1, v4, a2, v5, v6, v7, v8, v9);
}

uint64_t _RPRegisterForAvailability(int a1, const void *a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  if (!a2) {
    return 0;
  }
  CommandDictionaryWithArgs = createCommandDictionaryWithArgs(@"RegisterNotify", (int)a2, a3, a4, a5, a6, a7, a8, 0, v19);
  uint64_t v11 = _RPRegistrationConnectAndSendMessage(a1, CommandDictionaryWithArgs);
  if (v11)
  {
    BOOL v12 = _Block_copy(a2);
    RPSocket::set_client(*(RPSocket **)(v11 + 16), (uint64_t)_RPRegistrationCallback, v12, v13, v14, v15, v16, v17);
    _Block_release(v12);
  }
  if (CommandDictionaryWithArgs) {
    CFRelease(CommandDictionaryWithArgs);
  }
  return v11;
}

uint64_t _RPRegistrationConnectAndSendMessage(int a1, const void *a2)
{
  if (a1) {
    unsigned int v3 = 1084;
  }
  else {
    unsigned int v3 = 1083;
  }
  uint64_t v4 = RPCreateSocketForHost(v3);
  uint64_t v5 = v4;
  if (v4)
  {
    RPSocket::resume(*(RPSocket **)(v4 + 16));
    if ((RPSocketWriteDictionary(v5, a2, v6, v7, v8, v9, v10, v11) & 1) == 0)
    {
      (*(void (**)(void))(**(void **)(v5 + 16) + 32))(*(void *)(v5 + 16));
      RPRelease(v5);
      return 0;
    }
  }
  return v5;
}

uint64_t _RPRegistrationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 == 2)
  {
    int v15 = -1;
    uint64_t result = RPSocketReadBuffer(a1, (uint64_t)&v15, 4, a4, a5, a6, a7, a8);
    if (result && v15 != -1)
    {
      if (v15) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      BOOL v12 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 16);
      return v12(a3, v11);
    }
    if (!a1) {
      return result;
    }
    goto LABEL_16;
  }
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  if (getDefaultLogCtx_ctx && *(int *)(getDefaultLogCtx_ctx + 16) >= 3) {
    LogMsg(3u, getDefaultLogCtx_ctx, (uint64_t)"ReverseProxyDevice.c", 268, (uint64_t)"_RPRegistrationCallback", 0, @"unexpected event %lu\n", a8, a2);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3);
  if (a1)
  {
LABEL_16:
    uint64_t v14 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 32);
    return v14();
  }
  return result;
}

uint64_t RPRegisterForAvailability(const void *a1)
{
  int v2 = isRestoreOS();

  return _RPRegisterForAvailability(v2, a1, v3, v4, v5, v6, v7, v8);
}

uint64_t RPRegistrationResume(uint64_t a1)
{
  return RPSocket::resume(*(RPSocket **)(a1 + 16));
}

uint64_t RPRegistrationInvalidate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  RPSocket::set_client(*(RPSocket **)(a1 + 16), 0, 0, a4, a5, a6, a7, a8);
  uint64_t v9 = *(uint64_t (**)(void))(**(void **)(a1 + 16) + 32);

  return v9();
}

void _RPSetLogLevel(int a1, int a2, int a3, int a4, int a5, int a6, int a7, uint64_t a8)
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2000000000;
  uint64_t v30 = 0;
  if (getDefaultLogCtx_once != -1) {
    dispatch_once_f(&getDefaultLogCtx_once, &getDefaultLogCtx_ctx, (dispatch_function_t)InitLog);
  }
  uint64_t v10 = getDefaultLogCtx_ctx;
  if (a2 >= 7) {
    LODWORD(v11) = 7;
  }
  else {
    LODWORD(v11) = a2;
  }
  if (a2 < 0) {
    LODWORD(v11) = 0;
  }
  if (a2 == -1) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = v11;
  }
  *(_DWORD *)(getDefaultLogCtx_ctx + 16) = v11;
  if (v11 >= 3)
  {
    uint64_t v25 = LevelString_levelName[v11];
    LogMsg(3u, v10, (uint64_t)"Logging.c", 111, (uint64_t)"SetDefaultLogLevel", 0, @"set default log level to %d (%s)\n", a8, v11);
  }
  CommandDictionaryWithArgs = createCommandDictionaryWithArgs(@"SetLogLevel", v10, a3, a4, a5, a6, a7, a8, 0, (uint64_t)v25);
  setDictionaryIntValue(CommandDictionaryWithArgs, @"Level", a2);
  uint64_t v13 = _RPRegistrationConnectAndSendMessage(a1, CommandDictionaryWithArgs);
  if (v13)
  {
    uint64_t v14 = v13;
    int v15 = dispatch_queue_create("com.apple.PurpleReverseProxy.SetLogLevel", 0);
    uint64_t v16 = dispatch_semaphore_create(0);
    v28[3] = (uint64_t)v16;
    uint64_t v17 = *(void *)(v14 + 16);
    RPSocket::suspend((RPSocket *)v17);
    pthread_mutex_lock((pthread_mutex_t *)(v17 + 136));
    uint64_t v18 = *(NSObject **)(v17 + 48);
    if (v18) {
      dispatch_release(v18);
    }
    if (v15)
    {
      *(void *)(v17 + 48) = v15;
      dispatch_retain(v15);
    }
    else
    {
      *(void *)(v17 + 48) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v17 + 136));
    RPSocket::resume((RPSocket *)v17);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___RPSetLogLevel_block_invoke;
    aBlock[3] = &unk_264239068;
    aBlock[4] = &v27;
    uint64_t v19 = _Block_copy(aBlock);
    RPSocket::set_client(*(RPSocket **)(v14 + 16), (uint64_t)BlockInvoker, v19, v20, v21, v22, v23, v24);
    _Block_release(v19);
    RPSocket::resume(*(RPSocket **)(v14 + 16));
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    (*(void (**)(void))(**(void **)(v14 + 16) + 32))(*(void *)(v14 + 16));
    RPRelease(v14);
    if (CommandDictionaryWithArgs) {
      goto LABEL_22;
    }
  }
  else
  {
    int v15 = 0;
    uint64_t v16 = 0;
    if (CommandDictionaryWithArgs) {
LABEL_22:
    }
      CFRelease(CommandDictionaryWithArgs);
  }
  if (v16) {
    dispatch_release(v16);
  }
  if (v15) {
    dispatch_release(v15);
  }
  _Block_object_dispose(&v27, 8);
}

void RPSetLogLevel(int a1)
{
  int v2 = isRestoreOS();

  _RPSetLogLevel(v2, a1, v3, v4, v5, v6, v7, v8);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5330](anURL);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x270F95FA8]();
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

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x270ED8648](client, msg, *(void *)&level, format);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t csops()
{
  return MEMORY[0x270ED9150]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int isatty(int a1)
{
  return MEMORY[0x270ED9EF0](*(void *)&a1);
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x270ED9F60](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

void os_release(void *object)
{
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x270EDB480](*(void *)&a1, *(void *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}