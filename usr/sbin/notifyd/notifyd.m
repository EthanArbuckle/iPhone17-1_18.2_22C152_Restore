void sub_100002228(uint64_t a1, uint64_t a2)
{
  mach_msg_header_t *msg;
  uint64_t vars8;

  if (a2 == 2 && (dispatch_mach_mig_demux() & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
  }
}

uint64_t sub_100002290(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (!v3 && *(_DWORD *)(result + 4) > 0x1Fu)
    {
      long long v5 = *(_OWORD *)(result + 36);
      v6[0] = *(_OWORD *)(result + 20);
      v6[1] = v5;
      result = sub_100002344((_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44), v6);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100002344(_DWORD *a1, _DWORD *a2, _DWORD *a3, _OWORD *a4)
{
  pid_t pidp = -1;
  ++*((void *)&xmmword_100014178 + 1);
  long long v7 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v7;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  sub_1000046F0((FILE *)7, "__notify_server_checkin %d\n", v8, v9, v10, v11, v12, v13, pidp);
  *a1 = 3;
  uint64_t result = getpid();
  *a2 = result;
  *a3 = 0;
  return result;
}

void sub_1000023F0(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    sub_100002744(a1[8]);
    uint64_t v3 = os_set_32_ptr_find();
    if (v3) {
      uint64_t v4 = v3 - qword_100014208;
    }
    else {
      uint64_t v4 = 0;
    }
    *(_DWORD *)(v4 + 12) &= ~1u;
    for (uint64_t i = *(void *)v4; i; uint64_t i = *(void *)(i + 32))
    {
      sub_10000295C(i, 0, v4);
      if (*(unsigned char *)(v4 + 12)) {
        break;
      }
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

char *sub_1000024B0(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *((_DWORD *)result + 1) != 24)
  {
    int v4 = -304;
    goto LABEL_7;
  }
  int v3 = *((_DWORD *)result + 6);
  result += 24;
  if (v3 || *((_DWORD *)result + 1) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(void *)(a2 + 32) = 0x10000000000000;
  long long v6 = *(_OWORD *)(result + 36);
  long long v31 = *(_OWORD *)(result + 20);
  long long v5 = v31;
  long long v32 = v6;
  mach_port_name_t name = 0;
  *(_DWORD *)(a2 + 48) = 0;
  *(_DWORD *)(a2 + 28) = 0;
  *(_OWORD *)atoken.val = v5;
  *(_OWORD *)&atoken.val[4] = v6;
  pid_t v7 = audit_token_to_pid(&atoken);
  sub_1000046F0((FILE *)7, "__notify_generate_common_port %d\n", v8, v9, v10, v11, v12, v13, v7);
  uint64_t v14 = os_set_32_ptr_find();
  if (!v14 || (v22 = (uint64_t *)(v14 - qword_100014228), v14 == qword_100014228)) {
    v22 = sub_100003FEC(0, v7);
  }
  v23 = (unsigned int *)v22[3];
  if (v23)
  {
    uint64_t v24 = *(void *)v23;
    if (*(void *)v23)
    {
      do
      {
        uint64_t v25 = *(void *)(v24 + 16);
        sub_100002ED4(v24);
        uint64_t v24 = v25;
      }
      while (v25);
      v23 = (unsigned int *)v22[3];
    }
    sub_100005A3C(v23, v15, v16, v17, v18, v19, v20, v21);
    v22[3] = 0;
  }
  *(void *)&atoken.val[4] = 0;
  *(_OWORD *)atoken.val = xmmword_10000E270;
  if (mach_port_construct(mach_task_self_, (mach_port_options_ptr_t)&atoken, 0, &name)) {
    __assert_rtn("__notify_generate_common_port", "notify_proc.c", 1750, "kstatus == KERN_SUCCESS");
  }
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u)) {
    __assert_rtn("__notify_generate_common_port", "notify_proc.c", 1754, "kstatus == KERN_SUCCESS");
  }
  mach_port_name_t v26 = name;
  uint64_t result = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  if (result)
  {
    v27 = result;
    ++dword_100014278;
    *(void *)uint64_t result = 0;
    *((_DWORD *)result + 2) = v26;
    *((_DWORD *)result + 3) = 2;
    os_set_32_ptr_insert();
    uint64_t result = (char *)sub_100002744(v26);
    v22[3] = (uint64_t)v27;
    mach_port_name_t v28 = name;
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    *(_DWORD *)(a2 + 28) = v28;
  }
  else
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
    __break(1u);
  }
  return result;
}

uint64_t sub_100002744(mach_port_name_t name)
{
  mach_port_t previous = 0;
  uint64_t result = mach_port_request_notification(mach_task_self_, name, 66, 0, dword_100014288, 0x15u, &previous);
  if (result)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to arm send-possible";
    qword_100014040 = (int)result;
    __break(1u);
    goto LABEL_5;
  }
  if (previous)
  {
LABEL_5:
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: send-possible already armed??";
    qword_100014040 = 0;
    __break(1u);
  }
  return result;
}

void sub_1000027EC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  int v4 = *(_DWORD *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v23.val = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v23.val[4] = v5;
  *(_OWORD *)atoken.val = *(_OWORD *)v23.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uid_t v6 = audit_token_to_euid(&atoken);
  ++*((void *)&xmmword_1000140F8 + 1);
  sub_1000046F0((FILE *)7, "__notify_server_resume_pid %d\n", v7, v8, v9, v10, v11, v12, v4);
  if (v6)
  {
    audit_token_t atoken = v23;
    audit_token_to_pid(&atoken);
    sub_1000046F0((FILE *)4, "__notify_server_resume_pid %d permission denied for caller %d \n", v13, v14, v15, v16, v17, v18, v4);
  }
  else
  {
    uint64_t v19 = os_set_32_ptr_find();
    if (v19)
    {
      uint64_t v20 = v19 - qword_100014228;
      if (v19 != qword_100014228)
      {
        *(_DWORD *)(v20 + 20) &= ~1u;
        for (uint64_t i = *(void *)v20; i; uint64_t i = *(void *)(i + 16))
          sub_10000295C(i, v20, 0);
      }
    }
  }
  *(_DWORD *)(a2 + 32) = 0;
}

void sub_10000295C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 78) || (char v3 = *(unsigned char *)(a1 + 78) - 1, (*(unsigned char *)(a1 + 78) = v3) == 0))
  {
    char v4 = *(unsigned char *)(a1 + 79);
    *(unsigned char *)(a1 + 79) = v4 & 0x5F;
    if ((v4 & 0x40) != 0) {
      sub_100004C70(a1, a2, a3);
    }
  }
}

void sub_100002990(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0) {
    goto LABEL_18;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 36);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(a1, v4))
  {
    __break(0x5513u);
    return;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  if (memchr((void *)(a1 + 40), 0, v8))
  {
    uint64_t v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + a1;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      int v11 = *(_DWORD *)(a1 + v6 + 40);
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      sub_100002AAC((const char *)(a1 + 40), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

int64x2_t sub_100002AAC(const char *a1, int a2, long long *a3)
{
  uint64_t v7 = 0;
  long long v3 = a3[1];
  v5[0] = *a3;
  v5[1] = v3;
  sub_100002B04(a1, &v7, &v6, a2, v5);
  int64x2_t result = vaddq_s64((int64x2_t)xmmword_100014090, (int64x2_t)xmmword_10000E210);
  xmmword_100014090 = (__int128)result;
  return result;
}

FILE *sub_100002B04(const char *a1, void *a2, _DWORD *a3, int a4, long long *a5)
{
  int v26 = -1;
  int v27 = -1;
  int v25 = -1;
  *a2 = 0;
  long long v10 = a5[1];
  long long v28 = *a5;
  long long v29 = v10;
  sub_1000047F0(&v28, 0xFFFFFFFF, (uid_t *)&v27, (gid_t *)&v26, &v25, 0);
  int v11 = v27;
  if (a4 && v27)
  {
    long long v12 = a5[1];
    long long v28 = *a5;
    long long v29 = v12;
    if (sub_100005080(&v28))
    {
      int v11 = 0;
      int v27 = 0;
    }
    else
    {
      int v11 = v27;
    }
  }
  int64x2_t result = (FILE *)sub_100004A34(a1, v11, v26, 2);
  *a3 = result;
  if (!result)
  {
    long long v14 = a5[1];
    long long v28 = *a5;
    long long v29 = v14;
    int64x2_t result = (FILE *)sub_100005894(a1);
    if (result)
    {
      *(void *)&xmmword_100014078 = xmmword_100014078 + 1;
      ++*((void *)&xmmword_100014090 + 1);
      int v15 = sub_100002CE4((uint64_t)a1, v27, v26);
      *a3 = v15;
      if (v15 == 10) {
        __assert_rtn("__notify_server_post_2", "notify_proc.c", 623, "*status != NOTIFY_STATUS_NULL_INPUT");
      }
      uint64_t v16 = os_set_str_ptr_find();
      if (!v16 || qword_1000141A8 == v16)
      {
        *a3 = 60;
        *a2 = -1;
        ++*((void *)&xmmword_100014078 + 1);
        return sub_1000046F0((FILE *)7, "__notify_server_post %s %d\n", v17, v18, v19, v20, v21, v22, (char)a1);
      }
      uint64_t v23 = v16 - qword_1000141A8;
      ++*(_DWORD *)(v23 + 64);
      uint64_t v24 = *(void *)(v23 + 16);
      *a2 = v24;
      if (v24 == -1) {
        return sub_1000046F0((FILE *)7, "__notify_server_post %s %d\n", v17, v18, v19, v20, v21, v22, (char)a1);
      }
      return sub_1000046F0((FILE *)7, "__notify_server_post %s %d [%llu]\n", v17, v18, v19, v20, v21, v22, (char)a1);
    }
    else
    {
      *a3 = 7;
    }
  }
  return result;
}

uint64_t sub_100002CE4(uint64_t a1, int a2, int a3)
{
  if (!a1) {
    return 10;
  }
  uint64_t result = os_set_str_ptr_find();
  if (result)
  {
    if (qword_1000141A8 == result) {
      return 0;
    }
    uint64_t v6 = *(unsigned int *)(result - qword_1000141A8 + 52);
    if (v6 != -1)
    {
      if (__CFADD__(qword_1000142E0, 4 * v6))
      {
        __break(0x5513u);
        return result;
      }
      ++*(_DWORD *)(qword_1000142E0 + 4 * v6);
    }
    uint64_t v7 = os_set_str_ptr_find();
    if (v7 && qword_1000141A8 != v7)
    {
      uint64_t v8 = v7 - qword_1000141A8;
      return sub_100004C0C(v8, a2, a3);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void sub_100002DCC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  long long v4 = *(_OWORD *)(a1 + 72);
  v12[0] = *(_OWORD *)(a1 + 56);
  v12[1] = v4;
  int v13 = -1;
  uid_t v14 = -1;
  sub_1000047F0(v12, 0xFFFFFFFF, &v14, 0, &v13, 0);
  ++*((void *)&xmmword_1000140D8 + 1);
  sub_1000046F0((FILE *)7, "__notify_server_cancel %d %d\n", v5, v6, v7, v8, v9, v10, v13);
  uint64_t v11 = os_set_64_ptr_find();
  if (v11)
  {
    if (qword_1000141E8 != v11) {
      sub_100002ED4(v11 - qword_1000141E8);
    }
  }
  *(_DWORD *)(a2 + 32) = 0;
}

void sub_100002ED4(uint64_t a1)
{
  ++qword_100014170;
  if (*(_WORD *)(a1 + 76))
  {
    uint64_t v2 = *(unsigned __int16 *)(a1 + 76) - 1;
    if (__CFADD__(qword_100014290, 8 * v2)) {
      goto LABEL_27;
    }
    int v3 = *(void **)(qword_100014290 + 8 * v2);
    *(void *)(qword_100014290 + 8 * v2) = 0;
    if ((*(_DWORD *)v3 - 1) <= 1)
    {
      uint64_t v4 = v3[1];
      dispatch_assert_queue_V2((dispatch_queue_t)qword_100014298);
      if (v4)
      {
        uint64_t v5 = *(NSObject **)(v4 + 72);
        if (v5) {
          dispatch_source_cancel(v5);
        }
        sub_10000A658(v4);
      }
    }
    free(v3);
    *(_WORD *)(a1 + 76) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (!v6) {
    __assert_rtn("port_proc_cancel_client", "notify_proc.c", 330, "n != NULL");
  }
  int v7 = *(unsigned char *)(a1 + 79) & 0xF;
  if (v7 == 7 || v7 == 3)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      *(void *)(v9 + 40) = *(void *)(a1 + 40);
    }
    **(void **)(a1 + 40) = v9;
    goto LABEL_21;
  }
  if (v7 == 1)
  {
    uint64_t v10 = *(unsigned int *)(v6 + 52);
    if (!__CFADD__(qword_1000142E8, 4 * v10))
    {
      --*(_DWORD *)(qword_1000142E8 + 4 * v10);
      goto LABEL_21;
    }
LABEL_27:
    __break(0x5513u);
    return;
  }
LABEL_21:
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11) {
    *(void *)(v11 + 24) = *(void *)(a1 + 24);
  }
  **(void **)(a1 + 24) = v11;

  sub_100003024((uint64_t *)a1);
}

void sub_100003024(uint64_t *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *a1;
  if (*a1) {
    *(void *)(v3 + 8) = a1[1];
  }
  *(void *)a1[1] = v3;
  sub_1000030E8((uint64_t)&unk_1000141D0, a1[8], (uint64_t)(a1 + 8));
  int v4 = *((unsigned char *)a1 + 79) & 0xF;
  if (v4 == 3)
  {
    mach_port_deallocate(mach_task_self_, *((_DWORD *)a1 + 14));
  }
  else if (v4 == 4 && (a1[7] & 0x80000000) == 0)
  {
    close_NOCANCEL();
  }
  free(a1);
  ++dword_100014274;

  sub_100003134(v2);
}

uint64_t sub_1000030E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_64_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete_64", "table.c", 80, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

void sub_100003134(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(_DWORD *)(a1 + 56);
    if (!v2 || (int v3 = v2 - 1, (*(_DWORD *)(a1 + 56) = v3) == 0))
    {
      int v4 = dword_10001425C;
      if (dword_10001425C)
      {
        uint64_t v5 = 0;
        uint64_t v6 = (void *)qword_100014248;
        unint64_t v7 = 8;
        while (1)
        {
          if (~qword_100014248 < (unint64_t)(8 * v5)) {
            goto LABEL_24;
          }
          if (*(void *)(qword_100014248 + 8 * v5) == a1) {
            break;
          }
          ++v5;
          v7 += 8;
          if (v5 == dword_10001425C) {
            goto LABEL_20;
          }
        }
        if ((int)v5 + 1 < dword_10001425C)
        {
          uint64_t v8 = 8 * dword_10001425C;
          while (v7 <= ~qword_100014248 && ~qword_100014248 >= 8 * (unint64_t)v5)
          {
            *(void *)(qword_100014248 + 8 * v5) = *(void *)(qword_100014248 + v7);
            v7 += 8;
            LODWORD(v5) = v5 + 1;
            if (v8 == v7)
            {
              uint64_t v6 = (void *)qword_100014248;
              goto LABEL_16;
            }
          }
LABEL_24:
          __break(0x5513u);
          return;
        }
LABEL_16:
        unsigned int v9 = v4 - 1;
        dword_10001425C = v9;
        if (v9)
        {
          uint64_t v10 = reallocf(v6, 8 * v9);
        }
        else
        {
          free(v6);
          uint64_t v10 = 0;
        }
        qword_100014248 = (uint64_t)v10;
      }
LABEL_20:
      if (os_set_str_ptr_delete() != a1 + 8) {
        __assert_rtn("_nc_table_delete", "table.c", 72, "os_set_delete(&t->set, key) == expected");
      }
      *(void *)(a1 + 8) = 0;
      sub_1000030E8((uint64_t)&unk_1000141B0, *(void *)(a1 + 16), a1 + 16);
      free((void *)a1);
      ++dword_10001426C;
    }
  }
}

FILE *sub_100003290(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 52)
  {
    int v3 = -304;
  }
  else
  {
    if (!HIDWORD(result->_cookie) && LODWORD(result->_close) > 0x1F)
    {
      uint64_t v5 = *(void *)&result->_bf._size;
      uint64_t v4 = *(void *)&result->_lbfsize;
      int cookie = (int)result->_cookie;
      __sbuf ub = result->_ub;
      v8[0] = *(_OWORD *)&result->_seek;
      v8[1] = ub;
      uint64_t result = sub_100003330(v5, v4, cookie, v8, 0);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_100003330(uint64_t a1, uint64_t a2, int a3, _OWORD *a4, int a5)
{
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  ++qword_100014130;
  ++*((void *)&xmmword_100014138 + 1);
  long long v10 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v10;
  audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
  if (a3)
  {
    if (euidp)
    {
      long long v11 = a4[1];
      *(_OWORD *)atoken.val = *a4;
      *(_OWORD *)&atoken.val[4] = v11;
      if (sub_100005080(&atoken)) {
        uid_t euidp = 0;
      }
    }
  }
  uint64_t result = (FILE *)os_set_64_ptr_find();
  if (result)
  {
    if ((FILE *)qword_1000141C8 != result)
    {
      int v13 = *(const char **)((char *)&result->_r - qword_1000141C8);
      long long v14 = a4[1];
      *(_OWORD *)atoken.val = *a4;
      *(_OWORD *)&atoken.val[4] = v14;
      uint64_t result = (FILE *)sub_100005894(v13);
      if (result)
      {
        if (!a5
          || (long long v21 = a4[1],
              *(_OWORD *)atoken.val = *a4,
              *(_OWORD *)&atoken.val[4] = v21,
              uint64_t result = (FILE *)sandbox_check_by_audit_token(),
              !result))
        {
          uint64_t result = (FILE *)sub_1000034E8(a1, a2, euidp, egidp);
          if (result != 7 && result != 1)
          {
            if (result) {
              __assert_rtn("_internal_notify_server_set_state_2", "notify_proc.c", 1371, "status == NOTIFY_STATUS_OK || status == NOTIFY_STATUS_NOT_AUTHORIZED || status == NOTIFY_STATUS_INVALID_NAME");
            }
            return sub_1000046F0((FILE *)7, "__notify_server_set_state_2 %d %llu %llu [uid %d%s gid %d]\n", v15, v16, v17, v18, v19, v20, pidp);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000034E8(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = os_set_64_ptr_find();
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v7 - qword_1000141C8;
  if (v7 == qword_1000141C8) {
    return 1;
  }
  if (sub_100004A34(*(const char **)(v8 + 8), a3, a4, 2)) {
    return 7;
  }
  *(void *)(v8 + 24) = a2;
  uint64_t v10 = mach_absolute_time();
  uint64_t result = 0;
  *(void *)(v8 + 32) = v10;
  return result;
}

FILE *sub_100003578(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (!*(&result->_bf._size + 1) && result->_lbfsize > 0x1Fu)
  {
    long long v4 = *(_OWORD *)&result->_seek;
    v15[0] = *(_OWORD *)&result->_close;
    v15[1] = v4;
    gid_t v17 = -1;
    uid_t v18 = -1;
    *(void *)(a2 + 36) = 0;
    int v16 = -1;
    *(void *)(a2 + 44) = 0;
    sub_1000047F0(v15, 0xFFFFFFFF, &v18, &v17, &v16, 0);
    *(void *)&xmmword_100014110 = xmmword_100014110 + 1;
    ++qword_100014128;
    uint64_t v5 = os_set_64_ptr_find();
    if (v5 && qword_1000141E8 != v5)
    {
      uint64_t v12 = v5 - qword_1000141E8;
      *(void *)(a2 + 36) = 0;
      uint64_t v13 = os_set_64_ptr_find();
      if (!v13 || qword_1000141C8 == v13)
      {
        *(_DWORD *)(a2 + 52) = 1;
        __assert_rtn("__notify_server_get_state_3", "notify_proc.c", 1243, "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
      }
      *(void *)(a2 + 36) = *(void *)(v13 - qword_1000141C8 + 24);
      *(_DWORD *)(a2 + 52) = 0;
      uint64_t v14 = *(void *)(*(void *)(v12 + 48) + 16);
      *(void *)(a2 + 44) = v14;
      if (v14 != -1)
      {
        uint64_t result = sub_1000046F0((FILE *)7, "__notify_server_get_state_3 %d %d [%llu]\n", v6, v7, v8, v9, v10, v11, v16);
        goto LABEL_13;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 52) = 50;
      *(void *)(a2 + 44) = -1;
    }
    uint64_t result = sub_1000046F0((FILE *)7, "__notify_server_get_state_3 %d %d\n", v6, v7, v8, v9, v10, v11, v16);
LABEL_13:
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 56;
    return result;
  }
  int v3 = -309;
LABEL_7:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000375C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  uint64_t v4 = *(void *)(result + 32);
  long long v5 = *(_OWORD *)(result + 76);
  v13[0] = *(_OWORD *)(result + 60);
  v13[1] = v5;
  gid_t v14 = -1;
  uid_t v15 = -1;
  *(void *)(a2 + 36) = 0;
  sub_1000047F0(v13, 0xFFFFFFFF, &v15, &v14, 0, 0);
  sub_1000046F0((FILE *)7, "__notify_server_get_state_2 %llu\n", v6, v7, v8, v9, v10, v11, v4);
  *(void *)(a2 + 36) = 0;
  uint64_t result = os_set_64_ptr_find();
  if (result && qword_1000141C8 != result)
  {
    int v12 = 0;
    *(void *)(a2 + 36) = *(void *)(result - qword_1000141C8 + 24);
  }
  else
  {
    int v12 = 1;
  }
  *(_DWORD *)(a2 + 44) = v12;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

char *sub_100003880(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  uint64_t result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (char *)sub_10000399C(v3 + 40, v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000399C(char *a1, unsigned int a2, long long *a3)
{
  unint64_t v23 = 0;
  int v21 = -1;
  int v22 = -1;
  unsigned int v20 = -1;
  xmmword_1000140A0 = (__int128)vaddq_s64((int64x2_t)xmmword_1000140A0, vdupq_n_s64(1uLL));
  long long v6 = a3[1];
  long long v18 = *a3;
  long long v19 = v6;
  sub_1000047F0(&v18, a2, (uid_t *)&v22, (gid_t *)&v21, &v20, &v23);
  sub_1000046F0((FILE *)7, "__notify_server_register_plain %s %d %d\n", v7, v8, v9, v10, v11, v12, (char)a1);
  uint64_t v13 = sub_100003F5C(a1, v20, a2, -1, v22, v21, &v24);
  if (!v13)
  {
    uint64_t v14 = os_set_64_ptr_find();
    if (v14) {
      uid_t v15 = (uint64_t *)(v14 - qword_1000141E8);
    }
    else {
      uid_t v15 = 0;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      long long v16 = a3[1];
      long long v18 = *a3;
      long long v19 = v16;
      sub_10000C024(a1, (uint64_t)v15, &v18);
    }
    sub_100003EBC(v15, v20);
  }
  return v13;
}

char *sub_100003AC4(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  uint64_t result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (char *)sub_100003C08(v3 + 40, v11, (_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (void *)(a2 + 44), (_DWORD *)(a2 + 52), v13);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 56;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t *sub_100003C08(char *a1, unsigned int a2, _DWORD *a3, _DWORD *a4, void *a5, _DWORD *a6, long long *a7)
{
  unint64_t v33 = 0;
  int v31 = -1;
  int v32 = -1;
  unsigned int v30 = -1;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  long long v14 = a7[1];
  long long v34 = *a7;
  long long v35 = v14;
  sub_1000047F0(&v34, a2, (uid_t *)&v32, (gid_t *)&v31, &v30, &v33);
  *(void *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  ++qword_1000140B0;
  if (!dword_1000142D8)
  {
    *a3 = -1;
    *a4 = -1;
    long long v25 = a7[1];
    long long v34 = *a7;
    long long v35 = v25;
    return (uint64_t *)sub_10000399C(a1, a2, &v34);
  }
  uint64_t result = (uint64_t *)os_set_str_ptr_find();
  if (!result
    || (uint64_t *)qword_1000141A8 == result
    || (uint64_t v22 = *(unsigned int *)((char *)result - qword_1000141A8 + 52), v22 == -1))
  {
    if (dword_1000142D8 >= 2)
    {
      LODWORD(v22) = dword_1000142DC;
      int v24 = 1;
      do
      {
        uint64_t v22 = (int)v22 + 1 < dword_1000142D8 ? (v22 + 1) : 1;
        unint64_t v23 = 4 * v22;
        if (v23 > ~qword_1000142E8) {
          goto LABEL_33;
        }
        if (!*(_DWORD *)(qword_1000142E8 + 4 * v22))
        {
          if (v22 == -1) {
            break;
          }
          dword_1000142DC = v22;
          goto LABEL_22;
        }
      }
      while (dword_1000142D8 != ++v24);
    }
    if (dword_1000142DC + 1 < dword_1000142D8) {
      int v26 = dword_1000142DC + 1;
    }
    else {
      int v26 = 1;
    }
    dword_1000142DC = v26;
    uint64_t result = (uint64_t *)sub_1000046F0((FILE *)7, "reused shared memory slot %u\n", v16, v17, v18, v19, v20, v21, v26);
    uint64_t v22 = dword_1000142DC;
    unint64_t v23 = 4 * dword_1000142DC;
LABEL_22:
    if (__CFADD__(qword_1000142E0, v23))
    {
LABEL_33:
      __break(0x5513u);
      return result;
    }
    *(_DWORD *)(qword_1000142E0 + 4 * v22) = 1;
  }
  else
  {
    unint64_t v23 = 4 * v22;
  }
  if (__CFADD__(qword_1000142E8, v23)) {
    goto LABEL_33;
  }
  ++*(_DWORD *)(qword_1000142E8 + 4 * v22);
  sub_1000046F0((FILE *)7, "__notify_server_register_check %s %d %d\n", v16, v17, v18, v19, v20, v21, (char)a1);
  *a3 = 4 * dword_1000142D8;
  *a4 = v22;
  uint64_t result = (uint64_t *)sub_100003F5C(a1, v30, a2, v22, v32, v31, a5);
  *a6 = result;
  if (!result)
  {
    uint64_t v27 = os_set_64_ptr_find();
    if (v27) {
      long long v28 = (uint64_t *)(v27 - qword_1000141E8);
    }
    else {
      long long v28 = 0;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      long long v29 = a7[1];
      long long v34 = *a7;
      long long v35 = v29;
      sub_10000C024(a1, (uint64_t)v28, &v34);
    }
    return sub_100003EBC(v28, v30);
  }
  return result;
}

uint64_t *sub_100003EBC(uint64_t *result, int a2)
{
  if (a2 < 1) {
    return result;
  }
  uint64_t v3 = (uint64_t)result;
  uint64_t result = (uint64_t *)os_set_32_ptr_find();
  if (result)
  {
    if (v3 && result != (uint64_t *)qword_100014228)
    {
      uint64_t v4 = (uint64_t *)((char *)result - qword_100014228);
      uint64_t v5 = *(uint64_t *)((char *)result - qword_100014228);
      *(void *)(v3 + 16) = v5;
      if (v5) {
        *(void *)(v5 + 24) = v3 + 16;
      }
      *uint64_t v4 = v3;
      *(void *)(v3 + 24) = v4;
      return result;
    }
    if ((uint64_t *)qword_100014228 != result) {
      return result;
    }
  }

  return sub_100003FEC(v3, a2);
}

uint64_t sub_100003F5C(const char *a1, uint64_t a2, unsigned int a3, int a4, int a5, int a6, void *a7)
{
  if (!a1) {
    return 1;
  }
  uint64_t v14 = 0;
  uint64_t result = sub_1000048D8(a1, a2, a3, a5, a6, &v14);
  if (!result)
  {
    uint64_t v10 = v14;
    char v11 = *(unsigned char *)(v14 + 79) & 0xF0;
    uint64_t v12 = *(void *)(v14 + 48);
    if (a4 == -1)
    {
      char v13 = v11 | 2;
    }
    else
    {
      char v13 = v11 | 1;
      *(_DWORD *)(v12 + 52) = a4;
    }
    uint64_t result = 0;
    *(unsigned char *)(v10 + 79) = v13;
    *a7 = *(void *)(v12 + 16);
  }
  return result;
}

uint64_t *sub_100003FEC(uint64_t a1, int a2)
{
  uint64_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a2, 0x80000000uLL, (dispatch_queue_t)qword_100014298);
  dispatch_source_set_event_handler_f(v4, (dispatch_function_t)sub_100005AD4);
  uint64_t result = (uint64_t *)malloc_type_malloc(0x20uLL, 0x10200407DCD39BEuLL);
  if (result)
  {
    unsigned int v6 = result;
    ++dword_100014278;
    *uint64_t result = 0;
    result[1] = (uint64_t)v4;
    *((_DWORD *)result + 5) = 0;
    *((_DWORD *)result + 4) = a2;
    result[3] = 0;
    os_set_32_ptr_insert();
    if (a1)
    {
      uint64_t v7 = *v6;
      *(void *)(a1 + 16) = *v6;
      if (v7) {
        *(void *)(v7 + 24) = a1 + 16;
      }
      *unsigned int v6 = a1;
      *(void *)(a1 + 24) = v6;
    }
    dispatch_set_context(v4, v6);
    dispatch_source_set_cancel_handler_f(v4, (dispatch_function_t)sub_10000599C);
    dispatch_activate(v4);
    return v6;
  }
  else
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
    __break(1u);
  }
  return result;
}

void sub_100004108(uint64_t a1, uint64_t a2)
{
  if (a2 == 2 && (dispatch_mach_mig_demux() & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
  }
}

char *sub_100004170(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  uint64_t v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  uint64_t result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (char *)sub_100004520(v3 + 40, v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000428C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 44) && *(_DWORD *)(result + 48) > 0x1Fu)
    {
      int v4 = *(_DWORD *)(result + 40);
      long long v5 = *(_OWORD *)(result + 80);
      long long v23 = *(_OWORD *)(result + 64);
      long long v24 = v5;
      int v19 = -1;
      int v20 = -1;
      int v18 = -1;
      uint64_t result = os_set_64_ptr_find();
      if (result)
      {
        uint64_t v6 = result - qword_1000141C8;
        if (result != qword_1000141C8)
        {
          ++*(_DWORD *)(v6 + 64);
          long long v21 = v23;
          long long v22 = v24;
          sub_1000047F0(&v21, 0xFFFFFFFF, (uid_t *)&v20, (gid_t *)&v19, &v18, 0);
          if (v4)
          {
            if (v20)
            {
              long long v21 = v23;
              long long v22 = v24;
              if (sub_100005080(&v21)) {
                int v20 = 0;
              }
            }
          }
          uint64_t v7 = *(const char **)(v6 + 8);
          long long v21 = v23;
          long long v22 = v24;
          uint64_t result = sub_100005894(v7);
          if (result)
          {
            uint64_t result = sub_100004A34(*(const char **)(v6 + 8), v20, v19, 2);
            if (result)
            {
              if (result == 10) {
                __assert_rtn("__notify_server_post_3", "notify_proc.c", 567, "status != NOTIFY_STATUS_NULL_INPUT");
              }
            }
            else
            {
              *(void *)&xmmword_100014078 = xmmword_100014078 + 1;
              ++qword_100014088;
              sub_1000046F0((FILE *)7, "__notify_server_post %s %d by nameid: %llu \n", v8, v9, v10, v11, v12, v13, *(void *)(v6 + 8));
              int v15 = v19;
              int v14 = v20;
              uint64_t result = os_set_64_ptr_find();
              if (result && qword_1000141C8 != result)
              {
                uint64_t v16 = *(unsigned int *)(result - qword_1000141C8 + 52);
                if (v16 != -1)
                {
                  if (__CFADD__(qword_1000142E0, 4 * v16))
                  {
                    __break(0x5513u);
                    return result;
                  }
                  ++*(_DWORD *)(qword_1000142E0 + 4 * v16);
                }
                uint64_t v17 = os_set_64_ptr_find();
                if (!v17
                  || qword_1000141C8 == v17
                  || (uint64_t result = sub_100004C0C(v17 - qword_1000141C8, v14, v15), result))
                {
                  __assert_rtn("__notify_server_post_3", "notify_proc.c", 578, "status == NOTIFY_STATUS_OK");
                }
              }
            }
          }
        }
      }
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100004520(char *a1, unsigned int a2, long long *a3)
{
  unint64_t v33 = 0;
  int v31 = -1;
  int v32 = -1;
  unsigned int v30 = -1;
  long long v6 = a3[1];
  long long v28 = *a3;
  long long v29 = v6;
  sub_1000047F0(&v28, a2, (uid_t *)&v32, (gid_t *)&v31, &v30, &v33);
  *(void *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  *(void *)&xmmword_1000140D8 = xmmword_1000140D8 + 1;
  sub_1000046F0((FILE *)7, "_notify_internal_register_common_port %s %d %d\n", v7, v8, v9, v10, v11, v12, (char)a1);
  uint64_t v13 = os_set_32_ptr_find();
  if (v13 && (int v20 = (uint64_t *)(v13 - qword_100014228), v13 != qword_100014228) && v20[3])
  {
    if (a1)
    {
      *(void *)&long long v28 = 0;
      uint64_t result = sub_1000048D8(a1, v30, a2, v32, v31, &v28);
      if (!result)
      {
        *(unsigned char *)(v28 + 79) = *(unsigned char *)(v28 + 79) & 0xF0 | 7;
        uint64_t v22 = os_set_64_ptr_find();
        if (v22) {
          long long v23 = (void *)(v22 - qword_1000141E8);
        }
        else {
          long long v23 = 0;
        }
        if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
        {
          long long v24 = a3[1];
          long long v28 = *a3;
          long long v29 = v24;
          sub_10000C024(a1, (uint64_t)v23, &v28);
        }
        if (v23)
        {
          uint64_t v25 = *v20;
          v23[2] = *v20;
          if (v25) {
            *(void *)(v25 + 24) = v23 + 2;
          }
          *int v20 = (uint64_t)v23;
          v23[3] = v20;
        }
        int v26 = (uint64_t *)v20[3];
        uint64_t v27 = *v26;
        v23[4] = *v26;
        if (v27) {
          *(void *)(v27 + 40) = v23 + 4;
        }
        uint64_t result = 0;
        *int v26 = (uint64_t)v23;
        v23[5] = v26;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    sub_1000046F0((FILE *)7, "_notify_internal_register_common_port FAILED %s %d %d\n", v14, v15, v16, v17, v18, v19, (char)a1);
    return 59;
  }
  return result;
}

FILE *sub_1000046F0(FILE *result, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (dword_1000142F8 >= (int)result)
  {
    uint64_t result = (FILE *)qword_100014308;
    if (qword_100014308)
    {
      uint64_t result = fopen((const char *)qword_100014308, "a");
      if (result)
      {
        uint64_t v10 = result;
        time_t v12 = time(0);
        *(_OWORD *)uint64_t v13 = 0u;
        long long v14 = 0u;
        uint64_t v11 = localtime(&v12);
        strftime(v13, 0x20uLL, "%b %e %T", v11);
        fprintf(v10, "%s: ", v13);
        vfprintf(v10, a2, &a9);
        fflush(v10);
        return (FILE *)fclose(v10);
      }
    }
  }
  return result;
}

void sub_1000047F0(_OWORD *a1, unsigned int a2, uid_t *a3, gid_t *a4, _DWORD *a5, unint64_t *a6)
{
  if (a3)
  {
    long long v11 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v11;
    *a3 = audit_token_to_euid(&atoken);
  }
  if (a4)
  {
    long long v12 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v12;
    *a4 = audit_token_to_egid(&atoken);
  }
  long long v13 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v13;
  uint64_t v14 = audit_token_to_pid(&atoken);
  if (a5) {
    *a5 = v14;
  }
  if (a6) {
    *a6 = a2 | (unint64_t)(v14 << 32);
  }
  uint64_t v15 = os_set_64_ptr_find();
  if (v15)
  {
    if (qword_1000141E8 != v15)
    {
      uint64_t v22 = v15 - qword_1000141E8;
      sub_1000046F0((FILE *)7, "duplicate token %d sent from PID %d\n", v16, v17, v18, v19, v20, v21, a2);
      sub_100002ED4(v22);
    }
  }
}

uint64_t sub_1000048D8(const char *a1, uint64_t a2, unsigned int a3, int a4, int a5, void *a6)
{
  if (!a6) {
    return 0;
  }
  if (sub_100004A34(a1, a4, a5, 1)) {
    return 7;
  }
  *a6 = 0;
  uint64_t v11 = os_set_str_ptr_find();
  if (!v11 || (long long v12 = (void *)(v11 - qword_1000141A8), v11 == qword_1000141A8))
  {
    long long v12 = sub_100005138(a1);
    if (!v12) {
      return 47;
    }
  }
  unint64_t v13 = a3 | (unint64_t)(a2 << 32);
  ++*((_DWORD *)v12 + 14);
  uint64_t v14 = os_set_64_ptr_find();
  if ((!v14 || qword_1000141E8 == v14) && (uint64_t v15 = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040BED8B209uLL)) != 0)
  {
    uint64_t v16 = v15;
    ++dword_100014270;
    v15[8] = v13;
    v15[6] = v12;
    uint64_t v17 = *v12;
    *uint64_t v15 = *v12;
    if (v17) {
      *(void *)(v17 + 8) = v15;
    }
    *long long v12 = v15;
    v15[1] = v12;
    os_set_64_ptr_insert();
    uint64_t result = 0;
    *a6 = v16;
  }
  else
  {
    sub_100003134((uint64_t)v12);
    return 48;
  }
  return result;
}

uint64_t sub_100004A34(const char *a1, int a2, int a3, int a4)
{
  if (!a1) {
    return 10;
  }
  if (!a2) {
    return 0;
  }
  if (strncmp(a1, "user.uid.", 9uLL))
  {
    size_t v8 = strlen(a1);
    uint64_t v9 = qword_100014248;
    if (!qword_100014248)
    {
      dword_10001425C = 0;
      return 0;
    }
    int v24 = a4;
    if (!dword_10001425C) {
      return 0;
    }
    size_t v10 = v8;
    unint64_t v11 = 0;
    unint64_t v12 = ~qword_100014248;
    uint64_t v13 = 8 * dword_10001425C;
    while (1)
    {
      if (v11 > v12) {
        goto LABEL_38;
      }
      uint64_t v14 = *(void *)(v9 + v11);
      if (!v14) {
        return 0;
      }
      uint64_t v15 = *(const char **)(v14 + 8);
      if (v15)
      {
        size_t v16 = strlen(*(const char **)(v14 + 8));
        if (v16 <= v10 && !strncmp(v15, a1, v16)) {
          break;
        }
      }
      v11 += 8;
      if (v13 == v11) {
        return 0;
      }
    }
    if (*(_DWORD *)(v14 + 40) == a2 && (*(_DWORD *)(v14 + 48) & v24) != 0) {
      return 0;
    }
    int v21 = *(_DWORD *)(v14 + 48);
    BOOL v22 = *(_DWORD *)(v14 + 44) != a3 || (v21 & (16 * v24)) == 0;
    if (!v22 || (v21 & (v24 << 8)) != 0) {
      return 0;
    }
    return 7;
  }
  snprintf(__str, 0x3FuLL, "%s%d", "user.uid.", a2);
  size_t v18 = strlen(__str);
  if (strncmp(a1, __str, v18)) {
    return 7;
  }
  if (__CFADD__(a1, v18)) {
LABEL_38:
  }
    __break(0x5513u);
  int v19 = a1[v18];
  if (v19 == 46 || v19 == 0) {
    return 0;
  }
  else {
    return 7;
  }
}

uint64_t sub_100004C0C(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = a1;
  if (sub_100004A34(*(const char **)(a1 + 8), a2, a3, 2)) {
    return 7;
  }
  ++*(_DWORD *)(v3 + 60);
  while (1)
  {
    uint64_t v3 = *(void *)v3;
    if (!v3) {
      break;
    }
    sub_100004C70(v3, 0, 0);
  }
  return 0;
}

void sub_100004C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(unsigned char *)(a1 + 79);
  if ((v4 & 0x20) != 0)
  {
    char v7 = v4 | 0x40;
    goto LABEL_31;
  }
  if (a2) {
    goto LABEL_3;
  }
  uint64_t v8 = os_set_32_ptr_find();
  if (v8 && qword_100014228 != v8)
  {
    a2 = v8 - qword_100014228;
    char v4 = *(unsigned char *)(a1 + 79);
LABEL_3:
    if (*(unsigned char *)(a2 + 20))
    {
      ++*(unsigned char *)(a1 + 78);
      char v7 = v4 | 0x60;
      goto LABEL_31;
    }
    char v6 = 0;
    goto LABEL_9;
  }
  a2 = 0;
  char v4 = *(unsigned char *)(a1 + 79);
  char v6 = 1;
LABEL_9:
  switch(v4 & 0xF)
  {
    case 3:
      mach_port_t v9 = *(_DWORD *)(a1 + 56);
      goto LABEL_36;
    case 4:
      if ((*(_DWORD *)(a1 + 56) & 0x80000000) != 0) {
        goto LABEL_30;
      }
      LODWORD(v23[0]) = bswap32(*(_DWORD *)(a1 + 64));
      if (write_NOCANCEL() != 4)
      {
        close_NOCANCEL();
        *(_DWORD *)(a1 + 56) = -1;
        return;
      }
LABEL_29:
      char v4 = *(unsigned char *)(a1 + 79);
LABEL_30:
      char v7 = v4 & 0x3F;
      break;
    case 5:
      pid_t v10 = *(_DWORD *)(a1 + 68);
      if (!v10) {
        pid_t v10 = getpid();
      }
      if (!kill(v10, *(_DWORD *)(a1 + 56))) {
        goto LABEL_29;
      }
      return;
    case 6:
      xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v11, "Notification", *(const char **)(*(void *)(a1 + 48) + 8));
      uint64_t v12 = os_set_64_ptr_find();
      if (v12 && qword_1000141C8 != v12) {
        xpc_dictionary_set_uint64(v11, "_State", *(void *)(v12 - qword_1000141C8 + 24));
      }
      int v13 = xpc_event_publisher_fire_noboost();
      xpc_release(v11);
      if (!v13) {
        goto LABEL_29;
      }
      if (v13 == 55 && !*(unsigned char *)(a1 + 80))
      {
        *(unsigned char *)(a1 + 80) = 1;
        memset(v23, 0, sizeof(v23));
        if (xpc_get_service_identifier_for_token())
        {
          uint64_t has_internal_diagnostics = os_variant_has_internal_diagnostics();
          if (has_internal_diagnostics) {
            sub_10000A450(has_internal_diagnostics, v15, v16, v17, v18, v19, v20, v21, (char)v23);
          }
        }
      }
      return;
    case 7:
      if ((v6 & 1) == 0)
      {
        uint64_t v22 = *(void *)(a2 + 24);
        if (v22)
        {
          mach_port_t v9 = *(_DWORD *)(v22 + 8);
LABEL_36:
          sub_100004F20(a1, a3, v9);
        }
      }
      return;
    default:
      goto LABEL_30;
  }
LABEL_31:
  *(unsigned char *)(a1 + 79) = v7;
}

uint64_t sub_100004F20(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v4 = a2;
  if (a2) {
    goto LABEL_2;
  }
  uint64_t v7 = os_set_32_ptr_find();
  if (!v7)
  {
    uint64_t v4 = 0;
LABEL_9:
    char v6 = 1;
    goto LABEL_10;
  }
  uint64_t v4 = v7 - qword_100014208;
  if (v7 == qword_100014208) {
    goto LABEL_9;
  }
LABEL_2:
  if (*(unsigned char *)(v4 + 12))
  {
    uint64_t result = 0;
    ++*(unsigned char *)(a1 + 78);
    char v9 = *(unsigned char *)(a1 + 79) | 0x60;
LABEL_18:
    *(unsigned char *)(a1 + 79) = v9;
    return result;
  }
  char v6 = 0;
LABEL_10:
  if ((dword_100014258 & 2) != 0) {
    mach_msg_option_t v10 = 145;
  }
  else {
    mach_msg_option_t v10 = 17;
  }
  *(void *)&msg.msgh_voucher_port = 0;
  *(void *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_port = a3;
  msg.msgh_local_port = 0;
  msg.msgh_id = *(_DWORD *)(a1 + 64);
  uint64_t result = mach_msg(&msg, v10, 0x18u, 0, 0, 0, 0);
  if (!result)
  {
    char v9 = *(unsigned char *)(a1 + 79) & 0x3F;
    goto LABEL_18;
  }
  if (result != 268435460) {
    return 46;
  }
  mach_msg_destroy(&msg);
  if ((dword_100014258 & 2) == 0) {
    return 45;
  }
  ++*(unsigned char *)(a1 + 78);
  *(unsigned char *)(a1 + 79) |= 0xE0u;
  uint64_t result = 0;
  if ((v6 & 1) == 0) {
    *(_DWORD *)(v4 + 12) |= 1u;
  }
  return result;
}

BOOL sub_100005080(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v1;
  char v2 = audit_token_to_pid(&atoken);
  sub_1000046F0((FILE *)5, "-> has_root_entitlement (PID %d)\n", v3, v4, v5, v6, v7, v8, v2);
  char v9 = (void *)xpc_copy_entitlement_for_token();
  if (v9)
  {
    uint64_t v16 = v9;
    BOOL value = xpc_BOOL_get_value(v9);
    xpc_release(v16);
  }
  else
  {
    BOOL value = 0;
  }
  sub_1000046F0((FILE *)5, "<- has_root_entitlement (PID %d) = %s\n", v10, v11, v12, v13, v14, v15, v2);
  return value;
}

void *sub_100005138(const char *a1)
{
  size_t v2 = strlen(a1);
  unint64_t v3 = v2 + 73;
  uint64_t result = malloc_type_calloc(1uLL, v2 + 73, 0x1817CFD2uLL);
  uint64_t v5 = result;
  if (!result) {
    return v5;
  }
  ++dword_100014268;
  if ((unint64_t)result < 0xFFFFFFFFFFFFFFB8)
  {
    if (v3 >= 0x10)
    {
      result[1] = result + 9;
      uint64_t result = memcpy(result + 9, a1, v2 + 1);
      uint64_t v6 = qword_100014188++;
      if (v3 >= 0x18)
      {
        long long v5[2] = v6;
        if (v3 >= 0x34)
        {
          *((_DWORD *)v5 + 12) = 819;
          if (v3 >= 0x38)
          {
            *((_DWORD *)v5 + 13) = -1;
            if (v3 >= 0x40)
            {
              *((_DWORD *)v5 + 15) = 1;
              *uint64_t v5 = 0;
              os_set_str_ptr_insert();
              os_set_64_ptr_insert();
              return v5;
            }
          }
        }
      }
    }
    __break(1u);
  }
  __break(0x5513u);
  return result;
}

FILE *sub_10000523C(uint64_t a1, uint64_t a2, void *a3, int *a4, int a5, long long *a6, int a7)
{
  int v33 = -1;
  int v34 = -1;
  int v32 = -1;
  *a3 = 0;
  long long v13 = a6[1];
  long long v35 = *a6;
  long long v36 = v13;
  sub_1000047F0(&v35, 0xFFFFFFFF, (uid_t *)&v34, (gid_t *)&v33, &v32, 0);
  if (a5)
  {
    if (v34)
    {
      long long v14 = a6[1];
      long long v35 = *a6;
      long long v36 = v14;
      if (sub_100005080(&v35)) {
        int v34 = 0;
      }
    }
  }
  ++qword_100014130;
  ++qword_100014148;
  uint64_t v15 = os_set_64_ptr_find();
  if (!v15 || qword_1000141E8 == v15)
  {
    int v22 = 50;
LABEL_8:
    *a4 = v22;
    *a3 = -1;
    return sub_1000046F0((FILE *)7, "__notify_server_set_state_3 %d %d %llu [uid %d%s gid %d]\n", v16, v17, v18, v19, v20, v21, v32);
  }
  uint64_t v24 = v15 - qword_1000141E8;
  uint64_t v25 = *(const char **)(*(void *)(v15 - qword_1000141E8 + 48) + 8);
  long long v26 = a6[1];
  long long v35 = *a6;
  long long v36 = v26;
  if (!sub_100005894(v25)
    || a7 && (long long v31 = a6[1], v35 = *a6, v36 = v31, sandbox_check_by_audit_token()))
  {
    int v22 = 7;
    goto LABEL_8;
  }
  uint64_t v27 = *(void *)(v24 + 48);
  if (!v27) {
    __assert_rtn("_internal_notify_server_set_state_3", "notify_proc.c", 1297, "c->name_info != NULL");
  }
  int v28 = sub_1000034E8(*(void *)(v27 + 16), a2, v34, v33);
  *a4 = v28;
  if (v28) {
    BOOL v29 = v28 == 7;
  }
  else {
    BOOL v29 = 1;
  }
  if (!v29) {
    __assert_rtn("_internal_notify_server_set_state_3", "notify_proc.c", 1299, "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
  }
  uint64_t v30 = *(void *)(*(void *)(v24 + 48) + 16);
  *a3 = v30;
  if (v30 != -1) {
    return sub_1000046F0((FILE *)7, "__notify_server_set_state_3 %d %d %llu [%llu] [uid %d%s gid %d]\n", v16, v17, v18, v19, v20, v21, v32);
  }
  return sub_1000046F0((FILE *)7, "__notify_server_set_state_3 %d %d %llu [uid %d%s gid %d]\n", v16, v17, v18, v19, v20, v21, v32);
}

FILE *sub_100005480(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 48)
  {
    int v3 = -304;
  }
  else
  {
    if (!LODWORD(result->_cookie) && HIDWORD(result->_cookie) > 0x1F)
    {
      uint64_t size = result->_bf._size;
      uint64_t v5 = *(void *)(&result->_bf._size + 1);
      int v6 = *(&result->_lbfsize + 1);
      long long v7 = *(_OWORD *)((char *)&result->_write + 4);
      v8[0] = *(_OWORD *)((char *)&result->_read + 4);
      v8[1] = v7;
      uint64_t result = sub_10000523C(size, v5, (void *)(a2 + 36), (int *)(a2 + 44), v6, v8, 0);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100005544(const char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  uint64_t result = (const char *)memchr((void *)(result + 40), 0, v8);
  if (result)
  {
    char v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *(_DWORD *)&v3[v6 + 40];
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (const char *)sub_100002B04(v3 + 40, (void *)(a2 + 36), (_DWORD *)(a2 + 44), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100005680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = os_set_32_ptr_delete();
  if (result != a3) {
    __assert_rtn("_nc_table_delete_n", "table.c", 76, "os_set_delete(&t->set, key) == expected");
  }
  return result;
}

uint64_t sub_1000056CC()
{
  return os_set_str_ptr_foreach();
}

uint64_t sub_100005744(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 - *(void *)(*(void *)(a1 + 40) + 24));
}

uint64_t sub_100005760()
{
  return os_set_64_ptr_foreach();
}

uint64_t sub_1000057D8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 - *(void *)(*(void *)(a1 + 40) + 24));
}

void sub_1000057F4(unsigned int *a1)
{
  if (*(void *)a1)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
    __break(1u);
  }
  else
  {
    size_t v2 = a1 + 2;
    sub_100005680((uint64_t)&unk_1000141F0, a1[2], (uint64_t)(a1 + 2));
    mach_port_deallocate(mach_task_self_, *v2);
    ++dword_10001427C;
    free(a1);
  }
}

uint64_t sub_100005894(const char *a1)
{
  memcpy(__dst, "com.apple.private.darwin-notification.restrict-post.", sizeof(__dst));
  uint64_t result = strncmp(a1, "com.apple.private.restrict-post.", 0x20uLL);
  if (result) {
    return 1;
  }
  if ((unint64_t)a1 >= 0xFFFFFFFFFFFFFFE0)
  {
    __break(0x5513u);
  }
  else
  {
    if ((unint64_t)__strlcat_chk() <= 0x100)
    {
      int v10 = (void *)xpc_copy_entitlement_for_token();
      if (v10)
      {
        int v11 = v10;
        BOOL value = xpc_BOOL_get_value(v10);
        xpc_release(v11);
        if (value) {
          return 1;
        }
      }
      char v9 = "Post %s rejected: missing entitlement\n";
    }
    else
    {
      char v9 = "Post %s rejected: respective restricted notification entitlement would be too long\n";
    }
    sub_1000046F0((FILE *)3, v9, v3, v4, v5, v6, v7, v8, (char)a1);
    return 0;
  }
  return result;
}

void sub_10000599C(void *a1)
{
  if (*a1)
  {
    qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
    __break(1u);
  }
  else
  {
    size_t v2 = a1 + 2;
    sub_100005680((uint64_t)&unk_100014210, *((unsigned int *)a1 + 4), (uint64_t)(a1 + 2));
    ++dword_10001427C;
    int v10 = (unsigned int *)v2[1];
    if (v10) {
      sub_100005A3C(v10, v3, v4, v5, v6, v7, v8, v9);
    }
    dispatch_release((dispatch_object_t)a1[1]);
    free(a1);
  }
}

void sub_100005A3C(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = a1[3];
  if ((v9 & 4) != 0)
  {
    if (*(void *)a1)
    {
      qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: port_proc still had clients";
      __break(1u);
    }
    else
    {
      sub_1000046F0((FILE *)7, "do_mach_notify_dead_name freed port %x\n", a3, a4, a5, a6, a7, a8, (char)a1);
      sub_1000057F4(a1);
    }
  }
  else
  {
    a1[3] = v9 | 4;
  }
}

void sub_100005AD4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 16);
      sub_100002ED4(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = a1[1];

  dispatch_source_cancel(v4);
}

uint64_t sub_100005B20(char *a1, unsigned int a2, int a3, long long *a4)
{
  unint64_t v26 = 0;
  int v24 = -1;
  int v25 = -1;
  unsigned int v23 = -1;
  long long v8 = a4[1];
  long long v21 = *a4;
  long long v22 = v8;
  sub_1000047F0(&v21, a2, (uid_t *)&v25, (gid_t *)&v24, &v23, &v26);
  *(void *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  *(void *)&xmmword_1000140B8 = xmmword_1000140B8 + 1;
  sub_1000046F0((FILE *)7, "__notify_server_register_signal %s %d %d %d\n", v9, v10, v11, v12, v13, v14, (char)a1);
  if (!a1) {
    return 1;
  }
  unsigned int v15 = v23;
  *(void *)&long long v21 = 0;
  uint64_t result = sub_1000048D8(a1, v23, a2, v25, v24, &v21);
  if (!result)
  {
    uint64_t v17 = v21;
    *(unsigned char *)(v21 + 79) = *(unsigned char *)(v21 + 79) & 0xF0 | 5;
    *(_DWORD *)(v17 + 68) = v15;
    *(_DWORD *)(v17 + 56) = a3;
    uint64_t v18 = os_set_64_ptr_find();
    if (v18) {
      uint64_t v19 = (uint64_t *)(v18 - qword_1000141E8);
    }
    else {
      uint64_t v19 = 0;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      long long v20 = a4[1];
      long long v21 = *a4;
      long long v22 = v20;
      sub_10000C024(a1, (uint64_t)v19, &v21);
    }
    sub_100003EBC(v19, v23);
    return 0;
  }
  return result;
}

uint64_t sub_100005C84(char *a1, unsigned int a2, mach_port_name_t a3, long long *a4)
{
  unint64_t v26 = 0;
  int v24 = -1;
  int v25 = -1;
  unsigned int v23 = -1;
  long long v8 = a4[1];
  long long v21 = *a4;
  long long v22 = v8;
  sub_1000047F0(&v21, a2, (uid_t *)&v25, (gid_t *)&v24, &v23, &v26);
  *(void *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  ++*((void *)&xmmword_1000140B8 + 1);
  sub_1000046F0((FILE *)7, "__notify_server_register_file_descriptor %s %d %d\n", v9, v10, v11, v12, v13, v14, (char)a1);
  int v15 = fileport_makefd();
  uint64_t result = mach_port_deallocate(mach_task_self_, a3);
  if ((v15 & 0x80000000) == 0)
  {
    uint64_t result = fcntl_NOCANCEL();
    if ((result & 0x80000000) == 0)
    {
      uint64_t result = fcntl_NOCANCEL();
      if ((result & 0x80000000) == 0)
      {
        if (a1)
        {
          *(void *)&long long v21 = 0;
          uint64_t result = sub_1000048D8(a1, v23, a2, v25, v24, &v21);
          if (!result)
          {
            uint64_t v17 = v21;
            *(unsigned char *)(v21 + 79) = *(unsigned char *)(v21 + 79) & 0xF0 | 4;
            *(_DWORD *)(v17 + 56) = v15;
            uint64_t v18 = os_set_64_ptr_find();
            if (v18) {
              uint64_t v19 = (uint64_t *)(v18 - qword_1000141E8);
            }
            else {
              uint64_t v19 = 0;
            }
            if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
            {
              long long v20 = a4[1];
              long long v21 = *a4;
              long long v22 = v20;
              sub_10000C024(a1, (uint64_t)v19, &v21);
            }
            return (uint64_t)sub_100003EBC(v19, v23);
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100005E20(char *a1, unsigned int a2, mach_port_name_t a3, long long *a4)
{
  uint64_t v8 = os_set_32_ptr_find();
  if (v8) {
    BOOL v9 = qword_100014208 == v8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    mach_port_t v10 = mach_task_self_;
    return mach_port_deallocate(v10, a3);
  }
  else
  {
    long long v11 = a4[1];
    v13[0] = *a4;
    v13[1] = v11;
    return sub_100005EDC(a1, a2, a3, v13);
  }
}

uint64_t sub_100005EDC(char *a1, unsigned int a2, mach_port_name_t a3, long long *a4)
{
  unint64_t v30 = 0;
  int v28 = -1;
  int v29 = -1;
  unsigned int v27 = -1;
  if (a3 + 1 < 2) {
    return 59;
  }
  long long v9 = a4[1];
  long long v25 = *a4;
  long long v26 = v9;
  sub_1000047F0(&v25, a2, (uid_t *)&v29, (gid_t *)&v28, &v27, &v30);
  *(void *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
  ++qword_1000140C8;
  sub_1000046F0((FILE *)7, "__notify_server_register_mach_port %s %d %d\n", v10, v11, v12, v13, v14, v15, (char)a1);
  if (a1 && (*(void *)&long long v25 = 0, !sub_1000048D8(a1, v27, a2, v29, v28, &v25)))
  {
    uint64_t v16 = v25;
    *(unsigned char *)(v25 + 79) = *(unsigned char *)(v25 + 79) & 0xF0 | 3;
    *(_DWORD *)(v16 + 56) = a3;
    uint64_t v17 = os_set_64_ptr_find();
    if (v17) {
      uint64_t v18 = (uint64_t *)(v17 - qword_1000141E8);
    }
    else {
      uint64_t v18 = 0;
    }
    if (!strncmp(a1, "com.apple.system.notify.service.", 0x20uLL))
    {
      long long v19 = a4[1];
      long long v25 = *a4;
      long long v26 = v19;
      sub_10000C024(a1, (uint64_t)v18, &v25);
    }
    sub_100003EBC(v18, v27);
    uint64_t v20 = os_set_32_ptr_find();
    if (v20 && (long long v21 = (uint64_t **)(v20 - qword_100014208), v20 != qword_100014208))
    {
      uint64_t v24 = (uint64_t)*v21;
      v18[4] = (uint64_t)*v21;
      if (v24) {
        *(void *)(v24 + 40) = v18 + 4;
      }
      uint64_t result = 0;
      *long long v21 = v18;
      v18[5] = (uint64_t)v21;
    }
    else
    {
      uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
      if (result)
      {
        long long v22 = (uint64_t *)result;
        ++dword_100014278;
        *(void *)uint64_t result = 0;
        *(_DWORD *)(result + 8) = a3;
        os_set_32_ptr_insert();
        uint64_t v23 = *v22;
        v18[4] = *v22;
        if (v23) {
          *(void *)(v23 + 40) = v18 + 4;
        }
        uint64_t *v22 = (uint64_t)v18;
        v18[5] = (uint64_t)v22;
        if (mach_port_insert_right(mach_task_self_, a3, a3, 0x13u)) {
          sub_100002ED4((uint64_t)v18);
        }
        else {
          sub_100002744(a3);
        }
        return 0;
      }
      else
      {
        qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate portproc";
        __break(1u);
      }
    }
  }
  else
  {
    mach_port_deallocate(mach_task_self_, a3);
    return 7;
  }
  return result;
}

unint64_t sub_100006154(unint64_t result, char *a2, int a3, int a4, long long *a5)
{
  gid_t v23 = -1;
  uid_t v24 = -1;
  int v22 = -1;
  if (a2 || !a3)
  {
    if (!a2) {
      goto LABEL_8;
    }
    if (a3)
    {
      uint64_t v8 = (a3 - 1);
      if (__CFADD__(a2, v8))
      {
        __break(0x5513u);
        return result;
      }
      if (!a2[v8])
      {
LABEL_8:
        long long v9 = a5[1];
        long long v20 = *a5;
        long long v21 = v9;
        sub_1000047F0(&v20, 0xFFFFFFFF, &v24, &v23, &v22, 0);
        ++*((void *)&xmmword_100014158 + 1);
        sub_1000046F0((FILE *)7, "__notify_server_monitor_file %d %d %s 0x%08x\n", v10, v11, v12, v13, v14, v15, v22);
        uint64_t result = os_set_64_ptr_find();
        if (result)
        {
          uint64_t v16 = result - qword_1000141E8;
          if (result != qword_1000141E8)
          {
            uint64_t v17 = *(void *)(v16 + 48);
            if (!v17) {
              __assert_rtn("__notify_server_monitor_file_2", "notify_proc.c", 1422, "n != NULL");
            }
            uint64_t v18 = *(void *)(v17 + 8);
            long long v19 = a5[1];
            long long v20 = *a5;
            long long v21 = v19;
            return sub_10000BC9C(v18, v16, a2, &v20, a4);
          }
        }
      }
    }
  }
  return result;
}

char *sub_100006288(char *result, unint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, unint64_t a8, char *a9, int a10, int a11, int *a12, void *a13, int *a14, _OWORD *a15)
{
  pidp[0] = -1;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  if (!a9 && a10) {
    goto LABEL_3;
  }
  if (!a9) {
    goto LABEL_10;
  }
  if (!a10) {
    goto LABEL_3;
  }
  uint64_t v19 = (a10 - 1);
  if (__CFADD__(a9, v19))
  {
LABEL_44:
    __break(0x5513u);
    JUMPOUT(0x1000065E8);
  }
  if (a9[v19])
  {
LABEL_3:
    int v18 = 6;
  }
  else
  {
LABEL_10:
    long long v20 = result;
    *(void *)&xmmword_100014178 = xmmword_100014178 + 1;
    long long v21 = a15[1];
    *(_OWORD *)atoken.val = *a15;
    *(_OWORD *)&atoken.val[4] = v21;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
    uint64_t v45 = a7;
    unint64_t v23 = a2;
    sub_1000046F0((FILE *)7, "__notify_server_regenerate %s %d %d %d %u %d %d %llu %s %d\n", v24, v25, v26, v27, v28, v29, (char)v20);
    uint64_t result = (char *)os_set_64_ptr_find();
    if (!result || (char *)qword_1000141E8 == result)
    {
      switch(a3)
      {
        case 1:
          if (dword_1000142D8 <= a6) {
            goto LABEL_3;
          }
          unint64_t v30 = a15;
          long long v31 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v31;
          sub_100003C08(v20, a2, &v49, a12, a13, a14, (long long *)&atoken);
          if (*a14) {
            goto LABEL_36;
          }
          uint64_t v32 = *a12;
          if (v32 == -1) {
            goto LABEL_36;
          }
          uint64_t v33 = qword_1000142F0;
          if (!qword_1000142F0) {
            goto LABEL_36;
          }
          BOOL v34 = __CFADD__(qword_1000142E0, 4 * v32);
          BOOL v35 = qword_1000142E0 + 4 * v32 >= (unint64_t)qword_1000142E0;
          if ((int)v32 < 0) {
            BOOL v35 = v34;
          }
          if (!v35) {
            goto LABEL_44;
          }
          BOOL v36 = __CFADD__(qword_1000142F0, 4 * a6);
          BOOL v37 = qword_1000142F0 + 4 * a6 >= (unint64_t)qword_1000142F0;
          if (a6 < 0) {
            BOOL v37 = v36;
          }
          if (!v37) {
            goto LABEL_44;
          }
          *(_DWORD *)(qword_1000142E0 + 4 * v32) = *(_DWORD *)(qword_1000142E0 + 4 * v32)
                                                 + *(_DWORD *)(qword_1000142F0 + 4 * a6)
                                                 - 1;
          *(_DWORD *)(v33 + 4 * a6) = 0;
          unint64_t v23 = a2;
LABEL_36:
          if (a9)
          {
            long long v42 = v30[1];
            *(_OWORD *)atoken.val = *v30;
            *(_OWORD *)&atoken.val[4] = v42;
            sub_100006154(v23, a9, a10, a11, (long long *)&atoken);
          }
          uint64_t result = (char *)os_set_64_ptr_find();
          if (result)
          {
            uint64_t v43 = qword_1000141E8;
            if ((char *)qword_1000141E8 != result)
            {
              *a14 = 0;
              v44 = *(void **)&result[-v43 + 48];
              *a13 = v44[2];
              if (v44[4] < a8) {
                v44[3] = v45;
              }
              return result;
            }
          }
          if (*a14) {
            return result;
          }
          int v18 = 50;
          break;
        case 2:
          unint64_t v30 = a15;
          long long v38 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v38;
          int v39 = sub_10000399C(v20, a2, (long long *)&atoken);
          goto LABEL_35;
        case 5:
          unint64_t v30 = a15;
          long long v40 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v40;
          int v39 = sub_100005B20(v20, a2, a5, (long long *)&atoken);
          goto LABEL_35;
        case 7:
          unint64_t v30 = a15;
          long long v41 = a15[1];
          *(_OWORD *)atoken.val = *a15;
          *(_OWORD *)&atoken.val[4] = v41;
          int v39 = sub_100004520(v20, a2, (long long *)&atoken);
LABEL_35:
          *a14 = v39;
          goto LABEL_36;
        default:
          int v18 = 52;
          break;
      }
    }
    else
    {
      int v18 = 51;
    }
  }
  *a14 = v18;
  return result;
}

uint64_t sub_100006604(mach_port_name_t a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v4;
  if (audit_token_to_euid(&atoken)) {
    return mach_port_deallocate(mach_task_self_, a1);
  }
  long long v5 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v5;
  if (sandbox_check_by_audit_token()) {
    return mach_port_deallocate(mach_task_self_, a1);
  }
  long long v6 = a2[1];
  *(_OWORD *)atoken.val = *a2;
  *(_OWORD *)&atoken.val[4] = v6;
  if (!sub_100005080(&atoken)) {
    return mach_port_deallocate(mach_task_self_, a1);
  }
  int v7 = fileport_makefd();
  uint64_t result = mach_port_deallocate(mach_task_self_, a1);
  if ((v7 & 0x80000000) == 0)
  {
    if ((fcntl_NOCANCEL() & 0x80000000) == 0 && (fcntl_NOCANCEL() & 0x80000000) == 0) {
      sub_1000069C0(0, v7);
    }
    return close_NOCANCEL();
  }
  return result;
}

uint64_t sub_1000066FC(char *a1, unsigned int a2, _DWORD *a3, mach_port_name_t *a4, long long *a5)
{
  *a3 = 0;
  mach_port_name_t name = 0;
  *a4 = 0;
  *(_OWORD *)&options.flags = xmmword_10000E270;
  options.reserved[1] = 0;
  if (mach_port_construct(mach_task_self_, &options, 0, &name)) {
    __assert_rtn("__notify_server_register_mach_port_3", "notify_proc.c", 1843, "kstatus == KERN_SUCCESS");
  }
  if (mach_port_insert_right(mach_task_self_, name, name, 0x14u)) {
    __assert_rtn("__notify_server_register_mach_port_3", "notify_proc.c", 1847, "kstatus == KERN_SUCCESS");
  }
  long long v10 = a5[1];
  v12[0] = *a5;
  v12[1] = v10;
  uint64_t result = sub_100005EDC(a1, a2, name, v12);
  *a3 = result;
  if (result) {
    return mach_port_destruct(mach_task_self_, name, -1, 0);
  }
  *a4 = name;
  return result;
}

int64x2_t sub_100006820(const char *a1, int a2, long long *a3)
{
  long long v6 = a3[1];
  long long v9 = *a3;
  long long v10 = v6;
  if (!sandbox_check_by_audit_token())
  {
    long long v8 = a3[1];
    long long v9 = *a3;
    long long v10 = v8;
    uint64_t v12 = 0;
    sub_100002B04(a1, &v12, &v11, a2, &v9);
    int64x2_t result = vaddq_s64((int64x2_t)xmmword_100014090, (int64x2_t)xmmword_10000E210);
    xmmword_100014090 = (__int128)result;
  }
  return result;
}

char *sub_1000068BC(char *a1, unint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, unint64_t a8, char *a9, int a10, int a11, int *a12, void *a13, int *a14, long long *a15)
{
  long long v18 = a15[1];
  long long v27 = *a15;
  long long v28 = v18;
  if (sandbox_check_by_audit_token())
  {
    long long v19 = a15[1];
    long long v27 = *a15;
    long long v28 = v19;
    return sub_100006288(a1, a2, a3, a4, a5, a6, 0, 0, a9, a10, a11, a12, a13, a14, &v27);
  }
  else
  {
    long long v21 = a15[1];
    long long v27 = *a15;
    long long v28 = v21;
    return sub_100006288(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, &v27);
  }
}

FILE *sub_1000069C0(int a1, int a2)
{
  if (a2 < 0)
  {
    int64x2_t result = (FILE *)qword_100014048;
    if (!qword_100014048)
    {
      pid_t v4 = getpid();
      asprintf((char **)&qword_100014048, "/var/run/notifyd_%u.status", v4);
      int64x2_t result = (FILE *)qword_100014048;
      if (!qword_100014048) {
        return result;
      }
    }
    unlink((const char *)result);
    int64x2_t result = fopen((const char *)qword_100014048, "w");
  }
  else
  {
    int64x2_t result = fdopen(a2, "w");
  }
  long long v5 = result;
  if (result)
  {
    if (os_variant_has_internal_diagnostics())
    {
      long long v6 = fopen("/var/run/notifyd_jetsam.log", "r");
      if (v6)
      {
        int v7 = v6;
        while (1)
        {
          int v8 = fgetc(v7);
          if (v8 == -1) {
            break;
          }
          fputc(v8, v5);
        }
        fclose(v7);
      }
    }
    if (a1 == 1)
    {
      uint64_t v34 = 0;
      BOOL v35 = &v34;
      uint64_t v36 = 0x2000000000;
      int v37 = 0;
      if (fprintf(v5, "--- GLOBALS ---\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "%u slots (current id %u)\n", dword_1000142D8, dword_1000142DC) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "%u log_cutoff (default %u)\n", dword_1000142F8, dword_1000142FC) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "--- STATISTICS ---\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "post         %llu\n", (void)xmmword_100014078) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    id       %llu\n", qword_100014088) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    name     %llu\n", (void)xmmword_100014090) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    fetch    %llu\n", *((void *)&xmmword_100014090 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    no_op    %llu\n", *((void *)&xmmword_100014078 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "register     %llu\n", (void)xmmword_1000140A0) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    plain    %llu\n", *((void *)&xmmword_1000140A0 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    check    %llu\n", qword_1000140B0) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    signal   %llu\n", (void)xmmword_1000140B8) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    file     %llu\n", *((void *)&xmmword_1000140B8 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    port     %llu\n", qword_1000140C8) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    event    %llu\n", qword_1000140D0) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    common   %llu\n", (void)xmmword_1000140D8) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "check        %llu\n", qword_100014108) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "cancel       %llu\n", *((void *)&xmmword_1000140D8 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "cleanup      %llu\n", qword_100014170) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "regenerate   %llu\n", (void)xmmword_100014178) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "checkin      %llu\n", *((void *)&xmmword_100014178 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "suspend      %llu\n", qword_1000140E8) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "resume       %llu\n", qword_1000140F0) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "suspend_pid  %llu\n", (void)xmmword_1000140F8) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "resume_pid   %llu\n", *((void *)&xmmword_1000140F8 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "get_state    %llu\n", (void)xmmword_100014110) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    id       %llu\n", unk_100014120) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    client   %llu\n", *((void *)&xmmword_100014110 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    fetch    %llu\n", qword_100014128) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "set_state    %llu\n", qword_100014130) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    id       %llu\n", *((void *)&xmmword_100014138 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    client   %llu\n", (void)xmmword_100014138) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "    fetch    %llu\n", qword_100014148) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "set_owner    %llu\n", qword_100014150) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "set_access   %llu\n", (void)xmmword_100014158) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "monitor      %llu\n", *((void *)&xmmword_100014158 + 1)) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "svc_path     %llu\n", qword_100014168) < 0) {
        goto LABEL_133;
      }
      long long v9 = localtime(&qword_1000142D0);
      strftime(v38, 0x80uLL, "%a, %d %b %Y %T %z", v9);
      if (fprintf(v5, "last reset time was %s\n", v38) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "name         alloc %9u   free %9u   extant %9u\n", dword_100014268, dword_10001426C, dword_100014268 - dword_10001426C) < 0)goto LABEL_133; {
      if (fprintf(v5, "subscription alloc %9u   free %9u   extant %9u\n", dword_100014270, dword_100014274, dword_100014270 - dword_100014274) < 0)goto LABEL_133;
      }
      if (fprintf(v5, "portproc     alloc %9u   free %9u   extant %9u\n", dword_100014278, dword_10001427C, dword_100014278 - dword_10001427C) < 0)goto LABEL_133; {
      if (fprintf(v5, "\n") < 0)
      }
        goto LABEL_133;
      int v10 = os_set_32_ptr_count();
      if (fprintf(v5, "port count   %u\n", v10) < 0) {
        goto LABEL_133;
      }
      int v11 = os_set_32_ptr_count();
      if (fprintf(v5, "proc count   %u\n", v11) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "--- NAME TABLE ---\n") < 0) {
        goto LABEL_133;
      }
      *(void *)long long v38 = _NSConcreteStackBlock;
      uint64_t v39 = 0x40000000;
      long long v40 = sub_1000080C8;
      long long v41 = &unk_100010760;
      long long v42 = &v34;
      uint64_t v43 = v5;
      sub_1000056CC();
      int v12 = os_set_str_ptr_count();
      if (fprintf(v5, "--- NAME COUNT %u ---\n", v12) < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "\n") < 0) {
        goto LABEL_133;
      }
      if (fprintf(v5, "--- SUBSCRIPTION TABLE ---\n") < 0) {
        goto LABEL_133;
      }
      sub_100005760();
      int v13 = os_set_64_ptr_count();
      if (fprintf(v5, "--- SUBSCRIPTION COUNT %u ---\n", v13) < 0
        || fprintf(v5, "\n") < 0
        || fprintf(v5, "--- CONTROLLED NAME ---\n") < 0)
      {
        goto LABEL_133;
      }
      int v14 = dword_10001425C;
      if (!dword_10001425C)
      {
LABEL_84:
        if (fprintf(v5, "--- CONTROLLED NAME COUNT %u ---\n", v14) < 0) {
          goto LABEL_133;
        }
        if (fprintf(v5, "\n") < 0) {
          goto LABEL_133;
        }
        if (fprintf(v5, "--- PUBLIC SERVICE ---\n") < 0) {
          goto LABEL_133;
        }
        sub_100005760();
        int v17 = os_set_str_ptr_count();
        if (fprintf(v5, "--- PUBLIC SERVICE COUNT %u ---\n", v17) < 0) {
          goto LABEL_133;
        }
        if (fprintf(v5, "\n") < 0) {
          goto LABEL_133;
        }
        if (fprintf(v5, "--- PRIVATE SERVICE ---\n") < 0) {
          goto LABEL_133;
        }
        sub_100005760();
        int v18 = os_set_64_ptr_count();
        if (fprintf(v5, "--- PRIVATE SERVICE COUNT %u ---\n", v18) < 0
          || fprintf(v5, "\n") < 0
          || fprintf(v5, "--- PROCESSES ---\n") < 0)
        {
          goto LABEL_133;
        }
        if ((v35[3] & 0x80000000) != 0)
        {
LABEL_132:
          fwrite("-- END --\n", 0xAuLL, 1uLL, v5);
          goto LABEL_133;
        }
        int v19 = 0;
        while (1)
        {
          uint64_t v20 = os_set_32_ptr_find();
          if (v20)
          {
            long long v21 = (uint64_t *)(v20 - qword_100014228);
            if (v20 != qword_100014228)
            {
              uint64_t v22 = *v21;
              if (*v21)
              {
                int v23 = 0;
                int v24 = 0;
                int v25 = 0;
                int v26 = 0;
                int v27 = 0;
                int v28 = 0;
                int v29 = 0;
                while (2)
                {
                  switch(*(unsigned char *)(v22 + 79) & 0xF)
                  {
                    case 1:
                      BOOL v30 = __OFADD__(v29++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    case 2:
                      BOOL v30 = __OFADD__(v28++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    case 3:
                      BOOL v30 = __OFADD__(v26++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    case 4:
                      BOOL v30 = __OFADD__(v27++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    case 5:
                      BOOL v30 = __OFADD__(v25++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    case 6:
                      BOOL v30 = __OFADD__(v24++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    case 7:
                      BOOL v30 = __OFADD__(v23++, 1);
                      if (!v30) {
                        goto LABEL_119;
                      }
                      goto LABEL_137;
                    default:
LABEL_119:
                      uint64_t v22 = *(void *)(v22 + 16);
                      if (!v22) {
                        goto LABEL_122;
                      }
                      continue;
                  }
                }
              }
              int v29 = 0;
              int v28 = 0;
              int v27 = 0;
              int v26 = 0;
              int v25 = 0;
              int v24 = 0;
              int v23 = 0;
LABEL_122:
              if (fprintf(v5, "pid: %u   ", v19) < 0
                || fprintf(v5, "memory %u   plain %u   port %u   file %u   signal %u   event %u   common %u\n", v29, v28, v26, v27, v25, v24, v23) < 0)
              {
                goto LABEL_133;
              }
              for (uint64_t i = *v21; i; uint64_t i = *(void *)(i + 16))
              {
                uint64_t v32 = *(unsigned char *)(i + 79) & 0xF;
                uint64_t v33 = "unknown";
                if (v32 <= 7) {
                  uint64_t v33 = (&off_100010848)[v32];
                }
                if (fprintf(v5, "  %s: %s\n", v33, *(const char **)(*(void *)(i + 48) + 8)) < 0) {
                  goto LABEL_133;
                }
              }
              if (fprintf(v5, "\n") < 0) {
                goto LABEL_133;
              }
            }
          }
          BOOL v30 = __OFADD__(v19++, 1);
          if (v30) {
            goto LABEL_137;
          }
          if (v19 > *((_DWORD *)v35 + 6)) {
            goto LABEL_132;
          }
        }
      }
      uint64_t v15 = 0;
      unint64_t v16 = 0;
      while (1)
      {
        if (__CFADD__(qword_100014248, v15))
        {
          __break(0x5513u);
LABEL_137:
          __break(0x5500u);
          JUMPOUT(0x1000076E0);
        }
        if (fprintf(v5, "%s %u %u %03x\n", *(const char **)(*(void *)(qword_100014248 + v15) + 8), *(_DWORD *)(*(void *)(qword_100014248 + v15) + 40), *(_DWORD *)(*(void *)(qword_100014248 + v15) + 44), *(_DWORD *)(*(void *)(qword_100014248 + v15) + 48)) < 0)break; {
        ++v16;
        }
        int v14 = dword_10001425C;
        v15 += 8;
        if (v16 >= dword_10001425C) {
          goto LABEL_84;
        }
      }
LABEL_133:
      _Block_object_dispose(&v34, 8);
    }
    else if (!a1)
    {
      sub_1000076FC(v5);
    }
    return (FILE *)fclose(v5);
  }
  return result;
}

size_t sub_1000076FC(FILE *a1)
{
  size_t result = fprintf(a1, "--- GLOBALS ---\n");
  if ((result & 0x80000000) == 0)
  {
    size_t result = fprintf(a1, "%u slots (current id %u)\n", dword_1000142D8, dword_1000142DC);
    if ((result & 0x80000000) == 0)
    {
      size_t result = fprintf(a1, "%u log_cutoff (default %u)\n", dword_1000142F8, dword_1000142FC);
      if ((result & 0x80000000) == 0)
      {
        size_t result = fprintf(a1, "\n");
        if ((result & 0x80000000) == 0)
        {
          size_t result = fprintf(a1, "--- STATISTICS ---\n");
          if ((result & 0x80000000) == 0)
          {
            size_t result = fprintf(a1, "post         %llu\n", (void)xmmword_100014078);
            if ((result & 0x80000000) == 0)
            {
              size_t result = fprintf(a1, "    id       %llu\n", qword_100014088);
              if ((result & 0x80000000) == 0)
              {
                size_t result = fprintf(a1, "    name     %llu\n", (void)xmmword_100014090);
                if ((result & 0x80000000) == 0)
                {
                  size_t result = fprintf(a1, "    fetch    %llu\n", *((void *)&xmmword_100014090 + 1));
                  if ((result & 0x80000000) == 0)
                  {
                    size_t result = fprintf(a1, "    no_op    %llu\n", *((void *)&xmmword_100014078 + 1));
                    if ((result & 0x80000000) == 0)
                    {
                      size_t result = fprintf(a1, "\n");
                      if ((result & 0x80000000) == 0)
                      {
                        size_t result = fprintf(a1, "register     %llu\n", (void)xmmword_1000140A0);
                        if ((result & 0x80000000) == 0)
                        {
                          size_t result = fprintf(a1, "    plain    %llu\n", *((void *)&xmmword_1000140A0 + 1));
                          if ((result & 0x80000000) == 0)
                          {
                            size_t result = fprintf(a1, "    check    %llu\n", qword_1000140B0);
                            if ((result & 0x80000000) == 0)
                            {
                              size_t result = fprintf(a1, "    signal   %llu\n", (void)xmmword_1000140B8);
                              if ((result & 0x80000000) == 0)
                              {
                                size_t result = fprintf(a1, "    file     %llu\n", *((void *)&xmmword_1000140B8 + 1));
                                if ((result & 0x80000000) == 0)
                                {
                                  size_t result = fprintf(a1, "    port     %llu\n", qword_1000140C8);
                                  if ((result & 0x80000000) == 0)
                                  {
                                    size_t result = fprintf(a1, "    event    %llu\n", qword_1000140D0);
                                    if ((result & 0x80000000) == 0)
                                    {
                                      size_t result = fprintf(a1, "    common   %llu\n", (void)xmmword_1000140D8);
                                      if ((result & 0x80000000) == 0)
                                      {
                                        size_t result = fprintf(a1, "\n");
                                        if ((result & 0x80000000) == 0)
                                        {
                                          size_t result = fprintf(a1, "check        %llu\n", qword_100014108);
                                          if ((result & 0x80000000) == 0)
                                          {
                                            size_t result = fprintf(a1, "cancel       %llu\n", *((void *)&xmmword_1000140D8 + 1));
                                            if ((result & 0x80000000) == 0)
                                            {
                                              size_t result = fprintf(a1, "cleanup      %llu\n", qword_100014170);
                                              if ((result & 0x80000000) == 0)
                                              {
                                                size_t result = fprintf(a1, "regenerate   %llu\n", (void)xmmword_100014178);
                                                if ((result & 0x80000000) == 0)
                                                {
                                                  size_t result = fprintf(a1, "checkin      %llu\n", *((void *)&xmmword_100014178 + 1));
                                                  if ((result & 0x80000000) == 0)
                                                  {
                                                    size_t result = fprintf(a1, "\n");
                                                    if ((result & 0x80000000) == 0)
                                                    {
                                                      size_t result = fprintf(a1, "suspend      %llu\n", qword_1000140E8);
                                                      if ((result & 0x80000000) == 0)
                                                      {
                                                        size_t result = fprintf(a1, "resume       %llu\n", qword_1000140F0);
                                                        if ((result & 0x80000000) == 0)
                                                        {
                                                          size_t result = fprintf(a1, "suspend_pid  %llu\n", (void)xmmword_1000140F8);
                                                          if ((result & 0x80000000) == 0)
                                                          {
                                                            size_t result = fprintf(a1, "resume_pid   %llu\n", *((void *)&xmmword_1000140F8 + 1));
                                                            if ((result & 0x80000000) == 0)
                                                            {
                                                              size_t result = fprintf(a1, "\n");
                                                              if ((result & 0x80000000) == 0)
                                                              {
                                                                size_t result = fprintf(a1, "get_state    %llu\n", (void)xmmword_100014110);
                                                                if ((result & 0x80000000) == 0)
                                                                {
                                                                  size_t result = fprintf(a1, "    id       %llu\n", unk_100014120);
                                                                  if ((result & 0x80000000) == 0)
                                                                  {
                                                                    size_t result = fprintf(a1, "    client   %llu\n", *((void *)&xmmword_100014110 + 1));
                                                                    if ((result & 0x80000000) == 0)
                                                                    {
                                                                      size_t result = fprintf(a1, "    fetch    %llu\n", qword_100014128);
                                                                      if ((result & 0x80000000) == 0)
                                                                      {
                                                                        size_t result = fprintf(a1, "\n");
                                                                        if ((result & 0x80000000) == 0)
                                                                        {
                                                                          size_t result = fprintf(a1, "set_state    %llu\n", qword_100014130);
                                                                          if ((result & 0x80000000) == 0)
                                                                          {
                                                                            size_t result = fprintf(a1, "    id       %llu\n", *((void *)&xmmword_100014138 + 1));
                                                                            if ((result & 0x80000000) == 0)
                                                                            {
                                                                              size_t result = fprintf(a1, "    client   %llu\n", (void)xmmword_100014138);
                                                                              if ((result & 0x80000000) == 0)
                                                                              {
                                                                                size_t result = fprintf(a1, "    fetch    %llu\n", qword_100014148);
                                                                                if ((result & 0x80000000) == 0)
                                                                                {
                                                                                  size_t result = fprintf(a1, "\n");
                                                                                  if ((result & 0x80000000) == 0)
                                                                                  {
                                                                                    size_t result = fprintf(a1, "set_owner    %llu\n", qword_100014150);
                                                                                    if ((result & 0x80000000) == 0)
                                                                                    {
                                                                                      size_t result = fprintf(a1, "\n");
                                                                                      if ((result & 0x80000000) == 0)
                                                                                      {
                                                                                        size_t result = fprintf(a1, "set_access   %llu\n", (void)xmmword_100014158);
                                                                                        if ((result & 0x80000000) == 0)
                                                                                        {
                                                                                          size_t result = fprintf(a1, "\n");
                                                                                          if ((result & 0x80000000) == 0)
                                                                                          {
                                                                                            size_t result = fprintf(a1, "monitor      %llu\n", *((void *)&xmmword_100014158 + 1));
                                                                                            if ((result & 0x80000000) == 0)
                                                                                            {
                                                                                              size_t result = fprintf(a1, "svc_path     %llu\n", qword_100014168);
                                                                                              if ((result & 0x80000000) == 0)
                                                                                              {
                                                                                                uint64_t v3 = localtime(&qword_1000142D0);
                                                                                                strftime(v12, 0x80uLL, "%a, %d %b %Y %T %z", v3);
                                                                                                size_t result = fprintf(a1, "last reset time was %s\n", v12);
                                                                                                if ((result & 0x80000000) == 0)
                                                                                                {
                                                                                                  size_t result = fprintf(a1, "\n");
                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                  {
                                                                                                    size_t result = fprintf(a1, "name         alloc %9u   free %9u   extant %9u\n", dword_100014268, dword_10001426C, dword_100014268 - dword_10001426C);
                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                    {
                                                                                                      size_t result = fprintf(a1, "subscription alloc %9u   free %9u   extant %9u\n", dword_100014270, dword_100014274, dword_100014270 - dword_100014274);
                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                      {
                                                                                                        size_t result = fprintf(a1, "portproc     alloc %9u   free %9u   extant %9u\n", dword_100014278, dword_10001427C, dword_100014278 - dword_10001427C);
                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                        {
                                                                                                          size_t result = fprintf(a1, "\n");
                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                          {
                                                                                                            int v4 = os_set_32_ptr_count();
                                                                                                            size_t result = fprintf(a1, "port count   %u\n", v4);
                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                            {
                                                                                                              int v5 = os_set_32_ptr_count();
                                                                                                              size_t result = fprintf(a1, "proc count   %u\n", v5);
                                                                                                              if ((result & 0x80000000) == 0)
                                                                                                              {
                                                                                                                size_t result = fprintf(a1, "\n");
                                                                                                                if ((result & 0x80000000) == 0)
                                                                                                                {
                                                                                                                  size_t result = fprintf(a1, "--- NAME TABLE ---\n");
                                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                                  {
                                                                                                                    size_t result = fprintf(a1, "Name Info: id, uid, gid, access, refcount, postcount, last hour postcount, slot, val, state\n");
                                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                                    {
                                                                                                                      size_t result = fprintf(a1, "Client Info: client_id, pid,token, lastval, suspend_count, pending, 0, type, type-info\n\n\n");
                                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                                      {
                                                                                                                        sub_1000056CC();
                                                                                                                        int v6 = os_set_str_ptr_count();
                                                                                                                        size_t result = fprintf(a1, "--- NAME COUNT %u ---\n", v6);
                                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                                        {
                                                                                                                          size_t result = fprintf(a1, "\n");
                                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                                          {
                                                                                                                            size_t result = fprintf(a1, "--- CONTROLLED NAME ---\n");
                                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                                            {
                                                                                                                              int v7 = dword_10001425C;
                                                                                                                              if (dword_10001425C)
                                                                                                                              {
                                                                                                                                uint64_t v8 = 0;
                                                                                                                                unint64_t v9 = 0;
                                                                                                                                while (!__CFADD__(qword_100014248, v8))
                                                                                                                                {
                                                                                                                                  size_t result = fprintf(a1, "%s %u %u %03x\n", *(const char **)(*(void *)(qword_100014248 + v8) + 8), *(_DWORD *)(*(void *)(qword_100014248 + v8) + 40), *(_DWORD *)(*(void *)(qword_100014248 + v8) + 44), *(_DWORD *)(*(void *)(qword_100014248 + v8) + 48));
                                                                                                                                  if ((result & 0x80000000) != 0) {
                                                                                                                                    return result;
                                                                                                                                  }
                                                                                                                                  ++v9;
                                                                                                                                  int v7 = dword_10001425C;
                                                                                                                                  v8 += 8;
                                                                                                                                  if (v9 >= dword_10001425C) {
                                                                                                                                    goto LABEL_68;
                                                                                                                                  }
                                                                                                                                }
                                                                                                                                __break(0x5513u);
                                                                                                                              }
                                                                                                                              else
                                                                                                                              {
LABEL_68:
                                                                                                                                size_t result = fprintf(a1, "--- CONTROLLED NAME COUNT %u ---\n", v7);
                                                                                                                                if ((result & 0x80000000) == 0)
                                                                                                                                {
                                                                                                                                  size_t result = fprintf(a1, "\n");
                                                                                                                                  if ((result & 0x80000000) == 0)
                                                                                                                                  {
                                                                                                                                    size_t result = fprintf(a1, "--- PUBLIC SERVICE ---\n");
                                                                                                                                    if ((result & 0x80000000) == 0)
                                                                                                                                    {
                                                                                                                                      sub_100005760();
                                                                                                                                      int v10 = os_set_str_ptr_count();
                                                                                                                                      size_t result = fprintf(a1, "--- PUBLIC SERVICE COUNT %u ---\n", v10);
                                                                                                                                      if ((result & 0x80000000) == 0)
                                                                                                                                      {
                                                                                                                                        size_t result = fprintf(a1, "\n");
                                                                                                                                        if ((result & 0x80000000) == 0)
                                                                                                                                        {
                                                                                                                                          size_t result = fprintf(a1, "--- PRIVATE SERVICE ---\n");
                                                                                                                                          if ((result & 0x80000000) == 0)
                                                                                                                                          {
                                                                                                                                            sub_100005760();
                                                                                                                                            int v11 = os_set_64_ptr_count();
                                                                                                                                            size_t result = fprintf(a1, "--- PRIVATE SERVICE COUNT %u ---\n", v11);
                                                                                                                                            if ((result & 0x80000000) == 0)
                                                                                                                                            {
                                                                                                                                              size_t result = fprintf(a1, "\n");
                                                                                                                                              if ((result & 0x80000000) == 0) {
                                                                                                                                                return fwrite("-- END --\n", 0xAuLL, 1uLL, a1);
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
      }
    }
  }
  return result;
}

BOOL sub_1000080C8(uint64_t a1, uint64_t a2)
{
  int v4 = *(FILE **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (fprintf(v4, "name: %s\n", *(const char **)(a2 + 8)) < 0
    || fprintf(v4, "id: %llu\n", *(void *)(a2 + 16)) < 0
    || fprintf(v4, "uid: %u\n", *(_DWORD *)(a2 + 40)) < 0
    || fprintf(v4, "gid: %u\n", *(_DWORD *)(a2 + 44)) < 0
    || fprintf(v4, "access: %03x\n", *(_DWORD *)(a2 + 48)) < 0
    || fprintf(v4, "refcount: %u\n", *(_DWORD *)(a2 + 56)) < 0
    || fprintf(v4, "postcount: %u\n", *(_DWORD *)(a2 + 64)) < 0
    || fprintf(v4, "last hour postcount: %u\n", *(_DWORD *)(a2 + 68)) < 0)
  {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
  if (*(_DWORD *)(a2 + 52) == -1)
  {
    int v7 = fprintf(v4, "slot: -unassigned-");
  }
  else
  {
    if (fprintf(v4, "slot: %u", *(_DWORD *)(a2 + 52)) < 0) {
      return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
    }
    uint64_t v6 = *(unsigned int *)(a2 + 52);
    if (__CFADD__(qword_1000142E8, 4 * v6)) {
      goto LABEL_56;
    }
    if (*(_DWORD *)(qword_1000142E8 + 4 * v6) == -1) {
      goto LABEL_17;
    }
    if (__CFADD__(qword_1000142E0, 4 * v6)) {
      goto LABEL_56;
    }
    int v7 = fprintf(v4, " = %u (%u)");
  }
  if (v7 < 0) {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
LABEL_17:
  if (fprintf(v4, "\n") < 0
    || fprintf(v4, "val: %u\n", *(_DWORD *)(a2 + 60)) < 0
    || fprintf(v4, "state: %llu\n", *(void *)(a2 + 24)) < 0)
  {
    return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = *(void **)a2;
  if (*(void *)a2)
  {
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    do
    {
      unsigned int v17 = *((_DWORD *)v8 + 17);
      if (v17 != -1 && v17 > *(_DWORD *)(v5 + 24)) {
        *(_DWORD *)(v5 + 24) = v17;
      }
      switch(*((unsigned char *)v8 + 79) & 0xF)
      {
        case 1:
          DWORD1(v22) = ++v9;
          break;
        case 2:
          DWORD2(v22) = ++v10;
          break;
        case 3:
          HIDWORD(v22) = ++v11;
          break;
        case 4:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFEFLL) {
            goto LABEL_56;
          }
          LODWORD(v23) = ++v12;
          break;
        case 5:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFEBLL) {
            goto LABEL_56;
          }
          DWORD1(v23) = ++v13;
          break;
        case 6:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFE7) {
            goto LABEL_56;
          }
          DWORD2(v23) = ++v14;
          break;
        case 7:
          if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFE3) {
            goto LABEL_56;
          }
          HIDWORD(v23) = ++v15;
          break;
        default:
          LODWORD(v22) = ++v16;
          break;
      }
      uint64_t v8 = (void *)*v8;
    }
    while (v8);
  }
  else
  {
    int v15 = 0;
    int v14 = 0;
    int v13 = 0;
    int v12 = 0;
    int v11 = 0;
    int v10 = 0;
    int v9 = 0;
    int v16 = 0;
  }
  BOOL v18 = (long long *)((char *)&v23 + 5) != 0 && (unint64_t)&v22 >= 0xFFFFFFFFFFFFFFEBLL;
  if ((unint64_t)&v22 > 0xFFFFFFFFFFFFFFEFLL
    || v18
    || ((long long *)((char *)&v23 + 13) == 0 || (unint64_t)&v22 < 0xFFFFFFFFFFFFFFE3 ? (char v19 = 0) : (char v19 = 1),
        (unint64_t)&v22 > 0xFFFFFFFFFFFFFFE7 || (v19 & 1) != 0))
  {
LABEL_56:
    __break(0x5513u);
    JUMPOUT(0x1000084ACLL);
  }
  if ((fprintf(v4, "types: none %u   memory %u   plain %u   port %u   file %u   signal %u   event %u   common %u\n", v16, v9, v10, v11, v12, v13, v14, v15) & 0x80000000) == 0)
  {
    for (uint64_t i = *(void **)a2; i; uint64_t i = (void *)*i)
    {
      if (fprintf(v4, "\n") < 0) {
        break;
      }
      sub_1000086A0(v4, (uint64_t)i);
    }
  }
  return fprintf(*(FILE **)(a1 + 40), "\n") >= 0;
}

BOOL sub_1000084C8(uint64_t a1, uint64_t a2)
{
  return fprintf(*(FILE **)(a1 + 32), "%d\n", *(_DWORD *)(a2 + 68)) >= 0;
}

uint64_t sub_100008504(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    uint64_t v3 = *(int **)(qword_100014290 + 8 * v2);
    if (v3)
    {
      uint64_t v4 = result;
      int v5 = *v3;
      if (!*v3)
      {
        if (fprintf(*(FILE **)(result + 32), "Null service: %s\n", *(const char **)(*(void *)(a2 + 48) + 8)) < 0) {
          return 0;
        }
        int v5 = *v3;
      }
      if (v5 == 1) {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Path Service: %s <- %s\n");
      }
      else {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Unknown service: %s (%u)\n");
      }
      return (v6 & 0x80000000) == 0;
    }
    return 1;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_1000085D8(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    uint64_t v4 = result;
    int v5 = *(const char ****)(qword_100014290 + 8 * v2);
    uint64_t v6 = *(void *)(a2 + 48);
    int v7 = *(_DWORD *)v5;
    if (!*(_DWORD *)v5)
    {
      if (fprintf(*(FILE **)(result + 32), "PID %u Null service: %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8)) < 0) {
        return 0;
      }
      int v7 = *(_DWORD *)v5;
    }
    return v7 != 2
        || (fprintf(*(FILE **)(v4 + 32), "PID %u Path Service: %s <- %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8), *v5[1]) & 0x80000000) == 0;
  }
  __break(0x5513u);
  return result;
}

size_t sub_1000086A0(FILE *a1, uint64_t a2)
{
  size_t result = fprintf(a1, "client_id: %llu\n", *(void *)(a2 + 64));
  if ((result & 0x80000000) == 0)
  {
    size_t result = fprintf(a1, "pid: %d\n", *(_DWORD *)(a2 + 68));
    if ((result & 0x80000000) == 0)
    {
      size_t result = fprintf(a1, "token: %d\n", *(_DWORD *)(a2 + 64));
      if ((result & 0x80000000) == 0)
      {
        size_t result = fprintf(a1, "lastval: %u\n", *(_DWORD *)(a2 + 72));
        if ((result & 0x80000000) == 0)
        {
          size_t result = fprintf(a1, "suspend_count: %u\n", *(unsigned __int8 *)(a2 + 78));
          if ((result & 0x80000000) == 0)
          {
            uint64_t v5 = *(unsigned char *)(a2 + 79) & 0xF;
            uint64_t v6 = v5 > 7 ? "unknown" : (&off_100010848)[v5];
            size_t result = fprintf(a1, "type: %s\n", v6);
            if ((result & 0x80000000) == 0)
            {
              switch(*(unsigned char *)(a2 + 79) & 0xF)
              {
                case 3:
                  size_t result = fprintf(a1, "mach port: 0x%08x\n");
                  break;
                case 4:
                  size_t result = fprintf(a1, "fd: %d\n");
                  break;
                case 5:
                  size_t result = fprintf(a1, "signal: %d\n");
                  break;
                case 6:
                  size_t result = fprintf(a1, "xpc event: %llu\n");
                  break;
                case 7:
                  size_t result = fwrite("common port\n", 0xCuLL, 1uLL, a1);
                  break;
                default:
                  return result;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_100008864(uint64_t a1, uint64_t **a2)
{
  if (a2)
  {
    uint64_t v4 = *(FILE **)(a1 + 32);
    if ((fprintf(v4, "name:%s\n", (const char *)a2[1]) & 0x80000000) == 0
      && (fprintf(v4, "info:%llu,%u,%u,%03x,%u,%u,%u,", a2[2], *((_DWORD *)a2 + 10), *((_DWORD *)a2 + 11), *((_DWORD *)a2 + 12), *((_DWORD *)a2 + 14), *((_DWORD *)a2 + 16), *((_DWORD *)a2 + 17)) & 0x80000000) == 0)
    {
      int v5 = *((_DWORD *)a2 + 13) == -1 ? fprintf(v4, "-1,") : fprintf(v4, "%u,");
      if ((v5 & 0x80000000) == 0
        && (fprintf(v4, "%u,%llu\n", *((_DWORD *)a2 + 15), a2[3]) & 0x80000000) == 0
        && (fprintf(v4, "clients:\n") & 0x80000000) == 0)
      {
        for (uint64_t i = *a2; i; uint64_t i = (uint64_t *)*i)
        {
          if ((fprintf(v4, "%llu,%d,%d,%u,%u,%u,", i[8], HIDWORD(i[8]), i[8], *((_DWORD *)i + 18), *((unsigned __int8 *)i + 78), 0) & 0x80000000) == 0)
          {
            switch(*((unsigned char *)i + 79) & 0xF)
            {
              case 1:
                int v7 = "check,0\n";
                goto LABEL_15;
              case 3:
                fprintf(v4, "port,0x%08x\n");
                continue;
              case 4:
                fprintf(v4, "fd,%d\n");
                continue;
              case 5:
                fprintf(v4, "signal,%d\n");
                continue;
              case 6:
                fprintf(v4, "event,%llu\n");
                continue;
              case 7:
                int v7 = "common-port\n";
                size_t v8 = 12;
                goto LABEL_22;
              default:
                int v7 = "other,0\n";
LABEL_15:
                size_t v8 = 8;
LABEL_22:
                fwrite(v7, v8, 1uLL, v4);
                break;
            }
          }
        }
        fputc(10, v4);
      }
    }
  }
  return fprintf(*(FILE **)(a1 + 32), "\n") >= 0;
}

uint64_t sub_100008AD8(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    uint64_t v3 = *(int **)(qword_100014290 + 8 * v2);
    if (v3)
    {
      uint64_t v4 = result;
      int v5 = *v3;
      if (!*v3)
      {
        if (fprintf(*(FILE **)(result + 32), "Null service: %s\n", *(const char **)(*(void *)(a2 + 48) + 8)) < 0) {
          return 0;
        }
        int v5 = *v3;
      }
      if (v5 == 1) {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Path Service: %s <- %s\n");
      }
      else {
        int v6 = fprintf(*(FILE **)(v4 + 32), "Unknown service: %s (%u)\n");
      }
      return (v6 & 0x80000000) == 0;
    }
    return 1;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100008BAC(uint64_t result, uint64_t a2)
{
  if (!*(_WORD *)(a2 + 76)) {
    return 1;
  }
  uint64_t v2 = *(unsigned __int16 *)(a2 + 76) - 1;
  if (!__CFADD__(qword_100014290, 8 * v2))
  {
    uint64_t v4 = result;
    int v5 = *(const char ****)(qword_100014290 + 8 * v2);
    uint64_t v6 = *(void *)(a2 + 48);
    int v7 = *(_DWORD *)v5;
    if (!*(_DWORD *)v5)
    {
      if (fprintf(*(FILE **)(result + 32), "PID %u Null service: %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8)) < 0) {
        return 0;
      }
      int v7 = *(_DWORD *)v5;
    }
    return v7 != 2
        || (fprintf(*(FILE **)(v4 + 32), "PID %u Path Service: %s <- %s\n", *(_DWORD *)(a2 + 68), *(const char **)(v6 + 8), *v5[1]) & 0x80000000) == 0;
  }
  __break(0x5513u);
  return result;
}

void sub_100008C74()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests port-deleted";
  __break(1u);
}

void sub_100008C94()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests port-destroyed";
  __break(1u);
}

void sub_100008CB4()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: notifyd never requests no-senders";
  __break(1u);
}

void sub_100008CD4()
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: someone destroyed our send-possible notification";
  __break(1u);
}

size_t start(int a1, unint64_t a2)
{
  kern_return_t v39;
  int v40;
  int v41;
  int v42;
  int *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  kern_return_t v51;
  FILE *v52;
  pid_t v53;
  size_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  unsigned int v58;
  FILE *v59;
  FILE *v60;
  size_t result;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unsigned __int8 *v69;
  unsigned int v70;
  BOOL v71;
  uint64_t v72;
  int v74;
  int v75;
  unint64_t v76;
  char *v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unsigned int v81;
  unint64_t v82;
  int v83;
  BOOL v84;
  BOOL v85;
  void *v86;
  int v87;
  const char *v88;
  unsigned int v89;
  const char *v90;
  unsigned int v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  _DWORD *v96;
  uint64_t v97;
  void *v98;
  kern_return_t v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  dispatch_time_t v103;
  NSObject *v104;
  int v105;
  const char *v106;
  FILE *v107;
  const char *v108;
  rlimit v109;
  void block[5];
  uint64_t v111;
  mach_port_options_t port_info[42];
  stat v113;

  notify_set_options();
  os_trace_set_mode();
  v109 = (rlimit)xmmword_10000E220;
  setrlimit(8, &v109);
  signal(13, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(30, (void (__cdecl *)(int))1);
  signal(31, (void (__cdecl *)(int))1);
  signal(28, (void (__cdecl *)(int))1);
  xmmword_100014078 = 0u;
  *(_OWORD *)&qword_100014088 = 0u;
  *(long long *)((char *)&xmmword_100014090 + 8) = 0u;
  *(long long *)((char *)&xmmword_1000140A0 + 8) = 0u;
  xmmword_1000140B8 = 0u;
  *(_OWORD *)&qword_1000140C8 = 0u;
  xmmword_1000140D8 = 0u;
  *(_OWORD *)&qword_1000140E8 = 0u;
  xmmword_1000140F8 = 0u;
  *(_OWORD *)&qword_100014108 = 0u;
  *(long long *)((char *)&xmmword_100014110 + 8) = 0u;
  *(_OWORD *)&qword_100014128 = 0u;
  xmmword_100014138 = 0u;
  *(_OWORD *)&qword_100014148 = 0u;
  xmmword_100014158 = 0u;
  *(_OWORD *)&qword_100014168 = 0u;
  xmmword_100014178 = 0u;
  unint64_t v4 = (unint64_t)&unk_100014190;
  v105 = getpagesize() >> 2;
  dword_1000142D8 = v105;
  dword_100014258 = 2;
  qword_100014260 = 0xFFFFFFFF00000000;
  os_set_str_ptr_init();
  qword_1000141A8 = 8;
  os_set_64_ptr_init();
  qword_1000141C8 = 16;
  os_set_64_ptr_init();
  qword_1000141E8 = 64;
  os_set_32_ptr_init();
  qword_100014208 = 8;
  os_set_32_ptr_init();
  qword_100014228 = 16;
  os_map_64_init();
  dword_100014300 = 1;
  int v5 = 3;
  dword_1000142F8 = 3;
  uint64_t v6 = strdup("/var/log/notifyd.log");
  qword_100014308 = (uint64_t)v6;
  dword_1000142DC = -1;
  if (a1 >= 2)
  {
    int v13 = v6;
    int v14 = 1;
    v106 = "apple.shm.notification_center";
    v108 = "com.apple.system.notification_center";
    int v15 = "-d";
    while (1)
    {
      BOOL v16 = __CFADD__(a2, 8 * v14);
      BOOL v17 = a2 + 8 * v14 >= a2;
      if (v14 < 0) {
        BOOL v17 = v16;
      }
      if (!v17)
      {
LABEL_175:
        __break(0x5513u);
LABEL_176:
        __break(0x5500u);
LABEL_177:
        sub_1000046F0((FILE *)3, "config file %s not owned by root: ignored\n", v7, v8, v9, v10, v11, v12, a2);
LABEL_179:
        *(_OWORD *)&port_info[0].flags = *(_OWORD *)"!";
        port_info[0].reserved[1] = 0;
        v99 = mach_port_construct(*(_DWORD *)v15, port_info, (mach_port_context_t)&qword_100014188, (mach_port_name_t *)&dword_100014288);
        if (v99)
        {
          qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Unable to allocate Mach notification port";
          qword_100014040 = v99;
LABEL_188:
          __break(1u);
        }
        else
        {
          qword_100014280 = dispatch_mach_create_f();
          dispatch_set_qos_class_fallback();
          qword_1000142A0 = dispatch_mach_create_f();
          dispatch_set_qos_class_fallback();
          qword_100014250 = xpc_event_publisher_create();
          xpc_event_publisher_set_handler();
          xpc_event_publisher_set_error_handler();
          xpc_event_publisher_set_throttling();
          xpc_event_publisher_activate();
          v100 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, (dispatch_queue_t)qword_100014298);
          qword_1000142A8 = (uint64_t)v100;
          if (v100)
          {
            dispatch_set_context(v100, 0);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 0x10), (dispatch_function_t)sub_10000A178);
            dispatch_activate(*(dispatch_object_t *)(v4 + 0x10));
            v101 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, *(dispatch_queue_t *)v4);
            *(void *)(v4 + 0x18) = v101;
            if (v101)
            {
              dispatch_set_context(v101, (void *)1);
              dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v4 + 0x18), (dispatch_function_t)sub_10000A178);
              dispatch_activate(*(dispatch_object_t *)(v4 + 0x18));
              v102 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1CuLL, 0, *(dispatch_queue_t *)v4);
              *(void *)(v4 + 0x20) = v102;
              if (v102)
              {
                dispatch_source_set_event_handler(v102, &stru_100010618);
                dispatch_activate(*(dispatch_object_t *)(v4 + 0x20));
                *(void *)(v4 + 0x28) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)v4);
                v103 = dispatch_walltime(0, 0);
                dispatch_source_set_timer(*(dispatch_source_t *)(v4 + 0x28), v103, 0x34630B8A000uLL, 0);
                dispatch_source_set_event_handler(*(dispatch_source_t *)(v4 + 0x28), &stru_100010658);
                dispatch_activate(*(dispatch_object_t *)(v4 + 0x28));
                if (os_variant_has_internal_diagnostics())
                {
                  v104 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 0x10uLL, *(dispatch_queue_t *)v4);
                  *(void *)(v4 + 0x30) = v104;
                  if (!v104) {
                    __assert_rtn("main", "notifyd.c", 1479, "global.memory_pressure_src != NULL");
                  }
                  dispatch_source_set_event_handler(v104, &stru_100010698);
                  dispatch_activate((dispatch_object_t)qword_1000142C8);
                }
                dispatch_async((dispatch_queue_t)qword_100014298, &stru_1000106D8);
                dispatch_main();
              }
              __assert_rtn("main", "notifyd.c", 1458, "global.sig_winch_src != NULL");
            }
            __assert_rtn("main", "notifyd.c", 1450, "global.sig_usr2_src != NULL");
          }
        }
        __assert_rtn("main", "notifyd.c", 1442, "global.sig_usr1_src != NULL");
      }
      unint64_t v4 = *(void *)(a2 + 8 * v14);
      if (!strcmp((const char *)v4, "-d"))
      {
        dword_1000142F8 = 7;
      }
      else
      {
        if (!strcmp((const char *)v4, "-log_cutoff"))
        {
          unint64_t v4 = v14 + 1;
          BOOL v20 = __CFADD__(a2, 8 * v4);
          BOOL v21 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1) {
            BOOL v21 = v20;
          }
          if (!v21) {
            goto LABEL_175;
          }
          dword_1000142F8 = atoi(*(const char **)(a2 + 8 * v4));
          goto LABEL_37;
        }
        if (!strcmp((const char *)v4, "-log_file"))
        {
          free(v13);
          unint64_t v4 = v14 + 1;
          BOOL v22 = __CFADD__(a2, 8 * v4);
          BOOL v23 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1) {
            BOOL v23 = v22;
          }
          if (!v23) {
            goto LABEL_175;
          }
          int v13 = strdup(*(const char **)(a2 + 8 * v4));
          qword_100014308 = (uint64_t)v13;
          goto LABEL_37;
        }
        if (!strcmp((const char *)v4, "-service"))
        {
          uint64_t v24 = v14 + 1;
          BOOL v25 = __CFADD__(a2, 8 * v24);
          BOOL v26 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1) {
            BOOL v26 = v25;
          }
          if (!v26) {
            goto LABEL_175;
          }
          v108 = *(const char **)(a2 + 8 * v24);
          goto LABEL_52;
        }
        if (!strcmp((const char *)v4, "-shm"))
        {
          uint64_t v24 = v14 + 1;
          BOOL v27 = __CFADD__(a2, 8 * v24);
          BOOL v28 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1) {
            BOOL v28 = v27;
          }
          if (!v28) {
            goto LABEL_175;
          }
          v106 = *(const char **)(a2 + 8 * v24);
LABEL_52:
          int v14 = v24;
          goto LABEL_53;
        }
        if (!strcmp((const char *)v4, "-shm_pages"))
        {
          unint64_t v4 = v14 + 1;
          BOOL v18 = __CFADD__(a2, 8 * v4);
          BOOL v19 = a2 + 8 * (v14 + 1) >= a2;
          if (v14 < -1) {
            BOOL v19 = v18;
          }
          if (!v19) {
            goto LABEL_175;
          }
          dword_1000142D8 = atoi(*(const char **)(a2 + 8 * v4)) * v105;
LABEL_37:
          int v14 = v4;
        }
      }
LABEL_53:
      if (__OFADD__(v14++, 1)) {
        goto LABEL_176;
      }
      if (v14 >= a1)
      {
        int v5 = dword_1000142F8;
        long long v31 = v106;
        BOOL v30 = v108;
        goto LABEL_57;
      }
    }
  }
  BOOL v30 = "com.apple.system.notification_center";
  long long v31 = "apple.shm.notification_center";
LABEL_57:
  dword_1000142FC = v5;
  char v32 = getpid();
  sub_1000046F0((FILE *)7, "--------------------\nnotifyd start PID %u\n", v33, v34, v35, v36, v37, v38, v32);
  uint64_t v39 = bootstrap_check_in(bootstrap_port, v30, (mach_port_t *)&dword_10001428C);
  if (v39)
  {
    v51 = v39;
    v52 = __stderrp;
    v53 = getpid();
    fprintf(v52, "%d bootstrap_check_in failed (%d)\n", v53, v51);
    exit(1);
  }
  port_info[0].flags = 32;
  int v15 = (char *)&mach_task_self_;
  mach_port_set_attributes(mach_task_self_, dword_10001428C, 1, (mach_port_info_t)port_info, 4u);
  long long v40 = dword_1000142D8;
  if (dword_1000142D8)
  {
    long long v41 = shm_open(v31, 2, 420);
    long long v42 = v41;
    if (v41 == -1)
    {
      long long v42 = shm_open(v31, 514, 420);
      if (v42 == -1)
      {
        uint64_t v43 = __error();
        v44 = strerror(*v43);
        snprintf((char *)port_info, 0x400uLL, "shm_open %s failed: %s\n", v31, v44);
        qword_100014010 = (uint64_t)port_info;
        sub_1000046F0((FILE *)5, "%s", v45, v46, v47, v48, v49, v50, (char)port_info);
        goto LABEL_67;
      }
    }
    v54 = (4 * v40);
    ftruncate(v42, v54);
    qword_1000142E0 = (uint64_t)mmap(0, v54, 3, 1, v42, 0);
    close_NOCANCEL();
    if (v41 != -1)
    {
      v55 = malloc_type_malloc(v54, 0x598B75AuLL);
      qword_1000142F0 = (uint64_t)v55;
      if (v55) {
        memcpy(v55, (const void *)qword_1000142E0, v54);
      }
    }
    bzero((void *)qword_1000142E0, v54);
    v56 = malloc_type_malloc(v54, 0xF354AE1CuLL);
    qword_1000142E8 = (uint64_t)v56;
    if (!v56) {
LABEL_67:
    }
      __assert_rtn("main", "notifyd.c", 1380, "status == 0");
    bzero(v56, v54);
    *(_DWORD *)qword_1000142E0 = getpid();
    *(_DWORD *)qword_1000142E8 = 1;
    dword_1000142DC = 0;
  }
  unint64_t v4 = (unint64_t)&qword_100014298;
  qword_100014298 = (uint64_t)dispatch_workloop_create_inactive("com.apple.notifyd.main");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_100014298);
  memset(&v113, 0, sizeof(v113));
  v111 = 0;
  v57 = ((uint64_t)getpid() << 32) | 3;
  v58 = dword_100014300++;
  sub_100003F5C("com.apple.system.notify.ipc_version", 0xFFFFFFFFLL, v58, -1, 0, 0, &v111);
  sub_1000034E8(v111, v57, 0, 0);
  a2 = (unint64_t)"/etc/notify.conf";
  if (stat("/etc/notify.conf", &v113)) {
    goto LABEL_179;
  }
  if (v113.st_uid) {
    goto LABEL_177;
  }
  if ((v113.st_mode & 2) != 0)
  {
    sub_1000046F0((FILE *)3, "config file %s is world-writable: ignored\n", v7, v8, v9, v10, v11, v12, (char)"/etc/notify.conf");
    goto LABEL_179;
  }
  v59 = fopen("/etc/notify.conf", "r");
  if (!v59) {
    goto LABEL_179;
  }
  v60 = v59;
  v107 = v59;
  while (1)
  {
    do
    {
      if (!fgets((char *)port_info, 1024, v60))
      {
LABEL_193:
        fclose(v60);
        unint64_t v4 = (unint64_t)&qword_100014298;
        int v15 = (char *)&mach_task_self_;
        goto LABEL_179;
      }
    }
    while (!LOBYTE(port_info[0].flags) || LOBYTE(port_info[0].flags) == 35);
    size_t result = strlen((const char *)port_info);
    v62 = result - 1;
    if (result - 1 > 0x3FF) {
      break;
    }
    if (v62 > ~(unint64_t)port_info) {
      goto LABEL_175;
    }
    v63 = 0;
    unint64_t v4 = 0;
    v64 = 0;
    v65 = (unint64_t)port_info;
    *((unsigned char *)&port_info[0].flags + v62) = 0;
    while (1)
    {
      if (v4 > 0x3FF) {
        goto LABEL_188;
      }
      if (!*(unsigned char *)v65) {
        break;
      }
      v66 = 0;
      a2 = ~v65;
      v67 = v64;
      v68 = v4;
      v69 = (unsigned __int8 *)v65;
      while (1)
      {
        if (v67 > 0x3FF || v68 > 0x3FF) {
          goto LABEL_188;
        }
        v70 = *v69;
        v71 = v70 > 0x20;
        v72 = (1 << v70) & 0x100000201;
        if (!v71 && v72 != 0) {
          break;
        }
        v74 = v66 + 1;
        if (__OFADD__(v66, 1)) {
          goto LABEL_176;
        }
        v66 = v74;
        v67 = v64 + v74;
        v68 = v4 + v74;
        v69 = (unsigned __int8 *)(v65 + v74);
        if (a2 < v74) {
          goto LABEL_175;
        }
      }
      v75 = v66 + 1;
      if (__OFADD__(v66, 1)) {
        goto LABEL_176;
      }
      v76 = v75;
      v77 = (char *)malloc_type_malloc(v75, 0x4ED5A34BuLL);
      int v15 = v77;
      v78 = ~(unint64_t)v77;
      if ((int)v66 < 1)
      {
        v81 = 0;
      }
      else
      {
        v79 = 0;
        v80 = 1024 - v64;
        if (v64 > 0x400) {
          v80 = 0;
        }
        do
        {
          if (v79 > a2) {
            goto LABEL_175;
          }
          if (v80 == v79 || 1024 - v4 == v79) {
            goto LABEL_188;
          }
          if (v79 > v78) {
            goto LABEL_175;
          }
          if (v76 == v79) {
            goto LABEL_188;
          }
          v77[v79] = *(unsigned char *)(v65 + v79);
          ++v79;
        }
        while (v66 != v79);
        v81 = v66;
      }
      if (v66 > v78) {
        goto LABEL_175;
      }
      if ((v66 & 0x8000000000000000) != 0 || v66 >= v76) {
        goto LABEL_188;
      }
      v77[v66] = 0;
      v63 = (unint64_t)sub_100009C2C(v77, v63);
      free(v15);
      if (a2 < v81) {
        goto LABEL_175;
      }
      a2 = v64 + v81;
      if (a2 > 0x3FF) {
        goto LABEL_188;
      }
      v82 = v4 + v81;
      if (v82 > 0x3FF) {
        goto LABEL_188;
      }
      int v15 = (char *)(v65 + v81);
      if (!*v15) {
        break;
      }
      v83 = v81 + 1;
      if (__OFADD__(v81, 1)) {
        goto LABEL_176;
      }
      v84 = __CFADD__(v65, v83);
      v85 = v65 + v83 >= v65;
      if (v83 < 0) {
        v85 = v84;
      }
      if (!v85) {
        goto LABEL_175;
      }
      if (v64 + v83 > 0x3FF || v4 + v83 > 0x3FF) {
        goto LABEL_188;
      }
      if (!*(unsigned char *)(v65 + v83)) {
        v63 = (unint64_t)sub_100009C2C("", v63);
      }
      if (v15 == (char *)-1) {
        goto LABEL_175;
      }
      v64 = a2 + 1;
      unint64_t v4 = v82 + 1;
      v65 = (unint64_t)(v15 + 1);
      if (a2 > 0x3FE) {
        goto LABEL_188;
      }
    }
    v60 = v107;
    if (v63)
    {
      LODWORD(a2) = 0;
      v86 = (void *)v63;
      while (*v86)
      {
        v87 = a2 + 1;
        if (__OFADD__(a2, 1)) {
          goto LABEL_176;
        }
        v86 = (void *)(v63 + 8 * v87);
        LODWORD(a2) = a2 + 1;
        if (8 * v87 > ~v63) {
          goto LABEL_175;
        }
      }
      if (!a2) {
        goto LABEL_174;
      }
      int v15 = *(char **)v63;
      if (!strcasecmp(*(const char **)v63, "monitor"))
      {
        if (a2 <= 2) {
          goto LABEL_174;
        }
        if (v63 > 0xFFFFFFFFFFFFFFF7) {
          goto LABEL_175;
        }
        v88 = *(const char **)(v63 + 8);
        a2 = (unint64_t)&qword_100014298;
        v89 = dword_100014300++;
        sub_100003F5C(v88, 0xFFFFFFFFLL, v89, -1, 0, 0, &v111);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_100009DD0;
        block[3] = &unk_1000107E0;
        block[4] = v63;
        dispatch_async((dispatch_queue_t)qword_100014298, block);
      }
      else
      {
        if (!strcasecmp(v15, "set"))
        {
          if (a2 != 1 && a2 < 4)
          {
            if (v63 > 0xFFFFFFFFFFFFFFF7) {
              goto LABEL_175;
            }
            v90 = *(const char **)(v63 + 8);
            v91 = dword_100014300++;
            sub_100003F5C(v90, 0xFFFFFFFFLL, v91, -1, 0, 0, &v111);
            if (a2 == 3)
            {
              if (v63 > 0xFFFFFFFFFFFFFFEFLL) {
                goto LABEL_175;
              }
              v92 = atoll(*(const char **)(v63 + 16));
              sub_1000034E8(v111, v92, 0, 0);
            }
          }
          goto LABEL_174;
        }
        if (!strcasecmp(v15, "reserve"))
        {
          if (a2 == 1) {
            goto LABEL_174;
          }
          if (a2 < 3)
          {
            int v15 = 0;
            v93 = 0;
          }
          else
          {
            if (v63 > 0xFFFFFFFFFFFFFFEFLL) {
              goto LABEL_175;
            }
            v93 = atoi(*(const char **)(v63 + 16));
            if (a2 < 4)
            {
              int v15 = 0;
            }
            else
            {
              if (v63 > 0xFFFFFFFFFFFFFFE7) {
                goto LABEL_175;
              }
              int v15 = (char *)atoi(*(const char **)(v63 + 24));
              if (a2 >= 5)
              {
                if (v63 > 0xFFFFFFFFFFFFFFDFLL) {
                  goto LABEL_175;
                }
                LODWORD(a2) = sub_100009EF0(*(const char **)(v63 + 32));
                goto LABEL_158;
              }
            }
          }
          LODWORD(a2) = 819;
LABEL_158:
          if (!(v93 | v15)) {
            goto LABEL_166;
          }
          if (v63 > 0xFFFFFFFFFFFFFFF7) {
            goto LABEL_175;
          }
          v94 = *(const char **)(v63 + 8);
          if (!v94) {
            goto LABEL_166;
          }
          v95 = os_set_str_ptr_find();
          if (v95)
          {
            v96 = (_DWORD *)(v95 - qword_1000141A8);
            if (v96) {
              goto LABEL_165;
            }
          }
          v96 = sub_100005138(v94);
          if (v96)
          {
            ++v96[14];
LABEL_165:
            v96[10] = v93;
            v96[11] = v15;
            sub_10000A4E0((uint64_t)v96);
          }
LABEL_166:
          if (a2 != 819)
          {
            if (v63 > 0xFFFFFFFFFFFFFFF7) {
              goto LABEL_175;
            }
            int v15 = *(char **)(v63 + 8);
            if (v15)
            {
              v97 = os_set_str_ptr_find();
              if (!v97 || (v98 = (void *)(v97 - qword_1000141A8)) == 0)
              {
                v98 = sub_100005138(v15);
                if (!v98) {
                  goto LABEL_174;
                }
                ++*((_DWORD *)v98 + 14);
              }
              *((_DWORD *)v98 + 12) = a2;
              sub_10000A4E0((uint64_t)v98);
            }
          }
LABEL_174:
          sub_100009D40(v63);
        }
        else
        {
          int v15 = (char *)strcasecmp(v15, "quit");
          sub_100009D40(v63);
          if (!v15) {
            goto LABEL_193;
          }
        }
      }
    }
  }
  __break(0x5512u);
  return result;
}

char *sub_100009C2C(const char *a1, unint64_t ptr)
{
  unint64_t v5 = ptr;
  if (!a1) {
    return (char *)v5;
  }
  if (ptr)
  {
    unint64_t v4 = 0;
    uint64_t v3 = 0;
    LODWORD(v7) = 0;
    do
    {
      uint64_t v2 = (v7 + 1);
      if (!*(void *)(ptr + 8 * v3)) {
        goto LABEL_7;
      }
      unint64_t v4 = 8 * (v7 + 1);
      uint64_t v3 = (v7 + 1);
      LODWORD(v7) = v7 + 1;
    }
    while (v4 <= ~ptr);
    goto LABEL_6;
  }
  unint64_t v5 = (unint64_t)malloc_type_malloc(0x10uLL, 0x10040436913F5uLL);
  *(void *)unint64_t v5 = strdup(a1);
  if (v5 < 0xFFFFFFFFFFFFFFF8)
  {
    uint64_t v10 = (void *)(v5 + 8);
LABEL_14:
    *uint64_t v10 = 0;
    return (char *)v5;
  }
  while (1)
  {
    do
    {
LABEL_6:
      __break(0x5513u);
LABEL_7:
      size_t v8 = 8 * (v7 + 2);
      unint64_t v5 = (unint64_t)malloc_type_realloc((void *)v5, v8, 0x10040436913F5uLL);
      size_t result = strdup(a1);
    }
    while (v4 > ~v5);
    if (v8 <= 8 * v3) {
      break;
    }
    *(void *)(v5 + 8 * v3) = result;
    unint64_t v7 = 8 * v2;
    if (v7 <= ~v5)
    {
      if (v8 >= v7)
      {
        uint64_t v10 = (void *)(v5 + 8 * v2);
        goto LABEL_14;
      }
      break;
    }
  }
  __break(1u);
  return result;
}

void sub_100009D40(unint64_t a1)
{
  if (a1)
  {
    int v2 = 0;
    unint64_t v3 = ~a1;
    unint64_t v4 = (void **)a1;
    while (*v4)
    {
      free(*v4);
      *unint64_t v4 = 0;
      int v5 = v2 + 1;
      if (__OFADD__(v2, 1))
      {
        __break(0x5500u);
        return;
      }
      unint64_t v4 = (void **)(a1 + 8 * v5);
      ++v2;
      if (8 * v5 > v3)
      {
        __break(0x5513u);
        break;
      }
    }
    free((void *)a1);
  }
}

void sub_100009DD0(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 0xFFFFFFFFFFFFFFF7 || v1 >= 0xFFFFFFFFFFFFFFF0)
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = *(const char **)(v1 + 8);
    int v5 = *(char **)(v1 + 16);
    ++qword_100014168;
    if (v5)
    {
      uint64_t v6 = os_set_str_ptr_find();
      if (v6 && qword_1000141A8 != v6)
      {
        long long v12 = 0u;
        long long v13 = 0u;
        size_t v8 = sub_10000AB30(v5, &v12, 1, 1023);
        if (v8)
        {
          size_t v9 = v8;
          *(void *)(v8 + 80) = strdup(v4);
          uint64_t v10 = *(NSObject **)(v9 + 72);
          *(void *)&long long v12 = _NSConcreteStackBlock;
          *((void *)&v12 + 1) = 0x40000000;
          *(void *)&long long v13 = sub_10000BC88;
          *((void *)&v13 + 1) = &unk_100010948;
          size_t v14 = v9;
          uint64_t v15 = 0;
          dispatch_source_set_event_handler(v10, &v12);
          dispatch_activate(*(dispatch_object_t *)(v9 + 72));
        }
      }
    }
    unint64_t v11 = *(void *)(a1 + 32);
    sub_100009D40(v11);
  }
}

const char *sub_100009EF0(const char *result)
{
  if (result)
  {
    unint64_t v1 = result;
    size_t result = (const char *)strlen(result);
    if (result == (const char *)6)
    {
      if ((unint64_t)v1 > 0xFFFFFFFFFFFFFFFALL)
      {
        __break(0x5513u);
      }
      else
      {
        if (v1[1] == 119) {
          int v2 = (*v1 == 114) | 2;
        }
        else {
          int v2 = *(unsigned __int8 *)v1 == 114;
        }
        if (v1[2] == 114) {
          int v3 = v2 | 0x10;
        }
        else {
          int v3 = v2;
        }
        if (v1[3] == 119) {
          int v4 = v3 | 0x20;
        }
        else {
          int v4 = v3;
        }
        if (v1[4] == 114) {
          unsigned int v5 = v4 | 0x100;
        }
        else {
          unsigned int v5 = v4;
        }
        if (v1[5] == 119) {
          return (const char *)(v5 | 0x200);
        }
        else {
          return (const char *)v5;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100009F90(id a1)
{
  qword_1000142D0 = time(0);
}

BOOL sub_10000A024(id a1, void *a2)
{
  int v2 = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = 0;
  *((_DWORD *)a2 + 17) = v2;
  return 1;
}

void sub_10000A034(id a1)
{
  unlink("/var/run/notifyd_jetsam.log");
  unint64_t v1 = fopen("/var/run/notifyd_jetsam.log", "w");
  if (v1)
  {
    int v2 = v1;
    if ((fprintf(v1, "-- JETSAM LOG BEGIN ---\n") & 0x80000000) == 0)
    {
      sub_1000076FC(v2);
      if ((fprintf(v2, "-- JETSAM LOG END ---\n") & 0x80000000) == 0)
      {
        fclose(v2);
      }
    }
  }
}

void sub_10000A0C4(id a1)
{
  qword_1000142D0 = time(0);
}

void sub_10000A158(id a1)
{
  if (dword_1000142F8 == 7) {
    int v1 = dword_1000142FC;
  }
  else {
    int v1 = 7;
  }
  dword_1000142F8 = v1;
}

FILE *sub_10000A178(int a1)
{
  return sub_1000069C0(a1, -1);
}

void sub_10000A180(id a1, int a2)
{
  qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Event publisher error";
  qword_100014040 = a2;
  __break(1u);
}

void sub_10000A1A8(id a1, unsigned int a2, unint64_t a3, void *a4)
{
  if (a2 == 2)
  {
    dispatch_mach_connect();
    dispatch_mach_connect();
  }
  else
  {
    if (a2 != 1)
    {
      if (a2) {
        return;
      }
      if (xpc_get_type(a4) != (xpc_type_t)&_xpc_type_dictionary) {
        __assert_rtn("notifyd_matching_register", "notify_proc.c", 1658, "xpc_get_type(descriptor) == XPC_TYPE_DICTIONARY");
      }
      string = xpc_dictionary_get_string(a4, "Notification");
      unsigned int v7 = dword_100014300++;
      *(void *)&xmmword_1000140A0 = xmmword_1000140A0 + 1;
      ++qword_1000140D0;
      sub_1000046F0((FILE *)7, "notifyd_matching_register %s %d %llu\n", v8, v9, v10, v11, v12, v13, (char)string);
      uint64_t v24 = 0;
      if (!string)
      {
        LOBYTE(v20) = 1;
        goto LABEL_18;
      }
      if (!qword_100014250) {
        __assert_rtn("_notify_lib_register_xpc_event", "libnotify.c", 1109, "ns->event_publisher != NULL");
      }
      int v20 = sub_1000048D8(string, 0xFFFFFFFFLL, v7, 0, -101, &v24);
      if (v20)
      {
        if (v20 == 7) {
          return;
        }
LABEL_18:
        sub_1000046F0((FILE *)4, "_notify_lib_register_xpc_event failed with status %u\n", v14, v15, v16, v17, v18, v19, v20);
        return;
      }
      uint64_t v22 = v24;
      *(unsigned char *)(v24 + 79) = *(unsigned char *)(v24 + 79) & 0xF0 | 6;
      *(void *)(v22 + 56) = a3;
      uint64_t v23 = os_set_64_ptr_find();
      if (!v23 || v23 == qword_1000141E8)
      {
        qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Can't find client after registering an event";
        __break(1u);
      }
      else if (!os_map_64_find())
      {
        os_map_64_insert();
        ++dword_100014278;
        return;
      }
      qword_100014010 = (uint64_t)"BUG IN LIBNOTIFY: Event token is already registered";
      qword_100014040 = a3;
      __break(1u);
      return;
    }
    BOOL v21 = (uint64_t *)os_map_64_delete();
    if (v21)
    {
      ++dword_10001427C;
      sub_100003024(v21);
    }
  }
}

void sub_10000A450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = 0;
  if (getpid() != 1)
  {
    int v9 = vasprintf(&v10, "BUG IN CLIENT OF NOTIFYD: %s has not dequeued the last %d messages", &a9);
    if (v10)
    {
      if (__OFADD__(v9, 1))
      {
        __break(0x5500u);
        JUMPOUT(0x10000A4CCLL);
      }
      os_fault_with_payload();
      free(v10);
    }
  }
}

uint64_t sub_10000A4E0(uint64_t a1)
{
  uint64_t result = qword_100014248;
  if (qword_100014248)
  {
    if (dword_10001425C)
    {
      unint64_t v3 = 0;
      while (v3 <= ~qword_100014248)
      {
        if (*(void *)(qword_100014248 + v3) == a1) {
          return result;
        }
        v3 += 8;
        if (8 * dword_10001425C == v3)
        {
          size_t v4 = 8 * (dword_10001425C + 1);
          goto LABEL_10;
        }
      }
      goto LABEL_27;
    }
  }
  else
  {
    dword_10001425C = 0;
  }
  size_t v4 = 8;
LABEL_10:
  uint64_t result = (uint64_t)reallocf((void *)qword_100014248, v4);
  uint64_t v5 = result;
  qword_100014248 = result;
  uint64_t v6 = dword_10001425C;
  if (dword_10001425C)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = ~result;
    uint64_t v10 = *(const char **)(a1 + 8);
    size_t v11 = v4 >> 3;
    while (v7 <= v9)
    {
      if (v11 == v8) {
        goto LABEL_28;
      }
      uint64_t result = strcmp(v10, *(const char **)(*(void *)(v5 + 8 * v8) + 8));
      if ((int)result > 0)
      {
        if (v6 <= v8) {
          goto LABEL_24;
        }
        unsigned int v12 = v6;
        while (1)
        {
          uint64_t v13 = v12 - 1;
          if (~qword_100014248 < 8 * (unint64_t)v13
            || ~qword_100014248 < 8 * (unint64_t)v12)
          {
            goto LABEL_27;
          }
          *(void *)(qword_100014248 + 8 * v12--) = *(void *)(qword_100014248 + 8 * v13);
          if (v13 <= v8)
          {
            uint64_t v5 = qword_100014248;
            goto LABEL_24;
          }
        }
      }
      ++v8;
      v7 += 8;
      if (v6 == v8)
      {
        LODWORD(v8) = v6;
        goto LABEL_24;
      }
    }
  }
  else
  {
    LODWORD(v8) = 0;
LABEL_24:
    if (!__CFADD__(v5, 8 * v8))
    {
      *(void *)(v5 + 8 * v8) = a1;
      dword_10001425C = v6 + 1;
      return result;
    }
  }
LABEL_27:
  __break(0x5513u);
LABEL_28:
  __break(1u);
  return result;
}

void sub_10000A658(uint64_t a1)
{
  if (!a1) {
    return;
  }
  int v2 = *(_DWORD *)(a1 + 104);
  if (v2)
  {
    int v3 = v2 - 1;
    *(_DWORD *)(a1 + 104) = v3;
    if (v3) {
      return;
    }
  }
  sub_10000A738(a1);
  sub_10000A7B4();
  free(*(void **)a1);
  size_t v4 = *(void **)(a1 + 56);
  if (!v4) {
    goto LABEL_13;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  *(_DWORD *)(a1 + 48) = 0;
  if (!v5)
  {
LABEL_12:
    free(v4);
LABEL_13:
    free(*(void **)(a1 + 80));
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    free((void *)a1);
    return;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 8 * v5;
  while (1)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if (__CFADD__(v8, v6)) {
      break;
    }
    free(*(void **)(v8 + v6));
    uint64_t v9 = *(void *)(a1 + 56);
    if (__CFADD__(v9, v6)) {
      break;
    }
    *(void *)(v9 + v6) = 0;
    v6 += 8;
    if (v7 == v6)
    {
      size_t v4 = *(void **)(a1 + 56);
      goto LABEL_12;
    }
  }
  __break(0x5513u);
}

uint64_t sub_10000A738(uint64_t result)
{
  uint64_t v1 = dword_100014058;
  if (dword_100014058)
  {
    uint64_t v2 = 0;
    uint64_t v3 = qword_100014060;
    while (!__CFADD__(v3, 8 * v2))
    {
      uint64_t v4 = *(void *)(v3 + 8 * v2);
      if (v4)
      {
        uint64_t v5 = *(unsigned int *)(v4 + 56);
        if (v5)
        {
          uint64_t v6 = 0;
          uint64_t v7 = *(void *)(v4 + 64);
          while (~v7 >= (unint64_t)(8 * v6))
          {
            if (*(void *)(v7 + 8 * v6) == result)
            {
              *(void *)(v7 + 8 * v6) = 0;
              uint64_t v3 = qword_100014060;
              goto LABEL_12;
            }
            if (++v6 == v5) {
              goto LABEL_12;
            }
          }
          break;
        }
      }
LABEL_12:
      if (++v2 == v1) {
        return result;
      }
    }
    __break(0x5513u);
  }
  return result;
}

void sub_10000A7B4()
{
  unsigned int v0 = dword_100014058;
  if (dword_100014058)
  {
    unsigned int v1 = 0;
    uint64_t v2 = qword_100014060;
    do
    {
      if (__CFADD__(v2, 8 * v1)) {
        goto LABEL_54;
      }
      unsigned int v3 = v1;
      uint64_t v4 = *(void *)(v2 + 8 * v1);
      if (v4)
      {
        uint64_t v5 = *(unsigned int *)(v4 + 56);
        if (v5)
        {
          unint64_t v6 = 0;
          LODWORD(v7) = 0;
          uint64_t v8 = *(void *)(v4 + 64);
          do
          {
            if (v6 > ~v8) {
              goto LABEL_54;
            }
            if (*(void *)(v8 + v6)) {
              size_t v7 = (v7 + 1);
            }
            else {
              size_t v7 = v7;
            }
            v6 += 8;
          }
          while (8 * v5 != v6);
          if (v7 != v5)
          {
            if (v7)
            {
              unint64_t v9 = (unint64_t)malloc_type_calloc(v7, 8uLL, 0x2004093837F09uLL);
              if (!v9) {
                __assert_rtn("_vnode_sweep", "pathwatch.c", 515, "new_path_node != NULL");
              }
              unint64_t v10 = v9;
              uint64_t v11 = *(unsigned int *)(v4 + 56);
              if (v11)
              {
                uint64_t v12 = 0;
                unsigned int v13 = 0;
                uint64_t v14 = 8 * v11;
                while (1)
                {
                  uint64_t v15 = *(void *)(v4 + 64);
                  if (__CFADD__(v15, v12)) {
                    goto LABEL_54;
                  }
                  uint64_t v16 = *(void *)(v15 + v12);
                  if (v16)
                  {
                    if (~v9 < 8 * (unint64_t)v13) {
                      goto LABEL_54;
                    }
                    if (v7 <= v13)
                    {
LABEL_56:
                      __break(1u);
                      return;
                    }
                    uint64_t v17 = v13++;
                    *(void *)(v9 + 8 * v17) = v16;
                  }
                  v12 += 8;
                  if (v14 == v12) {
                    goto LABEL_26;
                  }
                }
              }
              unsigned int v13 = 0;
            }
            else
            {
              unsigned int v13 = 0;
              unint64_t v10 = 0;
            }
LABEL_26:
            free(*(void **)(v4 + 64));
            *(void *)(v4 + 64) = v10;
            *(_DWORD *)(v4 + 56) = v13;
            unsigned int v0 = dword_100014058;
            uint64_t v2 = qword_100014060;
          }
        }
      }
      unsigned int v1 = v3 + 1;
    }
    while (v3 + 1 < v0);
    if (v0)
    {
      unint64_t v18 = 0;
      unsigned int v19 = 0;
      do
      {
        if (v18 > ~v2) {
          goto LABEL_54;
        }
        uint64_t v20 = *(void *)(v2 + v18);
        if (v20)
        {
          if (*(_DWORD *)(v20 + 56)) {
            ++v19;
          }
        }
        v18 += 8;
      }
      while (8 * v0 != v18);
      if (v19 != v0)
      {
        if (v19)
        {
          uint64_t v21 = (uint64_t)malloc_type_calloc(v19, 8uLL, 0x2004093837F09uLL);
          if (!v21) {
            goto LABEL_55;
          }
          uint64_t v22 = v21;
          unint64_t v23 = dword_100014058;
          if (dword_100014058)
          {
            uint64_t v24 = 0;
            unint64_t v25 = 0;
            unsigned int v26 = 0;
            unint64_t v27 = ~v21;
            while (!__CFADD__(qword_100014060, v24))
            {
              uint64_t v28 = *(void *)(qword_100014060 + 8 * v25);
              if (v28)
              {
                if (*(_DWORD *)(v28 + 56))
                {
                  if (v27 < 8 * (unint64_t)v26) {
                    break;
                  }
                  if (v19 <= v26) {
                    goto LABEL_56;
                  }
                  uint64_t v29 = v26++;
                  *(void *)(v22 + 8 * v29) = v28;
                }
                else
                {
                  dispatch_source_cancel(*(dispatch_source_t *)(v28 + 48));
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 0x40000000;
                  block[2] = sub_10000AAD8;
                  block[3] = &unk_1000108C8;
                  block[4] = v28;
                  dispatch_async((dispatch_queue_t)qword_100014298, block);
                  unint64_t v23 = dword_100014058;
                }
              }
              ++v25;
              v24 += 8;
              if (v25 >= v23) {
                goto LABEL_51;
              }
            }
LABEL_54:
            __break(0x5513u);
LABEL_55:
            __assert_rtn("_vnode_sweep", "pathwatch.c", 548, "new_source != NULL");
          }
          unsigned int v26 = 0;
        }
        else
        {
          unsigned int v26 = 0;
          uint64_t v22 = 0;
        }
LABEL_51:
        free((void *)qword_100014060);
        qword_100014060 = v22;
        dword_100014058 = v26;
      }
    }
  }
}

void sub_10000AAD8(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
  free(**(void ***)(a1 + 32));
  free(*(void **)(*(void *)(a1 + 32) + 64));
  uint64_t v2 = *(void **)(a1 + 32);

  free(v2);
}

size_t sub_10000AB30(char *a1, _OWORD *a2, int a3, __int16 a4)
{
  uint64_t v8 = qword_100014298;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_100014298);
  if (qword_100014050 != -1) {
    dispatch_once(&qword_100014050, &stru_1000108A8);
  }
  if (*a1 == 47)
  {
    size_t result = (size_t)malloc_type_calloc(1uLL, 0x70uLL, 0x10B0040DF2FFA84uLL);
    if (!result) {
      __assert_rtn("_path_node_init", "pathwatch.c", 723, "pnode != NULL");
    }
    uint64_t v10 = result;
    *(void *)(result + 8) = 1;
    for (int i = *a1; i == 47; int i = v12)
    {
      if (a1 == (char *)-1) {
        goto LABEL_44;
      }
      int v12 = *++a1;
    }
    while (1)
    {
LABEL_28:
      unint64_t v18 = strchr(a1, 47);
      if (!v18) {
        unint64_t v18 = &a1[strlen(a1)];
      }
      int64_t v19 = v18 - a1;
      if (v18 == a1) {
        break;
      }
      *(void *)(v10 + 8) += v19 + 1;
      if (v18)
      {
        size_t result = (size_t)malloc_type_malloc(v19 + 1, 0x1FCFB76DuLL);
        if (!result) {
          __assert_rtn("_path_node_init", "pathwatch.c", 747, "name != NULL");
        }
        unsigned int v13 = (char *)result;
        if (a1) {
          size_t result = (size_t)strncpy((char *)result, a1, v18 - a1);
        }
        if (__CFADD__(v13, v19)) {
          goto LABEL_44;
        }
        if (v19 < 0) {
          goto LABEL_45;
        }
        v13[v19] = 0;
      }
      else
      {
        unsigned int v13 = strdup(a1);
      }
      int v14 = *(_DWORD *)(v10 + 48);
      if (v14)
      {
        size_t v15 = 8 * (v14 + 1);
        size_t result = (size_t)reallocf(*(void **)(v10 + 56), v15);
      }
      else
      {
        size_t result = (size_t)malloc_type_calloc(1uLL, 8uLL, 0x10040436913F5uLL);
        size_t v15 = 8;
      }
      *(void *)(v10 + 56) = result;
      if (!result) {
        __assert_rtn("_path_node_init", "pathwatch.c", 763, "pnode->pname != NULL");
      }
      uint64_t v16 = *(unsigned int *)(v10 + 48);
      if (__CFADD__(result, 8 * v16)) {
        goto LABEL_44;
      }
      if (v15 <= 8 * v16) {
        goto LABEL_45;
      }
      a1 = 0;
      *(void *)(result + 8 * v16) = v13;
      *(_DWORD *)(v10 + 48) = v16 + 1;
      if (v18)
      {
        a1 = v18;
        if (*v18 == 47)
        {
          a1 = v18;
          while (a1 != (char *)-1)
          {
            int v17 = *++a1;
            if (v17 != 47) {
              goto LABEL_28;
            }
          }
          goto LABEL_44;
        }
      }
    }
    uint64_t v20 = malloc_type_calloc(1uLL, *(void *)(v10 + 8), 0x79E9B60EuLL);
    *(void *)uint64_t v10 = v20;
    if (!v20) {
      __assert_rtn("_path_node_init", "pathwatch.c", 776, "pnode->path != NULL");
    }
    if (!*(_DWORD *)(v10 + 48))
    {
LABEL_36:
      *(_DWORD *)(v10 + 104) = 1;
      long long v24 = a2[1];
      *(_OWORD *)(v10 + 16) = *a2;
      *(_OWORD *)(v10 + 32) = v24;
      sub_10000AE78(v10, 0, 0);
      *(void *)(v10 + 72) = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, v8);
      *(_DWORD *)(v10 + 68) = a4 & 0x3FF;
      if (a3) {
        *(_DWORD *)(v10 + 68) = a4 & 0x3FF | 0x20000000;
      }
      return v10;
    }
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    while (1)
    {
      size_t result = strlcat(*(char **)v10, "/", *(void *)(v10 + 8));
      uint64_t v23 = *(void *)(v10 + 56);
      if (__CFADD__(v23, v21)) {
        break;
      }
      strlcat(*(char **)v10, *(const char **)(v23 + 8 * v22++), *(void *)(v10 + 8));
      v21 += 8;
      if (v22 >= *(unsigned int *)(v10 + 48)) {
        goto LABEL_36;
      }
    }
LABEL_44:
    __break(0x5513u);
LABEL_45:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

void sub_10000AE78(uint64_t a1, int a2, const char **a3)
{
  if (!a1) {
    return;
  }
  memset(&v43, 0, sizeof(v43));
  unint64_t v6 = *(NSObject **)(a1 + 72);
  if (v6)
  {
    if (dispatch_source_testcancel(v6)) {
      return;
    }
  }
  size_t v7 = *(const char **)a1;
  int v9 = *(_DWORD *)(a1 + 64);
  int v8 = *(_DWORD *)(a1 + 68);
  long long v10 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)v45.val = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v45.val[4] = v10;
  if (v7)
  {
    memset(&v46, 0, sizeof(v46));
    *(_DWORD *)(a1 + 64) = 0;
    if (*v7 == 47)
    {
      if (v7 == (const char *)-1) {
LABEL_75:
      }
        __break(0x5513u);
      if (v7[1])
      {
        if ((v8 & 0x20000000) == 0)
        {
          long long v11 = *(_OWORD *)(a1 + 32);
          *(_OWORD *)atoken.val = *(_OWORD *)(a1 + 16);
          *(_OWORD *)&atoken.val[4] = v11;
          if (sandbox_check_by_audit_token())
          {
LABEL_10:
            a2 |= 0x40u;
            goto LABEL_18;
          }
        }
        memset(&v46, 0, sizeof(v46));
        if (lstat(v7, &v46)) {
          goto LABEL_18;
        }
        int v12 = v46.st_mode & 0xF000;
        switch(v12)
        {
          case 16384:
            int v14 = 0;
            int v13 = 0;
            int v15 = 3;
            goto LABEL_57;
          case 40960:
            int v14 = 0;
            int v15 = 2;
            int v13 = 1;
            goto LABEL_57;
          case 32768:
            int v13 = 0;
            int v14 = 1;
            int v15 = 1;
LABEL_57:
            *(_DWORD *)(a1 + 64) = v15;
            if ((v8 & 0x20000000) != 0) {
              goto LABEL_18;
            }
            audit_token_t atoken = v45;
            if (!audit_token_to_euid(&atoken)) {
              goto LABEL_18;
            }
            bzero(__str, 0x401uLL);
            if (!realpath_DARWIN_EXTSN(v7, __str)
              || qword_100014068 && !strncasecmp(__str, (const char *)qword_100014068, qword_100014070))
            {
              goto LABEL_18;
            }
            if (v14)
            {
              audit_token_t atoken = v45;
              uid_t v36 = audit_token_to_euid(&atoken);
              audit_token_t atoken = v45;
              gid_t v37 = audit_token_to_egid(&atoken);
              uint64_t v38 = (char *)v7;
              int v39 = 0;
            }
            else
            {
              if (!v13)
              {
                snprintf(__str, 0x400uLL, "%s/.", v7);
                audit_token_t atoken = v45;
                uid_t v41 = audit_token_to_euid(&atoken);
                audit_token_t atoken = v45;
                gid_t v37 = audit_token_to_egid(&atoken);
                uint64_t v38 = __str;
                int v39 = 0;
                uid_t v40 = v41;
                goto LABEL_72;
              }
              audit_token_t atoken = v45;
              uid_t v36 = audit_token_to_euid(&atoken);
              audit_token_t atoken = v45;
              gid_t v37 = audit_token_to_egid(&atoken);
              uint64_t v38 = (char *)v7;
              int v39 = 1;
            }
            uid_t v40 = v36;
LABEL_72:
            if (sub_10000B450(v38, v39, v40, v37) != 2) {
              goto LABEL_18;
            }
            *(_DWORD *)(a1 + 64) = 0;
            goto LABEL_10;
        }
        int v16 = 4;
      }
      else
      {
        int v16 = 3;
      }
      *(_DWORD *)(a1 + 64) = v16;
    }
  }
LABEL_18:
  if (a3)
  {
    if ((a2 & 0x61) != 0)
    {
      *(_DWORD *)(a1 + 64) = 0;
      int v17 = a2 & 0x60 | 1;
    }
    else
    {
      int v17 = 0;
    }
    if (*a3 && *(void *)a1 && !strcmp(*a3, *(const char **)a1)) {
      v17 |= a2;
    }
    int v18 = *(_DWORD *)(a1 + 68);
    int v19 = v17 | (*(_DWORD *)(a1 + 64) == 0);
    int v20 = v17 | 0x80;
    if (!*(_DWORD *)(a1 + 64)) {
      int v20 = 0;
    }
    if (!v9) {
      int v19 = v20;
    }
    uintptr_t v21 = v18 & v19 & 0x3FFLL;
    if (v21)
    {
      unint64_t v22 = *(NSObject **)(a1 + 72);
      if ((v18 & 0x10000000) == 0)
      {
        *(_DWORD *)(a1 + 68) = v18 | 0x10000000;
        if (v22) {
          dispatch_suspend(v22);
        }
        dispatch_time_t v23 = dispatch_time(0, 100000000);
        ++*(_DWORD *)(a1 + 104);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10000B5A8;
        block[3] = &unk_1000108E8;
        block[4] = a1;
        dispatch_after(v23, (dispatch_queue_t)qword_100014298, block);
        unint64_t v22 = *(NSObject **)(a1 + 72);
      }
      if (v22) {
        dispatch_source_merge_data(v22, v21);
      }
    }
  }
  size_t v24 = *(void *)(a1 + 8);
  if (v24 <= 0x400)
  {
    unint64_t v25 = (stat *)malloc_type_malloc(v24, 0xB174E72CuLL);
    if (!v25) {
      __assert_rtn("_path_node_update", "pathwatch.c", 874, "buf != NULL");
    }
  }
  else
  {
    unint64_t v25 = &v46;
  }
  sub_10000A738(a1);
  sub_10000B5F4(0, 0, a1);
  bzero(v25, *(void *)(a1 + 8));
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    while (1)
    {
      size_t v28 = strlen((const char *)v25);
      size_t v29 = *(void *)(a1 + 8);
      if (v28 + 1 > v29) {
        __assert_rtn("_path_node_update", "pathwatch.c", 885, "(strlen(buf) + 1) <= pnode->plen");
      }
      strlcat((char *)v25, "/", v29);
      uint64_t v30 = *(void *)(a1 + 56);
      if (__CFADD__(v30, v26)) {
        goto LABEL_75;
      }
      long long v31 = *(const char **)(v30 + 8 * v27);
      if (!v31) {
        __assert_rtn("_path_node_update", "pathwatch.c", 888, "pnode->pname[i] != NULL");
      }
      size_t v32 = strlen((const char *)v25);
      size_t v33 = strlen(v31);
      size_t v34 = *(void *)(a1 + 8);
      if (v33 + v32 > v34) {
        __assert_rtn("_path_node_update", "pathwatch.c", 889, "(strlen(buf) + strlen(pnode->pname[i])) <= pnode->plen");
      }
      strlcat((char *)v25, v31, v34);
      memset(&v43, 0, sizeof(v43));
      if (lstat((const char *)v25, &v43) < 0) {
        goto LABEL_52;
      }
      uint64_t v35 = (char *)v25;
      if ((v43.st_mode & 0xF000) != 0xA000) {
        goto LABEL_50;
      }
      sub_10000B5F4((const char *)v25, 1, a1);
      if (realpath_DARWIN_EXTSN((const char *)v25, __str)) {
        break;
      }
LABEL_51:
      ++v27;
      v26 += 8;
      if (v27 >= *(unsigned int *)(a1 + 48)) {
        goto LABEL_52;
      }
    }
    uint64_t v35 = __str;
LABEL_50:
    sub_10000B5F4(v35, 0, a1);
    goto LABEL_51;
  }
LABEL_52:
  sub_10000A7B4();
  if (v25 != &v46) {
    free(v25);
  }
}

uint64_t sub_10000B450(const char *a1, int a2, uid_t a3, gid_t a4)
{
  memset(&v16, 0, sizeof(v16));
  int v8 = gL1CacheEnabled;
  gL1CacheEnabled = 0;
  *(_OWORD *)int v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = getgroups(16, v17);
  if ((v9 & 0x80000000) != 0) {
    return 1;
  }
  uint64_t v10 = v9;
  long long v11 = getpwuid(a3);
  if (!v11)
  {
    gL1CacheEnabled = v8;
    return 1;
  }
  int v12 = initgroups(v11->pw_name, a4);
  gL1CacheEnabled = v8;
  if (v12 < 0) {
    return 1;
  }
  pthread_setugid_np(a3, a4);
  int v13 = a2 ? lstat(a1, &v16) : stat(a1, &v16);
  int v14 = v13;
  pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if (syscall(243, v10, v17, 0) < 0) {
    return 1;
  }
  if (!v14) {
    return 0;
  }
  if (*__error() == 13) {
    return 2;
  }
  return 1;
}

void sub_10000B5A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 68) &= ~0x10000000u;
  dispatch_resume(*(dispatch_object_t *)(v2 + 72));
  uint64_t v3 = *(void *)(a1 + 32);

  sub_10000A658(v3);
}

void sub_10000B5F4(const char *a1, int a2, uint64_t a3)
{
  memset(&v25, 0, sizeof(v25));
  if (a1) {
    uint64_t v5 = a1;
  }
  else {
    uint64_t v5 = "/";
  }
  if (*v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = "/";
  }
  if (dword_100014058)
  {
    unint64_t v7 = 0;
    uint64_t v8 = qword_100014060;
    unint64_t v9 = ~qword_100014060;
    uint64_t v10 = 8 * dword_100014058;
    while (v7 <= v9)
    {
      uint64_t v11 = *(void *)(v8 + v7);
      if (v11 && *(_DWORD *)(v11 + 8) == a2 && !strcmp(v6, *(const char **)v11))
      {
        sub_10000B99C(v11, a3);
        return;
      }
      v7 += 8;
      if (v10 == v7) {
        goto LABEL_14;
      }
    }
    goto LABEL_37;
  }
LABEL_14:
  unsigned int v12 = open_NOCANCEL();
  if ((v12 & 0x80000000) == 0)
  {
    int v13 = v12;
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v12, 0x7FuLL, (dispatch_queue_t)qword_100014298);
    if (v14)
    {
      int v15 = v14;
      stat v16 = malloc_type_calloc(1uLL, 0x48uLL, 0x10B004012F3CC1DuLL);
      if (!v16) {
        __assert_rtn("_vnode_create", "pathwatch.c", 430, "vnode != NULL");
      }
      uint64_t v17 = (uint64_t)v16;
      v16[2] = a2;
      long long v18 = strdup(v6);
      *(void *)uint64_t v17 = v18;
      if (!v18) {
        __assert_rtn("_vnode_create", "pathwatch.c", 434, "vnode->path != NULL");
      }
      *(_DWORD *)(v17 + 12) = v13;
      *(void *)(v17 + 48) = v15;
      memset(&v25, 0, sizeof(v25));
      if (!fstat(v13, &v25))
      {
        *(timespec *)(v17 + 16) = v25.st_mtimespec;
        *(timespec *)(v17 + 32) = v25.st_ctimespec;
      }
      sub_10000B99C(v17, a3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_10000BAB4;
      handler[3] = &unk_100010908;
      handler[4] = v17;
      dispatch_source_set_event_handler(v15, handler);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 0x40000000;
      v22[2] = sub_10000BBEC;
      v22[3] = &unk_100010928;
      int v23 = v13;
      dispatch_source_set_cancel_handler(v15, v22);
      if (dword_100014058)
      {
        size_t v19 = 8 * (dword_100014058 + 1);
        long long v20 = reallocf((void *)qword_100014060, v19);
      }
      else
      {
        size_t v19 = 8;
        long long v20 = malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
      }
      qword_100014060 = (uint64_t)v20;
      if (!v20) {
        __assert_rtn("_vnode_create", "pathwatch.c", 460, "_global.vnode != NULL");
      }
      uint64_t v21 = dword_100014058++;
      if (__CFADD__(v20, 8 * v21))
      {
LABEL_37:
        __break(0x5513u);
        goto LABEL_38;
      }
      if (v19 <= 8 * v21)
      {
LABEL_38:
        __break(1u);
        return;
      }
      v20[v21] = v17;
      dispatch_resume(v15);
    }
    else
    {
      close_NOCANCEL();
    }
  }
}

unint64_t sub_10000B99C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  if (v4)
  {
    unint64_t v5 = 0;
    unint64_t result = *(void *)(a1 + 64);
    unint64_t v7 = ~result;
    while (v5 <= v7)
    {
      if (*(void *)(result + v5) == a2) {
        return result;
      }
      v5 += 8;
      if (8 * v4 == v5)
      {
        uint64_t v8 = 0;
        while (v7 >= 8 * v8)
        {
          if (!*(void *)(result + 8 * v8))
          {
            uint64_t v11 = (void *)(result + 8 * v8);
            goto LABEL_17;
          }
          if (++v8 == v4)
          {
            size_t v9 = 8 * (v4 + 1);
            unint64_t result = (unint64_t)reallocf((void *)result, v9);
            goto LABEL_12;
          }
        }
        goto LABEL_20;
      }
    }
    goto LABEL_20;
  }
  size_t v9 = 8;
  unint64_t result = (unint64_t)malloc_type_calloc(1uLL, 8uLL, 0x2004093837F09uLL);
LABEL_12:
  *(void *)(a1 + 64) = result;
  if (!result) {
    __assert_rtn("_vnode_add_pnode", "pathwatch.c", 319, "vnode->path_node != NULL");
  }
  uint64_t v10 = *(unsigned int *)(a1 + 56);
  *(_DWORD *)(a1 + 56) = v10 + 1;
  if (__CFADD__(result, 8 * v10))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (v9 <= 8 * v10)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v11 = (void *)(result + 8 * v10);
LABEL_17:
  *uint64_t v11 = a2;
  return result;
}

uint64_t sub_10000BAB4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    memset(&v6, 0, sizeof(v6));
    uintptr_t data = *(void *)(v1 + 48);
    if (data)
    {
      unint64_t result = dispatch_source_testcancel(*(dispatch_source_t *)(v1 + 48));
      if (result) {
        return result;
      }
      uintptr_t data = dispatch_source_get_data((dispatch_source_t)data);
    }
    unint64_t result = fstat(*(_DWORD *)(v1 + 12), &v6);
    if (!result)
    {
      if (*(_OWORD *)(v1 + 16) != *(_OWORD *)&v6.st_mtimespec)
      {
        uintptr_t data = data | 0x100;
        *(timespec *)(v1 + 16) = v6.st_mtimespec;
      }
      if (*(_OWORD *)(v1 + 32) != *(_OWORD *)&v6.st_ctimespec)
      {
        uintptr_t data = data | 0x200;
        *(timespec *)(v1 + 32) = v6.st_ctimespec;
      }
    }
    if (data) {
      *(_DWORD *)(v1 + 8) = 2;
    }
    if (*(_DWORD *)(v1 + 56))
    {
      uint64_t v3 = 0;
      unint64_t v4 = 0;
      while (1)
      {
        uint64_t v5 = *(void *)(v1 + 64);
        if (__CFADD__(v5, v3)) {
          break;
        }
        unint64_t result = sub_10000AE78(*(void *)(v5 + 8 * v4++), data, v1);
        v3 += 8;
        if (v4 >= *(unsigned int *)(v1 + 56)) {
          return result;
        }
      }
      __break(0x5513u);
    }
  }
  return result;
}

uint64_t sub_10000BBEC()
{
  return close_NOCANCEL();
}

void sub_10000BBF4(id a1)
{
  qword_100014068 = 0;
  qword_100014070 = 0;
  if (realpath_DARWIN_EXTSN("/var/db/timezone/zoneinfo", __s))
  {
    qword_100014070 = strlen(__s);
    qword_100014068 = (uint64_t)strdup(__s);
    if (!qword_100014068) {
      qword_100014070 = 0;
    }
  }
}

uint64_t sub_10000BC88(uint64_t a1)
{
  return sub_100002CE4(*(void *)(*(void *)(a1 + 32) + 80), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
}

unint64_t sub_10000BC9C(uint64_t a1, uint64_t a2, char *a3, _OWORD *a4, int a5)
{
  ++qword_100014168;
  if (!a3) {
    return 6;
  }
  unint64_t result = os_set_str_ptr_find();
  uint64_t v10 = 1;
  if (!result || qword_1000141A8 == result) {
    return v10;
  }
  if (!a2) {
    return 10;
  }
  if (*(_WORD *)(a2 + 76))
  {
    uint64_t v11 = *(unsigned __int16 *)(a2 + 76) - 1;
    if (!__CFADD__(qword_100014290, 8 * v11))
    {
      uint64_t v12 = *(void *)(qword_100014290 + 8 * v11);
      uint64_t v10 = 6;
      if (*(_DWORD *)v12 == 2)
      {
        if (!strcmp(a3, **(const char ***)(v12 + 8))) {
          return 0;
        }
        else {
          return 6;
        }
      }
      return v10;
    }
    goto LABEL_40;
  }
  if (a5) {
    __int16 v13 = a5;
  }
  else {
    __int16 v13 = 1023;
  }
  long long v14 = a4[1];
  v28[0] = *a4;
  v28[1] = v14;
  size_t v15 = sub_10000AB30(a3, v28, 0, v13);
  if (!v15) {
    return 53;
  }
  size_t v16 = v15;
  *(void *)(v15 + 96) = *(void *)(a2 + 64);
  uint64_t v17 = malloc_type_calloc(1uLL, 0x10uLL, 0x10800407411B482uLL);
  if (!v17) {
    __assert_rtn("service_open_path_private", "service.c", 195, "info != NULL");
  }
  long long v18 = v17;
  *(_DWORD *)uint64_t v17 = 2;
  v17[1] = v16;
  if (word_100014304)
  {
    if ((unsigned __int16)word_100014304 == 0xFFFF) {
      __assert_rtn("service_info_add", "service.c", 104, "global.service_info_count != UINT16_MAX");
    }
    unint64_t v19 = 0;
    uint64_t v20 = 0;
    unint64_t result = qword_100014290;
    while (v19 <= ~qword_100014290)
    {
      if (!*(void *)(qword_100014290 + 8 * v20))
      {
        *(void *)(qword_100014290 + 8 * v20) = v18;
        __int16 v22 = v20 + 1;
        goto LABEL_36;
      }
      ++v20;
      v19 += 8;
      if ((unsigned __int16)word_100014304 == v20)
      {
        size_t v21 = 8 * (unsigned __int16)++word_100014304;
        unint64_t result = (unint64_t)malloc_type_realloc((void *)qword_100014290, v21, 0x80040B8603338uLL);
        goto LABEL_27;
      }
    }
    goto LABEL_40;
  }
  word_100014304 = 1;
  size_t v21 = 8;
  unint64_t result = (unint64_t)malloc_type_malloc(8uLL, 0x80040B8603338uLL);
LABEL_27:
  qword_100014290 = result;
  __int16 v22 = word_100014304;
  uint64_t v23 = (unsigned __int16)word_100014304 - 1;
  BOOL v24 = __CFADD__(result, 8 * v23);
  BOOL v25 = result + 8 * v23 >= result;
  if (!word_100014304) {
    BOOL v25 = v24;
  }
  if (!v25)
  {
LABEL_40:
    __break(0x5513u);
    goto LABEL_41;
  }
  if (v21 > 8 * v23)
  {
    *(void *)(result + 8 * v23) = v18;
LABEL_36:
    *(_WORD *)(a2 + 76) = v22;
    uint64_t v26 = *(NSObject **)(v16 + 72);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_10000BF84;
    handler[3] = &unk_100010968;
    handler[4] = v16;
    dispatch_source_set_event_handler(v26, handler);
    dispatch_activate(*(dispatch_object_t *)(v16 + 72));
    return 0;
  }
LABEL_41:
  __break(1u);
  return result;
}

void sub_10000BF84()
{
  uint64_t v0 = os_set_64_ptr_find();
  if (v0)
  {
    uint64_t v1 = v0 - qword_1000141E8;
    if (v1)
    {
      if ((*(unsigned char *)(v1 + 79) & 0xF) == 1)
      {
        uint64_t v2 = *(void *)(v1 + 48);
        if (v2)
        {
          uint64_t v3 = *(unsigned int *)(v2 + 52);
          if (v3 != -1)
          {
            if (__CFADD__(qword_1000142E0, 4 * v3))
            {
              __break(0x5513u);
              return;
            }
            ++*(_DWORD *)(qword_1000142E0 + 4 * v3);
          }
        }
      }
      sub_100004C70(v1, 0, 0);
    }
  }
}

unint64_t sub_10000C024(char *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t result = strncmp(a1, "com.apple.system.notify.service.", 0x20uLL);
  if (!result)
  {
    if ((unint64_t)a1 < 0xFFFFFFFFFFFFFFE0)
    {
      unint64_t result = strncmp(a1 + 32, "path:", 5uLL);
      if (result) {
        return result;
      }
      unint64_t result = (unint64_t)strchr(a1, 58);
      if (result)
      {
        if (result == -1) {
          goto LABEL_14;
        }
        unint64_t v7 = (char *)(result + 1);
      }
      else
      {
        unint64_t v7 = 0;
      }
      uint64_t v8 = strchr(v7, 58);
      if (!v8)
      {
        int v10 = 0;
        goto LABEL_12;
      }
      size_t v9 = v8;
      unint64_t result = strtol(v7, 0, 0);
      if (v9 != (char *)-1)
      {
        int v10 = result;
        unint64_t v7 = v9 + 1;
LABEL_12:
        long long v11 = a3[1];
        v12[0] = *a3;
        v12[1] = v11;
        return sub_10000BC9C((uint64_t)a1, a2, v7, v12, v10);
      }
    }
LABEL_14:
    __break(0x5513u);
  }
  return result;
}

_DWORD *sub_10000C118(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  mach_port_name_t v3 = result[8];
  uint64_t v4 = os_set_32_ptr_find();
  if (v4) {
    long long v11 = (unsigned int *)(v4 - qword_100014208);
  }
  else {
    long long v11 = 0;
  }
  uint64_t v12 = *(void *)v11;
  if (*(void *)v11)
  {
    do
    {
      uint64_t v13 = *(void *)(v12 + 32);
      sub_100002ED4(v12);
      uint64_t v12 = v13;
    }
    while (v13);
  }
  unsigned int v14 = v11[3];
  if ((v14 & 2) == 0) {
    goto LABEL_13;
  }
  if ((v14 & 4) != 0)
  {
    sub_1000046F0((FILE *)7, "do_mach_notify_dead_name freed port %x\n", v5, v6, v7, v8, v9, v10, v3);
LABEL_13:
    sub_1000057F4(v11);
    goto LABEL_14;
  }
  v11[3] = v14 | 4;
LABEL_14:
  unint64_t result = (_DWORD *)mach_port_deallocate(mach_task_self_, v3);
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

_DWORD *sub_10000C204(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 24) {
    sub_100008CD4();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000C248(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36) {
    sub_100008CB4();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000C28C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 0x100000) {
      sub_100008C94();
    }
    int v2 = -300;
  }
  else
  {
    int v2 = -304;
  }
  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000C2F4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36) {
    sub_100008C74();
  }
  *(_DWORD *)(a2 + 32) = -304;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000C338(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 20);
  BOOL v2 = __OFSUB__(v1, 64);
  unsigned int v3 = v1 - 64;
  if (v2)
  {
    __break(0x5515u);
  }
  else
  {
    if (v3 > 8) {
      return 0;
    }
    if (40 * (unint64_t)v3 <= ~(unint64_t)&unk_1000109A8) {
      return (uint64_t)*(&off_100010988 + 5 * v3 + 5);
    }
  }
  __break(0x5513u);
  return result;
}

FILE *sub_10000C394(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 48)
  {
    int v3 = -304;
  }
  else
  {
    if (!LODWORD(result->_cookie) && HIDWORD(result->_cookie) > 0x1F)
    {
      uint64_t size = result->_bf._size;
      uint64_t v5 = *(void *)(&result->_bf._size + 1);
      int v6 = *(&result->_lbfsize + 1);
      long long v7 = *(_OWORD *)((char *)&result->_write + 4);
      v8[0] = *(_OWORD *)((char *)&result->_read + 4);
      v8[1] = v7;
      unint64_t result = sub_10000523C(size, v5, (void *)(a2 + 36), (int *)(a2 + 44), v6, v8, 1);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

FILE *sub_10000C458(FILE *result, uint64_t a2)
{
  if (((uint64_t)result->_p & 0x80000000) != 0 || HIDWORD(result->_p) != 52)
  {
    int v3 = -304;
  }
  else
  {
    if (!HIDWORD(result->_cookie) && LODWORD(result->_close) > 0x1F)
    {
      uint64_t v5 = *(void *)&result->_bf._size;
      uint64_t v4 = *(void *)&result->_lbfsize;
      int cookie = (int)result->_cookie;
      __sbuf ub = result->_ub;
      v8[0] = *(_OWORD *)&result->_seek;
      v8[1] = ub;
      unint64_t result = sub_100003330(v5, v4, cookie, v8, 1);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000C4F8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 4);
  if (v6 < 0x70 || v6 > 0x270) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112 || *(unsigned char *)(a1 + 51) != 1) {
    goto LABEL_23;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 68);
  if (v7 > 0x200)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v6 - 112 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v6 != v8 + 112) {
    goto LABEL_3;
  }
  uint64_t v9 = a1 + v8;
  int v10 = *(_DWORD *)(a1 + 52);
  if (v10 != *(_DWORD *)(v9 + 104))
  {
LABEL_23:
    int v3 = -300;
    goto LABEL_3;
  }
  if (__CFADD__(a1, v6))
  {
    __break(0x5513u);
    return;
  }
  if (v6 >= 0x248) {
    size_t v11 = 512;
  }
  else {
    size_t v11 = v6 - 72;
  }
  if (!memchr((void *)(a1 + 72), 0, v11)) {
    goto LABEL_2;
  }
  uint64_t v12 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v12 && *(_DWORD *)(v12 + 4) > 0x1Fu)
  {
    unint64_t v13 = *(unsigned int *)(v9 + 72);
    int v14 = *(_DWORD *)(v9 + 76);
    int v15 = *(_DWORD *)(a1 + 28);
    int v16 = *(_DWORD *)(v9 + 80);
    int v17 = *(_DWORD *)(v9 + 84);
    uint64_t v18 = *(void *)(v9 + 88);
    unint64_t v19 = *(char **)(a1 + 40);
    unint64_t v20 = *(void *)(v9 + 96);
    int v21 = *(_DWORD *)(v9 + 108);
    long long v22 = *(_OWORD *)(v12 + 36);
    v23[0] = *(_OWORD *)(v12 + 20);
    v23[1] = v22;
    sub_1000068BC((char *)(a1 + 72), v13, v14, v15, v16, v17, v18, v20, v19, v10, v21, (int *)(a2 + 36), (void *)(a2 + 40), (int *)(a2 + 48), v23);
    *(_DWORD *)(a2 + 32) = 0;
    mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
    *(void *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    NDR_record_t v4 = NDR_record;
    if (!*(_DWORD *)(a2 + 32))
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 52;
      return;
    }
    goto LABEL_4;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  NDR_record_t v4 = NDR_record;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
}

void sub_10000C6D0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0) {
    goto LABEL_18;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 4);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 36);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(a1, v4))
  {
    __break(0x5513u);
    return;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  if (memchr((void *)(a1 + 40), 0, v8))
  {
    uint64_t v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + a1;
    if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
    {
      int v11 = *(_DWORD *)(a1 + v6 + 40);
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      sub_100006820((const char *)(a1 + 40), v11, v13);
      *(_DWORD *)(a2 + 32) = 0;
      return;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_10000C7EC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v4 = -304;
  }
  else
  {
    int v3 = *(_DWORD *)(result + 24);
    result += 24;
    if (!v3 && *(_DWORD *)(result + 4) > 0x1Fu)
    {
      long long v5 = *(_OWORD *)(result + 36);
      v6[0] = *(_OWORD *)(result + 20);
      v6[1] = v5;
      unint64_t result = sub_100002344((_DWORD *)(a2 + 36), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 44), v6);
      *(_DWORD *)(a2 + 32) = 0;
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 48;
      return result;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

char *sub_10000C8A0(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C) {
    goto LABEL_18;
  }
  if (v4 > 0x22C) {
    goto LABEL_18;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || v4 != v6 + 44) {
    goto LABEL_18;
  }
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  unint64_t result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      *(void *)(a2 + 32) = 0x10000000000000;
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      long long v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      unint64_t result = (char *)sub_1000066FC(v3 + 40, v11, (_DWORD *)(a2 + 48), (mach_port_name_t *)(a2 + 28), v13);
      *(NDR_record_t *)(a2 + 40) = NDR_record;
      *(_DWORD *)a2 |= 0x80000000;
      *(_DWORD *)(a2 + 4) = 52;
      *(_DWORD *)(a2 + 24) = 1;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000C9F4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      uint64_t v3 = result + 40;
      if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) < 0x20u)
      {
        int v4 = -309;
      }
      else
      {
        mach_port_name_t v5 = *(_DWORD *)(result + 28);
        long long v6 = *(_OWORD *)(v3 + 36);
        v7[0] = *(_OWORD *)(v3 + 20);
        v7[1] = v6;
        unint64_t result = sub_100006604(v5, v7);
        int v4 = 0;
      }
    }
    else
    {
      int v4 = -300;
    }
  }
  else
  {
    int v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_10000CAAC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 4);
  if (v6 < 0x70 || v6 > 0x270) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(a1 + 38) << 16 != 1114112 || *(unsigned char *)(a1 + 51) != 1) {
    goto LABEL_23;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 68);
  if (v7 > 0x200)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v6 - 112 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v6 != v8 + 112) {
    goto LABEL_3;
  }
  uint64_t v9 = a1 + v8;
  int v10 = *(_DWORD *)(a1 + 52);
  if (v10 != *(_DWORD *)(v9 + 104))
  {
LABEL_23:
    int v3 = -300;
    goto LABEL_3;
  }
  if (__CFADD__(a1, v6))
  {
    __break(0x5513u);
    return;
  }
  if (v6 >= 0x248) {
    size_t v11 = 512;
  }
  else {
    size_t v11 = v6 - 72;
  }
  if (!memchr((void *)(a1 + 72), 0, v11)) {
    goto LABEL_2;
  }
  uint64_t v12 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v12 && *(_DWORD *)(v12 + 4) > 0x1Fu)
  {
    unint64_t v13 = *(unsigned int *)(v9 + 72);
    int v14 = *(_DWORD *)(v9 + 76);
    int v15 = *(_DWORD *)(a1 + 28);
    int v16 = *(_DWORD *)(v9 + 80);
    int v17 = *(_DWORD *)(v9 + 84);
    uint64_t v18 = *(void *)(v9 + 88);
    unint64_t v19 = *(char **)(a1 + 40);
    unint64_t v20 = *(void *)(v9 + 96);
    int v21 = *(_DWORD *)(v9 + 108);
    long long v22 = *(_OWORD *)(v12 + 36);
    v23[0] = *(_OWORD *)(v12 + 20);
    v23[1] = v22;
    sub_100006288((char *)(a1 + 72), v13, v14, v15, v16, v17, v18, v20, v19, v10, v21, (int *)(a2 + 36), (void *)(a2 + 40), (int *)(a2 + 48), v23);
    *(_DWORD *)(a2 + 32) = 0;
    mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
    *(void *)(a1 + 40) = 0;
    *(_DWORD *)(a1 + 52) = 0;
    NDR_record_t v4 = NDR_record;
    if (!*(_DWORD *)(a2 + 32))
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 52;
      return;
    }
    goto LABEL_4;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  NDR_record_t v4 = NDR_record;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
}

void sub_10000CC84(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 64)
  {
    if (*(unsigned char *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 56)))
    {
      if (!*(_DWORD *)(a1 + 64) && *(_DWORD *)(a1 + 68) > 0x1Fu)
      {
        uint64_t v6 = *(char **)(a1 + 28);
        unint64_t v7 = *(unsigned int *)(a1 + 52);
        int v8 = *(_DWORD *)(a1 + 60);
        long long v9 = *(_OWORD *)(a1 + 100);
        v10[0] = *(_OWORD *)(a1 + 84);
        v10[1] = v9;
        sub_100006154(v7, v6, v4, v8, v10);
        *(_DWORD *)(a2 + 32) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 28) = 0;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }
      int v5 = -309;
    }
    else
    {
      int v5 = -300;
    }
  }
  else
  {
    int v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_10000CD68(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    uint64_t v4 = result;
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    uint64_t v5 = *(unsigned int *)(result + 4);
    if (v5 < 0x3C || v5 > 0x23C) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }
    unsigned int v6 = *(_DWORD *)(result + 52);
    if (v6 <= 0x200)
    {
      int v3 = -304;
      if ((int)v5 - 60 < v6) {
        goto LABEL_3;
      }
      unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
      if (v5 != v7 + 60) {
        goto LABEL_3;
      }
      if (__CFADD__(result, v5))
      {
        __break(0x5513u);
        return result;
      }
      if (v5 >= 0x238) {
        size_t v8 = 512;
      }
      else {
        size_t v8 = v5 - 56;
      }
      unint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v8);
      if (result)
      {
        uint64_t v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
        if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
        {
          unsigned int v10 = *(_DWORD *)(v4 + v7 + 56);
          mach_port_name_t v11 = *(_DWORD *)(v4 + 28);
          long long v12 = *(_OWORD *)(v9 + 36);
          v13[0] = *(_OWORD *)(v9 + 20);
          v13[1] = v12;
          unint64_t result = sub_100005E20((char *)(v4 + 56), v10, v11, v13);
          *(_DWORD *)(a2 + 32) = 0;
          return result;
        }
        int v3 = -309;
        goto LABEL_3;
      }
    }
  }
  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000CEB8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0)
  {
    uint64_t v4 = result;
    int v3 = -304;
    if (*(_DWORD *)(result + 24) != 1) {
      goto LABEL_3;
    }
    uint64_t v5 = *(unsigned int *)(result + 4);
    if (v5 < 0x3C || v5 > 0x23C) {
      goto LABEL_3;
    }
    if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
    {
      int v3 = -300;
      goto LABEL_3;
    }
    unsigned int v6 = *(_DWORD *)(result + 52);
    if (v6 <= 0x200)
    {
      int v3 = -304;
      if ((int)v5 - 60 < v6) {
        goto LABEL_3;
      }
      unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
      if (v5 != v7 + 60) {
        goto LABEL_3;
      }
      if (__CFADD__(result, v5))
      {
        __break(0x5513u);
        return result;
      }
      if (v5 >= 0x238) {
        size_t v8 = 512;
      }
      else {
        size_t v8 = v5 - 56;
      }
      unint64_t result = (uint64_t)memchr((void *)(result + 56), 0, v8);
      if (result)
      {
        uint64_t v9 = ((v5 + 3) & 0x1FFFFFFFCLL) + v4;
        if (!*(_DWORD *)v9 && *(_DWORD *)(v9 + 4) > 0x1Fu)
        {
          unsigned int v10 = *(_DWORD *)(v4 + v7 + 56);
          mach_port_name_t v11 = *(_DWORD *)(v4 + 28);
          long long v12 = *(_OWORD *)(v9 + 36);
          v13[0] = *(_OWORD *)(v9 + 20);
          v13[1] = v12;
          unint64_t result = sub_100005C84((char *)(v4 + 56), v10, v11, v13);
          *(_DWORD *)(a2 + 32) = 0;
          return result;
        }
        int v3 = -309;
        goto LABEL_3;
      }
    }
  }
  int v3 = -304;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

char *sub_10000D008(char *result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0) {
    goto LABEL_18;
  }
  int v3 = result;
  uint64_t v4 = *((unsigned int *)result + 1);
  if (v4 < 0x30) {
    goto LABEL_18;
  }
  if (v4 > 0x230) {
    goto LABEL_18;
  }
  unsigned int v5 = *((_DWORD *)result + 9);
  if (v5 > 0x200) {
    goto LABEL_18;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || v4 != v6 + 48) {
    goto LABEL_18;
  }
  if (__CFADD__(result, v4))
  {
    __break(0x5513u);
    return result;
  }
  size_t v8 = v4 >= 0x228 ? 512 : v4 - 40;
  unint64_t result = (char *)memchr(result + 40, 0, v8);
  if (result)
  {
    uint64_t v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      unsigned int v11 = *(_DWORD *)&v3[v6 + 40];
      int v12 = *(_DWORD *)&v3[v6 + 44];
      long long v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      unint64_t result = (char *)sub_100005B20(v3 + 40, v11, v12, v14);
      *(_DWORD *)(a2 + 32) = 0;
      return result;
    }
    int v10 = -309;
  }
  else
  {
LABEL_18:
    int v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000D128(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  int v4 = *(_DWORD *)(result + 32);
  long long v5 = *(_OWORD *)(result + 72);
  *(_OWORD *)v20.val = *(_OWORD *)(result + 56);
  *(_OWORD *)&v20.val[4] = v5;
  *(_OWORD *)atoken.val = *(_OWORD *)v20.val;
  *(_OWORD *)&atoken.val[4] = v5;
  uid_t v6 = audit_token_to_euid(&atoken);
  *(void *)&xmmword_1000140F8 = xmmword_1000140F8 + 1;
  sub_1000046F0((FILE *)7, "__notify_server_suspend_pid %d\n", v7, v8, v9, v10, v11, v12, v4);
  if (v6)
  {
    audit_token_t atoken = v20;
    audit_token_to_pid(&atoken);
    unint64_t result = (uint64_t)sub_1000046F0((FILE *)4, "__notify_server_suspend_pid %d permission denied for caller %d \n", v13, v14, v15, v16, v17, v18, v4);
  }
  else
  {
    unint64_t result = os_set_32_ptr_find();
    if (result)
    {
      if (qword_100014228 != result) {
        *(_DWORD *)(result - qword_100014228 + 20) |= 1u;
      }
    }
  }
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

void sub_10000D27C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  long long v4 = *(_OWORD *)(a1 + 72);
  v13[0] = *(_OWORD *)(a1 + 56);
  v13[1] = v4;
  int v14 = -1;
  sub_1000047F0(v13, 0xFFFFFFFF, 0, 0, &v14, 0);
  ++qword_1000140F0;
  sub_1000046F0((FILE *)7, "__notify_server_resume %d %d\n", v5, v6, v7, v8, v9, v10, v14);
  uint64_t v11 = os_set_64_ptr_find();
  if (v11 && qword_1000141E8 != v11)
  {
    sub_10000295C(v11 - qword_1000141E8, 0, 0);
    int v12 = 0;
  }
  else
  {
    int v12 = 50;
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = v12;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
}

uint64_t sub_10000D3B0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  long long v4 = *(_OWORD *)(result + 72);
  v15[0] = *(_OWORD *)(result + 56);
  v15[1] = v4;
  int v16 = -1;
  sub_1000047F0(v15, 0xFFFFFFFF, 0, 0, &v16, 0);
  ++qword_1000140E8;
  sub_1000046F0((FILE *)7, "__notify_server_suspend %d %d\n", v5, v6, v7, v8, v9, v10, v16);
  unint64_t result = os_set_64_ptr_find();
  if (result && (uint64_t v11 = qword_1000141E8, qword_1000141E8 != result))
  {
    uint64_t v13 = result - qword_1000141E8;
    *(unsigned char *)(result - qword_1000141E8 + 79) |= 0x20u;
    int v14 = *(unsigned __int8 *)(result - v11 + 78);
    int v12 = 0;
    if (v14 != 255) {
      *(unsigned char *)(v13 + 78) = v14 + 1;
    }
  }
  else
  {
    int v12 = 50;
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = v12;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_10000D500(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  long long v4 = *(_OWORD *)(result + 72);
  v12[0] = *(_OWORD *)(result + 56);
  v12[1] = v4;
  gid_t v14 = -1;
  uid_t v15 = -1;
  int v13 = -1;
  *(void *)(a2 + 36) = 0;
  sub_1000047F0(v12, 0xFFFFFFFF, &v15, &v14, &v13, 0);
  xmmword_100014110 = (__int128)vaddq_s64((int64x2_t)xmmword_100014110, vdupq_n_s64(1uLL));
  sub_1000046F0((FILE *)7, "__notify_server_get_state %d %d\n", v5, v6, v7, v8, v9, v10, v13);
  unint64_t result = os_set_64_ptr_find();
  if (result && qword_1000141E8 != result)
  {
    *(void *)(a2 + 36) = 0;
    unint64_t result = os_set_64_ptr_find();
    if (!result || qword_1000141C8 == result)
    {
      *(_DWORD *)(a2 + 44) = 1;
      __assert_rtn("__notify_server_get_state", "notify_proc.c", 1182, "*status == NOTIFY_STATUS_OK || *status == NOTIFY_STATUS_NOT_AUTHORIZED");
    }
    int v11 = 0;
    *(void *)(a2 + 36) = *(void *)(result - qword_1000141C8 + 24);
  }
  else
  {
    int v11 = 50;
  }
  *(_DWORD *)(a2 + 44) = v11;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 48;
  return result;
}

uint64_t sub_10000D6A0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  long long v5 = *(_OWORD *)(result + 72);
  long long v17 = *(_OWORD *)(result + 56);
  long long v4 = v17;
  long long v18 = v5;
  pid_t pidp = -1;
  *(_DWORD *)(a2 + 36) = 0;
  ++qword_100014108;
  *(_OWORD *)atoken.val = v4;
  *(_OWORD *)&atoken.val[4] = v5;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  sub_1000046F0((FILE *)7, "__notify_server_check %d %d\n", v6, v7, v8, v9, v10, v11, pidp);
  unint64_t result = os_set_64_ptr_find();
  if (result && qword_1000141E8 != result)
  {
    int v13 = *(_DWORD *)(*(void *)(result - qword_1000141E8 + 48) + 60);
    if (v13 == *(_DWORD *)(result - qword_1000141E8 + 72))
    {
      int v14 = 0;
    }
    else
    {
      *(_DWORD *)(result - qword_1000141E8 + 72) = v13;
      int v14 = 1;
    }
    int v12 = 0;
    *(_DWORD *)(a2 + 36) = v14;
  }
  else
  {
    int v12 = 2;
  }
  *(_DWORD *)(a2 + 40) = v12;
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 44;
  return result;
}

void sub_10000D834(_DWORD *a1, int a2)
{
  int v2 = a1[5];
  BOOL v3 = __OFSUB__(v2, 1000);
  unsigned int v4 = v2 - 1000;
  if (v3)
  {
    __break(0x5515u);
LABEL_6:
    __break(0x5513u);
    _Block_object_dispose(a1, a2);
    return;
  }
  if (v4 <= 0x20 && 40 * (unint64_t)v4 > ~(unint64_t)&unk_100010B30) {
    goto LABEL_6;
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

uint64_t atoll(const char *a1)
{
  return _atoll(a1);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return _audit_token_to_egid(atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return _audit_token_to_euid(atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t close_NOCANCEL()
{
  return _close_NOCANCEL();
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

uint64_t dispatch_mach_msg_get_msg()
{
  return _dispatch_mach_msg_get_msg();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
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

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

uint64_t fcntl_NOCANCEL()
{
  return _fcntl_NOCANCEL();
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int fgetc(FILE *a1)
{
  return _fgetc(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

uint64_t fileport_makefd()
{
  return _fileport_makefd();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getgroups(int a1, gid_t a2[])
{
  return _getgroups(a1, a2);
}

int getpagesize(void)
{
  return _getpagesize();
}

pid_t getpid(void)
{
  return _getpid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int initgroups(const char *a1, int a2)
{
  return _initgroups(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return _mach_port_construct(task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return _mach_port_destruct(task, name, srdelta, guard);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return _mach_port_set_attributes(task, name, flavor, port_info, port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

uint64_t notify_set_options()
{
  return _notify_set_options();
}

uint64_t open_NOCANCEL()
{
  return _open_NOCANCEL();
}

uint64_t os_fault_with_payload()
{
  return _os_fault_with_payload();
}

uint64_t os_map_64_delete()
{
  return _os_map_64_delete();
}

uint64_t os_map_64_find()
{
  return _os_map_64_find();
}

uint64_t os_map_64_init()
{
  return _os_map_64_init();
}

uint64_t os_map_64_insert()
{
  return _os_map_64_insert();
}

uint64_t os_set_32_ptr_count()
{
  return _os_set_32_ptr_count();
}

uint64_t os_set_32_ptr_delete()
{
  return _os_set_32_ptr_delete();
}

uint64_t os_set_32_ptr_find()
{
  return _os_set_32_ptr_find();
}

uint64_t os_set_32_ptr_init()
{
  return _os_set_32_ptr_init();
}

uint64_t os_set_32_ptr_insert()
{
  return _os_set_32_ptr_insert();
}

uint64_t os_set_64_ptr_count()
{
  return _os_set_64_ptr_count();
}

uint64_t os_set_64_ptr_delete()
{
  return _os_set_64_ptr_delete();
}

uint64_t os_set_64_ptr_find()
{
  return _os_set_64_ptr_find();
}

uint64_t os_set_64_ptr_foreach()
{
  return _os_set_64_ptr_foreach();
}

uint64_t os_set_64_ptr_init()
{
  return _os_set_64_ptr_init();
}

uint64_t os_set_64_ptr_insert()
{
  return _os_set_64_ptr_insert();
}

uint64_t os_set_str_ptr_count()
{
  return _os_set_str_ptr_count();
}

uint64_t os_set_str_ptr_delete()
{
  return _os_set_str_ptr_delete();
}

uint64_t os_set_str_ptr_find()
{
  return _os_set_str_ptr_find();
}

uint64_t os_set_str_ptr_foreach()
{
  return _os_set_str_ptr_foreach();
}

uint64_t os_set_str_ptr_init()
{
  return _os_set_str_ptr_init();
}

uint64_t os_set_str_ptr_insert()
{
  return _os_set_str_ptr_insert();
}

uint64_t os_trace_set_mode()
{
  return _os_trace_set_mode();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return _pthread_setugid_np(a1, a2);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
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

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int syscall(int a1, ...)
{
  return _syscall(a1);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

uint64_t write_NOCANCEL()
{
  return _write_NOCANCEL();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
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

uint64_t xpc_event_publisher_fire_noboost()
{
  return _xpc_event_publisher_fire_noboost();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

uint64_t xpc_event_publisher_set_throttling()
{
  return _xpc_event_publisher_set_throttling();
}

uint64_t xpc_get_service_identifier_for_token()
{
  return _xpc_get_service_identifier_for_token();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}