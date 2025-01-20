_DWORD *sub_100002CF0(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_10000A124(result[3], result[2]);
    *(_DWORD *)(a2 + 32) = result;
    v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 56;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100002D74(int a1, const char *a2, int a3)
{
  __int16 v3 = a3;
  uint64_t v4 = openat(a1, a2, a3, 420);
  if (qword_10003E9B8 == -1)
  {
    if ((v3 & 0x200) == 0) {
      return v4;
    }
  }
  else
  {
    dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
    if ((v3 & 0x200) == 0) {
      return v4;
    }
  }
  if (byte_10003E9C0 && v4 != -1)
  {
    uint64_t v9 = 0;
    long long v8 = xmmword_100027DD0;
    if (sub_100012FF8()) {
      int v5 = 3;
    }
    else {
      int v5 = 2;
    }
    int v7 = v5;
    if (fsetattrlist(v4, &v8, &v7, 4uLL, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
  }
  return v4;
}

uint64_t sub_100002E78()
{
  uint64_t result = dword_10003034C;
  if ((dword_10003034C & 0x80000000) == 0)
  {
    uint64_t result = _os_trace_write();
    if (result == -1)
    {
      __error();
      return _os_assumes_log();
    }
  }
  return result;
}

uint64_t sub_100002EBC(uint64_t result)
{
  uint64_t v1 = result;
  if ((*(_DWORD *)(result + 68) & 0x80000000) != 0) {
    goto LABEL_5;
  }
  sub_100012D80(result);
  uint64_t result = close(*(_DWORD *)(v1 + 68));
  if (result == -1)
  {
    int v6 = *__error();
    uint64_t result = *__error();
    if (v6 == 9) {
      goto LABEL_9;
    }
    uint64_t result = _os_assumes_log();
  }
  *(_DWORD *)(v1 + 68) = -1;
  int v2 = *(_DWORD *)(v1 + 64);
  BOOL v3 = __OFADD__(v2, 1);
  int v4 = v2 + 1;
  if (!v3)
  {
    *(_DWORD *)(v1 + 64) = v4;
    unint64_t v5 = *(void *)(v1 + 40);
    if (!__OFADD__(atomic_fetch_add_explicit((atomic_ullong *volatile)(v1 + 56), v5, memory_order_relaxed), v5))
    {
LABEL_5:
      *(void *)(v1 + 40) = 0;
      *(_OWORD *)(v1 + 72) = xmmword_100027C80;
      return result;
    }
  }
  __break(0x5500u);
LABEL_9:
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

void sub_100002F84(_xpc_connection_s *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_100004C50;
  v2[3] = &unk_10002D9B0;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_10003E8F0);
  xpc_connection_activate(a1);
}

void sub_100003040(uint64_t a1)
{
  dispatch_suspend((dispatch_object_t)qword_100030280);
  off_1000302A8 = (_UNKNOWN *)a1;
  int v2 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001325C;
  block[3] = &unk_10002CE28;
  block[4] = a1;
  dispatch_group_async(v2, (dispatch_queue_t)qword_100030298, block);
  dispatch_group_notify_f(*(dispatch_group_t *)(a1 + 8), (dispatch_queue_t)qword_100030288, (void *)a1, (dispatch_function_t)sub_100003838);
}

BOOL sub_1000030F4(_xpc_connection_s *a1, xpc_object_t xdict)
{
  xpc_object_t array = xpc_dictionary_get_array(xdict, "entries");
  char uint64 = xpc_dictionary_get_uint64(xdict, "ttl");
  uint64_t v6 = xpc_dictionary_get_uint64(xdict, "aid");
  BOOL result = xpc_dictionary_get_BOOL(xdict, "quarantined");
  if (result) {
    char v8 = 3;
  }
  else {
    char v8 = 1;
  }
  if (array)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v25 = v9;
    long long v26 = v9;
    long long v23 = v9;
    long long v24 = v9;
    long long v22 = v9;
    memset(__b, 170, sizeof(__b));
    BOOL result = sub_100007468((uint64_t)a1, xdict, (uint64_t)&v22);
    if (result)
    {
      pid_t pid = xpc_connection_get_pid(a1);
      if (proc_pidpath(pid, __b, 0x400u) <= 0) {
        __b[0] = 0;
      }
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000;
      applier[2] = sub_100008124;
      applier[3] = &unk_10002D9D0;
      long long v14 = v24;
      long long v15 = v25;
      long long v16 = v26;
      long long v13 = v23;
      long long v12 = v22;
      char v19 = uint64;
      uint64_t v17 = v6;
      v18 = __b;
      char v20 = v8;
      return xpc_array_apply(array, applier);
    }
  }
  return result;
}

void sub_100003298(const void *a1)
{
  int v2 = malloc_type_malloc(0x10uLL, 0xA0040BD48D6D6uLL);
  *int v2 = _Block_copy(a1);
  v2[1] = dispatch_group_create();
  BOOL v3 = qword_100030280;

  dispatch_async_f(v3, v2, (dispatch_function_t)sub_100003040);
}

void sub_100003314()
{
  v0 = (void *)_os_trace_calloc();
  v0[8] = 0;
  v0[9] = v0 + 8;
  v0[1] = -1;
  operator new();
}

void sub_100003384(id a1)
{
  if (byte_10003E89D == 1)
  {
    os_map_str_clear();
    word_10003E8B8 = ~word_10003E8B8 | 0xFFFE;
  }
}

void sub_1000033D0(uint64_t *a1)
{
  os_unfair_lock_lock_with_options();
  sub_10000C9A8(qword_10003E8E0, a1);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003E8D8);
}

void sub_100003428(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100013430;
    block[3] = &unk_10002DA70;
    block[4] = a1;
    dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
  }
  else
  {
    dispatch_block_t v3 = 0;
  }
  int v4 = *(NSObject **)a1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_1000133DC;
  v5[3] = &unk_10002DA98;
  v5[5] = a1;
  v5[6] = v2;
  v5[4] = v3;
  dispatch_sync(v4, v5);
  if (v2)
  {
    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    _Block_release(v3);
  }
}

uint64_t sub_100003558(uint64_t a1, int a2)
{
  if (0x10000 % vm_page_size)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
LABEL_13:
    __break(0x5513u);
    goto LABEL_14;
  }
  *(void *)(a1 + 1128) = 0x4FFFFFFFFLL;
  *(_DWORD *)(a1 + 1104) = 15;
  *(void *)(a1 + 1120) = 0x40000;
  uint64_t result = mach_vm_map(mach_task_self_, (mach_vm_address_t *)(a1 + 1112), 0x40000uLL, 0, 1308622849, 0, 0, 0, 3, 3, 2u);
  if (!result)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    while (v5 <= ~(a1 + 48))
    {
      uint64_t v7 = a1 + v5;
      *(void *)(v7 + 296) = 0x10000;
      *(_DWORD *)(v7 + 304) = 0;
      *(void *)(v7 + 288) = v6 + *(void *)(a1 + 1112);
      v6 += 0x10000;
      v5 += 264;
      if (v6 == 0x40000)
      {
        uint64_t v8 = *(void *)(a1 + 8);
        int v9 = a2 / 0x20000;
        if (a2 / 0x20000 <= 1) {
          int v9 = 1;
        }
        *(_DWORD *)(a1 + 1168) = 0;
        if (v8) {
          int v10 = 1;
        }
        else {
          int v10 = v9;
        }
        *(_DWORD *)(a1 + 1172) = v10;
        *(void *)(a1 + 1144) = 0;
        *(void *)(a1 + 1136) = _os_trace_calloc();
        sub_100003314();
      }
    }
    goto LABEL_13;
  }
LABEL_14:
  qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Allocating buffer failed";
  qword_100031F78 = (int)result;
  __break(1u);
  return result;
}

void sub_1000037AC(uint64_t a1)
{
  sub_10001196C(a1);
  sub_100012F78(*(void ***)(a1 + 16));
  uint64_t v2 = *(void *)(a1 + 24);
  sub_100011C34(v2);
  if (v2)
  {
    sub_100011C94(*(void ***)(v2 + 16));
    dispatch_block_t v3 = *(void **)v2;
    *(void *)uint64_t v2 = 0;
    if (v3) {
      operator delete(v3);
    }
    operator delete();
  }
  sub_10000544C(*(void ***)(a1 + 40), 0);

  free((void *)a1);
}

void sub_100003838(dispatch_object_t *a1)
{
  ((void (*)(void))(*a1)[2].isa)();
  off_1000302A8 = 0;
  dispatch_release(a1[1]);
  _Block_release(*a1);
  free(a1);
  uint64_t v2 = qword_100030280;

  dispatch_resume(v2);
}

void sub_1000038B0(uint64_t a1, unsigned int a2)
{
  os_unfair_lock_lock_with_options();
  int v4 = (atomic_ushort *)off_1000302D0;
  if (off_1000302D0)
  {
    int v5 = 0;
    int v6 = 1 << a2;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      if (!*((unsigned char *)v4 + 144))
      {
        if (*((_DWORD *)v4 + 32))
        {
          uint64_t v8 = (unsigned __int16)v4[70];
          while (1)
          {
            int v9 = (256 << a2) & (unsigned __int16)v8;
            int v10 = (unsigned __int16)(v6 & v8);
            if (v9 | v10) {
              break;
            }
            uint64_t v11 = v8;
            atomic_compare_exchange_strong_explicit(v4 + 70, (unsigned __int16 *)&v11, v8 | v6, memory_order_relaxed, memory_order_relaxed);
            BOOL v12 = v11 == (unsigned __int16)v8;
            uint64_t v8 = v11;
            if (v12)
            {
              uint64_t v13 = *((unsigned __int8 *)v4 + 147);
LABEL_10:
              uint64_t v14 = (2 * v13) | a2;
              *(void *)&v4[4 * a2 + 16] = 0;
              long long v15 = &dword_100030270[4 * v14];
              *(void *)(StatusReg + 976) = v15 + 32;
              unint64_t v16 = atomic_exchange_explicit((atomic_ullong *volatile)v15 + 16, (unint64_t)v4, memory_order_release);
              if (v16)
              {
                *(void *)(v16 + 8 * a2 + 32) = v4;
                *(void *)(StatusReg + 976) = 0;
              }
              else
              {
                *((void *)v15 + 15) = v4;
                *(void *)(StatusReg + 976) = 0;
                dispatch_source_merge_data(*(dispatch_source_t *)&dword_100030270[2 * v14 + 46], 1uLL);
              }
              goto LABEL_12;
            }
          }
          if (v9) {
            goto LABEL_15;
          }
          uint64_t v13 = *((unsigned __int8 *)v4 + 147);
          if (!v10) {
            goto LABEL_10;
          }
        }
LABEL_12:
        ++v5;
        if (a2) {
          *((unsigned char *)v4 + 145) = 1;
        }
        else {
          *((unsigned char *)v4 + 146) = 1;
        }
      }
LABEL_15:
      int v4 = (atomic_ushort *)*((void *)v4 + 2);
    }
    while (v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000302E0);
    if (v5) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 8) + 48), -4 * v5, memory_order_relaxed);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000302E0);
  }
}

size_t sub_100003A4C(char *a1, size_t a2, void *a3)
{
  id v5 = a3;
  if (!+[NSJSONSerialization isValidJSONObject:v5])
  {
    memset(__b, 170, sizeof(__b));
    id v12 = [v5 description];
    snprintf(__b, 0x400uLL, "JSON serialization would not work for record: %s", (const char *)[v12 UTF8String]);

    sub_100016E68((uint64_t)__b);
    size_t v11 = 0;
LABEL_19:

    return v11;
  }
  id v17 = 0;
  int v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v17];
  id v7 = v17;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    memset(__b, 170, sizeof(__b));
    id v10 = [v5 description];
    snprintf(__b, 0x400uLL, "JSON serialization failed for record: %s", (const char *)[v10 UTF8String]);

    sub_100016E68((uint64_t)__b);
    size_t v11 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v13 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
  size_t result = strlcpy(a1, (const char *)[v13 UTF8String], a2);
  size_t v15 = result;
  size_t v11 = result + 1;
  if (result >= a2 || v11 >= a2)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "JSON of length %zd is too long, prefix: %.64s...", v15, a1);
    sub_100016E68((uint64_t)__b);
    size_t v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (result <= ~(unint64_t)a1)
  {
    a1[result] = 10;
    if (result < ~(unint64_t)a1)
    {
      a1[v11] = 0;
      goto LABEL_17;
    }
  }
  __break(0x5513u);
  return result;
}

BOOL sub_100003C74(id a1, const char *a2, void *a3)
{
  return 1;
}

void sub_100003C94(unint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(a1 + 96));
  dispatch_suspend(*(dispatch_object_t *)(a1 + 96));
  LOWORD(v2) = *(_WORD *)(a1 + 140);
  while (1)
  {
    int v3 = (unsigned __int16)v2;
    if ((v2 & 0x101) != 0) {
      break;
    }
    int v2 = (unsigned __int16)v2;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(a1 + 140), (unsigned __int16 *)&v2, v2 | 1, memory_order_relaxed, memory_order_relaxed);
    if (v2 == v3) {
      goto LABEL_4;
    }
  }
  if ((v2 & 0x100) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = *(unsigned __int8 *)(a1 + 147);
  if (a1 && (v3 & 1) == 0)
  {
    *(void *)(a1 + 32) = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 976) = &dword_100030270[8 * v4 + 32];
    unint64_t v6 = atomic_exchange_explicit((atomic_ullong *volatile)&dword_100030270[8 * v4 + 32], a1, memory_order_release);
    if (v6)
    {
      *(void *)(v6 + 32) = a1;
      *(void *)(StatusReg + 976) = 0;
    }
    else
    {
      *(void *)&dword_100030270[8 * v4 + 30] = a1;
      *(void *)(StatusReg + 976) = 0;
      dispatch_source_merge_data(*(dispatch_source_t *)&dword_100030270[4 * v4 + 46], 1uLL);
    }
  }
LABEL_8:
  LOWORD(v7) = *(_WORD *)(a1 + 140);
  while (1)
  {
    int v8 = (unsigned __int16)v7;
    if ((v7 & 0x202) != 0) {
      break;
    }
    int v7 = (unsigned __int16)v7;
    atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(a1 + 140), (unsigned __int16 *)&v7, v7 | 2, memory_order_relaxed, memory_order_relaxed);
    if (v7 == v8) {
      goto LABEL_11;
    }
  }
  if ((v7 & 0x200) != 0) {
    return;
  }
LABEL_11:
  uint64_t v9 = 3;
  if (!*(unsigned char *)(a1 + 147)) {
    uint64_t v9 = 1;
  }
  if (a1 && (v8 & 2) == 0)
  {
    *(void *)(a1 + 40) = 0;
    unint64_t v10 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(v10 + 976) = &dword_100030270[4 * v9 + 32];
    unint64_t v11 = atomic_exchange_explicit((atomic_ullong *volatile)&dword_100030270[4 * v9 + 32], a1, memory_order_release);
    if (v11)
    {
      *(void *)(v11 + 40) = a1;
      *(void *)(v10 + 976) = 0;
    }
    else
    {
      *(void *)&dword_100030270[4 * v9 + 30] = a1;
      *(void *)(v10 + 976) = 0;
      id v12 = *(NSObject **)&dword_100030270[2 * v9 + 46];
      dispatch_source_merge_data(v12, 1uLL);
    }
  }
}

void sub_100003DF8(uint64_t a1)
{
  memset(__b, 170, sizeof(__b));
  sub_100012264((unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), 1u, __b);
  if (!utimes(__b, 0)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2088) = 1;
  }
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if ((v2 & 8) == 0)
  {
    if (!*(unsigned char *)(v3 + 2088))
    {
      if ((v2 & 2) != 0)
      {
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        xpc_object_t v5 = v11;
        uint64_t v12 = 2;
      }
      else
      {
        if ((v2 & 0x400) == 0)
        {
          uint64_t v4 = *(void **)(a1 + 40);
          xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_uint64(v5, "operation", 4uLL);
          xpc_dictionary_set_string(v5, "path", (const char *)(v3 + 40));
          xpc_dictionary_set_uuid(v5, "uuid", (const unsigned __int8 *)(v3 + 24));
          if (v4) {
            xpc_dictionary_set_value(v5, "sections", v4);
          }
          if ((v2 & 0x200) != 0) {
            xpc_dictionary_set_BOOL(v5, "fake_uuid", 1);
          }
          if ((v2 & 4) == 0) {
            goto LABEL_23;
          }
          xpc_dictionary_set_string(v5, "role", (const char *)(v3 + 1064));
          unint64_t v6 = "ftab";
          int v7 = v5;
          BOOL v8 = 1;
          goto LABEL_19;
        }
        xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
        xpc_object_t v5 = v11;
        uint64_t v12 = 11;
      }
      xpc_dictionary_set_uint64(v11, "operation", v12);
      xpc_dictionary_set_uuid(v5, "uuid", (const unsigned __int8 *)(v3 + 24));
      goto LABEL_23;
    }
LABEL_15:
    unsigned int v9 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)(v3 + 2088))
  {
    if (sub_10000C570((void *)(v3 + 24))) {
      goto LABEL_15;
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v10 = *(unsigned char *)(v3 + 2088) != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "operation", 5uLL);
  xpc_dictionary_set_uuid(v5, "uuid", (const unsigned __int8 *)(v3 + 24));
  xpc_dictionary_set_string(v5, "path", (const char *)(v3 + 40));
  xpc_dictionary_set_string(v5, "role", (const char *)(v3 + 1064));
  unint64_t v6 = "coproc_free_only";
  int v7 = v5;
  BOOL v8 = v10;
LABEL_19:
  xpc_dictionary_set_BOOL(v7, v6, v8);
LABEL_23:
  unsigned int v9 = sub_100004124(v5, 1);
  xpc_release(v5);
LABEL_24:
  if (*(void *)(a1 + 40))
  {
    os_release(*(void **)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }
  if (!v9 || (*(unsigned char *)(a1 + 56) & 4) != 0)
  {
    id v13 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    sub_1000033D0(v13);
  }
}

xpc_type_t sub_100004124(xpc_object_t message, int a2)
{
  if (qword_10003E800 != -1) {
    dispatch_once(&qword_10003E800, &stru_10002D3A8);
  }
  uint64_t v4 = (_xpc_connection_s *)qword_10003E7F8;
  while (1)
  {
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, message);
    unint64_t v6 = v5;
    if (v5 != &_xpc_error_connection_interrupted) {
      break;
    }
    if (__OFSUB__(a2, 1)) {
      __break(0x5515u);
    }
    if (a2-- <= 0)
    {
      BOOL v8 = &_xpc_error_connection_interrupted;
      goto LABEL_10;
    }
  }
  BOOL v8 = v5;
LABEL_10:
  xpc_type_t result = xpc_get_type(v8);
  if (result == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64_t int64 = xpc_dictionary_get_int64(v8, "status");
LABEL_16:
    xpc_release(v8);
    return (xpc_type_t)int64;
  }
  if (result == (xpc_type_t)&_xpc_type_error)
  {
    memset(__b, 170, sizeof(__b));
    string = xpc_dictionary_get_string(v8, _xpc_error_key_description);
    snprintf(__b, 0x400uLL, "Error connecting to logd_helper: %s", string);
    sub_100016E68((uint64_t)__b);
    if (v6 == &_xpc_error_connection_interrupted) {
      int64_t int64 = 35;
    }
    else {
      int64_t int64 = 22;
    }
    goto LABEL_16;
  }
  qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
  qword_100031F78 = (uint64_t)result;
  __break(1u);
  return result;
}

void sub_1000042C8(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (!reply) {
    return;
  }
  uint64_t v4 = reply;
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  xpc_object_t v5 = (const char *)qword_10003E998;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v20 = v6;
  long long v21 = v6;
  xpc_connection_get_audit_token();
  int v7 = open(v5, 0);
  if (v7 == -1)
  {
    __error();
  }
  else
  {
    int v8 = v7;
    xpc_dictionary_set_fd(v4, "persistdir_fd", v7);
    if (close(v8) != -1) {
      goto LABEL_6;
    }
    int v16 = *__error();
    uint64_t v17 = *__error();
    if (v16 == 9)
    {
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = v17;
      __break(1u);
      goto LABEL_32;
    }
  }
  _os_assumes_log();
LABEL_6:
  unsigned int v9 = (char *)sandbox_extension_issue_file_to_process();
  if (v9) {
    xpc_dictionary_set_string(v4, "persistdir_sbext", v9);
  }
  free(v9);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  int v10 = open((const char *)qword_10003E9A0, 0, v20, v21);
  if (v10 == -1)
  {
    __error();
    goto LABEL_28;
  }
  int v11 = v10;
  xpc_dictionary_set_fd(v4, "timesyncdir_fd", v10);
  if (close(v11) != -1) {
    goto LABEL_12;
  }
  int v18 = *__error();
  uint64_t v17 = *__error();
  if (v18 == 9)
  {
LABEL_32:
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v17;
    __break(1u);
    goto LABEL_33;
  }
LABEL_28:
  _os_assumes_log();
LABEL_12:
  uint64_t v12 = (char *)sandbox_extension_issue_file_to_process();
  if (v12) {
    xpc_dictionary_set_string(v4, "timesyncdir_sbext", v12);
  }
  free(v12);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  int v13 = open((const char *)qword_10003E9A8, 0, v20, v21);
  if (v13 == -1)
  {
    __error();
LABEL_30:
    _os_assumes_log();
    goto LABEL_18;
  }
  int v14 = v13;
  xpc_dictionary_set_fd(v4, "uuidtextdir_fd", v13);
  if (close(v14) == -1)
  {
    int v19 = *__error();
    uint64_t v17 = *__error();
    if (v19 != 9) {
      goto LABEL_30;
    }
LABEL_33:
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v17;
    __break(1u);
    return;
  }
LABEL_18:
  size_t v15 = (char *)sandbox_extension_issue_file_to_process();
  if (v15) {
    xpc_dictionary_set_string(v4, "uuidtextdir_sbext", v15);
  }
  free(v15);
  xpc_connection_send_message(a1, v4);
  xpc_release(v4);
}

void sub_100004668(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40) + 16;
  sub_100008058(*(void *)(a1 + 256), *(const void **)(a1 + 264), &v1);
}

uint64_t sub_1000046CC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 5 && *(_DWORD *)(result + 4) == 112)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned __int16 *)(result + 50) << 16 == 0x100000
      && *(unsigned __int16 *)(result + 62) << 16 == 0x100000
      && *(unsigned __int16 *)(result + 74) << 16 == 1114112
      && *(unsigned __int16 *)(result + 86) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 112) && *(_DWORD *)(result + 116) > 0x1Fu)
      {
        uint64_t v4 = *(unsigned int *)(result + 12);
        mem_entry_name_port_t v5 = *(_DWORD *)(result + 28);
        int v6 = *(_DWORD *)(result + 40);
        int v7 = *(_DWORD *)(result + 52);
        int v8 = *(_DWORD *)(result + 64);
        mach_port_name_t v9 = *(_DWORD *)(result + 76);
        uint64_t v10 = *(void *)(result + 96);
        mach_vm_size_t v11 = *(void *)(result + 104);
        long long v12 = *(_OWORD *)(result + 148);
        v13[0] = *(_OWORD *)(result + 132);
        v13[1] = v12;
        xpc_type_t result = sub_1000047E4(v4, v5, v10, v6, v7, v8, v9, v11, v13);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      int v3 = -309;
    }
    else
    {
      int v3 = -300;
    }
  }
  else
  {
    int v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000047E4(uint64_t a1, mem_entry_name_port_t a2, uint64_t a3, int a4, int a5, int a6, mach_port_name_t a7, mach_vm_size_t a8, _DWORD *a9)
{
  kern_return_t v17;
  uint64_t v18;
  kern_return_t v19;
  kern_return_t v20;
  mach_vm_address_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  char v29;
  char v30;
  mach_port_name_t v31;
  uint64_t v32;
  kern_return_t v33;
  uint64_t f;
  uint64_t *v35;
  vm_address_t v36[2];
  vm_size_t size;
  mach_vm_address_t address;
  mach_vm_address_t v39[2];
  _DWORD v40[2];

  *(_OWORD *)v36 = xmmword_100027B60;
  size = 0;
  address = 0;
  if (dispatch_mach_mig_demux_get_context()) {
    return 5;
  }
  if (a3 != 0x40000) {
    return 18;
  }
  uint64_t v17 = mach_vm_map(mach_task_self_, &address, 0x40000uLL, 0, 1, a2, 0, 0, 1, 1, 2u);
  if (v17 == -301) {
    sub_100025BCC();
  }
  if (v17)
  {
    _dispatch_bug();
    return 3;
  }
  if (a7)
  {
    if (!a8)
    {
LABEL_12:
      int v19 = mach_port_deallocate(mach_task_self_, a7);
      if (v19 == -301) {
        sub_100025BCC();
      }
      if (v19) {
        _dispatch_bug();
      }
      goto LABEL_16;
    }
    v39[0] = 0;
    int v18 = mach_vm_map(mach_task_self_, v39, a8, 0, 1, a7, 0, 1, 1, 1, 2u);
    if (!v18)
    {
      v36[1] = v39[0];
      size = a8;
      goto LABEL_12;
    }
    sub_100025C1C(v18, &address);
    return 3;
  }
LABEL_16:
  long long v20 = mach_port_deallocate(mach_task_self_, a2);
  if (v20 == -301) {
    sub_100025BCC();
  }
  if (v20) {
    _dispatch_bug();
  }
  long long v21 = address;
  long long v22 = _os_object_alloc_realized();
  long long v23 = v22;
  long long v24 = 0;
  *(void *)(v22 + 48) = v21;
  *(void *)(v22 + 64) = *(void *)(v21 + 464);
  *(void *)(v22 + 56) = *(void *)(v22 + 64);
  *(void *)(v22 + 80) = *(void *)(v21 + 488);
  *(void *)(v22 + 72) = *(void *)(v22 + 80);
  long long v25 = a9[5];
  if (!v25) {
    long long v25 = -1;
  }
  long long v26 = a9[1];
  v27 = a9[7];
  *(_DWORD *)(v22 + 128) = v25;
  *(_DWORD *)(v22 + 132) = v27;
  *(_DWORD *)(v22 + 136) = v26;
  v40[0] = a4;
  v40[1] = a5;
  v39[0] = qword_100030298;
  v39[1] = qword_100030288;
  *(unsigned char *)(v22 + 142) = 2;
  v28 = v22 + 96;
  v29 = 1;
  do
  {
    v30 = v29;
    v31 = v40[v24];
    v32 = v23 + 4 * v24;
    *(_DWORD *)(v32 + 112) = v31;
    v33 = mach_port_guard(mach_task_self_, v31, v32 + 112, 1);
    if (v33 == -301) {
      sub_100025BCC();
    }
    if (v33) {
      _dispatch_bug();
    }
    f = dispatch_mach_create_f();
    v29 = 0;
    *(void *)(v28 + 8 * v24) = f;
    long long v24 = 1;
  }
  while ((v30 & 1) != 0);
  *(_DWORD *)(v23 + 120) = a6;
  dispatch_mach_notify_no_senders();
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100030298);
  os_unfair_lock_lock_with_options();
  *(void *)(v23 + 16) = 0;
  v35 = (uint64_t *)off_1000302D8;
  *(void *)(v23 + 24) = off_1000302D8;
  *v35 = v23;
  off_1000302D8 = (_UNKNOWN **)(v23 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000302E0);
  (*((void (**)(void *, uint64_t, uint64_t, vm_address_t *, void))off_1000302A0 + 2))(off_1000302A0, v23, 1, v36, 0);
  if (*(_DWORD *)(v23 + 128))
  {
    dispatch_mach_connect();
    dispatch_mach_connect();
  }
  else
  {
    dispatch_activate(*(dispatch_object_t *)(v23 + 96));
  }
  if (size) {
    vm_deallocate(mach_task_self_, v36[1], size);
  }
  return 0;
}

void sub_100004B84(NSObject *a1)
{
  if ((dispatch_source_get_mask(a1) & 0x21) != 0)
  {
    sub_10000755C();
  }
  else
  {
    uint64_t v1 = qword_10003E948;
    dispatch_source_merge_data(v1, 1uLL);
  }
}

void sub_100004BDC(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100005658((_xpc_connection_s *)a2);
  }
  else
  {
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_100031F78 = (uint64_t)type;
    __break(1u);
  }
}

#error "100004D14: switch analysis failed: switch information is incomplete or incorrect (funcsize=60)"

uint64_t sub_100004D50(NSObject *a1)
{
  int handle = dispatch_source_get_handle(a1);
  uint64_t result = close(handle);
  if (result == -1)
  {
    int v3 = *__error();
    uint64_t result = *__error();
    if (v3 == 9)
    {
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = result;
      __break(1u);
    }
    else
    {
      return _os_assumes_log();
    }
  }
  return result;
}

tm *sub_100004DC4(tm *result, time_t a2)
{
  time_t v17 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    goto LABEL_9;
  }
  int v2 = result;
  if ((result->tm_year & 2) == 0)
  {
    v16.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.tm_mon = v3;
    *(_OWORD *)&v16.tm_isdst = v3;
    *(_OWORD *)&v16.tm_sec = v3;
    uint64_t result = localtime_r(&v17, &v16);
    if (result)
    {
      if (!__OFADD__(v16.tm_year, 1900) && !__OFADD__(v16.tm_mon, 1))
      {
        sub_1000054CC(v2, "%04d-%02d-%02d %02d:%02d:%02d", v4, v5, v6, v7, v8, v9, LOBYTE(v16.tm_year) + 108);
        return (tm *)sub_1000054CC(v2, "%+05ld", v10, v11, v12, v13, v14, v15, (v16.tm_gmtoff / 60 % 60) + 100 * (v16.tm_gmtoff / 3600));
      }
LABEL_9:
      __break(0x5500u);
    }
  }
  return result;
}

void sub_100004F1C(_xpc_connection_s *a1, xpc_object_t xdict)
{
  if (qword_10003E7D8 != -1) {
    dispatch_once(&qword_10003E7D8, &stru_10002D1E0);
  }
  unsigned int uint64 = xpc_dictionary_get_uint64(xdict, "logd_snapshot_flags");
  int v5 = xpc_dictionary_dup_fd(xdict, "snapshot_file_descriptor");
  if (v5 < 0)
  {
    sub_100008E4C(a1, xdict, 22);
  }
  else
  {
    int v6 = v5;
    memset(&v57[0].tm_wday, 170, 0x400uLL);
    pid_t pid = xpc_connection_get_pid(a1);
    if (proc_pidpath(pid, &v57[0].tm_wday, 0x400u) <= 0) {
      strcpy((char *)&v57[0].tm_wday, "<unknown>");
    }
    time_t v8 = time(0);
    memset(v63, 170, sizeof(v63));
    *(void *)&v57[0].tm_mon = 0xAA00000000000000;
    *(void *)&v57[0].tm_sec = v63;
    *(void *)&v57[0].int tm_hour = 0x40000000000;
    sub_1000054CC(v57, "--- !logd snapshot record\n", v9, v10, v11, v12, v13, v14, v52);
    sub_1000054CC(v57, "client : %s\n", v15, v16, v17, v18, v19, v20, (char)&v57[0].tm_wday);
    sub_1000054CC(v57, "time   : ", v21, v22, v23, v24, v25, v26, v53);
    sub_100004DC4(v57, v8);
    LOBYTE(__src[0]) = 10;
    if ((v57[0].tm_year & 2) == 0)
    {
      char v33 = BYTE2(v57[0].tm_year);
      int tm_hour = v57[0].tm_hour;
      if (SBYTE2(v57[0].tm_year) + v57[0].tm_mday - 1 == v57[0].tm_hour)
      {
        sub_1000095FC((uint64_t)v57, __src, 1uLL);
      }
      else
      {
        uint64_t v35 = *(void *)&v57[0].tm_sec;
        unint64_t v36 = ~*(void *)&v57[0].tm_sec;
        if (~*(void *)&v57[0].tm_sec < (unint64_t)v57[0].tm_hour) {
          goto LABEL_27;
        }
        *(unsigned char *)(*(void *)&v57[0].tm_sec + v57[0].tm_hour) = 10;
        uint64_t v37 = (tm_hour + 1);
        v57[0].int tm_hour = v37;
        if (!v33)
        {
          if (v36 < v37) {
            goto LABEL_27;
          }
          *(unsigned char *)(v35 + v37) = 0;
        }
      }
    }
    char v38 = uint64 & 1;
    sub_1000054CC(v57, "flags  : 0x%llx\n\n", v27, v28, v29, v30, v31, v32, uint64);
    sub_100013074();
    if (v57[0].tm_year) {
      free(*(void **)&v57[0].tm_sec);
    }
    int v39 = (uint64 >> 1) & 1;
    __src[0] = @"logd snapshot";
    v64[0] = @"record";
    v64[1] = @"client";
    v41 = +[NSString stringWithUTF8String:&v57[0].tm_wday];
    __src[1] = v41;
    v64[2] = @"unixTime";
    v42 = +[NSNumber numberWithLong:v8];
    __src[2] = v42;
    v43 = +[NSDictionary dictionaryWithObjects:__src forKeys:v64 count:3];

    size_t v44 = sub_100003A4C(v63, 0x400uLL, v43);
    if (v44) {
      sub_1000130EC();
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003E7D0, 0xFFFFFFFFFFFFFFFFLL);
    v45 = dispatch_queue_create("com.apple.logd.snapshot", 0);
    v46 = dispatch_queue_create("com.apple.logd.snapshot.book", 0);
    v47 = dispatch_group_create();
    bzero(&v57[0].tm_gmtoff, 0x4D0uLL);
    dword_100031E84 = v6;
    qword_100031E50 = (uint64_t)v46;
    *(void *)&v57[0].tm_wday = v45;
    *(void *)&v57[0].tm_isdst = &off_100031E40;
    char v62 = 5;
    sub_100003558((uint64_t)&v57[0].tm_wday, 0x20000);
    dispatch_group_enter(v47);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 0x40000000;
    v54[2] = sub_10000AAE8;
    v54[3] = &unk_10002D260;
    char v55 = v39;
    v54[4] = v47;
    v54[5] = &v57[0].tm_wday;
    char v56 = v38;
    v54[6] = v45;
    sub_100003298(v54);
    dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
    sub_100003428((uint64_t)&v57[0].tm_wday);
    if (v61 >= 1)
    {
      uint64_t v48 = 0;
      uint64_t v49 = 272;
      while (!__CFADD__(v60, v49 - 272))
      {
        v50 = (void **)((char *)v60 + v49);
        sub_1000037AC(*(void *)((char *)v60 + v49 - 48));
        free(*v50);
        ++v48;
        v49 += 280;
        if (v48 >= v61) {
          goto LABEL_20;
        }
      }
LABEL_27:
      __break(0x5513u);
    }
LABEL_20:
    free(v60);
    mach_vm_deallocate(mach_task_self_, address, size);
    for (uint64_t i = 0; i != 1056; i += 264)
    {
      sub_10000544C(*(void ***)((char *)&v57[5].tm_mon + i), (uint64_t (*)(void))&_os_release);
      sub_10000544C(*(void ***)((char *)&v57[5].tm_wday + i), (uint64_t (*)(void))sub_100011DF0);
    }
    sub_100002EBC((uint64_t)&off_100031E40);
    qword_100031E50 = 0;
    dispatch_release(v47);
    dispatch_release(v45);
    dispatch_release(v46);
    sub_100008E4C(a1, xdict, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_10003E7D0);
  }
}

void *sub_10000544C(void **a1, uint64_t (*a2)(void))
{
  uint64_t result = sub_100011A0C(a1, a2);
  if (a1)
  {
    uint64_t v4 = a1[2];
    if (v4)
    {
      do
      {
        int v5 = (void *)*v4;
        operator delete(v4);
        uint64_t v4 = v5;
      }
      while (v5);
    }
    int v6 = *a1;
    *a1 = 0;
    if (v6) {
      operator delete(v6);
    }
    operator delete();
  }
  return result;
}

uint64_t sub_1000054CC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*((unsigned char *)a1 + 22))
  {
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0;
  }
  if ((*((_WORD *)a1 + 10) & 2) != 0) {
    return 0;
  }
  int v12 = *((_DWORD *)a1 + 2);
  int v11 = *((_DWORD *)a1 + 3);
  *__error() = 0;
  uint64_t v13 = *((unsigned int *)a1 + 2);
  if (__CFADD__(*a1, v13)) {
    goto LABEL_17;
  }
  uint64_t v14 = vsnprintf((char *)(*a1 + v13), (v11 - v12), a2, &a9);
  if ((v14 & 0x80000000) != 0)
  {
    uint64_t v18 = *((unsigned int *)a1 + 2);
    if (!__CFADD__(*a1, v18))
    {
      uint64_t v15 = 0;
      *(unsigned char *)(*a1 + v18) = 0;
      return v15;
    }
    goto LABEL_17;
  }
  uint64_t v15 = v14;
  uint64_t v16 = (v11 + ~v12);
  if (v14 > v16)
  {
    if (*((_DWORD *)a1 + 3) >= *((_DWORD *)a1 + 4)) {
      goto LABEL_9;
    }
    uint64_t v16 = sub_1000096CC((uint64_t)a1, v14);
    *__error() = 0;
    uint64_t v17 = *((unsigned int *)a1 + 2);
    if (!__CFADD__(*a1, v17))
    {
      vsnprintf((char *)(*a1 + v17), (v16 + 1), a2, &a9);
LABEL_9:
      if (v15 > v16)
      {
        *((_WORD *)a1 + 10) |= 2u;
        uint64_t v15 = v16;
      }
      goto LABEL_11;
    }
LABEL_17:
    __break(0x5513u);
  }
LABEL_11:
  *((_DWORD *)a1 + 2) += v15;
  return v15;
}

void sub_100005658(_xpc_connection_s *a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_1000065C4;
  v2[3] = &unk_10002D690;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_activate(a1);
}

void sub_100005704(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4) {
    int v5 = (dispatch_queue_t *)(v4 + 16);
  }
  else {
    int v5 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v5);
  unsigned int v6 = *(unsigned __int8 *)(a1 + 1240);
  if (v6 > 4) {
    return;
  }
  uint64_t v186 = a2;
  v190[0] = _NSConcreteStackBlock;
  v190[1] = 0x40000000;
  v190[2] = sub_100007FD4;
  v190[3] = &unk_10002D100;
  v190[4] = a1;
  char v191 = v6;
  sub_100007F5C((uint64_t)v190);
  size_t __nel = rb_tree_count((rb_tree_t *)(a1 + 1176));
  uint64_t v7 = _os_trace_calloc();
  time_t v8 = rb_tree_iterate((rb_tree_t *)(a1 + 1176), 0, 1u);
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    while (1)
    {
      int v12 = rb_tree_iterate((rb_tree_t *)(a1 + 1176), v9, 1u);
      rb_tree_remove_node((rb_tree_t *)(a1 + 1176), v9);
      if (v10 == 0x3FFFFFFF8) {
        break;
      }
      if (v10 > ~v7) {
        goto LABEL_108;
      }
      *(void *)(v7 + v10) = v9;
      v11 += v9[3];
      v10 += 8;
      uint64_t v9 = v12;
      if (!v12) {
        goto LABEL_12;
      }
    }
LABEL_109:
    __break(0x5500u);
  }
  unint64_t v11 = 0;
LABEL_12:
  unint64_t v13 = __nel;
  qsort((void *)v7, __nel, 8uLL, (int (__cdecl *)(const void *, const void *))sub_100012F28);
  unsigned int v14 = *(unsigned __int8 *)(a1 + 1240);
  uint64_t v15 = v186;
  if (v14 <= 3)
  {
    uint64_t v16 = *(uint64_t **)(a1 + 8);
    uint64_t v17 = v16[17];
    v16[16] = v17;
    __uint64_t v18 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    v16[17] = v18;
    double v19 = (double)v16[6] / ((double)(v18 - v17) / 1000000000.0);
    if (v19 <= -1.0 || v19 >= 1.84467441e19) {
      goto LABEL_110;
    }
    uint64_t v21 = &xmmword_10003E970;
    if (v14 == 3) {
      uint64_t v21 = (long long *)((char *)&xmmword_10003E970 + 8);
    }
    if (*(void *)v21 < (unint64_t)v19)
    {
      BOOL v179 = v6 == 3;
      if ((v6 == 3 || !(_BYTE)word_10003E990) && (v6 != 3 || !HIBYTE(word_10003E990)))
      {
        char is_development_build = _os_trace_is_development_build();
        if (v6 == 3 || (is_development_build & 1) == 0)
        {
          uint64_t v101 = 1;
        }
        else
        {
          double v92 = *(double *)&qword_10003E988 * (double)v11;
          if (v92 <= -1.0 || v92 >= 1.84467441e19)
          {
LABEL_110:
            __break(0x5505u);
            return;
          }
          unint64_t v94 = (unint64_t)v92;
          if (v6 == 1) {
            unint64_t v95 = 1;
          }
          else {
            unint64_t v95 = qword_10003E980;
          }
          uint64_t v96 = *(void *)v7;
          if (strcmp((const char *)(*(void *)v7 + 32), "/kernel") || *(void *)(v96 + 24) < v94)
          {
            if (v95 >= __nel) {
              size_t v97 = __nel;
            }
            else {
              size_t v97 = v95;
            }
            if (v97)
            {
              unint64_t v98 = 0;
              unint64_t v99 = 0;
              unint64_t v100 = 0;
              while (!(v99 >> 60) && v98 <= ~v7)
              {
                uint64_t v101 = v99 + 1;
                v100 += *(void *)(*(void *)(v7 + 8 * v99) + 24);
                if (v100 >= v94) {
                  goto LABEL_78;
                }
                v98 += 8;
                ++v99;
                if (v97 == v101) {
                  goto LABEL_25;
                }
              }
              goto LABEL_108;
            }
            goto LABEL_25;
          }
          if (__nel >= 2) {
            uint64_t v101 = 2;
          }
          else {
            uint64_t v101 = __nel;
          }
          if (!v101) {
            goto LABEL_25;
          }
        }
LABEL_78:
        unint64_t v102 = 0;
        unint64_t v103 = 0;
        BOOL v178 = v6 == 3;
        unint64_t v180 = ~v7;
        uint64_t v189 = v7;
        while (1)
        {
          if (v103 >> 60 || v102 > v180) {
            goto LABEL_108;
          }
          uint64_t v104 = *(void *)(v7 + v102);
          if (strcmp((const char *)(v104 + 32), "/kernel")) {
            break;
          }
          if ((_os_trace_is_development_build() & 1) == 0)
          {
            memset(&__str[21], 170, 0x3EBuLL);
            strcpy(__str, "Quarantined: /kernel");
            sub_100016E68((uint64_t)__str);
            BOOL v105 = 0;
            byte_10003E7C8 = 1;
            goto LABEL_85;
          }
LABEL_98:
          ++v103;
          v102 += 8;
          if (v101 == v103) {
            goto LABEL_25;
          }
        }
        v192[0] = _NSConcreteStackBlock;
        v192[1] = 0x40000000;
        v192[2] = sub_100015104;
        v192[3] = &unk_10002D160;
        v192[4] = v104;
        BOOL v193 = v178;
        sub_100007F5C((uint64_t)v192);
        BOOL v105 = v179;
LABEL_85:
        memset(__b, 170, sizeof(__b));
        unint64_t v196 = 0xAA00000000000000;
        v194 = __b;
        uint64_t v195 = 0x40000000000;
        sub_1000054CC(&v194, "--- !logd quarantine record\n", v106, v107, v108, v109, v110, v111, v172);
        time_t v112 = time(0);
        memset(v197, 170, sizeof(v197));
        v119 = "Quaratine";
        if (v105) {
          v119 = "Super Quarantine";
        }
        sub_1000054CC(&v194, "type         : %s\n", v113, v114, v115, v116, v117, v118, (char)v119);
        snprintf(v197, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v15 + 8), *(void *)(v15 + 24) - 1);
        sub_1000054CC(&v194, "file         : %s\n", v120, v121, v122, v123, v124, v125, (char)v197);
        sub_1000054CC(&v194, "client       : %s\n", v126, v127, v128, v129, v130, v131, v104 + 32);
        sub_1000054CC(&v194, "time         : ", v132, v133, v134, v135, v136, v137, v177);
        sub_100004DC4((tm *)&v194, v112);
        __str[0] = 10;
        if ((v196 & 0x200000000) == 0)
        {
          char v144 = BYTE6(v196);
          int v145 = v195;
          if (SBYTE6(v196) + HIDWORD(v195) - 1 == v195)
          {
            sub_1000095FC((uint64_t)&v194, __str, 1uLL);
          }
          else
          {
            v146 = v194;
            unint64_t v147 = ~(unint64_t)v194;
            if (~(unint64_t)v194 < v195) {
              goto LABEL_108;
            }
            *((unsigned char *)v194 + v195) = 10;
            uint64_t v148 = (v145 + 1);
            LODWORD(v195) = v148;
            if (!v144)
            {
              if (v147 < v148) {
                goto LABEL_108;
              }
              v146[v148] = 0;
            }
          }
        }
        contexta = (void *)v103;
        unint64_t v185 = v102;
        uint64_t v149 = v101;
        sub_1000054CC(&v194, "time covered : %llu\n", v138, v139, v140, v141, v142, v143, (*(void *)(v15 + 136) - *(void *)(v15 + 128)) / 0x3B9ACA00uLL);
        sub_1000054CC(&v194, "client total : %zu\n", v150, v151, v152, v153, v154, v155, *(void *)(v104 + 24));
        sub_1000054CC(&v194, "overall total: %zu\n\n", v156, v157, v158, v159, v160, v161, v11);
        sub_100013074();
        if ((v196 & 0x100000000) != 0)
        {
          v162 = v194;
          v194 = (void *)3954044928;
          WORD2(v196) = 0;
          free(v162);
        }
        bzero(__str, 0x400uLL);
        snprintf(__str, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v15 + 8), *(void *)(v15 + 24) - 1);
        CFStringRef v207 = @"logd quarantine";
        CFStringRef v199 = @"record";
        CFStringRef v200 = @"superQuarantine";
        v163 = +[NSNumber numberWithBool:v105];
        v208 = v163;
        CFStringRef v201 = @"file";
        v164 = +[NSString stringWithUTF8String:__str];
        v209 = v164;
        CFStringRef v202 = @"client";
        v165 = +[NSString stringWithUTF8String:v104 + 32];
        v210 = v165;
        CFStringRef v203 = @"unixTime";
        v166 = +[NSNumber numberWithLong:v112];
        v211 = v166;
        CFStringRef v204 = @"timeCovered";
        v167 = +[NSNumber numberWithUnsignedLongLong:(*(void *)(v15 + 136) - *(void *)(v15 + 128)) / 0x3B9ACA00uLL];
        v212 = v167;
        CFStringRef v205 = @"sizeBytes";
        v168 = +[NSNumber numberWithUnsignedLong:*(void *)(v104 + 24)];
        v213 = v168;
        CFStringRef v206 = @"totalBytes";
        v169 = +[NSNumber numberWithUnsignedLong:v11];
        v214 = v169;
        v170 = +[NSDictionary dictionaryWithObjects:&v207 forKeys:&v199 count:8];

        size_t v171 = sub_100003A4C((char *)__b, 0x400uLL, v170);
        if (v171) {
          sub_1000130EC();
        }
        unint64_t v13 = __nel;
        uint64_t v7 = v189;
        uint64_t v101 = v149;
        unint64_t v102 = v185;
        uint64_t v15 = v186;
        unint64_t v103 = (unint64_t)contexta;
        goto LABEL_98;
      }
    }
  }
LABEL_25:
  os_unfair_lock_lock_with_options();
  time_t v22 = time(0);
  time_t v23 = v22;
  if (v15)
  {
    time_t v184 = v22;
    uint64_t v188 = v7;
    if (v13 >= 0x32) {
      uint64_t v24 = 50;
    }
    else {
      uint64_t v24 = v13;
    }
    bzero(__str, 0x400uLL);
    snprintf(__str, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v15 + 8), *(void *)(v15 + 24) - 1);
    uint64_t v25 = +[NSMutableArray arrayWithCapacity:v24];
    if (v24)
    {
      unint64_t v26 = 0;
      unint64_t v27 = ~v7;
      uint64_t v28 = 8 * v24;
      while (v26 <= v27)
      {
        uint64_t v29 = *(void *)(v188 + v26);
        uint64_t v30 = *(void *)(v29 + 24);
        uint64_t v31 = v29 + 32;
        CFStringRef v199 = @"sizeBytes";
        uint64_t v32 = +[NSNumber numberWithUnsignedLong:v30];
        CFStringRef v207 = v32;
        CFStringRef v200 = @"process";
        char v33 = +[NSString stringWithUTF8String:v31];
        v208 = v33;
        v34 = +[NSDictionary dictionaryWithObjects:&v207 forKeys:&v199 count:2];
        [v25 addObject:v34];

        v26 += 8;
        if (v28 == v26) {
          goto LABEL_33;
        }
      }
      goto LABEL_108;
    }
LABEL_33:
    *(void *)v197 = @"record";
    *(void *)&v197[8] = @"type";
    __b[0] = @"logd statistics";
    __b[1] = @"File Rotate";
    *(void *)&v197[16] = @"file";
    uint64_t v35 = +[NSString stringWithUTF8String:__str];
    __b[2] = v35;
    *(void *)&v197[24] = @"unixTime";
    time_t v23 = v184;
    unint64_t v36 = +[NSNumber numberWithLong:v184];
    __b[3] = v36;
    *(void *)&v197[32] = @"totalBytes";
    uint64_t v37 = +[NSNumber numberWithUnsignedLong:v11];
    *(void *)&v197[40] = @"processList";
    __b[4] = v37;
    __b[5] = v25;
    char v38 = +[NSDictionary dictionaryWithObjects:__b forKeys:v197 count:6];

    size_t v39 = sub_100003A4C(byte_100031FA4, 0xC800uLL, v38);
    unint64_t v13 = __nel;
    uint64_t v7 = v188;
    uint64_t v15 = v186;
    if (v39)
    {
      sub_100002E78();
      dword_10003034C = sub_100006488(dword_10003034C, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880);
    }
  }
  memset(__str, 170, 0x400uLL);
  *(void *)&v197[16] = 0xAA00000000000000;
  *(void *)v197 = __str;
  *(void *)&v197[8] = 0x40000000000;
  sub_1000054CC(v197, "--- !logd statistics record\n", v40, v41, v42, v43, v44, v45, v172);
  if (v15)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v15 + 8), *(void *)(v15 + 24) - 1);
    sub_1000054CC(v197, "type  : File Rotate\n", v52, v53, v54, v55, v56, v57, v174);
    sub_1000054CC(v197, "file  : %s\n", v58, v59, v60, v61, v62, v63, (char)__b);
  }
  else
  {
    sub_1000054CC(v197, "type  : Memory Rollover\n", v46, v47, v48, v49, v50, v51, v173);
  }
  sub_1000054CC(v197, "time  : ", v64, v65, v66, v67, v68, v69, v175);
  sub_100004DC4((tm *)v197, v23);
  LOBYTE(__b[0]) = 10;
  if ((v197[20] & 2) == 0)
  {
    char v76 = v197[22];
    int v77 = *(_DWORD *)&v197[8];
    if (v197[22] + *(_DWORD *)&v197[12] - 1 == *(_DWORD *)&v197[8]) {
      goto LABEL_107;
    }
    uint64_t v78 = *(void *)v197;
    unint64_t v79 = ~*(void *)v197;
    if (~*(void *)v197 < (unint64_t)*(unsigned int *)&v197[8]) {
      goto LABEL_108;
    }
    *(unsigned char *)(*(void *)v197 + *(unsigned int *)&v197[8]) = 10;
    uint64_t v80 = (v77 + 1);
    *(_DWORD *)&v197[8] = v80;
    if (!v76)
    {
      if (v79 < v80)
      {
LABEL_108:
        __break(0x5513u);
        goto LABEL_109;
      }
      *(unsigned char *)(v78 + v80) = 0;
    }
  }
  while (1)
  {
    sub_1000054CC(v197, "total : %zu\n", v70, v71, v72, v73, v74, v75, v11);
    sub_1000054CC(v197, "procs :\n", v81, v82, v83, v84, v85, v86, v176);
    sub_100006444();
    if ((v197[20] & 1) == 0) {
      break;
    }
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
LABEL_107:
    sub_1000095FC((uint64_t)v197, __b, 1uLL);
  }
  if (v13)
  {
    unint64_t v87 = 0;
    unint64_t v88 = 0;
    unint64_t v89 = ~v7;
    do
    {
      if (v88 <= 0x13)
      {
        if (v87 > v89) {
          goto LABEL_108;
        }
        uint64_t v90 = *(void *)(v7 + v87);
        memset(__str, 170, 0x400uLL);
        snprintf(__str, 0x400uLL, "    - [ %10zu, %5.1f, %s ]\n", *(void *)(v90 + 24), (double)*(unint64_t *)(v90 + 24) / (double)v11 * 100.0, (const char *)(v90 + 32));
        sub_100006444();
      }
      if (v88 >> 60 || v87 > v89) {
        goto LABEL_108;
      }
      free(*(void **)(v7 + v87));
      ++v88;
      v87 += 8;
    }
    while (v13 != v88);
  }
  sub_100006444();
  dword_100030348 = sub_100006488(dword_100030348, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000);
  os_unfair_lock_unlock(&stru_100031FA0);
  free((void *)v7);
}

uint64_t sub_100006444()
{
  uint64_t result = dword_100030348;
  if ((dword_100030348 & 0x80000000) == 0)
  {
    uint64_t result = _os_trace_write();
    if (result == -1)
    {
      __error();
      return _os_assumes_log();
    }
  }
  return result;
}

uint64_t sub_100006488(uint64_t a1, const char *a2, const char *a3, off_t a4)
{
  uint64_t v7 = a1;
  off_t v8 = lseek(a1, 0, 2);
  if (v8 == -1)
  {
    __error();
    _os_assumes_log();
  }
  fsync(v7);
  if (v8 < a4) {
    return v7;
  }
  if (close(v7) != -1)
  {
LABEL_5:
    if (renameat(dword_100031BF8, a2, dword_100031BF8, a3) == -1)
    {
      __error();
      _os_assumes_log();
    }
    uint64_t v7 = openat(dword_100031BF8, a2, 778, 420);
    if (v7 == -1)
    {
      __error();
      _os_assumes_log();
    }
    return v7;
  }
  int v10 = *__error();
  uint64_t result = *__error();
  if (v10 != 9)
  {
    _os_assumes_log();
    goto LABEL_5;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

#error "100006900: switch analysis failed: switch information is incomplete or incorrect (funcsize=234)"

uint64_t sub_1000069A8(void *a1)
{
  kern_return_t v2;
  uint64_t v3;
  memory_object_offset_t v4;
  kern_return_t memory_entry_64;
  uint64_t result;
  memory_object_size_t size;

  mach_vm_size_t size = a1[5];
  if (dword_1000302BC)
  {
    int v2 = mach_port_deallocate(mach_task_self_, dword_1000302BC);
    if (v2 == -301) {
      sub_100025BCC();
    }
    if (v2) {
      _dispatch_bug();
    }
  }
  if (qword_1000302C8) {
    munmap((void *)qword_1000302C8, qword_1000302C0);
  }
  long long v3 = a1[5];
  qword_1000302C8 = a1[6];
  qword_1000302C0 = v3;
  dword_1000302BC = 0;
  uint64_t v4 = a1[6];
  if (v4)
  {
    memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, v4, 4194305, (mach_port_t *)&dword_1000302BC, 0);
    if (memory_entry_64 == -301) {
      sub_100025BCC();
    }
    if (memory_entry_64) {
      _dispatch_bug();
    }
  }
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100006AA0(id a1)
{
}

void sub_100006AAC(unint64_t a1, uint64_t a2)
{
  kern_return_t v12;
  const void **v13;
  CFIndex v14;
  const CFArrayCallBacks *v15;
  CFAllocatorRef v16;
  int v17;
  unsigned __int16 v18;
  uint64_t v19;
  unint64_t StatusReg;
  unint64_t v21;
  int v22;
  unsigned __int16 v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t vars8;

  if (a2 > 7)
  {
    if (a2 == 8)
    {
      if (atomic_fetch_add_explicit((atomic_uchar *volatile)(a1 + 142), 0xFFu, memory_order_release) == 1)
      {
        atomic_load_explicit((atomic_uchar *volatile)(a1 + 142), memory_order_acquire);
        int v12 = mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 120));
        if (v12 == -301) {
          sub_100025BCC();
        }
        if (v12) {
          _dispatch_bug();
        }
        *(_DWORD *)(a1 + 120) = 0;
        uint64_t v16 = (const __CFAllocator *)*(unsigned int *)(a1 + 112);
        if ((v16 + 1) >= 2
          || (uint64_t v16 = (const __CFAllocator *)*(unsigned int *)(a1 + 116), (v16 + 1) > 1))
        {
          sub_100025C88(v16, v13, v14, v15);
        }
        uint64_t v17 = *(unsigned __int16 *)(a1 + 140);
        while ((v17 & 0x110) == 0)
        {
          __uint64_t v18 = v17;
          atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(a1 + 140), (unsigned __int16 *)&v17, v17 | 0x11, memory_order_relaxed, memory_order_relaxed);
          if (v17 == v18)
          {
            double v19 = *(unsigned __int8 *)(a1 + 147);
            if (a1 && (v18 & 1) == 0)
            {
              *(void *)(a1 + 32) = 0;
              unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              *(void *)(StatusReg + 976) = &dword_100030270[8 * v19 + 32];
              uint64_t v21 = atomic_exchange_explicit((atomic_ullong *volatile)&dword_100030270[8 * v19 + 32], a1, memory_order_release);
              if (v21)
              {
                *(void *)(v21 + 32) = a1;
                *(void *)(StatusReg + 976) = 0;
              }
              else
              {
                *(void *)&dword_100030270[8 * v19 + 30] = a1;
                *(void *)(StatusReg + 976) = 0;
                dispatch_source_merge_data(*(dispatch_source_t *)&dword_100030270[4 * v19 + 46], 1uLL);
              }
            }
            break;
          }
        }
        time_t v22 = *(unsigned __int16 *)(a1 + 140);
        while ((v22 & 0x220) == 0)
        {
          time_t v23 = v22;
          atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(a1 + 140), (unsigned __int16 *)&v22, v22 | 0x22, memory_order_relaxed, memory_order_relaxed);
          if (v22 == v23)
          {
            uint64_t v24 = 3;
            if (!*(unsigned char *)(a1 + 147)) {
              uint64_t v24 = 1;
            }
            if (a1 && (v23 & 2) == 0)
            {
              *(void *)(a1 + 40) = 0;
              uint64_t v25 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
              *(void *)(v25 + 976) = &dword_100030270[4 * v24 + 32];
              unint64_t v26 = atomic_exchange_explicit((atomic_ullong *volatile)&dword_100030270[4 * v24 + 32], a1, memory_order_release);
              if (v26)
              {
                *(void *)(v26 + 40) = a1;
                *(void *)(v25 + 976) = 0;
              }
              else
              {
                *(void *)&dword_100030270[4 * v24 + 30] = a1;
                *(void *)(v25 + 976) = 0;
                unint64_t v27 = *(NSObject **)&dword_100030270[2 * v24 + 46];
                dispatch_source_merge_data(v27, 1uLL);
              }
            }
            return;
          }
        }
      }
    }
    else if (a2 == 13)
    {
      dispatch_mach_cancel();
      dispatch_mach_cancel();
    }
  }
  else if (a2 == 2)
  {
    if ((dispatch_mach_mig_demux() & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
    }
  }
  else if (a2 == 7)
  {
    unsigned int v3 = *(_DWORD *)(dispatch_mach_msg_get_msg() + 12);
    if (v3 - 1 <= 0xFFFFFFFD)
    {
      uint64_t v4 = 0;
      for (char i = 1; ; char i = 0)
      {
        unint64_t v6 = a1 + 4 * v4;
        mach_port_name_t v9 = *(_DWORD *)(v6 + 112);
        off_t v8 = (_DWORD *)(v6 + 112);
        mach_port_name_t v7 = v9;
        if (v9 == v3) {
          break;
        }
        char v10 = i;
        uint64_t v4 = 1;
        if ((v10 & 1) == 0) {
          sub_100025C60(v3);
        }
      }
      if (mach_port_destruct(mach_task_self_, v7, 0, (mach_port_context_t)v8) == -301) {
        sub_100025BCC();
      }
      *off_t v8 = 0;
    }
  }
}

void sub_100006D74(uint64_t a1, uint64_t a2)
{
  if (a2 == 2 && (dispatch_mach_mig_demux() & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
  }
}

_DWORD *sub_100006DDC(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_100006E40(result[3]);
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t sub_100006E40(int a1)
{
  unint64_t context = dispatch_mach_mig_demux_get_context();
  if (!context) {
    return 5;
  }
  int v3 = *(_DWORD *)(context + 116);
  if (!*(unsigned char *)(context + 144))
  {
    int v4 = 1 << (v3 == a1);
    uint64_t v5 = *(unsigned __int16 *)(context + 140);
    while (1)
    {
      int v6 = (256 << (v3 == a1)) & (unsigned __int16)v5;
      if (v6 | (unsigned __int16)(v4 & v5)) {
        break;
      }
      uint64_t v7 = v5;
      atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(context + 140), (unsigned __int16 *)&v7, v5 | v4, memory_order_relaxed, memory_order_relaxed);
      BOOL v8 = v7 == (unsigned __int16)v5;
      uint64_t v5 = v7;
      if (v8)
      {
        BOOL v9 = v3 == a1;
        uint64_t v10 = *(unsigned __int8 *)(context + 147);
        goto LABEL_8;
      }
    }
    if (v6) {
      return 0;
    }
    BOOL v9 = v3 == a1;
    uint64_t v10 = *(unsigned __int8 *)(context + 147);
    if (((unsigned __int16)v4 & (unsigned __int16)v5) != 0) {
      return 0;
    }
LABEL_8:
    uint64_t v11 = v9 | (2 * v10);
    *(void *)(context + 8 * v9 + 32) = 0;
    int v12 = &dword_100030270[4 * v11];
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(void *)(StatusReg + 976) = v12 + 32;
    unint64_t v14 = atomic_exchange_explicit((atomic_ullong *volatile)v12 + 16, context, memory_order_release);
    if (v14)
    {
      uint64_t v15 = 0;
      *(void *)(v14 + 8 * v9 + 32) = context;
      *(void *)(StatusReg + 976) = 0;
      return v15;
    }
    *((void *)v12 + 15) = context;
    *(void *)(StatusReg + 976) = 0;
    dispatch_source_merge_data(*(dispatch_source_t *)&dword_100030270[2 * v11 + 46], 1uLL);
  }
  return 0;
}

void sub_100006F4C(_xpc_connection_s *a1, void *a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v65 = v4;
  long long v64 = v4;
  long long v63 = v4;
  long long v62 = v4;
  long long v61 = v4;
  long long v60 = v4;
  long long v59 = v4;
  long long v58 = v4;
  long long v57 = v4;
  long long v56 = v4;
  long long v55 = v4;
  long long v54 = v4;
  long long v53 = v4;
  long long v52 = v4;
  long long v51 = v4;
  long long v50 = v4;
  long long v49 = v4;
  long long v48 = v4;
  long long v47 = v4;
  long long v46 = v4;
  long long v45 = v4;
  long long v44 = v4;
  memset(__b, 170, sizeof(__b));
  int uint64 = xpc_dictionary_get_uint64(a2, "stream_id");
  BOOL v6 = xpc_dictionary_get_BOOL(a2, "quarantined");
  int v7 = uint64;
  uint64_t v8 = 4;
  switch(v7)
  {
    case 0:
      if (v6) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = 0;
      }
      goto LABEL_12;
    case 1:
      if (v6) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = 1;
      }
      goto LABEL_12;
    case 2:
      goto LABEL_12;
    case 4:
      if (v6) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = 2;
      }
LABEL_12:
      if (!sub_100007468((uint64_t)a1, a2, (uint64_t)&v47)) {
        goto LABEL_20;
      }
      pid_t pid = xpc_connection_get_pid(a1);
      if (proc_pidpath(pid, __b, 0x400u) < 1) {
        __b[0] = 0;
      }
      memset(__str, 170, 16);
      *(void *)&long long v44 = xpc_dictionary_get_data(a2, "commands", (size_t *)&__str[8]);
      *((void *)&v44 + 1) = *(void *)&__str[8];
      if ((long long *)((char *)&v45 + 1) != 0 && (unint64_t)&v44 >= 0xFFFFFFFFFFFFFFEFLL) {
        goto LABEL_36;
      }
      memset(__str, 170, 16);
      *(void *)&long long v45 = xpc_dictionary_get_data(a2, "pubdata", (size_t *)&__str[8]);
      *((void *)&v45 + 1) = *(void *)&__str[8];
      if ((unint64_t)&v44 > 0xFFFFFFFFFFFFFFDFLL) {
        goto LABEL_36;
      }
      memset(__str, 170, 16);
      *(void *)&long long v46 = xpc_dictionary_get_data(a2, "privdata", (size_t *)&__str[8]);
      *((void *)&v46 + 1) = *(void *)&__str[8];
      if (*((void *)&v44 + 1) > 0x8000uLL
        || *((void *)&v45 + 1) > 0x8000uLL
        || *(void *)&__str[8] > 0x8000uLL
        || (unint64_t v12 = *((void *)&v44 + 1) + *(void *)&__str[8] + *((void *)&v45 + 1), v12 > 0x8000))
      {
        memset(__str, 170, sizeof(__str));
        snprintf(__str, 0x400uLL, "Received oversize message with invalid size: %zd, %zd, %zd");
LABEL_19:
        sub_100016E68((uint64_t)__str);
      }
      else
      {
        *(void *)&long long v52 = 24578;
        *((void *)&v52 + 1) = v12 + 32;
        uint64_t v13 = v49;
        int v14 = HIDWORD(v48);
        char v15 = xpc_dictionary_get_uint64(a2, "ttl");
        uint64_t v16 = xpc_dictionary_get_uint64(a2, "ts");
        int v17 = xpc_dictionary_get_uint64(a2, "message_id");
        *(void *)&long long v53 = v13;
        DWORD2(v53) = v14;
        BYTE12(v53) = v15;
        *(_WORD *)((char *)&v53 + 13) = 0;
        HIBYTE(v53) = 0;
        *(void *)&long long v54 = v16;
        DWORD2(v54) = v17;
        WORD6(v54) = WORD4(v44) + WORD4(v45);
        HIWORD(v54) = WORD4(v46);
        memset(__str, 170, 16);
        data = (unsigned __int8 *)xpc_dictionary_get_data(a2, "subsystem", (size_t *)&__str[8]);
        uint64_t v19 = 0;
        if (data && *(void *)&__str[8] >= 4uLL)
        {
          if (*(void *)&__str[8] - 4 >= data[2] + (unint64_t)data[3]) {
            uint64_t v19 = sub_10000B6D4((uint64_t)data);
          }
          else {
            uint64_t v19 = 0;
          }
        }
        if (1248 * v8 > ~(unint64_t)qword_100030398)
        {
LABEL_36:
          __break(0x5513u);
          return;
        }
        uint64_t v20 = &qword_100030398[156 * v8];
        uint64_t v21 = *v20;
        *(void *)__str = _NSConcreteStackBlock;
        *(void *)&__str[8] = 0x40000000;
        *(void *)&__str[16] = sub_100009E44;
        *(void *)&__str[24] = &unk_10002DA50;
        *(void *)&__str[32] = &v52;
        *(void *)&__str[40] = v20;
        *(void *)&__str[48] = 3;
        *(void *)&__str[56] = &v44;
        *(void *)&__str[64] = &v47;
        *(void *)&__str[72] = v19;
        dispatch_sync(v21, __str);
        uint64_t v22 = v20[1];
        if (v22) {
          time_t v23 = (NSObject **)(v22 + 16);
        }
        else {
          time_t v23 = (NSObject **)&qword_100030398[156 * v8];
        }
        uint64_t v24 = *v23;
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_100004668;
        block[3] = &unk_10002D9F0;
        long long v36 = v62;
        long long v37 = v63;
        long long v38 = v64;
        long long v39 = v65;
        long long v32 = v58;
        long long v33 = v59;
        long long v34 = v60;
        long long v35 = v61;
        long long v28 = v54;
        long long v29 = v55;
        long long v30 = v56;
        long long v31 = v57;
        long long v26 = v52;
        long long v27 = v53;
        uint64_t v40 = &qword_100030398[156 * v8];
        uint64_t v41 = __b;
        dispatch_sync(v24, block);
      }
LABEL_20:
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        uint64_t v11 = reply;
        xpc_connection_send_message(a1, reply);
        xpc_release(v11);
      }
      return;
    default:
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Received oversize message with invalid stream id: %d (%d)");
      goto LABEL_19;
  }
}

BOOL sub_100007468(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_connection_get_audit_token();
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v11 = v5;
  long long v12 = v5;
  long long v10 = v5;
  int v6 = proc_pidinfo(*(_DWORD *)(a3 + 20), 17, 1uLL, &v10, 56);
  if (v6 == 56)
  {
    *(unsigned char *)(a3 + 72) = xpc_dictionary_get_BOOL(a2, "32bits");
    *(void *)(a3 + 32) = v11;
    *(_OWORD *)(a3 + 40) = v10;
    uuid = xpc_dictionary_get_uuid(a2, "dsc_uuid");
    uint64_t v8 = (_OWORD *)(a3 + 56);
    if (uuid)
    {
      *uint64_t v8 = *(_OWORD *)uuid;
    }
    else
    {
      *(void *)uint64_t v8 = 0;
      *(void *)(a3 + 64) = 0;
    }
  }
  return v6 == 56;
}

void sub_10000755C()
{
  __chkstk_darwin();
  if (qword_10003E948)
  {
    v0 = 0;
  }
  else
  {
    v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, (dispatch_queue_t)qword_10003E938);
    dispatch_source_set_event_handler_f(v0, (dispatch_function_t)sub_10000903C);
    dispatch_activate(v0);
    objc_storeStrong((id *)&qword_10003E948, v0);
  }
  memset(__b, 170, sizeof(__b));
  if (qword_10003E950) {
    goto LABEL_49;
  }
  id v1 = objc_alloc_init((Class)NSMutableSet);
  memset(v54, 170, sizeof(v54));
  memset(__str, 170, sizeof(__str));
  unint64_t v46 = 0xAA01000000100000;
  int v2 = (const char *)_os_trace_sysprefsdir_path();
  snprintf(__str, 0x400uLL, "%s/Subsystems", v2);
  sub_10001C024(v1, __str);
  int v3 = (const char *)_os_trace_app_cryptex_sysprefsdir_path();
  snprintf(__str, 0x400uLL, "%s/Subsystems", v3);
  int v4 = sub_10001C024(v1, __str);
  long long v5 = (const char *)_os_trace_os_cryptex_sysprefsdir_path();
  snprintf(__str, 0x400uLL, "%s/Subsystems", v5);
  unsigned int v6 = sub_10001C024(v1, __str);
  if (_os_trace_is_development_build())
  {
    int v7 = (const char *)_os_trace_intprefsdir_path();
    snprintf(__str, 0x400uLL, "%s/Subsystems", v7);
    sub_10001C024(v1, __str);
  }
  long long v44 = v54;
  uint64_t v45 = 0x40000000000;
  if (byte_10003E992)
  {
    id v8 = v1;
    BOOL v9 = 0;
    uint64_t v10 = 1;
  }
  else
  {
    memset(applier, 170, 0x400uLL);
    long long v11 = (const char *)_os_trace_sysprefsdir_path();
    if (snprintf(applier, 0x400uLL, "%s/com.apple.logd.highvol.plist", v11) >= 1024) {
      _os_assumes_log();
    }
    plist_at = (void *)_os_trace_read_plist_at();
    if (_os_trace_is_development_build())
    {
      unint64_t v13 = (const char *)_os_trace_intprefsdir_path();
      if (snprintf(applier, 0x400uLL, "%s/com.apple.logd.highvol.plist", v13) >= 1024) {
        _os_assumes_log();
      }
      int v14 = (void *)_os_trace_read_plist_at();
      uint64_t v15 = sub_10001C0F0(plist_at, v14);

      plist_at = (void *)v15;
    }
    uint64_t v16 = (const char *)_os_trace_prefsdir_path();
    if (snprintf(applier, 0x400uLL, "%s/com.apple.logd.highvol.plist", v16) >= 1024) {
      _os_assumes_log();
    }
    int v17 = (void *)_os_trace_read_plist_at();
    BOOL v9 = sub_10001C0F0(plist_at, v17);

    id v18 = v1;
    if (v9)
    {
      *(void *)applier = _NSConcreteStackBlock;
      *(void *)&applier[8] = 3221225472;
      *(void *)&applier[16] = sub_10001C200;
      *(void *)&applier[24] = &unk_10002E180;
      *(void *)&applier[32] = v18;
      xpc_dictionary_apply(v9, applier);

      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = 1;
    }
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v19 = v1;
  id v20 = [v19 countByEnumeratingWithState:&v49 objects:v48 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v42 = v0;
    uint64_t v22 = v4 | v6;
    uint64_t v23 = *(void *)v50;
    do
    {
      uint64_t v24 = 0;
      id v43 = v21;
      do
      {
        if (*(void *)v50 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = (char *)[*(id *)(*((void *)&v49 + 1) + 8 * (void)v24) UTF8String];
        id v26 = v9;
        id sysprefs = (id)_os_log_preferences_load_sysprefs();
        if ((v10 & 1) == 0)
        {
          uint64_t v28 = v23;
          uint64_t v29 = v22;
          uint64_t v30 = v10;
          long long v31 = v9;
          id v32 = v19;
          long long v33 = xpc_dictionary_get_dictionary(v26, v25);
          long long v34 = v33;
          if (v33)
          {
            if (sysprefs) {
              _os_log_preferences_merge();
            }
            else {
              id sysprefs = v33;
            }
          }

          id v19 = v32;
          BOOL v9 = v31;
          uint64_t v10 = v30;
          uint64_t v22 = v29;
          uint64_t v23 = v28;
          id v21 = v43;
        }

        if (sysprefs) {
          sub_100009794(&v44, v25, sysprefs);
        }

        uint64_t v24 = (char *)v24 + 1;
      }
      while (v21 != v24);
      id v21 = [v19 countByEnumeratingWithState:&v49 objects:v48 count:16];
    }
    while (v21);
    char v35 = BYTE4(v46);

    if ((v35 & 2) != 0)
    {
      memset(&applier[44], 170, 0x3D4uLL);
      strcpy(applier, "Logging sysprefs cache was larger than 1MB!");
      sub_100016E68((uint64_t)applier);
      v0 = v42;
      if (v35) {
        free(v44);
      }
      goto LABEL_48;
    }
    v0 = v42;
  }
  else
  {

    char v35 = 0;
  }
  if (qword_100031F98 != -1) {
    dispatch_once(&qword_100031F98, &stru_10002CFC8);
  }
  uint64_t v36 = (uint64_t)v44;
  uint64_t v37 = v45;
  if (qword_100031F90) {
    sub_100014068((uint64_t)v44, v45, 0, (uint64_t)&stru_10002CF68);
  }
  long long v44 = (void *)3954044928;
  if ((v35 & 1) == 0) {
    uint64_t v36 = _os_trace_memdup();
  }
  qword_10003E950 = v36;
  if (v36) {
    qword_10003E968 = v37;
  }
LABEL_48:

LABEL_49:
  sub_100007C40(3u);
  long long v38 = (const char *)_os_trace_prefsdir_path();
  snprintf(__b, 0x400uLL, "%s/Subsystems", v38);
  mkpath_np(__b, 0x1EDu);
  int v39 = open(__b, 1081600);
  if (v39 == -1)
  {
    __error();
    _os_assumes_log();
    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v40 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v39, 0x37uLL, (dispatch_queue_t)qword_10003E938);
    dispatch_set_context(v40, v40);
    dispatch_source_set_event_handler_f(v40, (dispatch_function_t)sub_100004B84);
    dispatch_source_set_cancel_handler_f(v40, (dispatch_function_t)sub_100004D50);
    dispatch_activate(v40);
  }
  if (qword_10003E958)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10003E958);
    uint64_t v41 = (void *)qword_10003E958;
  }
  else
  {
    uint64_t v41 = 0;
  }
  qword_10003E958 = (uint64_t)v40;

  sub_10000903C();
}

xpc_type_t sub_100007C40(unsigned int a1)
{
  int v2 = (const char *)sub_100007DFC(a1);
  if (!v2)
  {
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Invalid directory index";
    qword_100031F78 = a1;
    __break(1u);
  }
  int v3 = v2;
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v9.st_blkmach_vm_size_t size = v4;
  *(timespec *)v9.st_qspare = v4;
  v9.st_birthtimespec = v4;
  *(timespec *)&v9.st_mach_vm_size_t size = v4;
  v9.st_mtimespec = v4;
  v9.st_ctimespec = v4;
  *(timespec *)&v9.st_uid = v4;
  v9.st_atimespec = v4;
  *(timespec *)&v9.st_dev = v4;
  xpc_type_t result = (xpc_type_t)stat(v2, &v9);
  if (result) {
    goto LABEL_8;
  }
  if (12 * (unint64_t)a1 <= ~(unint64_t)dword_100031F0C)
  {
    if (v9.st_uid == dword_100031F0C[3 * a1]
      && v9.st_gid == dword_100031F0C[3 * a1 + 1]
      && (v9.st_mode & 0xFFF) == LOWORD(dword_100031F0C[3 * a1 + 2]))
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "%s/%s", v3, ".migrated");
      if (!stat(__b, &v9)) {
        return 0;
      }
    }
LABEL_8:
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "operation", 6uLL);
    xpc_dictionary_set_uint64(v6, "directory", a1);
    xpc_type_t v7 = sub_100004124(v6, 3);

    return v7;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100007DFC(int a1)
{
  switch(a1)
  {
    case 0:
      if (qword_10003E9B0 != -1) {
        dispatch_once(&qword_10003E9B0, &stru_10002E890);
      }
      uint64_t result = qword_10003E998;
      break;
    case 1:
      if (qword_10003E9B0 != -1) {
        dispatch_once(&qword_10003E9B0, &stru_10002E890);
      }
      uint64_t result = qword_10003E9A0;
      break;
    case 2:
      if (qword_10003E9B0 != -1) {
        dispatch_once(&qword_10003E9B0, &stru_10002E890);
      }
      uint64_t result = qword_10003E9A8;
      break;
    case 3:
      uint64_t result = _os_trace_prefsdir_path();
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_100007EF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 16;
  sub_100008058(v1, *(const void **)(a1 + 48), &v2);
}

void sub_100007F5C(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = &qword_10003E7B8;
  do
    uint64_t v2 = (uint64_t *)*v2;
  while (v2 && ((*(uint64_t (**)(uint64_t, uint64_t *))(a1 + 16))(a1, v2) & 1) != 0);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003E7B0);
}

uint64_t sub_100007FD4(uint64_t a1, uint64_t a2)
{
  timespec v4 = (os_unfair_lock_s *)(a2 + 132);
  os_unfair_lock_lock_with_options();
  uint64_t v5 = *(void *)(a1 + 32);
  xpc_object_t v6 = (void *)sub_10000C148(a2, *(unsigned __int8 *)(a1 + 40));
  sub_100008058(v5, (const void *)(a2 + 138), v6);
  *(void *)sub_10000C148(a2, *(unsigned __int8 *)(a1 + 40)) = 0;
  os_unfair_lock_unlock(v4);
  return 1;
}

void sub_100008058(uint64_t a1, const void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6) {
    xpc_type_t v7 = (dispatch_queue_t *)(v6 + 16);
  }
  else {
    xpc_type_t v7 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v7);
  if (*(unsigned __int8 *)(a1 + 1240) <= 4u && *a3)
  {
    id v8 = (rb_tree_t *)(a1 + 1176);
    node = rb_tree_find_node(v8, a2);
    if (!node)
    {
      strlen((const char *)a2);
      node = (void *)_os_trace_calloc();
      size_t v10 = strlen((const char *)a2);
      memcpy(node + 4, a2, v10);
      rb_tree_insert_node(v8, node);
    }
    node[3] += *a3;
  }
}

uint64_t sub_100008124(uint64_t a1, int a2, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    v19[0] = 0xAAAAAAAAAAAAAAAALL;
    data = xpc_dictionary_get_data(object, "data", v19);
    if (data)
    {
      uint64_t v7 = v19[0];
      if (v19[0])
      {
        if (v19[0] <= 0x8000)
        {
          uint64_t v8 = (uint64_t)data;
          uuid = xpc_dictionary_get_uuid(object, "uuid");
          if (uuid)
          {
            size_t v10 = uuid;
            *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v36 = v11;
            long long v35 = v11;
            long long v34 = v11;
            long long v33 = v11;
            long long v32 = v11;
            long long v31 = v11;
            long long v30 = v11;
            long long v29 = v11;
            long long v28 = v11;
            long long v27 = v11;
            unint64_t v18 = 24579;
            v19[0] = v7 + 48;
            size_t v12 = *(void *)(a1 + 64);
            if (*(unsigned char *)(a1 + 128)) {
              char v13 = *(unsigned char *)(a1 + 128);
            }
            else {
              char v13 = 14;
            }
            int v14 = *(_DWORD *)(a1 + 60);
            uint64_t uint64 = xpc_dictionary_get_uint64(object, "ts");
            v19[1] = v12;
            int v20 = v14;
            char v21 = v13;
            __int16 v22 = 0;
            char v23 = 0;
            uint64_t v17 = *(void *)(a1 + 112);
            uint64_t v16 = *(void *)(a1 + 120);
            uint64_t v24 = uint64;
            uint64_t v25 = v17;
            long long v26 = *(_OWORD *)v10;
            sub_1000087B0((uint64_t)&v18, v8, v7, a1 + 32, v16, *(unsigned __int8 *)(a1 + 129), 0);
          }
        }
      }
    }
  }
  return 1;
}

void sub_1000082B8(uint64_t a1)
{
  int v1 = *(_DWORD *)(__chkstk_darwin(a1) + 32);
  memset(__b, 170, sizeof(__b));
  *(void *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  *(sockaddr *)((char *)v13 + 10) = v2;
  sockaddr v12 = v2;
  v13[0] = v2;
  sockaddr v10 = v2;
  sockaddr v11 = v2;
  sockaddr v8 = v2;
  sockaddr v9 = v2;
  socklen_t v4 = 106;
  if (recvfrom(v1, __b, 0x1000uLL, 0, &v8, &v4) >= 1)
  {
    unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v6[5] = v3;
    v6[6] = v3;
    v6[3] = v3;
    v6[4] = v3;
    v6[1] = v3;
    v6[2] = v3;
    v6[0] = v3;
    if (_os_log_simple_parse())
    {
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Unable to parse os_log_simple buffer. Error: %d Received: %zd");
    }
    else
    {
      if (!sub_100008428((char *)v6)) {
        return;
      }
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Unable to mirror error: %d pid: %llu message: %s");
    }
    sub_100016E68((uint64_t)__str);
  }
}

size_t sub_100008428(char *a1)
{
  size_t v2 = strlen(*((const char **)a1 + 2)) + 1;
  long long v3 = (const char *)*((void *)a1 + 1);
  if (v3) {
    size_t v4 = strlen(v3) + 1;
  }
  else {
    size_t v4 = 0;
  }
  size_t v5 = v4 + v2 + 12;
  BOOL v6 = __CFADD__(v4, v2 + 12);
  size_t result = 84;
  if (v2 < 0xFFFFFFFFFFFFFFF4 && !v6)
  {
    size_t result = (size_t)malloc_type_calloc(1uLL, v5, 0xD9E6F29uLL);
    if (v5 < 4
      || (uint64_t v8 = result, *(_DWORD *)result = 1, (v5 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      || ((*(_DWORD *)(result + 4) = v4, v5 >= 8) ? (BOOL v9 = (v5 & 0xFFFFFFFFFFFFFFFCLL) == 8) : (BOOL v9 = 1), v9))
    {
      __break(1u);
    }
    *(_DWORD *)(result + 8) = v2;
    if (!__CFADD__(result + 12, v4))
    {
      strlcpy((char *)(result + 12 + v4), *((const char **)a1 + 2), v2);
      sockaddr v10 = (const char *)*((void *)a1 + 1);
      if (v10) {
        strlcpy((char *)(v8 + 12), v10, v4);
      }
      sockaddr v11 = a1 + 104;
      if (uuid_is_null((const unsigned __int8 *)a1 + 104) && (_dyld_get_shared_cache_uuid() & 1) == 0) {
        _os_assumes_log();
      }
      *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v30[16] = v12;
      *(_OWORD *)&v30[32] = v12;
      long long v29 = v12;
      *(_OWORD *)long long v30 = v12;
      long long v28 = v12;
      v30[40] = 0;
      int v13 = *((_DWORD *)a1 + 8);
      uint64_t v14 = *((void *)a1 + 5);
      *(void *)long long v30 = v14;
      int v15 = *((_DWORD *)a1 + 12);
      DWORD1(v29) = v13;
      HIDWORD(v29) = v15;
      *(_OWORD *)&v30[8] = *(_OWORD *)(a1 + 88);
      *(_OWORD *)&v30[24] = *v11;
      memset(v27, 170, sizeof(v27));
      if (proc_pidpath(v13, v27, 0x400u) <= 0)
      {
        memset(v26, 170, sizeof(v26));
        snprintf((char *)v26, 0x400uLL, "Unable to get path for %d", v13);
        sub_100016E68((uint64_t)v26);
        v27[0] = 0;
      }
      uint64_t v16 = sub_10000C24C((unsigned __int8 *)a1 + 88, v27, 0, 1);
      uint64_t v17 = 0;
      v26[27] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v26[25] = v18;
      *(_OWORD *)&v26[23] = v18;
      *(_OWORD *)&v26[21] = v18;
      *(_OWORD *)&v26[19] = v18;
      *(_OWORD *)&v26[17] = v18;
      *(_OWORD *)&v26[15] = v18;
      *(_OWORD *)&v26[13] = v18;
      *(_OWORD *)&v26[11] = v18;
      v26[0] = 24580;
      char v19 = *a1;
      v26[1] = v5 + 72;
      v26[2] = v14;
      uint64_t v20 = *((void *)a1 + 3);
      LODWORD(v26[3]) = v15;
      BYTE4(v26[3]) = 0;
      BYTE5(v26[3]) = v19;
      HIWORD(v26[3]) = 0;
      v26[4] = v20;
      *(_OWORD *)&v26[5] = *(_OWORD *)(a1 + 56);
      *(_OWORD *)&v26[7] = *(_OWORD *)(a1 + 72);
      *(_OWORD *)&v26[9] = *v11;
      unsigned int v21 = *(_DWORD *)(v8 + 4);
      if (v21 < 2) {
        goto LABEL_28;
      }
      size_t v22 = *(_DWORD *)(v8 + 4);
      __chkstk_darwin(v16);
      uint64_t v17 = (char *)v26 - v23;
      memset((char *)v26 - v23, 170, v24);
      __int16 v25 = os_map_str_find();
      if (!v25)
      {
        __int16 v25 = word_10003E8B8;
        word_10003E8B8 -= 2;
        strdup(*((const char **)a1 + 1));
        os_map_str_insert();
      }
      v17[2] = v21;
      v17[3] = 1;
      size_t result = strlcpy(v17 + 4, *((const char **)a1 + 1), v22);
      if (!__CFADD__(v17 + 4, v22))
      {
        v17[v22 + 4] = 0;
        *(_WORD *)uint64_t v17 = v25;
LABEL_28:
        sub_1000087B0((uint64_t)v26, v8, v5, (uint64_t)&v28, (uint64_t)v27, 0, (uint64_t)v17);
        free((void *)v8);
        return 0;
      }
    }
    __break(0x5513u);
  }
  return result;
}

void sub_1000087B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  v15[0] = a2;
  v15[1] = a3;
  if (a6 >= 6)
  {
    __break(0x5512u);
LABEL_8:
    __break(0x5513u);
  }
  if (1248 * (unint64_t)a6 > ~(unint64_t)qword_100030398) {
    goto LABEL_8;
  }
  BOOL v9 = &qword_100030398[156 * a6];
  sockaddr v10 = *v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100009E44;
  block[3] = &unk_10002DA50;
  void block[4] = a1;
  void block[5] = v9;
  block[6] = 1;
  block[7] = v15;
  block[8] = a4;
  block[9] = a7;
  dispatch_sync(v10, block);
  uint64_t v11 = v9[1];
  if (v11) {
    long long v12 = (NSObject **)(v11 + 16);
  }
  else {
    long long v12 = (NSObject **)v9;
  }
  int v13 = *v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = sub_100007EF4;
  v14[3] = &unk_10002D920;
  v14[4] = a1;
  v14[5] = v9;
  v14[6] = a5;
  dispatch_sync(v13, v14);
}

void sub_100008918(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 > 0xFFFFFFFFFFFFFFFCLL)
  {
    uint64_t v5 = uint64;
    string = (char *)xpc_dictionary_get_string(xdict, "prefs_name");
    if (string)
    {
      unint64_t v7 = string;
      if (!strchr(string, 47) && strlen(v7) < 0x100)
      {
        memset(__b, 170, sizeof(__b));
        if (~(unint64_t)qword_10002D710 < 8 * v5)
        {
          __break(0x5513u);
        }
        else if ((v5 & 0x1FFFFFFFFFFFFFFCLL) == 0)
        {
          uint64_t v11 = (const char *)qword_10002D710[v5];
          long long v12 = (const char *)_os_trace_prefsdir_path();
          if (snprintf(__b, 0x400uLL, "%s/%s/%s.plist", v12, v11, v7) >= 1024) {
            _os_assumes_log();
          }
          if (!unlink(__b))
          {
            dispatch_suspend((dispatch_object_t)qword_10003E948);
            if (v5 == 1) {
              sub_10001747C();
            }
            sub_100008EC8();
          }
          uint64_t v8 = a1;
          xpc_object_t v9 = xdict;
          int v10 = 0;
          goto LABEL_6;
        }
        __break(1u);
        return;
      }
    }
  }
  uint64_t v8 = a1;
  xpc_object_t v9 = xdict;
  int v10 = 22;
LABEL_6:

  sub_100008E4C(v8, v9, v10);
}

void sub_100008AAC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 > 0xFFFFFFFFFFFFFFFCLL)
  {
    uint64_t v5 = uint64;
    string = (char *)xpc_dictionary_get_string(xdict, "prefs_name");
    if (string)
    {
      unint64_t v7 = string;
      if (!strchr(string, 47) && strlen(v7) < 0x100)
      {
        memset(__b, 170, 16);
        if (!xpc_dictionary_get_data(xdict, "prefs_data", (size_t *)&__b[8]) || !*(void *)&__b[8])
        {
          int v13 = a1;
          xpc_object_t v14 = xdict;
          int v15 = 22;
LABEL_33:
          sub_100008E4C(v13, v14, v15);
          return;
        }
        memset(__b, 170, sizeof(__b));
        uint64_t v8 = (uint64_t)memset(__str, 170, sizeof(__str));
        if (~(unint64_t)qword_10002D710 < 8 * v5)
        {
          __break(0x5513u);
        }
        else if ((v5 & 0x1FFFFFFFFFFFFFFCLL) == 0)
        {
          xpc_object_t v9 = (const char *)qword_10002D710[v5];
          int v10 = (const char *)_os_trace_prefsdir_path();
          snprintf(__b, 0x400uLL, "%s/%s/%s.plist", v10, v9, v7);
          uint64_t v11 = (const char *)_os_trace_prefsdir_path();
          snprintf(__str, 0x400uLL, "%s/.%s.XXXXXXXX", v11, v7);
          dispatch_suspend((dispatch_object_t)qword_10003E948);
          if (qword_10003E9B8 != -1) {
            dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
          }
          if (byte_10003E9C0) {
            int v12 = mkstemp_dprotected_np(__str, 4, 0);
          }
          else {
            int v12 = mkstemp(__str);
          }
          int v16 = v12;
          if (v12 < 0)
          {
            int v19 = *__error();
LABEL_32:
            sub_100008EC8();
            int v13 = a1;
            xpc_object_t v14 = xdict;
            int v15 = v19;
            goto LABEL_33;
          }
          if (_os_trace_writev() == -1)
          {
            int v19 = *__error();
            if (close(v16) == -1)
            {
              int v21 = *__error();
              uint64_t v8 = *__error();
              if (v21 == 9)
              {
LABEL_41:
                qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
                qword_100031F78 = v8;
                __break(1u);
                return;
              }
              _os_assumes_log();
            }
            if (unlink(__str) == -1)
            {
              __error();
              _os_assumes_log();
            }
            goto LABEL_32;
          }
          if (fchmod(v16, 0x1A4u) == -1)
          {
            __error();
            _os_assumes_log();
          }
          if (close(v16) != -1) {
            goto LABEL_23;
          }
          int v20 = *__error();
          uint64_t v8 = *__error();
          if (v20 != 9)
          {
            _os_assumes_log();
LABEL_23:
            rename((const std::__fs::filesystem::path *)__str, (const std::__fs::filesystem::path *)__b, v17);
            if (v18 == -1)
            {
              __error();
              _os_assumes_log();
            }
            if (v5 == 1) {
              sub_10001747C();
            }
            int v19 = 0;
            goto LABEL_32;
          }
LABEL_40:
          qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_100031F78 = v8;
          __break(1u);
          goto LABEL_41;
        }
        __break(1u);
        goto LABEL_40;
      }
    }
  }

  sub_100008E4C(a1, xdict, 22);
}

void sub_100008E4C(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    BOOL v6 = reply;
    xpc_dictionary_set_int64(reply, "st", a3);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
}

void sub_100008EC8()
{
  dispatch_source_merge_data((dispatch_source_t)qword_10003E948, 1uLL);
  dispatch_resume((dispatch_object_t)qword_10003E948);
  dispatch_async_and_wait((dispatch_queue_t)qword_10003E938, &stru_10002DEE8);
  v0 = sub_100008F44(2);
  dispatch_async_and_wait(v0, &stru_10002DF08);
}

NSObject *sub_100008F44(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    sub_100025BF4(a1);
  }
  int v1 = *(NSObject **)off_10002CE48[a1 - 1];
  dispatch_retain(v1);
  return v1;
}

uint64_t sub_100008F8C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = a2 + 21;
  uint64_t v5 = strrchr((char *)(a2 + 21), 46);
  if (v5)
  {
    if ((*(unsigned __int8 *)(a2 + 20) | 8) == 8)
    {
      BOOL v6 = v5;
      int v7 = strcmp(v5, ".plist");
      BOOL v8 = (unint64_t)v6 > v4;
      xpc_object_t v9 = &v6[-v4];
      if (v8 && !v7)
      {
        id v10 = [objc_alloc((Class)NSString) initWithBytes:v4 length:v9 encoding:4];
        [*(id *)(a1 + 32) addObject:v10];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  return 0;
}

void sub_10000903C()
{
  id v0 = objc_alloc_init((Class)NSMutableSet);
  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  memset(v25, 170, sizeof(v25));
  if (!qword_10003E950)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_45:
    sub_100009CC4(v18, v19, (uint64_t)&stru_10002E0E0);

    return;
  }
  if (qword_10003E958)
  {
    dispatch_source_get_handle((dispatch_source_t)qword_10003E958);
    sub_100009D40(v0);
  }
  v25[0] = __b;
  WORD2(v25[2]) = 0;
  BYTE6(v25[2]) = 1;
  LODWORD(v25[2]) = 0x100000;
  __b[0] = 6;
  v25[1] = (void *)0x40000000004;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v1 = v0;
  id v2 = [v1 countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v34;
    do
    {
      for (char i = 0; i != v3; char i = (char *)i + 1)
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(v1);
        }
        BOOL v6 = (char *)[*(id *)(*((void *)&v33 + 1) + 8 * i) UTF8String];
        int v7 = (void *)_os_log_preferences_load();
        if (v7) {
          sub_100009794(v25, v6, v7);
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v3);
  }

  if (qword_100031F98 != -1) {
    dispatch_once(&qword_100031F98, &stru_10002CFC8);
  }
  if (qword_100031F90) {
    sub_100014068((uint64_t)v25[0], v25[1], 1, (uint64_t)&stru_10002CFA8);
  }
  id v8 = v1;
  xpc_object_t v9 = (unsigned int *)qword_10003E950;
  unint64_t v10 = qword_10003E968;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  long long v27 = sub_100009514;
  long long v28 = &unk_10002E158;
  id v11 = v8;
  id v29 = v11;
  long long v30 = v25;
  int v12 = v26;
  if (v10 >= 0x14)
  {
    do
    {
      unint64_t v13 = *v9;
      if (v10 < v13) {
        break;
      }
      uint64_t v14 = v9[1];
      if (v14 + 21 > v13) {
        break;
      }
      if (__CFADD__(v9 + 5, v14)) {
        __break(0x5513u);
      }
      if (*((unsigned char *)v9 + v14 + 20)) {
        break;
      }
      if (!v27((uint64_t)v12, v9)) {
        break;
      }
      uint64_t v15 = *v9;
      xpc_object_t v9 = (unsigned int *)((char *)v9 + v15);
      v10 -= v15;
    }
    while (v10 > 0x13);
  }

  if ((BYTE4(v25[2]) & 2) != 0)
  {
    memset(&v31[47], 170, 0x3D1uLL);
    strcpy(v31, "Logging preferences cache was larger than 1MB!");
    sub_100016E68((uint64_t)v31);
LABEL_31:
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_43;
  }
  int v16 = (const char *)_os_trace_prefsdir_path();
  snprintf(__str, 0x400uLL, "%s/.plist-cache.XXXXXXXX", v16);
  if (qword_10003E9B8 != -1) {
    dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
  }
  if (byte_10003E9C0) {
    int v17 = mkstemp_dprotected_np(__str, 4, 0);
  }
  else {
    int v17 = mkostemp(__str, 0x1000000);
  }
  int v20 = v17;
  if (v17 == -1)
  {
    __error();
    _os_assumes_log();
    goto LABEL_31;
  }
  if (unlink(__str) == -1)
  {
    __error();
    _os_assumes_log();
  }
  if (_os_trace_write() == -1)
  {
    __error();
    _os_assumes_log();
  }
  else
  {
    int v21 = mmap(0, LODWORD(v25[1]), 1, 2, v20, 0);
    if (v21 != (void *)-1)
    {
      uint64_t v18 = (uint64_t)v21;
      uint64_t v19 = LODWORD(v25[1]);
      goto LABEL_42;
    }
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
LABEL_42:
  if (close(v20) != -1) {
    goto LABEL_43;
  }
  int v23 = *__error();
  uint64_t v24 = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
LABEL_43:
    if (BYTE4(v25[2]))
    {
      size_t v22 = v25[0];
      v25[0] = (void *)3954044928;
      WORD2(v25[2]) = 0;
      free(v22);
    }
    goto LABEL_45;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = v24;
  __break(1u);
}

uint64_t sub_100009514(uint64_t a1, unsigned int *a2)
{
  id v4 = [objc_alloc((Class)NSString) initWithBytes:a2 + 5 length:a2[1] encoding:4];
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) containsObject:v4];
  if (result) {
    goto LABEL_8;
  }
  BOOL v6 = *(void **)(a1 + 40);
  if ((*((_WORD *)v6 + 10) & 2) != 0) {
    goto LABEL_8;
  }
  int v7 = *a2;
  uint64_t v8 = *((unsigned int *)v6 + 2);
  if (*((char *)v6 + 22) + *((_DWORD *)v6 + 3) - (int)v8 - 1 < *a2)
  {
    sub_1000095FC((uint64_t)v6, a2, *a2);
    goto LABEL_8;
  }
  if (!__CFADD__(*v6, v8))
  {
    uint64_t result = (uint64_t)memcpy((void *)(*v6 + v8), a2, *a2);
    uint64_t v9 = (*((_DWORD *)v6 + 2) + v7);
    *((_DWORD *)v6 + 2) = v9;
    if (*((unsigned char *)v6 + 22))
    {
LABEL_8:

      return 1;
    }
    if (!__CFADD__(*v6, v9))
    {
      *(unsigned char *)(*v6 + v9) = 0;
      goto LABEL_8;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_1000095FC(uint64_t result, void *__src, size_t __n)
{
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    size_t v3 = __n;
    uint64_t v5 = (void *)result;
    unsigned int v6 = *(_DWORD *)(result + 12);
    size_t v7 = *(char *)(result + 22) + v6 - *(_DWORD *)(result + 8) - 1;
    if (v7 < __n)
    {
      if (v6 < *(_DWORD *)(result + 16))
      {
        uint64_t result = sub_1000096CC(result, __n);
        size_t v7 = result;
      }
      if (v7 < v3)
      {
        *((_WORD *)v5 + 10) |= 2u;
        size_t v3 = v7;
      }
    }
    uint64_t v8 = *((unsigned int *)v5 + 2);
    if (__CFADD__(*v5, v8)) {
      goto LABEL_12;
    }
    uint64_t result = (uint64_t)memcpy((void *)(*v5 + v8), __src, v3);
    uint64_t v9 = (*((_DWORD *)v5 + 2) + v3);
    *((_DWORD *)v5 + 2) = v9;
    if (*((unsigned char *)v5 + 22)) {
      return result;
    }
    if (__CFADD__(*v5, v9))
    {
LABEL_12:
      __break(0x5513u);
      return result;
    }
    *(unsigned char *)(*v5 + v9) = 0;
  }
  return result;
}

uint64_t sub_1000096CC(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(unsigned char *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  unsigned int v5 = v4 + a2;
  if ((v4 + a2) >> 32)
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    unsigned int v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5) {
        unsigned int v5 = 2 * v6;
      }
      if (*(_DWORD *)(a1 + 16) >= v5) {
        unsigned int v7 = v5;
      }
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }
  if (v7 > v6)
  {
    uint64_t v8 = *(const void **)a1;
    if (*(_WORD *)(a1 + 20))
    {
      *(void *)a1 = _os_trace_realloc();
    }
    else
    {
      uint64_t v9 = (void *)_os_trace_malloc();
      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

void sub_100009794(void *a1, char *a2, void *a3)
{
  id v5 = a3;
  memset(__b, 170, sizeof(__b));
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x3810000000;
  unint64_t v22 = 0xAA01000000100000;
  uint64_t v19 = "";
  int v20 = __b;
  uint64_t v21 = 0x40000000000;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000099BC;
  applier[3] = &unk_10002E130;
  id v6 = v5;
  id v14 = v6;
  uint64_t v15 = &v16;
  xpc_dictionary_apply(v6, applier);
  memset(v23, 170, 20);
  sub_100009A7C(v23, a2);
  _os_log_preferences_compute();
  LODWORD(v23[0]) += *((_DWORD *)v17 + 10);
  sub_100009AE0(a1, a2, (unsigned int *)v23);
  if ((*((_WORD *)a1 + 10) & 2) == 0)
  {
    unsigned int v7 = (void *)v17[4];
    unsigned int v8 = *((_DWORD *)v17 + 10);
    uint64_t v9 = *((unsigned int *)a1 + 2);
    if (*((char *)a1 + 22) + *((_DWORD *)a1 + 3) - (int)v9 - 1 < v8)
    {
      sub_1000095FC((uint64_t)a1, v7, *((unsigned int *)v17 + 10));
    }
    else
    {
      if (__CFADD__(*a1, v9)) {
        goto LABEL_11;
      }
      memcpy((void *)(*a1 + v9), v7, *((unsigned int *)v17 + 10));
      uint64_t v10 = *((_DWORD *)a1 + 2) + v8;
      *((_DWORD *)a1 + 2) = v10;
      if (*((unsigned char *)a1 + 22)) {
        goto LABEL_7;
      }
      if (__CFADD__(*a1, v10)) {
LABEL_11:
      }
        __break(0x5513u);
      *(unsigned char *)(*a1 + v10) = 0;
    }
  }
LABEL_7:
  id v11 = v17;
  if (*((_WORD *)v17 + 26))
  {
    int v12 = (void *)v17[4];
    v17[4] = 3954044928;
    *((_WORD *)v11 + 26) = 0;
    free(v12);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t sub_1000099BC(uint64_t a1, char *__s1)
{
  memset(v5, 170, 20);
  if (strcmp(__s1, "DEFAULT-OPTIONS"))
  {
    sub_100009A7C(v5, __s1);
    _os_log_preferences_compute();
    sub_100009AE0((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), __s1, (unsigned int *)v5);
  }
  return 1;
}

uint64_t sub_100009A7C(_DWORD *a1, char *__s)
{
  a1[1] = strlen(__s);
  uint64_t result = os_simple_hash();
  int v4 = a1[1];
  a1[2] = result;
  if ((((_BYTE)v4 + 1) & 3) != 0) {
    int v5 = v4 - (((_BYTE)v4 + 1) & 3) + 5;
  }
  else {
    int v5 = v4 + 1;
  }
  *a1 = v5 + 20;
  return result;
}

void *sub_100009AE0(void *result, void *__src, unsigned int *a3)
{
  int v5 = result;
  if ((*((_WORD *)result + 10) & 2) == 0)
  {
    uint64_t v6 = *((unsigned int *)result + 2);
    if ((*((char *)result + 22) + *((_DWORD *)result + 3) - v6 - 1) <= 0x13)
    {
      uint64_t result = (void *)sub_1000095FC((uint64_t)result, a3, 0x14uLL);
    }
    else
    {
      if (__CFADD__(*result, v6)) {
        goto LABEL_27;
      }
      uint64_t v7 = *result + v6;
      long long v8 = *(_OWORD *)a3;
      *(_DWORD *)(v7 + 16) = a3[4];
      *(_OWORD *)uint64_t v7 = v8;
      uint64_t v9 = (*((_DWORD *)result + 2) + 20);
      *((_DWORD *)result + 2) = v9;
      if (!*((unsigned char *)result + 22))
      {
        if (__CFADD__(*result, v9)) {
          goto LABEL_27;
        }
        *(unsigned char *)(*result + v9) = 0;
      }
    }
  }
  if ((*((_WORD *)v5 + 10) & 2) == 0)
  {
    unsigned int v10 = a3[1];
    uint64_t v11 = *((unsigned int *)v5 + 2);
    if (*((char *)v5 + 22) + *((_DWORD *)v5 + 3) - (int)v11 - 1 < v10)
    {
      uint64_t result = (void *)sub_1000095FC((uint64_t)v5, __src, a3[1]);
    }
    else
    {
      if (__CFADD__(*v5, v11)) {
        goto LABEL_27;
      }
      uint64_t result = memcpy((void *)(*v5 + v11), __src, a3[1]);
      uint64_t v12 = *((_DWORD *)v5 + 2) + v10;
      *((_DWORD *)v5 + 2) = v12;
      if (!*((unsigned char *)v5 + 22))
      {
        if (__CFADD__(*v5, v12)) {
          goto LABEL_27;
        }
        *(unsigned char *)(*v5 + v12) = 0;
      }
    }
  }
  unsigned int v13 = a3[1];
  int v14 = v13 - (((_BYTE)v13 + 1) & 3) + 5;
  if ((((_BYTE)v13 + 1) & 3) == 0) {
    int v14 = v13 + 1;
  }
  if ((*((_WORD *)v5 + 10) & 2) == 0)
  {
    size_t v15 = v14 - v13;
    uint64_t v16 = *((unsigned int *)v5 + 2);
    if (*((char *)v5 + 22) + *((_DWORD *)v5 + 3) - (int)v16 - 1 >= v15)
    {
      if (!__CFADD__(*v5, v16))
      {
        uint64_t result = memcpy((void *)(*v5 + v16), &unk_10003E960, v15);
        uint64_t v17 = (*((_DWORD *)v5 + 2) + v15);
        *((_DWORD *)v5 + 2) = v17;
        if (*((unsigned char *)v5 + 22)) {
          return result;
        }
        if (!__CFADD__(*v5, v17))
        {
          *(unsigned char *)(*v5 + v17) = 0;
          return result;
        }
      }
LABEL_27:
      __break(0x5513u);
      return result;
    }
    return (void *)sub_1000095FC((uint64_t)v5, &unk_10003E960, v15);
  }
  return result;
}

void sub_100009CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000069A8;
  block[3] = &unk_10002CDC0;
  void block[5] = a2;
  block[6] = a1;
  void block[4] = a3;
  dispatch_async((dispatch_queue_t)qword_100030298, block);
}

uint64_t sub_100009D40(void *a1)
{
  uint64_t v9 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  id v4 = a1;
  id v1 = v4;
  _os_trace_fdscandir_b();
  _os_trace_scandir_free_namelist();
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100009E44(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 8);
  size_t v5 = v4 + 16;
  if ((v4 & 7) != 0) {
    unint64_t v6 = (v4 & 0xFFFFFFFFFFFFFFF8) + 24;
  }
  else {
    unint64_t v6 = v4 + 16;
  }
  uint64_t result = (uint64_t)sub_100010284(v2, v6);
  uint64_t v8 = *(void *)(a1 + 40) + 48;
  if (__CFADD__(v8, 264 * result)) {
    goto LABEL_30;
  }
  unsigned int v9 = result;
  if (v6 >= *(unsigned int *)(v8 + 264 * result + 248))
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
    goto LABEL_30;
  }
  if ((int)*(void *)(a1 + 48) >= 1)
  {
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)(a1 + 56);
    unint64_t v12 = ~v11;
    uint64_t v13 = v11 + 8;
    size_t v14 = v5;
    while (v10 <= v12)
    {
      v14 -= *(void *)(v13 + v10);
      v10 += 16;
      if (16 * *(void *)(a1 + 48) == v10) {
        goto LABEL_12;
      }
    }
    goto LABEL_30;
  }
  size_t v14 = v5;
LABEL_12:
  uint64_t v15 = v8 + 264 * result;
  uint64_t v18 = *(void *)(v15 + 240);
  uint64_t v17 = (void *)(v15 + 240);
  uint64_t v16 = v18;
  int v20 = (int32x2_t *)((char *)v17 + 12);
  uint64_t v19 = *((unsigned int *)v17 + 3);
  if (__CFADD__(v18, v19)) {
    goto LABEL_30;
  }
  uint64_t result = (uint64_t)memcpy((void *)(v16 + v19), *(const void **)(a1 + 32), v14);
  unsigned int v21 = v20->i32[0] + v14;
  v20->i32[0] = v21;
  if (*(int *)(a1 + 48) >= 1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    while (!__CFADD__(*v17, v21))
    {
      uint64_t v24 = *(void *)(a1 + 56);
      if (__CFADD__(v24, v22)) {
        break;
      }
      uint64_t result = (uint64_t)memcpy((void *)(*v17 + v21), *(const void **)(v24 + v22), *(void *)(v24 + v22 + 8));
      uint64_t v25 = *(void *)(a1 + 56);
      if (__CFADD__(v25, v22)) {
        break;
      }
      unsigned int v21 = v20->i32[0] + *(_DWORD *)(v25 + v22 + 8);
      v20->i32[0] = v21;
      ++v23;
      v22 += 16;
      if (v23 >= *(int *)(a1 + 48)) {
        goto LABEL_19;
      }
    }
    goto LABEL_30;
  }
LABEL_19:
  if (__CFADD__(*v17, v21))
  {
LABEL_30:
    __break(0x5513u);
    return result;
  }
  size_t v26 = v6 - v5;
  bzero((void *)(*v17 + v21), v26);
  *int v20 = vadd_s32(*v20, (int32x2_t)(v26 | 0x100000000));
  uint64_t v28 = *(void *)(a1 + 64);
  long long v27 = *(unsigned __int8 **)(a1 + 72);
  uint64_t v29 = v8 + 264 * v9;
  long long v31 = *(void **)(v29 + 232);
  long long v30 = (float **)(v29 + 232);
  uint64_t result = (uint64_t)sub_10000FA14(v31, *(void *)(v28 + 32), *(_DWORD *)(v28 + 28));
  uint64_t v32 = result;
  if (result)
  {
    if (!v27) {
      return result;
    }
  }
  else
  {
    uint64_t v32 = _os_trace_malloc();
    *(_OWORD *)uint64_t v32 = *(_OWORD *)v28;
    long long v33 = *(_OWORD *)(v28 + 64);
    long long v35 = *(_OWORD *)(v28 + 16);
    long long v34 = *(_OWORD *)(v28 + 32);
    *(_OWORD *)(v32 + 48) = *(_OWORD *)(v28 + 48);
    *(_OWORD *)(v32 + 64) = v33;
    *(_OWORD *)(v32 + 16) = v35;
    *(_OWORD *)(v32 + 32) = v34;
    uint64_t v36 = _os_trace_calloc();
    *(void *)uint64_t v36 = 16;
    *(unsigned char *)(v36 + 8) = 1;
    *(void *)(v36 + 16) = _os_trace_calloc();
    *(void *)(v32 + 80) = v36;
    uint64_t result = sub_10000FE0C(v30, *(void *)(v28 + 32), *(_DWORD *)(v28 + 28), v32);
    if (!v27) {
      return result;
    }
  }
  uint64_t result = sub_10000EA0C(*(void *)(v32 + 80), (uint64_t)v27);
  if (!result)
  {
    size_t v37 = v27[2] + (unint64_t)v27[3] + 4;
    long long v38 = (void *)_os_trace_malloc();
    memcpy(v38, v27, v37);
    int v39 = *(int **)(v32 + 80);
    return sub_10000EAA0(v39, v38, (uint64_t)v38);
  }
  return result;
}

uint64_t sub_10000A124(int a1, mach_port_t a2)
{
  uint64_t context = dispatch_mach_mig_demux_get_context();
  if (!context) {
    return 5;
  }
  unint64_t v5 = context;
  int v6 = *(_DWORD *)(context + 116);
  if (*(unsigned char *)(context + 144))
  {
    sub_100025A78(context, a2);
  }
  else
  {
    BOOL v7 = v6 == a1;
    BOOL v8 = v6 == a1;
    unsigned int v9 = &qword_100030288;
    if (!v7) {
      unsigned int v9 = &qword_100030298;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)*v9);
    sub_10000A3C8(v5, a2, v8);
  }
  return 4294966991;
}

void sub_10000A1B4(uint64_t a1)
{
  uint64_t v23 = (atomic_ullong *)(a1 + 8);
  if (*(void *)(a1 + 8))
  {
    uint64_t v2 = 0;
    unint64_t v3 = a1 - (void)dword_100030270 - 120;
    uint64_t v4 = (v3 >> 4) & 1;
    int v5 = 16 << ((v3 & 0x10) != 0);
    int v6 = 256 << ((v3 & 0x10) != 0);
    int v7 = ~(17 << ((v3 & 0x10) != 0));
    unint64_t v22 = v3;
    if ((v3 & 0x20) != 0) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 4;
    }
    while (2)
    {
      unsigned int v9 = *(atomic_ushort **)a1;
      if (!*(void *)a1) {
        unsigned int v9 = (atomic_ushort *)_dispatch_wait_for_enqueuer();
      }
      do
      {
        unint64_t v10 = &v9[4 * v4];
        uint64_t v11 = *((void *)v10 + 4);
        *(void *)a1 = v11;
        if (!v11)
        {
          uint64_t v17 = (uint64_t *)(v10 + 16);
          atomic_ullong v18 = *v23;
          while (v9 == (atomic_ushort *)(v18 & 0xFFFFFFFFFFFFFFF8))
          {
            atomic_ullong v19 = v18;
            atomic_compare_exchange_strong_explicit(v23, (unint64_t *)&v19, 0, memory_order_release, memory_order_relaxed);
            BOOL v20 = v19 == v18;
            atomic_ullong v18 = v19;
            if (v20) {
              goto LABEL_8;
            }
          }
          uint64_t v11 = *v17;
          if (!*v17) {
            uint64_t v11 = _dispatch_wait_for_enqueuer();
          }
          *(void *)a1 = v11;
        }
LABEL_8:
        int v12 = (unsigned __int16)v9[70];
        do
        {
          unsigned __int16 v13 = v12;
          __int16 v14 = v12 & v7;
          if ((v12 & v5) != 0) {
            __int16 v15 = v6;
          }
          else {
            __int16 v15 = 0;
          }
          unsigned __int16 v16 = v15 | v14;
          atomic_compare_exchange_strong_explicit(v9 + 70, (unsigned __int16 *)&v12, v15 | v14, memory_order_relaxed, memory_order_relaxed);
        }
        while (v12 != v13);
        if (((v16 ^ v13) & 0x300) != 0 && (v16 & 0x300) == 0x300) {
          dispatch_async_f((dispatch_queue_t)qword_100030288, v9, (dispatch_function_t)sub_1000139F4);
        }
        if (((unsigned __int16)v6 & v16) == 0) {
          sub_10000A3C8((unint64_t)v9, 0, v4);
        }
        if (++v2 == v8)
        {
          unsigned int v21 = *(NSObject **)&dword_100030270[2 * ((v22 >> 4) & 3) + 46];
          dispatch_source_merge_data(v21, 1uLL);
          return;
        }
        unsigned int v9 = (atomic_ushort *)v11;
      }
      while (v11);
      if (*v23) {
        continue;
      }
      break;
    }
  }
}

void sub_10000A3C8(unint64_t a1, mach_port_t a2, int a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v51 = a3 & 1;
  int v5 = (uint64_t *)(a1 + 56);
  int v6 = (uint64_t *)(a1 + 64);
  int v7 = (unsigned char *)(a1 + 146);
  uint64_t v8 = 4;
  if (a3)
  {
    int v7 = (unsigned char *)(a1 + 145);
    int v5 = (uint64_t *)(a1 + 72);
    int v6 = (uint64_t *)(a1 + 80);
    uint64_t v9 = v4 + 128;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
  }
  if (a3) {
    uint64_t v8 = 3;
  }
  uint64_t v55 = v8;
  uint64_t v56 = *(void *)(a1 + 48);
  uint64_t v52 = *v5;
  uint64_t v10 = *v6;
  if (*v7) {
    uint64_t v11 = (dispatch_group_t *)off_1000302A8;
  }
  else {
    uint64_t v11 = 0;
  }
  if (*(unsigned char *)(a1 + 144))
  {
LABEL_79:
    if (v11)
    {
      if (v51) {
        *(unsigned char *)(v3 + 145) = 0;
      }
      else {
        *(unsigned char *)(v3 + 146) = 0;
      }
      dispatch_group_leave(v11[1]);
    }
    sub_100025A78(v3, a2);
    if (*(_DWORD *)(v3 + 128))
    {
      LOWORD(v43) = *(_WORD *)(v3 + 140);
      while (1)
      {
        int v44 = (unsigned __int16)v43;
        if (((272 << v51) & (unsigned __int16)v43) != 0) {
          break;
        }
        int v43 = (unsigned __int16)v43;
        atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(v3 + 140), (unsigned __int16 *)&v43, v43 | (17 << v51), memory_order_relaxed, memory_order_relaxed);
        if (v43 == v44)
        {
          if (v3 && ((1 << v51) & v44) == 0)
          {
            uint64_t v45 = v51 | (2 * *(unsigned __int8 *)(v3 + 147));
            *(void *)(v3 + 8 * v51 + 32) = 0;
            unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
            *(void *)(StatusReg + 976) = &dword_100030270[4 * v45 + 32];
            unint64_t v47 = atomic_exchange_explicit((atomic_ullong *volatile)&dword_100030270[4 * v45 + 32], v3, memory_order_release);
            if (v47)
            {
              *(void *)(v47 + 8 * v51 + 32) = v3;
              *(void *)(StatusReg + 976) = 0;
            }
            else
            {
              *(void *)&dword_100030270[4 * v45 + 30] = v3;
              *(void *)(StatusReg + 976) = 0;
              long long v48 = *(NSObject **)&dword_100030270[2 * v45 + 46];
              dispatch_source_merge_data(v48, 1uLL);
            }
          }
          return;
        }
      }
    }
    return;
  }
  unsigned __int16 v12 = 0;
  __int16 v57 = *v6;
  uint64_t v13 = 320;
  if (a3) {
    uint64_t v13 = 384;
  }
  long long v53 = (atomic_ushort *)(v4 + v13);
  lock = (os_unfair_lock_s *)(a1 + 124);
  while ((unsigned __int16)v10 != (unsigned __int16)(v57 + v12))
  {
    do
LABEL_16:
      uint64_t v15 = *(_WORD *)(v9 + 2 * (((_BYTE)v57 + (_BYTE)v12) & 0x3F)) & 0x3F;
    while (!(*(_DWORD *)(v3 + 128) | v15));
    if ((*(_WORD *)(v9 + 2 * (((_BYTE)v57 + (_BYTE)v12) & 0x3F)) & 0x3F) != 0)
    {
      unint64_t v16 = v3;
      uint64_t v17 = (unsigned int *)(v56 + (v15 << 12));
      uint64_t v18 = *((unsigned __int16 *)v17 + 2);
      uint64_t v19 = *v17;
      uint64_t v20 = *((unsigned __int8 *)v17 + 6);
      uint64_t v21 = *((unsigned __int8 *)v17 + 7);
      if (v20 == 3) {
        os_unfair_lock_lock(lock);
      }
      uint64_t v22 = (v19 | (v18 << 32)) & 0xFFFFFFFFFFFFLL | (v20 << 48) | (v21 << 56);
      unint64_t v3 = v16;
      (*((void (**)(void *, unint64_t, uint64_t, unsigned int *, uint64_t))off_1000302A0 + 2))(off_1000302A0, v16, v55, v17, v22);
      if (v11) {
        ((void (*)(void))(*v11)[2].isa)();
      }
      if (v20 == 3) {
        os_unfair_lock_unlock(lock);
      }
    }
    if (++v12 >= 4u && !v11) {
      goto LABEL_28;
    }
  }
  HIWORD(v14) = WORD1(v53);
  LOWORD(v14) = atomic_load_explicit(v53, memory_order_acquire);
  if (v14 != (unsigned __int16)v10)
  {
    LOWORD(v10) = v14;
    if ((unsigned __int16)(v14 - v52) > 0x3Fu) {
      goto LABEL_79;
    }
    goto LABEL_16;
  }
  if (!v12) {
    goto LABEL_74;
  }
LABEL_28:
  uint64_t v23 = v51;
  uint64_t v24 = 64;
  if (v51) {
    uint64_t v24 = 80;
  }
  uint64_t v25 = 258;
  if (v51) {
    uint64_t v25 = 262;
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + v24), v12, memory_order_relaxed);
  if (!*(_DWORD *)(v3 + 128)) {
    goto LABEL_51;
  }
  mach_port_t v26 = a2;
  if (a2)
  {
    if (v11) {
      goto LABEL_77;
    }
    goto LABEL_35;
  }
  if (*(unsigned __int16 *)(v56 + v25) != (unsigned __int16)v52)
  {
    mach_port_t v26 = 0;
    if (v11) {
      goto LABEL_77;
    }
  }
  else
  {
LABEL_51:
    mach_port_t v26 = *(_DWORD *)(v3 + 120);
    if (v11) {
      goto LABEL_77;
    }
  }
LABEL_35:
  if (v26)
  {
    while (1)
    {
      unint64_t v58 = 0;
      unint64_t v59 = 0;
      unint64_t v27 = *(void *)(v3 + 64);
      unint64_t v28 = *(void *)(v3 + 80);
      unint64_t v58 = v27;
      unint64_t v59 = v28;
      unint64_t v29 = *(void *)(v3 + 56);
      do
      {
        if (v29 >= v27) {
          break;
        }
        unint64_t v30 = v29;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(v3 + 56), &v30, v27, memory_order_relaxed, memory_order_relaxed);
        BOOL v31 = v30 == v29;
        unint64_t v29 = v30;
      }
      while (!v31);
      unint64_t v32 = *(void *)(v3 + 72);
      do
      {
        if (v32 >= v28) {
          break;
        }
        unint64_t v33 = v32;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(v3 + 72), &v33, v28, memory_order_relaxed, memory_order_relaxed);
        BOOL v31 = v33 == v32;
        unint64_t v32 = v33;
      }
      while (!v31);
      if (!*(_DWORD *)(v3 + 128)) {
        break;
      }
      if (*(_DWORD *)(v3 + 120) == v26) {
        int v34 = sub_10000C18C(v26, v27, v28, *(unsigned __int8 *)(v3 + 147), 0);
      }
      else {
        int v34 = sub_100012830(v26, 0, v27, v28, *(unsigned __int8 *)(v3 + 147));
      }
      if (v34 != -301)
      {
        if (v34 == 268435459 || !v34) {
          goto LABEL_57;
        }
LABEL_98:
        _dispatch_bug();
        goto LABEL_57;
      }
      qword_100031F48 = (uint64_t)"MIG_REPLY_MISMATCH";
      qword_100031F78 = -301;
      __break(1u);
LABEL_74:
      unsigned __int16 v12 = 0;
      uint64_t v23 = v51;
      mach_port_t v26 = a2;
      if (!v11) {
        goto LABEL_35;
      }
LABEL_77:
      sub_10000A9A4(v3, (uint64_t)v11, v23);
      if (v23) {
        *(unsigned char *)(v3 + 145) = 0;
      }
      else {
        *(unsigned char *)(v3 + 146) = 0;
      }
      dispatch_group_leave(v11[1]);
      if (!v26) {
        goto LABEL_57;
      }
    }
    if ((ioctl(dword_1000302B8, 0x80107451uLL, &v58) & 0x80000000) == 0
      || !**(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8))
    {
      goto LABEL_57;
    }
    goto LABEL_98;
  }
LABEL_57:
  if (*(_DWORD *)(v3 + 128))
  {
    if (v12 >= 4u)
    {
      int v35 = 1 << v23;
      uint64_t v36 = *(unsigned __int16 *)(v3 + 140);
      while (1)
      {
        int v37 = (256 << v23) & (unsigned __int16)v36;
        int v38 = (unsigned __int16)(v35 & v36);
        if (v37 | v38) {
          break;
        }
        uint64_t v39 = v36;
        atomic_compare_exchange_strong_explicit((atomic_ushort *volatile)(v3 + 140), (unsigned __int16 *)&v39, v36 | v35, memory_order_relaxed, memory_order_relaxed);
        BOOL v31 = v39 == (unsigned __int16)v36;
        uint64_t v36 = v39;
        if (v31) {
          goto LABEL_63;
        }
      }
      if (v37) {
        goto LABEL_67;
      }
LABEL_63:
      if (v3 && !v38)
      {
        uint64_t v40 = v23 | (2 * *(unsigned __int8 *)(v3 + 147));
        *(void *)(v3 + 8 * v23 + 32) = 0;
        unint64_t v41 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        *(void *)(v41 + 976) = &dword_100030270[4 * v40 + 32];
        unint64_t v42 = atomic_exchange_explicit((atomic_ullong *volatile)&dword_100030270[4 * v40 + 32], v3, memory_order_release);
        if (v42)
        {
          *(void *)(v42 + 8 * v23 + 32) = v3;
          *(void *)(v41 + 976) = 0;
        }
        else
        {
          *(void *)&dword_100030270[4 * v40 + 30] = v3;
          *(void *)(v41 + 976) = 0;
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_100030270[2 * v40 + 46], 1uLL);
        }
      }
    }
LABEL_67:
    if (v12)
    {
      if (off_1000302B0) {
        sub_10000A3C8(off_1000302B0, 0, a3 | 2u);
      }
    }
  }
  else if ((a3 & 2) == 0)
  {
    dispatch_resume(*(dispatch_object_t *)(v3 + 96));
  }
}

uint64_t sub_10000A9A4(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(result + 48);
  uint64_t v4 = (unsigned __int16 *)(v3 + 260);
  int v5 = (uint64_t *)(result + 80);
  if (a3)
  {
    uint64_t v6 = v3 + 128;
  }
  else
  {
    uint64_t v4 = (unsigned __int16 *)(v3 + 256);
    int v5 = (uint64_t *)(result + 64);
    uint64_t v6 = *(void *)(result + 48);
  }
  int v7 = *v4;
  uint64_t v8 = *v5;
  if ((unsigned __int16)(*v5 - v7) <= 0x3Fu)
  {
    uint64_t v11 = -2;
    if (v7 != (unsigned __int16)v8)
    {
      do
        v11 &= ~(1 << *(_WORD *)(v6 + 2 * (v7++ & 0x3F)));
      while ((unsigned __int16)v7 != (unsigned __int16)v8);
    }
    for (unint64_t i = *(void *)(v3 + 520) & v11; i; i &= ~(1 << v13))
    {
      unint64_t v13 = __clz(__rbit64(i));
      int v14 = (unsigned __int16 *)(v3 + (v13 << 12));
      if (*v14 >= 0x11uLL && v14[19] && ((*((unsigned char *)v14 + 7) & 2) == 0) != a3) {
        uint64_t result = (*(uint64_t (**)(void))(*(void *)a2 + 16))();
      }
    }
  }
  else
  {
    *(unsigned char *)(result + 144) = 1;
  }
  return result;
}

void sub_10000AAE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a3)
  {
    case 1:
      if (*(unsigned char *)(a1 + 56))
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 0x40000000;
        v24[2] = sub_10001251C;
        v24[3] = &unk_10002D200;
        uint64_t v8 = *(NSObject ***)(a1 + 40);
        uint64_t v25 = *(NSObject **)(a1 + 32);
        mach_port_t v26 = v8;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 0x40000000;
        unint64_t v28 = sub_10001252C;
        unint64_t v29 = &unk_10002D368;
        unint64_t v30 = v24;
        sub_100012130((uint64_t)qword_100030398, v25, v8);
        v28((uint64_t)v27, 1u);
        v28((uint64_t)v27, 2u);
        v28((uint64_t)v27, 3u);
      }
      break;
    case 2:
      if (*(unsigned char *)(a1 + 57))
      {
        uint64_t v9 = *(NSObject **)(a1 + 32);
        uint64_t v10 = *(NSObject ***)(a1 + 40);
        sub_100012130((uint64_t)&unk_100031718, v9, v10);
      }
      break;
    case 3:
    case 4:
      if ((unsigned __int16)a5 <= 0x1000uLL && (a5 & 0xFFFF0000) <= 0x10000000uLL)
      {
        switch(BYTE6(a5))
        {
          case 0:
          case 1:
          case 4:
            if (*(unsigned char *)(a1 + 56))
            {
              v17[0] = _NSConcreteStackBlock;
              v17[1] = 0x40000000;
              v17[2] = sub_100012E3C;
              v17[3] = &unk_10002D240;
              uint64_t v6 = *(NSObject **)(a1 + 48);
              v17[4] = *(void *)(a1 + 40);
              v17[5] = a4;
              v17[6] = a5;
              v17[7] = a2;
              int v7 = v17;
              goto LABEL_18;
            }
            break;
          case 2:
            if (*(unsigned char *)(a1 + 57))
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000;
              block[2] = sub_100012F0C;
              block[3] = &unk_10002D220;
              uint64_t v6 = *(NSObject **)(a1 + 48);
              void block[4] = *(void *)(a1 + 40);
              void block[5] = a4;
              int v19 = a5;
              __int16 v20 = WORD2(a5);
              char v21 = 2;
              char v22 = HIBYTE(a5);
              uint64_t v23 = a2;
              int v7 = block;
LABEL_18:
              dispatch_sync(v6, v7);
            }
            break;
          case 3:
            sub_10000AF08();
            break;
          default:
            return;
        }
      }
      break;
    case 5:
      uint64_t v11 = *(NSObject **)(a1 + 32);
      dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &stru_10002D8D8);
      dispatch_group_async(v11, (dispatch_queue_t)qword_10003E8E8, v12);
      _Block_release(v12);
      unint64_t v13 = qword_10003E938;
      int v14 = *(id *)(a1 + 32);
      dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &stru_10002DF88);
      dispatch_group_async(v14, v13, v15);

      unint64_t v16 = *(NSObject **)(a1 + 32);
      dispatch_group_leave(v16);
      break;
    default:
      return;
  }
}

void sub_10000AF08()
{
  uint64_t v0 = __chkstk_darwin();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v4 = sub_10000F3F4(v0);
  memcpy(__dst, v2, sizeof(__dst));
  int v5 = &__dst[8];
  uint64_t v6 = (char *)&__dst[8];
  if (__dst[0] <= 0x1000uLL)
  {
    if (__CFADD__(__dst, __dst[0])) {
      goto LABEL_136;
    }
    uint64_t v6 = (char *)__dst + __dst[0];
  }
  unint64_t v7 = 16;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  while (1)
  {
    uint64_t v9 = (char *)(v5 + 12);
    if (v5 + 12 >= (_WORD *)v6) {
      break;
    }
    unint64_t v10 = v7;
    if (v7 - 4073 < 0xFFFFFFFFFFFFF007) {
      goto LABEL_135;
    }
    uint64_t v11 = (uint64_t)v5;
    unint64_t v12 = *((void *)v5 + 2);
    unint64_t v13 = HIWORD(v12);
    if (!HIWORD(v12) || (uint64_t)v13 > v6 - v9) {
      break;
    }
    uint64_t v15 = v13 + 24;
    if ((v12 & 0x7000000000000) != 0) {
      uint64_t v15 = (HIWORD(v12) & 0xFFF8) + 32;
    }
    if (__CFADD__(v5, v15)) {
      goto LABEL_136;
    }
    if (v7 > 0xFF8) {
      goto LABEL_135;
    }
    v7 += v15;
    int v5 = (_WORD *)((char *)v5 + v15);
    unint64_t v16 = *(void *)v11;
    if (*(void *)v11)
    {
      v69[0] = v8;
      v69[1] = v8;
      __int16 v68 = 0;
      int v67 = -1431655766;
      if (v16 == 5)
      {
        if ((v16 & 0x10000) != 0)
        {
          if (v12 >> 51)
          {
            __int16 v68 = 8;
            unint64_t v17 = 8;
            if ((v16 & 0x100000) != 0) {
              goto LABEL_23;
            }
          }
          else
          {
            __int16 v68 = HIWORD(v12);
            unint64_t v17 = HIWORD(v12);
            if ((v16 & 0x100000) != 0)
            {
LABEL_23:
              if (v17 + 8 > v13)
              {
                __int16 v68 = HIWORD(v12);
                unint64_t v17 = HIWORD(v12);
              }
              else
              {
                __int16 v68 = v17 + 8;
                if (__CFADD__(v9, v17)) {
                  goto LABEL_136;
                }
                unint64_t v17 = (unsigned __int16)(v17 + 8);
              }
            }
          }
        }
        else
        {
          unint64_t v17 = 0;
          if ((v16 & 0x100000) != 0) {
            goto LABEL_23;
          }
        }
        int v18 = BYTE1(v16) - 1;
        unint64_t v19 = v10 + 24;
        unint64_t v20 = HIDWORD(v16);
        switch(v18)
        {
          case 0:
            if ((v20 - 1) < 2)
            {
              char v21 = (unsigned __int8 *)sub_10000C6BC(v11, &v68);
              *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (!v21) {
                continue;
              }
              char v22 = v21;
              if (*(_DWORD *)(v11 + 4) == 1)
              {
                uuid_copy((unsigned __int8 *)v69 + 14, v21);
                uint64_t v23 = *((void *)v22 + 2);
                uint64_t v24 = *((void *)v22 + 3);
                DWORD2(v69[0]) = v23;
                WORD6(v69[0]) = WORD2(v23);
                *(void *)&v69[0] = v24;
                sub_10000C764(v4, (uint64_t)v69);
              }
              else
              {
                sub_10000C91C(v4, (uint64_t *)v21);
              }
              BOOL v31 = (const char *)(v22 + 32);
              unint64_t v30 = v22;
              int v32 = 1;
              goto LABEL_81;
            }
            if (v20 != 3 || v17 + 32 > v13) {
              continue;
            }
            __int16 v68 = v17 + 32;
            if (__CFADD__(v9, v17)) {
              goto LABEL_136;
            }
            os_unfair_lock_lock_with_options();
            unint64_t v41 = *(uint64_t **)(v4 + 80);
            if (v41)
            {
              int8x8_t v42 = (int8x8_t)v41[1];
              if (v42)
              {
                uint64_t v43 = *(void *)&v9[v17];
                uint64_t v44 = *(void *)&v9[v17 + 8];
                uint64_t v45 = __ROR8__(v44 + 16, 16);
                unint64_t v46 = 0x9DDFEA08EB382D69
                    * (v45 ^ ((0x9DDFEA08EB382D69 * (v43 ^ v45)) >> 47) ^ (0x9DDFEA08EB382D69 * (v43 ^ v45)));
                unint64_t v47 = (0x9DDFEA08EB382D69 * (v46 ^ (v46 >> 47))) ^ v44;
                uint8x8_t v48 = (uint8x8_t)vcnt_s8(v42);
                v48.i16[0] = vaddlv_u8(v48);
                if (v48.u32[0] > 1uLL)
                {
                  unint64_t v49 = v47;
                  if (v47 >= *(void *)&v42) {
                    unint64_t v49 = v47 % *(void *)&v42;
                  }
                }
                else
                {
                  unint64_t v49 = v47 & (*(void *)&v42 - 1);
                }
                uint64_t v55 = *v41;
                uint64_t v56 = *(uint64_t ***)(*v41 + 8 * v49);
                if (v56)
                {
                  __int16 v57 = *v56;
                  if (*v56)
                  {
                    uint64_t v58 = *(void *)&v42 - 1;
                    do
                    {
                      unint64_t v59 = v57[1];
                      if (v59 == v47)
                      {
                        if (v57[2] == v43 && v57[3] == v44)
                        {
                          if (v48.u32[0] > 1uLL)
                          {
                            if (v47 >= *(void *)&v42) {
                              v47 %= *(void *)&v42;
                            }
                          }
                          else
                          {
                            v47 &= v58;
                          }
                          long long v61 = *(uint64_t **)(v55 + 8 * v47);
                          do
                          {
                            long long v62 = v61;
                            long long v61 = (uint64_t *)*v61;
                          }
                          while (v61 != v57);
                          if (v62 == v41 + 2) {
                            goto LABEL_120;
                          }
                          unint64_t v63 = v62[1];
                          if (v48.u32[0] > 1uLL)
                          {
                            if (v63 >= *(void *)&v42) {
                              v63 %= *(void *)&v42;
                            }
                          }
                          else
                          {
                            v63 &= v58;
                          }
                          if (v63 != v47)
                          {
LABEL_120:
                            if (!*v57) {
                              goto LABEL_121;
                            }
                            unint64_t v64 = *(void *)(*v57 + 8);
                            if (v48.u32[0] > 1uLL)
                            {
                              if (v64 >= *(void *)&v42) {
                                v64 %= *(void *)&v42;
                              }
                            }
                            else
                            {
                              v64 &= v58;
                            }
                            if (v64 != v47) {
LABEL_121:
                            }
                              *(void *)(v55 + 8 * v47) = 0;
                          }
                          uint64_t v65 = *v57;
                          if (*v57)
                          {
                            unint64_t v66 = *(void *)(v65 + 8);
                            if (v48.u32[0] > 1uLL)
                            {
                              if (v66 >= *(void *)&v42) {
                                v66 %= *(void *)&v42;
                              }
                            }
                            else
                            {
                              v66 &= v58;
                            }
                            if (v66 != v47)
                            {
                              *(void *)(*v41 + 8 * v66) = v62;
                              uint64_t v65 = *v57;
                            }
                          }
                          *long long v62 = v65;
                          *__int16 v57 = 0;
                          --v41[3];
                          operator delete(v57);
                          break;
                        }
                      }
                      else
                      {
                        if (v48.u32[0] > 1uLL)
                        {
                          if (v59 >= *(void *)&v42) {
                            v59 %= *(void *)&v42;
                          }
                        }
                        else
                        {
                          v59 &= v58;
                        }
                        if (v59 != v49) {
                          break;
                        }
                      }
                      __int16 v57 = (uint64_t *)*v57;
                    }
                    while (v57);
                  }
                }
              }
            }
LABEL_78:
            os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 132));
            goto LABEL_82;
          case 1:
            if (v17 + 4 > v13) {
              continue;
            }
            if (~(unint64_t)v9 < v17) {
              goto LABEL_136;
            }
            unint64_t v25 = v19 + v17;
            if (v25 - 4094 < 0xFFFFFFFFFFFFF000 || v25 - 4093 < 0xFFFFFFFFFFFFF000) {
              goto LABEL_135;
            }
            if (v9[v17 + 2]
               + (unint64_t)(unsigned __int16)(v17 + 4)
               + v9[v17 + 3] > v13)
            {
              __int16 v68 = HIWORD(v12);
            }
            else
            {
              __int16 v68 = v9[v17 + 2] + v17 + 4 + v9[v17 + 3];
              if ((unsigned __int16)(v17 + 4) > ~(unint64_t)v9) {
                goto LABEL_136;
              }
              mach_port_t v26 = (unsigned __int8 *)sub_10000B6D4((uint64_t)&v9[v17]);
              *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (v26)
              {
                sub_10000B734(v4, v26);
                goto LABEL_82;
              }
            }
            continue;
          case 2:
            if (v17 + 32 > v13) {
              continue;
            }
            __int16 v68 = v17 + 32;
            if (__CFADD__(v9, v17)) {
              goto LABEL_136;
            }
            unint64_t v27 = v19 + v17;
            unint64_t v28 = &v9[v17];
            if (v20 == 2)
            {
              os_unfair_lock_lock_with_options();
              unsigned __int16 v50 = *(_WORD *)(v4 + 130);
              if (!v50) {
                goto LABEL_78;
              }
              uint64_t v51 = 0;
              unint64_t v52 = 0;
              while (1)
              {
                uint64_t v53 = *(void *)(v4 + 72);
                if (__CFADD__(v53, v51)) {
                  break;
                }
                if (v27 > 0xFF8) {
                  goto LABEL_135;
                }
                if (*(void *)(v53 + v51 + 14) == *(void *)v28)
                {
                  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFF7
                    || (unint64_t)(v53 + v51 + 14) > 0xFFFFFFFFFFFFFFF7)
                  {
                    break;
                  }
                  if (v27 - 4081 < 0xFFFFFFFFFFFFF007) {
                    goto LABEL_135;
                  }
                  uint64_t v54 = v53 + v51;
                  if (*(void *)(v54 + 22) == *((void *)v28 + 1))
                  {
                    *(_WORD *)(v54 + 12) = 0;
                    *(_DWORD *)(v54 + 8) = 0;
                    *(void *)uint64_t v54 = 0;
                    unsigned __int16 v50 = *(_WORD *)(v4 + 130);
                  }
                }
                ++v52;
                v51 += 32;
                if (v52 >= v50) {
                  goto LABEL_78;
                }
              }
LABEL_136:
              __break(0x5513u);
            }
            if (v20 == 1)
            {
              uuid_copy((unsigned __int8 *)v69 + 14, (const unsigned __int8 *)&v9[v17]);
              if (v27 - 4073 < 0xFFFFFFFFFFFFF007
                || (uint64_t v29 = *((void *)v28 + 2),
                    DWORD2(v69[0]) = v29,
                    WORD6(v69[0]) = WORD2(v29),
                    v27 - 4065 < 0xFFFFFFFFFFFFF007))
              {
LABEL_135:
                __break(1u);
                goto LABEL_136;
              }
              *(void *)&v69[0] = *((void *)v28 + 3);
              sub_10000C764(v4, (uint64_t)v69);
              if (qword_10003E9E8 != -1) {
                dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
              }
              *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (!byte_100031F3C)
              {
                unint64_t v30 = (unsigned __int8 *)&v9[v17];
                BOOL v31 = 0;
                int v32 = 2;
LABEL_81:
                sub_10000C24C(v30, v31, 0, v32);
LABEL_82:
                *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
              }
            }
            break;
          case 3:
            sub_10000FDD4(v3, &v67);
            *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (v67) {
              continue;
            }
            unint64_t v33 = (const unsigned __int8 *)sub_10000C6BC(v11, &v68);
            *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (!v33) {
              continue;
            }
            int v34 = (unsigned __int8 *)v33;
            uuid_copy((unsigned __int8 *)v69 + 14, v33);
            uint64_t v35 = *((void *)v34 + 2);
            uint64_t v36 = *((void *)v34 + 3);
            DWORD2(v69[0]) = v35;
            WORD6(v69[0]) = WORD2(v35);
            *(void *)&v69[0] = v36;
            sub_10000C764(v4, (uint64_t)v69);
            int v37 = *(_DWORD *)(v11 + 4);
            if (v37 == 8)
            {
              BOOL v31 = (const char *)(v34 + 32);
              unint64_t v30 = v34;
              int v32 = 8;
            }
            else
            {
              *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (v37 != 16) {
                continue;
              }
              BOOL v31 = (const char *)(v34 + 32);
              unint64_t v30 = v34;
              int v32 = 4;
            }
            goto LABEL_81;
          case 4:
            if (v20 != 1 || v17 + 32 > v13) {
              continue;
            }
            __int16 v68 = v17 + 32;
            if (__CFADD__(v9, v17)) {
              goto LABEL_136;
            }
            unint64_t v38 = v19 + v17;
            uint64_t v39 = &v9[v17];
            uuid_copy((unsigned __int8 *)v69 + 14, (const unsigned __int8 *)&v9[v17]);
            if (v38 - 4073 < 0xFFFFFFFFFFFFF007) {
              goto LABEL_135;
            }
            uint64_t v40 = *((void *)v39 + 2);
            DWORD2(v69[0]) = v40;
            WORD6(v69[0]) = WORD2(v40);
            if (v38 - 4065 < 0xFFFFFFFFFFFFF007) {
              goto LABEL_135;
            }
            *(void *)&v69[0] = *((void *)v39 + 3);
            sub_10000C764(v4, (uint64_t)v69);
            unint64_t v30 = (unsigned __int8 *)&v9[v17];
            BOOL v31 = 0;
            int v32 = 1024;
            goto LABEL_81;
          default:
            continue;
        }
      }
    }
  }
}

uint64_t sub_10000B6D4(uint64_t result)
{
  unint64_t v1 = *(unsigned __int8 *)(result + 2);
  if (!*(unsigned char *)(result + 2) || !*(unsigned char *)(result + 3)) {
    return 0;
  }
  uint64_t v2 = result + 4;
  unint64_t v3 = (v1 - 1);
  unint64_t v4 = ~(result + 4);
  if (v3 > v4) {
    goto LABEL_11;
  }
  if (*(unsigned char *)(v2 + v3)) {
    return 0;
  }
  if (v4 < v1 || (uint64_t v5 = v2 + v1, v6 = *(unsigned __int8 *)(result + 3) - 1, __CFADD__(v5, v6)))
  {
LABEL_11:
    __break(0x5513u);
  }
  else if (*(unsigned char *)(v5 + v6))
  {
    return 0;
  }
  return result;
}

void sub_10000B734(uint64_t a1, unsigned __int8 *a2)
{
  unint64_t v4 = a2[2] + (unint64_t)a2[3];
  uint64_t v5 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (uint64_t *)(a1 + 16);
  unint64_t v7 = (uint64_t **)(a1 + 16);
  while (1)
  {
    unint64_t v7 = (uint64_t **)*v7;
    if (!v7) {
      break;
    }
    if (*((unsigned __int16 *)v7 + 4) == *(unsigned __int16 *)a2) {
      goto LABEL_8;
    }
  }
  long long v8 = (void *)_os_trace_malloc();
  memcpy(v8 + 1, a2, v4 + 4);
  uint64_t v9 = *v6;
  *long long v8 = *v6;
  if (!v9) {
    *(void *)(a1 + 24) = v8;
  }
  *uint64_t v6 = (uint64_t)v8;
LABEL_8:

  os_unfair_lock_unlock(v5);
}

void sub_10000B7EC(id a1, firehose_client_s *a2, unint64_t a3, firehose_chunk_s *a4, $947C0A473ACA94B8A38733FF54A32168 a5)
{
  switch(a3)
  {
    case 1uLL:
      int pid = -1431655766;
      memset(__b, 170, sizeof(__b));
      sub_10000FDD4((uint64_t)a2, &pid);
      if (!pid)
      {
        *(void *)__b = 0x6C656E72656B2FLL;
        uint64_t v9 = (void *)sub_100012708((uint64_t)a2, __b);
        sub_100012580((uint64_t)a2);
        if (qword_10003E9C8 != -1) {
          dispatch_once(&qword_10003E9C8, &stru_10002EA38);
        }
        if (byte_10003E9D0) {
          char v22 = 6;
        }
        else {
          char v22 = 4;
        }
        *((unsigned char *)v9 + 136) = v22;
        uuid_copy((unsigned __int8 *)v9 + 32, byte_10003E809);
        if (qword_10003E9E8 != -1) {
          dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
        }
        if (byte_100031F3C) {
          sub_1000259C0((unsigned __int8 *)v9 + 48);
        }
        *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
        *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)uuid_string_t out = v23;
        *(_OWORD *)&out[16] = v23;
        uuid_unparse(byte_10003E809, out);
        memset(buffer, 170, sizeof(buffer));
        snprintf((char *)buffer, 0x400uLL, "_logd_read_kernel_info calling _logd_uuiddb_harvest_kernel for %s", out);
        sub_100016E68((uint64_t)buffer);
        sub_10001852C();
        if (qword_10003E9E8 != -1) {
          dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
        }
        if (!byte_100031F3C)
        {
          CFArrayRef v24 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_100030368, 3, &kCFTypeArrayCallBacks);
          CFDictionaryRef v25 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
          if (v25)
          {
            CFDictionaryRef v26 = v25;
            CFDictionaryApplyFunction(v25, (CFDictionaryApplierFunction)sub_100016D1C, v9);
            CFRelease(v26);
          }
          if (v24) {
            CFRelease(v24);
          }
        }
        goto LABEL_57;
      }
      *(void *)uuid_string_t out = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v7 = sub_10000FB1C((uint64_t)a2, out);
      if (!v7)
      {
        qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Should have a metadata buffer";
        __break(1u);
        goto LABEL_76;
      }
      if (*(void *)out != 2048)
      {
LABEL_76:
        qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Invalid metadata buffer size";
        __break(1u);
        goto LABEL_77;
      }
      uint64_t v8 = v7;
      if (proc_pidpath(pid, __b, 0x400u) <= 0) {
        __strlcpy_chk();
      }
      uint64_t v9 = (void *)sub_100012708((uint64_t)a2, __b);
      sub_100012580((uint64_t)a2);
      *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      buffer[0] = v10;
      buffer[1] = v10;
      buffer[2] = v10;
      buffer[3] = v10;
      buffer[4] = v10;
      buffer[5] = v10;
      buffer[6] = v10;
      buffer[7] = v10;
      buffer[8] = v10;
      buffer[9] = v10;
      buffer[10] = v10;
      buffer[11] = v10;
      if (proc_pidinfo(pid, 18, 1uLL, buffer, 192) == 192)
      {
        uuid_copy((unsigned __int8 *)v9 + 32, (const unsigned __int8 *)&buffer[8] + 8);
        BOOL v11 = (buffer[0] & 0x10) == 0;
        char v12 = 6;
        char v13 = 4;
      }
      else
      {
        uuid_copy((unsigned __int8 *)v9 + 32, (const unsigned __int8 *)(v8 + 24));
        BOOL v11 = (*(_WORD *)v8 & 1) == 0;
        char v12 = 4;
        char v13 = 6;
      }
      if (v11) {
        char v12 = v13;
      }
      int v27 = *((unsigned __int8 *)v9 + 138);
      *((unsigned char *)v9 + 136) = v12;
      if (v27 && sub_10000C24C((unsigned __int8 *)v9 + 32, (const char *)v9 + 138, 0, 1)) {
        sub_100012574((uint64_t)a2);
      }
      if (!uuid_is_null((const unsigned __int8 *)(v8 + 40)))
      {
        uuid_copy((unsigned __int8 *)v9 + 48, (const unsigned __int8 *)(v8 + 40));
        sub_10001258C((_OWORD *)v9 + 3);
      }
      var1 = (unsigned __int8 *)a4->var0.var1.var1;
      if (var1)
      {
        uint64_t v29 = *(void *)a4->var0.var1.var2;
        if (v29) {
          sub_100016B68((uint64_t)v9, var1, v29);
        }
      }
LABEL_57:
      os_unfair_lock_lock_with_options();
      uint64_t v30 = qword_10003E7B8;
      *uint64_t v9 = qword_10003E7B8;
      if (v30) {
        BOOL v31 = (uint64_t *)qword_10003E7B8;
      }
      else {
        BOOL v31 = &qword_10003E7B8;
      }
      v31[1] = (uint64_t)v9;
      qword_10003E7B8 = (uint64_t)v9;
      v9[1] = &qword_10003E7B8;
      if (pid)
      {
        if (__OFADD__(dword_10003E81C, 1)) {
          goto LABEL_78;
        }
        ++dword_10003E81C;
        if (qword_10003E820 != -1) {
          dispatch_once(&qword_10003E820, &stru_10002D4A8);
        }
        dispatch_group_enter((dispatch_group_t)qword_10003E828);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003E7B0);
      return;
    case 2uLL:
      *(_DWORD *)__b = -1431655766;
      int v14 = (uint64_t **)sub_10000F3F4((uint64_t)a2);
      sub_10000FDD4((uint64_t)a2, __b);
      os_unfair_lock_lock_with_options();
      uint64_t v15 = *v14;
      unint64_t v16 = &qword_10003E7B8;
      if (*v14) {
        unint64_t v16 = *v14;
      }
      v16[1] = (uint64_t)v14[1];
      *v14[1] = (uint64_t)v15;
      if (!*(_DWORD *)__b) {
        goto LABEL_23;
      }
      int v17 = dword_10003E81C - 1;
      if (__OFSUB__(dword_10003E81C, 1))
      {
LABEL_77:
        __break(0x5515u);
LABEL_78:
        __break(0x5500u);
      }
      else
      {
        --dword_10003E81C;
        if (!v17)
        {
          memset((char *)&buffer[2] + 3, 170, 0x3DDuLL);
          strcpy((char *)buffer, "No userlevel firehose clients left");
          sub_100016E68((uint64_t)buffer);
        }
        if (qword_10003E820 != -1) {
          dispatch_once(&qword_10003E820, &stru_10002D4A8);
        }
        dispatch_group_leave((dispatch_group_t)qword_10003E828);
LABEL_23:
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003E7B0);
        *(void *)&buffer[0] = _NSConcreteStackBlock;
        *((void *)&buffer[0] + 1) = 0x40000000;
        *(void *)&buffer[1] = sub_100014F70;
        *((void *)&buffer[1] + 1) = &unk_10002D0C0;
        *(void *)&buffer[2] = v14;
        sub_100014F70((uint64_t)buffer, 0);
        (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 1);
        (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 2);
        (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 3);
        (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 4);
      }
      return;
    case 3uLL:
    case 4uLL:
      if (a5.var2.var0 <= 0x1000uLL && a5.var2.var1 <= 0x1000uLL)
      {
        switch(a5.var2.var4)
        {
          case 0u:
          case 1u:
          case 4u:
            if (a3 == 3) {
              goto LABEL_68;
            }
            break;
          case 2u:
            if (a3 == 4)
            {
LABEL_68:
              sub_10000BFA8(a2, (char *)a4, a5.var0 & 0xFFFFFFFF00000000 | ((unint64_t)a5.var2.var1 << 16) | a5.var2.var0);
            }
            break;
          case 3u:
            if (a3 == 4)
            {
              sub_10000AF08();
            }
            break;
          default:
            return;
        }
      }
      return;
    case 6uLL:
      uint64_t v18 = sub_10000F3F4((uint64_t)a2);
      if (v18)
      {
        uint64_t v19 = v18;
        unint64_t v20 = *(void **)(v18 + 16);
        if (v20)
        {
          do
          {
            char v21 = (void *)*v20;
            free(v20);
            unint64_t v20 = v21;
          }
          while (v21);
        }
        sub_1000123F4(*(void *)(v19 + 80));
        free(*(void **)(v19 + 72));
        free((void *)v19);
      }
      return;
    default:
      return;
  }
}

void sub_10000BFA8(void *a1, char *a2, unint64_t a3)
{
  unint64_t v6 = HIWORD(a3);
  int v14 = -1431655766;
  sub_10000FDD4((uint64_t)a1, &v14);
  if (v14) {
    uint64_t v7 = HIBYTE(a3) & 4;
  }
  else {
    LODWORD(v7) = byte_10003E7C8 & 1;
  }
  unsigned __int8 v8 = 4;
  switch((char)v6)
  {
    case 0:
      goto LABEL_7;
    case 1:
      LOBYTE(v6) = 1;
      goto LABEL_7;
    case 2:
      goto LABEL_12;
    case 4:
      LOBYTE(v6) = 2;
LABEL_7:
      if (v7) {
        unsigned __int8 v8 = 3;
      }
      else {
        unsigned __int8 v8 = v6;
      }
      if (!v7 || byte_10003E89C)
      {
LABEL_12:
        uint64_t v9 = sub_10000F3F4((uint64_t)a1);
        if (!*(unsigned char *)(v9 + 128))
        {
          if (1248 * (unint64_t)v8 > ~(unint64_t)qword_100030398)
          {
            __break(0x5513u);
          }
          else
          {
            long long v10 = (os_unfair_lock_s *)v9;
            sub_10000FB38((dispatch_queue_t *)&qword_100030398[156 * v8], a2, a3, a1);
            unsigned int v11 = (unsigned __int16)a3 - WORD1(a3) + 4096;
            if (v11 >= 0xFF9) {
              unsigned int v11 = 4096;
            }
            if (WORD1(a3) == 4096) {
              uint64_t v12 = (unsigned __int16)a3;
            }
            else {
              uint64_t v12 = v11;
            }
            os_unfair_lock_lock_with_options();
            char v13 = (void *)sub_10000C148((uint64_t)v10, v8);
            *v13 += v12;
            os_unfair_lock_unlock(v10 + 33);
          }
        }
      }
      break;
    default:
      return;
  }
}

uint64_t sub_10000C148(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  else if (!__CFADD__(result + 88, 8 * a2))
  {
    result += 8 * a2 + 88;
    return result;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10000C18C(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, mach_msg_timeout_t timeout)
{
  uint64_t v9 = a2;
  NDR_record_t v8 = NDR_record;
  uint64_t v10 = a3;
  int v11 = a4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 11702;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  uint64_t v5 = mach_msg(&msg, 17, 0x34u, 0, 0, timeout, 0);
  if (v5 == 268435460)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(mach_task_self_, msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v5;
}

uint64_t sub_10000C24C(unsigned __int8 *a1, const char *a2, xpc_object_t xdict, int a4)
{
  if (!xdict)
  {
    NDR_record_t v8 = 0;
LABEL_11:
    memset(__b, 170, sizeof(__b));
    uint64_t v19 = 0;
    unint64_t v20 = &v19;
    uint64_t v21 = 0x83000000000;
    memset(v22, 170, 0x810uLL);
    v22[2064] = 0;
    if (qword_10003E9E8 == -1)
    {
      if ((a4 & 2) == 0) {
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
      if ((a4 & 2) == 0) {
        goto LABEL_19;
      }
    }
    if (byte_100031F3C)
    {
LABEL_14:
      uint64_t v11 = 0;
LABEL_15:
      _Block_object_dispose(&v19, 8);
      return v11;
    }
LABEL_19:
    if ((a4 & 1) != 0 && (!a2 || !*a2)) {
      goto LABEL_14;
    }
    if (sub_10000C570(a1))
    {
LABEL_23:
      uint64_t v11 = 1;
      goto LABEL_15;
    }
    uuid_copy((unsigned __int8 *)v20 + 24, a1);
    if (a2)
    {
      char v13 = (char *)(v20 + 5);
      if ((a4 & 0xC) != 0)
      {
        __stringp[0] = (char *)(v20 + 133);
        strlcpy((char *)v20 + 1064, a2, 0x400uLL);
        strsep(__stringp, "/");
        if (__stringp[0]) {
          int v14 = __stringp[0];
        }
        else {
          int v14 = a2;
        }
        strlcpy(v13, v14, 0x400uLL);
      }
      else
      {
        __strlcpy_chk();
      }
    }
    else
    {
      *((unsigned char *)v20 + 40) = 0;
    }
    sub_100012264((unsigned __int8 *)v20 + 24, 1u, __b);
    if ((a4 & 0x100) != 0)
    {
      boot_uuid = (const void *)_os_trace_get_boot_uuid();
      if (!setxattr(__b, "com.apple.uuiddb.boot-uuid", boot_uuid, 0x25uLL, 0, 0)) {
        goto LABEL_14;
      }
    }
    else if (!access(__b, 0))
    {
      *((unsigned char *)v20 + 2088) = 1;
      if ((a4 & 8) == 0)
      {
        sub_1000033D0((uint64_t *)a1);
        goto LABEL_23;
      }
    }
    if (v8)
    {
      xpc_retain(v8);
      unint64_t v16 = (char *)os_transaction_create();
    }
    else
    {
      unint64_t v16 = 0;
    }
    __stringp[0] = (char *)_NSConcreteStackBlock;
    __stringp[1] = (char *)0x40000000;
    __stringp[2] = (char *)sub_100003DF8;
    __stringp[3] = (char *)&unk_10002D900;
    int v18 = a4;
    __stringp[4] = (char *)&v19;
    __stringp[5] = (char *)v8;
    __stringp[6] = v16;
    dispatch_async((dispatch_queue_t)qword_10003E8E8, __stringp);
    goto LABEL_14;
  }
  if ((a4 & 1) == 0) {
    __assert_rtn("_logd_uuiddb_harvest", "logd_uuiddb.c", 322, "opts & LOGD_HARVEST_UUID_MACHO");
  }
  xpc_object_t array = xpc_dictionary_get_array(xdict, "sections");
  if (array)
  {
    NDR_record_t v8 = array;
    if (xpc_array_get_count(array) == 5)
    {
      size_t v9 = 0;
      while (1)
      {
        xpc_object_t value = xpc_array_get_value(v8, v9);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_data) {
          break;
        }
        if (++v9 == 5) {
          goto LABEL_11;
        }
      }
    }
  }
  return 0;
}

BOOL sub_10000C570(void *a1)
{
  os_unfair_lock_lock_with_options();
  BOOL v2 = sub_10000C5C4((void *)qword_10003E8E0, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003E8D8);
  return v2;
}

BOOL sub_10000C5C4(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (v2)
  {
    uint64_t v3 = a2[1];
    uint64_t v4 = __ROR8__(v3 + 16, 16);
    unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v4)));
    unint64_t v6 = (0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47))) ^ v3;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = v6;
      if (v6 >= *(void *)&v2) {
        unint64_t v8 = v6 % *(void *)&v2;
      }
    }
    else
    {
      unint64_t v8 = v6 & (*(void *)&v2 - 1);
    }
    unint64_t i = *(void **)(*a1 + 8 * v8);
    if (i)
    {
      for (unint64_t i = (void *)*i; i; unint64_t i = (void *)*i)
      {
        unint64_t v10 = i[1];
        if (v6 == v10)
        {
          if (i[2] == *a2 && i[3] == v3) {
            return i != 0;
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= *(void *)&v2) {
              v10 %= *(void *)&v2;
            }
          }
          else
          {
            v10 &= *(void *)&v2 - 1;
          }
          if (v10 != v8) {
            goto LABEL_22;
          }
        }
      }
    }
  }
  else
  {
LABEL_22:
    unint64_t i = 0;
  }
  return i != 0;
}

uint64_t sub_10000C6BC(uint64_t result, _WORD *a2)
{
  unint64_t v3 = (unsigned __int16)*a2;
  __int16 v4 = v3 + 32;
  unint64_t v5 = *(void *)(result + 16);
  if (v3 + 32 > HIWORD(v5))
  {
    uint64_t result = 0;
    unint64_t v14 = HIWORD(v5);
LABEL_7:
    *a2 = v14;
    return result;
  }
  *a2 = v4;
  uint64_t v6 = result + 24;
  unint64_t v7 = ~(result + 24);
  if (v7 >= v3 && (unsigned __int16)(v3 + 32) <= v7)
  {
    uint64_t v8 = v6 + v3;
    size_t v9 = (const char *)(v6 + (unsigned __int16)(v3 + 32));
    unint64_t v10 = *(void *)(result + 16);
    unint64_t v11 = HIWORD(v10);
    unsigned __int16 v12 = HIWORD(v10) - v4;
    size_t v13 = strnlen(v9, (unsigned __int16)(HIWORD(v10) - v4));
    LOWORD(v14) = v4 + v13;
    if (v13 == v12)
    {
      LOWORD(v14) = v11;
      uint64_t result = 0;
    }
    else
    {
      uint64_t result = v8;
    }
    goto LABEL_7;
  }
  __break(0x5513u);
  return result;
}

void sub_10000C764(uint64_t a1, uint64_t a2)
{
  __int16 v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options();
  unint64_t v5 = *(unsigned __int16 *)(a1 + 130);
  if (v5 <= 0x3FF)
  {
    if (*(_WORD *)(a1 + 130))
    {
      unint64_t v6 = 0;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)(a1 + 72);
      size_t v9 = (void *)(a2 + 14);
      while (1)
      {
        if (v6 > ~v8) {
          goto LABEL_18;
        }
        if (*(void *)(v8 + v6 + 14) == *v9)
        {
          if ((unint64_t)v9 > 0xFFFFFFFFFFFFFFF7 || v8 + v6 + 14 > 0xFFFFFFFFFFFFFFF7) {
            goto LABEL_18;
          }
          if (*(void *)(v8 + v6 + 22) == *(void *)(a2 + 22)) {
            break;
          }
        }
        ++v7;
        v6 += 32;
        if (v5 == v7) {
          goto LABEL_10;
        }
      }
      long long v13 = *(_OWORD *)(a2 + 16);
      unint64_t v14 = (_OWORD *)(v8 + 32 * v7);
      *unint64_t v14 = *(_OWORD *)a2;
      v14[1] = v13;
    }
    else
    {
LABEL_10:
      if (v5 >= (((_WORD)v5 + 3) & 0xFFFCu))
      {
        uint64_t v10 = _os_trace_realloc();
        *(void *)(a1 + 72) = v10;
        LODWORD(v5) = *(unsigned __int16 *)(a1 + 130);
      }
      else
      {
        uint64_t v10 = *(void *)(a1 + 72);
      }
      *(_WORD *)(a1 + 130) = v5 + 1;
      if (__CFADD__(v10, 32 * v5)) {
LABEL_18:
      }
        __break(0x5513u);
      unint64_t v11 = (_OWORD *)(v10 + 32 * v5);
      long long v12 = *(_OWORD *)(a2 + 16);
      *unint64_t v11 = *(_OWORD *)a2;
      v11[1] = v12;
      if (*(_WORD *)(a1 + 130) == 1024)
      {
        int v15 = -1431655766;
        sub_10000FDD4(*(void *)(a1 + 64), &v15);
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "%s (%d) reached %d dylibs", (const char *)(a1 + 138), v15, 1024);
        sub_100016E68((uint64_t)__b);
      }
    }
  }
  os_unfair_lock_unlock(v4);
}

void sub_10000C91C(uint64_t a1, uint64_t *a2)
{
  __int16 v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options();
  uint64_t v5 = *(void *)(a1 + 80);
  if (!v5) {
    operator new();
  }
  sub_10000C9A8(v5, a2);

  os_unfair_lock_unlock(v4);
}

void sub_10000C9A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = __ROR8__(v4 + 16, 16);
  unint64_t v6 = (0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) >> 47))) ^ v4;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) >> 47))) ^ v4;
      if (v6 >= v7) {
        unint64_t v9 = v6 % v7;
      }
    }
    else
    {
      unint64_t v9 = v6 & (v7 - 1);
    }
    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v9);
    if (v10)
    {
      for (unint64_t i = (void *)*v10; i; unint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v6)
        {
          if (i[2] == v3 && i[3] == v4) {
            return;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= v7) {
              v12 %= v7;
            }
          }
          else
          {
            v12 &= v7 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  }
  unint64_t v14 = operator new(0x20uLL);
  v14[1] = v6;
  v14[2] = v3;
  v14[3] = v4;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    BOOL v17 = 1;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_100011E3C(a1, v20);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v9 = v6 % v7;
      }
      else {
        unint64_t v9 = v6;
      }
    }
    else
    {
      unint64_t v9 = (v7 - 1) & v6;
    }
  }
  uint64_t v21 = *(void *)a1;
  char v22 = *(void **)(*(void *)a1 + 8 * v9);
  if (v22)
  {
    *unint64_t v14 = *v22;
LABEL_42:
    *char v22 = v14;
    goto LABEL_43;
  }
  uint64_t v23 = *(void *)(a1 + 16);
  *unint64_t v14 = v23;
  *(void *)(a1 + 16) = v14;
  *(void *)(v21 + 8 * v9) = a1 + 16;
  if (v23)
  {
    unint64_t v24 = *(void *)(v23 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v24 >= v7) {
        v24 %= v7;
      }
    }
    else
    {
      v24 &= v7 - 1;
    }
    char v22 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_42;
  }
LABEL_43:
  ++*(void *)(a1 + 24);
}

void *sub_10000CBDC(void **a1)
{
  unint64_t v2 = sub_100011194(a1);
  uint64_t v3 = (void *)_os_trace_calloc();
  uint64_t v4 = v3;
  *uint64_t v3 = 0x110000600BLL;
  v3[1] = 0;
  v3[4] = a1[1];
  uint64_t v5 = (char *)v3 + v2;
  unint64_t v6 = (char *)(v3 + 5);
  BOOL v31 = v3 + 5;
  unint64_t v7 = a1[2];
  if (v7) {
    uint64_t v8 = 16 * v7[3];
  }
  else {
    uint64_t v8 = 0;
  }
  if (&v5[-v8] >= v6)
  {
    unint64_t v9 = (char *)(v3 + 2);
    int v32 = _NSConcreteStackBlock;
    uint64_t v33 = 0x40000000;
    int v34 = sub_10000D080;
    uint64_t v35 = &unk_10002E760;
    uint64_t v36 = &v31;
    uint64_t v10 = (void *)v7[2];
    unint64_t v11 = (char *)(v3 + 5);
    if (v10)
    {
      do
      {
        ((void (*)(void ***, void *, void))v34)(&v32, v10 + 2, v10[4]);
        uint64_t v10 = (void *)*v10;
      }
      while (v10);
      unint64_t v11 = (char *)v31;
    }
    unint64_t v12 = &v11[v8];
    BOOL v31 = v12;
    *(_WORD *)unint64_t v9 = (_WORD)v12 - (_WORD)v6;
    long long v13 = a1[4];
    if (v5 - v13 >= (unint64_t)v12)
    {
      unint64_t v14 = a1[3];
      int v32 = _NSConcreteStackBlock;
      uint64_t v33 = 0x40000000;
      int v34 = sub_10000D02C;
      uint64_t v35 = &unk_10002E780;
      uint64_t v36 = a1;
      int v37 = &v31;
      if (v14)
      {
        float v15 = (uint64_t *)v14[2];
        if (v15)
        {
          do
          {
            float v16 = v15 + 2;
            if (*((char *)v15 + 39) < 0) {
              float v16 = (void *)*v16;
            }
            ((void (*)(void ***, void *, uint64_t))v34)(&v32, v16, v15[5]);
            float v15 = (uint64_t *)*v15;
          }
          while (v15);
          long long v13 = a1[4];
          unint64_t v12 = (char *)v31;
        }
      }
      BOOL v31 = &v13[(void)v12];
      size_t v17 = ((unint64_t)&v13[(void)v12 + 7] & 0xFFFFFFFFFFFFFFF8) - (unint64_t)&v13[(void)v12];
      bzero(&v13[(void)v12], v17);
      unint64_t v18 = (char *)v31 + v17;
      BOOL v31 = v18;
      uint64_t v19 = v18 - v6;
      *((_WORD *)v4 + 9) = (_WORD)v18 - (_WORD)v6;
      size_t v20 = a1[5];
      if (v20) {
        __int16 v21 = v20[12];
      }
      else {
        __int16 v21 = 0;
      }
      *((_WORD *)v4 + 10) = v21;
      int v32 = _NSConcreteStackBlock;
      uint64_t v33 = 0x40000000;
      int v34 = sub_10000D098;
      uint64_t v35 = &unk_10002E7A0;
      uint64_t v36 = a1;
      int v37 = &v31;
      unint64_t v38 = v5;
      if (v20)
      {
        char v22 = (void *)*((void *)v20 + 2);
        if (v22)
        {
          do
          {
            ((void (*)(void ***, void))v34)(&v32, v22[4]);
            char v22 = (void *)*v22;
          }
          while (v22);
          unint64_t v18 = (char *)v31;
          uint64_t v19 = (unsigned char *)v31 - v6;
        }
      }
      *((_WORD *)v4 + 11) = v19;
      *((_WORD *)v4 + 12) = 0;
      uint64_t v23 = a1[8];
      if (v23)
      {
        do
        {
          int v24 = *((_DWORD *)v23 + 8);
          if (v24)
          {
            *(_OWORD *)unint64_t v18 = *((_OWORD *)v23 + 1);
            *((_DWORD *)v18 + 4) = v24;
            *((_DWORD *)v18 + 5) = *((_DWORD *)v23 + 9);
            CFDictionaryRef v25 = v18 + 24;
            BOOL v31 = v18 + 24;
            if ((unint64_t)(v5 - (v18 + 24)) > 3)
            {
              *((_DWORD *)v18 + 6) = *(_DWORD *)(*((void *)v23 + 6) + 4);
              CFDictionaryRef v26 = (unsigned int *)*((void *)v23 + 6);
              BOOL v31 = v18 + 28;
              int v32 = _NSConcreteStackBlock;
              uint64_t v33 = 0x40000000;
              int v34 = sub_10000D520;
              uint64_t v35 = &unk_10002E800;
              uint64_t v36 = &v31;
              sub_10000D2BC(v26, (uint64_t)&v32);
              CFDictionaryRef v25 = (char *)v31;
              if ((unint64_t)(v5 - (unsigned char *)v31) >= 4)
              {
                *(_DWORD *)BOOL v31 = *(_DWORD *)(*((void *)v23 + 5) + 4);
                BOOL v31 = v25 + 4;
                int v27 = (unsigned int *)*((void *)v23 + 5);
                int v32 = _NSConcreteStackBlock;
                uint64_t v33 = 0x40000000;
                int v34 = sub_10000D354;
                uint64_t v35 = &unk_10002E820;
                uint64_t v36 = &v31;
                sub_10000D2BC(v27, (uint64_t)&v32);
                CFDictionaryRef v25 = (char *)v31;
              }
            }
            ++*((_WORD *)v4 + 12);
            size_t v28 = ((unint64_t)(v25 + 7) & 0xFFFFFFFFFFFFFFF8) - (void)v25;
            bzero(v25, v28);
            unint64_t v18 = (char *)v31 + v28;
            BOOL v31 = (char *)v31 + v28;
          }
          uint64_t v23 = *(void **)v23;
        }
        while (v23);
        uint64_t v19 = v18 - v6;
        unint64_t v9 = (char *)(v4 + 2);
      }
      if (v19 >= 0x10000)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      else
      {
        int64_t v29 = v18 - v9;
        v4[1] = v29;
        if (v29 + 16 <= v2) {
          return v4;
        }
      }
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  free(v4);
  return 0;
}

char *sub_10000D02C(uint64_t a1, const char *a2, unsigned __int16 a3)
{
  if ((unint64_t)a3 >= *(void *)(*(void *)(a1 + 32) + 32))
  {
    _os_assert_log();
    uint64_t result = (char *)_os_crash();
    __break(1u);
  }
  else
  {
    uint64_t v3 = (char *)(**(void **)(a1 + 40) + a3);
    return strcpy(v3, a2);
  }
  return result;
}

__n128 sub_10000D080(uint64_t a1, __n128 *a2, unsigned __int16 a3)
{
  __n128 result = *a2;
  *(__n128 *)(**(void **)(a1 + 32) + 16 * a3) = *a2;
  return result;
}

void sub_10000D098(void *a1, uint64_t a2)
{
  unint64_t v4 = sub_10000D42C(*(void **)(a1[4] + 16), (void *)(a2 + 24));
  if (v4 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  __int16 v5 = v4;
  if (uuid_is_null((const unsigned __int8 *)(a2 + 40)))
  {
    LOWORD(v6) = -1;
    goto LABEL_5;
  }
  unint64_t v6 = sub_10000D42C(*(void **)(a1[4] + 16), (void *)(a2 + 40));
  if (v6 >= 0x10000)
  {
LABEL_11:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
LABEL_5:
  unint64_t v7 = (uint64_t *)a1[5];
  uint64_t v8 = *v7;
  uint64_t v9 = *(void *)(a2 + 8);
  int v10 = *(_DWORD *)(a2 + 4);
  int v11 = *(_DWORD *)(a2 + 16);
  unsigned int v12 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)uint64_t v8 = *(_DWORD *)a2;
  *(_WORD *)(v8 + 4) = v5;
  *(_WORD *)(v8 + 6) = v6;
  *(void *)(v8 + 8) = v9;
  *(_DWORD *)(v8 + 16) = v11;
  *(_DWORD *)(v8 + 20) = v10;
  *(void *)(v8 + 24) = v12;
  *unint64_t v7 = v8 + 32;
  long long v13 = (void **)a1[5];
  uint64_t v14 = a1[6];
  float v15 = (void **)a1[4];
  float v16 = *v13;
  if ((unint64_t)(v14 - (void)*v13) >= 8)
  {
    *float v16 = *(unsigned int *)(*(void *)(a2 + 56) + 4);
    *long long v13 = v16 + 1;
    size_t v17 = *(unsigned int **)(a2 + 56);
    __int16 v21 = _NSConcreteStackBlock;
    uint64_t v22 = 0x40000000;
    uint64_t v23 = sub_100010958;
    int v24 = &unk_10002E7C0;
    CFDictionaryRef v25 = v15;
    CFDictionaryRef v26 = v13;
    sub_10000D2BC(v17, (uint64_t)&v21);
    long long v13 = (void **)a1[5];
    uint64_t v14 = a1[6];
    float v15 = (void **)a1[4];
  }
  unint64_t v18 = *v13;
  if ((unint64_t)(v14 - (void)*v13) >= 8)
  {
    void *v18 = *(unsigned int *)(*(void *)(a2 + 64) + 4);
    *long long v13 = v18 + 1;
    uint64_t v19 = *(unsigned int **)(a2 + 64);
    __int16 v21 = _NSConcreteStackBlock;
    uint64_t v22 = 0x40000000;
    uint64_t v23 = sub_10000D36C;
    int v24 = &unk_10002E7E0;
    CFDictionaryRef v25 = v13;
    CFDictionaryRef v26 = v15;
    sub_10000D2BC(v19, (uint64_t)&v21);
    long long v13 = (void **)a1[5];
  }
  size_t v20 = (((unint64_t)*v13 + 7) & 0xFFFFFFFFFFFFFFF8) - (void)*v13;
  bzero(*v13, v20);
  *(void *)a1[5] += v20;
}

unsigned int *sub_10000D2BC(unsigned int *result, uint64_t a2)
{
  if (*((void *)result + 2))
  {
    unint64_t v2 = result;
    unint64_t v3 = *result;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        unint64_t v6 = *(void **)(*((void *)v2 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            int v7 = *((unsigned __int8 *)v2 + 8);
            if (v7 == 1) {
              uint64_t v8 = v6 + 1;
            }
            else {
              uint64_t v8 = 0;
            }
            if (v7 == 2) {
              uint64_t v9 = v6 + 1;
            }
            else {
              uint64_t v9 = v8;
            }
            __n128 result = (unsigned int *)(*(uint64_t (**)(uint64_t, void *, void))(a2 + 16))(a2, v9, v6[2]);
            unint64_t v6 = (void *)*v6;
          }
          while (v6);
          unint64_t v3 = *v2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000D354(uint64_t result, _WORD *a2)
{
  unint64_t v2 = *(_WORD ***)(result + 32);
  unint64_t v3 = *v2;
  *unint64_t v3 = *a2;
  *unint64_t v2 = v3 + 1;
  return result;
}

unint64_t sub_10000D36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = **(_WORD ***)(a1 + 32);
  *__int16 v5 = *(_WORD *)a3;
  unint64_t v6 = *(char **)(a3 + 8);
  if (!v6 || !*(void *)(a3 + 16))
  {
    _os_assumes_log();
    unint64_t v6 = *(char **)(a3 + 8);
  }
  int v7 = sub_10000E268(*(void **)(*(void *)(a1 + 40) + 24), v6);
  __int16 v8 = (__int16)v7;
  if ((unint64_t)v7 >= 0x10000) {
    _os_assumes_log();
  }
  v5[1] = v8;
  unint64_t result = (unint64_t)sub_10000E268(*(void **)(*(void *)(a1 + 40) + 24), *(char **)(a3 + 16));
  __int16 v10 = result;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log();
  }
  v5[2] = v10;
  **(void **)(a1 + 32) += 6;
  return result;
}

uint64_t sub_10000D42C(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (v2)
  {
    uint64_t v3 = a2[1];
    uint64_t v4 = __ROR8__(v3 + 16, 16);
    unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v4)));
    unint64_t v6 = (0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47))) ^ v3;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v8 = v6;
      if (v6 >= *(void *)&v2) {
        unint64_t v8 = v6 % *(void *)&v2;
      }
    }
    else
    {
      unint64_t v8 = v6 & (*(void *)&v2 - 1);
    }
    uint64_t v9 = *(void **)(*a1 + 8 * v8);
    if (v9)
    {
      for (unint64_t i = (void *)*v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v6 == v11)
        {
          if (i[2] == *a2 && i[3] == v3) {
            return i[4];
          }
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(void *)&v2) {
              v11 %= *(void *)&v2;
            }
          }
          else
          {
            v11 &= *(void *)&v2 - 1;
          }
          if (v11 != v8) {
            return 0;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t sub_10000D520(uint64_t result, _WORD *a2)
{
  int8x8_t v2 = *(_WORD ***)(result + 32);
  uint64_t v3 = *v2;
  *uint64_t v3 = *a2;
  *int8x8_t v2 = v3 + 1;
  return result;
}

uint64_t sub_10000D538(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0x6001:
      unint64_t v5 = sub_10000FA14(*(void **)(*(void *)(a1 + 32) + 224), *(void *)(a2 + 16), *(_DWORD *)(a2 + 24));
      if (!v5)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
        goto LABEL_75;
      }
      uint64_t v6 = (uint64_t)v5;
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v41 = 0;
      uint64_t v8 = sub_10000F3F4((uint64_t)v5);
      uint64_t v40 = sub_10000FB1C(v6, &v41);
      uint64_t v44 = 0;
      memset(v43, 0, sizeof(v43));
      LODWORD(v43[1]) = sub_10000FE04(v6);
      DWORD1(v43[1]) = sub_10000FB30(v6);
      *((void *)&v43[0] + 1) = sub_10000FDD4(v6, (_DWORD *)v43 + 1);
      if (*(unsigned char *)(v8 + 136) == 4) {
        WORD1(v43[0]) |= 1u;
      }
      long long v9 = *(_OWORD *)(v8 + 48);
      *(_OWORD *)((char *)&v43[1] + 8) = *(_OWORD *)(v8 + 32);
      *(_OWORD *)((char *)&v43[2] + 8) = v9;
      uint64_t v39 = sub_10000F3FC(v7, (uint64_t)v43);
      sub_10000F988(v7, v39);
      __int16 v10 = (uint64_t *)(a2 + 48);
      unint64_t v11 = *(unsigned __int16 *)(a2 + 32);
      unint64_t v12 = a2 + 48;
      if (v11 > 0x1000) {
        goto LABEL_10;
      }
      if (__CFADD__(a2 + 32, v11)) {
LABEL_75:
      }
        __break(0x5513u);
      unint64_t v12 = a2 + 32 + v11;
LABEL_10:
      uint64_t v38 = v8 + 16;
      int v37 = (os_unfair_lock_s *)(v8 + 132);
      uint64_t v13 = v39;
      while (1)
      {
        uint64_t v14 = v10 + 3;
        if ((unint64_t)(v10 + 3) >= v12) {
          return 1;
        }
        float v15 = (unsigned __int8 *)v10;
        unint64_t v16 = v10[2];
        unint64_t v17 = HIWORD(v16);
        if (!HIWORD(v16) || (uint64_t)v17 > (uint64_t)(v12 - (void)v14)) {
          return 1;
        }
        uint64_t v19 = v17 + 24;
        if ((v16 & 0x7000000000000) != 0) {
          uint64_t v19 = (HIWORD(v16) & 0xFFF8) + 32;
        }
        if (__CFADD__(v10, v19)) {
          goto LABEL_75;
        }
        __int16 v10 = (uint64_t *)((char *)v10 + v19);
        uint64_t v20 = *(void *)v15;
        if (*(void *)v15)
        {
          __int16 v21 = WORD1(*(void *)v15);
          int v22 = *(void *)v15;
          if ((v22 - 3) >= 2 && v22 != 6)
          {
            if (v22 != 2) {
              goto LABEL_73;
            }
            int v23 = BYTE1(v20);
            if ((v23 - 1) > 1) {
              goto LABEL_73;
            }
            if (v21)
            {
              if (!(v16 >> 51)) {
                goto LABEL_73;
              }
              uint64_t v24 = 8;
              if ((v21 & 0x10) != 0) {
                goto LABEL_62;
              }
LABEL_27:
              if ((*(void *)v15 & 0x2000000) != 0)
              {
LABEL_65:
                if (v24 + 8 > v17) {
                  goto LABEL_73;
                }
                if (__CFADD__(v14, v24)) {
                  goto LABEL_75;
                }
                v24 += 8;
              }
            }
            else
            {
              uint64_t v24 = 0;
              if ((v21 & 0x10) == 0) {
                goto LABEL_27;
              }
LABEL_62:
              if (v24 + 8 > v17) {
                goto LABEL_73;
              }
              if (__CFADD__(v14, v24)) {
                goto LABEL_75;
              }
              v24 += 8;
              if ((*(void *)v15 & 0x2000000) != 0) {
                goto LABEL_65;
              }
            }
            if (v23 == 1 && v24 + 8 <= v17)
            {
              LOWORD(v43[0]) = v24 + 8;
              if (__CFADD__(v14, v24)) {
                goto LABEL_75;
              }
              sub_10000DAEC(v6, v15, v8, v7, v13, v43);
            }
            goto LABEL_73;
          }
          unsigned __int16 v42 = 0;
          if ((v20 & 0x10000) != 0)
          {
            if (!(v16 >> 51)) {
              goto LABEL_73;
            }
            unsigned __int16 v42 = 8;
            uint64_t v25 = 8;
            if ((v21 & 0x10) != 0)
            {
LABEL_34:
              if (v25 + 8 > v17) {
                goto LABEL_73;
              }
              unsigned __int16 v42 = v25 + 8;
              BOOL v26 = __CFADD__(v14, v25);
              v25 += 8;
              if (v26) {
                goto LABEL_75;
              }
            }
          }
          else
          {
            uint64_t v25 = 0;
            if ((v21 & 0x10) != 0) {
              goto LABEL_34;
            }
          }
          if ((v21 & 0x100) != 0)
          {
            if (v25 + 4 > v17) {
              goto LABEL_73;
            }
            unsigned __int16 v42 = v25 + 4;
            if (__CFADD__(v14, v25)) {
              goto LABEL_75;
            }
          }
          sub_10000DAEC(v6, v15, v8, v7, v13, &v42);
          if (*v15 != 3 && (*((_WORD *)v15 + 1) & 0x200) != 0)
          {
            uint64_t v27 = v42;
            if ((unint64_t)v42 + 2 <= *((unsigned __int16 *)v15 + 11))
            {
              v42 += 2;
              if (__CFADD__(v14, v27)) {
                goto LABEL_75;
              }
              uint64_t v28 = v8;
              int v29 = *(unsigned __int16 *)((char *)v14 + v27);
              LOWORD(v30) = *(_WORD *)(v40 + 2);
              unsigned int v31 = *(unsigned __int16 *)(v40 + 4);
              if (v31 >= 0x5C8) {
                unsigned int v31 = 1480;
              }
              do
              {
                if (v31 <= (unsigned __int16)v30 || (unsigned __int16)v30 > 0x5C4u) {
                  break;
                }
                if (~(v40 + 568) < (unint64_t)(unsigned __int16)v30) {
                  goto LABEL_75;
                }
                int v32 = (unsigned __int16 *)(v40 + (unsigned __int16)v30 + 568);
                unint64_t v33 = *(unsigned __int8 *)(v40 + (unsigned __int16)v30 + 570)
                    + (unint64_t)*(unsigned __int8 *)(v40 + (unsigned __int16)v30 + 571)
                    + 4;
                if (1480 - (unint64_t)(unsigned __int16)v30 < v33) {
                  break;
                }
                if (*v32 == v29)
                {
LABEL_59:
                  uint64_t v36 = (char *)(v32 + 1);
                  uint64_t v13 = v39;
                  sub_10000EC08(v7, v39, v29, v36);
                  sub_10000E1F8(v7, v36);
                  uint64_t v8 = v28;
                  goto LABEL_73;
                }
                unint64_t v30 = v33 + (unsigned __int16)v30 + (v33 & 1);
              }
              while (v30 < 0x10000);
              os_unfair_lock_lock_with_options();
              uint64_t v34 = v38;
              while (1)
              {
                uint64_t v34 = *(void *)v34;
                if (!v34) {
                  break;
                }
                if (*(unsigned __int16 *)(v34 + 8) == v29)
                {
LABEL_58:
                  os_unfair_lock_unlock(v37);
                  __int16 v35 = *(_WORD *)(v34 + 8);
                  int v32 = (unsigned __int16 *)(v34 + 8);
                  LOWORD(v29) = v35;
                  goto LABEL_59;
                }
              }
              os_unfair_lock_unlock(v37);
              *(void *)&v43[0] = _NSConcreteStackBlock;
              *((void *)&v43[0] + 1) = 0x40000000;
              *(void *)&v43[1] = sub_100012110;
              *((void *)&v43[1] + 1) = &unk_10002D340;
              *(void *)&v43[2] = v6;
              sub_100012038(v6, 0, (uint64_t)&stru_10002D320, (uint64_t)v43);
              os_unfair_lock_lock_with_options();
              uint64_t v34 = v38;
              while (1)
              {
                uint64_t v34 = *(void *)v34;
                if (!v34) {
                  break;
                }
                if (*(unsigned __int16 *)(v34 + 8) == v29) {
                  goto LABEL_58;
                }
              }
              os_unfair_lock_unlock(v37);
              uint64_t v8 = v28;
              uint64_t v13 = v39;
            }
          }
LABEL_73:
          sub_10000DA90(v7, (*((void *)v15 + 2) & 0xFFFFFFFFFFFFLL) + *(void *)(a2 + 40));
        }
      }
    case 0x6002:
    case 0x6003:
    case 0x6004:
      sub_10000DA90(*(void *)(a1 + 40), *(void *)(a2 + 32));
      return 1;
    default:
      return 1;
  }
}

void *sub_10000DA90(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    unint64_t result = **(void ***)(*(void *)(a1 + 72) + 8);
  }
  else {
    unint64_t result = sub_10000EC9C(a1);
  }
  if (result[2] > a2) {
    result[2] = a2;
  }
  if (result[3] < a2) {
    result[3] = a2;
  }
  return result;
}

void sub_10000DAEC(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, _WORD *a6)
{
  unsigned int v11 = *(unsigned __int8 *)(a3 + 136);
  switch(*((_WORD *)a2 + 1) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      unsigned int v11 = 4;
      break;
    case 8:
      break;
    case 0xA:
      unsigned int v11 = 20;
      break;
    case 0xC:
      unsigned int v11 = 6;
      break;
    default:
      unsigned int v11 = 0;
      break;
  }
  unint64_t v12 = (unsigned __int16)*a6;
  unint64_t v13 = v12 + v11;
  unint64_t v14 = *((void *)a2 + 2);
  if (v13 > HIWORD(v14))
  {
    *a6 = HIWORD(v14);
    goto LABEL_70;
  }
  *a6 = v13;
  unint64_t v15 = ~(unint64_t)(a2 + 24);
  if (v15 < v12) {
    goto LABEL_76;
  }
  if (!v11)
  {
LABEL_70:
    memset(&__b[2], 170, 0x3E0uLL);
    strcpy((char *)__b, "#DECODE failed to read location");
    goto LABEL_71;
  }
  unint64_t v16 = &a2[v12 + 24];
  if (v11 == 6)
  {
    unint64_t v17 = 0;
    uint64_t v18 = *((unsigned __int16 *)v16 + 2);
  }
  else
  {
    uint64_t v18 = 0;
    if (v11 == 4) {
      unint64_t v17 = 0;
    }
    else {
      unint64_t v17 = (uint64_t *)(v16 + 4);
    }
  }
  uint64_t v19 = *(unsigned int *)v16;
  __int16 v20 = *((_WORD *)a2 + 1);
  if ((v20 & 0x20) != 0)
  {
    unint64_t v21 = *((void *)a2 + 2);
    if ((unint64_t)(unsigned __int16)v13 + 2 > HIWORD(v21))
    {
      *a6 = HIWORD(v21);
      return;
    }
    *a6 = v13 + 2;
    if ((unsigned __int16)v13 <= v15)
    {
      __int16 v20 = *((_WORD *)a2 + 1);
      goto LABEL_18;
    }
LABEL_76:
    __break(0x5513u);
  }
LABEL_18:
  if ((v20 & 0xE) == 8)
  {
    unint64_t v24 = v19 | (v18 << 32);
    uint64_t v25 = sub_100010888(a3, v24);
    if (v25)
    {
LABEL_66:
      sub_100010788(a4, a5, v25);
      os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 132));
      return;
    }
    if (sub_10000FDD4(a1, 0))
    {
      *(void *)&__b[0] = _NSConcreteStackBlock;
      *((void *)&__b[0] + 1) = 0x40000000;
      *(void *)&__b[1] = sub_100012110;
      *((void *)&__b[1] + 1) = &unk_10002D340;
      *(void *)&__b[2] = a1;
      sub_100012038(a1, 0, (uint64_t)&stru_10002D320, (uint64_t)__b);
LABEL_65:
      uint64_t v25 = sub_100010888(a3, v24);
      if (v25) {
        goto LABEL_66;
      }
      if (!*(_WORD *)(a3 + 130)) {
        return;
      }
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v42;
      *(_OWORD *)&out[16] = v42;
      LODWORD(values) = -1431655766;
      uuid_unparse((const unsigned __int8 *)(a3 + 32), out);
      sub_10000FDD4(a1, &values);
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "#DECODE failed to resolve UUID: [pc:0x%llx ns:0x%02x type:0x%02x flags:0x%04x main:%s pid:%d]", v24, *a2, a2[1], *((unsigned __int16 *)a2 + 1), out, values);
LABEL_71:
      sub_100016E68((uint64_t)__b);
      return;
    }
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v26 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v26;
    *(_OWORD *)&out[16] = v26;
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    values = 0;
    unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
    CFDataRef v27 = (const __CFData *)OSKextCopyUUIDForAddress();
    CFDataRef v28 = v27;
    if (v27)
    {
      BytePtr = CFDataGetBytePtr(v27);
      uuid_unparse(BytePtr, out);
      values = (void *)CFStringCreateWithCString(kCFAllocatorDefault, out, 0x8000100u);
      if (values) {
        CFArrayRef v30 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      }
      else {
        CFArrayRef v30 = 0;
      }
      CFArrayRef v31 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_100030350, 3, &kCFTypeArrayCallBacks);
      if (values && v30)
      {
        CFDictionaryRef v32 = (const __CFDictionary *)OSKextCopyLoadedKextInfoByUUID();
        if (v32)
        {
          CFDictionaryRef v47 = v32;
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v32, values);
          if (Value && (cf = Value, CFTypeID v34 = CFDictionaryGetTypeID(), v34 == CFGetTypeID(cf)))
          {
            CFTypeRef v43 = CFDictionaryGetValue(cf, @"OSBundleExecLoadAddress");
            if (v43
              && (CFTypeID v35 = CFNumberGetTypeID(), v35 == CFGetTypeID(v43))
              && CFNumberGetValue((CFNumberRef)v43, kCFNumberSInt64Type, &valuePtr))
            {
              CFNumberRef v44 = (const __CFNumber *)CFDictionaryGetValue(cf, @"OSBundleExecLoadSize");
              if (v44)
              {
                CFTypeID TypeID = CFNumberGetTypeID();
                if (TypeID == CFGetTypeID(v44))
                {
                  if (CFNumberGetValue(v44, kCFNumberSInt64Type, &v48))
                  {
                    CFDataRef v37 = (const __CFData *)CFDictionaryGetValue(cf, @"OSBundleTextUUID");
                    if (v37
                      && (CFDataRef v38 = v37, cfa = (CFTypeRef)CFDataGetTypeID(), cfa == (CFTypeRef)CFGetTypeID(v38))
                      && CFDataGetLength(v38) == 16)
                    {
                      *(void *)&__b[1] = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&__b[1] + 1) = 0xAAAAAAAAAAAAAAAALL;
                      *(void *)&__b[0] = v48;
                      HIWORD(__b[0]) = -21846;
                      DWORD2(__b[0]) = valuePtr;
                      WORD6(__b[0]) = WORD2(valuePtr);
                      uint64_t v39 = CFDataGetBytePtr(v38);
                      uuid_copy((unsigned __int8 *)__b + 14, v39);
                      sub_10000C764(a3, (uint64_t)__b);
                    }
                    else
                    {
                      memset((char *)&__b[3] + 4, 170, 0x3CCuLL);
                      strcpy((char *)__b, "kext query: failed to retrieve kOSBundleTextUUIDKey");
                      sub_100016E68((uint64_t)__b);
                    }
                    goto LABEL_56;
                  }
                }
              }
              memset((char *)&__b[2] + 9, 170, 0x3D7uLL);
              uint64_t v40 = "kext query: failed to retrieve load_size";
            }
            else
            {
              memset((char *)&__b[2] + 9, 170, 0x3D7uLL);
              uint64_t v40 = "kext query: failed to retrieve load_addr";
            }
            long long v41 = *((_OWORD *)v40 + 1);
            __b[0] = *(_OWORD *)v40;
            __b[1] = v41;
            *(_OWORD *)((char *)&__b[1] + 9) = *(_OWORD *)(v40 + 25);
          }
          else
          {
            memset((char *)&__b[2] + 6, 170, 0x3DAuLL);
            strcpy((char *)__b, "kext query: failed to retrieve bundle");
          }
          sub_100016E68((uint64_t)__b);
LABEL_56:
          CFRelease(v47);
          goto LABEL_57;
        }
        memset((char *)&__b[1] + 10, 170, 0x3E6uLL);
        strcpy((char *)__b, "kext query: kext_dict nil");
      }
      else
      {
        memset((char *)&__b[1] + 14, 170, 0x3E2uLL);
        strcpy((char *)__b, "kext query: allocation failed");
      }
      sub_100016E68((uint64_t)__b);
    }
    else
    {
      memset((char *)&__b[2] + 2, 170, 0x3DEuLL);
      strcpy((char *)__b, "kext query: did not find the uuid");
      sub_100016E68((uint64_t)__b);
      CFArrayRef v31 = 0;
      CFArrayRef v30 = 0;
    }
LABEL_57:
    if (values) {
      CFRelease(values);
    }
    if (v30) {
      CFRelease(v30);
    }
    if (v31) {
      CFRelease(v31);
    }
    if (v28) {
      CFRelease(v28);
    }
    goto LABEL_65;
  }
  if ((v20 & 0xE) == 0xA)
  {
    uint64_t v22 = *(void *)(a4 + 16);
    if (v22) {
      uint64_t v23 = *(void *)(v22 + 24);
    }
    else {
      uint64_t v23 = 0;
    }
    sub_10000F568((float *)v22, v17, v23);
  }
}

uint64_t sub_10000E1F8(uint64_t a1, char *a2)
{
  uint64_t v4 = (unsigned __int8 *)(a2 + 2);
  __int16 v5 = (unsigned __int16)sub_10000E268(*(void **)(a1 + 24), a2 + 2);
  sub_10000E994(a1, v5);
  __int16 v6 = (unsigned __int16)sub_10000E268(*(void **)(a1 + 24), (char *)&v4[*a2]);

  return sub_10000E994(a1, v6);
}

void *sub_10000E268(void *result, char *a2)
{
  if (result)
  {
    int8x8_t v2 = result;
    sub_10000E2FC(__p, a2);
    uint64_t v3 = sub_10000E3AC(v2, (uint64_t)__p);
    uint64_t v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4) {
        return (void *)*((void *)v4 + 5);
      }
    }
    else if (v3)
    {
      return (void *)*((void *)v4 + 5);
    }
    return 0;
  }
  return result;
}

void *sub_10000E2FC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    char v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    char v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

unsigned __int8 *sub_10000E3AC(void *a1, uint64_t a2)
{
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    size_t v5 = (uint64_t *)a2;
  }
  else {
    size_t v5 = *(uint64_t **)a2;
  }
  if (v4 >= 0) {
    unint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v6 = *(void *)(a2 + 8);
  }
  unint64_t v7 = sub_10000E4BC(v5, v6);
  int8x8_t v8 = (int8x8_t)a1[1];
  if (!*(void *)&v8) {
    return 0;
  }
  unint64_t v9 = v7;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v12 = v7;
    if (v7 >= *(void *)&v8) {
      unint64_t v12 = v7 % *(void *)&v8;
    }
  }
  else
  {
    unint64_t v12 = (*(void *)&v8 - 1) & v7;
  }
  unint64_t v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13) {
    return 0;
  }
  for (unint64_t i = *v13; i; unint64_t i = *(unsigned __int8 **)i)
  {
    unint64_t v15 = *((void *)i + 1);
    if (v9 == v15)
    {
      if (sub_10000E8F0(i + 16, (unsigned __int8 *)a2)) {
        return i;
      }
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(void *)&v8) {
          v15 %= *(void *)&v8;
        }
      }
      else
      {
        v15 &= *(void *)&v8 - 1;
      }
      if (v15 != v12) {
        return 0;
      }
    }
  }
  return i;
}

unint64_t sub_10000E4BC(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v36 + a2 + v35 + v32;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v45 + v34 + v37;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    unsigned __int16 v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v67 + v58 + v56 + v57;
      uint64_t v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL sub_10000E8F0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

uint64_t sub_10000E994(uint64_t a1, __int16 a2)
{
  LOWORD(v4) = a2;
  if (*(void *)(a1 + 80)) {
    uint64_t v2 = **(void ***)(*(void *)(a1 + 72) + 8);
  }
  else {
    uint64_t v2 = sub_10000EC9C(a1);
  }
  return sub_10000EAA0((int *)v2[5], &v4, 0);
}

uint64_t sub_10000EA0C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v4 = (void *)(*(void *)(a1 + 16) + 8 * (qword_10002E840[*(unsigned __int8 *)(a1 + 8)](a2) % *(_DWORD *)a1));
    int v5 = (unsigned int (*)(void, uint64_t))qword_10002E858[*(unsigned __int8 *)(a1 + 8)];
    while (1)
    {
      uint64_t v4 = (void *)*v4;
      if (!v4) {
        break;
      }
      if (v5(v4[1], a2)) {
        return v4[2];
      }
    }
  }
  return 0;
}

uint64_t sub_10000EAA0(int *a1, void *a2, uint64_t a3)
{
  unsigned int v6 = ((unsigned int (**)(void *))qword_10002E840)[*((unsigned __int8 *)a1 + 8)](a2);
  unsigned int v7 = *a1;
  if (!*((void *)a1 + 2)) {
    goto LABEL_8;
  }
  int v8 = (void *)(*((void *)a1 + 2)
                + 8
                * (((unsigned int (**)(void *))qword_10002E840)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  int v9 = (uint64_t (*)(void, void *))qword_10002E858[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    int v8 = (void *)*v8;
    if (!v8) {
      break;
    }
    if (v9(v8[1], a2)) {
      return 0;
    }
  }
  if (!*((void *)a1 + 2)) {
LABEL_8:
  }
    *((void *)a1 + 2) = _os_trace_calloc();
  unsigned int v11 = v6 % v7;
  int v12 = *((unsigned __int8 *)a1 + 8);
  BOOL v13 = (void *)_os_trace_calloc();
  *BOOL v13 = 0;
  _OWORD v13[2] = a3;
  if (v12 == 2)
  {
    v13[1] = *a2;
  }
  else if (v12 == 1)
  {
    *((_WORD *)v13 + 4) = *(_WORD *)a2;
  }
  else
  {
    free(v13);
    BOOL v13 = 0;
  }
  uint64_t v14 = *((void *)a1 + 2);
  *BOOL v13 = *(void *)(v14 + 8 * v11);
  *(void *)(v14 + 8 * v11) = v13;
  ++a1[1];
  return 1;
}

uint64_t sub_10000EBF0(unsigned __int16 *a1)
{
  return *a1;
}

BOOL sub_10000EBF8(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

uint64_t sub_10000EC08(uint64_t a1, uint64_t a2, __int16 a3, char *a4)
{
  __int16 v8 = a3;
  uint64_t result = sub_10000EA0C(*(void *)(a2 + 64), (uint64_t)&v8);
  if (!result) {
    return sub_10000ED60(a1, a2, v8, a4 + 2, &a4[*a4 + 2]);
  }
  return result;
}

void *sub_10000EC9C(uint64_t a1)
{
  uint64_t v2 = (void *)_os_trace_calloc();
  v2[2] = -1;
  uint64_t v3 = _os_trace_calloc();
  *(void *)uint64_t v3 = 16;
  *(unsigned char *)(v3 + 8) = 1;
  *(void *)(v3 + 16) = _os_trace_calloc();
  v2[6] = v3;
  uint64_t v4 = _os_trace_calloc();
  *(void *)uint64_t v4 = 16;
  *(unsigned char *)(v4 + 8) = 1;
  *(void *)(v4 + 16) = _os_trace_calloc();
  void v2[5] = v4;
  int v5 = *(void **)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  *uint64_t v2 = 0;
  v2[1] = v5;
  *int v5 = v2;
  *(void *)(a1 + 72) = v2;
  *(void *)(a1 + 80) = v6 + 1;
  return v2;
}

uint64_t sub_10000ED60(uint64_t a1, uint64_t a2, __int16 a3, char *a4, char *a5)
{
  LOWORD(v18) = a3;
  uint64_t v10 = _os_trace_calloc();
  *(_WORD *)uint64_t v10 = a3;
  unsigned int v11 = sub_10000EEA4(*(void **)(a1 + 24), a4);
  *(void *)(v10 + 8) = v11;
  if (!v11)
  {
    sub_10000EF44((uint64_t **)(a1 + 24), a4, *(void *)(a1 + 32));
    size_t v12 = strlen(a4);
    BOOL v13 = *(void **)(a1 + 24);
    *(void *)(a1 + 32) += v12 + 1;
    *(void *)(v10 + 8) = sub_10000EEA4(v13, a4);
  }
  uint64_t v14 = sub_10000EEA4(*(void **)(a1 + 24), a5);
  *(void *)(v10 + 16) = v14;
  if (!v14)
  {
    sub_10000EF44((uint64_t **)(a1 + 24), a5, *(void *)(a1 + 32));
    size_t v15 = strlen(a5);
    uint64_t v16 = *(void **)(a1 + 24);
    *(void *)(a1 + 32) += v15 + 1;
    *(void *)(v10 + 16) = sub_10000EEA4(v16, a5);
  }
  uint64_t result = sub_10000EAA0(*(int **)(a2 + 64), &v18, v10);
  ++*(void *)(a1 + 56);
  return result;
}

void *sub_10000EEA4(void *result, char *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    sub_10000E2FC(__p, a2);
    uint64_t v3 = sub_10000E3AC(v2, (uint64_t)__p);
    uint64_t v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
      {
LABEL_4:
        uint64_t result = v4 + 16;
        if ((char)v4[39] < 0) {
          return (void *)*result;
        }
        return result;
      }
    }
    else if (v3)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000EF44(uint64_t **a1, char *__s, uint64_t a3)
{
  uint64_t v4 = *a1;
  if (!*a1) {
    operator new();
  }
  sub_10000E2FC(__p, __s);
  char v5 = HIBYTE(v45);
  if (v45 >= 0) {
    char v6 = (uint64_t *)__p;
  }
  else {
    char v6 = (uint64_t *)__p[0];
  }
  if (v45 >= 0) {
    unint64_t v7 = HIBYTE(v45);
  }
  else {
    unint64_t v7 = (unint64_t)__p[1];
  }
  unint64_t v8 = sub_10000E4BC(v6, v7);
  unint64_t v9 = v8;
  unint64_t v10 = v4[1];
  if (!v10)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_26;
  }
  uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
  v11.i16[0] = vaddlv_u8(v11);
  unint64_t v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    unint64_t v13 = v8;
    if (v8 >= v10) {
      unint64_t v13 = v8 % v10;
    }
  }
  else
  {
    unint64_t v13 = (v10 - 1) & v8;
  }
  uint64_t v14 = *(unsigned __int8 ***)(*v4 + 8 * v13);
  if (!v14 || (size_t v15 = *v14) == 0)
  {
LABEL_26:
    uint64_t v17 = v4 + 2;
    uint64_t v18 = operator new(0x30uLL);
    void *v18 = 0;
    v18[1] = v9;
    uint64_t v19 = v45;
    *((_OWORD *)v18 + 1) = *(_OWORD *)__p;
    __p[1] = 0;
    uint64_t v45 = 0;
    __p[0] = 0;
    v18[4] = v19;
    v18[5] = a3;
    float v20 = (float)(unint64_t)(v4[3] + 1);
    float v21 = *((float *)v4 + 8);
    if (v10 && (float)(v21 * (float)v10) >= v20)
    {
LABEL_72:
      uint64_t v37 = *v4;
      uint64_t v38 = *(void **)(*v4 + 8 * v13);
      if (v38)
      {
        void *v18 = *v38;
      }
      else
      {
        unint64_t v39 = (void *)*v17;
        void *v18 = *v17;
        *uint64_t v17 = v18;
        *(void *)(v37 + 8 * v13) = v17;
        if (!v39) {
          goto LABEL_81;
        }
        unint64_t v40 = v39[1];
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v40 >= v10) {
            v40 %= v10;
          }
        }
        else
        {
          v40 &= v10 - 1;
        }
        uint64_t v38 = (void *)(*v4 + 8 * v40);
      }
      *uint64_t v38 = v18;
LABEL_81:
      ++v4[3];
      uint64_t v41 = 1;
      if (v45 < 0) {
        goto LABEL_82;
      }
      return v41;
    }
    BOOL v22 = 1;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v10 = v4[1];
    if (*(void *)&prime > v10) {
      goto LABEL_38;
    }
    if (*(void *)&prime < v10)
    {
      unint64_t v32 = vcvtps_u32_f32((float)(unint64_t)v4[3] / *((float *)v4 + 8));
      if (v10 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v10)
      {
        unint64_t v10 = v4[1];
      }
      else
      {
        if (prime)
        {
LABEL_38:
          if (*(void *)&prime >> 61) {
            sub_1000240CC();
          }
          uint64_t v26 = operator new(8 * *(void *)&prime);
          unint64_t v27 = (void *)*v4;
          *uint64_t v4 = (uint64_t)v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          v4[1] = (uint64_t)prime;
          do
            *(void *)(*v4 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          unint64_t v29 = (void *)*v17;
          if (*v17)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*v4 + 8 * v30) = v17;
            uint64_t v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(void *)(*v4 + 8 * v36))
                  {
                    *(void *)(*v4 + 8 * v36) = v29;
                    goto LABEL_63;
                  }
                  *unint64_t v29 = *v35;
                  *uint64_t v35 = **(void **)(*v4 + 8 * v36);
                  **(void **)(*v4 + 8 * v36) = v35;
                  uint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_63:
                unint64_t v29 = v35;
                uint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v10 = (unint64_t)prime;
          goto LABEL_67;
        }
        uint64_t v43 = (void *)*v4;
        *uint64_t v4 = 0;
        if (v43) {
          operator delete(v43);
        }
        unint64_t v10 = 0;
        v4[1] = 0;
      }
    }
LABEL_67:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v13 = v9 % v10;
      }
      else {
        unint64_t v13 = v9;
      }
    }
    else
    {
      unint64_t v13 = (v10 - 1) & v9;
    }
    goto LABEL_72;
  }
  while (1)
  {
    unint64_t v16 = *((void *)v15 + 1);
    if (v16 == v9) {
      break;
    }
    if (v12 > 1)
    {
      if (v16 >= v10) {
        v16 %= v10;
      }
    }
    else
    {
      v16 &= v10 - 1;
    }
    if (v16 != v13) {
      goto LABEL_26;
    }
LABEL_25:
    size_t v15 = *(unsigned __int8 **)v15;
    if (!v15) {
      goto LABEL_26;
    }
  }
  if (!sub_10000E8F0(v15 + 16, (unsigned __int8 *)__p)) {
    goto LABEL_25;
  }
  uint64_t v41 = 0;
  if (v5 < 0) {
LABEL_82:
  }
    operator delete(__p[0]);
  return v41;
}

uint64_t sub_10000F3F4(uint64_t a1)
{
  return *(void *)(a1 + 88);
}

uint64_t sub_10000F3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (float **)(a1 + 40);
  char v5 = sub_10000FA14(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5) {
    return (uint64_t)v5;
  }
  uint64_t v6 = _os_trace_calloc();
  char v5 = (void *)v6;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 48);
  *(void *)(v6 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  *(_OWORD *)(v6 + 16) = v7;
  unint64_t v10 = *v4;
  if (*v4) {
    LOWORD(v10) = *((_WORD *)v10 + 12);
  }
  *(_WORD *)uint64_t v6 = (_WORD)v10;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    uint64_t v12 = *(void *)(v11 + 24);
  }
  else {
    uint64_t v12 = 0;
  }
  sub_10000F568((float *)v11, v5 + 3, v12);
  if (!uuid_is_null((const unsigned __int8 *)v5 + 40))
  {
    uint64_t v13 = *(void *)(a1 + 16);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 24);
    }
    else {
      uint64_t v14 = 0;
    }
    sub_10000F568((float *)v13, v5 + 5, v14);
  }
  uint64_t v15 = _os_trace_calloc();
  *(void *)uint64_t v15 = 16;
  *(unsigned char *)(v15 + 8) = 2;
  *(void *)(v15 + 16) = _os_trace_calloc();
  void v5[7] = v15;
  uint64_t v16 = _os_trace_calloc();
  *(void *)uint64_t v16 = 16;
  *(unsigned char *)(v16 + 8) = 1;
  *(void *)(v16 + 16) = _os_trace_calloc();
  v5[8] = v16;
  if (sub_10000FE0C(v4, v5[1], *((_DWORD *)v5 + 4), (uint64_t)v5)) {
    return (uint64_t)v5;
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t sub_10000F568(float *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = __ROR8__(v6 + 16, 16);
  unint64_t v8 = (0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
  unint64_t v9 = *((void *)a1 + 1);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v11 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69
             * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
    }
    else
    {
      unint64_t v11 = v8 & (v9 - 1);
    }
    uint64_t v12 = *(void **)(*(void *)a1 + 8 * v11);
    if (v12)
    {
      for (unint64_t i = (void *)*v12; i; unint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          if (i[2] == v5 && i[3] == v6) {
            return 0;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  uint64_t v16 = operator new(0x28uLL);
  *uint64_t v16 = 0;
  v16[1] = v8;
  v16[2] = v5;
  v16[3] = v6;
  v16[4] = a3;
  float v17 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v18 = a1[8];
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      int8x8_t prime = (int8x8_t)v21;
    }
    else {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v9 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v9) {
      goto LABEL_34;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v29 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        unint64_t v29 = std::__next_prime(v29);
      }
      else
      {
        uint64_t v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2) {
          unint64_t v29 = v31;
        }
      }
      if (*(void *)&prime <= v29) {
        int8x8_t prime = (int8x8_t)v29;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            sub_1000240CC();
          }
          unint64_t v23 = operator new(8 * *(void *)&prime);
          unint64_t v24 = *(void **)a1;
          *(void *)a1 = v23;
          if (v24) {
            operator delete(v24);
          }
          uint64_t v25 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v25++) = 0;
          while (*(void *)&prime != v25);
          uint64_t v26 = (void *)*((void *)a1 + 2);
          if (v26)
          {
            unint64_t v27 = v26[1];
            uint8x8_t v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(void *)&prime) {
                v27 %= *(void *)&prime;
              }
            }
            else
            {
              v27 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v27) = a1 + 4;
            unint64_t v32 = (void *)*v26;
            if (*v26)
            {
              do
              {
                unint64_t v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(void *)&prime) {
                    v33 %= *(void *)&prime;
                  }
                }
                else
                {
                  v33 &= *(void *)&prime - 1;
                }
                if (v33 != v27)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v33))
                  {
                    *(void *)(*(void *)a1 + 8 * v33) = v26;
                    goto LABEL_59;
                  }
                  *uint64_t v26 = *v32;
                  *unint64_t v32 = **(void **)(*(void *)a1 + 8 * v33);
                  **(void **)(*(void *)a1 + 8 * v33) = v32;
                  unint64_t v32 = v26;
                }
                unint64_t v33 = v27;
LABEL_59:
                uint64_t v26 = v32;
                unint64_t v32 = (void *)*v32;
                unint64_t v27 = v33;
              }
              while (v32);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_63;
        }
        unint64_t v39 = *(void **)a1;
        *(void *)a1 = 0;
        if (v39) {
          operator delete(v39);
        }
        unint64_t v9 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_63:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v11 = v8 % v9;
      }
      else {
        unint64_t v11 = v8;
      }
    }
    else
    {
      unint64_t v11 = (v9 - 1) & v8;
    }
  }
  uint64_t v34 = *(void **)a1;
  uint64_t v35 = *(void **)(*(void *)a1 + 8 * v11);
  if (v35)
  {
    *uint64_t v16 = *v35;
LABEL_76:
    *uint64_t v35 = v16;
    goto LABEL_77;
  }
  uint64_t v36 = *((void *)a1 + 2);
  *uint64_t v16 = v36;
  *((void *)a1 + 2) = v16;
  v34[v11] = a1 + 4;
  if (v36)
  {
    unint64_t v37 = *(void *)(v36 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v37 >= v9) {
        v37 %= v9;
      }
    }
    else
    {
      v37 &= v9 - 1;
    }
    uint64_t v35 = (void *)(*(void *)a1 + 8 * v37);
    goto LABEL_76;
  }
LABEL_77:
  ++*((void *)a1 + 3);
  return 1;
}

uint64_t sub_10000F988(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 80)) {
    uint64_t v4 = **(void ***)(*(void *)(a1 + 72) + 8);
  }
  else {
    uint64_t v4 = sub_10000EC9C(a1);
  }
  if (sub_10000FA14(*(void **)(a1 + 40), *(void *)(a2 + 8), *(_DWORD *)(a2 + 16)))
  {
    uint64_t v5 = (int *)v4[6];
    return sub_10000EAA0(v5, (void *)a2, 0);
  }
  else
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

void *sub_10000FA14(void *result, uint64_t a2, unsigned int a3)
{
  if (result)
  {
    int8x8_t v3 = (int8x8_t)result[1];
    if (v3)
    {
      uint64_t v4 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12);
      unint64_t v5 = (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
      uint8x8_t v6 = (uint8x8_t)vcnt_s8(v3);
      v6.i16[0] = vaddlv_u8(v6);
      if (v6.u32[0] > 1uLL)
      {
        unint64_t v7 = (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
        if (v5 >= *(void *)&v3) {
          unint64_t v7 = v5 % *(void *)&v3;
        }
      }
      else
      {
        unint64_t v7 = v5 & (*(void *)&v3 - 1);
      }
      unint64_t v8 = *(uint64_t ***)(*result + 8 * v7);
      if (v8)
      {
        for (unint64_t i = *v8; i; unint64_t i = (uint64_t *)*i)
        {
          unint64_t v10 = i[1];
          if (v5 == v10)
          {
            if (*((_DWORD *)i + 6) == a3 && i[2] == a2) {
              return (void *)i[4];
            }
          }
          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v10 >= *(void *)&v3) {
                v10 %= *(void *)&v3;
              }
            }
            else
            {
              v10 &= *(void *)&v3 - 1;
            }
            if (v10 != v7) {
              return 0;
            }
          }
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000FB1C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  *a2 = 2048;
  return v2 + 2048;
}

uint64_t sub_10000FB30(uint64_t a1)
{
  return *(unsigned int *)(a1 + 136);
}

uint64_t sub_10000FB38(dispatch_queue_t *a1, char *a2, int a3, void *a4)
{
  dispatch_assert_queue_V2(*a1);
  if (HIWORD(a3) != 4096)
  {
    unsigned int v9 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
    if ((unsigned __int16)a3 - HIWORD(a3) + 7 < 0xFFFFF007
      || (((unsigned __int16)a3 - HIWORD(a3)) & 7) == 0)
    {
      if (v9 >= 0xFF9) {
        unsigned int v8 = 4096;
      }
      else {
        unsigned int v8 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
      }
      goto LABEL_12;
    }
LABEL_13:
    uint64_t v11 = v9 - (unint64_t)(v9 & 7) + 40;
    goto LABEL_14;
  }
  unsigned int v8 = (unsigned __int16)a3;
  unsigned int v9 = (unsigned __int16)a3;
  if ((a3 & 7) != 0) {
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v11 = v8 + 32;
LABEL_14:
  unsigned int v38 = v11;
  uint64_t result = (uint64_t)sub_100010284((uint64_t)a1, v11);
  uint64_t v13 = a1 + 6;
  if (__CFADD__(a1 + 6, 264 * result)) {
    goto LABEL_42;
  }
  unsigned int v14 = result;
  uint64_t v15 = sub_10000FDD4((uint64_t)a4, 0);
  unsigned int v16 = sub_10000FE04((uint64_t)a4);
  float v17 = &v13[33 * v14];
  BOOL v19 = v17[28];
  float v18 = (float **)(v17 + 28);
  uint64_t result = (uint64_t)sub_10000FA14(v19, v15, v16);
  if (!result)
  {
    unint64_t v20 = os_retain(a4);
    uint64_t result = sub_10000FE0C(v18, v15, v16, (uint64_t)v20);
  }
  unint64_t v21 = &v13[33 * v14];
  unsigned int v24 = *((_DWORD *)v21 + 63);
  unint64_t v23 = (int32x2_t *)((char *)v21 + 252);
  uint64_t v22 = v24;
  uint64_t v25 = *(uint64_t *)((char *)&v23[-2] + 4);
  if (__CFADD__(v25, v24)) {
    goto LABEL_42;
  }
  unsigned int v26 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
  BOOL v27 = v26 < 0xFF9;
  if (v26 >= 0xFF9) {
    unsigned int v26 = 4096;
  }
  if (HIWORD(a3) == 4096) {
    size_t v28 = (unsigned __int16)a3;
  }
  else {
    size_t v28 = v26;
  }
  BOOL v29 = HIWORD(a3) != 4096 && v27;
  size_t v30 = v28 + 32;
  if (v25)
  {
    uint64_t v31 = v25 + v22;
    if ((v28 & 7) == 0) {
      goto LABEL_34;
    }
    if (!__CFADD__(v31, v30 & 0x1FFFFFFF8)) {
      goto LABEL_33;
    }
    goto LABEL_42;
  }
  uint64_t result = _os_trace_malloc();
  uint64_t v31 = result;
  if ((v28 & 7) != 0)
  {
    if (!__CFADD__(result, v30 & 0x1FFFFFFF8))
    {
LABEL_33:
      *(void *)(v31 + (v30 & 0x1FFFFFFF8)) = 0;
      goto LABEL_34;
    }
LABEL_42:
    __break(0x5513u);
    goto LABEL_43;
  }
LABEL_34:
  *(void *)uint64_t v31 = 24577;
  *(void *)(v31 + 8) = v28 + 16;
  uint64_t v32 = sub_10000FDD4((uint64_t)a4, 0);
  int v33 = sub_10000FE04((uint64_t)a4);
  *(void *)(v31 + 16) = v32;
  *(_DWORD *)(v31 + 24) = v33;
  *(unsigned char *)(v31 + 28) = 0;
  *(unsigned char *)(v31 + 29) = v29;
  uint64_t v34 = v31 + 32;
  *(_WORD *)(v31 + 30) = 0;
  if (!v29)
  {
    uint64_t v35 = (void *)(v31 + 32);
    uint64_t v36 = a2;
    size_t v37 = v28;
    goto LABEL_40;
  }
  uint64_t result = (uint64_t)memcpy((void *)(v31 + 32), a2, (unsigned __int16)a3);
  if (__CFADD__(v34, (unsigned __int16)a3)) {
    goto LABEL_42;
  }
  if (HIWORD(a3) <= 0x1000uLL)
  {
    if (!__CFADD__(a2, HIWORD(a3)))
    {
      uint64_t v35 = (void *)(v34 + (unsigned __int16)a3);
      uint64_t v36 = &a2[HIWORD(a3)];
      size_t v37 = 4096 - HIWORD(a3);
LABEL_40:
      uint64_t result = (uint64_t)memcpy(v35, v36, v37);
      *unint64_t v23 = vadd_s32(*v23, (int32x2_t)(v38 | 0x100000000));
      return result;
    }
    goto LABEL_42;
  }
LABEL_43:
  __break(0x5512u);
  return result;
}

uint64_t sub_10000FDD4(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (a2) {
    *a2 = *(_DWORD *)(a1 + 128);
  }
  if (!*(_DWORD *)(a1 + 128)) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 1536);
  if (v3) {
    return v3;
  }
  else {
    return -1;
  }
}

uint64_t sub_10000FE04(uint64_t a1)
{
  return *(unsigned int *)(a1 + 132);
}

uint64_t sub_10000FE0C(float **a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v7 = *a1;
  if (!*a1) {
    operator new();
  }
  unint64_t v8 = 0x9DDFEA08EB382D69 * (a2 ^ __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12));
  unint64_t v9 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12) ^ (v8 >> 47);
  unint64_t v10 = 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v9 ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v9 ^ v8)) >> 47));
  unint64_t v11 = v10 ^ __PAIR64__(a3, HIDWORD(a2));
  unint64_t v12 = *((void *)v7 + 1);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v14 = v10 ^ __PAIR64__(a3, HIDWORD(a2));
      if (v11 >= v12) {
        unint64_t v14 = v11 % v12;
      }
    }
    else
    {
      unint64_t v14 = v11 & (v12 - 1);
    }
    uint64_t v15 = *(uint64_t ***)(*(void *)v7 + 8 * v14);
    if (v15)
    {
      for (unint64_t i = *v15; i; unint64_t i = (uint64_t *)*i)
      {
        unint64_t v17 = i[1];
        if (v17 == v11)
        {
          if (*((_DWORD *)i + 6) == a3 && i[2] == a2) {
            return 0;
          }
        }
        else
        {
          if (v13.u32[0] > 1uLL)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v14) {
            break;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  }
  BOOL v19 = operator new(0x28uLL);
  *BOOL v19 = 0;
  v19[1] = v11;
  size_t v19[2] = a2;
  *((_DWORD *)v19 + 6) = a3;
  v19[4] = a4;
  float v20 = (float)(unint64_t)(*((void *)v7 + 3) + 1);
  float v21 = v7[8];
  if (!v12 || (float)(v21 * (float)v12) < v20)
  {
    BOOL v22 = 1;
    if (v12 >= 3) {
      BOOL v22 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v12);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      int8x8_t prime = (int8x8_t)v24;
    }
    else {
      int8x8_t prime = (int8x8_t)v23;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v12 = *((void *)v7 + 1);
    if (*(void *)&prime > v12) {
      goto LABEL_36;
    }
    if (*(void *)&prime < v12)
    {
      unint64_t v32 = vcvtps_u32_f32((float)*((unint64_t *)v7 + 3) / v7[8]);
      if (v12 < 3 || (uint8x8_t v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        unint64_t v32 = std::__next_prime(v32);
      }
      else
      {
        uint64_t v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2) {
          unint64_t v32 = v34;
        }
      }
      if (*(void *)&prime <= v32) {
        int8x8_t prime = (int8x8_t)v32;
      }
      if (*(void *)&prime >= v12)
      {
        unint64_t v12 = *((void *)v7 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(void *)&prime >> 61) {
            sub_1000240CC();
          }
          unsigned int v26 = operator new(8 * *(void *)&prime);
          BOOL v27 = *(void **)v7;
          *(void *)unint64_t v7 = v26;
          if (v27) {
            operator delete(v27);
          }
          uint64_t v28 = 0;
          *((int8x8_t *)v7 + 1) = prime;
          do
            *(void *)(*(void *)v7 + 8 * v28++) = 0;
          while (*(void *)&prime != v28);
          BOOL v29 = (void *)*((void *)v7 + 2);
          if (v29)
          {
            unint64_t v30 = v29[1];
            uint8x8_t v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(void *)&prime) {
                v30 %= *(void *)&prime;
              }
            }
            else
            {
              v30 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)v7 + 8 * v30) = v7 + 4;
            uint64_t v35 = (void *)*v29;
            if (*v29)
            {
              do
              {
                unint64_t v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(void *)&prime) {
                    v36 %= *(void *)&prime;
                  }
                }
                else
                {
                  v36 &= *(void *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(void *)(*(void *)v7 + 8 * v36))
                  {
                    *(void *)(*(void *)v7 + 8 * v36) = v29;
                    goto LABEL_61;
                  }
                  *BOOL v29 = *v35;
                  *uint64_t v35 = **(void **)(*(void *)v7 + 8 * v36);
                  **(void **)(*(void *)v7 + 8 * v36) = v35;
                  uint64_t v35 = v29;
                }
                unint64_t v36 = v30;
LABEL_61:
                BOOL v29 = v35;
                uint64_t v35 = (void *)*v35;
                unint64_t v30 = v36;
              }
              while (v35);
            }
          }
          unint64_t v12 = (unint64_t)prime;
          goto LABEL_65;
        }
        unint64_t v42 = *(void **)v7;
        *(void *)unint64_t v7 = 0;
        if (v42) {
          operator delete(v42);
        }
        unint64_t v12 = 0;
        *((void *)v7 + 1) = 0;
      }
    }
LABEL_65:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v14 = v11 % v12;
      }
      else {
        unint64_t v14 = v11;
      }
    }
    else
    {
      unint64_t v14 = (v12 - 1) & v11;
    }
  }
  size_t v37 = *(void **)v7;
  unsigned int v38 = *(void **)(*(void *)v7 + 8 * v14);
  if (v38)
  {
    *BOOL v19 = *v38;
LABEL_78:
    *unsigned int v38 = v19;
    goto LABEL_79;
  }
  uint64_t v39 = *((void *)v7 + 2);
  *BOOL v19 = v39;
  *((void *)v7 + 2) = v19;
  v37[v14] = v7 + 4;
  if (v39)
  {
    unint64_t v40 = *(void *)(v39 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v40 >= v12) {
        v40 %= v12;
      }
    }
    else
    {
      v40 &= v12 - 1;
    }
    unsigned int v38 = (void *)(*(void *)v7 + 8 * v40);
    goto LABEL_78;
  }
LABEL_79:
  ++*((void *)v7 + 3);
  return 1;
}

tm *sub_100010284(uint64_t a1, uint64_t a2)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  uint64_t v4 = a1 + 48;
  uint64_t v5 = *(unsigned int *)(a1 + 1128);
  if (v5 != -1)
  {
    if (v5 >= 5) {
      goto LABEL_53;
    }
    if (__CFADD__(v4, 264 * v5)) {
      goto LABEL_52;
    }
    uint64_t v6 = *(unsigned int *)(v4 + 264 * v5 + 252);
    if (v6 + a2 <= (unint64_t)*(unsigned int *)(v4 + 264 * v5 + 248)
      && *(_DWORD *)(v4 + 264 * v5 + 256) < 0x64u)
    {
      goto LABEL_35;
    }
    sub_100010A08(a1);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
LABEL_8:
  while (1)
  {
    for (unint64_t i = *(void *)(a1 + 1104); ; unint64_t i = v9)
    {
      while (!i)
      {
        if (!HIDWORD(i))
        {
LABEL_17:
          uint64_t v11 = *(void *)(a1 + 8);
          if (v11) {
            unint64_t v12 = (dispatch_queue_t *)(v11 + 16);
          }
          else {
            unint64_t v12 = (dispatch_queue_t *)a1;
          }
          dispatch_async_and_wait(*v12, &stru_10002DCE8);
          goto LABEL_8;
        }
        unint64_t v10 = i;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(a1 + 1104), &v10, (HIDWORD(i) | 1) << 32, memory_order_acquire, memory_order_acquire);
        if (v10 == i) {
          goto LABEL_21;
        }
        unint64_t i = v10;
      }
      uint64_t v8 = (i - 1) & i;
      unint64_t v9 = i;
      atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(a1 + 1104), &v9, i & 0xFFFFFFFF00000000 | v8, memory_order_acquire, memory_order_acquire);
      if (v9 == i) {
        break;
      }
    }
    if (v8 != i) {
      break;
    }
    if (!HIDWORD(i)) {
      goto LABEL_17;
    }
    do
    {
LABEL_21:
      if ((__ulock_wait() & 0x80000000) == 0) {
        goto LABEL_8;
      }
      int v13 = *__error();
    }
    while (v13 == 4);
    if (v13 > 0x3C || ((1 << v13) & 0x1000000000004001) == 0)
    {
      qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: ulock_wait() failed";
      qword_100031F78 = v13;
      __break(1u);
      goto LABEL_52;
    }
  }
  uint64_t v5 = __clz(__rbit32(i));
  if (v5 >= 5) {
LABEL_53:
  }
    __break(0x5512u);
  if (__CFADD__(v4, 264 * v5))
  {
LABEL_52:
    __break(0x5513u);
    goto LABEL_53;
  }
  uint64_t v15 = v4 + 264 * v5;
  uint64_t v17 = *(void *)(v15 + 240);
  unsigned int v16 = (void *)(v15 + 240);
  if (!v17)
  {
    size_t v18 = *(unsigned int *)(v4 + 264 * v5 + 248);
    BOOL v19 = (void *)(*(void *)(a1 + 1112) + (v18 * v5));
    *unsigned int v16 = v19;
    madvise(v19, v18, 8);
  }
  *(_DWORD *)(a1 + 1128) = v5;
  LODWORD(v6) = *(_DWORD *)(v4 + 264 * v5 + 252);
LABEL_35:
  if (v6) {
    return (tm *)v5;
  }
  uint64_t v20 = v4 + 264 * v5;
  size_t v40 = 0xAAAAAAAAAAAAAAAALL;
  if (!*(_DWORD *)v20)
  {
    *(void *)uint64_t v20 = 0x1100001000;
    *(void *)(v20 + 8) = 208;
    *(_DWORD *)(v20 + 52) = 1;
    mach_timebase_info((mach_timebase_info_t)(v20 + 16));
    *(void *)(v20 + 56) = 0x800006100;
    *(void *)(v20 + 72) = 0x3800006101;
    *(void *)(v20 + 136) = 0x1800006102;
    *(void *)(v20 + 168) = 0x3000006103;
    size_t v40 = 4;
    sysctlbyname("hw.cputype", (void *)(v20 + 80), &v40, 0, 0);
    size_t v40 = 4;
    sysctlbyname("hw.cpusubtype", (void *)(v20 + 84), &v40, 0, 0);
    size_t v40 = 16;
    sysctlbyname("kern.osversion", (void *)(v20 + 88), &v40, 0, 0);
    size_t v40 = 32;
    sysctlbyname("hw.model", (void *)(v20 + 104), &v40, 0, 0);
    boot_uuid = (const char *)_os_trace_get_boot_uuid();
    uuid_parse(boot_uuid, (unsigned __int8 *)(v20 + 144));
    *(_DWORD *)(v20 + 160) = getpid();
  }
  int v22 = *(_DWORD *)(a1 + 1244);
  int v23 = *(_DWORD *)(v20 + 52);
  if (v22)
  {
    unsigned int v24 = v23 | 2;
    *(_DWORD *)(a1 + 1244) = v22 & 0xFFFFFFFE;
  }
  else
  {
    unsigned int v24 = v23 & 0xFFFFFFFD;
  }
  *(_DWORD *)(v20 + 52) = v24;
  uint64_t v25 = *(void *)(a1 + 16);
  *(void *)(v20 + 64) = *(void *)(a1 + 24);
  time_t v26 = *(void *)(a1 + 32);
  uint64_t v27 = *(void *)(a1 + 40);
  *(void *)(v20 + 24) = v25;
  *(void *)(v20 + 32) = v26;
  *(_DWORD *)(v20 + 40) = (int)v27 / 1000;
  time_t v39 = v26;
  __b.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&__b.tm_mon = v28;
  *(_OWORD *)&__b.int tm_isdst = v28;
  *(_OWORD *)&__b.tm_sec = v28;
  uint64_t result = localtime_r(&v39, &__b);
  int tm_isdst = __b.tm_isdst;
  *(_DWORD *)(v20 + 48) = __b.tm_isdst;
  if (__OFSUB__(0, __b.tm_gmtoff))
  {
    __break(0x550Du);
    goto LABEL_55;
  }
  uint64_t v31 = 60 * tm_isdst;
  if (v31 != (int)v31)
  {
LABEL_55:
    __break(0x550Cu);
    goto LABEL_56;
  }
  int v32 = -LODWORD(__b.tm_gmtoff) / 60;
  BOOL v33 = __OFADD__(v32, v31);
  int v34 = v32 + v31;
  if (!v33)
  {
    *(_DWORD *)(v20 + 44) = v34;
    *(_OWORD *)(v20 + 176) = 0u;
    uint64_t v35 = v20 + 176;
    *(_OWORD *)(v35 + 16) = 0u;
    *(_OWORD *)(v35 + 32) = 0u;
    memset(&__b, 170, 0x400uLL);
    unint64_t v36 = readlink("/private/var/db/timezone/localtime", (char *)&__b, 0x3FFuLL);
    if ((v36 & 0x8000000000000000) == 0)
    {
      if (v36 >= 0x400) {
        goto LABEL_53;
      }
      if (v36 <= ~(unint64_t)&__b)
      {
        *((unsigned char *)&__b.tm_sec + v36) = 0;
        size_t v37 = strstr((char *)&__b, "/private/var/db/timezone/zoneinfo/zoneinfo/");
        unint64_t v38 = 43;
        if (!v37) {
          unint64_t v38 = 0;
        }
        if (v38 <= ~(unint64_t)&__b)
        {
          strlcpy((char *)v35, (const char *)&__b + v38, 0x30uLL);
          return (tm *)v5;
        }
      }
      goto LABEL_52;
    }
    return (tm *)v5;
  }
LABEL_56:
  __break(0x5500u);
  return result;
}

uint64_t sub_10001074C(void *a1)
{
  unint64_t v1 = *a1 + ~(*a1 << 32);
  unint64_t v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  unint64_t v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

uint64_t sub_100010788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 24);
  }
  else {
    uint64_t v7 = 0;
  }
  sub_10000F568((float *)v6, (uint64_t *)(a3 + 14), v7);
  unint64_t v10 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
  uint64_t result = sub_10000EA0C(*(void *)(a2 + 56), (uint64_t)&v10);
  if (!result)
  {
    uint64_t v9 = _os_trace_calloc();
    *(void *)uint64_t v9 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
    *(void *)(v9 + 8) = *(void *)a3;
    *(_OWORD *)(v9 + 16) = *(_OWORD *)(a3 + 14);
    uint64_t result = sub_10000EAA0(*(int **)(a2 + 56), (void *)v9, v9);
    if ((result & 1) == 0)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    ++*(void *)(a1 + 48);
  }
  return result;
}

uint64_t sub_100010888(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options();
  if (*(_WORD *)(a1 + 130))
  {
    unint64_t v5 = 0;
    uint64_t result = 0;
    uint64_t v7 = *(void *)(a1 + 72);
    unint64_t v8 = -1;
    do
    {
      if (v5 > ~v7)
      {
        __break(0x5513u);
        return result;
      }
      uint64_t v9 = (unint64_t *)(v7 + v5);
      unint64_t v10 = *(unsigned int *)(v7 + v5 + 8) | ((unint64_t)*(unsigned __int16 *)(v7 + v5 + 12) << 32);
      if (v10 <= a2 && *v9 + v10 > a2 && *v9 < v8)
      {
        uint64_t result = v7 + v5;
        unint64_t v8 = *v9;
      }
      v5 += 32;
    }
    while (32 * *(unsigned __int16 *)(a1 + 130) != v5);
    if (result) {
      return result;
    }
  }
  os_unfair_lock_unlock(v4);
  return 0;
}

BOOL sub_100010948(uint64_t a1, void *a2)
{
  return *a2 == a1;
}

unint64_t sub_100010958(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t result = sub_10000D42C(*(void **)(*(void *)(a1 + 32) + 16), a3 + 2);
  unint64_t v6 = result;
  if (result >= 0x10000) {
    unint64_t result = _os_assumes_log();
  }
  uint64_t v7 = **(void ***)(a1 + 40);
  uint64_t v8 = *a3;
  v7[1] = *((unsigned __int16 *)v7 + 4) | (unint64_t)(*a3 << 16);
  *uint64_t v7 = a3[1];
  if (v6 >= 0x10000)
  {
    _os_assert_log();
    unint64_t result = _os_crash();
    __break(1u);
  }
  else
  {
    v7[1] = (v8 << 16) | (unsigned __int16)v6;
    **(void **)(a1 + 40) += 16;
  }
  return result;
}

void sub_100010A08(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  unint64_t v2 = *(void *)(a1 + 24);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  uint64_t v3 = *(unsigned int *)(a1 + 1128);
  *(_DWORD *)(a1 + 1128) = -1;
  if (mach_get_times()) {
    _os_assumes_log();
  }
  if (v3 != -1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000;
    v5[2] = sub_100012F54;
    void v5[3] = &unk_10002DD08;
    int v6 = v3;
    v5[4] = a1;
    v5[5] = v2;
    if (*(void *)(a1 + 8))
    {
      dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v5);
      dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 8) + 16), v4);
      _Block_release(v4);
    }
    else
    {
      sub_100010B40(a1, v3, v2);
    }
  }
}

void sub_100010B40(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 8);
  if (v6) {
    uint64_t v7 = (dispatch_queue_t *)(v6 + 16);
  }
  else {
    uint64_t v7 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v7);
  if (a2 >= 5) {
LABEL_95:
  }
    __break(0x5512u);
  uint64_t v8 = a1 + 48;
  uint64_t v9 = 33 * a2;
  if (__CFADD__(a1 + 48, 264 * a2)) {
    goto LABEL_94;
  }
  uint64_t v10 = v8 + 264 * a2;
  unsigned int v13 = *(_DWORD *)(v10 + 252);
  unint64_t v12 = (unsigned int *)(v10 + 252);
  size_t v11 = v13;
  if (!v13) {
    return;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (StatusReg >= 0xFFFFFFFFFFFFFFE8) {
    goto LABEL_94;
  }
  *(_DWORD *)(a1 + 1108) = *(_DWORD *)(StatusReg + 24) & 0xFFFFFFFC;
  __chkstk_darwin();
  uint64_t v15 = v89;
  memset(v89, 170, 0x10000uLL);
  uint64_t v16 = v8 + 264 * a2;
  size_t v18 = *(const uint8_t **)(v16 + 240);
  uint64_t v17 = (uint8_t **)(v16 + 240);
  int v94 = 256;
  size_t v19 = compression_encode_buffer(v89, 0x10000uLL, v18, v11, 0, COMPRESSION_LZ4);
  unint64_t v92 = a3;
  uint64_t v93 = a2;
  v91 = (int *)v12;
  if (v19)
  {
    size_t v20 = v19;
  }
  else
  {
    int v94 = 0;
    uint64_t v15 = *v17;
    size_t v20 = *v12;
  }
  size_t v21 = v20 + 16;
  unint64_t v22 = (v20 + 16) & 0xFFFFFFFFFFFFC000;
  uint64_t v23 = (v20 + 16) & 0x3FFF;
  *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v95 = v24;
  long long v96 = v24;
  if (!v22 || v23 == 0)
  {
    uint64_t v26 = _os_trace_malloc();
    uint64_t v27 = v26;
    if ((v20 & 7) != 0)
    {
      if ((v21 & 0x8000000000000000) != 0 || (v21 & 0xFFFFFFFFFFFFFFF8) > ~v26) {
        goto LABEL_94;
      }
      *(void *)(v26 + (v21 & 0xFFFFFFFFFFFFFFF8)) = 0;
    }
    *(void *)uint64_t v26 = 0x110000600DLL;
    *(void *)(v26 + 8) = v20;
    memcpy((void *)(v26 + 16), v15, v20);
    uint64_t v28 = 0;
    *(void *)&long long v95 = v27;
    uint64_t v29 = (v20 & 0xFFFFFFFFFFFFFFF8) + 24;
    if ((v20 & 7) == 0) {
      uint64_t v29 = v20 + 16;
    }
    unsigned int v30 = 1;
  }
  else
  {
    uint64_t v90 = v9;
    uint64_t v31 = (void *)_os_trace_malloc();
    *uint64_t v31 = 0x110000600DLL;
    v31[1] = v20;
    size_t v32 = v21 & 0x3FF8;
    uint64_t v33 = _os_trace_malloc();
    int v34 = (void *)v33;
    if ((v20 & 7) != 0)
    {
      if (__CFADD__(v33, v32)) {
        goto LABEL_94;
      }
      *(void *)(v33 + ((v20 + 16) & 0x3FF8)) = 0;
    }
    memcpy(v31 + 2, v15, v22 - 16);
    if (__CFADD__(v15, v22 - 16)) {
      goto LABEL_94;
    }
    memcpy(v34, &v15[v22 - 16], v20 - (v22 - 16));
    *(void *)&long long v95 = v31;
    *((void *)&v95 + 1) = (v20 + 16) & 0xFFFFFFFFFFFFC000;
    if ((unint64_t)&v95 > 0xFFFFFFFFFFFFFFEFLL) {
      goto LABEL_94;
    }
    *(void *)&long long v96 = v34;
    uint64_t v29 = (v20 & 7) != 0 ? v23 - (v20 & 7) + 8 : (v20 + 16) & 0x3FFF;
    unsigned int v30 = 2;
    uint64_t v28 = 1;
    uint64_t v9 = v90;
  }
  uint64_t v35 = (void *)(v8 + 8 * v9);
  *((void *)&v95 + 2 * v28 + 1) = v29;
  uint64_t v36 = *(void *)(a1 + 8);
  if (v36) {
    size_t v37 = (dispatch_queue_t *)(v36 + 16);
  }
  else {
    size_t v37 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v37);
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = v30;
  do
  {
    v39 += *(void *)((char *)&v95 + v38 + 8);
    v38 += 16;
  }
  while (16 * v30 != v38);
  uint64_t v41 = *(void *)(a1 + 8);
  if (v41) {
    unint64_t v42 = (dispatch_queue_t *)(v41 + 16);
  }
  else {
    unint64_t v42 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v42);
  uint64_t v43 = *(int *)(a1 + 1168);
  unint64_t v44 = *(void *)(a1 + 1136);
  uint64_t v45 = 280 * (int)v43;
  BOOL v46 = __CFADD__(v45, v44);
  unint64_t v47 = v45 + v44;
  char v48 = v46;
  BOOL v49 = v47 >= v44;
  if (v43 < 0) {
    BOOL v49 = v48;
  }
  if (!v49) {
    goto LABEL_94;
  }
  if ((unint64_t)(*(void *)(v44 + 280 * (int)v43 + 232) + v39) > *(void *)(v44 + 280 * (int)v43 + 240)) {
    goto LABEL_50;
  }
  int v50 = *(_DWORD *)(v44 + 280 * (int)v43 + 268);
  BOOL v51 = __OFADD__(v50, v40);
  int v52 = v50 + v40;
  if (v51)
  {
    __break(0x5500u);
    return;
  }
  if (v52 <= *(_DWORD *)(v44 + 280 * (int)v43 + 264)
    && (unint64_t)sub_100011194(*(void **)(v44 + 280 * (int)v43 + 224)) < 0x8000)
  {
    uint64_t v59 = (void *)(v44 + 280 * (int)v43);
  }
  else
  {
LABEL_50:
    sub_10001168C(a1);
    unint64_t v54 = *(void *)(a1 + 1136);
    uint64_t v55 = 280 * v53;
    BOOL v46 = __CFADD__(v55, v54);
    unint64_t v56 = v55 + v54;
    int v57 = v46;
    BOOL v58 = v56 >= v54;
    if (v53 < 0) {
      BOOL v58 = v57;
    }
    if (!v58) {
      goto LABEL_94;
    }
    uint64_t v59 = (void *)(v54 + 280 * v53);
    LODWORD(v43) = v53;
  }
  if (!v59[29]) {
    memcpy(v59, v35, v35[1] + 16);
  }
  unint64_t v60 = *(void *)(a1 + 1136);
  uint64_t v61 = 280 * (int)v43;
  BOOL v62 = __CFADD__(v61, v60);
  BOOL v63 = v61 + v60 >= v60;
  if ((int)v43 < 0) {
    BOOL v63 = v62;
  }
  if (!v63) {
    goto LABEL_94;
  }
  uint64_t v64 = 0;
  uint64_t v65 = v60 + 280 * (int)v43;
  uint64_t v66 = 16 * v40;
  do
  {
    sub_1000110B0(v65, *(void *)((char *)&v95 + v64), *(void *)((char *)&v95 + v64 + 8), *(_DWORD *)(v65 + 268));
    v64 += 16;
  }
  while (v66 != v64);
  unint64_t v67 = *(void *)(a1 + 1136);
  BOOL v68 = __CFADD__(v61, v67);
  BOOL v69 = v61 + v67 >= v67;
  if ((int)v43 < 0) {
    BOOL v69 = v68;
  }
  unint64_t v71 = v92;
  unsigned int v70 = v93;
  if (!v69) {
    goto LABEL_94;
  }
  uint64_t v72 = *(void **)(v67 + 280 * (int)v43 + 224);
  sub_100011384((uint64_t)v72, (uint64_t)v35);
  uint64_t v73 = *(int *)(a1 + 1168);
  unint64_t v74 = *(void *)(a1 + 1136);
  uint64_t v75 = 280 * (int)v73;
  BOOL v46 = __CFADD__(v75, v74);
  unint64_t v76 = v75 + v74;
  char v77 = v46;
  BOOL v78 = v76 >= v74;
  if (v73 < 0) {
    BOOL v78 = v77;
  }
  if (!v78)
  {
LABEL_94:
    __break(0x5513u);
    goto LABEL_95;
  }
  if (v72[10]) {
    unint64_t v79 = **(void ***)(v72[9] + 8);
  }
  else {
    unint64_t v79 = sub_10000EC9C((uint64_t)v72);
  }
  unint64_t v81 = v79[2];
  unint64_t v80 = v79[3];
  unint64_t v82 = v74 + 280 * (int)v73;
  unint64_t v84 = *(void *)(v82 + 248);
  uint64_t v83 = (unint64_t *)(v82 + 248);
  if (v81 < v84) {
    *uint64_t v83 = v81;
  }
  unint64_t v85 = v74 + 280 * (int)v73;
  if (v80 > *(void *)(v85 + 256)) {
    *(void *)(v85 + 256) = v80;
  }
  int v86 = *v91;
  if (v72[10]) {
    unint64_t v87 = **(void ***)(v72[9] + 8);
  }
  else {
    unint64_t v87 = sub_10000EC9C((uint64_t)v72);
  }
  int v88 = v94;
  *((_DWORD *)v87 + 8) = v86;
  *((_DWORD *)v87 + 9) = v88;
  if (v72[1] > v71) {
    v72[1] = v71;
  }
  sub_1000114FC(a1, v70);
  sub_10000EC9C((uint64_t)v72);
}

void sub_1000110B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (*(_DWORD *)(a1 + 264) <= a4)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_19:
    __break(0x5513u);
    goto LABEL_20;
  }
  unint64_t v6 = *(void *)(a1 + 272);
  BOOL v7 = __CFADD__(v6, 16 * a4);
  BOOL v8 = v6 + 16 * a4 >= v6;
  if (a4 < 0) {
    BOOL v8 = v7;
  }
  if (!v8) {
    goto LABEL_19;
  }
  unint64_t v11 = v6 + 16 * a4;
  free(*(void **)v11);
  *(void *)unint64_t v11 = a2;
  *(void *)(v11 + 8) = a3;
  if (!a4) {
    return;
  }
  uint64_t v12 = 16 * a4;
  unint64_t v13 = *(void *)(a1 + 272);
  BOOL v14 = __CFADD__(v12, v13);
  unint64_t v15 = v12 + v13;
  BOOL v16 = v14;
  BOOL v17 = v15 >= v13;
  if (a4 < 0) {
    BOOL v17 = v16;
  }
  if (!v17) {
    goto LABEL_19;
  }
  *(void *)(a1 + 232) += *(void *)(v13 + 16 * a4 + 8);
  int v18 = *(_DWORD *)(a1 + 268);
  BOOL v19 = __OFADD__(v18, 1);
  int v20 = v18 + 1;
  if (v19)
  {
LABEL_20:
    __break(0x5500u);
    return;
  }
  *(_DWORD *)(a1 + 268) = v20;
}

uint64_t sub_100011194(void *a1)
{
  unint64_t v1 = a1[2];
  if (v1) {
    unint64_t v1 = *(void *)(v1 + 24);
  }
  uint64_t v2 = 16 * v1 + 40;
  if (v1 >> 60 || 16 * v1 >= 0xFFFFFFFFFFFFFFD8)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v3 = a1[4];
  unint64_t v4 = (v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  BOOL v5 = __CFADD__(v2, v4);
  unint64_t v6 = v2 + v4;
  if (v5)
  {
LABEL_36:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_37;
  }
  unint64_t v7 = a1[6];
  if (v7 >> 60)
  {
LABEL_37:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_38;
  }
  unint64_t v8 = a1[7];
  if (!is_mul_ok(v8, 6uLL))
  {
LABEL_38:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_39:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v9 = a1[5];
  if (v9) {
    unint64_t v10 = *(void *)(v9 + 24);
  }
  else {
    unint64_t v10 = 0;
  }
  if (!is_mul_ok(v10, 0x38uLL)) {
    goto LABEL_39;
  }
  uint64_t v11 = 16 * v7;
  uint64_t v12 = 56 * v10;
  BOOL v5 = __CFADD__(v12, v11);
  uint64_t v13 = v12 + v11;
  if (v5)
  {
LABEL_40:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v14 = 6 * v8;
  BOOL v5 = __CFADD__(v13, v14);
  unint64_t v15 = v13 + v14;
  if (v5)
  {
LABEL_41:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_42:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_43:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_44;
  }
  if ((v15 & 6) != 0) {
    unint64_t v15 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  BOOL v5 = __CFADD__(v15, v6);
  unint64_t v16 = v15 + v6;
  if (v5) {
    goto LABEL_42;
  }
  if (v9) {
    uint64_t v9 = *(void *)(v9 + 24);
  }
  unint64_t v17 = 2 * v9 + 32;
  if (v9 < 0 || (unint64_t)(2 * v9) >= 0xFFFFFFFFFFFFFFE0) {
    goto LABEL_43;
  }
  uint64_t v18 = 2 * v9 + 40;
  if (v17 >= 0xFFFFFFFFFFFFFFF8)
  {
LABEL_44:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_45:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_46:
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
    return result;
  }
  BOOL v5 = __CFADD__(v18, 2 * v3);
  unint64_t v19 = v18 + 2 * v3;
  int v20 = v5;
  if (v3 < 0 || v20) {
    goto LABEL_45;
  }
  unint64_t v21 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v19 & 6) == 0) {
    unint64_t v21 = v19;
  }
  unint64_t v22 = a1[10];
  BOOL v23 = !is_mul_ok(v22, v21);
  unint64_t v24 = v22 * v21;
  uint64_t result = v16 + v24;
  BOOL v26 = __CFADD__(v16, v24);
  if (v23 || v26) {
    goto LABEL_46;
  }
  return result;
}

uint64_t sub_100011384(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = 0;
  uint64_t v5 = *(void *)(a2 + 240);
  unint64_t v6 = *(unsigned int *)(a2 + 252);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  unint64_t v15 = sub_10000D538;
  unint64_t v16 = &unk_10002DD28;
  uint64_t v17 = a2;
  uint64_t v18 = result;
  do
  {
    if (v6 - v4 < 0x10) {
      break;
    }
    unint64_t v7 = *(void *)(v5 + v4 + 8);
    if (v6 - v4 - 16 < v7) {
      break;
    }
    uint64_t result = ((uint64_t (*)(void *))v15)(v14);
    if (!result) {
      break;
    }
    unint64_t v4 = (v4 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v4 - 1 < v6);
  uint64_t v8 = *(void *)(a2 + 232);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  uint64_t v11 = sub_100011CE0;
  uint64_t v12 = &unk_10002DD68;
  uint64_t v13 = v3;
  if (v8)
  {
    for (unint64_t i = *(void **)(v8 + 16); i; unint64_t i = (void *)*i)
      uint64_t result = (uint64_t)v11((uint64_t)v10, i[4]);
  }
  return result;
}

void sub_1000114FC(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4) {
    uint64_t v5 = (dispatch_queue_t *)(v4 + 16);
  }
  else {
    uint64_t v5 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v5);
  if (a2 >= 5)
  {
LABEL_17:
    __break(0x5512u);
    goto LABEL_18;
  }
  if (__CFADD__(a1 + 48, 264 * a2))
  {
LABEL_18:
    __break(0x5513u);
    return;
  }
  uint64_t v6 = a1 + 48 + 264 * a2;
  sub_100011A0C(*(void **)(v6 + 224), (uint64_t (*)(void))&_os_release);
  sub_100011A0C(*(void **)(v6 + 232), (uint64_t (*)(void))sub_100011DF0);
  madvise(*(void **)(v6 + 240), *(unsigned int *)(v6 + 248), 7);
  *(_DWORD *)(v6 + 252) = 0;
  *(_DWORD *)(v6 + 256) = 0;
  *(void *)(v6 + 240) = 0;
  uint64_t v7 = *(void *)(a1 + 1104);
  do
  {
    uint64_t v8 = v7;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)(a1 + 1104), (unint64_t *)&v7, (1 << a2) | v7, memory_order_release, memory_order_relaxed);
  }
  while (v7 != v8);
  if ((v8 & 0x100000000) != 0)
  {
    while ((__ulock_wake() & 0x80000000) != 0)
    {
      int v9 = *__error();
      if (v9 != 4)
      {
        if (v9) {
          BOOL v10 = v9 == 2;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: ulock_wake() failed";
          qword_100031F78 = v9;
          __break(1u);
          goto LABEL_17;
        }
        return;
      }
    }
  }
}

uint64_t sub_10001163C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (char *)(a3 + 2);
  sub_10000EC08(*(void *)(a1 + 32), *(void *)(a1 + 40), *(_WORD *)a3, (char *)(a3 + 2));
  uint64_t v5 = *(void *)(a1 + 32);

  return sub_10000E1F8(v5, v4);
}

void sub_10001168C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    uint64_t v3 = (dispatch_queue_t *)(v2 + 16);
  }
  else {
    uint64_t v3 = (dispatch_queue_t *)a1;
  }
  dispatch_assert_queue_V2(*v3);
  uint64_t v4 = *(int *)(a1 + 1168);
  unint64_t v5 = *(void *)(a1 + 1136);
  uint64_t v6 = 280 * (int)v4;
  BOOL v7 = __CFADD__(v6, v5);
  unint64_t v8 = v6 + v5;
  char v9 = v7;
  BOOL v10 = v8 >= v5;
  if (v4 < 0) {
    BOOL v10 = v9;
  }
  if (!v10) {
    goto LABEL_33;
  }
  if (!*(void *)(v5 + 280 * (int)v4 + 232)) {
    return;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = (dispatch_queue_t *)(v11 ? v11 + 16 : a1);
  dispatch_assert_queue_V2(*v12);
  uint64_t v13 = *(int *)(a1 + 1168);
  int v14 = v13;
  unint64_t v15 = *(void *)(a1 + 1136);
  uint64_t v16 = 280 * (int)v13;
  BOOL v7 = __CFADD__(v16, v15);
  unint64_t v17 = v16 + v15;
  BOOL v18 = v7;
  BOOL v19 = v17 >= v15;
  if (!(v13 >= 0 ? v19 : v18)) {
    goto LABEL_33;
  }
  uint64_t v21 = v15 + 280 * v14;
  sub_1000129D4(v21);
  unint64_t v22 = *(void (***)(uint64_t, uint64_t))(a1 + 8);
  if (v22)
  {
    (*v22)(a1, v21);
  }
  else
  {
    if (__OFADD__(v14, 1))
    {
LABEL_35:
      __break(0x5500u);
LABEL_36:
      __break(0x5503u);
      return;
    }
    int v23 = *(_DWORD *)(a1 + 1172);
    if (v14 == 0x7FFFFFFF && v23 == -1) {
      goto LABEL_36;
    }
    int v14 = (v14 + 1) % v23;
    *(_DWORD *)(a1 + 1168) = v14;
    if (!v14) {
      sub_100005704(a1, 0);
    }
  }
  sub_100011818(a1, v14);
  uint64_t v24 = *(void *)(a1 + 1136);
  unint64_t v25 = 280 * v14;
  if ((v14 & 0x80000000) == 0)
  {
    if (v25 <= ~v24) {
      goto LABEL_30;
    }
LABEL_33:
    __break(0x5513u);
    goto LABEL_34;
  }
  if (v25 <= ~v24) {
    goto LABEL_33;
  }
LABEL_30:
  if (*(void *)(v24 + 280 * v14 + 232))
  {
LABEL_34:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_35;
  }
}

void sub_100011818(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 1136);
  uint64_t v3 = 280 * a2;
  BOOL v4 = __CFADD__(v3, v2);
  unint64_t v5 = v3 + v2;
  int v6 = v4;
  BOOL v7 = v5 >= v2;
  if (a2 < 0) {
    BOOL v7 = v6;
  }
  if (!v7)
  {
LABEL_19:
    __break(0x5513u);
    return;
  }
  BOOL v10 = (int *)(v2 + 280 * a2 + 268);
  if (*v10 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = (void *)(v2 + 280 * a2 + 272);
    uint64_t v14 = *v13;
    while (!__CFADD__(v14, v11))
    {
      free(*(void **)(v14 + v11));
      uint64_t v14 = *v13;
      if (__CFADD__(*v13, v11)) {
        break;
      }
      unint64_t v15 = (void *)(v14 + v11);
      ++v12;
      *unint64_t v15 = 0;
      v15[1] = 0;
      v11 += 16;
      if (v12 >= *v10) {
        goto LABEL_12;
      }
    }
    goto LABEL_19;
  }
LABEL_12:
  unint64_t v16 = v2 + 280 * a2;
  *(void *)(v16 + 232) = 0;
  *BOOL v10 = 1;
  *(_OWORD *)(v16 + 248) = xmmword_100027C80;
  if (!*(unsigned char *)(a1 + 1240))
  {
    if (qword_10003E8C8 != -1) {
      dispatch_once(&qword_10003E8C8, &stru_10002D810);
    }
    dispatch_async((dispatch_queue_t)qword_10003E8D0, &stru_10002D750);
  }
  uint64_t v17 = *(void *)(v2 + 280 * a2 + 224);

  sub_10001196C(v17);
}

void sub_10001196C(uint64_t a1)
{
  sub_100011BC4(*(void **)(a1 + 16));
  sub_100011C34(*(void *)(a1 + 24));
  *(void *)(a1 + 32) = 0;
  sub_100011A0C(*(void **)(a1 + 40), (uint64_t (*)(void))sub_100011AA4);
  unint64_t v2 = *(unsigned int ***)(a1 + 64);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  if (v2)
  {
    do
    {
      uint64_t v3 = *v2;
      sub_100011B00(v2[6], 0);
      sub_100011B00(v2[5], 0);
      free(v2);
      unint64_t v2 = (unsigned int **)v3;
    }
    while (v3);
  }
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 8) = -1;
}

void *sub_100011A0C(void *result, uint64_t (*a2)(void))
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      for (unint64_t i = (void *)result[2]; i; unint64_t i = (void *)*i)
        uint64_t result = (void *)a2(i[4]);
    }
    if (v3[3])
    {
      uint64_t result = (void *)v3[2];
      if (result)
      {
        do
        {
          unint64_t v5 = (void *)*result;
          operator delete(result);
          uint64_t result = v5;
        }
        while (v5);
      }
      v3[2] = 0;
      uint64_t v6 = v3[1];
      if (v6)
      {
        for (uint64_t j = 0; j != v6; ++j)
          *(void *)(*v3 + 8 * j) = 0;
      }
      v3[3] = 0;
    }
  }
  return result;
}

void sub_100011AA4(unsigned int **a1)
{
  sub_100011B00(a1[7], (void (*)(void))&_free);
  sub_100011B00(a1[8], (void (*)(void))&_free);

  free(a1);
}

void sub_100011B00(unsigned int *a1, void (*a2)(void))
{
  if (*((void *)a1 + 2))
  {
    unint64_t v3 = *a1;
    if (v3)
    {
      for (unint64_t i = 0; i < v3; ++i)
      {
        uint64_t v6 = *(void **)(*((void *)a1 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            BOOL v7 = (void *)*v6;
            if (a2) {
              a2(v6[2]);
            }
            free(v6);
            --a1[1];
            uint64_t v6 = v7;
          }
          while (v7);
          unint64_t v3 = *a1;
        }
      }
    }
    if (a1[1])
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
      return;
    }
    free(*((void **)a1 + 2));
  }

  free(a1);
}

void *sub_100011BC4(void *result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result[3])
    {
      uint64_t result = (void *)result[2];
      if (result)
      {
        do
        {
          unint64_t v2 = (void *)*result;
          operator delete(result);
          uint64_t result = v2;
        }
        while (v2);
      }
      v1[2] = 0;
      uint64_t v3 = v1[1];
      if (v3)
      {
        for (uint64_t i = 0; i != v3; ++i)
          *(void *)(*v1 + 8 * i) = 0;
      }
      v1[3] = 0;
    }
  }
  return result;
}

void sub_100011C34(uint64_t a1)
{
  if (a1 && *(void *)(a1 + 24))
  {
    sub_100011C94(*(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void sub_100011C94(void **__p)
{
  if (__p)
  {
    unint64_t v1 = __p;
    do
    {
      uint64_t v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0) {
        operator delete(v1[2]);
      }
      operator delete(v1);
      unint64_t v1 = v2;
    }
    while (v2);
  }
}

unsigned int *sub_100011CE0(uint64_t a1, uint64_t a2)
{
  v9[0] = 0;
  v9[1] = *(unsigned __int8 *)(a2 + 72);
  int v10 = *(_DWORD *)(a2 + 20);
  uint64_t v11 = *(void *)(a2 + 32);
  int v4 = *(_DWORD *)(a2 + 4);
  int v12 = *(_DWORD *)(a2 + 28);
  int v13 = v4;
  long long v14 = *(_OWORD *)(a2 + 40);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  long long v15 = *(_OWORD *)(a2 + 56);
  uint64_t v5 = sub_10000F3FC(*(void *)(a1 + 32), (uint64_t)v9);
  sub_10000F988(*(void *)(a1 + 32), v5);
  uint64_t v6 = *(unsigned int **)(a2 + 80);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_10001163C;
  v8[3] = &unk_10002DD48;
  v8[4] = *(void *)(a1 + 32);
  v8[5] = v5;
  return sub_10000D2BC(v6, (uint64_t)v8);
}

void sub_100011DF0(unsigned int **a1)
{
  sub_100011B00(a1[10], (void (*)(void))&_free);

  free(a1);
}

void sub_100011E3C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    sub_1000240CC();
  }
  uint64_t v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  unint64_t v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    long long v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *unint64_t v8 = *v14;
          *long long v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          long long v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        unint64_t v8 = v14;
        long long v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_100012038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (os_unfair_lock_s *)(a1 + 124);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 124));
  if (a3)
  {
    if ((*(unsigned int (**)(uint64_t))(a3 + 16))(a3))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      unint64_t v9 = *(void *)(v8 + 456);
      if (v9)
      {
        do
        {
          while (1)
          {
            unint64_t v10 = __clz(__rbit64(v9));
            unint64_t v11 = (unsigned __int16 *)(v8 + (v10 << 12));
            v9 &= ~(1 << v10);
            if (*v11 >= 0x11u && v11[19] && *((unsigned char *)v11 + 6) == 3) {
              break;
            }
            if (!v9) {
              goto LABEL_14;
            }
          }
          if ((*(unsigned int (**)(uint64_t))(a4 + 16))(a4)) {
            BOOL v12 = v9 == 0;
          }
          else {
            BOOL v12 = 1;
          }
        }
        while (!v12);
      }
    }
  }
LABEL_14:

  os_unfair_lock_unlock(v7);
}

uint64_t sub_100012110()
{
  return 1;
}

void sub_100012130(uint64_t a1, NSObject *a2, NSObject **a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  uint64_t v6 = *(void *)(a1 + 8);
  sub_100010A08(a1);
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(v6 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100012F6C;
    block[3] = &unk_10002DAB8;
    void block[4] = a1;
    dispatch_group_async(a2, v7, block);
  }
  else
  {
    uint64_t v8 = *a3;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    _WORD v9[2] = sub_10001331C;
    v9[3] = &unk_10002DAF8;
    v9[4] = a3;
    v9[5] = a1;
    dispatch_sync(v8, v9);
  }
}

BOOL sub_10001225C(id a1)
{
  return 1;
}

uint64_t sub_100012264(unsigned __int8 *a1, unsigned int a2, char *__str)
{
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  uint64_t result = snprintf(__str, 0x400uLL, "%s/", (const char *)qword_10003E9A8);
  uint64_t v7 = &__str[(int)result];
  size_t v8 = 1024 - (int)result;
  if (a2 - 1 >= 2)
  {
    if (a2 != 3)
    {
LABEL_12:
      qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
      qword_100031F78 = a2;
      __break(1u);
      return result;
    }
    uint64_t result = snprintf(v7, v8, "dsc");
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = snprintf(v7, v8, "%02X", *a1);
    uint64_t v9 = 1;
  }
  uint64_t v10 = (int)result + 1;
  if (v10 + 2 * (16 - v9) >= v8)
  {
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_100031F78 = v8;
    __break(1u);
    goto LABEL_12;
  }
  v7[(int)result] = 47;
  unint64_t v11 = &v7[v10];
  do
  {
    *unint64_t v11 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
    v11[1] = a0123456789abcd[a1[v9] & 0xF];
    v11 += 2;
    ++v9;
  }
  while (v9 != 16);
  *unint64_t v11 = 0;
  return result;
}

uint64_t sub_1000123F4(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = (void **)result;
    uint64_t v2 = *(void **)(result + 16);
    if (v2)
    {
      do
      {
        uint64_t v3 = (void *)*v2;
        operator delete(v2);
        uint64_t v2 = v3;
      }
      while (v3);
    }
    int8x8_t v4 = *v1;
    *unint64_t v1 = 0;
    if (v4) {
      operator delete(v4);
    }
    operator delete();
  }
  return result;
}

uint64_t sub_1000124B0(uint64_t a1)
{
  vm_deallocate(mach_task_self_, *(void *)(a1 + 48), 0x40000uLL);
  *(void *)(a1 + 48) = 0;
  uint64_t v2 = (uint64_t (*)(void))*((void *)off_1000302A0 + 2);

  return v2();
}

void sub_10001251C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10001252C(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    __break(0x5512u);
  }
  else if (1248 * (unint64_t)a2 <= ~(unint64_t)&qword_100030398)
  {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100012574(uint64_t result)
{
  *(unsigned char *)(result + 143) = 1;
  return result;
}

uint64_t sub_100012580(uint64_t result)
{
  return result;
}

void sub_10001258C(_OWORD *a1)
{
  *(_OWORD *)uint64_t v3 = *a1;
  if (!sub_100012644(v3))
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 0x40000000;
    v1[2] = sub_100018714;
    v1[3] = &unk_10002D898;
    long long v2 = *(_OWORD *)v3;
    dispatch_async((dispatch_queue_t)qword_10003E8E8, v1);
  }
}

BOOL sub_100012644(unsigned __int8 *a1)
{
  if (qword_10003E9D8 != -1) {
    dispatch_once(&qword_10003E9D8, &stru_10002EA78);
  }
  if (!byte_10003E9E0) {
    return 0;
  }
  memset(__b, 170, sizeof(__b));
  sub_100012264(a1, 3u, __b);
  return access(__b, 0) == 0;
}

uint64_t sub_100012708(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);
  uint64_t v5 = _os_trace_calloc();
  *(_DWORD *)(v5 + 132) = 0;
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = v5 + 16;
  *(void *)(v5 + 64) = a1;
  memcpy((void *)(v5 + 138), __s, v4);
  *(void *)(v5 + 88) = 0;
  unint64_t v6 = v5 + 88;
  if ((unint64_t)(v5 + 88) >= 0xFFFFFFFFFFFFFFF8
    || (*(void *)(v5 + 96) = 0, v6 >= 0xFFFFFFFFFFFFFFF0)
    || (*(void *)(v5 + 104) = 0, v6 >= 0xFFFFFFFFFFFFFFE8)
    || (*(void *)(v5 + 112) = 0, v6 >= 0xFFFFFFFFFFFFFFE0))
  {
    __break(0x5513u);
  }
  *(void *)(v5 + 120) = 0;
  return v5;
}

uint64_t sub_100012830(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v8 = a2;
  NDR_record_t v7 = NDR_record;
  uint64_t v9 = a3;
  uint64_t v10 = a4;
  int v11 = a5;
  *(void *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 11701;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  return mach_msg(&msg, 1, 0x38u, 0, 0, 0, 0);
}

void sub_1000128A4(uint64_t a1)
{
  sub_10001168C(*(void *)(a1 + 32));
  if (__OFADD__(v2, 1)) {
    goto LABEL_25;
  }
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 1172);
  if (v2 == 0x7FFFFFFF && v3 == -1) {
    goto LABEL_26;
  }
  int v5 = (v2 + 1) % (int)v3;
  if ((v3 & 0x80000000) == 0)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 280 * v5;
    do
    {
      unint64_t v8 = *(void *)(*(void *)(a1 + 32) + 1136);
      BOOL v9 = __CFADD__(v7, v8);
      BOOL v10 = v7 + v8 >= v8;
      if (v6 < 0) {
        BOOL v10 = v9;
      }
      if (!v10) {
        goto LABEL_24;
      }
      if (*(void *)(v8 + v7 + 232))
      {
        sub_1000129D4(v8 + v7);
        (**(void (***)(void))(*(void *)(a1 + 40) + 8))();
      }
      ++v6;
      v7 += 280;
    }
    while (v6 < v3);
  }
  if (v5 >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 280 * v5;
    while (1)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 1136);
      if (__CFADD__(v13, v11)) {
        break;
      }
      if (*(void *)(v13 + v11 + 232))
      {
        sub_1000129D4(v13 + v11);
        (**(void (***)(void))(*(void *)(a1 + 40) + 8))();
      }
      v11 += 280;
      if (v12 == v11) {
        return;
      }
    }
LABEL_24:
    __break(0x5513u);
LABEL_25:
    __break(0x5500u);
LABEL_26:
    __break(0x5503u);
  }
}

void sub_1000129D4(uint64_t a1)
{
  int v2 = sub_10000CBDC(*(void ***)(a1 + 224));
  if (v2)
  {
    uint64_t v3 = v2[1];
    if ((v3 & 7) != 0) {
      uint64_t v4 = (v3 & 0xFFFFFFFFFFFFFFF8) + 24;
    }
    else {
      uint64_t v4 = v3 + 16;
    }
    sub_1000110B0(a1, (uint64_t)v2, v4, 0);
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

void sub_100012A40(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!*(unsigned char *)(v3 + 88))
  {
    uint64_t v5 = *(void *)(v3 + 48);
    if (v5)
    {
      uint64_t v6 = *(void *)(v3 + 40);
      uint64_t v7 = a2[29];
      BOOL v8 = __OFADD__(v6, v7);
      uint64_t v9 = v6 + v7;
      if (v8) {
        goto LABEL_39;
      }
      if (v9 > v5)
      {
        sub_100002EBC(*(void *)(a1 + 8));
        sub_100005704(v2, v3);
      }
    }
    unint64_t v10 = a2[31];
    if (v10 < *(void *)(v3 + 72)) {
      *(void *)(v3 + 72) = v10;
    }
    unint64_t v11 = a2[32];
    if (v11 > *(void *)(v3 + 80)) {
      *(void *)(v3 + 80) = v11;
    }
    if (*(_DWORD *)(v3 + 68) != -1)
    {
LABEL_13:
      if (*(void *)(v3 + 40)) {
        goto LABEL_17;
      }
      a1 = _os_trace_write();
      if (a1 == -1) {
        goto LABEL_35;
      }
      uint64_t v12 = *(void *)(v3 + 40);
      BOOL v8 = __OFADD__(v12, a1);
      uint64_t v13 = v12 + a1;
      if (!v8)
      {
        *(void *)(v3 + 40) = v13;
LABEL_17:
        a1 = _os_trace_writev();
        if (a1 != -1)
        {
          uint64_t v14 = *(void *)(v3 + 40);
          BOOL v8 = __OFADD__(v14, a1);
          uint64_t v15 = v14 + a1;
          if (!v8)
          {
            *(void *)(v3 + 40) = v15;
            sub_100012D80(v3);
            return;
          }
          goto LABEL_39;
        }
LABEL_35:
        __error();
        _os_assumes_log();
        return;
      }
LABEL_39:
      __break(0x5500u);
      goto LABEL_40;
    }
    uint64_t v16 = *(void *)(v3 + 96);
    if (*(_DWORD *)(v3 + 64) > *(_DWORD *)(v3 + 92) || *(void *)(v3 + 56) > v16)
    {
      int v17 = openat(dword_100031BF8, *(const char **)(v3 + 8), 1048832);
      if (v17 == -1)
      {
        __error();
      }
      else
      {
        int v18 = v17;
        if (v17 < 0) {
          goto LABEL_27;
        }
        sub_100019E88(v3, 0, 0x7FFFFFFFFFFFFFFFLL, v16, v17);
        if (close(v18) != -1) {
          goto LABEL_27;
        }
        int v23 = *__error();
        a1 = *__error();
        if (v23 == 9)
        {
LABEL_40:
          qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_100031F78 = a1;
          __break(1u);
          return;
        }
      }
      _os_assumes_log();
    }
LABEL_27:
    memset(__b, 170, sizeof(__b));
    while (1)
    {
      uint64_t v19 = *(void *)(v3 + 24);
      *(void *)(v3 + 24) = v19 + 1;
      snprintf(__b, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v3 + 8), v19);
      int v20 = sub_100002D74(dword_100031BF8, __b, 2569);
      *(_DWORD *)(v3 + 68) = v20;
      if (v20 != -1) {
        goto LABEL_13;
      }
      __error();
      _os_assumes_log();
      int v21 = *__error();
      if (v21 != 4 && v21 != 17)
      {
        if (v21) {
          return;
        }
        goto LABEL_13;
      }
    }
  }
  if (*(_DWORD *)(v3 + 68) == -1)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "%s: writes blocked (and dropped) for %s/%016llx.tracev3", "_logd_book_persist_handler", *(const char **)(v3 + 8), *(void *)(v3 + 24));
    sub_100016E68((uint64_t)__b);
  }
  else
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "%s: writes blocked (and dropped), %s/%016llx.tracev3 unexpectedly already open", "_logd_book_persist_handler", *(const char **)(v3 + 8), *(void *)(v3 + 24) - 1);
    sub_100016E68((uint64_t)__b);
    sub_100002EBC(v3);
    sub_100005704(v2, v3);
  }
}

uint64_t sub_100012D80(uint64_t a1)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, (unsigned __int8 *)&v5);
  int v3 = *(_DWORD *)(a1 + 68);
  *(void *)&v7[12] = 0xAAAAAAAAAAAAAAAALL;
  int value = 1;
  long long v8 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v7 = v5;
  uint64_t result = fsetxattr(v3, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0);
  if (result == -1)
  {
    __error();
    return _os_assumes_log();
  }
  return result;
}

uint64_t sub_100012E3C(uint64_t a1)
{
  return sub_10000FB38(*(dispatch_queue_t **)(a1 + 32), *(char **)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56));
}

_DWORD *sub_100012E4C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(void *)(a2 + 32) = 0x13000000000000;
  uint64_t result = (_DWORD *)sub_100012EEC(result[3], (_DWORD *)(a2 + 28), (void *)(a2 + 48));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(NDR_record_t *)(a2 + 40) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100012EEC(uint64_t a1, _DWORD *a2, void *a3)
{
  *a2 = dword_1000302BC;
  *a3 = qword_1000302C0;
  return 0;
}

uint64_t sub_100012F0C(uint64_t a1)
{
  return sub_10000FB38(*(dispatch_queue_t **)(a1 + 32), *(char **)(a1 + 40), *(void *)(a1 + 48), *(void **)(a1 + 56));
}

uint64_t sub_100012F1C(int a1, uint64_t a2, char *__s2)
{
  return strcmp((const char *)(a2 + 32), __s2);
}

uint64_t sub_100012F28(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)a2 + 24);
  unint64_t v3 = *(void *)(*(void *)a1 + 24);
  BOOL v4 = v2 > v3;
  if (v2 == v3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return 1;
  }
  else {
    return v5;
  }
}

uint64_t sub_100012F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcmp((const char *)(a2 + 32), (const char *)(a3 + 32));
}

void sub_100012F54(uint64_t a1)
{
}

void sub_100012F6C(uint64_t a1)
{
}

void *sub_100012F78(void **a1)
{
  uint64_t result = sub_100011BC4(a1);
  if (a1)
  {
    unint64_t v3 = a1[2];
    if (v3)
    {
      do
      {
        BOOL v4 = (void *)*v3;
        operator delete(v3);
        unint64_t v3 = v4;
      }
      while (v4);
    }
    unsigned int v5 = *a1;
    *a1 = 0;
    if (v5) {
      operator delete(v5);
    }
    operator delete();
  }
  return result;
}

BOOL sub_100012FF8()
{
  if (byte_10003E9C1) {
    return 1;
  }
  if (qword_10003E9B8 != -1) {
    dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
  }
  if (byte_10003E9C0) {
    BOOL result = MKBDeviceUnlockedSinceBoot() == 1;
  }
  else {
    BOOL result = 1;
  }
  byte_10003E9C1 = result;
  return result;
}

void sub_100013074()
{
  os_unfair_lock_lock_with_options();
  sub_100006444();
  dword_100030348 = sub_100006488(dword_100030348, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000);

  os_unfair_lock_unlock(&stru_100031FA0);
}

void sub_1000130EC()
{
  os_unfair_lock_lock_with_options();
  sub_100002E78();
  dword_10003034C = sub_100006488(dword_10003034C, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880);

  os_unfair_lock_unlock(&stru_100031FA0);
}

void sub_100013170(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100002F84((_xpc_connection_s *)a2);
  }
  else
  {
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_100031F78 = (uint64_t)type;
    __break(1u);
  }
}

void sub_1000131E4(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 32) + 16))();
  sub_1000038B0(*(void *)(a1 + 32), 1u);
  unint64_t v2 = off_1000302B0;
  if (off_1000302B0)
  {
    sub_100003C94((unint64_t)v2);
  }
}

void sub_10001325C(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 32) + 16))();
  sub_1000038B0(*(void *)(a1 + 32), 0);
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000131E4;
  block[3] = &unk_10002CE08;
  void block[4] = v2;
  dispatch_group_async(v3, (dispatch_queue_t)qword_100030288, block);
}

void sub_10001331C(int8x16_t *a1)
{
  sub_100010A08(a1[2].i64[0]);
  block[0] = _NSConcreteStackBlock;
  int8x16_t v2 = vextq_s8(a1[2], a1[2], 8uLL);
  unint64_t v3 = *(NSObject **)(*(void *)(a1[2].i64[0] + 8) + 16);
  block[1] = 0x40000000;
  block[2] = sub_1000128A4;
  block[3] = &unk_10002DAD8;
  int8x16_t v5 = v2;
  dispatch_sync(v3, block);
}

void sub_1000133DC(void *a1)
{
  sub_100010A08(a1[5]);
  uint64_t v2 = a1[6];
  if (v2)
  {
    unint64_t v3 = *(NSObject **)(v2 + 16);
    BOOL v4 = (void *)a1[4];
    dispatch_async(v3, v4);
  }
}

void sub_100013430(uint64_t a1)
{
}

uint64_t sub_100013460(uint64_t result)
{
  *(unsigned char *)(result + 147) = 1;
  return result;
}

void sub_10001346C(int a1, const void *a2)
{
  BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(v4);
  qword_100030280 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.snapshot-gate", v4, 0);
  qword_100030290 = (uint64_t)dispatch_workloop_create_inactive("com.apple.firehose.io-wl");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_100030290);
  qword_100030288 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.drain-io", v4, (dispatch_queue_t)qword_100030290);
  qword_100030298 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.drain-mem", initially_inactive, 0);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_100030298);
  uint64_t f = dispatch_mach_create_f();
  dword_100030270[0] = a1;
  qword_100030278 = f;
  off_1000302A0 = _Block_copy(a2);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    int v8 = open_NOCANCEL();
    if ((v8 & 0x80000000) == 0) {
      break;
    }
    int v9 = **(_DWORD **)(StatusReg + 8);
    if (v9 != 4)
    {
      if (v9 != 2) {
        sub_100025B04(v9);
      }
      goto LABEL_12;
    }
  }
  int v10 = v8;
  unint64_t v11 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (ioctl(v10, 0x4010744FuLL, &v20) < 0)
  {
    int v12 = **(_DWORD **)(v11 + 8);
    if (v12 != 4) {
      sub_100025B2C(v12);
    }
  }
  if ((unint64_t)(v21 - 262145) <= 0xFFFFFFFFFFFCFFFELL) {
    sub_100025B54(v21);
  }
  uint64_t v13 = v20;
  uint64_t v14 = _os_object_alloc_realized();
  *(void *)(v14 + 48) = v13;
  *(void *)(v14 + 64) = *(void *)(v13 + 464);
  *(void *)(v14 + 56) = *(void *)(v14 + 64);
  *(void *)(v14 + 80) = *(void *)(v13 + 488);
  *(void *)(v14 + 72) = *(void *)(v14 + 80);
  uint64_t v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v10, 0, (dispatch_queue_t)qword_100030298);
  dispatch_set_qos_class_floor(v15, QOS_CLASS_USER_INITIATED, 0);
  dispatch_set_context(v15, (void *)v14);
  dispatch_source_set_event_handler_f(v15, (dispatch_function_t)sub_100003C94);
  *(void *)(v14 + 96) = v15;
  *(_DWORD *)(v14 + 120) = -1;
  dword_1000302B8 = v10;
  off_1000302B0 = (_UNKNOWN *)v14;
LABEL_12:
  uint64_t v16 = 0;
  int v17 = (char *)&unk_1000302E8;
  do
  {
    int v18 = &qword_100030288;
    if ((v16 & 1) == 0) {
      int v18 = &qword_100030298;
    }
    uint64_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, (dispatch_queue_t)*v18);
    dispatch_set_context(v19, v17);
    dispatch_source_set_event_handler_f(v19, (dispatch_function_t)sub_10000A1B4);
    *(void *)&dword_100030270[2 * v16++ + 46] = v19;
    v17 += 16;
  }
  while (v16 != 4);
}

uint64_t sub_100013730(unsigned int a1)
{
  if (a1 != 20180226) {
    sub_100025BA4(a1);
  }
  uint64_t result = _firehose_spi_version;
  if (_firehose_spi_version != 20180226) {
    sub_100025B7C(_firehose_spi_version);
  }
  return result;
}

BOOL sub_100013770()
{
  return !off_1000302B0 || *((void *)off_1000302B0 + 10) != 0;
}

void sub_100013794()
{
  if (off_1000302B0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100013850;
    block[3] = &unk_10002CD98;
    void block[4] = dword_100030270;
    dispatch_async((dispatch_queue_t)qword_100030298, block);
  }
  dispatch_mach_connect();
  for (uint64_t i = 0; i != 8; i += 2)
    dispatch_activate(*(dispatch_object_t *)&dword_100030270[i + 46]);
}

void sub_100013850(uint64_t a1)
{
  long long v3 = xmmword_100027B60;
  uint64_t v4 = 0;
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 64);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100030298);
  os_unfair_lock_lock_with_options();
  *(void *)(v1 + 16) = 0;
  uint64_t v2 = off_1000302D8;
  *(void *)(v1 + 24) = off_1000302D8;
  *uint64_t v2 = v1;
  off_1000302D8 = (_UNKNOWN **)(v1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000302E0);
  (*((void (**)(void *, uint64_t, uint64_t, long long *, void))off_1000302A0 + 2))(off_1000302A0, v1, 1, &v3, 0);
  if (*(_DWORD *)(v1 + 128))
  {
    dispatch_mach_connect();
    dispatch_mach_connect();
  }
  else
  {
    dispatch_activate(*(dispatch_object_t *)(v1 + 96));
  }
}

void sub_100013934()
{
  dispatch_mach_cancel();
  os_unfair_lock_lock_with_options();
  uint64_t v0 = off_1000302D0;
  if (off_1000302D0)
  {
    do
    {
      if (*((_DWORD *)v0 + 32))
      {
        dispatch_mach_cancel();
        dispatch_mach_cancel();
      }
      uint64_t v0 = (void *)v0[2];
    }
    while (v0);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000302E0);
}

uint64_t sub_1000139AC(uint64_t a1, _DWORD *a2)
{
  uint64_t context = dispatch_mach_mig_demux_get_context();
  if (!context) {
    return 5;
  }
  uint64_t v4 = context;
  uint64_t result = 0;
  *a2 = *(unsigned __int8 *)(v4 + 143) == 0;
  return result;
}

void sub_1000139F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(a1 + 144))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_100030288);
    __dmb(9u);
    unint64_t v3 = *(void *)(v2 + 520) & 0xFFFFFFFFFFFFFFFELL;
    char v4 = 1;
    do
    {
      char v5 = v4;
      BOOL v6 = (v4 & 1) == 0;
      if (v4) {
        uint64_t v7 = v2;
      }
      else {
        uint64_t v7 = v2 + 128;
      }
      if (v6) {
        uint64_t v8 = 260;
      }
      else {
        uint64_t v8 = 256;
      }
      int v9 = *(unsigned __int16 *)(v2 + v8);
      if (v6) {
        uint64_t v10 = 80;
      }
      else {
        uint64_t v10 = 64;
      }
      uint64_t v11 = *(void *)(a1 + v10);
      if ((unsigned __int16)(v11 - v9) > 0x3Fu)
      {
        *(unsigned char *)(a1 + 144) = 1;
        goto LABEL_28;
      }
      if (v9 != (unsigned __int16)v11)
      {
        do
          v3 &= ~(1 << *(_WORD *)(v7 + 2 * (v9++ & 0x3F)));
        while ((unsigned __int16)v9 != (unsigned __int16)v11);
      }
      char v4 = 0;
    }
    while ((v5 & 1) != 0);
    if (v3)
    {
      uint64_t v12 = 0;
      uint64_t v13 = off_1000302A8;
      do
      {
        unint64_t v14 = __clz(__rbit64(v3));
        uint64_t v15 = (unsigned __int16 *)(v2 + (v14 << 12));
        unint64_t v16 = *v15;
        uint64_t v17 = 1 << v14;
        if (v16 >= 0x11 && v15[19])
        {
          uint64_t v18 = *((unsigned __int8 *)v15 + 7);
          if ((v18 & 2) != 0)
          {
            (*((void (**)(void *, uint64_t, uint64_t, unsigned __int16 *, unint64_t))off_1000302A0 + 2))(off_1000302A0, a1, 3, v15, v16 & 0xFF0000000000FFFFLL | (((*(unsigned int *)(v15 + 1) | ((unint64_t)*((unsigned __int8 *)v15+ 6) << 32)) & 0xFFFFFFFFFFLL) << 16) | (v18 << 56));
            if (*(unsigned char *)(a1 + 145)) {
              (*(void (**)(void))(*(void *)v13 + 16))();
            }
          }
          else
          {
            v12 |= v17;
          }
        }
        v3 &= ~v17;
      }
      while (v3);
      if (v12)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 0x40000000;
        size_t v19[2] = sub_100013D50;
        v19[3] = &unk_10002CDE8;
        v19[4] = v12;
        v19[5] = v2;
        v19[6] = a1;
        v19[7] = v13;
        dispatch_async((dispatch_queue_t)qword_100030298, v19);
        return;
      }
    }
  }
LABEL_28:

  sub_100013C24(a1);
}

uint64_t sub_100013C24(uint64_t a1)
{
  uint64_t v2 = (dispatch_group_t *)off_1000302A8;
  uint64_t v3 = *(void *)(a1 + 48);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100030288);
  if (*(unsigned char *)(a1 + 145))
  {
    dispatch_group_leave(v2[1]);
    *(unsigned char *)(a1 + 145) = 0;
  }
  if (*(unsigned char *)(a1 + 146))
  {
    dispatch_group_leave(v2[1]);
    *(unsigned char *)(a1 + 146) = 0;
  }
  if (*(unsigned char *)(a1 + 144)) {
    (*((void (**)(void *, uint64_t, uint64_t, uint64_t, void))off_1000302A0 + 2))(off_1000302A0, a1, 5, v3, 0);
  }
  (*((void (**)(void *, uint64_t, uint64_t, void, void))off_1000302A0 + 2))(off_1000302A0, a1, 2, 0, 0);
  os_unfair_lock_lock_with_options();
  uint64_t v4 = *(void *)(a1 + 16);
  char v5 = *(void **)(a1 + 24);
  if (v4)
  {
    *(void *)(v4 + 24) = v5;
    char v5 = *(void **)(a1 + 24);
  }
  else
  {
    off_1000302D8 = *(_UNKNOWN ***)(a1 + 24);
  }
  *char v5 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000302E0);
  dispatch_release(*(dispatch_object_t *)(a1 + 96));
  *(void *)(a1 + 96) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
  *(void *)(a1 + 104) = 0;
  *(void *)(a1 + 16) = -1985229329;
  *(void *)(a1 + 24) = -1985229329;

  return __os_object_release_without_xref_dispose(a1);
}

void sub_100013D50(uint64_t a1)
{
  for (unint64_t i = *(void *)(a1 + 32); i; i &= ~(1 << v3))
  {
    unint64_t v3 = __clz(__rbit64(i));
    (*((void (**)(void *, void, uint64_t, unint64_t, void))off_1000302A0 + 2))(off_1000302A0, *(void *)(a1 + 48), 4, *(void *)(a1 + 40) + (v3 << 12), *(void *)(*(void *)(a1 + 40) + (v3 << 12)));
    if (*(unsigned char *)(*(void *)(a1 + 48) + 146)) {
      (*(void (**)(void))(**(void **)(a1 + 56) + 16))();
    }
  }
  uint64_t v4 = qword_100030288;
  char v5 = *(void **)(a1 + 48);

  dispatch_async_f(v4, v5, (dispatch_function_t)sub_100013C24);
}

uint64_t sub_100013E2C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 11605) >= 0xFFFFFFFB) {
    return (uint64_t)*(&off_10002CE60 + 5 * (v1 - 11600) + 5);
  }
  else {
    return 0;
  }
}

_DWORD *sub_100013E68(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    uint64_t result = (_DWORD *)sub_1000139AC(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

void sub_100013EE4(id a1)
{
  if (&tb_client_connection_create)
  {
    int v1 = (void *)_os_trace_calloc();
    if (exclaves_lookup_service())
    {
      memset(&v4[34], 170, 0x3DEuLL);
      strcpy(v4, "Exclaves log server not available");
    }
    else
    {
      uint64_t v2 = (void *)_os_trace_calloc();
      *uint64_t v2 = 0;
      v2[1] = 0xAAAAAAAAAAAAAAAALL;
      if (tb_endpoint_create_with_data())
      {
        tb_endpoint_set_interface_identifier();
        uint64_t v3 = tb_client_connection_create_with_endpoint();
        if (!tb_client_connection_activate())
        {
          *int v1 = v3;
          qword_100031F90 = (uint64_t)v1;
          return;
        }
      }
      free(v2);
      memset(&v4[41], 170, 0x3D7uLL);
      strcpy(v4, "Failed to initialize config admin client");
    }
    sub_100016E68((uint64_t)v4);
    free(v1);
  }
}

void sub_100014060(id a1, void *a2)
{
}

uint64_t sub_100014068(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2000000000;
  char v37 = 1;
  if (a3) {
    unint64_t v7 = a2 - 4;
  }
  else {
    unint64_t v7 = a2;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2000000000;
  uint64_t v33 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2000000000;
  v29[3] = 0;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2000000000;
  uint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v28 = _os_trace_calloc();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000;
  uint64_t v17 = sub_1000142AC;
  uint64_t v18 = &unk_10002D058;
  uint64_t v19 = a4;
  uint64_t v20 = &v25;
  uint64_t v21 = v29;
  unint64_t v22 = &v30;
  int v23 = &v34;
  uint64_t v24 = 20;
  if (v7 >= 0x14)
  {
    uint64_t v8 = 4;
    if (!a3) {
      uint64_t v8 = 0;
    }
    int v9 = (unsigned int *)(a1 + v8);
    do
    {
      unint64_t v10 = *v9;
      if (v7 < v10) {
        break;
      }
      uint64_t v11 = v9[1];
      if (v11 + 21 > v10) {
        break;
      }
      if (__CFADD__(v9 + 5, v11)) {
        __break(0x5513u);
      }
      if (*((unsigned char *)v9 + v11 + 20)) {
        break;
      }
      if (!v17(v16, v9)) {
        break;
      }
      uint64_t v12 = *v9;
      int v9 = (unsigned int *)((char *)v9 + v12);
      v7 -= v12;
    }
    while (v7 > 0x13);
  }
  if (*((unsigned char *)v35 + 24))
  {
    ++v31[3];
    char v13 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
    *((unsigned char *)v35 + 24) = v13;
  }
  free((void *)v26[3]);
  uint64_t v14 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v14;
}

uint64_t sub_1000142AC(void *a1, unsigned int *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  if (~v2 < (unint64_t)(16 * v4) || (unint64_t)(v4 + 0x800000000000000) >> 60 != 0) {
    goto LABEL_24;
  }
  uint64_t v8 = v2 + 16 * v4;
  int v9 = (const Bytef *)(a2 + 5);
  uInt v10 = strlen((const char *)a2 + 20);
  *(_DWORD *)uint64_t v8 = crc32(0, v9, v10);
  *(_DWORD *)(v8 + 4) = 0;
  *(void *)(v8 + 8) = *(void *)(a2 + 3);
  if (*(void *)(*(void *)(a1[6] + 8) + 24) == a1[9])
  {
    uint64_t v11 = a1[4];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    if (((*(uint64_t (**)(void))(v11 + 16))() & 1) == 0)
    {
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 0;
      return result;
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  unsigned int v12 = a2[1];
  if ((((_BYTE)v12 + 1) & 3) != 0) {
    uint64_t v13 = v12 - (((_BYTE)v12 + 1) & 3) + 5;
  }
  else {
    uint64_t v13 = v12 + 1;
  }
  if (__CFADD__(v9, v13)) {
LABEL_24:
  }
    __break(0x5513u);
  uint64_t v14 = *a2 - v13;
  v24[0] = _NSConcreteStackBlock;
  unint64_t v15 = v14 - 20;
  v24[1] = 0x40000000;
  uint64_t v25 = sub_1000144E4;
  BOOL v26 = &unk_10002D030;
  uint64_t v17 = a1[8];
  uint64_t v16 = a1[9];
  uint64_t v30 = a2;
  uint64_t v31 = v16;
  long long v18 = *((_OWORD *)a1 + 3);
  long long v27 = *((_OWORD *)a1 + 2);
  long long v28 = v18;
  uint64_t v29 = v17;
  if (v15 >= 0x14)
  {
    uint64_t v19 = &v9[v13];
    do
    {
      unint64_t v20 = *(unsigned int *)v19;
      if (v15 < v20) {
        break;
      }
      uint64_t v21 = *((unsigned int *)v19 + 1);
      if (v21 + 21 > v20) {
        break;
      }
      if (__CFADD__(v19 + 20, v21)) {
        goto LABEL_24;
      }
      if (v19[v21 + 20]) {
        break;
      }
      if (!v25((uint64_t)v24, (uint64_t)v19)) {
        break;
      }
      uint64_t v22 = *(unsigned int *)v19;
      v19 += v22;
      v15 -= v22;
    }
    while (v15 > 0x13);
  }
  return 1;
}

uint64_t sub_1000144E4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  uint64_t v3 = *(void *)(*(void *)(result + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  if (~v2 < (unint64_t)(16 * v4) || (unint64_t)(v4 + 0x800000000000000) >> 60 != 0)
  {
    __break(0x5513u);
    return result;
  }
  unint64_t v7 = (void *)result;
  uint64_t v8 = v2 + 16 * v4;
  uint64_t v9 = *(void *)(result + 72);
  uInt v10 = strlen((const char *)(v9 + 20));
  *(_DWORD *)uint64_t v8 = crc32(0, (const Bytef *)(v9 + 20), v10);
  if (a2)
  {
    uInt v11 = strlen((const char *)(a2 + 20));
    int v12 = crc32(0, (const Bytef *)(a2 + 20), v11);
  }
  else
  {
    int v12 = 0;
    a2 = v9;
  }
  *(_DWORD *)(v8 + 4) = v12;
  *(void *)(v8 + 8) = *(void *)(a2 + 12);
  if (*(void *)(*(void *)(v7[6] + 8) + 24) != v7[10]) {
    return 1;
  }
  uint64_t v13 = v7[4];
  ++*(void *)(*(void *)(v7[7] + 8) + 24);
  if ((*(uint64_t (**)(void))(v13 + 16))())
  {
    *(void *)(*(void *)(v7[6] + 8) + 24) = 0;
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(v7[8] + 8) + 24) = 0;
  return result;
}

BOOL sub_10001462C(id a1, unint64_t a2, oslogdarwin_prefsvalue_s *a3, unint64_t a4)
{
  if (a2 >= 2 && !a4) {
    return 1;
  }
  uint64_t v5 = 0x2BFF4390FAE5F890;
  char v6 = 3;
  memset(v7, 170, sizeof(v7));
  uint64_t v8 = a3;
  unint64_t v9 = a4;
  uint64_t v10 = 0;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  return sub_1000146CC((unsigned __int8 *)&v5);
}

uint64_t sub_1000146CC(unsigned __int8 *a1)
{
  if (qword_100031F98 != -1) {
    dispatch_once(&qword_100031F98, &stru_10002CFC8);
  }
  if (!qword_100031F90) {
    return 0;
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  uint64_t v8 = sub_100014C18;
  unint64_t v9 = &unk_10002D080;
  uint64_t v10 = &v11;
  if (*(void *)a1 == 0x2BFF4390FAE5F890 || *(void *)a1 == 0xB846F5BCEBFFF0E0)
  {
    *(void *)&long long v34 = 0;
    *((void *)&v34 + 1) = &v34;
    long long v35 = 0x2000000000uLL;
    *(void *)&long long v27 = _NSConcreteStackBlock;
    *((void *)&v27 + 1) = 0x40000000;
    *(void *)&long long v28 = sub_1000225C4;
    *((void *)&v28 + 1) = &unk_10002E5A0;
    *(void *)&long long v29 = &v34;
    sub_100022294(a1 + 8, (uint64_t)&v27);
    _Block_object_dispose(&v34, 8);
  }
  uint64_t v39 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  if (tb_client_connection_message_construct()) {
    goto LABEL_15;
  }
  tb_message_encode_u64();
  tb_message_encode_u64();
  uint64_t v2 = *(void *)a1;
  if (*(void *)a1 == 0x2BFF4390FAE5F890 || v2 == 0xB846F5BCEBFFF0E0)
  {
    uint64_t v4 = a1 + 8;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2000000000;
    int v26 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2000000000;
    v22[3] = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 0x40000000;
    v21[2] = sub_1000225DC;
    v21[3] = &unk_10002E5C8;
    v21[4] = v22;
    sub_100022294(v4, (uint64_t)v21);
    tb_message_encode_u64();
    unint64_t v15 = _NSConcreteStackBlock;
    unint64_t v16 = 0x40000000;
    uint64_t v17 = sub_1000225F4;
    long long v18 = &unk_10002E5F0;
    uint64_t v19 = &v23;
    unint64_t v20 = &v34;
    sub_100022294(v4, (uint64_t)&v15);
    LODWORD(v4) = *((_DWORD *)v24 + 6);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(&v23, 8);
    if (!v4)
    {
      tb_message_encode_BOOL();
      tb_message_complete();
      v21[0] = 0;
      if ((tb_connection_send_query() & 0xFFFFFFF7) == 0 && v21[0])
      {
        unint64_t v15 = (void **)0xAAAAAAAAAAAAAAAALL;
        unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
        tb_message_decode_u8();
        if (v15 == 1)
        {
          tb_message_decode_u64();
          unint64_t v6 = v16;
          if (v16 == 0xCBD9DC39909D106ALL || v16 == 0x4EF7D98DF3E71501) {
            goto LABEL_24;
          }
        }
        else if (!(_BYTE)v15)
        {
          unint64_t v6 = v16;
LABEL_24:
          v8((uint64_t)v7, (char)v15, v6);
          tb_client_connection_message_destruct();
          BOOL v3 = *((unsigned char *)v12 + 24) == 0;
          goto LABEL_16;
        }
      }
      tb_client_connection_message_destruct();
LABEL_15:
      BOOL v3 = 0;
LABEL_16:
      _Block_object_dispose(&v11, 8);
      return v3;
    }
    _os_crash();
    __break(1u);
  }
  printf("TB_FATAL: invalid value: unexpected case value, %llx (%s:%d)\n", v2, "/Library/Caches/com.apple.xbs/Binaries/libtrace_executables/install/TempContent/Objects/libtrace.build/logd.build/DerivedSources/OSLogDarwin_C.c", 1011);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void sub_100014C18(uint64_t a1, char a2, uint64_t a3)
{
  if (a2 == 1)
  {
    if (a3 == 0xCBD9DC39909D106ALL)
    {
      memset(&v4[60], 170, 0x3C4uLL);
      strcpy(v4, "failed to set preferences in exclaves: invalid subsystem id");
    }
    else
    {
      if (a3 != 0x4EF7D98DF3E71501)
      {
LABEL_7:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        return;
      }
      memset(&v4[50], 170, 0x3CEuLL);
      strcpy(v4, "failed to set preferences in exclaves: full cache");
    }
    sub_100016E68((uint64_t)v4);
    goto LABEL_7;
  }
}

BOOL sub_100014D2C(id a1, unint64_t a2, oslogdarwin_prefsvalue_s *a3, unint64_t a4)
{
  if (a2 >= 2 && !a4) {
    return 1;
  }
  unint64_t v5 = 0xB846F5BCEBFFF0E0;
  char v6 = 3;
  memset(v7, 170, sizeof(v7));
  uint64_t v8 = a3;
  unint64_t v9 = a4;
  uint64_t v10 = 0;
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  return sub_1000146CC((unsigned __int8 *)&v5);
}

void sub_100014DCC(void *a1)
{
  memset(v9, 170, 22);
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  uid_t v1 = dword_100031F0C[0];
  gid_t v2 = unk_100031F10;
  id v3 = a1;
  snprintf(__str, 0x1EuLL, "%s.tmp", "version.plist");
  uint64_t v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:200 options:0 error:0];

  uint64_t v5 = openat(dword_100031BF8, __str, 1794, 420);
  if (v5 == -1)
  {
    __error();
    _os_assumes_log();
  }
  else
  {
    uint64_t v6 = v5;
    fchown(v5, v1, v2);
    id v7 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v6];
    [v7 writeData:v4 error:0];
    [v7 synchronizeAndReturnError:0];
    [v7 closeAndReturnError:0];
    if (renameat(dword_100031BF8, __str, dword_100031BF8, "version.plist") == -1)
    {
      __error();
      _os_assumes_log();
    }
  }
}

void *sub_100014F50(uint64_t a1, unsigned int a2)
{
  uint64_t result = (void *)sub_10000C148(*(void *)(a1 + 32), a2);
  *uint64_t result = 0;
  return result;
}

void sub_100014F70(uint64_t a1, unsigned int a2)
{
  if (a2 >= 6)
  {
    __break(0x5512u);
LABEL_8:
    __break(0x5513u);
  }
  char v2 = a2;
  if (1248 * (unint64_t)a2 > ~(unint64_t)qword_100030398) {
    goto LABEL_8;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = &qword_100030398[156 * a2];
  os_retain(*(void **)(v3 + 64));
  uint64_t v5 = v4[1];
  if (v5) {
    uint64_t v6 = (NSObject **)(v5 + 16);
  }
  else {
    uint64_t v6 = (NSObject **)v4;
  }
  id v7 = *v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_100015078;
  v8[3] = &unk_10002D140;
  v8[4] = v3;
  v8[5] = v4;
  char v9 = v2;
  dispatch_async(v7, v8);
}

void sub_100015078(uint64_t a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (const void *)(v2 + 138);
  uint64_t v5 = (void *)sub_10000C148(v2, *(unsigned __int8 *)(a1 + 48));
  sub_100008058(v3, v4, v5);
  *(void *)sub_10000C148(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48)) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 132));
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 64);

  os_release(v6);
}

uint64_t sub_100015104(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const char *)(a2 + 138);
  if (!strcmp((const char *)(*(void *)(a1 + 32) + 32), (const char *)(a2 + 138)))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Super Quarantined %s, dropping clients logs.", v4);
      sub_100016E68((uint64_t)__b);
      *(unsigned char *)(a2 + 128) = 1;
    }
    else
    {
      sub_100013460(*(void *)(a2 + 64));
    }
  }
  return 1;
}

uint64_t sub_1000151CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a2 + 132);
  os_unfair_lock_lock_with_options();
  *(void *)sub_10000C148(a2, *(unsigned __int8 *)(*(void *)(a1 + 32) + 1240)) = 0;
  os_unfair_lock_unlock(v4);
  return 1;
}

void sub_100015228(id a1)
{
}

void sub_100015238(id a1)
{
  qword_10003E7F0 = (uint64_t)dispatch_queue_create("com.apple.logd.time-change", 0);
}

void sub_1000152CC(id a1)
{
  qword_10003E7D0 = (uint64_t)dispatch_semaphore_create(1);
}

void sub_1000152F0(id a1)
{
  qword_10003E7F8 = (uint64_t)xpc_connection_create_mach_service("com.apple.logd_helper", 0, 2uLL);
  xpc_connection_set_event_handler((xpc_connection_t)qword_10003E7F8, &stru_10002D3E8);
  uid_t v1 = (_xpc_connection_s *)qword_10003E7F8;

  xpc_connection_activate(v1);
}

uint64_t start()
{
  qword_10003E7E0 = os_transaction_create();
  os_trace_set_mode();
  byte_10003E900 = (MEMORY[0xFFFFFC104] & 0x4000000) != 0;
  _os_trace_set_diagnostic_flags();
  if (bootstrap_check_in2())
  {
    memset(&__str[36], 170, 0x3DCuLL);
    strcpy(&__str[32], "ogd");
    uid_t v1 = "failed to checkin to com.apple.logd";
LABEL_68:
    long long v25 = *((_OWORD *)v1 + 1);
    *(_OWORD *)__str = *(_OWORD *)v1;
    *(_OWORD *)&__str[16] = v25;
    sub_100016E68((uint64_t)__str);
    return 1;
  }
  if (&_wd_endpoint_register)
  {
    wd_endpoint_register();
    wd_endpoint_set_alive_func();
    wd_endpoint_activate();
  }
  if (byte_10003E900) {
    sub_100015A54(-1431655766);
  }
  sub_10001D794(0);
  sub_10001D794(1u);
  sub_10001D794(2u);
  sub_10001C2D0();
  qword_100031DC0 = qword_10003E938;
  qword_100031D30 = qword_10003E938;
  qword_100031C10 = qword_10003E938;
  qword_100031CA0 = qword_10003E938;
  dispatch_sync_f((dispatch_queue_t)qword_10003E938, 0, (dispatch_function_t)sub_10001D188);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  uint64_t v2 = (const char *)qword_10003E9A0;
  uint64_t v3 = _os_trace_zalloc();
  int v4 = openat(-2, v2, 0);
  *(_DWORD *)uint64_t v3 = v4;
  if (v4 == -1)
  {
LABEL_24:
    __error();
LABEL_25:
    _os_assumes_log();
    goto LABEL_64;
  }
  *(void *)(v3 + 128) = 0x20000;
  *(_DWORD *)(v3 + 136) = 9;
  *(void *)(v3 + 144) = 3888000;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  int v5 = sub_10002426C(v4, &v31, &v30, 1);
  if (v5 < 0) {
    goto LABEL_64;
  }
  if (v5)
  {
    unint64_t v6 = v31;
    unint64_t v7 = v30 + 1;
    *(void *)(v3 + 96) = v31;
    *(void *)(v3 + 104) = v7;
    uint64_t v8 = (unint64_t *)(v3 + 96);
    char v9 = (unint64_t *)(v3 + 96);
    if (v6 > 1) {
      goto LABEL_15;
    }
  }
  else
  {
    *(void *)(v3 + 96) = 2;
    char v9 = (unint64_t *)(v3 + 96);
    uint64_t v8 = (unint64_t *)(v3 + 104);
  }
  *uint64_t v8 = 2;
  uint64_t v8 = v9;
LABEL_15:
  sub_1000245D4(v3);
  unint64_t v10 = *(void *)(v3 + 104);
  if (v10 == 2 || v10 <= *v8) {
    goto LABEL_34;
  }
  memset(__str, 170, 26);
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v30);
  int v11 = openat(*(_DWORD *)v3, __str, 16777225);
  if (v11 < 0) {
    goto LABEL_64;
  }
  int v12 = v11;
  off_t v13 = lseek(v11, 0, 2);
  if (v13 == -1)
  {
    __error();
    goto LABEL_39;
  }
  if (v13 > 0x7FFFFFFF)
  {
LABEL_39:
    _os_assumes_log();
    goto LABEL_21;
  }
  if ((v13 & 7) != 0)
  {
LABEL_21:
    if (close(v12) != -1) {
      goto LABEL_64;
    }
    int v14 = *__error();
    uint64_t v15 = *__error();
    if (v14 != 9) {
      goto LABEL_25;
    }
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v15;
    __break(1u);
    goto LABEL_24;
  }
  *(_DWORD *)(v3 + 112) = v12;
  *(void *)(v3 + 12sub_100024C38(qword_10003E7A8, 0) = v13;
  if ((unint64_t)v13 >= *(void *)(v3 + 128))
  {
    if (close(v12) == -1)
    {
      LODWORD(v17) = *__error();
      uint64_t v27 = *__error();
      if (v17 == 9)
      {
LABEL_79:
        qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100031F78 = v27;
        __break(1u);
LABEL_80:
        sub_100024950((v0 << 16) | ((v17 & 0xFFFFF) << 32) | WORD1(v0) | 0xBAD0000000000000);
      }
      _os_assumes_log();
    }
    sub_1000245D4(v3);
LABEL_34:
    if ((sub_100024894(v3) & 0x80000000) == 0) {
      goto LABEL_35;
    }
LABEL_64:
    if ((*(_DWORD *)v3 & 0x80000000) != 0 || close(*(_DWORD *)v3) != -1) {
      goto LABEL_66;
    }
    LODWORD(v17) = *__error();
    uint64_t v27 = *__error();
    if (v17 != 9)
    {
      _os_assumes_log();
LABEL_66:
      free((void *)v3);
      qword_10003E7A8 = 0;
LABEL_67:
      memset(&__str[33], 170, 0x3DFuLL);
      __str[32] = 0;
      uid_t v1 = "failed to create timesync writer";
      goto LABEL_68;
    }
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v27;
    __break(1u);
    goto LABEL_79;
  }
  if (!v13) {
    goto LABEL_35;
  }
  size_t v32 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v16 = (char *)_os_trace_mmap_at();
  if (!v16)
  {
    if (*__error()) {
      goto LABEL_25;
    }
    goto LABEL_64;
  }
  if (!v32)
  {
LABEL_59:
    int v23 = munmap(v16, v32);
    int v24 = 1;
    LODWORD(v17) = -1431655766;
    LODWORD(vsub_100024C38(qword_10003E7A8, 0) = -1431655766;
    goto LABEL_60;
  }
  if (v32 >= 8)
  {
    size_t v19 = 0;
    while (v19 < v32)
    {
      size_t v17 = v19;
      unint64_t v20 = &v16[v19];
      int v21 = *(unsigned __int16 *)&v16[v19];
      if (v21 > 48047)
      {
        if (v21 == 48048)
        {
          if (*((_WORD *)v20 + 1) != 48) {
            goto LABEL_57;
          }
          uint64_t v22 = 48;
        }
        else
        {
          if (v21 != 57005) {
            goto LABEL_57;
          }
          uint64_t v22 = *((unsigned __int16 *)v20 + 1);
        }
      }
      else if (v21 == 27986)
      {
        if (*((_WORD *)v20 + 1) != 88) {
          goto LABEL_57;
        }
        uint64_t v22 = 88;
      }
      else
      {
        if (v21 != 29524 || *((_WORD *)v20 + 1) != 32)
        {
LABEL_57:
          uint64_t v0 = *(void *)v20;
          goto LABEL_58;
        }
        uint64_t v22 = 32;
      }
      size_t v19 = v17 + v22;
      if (v19 > v32) {
        goto LABEL_57;
      }
    }
    goto LABEL_59;
  }
  LODWORD(vsub_100024C38(qword_10003E7A8, 0) = -1431655766;
  LODWORD(v17) = -1;
LABEL_58:
  int v23 = munmap(v16, v32);
  int v24 = 0;
LABEL_60:
  if (v23 != -1)
  {
    if (!v24) {
      goto LABEL_62;
    }
LABEL_35:
    if ((sub_100024978(v3, 0) & 0x80000000) == 0)
    {
      qword_10003E7A8 = v3;
      if (v3)
      {
        sub_100015AC8();
        memset(__str, 170, 0x400uLL);
        int v18 = sub_100025894();
        snprintf(__str, 0x400uLL, "libtrace_kic=%d", v18);
        sub_100016E68((uint64_t)__str);
        sub_100018794();
      }
      goto LABEL_67;
    }
    goto LABEL_64;
  }
  int v29 = v24;
  __error();
  _os_assumes_log();
  if (v29) {
    goto LABEL_35;
  }
LABEL_62:
  if (close(*(_DWORD *)(v3 + 112)) != -1) {
    goto LABEL_63;
  }
  int v28 = *__error();
  uint64_t result = *__error();
  if (v28 != 9)
  {
    _os_assumes_log();
LABEL_63:
    sub_1000245D4(v3);
    if ((sub_100024894(v3) & 0x80000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_64;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

void sub_100015A54(int a1)
{
  sub_10001C358();
  memset(&v2[22], 170, 0x3EAuLL);
  strcpy(v2, "Starting in sick mode");
  sub_100016E68((uint64_t)v2);
  sub_10001346C(a1, &stru_10002D468);
  sub_100013794();
  sub_100015C38();
  sub_100017428();
  sub_1000189E4();
  dispatch_main();
}

void sub_100015AC8()
{
  if (setiopolicy_np(5, 0, 1) == -1)
  {
    memset(&v0[44], 170, 0x3D4uLL);
    strcpy(v0, "Failed to set IOPOL_VFS_TRIGGER_RESOLVE_OFF");
    sub_100016E68((uint64_t)v0);
  }
}

void sub_100015B64()
{
  *(void *)&v4[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long in = v0;
  *(_OWORD *)int v4 = v0;
  size_t v1 = 37;
  if (!sysctlbyname("kern.uuid", &in, &v1, 0, 0))
  {
    uuid_parse((const char *)&in, byte_10003E809);
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "_read_kernel_uuid calling _logd_uuiddb_harvest_kernel for %s", (const char *)&in);
    sub_100016E68((uint64_t)__b);
    sub_10001852C();
  }
}

uint64_t sub_100015C38()
{
  if (&_wd_endpoint_register)
  {
    sub_100008F44(2);
    sub_100008F44(3);
    wd_endpoint_add_queue();
    uint64_t result = wd_endpoint_add_queue();
    byte_10003E808 = 1;
  }
  return result;
}

void sub_100015C98()
{
  dword_10003E83C = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_10003E830, (IOServiceInterestCallback)sub_100016AA8, &dword_10003E838);
  long long v0 = (IONotificationPort *)qword_10003E830;
  if (dword_10003E83C) {
    BOOL v1 = qword_10003E830 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    IONotificationPortSetDispatchQueue(v0, global_queue);
  }
}

void sub_100015D28()
{
  kern_return_t v1;
  kern_return_t v2;
  uintptr_t v3;
  uintptr_t v4;
  void handler[4];
  mach_port_name_t v6;
  host_t v7;
  mach_port_name_t name;
  _OWORD __b[64];

  name = 0;
  if (qword_10003E850 != -1) {
    dispatch_once(&qword_10003E850, &stru_10002D508);
  }
  host_t v0 = dword_10003E84C;
  if (!dword_10003E84C)
  {
    memset((char *)&__b[2] + 13, 170, 0x3D3uLL);
    strcpy((char *)__b, "Failed to get host port for calendar changes");
    goto LABEL_7;
  }
  BOOL v1 = mach_port_allocate(mach_task_self_, 1u, &name);
  if (v1)
  {
    uint64_t v2 = v1;
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Failed to allocate mach port for calendar changes: error %d", v2);
LABEL_7:
    sub_100016E68((uint64_t)__b);
    return;
  }
  uint64_t v3 = name;
  if (qword_10003E7E8 != -1)
  {
    int v4 = name;
    dispatch_once(&qword_10003E7E8, &stru_10002D2E0);
    uint64_t v3 = v4;
  }
  qword_10003E840 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v3, 0, (dispatch_queue_t)qword_10003E7F0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100016820;
  handler[3] = &unk_10002D4C8;
  unint64_t v6 = name;
  unint64_t v7 = v0;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003E840, handler);
  dispatch_activate((dispatch_object_t)qword_10003E840);
  sub_1000168D8(v0, name);
}

void sub_100015EFC()
{
  if (qword_10003E7E8 != -1) {
    dispatch_once(&qword_10003E7E8, &stru_10002D2E0);
  }
  int out_token = -1431655766;
  if (notify_register_dispatch("com.apple.system.timezone", &out_token, (dispatch_queue_t)qword_10003E7F0, &stru_10002D528))
  {
    memset(&v1[40], 170, 0x3D8uLL);
    strcpy(v1, "Failed to register for timezone changes");
    sub_100016E68((uint64_t)v1);
  }
}

void sub_100015FD4()
{
  if (qword_10003E7E8 != -1) {
    dispatch_once(&qword_10003E7E8, &stru_10002D2E0);
  }
  host_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10003E7F0);
  qword_10003E860 = (uint64_t)v0;
  dispatch_time_t v1 = dispatch_walltime(0, 0);
  dispatch_source_set_timer(v0, v1, 0x34630B8A000uLL, 0xDF8475800uLL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003E860, &stru_10002D568);
  uint64_t v2 = qword_10003E860;

  dispatch_activate(v2);
}

void sub_100016094()
{
  signal(15, (void (__cdecl *)(int))1);
  host_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_set_context(v0, v0);
  dispatch_source_set_cancel_handler_f(v0, (dispatch_function_t)&_dispatch_release);
  dispatch_source_set_event_handler_f(v0, (dispatch_function_t)sub_100016124);

  dispatch_activate(v0);
}

void sub_100016124(NSObject *a1)
{
  dispatch_source_cancel(a1);
  clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  uint64_t v3 = (char *)0xAAAAAAAAAAAAAAAALL;
  asprintf(&v3, "%s/shutdown.log", (const char *)qword_10003E998);
  if (v3)
  {
    fopen(v3, "a+");
    free(v3);
  }
  if (qword_10003E7E8 != -1) {
    dispatch_once(&qword_10003E7E8, &stru_10002D2E0);
  }
  dispatch_sync((dispatch_queue_t)qword_10003E7F0, &stru_10002D5A8);
  sub_100024C38(qword_10003E7A8, 0);
  dispatch_time_t v1 = qword_100030398;
  uint64_t v2 = 5;
  do
  {
    sub_100003428((uint64_t)v1);
    v1 += 156;
    --v2;
  }
  while (v2);
  sub_100018440();
}

FILE *sub_1000165A0(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(FILE **)(a1 + 40);
  if (result)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      fprintf(result, "After %.02fs, these clients are still here:\n", (double)(unint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 56)) / 1000000000.0);
    }
    *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uuid_string_t out = v5;
    *(_OWORD *)&out[16] = v5;
    int v6 = -1431655766;
    sub_10000FDD4(*(void *)(a2 + 64), &v6);
    uuid_unparse_upper((const unsigned __int8 *)(a2 + 32), out);
    fprintf(*(FILE **)(a1 + 40), "\t\tremaining client pid: %d (%s/%s)\n", v6, (const char *)(a2 + 138), out);
    uint64_t result = (FILE *)(*(void *)(a1 + 40) != 0);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void sub_1000166AC(id a1)
{
  qword_10003E828 = (uint64_t)dispatch_group_create();
}

void sub_1000166CC(id a1)
{
  byte_10003E848 = 1;
}

void sub_1000166DC(id a1)
{
  if ((byte_10003E848 & 1) == 0 && (sub_100024C38(qword_10003E7A8, 0) & 0x80000000) != 0)
  {
    memset(&v1[40], 170, 0x3D8uLL);
    strcpy(v1, "Failed to write periodic timesync point");
    sub_100016E68((uint64_t)v1);
  }
}

void sub_100016780(id a1, int a2)
{
  if ((byte_10003E848 & 1) == 0)
  {
    memset(&v2[41], 170, 0x3D7uLL);
    strcpy(v2, "Time zone changed, updating file headers");
    sub_100016E68((uint64_t)v2);
    sub_100024C38(qword_10003E7A8, 1);
  }
}

void sub_100016820(uint64_t a1)
{
  mach_msg_return_t v3;
  long long v4;
  long long v5;

  int v4 = 0u;
  long long v5 = 0u;
  int v2 = *(_DWORD *)(a1 + 32);
  DWORD1(v4) = 24;
  HIDWORD(v4) = v2;
  uint64_t v3 = mach_msg_receive((mach_msg_header_t *)&v4);
  if ((byte_10003E848 & 1) == 0 && (DWORD1(v5) & 0xFFFFFFFE) == 0x3B6)
  {
    sub_100024C38(qword_10003E7A8, 1);
    sub_1000168D8(*(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32));
  }
  if (!v3) {
    mach_msg_destroy((mach_msg_header_t *)&v4);
  }
}

void sub_1000168D8(host_t a1, mach_port_t notify_port)
{
  kern_return_t v4;
  char __b[1024];

  int v4 = host_request_notification(a1, (byte_10003E858 & 1) == 0, notify_port);
  if (v4 == 4 && (byte_10003E858 & 1) == 0)
  {
    byte_10003E858 = 1;
    int v4 = host_request_notification(a1, 0, notify_port);
  }
  if (v4)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "Failed to register for calendar changes: error %d", v4);
    sub_100016E68((uint64_t)__b);
  }
}

void sub_1000169BC(id a1)
{
  kern_return_t special_port;
  kern_return_t v3;
  mach_port_t port;
  char __b[1024];

  mach_port_t v1 = mach_host_self();
  port = -1431655766;
  special_port = host_get_special_port(v1, -1, 1, &port);
  uint64_t v3 = special_port;
  if (special_port == 4)
  {
LABEL_4:
    dword_10003E84C = v1;
    if (v1) {
      return;
    }
    goto LABEL_5;
  }
  if (!special_port)
  {
    mach_port_deallocate(mach_task_self_, v1);
    mach_port_t v1 = port;
    goto LABEL_4;
  }
  if (!dword_10003E84C)
  {
LABEL_5:
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "Failed to get mach host port: error %d", v3);
    sub_100016E68((uint64_t)__b);
  }
}

void sub_100016AA8(int a1, int a2, int a3, intptr_t notificationID)
{
  if (a3 != -536870288)
  {
    if (a3 != -536870272) {
      return;
    }
    long long v5 = qword_100030398;
    uint64_t v6 = 5;
    do
    {
      sub_100003428((uint64_t)v5);
      v5 += 156;
      --v6;
    }
    while (v6);
  }
  io_connect_t v7 = dword_10003E83C;

  IOAllowPowerChange(v7, notificationID);
}

void sub_100016B68(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3 = (unint64_t)&a2[a3];
  int v4 = a2 + 8;
  if (a2 + 8 < &a2[a3])
  {
    long long v5 = a2;
    do
    {
      int v7 = *(_DWORD *)v5;
      if (!*(_DWORD *)v5) {
        return;
      }
      unint64_t v8 = *((unsigned int *)v5 + 1);
      if (v3 - (unint64_t)v4 < v8) {
        return;
      }
      switch(v7)
      {
        case 3:
          goto LABEL_9;
        case 2:
          if (v8 >= 4 && v8 - 4 >= v5[10] + (unint64_t)v5[11])
          {
            int v12 = (unsigned __int8 *)sub_10000B6D4((uint64_t)v4);
            if (v12) {
              sub_10000B734(a1, v12);
            }
          }
          break;
        case 1:
LABEL_9:
          if (v8 >= 0x20 && v8 - 32 != strnlen((const char *)v5 + 40, v8 - 32))
          {
            if (v7 == 1)
            {
              *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v14[0] = v9;
              v14[1] = v9;
              uuid_copy((unsigned __int8 *)v14 + 14, v4);
              uint64_t v10 = *((void *)v5 + 3);
              uint64_t v11 = *((void *)v5 + 4);
              DWORD2(v14[0]) = v10;
              WORD6(v14[0]) = WORD2(v10);
              *(void *)&v14[0] = v11;
              sub_10000C764(a1, (uint64_t)v14);
            }
            else
            {
              sub_10000C91C(a1, (uint64_t *)v4);
            }
            sub_10000C24C(v4, (const char *)v5 + 40, 0, 1);
          }
          break;
      }
      uint64_t v13 = (*((_DWORD *)v5 + 1) + 7) & 0xFFFFFFF8;
      if (__CFADD__(v4, v13)) {
        __break(0x5513u);
      }
      long long v5 = &v4[v13];
      v4 += v13 + 8;
    }
    while ((unint64_t)v4 < v3);
  }
}

void sub_100016D1C(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleExecLoadAddress");
  CFDataRef v6 = (const __CFData *)CFDictionaryGetValue(theDict, @"OSBundleTextUUID");
  CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleExecLoadSize");
  if (Value)
  {
    if (v6)
    {
      CFNumberRef v8 = v7;
      if (v7)
      {
        unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
        if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
        {
          *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v12[0] = v9;
          v12[1] = v9;
          DWORD2(v12[0]) = valuePtr;
          WORD6(v12[0]) = WORD2(valuePtr);
          BytePtr = CFDataGetBytePtr(v6);
          uuid_copy((unsigned __int8 *)((unint64_t)v12 | 0xE), BytePtr);
          CFNumberGetValue(v8, kCFNumberSInt64Type, v12);
          sub_10000C764(a3, (uint64_t)v12);
        }
      }
    }
  }
}

BOOL sub_100016E34(id a1, char **a2, unint64_t *a3)
{
  *a2 = 0;
  *a3 = 0;
  return byte_10003E808 & 1;
}

uint64_t sub_100016E4C(uint64_t a1)
{
  return 1;
}

void sub_100016E68(uint64_t a1)
{
  if (qword_10003E868 != -1) {
    dispatch_once_f(&qword_10003E868, 0, (dispatch_function_t)sub_100017244);
  }
  if (!dispatch_get_specific(off_100030380))
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 0x40000000;
    v2[2] = sub_100016F58;
    v2[3] = &unk_10002D5F0;
    v2[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_10003E870, v2);
  }
}

uint64_t sub_100016F58(uint64_t a1)
{
  mach_port_t v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E870);
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, 18);
  v7.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)CFNumberRef v8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.tm_mon = v2;
  *(_OWORD *)&v7.int tm_isdst = v2;
  *(_OWORD *)&v7.tm_sec = v2;
  time_t v6 = time(0);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  unint64_t v3 = getprogname();
  pid_t v4 = getpid();
  uint64_t result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v8, v3, v4, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400)
    {
      if ((unint64_t)__b >= 0xFFFFFFFFFFFFFC02)
      {
        __break(0x5513u);
        return result;
      }
      __b[1022] = 10;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E870);
    sub_1000170A8();
    uint64_t result = dword_100030388;
    if ((dword_100030388 & 0x80000000) == 0)
    {
      _os_trace_write();
      return sub_100017104();
    }
  }
  return result;
}

void sub_1000170A8()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E870);
  if (dword_100030388 < 0)
  {
    sub_1000171DC();
    if ((dword_100030388 & 0x80000000) == 0)
    {
      sub_100017104();
    }
  }
}

uint64_t sub_100017104()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E870);
  off_t v0 = lseek(dword_100030388, 0, 2);
  uint64_t result = fsync(dword_100030388);
  if (v0 >= 0x100000)
  {
    if (close(dword_100030388) == -1)
    {
      int v3 = *__error();
      uint64_t result = *__error();
      if (v3 == 9)
      {
        qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100031F78 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    rename((const std::__fs::filesystem::path *)qword_10003E880, (const std::__fs::filesystem::path *)qword_10003E888, v2);
    return sub_1000171DC();
  }
  return result;
}

uint64_t sub_1000171DC()
{
  uint64_t result = open((const char *)qword_10003E880, 778, 420);
  dword_100030388 = result;
  if ((result & 0x80000000) == 0)
  {
    uid_t v1 = dword_100031F0C;
    gid_t v2 = unk_100031F10;
    return fchown(result, v1, v2);
  }
  return result;
}

int *sub_100017244()
{
  asprintf((char **)&qword_10003E878, "com.apple.%s.log", "logd");
  if (!qword_10003E878)
  {
    uint64_t v1 = *__error();
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_100031F78 = v1;
    __break(1u);
LABEL_10:
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_100031F78 = v2;
    __break(1u);
    return result;
  }
  qword_10003E870 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_10003E878, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)qword_10003E870, off_100030380, (void *)qword_10003E870, 0);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  asprintf((char **)&qword_10003E880, "%s/%s.0.log", (const char *)qword_10003E998, "logd");
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  uint64_t result = (int *)asprintf((char **)&qword_10003E888, "%s/%s.1.log", (const char *)qword_10003E998, "logd");
  if (!qword_10003E880 || !qword_10003E888) {
    goto LABEL_10;
  }
  return result;
}

void sub_1000173BC()
{
  if (qword_10003E868 != -1) {
    dispatch_once_f(&qword_10003E868, 0, (dispatch_function_t)sub_100017244);
  }
  off_t v0 = qword_10003E870;

  dispatch_sync(v0, &stru_10002D630);
}

void sub_100017428()
{
  sub_10001747C();
  mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_10002D670);
  xpc_connection_activate(mach_service);
  qword_10003E890 = (uint64_t)mach_service;
}

void sub_10001747C()
{
  _os_trace_atm_diagnostic_config();
  int is_development_build = _os_trace_is_development_build();
  int v1 = (is_development_build & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x8000000) == 0;
  memset(__b, 170, sizeof(__b));
  uint64_t v2 = (const char *)_os_trace_prefsdir_path();
  if (snprintf(__b, 0x400uLL, "%s/%s.plist", v2, "com.apple.system.logging") >= 1024) {
    _os_assumes_log();
  }
  os_unfair_lock_lock_with_options();
  plist_at = (void *)_os_trace_read_plist_at();
  if (!plist_at)
  {
    int v13 = 0;
    int v6 = is_development_build;
    goto LABEL_23;
  }
  pid_t v4 = plist_at;
  BOOL v5 = xpc_dictionary_get_BOOL(plist_at, "Enable-Logging");
  int v6 = is_development_build | v5;
  is_development_build |= xpc_dictionary_get_BOOL(v4, "Enable-Private-Data");
  xpc_object_t value = xpc_dictionary_get_value(v4, "Privacy-Enable-Level");
  if (!value) {
    goto LABEL_12;
  }
  CFNumberRef v8 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_string) {
    goto LABEL_12;
  }
  string_ptr = xpc_string_get_string_ptr(v8);
  if (strcasecmp(string_ptr, "Sensitive"))
  {
    if (!strcasecmp(string_ptr, "Private")) {
      int is_development_build = 1;
    }
LABEL_12:
    int v10 = 1;
    goto LABEL_13;
  }
  int v10 = 0;
  int is_development_build = 1;
LABEL_13:
  v1 |= v5;
  xpc_object_t v11 = xpc_dictionary_get_value(v4, "Privacy-Set-Level");
  if (v11)
  {
    int v12 = v11;
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_string)
    {
      size_t v17 = xpc_string_get_string_ptr(v12);
      if (!strcasecmp(v17, "Sensitive"))
      {
        xpc_release(v4);
        unsigned int v15 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
        if (v1) {
          int v16 = 0;
        }
        else {
          int v16 = 1024;
        }
        int v13 = 0x2000000;
        goto LABEL_27;
      }
      if (!strcasecmp(v17, "Private"))
      {
        int is_development_build = 1;
      }
      else if (!strcasecmp(v17, "Public"))
      {
        xpc_release(v4);
        int v13 = 0;
        int v14 = 0;
        unsigned int v15 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
        if (v1) {
          int v16 = 0;
        }
        else {
          int v16 = 1024;
        }
        goto LABEL_28;
      }
    }
  }
  xpc_release(v4);
  if (v10)
  {
    int v13 = 0;
    int v14 = 0;
    unsigned int v15 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
    if (v1) {
      int v16 = 0;
    }
    else {
      int v16 = 1024;
    }
    if ((is_development_build & 1) == 0) {
      goto LABEL_28;
    }
LABEL_27:
    int v14 = 0x1000000;
    goto LABEL_28;
  }
  int v13 = 0x2000000;
LABEL_23:
  int v14 = 0;
  unsigned int v15 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
  if (v1) {
    int v16 = 0;
  }
  else {
    int v16 = 1024;
  }
  if (is_development_build) {
    goto LABEL_27;
  }
LABEL_28:
  if ((v14 | v16 | v13 | v15) != MEMORY[0xFFFFFC104]) {
    _os_trace_set_diagnostic_flags();
  }
  if (byte_10003E89C != v6) {
    byte_10003E89C = v6;
  }
  os_unfair_lock_unlock(&stru_10003E898);
}

void sub_1000177E4(_xpc_connection_s *a1, void *a2)
{
  memset(__b, 170, sizeof(__b));
  pid_t pid = xpc_connection_get_pid(a1);
  if (proc_pidpath(pid, __b, 0x400u) <= 0) {
    strcpy((char *)__b, "<unknown>");
  }
  memset(&v33[24], 170, 0x400uLL);
  *(void *)&v33[16] = 0xAA00000000000000;
  *(void *)uint64_t v33 = &v33[24];
  *(void *)&v33[8] = 0x40000000000;
  sub_1000054CC(v33, "--- !logd flush-buffers record\n", v5, v6, v7, v8, v9, v10, v30);
  sub_1000054CC(v33, "client : %s\n", v11, v12, v13, v14, v15, v16, (char)__b);
  sub_1000054CC(v33, "time   : ", v17, v18, v19, v20, v21, v22, v31);
  time_t v23 = time(0);
  sub_100004DC4((tm *)v33, v23);
  sub_1000054CC(v33, "\n\n", v24, v25, v26, v27, v28, v29, v32);
  sub_100013074();
  if (v33[20]) {
    free(*(void **)v33);
  }
  sub_100018C04();
  __b[0] = _NSConcreteStackBlock;
  __b[1] = 0x40000000;
  __b[2] = sub_100018D24;
  __b[3] = &unk_10002DB68;
  __b[4] = &stru_10002DBE8;
  dispatch_async_and_wait((dispatch_queue_t)qword_100030398[0], &stru_10002DC28);
  ((void (*)(void *, uint64_t))__b[2])(__b, 1);
  ((void (*)(void *, uint64_t))__b[2])(__b, 2);
  ((void (*)(void *, uint64_t))__b[2])(__b, 3);
  __b[0] = _NSConcreteStackBlock;
  __b[1] = 0x40000000;
  __b[2] = sub_100018D24;
  __b[3] = &unk_10002DB68;
  __b[4] = &stru_10002DC68;
  dispatch_async_and_wait((dispatch_queue_t)off_1000303A0[2], &stru_10002DCA8);
  ((void (*)(void *, uint64_t))__b[2])(__b, 1);
  ((void (*)(void *, uint64_t))__b[2])(__b, 2);
  ((void (*)(void *, uint64_t))__b[2])(__b, 3);
  sub_100008E4C(a1, a2, 0);
}

void sub_100017A70()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "operation", 0xAuLL);
  if (qword_10003E800 != -1) {
    dispatch_once(&qword_10003E800, &stru_10002D3A8);
  }
  xpc_connection_send_message((xpc_connection_t)qword_10003E7F8, v0);

  xpc_release(v0);
}

void sub_100017AFC(_xpc_connection_s *a1, xpc_object_t original)
{
  if (qword_10003E9E8 != -1) {
    dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
  }
  if (byte_100031F3C) {
    goto LABEL_4;
  }
  uuid = xpc_dictionary_get_uuid(original, "uuid");
  if (uuid)
  {
    uint64_t v6 = (unsigned __int8 *)uuid;
    int64_t int64 = xpc_dictionary_get_int64(original, "source");
    if (int64)
    {
      sub_10000C24C(v6, 0, 0, int64);
LABEL_4:
      int v4 = 0;
      goto LABEL_9;
    }
  }
  int v4 = 22;
LABEL_9:

  sub_100008E4C(a1, original, v4);
}

void sub_100017BC4(_xpc_connection_s *a1, void *a2)
{
  dispatch_sync((dispatch_queue_t)qword_10003E938, &stru_10002DF68);

  sub_100008E4C(a1, a2, 0);
}

void sub_100017C18(_xpc_connection_s *a1, void *a2)
{
  dispatch_sync((dispatch_queue_t)qword_10003E938, &stru_10002DF48);
  memset(&v4[15], 170, 0x3F1uLL);
  strcpy(v4, "writes blocked");
  sub_100016E68((uint64_t)v4);

  sub_100008E4C(a1, a2, 0);
}

void sub_100017CDC(_xpc_connection_s *a1, void *a2)
{
  if (!xpc_connection_get_euid(a1))
  {
    if (qword_10003E7E8 != -1) {
      dispatch_once(&qword_10003E7E8, &stru_10002D2E0);
    }
    dispatch_sync((dispatch_queue_t)qword_10003E7F0, &stru_10002D1A0);
    uint64_t uint64 = xpc_dictionary_get_uint64(a2, "purge");
    uint64_t v5 = uint64;
    if (uint64)
    {
      sub_100018FD8((uint64_t)qword_100030398);
      sub_100018FD8((uint64_t)&unk_100030D58);
      sub_100018FD8((uint64_t)&unk_100031238);
      if ((v5 & 2) == 0)
      {
LABEL_9:
        if ((v5 & 4) == 0) {
          goto LABEL_10;
        }
        goto LABEL_15;
      }
    }
    else if ((uint64 & 2) == 0)
    {
      goto LABEL_9;
    }
    sub_100018FD8((uint64_t)&unk_100030878);
    if ((v5 & 4) == 0)
    {
LABEL_10:
      if ((v5 & 0x10) != 0) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
LABEL_15:
    sub_100018FD8((uint64_t)&unk_100031718);
    if ((v5 & 0x10) != 0) {
LABEL_11:
    }
      sub_10001AAF0();
LABEL_12:
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "All logs erased (mask:%llx)", v5);
    sub_100016E68((uint64_t)__b);
    sub_100008E4C(a1, a2, 0);
    return;
  }

  sub_100008E4C(a1, a2, 1);
}

void sub_100017E84(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    sub_100008E4C(a1, xdict, 22);
    return;
  }
  uint64_t v5 = uint64;
  memset(__b, 170, sizeof(__b));
  if (~(unint64_t)qword_10002D710 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_13;
  }
  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_13:
    __break(1u);
    return;
  }
  uint64_t v6 = (const char *)qword_10002D710[v5];
  uint64_t v7 = (const char *)_os_trace_prefsdir_path();
  if (snprintf(__b, 0x400uLL, "%s/%s", v7, v6) >= 1024) {
    _os_assumes_log();
  }
  dispatch_suspend((dispatch_object_t)qword_10003E948);
  removefile(__b, 0, 3u);
  if (v5 == 1) {
    sub_10001747C();
  }
  sub_100008EC8();
  sub_100008E4C(a1, xdict, 0);
}

void sub_100017FFC(id a1)
{
  qword_10003E8D0 = (uint64_t)dispatch_queue_create("com.apple.logd.syslog", 0);
}

void sub_100018028()
{
  if (qword_10003E8C8 != -1) {
    dispatch_once(&qword_10003E8C8, &stru_10002D810);
  }
  xpc_object_t v0 = qword_10003E8D0;

  dispatch_async_and_wait(v0, &stru_10002D7D0);
}

void sub_100018084(id a1)
{
  size_t cnt = 0xAAAAAAAAAAAAAAAALL;
  fds = (int *)0xAAAAAAAAAAAAAAAALL;
  word_10003E8B8 = -1;
  os_map_str_init();
  if (launch_activate_socket("BSDSystemLogger", &fds, &cnt))
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Failed to open syslog socket: %d");
LABEL_6:
    sub_100016E68((uint64_t)__b);
    return;
  }
  if (cnt != 1)
  {
    if (!cnt)
    {
      memset(&__b[2], 170, 0x3E0uLL);
      strcpy((char *)__b, "Syslog socket fd array is empty");
      goto LABEL_6;
    }
    _os_assumes_log();
  }
  uintptr_t v1 = *fds;
  free(fds);
  if ((v1 & 0x80000000) != 0)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Invalid syslog socket fd: %d");
    goto LABEL_6;
  }
  uint64_t v7 = 0x20000;
  if (setsockopt(v1, 0xFFFF, 4098, &v7, 8u) == -1)
  {
    __error();
    _os_assumes_log();
    if (close(v1) != -1) {
      return;
    }
    LODWORD(v1) = *__error();
    uint64_t v2 = *__error();
    if (v1 != 9) {
      goto LABEL_21;
    }
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v2;
    __break(1u);
LABEL_19:
    __error();
    _os_assumes_log();
    if (close(v1) != -1) {
      return;
    }
    int v3 = *__error();
    uint64_t v4 = *__error();
    if (v3 == 9)
    {
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = v4;
      __break(1u);
      return;
    }
LABEL_21:
    _os_assumes_log();
    return;
  }
  if (fcntl(v1, 4, 4) == -1) {
    goto LABEL_19;
  }
  if (qword_10003E8C8 != -1) {
    dispatch_once(&qword_10003E8C8, &stru_10002D810);
  }
  qword_10003E8C0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v1, 0, (dispatch_queue_t)qword_10003E8D0);
  *(void *)&__b[0] = _NSConcreteStackBlock;
  *((void *)&__b[0] + 1) = 0x40000000;
  *(void *)&__b[1] = sub_1000082B8;
  *((void *)&__b[1] + 1) = &unk_10002D830;
  LODWORD(__b[2]) = v1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003E8C0, __b);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_1000183CC;
  handler[3] = &unk_10002D850;
  int v6 = v1;
  dispatch_source_set_cancel_handler((dispatch_source_t)qword_10003E8C0, handler);
  dispatch_resume((dispatch_object_t)qword_10003E8C0);
  byte_10003E89D = 1;
}

uint64_t sub_1000183CC(uint64_t a1)
{
  uint64_t result = close(*(_DWORD *)(a1 + 32));
  if (result == -1)
  {
    int v2 = *__error();
    uint64_t result = *__error();
    if (v2 == 9)
    {
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = result;
      __break(1u);
    }
    else
    {
      return _os_assumes_log();
    }
  }
  return result;
}

void sub_100018440()
{
}

void sub_10001852C()
{
  if (qword_10003E9E8 != -1) {
    dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
  }
  if (byte_100031F3C)
  {
    uint64_t v1 = 0;
    int v2 = (unsigned __int8 *)&v1;
    uint64_t v3 = 0x2800000000;
    v4[0] = 0xAAAAAAAAAAAAAAAALL;
    v4[1] = 0xAAAAAAAAAAAAAAAALL;
    sub_1000259C0((unsigned __int8 *)v4);
    if (!sub_100012644(v2 + 24))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100018694;
      block[3] = &unk_10002D878;
      void block[4] = &v1;
      dispatch_async((dispatch_queue_t)qword_10003E8E8, block);
    }
    _Block_object_dispose(&v1, 8);
  }
  else
  {
    sub_10000C24C(byte_10003E809, 0, 0, 2);
  }
}

void sub_100018694(uint64_t a1)
{
  uint64_t v1 = (const unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "operation", 3uLL);
  xpc_dictionary_set_uuid(v2, "uuid", v1);
  sub_100004124(v2, 1);

  xpc_release(v2);
}

void sub_100018714(uint64_t a1)
{
  uint64_t v1 = (const unsigned __int8 *)(a1 + 32);
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "operation", 1uLL);
  xpc_dictionary_set_uuid(v2, "uuid", v1);
  LODWORD(v1) = sub_100004124(v2, 1);
  xpc_release(v2);
  if (v1) {
    _os_assumes_log();
  }
}

void sub_100018794()
{
  xpc_object_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  qword_10003E8E8 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.uuid.harvest", v0, 0);
  operator new();
}

void sub_1000188AC()
{
  CFArrayRef v0 = CFArrayCreate(kCFAllocatorDefault, (const void **)&off_100030390, 1, &kCFTypeArrayCallBacks);
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFDictionaryRef v2 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
    if (v2)
    {
      CFDictionaryRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      if (v4 == CFDictionaryGetTypeID()) {
        CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_10001896C, 0);
      }
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

CFDataRef sub_10001896C(int a1, CFDictionaryRef theDict)
{
  CFDataRef result = (const __CFData *)CFDictionaryGetValue(theDict, @"OSBundleTextUUID");
  if (result)
  {
    CFDataRef v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    CFDataRef result = (const __CFData *)CFDataGetTypeID();
    if ((const __CFData *)v4 == result)
    {
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v3);
      return (const __CFData *)sub_10000C24C(BytePtr, 0, 0, 258);
    }
  }
  return result;
}

void sub_1000189E4()
{
  qword_10003E8F0 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.logd.eventlog", 0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.logd.events", (dispatch_queue_t)qword_10003E8F0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_10002D960);
  xpc_connection_activate(mach_service);
  qword_10003E8F8 = (uint64_t)mach_service;
}

void sub_100018A50(int a1, xpc_object_t original)
{
  xpc_object_t reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    CFDataRef v3 = reply;
    uint64_t v6 = 0;
    uint64_t v7 = &v6;
    uint64_t v8 = 0x2020000000;
    uint64_t v9 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001A8E8;
    void v5[3] = &unk_10002DE30;
    v5[4] = &v6;
    dispatch_async_and_wait((dispatch_queue_t)qword_10003E938, v5);
    uint64_t v4 = v7[3];
    _Block_object_dispose(&v6, 8);
    xpc_dictionary_set_uint64(v3, "device_salt", v4);
    xpc_dictionary_send_reply();
    xpc_release(v3);
  }
}

uint64_t sub_100018B8C(int a1, xpc_object_t xdict)
{
  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  string = xpc_dictionary_get_string(xdict, "path");

  return sub_10000C24C(uuid, string, xdict, 1);
}

uint64_t sub_100018C04()
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 0x40000000;
  CFDictionaryRef v2 = sub_100018D24;
  CFDataRef v3 = &unk_10002DB68;
  uint64_t v4 = &stru_10002DA30;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100018D6C;
  block[3] = &unk_10002DB88;
  void block[4] = qword_100030398;
  dispatch_async((dispatch_queue_t)qword_100030398[0], block);
  sub_100018D24((uint64_t)v1, 1u);
  v2((uint64_t)v1, 2u);
  return v2((uint64_t)v1, 3u);
}

uint64_t sub_100018D24(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    __break(0x5512u);
  }
  else if (1248 * (unint64_t)a2 <= ~(unint64_t)&qword_100030398)
  {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  __break(0x5513u);
  return result;
}

void sub_100018D6C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)v1);
  sub_100010A08(v1);
  CFDictionaryRef v2 = *(NSObject **)(*(void *)(v1 + 8) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100018E28;
  v3[3] = &unk_10002DBA8;
  v3[4] = v1;
  dispatch_async(v2, v3);
}

void sub_100018E28(uint64_t a1)
{
}

void sub_100018E40(id a1, logd_buffer_info_s *a2)
{
  var0 = a2->var0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100018D6C;
  v3[3] = &unk_10002DB88;
  v3[4] = a2;
  dispatch_async(var0, v3);
}

void sub_100018EE0(id a1, logd_buffer_info_s *a2)
{
}

void sub_100018EF8(id a1, logd_buffer_info_s *a2)
{
}

uint64_t sub_100018F08(uint64_t result)
{
  int v1 = result;
  CFDictionaryRef v2 = qword_100030398;
  uint64_t v3 = 5;
  while (1)
  {
    unint64_t v4 = *((unsigned __int8 *)v2 + 1240);
    if (v4 >= 5) {
      break;
    }
    CFDataRef result = (uint64_t)sub_100008F44(qword_100027D10[v4]);
    *CFDictionaryRef v2 = result;
    if (v1) {
      *((_DWORD *)v2 + 311) |= 1u;
    }
    unint64_t v5 = *((unsigned __int8 *)v2 + 1240);
    if (v5 > 4) {
      goto LABEL_10;
    }
    if (~(unint64_t)dword_100027CF8 < 4 * v5) {
      goto LABEL_11;
    }
    CFDataRef result = sub_100003558((uint64_t)v2, dword_100027CF8[v5]);
    v2 += 156;
    if (!--v3) {
      return result;
    }
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Nope";
  qword_100031F78 = v4;
  __break(1u);
LABEL_10:
  __break(0x5512u);
LABEL_11:
  __break(0x5513u);
  return result;
}

void sub_100018FD8(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3002000000;
  uint64_t v8 = sub_1000190E4;
  uint64_t v9 = sub_1000190F4;
  uint64_t v10 = 0;
  int v1 = *(NSObject **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  void v4[2] = sub_100019100;
  v4[3] = &unk_10002DB40;
  v4[5] = a1;
  v4[6] = v2;
  v4[4] = &v5;
  dispatch_sync(v1, v4);
  uint64_t v3 = (void *)v6[5];
  if (v3)
  {
    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    _Block_release((const void *)v6[5]);
  }
  _Block_object_dispose(&v5, 8);
}

void sub_1000190E4(uint64_t a1, uint64_t a2)
{
}

void sub_1000190F4(uint64_t a1)
{
}

void sub_100019100(void *a1)
{
  uint64_t v2 = a1[5];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)v2);
  int v3 = *(_DWORD *)(v2 + 1128);
  *(_DWORD *)(v2 + 1128) = -1;
  if (mach_get_times()) {
    _os_assumes_log();
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100019224;
  void v5[3] = &unk_10002DB18;
  int v8 = v3;
  uint64_t v4 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = v4;
  if (v6)
  {
    *(void *)(*(void *)(a1[4] + 8) + 4sub_100024C38(qword_10003E7A8, 0) = dispatch_block_create((dispatch_block_flags_t)0, v5);
    dispatch_async(*(dispatch_queue_t *)(a1[6] + 16), *(dispatch_block_t *)(*(void *)(a1[4] + 8) + 40));
  }
  else
  {
    sub_100019224((uint64_t)v5);
  }
}

void sub_100019224(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_14;
  }
  memset(__b, 170, sizeof(__b));
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  snprintf((char *)__b, 0x400uLL, "%s/%s", (const char *)qword_10003E998, *(const char **)(v2 + 8));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  sub_100002EBC(v2);
  *(void *)(v2 + 56) = 0;
  *(_DWORD *)(v2 + 64) = 0;
  removefile((const char *)__b, 0, 3u);
  int v29 = -1442840576;
  uint64_t v26 = v31;
  uint64_t v28 = 1024;
  memset(&v31[1], 170, 0x3F0uLL);
  v31[0] = *(_OWORD *)"--- !logd erase\n";
  if ((unint64_t)v31 >= 0xFFFFFFFFFFFFFFF0) {
    goto LABEL_29;
  }
  *(void *)&v31[1] = 0x203A2020656D6974;
  unsigned int v27 = 24;
  if ((unint64_t)v31 >= 0xFFFFFFFFFFFFFFE8) {
    goto LABEL_29;
  }
  BYTE8(v31[1]) = 0;
  time_t v3 = time(0);
  sub_100004DC4((tm *)&v26, v3);
  sub_1000054CC(&v26, "\npath  : %s\n", v4, v5, v6, v7, v8, v9, (char)__b);
  char __src = 10;
  char v10 = v29;
  if ((v29 & 2) != 0) {
    goto LABEL_12;
  }
  char v11 = BYTE2(v29);
  unsigned int v12 = v27;
  if (SBYTE2(v29) + v28 - 1 != v27)
  {
    uint64_t v13 = v26;
    unint64_t v14 = ~(unint64_t)v26;
    if (~(unint64_t)v26 >= v27)
    {
      *((unsigned char *)v26 + v27) = 10;
      uint64_t v15 = v12 + 1;
      unsigned int v27 = v15;
      if (v11) {
        goto LABEL_12;
      }
      if (v14 >= v15)
      {
        v13[v15] = 0;
        goto LABEL_12;
      }
    }
LABEL_29:
    __break(0x5513u);
  }
  sub_1000095FC((uint64_t)&v26, &__src, 1uLL);
  char v10 = v29;
LABEL_12:
  sub_100013074();
  if (v10) {
    free(v26);
  }
LABEL_14:
  unsigned int v16 = *(_DWORD *)(a1 + 48);
  if (v16 != -1) {
    sub_1000114FC(*(void *)(a1 + 40), v16);
  }
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = v17;
  if (*(int *)(v17 + 1172) >= 1)
  {
    int v19 = 0;
    do
      sub_100011818(*(void *)(a1 + 40), v19++);
    while (v19 < *(_DWORD *)(v17 + 1172));
    uint64_t v18 = *(void *)(a1 + 40);
  }
  *(_DWORD *)(v17 + 1168) = 0;
  uint64_t v20 = *(void *)(v18 + 8);
  if (v20) {
    uint64_t v21 = (dispatch_queue_t *)(v20 + 16);
  }
  else {
    uint64_t v21 = (dispatch_queue_t *)v18;
  }
  dispatch_assert_queue_V2(*v21);
  if (*(unsigned __int8 *)(v18 + 1240) <= 4u)
  {
    __b[0] = _NSConcreteStackBlock;
    __b[1] = 0x40000000;
    __b[2] = sub_1000151CC;
    __b[3] = &unk_10002D120;
    __b[4] = v18;
    sub_100007F5C((uint64_t)__b);
    uint64_t v22 = (rb_tree_t *)(v18 + 1176);
    time_t v23 = rb_tree_iterate((rb_tree_t *)(v18 + 1176), 0, 1u);
    if (v23)
    {
      uint64_t v24 = v23;
      do
      {
        uint64_t v25 = rb_tree_iterate(v22, v24, 1u);
        rb_tree_remove_node(v22, v24);
        free(v24);
        uint64_t v24 = v25;
      }
      while (v25);
    }
  }
}

void sub_100019548()
{
  CFArrayRef v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.power_button_queue", v0);
  uint64_t v2 = (void *)qword_10003E908;
  qword_10003E908 = (uint64_t)v1;

  time_t v3 = qword_10003E908;

  dispatch_async(v3, &stru_10002DD88);
}

void sub_1000195BC(id a1)
{
  qword_10003E928 = IOHIDEventSystemClientCreateWithType();
  if (qword_10003E928)
  {
    v2[0] = @"PrimaryUsagePage";
    v2[1] = @"PrimaryUsage";
    v3[0] = &off_10002EF78;
    v3[1] = &off_10002EF90;
    dispatch_queue_t v1 = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
    IOHIDEventSystemClientSetMatching();
    IOHIDEventSystemClientSetDispatchQueue();
    IOHIDEventSystemClientRegisterEventBlock();
    IOHIDEventSystemClientActivate();
  }
  else
  {
    memset(&v4[43], 170, 0x3D5uLL);
    strcpy(v4, "Failed to create an IOHIDEventSystemClient");
    sub_100016E68((uint64_t)v4);
  }
}

void sub_1000196F8(id a1, void *a2, void *a3, void *a4, __IOHIDEvent *a5)
{
  if (IOHIDEventGetType() != 3) {
    return;
  }
  if (IOHIDEventGetIntegerValue() != 12) {
    return;
  }
  IntegerCFNumberRef Value = IOHIDEventGetIntegerValue();
  if ((unint64_t)(IntegerValue - 233) >= 2 && IntegerValue != 64 && IntegerValue != 48) {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E908);
  v39[4] = xmmword_100027D78;
  v39[5] = unk_100027D88;
  memset(&v39[6], 0, 32);
  v39[0] = xmmword_100027D38;
  v39[1] = unk_100027D48;
  v39[2] = xmmword_100027D58;
  v39[3] = unk_100027D68;
  uint64_t v6 = qword_10003E918;
  if (qword_10003E918)
  {
    unint64_t v7 = ~(unint64_t)v39;
    if (~(unint64_t)v39 < 32 * (qword_10003E918 - 1)) {
      goto LABEL_63;
    }
    uint64_t v8 = *(void *)&v39[2 * qword_10003E918 - 2];
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v7 = ~(unint64_t)v39;
  }
  if (v7 < 32 * qword_10003E918) {
    goto LABEL_63;
  }
  uint64_t v9 = &v39[2 * qword_10003E918];
  uint64_t v10 = *(void *)v9;
  char v11 = *((unsigned char *)v9 + 8);
  double v12 = *((double *)v9 + 2);
  double v13 = *((double *)v9 + 3);
  uint64_t v14 = IOHIDEventGetIntegerValue();
  uint64_t v15 = IOHIDEventGetIntegerValue();
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (v14 != v10)
  {
    if (v14 != v8) {
      goto LABEL_46;
    }
    int v22 = ((v11 & 1) == 0) ^ (v15 == 0);
    goto LABEL_24;
  }
  int v17 = v15 == 0;
  double v18 = (double)(unint64_t)TimeStamp * 41.6666667 / 1000000000.0 - *(double *)&qword_10003E910;
  if (v6 <= 0) {
    double v18 = 0.0;
  }
  int v19 = (v11 & 1) == 0;
  if (v19 == v17 || (v18 >= v12 ? (BOOL v20 = v18 < v13) : (BOOL v20 = 0), !v20))
  {
    int v22 = v19 ^ v17;
LABEL_24:
    if (v22) {
      unint64_t v21 = 0;
    }
    else {
      unint64_t v21 = v6;
    }
    goto LABEL_27;
  }
  *(double *)&qword_10003E910 = (double)(unint64_t)TimeStamp * 41.6666667 / 1000000000.0;
  unint64_t v21 = v6 + 1;
LABEL_27:
  if (v21) {
    BOOL v23 = v21 == qword_10003E918;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23) {
    goto LABEL_46;
  }
  if (__CFADD__(v39, 32 * v21))
  {
LABEL_63:
    __break(0x5513u);
LABEL_64:
    __break(0x5500u);
    goto LABEL_65;
  }
  if (v21 > 3)
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(0x5505u);
    return;
  }
  uint64_t v24 = &v39[2 * v21];
  if (*(void *)v24) {
    BOOL v25 = 0;
  }
  else {
    BOOL v25 = *((unsigned char *)v24 + 8) == 0;
  }
  if (v25)
  {
    double v26 = *((double *)v24 + 3);
    if (fabs(v26) + fabs(*((double *)v24 + 2)) < 0.01)
    {
      sub_100019B70();
      qword_10003E918 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    double v26 = *((double *)&v39[2 * v21 + 1] + 1);
  }
  qword_10003E918 = v21;
  double v27 = v26 * 1000000000.0;
  if (v26 * 1000000000.0 <= -9.22337204e18 || v27 >= 9.22337204e18) {
    goto LABEL_66;
  }
  dispatch_time_t v29 = dispatch_time(0, (uint64_t)v27);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019B54;
  block[3] = &unk_10002E448;
  void block[4] = v21;
  dispatch_after(v29, (dispatch_queue_t)qword_10003E908, block);
LABEL_46:
  if (!IOHIDEventGetIntegerValue())
  {
    byte_10003E920 = 0;
    return;
  }
  if (__OFADD__(dword_10003E930, 1)) {
    goto LABEL_64;
  }
  ++dword_10003E930;
  uint64_t v30 = IOHIDEventGetIntegerValue();
  if (v30 == 64)
  {
    int v31 = byte_10003E920 | 2;
  }
  else
  {
    if (v30 != 48)
    {
      int v31 = byte_10003E920;
      goto LABEL_55;
    }
    int v31 = byte_10003E920 | 1;
  }
  byte_10003E920 = v31;
LABEL_55:
  if (v31 == 3)
  {
    dispatch_time_t v32 = dispatch_time(0, 200000000);
    dispatch_after(v32, (dispatch_queue_t)qword_10003E908, &stru_10002DDE8);
    int v31 = byte_10003E920;
  }
  if ((v31 & (v31 - 1)) == 0 && v31 != 0)
  {
    int v34 = dword_10003E930;
    dispatch_time_t v35 = dispatch_time(0, 5000000000);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100019C04;
    v36[3] = &unk_10002DE08;
    int v37 = v34;
    dispatch_after(v35, (dispatch_queue_t)qword_10003E908, v36);
  }
}

uint64_t sub_100019B54(uint64_t result)
{
  if (qword_10003E918 == *(void *)(result + 32)) {
    qword_10003E918 = 0;
  }
  return result;
}

uint64_t sub_100019B70()
{
  memset(&v1[23], 170, 0x3E9uLL);
  strcpy(v1, "flush for power button");
  sub_100016E68((uint64_t)v1);
  notify_post("com.apple.system.logging.power_button_notification");
  return sub_100018C04();
}

uint64_t sub_100019C04(uint64_t result)
{
  BOOL v1 = (byte_10003E920 & (byte_10003E920 - 1)) != 0 || byte_10003E920 == 0;
  if (!v1 && *(_DWORD *)(result + 32) == dword_10003E930) {
    byte_10003E920 = 0;
  }
  return result;
}

void sub_100019C38(id a1)
{
  if (byte_10003E920 == 3)
  {
    sub_100019B70();
    byte_10003E920 = 0;
  }
}

void sub_100019C6C(const char *a1)
{
  memset(__b, 170, sizeof(__b));
  if (snprintf(__b, 0x400uLL, "%s/%s.plist", a1, "com.apple.logd") >= 1024) {
    _os_assumes_log();
  }
  plist_at = (void *)_os_trace_read_plist_at();
  if (plist_at)
  {
    time_t v3 = plist_at;
    sub_100019DE8(plist_at, "QuarantineLimit", (uint64_t *)&xmmword_10003E970, (xpc_type_t)&_xpc_type_uint64);
    sub_100019DE8(v3, "SuperQuaratineLimit", (uint64_t *)&xmmword_10003E970 + 1, (xpc_type_t)&_xpc_type_uint64);
    sub_100019DE8(v3, "CoalitionSize", (uint64_t *)&qword_10003E980, (xpc_type_t)&_xpc_type_uint64);
    sub_100019DE8(v3, "QuarantineRatio", (uint64_t *)&qword_10003E988, (xpc_type_t)&_xpc_type_double);
    sub_100019DE8(v3, "DisableQuarantine", (uint64_t *)&word_10003E990, (xpc_type_t)&_xpc_type_BOOL);
    sub_100019DE8(v3, "DisableSuperQuarantine", (uint64_t *)((char *)&word_10003E990 + 1), (xpc_type_t)&_xpc_type_BOOL);
    sub_100019DE8(v3, "DisableHighVolOverrides", (uint64_t *)&byte_10003E992, (xpc_type_t)&_xpc_type_BOOL);
    xpc_release(v3);
  }
}

void sub_100019DE8(void *a1, const char *a2, uint64_t *a3, xpc_type_t a4)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  xpc_type_t type = xpc_get_type(value);
  if (value && type == a4)
  {
    if (a4 == (xpc_type_t)&_xpc_type_uint64)
    {
      *a3 = xpc_uint64_get_value(value);
    }
    else if (a4 == (xpc_type_t)&_xpc_type_double)
    {
      *(double *)a3 = xpc_double_get_value(value);
    }
    else if (a4 == (xpc_type_t)&_xpc_type_BOOL)
    {
      *(unsigned char *)a3 = xpc_BOOL_get_value(value);
    }
  }
}

uint64_t sub_100019E88(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v38.st_blkmach_vm_size_t size = v9;
  *(timespec *)v38.st_qspare = v9;
  v38.st_birthtimespec = v9;
  *(timespec *)&v38.st_mach_vm_size_t size = v9;
  v38.st_mtimespec = v9;
  v38.st_ctimespec = v9;
  *(timespec *)&v38.st_uid = v9;
  v38.st_atimespec = v9;
  *(timespec *)&v38.st_dev = v9;
  *(void *)&v37[24] = 0;
  uint64_t v10 = *(void *)(a1 + 56);
  int v35 = sub_10001A108(a1);
  memset(&v37[32], 170, 0x400uLL);
  *(void *)&v37[16] = 0xAA00000000100000;
  *(void *)int v37 = &v37[32];
  *(void *)&v37[8] = 0x40000000000;
  if (a2 >= 4) {
    goto LABEL_29;
  }
  if (~(unint64_t)off_10002DFD0 < 8 * (unint64_t)a2)
  {
LABEL_27:
    __break(0x5513u);
LABEL_28:
    __break(0x5500u);
LABEL_29:
    __break(0x5512u);
  }
  sub_10001A1D4((tm *)v37, a1, (uint64_t)off_10002DFD0[a2], a3, v11, v12, v13, v14, v34);
  if (v35 < 1)
  {
    uint64_t v21 = 0;
    *(_DWORD *)(a1 + 64) = v35;
    goto LABEL_23;
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = v35;
  while (1)
  {
    if ((int)v22 <= *(_DWORD *)(a1 + 92))
    {
      if (a3 < 1) {
        break;
      }
      if (__OFSUB__(v10, v21)) {
        goto LABEL_26;
      }
      if (v10 - v21 <= a4) {
        break;
      }
    }
    if (__CFADD__(*(void *)&v37[24], v19)) {
      goto LABEL_27;
    }
    BOOL v23 = (const char *)(*(void *)(*(void *)&v37[24] + v19) + 21);
    if (fstatat(a5, v23, &v38, 32) == -1) {
      v38.st_mach_vm_size_t size = 0;
    }
    if (unlinkat(a5, v23, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    BOOL v30 = __OFADD__(v21, v38.st_size);
    v21 += v38.st_size;
    if (v30) {
      goto LABEL_28;
    }
    BOOL v30 = __OFSUB__(a3, v38.st_size);
    a3 -= v38.st_size;
    if (v30) {
      goto LABEL_26;
    }
    sub_1000054CC(v37, "    - %s/%s: %lld bytes\n", v24, v25, v26, v27, v28, v29, *(void *)(a1 + 8));
    *(void *)(a1 + 32) = sub_10001A3A8(v23);
    ++v20;
    v19 += 8;
    if (!--v22)
    {
      int v31 = v35;
      uint64_t v20 = v35;
      goto LABEL_20;
    }
  }
  int v31 = v35;
LABEL_20:
  BOOL v30 = __OFSUB__(v31, v20);
  int v32 = v31 - v20;
  if (v30)
  {
LABEL_26:
    __break(0x5515u);
    goto LABEL_27;
  }
  *(_DWORD *)(a1 + 64) = v32;
  if (v20) {
    sub_10001A440(v37, a1, v20, v21, v15, v16, v17, v18);
  }
LABEL_23:
  if (v37[20]) {
    free(*(void **)v37);
  }
  _os_trace_scandir_free_namelist();
  return v21;
}

uint64_t sub_10001A108(uint64_t a1)
{
  return _os_trace_fdscandir_b();
}

uint64_t sub_10001A1D4(tm *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v9 = a4;
  if ((a1->tm_year & 2) == 0)
  {
    uint64_t tm_hour = a1->tm_hour;
    if ((SBYTE2(a1->tm_year) + a1->tm_mday - tm_hour - 1) <= 0x16)
    {
      sub_1000095FC((uint64_t)a1, "--- !logd purge record\n", 0x17uLL);
    }
    else
    {
      if (__CFADD__(*(void *)&a1->tm_sec, tm_hour)) {
        goto LABEL_18;
      }
      qmemcpy((void *)(*(void *)&a1->tm_sec + tm_hour), "--- !logd purge record\n", 23);
      uint64_t v13 = (a1->tm_hour + 23);
      a1->uint64_t tm_hour = v13;
      if (!BYTE2(a1->tm_year))
      {
        if (__CFADD__(*(void *)&a1->tm_sec, v13)) {
          goto LABEL_18;
        }
        *(unsigned char *)(*(void *)&a1->tm_sec + v13) = 0;
      }
    }
  }
  sub_1000054CC(a1, "type  : %s %s\n", a3, a4, a5, a6, a7, a8, *(void *)(a2 + 8));
  sub_1000054CC(a1, "goal  : %lld\n", v14, v15, v16, v17, v18, v19, v9);
  sub_1000054CC(a1, "time  : ", v20, v21, v22, v23, v24, v25, v36);
  time_t v26 = time(0);
  sub_100004DC4(a1, v26);
  char __src = 10;
  if ((a1->tm_year & 2) != 0) {
    goto LABEL_13;
  }
  uint64_t v33 = a1->tm_hour;
  if (SBYTE2(a1->tm_year) + a1->tm_mday - 1 != v33)
  {
    if (!__CFADD__(*(void *)&a1->tm_sec, v33))
    {
      *(unsigned char *)(*(void *)&a1->tm_sec + v33) = 10;
      uint64_t v34 = (a1->tm_hour + 1);
      a1->uint64_t tm_hour = v34;
      if (BYTE2(a1->tm_year)) {
        goto LABEL_13;
      }
      if (!__CFADD__(*(void *)&a1->tm_sec, v34))
      {
        *(unsigned char *)(*(void *)&a1->tm_sec + v34) = 0;
        goto LABEL_13;
      }
    }
LABEL_18:
    __break(0x5513u);
  }
  sub_1000095FC((uint64_t)a1, &__src, 1uLL);
LABEL_13:

  return sub_1000054CC(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
}

unint64_t sub_10001A3A8(const char *a1)
{
  __s1 = (char *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v2 = strtoull(a1, &__s1, 16);
  if (__s1 - a1 != 16) {
    return 0;
  }
  if (!strcmp(__s1, ".tracev3")) {
    return v2;
  }
  return 0;
}

void sub_10001A440(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t add_explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)(a2 + 56), -a4, memory_order_relaxed);
  unint64_t v9 = add_explicit - a4;
  if (__OFSUB__(add_explicit, a4)) {
LABEL_16:
  }
    __break(0x5515u);
  char v10 = a4;
  sub_1000054CC(a1, "count : %d\n", a3, a4, a5, a6, a7, a8, a3);
  sub_1000054CC(a1, "size  : %lld\n", v13, v14, v15, v16, v17, v18, v10);
  int v25 = *(_DWORD *)(a2 + 64);
  BOOL v26 = *(_DWORD *)(a2 + 68) != -1;
  BOOL v27 = __OFADD__(v25, v26);
  char v28 = v25 + v26;
  if (v27 || __OFADD__(v9, *(void *)(a2 + 40)))
  {
    __break(0x5500u);
LABEL_15:
    __break(0x5513u);
    goto LABEL_16;
  }
  sub_1000054CC(a1, "kept  : %d files, %lld bytes\n", v19, v20, v21, v22, v23, v24, v28);
  char __src = 10;
  if ((*((_WORD *)a1 + 10) & 2) != 0) {
    goto LABEL_10;
  }
  uint64_t v29 = *((unsigned int *)a1 + 2);
  if (*((char *)a1 + 22) + *((_DWORD *)a1 + 3) - 1 != v29)
  {
    if (!__CFADD__(*a1, v29))
    {
      *(unsigned char *)(*a1 + v29) = 10;
      uint64_t v30 = (*((_DWORD *)a1 + 2) + 1);
      *((_DWORD *)a1 + 2) = v30;
      if (*((unsigned char *)a1 + 22)) {
        goto LABEL_10;
      }
      if (!__CFADD__(*a1, v30))
      {
        *(unsigned char *)(*a1 + v3sub_100024C38(qword_10003E7A8, 0) = 0;
        goto LABEL_10;
      }
    }
    goto LABEL_15;
  }
  sub_1000095FC((uint64_t)a1, &__src, 1uLL);
LABEL_10:

  sub_100013074();
}

char *sub_10001A5A4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 20) != 8) {
    return 0;
  }
  time_t v3 = (const char *)(a2 + 21);
  CFDataRef result = strrchr((char *)(a2 + 21), 46);
  if (!result) {
    return result;
  }
  if (strcmp(result, ".tracev3")) {
    return 0;
  }
  if (!strncmp(v3, "logdata.Persistent.", 0x13uLL)) {
    return (char *)1;
  }
  unint64_t v5 = sub_10001A3A8(v3);
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(_DWORD *)(v6 + 68);
  unint64_t v8 = *(void *)(v6 + 24);
  BOOL v9 = v8 < 2 || v7 == -1;
  uint64_t v10 = -2;
  if (v9) {
    uint64_t v10 = -1;
  }
  return (char *)(v5 - 1 < v8 + v10);
}

int sub_10001A654(id a1, const dirent **a2, const dirent **a3)
{
  int v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  int v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0)) {
    return (v5 != 0) - (v6 != 0);
  }

  return alphasort(a2, a3);
}

int *sub_10001A710(int a1, const char *a2)
{
  unint64_t v2 = a2;
  CFDataRef result = (int *)mkpathat_np(a1, a2, 0x1EDu);
  if (result && result != 17) {
    goto LABEL_17;
  }
  if (qword_10003E9B8 != -1) {
    dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
  }
  if (!byte_10003E9C0) {
    goto LABEL_12;
  }
  uint64_t v11 = 0;
  long long v10 = xmmword_100027DB8;
  uint64_t v9 = 0x4000001EDLL;
  int v5 = openat(a1, v2, 0x100000);
  if (v5 == -1)
  {
    CFDataRef result = __error();
    uint64_t v8 = *result;
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unable to open path";
    qword_100031F78 = v8;
    __break(1u);
LABEL_17:
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unable to create path";
    qword_100031F78 = (int)result;
    __break(1u);
    return result;
  }
  int v6 = v5;
  if (fsetattrlist(v5, &v10, &v9, 8uLL, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  CFDataRef result = (int *)close(v6);
  if (result == -1)
  {
    unint64_t v2 = (const char *)*__error();
    uint64_t v7 = *__error();
    if (v2 != 9) {
      return (int *)_os_assumes_log();
    }
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v7;
    __break(1u);
LABEL_12:
    CFDataRef result = (int *)fchmodat(a1, v2, 0x1EDu, 32);
    if (result != -1) {
      return result;
    }
    __error();
    return (int *)_os_assumes_log();
  }
  return result;
}

uint64_t sub_10001A8E8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_10003E940;
  return result;
}

uint64_t sub_10001A900(uint64_t a1)
{
  int v2 = openat(dword_100031BF8, *(const char **)(a1 + 8), 1048832);
  if (v2 < 0)
  {
LABEL_19:
    uint64_t v15 = *__error();
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unable to open log book";
    qword_100031F78 = v15;
    __break(1u);
  }
  int v3 = v2;
  uint64_t v4 = fdopendir(v2);
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v16.st_blkmach_vm_size_t size = v5;
  *(timespec *)v16.st_qspare = v5;
  v16.st_birthtimespec = v5;
  *(timespec *)&v16.st_mach_vm_size_t size = v5;
  v16.st_mtimespec = v5;
  v16.st_ctimespec = v5;
  *(timespec *)&v16.st_uid = v5;
  v16.st_atimespec = v5;
  *(timespec *)&v16.st_dev = v5;
  int v6 = readdir(v4);
  for (i = 0; v6; int v6 = readdir(v4))
  {
    if (v6->d_type == 8)
    {
      d_name = v6->d_name;
      uint64_t v9 = strrchr(v6->d_name, 46);
      if (v9)
      {
        if (!strcmp(v9, ".tracev3"))
        {
          if (fstatat(v3, d_name, &v16, 32) == -1)
          {
            __error();
            _os_assumes_log();
          }
          else
          {
            BOOL v10 = __OFADD__(i, v16.st_size);
            i += v16.st_size;
            if (v10) {
              goto LABEL_18;
            }
          }
          unint64_t v11 = sub_10001A3A8(d_name);
          if (v11 >= *(void *)(a1 + 24)) {
            *(void *)(a1 + 24) = v11 + 1;
          }
          int v12 = *(_DWORD *)(a1 + 64);
          BOOL v10 = __OFADD__(v12, 1);
          int v13 = v12 + 1;
          if (v10)
          {
LABEL_18:
            __break(0x5500u);
            goto LABEL_19;
          }
          *(_DWORD *)(a1 + 64) = v13;
        }
      }
    }
  }
  *(void *)(a1 + 72) = -1;
  uint64_t result = closedir(v4);
  if (result == -1)
  {
    __error();
    uint64_t result = _os_assumes_log();
  }
  *(void *)(a1 + 56) = i;
  return result;
}

uint64_t sub_10001AAB4(uint64_t a1)
{
  uint64_t result = sub_100019E88(*(void *)(a1 + 40), *(_DWORD *)(a1 + 64), *(void *)(a1 + 48), *(void *)(a1 + 56), *(_DWORD *)(a1 + 68));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10001AAF0()
{
  if (!__OFADD__(time(0), -86400))
  {
    v7[0] = 0;
    v7[1] = v7;
    void v7[2] = 0x2020000000;
    v7[3] = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v6[3] = 0;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    void v5[3] = 0;
    v4[0] = 0;
    v4[1] = v4;
    void v4[2] = 0x2020000000;
    v4[3] = 0;
    v3[0] = 0;
    v3[1] = v3;
    void v3[2] = 0x2020000000;
    v3[3] = 0;
    v2[0] = 0;
    v2[1] = v2;
    void v2[2] = 0x2020000000;
    v2[3] = 0;
    v1[0] = 0;
    v1[1] = v1;
    void v1[2] = 0x2020000000;
    v1[3] = 0;
    memset(__b, 170, sizeof(__b));
    v0[0] = 0;
    v0[1] = v0;
    v0[2] = 0x3810000000;
    v0[6] = 0xAA00000000100000;
    v0[3] = "";
    v0[4] = __b;
    v0[5] = 0x40000000000;
    _os_trace_get_boot_uuid();
    sub_100018440();
  }
  __break(0x5515u);
}

void sub_10001B2D4(uint64_t a1, uint64_t a2)
{
  sub_10000C9A8(*(void *)(a1 + 32), (uint64_t *)(a2 + 32));
  sub_10000C9A8(*(void *)(a1 + 32), (uint64_t *)(a2 + 48));
  os_unfair_lock_lock_with_options();
  if (!*(_WORD *)(a2 + 130))
  {
LABEL_5:
    lock = (os_unfair_lock_s *)(a2 + 132);
    uint64_t v7 = *(void *)(a2 + 80);
    if (!v7 || (uint64_t v8 = *(void **)(v7 + 16)) == 0)
    {
LABEL_52:
      os_unfair_lock_unlock(lock);
      return;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    BOOL v10 = (void *)(v9 + 16);
    while (1)
    {
      uint64_t v11 = v8[2];
      uint64_t v12 = v8[3];
      uint64_t v13 = v11 ^ __ROR8__(v12 + 16, 16);
      uint64_t v14 = __ROR8__(v12 + 16, 16);
      unint64_t v15 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v14 ^ ((0x9DDFEA08EB382D69 * v13) >> 47) ^ (0x9DDFEA08EB382D69 * v13))) ^ ((0x9DDFEA08EB382D69 * (v14 ^ ((0x9DDFEA08EB382D69 * v13) >> 47) ^ (0x9DDFEA08EB382D69 * v13))) >> 47))) ^ v12;
      unint64_t v16 = *(void *)(v9 + 8);
      if (v16)
      {
        uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
        v17.i16[0] = vaddlv_u8(v17);
        if (v17.u32[0] > 1uLL)
        {
          unint64_t v18 = v15;
          if (v15 >= v16) {
            unint64_t v18 = v15 % v16;
          }
        }
        else
        {
          unint64_t v18 = v15 & (v16 - 1);
        }
        uint64_t v19 = *(void **)(*(void *)v9 + 8 * v18);
        if (v19)
        {
          for (uint64_t i = (void *)*v19; i; uint64_t i = (void *)*i)
          {
            unint64_t v21 = i[1];
            if (v21 == v15)
            {
              if (i[2] == v11 && i[3] == v12) {
                goto LABEL_51;
              }
            }
            else
            {
              if (v17.u32[0] > 1uLL)
              {
                if (v21 >= v16) {
                  v21 %= v16;
                }
              }
              else
              {
                v21 &= v16 - 1;
              }
              if (v21 != v18) {
                break;
              }
            }
          }
        }
      }
      else
      {
        unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
      }
      uint64_t v23 = operator new(0x20uLL);
      *uint64_t v23 = 0;
      v23[1] = v15;
      *((_OWORD *)v23 + 1) = *((_OWORD *)v8 + 1);
      float v24 = (float)(unint64_t)(*(void *)(v9 + 24) + 1);
      float v25 = *(float *)(v9 + 32);
      if (!v16 || (float)(v25 * (float)v16) < v24)
      {
        BOOL v26 = (v16 & (v16 - 1)) != 0;
        if (v16 < 3) {
          BOOL v26 = 1;
        }
        unint64_t v27 = v26 | (2 * v16);
        unint64_t v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28) {
          size_t v29 = v28;
        }
        else {
          size_t v29 = v27;
        }
        sub_100011E3C(v9, v29);
        unint64_t v16 = *(void *)(v9 + 8);
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v15 >= v16) {
            unint64_t v18 = v15 % v16;
          }
          else {
            unint64_t v18 = v15;
          }
        }
        else
        {
          unint64_t v18 = (v16 - 1) & v15;
        }
      }
      uint64_t v30 = *(void *)v9;
      uint64_t v31 = *(void **)(*(void *)v9 + 8 * v18);
      if (v31)
      {
        *uint64_t v23 = *v31;
      }
      else
      {
        *uint64_t v23 = *v10;
        *BOOL v10 = v23;
        *(void *)(v30 + 8 * v18) = v10;
        if (!*v23) {
          goto LABEL_50;
        }
        unint64_t v32 = *(void *)(*v23 + 8);
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v32 >= v16) {
            v32 %= v16;
          }
        }
        else
        {
          v32 &= v16 - 1;
        }
        uint64_t v31 = (void *)(*(void *)v9 + 8 * v32);
      }
      *uint64_t v31 = v23;
LABEL_50:
      ++*(void *)(v9 + 24);
LABEL_51:
      uint64_t v8 = (void *)*v8;
      if (!v8) {
        goto LABEL_52;
      }
    }
  }
  unint64_t v4 = 0;
  uint64_t v5 = 14;
  while (1)
  {
    uint64_t v6 = *(void *)(a2 + 72);
    if (__CFADD__(v6, v5 - 14)) {
      break;
    }
    sub_10000C9A8(*(void *)(a1 + 32), (uint64_t *)(v6 + v5));
    ++v4;
    v5 += 32;
    if (v4 >= *(unsigned __int16 *)(a2 + 130)) {
      goto LABEL_5;
    }
  }
  __break(0x5513u);
}

void sub_10001B5C0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

void sub_10001B5CC(uint64_t a1, uint64_t a2)
{
  int v3 = strrchr((char *)(a2 + 104), 46);
  if (v3)
  {
    if (!strcmp(v3, ".tracev3"))
    {
      size_t v14 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v4 = _os_trace_mmap_at();
      if (v4)
      {
        uint64_t v5 = (char *)v4;
        size_t v6 = v14;
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        uint64_t v11 = (unsigned int (*)(void *))sub_10001BF28;
        uint64_t v12 = &unk_10002E098;
        id v13 = *(id *)(a1 + 32);
        uint64_t v7 = v10;
        unint64_t v8 = 0;
        do
        {
          if (v6 - v8 < 0x10) {
            break;
          }
          unint64_t v9 = *(void *)&v5[v8 + 8];
          if (v6 - v8 - 16 < v9) {
            break;
          }
          if (!v11(v7)) {
            break;
          }
          unint64_t v8 = (v8 + v9 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v8 - 1 < v6);

        if (munmap(v5, v14) == -1)
        {
          __error();
          _os_assumes_log();
        }
      }
    }
  }
}

tm *sub_10001B74C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), "--- !logd uuid purge records\n", a3, a4, a5, a6, a7, a8, v19);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if ((*(_WORD *)(v9 + 52) & 2) == 0)
  {
    uint64_t result = (tm *)(v9 + 32);
    uint64_t v11 = *(unsigned int *)(v9 + 40);
    if ((*(char *)(v9 + 54) + *(_DWORD *)(v9 + 44) - v11 - 1) <= 7)
    {
      sub_1000095FC((uint64_t)result, "time  : ", 8uLL);
    }
    else
    {
      if (__CFADD__(*(void *)&result->tm_sec, v11)) {
        goto LABEL_18;
      }
      *(void *)(*(void *)&result->tm_sec + v11) = 0x203A2020656D6974;
      uint64_t v12 = (*(_DWORD *)(v9 + 40) + 8);
      *(_DWORD *)(v9 + 4sub_100024C38(qword_10003E7A8, 0) = v12;
      if (!*(unsigned char *)(v9 + 54))
      {
        if (__CFADD__(*(void *)&result->tm_sec, v12)) {
          goto LABEL_18;
        }
        *(unsigned char *)(*(void *)&result->tm_sec + v12) = 0;
      }
    }
  }
  id v13 = (tm *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  time_t v14 = time(0);
  uint64_t result = sub_100004DC4(v13, v14);
  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
  if ((*(_WORD *)(v15 + 52) & 2) != 0) {
    return result;
  }
  uint64_t result = (tm *)(v15 + 32);
  uint64_t v16 = *(unsigned int *)(v15 + 40);
  if ((*(char *)(v15 + 54) + *(_DWORD *)(v15 + 44) - v16 - 1) > 8)
  {
    if (!__CFADD__(*(void *)&result->tm_sec, v16))
    {
      uint64_t v17 = *(void *)&result->tm_sec + v16;
      *(void *)uint64_t v17 = *(void *)"\nuuids :\n";
      *(unsigned char *)(v17 + 8) = 10;
      uint64_t v18 = (*(_DWORD *)(v15 + 40) + 9);
      *(_DWORD *)(v15 + 4sub_100024C38(qword_10003E7A8, 0) = v18;
      if (*(unsigned char *)(v15 + 54)) {
        return result;
      }
      if (!__CFADD__(*(void *)&result->tm_sec, v18))
      {
        *(unsigned char *)(*(void *)&result->tm_sec + v18) = 0;
        return result;
      }
    }
LABEL_18:
    __break(0x5513u);
    return result;
  }

  return (tm *)sub_1000095FC((uint64_t)result, "\nuuids :\n", 9uLL);
}

uint64_t sub_10001B8D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned __int16 *)(a2 + 88);
  switch(*(_WORD *)(a2 + 88))
  {
    case 1:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), "    - %s\n", a3, a4, a5, a6, a7, a8, *(void *)(a2 + 48));
      unint64_t v32 = *(const char **)(a2 + 48);
      uint64_t result = removefile(v32, 0, 1u);
      break;
    case 2:
    case 4:
    case 7:
    case 0xA:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t v11 = (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      uint64_t v12 = *(void *)(a2 + 48);
      strerror(*(_DWORD *)(a2 + 56));
      uint64_t result = sub_1000054CC(v11, "    - error at %s (%d:%s)\n", v13, v14, v15, v16, v17, v18, v12);
      break;
    case 3:
    case 8:
      if (unlink(*(const char **)(a2 + 48)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      uint64_t result = sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), "    - %s [default]\n", v20, v21, v22, v23, v24, v25, *(void *)(a2 + 48));
      break;
    case 0xC:
    case 0xD:
      if (*(_WORD *)(a2 + 86))
      {
        if (unlink(*(const char **)(a2 + 48)) == -1)
        {
          __error();
          _os_assumes_log();
        }
        uint64_t result = sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), "    - %s [symlink]\n", v26, v27, v28, v29, v30, v31, *(void *)(a2 + 48));
      }
      else
      {
        uint64_t result = sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), "    - root %s is a symbolic link\n", a3, a4, a5, a6, a7, a8, *(void *)(a2 + 48));
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      break;
    default:
      qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
      qword_100031F78 = v8;
      __break(1u);
      JUMPOUT(0x10001BACCLL);
  }
  return result;
}

uint64_t sub_10001BB00(uint64_t a1, uint64_t a2, unsigned __int8 *uu)
{
  if (*(_WORD *)(a2 + 88) != 8)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_19;
  }
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v6;
  *(_OWORD *)&out[16] = v6;
  uuid_unparse_upper(uu, out);
  uint64_t v7 = *(void *)(*(void *)(a2 + 96) + 96);
  if (sub_10000C5C4(*(void **)(a1 + 104), uu))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(void *)(v14 + 24);
    BOOL v16 = __OFADD__(v15, v7);
    uint64_t v17 = v15 + v7;
    if (!v16)
    {
      *(void *)(v14 + 24) = v17;
      return sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes IN USE\n", v8, v9, v10, v11, v12, v13, (char)out);
    }
LABEL_19:
    __break(0x5500u);
  }
  char v19 = *(const char **)(a2 + 48);
  uint64_t v20 = *(const void **)(a1 + 112);
  *(void *)&v45[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long value = v21;
  *(_OWORD *)uint64_t v45 = v21;
  if (getxattr(v19, "com.apple.uuiddb.boot-uuid", &value, 0x25uLL, 0, 0) == 37 && !memcmp(&value, v20, 0x25uLL))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v40 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v41 = *(void *)(v40 + 24);
    BOOL v16 = __OFADD__(v41, v7);
    uint64_t v42 = v41 + v7;
    if (v16) {
      goto LABEL_19;
    }
    *(void *)(v40 + 24) = v42;
    return sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes LOCKED\n", v22, v23, v24, v25, v26, v27, (char)out);
  }
  else if (*(void *)(*(void *)(a2 + 96) + 64) >= *(void *)(a1 + 120))
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v34 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v35 = *(void *)(v34 + 24);
    BOOL v16 = __OFADD__(v35, v7);
    uint64_t v36 = v35 + v7;
    if (v16) {
      goto LABEL_19;
    }
    *(void *)(v34 + 24) = v36;
    return sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes RECENT\n", v22, v23, v24, v25, v26, v27, (char)out);
  }
  else
  {
    uint64_t result = unlink(*(const char **)(a2 + 48));
    if (result)
    {
      if (result == -1)
      {
        __error();
        return _os_assumes_log();
      }
    }
    else
    {
      uint64_t v37 = *(void *)(*(void *)(a1 + 88) + 8);
      uint64_t v38 = *(void *)(v37 + 24);
      BOOL v16 = __OFADD__(v38, v7);
      uint64_t v39 = v38 + v7;
      if (v16) {
        goto LABEL_19;
      }
      *(void *)(v37 + 24) = v39;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
      return sub_1000054CC((void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes REMOVED\n", v28, v29, v30, v31, v32, v33, (char)out);
    }
  }
  return result;
}

void sub_10001BD70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24)) {
    return;
  }
  sub_1000054CC((void *)(*(void *)(a1[5] + 8) + 32), "files_in_use: %ld bytes: %lld\n", a3, a4, a5, a6, a7, a8, *(void *)(*(void *)(a1[6] + 8) + 24));
  sub_1000054CC((void *)(*(void *)(a1[5] + 8) + 32), "files_locked: %ld bytes: %lld\n", v9, v10, v11, v12, v13, v14, *(void *)(*(void *)(a1[8] + 8) + 24));
  sub_1000054CC((void *)(*(void *)(a1[5] + 8) + 32), "files_recent: %ld bytes: %lld\n", v15, v16, v17, v18, v19, v20, *(void *)(*(void *)(a1[10] + 8) + 24));
  uint64_t v21 = *(void *)(a1[5] + 8);
  char __src = 10;
  if ((*(_WORD *)(v21 + 52) & 2) == 0)
  {
    uint64_t v22 = (void *)(v21 + 32);
    uint64_t v23 = *(unsigned int *)(v21 + 40);
    if (*(char *)(v21 + 54) + *(_DWORD *)(v21 + 44) - 1 == v23)
    {
      sub_1000095FC((uint64_t)v22, &__src, 1uLL);
      goto LABEL_8;
    }
    if (__CFADD__(*v22, v23)) {
      goto LABEL_13;
    }
    *(unsigned char *)(*v22 + v23) = 10;
    uint64_t v24 = (*(_DWORD *)(v21 + 40) + 1);
    *(_DWORD *)(v21 + 4sub_100024C38(qword_10003E7A8, 0) = v24;
    if (!*(unsigned char *)(v21 + 54))
    {
      if (!__CFADD__(*v22, v24))
      {
        *(unsigned char *)(*v22 + v24) = 0;
        goto LABEL_8;
      }
LABEL_13:
      __break(0x5513u);
      return;
    }
  }
LABEL_8:

  sub_100013074();
}

uint64_t sub_10001BF28(uint64_t a1, _DWORD *a2)
{
  if (*a2 == 24587)
  {
    uint64_t v3 = sub_100022890(a2);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(v3 + 16);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000;
      uint64_t v10 = sub_100022654;
      uint64_t v11 = &unk_10002E618;
      uint64_t v12 = v5;
      for (uint64_t i = *(void **)(v6 + 16); i; uint64_t i = (void *)*i)
        ((void (*)(void *, void *, void))v10)(v9, i + 2, i[4]);
      sub_1000037AC(v4);
    }
  }
  return 1;
}

uint64_t sub_10001C024(void *a1, const char *a2)
{
  id v3 = a1;
  int v4 = open(a2, 1048832);
  if (v4 == -1)
  {
    __error();
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  int v5 = v4;
  uint64_t v6 = sub_100009D40(v3);
  if (close(v5) != -1)
  {
LABEL_3:

    return v6;
  }
  int v8 = *__error();
  uint64_t result = *__error();
  if (v8 != 9)
  {
LABEL_6:
    _os_assumes_log();
    goto LABEL_3;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

id sub_10001C0F0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = v4;
  if (v4)
  {
    if (v3)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      void v10[2] = sub_10001C250;
      v10[3] = &unk_10002E180;
      id v6 = v3;
      id v11 = v6;
      xpc_dictionary_apply(v5, v10);
      id v7 = v6;

      goto LABEL_7;
    }
    id v8 = v4;
  }
  else
  {
    id v8 = v3;
  }
  id v7 = v8;
LABEL_7:

  return v7;
}

uint64_t sub_10001C200(uint64_t a1, uint64_t a2)
{
  id v3 = [objc_alloc((Class)NSString) initWithUTF8String:a2];
  [*(id *)(a1 + 32) addObject:v3];

  return 1;
}

uint64_t sub_10001C250(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = xpc_dictionary_get_dictionary(*(xpc_object_t *)(a1 + 32), a2);
  if (v6)
  {
    id v7 = (id)v6;
    _os_log_preferences_merge();
  }
  else
  {
    id v7 = v5;
  }
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v7);

  return 1;
}

void sub_10001C2D0()
{
  CFArrayRef v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create_with_target_V2("com.apple.logd.store", attr, 0);
  int v2 = (void *)qword_10003E938;
  qword_10003E938 = (uint64_t)v1;
}

void sub_10001C358()
{
  sub_10001C2D0();
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  dword_100031BF8 = open((const char *)qword_10003E998, 0x100000);
  if ((dword_100031BF8 & 0x80000000) == 0)
  {
    sub_1000173BC();
    sub_10001C48C();
  }
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    dispatch_async_f((dispatch_queue_t)qword_10003E938, 0, (dispatch_function_t)sub_10001C78C);
  }
  else
  {
    memset(&v1[51], 170, 0x3CDuLL);
    strcpy(v1, "CacheDelete not available - functioning without it");
    sub_100016E68((uint64_t)v1);
  }
  dispatch_time_t v0 = dispatch_time(0, 600000000000);
  dispatch_after(v0, (dispatch_queue_t)qword_10003E938, &stru_10002DF28);
}

uint64_t sub_10001C48C()
{
  memset(__b, 170, sizeof(__b));
  int v0 = dup(dword_100031BF8);
  if (v0 == -1)
  {
    __error();
    _os_assumes_log();
    int v2 = 0;
  }
  else
  {
    int v1 = v0;
    if (lseek(v0, 0, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    int v2 = fdopendir(v1);
    if (!v2)
    {
      int v3 = *__error();
      if (close(v1) == -1)
      {
        int v12 = *__error();
        uint64_t result = *__error();
        if (v12 == 9)
        {
          qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_100031F78 = result;
          __break(1u);
          return result;
        }
        _os_assumes_log();
      }
      int v2 = 0;
      *__error() = v3;
    }
  }
  id v4 = readdir(v2);
  if (v4)
  {
    while (1)
    {
      d_xpc_type_t type = v4->d_type;
      if (d_type == 8) {
        break;
      }
      if (d_type == 4)
      {
        uint64_t v6 = 0;
        d_name = v4->d_name;
        while (strcmp((&off_10002E1A0)[v6], d_name))
        {
          if (++v6 == 5) {
            goto LABEL_23;
          }
        }
        if (qword_10003E9B0 != -1) {
          dispatch_once(&qword_10003E9B0, &stru_10002E890);
        }
        snprintf(__b, 0x400uLL, "%s/%s", (const char *)qword_10003E998, d_name);
        int v10 = removefile(__b, 0, 1u);
LABEL_21:
        if (v10 == -1)
        {
          __error();
          _os_assumes_log();
        }
      }
LABEL_23:
      id v4 = readdir(v2);
      if (!v4) {
        goto LABEL_26;
      }
    }
    id v8 = v4->d_name;
    uint64_t v9 = strrchr(v4->d_name, 46);
    if (!v9 || strcmp(v9, ".tracev3")) {
      goto LABEL_23;
    }
    if (!strncmp(v8, "logdata.Persistent.", 0x13uLL))
    {
      snprintf(__b, 0x400uLL, "Persist/%s", v8);
      int v10 = renameat(dword_100031BF8, v8, dword_100031BF8, __b);
    }
    else
    {
      int v10 = unlinkat(dword_100031BF8, v8, 0);
    }
    goto LABEL_21;
  }
LABEL_26:
  closedir(v2);
  removefile("/private/var/mobile/Library/Logs/com.apple.sharingd", 0, 1u);
  return removefile("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/WatchConnectivity", 0, 1u);
}

void sub_10001C764(id a1)
{
}

void sub_10001C78C()
{
  if ((CacheDeleteRegisterInfoCallbacks() & 0x80000000) != 0)
  {
    memset(&v0[37], 170, 0x3DBuLL);
    strcpy(v0, "Unable to register with cache delete");
    sub_100016E68((uint64_t)v0);
  }
}

__CFDictionary *__cdecl sub_10001C840(id a1, int a2, __CFDictionary *a3)
{
  return 0;
}

__CFDictionary *__cdecl sub_10001C84C(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  if (sub_10001CA10((const char *)qword_10003E998, a3))
  {
    memset(__b, 170, sizeof(__b));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v8 = sub_10001CB0C;
    uint64_t v9 = &unk_10002E258;
    id v11 = __b;
    uint64_t v12 = 1024;
    int v10 = &v13;
    sub_10001CB0C((uint64_t)v7, (uint64_t)&off_100031DB0);
    v8((uint64_t)v7, (uint64_t)&off_100031D20);
    v8((uint64_t)v7, (uint64_t)&off_100031C00);
    v8((uint64_t)v7, (uint64_t)&off_100031C90);
  }
  CFStringRef v17 = @"CACHE_DELETE_AMOUNT";
  id v4 = +[NSNumber numberWithLongLong:v14[3]];
  uint64_t v18 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  _Block_object_dispose(&v13, 8);
  return v5;
}

BOOL sub_10001CA10(const char *a1, void *a2)
{
  id v5 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v10.st_blkmach_vm_size_t size = v6;
  *(timespec *)v10.st_qspare = v6;
  v10.st_birthtimespec = v6;
  *(timespec *)&v10.st_mach_vm_size_t size = v6;
  v10.st_mtimespec = v6;
  v10.st_ctimespec = v6;
  *(timespec *)&v10.st_uid = v6;
  v10.st_atimespec = v6;
  *(timespec *)v9.st_qspare = v6;
  *(timespec *)&v10.st_dev = v6;
  *(timespec *)&v9.st_mach_vm_size_t size = v6;
  *(timespec *)&v9.st_blkmach_vm_size_t size = v6;
  v9.st_ctimespec = v6;
  v9.st_birthtimespec = v6;
  v9.st_atimespec = v6;
  v9.st_mtimespec = v6;
  *(timespec *)&v9.st_dev = v6;
  *(timespec *)&v9.st_uid = v6;
  BOOL v7 = v5
    && (stat(a1, &v10) & 0x80000000) == 0
    && (stat((const char *)[v5 fileSystemRepresentation], &v9) & 0x80000000) == 0
    && v10.st_dev == v9.st_dev;

  return v7;
}

uint64_t sub_10001CB0C(uint64_t a1, uint64_t a2)
{
  id v4 = *(char **)(a1 + 40);
  size_t v5 = *(void *)(a1 + 48);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  snprintf(v4, v5, "%s/%s", (const char *)qword_10003E998, *(const char **)(a2 + 8));
  uint64_t result = open(*(const char **)(a1 + 40), 0x100000);
  if ((result & 0x80000000) != 0)
  {
    st_mach_vm_size_t size = 0;
  }
  else
  {
    int v7 = result;
    v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v15.st_blkmach_vm_size_t size = v8;
    *(timespec *)v15.st_qspare = v8;
    v15.st_birthtimespec = v8;
    *(timespec *)&v15.st_mach_vm_size_t size = v8;
    v15.st_mtimespec = v8;
    v15.st_ctimespec = v8;
    *(timespec *)&v15.st_uid = v8;
    v15.st_atimespec = v8;
    *(timespec *)&v15.st_dev = v8;
    if ((int)_os_trace_fdscandir_b() < 1)
    {
      v15.st_mach_vm_size_t size = 0;
    }
    else
    {
      if (fstatat(v7, (const char *)(MEMORY[0] + 21), &v15, 32) == -1) {
        v15.st_mach_vm_size_t size = 1;
      }
      unlinkat(v7, (const char *)(MEMORY[0] + 21), 0);
    }
    if (close(v7) == -1)
    {
      int v14 = *__error();
      uint64_t result = *__error();
      if (v14 == 9)
      {
        qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100031F78 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    uint64_t result = _os_trace_scandir_free_namelist();
    st_mach_vm_size_t size = v15.st_size;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void *)(v10 + 24);
  BOOL v12 = __OFADD__(v11, st_size);
  off_t v13 = v11 + st_size;
  if (v12) {
    __break(0x5500u);
  }
  *(void *)(v10 + 24) = v13;
  return result;
}

int sub_10001CCE8(id a1, const dirent **a2, const dirent **a3)
{
  int v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  int v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0)) {
    return (v5 != 0) - (v6 != 0);
  }

  return alphasort(a2, a3);
}

int sub_10001CDA4(id a1, const dirent *a2)
{
  if (a2->d_type == 8)
  {
    int v2 = strrchr(a2->d_name, 46);
    if (v2) {
      LODWORD(v2) = strcmp(v2, ".tracev3") == 0;
    }
  }
  else
  {
    LODWORD(v2) = 0;
  }
  return (int)v2;
}

__CFDictionary *__cdecl sub_10001CDF0(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v16 = 0;
  CFStringRef v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  if (sub_10001CA10((const char *)qword_10003E998, a3))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    off_t v13 = sub_10001CFE0;
    int v14 = &unk_10002E210;
    stat v15 = &v16;
    id v4 = v12;
    if (qword_10003E9B0 != -1) {
      dispatch_once(&qword_10003E9B0, &stru_10002E890);
    }
    v22[0] = (char *)qword_10003E998;
    v22[1] = 0;
    int v5 = fts_open(v22, 2132, 0);
    if (v5)
    {
      int v6 = v5;
      int v7 = fts_read(v5);
      if (v7)
      {
        timespec v8 = v7;
        do
        {
          if (v8->fts_info == 8) {
            ((void (*)(void *))v13)(v4);
          }
          timespec v8 = fts_read(v6);
        }
        while (v8);
      }
      fts_close(v6);
    }
    else
    {
      _os_assumes_log();
    }
  }
  CFStringRef v20 = @"CACHE_DELETE_AMOUNT";
  stat v9 = +[NSNumber numberWithLongLong:v17[3]];
  uint64_t v21 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  _Block_object_dispose(&v16, 8);
  return v10;
}

const char *sub_10001CFE0(uint64_t a1, uint64_t a2)
{
  uint64_t result = strrchr((char *)(a2 + 104), 46);
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, ".tracev3");
    if (!result)
    {
      v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v8.st_blkmach_vm_size_t size = v5;
      *(timespec *)v8.st_qspare = v5;
      v8.st_birthtimespec = v5;
      *(timespec *)&v8.st_mach_vm_size_t size = v5;
      v8.st_mtimespec = v5;
      v8.st_ctimespec = v5;
      *(timespec *)&v8.st_uid = v5;
      v8.st_atimespec = v5;
      *(timespec *)&v8.st_dev = v5;
      uint64_t result = (const char *)stat(*(const char **)(a2 + 48), &v8);
      if ((result & 0x80000000) == 0)
      {
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v7 = *(void *)(v6 + 24);
        if (__OFADD__(v7, v8.st_size)) {
          __break(0x5500u);
        }
        else {
          *(void *)(v6 + 24) = v7 + v8.st_size;
        }
      }
    }
  }
  return result;
}

void sub_10001D0A0(id a1)
{
  byte_100031E08 = 1;
  byte_100031D78 = 1;
  byte_100031C58 = 1;
  byte_100031CE8 = 1;
}

void sub_10001D0C8(id a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E938);
  if (dword_100031BF8 == -1) {
    sub_10001D188();
  }
  byte_100031E08 = 0;
  byte_100031D78 = 0;
  byte_100031C58 = 0;
  byte_100031CE8 = 0;
  memset(&v1[17], 170, 0x3EFuLL);
  strcpy(v1, "writes unblocked");
  sub_100016E68((uint64_t)v1);
}

void sub_10001D188()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003E938);
  if (dword_100031BF8 != -1) {
    __assert_rtn("_logd_store_initialize_io", "logd_store.m", 3231, "_logd_store_dirfd == -1");
  }
  sub_10001D794(0);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  dword_100031BF8 = open((const char *)qword_10003E998, 0x100000);
  if (dword_100031BF8 < 0) {
    goto LABEL_47;
  }
  sub_1000173BC();
  int v0 = sub_10001D934();
  int v2 = [v0 objectForKeyedSubscript:@"Version"];
  uint64_t v3 = (uint64_t)[v2 integerValue];

  if (v3 >= 8)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Store version (%ld) is more recent than what this system supports (<= %d), logs will be corrupted", v3, 7);
    sub_100016E68((uint64_t)__b);
    goto LABEL_18;
  }
  uint64_t v4 = v3 - 7;
  if (v3 == 7)
  {
LABEL_18:
    id v9 = v0;
    uint64_t v10 = [v9 objectForKeyedSubscript:@"Salt"];
    if ([v10 isNSNumber])
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:@"Salt"];
      id v12 = [v11 unsignedLongLongValue];

      if (v12) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    *(void *)&__b[0] = 0;
    do
      arc4random_buf(__b, 8uLL);
    while (!*(void *)&__b[0]);
    id v13 = objc_alloc((Class)NSNumber);
    id v14 = [v13 initWithUnsignedLongLong:*(void *)&__b[0]];
    [v9 setObject:v14 forKeyedSubscript:@"Salt"];

    sub_100014DCC(v9);
LABEL_25:
    stat v15 = [v9 objectForKeyedSubscript:@"Salt"];
    id v16 = [v15 unsignedLongLongValue];

    if (v16)
    {
      qword_10003E940 = (uint64_t)v16;

      sub_10001A710(dword_100031BF8, off_100031DB8);
      sub_10001A710(dword_100031BF8, off_100031D28);
      sub_10001A710(dword_100031BF8, off_100031C08);
      sub_10001A710(dword_100031BF8, off_100031C98);
      _os_trace_is_development_build();
      xmmword_10003E970 = xmmword_100027CA0;
      qword_10003E980 = 3;
      qword_10003E988 = 0x3FE0000000000000;
      word_10003E990 = 0;
      byte_10003E992 = 0;
      CFStringRef v17 = (const char *)_os_trace_sysprefsdir_path();
      sub_100019C6C(v17);
      if (_os_trace_is_development_build())
      {
        uint64_t v18 = (const char *)_os_trace_intprefsdir_path();
        sub_100019C6C(v18);
      }
      uint64_t v19 = (const char *)_os_trace_prefsdir_path();
      sub_100019C6C(v19);
      sub_10001A900((uint64_t)&off_100031DB0);
      sub_10001A900((uint64_t)&off_100031D20);
      sub_10001A900((uint64_t)&off_100031C00);
      sub_10001A900((uint64_t)&off_100031C90);
      id v9 = v9;
      if (qword_10003E9B8 == -1)
      {
LABEL_29:
        if (byte_10003E9C0)
        {
          sub_10001DB60(v9, 0);

          notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &dword_100031F08, (dispatch_queue_t)qword_10003E938, &stru_10002E338);
          if (!sub_100012FF8())
          {
LABEL_34:
            if (&_CacheDeleteRegisterInfoCallbacks)
            {
              dispatch_async_f((dispatch_queue_t)qword_10003E938, 0, (dispatch_function_t)sub_10001DCAC);
            }
            else
            {
              memset((char *)&__b[3] + 3, 170, 0x3CDuLL);
              strcpy((char *)__b, "CacheDelete not available - functioning without it");
              sub_100016E68((uint64_t)__b);
            }
            uint64_t v21 = openat(dword_100031BF8, "logdata.statistics.0.txt", 778, 420);
            dword_100030348 = v21;
            if (v21 == -1)
            {
              __error();
              _os_assumes_log();
              uint64_t v21 = dword_100030348;
            }
            dword_100030348 = sub_100006488(v21, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000);
            uint64_t v22 = openat(dword_100031BF8, "logdata.statistics.0.jsonl", 778, 420);
            dword_10003034C = v22;
            if (v22 == -1)
            {
              __error();
              _os_assumes_log();
              uint64_t v22 = dword_10003034C;
            }
            dword_10003034C = sub_100006488(v22, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880);

            return;
          }
          *(void *)&__b[0] = _NSConcreteStackBlock;
          *((void *)&__b[0] + 1) = 3221225472;
          *(void *)&__b[1] = sub_10001DC98;
          *((void *)&__b[1] + 1) = &unk_10002E360;
          *(void *)&__b[2] = &stru_10002E338;
          dispatch_async((dispatch_queue_t)qword_10003E938, __b);
          CFStringRef v20 = *(void **)&__b[2];
        }
        else
        {
          sub_10001DB60(v9, 1);
          CFStringRef v20 = v9;
        }

        goto LABEL_34;
      }
    }
    else
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
    goto LABEL_29;
  }
  if ((unint64_t)v3 <= 6) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = v3;
  }
  if ((unint64_t)v3 <= 6)
  {
    unint64_t v6 = 8 * v3;
    while (v6 <= ~(unint64_t)off_100031ED0)
    {
      if (!v4) {
        goto LABEL_46;
      }
      ((void (*)(void *))off_100031ED0[v6 / 8])(v0);
      uint64_t v7 = +[NSNumber numberWithLong:v3 + 1];
      [v0 setObject:v7 forKeyedSubscript:@"Version"];

      v6 += 8;
      ++v4;
      if (v3++ == v5)
      {
        sub_100014DCC(v0);
        goto LABEL_18;
      }
    }
    __break(0x5513u);
LABEL_46:
    __break(1u);
LABEL_47:
    uint64_t v23 = *__error();
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
    qword_100031F78 = v23;
    __break(1u);
  }
  __break(0x5512u);
}

void sub_10001D794(unsigned int a1)
{
  signed int v2 = sub_100007C40(a1);
  if (v2)
  {
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Failed to migrate directory";
    qword_100031F78 = v2;
    __break(1u);
  }
  if (qword_10003E9B8 != -1) {
    dispatch_once(&qword_10003E9B8, &stru_10002E9F8);
  }
  if (byte_10003E9C0)
  {
    uint64_t v11 = 0;
    long long v10 = xmmword_100027DD0;
    int v9 = 4;
    uint64_t v3 = (const char *)sub_100007DFC(a1);
    int v4 = open(v3, 0x100000);
    if (v4 == -1)
    {
      uint64_t v7 = __error();
      uint64_t v8 = *v7;
      qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Failed to open directory";
      qword_100031F78 = v8;
      __break(1u);
    }
    else
    {
      int v5 = v4;
      if (fsetattrlist(v4, &v10, &v9, 4uLL, 0) == -1)
      {
        __error();
        _os_assumes_log();
      }
      if (close(v5) != -1) {
        return;
      }
      int v6 = *__error();
      uint64_t v7 = (int *)*__error();
      if (v6 != 9)
      {
        _os_assumes_log();
        return;
      }
    }
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = (uint64_t)v7;
    __break(1u);
  }
}

id sub_10001D934()
{
  uint64_t v0 = openat(dword_100031BF8, "version.plist", 256);
  if (v0 == -1)
  {
    if (*__error() != 2) {
      _os_assumes_log();
    }
    goto LABEL_9;
  }
  id v1 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v0];
  id v14 = 0;
  signed int v2 = [v1 readDataToEndOfFileAndReturnError:&v14];
  id v3 = v14;
  int v4 = v3;
  if (v2)
  {
    [v1 closeFile];

    int v5 = +[NSPropertyListSerialization propertyListWithData:v2 options:1 format:0 error:0];
    goto LABEL_10;
  }
  NSErrorDomain v6 = [v3 domain];
  NSErrorDomain v7 = v6;
  if (v6 != NSCocoaErrorDomain)
  {

    goto LABEL_22;
  }
  id v8 = [v4 code];

  if (v8 != (id)260) {
LABEL_22:
  }
    _os_assumes_log();
  [v1 closeFile];

LABEL_9:
  signed int v2 = 0;
  int v5 = 0;
LABEL_10:

  if ([v5 isNSDictionary])
  {
    int v9 = [v5 objectForKeyedSubscript:@"Version"];
    long long v10 = v9;
    if (v9 && ([v9 isNSNumber] & 1) == 0) {
      [v5 removeObjectForKey:@"Version"];
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"Pending"];

    if (v11 && ([v11 isNSArray] & 1) == 0) {
      [v5 removeObjectForKey:@"Pending"];
    }
  }
  else
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);

    uint64_t v11 = 0;
    int v5 = v12;
  }

  return v5;
}

void sub_10001DB60(void *a1, int a2)
{
  id v3 = [a1 objectForKeyedSubscript:@"Pending"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      NSErrorDomain v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) isEqualToString:@"timesync-build"])BOOL v8 = a2 == 0; {
        else
        }
          BOOL v8 = 1;
        if (!v8) {
          dispatch_async_f((dispatch_queue_t)qword_10003E938, @"timesync-build", (dispatch_function_t)sub_10002138C);
        }
        NSErrorDomain v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v5);
  }
}

uint64_t sub_10001DC98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001DCAC()
{
  if ((CacheDeleteRegisterInfoCallbacks() & 0x80000000) != 0)
  {
    memset(&v0[37], 170, 0x3DBuLL);
    strcpy(v0, "Unable to register with cache delete");
    sub_100016E68((uint64_t)v0);
  }
}

__CFDictionary *__cdecl sub_10001DD60(id a1, int a2, __CFDictionary *a3)
{
  memset(__b, 170, 0x400uLL);
  snprintf((char *)__b, 0x400uLL, "Received a Periodic Request from CacheDelete on volume %s", (const char *)[a3 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"]);
  sub_100016E68((uint64_t)__b);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  id v4 = &byte_100031FA4[49244];
  if (!sub_10001CA10((const char *)qword_10003E998, a3))
  {
    uint64_t v9 = 0;
LABEL_105:
    if (qword_10003E9B0 != -1) {
      dispatch_once(&qword_10003E9B0, &stru_10002E890);
    }
    if (sub_10001CA10((const char *)qword_10003E9A8, a3))
    {
      memset((char *)&__b[2] + 3, 170, 0x3EDuLL);
      strcpy((char *)__b, "Purging UUID Cache");
      sub_100016E68((uint64_t)__b);
      sub_10001AAF0();
    }
    memset(__b, 170, 0x400uLL);
    snprintf((char *)__b, 0x400uLL, "Periodic complete. Removed %lld bytes.", v9);
    sub_100016E68((uint64_t)__b);
    CFStringRef v116 = @"CACHE_DELETE_AMOUNT";
    unint64_t v85 = +[NSNumber numberWithLongLong:v9];
    uint64_t v117 = v85;
    int v86 = +[NSDictionary dictionaryWithObjects:&v117 forKeys:&v116 count:1];

    return v86;
  }
  uint64_t v120 = (void ***)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v118 = v5;
  long long v119 = v5;
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  uint64_t v6 = (const char *)qword_10003E9A0;
  uint64_t v7 = _os_trace_zalloc();
  int v8 = openat(-2, v6, 0);
  *(_DWORD *)uint64_t v7 = v8;
  if (v8 == -1)
  {
    __error();
    _os_assumes_log();
  }
  else if ((int)sub_10002426C(v8, (void *)(v7 + 8), (void *)(v7 + 16), 0) >= 1 {
         && (sub_100024DFC(v7) & 0x80000000) == 0)
  }
  {
    clock_gettime_nsec_np(_CLOCK_REALTIME);
    sub_10002527C();
  }
  int v10 = *__error();
  if ((*(_DWORD *)v7 & 0x80000000) == 0 && close(*(_DWORD *)v7) == -1)
  {
    int v88 = *__error();
    uint64_t result = (__CFDictionary *)*__error();
    if (v88 == 9)
    {
LABEL_118:
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = (uint64_t)result;
      __break(1u);
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = (uint64_t)result;
      __break(1u);
      goto LABEL_119;
    }
    _os_assumes_log();
  }
  free((void *)v7);
  *__error() = v10;
  int v11 = *__error();
  memset(__b, 170, 0x400uLL);
  snprintf((char *)__b, 0x400uLL, "Unable to open timesync database at %s: error %d", v6, v11);
  sub_100016E68((uint64_t)__b);
  long long v12 = &unk_100031000;
  int v13 = openat(dword_100031BF8, "TTL", 1048832);
  if ((v13 & 0x80000000) == 0)
  {
    if ((unint64_t)&v118 >= 0xFFFFFFFFFFFFFFE8) {
      goto LABEL_115;
    }
    int v14 = v13;
    __darwin_time_t v15 = *((void *)&v119 + 1);
    id v16 = fdopendir(v13);
    CFStringRef v17 = readdir(v16);
    if (v17)
    {
      uint64_t v93 = a3;
      uint64_t v18 = 0;
      char v19 = 0;
      do
      {
        if (v17->d_type == 8)
        {
          d_name = v17->d_name;
          uint64_t v21 = strrchr(v17->d_name, 46);
          if (v21)
          {
            if (!strcmp(v21, ".tracev3"))
            {
              __b[0] = 0xAAAAAAAAAAAAAAAALL;
              if (sub_10001ED4C(v14, d_name, v15, __b))
              {
                if (unlinkat(v14, d_name, 0) == -1)
                {
                  __error();
                  _os_assumes_log();
                }
                v18 += __b[0];
              }
              else
              {
                char v19 = 1;
              }
            }
          }
        }
        CFStringRef v17 = readdir(v16);
      }
      while (v17);
      a3 = v93;
      id v4 = byte_100031FA4 + 49244;
      long long v12 = (_DWORD *)&unk_100031000;
      if (v19)
      {
LABEL_34:
        closedir(v16);
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    memset(__b, 170, 0x400uLL);
    if (qword_10003E9B0 != -1) {
      dispatch_once(&qword_10003E9B0, &stru_10002E890);
    }
    snprintf((char *)__b, 0x400uLL, "%s/TTL", *((const char **)v4 + 307));
    long long value = 0;
    uint64_t v22 = removefile_state_alloc();
    removefile_state_set(v22, 1u, sub_10002059C);
    removefile_state_set(v22, 2u, &value);
    removefile((const char *)__b, v22, 1u);
    removefile_state_free(v22);
    BOOL v23 = __OFADD__(v18, value);
    v18 += (uint64_t)value;
    if (v23) {
      goto LABEL_116;
    }
    goto LABEL_34;
  }
  uint64_t v18 = 0;
LABEL_35:
  if ((long long *)((char *)&v119 + 1) != 0 && (unint64_t)&v118 >= 0xFFFFFFFFFFFFFFEFLL
    || (unint64_t)&v118 > 0xFFFFFFFFFFFFFFDFLL)
  {
    goto LABEL_115;
  }
  uint64_t v24 = v118;
  uint64_t v25 = v119;
  uint64_t v26 = sub_10001EFE0((uint64_t)&off_100031C00, (uint64_t)v120);
  uint64_t v27 = v18 + v26;
  if (__OFADD__(v18, v26)
    || (v28 = sub_10001EFE0((uint64_t)&off_100031D20, v25), BOOL v23 = __OFADD__(v27, v28), v29 = v27 + v28, v23)
    || (v30 = sub_10001EFE0((uint64_t)&off_100031DB0, v24), uint64_t v9 = v29 + v30, __OFADD__(v29, v30)))
  {
LABEL_116:
    __break(0x5500u);
  }
  int v31 = openat(v12[766], off_100031C98, 1048832);
  if (v31 == -1) {
    goto LABEL_112;
  }
  int v32 = v31;
  if (v31 < 0) {
    goto LABEL_102;
  }
  *(void *)&v97.tm_wday = 0;
  *(void *)&v97.int tm_isdst = &v97.tm_wday;
  v97.tm_gmtofuint64_t f = 0x2020000000;
  v97.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, 0x400uLL);
  *(void *)&v97.tm_mon = 0xAA00000000100000;
  *(void *)&v97.tm_sec = __b;
  *(void *)&v97.uint64_t tm_hour = 0x40000000000;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F174;
  block[3] = &unk_10002E4C0;
  void block[4] = &v97.tm_wday;
  void block[5] = &off_100031C90;
  dispatch_sync((dispatch_queue_t)qword_10003E938, block);
  sub_10001A1D4(&v97, (uint64_t)&off_100031C90, (uint64_t)"Periodic Compaction", 0, v33, v34, v35, v36, v89[0]);
  int v37 = dup(v32);
  if (v37 == -1)
  {
    __error();
    _os_assumes_log();
LABEL_95:
    _os_assumes_log();
    uint64_t v40 = 0;
    uint64_t v48 = 0;
LABEL_96:
    if (v97.tm_year)
    {
      unint64_t v79 = *(void **)&v97.tm_sec;
      *(void *)&v97.tm_sec = 3954044928;
      LOWORD(v97.tm_year) = 0;
      free(v79);
    }
    if (closedir(v40) == -1)
    {
      __error();
      _os_assumes_log();
    }
    _Block_object_dispose(&v97.tm_wday, 8);
    BOOL v23 = __OFADD__(v9, v48);
    v9 += v48;
    if (v23) {
      goto LABEL_116;
    }
    if (close(v32) != -1) {
      goto LABEL_102;
    }
    int v87 = *__error();
    uint64_t result = (__CFDictionary *)*__error();
    if (v87 != 9)
    {
      _os_assumes_log();
LABEL_112:
      __error();
      _os_assumes_log();
LABEL_102:
      unint64_t v80 = (void *)v118;
      sub_100012F78(*(void ***)v118);
      free(v80);
      if (v89 == (void *)-536) {
        goto LABEL_115;
      }
      unint64_t v81 = (void *)*((void *)&v118 + 1);
      sub_100012F78(**((void ****)&v118 + 1));
      free(v81);
      unint64_t v82 = (void *)v119;
      sub_100012F78(*(void ***)v119);
      free(v82);
      if ((unint64_t)&v118 > 0xFFFFFFFFFFFFFFE7) {
        goto LABEL_115;
      }
      uint64_t v83 = (void *)*((void *)&v119 + 1);
      sub_100012F78(**((void ****)&v119 + 1));
      free(v83);
      unint64_t v84 = v120;
      sub_100012F78(*v120);
      free(v84);
      memset(__b, 170, 0x400uLL);
      snprintf((char *)__b, 0x400uLL, "Compacted %lld bytes", v9);
      sub_100016E68((uint64_t)__b);
      goto LABEL_105;
    }
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = (uint64_t)result;
    __break(1u);
    goto LABEL_118;
  }
  int v38 = v37;
  if (lseek(v37, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  uint64_t v39 = fdopendir(v38);
  if (v39)
  {
    uint64_t v40 = v39;
    char v95 = 0;
    uint64_t v41 = readdir(v39);
    uint64_t v48 = 0;
    if (v41)
    {
      BOOL v49 = v109;
      int v94 = v107;
      v89[3] = v99;
      do
      {
        if (v41->d_type == 8)
        {
          int v50 = v41->d_name;
          BOOL v51 = strrchr(v41->d_name, 46);
          if (v51)
          {
            if (!strcmp(v51, ".tracev3"))
            {
              unint64_t v52 = sub_10001A3A8(v50);
              if (v52)
              {
                if (v52 < *(void *)(*(void *)&v97.tm_isdst + 24))
                {
                  unint64_t v115 = 0xAAAAAAAAAAAAAAAALL;
                  uint64_t v53 = _os_trace_mmap_at();
                  if (v53)
                  {
                    unint64_t v54 = (char *)v53;
                    uint64_t v90 = v48;
                    v91 = v49;
                    int v92 = v32;
                    uint64_t v93 = a3;
                    v49[16] = 0;
                    *((_OWORD *)v49 + 6) = 0u;
                    *((_OWORD *)v49 + 7) = 0u;
                    *((_OWORD *)v49 + 4) = 0u;
                    *((_OWORD *)v49 + 5) = 0u;
                    *((_OWORD *)v49 + 2) = 0u;
                    *((_OWORD *)v49 + 3) = 0u;
                    *(_OWORD *)BOOL v49 = 0u;
                    *((_OWORD *)v49 + 1) = 0u;
                    long long value = &v118;
                    v109[1] = -1;
                    int v114 = 0x10000;
                    uint64_t v113 = (void *)_os_trace_malloc();
                    unint64_t v55 = v115;
                    v106[0] = _NSConcreteStackBlock;
                    v106[1] = 3221225472;
                    v107[0] = sub_10001F27C;
                    v107[1] = &unk_10002E500;
                    v107[2] = v54;
                    v107[3] = &v118;
                    v107[4] = &value;
                    unint64_t v56 = v106;
                    unint64_t v57 = 0;
                    do
                    {
                      if (v55 - v57 < 0x10) {
                        break;
                      }
                      unint64_t v58 = *(void *)&v54[v57 + 8];
                      if (v55 - 16 - v57 < v58) {
                        break;
                      }
                      if (!((unsigned int (*)(void *))v107[0])(v56)) {
                        break;
                      }
                      unint64_t v57 = (v57 + v58 + 23) & 0xFFFFFFFFFFFFFFF8;
                    }
                    while (v57 - 1 < v55);

                    if (v109[3]) {
                      sub_10001F51C((uint64_t)&value);
                    }
                    uint64_t v102 = 0;
                    unint64_t v103 = &v102;
                    uint64_t v104 = 0x2020000000;
                    uint64_t v105 = 0;
                    int v32 = v92;
                    BOOL v49 = v91;
                    if (v111 > 1)
                    {
                      a3 = v93;
                      if (!(v115 >> 17))
                      {
LABEL_75:
                        uint64_t v66 = 16;
                        unint64_t v67 = 1;
                        while (!__CFADD__(v110, v66))
                        {
                          free(*(void **)&v110[v66]);
                          ++v67;
                          v66 += 16;
                          if (v67 >= v111) {
                            goto LABEL_78;
                          }
                        }
LABEL_115:
                        __break(0x5513u);
                        goto LABEL_116;
                      }
                      if ((3 * v112) < 2 * v115)
                      {
                        int v61 = sub_100002D74(v92, "tmp", 1538);
                        if (v61 == -1)
                        {
                          __error();
                          _os_assumes_log();
                          int v32 = v92;
                        }
                        else
                        {
                          int v62 = v61;
                          if (_os_trace_writev() == -1)
                          {
                            __error();
                            _os_assumes_log();
                            int v68 = close(v62);
                            int v32 = v92;
                            if (v68 == -1)
                            {
                              int v69 = *__error();
                              uint64_t result = (__CFDictionary *)*__error();
                              if (v69 == 9) {
                                goto LABEL_121;
                              }
                              _os_assumes_log();
                              a3 = v93;
                              int v32 = v92;
                              BOOL v49 = v91;
                            }
                          }
                          else
                          {
                            v98[0] = _NSConcreteStackBlock;
                            v98[1] = 3221225472;
                            v99[0] = sub_10001F610;
                            int v100 = v92;
                            int v101 = v62;
                            v99[3] = v50;
                            v99[4] = &value;
                            v99[1] = &unk_10002E528;
                            v99[2] = &v102;
                            v99[5] = v115;
                            v99[6] = &v97;
                            v99[7] = &off_100031C90;
                            dispatch_sync((dispatch_queue_t)qword_10003E938, v98);
                            int v63 = v62;
                            int v32 = v92;
                            if (close(v63) == -1)
                            {
                              int v64 = *__error();
                              uint64_t result = (__CFDictionary *)*__error();
                              if (v64 == 9) {
                                goto LABEL_120;
                              }
                              _os_assumes_log();
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                      uint64_t v59 = sub_10001F18C(v92, (uint64_t)v50, v115, (uint64_t)&v97, (uint64_t)&v95);
                      v103[3] = v59;
                      a3 = v93;
                    }
                    if (v111 > 1) {
                      goto LABEL_75;
                    }
LABEL_78:
                    free(v110);
                    free(v113);
                    if (munmap(v54, v115) == -1)
                    {
                      __error();
                      _os_assumes_log();
                    }
                    uint64_t v60 = v103[3];
                    _Block_object_dispose(&v102, 8);
                    uint64_t v48 = v90;
                  }
                  else
                  {
                    uint64_t v60 = sub_10001F18C(v32, (uint64_t)v50, v115, (uint64_t)&v97, (uint64_t)&v95);
                  }
                  BOOL v23 = __OFADD__(v48, v60);
                  v48 += v60;
                  if (v23) {
                    goto LABEL_116;
                  }
                }
              }
            }
          }
        }
        uint64_t v41 = readdir(v40);
      }
      while (v41);
    }
    if (v48 || v95)
    {
      sub_1000054CC(&v97, "done  : ", v42, v43, v44, v45, v46, v47, v89[0]);
      time_t v70 = time(0);
      sub_100004DC4(&v97, v70);
      sub_1000054CC(&v97, "\n\n", v71, v72, v73, v74, v75, v76, v89[0]);
      sub_100013074();
    }
    goto LABEL_96;
  }
  int v77 = *__error();
  if (close(v38) != -1)
  {
LABEL_94:
    *__error() = v77;
    goto LABEL_95;
  }
  int v78 = *__error();
  uint64_t result = (__CFDictionary *)*__error();
  if (v78 != 9)
  {
    _os_assumes_log();
    goto LABEL_94;
  }
LABEL_119:
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = (uint64_t)result;
  __break(1u);
LABEL_120:
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = (uint64_t)result;
  __break(1u);
LABEL_121:
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = (uint64_t)result;
  __break(1u);
  return result;
}

void sub_10001EC58(uint64_t a1)
{
  id v3 = sub_10001D934();
  sub_10002071C(v3, @"ttl01", **(uint64_t ***)(a1 + 32));
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 >= 0xFFFFFFFFFFFFFFF8
    || (sub_10002071C(v3, @"ttl03", *(uint64_t **)(v4 + 8)), unint64_t v5 = *(void *)(a1 + 32), v5 > 0xFFFFFFFFFFFFFFEFLL)
    || (sub_10002071C(v3, @"ttl07", *(uint64_t **)(v5 + 16)), unint64_t v6 = *(void *)(a1 + 32), v6 > 0xFFFFFFFFFFFFFFE7)
    || (sub_10002071C(v3, @"ttl14", *(uint64_t **)(v6 + 24)), unint64_t v7 = *(void *)(a1 + 32), v7 > 0xFFFFFFFFFFFFFFDFLL))
  {
    __break(0x5513u);
  }
  else
  {
    sub_10002071C(v3, @"ttl30", *(uint64_t **)(v7 + 32));
    sub_100014DCC(v3);
  }
}

uint64_t sub_10001ED4C(int a1, const char *a2, __darwin_time_t a3, size_t *a4)
{
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[0] = v8;
  v26[1] = v8;
  uint64_t v9 = _os_trace_getxattr_at();
  if (v9 == 40)
  {
    uint64_t v17 = sub_10000D42C(*(void **)a3, (_OWORD *)((char *)v26 + 4));
    if (v17 && (v17 != 1 || v27 >= *(void *)(a3 + 8))) {
      return 0;
    }
    goto LABEL_19;
  }
  if (v9 != -1)
  {
    _os_assumes_log();
LABEL_19:
    v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v18.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v25.st_blkmach_vm_size_t size = v18;
    *(timespec *)v25.st_qspare = v18;
    v25.st_birthtimespec = v18;
    *(timespec *)&v25.st_mach_vm_size_t size = v18;
    v25.st_mtimespec = v18;
    v25.st_ctimespec = v18;
    *(timespec *)&v25.st_uid = v18;
    v25.st_atimespec = v18;
    *(timespec *)&v25.st_dev = v18;
    if (fstatat(a1, a2, &v25, 32) == -1)
    {
      __error();
      _os_assumes_log();
      st_mach_vm_size_t size = 0;
    }
    else
    {
      st_mach_vm_size_t size = v25.st_size;
    }
    *a4 = st_size;
    return 1;
  }
  if (*__error() != 93)
  {
    __error();
    _os_assumes_log();
  }
  uint64_t v10 = _os_trace_mmap_at();
  BOOL v11 = 1;
  if (v10)
  {
    long long v12 = (char *)v10;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    unint64_t v13 = *a4;
    *(void *)&v25.st_dev = _NSConcreteStackBlock;
    v25.st_ino = 3221225472;
    *(void *)&v25.st_uid = sub_100020634;
    *(void *)&v25.st_rdev = &unk_10002E470;
    v25.st_atimespec.tv_nsec = v10;
    v25.st_mtimespec.tv_sec = a3;
    v25.st_atimespec.tv_sec = (__darwin_time_t)&v21;
    int v14 = &v25;
    unint64_t v15 = 0;
    do
    {
      if (v13 - v15 < 0x10) {
        break;
      }
      unint64_t v16 = *(void *)&v12[v15 + 8];
      if (v13 - 16 - v15 < v16) {
        break;
      }
      if (!(*(unsigned int (**)(stat *))&v25.st_uid)(v14)) {
        break;
      }
      unint64_t v15 = (v15 + v16 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v15 - 1 < v13);

    if (munmap(v12, *a4) == -1)
    {
      __error();
      _os_assumes_log();
    }
    BOOL v11 = *((unsigned char *)v22 + 24) != 0;
    _Block_object_dispose(&v21, 8);
  }
  return v11;
}

uint64_t sub_10001EFE0(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  int v4 = openat(dword_100031BF8, *(const char **)(a1 + 8), 1048832);
  if (v4 == -1)
  {
    __error();
    _os_assumes_log();
    goto LABEL_6;
  }
  int v5 = v4;
  if (v4 < 0)
  {
LABEL_6:
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002039C;
  block[3] = &unk_10002E498;
  int v10 = v4;
  void block[5] = a1;
  void block[6] = a2;
  void block[4] = &v11;
  dispatch_sync((dispatch_queue_t)qword_10003E938, block);
  if (close(v5) != -1)
  {
LABEL_4:
    uint64_t v6 = v12[3];
LABEL_7:
    _Block_object_dispose(&v11, 8);
    return v6;
  }
  int v8 = *__error();
  uint64_t result = *__error();
  if (v8 != 9)
  {
    _os_assumes_log();
    __error();
    _os_assumes_log();
    goto LABEL_4;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

uint64_t sub_10001F174(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(*(void *)(result + 40) + 24) - 1;
  return result;
}

uint64_t sub_10001F18C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1000202F0;
  v7[3] = &unk_10002E550;
  int v8 = a1;
  void v7[4] = &v9;
  v7[5] = a2;
  v7[6] = a5;
  unsigned char v7[7] = a3;
  v7[8] = a4;
  v7[9] = &off_100031C90;
  dispatch_sync((dispatch_queue_t)qword_10003E938, v7);
  uint64_t v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_10001F27C(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)a2;
  if (*(void *)(result + 32) != a2)
  {
    if (v4 != 24589)
    {
      if (v4 == 24587)
      {
        uint64_t v5 = *(void *)(result + 48);
        if (*(void *)(v5 + 32))
        {
          sub_10001F51C(*(void *)(result + 48));
          uint64_t v5 = *(void *)(v3 + 48);
        }
        uint64_t v6 = sub_100022890((_DWORD *)a2);
        *(void *)(v5 + 32) = v6;
        if (v6)
        {
          *(void *)(v5 + 48) = *(void *)(v6 + 64);
          *(_DWORD *)(v5 + 124) = *(_DWORD *)(v5 + 112);
          sub_10001F914(v5, 0);
          sub_100003314();
        }
      }
      return 1;
    }
    uint64_t v8 = *(void *)(result + 48);
    if (*(void *)(v8 + 32))
    {
      uint64_t v9 = *(void *)(v8 + 48);
      if (v9)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        char v19 = sub_10001F9BC;
        CFStringRef v20 = &unk_10002E4E0;
        uint64_t v21 = v8;
        unsigned int v10 = *(_DWORD *)(v9 + 32);
        if (v10) {
          size_t v11 = v10;
        }
        else {
          size_t v11 = 0x10000;
        }
        if (v10) {
          compression_algorithm v12 = *(_DWORD *)(v9 + 36);
        }
        else {
          compression_algorithm v12 = COMPRESSION_LZ4;
        }
        if (!v12)
        {
          uint64_t v13 = (uint8_t *)(a2 + 16);
          size_t v11 = *(void *)(a2 + 8);
          goto LABEL_31;
        }
        uint64_t v13 = (uint8_t *)_os_trace_malloc();
        size_t v14 = compression_decode_buffer(v13, v11, (const uint8_t *)(a2 + 16), *(void *)(a2 + 8), 0, v12);
        if (!v14)
        {
          free(v13);
          uint64_t v13 = 0;
LABEL_39:
          free(v13);
LABEL_40:
          *(void *)(*(void *)(v3 + 48) + 48) = **(void **)(*(void *)(v3 + 48) + 48);
          return 1;
        }
        size_t v15 = v14;
        if (v10)
        {
          if (v14 == v11) {
            goto LABEL_28;
          }
          _os_assumes_log();
        }
        size_t v11 = v15;
LABEL_28:
        if (!v13) {
          goto LABEL_39;
        }
LABEL_31:
        unint64_t v16 = 0;
        do
        {
          if (v11 - v16 < 0x10) {
            break;
          }
          unint64_t v17 = *(void *)&v13[v16 + 8];
          if (v11 - v16 - 16 < v17) {
            break;
          }
          if (!v19((uint64_t)v18)) {
            break;
          }
          unint64_t v16 = (v16 + v17 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v16 - 1 < v11);
        if (!v12) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
    }
    return 1;
  }
  if (v4 != 4096 || *(void *)(a2 + 8) < 0x28uLL) {
    return 0;
  }
  unint64_t v7 = *(void *)(result + 40);
  if (v7 >= 0xFFFFFFFFFFFFFFE0)
  {
    __break(0x5513u);
    return result;
  }
  uint64_t result = sub_10000D42C(**(void ***)(v7 + 32), (void *)(a2 + 144));
  if (result)
  {
    *(void *)(*(void *)(v3 + 48) + 8) = a2 + 144;
    sub_10001F914(*(void *)(v3 + 48), a2);
    return 1;
  }
  return result;
}

void sub_10001F51C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 136)) {
    sub_10001F794(a1);
  }
  int v2 = *(_DWORD *)(a1 + 124);
  if (v2 + 1 == *(_DWORD *)(a1 + 112))
  {
    *(_DWORD *)(a1 + 112) = v2;
LABEL_17:
    sub_1000037AC(*(void *)(a1 + 32));
    sub_1000037AC(*(void *)(a1 + 88));
    *(void *)(a1 + 88) = 0;
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 48) = 0;
    return;
  }
  uint64_t v3 = *(void *)(a1 + 88);
  if (*(void *)(v3 + 80)) {
    int v4 = **(void ***)(*(void *)(v3 + 72) + 8);
  }
  else {
    int v4 = sub_10000EC9C(v3);
  }
  unint64_t v6 = v4[2];
  unint64_t v5 = v4[3];
  if (v6 < *(void *)(a1 + 16)) {
    *(void *)(a1 + 16) = v6;
  }
  if (v5 > *(void *)(a1 + 24)) {
    *(void *)(a1 + 24) = v5;
  }
  unint64_t v7 = sub_10000CBDC(*(void ***)(a1 + 88));
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v9 = *(unsigned int *)(a1 + 124);
  if (!__CFADD__(v8, 16 * v9))
  {
    uint64_t v10 = v7[1];
    if ((v10 & 7) != 0) {
      unint64_t v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 24;
    }
    else {
      unint64_t v11 = v10 + 16;
    }
    compression_algorithm v12 = (void *)(v8 + 16 * v9);
    *compression_algorithm v12 = v7;
    v12[1] = v11;
    *(_DWORD *)(a1 + 120) += v11;
    goto LABEL_17;
  }
  __break(0x5513u);
}

uint64_t sub_10001F610(uint64_t a1)
{
  if (faccessat(*(_DWORD *)(a1 + 80), *(const char **)(a1 + 40), 0, 0) != -1)
  {
    int v2 = *(_DWORD *)(a1 + 84);
    uint64_t v3 = *(void *)(a1 + 48);
    int v4 = *(_OWORD **)(v3 + 8);
    long long v5 = *(_OWORD *)(v3 + 16);
    *(void *)&v15[12] = 0xAAAAAAAAAAAAAAAALL;
    int value = 1;
    long long v16 = v5;
    *(_OWORD *)size_t v15 = *v4;
    if (fsetxattr(v2, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
    {
      __error();
      _os_assumes_log();
    }
    fsync(*(_DWORD *)(a1 + 84));
    if (renameat(*(_DWORD *)(a1 + 80), "tmp", *(_DWORD *)(a1 + 80), *(const char **)(a1 + 40)) != -1)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 56)
                                                                  - *(unsigned int *)(*(void *)(a1 + 48) + 120);
      uint64_t result = sub_1000054CC(*(void **)(a1 + 64), "    - [ %s/%s, %zd, %d ]\n", v6, v7, v8, v9, v10, v11, *(void *)(*(void *)(a1 + 72) + 8));
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if (!__OFSUB__(atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(a1 + 72) + 56), -v13, memory_order_relaxed), v13))return result; {
      __break(0x5515u);
      }
    }
  }
  uint64_t result = unlinkat(*(_DWORD *)(a1 + 80), "tmp", 0);
  if (result == -1)
  {
    __error();
    return _os_assumes_log();
  }
  return result;
}

uint64_t sub_10001F794(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  int v2 = __b;
  memset(__b, 170, sizeof(__b));
  int v3 = 256;
  size_t v4 = compression_encode_buffer(__b, 0x10000uLL, *(const uint8_t **)(v1 + 128), *(unsigned int *)(v1 + 136), 0, COMPRESSION_LZ4);
  if (v4)
  {
    size_t v5 = v4;
  }
  else
  {
    int v3 = 0;
    int v2 = *(uint8_t **)(v1 + 128);
    size_t v5 = *(unsigned int *)(v1 + 136);
  }
  size_t v6 = v5 + 16;
  uint64_t result = _os_trace_malloc();
  uint64_t v8 = result;
  if ((v5 & 7) != 0)
  {
    if ((v6 & 0x8000000000000000) != 0 || ((v5 + 16) & 0xFFFFFFFFFFFFFFF8) > ~result)
    {
      __break(0x5513u);
      return result;
    }
    *(void *)(result + (v6 & 0xFFFFFFFFFFFFFFF8)) = 0;
  }
  *(void *)uint64_t result = 0x110000600DLL;
  *(void *)(result + 8) = v5;
  memcpy((void *)(result + 16), v2, v5);
  sub_10001F914(v1, v8);
  uint64_t v9 = *(void *)(v1 + 88);
  int v10 = *(_DWORD *)(v1 + 136);
  if (*(void *)(v9 + 80))
  {
    uint64_t v11 = **(void ***)(*(void *)(v9 + 72) + 8);
  }
  else
  {
    uint64_t v11 = sub_10000EC9C(v9);
    uint64_t v9 = *(void *)(v1 + 88);
  }
  *((_DWORD *)v11 + 8) = v10;
  *((_DWORD *)v11 + 9) = v3;
  uint64_t result = (uint64_t)sub_10000EC9C(v9);
  *(_DWORD *)(v1 + 136) = 0;
  return result;
}

uint64_t sub_10001F914(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 112);
  if (v4 == *(_DWORD *)(result + 116))
  {
    unsigned int v5 = 2 * v4;
    if (v5 <= 0x10) {
      unsigned int v5 = 16;
    }
    *(_DWORD *)(result + 116) = v5;
    uint64_t result = _os_trace_realloc();
    *(void *)(v3 + 104) = result;
  }
  if (a2)
  {
    uint64_t v6 = *(void *)(a2 + 8);
    unint64_t v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
    unint64_t v8 = v6 + 16;
    if ((*(void *)(a2 + 8) & 7) != 0) {
      unint64_t v8 = v7;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  uint64_t v9 = *(void *)(v3 + 104);
  uint64_t v10 = *(unsigned int *)(v3 + 112);
  *(_DWORD *)(v3 + 112) = v10 + 1;
  if (__CFADD__(v9, 16 * v10))
  {
    __break(0x5513u);
  }
  else
  {
    uint64_t v11 = (void *)(v9 + 16 * v10);
    *uint64_t v11 = a2;
    v11[1] = v8;
    *(_DWORD *)(v3 + 120) += v8;
  }
  return result;
}

uint64_t sub_10001F9BC(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(v1 + 32);
  int v5 = *v2;
  if ((*v2 - 24578) < 2) {
    goto LABEL_4;
  }
  if (v5 != 24577)
  {
    if (v5 != 24580) {
      return 1;
    }
LABEL_4:
    unsigned int v6 = *((unsigned __int8 *)v2 + 28);
    if (!*((unsigned char *)v2 + 28)) {
      return 1;
    }
    uint64_t v7 = *(void *)v4;
    uint64_t v8 = 1;
    uint64_t v9 = 2;
    uint64_t v10 = 3;
    if (v6 >= 0xF) {
      uint64_t v10 = 4;
    }
    if (v6 >= 8) {
      uint64_t v9 = v10;
    }
    if (v6 >= 4) {
      uint64_t v8 = v9;
    }
    if (v6 == 1) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v8;
    }
    if (__CFADD__(v7, 8 * v11)) {
      goto LABEL_157;
    }
    unint64_t v12 = *((void *)v2 + 4);
    uint64_t v13 = *(void *)(v7 + 8 * v11);
    uint64_t v14 = sub_10000D42C(*(void **)v13, *(void **)(v4 + 8));
    if (!v14 || v14 == 1 && *(void *)(v13 + 8) > v12) {
      return 1;
    }
    goto LABEL_34;
  }
  unint64_t v15 = *((void *)v2 + 1);
  unint64_t v16 = v15 - 16;
  if (v15 < 0x10) {
    goto LABEL_155;
  }
  unint64_t v17 = v2 + 8;
  if (v15 - 4113 < 0xFFFFFFFFFFFFF00FLL) {
    goto LABEL_32;
  }
  unint64_t v18 = *((unsigned __int16 *)v2 + 16);
  if (v16 < v18) {
    goto LABEL_155;
  }
  uint64_t v19 = *((unsigned __int16 *)v2 + 17);
  if (v19 > 0xFFF) {
    goto LABEL_32;
  }
  if (*((unsigned char *)v2 + 29))
  {
    if (v16 <= v18 + (unsigned __int16)(4096 - v19))
    {
      if (v18 > 0x1000) {
        goto LABEL_158;
      }
      if (__CFADD__(v17, v18)) {
        goto LABEL_157;
      }
      uint64_t v20 = (unsigned __int16)(4096 - v19);
      uint64_t v21 = (uint64_t)v17 + v18;
      goto LABEL_31;
    }
LABEL_32:
    *(void *)(v4 + 64) = 0;
    *(void *)(v4 + 72) = 0;
    goto LABEL_33;
  }
  if (v16 != 4096) {
    goto LABEL_32;
  }
  if (__CFADD__(v17, v19)) {
    goto LABEL_157;
  }
  uint64_t v21 = (uint64_t)v17 + v19;
  uint64_t v20 = (unsigned __int16)(4096 - v19);
LABEL_31:
  *(void *)(v4 + 64) = v21;
  *(void *)(v4 + 72) = v20;
LABEL_33:
  *(void *)(v4 + 56) = v17;
LABEL_34:
  uint64_t v22 = sub_10000FA14(*(void **)(*(void *)(v4 + 32) + 40), *((void *)v3 + 2), v3[6]);
  *(void *)(v4 + 4sub_100024C38(qword_10003E7A8, 0) = v22;
  if (!v22) {
    goto LABEL_155;
  }
  uint64_t v23 = *((void *)v3 + 1);
  if ((v23 & 7) != 0) {
    unsigned int v24 = (v23 & 0xFFFFFFF8) + 24;
  }
  else {
    unsigned int v24 = v23 + 16;
  }
  if (*(_DWORD *)(v4 + 136) + v24 > *(_DWORD *)(v4 + 140)) {
    sub_10001F794(v4);
  }
  if (*v3 != 24577)
  {
    memcpy((void *)(*(void *)(v4 + 128) + *(unsigned int *)(v4 + 136)), v3, v24);
    *(_DWORD *)(v4 + 136) += v24;
    sub_10000DA90(*(void *)(v4 + 88), *((void *)v3 + 4));
    uint64_t v79 = sub_10000F3FC(*(void *)(v4 + 88), *(void *)(v4 + 40));
    *(void *)(v4 + 8sub_100024C38(qword_10003E7A8, 0) = v79;
    sub_10000F988(*(void *)(v4 + 88), v79);
    *(void *)(v4 + 8sub_100024C38(qword_10003E7A8, 0) = 0;
    *(void *)(v4 + 4sub_100024C38(qword_10003E7A8, 0) = 0;
    return 1;
  }
  memset(&__src[2], 170, 0xFF0uLL);
  stat v25 = *(size_t **)(v4 + 56);
  __src[1] = v25[1];
  size_t v26 = *v25;
  LODWORD(v26) = 268435472;
  __src[0] = v26;
  *(void *)(v4 + 96) = __src;
  unint64_t v27 = v25 + 2;
  unint64_t v28 = *(unsigned __int16 *)v25;
  unint64_t v29 = (unint64_t)(v25 + 2);
  if (v28 <= 0x1000)
  {
    if (__CFADD__(v25, v28)) {
      goto LABEL_157;
    }
    unint64_t v29 = (unint64_t)v25 + v28;
  }
  long long v96 = v3;
  tm v97 = v3 + 4;
  while (1)
  {
    unint64_t v30 = (unint64_t)(v27 + 3);
    if ((unint64_t)(v27 + 3) >= v29) {
      break;
    }
    int v31 = v27;
    unint64_t v32 = v27[2];
    unint64_t v33 = HIWORD(v32);
    if (!HIWORD(v32) || (uint64_t)v33 > (uint64_t)(v29 - v30)) {
      break;
    }
    uint64_t v35 = v33 + 24;
    if ((v32 & 0x7000000000000) != 0) {
      uint64_t v35 = (HIWORD(v32) & 0xFFF8) + 32;
    }
    if (__CFADD__(v27, v35)) {
      goto LABEL_157;
    }
    unint64_t v27 = (void *)((char *)v27 + v35);
    uint64_t v36 = *(void *)v31;
    if (*(void *)v31 && (v36 | 2) == 6)
    {
      __int16 v37 = WORD1(*(void *)v31);
      if ((v36 & 0x10000) == 0)
      {
        uint64_t v38 = 0;
        if ((v36 & 0x100000) == 0) {
          goto LABEL_58;
        }
        goto LABEL_67;
      }
      if (v32 >> 51)
      {
        uint64_t v38 = 8;
        if ((v36 & 0x100000) == 0)
        {
LABEL_58:
          if ((v36 & 0x1000000) == 0) {
            goto LABEL_59;
          }
          goto LABEL_70;
        }
LABEL_67:
        if (v38 + 8 <= v33)
        {
          if (__CFADD__(v30, v38)) {
            goto LABEL_157;
          }
          v38 += 8;
          if ((v36 & 0x1000000) == 0)
          {
LABEL_59:
            LODWORD(v39) = 0;
            unint64_t v40 = 0;
            unint64_t v41 = v38;
            uint64_t v38 = 0;
            goto LABEL_60;
          }
LABEL_70:
          unint64_t v41 = v38 + 4;
          if (v38 + 4 <= v33)
          {
            if (__CFADD__(v30, v38)) {
              goto LABEL_157;
            }
            unint64_t v40 = *(unsigned __int16 *)(v30 + v38);
            uint64_t v39 = *(unsigned __int16 *)(v30 + v38 + 2);
            if (v39 + v40 <= 0x1000 && 4096 - *(void *)(v4 + 72) <= v40)
            {
LABEL_60:
              uint64_t v42 = *(void *)(v4 + 40);
              if (*(_WORD *)(v42 + 2)) {
                unsigned int v43 = 4;
              }
              else {
                unsigned int v43 = 6;
              }
              switch(v37 & 0xE)
              {
                case 2:
                case 4:
                case 6:
                  unsigned int v43 = 4;
                  break;
                case 8:
                  break;
                case 0xA:
                  unsigned int v43 = 20;
                  break;
                case 0xC:
                  unsigned int v43 = 6;
                  break;
                default:
                  unsigned int v43 = 0;
                  break;
              }
              unint64_t v44 = v41 + v43;
              if (v44 <= v33)
              {
                unint64_t v45 = ~v30;
                if (~v30 < v41) {
                  goto LABEL_157;
                }
                if (v43)
                {
                  uint64_t v46 = (unsigned int *)(v30 + v41);
                  if (v43 == 6)
                  {
                    uint64_t v99 = *((unsigned __int16 *)v46 + 2);
                    int v100 = 0;
                  }
                  else
                  {
                    if (v43 == 4) {
                      uint64_t v47 = 0;
                    }
                    else {
                      uint64_t v47 = (uint64_t *)(v46 + 1);
                    }
                    uint64_t v99 = 0;
                    int v100 = v47;
                  }
                  uint64_t v98 = *v46;
                  if ((v37 & 0x20) != 0)
                  {
                    unint64_t v48 = v44 + 2;
                    if (v44 + 2 <= v33)
                    {
                      if (v44 > v45) {
                        goto LABEL_157;
                      }
                      goto LABEL_91;
                    }
                  }
                  else
                  {
                    unint64_t v48 = v44;
LABEL_91:
                    unsigned int __n = v39;
                    unint64_t v102 = v40;
                    if ((*(void *)v31 & 0x2000000) != 0)
                    {
                      BOOL v49 = v27;
                      unint64_t v50 = v29;
                      unint64_t v51 = v48 + 2;
                      if (v48 + 2 > v33)
                      {
                        uint64_t v103 = 0;
                        __int16 v101 = -21846;
                        unint64_t v48 = HIWORD(v32);
                      }
                      else
                      {
                        if (v48 > v45) {
                          goto LABEL_157;
                        }
                        __int16 v101 = *(_WORD *)(v30 + v48);
                        __int16 v105 = v101;
                        uint64_t v103 = sub_10000EA0C(*(void *)(v42 + 64), (uint64_t)&v105);
                        unint64_t v32 = *((void *)v31 + 2);
                        __int16 v37 = *((_WORD *)v31 + 1);
                        unint64_t v33 = HIWORD(v32);
                        unint64_t v48 = v51;
                      }
                      unint64_t v29 = v50;
                      unint64_t v27 = v49;
                      if ((v37 & 0x400) != 0) {
                        goto LABEL_98;
                      }
                    }
                    else
                    {
                      uint64_t v103 = 0;
                      __int16 v101 = -21846;
                      if ((*(void *)v31 & 0x4000000) != 0)
                      {
LABEL_98:
                        if (v48 < v33)
                        {
                          if (v48 > v45) {
                            goto LABEL_157;
                          }
                          unsigned int v52 = *(unsigned __int8 *)(v30 + v48);
                          if (*(unsigned char *)(v30 + v48))
                          {
                            if (v52 == 1)
                            {
                              uint64_t v53 = 0;
                            }
                            else if (v52 >= 4)
                            {
                              if (v52 >= 8)
                              {
                                BOOL v54 = v52 >= 0xF;
                                uint64_t v53 = 3;
                                if (v54) {
                                  uint64_t v53 = 4;
                                }
                              }
                              else
                              {
                                uint64_t v53 = 2;
                              }
                            }
                            else
                            {
                              uint64_t v53 = 1;
                            }
                            if (__CFADD__(*(void *)v4, 8 * v53)) {
                              goto LABEL_157;
                            }
                            uint64_t v55 = *(void *)(*(void *)(v4 + 56) + 8);
                            uint64_t v56 = *(void *)(*(void *)v4 + 8 * v53);
                            uint64_t v57 = sub_10000D42C(*(void **)v56, *(void **)(v4 + 8));
                            if (v57)
                            {
                              unint64_t v58 = v55 + (v32 & 0xFFFFFFFFFFFFLL);
                              if (v57 != 1 || *(void *)(v56 + 8) <= v58)
                              {
                                if (!*(void *)(v4 + 80))
                                {
                                  uint64_t v59 = sub_10000F3FC(*(void *)(v4 + 88), *(void *)(v4 + 40));
                                  *(void *)(v4 + 8sub_100024C38(qword_10003E7A8, 0) = v59;
                                  sub_10000F988(*(void *)(v4 + 88), v59);
                                  __int16 v37 = *((_WORD *)v31 + 1);
                                }
                                int v60 = v37 & 0xE;
                                if (v60 == 10)
                                {
                                  uint64_t v64 = *(void *)(*(void *)(v4 + 88) + 16);
                                  uint64_t v61 = v103;
                                  if (v64) {
                                    uint64_t v65 = *(void *)(v64 + 24);
                                  }
                                  else {
                                    uint64_t v65 = 0;
                                  }
                                  sub_10000F568((float *)v64, v100, v65);
                                  goto LABEL_123;
                                }
                                uint64_t v61 = v103;
                                if (v60 == 8)
                                {
                                  uint64_t v62 = sub_100022670(*(unsigned int **)(*(void *)(v4 + 40) + 56), v98 | (v99 << 32));
                                  if (v62)
                                  {
                                    *(void *)&v110[10] = 0xAAAAAAAAAAAAAAAALL;
                                    uint64_t v63 = *(void *)v62;
                                    uint64_t v107 = *(void *)(v62 + 8);
                                    int v108 = v63;
                                    __int16 v109 = WORD2(v63);
                                    *(_OWORD *)uint64_t v110 = *(_OWORD *)(v62 + 16);
                                    sub_100010788(*(void *)(v4 + 88), *(void *)(v4 + 80), (uint64_t)&v107);
                                    uint64_t v61 = v103;
                                    goto LABEL_123;
                                  }
                                }
                                else
                                {
LABEL_123:
                                  if (v61)
                                  {
                                    uint64_t v66 = *(void *)(v4 + 80);
                                    uint64_t v67 = *(void *)(v4 + 88);
                                    __int16 v105 = v101;
                                    if (!sub_10000EA0C(*(void *)(v66 + 64), (uint64_t)&v105)) {
                                      sub_10000ED60(v67, v66, v105, *(char **)(v61 + 8), *(char **)(v61 + 16));
                                    }
                                    uint64_t v68 = *(void *)(v4 + 88);
                                    __int16 v69 = (unsigned __int16)sub_10000E268(*(void **)(v68 + 24), *(char **)(v61 + 8));
                                    sub_10000E994(v68, v69);
                                    __int16 v70 = (unsigned __int16)sub_10000E268(*(void **)(v68 + 24), *(char **)(v61 + 16));
                                    sub_10000E994(v68, v70);
                                  }
                                  sub_10000DA90(*(void *)(v4 + 88), v58);
                                  unint64_t v71 = *(void *)(v4 + 96);
                                  unint64_t v72 = *(unsigned __int16 *)v71;
                                  if (v72 > 0x1000) {
                                    goto LABEL_158;
                                  }
                                  if (~v71 < v72) {
                                    goto LABEL_157;
                                  }
                                  uint64_t v73 = (char *)(v71 + v72);
                                  unint64_t v74 = *((void *)v31 + 2);
                                  if ((v74 & 0x7000000000000) != 0) {
                                    uint64_t v75 = (HIWORD(v74) & 0xFFF8) + 32;
                                  }
                                  else {
                                    uint64_t v75 = HIWORD(v74) + 24;
                                  }
                                  memcpy(v73, v31, (unsigned __int16)v75);
                                  *(_WORD *)v71 += v75;
                                  if (v31[3])
                                  {
                                    uint64_t v76 = *(void *)(v4 + 72);
                                    unsigned __int16 v77 = *(_WORD *)(v71 + 2) - __n;
                                    *(_WORD *)(v71 + 2) = v77;
                                    if (v77 > 0x1000u) {
                                      goto LABEL_158;
                                    }
                                    if (~v71 < v77) {
                                      goto LABEL_157;
                                    }
                                    memcpy((void *)(v71 + v77), (const void *)(*(void *)(v4 + 64) + v102 + v76 - 4096), __n);
                                    if (__CFADD__(v73 + 24, v38)) {
                                      goto LABEL_157;
                                    }
                                    int v78 = (unsigned __int16 *)&v73[v38 + 24];
                                    *int v78 = v77;
                                    v78[1] = __n;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (*(void *)(v4 + 80))
  {
    size_t v80 = LOWORD(__src[0]);
    uint64_t v81 = WORD1(__src[0]);
    unsigned int v82 = LOWORD(__src[0]) - WORD1(__src[0]) + 4096;
    BOOL v83 = v82 < 0xFF9;
    if (v82 >= 0xFF9) {
      unsigned int v82 = 4096;
    }
    if (WORD1(__src[0]) == 4096) {
      size_t v84 = LOWORD(__src[0]);
    }
    else {
      size_t v84 = v82;
    }
    BOOL v85 = WORD1(__src[0]) != 4096 && v83;
    int v86 = (void *)(*(void *)(v4 + 128) + *(unsigned int *)(v4 + 136));
    *int v86 = 24577;
    v86[1] = v84 + 16;
    uint64_t v87 = (*(_DWORD *)(v4 + 136) + 16);
    *(_DWORD *)(v4 + 136) = v87;
    LOWORD(v86) = *((_WORD *)v96 + 15);
    uint64_t v88 = *(void *)(v4 + 128) + v87;
    uint64_t v89 = *(void *)v97;
    int v90 = v97[2];
    *(unsigned char *)(v88 + 12) = *((unsigned char *)v97 + 12);
    *(_DWORD *)(v88 + 8) = v90;
    *(void *)uint64_t v88 = v89;
    *(unsigned char *)(v88 + 13) = v85;
    *(_WORD *)(v88 + 14) = (_WORD)v86;
    uint64_t v91 = (*(_DWORD *)(v4 + 136) + 16);
    *(_DWORD *)(v4 + 136) = v91;
    int v92 = (void *)(*(void *)(v4 + 128) + v91);
    if (v85)
    {
      memcpy(v92, __src, v80);
      uint64_t v93 = (*(_DWORD *)(v4 + 136) + v80);
      *(_DWORD *)(v4 + 136) = v93;
      if (v81 <= 0x1000)
      {
        if (!__CFADD__(__src, v81))
        {
          memcpy((void *)(*(void *)(v4 + 128) + v93), (char *)__src + v81, 4096 - v81);
          int v94 = *(_DWORD *)(v4 + 136) + 4096 - v81;
          goto LABEL_153;
        }
LABEL_157:
        __break(0x5513u);
      }
LABEL_158:
      __break(0x5512u);
      JUMPOUT(0x1000202C4);
    }
    memcpy(v92, __src, v84);
    int v94 = *(_DWORD *)(v4 + 136) + v84;
LABEL_153:
    *(_DWORD *)(v4 + 136) = v94;
  }
  *(void *)(v4 + 8sub_100024C38(qword_10003E7A8, 0) = 0;
  *(void *)(v4 + 4sub_100024C38(qword_10003E7A8, 0) = 0;
  *(void *)(v4 + 96) = 0;
LABEL_155:
  *(void *)(v4 + 56) = 0;
  return 1;
}

uint64_t sub_1000202F0(uint64_t a1)
{
  uint64_t result = unlinkat(*(_DWORD *)(a1 + 80), *(const char **)(a1 + 40), 0);
  if (result != -1)
  {
    uint64_t v9 = *(void *)(a1 + 56);
    **(unsigned char **)(a1 + 48) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
    uint64_t result = sub_1000054CC(*(void **)(a1 + 64), "    - [ %s/%s, %zd, 0 ]\n", v3, v4, v5, v6, v7, v8, *(void *)(*(void *)(a1 + 72) + 8));
    uint64_t v10 = *(void *)(a1 + 72);
    int v11 = *(_DWORD *)(v10 + 64);
    BOOL v12 = __OFSUB__(v11, 1);
    int v13 = v11 - 1;
    if (v12
      || (*(_DWORD *)(v10 + 64) = v13,
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24),
          __OFSUB__(atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 56), -v14, memory_order_relaxed), v14)))
    {
      __break(0x5515u);
    }
  }
  return result;
}

uint64_t sub_10002039C(uint64_t a1)
{
  *(void *)&v24[24] = 0;
  uint64_t v2 = sub_10001A108(*(void *)(a1 + 40));
  memset(&v24[32], 170, 0x400uLL);
  *(void *)&v24[16] = 0xAA00000000100000;
  *(void *)unsigned int v24 = &v24[32];
  *(void *)&v24[8] = 0x40000000000;
  sub_10001A1D4((tm *)v24, *(void *)(a1 + 40), (uint64_t)"Periodic Compaction", 0, v3, v4, v5, v6, v22);
  if ((int)v2 < 1)
  {
    *(_DWORD *)(*(void *)(a1 + 40) + 64) = v2;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      if (__CFADD__(*(void *)&v24[24], v7)) {
        __break(0x5513u);
      }
      uint64_t v9 = (const char *)(*(void *)(*(void *)&v24[24] + 8 * v8) + 21);
      size_t v23 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t result = sub_10001ED4C(*(_DWORD *)(a1 + 56), v9, *(void *)(a1 + 48), &v23);
      if (!result) {
        break;
      }
      if (unlinkat(*(_DWORD *)(a1 + 56), v9, 0) == -1)
      {
        __error();
        _os_assumes_log();
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v23;
      sub_1000054CC(v24, "    - %s/%s\n", v15, v16, v17, v18, v19, v20, *(void *)(*(void *)(a1 + 40) + 8));
      uint64_t result = sub_10001A3A8(v9);
      *(void *)(*(void *)(a1 + 40) + 32) = result;
      ++v8;
      v7 += 8;
      if (v2 == v8)
      {
        uint64_t v8 = v2;
        break;
      }
    }
    if (__OFSUB__(v2, v8))
    {
      __break(0x5515u);
      return result;
    }
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)(v21 + 64) = v2 - v8;
    if (v8) {
      sub_10001A440(v24, v21, v8, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), v11, v12, v13, v14);
    }
  }
  if (v24[20]) {
    free(*(void **)v24);
  }
  return _os_trace_scandir_free_namelist();
}

uint64_t sub_10002059C(int a1, char *a2, void *a3)
{
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v6.st_blkmach_vm_size_t size = v4;
  *(timespec *)v6.st_qspare = v4;
  v6.st_birthtimespec = v4;
  *(timespec *)&v6.st_mach_vm_size_t size = v4;
  v6.st_mtimespec = v4;
  v6.st_ctimespec = v4;
  *(timespec *)&v6.st_uid = v4;
  v6.st_atimespec = v4;
  *(timespec *)&v6.st_dev = v4;
  uint64_t result = lstat(a2, &v6);
  if (result) {
    return 0;
  }
  if (!__OFADD__(*a3, v6.st_size))
  {
    *a3 += v6.st_size;
    return 0;
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_100020634(uint64_t a1, int *a2)
{
  int v3 = *a2;
  if (*(int **)(a1 + 40) == a2)
  {
    if (v3 == 4096 && *((void *)a2 + 1) >= 0x28uLL)
    {
      uint64_t result = sub_10000D42C(**(void ***)(a1 + 48), (void *)a2 + 18);
      if (result != 1)
      {
        uint64_t v7 = result;
        uint64_t result = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7 == 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else if (v3 == 24587 && (uint64_t v4 = sub_100022890(a2)) != 0)
  {
    uint64_t v5 = (void *)(v4 + 64);
    while (1)
    {
      uint64_t v5 = (void *)*v5;
      if (!v5) {
        break;
      }
      if (v5[3] >= *(void *)(*(void *)(a1 + 48) + 8))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
        break;
      }
    }
    sub_1000037AC(v4);
    return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) != 0;
  }
  else
  {
    return 1;
  }
  return result;
}

void sub_10002071C(void *a1, void *a2, uint64_t *a3)
{
  memset(uu, 170, sizeof(uu));
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v5;
  *(_OWORD *)&out[16] = v5;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];
  if (([v8 isNSDictionary] & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:@"ContinuousTime"];
  if (([v9 isNSNumber] & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  id v10 = [v9 unsignedLongLongValue];
  *(void *)&v29[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long in = v11;
  *(_OWORD *)unint64_t v29 = v11;
  uint64_t v12 = [v8 objectForKeyedSubscript:@"UUID"];

  if (![v12 isNSString]
    || ([v12 getCString:in maxLength:37 encoding:1] & 1) == 0)
  {

    goto LABEL_10;
  }
  int v13 = uuid_parse(in, uu);

  if (!v13)
  {
    uint64_t v14 = (void **)*a3;
    uint64_t v15 = *a3 ? v14[3] : 0;
    uint64_t v19 = sub_10000D42C((void *)*a3, uu);
    if (v19)
    {
      uint64_t v20 = (id *)(a3 + 1);
      unint64_t v21 = v19 - 1;
      if (v19 == 1)
      {
        id v22 = *v20;
        if (*v20 <= v10) {
          id v22 = v10;
        }
        *uint64_t v20 = v22;
      }
      else
      {
        *uint64_t v20 = v10;
        if ((unint64_t)v15 > v21)
        {
          memmove(a3 + 3, &a3[2 * v21 + 3], 16 * (uint64_t)((uint64_t)v15 - v21));
          sub_100012F78(v14);
          operator new();
        }
        if (v14) {
          size_t v23 = 16 * (void)v14[3];
        }
        else {
          size_t v23 = 0;
        }
        *uint64_t v20 = 0;
        a3[2] = 0;
        bzero(a3 + 3, v23);
        sub_100011BC4(v14);
      }
    }
  }
LABEL_11:
  uuid_unparse_upper((const unsigned __int8 *)a3 + 24, out);
  uint64_t v16 = +[NSString stringWithUTF8String:out, @"UUID"];
  v24[1] = @"ContinuousTime";
  v25[0] = v16;
  uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:a3[1]];
  v25[1] = v17;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  [v7 setObject:v18 forKeyedSubscript:v6];
}

void sub_100020A00(id a1)
{
  memset(&v1[56], 170, 0x3C8uLL);
  strcpy(v1, "Received a Cancel Request from CacheDelete. Ignoring...");
  sub_100016E68((uint64_t)v1);
}

__CFDictionary *__cdecl sub_100020A8C(id a1, int a2, __CFDictionary *a3)
{
  uint64_t v24 = 0;
  stat v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  id v6 = [(__CFDictionary *)a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  id v7 = [v6 longLongValue];

  unint64_t v23 = (unint64_t)v7;
  memset(__b, 170, 0x400uLL);
  uint64_t v8 = (const char *)[[-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME") UTF8String];
  snprintf(__b, 0x400uLL, "Received a Purge Request from CacheDelete on volume %s with urgency: %d and goal: %lld", v8, a2, v21[3]);
  sub_100016E68((uint64_t)__b);
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  if (sub_10001CA10((const char *)qword_10003E998, a3))
  {
    if (a2 == 2) {
      int v9 = 2;
    }
    else {
      int v9 = 3;
    }
    if (a2 <= 1) {
      int v9 = 1;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    uint64_t v15 = sub_100020DF8;
    uint64_t v16 = &unk_10002E3C8;
    int v19 = v9;
    uint64_t v17 = &v20;
    uint64_t v18 = &v24;
    sub_100020DF8((uint64_t)v14, (uint64_t)&off_100031DB0);
    v15((uint64_t)v14, (uint64_t)&off_100031D20);
    v15((uint64_t)v14, (uint64_t)&off_100031C00);
    v15((uint64_t)v14, (uint64_t)&off_100031C90);
  }
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  if (sub_10001CA10((const char *)qword_10003E9A8, a3))
  {
    memset(&__b[19], 170, 0x3EDuLL);
    strcpy(__b, "Purging UUID Cache");
    sub_100016E68((uint64_t)__b);
    sub_10001AAF0();
  }
  uint64_t v10 = v25[3];
  memset(__b, 170, 0x400uLL);
  snprintf(__b, 0x400uLL, "Purge complete. Goal: %lld bytes. Removed: %lld bytes", v21[3], v10);
  sub_100016E68((uint64_t)__b);
  CFStringRef v28 = @"CACHE_DELETE_AMOUNT";
  long long v11 = +[NSNumber numberWithLongLong:v25[3]];
  unint64_t v29 = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v12;
}

void sub_100020DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3 < 1) {
    return;
  }
  uint64_t v5 = a1;
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  if (*(_DWORD *)(a2 + 64) <= *(_DWORD *)(a2 + 92))
  {
    if (v6 >= 4)
    {
LABEL_22:
      __break(0x5512u);
      goto LABEL_23;
    }
    if (__CFADD__(a2 + 96, 8 * v6))
    {
LABEL_21:
      __break(0x5513u);
      goto LABEL_22;
    }
    if (*(void *)(a2 + 56) <= *(void *)(a2 + 8 * v6 + 96))
    {
      uint64_t v11 = 0;
      goto LABEL_14;
    }
  }
  else if (v6 > 3)
  {
    goto LABEL_22;
  }
  if (__CFADD__(a2 + 96, 8 * v6)) {
    goto LABEL_21;
  }
  uint64_t v7 = *(void *)(a2 + 8 * v6 + 96);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  int v8 = openat(dword_100031BF8, *(const char **)(a2 + 8), 1048832);
  if (v8 == -1)
  {
    __error();
  }
  else
  {
    int v9 = v8;
    if (v8 < 0) {
      goto LABEL_12;
    }
    uint64_t v10 = *(NSObject **)(a2 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001AAB4;
    block[3] = &unk_10002DFB0;
    void block[4] = &v17;
    void block[5] = a2;
    void block[6] = v3;
    void block[7] = v7;
    block[8] = __PAIR64__(v9, v6);
    dispatch_sync(v10, block);
    if (close(v9) != -1) {
      goto LABEL_12;
    }
    int v16 = *__error();
    a1 = *__error();
    if (v16 == 9)
    {
LABEL_25:
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = a1;
      __break(1u);
      return;
    }
  }
  _os_assumes_log();
LABEL_12:
  uint64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  uint64_t v2 = *(void *)(*(void *)(v5 + 32) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
LABEL_14:
  if (__OFSUB__(v3, v11))
  {
LABEL_23:
    __break(0x5515u);
    goto LABEL_24;
  }
  *(void *)(v2 + 24) = v3 - v11;
  uint64_t v12 = *(void *)(*(void *)(v5 + 40) + 8);
  uint64_t v13 = *(void *)(v12 + 24);
  BOOL v14 = __OFADD__(v13, v11);
  uint64_t v15 = v13 + v11;
  if (v14)
  {
LABEL_24:
    __break(0x5500u);
    goto LABEL_25;
  }
  *(void *)(v12 + 24) = v15;
  memset(block, 170, sizeof(block));
  snprintf((char *)block, 0x400uLL, "Purging book: %s, Removed: %lld bytes", *(const char **)(a2 + 8), v11);
  sub_100016E68((uint64_t)block);
}

__CFDictionary *__cdecl sub_100021070(id a1, int a2, __CFDictionary *a3)
{
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "Received a Purgeable Request from CacheDelete on volume: %s", (const char *)[[-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", @"CACHE_DELETE_VOLUME") UTF8String];
  sub_100016E68((uint64_t)__b);
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  if (sub_10001CA10((const char *)qword_10003E998, a3))
  {
    if (a2 == 2) {
      int v5 = 2;
    }
    else {
      int v5 = 3;
    }
    if (a2 <= 1) {
      int v5 = 1;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    uint64_t v11 = sub_100021304;
    uint64_t v12 = &unk_10002E3C8;
    int v15 = v5;
    uint64_t v13 = &v20;
    BOOL v14 = &v16;
    sub_100021304((uint64_t)v10, (uint64_t)&off_100031DB0);
    v11((uint64_t)v10, (uint64_t)&off_100031D20);
    v11((uint64_t)v10, (uint64_t)&off_100031C00);
    v11((uint64_t)v10, (uint64_t)&off_100031C90);
  }
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "Reporting %lld/%lld bytes as purgeable", v21[3], v17[3]);
  sub_100016E68((uint64_t)__b);
  v24[0] = @"CACHE_DELETE_AMOUNT";
  uint64_t v6 = +[NSNumber numberWithLongLong:v21[3]];
  v24[1] = @"CACHE_DELETE_NONPURGEABLE_AMOUNT";
  v25[0] = v6;
  uint64_t v7 = +[NSNumber numberWithLongLong:v17[3]];
  v25[1] = v7;
  int v8 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v8;
}

uint64_t sub_100021304(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  uint64_t v3 = *(unsigned int *)(result + 48);
  if (v3 >= 4)
  {
    __break(0x5512u);
    goto LABEL_12;
  }
  if (__CFADD__(a2 + 96, 8 * v3))
  {
LABEL_12:
    __break(0x5513u);
LABEL_13:
    __break(0x5515u);
    return result;
  }
  uint64_t v4 = *(void *)(a2 + 8 * v3 + 96);
  uint64_t v5 = v2 - v4;
  if (v2 <= v4) {
    goto LABEL_9;
  }
  if (__OFSUB__(v2, v4)) {
    goto LABEL_13;
  }
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v6 = *(void *)(v2 + 24);
  BOOL v7 = __OFADD__(v6, v5);
  uint64_t v8 = v6 + v5;
  if (v7
    || (*(void *)(v2 + 24) = v8,
        uint64_t v9 = *(void *)(*(void *)(result + 40) + 8),
        uint64_t v11 = *(void *)(v9 + 24),
        uint64_t v10 = (void *)(v9 + 24),
        uint64_t v2 = v11 + v4,
        __OFADD__(v11, v4)))
  {
    do
    {
      __break(0x5500u);
LABEL_9:
      uint64_t v12 = *(void *)(*(void *)(result + 40) + 8);
      uint64_t v13 = *(void *)(v12 + 24);
      uint64_t v10 = (void *)(v12 + 24);
      BOOL v7 = __OFADD__(v13, v2);
      v2 += v13;
    }
    while (v7);
  }
  *uint64_t v10 = v2;
  return result;
}

uint64_t sub_10002138C()
{
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  int v0 = openat(-2, (const char *)qword_10003E9A0, 0);
  if (v0 == -1)
  {
    uint64_t v15 = *__error();
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Unable to open timesync directory";
    qword_100031F78 = v15;
    __break(1u);
LABEL_27:
    __break(0x5513u);
  }
  if (&qword_100031C70 < (uint64_t *)&unk_100031C60) {
    goto LABEL_27;
  }
  int v1 = v0;
  uint64_t v2 = qword_100031C70;
  if (qword_100031C38 <= qword_100031C70) {
    goto LABEL_9;
  }
  int v3 = openat(dword_100031BF8, off_100031C08, 1048832);
  if (v3 == -1)
  {
    __error();
LABEL_25:
    _os_assumes_log();
LABEL_9:
    memset(uu, 170, sizeof(uu));
    boot_uuid = (const char *)_os_trace_get_boot_uuid();
    uuid_parse(boot_uuid, uu);
    uint64_t v6 = (_DWORD *)_os_trace_zalloc();
    memset(v22, 170, 18);
    *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1AuLL, "%016llx.timesync", 1);
    int v7 = openat(v1, __str, 1537, 420);
    if (v7 < 0)
    {
      free(v6);
      uint64_t v6 = 0;
    }
    else
    {
      *uint64_t v6 = v7;
      uuid_copy((unsigned __int8 *)v6 + 4, uu);
      *((void *)v6 + 3) = _os_trace_calloc();
      *((_OWORD *)v6 + 2) = xmmword_100027CB0;
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    uint64_t v17 = sub_100021AC4;
    uint64_t v18 = &unk_10002E380;
    uint64_t v19 = v6;
    uint64_t v8 = v16;
    if (qword_10003E9B0 != -1) {
      dispatch_once(&qword_10003E9B0, &stru_10002E890);
    }
    *(void *)__str = qword_10003E998;
    v22[0] = 0;
    uint64_t v9 = fts_open((char *const *)__str, 2132, 0);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = fts_read(v9);
      if (v11)
      {
        uint64_t v12 = v11;
        do
        {
          if (v12->fts_info == 8) {
            ((void (*)(void *))v17)(v8);
          }
          uint64_t v12 = fts_read(v10);
        }
        while (v12);
      }
      fts_close(v10);
    }
    else
    {
      _os_assumes_log();
    }

    qsort_b(*((void **)v6 + 3), *((void *)v6 + 4), 0x40uLL, &stru_10002E8F0);
    operator new();
  }
  int v4 = v3;
  if (v3 < 0) {
    goto LABEL_9;
  }
  sub_100019E88((uint64_t)&off_100031C00, 2u, 0x7FFFFFFFFFFFFFFFLL, v2, v3);
  if (close(v4) != -1) {
    goto LABEL_9;
  }
  int v13 = *__error();
  uint64_t result = *__error();
  if (v13 != 9) {
    goto LABEL_25;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

uint64_t sub_100021AC4(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)strrchr((char *)(a2 + 104), 46);
  if (result)
  {
    uint64_t result = strcmp((const char *)result, ".tracev3");
    if (!result)
    {
      uint64_t result = _os_trace_mmap_at();
      if (result)
      {
        int v4 = (char *)result;
        unint64_t v5 = 0;
        uint64_t v6 = *(void *)(a1 + 32);
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 0x40000000;
        uint64_t v9 = sub_100024120;
        uint64_t v10 = &unk_10002E8B0;
        uint64_t v11 = v6;
        do
        {
          if (0xAAAAAAAAAAAAAAAALL - v5 < 0x10) {
            break;
          }
          unint64_t v7 = *(void *)&v4[v5 + 8];
          if (0xAAAAAAAAAAAAAA9ALL - v5 < v7) {
            break;
          }
          if (!((unsigned int (*)(void *))v9)(v8)) {
            break;
          }
          unint64_t v5 = (v5 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v5 - 1 < 0xAAAAAAAAAAAAAAAALL);
        return munmap(v4, 0xAAAAAAAAAAAAAAAALL);
      }
    }
  }
  return result;
}

void sub_100021C14(id a1, int a2)
{
  __swp(a1, (unsigned int *)&dword_100031F08);
  if (a1 != -1)
  {
    notify_cancel((int)a1);
    if (qword_10003E9B0 != -1) {
      dispatch_once(&qword_10003E9B0, &stru_10002E890);
    }
    v13[0] = (char *)qword_10003E998;
    v13[1] = 0;
    uint64_t v2 = fts_open(v13, 2132, 0);
    if (v2)
    {
      int v3 = v2;
      int v4 = fts_read(v2);
      if (v4)
      {
        unint64_t v5 = v4;
        while (1)
        {
          if (v5->fts_info != 8) {
            goto LABEL_16;
          }
          uint64_t v12 = 0;
          long long v11 = xmmword_100027DD0;
          uint64_t v6 = strrchr(v5->fts_name, 46);
          if (!v6) {
            goto LABEL_16;
          }
          unint64_t v7 = v6;
          if (!strcmp(v6, ".log") || !strcmp(v7, ".txt")) {
            break;
          }
          if (!strcmp(v7, ".tracev3"))
          {
            int v8 = 3;
            goto LABEL_14;
          }
LABEL_16:
          unint64_t v5 = fts_read(v3);
          if (!v5) {
            goto LABEL_17;
          }
        }
        int v8 = 4;
LABEL_14:
        int v10 = v8;
        if (setattrlist(v5->fts_path, &v11, &v10, 4uLL, 0) == -1)
        {
          __error();
          _os_assumes_log();
        }
        goto LABEL_16;
      }
LABEL_17:
      fts_close(v3);
    }
    else
    {
      _os_assumes_log();
    }
    uint64_t v9 = sub_10001D934();
    sub_10001DB60(v9, 1);
  }
}

void sub_100021DE4(void *a1)
{
  id v1 = a1;
  id v3 = +[NSUUID UUID];
  uint64_t v2 = [v3 UUIDString];
  [v1 setObject:v2 forKeyedSubscript:@"Identifier"];
}

uint64_t sub_100021E64()
{
  unlinkat(dword_100031BF8, "uuid.purged.0.txt", 0);
  int v0 = dword_100031BF8;

  return unlinkat(v0, "uuid.purged.1.txt", 0);
}

uint64_t sub_100021EB8()
{
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  v7[0] = (char *)qword_10003E998;
  v7[1] = 0;
  int v0 = fts_open(v7, 2132, 0);
  if (!v0) {
    return _os_assumes_log();
  }
  id v1 = v0;
  uint64_t v2 = fts_read(v0);
  if (v2)
  {
    id v3 = v2;
    do
    {
      if (v3->fts_info == 8)
      {
        int v4 = strrchr(v3->fts_name, 46);
        if (v4)
        {
          unint64_t v5 = v4;
          if ((!strcmp(v4, ".txt") || !strcmp(v5, ".log") || !strcmp(v5, ".tracev3"))
            && chmod(v3->fts_path, 0x1A4u) == -1)
          {
            __error();
            _os_assumes_log();
          }
        }
      }
      id v3 = fts_read(v1);
    }
    while (v3);
  }
  return fts_close(v1);
}

void sub_10002201C(void *a1)
{
  id v1 = a1;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  long long v11 = sub_100022214;
  uint64_t v12 = &unk_10002E210;
  int v13 = &v14;
  uint64_t v2 = v10;
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  v18[0] = (char *)qword_10003E998;
  v18[1] = 0;
  id v3 = fts_open(v18, 2132, 0);
  if (v3)
  {
    int v4 = v3;
    unint64_t v5 = fts_read(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      do
      {
        if (v6->fts_info == 8) {
          ((void (*)(void *))v11)(v2);
        }
        uint64_t v6 = fts_read(v4);
      }
      while (v6);
    }
    fts_close(v4);
  }
  else
  {
    _os_assumes_log();
  }

  if (*((unsigned char *)v15 + 24))
  {
    id v7 = v1;
    int v8 = [v7 objectForKeyedSubscript:@"Pending"];
    if (v8)
    {
      id v9 = v8;
      if (([v8 containsObject:@"timesync-build"] & 1) == 0) {
        [v9 addObject:@"timesync-build"];
      }
    }
    else
    {
      id v9 = [objc_alloc((Class)NSMutableArray) initWithObjects:@"timesync-build", 0];
      [v7 setObject:v9 forKeyedSubscript:@"Pending"];
    }
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t sub_100022214(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)strrchr((char *)(a2 + 104), 46);
  if (result)
  {
    uint64_t result = strcmp((const char *)result, ".timesync");
    if (!result)
    {
      uint64_t result = unlink(*(const char **)(a2 + 48));
      if (result == -1)
      {
        __error();
        uint64_t result = _os_assumes_log();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

unsigned __int8 *sub_100022294(unsigned __int8 *result, uint64_t a2)
{
  id v3 = result;
  int v4 = *result;
  if (v4 != 1)
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        if (*((void *)result + 2))
        {
          unint64_t v5 = 0;
          unint64_t v6 = 0;
          do
          {
            if (v6 >> 59 || (uint64_t v7 = v3[1], v5 > ~v7)) {
              __break(0x5513u);
            }
            uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(a2 + 16))(a2, v6++, v7 + v5);
            v5 += 16;
          }
          while (v6 < v3[2]);
        }
        return result;
      }
      printf("TB_FATAL: invalid tag in array metadata: 0x%x (%s:%d)\n", v4, "/Library/Caches/com.apple.xbs/Binaries/libtrace_executables/install/TempContent/Objects/libtrace.build/logd.build/DerivedSources/OSLogDarwin_C.c", 855);
      _os_crash();
      __break(1u);
LABEL_19:
      uint64_t result = (unsigned __int8 *)_os_crash();
      __break(1u);
      return result;
    }
    uint64_t result = (unsigned __int8 *)tb_message_subrange();
    if (!result) {
      return result;
    }
    _os_crash();
    __break(1u);
  }
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  tb_transport_message_buffer_wrap_buffer();
  if (tb_message_construct()) {
    goto LABEL_19;
  }
  uint64_t result = (unsigned __int8 *)tb_message_configure_received();
  if (v3[3])
  {
    unint64_t v8 = 0;
    do
    {
      v9[0] = 0xAAAAAAAAAAAAAAAALL;
      v9[1] = 0xAAAAAAAAAAAAAAAALL;
      tb_message_decode_u32();
      tb_message_decode_u32();
      tb_message_decode_u64();
      uint64_t result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, void *))(a2 + 16))(a2, v8++, v9);
    }
    while (v8 < v3[3]);
  }
  return result;
}

uint64_t sub_1000224E4(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 40) + 32))
  {
    unint64_t v2 = 0;
    do
    {
      tb_message_decode_u32();
      tb_message_decode_u32();
      tb_message_decode_u64();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      ++v2;
    }
    while (v2 < *(void *)(*(void *)(a1 + 40) + 32));
  }
  return 0;
}

uint64_t sub_1000225C4(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += 16;
  return result;
}

uint64_t sub_1000225DC(uint64_t result)
{
  return result;
}

uint64_t sub_1000225F4(uint64_t a1)
{
  tb_message_encode_u32();
  tb_message_encode_u32();
  uint64_t result = tb_message_encode_u64();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t sub_100022654(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100022670(unsigned int *a1, uint64_t a2)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2000000000;
  void v5[3] = -1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  void v4[2] = sub_100022764;
  v4[3] = &unk_10002E640;
  v4[5] = &v6;
  v4[6] = a2;
  void v4[4] = v5;
  sub_10000D2BC(a1, (uint64_t)v4);
  uint64_t v2 = v7[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void *sub_100022764(void *result, uint64_t a2, void *a3)
{
  unint64_t v3 = result[6];
  if (v3 >= *a3)
  {
    unint64_t v4 = a3[1];
    if (v3 < v4 + *a3)
    {
      uint64_t v5 = *(void *)(result[4] + 8);
      if (v4 < *(void *)(v5 + 24))
      {
        *(void *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
        *(void *)(*(void *)(result[5] + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
      }
    }
  }
  return result;
}

BOOL sub_1000227AC(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    BOOL v10 = 0;
    for (i = 0; i != a4; BOOL v10 = i >= a4)
    {
      unint64_t v12 = *a1;
      if (a2)
      {
        if (a2 < v12 || a2 - v12 < a3) {
          break;
        }
      }
      *a1 = v12 + a3;
      if (!v12) {
        break;
      }
      if (((*(uint64_t (**)(uint64_t, unint64_t, unint64_t, unint64_t *))(a5 + 16))(a5, i, v12, a1) & 1) == 0)break; {
      ++i;
      }
    }
  }
  else
  {
    return 1;
  }
  return v10;
}

BOOL sub_10002285C(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = (unint64_t *)*a1;
  if ((!a2 || (a2 >= (unint64_t)v4 ? (BOOL v5 = a2 - (unint64_t)v4 >= 8) : (BOOL v5 = 0), v5))
    && (*a1 = (unint64_t)(v4 + 1), v4))
  {
    return sub_1000227AC(a1, a2, a3, *v4, a4);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100022890(_DWORD *a1)
{
  if (*a1 == 24587)
  {
    id v1 = (void *)_os_trace_calloc();
    v1[8] = 0;
    v1[9] = v1 + 8;
    v1[1] = -1;
    operator new();
  }
  return 0;
}

uint64_t sub_100022EAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    sub_100024044(a2, (unsigned __int8 *)a3);
  }
  return 1;
}

uint64_t sub_100022F08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 40)) {
    sub_100024044(a2, (unsigned __int8 *)a3);
  }
  return 1;
}

uint64_t sub_100022F64(uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned __int16 **a4)
{
  if (sub_10000FA14(*(void **)(*(void *)(a1 + 32) + 40), *(void *)(a3 + 8), *(_DWORD *)(a3 + 16))) {
    return 1;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(_DWORD *)(v9 + 4);
  uint64_t v11 = v9 + 40;
  uint64_t v12 = v9 + 32;
  BOOL v13 = v10 == 17;
  if (v10 == 17) {
    uint64_t v14 = v9 + 40;
  }
  else {
    uint64_t v14 = v9 + 32;
  }
  uint64_t v15 = *(unsigned __int16 *)(v9 + 16);
  uint64_t v16 = v11 + v15;
  uint64_t v17 = v12 + v15;
  if (v13) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v17;
  }
  uint64_t v19 = _os_trace_calloc();
  long long v20 = (unsigned int **)v19;
  *(_DWORD *)uint64_t v19 = *(_DWORD *)a3;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(a3 + 20);
  *(void *)(v19 + 8) = *(void *)(a3 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(a3 + 16);
  *(_DWORD *)(v19 + 2sub_100024C38(qword_10003E7A8, 0) = *(_DWORD *)(a3 + 24);
  uint64_t v21 = *(unsigned __int16 *)(a3 + 4);
  unint64_t v22 = v18 - v14;
  if (v22 >= 16 * v21 && v22 - 16 * v21 > 0xF) {
    *(_OWORD *)(v19 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_OWORD *)(v14 + 16 * v21);
  }
  else {
    _os_assumes_log();
  }
  uint64_t v24 = *(unsigned __int16 *)(a3 + 6);
  if (v24 != 0xFFFF)
  {
    if (v22 >= 16 * v24 && v22 - 16 * v24 > 0xF) {
      *(_OWORD *)(v20 + 5) = *(_OWORD *)(v14 + 16 * v24);
    }
    else {
      _os_assumes_log();
    }
  }
  uint64_t v26 = _os_trace_calloc();
  *(void *)uint64_t v26 = 16;
  *(unsigned char *)(v26 + 8) = 2;
  *(void *)(v26 + 16) = _os_trace_calloc();
  v20[7] = (unsigned int *)v26;
  uint64_t v27 = _os_trace_calloc();
  *(void *)uint64_t v27 = 16;
  *(unsigned char *)(v27 + 8) = 1;
  *(void *)(v27 + 16) = _os_trace_calloc();
  v20[8] = (unsigned int *)v27;
  int v28 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu@%u\n\t%10s : %d\n\t%10s : %u\n\t%10s : %u\n\t%10s : %x\n", a2, "proc id", v20[1], *((_DWORD *)v20 + 4), "pid", *((_DWORD *)v20 + 1), "euid", *((_DWORD *)v20 + 5), "index", *(unsigned __int16 *)v20, "flags", *((unsigned __int16 *)v20 + 1));
    int v28 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56))
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v29;
      *(_OWORD *)&out[16] = v29;
      uuid_unparse((const unsigned __int8 *)v20 + 24, out);
      if (*(unsigned char *)(a1 + 56)) {
        printf("\t%10s : %s\n", "main uuid", out);
      }
      out[0] = 0;
      if (!uuid_is_null((const unsigned __int8 *)v20 + 40)) {
        uuid_unparse((const unsigned __int8 *)v20 + 40, out);
      }
      int v28 = *(unsigned __int8 *)(a1 + 56);
      if (*(unsigned char *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        int v28 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if (sub_100023A78(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), (uint64_t)v20, v28 != 0, *(void *)(a1 + 40))&& sub_100023C98(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), (uint64_t)v20, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40)))
  {
    if (sub_10000FE0C((float **)(*(void *)(a1 + 32) + 40), (uint64_t)v20[1], *((_DWORD *)v20 + 4), (uint64_t)v20)) {
      return 1;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  sub_100011AA4(v20);
  return 0;
}

uint64_t sub_10002329C(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v8)
  {
    uint64_t v9 = (void *)(v8 + 16);
    while (1)
    {
      uint64_t v9 = (void *)*v9;
      if (!v9) {
        break;
      }
      if (v9[2] == *((void *)a3 + 1))
      {
        if (v9[4]) {
          return 1;
        }
        break;
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  int v11 = *(_DWORD *)(v10 + 4);
  uint64_t v12 = v10 + 40;
  uint64_t v13 = v10 + 32;
  BOOL v14 = v11 == 17;
  if (v11 == 17) {
    uint64_t v15 = v10 + 40;
  }
  else {
    uint64_t v15 = v10 + 32;
  }
  uint64_t v16 = *(unsigned __int16 *)(v10 + 16);
  uint64_t v17 = v12 + v16;
  uint64_t v18 = v13 + v16;
  if (v14) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = _os_trace_calloc();
  uint64_t v21 = v20;
  uint64_t v22 = *a3;
  unint64_t v23 = v19 - v15;
  if (v23 >= 16 * v22 && v23 - 16 * v22 > 0xF) {
    *(_OWORD *)(v20 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_OWORD *)(v15 + 16 * v22);
  }
  else {
    _os_assumes_log();
  }
  uint64_t v25 = a3[1];
  if (v23 >= 16 * v25 && v23 - 16 * v25 > 0xF) {
    *(_OWORD *)(v21 + 4sub_100024C38(qword_10003E7A8, 0) = *(_OWORD *)(v15 + 16 * v25);
  }
  else {
    _os_assumes_log();
  }
  *(_DWORD *)(v21 + 4) = *((_DWORD *)a3 + 1);
  *(void *)(v21 + 8) = *((void *)a3 + 1);
  if (a2 >= 0x10000) {
    _os_assumes_log();
  }
  *(_WORD *)uint64_t v21 = a2;
  *(_WORD *)(v21 + 2) = 0x8000;
  uint64_t v27 = _os_trace_calloc();
  *(void *)uint64_t v27 = 16;
  *(unsigned char *)(v27 + 8) = 2;
  *(void *)(v27 + 16) = _os_trace_calloc();
  *(void *)(v21 + 56) = v27;
  uint64_t v28 = _os_trace_calloc();
  *(void *)uint64_t v28 = 16;
  *(unsigned char *)(v28 + 8) = 1;
  *(void *)(v28 + 16) = _os_trace_calloc();
  *(void *)(v21 + 64) = v28;
  int v29 = *(unsigned __int8 *)(a1 + 56);
  if (*(unsigned char *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %u\n", (unsigned __int16)a2, "proc id", *(void *)(v21 + 8), "pid", *(_DWORD *)(v21 + 4));
    int v29 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned char *)(a1 + 56))
    {
      *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)uuid_string_t out = v30;
      *(_OWORD *)&out[16] = v30;
      uuid_unparse((const unsigned __int8 *)(v21 + 24), out);
      if (*(unsigned char *)(a1 + 56)) {
        printf("\t%10s : %s\n", "main uuid", out);
      }
      uuid_unparse((const unsigned __int8 *)(v21 + 40), out);
      int v29 = *(unsigned __int8 *)(a1 + 56);
      if (*(unsigned char *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        int v29 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if ((sub_100023A78(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), v21, v29 != 0, *(void *)(a1 + 40)) & 1) != 0
    && (sub_100023C98(a4, *(void *)(a1 + 48), *(void *)(a1 + 32), v21, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40)) & 1) != 0)
  {
    if ((sub_10000FE0C((float **)(*(void *)(a1 + 32) + 40), *(void *)(v21 + 8), *(_DWORD *)(v21 + 16), v21) & 1) == 0) {
      _os_assumes_log();
    }
    return 1;
  }
  else
  {
    sub_100011AA4((unsigned int **)v21);
    return 0;
  }
}

BOOL sub_1000235A0(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = *(void *)(a3 + 8) + a3 + 16;
  if (*(_DWORD *)(a3 + 4) != 17)
  {
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 0x40000000;
    int v11 = sub_100023998;
    uint64_t v12 = &unk_10002E740;
    char v15 = 0;
    uint64_t v13 = a2;
    unint64_t v14 = v4;
    BOOL v8 = sub_10002285C(a1, v4, 0x20uLL, (uint64_t)&v9);
    BOOL result = 0;
    if (!v8) {
      return result;
    }
    return *a1 <= v4;
  }
  unint64_t v5 = *(unsigned __int16 *)(a3 + 24);
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 0x40000000;
  int v11 = sub_1000236F8;
  uint64_t v12 = &unk_10002E720;
  char v15 = 0;
  uint64_t v13 = a2;
  unint64_t v14 = v4;
  BOOL v6 = sub_1000227AC(a1, v4, 0x18uLL, v5, (uint64_t)&v9);
  BOOL result = 0;
  if (v6) {
    return *a1 <= v4;
  }
  return result;
}

uint64_t sub_1000236F8(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  BOOL v8 = sub_10000EC9C(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  void v8[2] = *a3;
  v8[3] = v10;
  int v11 = *((_DWORD *)a3 + 4);
  int v12 = *((_DWORD *)a3 + 5);
  *((_DWORD *)v8 + 8) = v11;
  *((_DWORD *)v8 + 9) = v12;
  uint64_t v13 = (unsigned __int16 *)(a3 + 3);
  *a4 = (unint64_t)(a3 + 3);
  if (*(unsigned char *)(a1 + 48))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "uncomp sz", v11, "comp algo", v12);
    BOOL v14 = *(unsigned char *)(a1 + 48) != 0;
    uint64_t v13 = (unsigned __int16 *)*a4;
  }
  else
  {
    BOOL v14 = 0;
  }
  unint64_t v15 = *(void *)(a1 + 40);
  if (v15)
  {
    uint64_t result = 0;
    if (v15 < (unint64_t)v13 || v15 - (unint64_t)v13 < 4) {
      return result;
    }
  }
  *a4 = (unint64_t)(v13 + 2);
  if (!v13) {
    return 0;
  }
  if (v14) {
    printf("\t\t%10s : %u\n\t\t%10s : ", "procinfos", *(_DWORD *)v13, "indexes");
  }
  if (*(_DWORD *)v13)
  {
    int v17 = 0;
    do
    {
      uint64_t v18 = (unsigned __int16 *)*a4;
      if (v15)
      {
        if (v15 < (unint64_t)v18 || v15 - (unint64_t)v18 < 2) {
          return 0;
        }
      }
      *a4 = (unint64_t)(v18 + 1);
      if (!v18) {
        return 0;
      }
      if (v8) {
        sub_10000EAA0((int *)v8[6], v18, 0);
      }
      if (v14) {
        printf("%u,", *v18);
      }
    }
    while (++v17 < *(_DWORD *)v13);
  }
  if (v14) {
    putchar(10);
  }
  unint64_t v20 = *(void *)(a1 + 40);
  int v21 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v22 = (unsigned __int16 *)*a4;
  if (v20)
  {
    uint64_t result = 0;
    if (v20 < (unint64_t)v22 || v20 - (unint64_t)v22 < 4) {
      return result;
    }
  }
  *a4 = (unint64_t)(v22 + 2);
  if (!v22) {
    return 0;
  }
  if (v21) {
    printf("\t\t%10s : %u\n\t\t%10s : ", "subcats", *(_DWORD *)v22, "offsets");
  }
  if (*(_DWORD *)v22)
  {
    int v23 = 0;
    do
    {
      uint64_t v24 = (unsigned __int16 *)*a4;
      if (v20)
      {
        if (v20 < (unint64_t)v24 || v20 - (unint64_t)v24 < 2) {
          return 0;
        }
      }
      *a4 = (unint64_t)(v24 + 1);
      if (!v24) {
        return 0;
      }
      if (v8) {
        sub_10000EAA0((int *)v8[5], v24, 0);
      }
      if (v21) {
        printf("%u,", *v24);
      }
    }
    while (++v23 < *(_DWORD *)v22);
  }
  if (v21) {
    putchar(10);
  }
  unint64_t v26 = *a4;
  if ((*a4 & 7) != 0) {
    unint64_t v26 = (*a4 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *a4 = v26;
  return 1;
}

uint64_t sub_100023998(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  BOOL v8 = sub_10000EC9C(*(void *)(a1 + 32));
  uint64_t v9 = *a3;
  uint64_t v10 = a3[1];
  void v8[2] = *a3;
  v8[3] = v10;
  if (*(unsigned char *)(a1 + 48)) {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "log cnt", *((_DWORD *)a3 + 4), "others cnt", *((_DWORD *)a3 + 5));
  }
  unint64_t v11 = (unint64_t)a3 + 26;
  *a4 = (unint64_t)a3 + 26;
  unint64_t v12 = *(void *)(a1 + 40);
  unint64_t v13 = *((unsigned __int16 *)a3 + 12);
  if (v12)
  {
    BOOL v15 = v12 >= v11;
    unint64_t v14 = v12 - v11;
    BOOL v15 = v15 && v14 >= v13;
    if (!v15) {
      return 0;
    }
  }
  unint64_t v17 = v11 + v13;
  if ((v17 & 7) != 0) {
    unint64_t v17 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *a4 = v17;
  return 1;
}

uint64_t sub_100023A78(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  unint64_t v11 = (void *)*a1;
  if (a2)
  {
    if (a2 < (unint64_t)v11 || a2 - (unint64_t)v11 < 8) {
      return 0;
    }
  }
  *a1 = v11 + 1;
  if (!v11) {
    return 0;
  }
  int v13 = *(_DWORD *)(a6 + 4);
  BOOL v14 = v13 == 17;
  if (v13 == 17) {
    uint64_t v15 = a6 + 40;
  }
  else {
    uint64_t v15 = a6 + 32;
  }
  uint64_t v16 = *(unsigned __int16 *)(a6 + 16);
  uint64_t v17 = a6 + 40 + v16;
  uint64_t v18 = a6 + 32 + v16;
  if (v14) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = v18;
  }
  if (a5) {
    printf("\t%10s : %llu\n", "uuidinfos", *v11);
  }
  if (*v11)
  {
    uint64_t v20 = 0;
    unint64_t v29 = v19 - v15;
    while (1)
    {
      int v21 = (void *)*a1;
      if (a2)
      {
        if (a2 < (unint64_t)v21 || a2 - (unint64_t)v21 < 0x10) {
          break;
        }
      }
      *a1 = v21 + 2;
      if (!v21) {
        break;
      }
      uint64_t v30 = v21[1] >> 16;
      if (!sub_10000EA0C(*(void *)(a4 + 56), (uint64_t)&v30))
      {
        uint64_t v23 = _os_trace_calloc();
        uint64_t v24 = (unsigned __int8 *)v23;
        *(void *)uint64_t v23 = v21[1] >> 16;
        *(void *)(v23 + 8) = *v21;
        unint64_t v25 = 16 * (unsigned __int16)*((_DWORD *)v21 + 2);
        if (v29 >= v25 && v29 - v25 > 0xF) {
          *(_OWORD *)(v23 + 16) = *(_OWORD *)(v15 + 16 * (unsigned __int16)*((_DWORD *)v21 + 2));
        }
        else {
          _os_assumes_log();
        }
        sub_10000EAA0(*(int **)(a4 + 56), v24, (uint64_t)v24);
        ++*(void *)(a3 + 48);
        if (a5)
        {
          *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)uuid_string_t out = v27;
          *(_OWORD *)&out[16] = v27;
          uuid_unparse(v24 + 16, out);
          printf("\t\t<%10s : 0x%llx, %10s : %10llu, %10s : %s>\n", "load addr", *(void *)v24, "size", *((void *)v24 + 1), "uuid", out);
        }
      }
      if ((unint64_t)++v20 >= *v11) {
        return 1;
      }
    }
    return 0;
  }
  return 1;
}

uint64_t sub_100023C98(unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v7 = a5;
  unint64_t v11 = a1;
  unint64_t v12 = *a1;
  if (*(_DWORD *)(a6 + 4) != 17)
  {
    if (!a2 || (a2 >= (unint64_t)v12 ? (BOOL v21 = a2 - (unint64_t)v12 >= 8) : (BOOL v21 = 0), v21))
    {
      *a1 = v12 + 4;
      if (v12)
      {
        uint64_t v22 = *(unsigned __int16 *)(a6 + 16);
        uint64_t v23 = *(unsigned __int16 *)(a6 + 18);
        if (a5) {
          printf("\t%10s : %llu\n", "subsystems", *(void *)v12);
        }
        if (*(void *)v12)
        {
          uint64_t v24 = 0;
          uint64_t v38 = a6 + 24 + v22 + 8;
          unint64_t v25 = v23 - (v22 + 8);
          int v36 = v7;
          while (1)
          {
            unint64_t v26 = *v11;
            if (a2)
            {
              if (a2 < (unint64_t)v26 || a2 - (unint64_t)v26 < 4) {
                return 0;
              }
            }
            *unint64_t v11 = v26 + 2;
            if (!v26) {
              return 0;
            }
            if (v7) {
              printf("\t\t<%10s : %3u, %10s : %5hu>\n", "id", *v26, "offset", v26[1]);
            }
            unint64_t v28 = v26[1];
            if (v25 < v28)
            {
LABEL_59:
              _os_assumes_log();
              return 0;
            }
            if (!sub_10000EA0C(*(void *)(a4 + 64), (uint64_t)v26))
            {
              unint64_t v29 = v25;
              uint64_t v30 = (char *)(v38 + v28);
              int v31 = (void *)_os_trace_calloc();
              *(_WORD *)int v31 = *v26;
              v31[1] = sub_10000EEA4(*(void **)(a3 + 24), v30 + 2);
              unint64_t v32 = sub_10000EEA4(*(void **)(a3 + 24), &v30[*v30 + 2]);
              v31[2] = v32;
              if (!v32 || !v31[1]) {
                _os_assumes_log();
              }
              sub_10000EAA0(*(int **)(a4 + 64), v31, (uint64_t)v31);
              ++*(void *)(a3 + 56);
              unint64_t v25 = v29;
              int v7 = v36;
            }
            if ((unint64_t)++v24 >= *(void *)v12) {
              goto LABEL_56;
            }
          }
        }
        goto LABEL_56;
      }
    }
    return 0;
  }
  if (a2)
  {
    if (a2 < (unint64_t)v12 || a2 - (unint64_t)v12 < 8) {
      return 0;
    }
  }
  *a1 = v12 + 4;
  if (!v12) {
    return 0;
  }
  uint64_t v14 = *(unsigned __int16 *)(a6 + 16);
  uint64_t v15 = *(unsigned __int16 *)(a6 + 18);
  if (a5) {
    printf("\t%10s : %llu\n", "subsystems", *(void *)v12);
  }
  if (*(void *)v12)
  {
    uint64_t v16 = 0;
    uint64_t v37 = a6 + 40 + v14;
    unint64_t v17 = v15 - v14;
    uint64_t v35 = v11;
    do
    {
      uint64_t v18 = *v11;
      if (a2)
      {
        if (a2 < (unint64_t)v18 || a2 - (unint64_t)v18 < 6) {
          return 0;
        }
      }
      *unint64_t v11 = v18 + 3;
      if (!v18) {
        return 0;
      }
      if (v7) {
        printf("\t\t<%10s : %3u, %10s : %5hu, %10s : %5hu>\n", "id", *v18, "subsystem", v18[1], "category", v18[2]);
      }
      if (v17 < v18[1] || v17 < v18[2]) {
        goto LABEL_59;
      }
      if (!sub_10000EA0C(*(void *)(a4 + 64), (uint64_t)v18))
      {
        uint64_t v20 = (void *)_os_trace_calloc();
        *(_WORD *)uint64_t v20 = *v18;
        v20[1] = sub_10000EEA4(*(void **)(a3 + 24), (char *)(v37 + v18[1]));
        unint64_t v11 = v35;
        v20[2] = sub_10000EEA4(*(void **)(a3 + 24), (char *)(v37 + v18[2]));
        sub_10000EAA0(*(int **)(a4 + 64), v20, (uint64_t)v20);
        ++*(void *)(a3 + 56);
      }
    }
    while ((unint64_t)++v16 < *(void *)v12);
  }
LABEL_56:
  unint64_t v33 = (unint64_t)*v11;
  if (((unint64_t)*v11 & 7) != 0) {
    unint64_t v33 = ((unint64_t)*v11 & 0xFFFFFFFFFFFFFFF8) + 8;
  }
  *unint64_t v11 = (unsigned __int16 *)v33;
  return 1;
}

BOOL sub_10002403C(id a1, unint64_t a2, const void *a3, char **a4)
{
  return 1;
}

uint64_t sub_100024044(uint64_t a1, unsigned __int8 *uu)
{
  *(void *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uuid_string_t out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse(uu, out);
  return printf("[%03llu] %s\n", a1, out);
}

void sub_1000240CC()
{
}

void sub_1000240DC(id a1)
{
  qword_10003E998 = (uint64_t)"/private/var/db/diagnostics";
  qword_10003E9A0 = (uint64_t)"/private/var/db/diagnostics/timesync";
  qword_10003E9A8 = (uint64_t)"/private/var/db/uuidtext";
}

uint64_t sub_100024120(uint64_t a1, unsigned __int8 *src)
{
  if (*(_DWORD *)src == 4096 && *((void *)src + 1) >= 0xA8uLL)
  {
    long long v3 = *(void **)(a1 + 32);
    if (*(void *)((char *)v3 + 4) != *((void *)src + 18) || *(void *)((char *)v3 + 12) != *((void *)src + 19))
    {
      unint64_t v4 = v3[4];
      unint64_t v5 = v3[5];
      uint64_t v6 = v3[3];
      if (v4 >= v5)
      {
        uint64_t v7 = 2 * v5;
        uint64_t v6 = _os_trace_realloc();
        v3[3] = v6;
        void v3[5] = v7;
        unint64_t v4 = v3[4];
      }
      void v3[4] = v4 + 1;
      uint64_t v8 = v6 + (v4 << 6);
      uint64_t v9 = *((void *)src + 4);
      int v10 = *((_DWORD *)src + 10);
      uint64_t v11 = *((void *)src + 2);
      uint64_t v12 = *((void *)src + 8);
      uint64_t v13 = *(void *)(src + 44);
      *(void *)uint64_t v8 = 0;
      *(void *)(v8 + 8) = 0;
      *(void *)(v8 + 16) = 0;
      *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v9;
      *(_DWORD *)(v8 + 32) = v10;
      *(void *)(v8 + 4sub_100024C38(qword_10003E7A8, 0) = v13;
      *(void *)(v8 + 48) = v11;
      *(void *)(v8 + 56) = v12;
      uuid_copy((unsigned __int8 *)(v3[3] + (v4 << 6) + 8), src + 144);
    }
  }
  return 1;
}

int sub_1000241FC(id a1, const void *a2, const void *a3)
{
  if (*(void *)a2 == *(void *)a3)
  {
    unint64_t v3 = *((void *)a2 + 7);
    unint64_t v4 = *((void *)a3 + 7);
    BOOL v5 = v3 == v4;
    if (v3 < v4) {
      int v6 = -1;
    }
    else {
      int v6 = 1;
    }
    if (v5) {
      return 0;
    }
    else {
      return v6;
    }
  }
  else if (*(void *)a2 < *(void *)a3)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

int sub_100024234(id a1, const void *a2, const void *a3)
{
  uint64_t v3 = *((void *)a2 + 3);
  uint64_t v4 = *((void *)a3 + 3);
  if (v3 == v4)
  {
    int v5 = *((_DWORD *)a2 + 8);
    int v6 = *((_DWORD *)a3 + 8);
    BOOL v7 = v5 == v6;
    if (v5 < v6) {
      int v8 = -1;
    }
    else {
      int v8 = 1;
    }
    if (v7) {
      return 0;
    }
    else {
      return v8;
    }
  }
  else if (v3 < v4)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

uint64_t sub_10002426C(int a1, void *a2, void *a3, int a4)
{
  int v6 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2000000000;
  int v40 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000;
  uint64_t v36 = -1;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2000000000;
  uint64_t v32 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 0x40000000;
  uint64_t v24 = sub_100024B84;
  unint64_t v25 = &unk_10002E958;
  unint64_t v26 = &v37;
  long long v27 = &v33;
  unint64_t v28 = &v29;
  if (a4)
  {
    int v6 = v21;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 0x40000000;
    v21[2] = sub_100024BFC;
    v21[3] = &unk_10002E978;
    int v22 = a1;
  }
  int v7 = dup(a1);
  if (v7 == -1)
  {
LABEL_27:
    __error();
    _os_assumes_log();
    goto LABEL_30;
  }
  int v8 = v7;
  if (lseek(v7, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  uint64_t v9 = fdopendir(v8);
  if (v9)
  {
    int v10 = v9;
    uint64_t v20 = a2;
    while (1)
    {
LABEL_8:
      uint64_t v11 = readdir(v10);
      if (!v11) {
        break;
      }
      uint64_t v12 = v11;
      d_xpc_type_t type = v11->d_type;
      if ((d_type | 8) == 8)
      {
        uint64_t v14 = 0;
        while ((v11->d_name[v14] & 0x80000000) == 0
             && (_DefaultRuneLocale.__runetype[v11->d_name[v14]] & 0x10000) != 0)
        {
          if (++v14 == 16)
          {
            if (strcmp(&v11->d_name[16], ".timesync")) {
              break;
            }
            if (v24(v23, v12->d_name)) {
              goto LABEL_8;
            }
            goto LABEL_26;
          }
        }
      }
      if (v6 && d_type == 8)
      {
        uint64_t v15 = 0;
        while ((v12->d_name[v15] & 0x80000000) == 0
             && (_DefaultRuneLocale.__runetype[v12->d_name[v15]] & 0x10000) != 0)
        {
          if (++v15 == 16)
          {
            if (!strcmp(&v12->d_name[16], ".timesync")) {
              goto LABEL_8;
            }
            break;
          }
        }
        if (strcmp(v12->d_name, ".migrated")
          && (((uint64_t (*)(void *, char *))v6[2])(v6, v12->d_name) & 1) == 0)
        {
          break;
        }
      }
    }
LABEL_26:
    a2 = v20;
    if (closedir(v10) != -1) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
  int v16 = *__error();
  if (close(v8) == -1)
  {
    int v19 = *__error();
    uint64_t result = *__error();
    if (v19 == 9)
    {
      qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_100031F78 = result;
      __break(1u);
      return result;
    }
    _os_assumes_log();
  }
  *__error() = v16;
LABEL_30:
  uint64_t v17 = *((unsigned int *)v38 + 6);
  if ((int)v17 >= 1)
  {
    *a2 = v34[3];
    *a3 = v30[3];
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return v17;
}

uint64_t sub_1000245D4(uint64_t result)
{
  if (*(void *)(result + 104) - *(void *)(result + 96) <= (unint64_t)*(unsigned int *)(result + 136)) {
    return result;
  }
  uint64_t v1 = result;
  uint64_t result = _os_trace_get_times_now();
  unint64_t v2 = *(void *)(v1 + 96);
  unint64_t v3 = *(void *)(v1 + 104) - *(unsigned int *)(v1 + 136);
  if (v2 >= v3)
  {
LABEL_21:
    unint64_t v2 = v3;
    goto LABEL_22;
  }
  unint64_t v4 = 0x2DD01FC06 - *(void *)(v1 + 144);
  while (1)
  {
    memset(v15, 170, 18);
    *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1AuLL, "%016llx.timesync", v2);
    int v5 = openat(*(_DWORD *)v1, __str, 0);
    if (v5 == -1) {
      goto LABEL_27;
    }
    int v6 = v5;
    v7.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v7.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v13.st_blkmach_vm_size_t size = v7;
    *(timespec *)v13.st_qspare = v7;
    v13.st_birthtimespec = v7;
    *(timespec *)&v13.st_mach_vm_size_t size = v7;
    v13.st_mtimespec = v7;
    v13.st_ctimespec = v7;
    *(timespec *)&v13.st_uid = v7;
    v13.st_atimespec = v7;
    *(timespec *)&v13.st_dev = v7;
    int v8 = fstat(v5, &v13);
    if (v8)
    {
      if (v8 == -1)
      {
        __error();
        _os_assumes_log();
      }
      goto LABEL_9;
    }
    if (v13.st_mtimespec.tv_sec > v4) {
      break;
    }
LABEL_9:
    if (close(v6) == -1)
    {
      int v9 = *__error();
      uint64_t v10 = *__error();
      if (v9 == 9)
      {
        qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_100031F78 = v10;
        __break(1u);
      }
      _os_assumes_log();
    }
    uint64_t result = unlinkat(*(_DWORD *)v1, __str, 0);
    if (result == -1)
    {
      __error();
      uint64_t result = _os_assumes_log();
    }
    if (v2 == 2)
    {
      snprintf(__str, 0x1AuLL, "%016llx.timesync", 1);
      uint64_t result = unlinkat(*(_DWORD *)v1, __str, 0);
      if (result == -1)
      {
        uint64_t result = (uint64_t)__error();
        if (*(_DWORD *)result != 2)
        {
          uint64_t result = *__error();
          if (result) {
            uint64_t result = _os_assumes_log();
          }
        }
      }
    }
    if (++v2 >= v3) {
      goto LABEL_21;
    }
  }
  uint64_t result = close(v6);
  if (result != -1) {
    goto LABEL_22;
  }
  int v11 = *__error();
  uint64_t v12 = *__error();
  if (v11 == 9)
  {
    qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100031F78 = v12;
    __break(1u);
LABEL_27:
    __error();
  }
  uint64_t result = _os_assumes_log();
LABEL_22:
  *(void *)(v1 + 96) = v2;
  return result;
}

uint64_t sub_100024894(uint64_t a1)
{
  memset(v6, 170, 18);
  uint64_t v4 = *(void *)(a1 + 104);
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v4);
  int v2 = openat(*(_DWORD *)a1, __str, 16779785, 420);
  *(_DWORD *)(a1 + 112) = v2;
  if (v2 < 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(void *)(a1 + 12sub_100024C38(qword_10003E7A8, 0) = 0;
  ++*(void *)(a1 + 104);
  return result;
}

void sub_100024950(uint64_t a1)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Bad timesync db entry, file rotated";
  qword_100031F78 = a1;
  __break(1u);
}

uint64_t sub_100024978(uint64_t a1, int a2)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  LODWORD(v15) = 3193776;
  *(void *)&v9.tm_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v9.uint64_t tm_hour = 0xAAAAAAAAAAAAAAAALL;
  time_t v11 = 0x1500000001;
  size_t v10 = 16;
  if (sysctl((int *)&v11, 2u, &v9, &v10, 0, 0) < 0)
  {
    uint64_t v8 = *__error();
    qword_100031F48 = (uint64_t)"BUG IN LIBTRACE: Can't get boot time";
    qword_100031F78 = v8;
    __break(1u);
  }
  *(void *)&long long v17 = 1000000000 * *(void *)&v9.tm_sec + 1000 * v9.tm_hour;
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, (unsigned __int8 *)&v15 + 8);
  mach_timebase_info((mach_timebase_info_t)&v16 + 1);
  time_t v11 = time(0);
  v9.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v9.tm_mon = v5;
  *(_OWORD *)&v9.int tm_isdst = v5;
  *(_OWORD *)&v9.tm_sec = v5;
  localtime_r(&v11, &v9);
  unint64_t v6 = ((unsigned __int128)(v9.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v9.tm_gmtoff;
  DWORD2(v17) = (v6 >> 5) + (v6 >> 63) + 60 * v9.tm_isdst;
  HIDWORD(v17) = v9.tm_isdst;
  memset(&v9.tm_hour, 0, 24);
  v9.tm_sec = 2126676;
  v9.tm_mlong long in = a2;
  _os_trace_get_times_now();
  time_t v11 = (time_t)&v15;
  uint64_t v12 = 48;
  stat v13 = &v9;
  uint64_t v14 = 32;
  if (_os_trace_writev() == -1)
  {
    __error();
    _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (fsync(*(_DWORD *)(a1 + 112)) == -1)
    {
      __error();
      _os_assumes_log();
    }
    uint64_t result = 0;
    *(void *)(a1 + 120) += v14 + v12;
  }
  return result;
}

uint64_t sub_100024B84(void *a1, char *__str)
{
  ++*(_DWORD *)(*(void *)(a1[4] + 8) + 24);
  unint64_t v3 = strtoull(__str, 0, 16);
  uint64_t v4 = *(void *)(a1[5] + 8);
  if (v3 < *(void *)(v4 + 24)) {
    *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  }
  uint64_t v5 = *(void *)(a1[6] + 8);
  if (v3 > *(void *)(v5 + 24)) {
    *(void *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  }
  return 1;
}

uint64_t sub_100024BFC(uint64_t a1, const char *a2)
{
  if (unlinkat(*(_DWORD *)(a1 + 32), a2, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  return 1;
}

uint64_t sub_100024C38(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 120) < *(void *)(a1 + 128))
  {
    _os_trace_get_times_now();
    if (_os_trace_write() != -1)
    {
      if (fsync(*(_DWORD *)(a1 + 112)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      uint64_t result = 0;
      uint64_t v5 = *(void *)(a1 + 120) + 32;
LABEL_6:
      *(void *)(a1 + 12sub_100024C38(qword_10003E7A8, 0) = v5;
      return result;
    }
    goto LABEL_16;
  }
  if (close(*(_DWORD *)(a1 + 112)) != -1)
  {
LABEL_8:
    sub_1000245D4(a1);
    if ((sub_100024894(a1) & 0x80000000) != 0 || (sub_100024978(a1, a2) & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
    if (!*(_WORD *)(a1 + 8)) {
      return 0;
    }
    if (_os_trace_write() != -1)
    {
      if (fsync(*(_DWORD *)(a1 + 112)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      uint64_t result = 0;
      uint64_t v5 = *(void *)(a1 + 120) + 88;
      goto LABEL_6;
    }
LABEL_16:
    __error();
    _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  int v6 = *__error();
  uint64_t result = *__error();
  if (v6 != 9)
  {
    _os_assumes_log();
    goto LABEL_8;
  }
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100031F78 = result;
  __break(1u);
  return result;
}

uint64_t sub_100024DFC(uint64_t a1)
{
  sub_100024EAC(a1);
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a1 + 8);
  while ((sub_100024F04((void *)a1) & 0x80000000) != 0)
  {
    unint64_t v2 = *(void *)(a1 + 16);
    unint64_t v3 = *(void *)(a1 + 24) + 1;
    *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
    if (v3 > v2) {
      return 0xFFFFFFFFLL;
    }
  }
  sub_10002501C(a1);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = sub_100025084(*(unsigned __int16 **)(a1 + 48), &v6);
  uint64_t result = 0;
  *(void *)(a1 + 48) = v5;
  return result;
}

uint64_t sub_100024EAC(uint64_t a1)
{
  unint64_t v3 = (void *)(a1 + 40);
  uint64_t result = *(void *)(a1 + 40);
  if ((unint64_t)(result + 1) >= 2)
  {
    uint64_t result = munmap((void *)result, *(void *)(a1 + 32));
    if (result == -1)
    {
      __error();
      uint64_t result = _os_assumes_log();
    }
    *unint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t sub_100024F04(void *a1)
{
  memset(v7, 170, 18);
  uint64_t v5 = a1[3];
  *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v5);
  unint64_t v2 = (unsigned __int16 *)_os_trace_mmap_at();
  a1[5] = v2;
  if (!v2)
  {
    if (*__error()) {
      _os_assumes_log();
    }
    return 0xFFFFFFFFLL;
  }
  if ((uint64_t)a1[4] < 80 || *v2 != 48048 || v2[1] != 48 || v2[24] != 29524 || v2[25] != 32)
  {
    sub_100024EAC((uint64_t)a1);
    a1[5] = 0;
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0;
  a1[6] = v2;
  return v3;
}

uint64_t sub_10002501C(uint64_t result)
{
  uint64_t v1 = *(long long **)(result + 48);
  if (*((_DWORD *)v1 + 6))
  {
    if (*((_DWORD *)v1 + 7))
    {
      long long v2 = *v1;
      long long v3 = v1[1];
      *(_OWORD *)(result + 88) = v1[2];
      *(_OWORD *)(result + 72) = v3;
      *(_OWORD *)(result + 56) = v2;
      *(void *)(result + 112) = 0;
      *(_OWORD *)(result + 12sub_100024C38(qword_10003E7A8, 0) = *(_OWORD *)(result + 88);
      return result;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

char *sub_100025084(unsigned __int16 *a1, void *a2)
{
  unsigned int v2 = *a1;
  if (v2 > 0xBBAF)
  {
    if (v2 == 48048)
    {
      if (a1[1] != 48) {
        goto LABEL_17;
      }
      uint64_t v3 = 48;
    }
    else
    {
      if (v2 != 57005) {
        goto LABEL_17;
      }
      uint64_t v3 = a1[1];
    }
  }
  else
  {
    if (v2 != 27986)
    {
      if (v2 == 29524 && a1[1] == 32)
      {
        uint64_t v3 = 32;
        goto LABEL_13;
      }
LABEL_17:
      _os_assumes_log();
      return 0;
    }
    if (a1[1] != 88) {
      goto LABEL_17;
    }
    uint64_t v3 = 88;
  }
LABEL_13:
  uint64_t v4 = *a2 - v3;
  *a2 = v4;
  uint64_t v5 = (char *)a1 + v3;
  if (v4 >= 1) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t sub_100025140(uint64_t result)
{
  uint64_t v1 = *(unsigned __int16 **)(result + 48);
  if (!v1) {
    return result;
  }
  unsigned int v2 = (void *)result;
  if (*v1 == 48048)
  {
    sub_10002501C(result);
    uint64_t v3 = (unsigned __int16 *)v2[6];
  }
  else
  {
    long long v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 12sub_100024C38(qword_10003E7A8, 0) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    uint64_t v3 = v1;
  }
  uint64_t v8 = v2[4] - (void)v3 + v2[5];
  while (1)
  {
    uint64_t result = (uint64_t)sub_100025084(v1, &v8);
    uint64_t v1 = (unsigned __int16 *)result;
    if (!result) {
      break;
    }
LABEL_10:
    int v7 = *v1;
    if (v7 == 48048)
    {
      if (*((void *)v1 + 1) != v2[8] || *((void *)v1 + 2) != v2[9]) {
        goto LABEL_17;
      }
    }
    else if (v7 == 29524)
    {
      goto LABEL_17;
    }
  }
  uint64_t result = sub_100024EAC((uint64_t)v2);
  unint64_t v5 = v2[2];
  unint64_t v6 = v2[3] + 1;
  v2[3] = v6;
  if (v6 <= v5)
  {
    uint64_t result = sub_100024F04(v2);
    if ((result & 0x80000000) == 0)
    {
      uint64_t v1 = (unsigned __int16 *)v2[6];
      uint64_t v8 = v2[4];
      if (!v1) {
        goto LABEL_17;
      }
      goto LABEL_10;
    }
  }
  uint64_t v1 = 0;
LABEL_17:
  v2[6] = v1;
  return result;
}

void sub_10002527C()
{
  uint64_t v0 = _os_trace_zalloc();
  *(void *)uint64_t v0 = 0;
  *(_OWORD *)(v0 + 8) = xmmword_100027C80;
  operator new();
}

BOOL sub_1000256FC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(void *)(a1 + 32) >= a3;
}

__n128 sub_10002570C(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result = *a2;
  *(__n128 *)(*(void *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

void sub_100025720(id a1)
{
  byte_10003E9C0 = MKBDeviceFormattedForContentProtection() == 1;
}

void sub_100025748(id a1)
{
  *(_OWORD *)uint64_t v3 = xmmword_100027DE8;
  memset(__b, 170, sizeof(__b));
  size_t v1 = 648;
  if (sysctl(v3, 4u, __b, &v1, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  byte_10003E9D0 = (__b[32] & 4) != 0;
}

void sub_100025804(id a1)
{
  if (qword_10003E9B0 != -1) {
    dispatch_once(&qword_10003E9B0, &stru_10002E890);
  }
  byte_10003E9E0 = sandbox_check() == 0;
}

uint64_t sub_100025894()
{
  if (qword_10003E9E8 != -1) {
    dispatch_once(&qword_10003E9E8, &stru_10002EAB8);
  }
  return byte_100031F3C;
}

void sub_1000258D8(id a1)
{
  memset(__b, 170, sizeof(__b));
  size_t v1 = 1024;
  byte_100031F3C = sysctlbyname("kern.filesetuuid", __b, &v1, 0, 0) != 0;
  if (!sysctlbyname("kern.bootargs", __b, &v1, 0, 0))
  {
    if (strstr(__b, "libtrace_kic=0")) {
      byte_100031F3C = 0;
    }
    if (strstr(__b, "libtrace_kic=1")) {
      byte_100031F3C = 1;
    }
  }
}

void sub_1000259C0(unsigned __int8 *a1)
{
  *(void *)&v5[13] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long in = v2;
  *(_OWORD *)unint64_t v5 = v2;
  size_t v3 = 37;
  if (sysctlbyname("kern.kernelcacheuuid", in, &v3, 0, 0))
  {
    uuid_copy(a1, byte_10003E809);
    a1[15] = ~a1[15];
  }
  else
  {
    uuid_parse(in, a1);
  }
}

uint64_t sub_100025A78(uint64_t result, mach_port_t a2)
{
  *(unsigned char *)(result + 144) = 1;
  if (a2)
  {
    __n128 result = sub_100012830(a2, 0, -1, -1, 0);
    if (result == -301)
    {
      qword_100031F48 = (uint64_t)"MIG_REPLY_MISMATCH";
      qword_100031F78 = -301;
      __break(1u);
    }
    if (result)
    {
      return _dispatch_bug();
    }
  }
  return result;
}

void sub_100025B04(int a1)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBDISPATCH: Unable to open /dev/oslog";
  qword_100031F78 = a1;
  __break(1u);
}

void sub_100025B2C(int a1)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBDISPATCH: Unable to map kernel buffer";
  qword_100031F78 = a1;
  __break(1u);
}

void sub_100025B54(uint64_t a1)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected kernel buffer size";
  qword_100031F78 = a1;
  __break(1u);
}

void sub_100025B7C(unsigned int a1)
{
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose libdispatch version mismatch (20180226)";
  qword_100031F78 = a1;
  __break(1u);
}

void sub_100025BA4(unsigned int a1)
{
  qword_100031F48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose server version mismatch (20180226)";
  qword_100031F78 = a1;
  __break(1u);
}

void sub_100025BCC()
{
  qword_100031F48 = (uint64_t)"MIG_REPLY_MISMATCH";
  qword_100031F78 = -301;
  __break(1u);
}

void sub_100025BF4(uint64_t a1)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBDISPATCH: Invalid firehose server queue type";
  qword_100031F78 = a1;
  __break(1u);
}

uint64_t sub_100025C1C(uint64_t a1, mach_vm_address_t *a2)
{
  return mach_vm_deallocate(mach_task_self_, *a2, 0x40000uLL);
}

void sub_100025C60(unsigned int a1)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBDISPATCH: Unknown recv-right";
  qword_100031F78 = a1;
  __break(1u);
}

void sub_100025C88(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  qword_100031F48 = (uint64_t)"BUG IN LIBDISPATCH: recv-right leak";
  qword_100031F78 = allocator;
  __break(1u);
  CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
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

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return _IOHIDEventSystemClientActivate();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return _IOHIDEventSystemClientCreateWithType();
}

uint64_t IOHIDEventSystemClientRegisterEventBlock()
{
  return _IOHIDEventSystemClientRegisterEventBlock();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return _IOHIDEventSystemClientSetDispatchQueue();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return _IOHIDEventSystemClientSetMatching();
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

uint64_t OSKextCopyLoadedKextInfoByUUID()
{
  return _OSKextCopyLoadedKextInfoByUUID();
}

uint64_t OSKextCopyUUIDForAddress()
{
  return _OSKextCopyUUIDForAddress();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
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

uint64_t __ulock_wait()
{
  return ___ulock_wait();
}

uint64_t __ulock_wake()
{
  return ___ulock_wake();
}

uint64_t _dispatch_bug()
{
  return __dispatch_bug();
}

uint64_t _dispatch_wait_for_enqueuer()
{
  return __dispatch_wait_for_enqueuer();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return __dyld_get_shared_cache_uuid();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_log_preferences_compute()
{
  return __os_log_preferences_compute();
}

uint64_t _os_log_preferences_load()
{
  return __os_log_preferences_load();
}

uint64_t _os_log_preferences_load_sysprefs()
{
  return __os_log_preferences_load_sysprefs();
}

uint64_t _os_log_preferences_merge()
{
  return __os_log_preferences_merge();
}

uint64_t _os_log_simple_parse()
{
  return __os_log_simple_parse();
}

uint64_t _os_object_alloc_realized()
{
  return __os_object_alloc_realized();
}

uint64_t _os_trace_app_cryptex_sysprefsdir_path()
{
  return __os_trace_app_cryptex_sysprefsdir_path();
}

uint64_t _os_trace_atm_diagnostic_config()
{
  return __os_trace_atm_diagnostic_config();
}

uint64_t _os_trace_calloc()
{
  return __os_trace_calloc();
}

uint64_t _os_trace_fdscandir_b()
{
  return __os_trace_fdscandir_b();
}

uint64_t _os_trace_get_boot_uuid()
{
  return __os_trace_get_boot_uuid();
}

uint64_t _os_trace_get_times_now()
{
  return __os_trace_get_times_now();
}

uint64_t _os_trace_getxattr_at()
{
  return __os_trace_getxattr_at();
}

uint64_t _os_trace_intprefsdir_path()
{
  return __os_trace_intprefsdir_path();
}

uint64_t _os_trace_is_development_build()
{
  return __os_trace_is_development_build();
}

uint64_t _os_trace_malloc()
{
  return __os_trace_malloc();
}

uint64_t _os_trace_memdup()
{
  return __os_trace_memdup();
}

uint64_t _os_trace_mmap_at()
{
  return __os_trace_mmap_at();
}

uint64_t _os_trace_os_cryptex_sysprefsdir_path()
{
  return __os_trace_os_cryptex_sysprefsdir_path();
}

uint64_t _os_trace_prefsdir_path()
{
  return __os_trace_prefsdir_path();
}

uint64_t _os_trace_read_plist_at()
{
  return __os_trace_read_plist_at();
}

uint64_t _os_trace_realloc()
{
  return __os_trace_realloc();
}

uint64_t _os_trace_scandir_free_namelist()
{
  return __os_trace_scandir_free_namelist();
}

uint64_t _os_trace_set_diagnostic_flags()
{
  return __os_trace_set_diagnostic_flags();
}

uint64_t _os_trace_sysprefsdir_path()
{
  return __os_trace_sysprefsdir_path();
}

uint64_t _os_trace_write()
{
  return __os_trace_write();
}

uint64_t _os_trace_writev()
{
  return __os_trace_writev();
}

uint64_t _os_trace_zalloc()
{
  return __os_trace_zalloc();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int alphasort(const dirent **a1, const dirent **a2)
{
  return _alphasort(a1, a2);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

uint64_t bootstrap_check_in2()
{
  return _bootstrap_check_in2();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

uint64_t dispatch_mach_cancel()
{
  return _dispatch_mach_cancel();
}

uint64_t dispatch_mach_connect()
{
  return _dispatch_mach_connect();
}

uint64_t dispatch_mach_create_f()
{
  return _dispatch_mach_create_f();
}

uint64_t dispatch_mach_mig_demux()
{
  return _dispatch_mach_mig_demux();
}

uint64_t dispatch_mach_mig_demux_get_context()
{
  return _dispatch_mach_mig_demux_get_context();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return _dispatch_mach_msg_get_msg();
}

uint64_t dispatch_mach_notify_no_senders()
{
  return _dispatch_mach_notify_no_senders();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
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
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

uintptr_t dispatch_source_get_mask(dispatch_source_t source)
{
  return _dispatch_source_get_mask(source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

int dup(int a1)
{
  return _dup(a1);
}

uint64_t exclaves_lookup_service()
{
  return _exclaves_lookup_service();
}

void exit(int a1)
{
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return _faccessat(a1, a2, a3, a4);
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return _fchmodat(a1, a2, a3, a4);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fsetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _fsetattrlist(a1, a2, a3, a4, a5);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int fts_set(FTS *a1, FTSENT *a2, int a3)
{
  return _fts_set(a1, a2, a3);
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  return _host_get_special_port(host_priv, node, which, port);
}

kern_return_t host_request_notification(host_t host, host_flavor_t notify_type, mach_port_t notify_port)
{
  return _host_request_notification(host, notify_type, notify_port);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  return _launch_activate_socket(name, fds, cnt);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

mach_msg_return_t mach_msg_receive(mach_msg_header_t *a1)
{
  return _mach_msg_receive(a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return _mach_port_destruct(task, name, srdelta, guard);
}

kern_return_t mach_port_guard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  return _mach_port_guard(task, name, guard, strict);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return _mach_vm_map(target_task, address, size, mask, flags, object, offset, copy, cur_protection, max_protection, inheritance);
}

int madvise(void *a1, size_t a2, int a3)
{
  return _madvise(a1, a2, a3);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

int mkostemp(char *path, int oflags)
{
  return _mkostemp(path, oflags);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

int mkpathat_np(int dfd, const char *path, mode_t omode)
{
  return _mkpathat_np(dfd, path, omode);
}

int mkstemp(char *a1)
{
  return _mkstemp(a1);
}

int mkstemp_dprotected_np(char *path, int dpclass, int dpflags)
{
  return _mkstemp_dprotected_np(path, dpclass, dpflags);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
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

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

uint64_t open_NOCANCEL()
{
  return _open_NOCANCEL();
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

uint64_t os_map_str_clear()
{
  return _os_map_str_clear();
}

uint64_t os_map_str_find()
{
  return _os_map_str_find();
}

uint64_t os_map_str_init()
{
  return _os_map_str_init();
}

uint64_t os_map_str_insert()
{
  return _os_map_str_insert();
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return _os_retain(object);
}

uint64_t os_simple_hash()
{
  return _os_simple_hash();
}

uint64_t os_trace_set_mode()
{
  return _os_trace_set_mode();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int putchar(int a1)
{
  return _putchar(a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

size_t rb_tree_count(rb_tree_t *a1)
{
  return _rb_tree_count(a1);
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  return _rb_tree_find_node(a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return _rb_tree_insert_node(a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return _rb_tree_iterate(a1, a2, a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return _readlink(a1, a2, a3);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return _recvfrom(a1, a2, a3, a4, a5, a6);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return _renameat(a1, a2, a3, a4);
}

uint64_t sandbox_check()
{
  return _sandbox_check();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _setattrlist(a1, a2, a3, a4, a5);
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return _strtoull(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tb_client_connection_activate()
{
  return _tb_client_connection_activate();
}

uint64_t tb_client_connection_create_with_endpoint()
{
  return _tb_client_connection_create_with_endpoint();
}

uint64_t tb_client_connection_message_construct()
{
  return _tb_client_connection_message_construct();
}

uint64_t tb_client_connection_message_destruct()
{
  return _tb_client_connection_message_destruct();
}

uint64_t tb_connection_send_query()
{
  return _tb_connection_send_query();
}

uint64_t tb_endpoint_create_with_data()
{
  return _tb_endpoint_create_with_data();
}

uint64_t tb_endpoint_set_interface_identifier()
{
  return _tb_endpoint_set_interface_identifier();
}

uint64_t tb_message_complete()
{
  return _tb_message_complete();
}

uint64_t tb_message_configure_received()
{
  return _tb_message_configure_received();
}

uint64_t tb_message_construct()
{
  return _tb_message_construct();
}

uint64_t tb_message_decode_u32()
{
  return _tb_message_decode_u32();
}

uint64_t tb_message_decode_u64()
{
  return _tb_message_decode_u64();
}

uint64_t tb_message_decode_u8()
{
  return _tb_message_decode_u8();
}

uint64_t tb_message_encode_BOOL()
{
  return _tb_message_encode_BOOL();
}

uint64_t tb_message_encode_u32()
{
  return _tb_message_encode_u32();
}

uint64_t tb_message_encode_u64()
{
  return _tb_message_encode_u64();
}

uint64_t tb_message_subrange()
{
  return _tb_message_subrange();
}

uint64_t tb_transport_message_buffer_wrap_buffer()
{
  return _tb_transport_message_buffer_wrap_buffer();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
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

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
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

uint64_t wd_endpoint_set_alive_func()
{
  return _wd_endpoint_set_alive_func();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
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

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return _xpc_connection_get_euid(connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
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

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
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

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}